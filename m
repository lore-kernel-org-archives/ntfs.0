Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993057;
	b=ez10Ffltgx2vxfawkUrRAvQNHHhDqze20z08sbzQ9r6EHOIVGZ7ukbntuyexXuNnTTXR
	 06eJRNuU90H4TPppZkAJxoulFXWk2fnIrKFOlLBxA4M/+K5BAfm86m67lpRfe+ssLZ7K+
	 yqi9CERqUkMwtaq0/0nhll0sB9wqR+poee2ra007iNLsk8hyrRdgK5gP5WOA7+2N4PBq6
	 tTb6V4eeeGwWvFDbPBUn2VrpXmUJedVaQ2ai3lYc46bJZazQaLklpTaX53lA0jJZe6/11
	 e+8VuwPz470/jxN8B/FyFt6UUFkwXeCUIwIPOhlixG7XEQ2EUhqb9Dv7vo0DKLmVvdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993057;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ssUPmw10Mh4FCI1SoIRejVYVCyerLwptRehdVt2fqCk=;
	b=eokNF1/hd0zTP0Y106AmMax4Lq2/PL6/oJZZDocemQJ9+syLkI7o+yewAJcqHifOhyfz
	 ylCtgljRgJkBSMgTcLGRYHlhXB5nSvdUx+WMGal8KBacR38Qug5nWqgTI3kAh0kTVPpcV
	 5fwpUgDQLzzi7h6E/2vptYCgtXg9L56/jc0aqK8UHY+751vwvXjozRXM+X8plUHonSlkf
	 wrFki9MwPK4TMSlIgInIiHYKK9iKvLO1X7pqxfHwCB3Q3EPMq5pcprrhhqxgiQUYrTO4s
	 wEqRHnVugabFocr9Cr+kxRDboQYdgKQAHIkPXD3G8tczUprD4fU0FcLYIWt8Ifa6qNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XYENOtmo;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F6F606A32C
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32F6F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XYENOtmo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ss
	UPmw10Mh4FCI1SoIRejVYVCyerLwptRehdVt2fqCk=; b=XYENOtmo/dVoz33zQ2
	qcuaRO1nknT12e7nEcRW015hKtWdevO5e5m93G3stSKsLBUsDf80eSjTHVJEexjX
	Vkl6wsYJgEJwZ1RcWv3fXVLAPjc43wkAxomXNX0AdyPGr29dnV4whdsX/HXU031T
	PMlD9QHwzexG75SqyzOyjv7qY=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3UiuQa_1qEjvuGg--.61000S4;
	Wed, 18 Nov 2026 17:10:42 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 26/37] ntfs: report directory lookup and metadata corruption
Date: Wed, 18 Nov 2026 17:06:50 +0800
Message-Id: <20261118090701.1858849-27-wangxuewen_ky@163.com>
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
X-CM-TRANSID:PigvCgD3UiuQa_1qEjvuGg--.61000S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3ur4xJw1DuF4fCryfCF4fGrg_yoWkCw13pF
	ZrG3s3t3yfGry2kwnayF4DZF1S9a4Ig3y7XrWDCw1Sk3Z5tw12yFW8tFyjgFyrKrWrC3sr
	XF4Yg3yUGa1UZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UK-eOUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzhIZAmr9a5IHfwAA3R

From: Dandan Wu <wudandan@kylinos.cn>

Directory lookup and enumeration detect malformed indexes, missing
required attributes and stale references without consistently reporting
them. Report corruption against the directory and use EFSCORRUPTED while
preserving underlying errors and ordinary lookup misses.

Attribute dangling reparse entries to the directory. Report unused
parents during directory fsync except for deleting children, retaining
its existing return behavior.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
Changes in v6:
Report the upstream child-VCN bounds failure after common cleanup.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.
- Final-kernel lookup and readdir tests on out-of-range child VCNs
  returned EUCLEAN and generated EUCLEAN events.

 fs/ntfs/dir.c     | 78 ++++++++++++++++++++++++++++++++---------------
 fs/ntfs/reparse.c |  9 ++++--
 fs/ntfs/reparse.h |  2 +-
 3 files changed, 61 insertions(+), 28 deletions(-)

diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index 69ed34fff23f..faaf28fadea3 100644
--- a/fs/ntfs/dir.c
+++ b/fs/ntfs/dir.c
@@ -24,10 +24,12 @@
 __le16 I30[5] = { cpu_to_le16('$'), cpu_to_le16('I'),
 		cpu_to_le16('3'),	cpu_to_le16('0'), 0 };
 
-static inline u64 ntfs_check_mref(u64 mref)
+static inline u64 ntfs_check_mref(struct ntfs_inode *dir_ni, u64 mref)
 {
-	if (IS_ERR_MREF(mref))
-		return ERR_MREF(-EIO);
+	if (IS_ERR_MREF(mref)) {
+		ntfs_report_file_metadata_error(VFS_I(dir_ni), -EFSCORRUPTED);
+		return ERR_MREF(-EFSCORRUPTED);
+	}
 	return mref;
 }
 
@@ -75,6 +77,7 @@ static inline u64 ntfs_check_mref(u64 mref)
 u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		const int uname_len, struct ntfs_name **res)
 {
+	int report_err = 0;
 	struct ntfs_volume *vol = dir_ni->vol;
 	struct super_block *sb = vol->sb;
 	struct inode *ia_vi = NULL;
@@ -113,7 +116,8 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 			ntfs_error(sb,
 				"Index root attribute missing in directory inode 0x%llx.",
 				dir_ni->mft_no);
-			err = -EIO;
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
 		}
 		goto err_out;
 	}
@@ -187,7 +191,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 			mref = le64_to_cpu(ie->data.dir.indexed_file);
 			ntfs_attr_put_search_ctx(ctx);
 			unmap_mft_record(dir_ni);
-			return ntfs_check_mref(mref);
+			return ntfs_check_mref(dir_ni, mref);
 		}
 		/*
 		 * For a case insensitive mount, we also perform a case
@@ -282,7 +286,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		if (name) {
 			ntfs_attr_put_search_ctx(ctx);
 			unmap_mft_record(dir_ni);
-			return ntfs_check_mref(name->mref);
+			return ntfs_check_mref(dir_ni, name->mref);
 		}
 		ntfs_debug("Entry not found.");
 		err = -ENOENT;
@@ -320,8 +324,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		ntfs_error(sb,
 			"Child node vcn %lld is outside $INDEX_ALLOCATION in directory inode 0x%llx.",
 			vcn, dir_ni->mft_no);
-		err = -EIO;
-		goto err_out;
+		goto unm_corrupt;
 	}
 	/*
 	 * Convert vcn to index into the index allocation attribute in units
@@ -334,6 +337,8 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		ntfs_error(sb, "Failed to map directory index page, error %ld.",
 				-PTR_ERR(folio));
 		err = PTR_ERR(folio);
+		if (err == -EIO)
+			report_err = err;
 		goto err_out;
 	}
 
@@ -358,14 +363,14 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		ntfs_error(sb,
 			"Out of bounds check failed. Corrupt directory inode 0x%llx or driver bug.",
 			dir_ni->mft_no);
-		goto unm_err_out;
+		goto unm_corrupt;
 	}
 	index_end = (u8 *)ia + dir_ni->itype.index.block_size;
 	if (index_end > kaddr + PAGE_SIZE) {
 		ntfs_error(sb,
 			   "Index buffer (VCN 0x%llx) of directory inode 0x%llx crosses page boundary. Impossible! Cannot access! This is probably a bug in the driver.",
 			   vcn, dir_ni->mft_no);
-		goto unm_err_out;
+		goto unm_corrupt;
 	}
 	err = post_read_mst_fixup((struct ntfs_record *)ia,
 				  dir_ni->itype.index.block_size);
@@ -373,14 +378,14 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		ntfs_error(sb,
 			   "MST fixup failed for index block vcn %lld in directory inode 0x%llx.",
 			   vcn, dir_ni->mft_no);
-		goto unm_err_out;
+		goto unm_corrupt;
 	}
 	err = ntfs_index_block_inconsistent(vol, ia,
 					    dir_ni->itype.index.block_size,
 					    vcn, COLLATION_FILE_NAME,
 					    dir_ni->mft_no);
 	if (err)
-		goto unm_err_out;
+		goto unm_corrupt;
 	index_end = (u8 *)&ia->index + le32_to_cpu(ia->index.index_length);
 	/* The first index entry. */
 	ie = (struct index_entry *)((u8 *)&ia->index +
@@ -399,7 +404,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 			break;
 		/* Key length should not be zero if it is not last entry. */
 		if (!ie->key_length)
-			goto unm_err_out;
+			goto unm_corrupt;
 		/*
 		 * We perform a case sensitive comparison and if that matches
 		 * we are done and return the mft reference of the inode (i.e.
@@ -443,7 +448,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 			mref = le64_to_cpu(ie->data.dir.indexed_file);
 			kfree(kaddr);
 			iput(ia_vi);
-			return ntfs_check_mref(mref);
+			return ntfs_check_mref(dir_ni, mref);
 		}
 		/*
 		 * For a case insensitive mount, we also perform a case
@@ -538,7 +543,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 			ntfs_error(sb,
 				"Index entry with child node found in a leaf node in directory inode 0x%llx.",
 				dir_ni->mft_no);
-			goto unm_err_out;
+			goto unm_corrupt;
 		}
 		/* Child node present, descend into it. */
 		old_vcn = vcn;
@@ -558,7 +563,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		}
 		ntfs_error(sb, "Negative child node vcn in directory inode 0x%llx.",
 				dir_ni->mft_no);
-		goto unm_err_out;
+		goto unm_corrupt;
 	}
 	/*
 	 * No child node present, return -ENOENT, unless we have got a matching
@@ -568,15 +573,19 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 	if (name) {
 		kfree(kaddr);
 		iput(ia_vi);
-		return ntfs_check_mref(name->mref);
+		return ntfs_check_mref(dir_ni, name->mref);
 	}
 	ntfs_debug("Entry not found.");
 	err = -ENOENT;
+	goto unm_err_out;
+unm_corrupt:
+	err = -EFSCORRUPTED;
+	report_err = -EFSCORRUPTED;
 unm_err_out:
 	kfree(kaddr);
 err_out:
 	if (!err)
-		err = -EIO;
+		err = -EFSCORRUPTED;
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 	if (m)
@@ -585,8 +594,11 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 	*res = NULL;
 	if (!IS_ERR_OR_NULL(ia_vi))
 		iput(ia_vi);
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(dir_ni), report_err);
 	return ERR_MREF(err);
 dir_err_out:
+	report_err = -EFSCORRUPTED;
 	ntfs_error(sb, "Corrupt directory.  Aborting lookup.");
 	goto err_out;
 }
@@ -654,7 +666,7 @@ static inline int ntfs_filldir(struct ntfs_volume *vol,
 	}
 	mref = MREF_LE(ie->data.dir.indexed_file);
 	if (ie->key.file_name.file_attributes & FILE_ATTR_REPARSE_POINT)
-		dt_type = ntfs_reparse_tag_dt_types(vol, mref);
+		dt_type = ntfs_reparse_tag_dt_types(VFS_I(ndir), mref);
 	else if (ie->key.file_name.file_attributes &
 			FILE_ATTR_DUP_FILE_NAME_INDEX_PRESENT)
 		dt_type = DT_DIR;
@@ -742,6 +754,7 @@ static int ntfs_ia_blocks_readahead(struct ntfs_inode *ia_ni, loff_t pos)
 
 static int ntfs_readdir(struct file *file, struct dir_context *actor)
 {
+	int report_err = 0;
 	struct inode *vdir = file_inode(file);
 	struct super_block *sb = vdir->i_sb;
 	struct ntfs_inode *ndir = NTFS_I(vdir);
@@ -858,12 +871,16 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 	}
 
 	/* Find the index root attribute in the mft record. */
-	if (ntfs_attr_lookup(AT_INDEX_ROOT, I30, 4, CASE_SENSITIVE, 0, NULL, 0,
-				ctx)) {
+	err = ntfs_attr_lookup(AT_INDEX_ROOT, I30, 4, CASE_SENSITIVE, 0,
+			       NULL, 0, ctx);
+	if (err) {
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
+		}
 		ntfs_error(sb, "Index root attribute missing in directory inode %llu",
 				ndir->mft_no);
 		ntfs_attr_put_search_ctx(ctx);
-		err = -ENOMEM;
 		goto out;
 	}
 
@@ -881,7 +898,8 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 	if (ictx->block_size < NTFS_BLOCK_SIZE) {
 		ntfs_error(sb, "Index block size (%d) is smaller than the sector size (%d)",
 				ictx->block_size, NTFS_BLOCK_SIZE);
-		err = -EIO;
+		report_err = -EFSCORRUPTED;
+		err = -EFSCORRUPTED;
 		goto out;
 	}
 
@@ -1047,6 +1065,8 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 	kfree(nir);
 	kfree(ra);
 	mutex_unlock(&ndir->mrec_lock);
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(ndir), report_err);
 	return err;
 }
 
@@ -1068,6 +1088,11 @@ int ntfs_check_empty_dir(struct ntfs_inode *ni, struct mft_record *ni_mrec)
 	ret = ntfs_attr_lookup(AT_INDEX_ROOT, I30, 4, CASE_SENSITIVE, 0, NULL,
 				0, ctx);
 	if (ret) {
+		if (ret == -ENOENT) {
+			ret = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
+		}
 		ntfs_error(ni->vol->sb, "Index root attribute missing in directory inode %llu",
 				ni->mft_no);
 		ntfs_attr_put_search_ctx(ctx);
@@ -1172,8 +1197,13 @@ static int ntfs_dir_fsync(struct file *filp, loff_t start, loff_t end,
 			continue;
 
 		parent_vi = ntfs_iget(vi->i_sb, MREF_LE(fn->parent_directory));
-		if (IS_ERR(parent_vi))
+		if (IS_ERR(parent_vi)) {
+			if (PTR_ERR(parent_vi) == -ENOENT && !NInoBeingDeleted(ni)) {
+				ntfs_report_file_metadata_error(vi,
+								-EFSCORRUPTED);
+			}
 			continue;
+		}
 		mutex_lock_nested(&NTFS_I(parent_vi)->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
 		ia_vi = ntfs_index_iget(parent_vi, I30, 4);
 		mutex_unlock(&NTFS_I(parent_vi)->mrec_lock);
diff --git a/fs/ntfs/reparse.c b/fs/ntfs/reparse.c
index 775e96a43771..f6cac20081e1 100644
--- a/fs/ntfs/reparse.c
+++ b/fs/ntfs/reparse.c
@@ -396,16 +396,19 @@ int ntfs_parse_reparse(struct ntfs_inode *ni, unsigned int *mode)
 	return err;
 }
 
-unsigned int ntfs_reparse_tag_dt_types(struct ntfs_volume *vol, unsigned long mref)
+unsigned int ntfs_reparse_tag_dt_types(struct inode *dir, unsigned long mref)
 {
 	s64 attr_size = 0;
 	struct reparse_point *reparse_attr;
 	unsigned int dt_type = DT_UNKNOWN;
 	struct inode *vi;
 
-	vi = ntfs_iget(vol->sb, mref);
-	if (IS_ERR(vi))
+	vi = ntfs_iget(dir->i_sb, mref);
+	if (IS_ERR(vi)) {
+		if (PTR_ERR(vi) == -ENOENT)
+			ntfs_report_file_metadata_error(dir, -EFSCORRUPTED);
 		return DT_UNKNOWN;
+	}
 
 	reparse_attr = (struct reparse_point *)ntfs_attr_readall(NTFS_I(vi),
 			AT_REPARSE_POINT, NULL, 0, &attr_size);
diff --git a/fs/ntfs/reparse.h b/fs/ntfs/reparse.h
index b6360b0452e6..b81baf196d6c 100644
--- a/fs/ntfs/reparse.h
+++ b/fs/ntfs/reparse.h
@@ -10,7 +10,7 @@
 extern __le16 reparse_index_name[];
 
 int ntfs_parse_reparse(struct ntfs_inode *ni, unsigned int *mode);
-unsigned int ntfs_reparse_tag_dt_types(struct ntfs_volume *vol, unsigned long mref);
+unsigned int ntfs_reparse_tag_dt_types(struct inode *dir, unsigned long mref);
 int ntfs_translate_symlink_path(struct dentry *dentry, const char *target,
 				char **translated);
 int ntfs_reparse_set_wsl_symlink(struct ntfs_inode *ni,
-- 
2.51.0

