Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564360;
	b=rn34zCOBHMle95b9h50SSKuBPTMwN5IOSpIDfOaLBLbcDGth5a72Odc+8k45GHaBerl4
	 1cLreXbpgMyTaHIHNEohW96I/hM4hSCvFufKmRCy9gacEWqMOKxLS3eRd0HyzKsb+6koU
	 BmX8IOo4jMjBBpAAsb0YO9US1OAWOEx6e3qsf5OLz7SWF3KXt77Y5zZYcspcTjH7YbK5e
	 Z906RCsgqq4f9AC/epaDa6JRq54fApbCgplfQFdI+mbf1NZNYfjqixbpWLLT+Ut7oPjqh
	 z4u/NYqlgDzwimp/gZzuYr7Hq0dsLZSsxkI3Lq35KiuEDbmO9BunekR1AnDCT3Y1i5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564360;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iLGD6GfXV+IYa69cP0H5enGl5vdg498Rjq6U92IU2uI=;
	b=qFJPyeS6CMoo+6SiMI2UzF1ZFQnYlPbnSx8NnEwJHLtItS40O9IbktuGDhuaNcc4pzmD
	 W48yY5wV3umhl6hkrm2mXM2vLIqV+YeleXjpeFbqnCQI2Ha8h29Avxxe5r5TdGkb8gz7O
	 CFLtQfwwuWHcfXkZVpQVIVkbXGuRmaQPQJyVCTmx55CbUe1CTeqblZMb2E0ODMBpkETkk
	 +m4bBkupVHUvo9U7kgXwhHgUEQTZgpSD4wfE7DsjOKxfYDL9/rwiDJeckg1cnh1fl7NPQ
	 FZCnpm5A/+HzimzCDCdQadSeHwMTmXUHGaxjzsJ9zbpF4haCU8AHLXlQhek0GNKvcNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE95606A319
	for <ntfs@lists.linux.dev>; Wed, 21 Oct 2026 06:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CE95606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2e4e6a94cd1911f19a56ed5b684f684d-20261021
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:107b9bf4-2dcf-4dc9-b22a-4c201935bf3b,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:4731227b7fdd680712ce6e0361bba574,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2e4e6a94cd1911f19a56ed5b684f684d-20261021
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2064577139; Wed, 21 Oct 2026 14:32:25 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v5] ntfs: handle a failed size rollback in the write error path
Date: Wed, 21 Oct 2026 14:32:21 +0800
Message-Id: <20261021063221.1410183-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_file_write_iter() extends the data and initialized sizes before
it copies the user data and restores them when the write then fails.
The restoration is best-effort: both results are discarded, even
though the extension is already recorded in the dirty MFT record.
When the restoration fails too, the extended sizes reach the disk
while the VFS inode keeps reporting the old ones: after a remount the
file appears grown again, with an uninitialized tail where the failed
write never put any data, and nothing records the failure.

Keep both undo results: roll the initialized size back first, and
roll the data size back only when that rollback succeeded.  The data
rollback goes through the same VFS-facing truncate
ntfs_setattr_size() uses, which also supports compressed attributes,
and keeps the VFS size on the durable data size when it fails.  Its
shrink clamps the initialized size to the rolled-back data size,
which can sit above the old initialized size, so a failed initialized
size rollback would leave the clamp in place and expose the
uninitialized tail.  The undo runs under the mapping invalidate lock,
like ntfs_setattr_size(), which the truncate expects.  On an undo
failure, set NVolSetErrors(), which the next persistence point
persists as VOLUME_IS_DIRTY, and log a message for the errors=
policy.

Fixes: 9c87959601e8 ("ntfs: update file operations")
Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
Changes in v5:
- roll the initialized size back before the data size and skip the
  data rollback when it fails;
- take the mapping invalidate lock around the undo, which
  __ntfs_attr_truncate_vfs() expects.
---
 fs/ntfs/file.c | 46 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index d810ca5904bd..03ff5f11a0f2 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -934,23 +934,53 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 				&ntfs_iomap_folio_ops, NULL);
 out:
 	if (ret < 0 && ret != -EIOCBQUEUED) {
-		if (ni->initialized_size != old_init_size) {
-			struct ntfs_inode *mrec_ni =
-				ntfs_base_inode(ni);
+		int init_err = 0;
+		int data_err = 0;
+
+		/*
+		 * Like ntfs_setattr_size(): __ntfs_attr_truncate_vfs()
+		 * expects the invalidate lock held across the size
+		 * updates.
+		 */
+		filemap_invalidate_lock(vi->i_mapping);
+
+		/* ntfs_attr_set_initialized_size() rejects a resident one. */
+		if (ni->initialized_size != old_init_size &&
+		    NInoNonResident(ni)) {
+			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
 			mutex_lock(&mrec_ni->mrec_lock);
-			ntfs_attr_set_initialized_size(ni, old_init_size);
+			init_err = ntfs_attr_set_initialized_size(ni,
+					old_init_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
 		}
-		if (ni->data_size != old_data_size) {
-			struct ntfs_inode *mrec_ni =
-				ntfs_base_inode(ni);
+		/*
+		 * The shrink clamps the initialized size to the data size,
+		 * which can sit above the old initialized one and expose
+		 * the uninitialized tail, so skip it unless the rollback
+		 * above restored that size.
+		 */
+		if (ni->data_size != old_data_size && !init_err) {
+			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
 			truncate_setsize(vi, old_data_size);
 			mutex_lock(&mrec_ni->mrec_lock);
-			ntfs_attr_truncate(ni, old_data_size);
+			data_err = __ntfs_attr_truncate_vfs(ni, old_data_size,
+					old_data_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
+			/* Like ntfs_setattr_size(): stay on the durable size. */
+			if (data_err)
+				i_size_write(vi, ni->data_size);
 		}
+		if (init_err || data_err) {
+			/* The failed sizes stay in the dirty MFT record. */
+			NVolSetErrors(vol);
+			ntfs_error(vi->i_sb,
+				   "Failed to roll back the size update: %d",
+				   init_err ?: data_err);
+		}
+
+		filemap_invalidate_unlock(vi->i_mapping);
 	}
 out_lock:
 	inode_unlock(vi);
-- 
2.25.1

