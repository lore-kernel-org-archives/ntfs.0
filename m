Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BCD476CF5
	for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461188; cv=none; b=KOS1b/JuX8Cel9+zydRrsExMs3JZzqSbwhKzk5mWohvVSYv8PfH17AKKujmMw5nZp+EhOn3MZcqcN2q0gAz/IFsRIaKYwowvCzghUDspSR0GP7T6c1Jbasj58t9PxJ7dII18sapavriJS9ympOhYJFtLyRdzCwN/XrgNVQclrI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461188; c=relaxed/simple;
	bh=i7/7ap1qDbWwLmNiKmhnwLiuOjmEbfQukj8qbjMfwzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u5kmz9uArS3cwxR1i1HTEidrfm6/Rgl6h6nPaa2S/Ia0qqOFvxyKtW7n/9W1EfbshglO76BBWAvq/5iJ3tCQIO7TiJvkkATiccQzxoVZVlqGSdXi702NNwoA5paqtFKN7Rlr3Kr0N31k3/YcZhdoGcWDvkoIhEC2RVILtOX6wtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0e3d7c0eb0e011f19a56ed5b684f684d-20260915
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ed6baaae-3be3-479c-833c-994c6d4dbdff,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:8f5d9d8bb805b62a3d7119d99f07950e,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0e3d7c0eb0e011f19a56ed5b684f684d-20260915
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 997502701; Tue, 15 Sep 2026 16:32:58 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v13 0/7] ntfs: fix volume flag races and persist the recorded error state
Date: Tue, 15 Sep 2026 16:32:45 +0800
Message-Id: <20260915083252.812126-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

The fs/ntfs runtime metadata-corruption paths only record the in-memory
NVolErrors() flag, and the dirty-bit persistence used to race with
ntfs_sync_fs(): a volume could end up with a clean on-disk dirty flag
despite modification or recorded corruption, so chkdsk would not run on
the next mount.  This series fixes that.

   1/6 makes the volume flag read-modify-write atomic under the
      $Volume mrec_lock;
   2/6 marks the volume dirty unconditionally on metadata changes,
      dropping the racy caller-side checks in file.c and namei.c;
   3/6 derives the on-disk dirty bit from the recorded error state at
      the persistence points (sync_fs, remount-ro, put_super) and never
      writes a hibernated volume;
   4/6 persists the dirty state after the final put_super() commits so
      late errors cannot unmount clean;
   5/6 stops ntfs_sync_fs() from clearing VOLUME_IS_DIRTY: the clearing
      moves to the quiescent transitions, a recorded error state is
      still persisted at sync time, and sync now reports writeback and
      flush errors instead of discarding them;
   6/6 checks the dirty-state commit on remount and unmount.
   7/7 ntfs: fail remount on sync errors and keep the dirty bit on
      SB_FORCE

Changes in this revision, from the review:

  - 5/6: with the clearing gone from the sync path, a recorded error
    state is persisted without ever clearing the bit, and
    sync_blockdev() and blkdev_issue_flush() are both called with the
    first error returned.

  - The IOCB_NOWAIT behavior and the per-operation $Volume mrec_lock
    acquisition are outside the scope of this series.  The series keeps
    the unconditional ntfs_set_volume_flags() call to preserve the
    ordering that marks the volume dirty before the metadata
    modification; a RWF_NOWAIT write still blocks in the marking when
    the volume looks clean, as it already did on the base.  The
    non-blocking and contended-lock handling (mutex_trylock, GFP_NOWAIT)
    will be addressed in a separate follow-up patch.

Hongling Zeng (4):
  ntfs: fix volume flag update races
  ntfs: set the volume dirty bit unconditionally on metadata changes
  ntfs: sync the volume dirty bit with the recorded error state
  ntfs: persist the dirty state after the final put_super() commits

 fs/ntfs/file.c   |  20 ++---
 fs/ntfs/namei.c  |  24 ++----
 fs/ntfs/ntfs.h   |   1 -
 fs/ntfs/super.c  | 191 ++++++++++++++++++++++++++++++++++++-----------
 fs/ntfs/volume.h |   4 +
 5 files changed, 171 insertions(+), 69 deletions(-)

-- 
2.25.1

