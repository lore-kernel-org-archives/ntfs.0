Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CEE27FD43
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 05:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364983; cv=none; b=BWeFUMq0TDu1NkRHGu08UDLA5qYcM30+YYparsIZRriyBtq13VMXncMnKnvKTsL1cm0egdGKDKbk9eM7yv7vV84W29Y7yVKhTwz0TpIP0xZIX2+eDYtZop/ZDbjMpj/nRDt+h3O1o22GcDYW0j/n6vexR5gb3aY1kgy/4Hgu2sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364983; c=relaxed/simple;
	bh=XaQ5iHNLoAotdAWe/ZTPVH5Ot4VrpEFRSZkl2rRVoRY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P783L0z6LzYxYH4/2oQxXCiJ0C6YmEqm0SnG6rMXkX3l+mRDB/T5e5IMRMDSJvra6I9vcatreQRZ9lIYldx8/EKJQcy1Mm38j7j1vIhLqDQKX590Rp30D2r8ZkVFKqfpAOdU4JCd2+xP5kfxkuteMDfvE3kgPqhlS+1KpZTHaGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0e35349eb00011f19a56ed5b684f684d-20260914
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4d89011c-5503-4e48-9175-ccfbe6a37ec0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:d37673151fb0105cc92bbcad96967829,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0e35349eb00011f19a56ed5b684f684d-20260914
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 230106171; Mon, 14 Sep 2026 13:49:31 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v11 0/6] ntfs: fix volume flag races and persist the recorded error state
Date: Mon, 14 Sep 2026 13:49:20 +0800
Message-Id: <20260914054926.78808-1-zenghongling@kylinos.cn>
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

Changes in v11:

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

