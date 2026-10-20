Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480014;
	b=dpVzaA9rkNSRYElC86p8LiDYcLLhgB/S4V7SFLfa3YOmLgQ3fANDIXFGhLNaOpB16jXn
	 P8IgBWNRlzkOWRI9XRcmPg9KDceiBMJZBF2SDWGn3x4O1XVlwBBbF1KZy1pqPlLtbXa+1
	 pnSprB2lamY3DLwBxrmm2bcCHf6wt26LTuztmphWOChDEqaGKT98qeXIDLxLMGsrnvxa8
	 ymqyZu+hEWgfhd0myXIWMJG4qPX4VCkvKXUGtdHdKAA68PxcOj5TKTOMjpuoWITXThGaA
	 ReKv6kWgwdnJXyxjOTpmQdOTfwfKMjz7sYVLz1lsoKkdCGPTT+1l3jnDwubf64OdYdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480014;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F1qqSTCbumdZbuSyYQjXco6k5FX4mgE04s/PLKPC+Sk=;
	b=J4ZCH6Vqz8+o5Q+2oFk5frLstCFXnH8MeC6+ubFm1K4mdmKIZxCJo3EeVtq5UxPqDd+p
	 PlAg2g2iaXRl2K1n+x49i4fzEAILpPUaBQOuEu8mqgZ9Ya+P2tojSm885VqOMiSIvoXwa
	 ie6X41x3rX9QpCiLW9uURs7vSREbCzIKA0St84vr2OhhSu6vqTGr8Es0l7JNNm2gGA6Hu
	 M97oWDDoX+ntu2o/nYOSa1l02YQR1EyVT/M1mNCWK4ReUTYodUpxLs2/LimFIEH7wcpkI
	 estyriKWrpX4t9Ni/CQqlgQXyK846S3NDX8czsiA7wbIDXhd9gK5OVkH+fX4nv8utnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D050D606A31B
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 07:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D050D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: cfad2ed6cc5411f19a56ed5b684f684d-20261020
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:8e296b8d-407a-4bf7-a42b-46222e1b6b2f,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:5c8a7e57065866220d3cdf901db1cc9c,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cfad2ed6cc5411f19a56ed5b684f684d-20261020
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1599878772; Tue, 20 Oct 2026 15:06:45 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v4] ntfs: handle a failed size rollback in the write error path
Date: Tue, 20 Oct 2026 15:06:41 +0800
Message-Id: <20261020070641.793832-1-zenghongling@kylinos.cn>
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

Keep both undo results: roll the data size back through the same
VFS-facing truncate ntfs_setattr_size() uses, which also supports
compressed attributes, and on failure keep the VFS size on the
durable data size.  Roll the data size back first: its shrink clamps
the initialized size to the rolled-back data size, which can sit
above the old initialized size and expose the uninitialized tail, so
the initialized size rollback runs after it.  On an undo failure,
set NVolSetErrors(), which the next persistence point persists as
VOLUME_IS_DIRTY, and log a message for the errors= policy.

Fixes: 9c87959601e8 ("ntfs: update file operations")
Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
Changes in v4:
- roll the data size back before the initialized size: the shrink
  clamps the initialized size to the rolled-back data size, which
  can sit above the old initialized size and expose the
  uninitialized tail.
Changes in v3:
- skip the initialized size rollback on a resident attribute;
- roll the data size back through __ntfs_attr_truncate_vfs(), which
  ntfs_setattr_size() uses, so compressed attributes roll back too;
- keep the VFS size on the durable data size if the rollback fails.
---
 fs/ntfs/file.c | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index d810ca5904bd..ad032cccfb15 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -934,23 +934,46 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 				&ntfs_iomap_folio_ops, NULL);
 out:
 	if (ret < 0 && ret != -EIOCBQUEUED) {
-		if (ni->initialized_size != old_init_size) {
-			struct ntfs_inode *mrec_ni =
-				ntfs_base_inode(ni);
+		int init_err = 0;
+		int data_err = 0;
 
+		if (ni->data_size != old_data_size) {
+			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
+
+			truncate_setsize(vi, old_data_size);
+			/*
+			 * ntfs_attr_truncate() would reject a compressed
+			 * attribute.
+			 */
 			mutex_lock(&mrec_ni->mrec_lock);
-			ntfs_attr_set_initialized_size(ni, old_init_size);
+			data_err = __ntfs_attr_truncate_vfs(ni, old_data_size,
+					old_data_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
+			/* Like ntfs_setattr_size(): stay on the durable size. */
+			if (data_err)
+				i_size_write(vi, ni->data_size);
 		}
-		if (ni->data_size != old_data_size) {
-			struct ntfs_inode *mrec_ni =
-				ntfs_base_inode(ni);
+		/*
+		 * The shrink above may leave the initialized size above
+		 * the old one; ntfs_attr_set_initialized_size() rejects
+		 * a resident attribute.
+		 */
+		if (ni->initialized_size != old_init_size &&
+		    NInoNonResident(ni)) {
+			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
-			truncate_setsize(vi, old_data_size);
 			mutex_lock(&mrec_ni->mrec_lock);
-			ntfs_attr_truncate(ni, old_data_size);
+			init_err = ntfs_attr_set_initialized_size(ni,
+					old_init_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
 		}
+		if (init_err || data_err) {
+			/* The failed sizes stay in the dirty MFT record. */
+			NVolSetErrors(vol);
+			ntfs_error(vi->i_sb,
+				   "Failed to roll back the size update: %d",
+				   init_err ?: data_err);
+		}
 	}
 out_lock:
 	inode_unlock(vi);
-- 
2.25.1

