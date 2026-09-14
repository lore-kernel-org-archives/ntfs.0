Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15702315D49
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 03:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355337; cv=none; b=KBYxCOjMB+ooeIa1DemqPBZD/QalmVS9xYIlbODj/JLB6m4DeGtObd2PNPVUec+ZEO/BMxn0ZtCV3M40YhO+6gL9xmPyrck5AhRAgN51YZvstdt4m5brniBzA2v7QbQzYS4aRpB82MrSjRh54xS2E7GEnBKgE3y1mHoctf1g8oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355337; c=relaxed/simple;
	bh=GSdROMc0RWh6ElxLT6OsS6EAtiG3k1XvmPpNBALz9tQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HKi2N5JFmHXI2I3CwA7M/ynlpF6tBnZ0tRBg/gxKpZo4eM+TojjTkZdFsrIwA+uBasOYojMgNCmqmhWF+rApFJWAWOi7CXlqh6C2TcJhgAffBdeaQ8oXOytGL0Si8tEmRX/rL/Cz0u6yNFS7n7MP5UmP+luMl3mAk6bYHmK0vh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 99572710afe911f19a56ed5b684f684d-20260914
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:698a031e-a310-43c7-94f3-9dd6d264f9ba,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:426e234aebab26d9e688817be8eeee6b,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 99572710afe911f19a56ed5b684f684d-20260914
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1229786511; Mon, 14 Sep 2026 11:08:46 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v10 0/6] ntfs: fix volume flag races and persist the recorded error state
Date: Mon, 14 Sep 2026 11:08:35 +0800
Message-Id: <20260914030841.46389-1-zenghongling@kylinos.cn>
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

Changes in v10:

- Add 5/6: Stop clearing VOLUME_IS_DIRTY during sync. The bit is now
  cleared only on remount to read-only or clean unmount, preventing a
  crash during metadata updates from bypassing chkdsk. Verified in QEMU.

- Add 6/6: Check commit and flush errors during remount and unmount.
  Re-check NInoDirty() after __ntfs_write_inode(). A failed remount is
  rejected so unmount can retry; unmount failures are reported as warnings.


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

