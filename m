Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B7F3CA48C
	for <ntfs@lists.linux.dev>; Fri, 11 Sep 2026 02:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789092563; cv=none; b=I6+mKrV2JNQrPPx2m2njIBEbsDa5OEooiX5POQ+8qv85zsZ2vA8DQMLPZacf2F/1mKz0J1ZXgMngL6P1dX4RBdDDVzmHqE2tiaEYjYLJgLIGNTmo7kHXTT/Dyzw+TRQLqRq+rOz2i5eHQe3x+rOjpaTkCJxGhFJ8tSBfV91qye0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789092563; c=relaxed/simple;
	bh=07/0XkjiMLYBqNFq39cQWHkWzfxJScxnxapHSfedQEI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BqIifTHN0TYzh46XcQMILYrfzsTVhjW7ACCCHmQuwNwHUbWk8WJRdxZ8ZEuaUXAPp/REBcmyTDmDP6nCtkytz2EaHDdkWK1RdQJVUNqux3kIq93T9ubO3t2AXX2fvE3O9wnU5QcYbBaH/QX8tdYhd2yh+amFbdMdNx+dtU47Jag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c94d7d4aad8511f19a56ed5b684f684d-20260911
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:aeb47bce-a246-465c-b6fc-b71cf859554f,IP:0,U
	RL:0,TC:0,Content:18,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:18
X-CID-META: VersionHash:7db8b62,CLOUDID:66b230180ed9a7b55b658ec46d3161c7,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:4|15|50|99,EDM:
	-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c94d7d4aad8511f19a56ed5b684f684d-20260911
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 284306187; Fri, 11 Sep 2026 10:09:14 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v9 0/4] ntfs: fix volume flag races and persist the recorded error state
Date: Fri, 11 Sep 2026 10:09:04 +0800
Message-Id: <20260911020908.2376222-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fs/ntfs runtime metadata-corruption paths only record the in-memory
NVolErrors() flag, and the caller-side dirty-bit marking races with
ntfs_sync_fs(): a volume can end up with a clean on-disk dirty flag
despite modification or recorded corruption, so chkdsk never runs on
the next mount.  Based on ntfs/ntfs-next (9a05b5715cfa).

 1/4 makes the volume flag read-modify-write atomic under the
    $Volume mrec_lock;
 2/4 marks the volume dirty unconditionally on metadata changes,
    dropping the racy caller-side checks in file.c and namei.c;
 3/4 derives the on-disk dirty bit from the recorded error state at
    the persistence points (sync_fs, remount-ro, put_super) and never
    writes a hibernated volume;
 4/4 persists the dirty state after the final put_super() commits so
    late errors cannot unmount clean.

Changes since v8:
 - 2/4 also converts the setattr and fallocate callers, which were
   missed; the IOCB_NOWAIT non-blocking marking moves to a separate
   follow-up;
 - 3/4 removes the then-unreferenced ntfs_clear_volume_flags().

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

