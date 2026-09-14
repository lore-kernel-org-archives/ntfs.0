Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9E93F6610
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 08:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375075; cv=none; b=fsSCriN3wiuLI8BXzU/HQwGixkaiduK19HaeitV7lYFQ9qYQnOpcDxyK/t8iqyOLIVW+XIeKaKEFNrgcY4Qmd895/EdfoIEQo3slmSbu/ADHOkQK+xkUsGxlWLCLBGKDLCr9C3TrTKtzOAi+ifB862OX8Ahc2NSClozslXvykhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375075; c=relaxed/simple;
	bh=KNjA7PQve0B0fl47yF9t7FoPzwqzW5FmNGRGU7EkkH4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ai5xBgLbPEXIJ+QG3uakTqsXItdde6hWJKWh8J04tD8N3UNO7VYmCsccfd9CJu79WyfX1dLyn7NzkEKglF6yZY7+ob0QulnhA71M//6f8abxS5HRbanRrFxJ97vW2zRr2y9wkSkttzGBkDmfRocYP8F3vy3QP87mS3yes2+ZmLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8fb9cfaeb01711f19a56ed5b684f684d-20260914
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7e0e7534-873d-4d54-8319-c5519fe8c04d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:cd564c1b352896c757069cba0f8b4daf,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8fb9cfaeb01711f19a56ed5b684f684d-20260914
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 958684671; Mon, 14 Sep 2026 16:37:46 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v12 0/6] ntfs: fix volume flag races and persist the recorded error state
Date: Mon, 14 Sep 2026 16:37:35 +0800
Message-Id: <20260914083741.146689-1-zenghongling@kylinos.cn>
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

