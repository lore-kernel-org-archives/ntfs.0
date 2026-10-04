Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0AB35F602
	for <ntfs@lists.linux.dev>; Sun,  4 Oct 2026 02:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791080796; cv=none; b=nJmcTWUE26CwJ5wgcU+jWlVtyLgUr6YziQc/qsYa2uu0DfpC0YB6BbbAAx9VElh1IIbYWisEhQGw1eoSej4NRDP2B77cBPQrILI3XIjn//ZKg1emk2BR3mL+1f+t9s6Q8FfX5iSGBosHoD+xzgCSTSoO+kCkVJ/fCFM3l94Yw5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791080796; c=relaxed/simple;
	bh=+7u3AWh8eXfJ1/497FGY7TeG1u8/HQEN/7K8DFRLNw4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VQyLmMFsliXccXV6bm2SJB5A29aY4/Bfp6Q8yAvodYz3pvb+Istykn9GJ+uvW2rYTC3nsGy0b1XHY0YVHVfTQ44g5zR932czYDv5jWhuPrbLUws6zbBMYuKfsFfo+n1/AxDvCWy5PflvBnl1ON1gUK7AxR6WdUqmtPMAAHX0SXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0009f22ebf9b11f19a56ed5b684f684d-20261004
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:5adde99f-d50a-4863-a288-5896da0e7dd3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:fd9bea664a05d29737292b42c015bcbc,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0009f22ebf9b11f19a56ed5b684f684d-20261004
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1189330924; Sun, 04 Oct 2026 10:26:26 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v2] ntfs: record an error when the ACL xattr undo fails
Date: Sun,  4 Oct 2026 10:26:22 +0800
Message-Id: <20261004022622.631203-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_set_acl_ex() commits the new ACL xattr before it rewrites the WSL
mode EA, and removes it again when that rewrite fails.  The removal is
best-effort: its result is discarded and the EA paths record no error
state, so when the removal fails too, the new, typically more
permissive, ACL is left on disk while i_mode, the mode EA and the
cached ACL keep the old values.  Once the stale xattr is loaded again -
after a remount, or when the cached ACL is discarded - a chmod 0640 ->
0777 that reported failure leaves the file accessible to the relaxed
ACL while stat() still reports 0640.

Check the removal and record the failure: NVolSetErrors(), which the
next persistence point persists as VOLUME_IS_DIRTY, and a log message
the errors= policy acts on.  The flag cannot be written to disk here
directly: the target inode's mrec_lock is held and the $Volume
mrec_lock cannot be nested under it.

Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 Change in v2:
 -undo only a committed set: undoing a removal returned -ENODATA for an
  already-removed xattr and was recorded as a volume error, or re-added
  an empty xattr once the removal had dropped the last EA
---
 fs/ntfs/ea.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index b4fcfbe2da4c..b3e079e2dc03 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -1084,8 +1084,34 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
 		mutex_lock(&NTFS_I(inode)->mrec_lock);
 		err = ntfs_ea_set_wsl_inode(inode, 0, &ea_size, NTFS_EA_MODE);
 		if (err) {
-			ntfs_set_ea(inode, name, name_len, NULL, 0,
-				    XATTR_REPLACE, NULL);
+			/*
+			 * Only a set needs undoing: a removal leaves no
+			 * new ACL behind, and repeating it would either
+			 * return -ENODATA again or, once it dropped the
+			 * last EA, re-create an empty xattr.
+			 */
+			if (acl) {
+				int undo_err = ntfs_set_ea(inode, name, name_len,
+						NULL, 0, XATTR_REPLACE, NULL);
+
+				if (undo_err) {
+					/*
+					 * The ACL xattr is committed
+					 * already, so a failed removal
+					 * leaves the new, typically more
+					 * permissive, ACL on disk while
+					 * i_mode, the mode EA and the
+					 * cached ACL keep the old values.
+					 * Record the error: the next
+					 * persistence point persists it as
+					 * VOLUME_IS_DIRTY.  Run chkdsk.
+					 */
+					NVolSetErrors(NTFS_I(inode)->vol);
+					ntfs_error(inode->i_sb,
+						   "Failed to undo the ACL xattr: %d",
+						   undo_err);
+				}
+			}
 			mutex_unlock(&NTFS_I(inode)->mrec_lock);
 			inode->i_mode = old_mode;
 			goto out;
-- 
2.25.1

