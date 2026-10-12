Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8844399F2
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 07:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790513; cv=none; b=HOpEQk/rUEa8N/uEsb78SK2YH5933/ZFNDRlXThgW8E51J3iW+z9LOOBEcaXxiPtgy+lxlKHzfdui2ig0+au+cbpULGds0kTQQ7YyW8NGRSvAa8QDnm1JkADwWoiuAIdGw2pQRjOnK46aDGOiLCX2IKGxmxPK6evIH/BhPOSqBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790513; c=relaxed/simple;
	bh=ai7Jvhok+oHlAtWVrFRlGnd4iBEJW6I0McwSJarHnEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m+0fsSiPYlbTJxKFO3JcoIxsiLrvniD7OId/GC0wNkXi/v8OxlR3JhEHWp4qZkC8K5ZtykSVSjDyOshpL0LdQRs9P+Ff82xxO5du8Fu55hvOy6OeiilpneakFgGprNyEM//UU76HzW9x5hBuST7+WmP573FCwbWHyvSYZWVjhWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6c4b0232c60f11f19a56ed5b684f684d-20261012
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:265ded92-75c7-4aa3-afbd-f5066d798293,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:568a1fcbf55b33eb645f34c66a5a246a,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6c4b0232c60f11f19a56ed5b684f684d-20261012
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 554864418; Mon, 12 Oct 2026 15:34:56 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v4] ntfs: roll back the ACL xattr commit when the WSL mode update fails
Date: Mon, 12 Oct 2026 15:34:52 +0800
Message-Id: <20261012073452.90099-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_set_acl_ex() commits the ACL xattr before it rewrites the WSL
mode EA, and removes it again when the rewrite fails.  That only
undoes a set that created the xattr: when the update replaced or
removed an existing one, the old ACL is discarded along with the
failed update.  The undo result is discarded and the EA paths record
no error state, so when it fails too, the new, typically more
permissive, ACL is left on disk while i_mode, the mode EA and the
cached ACL keep the old values.  Once the stale xattr is loaded again
after a remount, a chmod 0640 -> 0777 that reported failure leaves
the file accessible to the relaxed ACL while stat() still reports
0640.

Save the previous xattr before committing the update, and restore it
when the mode EA rewrite fails.  A removed xattr is restored by
creating it again: the removal dropped the entry, and XATTR_REPLACE
fails with -ENODATA on a missing entry.  Remove the new xattr only
when there was no previous one, and skip the undo when the commit
changed nothing, e.g. removing an xattr that never existed.  Fail
the update when the previous xattr cannot be read back.  A failed
rollback is still recorded: NVolSetErrors(), which the next
persistence point persists as VOLUME_IS_DIRTY, and a log message the
errors= policy acts on.  The flag cannot be written to disk here
directly: the target inode's mrec_lock is held and the $Volume
mrec_lock cannot be nested under it.

Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
Changes in v3:
- Save the previous ACL xattr before committing the new one and roll
  back to it when the update replaced an existing one, instead of
  removing the new one (suggested by Hyunchul Lee)
- Fail the update when the previous xattr cannot be read back, and
  restore a zero-length previous xattr without XATTR_REPLACE
Changes in v4:
- Undo a removal too: restore the previous xattr by creating it
  again, since the removal dropped the entry
- Skip the undo when the commit changed nothing, e.g. removing an
  xattr that never existed
---
 fs/ntfs/ea.c | 90 +++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 86 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 1104fd72cd2a..0577a2adc365 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -1038,8 +1038,10 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
 {
 	const char *name;
 	size_t size, name_len;
-	void *value;
-	int err;
+	void *value, *old_value = NULL;
+	int err, old_len = -ENODATA;
+	bool old_exists = false;
+	bool acl_committed = false;
 	int flags;
 	umode_t mode;
 
@@ -1083,7 +1085,40 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
 	}
 
 	mutex_lock(&NTFS_I(inode)->mrec_lock);
+	if (!init_acl) {
+		/*
+		 * Save the previous xattr so the update can be
+		 * rolled back to it when the mode EA rewrite fails.
+		 * A new inode cannot have one yet, and one that
+		 * cannot be read back fails the update.
+		 */
+		old_len = ntfs_get_ea(inode, name, name_len, NULL, 0);
+		if (old_len >= 0) {
+			old_exists = true;
+			/* kmalloc(0) returns the non-NULL ZERO_SIZE_PTR. */
+			old_value = kmalloc(old_len, GFP_NOFS);
+			if (!old_value) {
+				err = -ENOMEM;
+				goto out_unlock;
+			}
+			err = ntfs_get_ea(inode, name, name_len,
+					  old_value, old_len);
+			if (err != old_len) {
+				kfree(old_value);
+				old_value = NULL;
+				if (err >= 0)
+					err = -EIO;
+				goto out_unlock;
+			}
+		} else if (old_len != -ENODATA) {
+			err = old_len;
+			goto out_unlock;
+		}
+	}
 	err = ntfs_set_ea(inode, name, name_len, value, size, flags, NULL);
+	if (!err)
+		acl_committed = true;
+out_unlock:
 	mutex_unlock(&NTFS_I(inode)->mrec_lock);
 	if (err == -ENODATA && !size)
 		err = 0; /* Removing non existed xattr. */
@@ -1095,8 +1130,54 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
 		mutex_lock(&NTFS_I(inode)->mrec_lock);
 		err = ntfs_ea_set_wsl_inode(inode, 0, &ea_size, NTFS_EA_MODE);
 		if (err) {
-			ntfs_set_ea(inode, name, name_len, NULL, 0,
-				    XATTR_REPLACE, NULL);
+			if (acl_committed) {
+				int undo_err;
+
+				if (old_exists) {
+					/*
+					 * Restore the previous xattr.
+					 * A removal dropped the entry, and
+					 * XATTR_REPLACE fails with
+					 * -ENODATA on a missing entry, so
+					 * create it.  A zero-length xattr
+					 * cannot be restored with
+					 * XATTR_REPLACE, which would
+					 * remove it again.
+					 */
+					int undo_flags = acl && old_len ?
+						XATTR_REPLACE : 0;
+
+					undo_err = ntfs_set_ea(inode, name,
+							name_len, old_value,
+							old_len, undo_flags,
+							NULL);
+				} else {
+					/*
+					 * No xattr existed before the
+					 * update, so remove the newly
+					 * committed one.
+					 */
+					undo_err = ntfs_set_ea(inode, name,
+							name_len, NULL, 0,
+							XATTR_REPLACE, NULL);
+				}
+				if (undo_err) {
+					/*
+					 * The xattr change is committed
+					 * already, so a failed rollback
+					 * leaves it on disk while i_mode,
+					 * the mode EA and the cached ACL
+					 * keep the old values.  Record the
+					 * error: the next persistence point
+					 * persists it as VOLUME_IS_DIRTY.
+					 * Run chkdsk.
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
@@ -1109,6 +1190,7 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
 	}
 
 out:
+	kfree(old_value);
 	kfree(value);
 
 	return err;
-- 
2.25.1

