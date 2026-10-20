Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486015;
	b=hlSrBd1/mHcJUliLMwzftAGkj6FDglFtkCp0QWdZ2ZLi9vdYokQ1cH25gbgv+8jLgNb2
	 q5MyEnoO35P82lc31qYgXO7i66NSqVXgVUL0ECYkKIej26yuFAeuT0FtXmCTFGDOh6av1
	 /dwFdj+98QeiGAVo9Nx3bCuFEVBzZjIGmC2xlooqucuLU5WNX7iYoJugg1YYV3d7BZkHW
	 48zFKDPg1pOE5fA2rQJTmvKlHHeAC2Oysi4OeXcIvO+ndSli19wJn84wf2lo3uv9FkMe2
	 PzwxcPWwOC9CW4pPFKLjBemsoDVb56PWYhhFdBLJmBukHAKj3KI0sHWJ3bpYZZi4HHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486015;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=droGiVyXDFADHLQn+PKq9DnZDJSgtzNDX5/XFLcN3Ro=;
	b=Ofni/QRHyIsMG6VbXhneAW6gMlclBR/RgXts0dpINyub5QYLL9eXxa+Bqr6z0Qo6WjTW
	 YS2yLrCGNd+9tPqm735u+2XU1alT+/jONUytNNOjtAoBTukVz5gN5Yg8dk5vy5dSJgLus
	 Xaj7TmJN3oZoxubS0759iyoqk5qWCuY94fZf6B9FnL/SpulD8rW7oxogck8c+jOmIcOWg
	 iCf3GwHdMS3JokNLFo9stS/g9fGJrdhgZTM+liZWNMiygWnNoK+OKB31IgmsMoUyGy9mD
	 RFibiarGtd1vF4tRCGwIbNwfsFjdpf2bvnD5PbJnkqILPBea6qiR5RdJmkQC85FP1ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="l/M7aWbu";
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF00606A328
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF00606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=l/M7aWbu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=dr
	oGiVyXDFADHLQn+PKq9DnZDJSgtzNDX5/XFLcN3Ro=; b=l/M7aWbuzdn+6VUPDj
	Je5d9/JMJDsNn9EmW/GVtp5at1FCiyGyPS1keD8vri9s4MKcKyt7mm96fuus0xM7
	ASgaSv/Z12JaujLzhh91i4jt5ghoNldgridqAZa4rZPztqNgqbEz3kNTpT/+K75m
	dT5Rktb20wfDllvI7gGc2E4lQ=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3X_tvKtdqGocHBg--.23211S9;
	Tue, 20 Oct 2026 16:46:46 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 23/31] ntfs: report namespace and file recovery errors
Date: Tue, 20 Oct 2026 16:44:13 +0800
Message-ID: <20261020084421.2196486-24-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261020084421.2196486-1-liubaolin12138@163.com>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3X_tvKtdqGocHBg--.23211S9
X-Coremail-Antispam: 1Uf129KBjvJXoW3Cr4rtr1UGw1ftw1xAFWDArb_yoWkXr1DpF
	W7Gws7t393JryIgrnaya1qvw1SkF97W3yUWrWUG3Z3A3Z0kw1IgF4UtFW29FWrtrZ5J3s8
	XF4DK3yUCr4DXFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzq2NUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RY4A2rXKnZojwAA3C

From: Dandan Wu <wudandan@kylinos.cn>

Report stale directory references, missing FILE_NAME counterparts and
missing index entries during deletion. Return EFSCORRUPTED from the
affected failing lookups; ordinary missing names remain valid results.

Report independent cleanup failures during create, link, rename, file
size restoration and preallocation trimming. Use directory attribution
where appropriate and volume reports during failed creation.

Report missing required parents and attributes during file fsync while
retaining its best-effort lookup handling. Preserve the writeback errno
from the buffered fallback of direct writes instead of replacing it
with EIO.

Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
 fs/ntfs/file.c  | 29 ++++++++++++++---
 fs/ntfs/namei.c | 86 ++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 88 insertions(+), 27 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index cd5ed8bf3164..9c4d9dbab19e 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -117,14 +117,17 @@ static int ntfs_trim_prealloc(struct inode *vi)
 		if (err) {
 			kvfree(ni->runlist.rl);
 			ni->runlist.rl = NULL;
+			ntfs_report_file_metadata_error(vi, err);
 			ntfs_error(vol->sb, "Preallocated block rollback failed");
 		} else {
 			ni->allocated_size = ntfs_cluster_to_bytes(vol, vcn_tr);
 			err = ntfs_attr_update_mapping_pairs_locked(
 					ni, 0, ni);
-			if (err)
+			if (err) {
+				ntfs_report_file_metadata_error(vi, err);
 				ntfs_error(vol->sb,
 					   "Failed to rollback mapping pairs for prealloc");
+			}
 		}
 	}
 
@@ -341,8 +344,13 @@ int ntfs_file_fsync(struct file *filp, loff_t start, loff_t end,
 					le16_to_cpu(ctx->attr->data.resident.value_offset));
 
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
@@ -373,6 +381,11 @@ int ntfs_file_fsync(struct file *filp, loff_t start, loff_t end,
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
@@ -810,7 +823,7 @@ static ssize_t ntfs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		ret2 = filemap_write_and_wait_range(iocb->ki_filp->f_mapping,
 				offset, end);
 		if (ret2) {
-			ret = -EIO;
+			ret = ret2;
 			goto out;
 		}
 		invalidate_mapping_pages(iocb->ki_filp->f_mapping,
@@ -934,12 +947,16 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 				&ntfs_iomap_folio_ops, NULL);
 out:
 	if (ret < 0 && ret != -EIOCBQUEUED) {
+		int rollback_err;
+
 		if (ni->initialized_size != old_init_size) {
 			struct ntfs_inode *mrec_ni =
 				ntfs_base_inode(ni);
 
 			mutex_lock(&mrec_ni->mrec_lock);
-			ntfs_attr_set_initialized_size(ni, old_init_size);
+			rollback_err = ntfs_attr_set_initialized_size(ni, old_init_size);
+			if (rollback_err)
+				ntfs_report_file_metadata_error(vi, rollback_err);
 			mutex_unlock(&mrec_ni->mrec_lock);
 		}
 		if (ni->data_size != old_data_size) {
@@ -948,7 +965,9 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 
 			truncate_setsize(vi, old_data_size);
 			mutex_lock(&mrec_ni->mrec_lock);
-			ntfs_attr_truncate(ni, old_data_size);
+			rollback_err = ntfs_attr_truncate(ni, old_data_size);
+			if (rollback_err)
+				ntfs_report_file_metadata_error(vi, rollback_err);
 			mutex_unlock(&mrec_ni->mrec_lock);
 		}
 	}
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 8918379140f1..47e52270e8ee 100644
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
@@ -534,7 +545,7 @@ static struct ntfs_inode *__ntfs_create(struct mnt_idmap *idmap, struct inode *d
 	if (IS_ERR(dni_mrec)) {
 		ntfs_error(dir_ni->vol->sb, "failed to map mft record for file 0x%llx.\n",
 			   dir_ni->mft_no);
-		err = -EIO;
+		err = PTR_ERR(dni_mrec);
 		goto err_out;
 	}
 	parent_mft_ref = MK_LE_MREF(dir_ni->mft_no,
@@ -725,9 +736,11 @@ static struct ntfs_inode *__ntfs_create(struct mnt_idmap *idmap, struct inode *d
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
@@ -735,12 +748,18 @@ static struct ntfs_inode *__ntfs_create(struct mnt_idmap *idmap, struct inode *d
 
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
+		if (rollback_err)
+			ntfs_report_metadata_error(ni->vol, rollback_err);
+	}
 	/*
 	 * Free extent MFT records (should not exist any with current
 	 * ntfs_create implementation, but for any case if something will be
@@ -750,14 +769,22 @@ static struct ntfs_inode *__ntfs_create(struct mnt_idmap *idmap, struct inode *d
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
@@ -1013,6 +1040,11 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
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
 
@@ -1021,8 +1053,14 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
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
@@ -1234,7 +1272,7 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 	struct super_block *sb;
 	struct inode *vi = VFS_I(ni);
 	struct file_name_attr *fn = NULL;
-	int fn_len, err = 0;
+	int fn_len, rollback_err, err = 0;
 	struct mft_record *dir_mrec = NULL, *ni_mrec = NULL;
 
 	ntfs_debug("Entering.\n");
@@ -1245,7 +1283,7 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 
 	ni_mrec = map_mft_record(ni);
 	if (IS_ERR(ni_mrec)) {
-		err = -EIO;
+		err = PTR_ERR(ni_mrec);
 		goto err_out;
 	}
 
@@ -1265,7 +1303,7 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 
 	dir_mrec = map_mft_record(dir_ni);
 	if (IS_ERR(dir_mrec)) {
-		err = -EIO;
+		err = PTR_ERR(dir_mrec);
 		goto err_out;
 	}
 
@@ -1307,7 +1345,8 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 	if (err) {
 		ntfs_error(sb, "Failed to add FILE_NAME attribute.\n");
 		/* Try to remove just added attribute from index. */
-		if (ntfs_index_remove(dir_ni, fn, fn_len))
+		rollback_err = ntfs_index_remove(dir_ni, fn, fn_len);
+		if (rollback_err)
 			goto rollback_failed;
 		goto err_out;
 	}
@@ -1325,6 +1364,7 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 
 	return 0;
 rollback_failed:
+	ntfs_report_file_metadata_error(VFS_I(dir_ni), rollback_err);
 	ntfs_error(sb, "Rollback failed. Leaving inconsistent metadata.\n");
 err_out:
 	kfree(fn);
@@ -1428,7 +1468,7 @@ static int ntfs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 
 			ni_mrec = map_mft_record(NTFS_I(new_inode));
 			if (IS_ERR(ni_mrec)) {
-				err = -EIO;
+				err = PTR_ERR(ni_mrec);
 				goto err_out;
 			}
 			err = ntfs_check_empty_dir(NTFS_I(new_inode), ni_mrec);
@@ -1453,9 +1493,11 @@ static int ntfs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
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

