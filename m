Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605078;
	b=vB4r8qX77OoMmEHU7BPHafzaCMnqxhmm1UShqK80Utdhi3Wb9HHod0UCgF+NHz6hzwqS
	 nkwY0CRvbYhg9zew0qWeY+lPiCEeTlnSUjy0ryto80r5dCvqACGfuGbzeJ9vKA6S6dr1i
	 eInTAalYOJy9h1gqtH8QsYuSY4EIPu3+i48ye8KsXnsh4+oEFO5BbD2Xpst2xD2XBv/YF
	 iOrIl0EFAzq4Bjijgw6OzX6HtJElMfHywo13QwRcRpTWlOOa6EEd/dN0TsBip4/ofBFlc
	 xEUJwagyT4NOQvKKuxLNo3MCepL2IHoyKdlC5ECkKmRcwKb5tmKZGrHZcRxvHDR+m4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605078;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=C3N+3guxXjv2EN2Xz32g+FCYfq221yUp3aAiUbEz5xY=;
	b=e5gRygH+A1CcKN9Q2Urd7MxG2Li3JEZfy9Dm+VNgKOeB6+BHArEPt/54Lz/HmH/BKXnV
	 k6BssVsrxdfwIJ9u8lIqt1d8/pGLxI2Wg7yJwKRqwR4VPkARmHzqdliZwsslWHJct9zeu
	 a1DCSFjJAzlctA7L4jSZ3uIjIIWG3fdAHIspqHxv3YPv+pV+O5MRMAH0xKFyRhiunqphL
	 az7IYL81TVn6jACGDIfkL4UDq1PF3MbZstC9FviTYU70/MSzvx7Sp7IxtRvLp2AIjl06o
	 F8nsfMJc+3RndddOS5Kb9fhgk7wRWKsnbhPPa1ntUgYomKeReFuhIYOgjUlGJxJDkkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KAvY7OUe;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A3B606A32C
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11A3B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KAvY7OUe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=C3
	N+3guxXjv2EN2Xz32g+FCYfq221yUp3aAiUbEz5xY=; b=KAvY7OUeHO+xVqsmJA
	g8tMuaOnctVpaMj17jiKuMIyVUKcnR2FzHxkagm4Nl+XdxRyrq8rW9uiTXQoFX0y
	McT7pEfn4ADgXUqX3ZHtDqsoO5DX5NY9nBJ6N8f59Rf99oYDihW2Oj6xgKEcWAya
	pJujLBClOElsl/NvWmIMAq3jw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3N9rIPehqahKgEw--.3981S7;
	Mon, 02 Nov 2026 15:37:47 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>
Subject: [PATCH v5 21/31] ntfs: report directory lookup and metadata corruption
Date: Mon,  2 Nov 2026 15:35:22 +0800
Message-Id: <20261102073532.98873-22-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102073532.98873-1-wangxuewen_ky@163.com>
References: <20261102073532.98873-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3N9rIPehqahKgEw--.3981S7
X-Coremail-Antispam: 1Uf129KBjvJXoW3KFW7Xw1rZFWfWr45AF4DXFb_yoWkJr45pF
	ZrG3s3t3yfGry293sayF4DZF1S9a4Ig3y7XrWDCw1Sk3Z5tw12yFW8tFyjgFyrKrWrA3sr
	XF4Yg3yUGw4UZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UWMKNUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzQxXQGroPcwF6gAA3K

From: Dandan Wu <wudandan@kylinos.cn>

Directory lookup and enumeration detect malformed indexes, missing
required attributes and stale references without consistently reporting
them. Report corruption against the directory and use EFSCORRUPTED while
preserving underlying errors and ordinary lookup misses.

Attribute dangling reparse entries to the directory. Report unused
parents during directory fsync except for deleting children, retaining
its existing return behavior.

Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
 fs/ntfs/dir.c     | 75 +++++++++++++++++++++++++++++++++--------------
 fs/ntfs/reparse.c |  9 ++++--
 fs/ntfs/reparse.h |  2 +-
 3 files changed, 60 insertions(+), 26 deletions(-)

diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index 7854a06a83b5..0a86ee60fbc9 100644
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
@@ -320,6 +324,8 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		ntfs_error(sb, "Failed to map directory index page, error %ld.",
 				-PTR_ERR(folio));
 		err = PTR_ERR(folio);
+		if (err == -EIO)
+			report_err = err;
 		goto err_out;
 	}
 
@@ -344,14 +350,14 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
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
@@ -359,14 +365,14 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
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
@@ -385,7 +391,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 			break;
 		/* Key length should not be zero if it is not last entry. */
 		if (!ie->key_length)
-			goto unm_err_out;
+			goto unm_corrupt;
 		/*
 		 * We perform a case sensitive comparison and if that matches
 		 * we are done and return the mft reference of the inode (i.e.
@@ -429,7 +435,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 			mref = le64_to_cpu(ie->data.dir.indexed_file);
 			kfree(kaddr);
 			iput(ia_vi);
-			return ntfs_check_mref(mref);
+			return ntfs_check_mref(dir_ni, mref);
 		}
 		/*
 		 * For a case insensitive mount, we also perform a case
@@ -524,7 +530,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 			ntfs_error(sb,
 				"Index entry with child node found in a leaf node in directory inode 0x%llx.",
 				dir_ni->mft_no);
-			goto unm_err_out;
+			goto unm_corrupt;
 		}
 		/* Child node present, descend into it. */
 		old_vcn = vcn;
@@ -544,7 +550,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		}
 		ntfs_error(sb, "Negative child node vcn in directory inode 0x%llx.",
 				dir_ni->mft_no);
-		goto unm_err_out;
+		goto unm_corrupt;
 	}
 	/*
 	 * No child node present, return -ENOENT, unless we have got a matching
@@ -554,15 +560,19 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
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
@@ -571,8 +581,11 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
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
@@ -640,7 +653,7 @@ static inline int ntfs_filldir(struct ntfs_volume *vol,
 	}
 	mref = MREF_LE(ie->data.dir.indexed_file);
 	if (ie->key.file_name.file_attributes & FILE_ATTR_REPARSE_POINT)
-		dt_type = ntfs_reparse_tag_dt_types(vol, mref);
+		dt_type = ntfs_reparse_tag_dt_types(VFS_I(ndir), mref);
 	else if (ie->key.file_name.file_attributes &
 			FILE_ATTR_DUP_FILE_NAME_INDEX_PRESENT)
 		dt_type = DT_DIR;
@@ -728,6 +741,7 @@ static int ntfs_ia_blocks_readahead(struct ntfs_inode *ia_ni, loff_t pos)
 
 static int ntfs_readdir(struct file *file, struct dir_context *actor)
 {
+	int report_err = 0;
 	struct inode *vdir = file_inode(file);
 	struct super_block *sb = vdir->i_sb;
 	struct ntfs_inode *ndir = NTFS_I(vdir);
@@ -844,12 +858,16 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
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
 
@@ -867,7 +885,8 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 	if (ictx->block_size < NTFS_BLOCK_SIZE) {
 		ntfs_error(sb, "Index block size (%d) is smaller than the sector size (%d)",
 				ictx->block_size, NTFS_BLOCK_SIZE);
-		err = -EIO;
+		report_err = -EFSCORRUPTED;
+		err = -EFSCORRUPTED;
 		goto out;
 	}
 
@@ -1033,6 +1052,8 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 	kfree(nir);
 	kfree(ra);
 	mutex_unlock(&ndir->mrec_lock);
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(ndir), report_err);
 	return err;
 }
 
@@ -1054,6 +1075,11 @@ int ntfs_check_empty_dir(struct ntfs_inode *ni, struct mft_record *ni_mrec)
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
@@ -1158,8 +1184,13 @@ static int ntfs_dir_fsync(struct file *filp, loff_t start, loff_t end,
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

