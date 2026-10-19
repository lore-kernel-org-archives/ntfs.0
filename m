Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B9F4534B7
	for <ntfs@lists.linux.dev>; Mon, 19 Oct 2026 06:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392571; cv=none; b=QIl5PVPCbtJT1bKo8txsPH0AgiV5mPWrXWsEAEpx1N2ZuVOCGQ7w1fV7Ef5ryWQzFT5SMM19zZEvS/vjdCBkBH1C9MOJAD7MKzr3zWlMoKBRqIJDxHmwniPUp6JIRtgbWwfBk6L9MUbf4DRH1srpkPhhO/zCi25m3FZpz8Jb2cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392571; c=relaxed/simple;
	bh=CKJQkbOdgrgFxfAH/q2tzRrDsm6lvFImqvNA1MuMyXk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zv9cDigtDrZiY0ABe8VhvKu9lbD9EqSu1YZAI8oZ1j6myR18wNw52eS+M+WNPevRLg098vjhn7ytSJrf4NTEyPTnuN3UKuegTbqhnSRDEDYMZtj52QfTnSh+s6tIw7EwO6Beb2g8DJCTHMuGPzFBlcr67FBoulu9s18kic9kL/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 374ad1facb8911f19a56ed5b684f684d-20261019
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:bf50bada-b9e2-485d-9bfe-9f1fb35b19c6,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:c4a7725974294698d57509bd5eadba04,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 374ad1facb8911f19a56ed5b684f684d-20261019
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 762760076; Mon, 19 Oct 2026 14:49:22 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v2] ntfs: handle a failed size rollback in the write error path
Date: Mon, 19 Oct 2026 14:49:18 +0800
Message-Id: <20261019064918.152859-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
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

Keep both undo results: on failure, set NVolSetErrors(), which the next
persistence point persists as VOLUME_IS_DIRTY, and log a message for
the errors= policy.

Fixes: 9c87959601e8 ("ntfs: update file operations")
Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
Changes in v2:
- do not roll the initialized size back on a resident data attribute,
  where ntfs_attr_set_initialized_size() always fails with -EINVAL and
  the data size rollback restores both coupled sizes.
---
 fs/ntfs/file.c | 46 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index d810ca5904bd..597fd70ed30b 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -934,22 +934,50 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 				&ntfs_iomap_folio_ops, NULL);
 out:
 	if (ret < 0 && ret != -EIOCBQUEUED) {
-		if (ni->initialized_size != old_init_size) {
-			struct ntfs_inode *mrec_ni =
-				ntfs_base_inode(ni);
+		int undo_err = 0;
+		int init_err = 0;
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
+			if (init_err && !undo_err)
+				undo_err = init_err;
 		}
 		if (ni->data_size != old_data_size) {
-			struct ntfs_inode *mrec_ni =
-				ntfs_base_inode(ni);
+			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
+			int data_err = 0;
 
 			truncate_setsize(vi, old_data_size);
-			mutex_lock(&mrec_ni->mrec_lock);
-			ntfs_attr_truncate(ni, old_data_size);
-			mutex_unlock(&mrec_ni->mrec_lock);
+			/*
+			 * ntfs_attr_truncate() rejects a compressed one.
+			 * Skip it also after a failed initialized size
+			 * rollback: the shrunk data size would stay below
+			 * the initialized size, which the loader rejects.
+			 */
+			if (!NInoCompressed(ni) && !init_err) {
+				mutex_lock(&mrec_ni->mrec_lock);
+				data_err = ntfs_attr_truncate(ni,
+						old_data_size);
+				mutex_unlock(&mrec_ni->mrec_lock);
+			}
+			if (data_err && !undo_err)
+				undo_err = data_err;
+		}
+		if (ni->data_size != old_data_size && NInoCompressed(ni))
+			ntfs_warning(vi->i_sb,
+				     "cannot roll back the compressed data size");
+		if (undo_err) {
+			/* The new sizes stay in the dirty MFT record. */
+			NVolSetErrors(vol);
+			ntfs_error(vi->i_sb,
+				   "Failed to roll back the size update: %d",
+				   undo_err);
 		}
 	}
 out_lock:
-- 
2.25.1

