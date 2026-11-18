Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993056;
	b=0awa3OXij6/C7gYfJnRebjhNPsJU4SE3N3ZZIHG5z6XUbnNqO8f1HHo03OvYfMRZFVCm
	 oUAK5b4CliJbVKQPWecnVvgWRkSJXdgo+FX5VYvfuVerVD0fMzSx7u5e0+XeO1A9RESOE
	 +snl1RWu4VdNUbPsy3n1IRSJb4zC1VbVvEEIJormfUgFALGZkenAy2H9uxXkXGLGMfVoR
	 9mhs7agI/mSWo15PJ4VWhJMkSh7whaG0ES8hOJyQ7t+3O5mnWrY8n0/wlIf5rc0OQIdju
	 Fsm+EXQDFki21gQUxwTvvJXnWy0GNeQigQPbQh45oTO6wMjwtM5SgU7fe1ELuzJOR+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993056;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=VDDyZuUZPm3GOO6+vK+/1S6TU7SR/NVbUBDU5GyTuoA=;
	b=OYosMSedJ4B52+/37M8zVsEOzTbdUSn1tv+ppNsXbUtUmNt9aVrxSSD+UGnrIVQNrbhq
	 l1KLt8izke1qLB1AD2s39BciLGs3YmnmAGB3U0BGUSGsQaf1MZrqw+aIZoE1GIgK2uEzM
	 5N86rmYq/yUK355jInDkIQzA9+EVQQm7dQo5ojly7NT94thz3Q055NWue08BJPhU1RlNP
	 uMEaYia79G8C7TK+dpHOTHShC5ehpl1BXF3TsCqKqTc/fnU/wbAMlYen1x2/IP/0hxq/C
	 1UYwZ+oCzD5tPGK5+wi7aMqVUjuRJtYx0Qva4ZA0wyN6E8Qq1ycV7uRECHlS9HrhBfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ml5V2fbG;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D9F606A32A
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D9F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ml5V2fbG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=VD
	DyZuUZPm3GOO6+vK+/1S6TU7SR/NVbUBDU5GyTuoA=; b=ml5V2fbG9QI0dRK9zx
	FNch3sHUGeYOgOF9bPf0vDNA6Dlt2TH9Us0DykGVvYd1ylZ+nm/JaEdKLpDM9JDu
	keZhHSeolLW580zJv86KJq47NucBv1lUicGVn54v7NrbH7+w1XhWEnmzvQxyVNiR
	dtf79QwBWQPAPlshI/iZqWL2Q=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3UiuQa_1qEjvuGg--.61000S6;
	Wed, 18 Nov 2026 17:10:43 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 28/37] ntfs: report namespace and file recovery errors
Date: Wed, 18 Nov 2026 17:06:52 +0800
Message-Id: <20261118090701.1858849-29-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118090701.1858849-1-wangxuewen_ky@163.com>
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:PigvCgD3UiuQa_1qEjvuGg--.61000S6
X-Coremail-Antispam: 1Uf129KBjvJXoW3Cr4rtr1UXr4DXF45Xw4UCFg_yoWkXFyrpF
	ZrGws7t397Jr92grnaya1jvw1S9FyIgrWUWrWUG3WfJan8Kw1IgF4ktry29FyrtrZ5J3s8
	XF4UK3yUCr4DXFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTVb9UUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC8BMZAmr9a5OccAAA37

From: Dandan Wu <wudandan@kylinos.cn>

Report stale directory references, missing FILE_NAME counterparts and
missing index entries during deletion. Return EFSCORRUPTED from the
affected failing lookups; ordinary missing names remain valid results.

Report independent cleanup failures during create, link, rename, file
size restoration and preallocation trimming. Use directory attribution
where appropriate and volume reports during failed creation.
Only negative reparse-index cleanup results are errors; a positive
returned data length means cleanup succeeded.

Report missing required parents and attributes during file fsync while
retaining its best-effort lookup handling.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
Changes in v6:
Keep namespace/file reporting here; buffered-fallback errno
preservation is now a preceding patch.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.

 fs/ntfs/file.c  | 24 ++++++++++++--
 fs/ntfs/namei.c | 86 ++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 86 insertions(+), 24 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index b1c6a84bf955..c1ce2c173717 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -85,6 +85,7 @@ int ntfs_file_open(struct inode *vi, struct file *filp)
  */
 static int ntfs_trim_prealloc(struct inode *vi)
 {
+	int report_err = 0;
 	struct ntfs_inode *ni = NTFS_I(vi);
 	struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 	struct ntfs_volume *vol = ni->vol;
@@ -117,14 +118,17 @@ static int ntfs_trim_prealloc(struct inode *vi)
 		if (err) {
 			kvfree(ni->runlist.rl);
 			ni->runlist.rl = NULL;
+			report_err = err;
 			ntfs_error(vol->sb, "Preallocated block rollback failed");
 		} else {
 			ni->allocated_size = ntfs_cluster_to_bytes(vol, vcn_tr);
 			err = ntfs_attr_update_mapping_pairs_locked(
 					ni, 0, ni);
-			if (err)
+			if (err) {
+				report_err = err;
 				ntfs_error(vol->sb,
 					   "Failed to rollback mapping pairs for prealloc");
+			}
 		}
 	}
 
@@ -133,6 +137,8 @@ static int ntfs_trim_prealloc(struct inode *vi)
 	mutex_unlock(&mrec_ni->mrec_lock);
 	inode_unlock(vi);
 
+	if (report_err)
+		ntfs_report_file_metadata_error(vi, report_err);
 	return err;
 }
 
@@ -337,8 +343,13 @@ int ntfs_file_fsync(struct file *filp, loff_t start, loff_t end,
 				continue;
 
 			parent_vi = ntfs_iget(vi->i_sb, MREF_LE(fn->parent_directory));
-			if (IS_ERR(parent_vi))
+			if (IS_ERR(parent_vi)) {
+				if (PTR_ERR(parent_vi) == -ENOENT &&
+				    !NInoBeingDeleted(ni))
+					ntfs_report_file_metadata_error(vi,
+									-EFSCORRUPTED);
 				continue;
+			}
 			mutex_lock_nested(&NTFS_I(parent_vi)->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
 			ia_vi = ntfs_index_iget(parent_vi, I30, 4);
 			mutex_unlock(&NTFS_I(parent_vi)->mrec_lock);
@@ -369,6 +380,11 @@ int ntfs_file_fsync(struct file *filp, loff_t start, loff_t end,
 			attr_vi = ntfs_attr_iget(vi, ctx->attr->type,
 						 name, ctx->attr->name_length);
 			if (IS_ERR(attr_vi)) {
+				if (PTR_ERR(attr_vi) == -ENOENT) {
+					ntfs_report_file_metadata_error(vi,
+									-EFSCORRUPTED);
+					attr_vi = ERR_PTR(-EFSCORRUPTED);
+				}
 				kfree(attr);
 				continue;
 			}
@@ -949,6 +965,8 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 					old_init_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
 		}
+		if (init_err)
+			ntfs_report_file_metadata_error(vi, init_err);
 		/*
 		 * The shrink clamps the initialized size to the data size,
 		 * which can sit above the old initialized one and expose
@@ -963,6 +981,8 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			data_err = __ntfs_attr_truncate_vfs(ni, old_data_size,
 					old_data_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
+			if (data_err)
+				ntfs_report_file_metadata_error(vi, data_err);
 			/* Like ntfs_setattr_size(): stay on the durable size. */
 			if (data_err)
 				i_size_write(vi, ni->data_size);
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index fb1946b9e7e3..5a497807dda0 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -236,14 +236,21 @@ static struct dentry *ntfs_lookup(struct inode *dir_ino, struct dentry *dent,
 				goto handle_name;
 			}
 			ntfs_error(vol->sb,
-				"Found stale reference to inode 0x%lx (reference sequence number = 0x%x, inode sequence number = 0x%x), returning -EIO. Run chkdsk.",
+				"Found stale reference to inode 0x%lx (reference sequence number = 0x%x, inode sequence number = 0x%x), returning -EFSCORRUPTED. Run chkdsk.",
 				dent_ino, MSEQNO(mref),
 				NTFS_I(dent_inode)->seq_no);
+			ntfs_report_file_metadata_error(dir_ino, -EFSCORRUPTED);
 			iput(dent_inode);
-			dent_inode = ERR_PTR(-EIO);
-		} else
+			dent_inode = ERR_PTR(-EFSCORRUPTED);
+		} else {
+			if (PTR_ERR(dent_inode) == -ENOENT) {
+				ntfs_report_file_metadata_error(dir_ino,
+								-EFSCORRUPTED);
+				dent_inode = ERR_PTR(-EFSCORRUPTED);
+			}
 			ntfs_error(vol->sb, "ntfs_iget(0x%lx) failed with error code %li.",
 					dent_ino, PTR_ERR(dent_inode));
+		}
 		kfree(name);
 		/* Return the error code. */
 		return ERR_CAST(dent_inode);
@@ -303,8 +310,11 @@ static struct dentry *ntfs_lookup(struct inode *dir_ino, struct dentry *dent,
 				if (unlikely(err)) {
 					ntfs_error(vol->sb,
 						"Inode corrupt: No WIN32 namespace counterpart to DOS file name. Run chkdsk.");
-					if (err == -ENOENT)
-						err = -EIO;
+					if (err == -ENOENT) {
+						err = -EFSCORRUPTED;
+						ntfs_report_file_metadata_error(dent_inode,
+										-EFSCORRUPTED);
+					}
 					goto err_out;
 				}
 				/* Consistency checks. */
@@ -339,7 +349,8 @@ static struct dentry *ntfs_lookup(struct inode *dir_ino, struct dentry *dent,
 
 eio_err_out:
 		ntfs_error(vol->sb, "Illegal file name attribute. Run chkdsk.");
-		err = -EIO;
+		err = -EFSCORRUPTED;
+		ntfs_report_file_metadata_error(dent_inode, -EFSCORRUPTED);
 err_out:
 		if (ctx)
 			ntfs_attr_put_search_ctx(ctx);
@@ -536,7 +547,7 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	if (IS_ERR(dni_mrec)) {
 		ntfs_error(dir_ni->vol->sb, "failed to map mft record for file 0x%llx.\n",
 			   dir_ni->mft_no);
-		err = -EIO;
+		err = PTR_ERR(dni_mrec);
 		goto err_out;
 	}
 	parent_mft_ref = MK_LE_MREF(dir_ni->mft_no,
@@ -727,9 +738,11 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 		rollback_err = ntfs_attr_remove(ni,
 				AT_SECURITY_DESCRIPTOR, AT_UNNAMED, 0,
 				&rollback_sd_vi);
-		if (rollback_err)
+		if (rollback_err) {
+			ntfs_report_metadata_error(ni->vol, rollback_err);
 			ntfs_error(sb,
 				"Failed to roll back security descriptor.\n");
+		}
 	}
 
 	if (rollback_data) {
@@ -737,12 +750,18 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 
 		rollback_err = ntfs_attr_remove(ni, AT_DATA, AT_UNNAMED,
 				0, &rollback_data_vi);
-		if (rollback_err)
+		if (rollback_err) {
+			ntfs_report_metadata_error(ni->vol, rollback_err);
 			ntfs_error(sb, "Failed to roll back DATA attribute.\n");
+		}
 	}
 
-	if (rollback_reparse)
-		ntfs_delete_reparse_index(ni);
+	if (rollback_reparse) {
+		int rollback_err = ntfs_delete_reparse_index(ni);
+
+		if (rollback_err < 0)
+			ntfs_report_metadata_error(ni->vol, rollback_err);
+	}
 	/*
 	 * Free extent MFT records (should not exist any with current
 	 * ntfs_create implementation, but for any case if something will be
@@ -752,14 +771,22 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 		int err2;
 
 		err2 = ntfs_mft_record_free(ni->vol, *(ni->ext.extent_ntfs_inos));
-		if (err2)
+		if (err2) {
+			ntfs_report_metadata_error(ni->vol, err2);
 			ntfs_error(sb,
 				"Failed to free extent MFT record. Leaving inconsistent metadata.\n");
+		}
 		ntfs_inode_close(*(ni->ext.extent_ntfs_inos));
 	}
-	if (ntfs_mft_record_free(ni->vol, ni))
-		ntfs_error(sb,
-			"Failed to free MFT record. Leaving inconsistent metadata. Run chkdsk.\n");
+	{
+		int free_err = ntfs_mft_record_free(ni->vol, ni);
+
+		if (free_err) {
+			ntfs_report_metadata_error(ni->vol, free_err);
+			ntfs_error(sb,
+				   "Failed to free MFT record. Leaving inconsistent metadata. Run chkdsk.\n");
+		}
+	}
 	unmap_mft_record(ni);
 	kfree(fn);
 	kfree(si);
@@ -1015,6 +1042,11 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 			ntfs_attr_reinit_search_ctx(actx);
 			goto search;
 		}
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
+		}
 		goto err_out;
 	}
 
@@ -1023,8 +1055,14 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 		goto err_out;
 
 	err = ntfs_index_remove(dir_ni, fn, le32_to_cpu(actx->attr->data.resident.value_length));
-	if (err)
+	if (err) {
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(dir_ni),
+							-EFSCORRUPTED);
+		}
 		goto err_out;
+	}
 
 	err = ntfs_attr_record_rm(actx);
 	if (err)
@@ -1236,7 +1274,7 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 	struct super_block *sb;
 	struct inode *vi = VFS_I(ni);
 	struct file_name_attr *fn = NULL;
-	int fn_len, err = 0;
+	int fn_len, rollback_err, err = 0;
 	struct mft_record *dir_mrec = NULL, *ni_mrec = NULL;
 
 	ntfs_debug("Entering.\n");
@@ -1247,7 +1285,7 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 
 	ni_mrec = map_mft_record(ni);
 	if (IS_ERR(ni_mrec)) {
-		err = -EIO;
+		err = PTR_ERR(ni_mrec);
 		goto err_out;
 	}
 
@@ -1267,7 +1305,7 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 
 	dir_mrec = map_mft_record(dir_ni);
 	if (IS_ERR(dir_mrec)) {
-		err = -EIO;
+		err = PTR_ERR(dir_mrec);
 		goto err_out;
 	}
 
@@ -1309,7 +1347,8 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 	if (err) {
 		ntfs_error(sb, "Failed to add FILE_NAME attribute.\n");
 		/* Try to remove just added attribute from index. */
-		if (ntfs_index_remove(dir_ni, fn, fn_len))
+		rollback_err = ntfs_index_remove(dir_ni, fn, fn_len);
+		if (rollback_err)
 			goto rollback_failed;
 		goto err_out;
 	}
@@ -1327,6 +1366,7 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 
 	return 0;
 rollback_failed:
+	ntfs_report_file_metadata_error(VFS_I(dir_ni), rollback_err);
 	ntfs_error(sb, "Rollback failed. Leaving inconsistent metadata.\n");
 err_out:
 	kfree(fn);
@@ -1430,7 +1470,7 @@ static int ntfs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 
 			ni_mrec = map_mft_record(NTFS_I(new_inode));
 			if (IS_ERR(ni_mrec)) {
-				err = -EIO;
+				err = PTR_ERR(ni_mrec);
 				goto err_out;
 			}
 			err = ntfs_check_empty_dir(NTFS_I(new_inode), ni_mrec);
@@ -1455,9 +1495,11 @@ static int ntfs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 		ntfs_error(sb, "Failed to delete old ntfs inode(%llu) in old dir, err : %d\n",
 				old_ni->mft_no, err);
 		err2 = ntfs_delete(old_ni, new_dir_ni, uname_new, new_name_len, false);
-		if (err2)
+		if (err2) {
+			ntfs_report_file_metadata_error(VFS_I(new_dir_ni), err2);
 			ntfs_error(sb, "Failed to delete old ntfs inode in new dir, err : %d\n",
 					err2);
+		}
 		goto err_out;
 	}
 
-- 
2.51.0

