Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486015;
	b=FA2RLtcQ+tpBX81deCEq0sxYWAWZ2PaxG8uxpKS9YEu554lR+TLKxglZxo6UKjBVfMFp
	 HkIBUvZye6WFfc5SJNSO7G0OQIiN5IaJe1zsV/rde+JkoRDt9A159Lxf1qWJuB47jZQg8
	 7KDOx7O5pEXkw2k4XfHUqKPottU+BZuDZRL7ay76+Em7o4AoCkggiz8HG1jbVL4QpW1lx
	 /HKQNd+wtkAvxSOEsN/I2Ep0FLK9FSjOkRqeXwesSaRhrRLiocs+/U8PJ3qAKaW6lfC7F
	 ccYItp/yxLoSkEp52NxHcAvmr9rF8zRflOnNJ7FhPQE1GQHRdUIRpo8T/LTnOSjIYcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486015;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=ExfgPxXZELHI0WACB7dhIXWFnHW3NUyTTTGBjoi89Ic=;
	b=12PBIcbRn1WFU7rOh3y65/RsJ28CgXB5Q6jRw2/YjEUqzYxnI+cCi9zmLkb/mm9i21RS
	 DVCakjmCcjLowI7D688xgnZgMsxCdayzvi03BntC5ZvCkUsCkROzInqsge/lNN+5ecc33
	 Ym4d14jqi1KN0IUrcBmlDIUTgs8FyV5jzwvTEVgFBXGh/sQNlOxF5DbxXX+qLqpkwh9qr
	 d6REmZGSJHECpp/2epYOXmMTniyQdfa87ThuLwks026FstqvJ5/gjOxGd4RelS4+1srTG
	 Vcrivypd+O7debOtfrKftXfIRMk9yo01rbutoo4nlpwKBjS6om6snu7unFC0FAAOUHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TGjv+qnF;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B796606A327
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B796606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TGjv+qnF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ex
	fgPxXZELHI0WACB7dhIXWFnHW3NUyTTTGBjoi89Ic=; b=TGjv+qnFJuzmI787An
	UFlraVoQM4JL5Z3E5JMFrt31Urb2jS5QARLIr04/PvqmRD23BDT5CN6qllq86HNX
	7UaA1NRTg43vYSnMB+uoCUAm3gDmiWZzyD26a38YO9y9oi+JVTibHmvCZSw0dw1s
	n1O/6B+nX/LWcHOaL8cVVEnbI=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3X_tvKtdqGocHBg--.23211S7;
	Tue, 20 Oct 2026 16:46:44 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 21/31] ntfs: report directory lookup and metadata corruption
Date: Tue, 20 Oct 2026 16:44:11 +0800
Message-ID: <20261020084421.2196486-22-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3X_tvKtdqGocHBg--.23211S7
X-Coremail-Antispam: 1Uf129KBjvJXoW3KFW7Xw1rZFWfWr45AF4DXFb_yoWDWFWfpF
	ZrG3s3t3yfKry2k3sayFs8ZF1S9a4Ig3yUJrWDAw1Sy3Z5tw12yFW8tFyjgFyrKrWrA3sr
	XF45K3yUGr4UXwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzq2NUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hU4A2rXKnWMAgAA3o

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
 fs/ntfs/dir.c     | 71 ++++++++++++++++++++++++++++++++---------------
 fs/ntfs/reparse.c |  9 ++++--
 fs/ntfs/reparse.h |  2 +-
 3 files changed, 56 insertions(+), 26 deletions(-)

diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index 7854a06a83b5..b54b7eee0c08 100644
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
 
@@ -113,7 +115,9 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 			ntfs_error(sb,
 				"Index root attribute missing in directory inode 0x%llx.",
 				dir_ni->mft_no);
-			err = -EIO;
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(dir_ni),
+							-EFSCORRUPTED);
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
+			ntfs_report_file_metadata_error(VFS_I(dir_ni), err);
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
+	ntfs_report_file_metadata_error(VFS_I(dir_ni), -EFSCORRUPTED);
 unm_err_out:
 	kfree(kaddr);
 err_out:
 	if (!err)
-		err = -EIO;
+		err = -EFSCORRUPTED;
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 	if (m)
@@ -573,6 +583,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		iput(ia_vi);
 	return ERR_MREF(err);
 dir_err_out:
+	ntfs_report_file_metadata_error(VFS_I(dir_ni), -EFSCORRUPTED);
 	ntfs_error(sb, "Corrupt directory.  Aborting lookup.");
 	goto err_out;
 }
@@ -640,7 +651,7 @@ static inline int ntfs_filldir(struct ntfs_volume *vol,
 	}
 	mref = MREF_LE(ie->data.dir.indexed_file);
 	if (ie->key.file_name.file_attributes & FILE_ATTR_REPARSE_POINT)
-		dt_type = ntfs_reparse_tag_dt_types(vol, mref);
+		dt_type = ntfs_reparse_tag_dt_types(VFS_I(ndir), mref);
 	else if (ie->key.file_name.file_attributes &
 			FILE_ATTR_DUP_FILE_NAME_INDEX_PRESENT)
 		dt_type = DT_DIR;
@@ -844,12 +855,17 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 	}
 
 	/* Find the index root attribute in the mft record. */
-	if (ntfs_attr_lookup(AT_INDEX_ROOT, I30, 4, CASE_SENSITIVE, 0, NULL, 0,
-				ctx)) {
+	err = ntfs_attr_lookup(AT_INDEX_ROOT, I30, 4, CASE_SENSITIVE, 0,
+			       NULL, 0, ctx);
+	if (err) {
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(ndir),
+							-EFSCORRUPTED);
+		}
 		ntfs_error(sb, "Index root attribute missing in directory inode %llu",
 				ndir->mft_no);
 		ntfs_attr_put_search_ctx(ctx);
-		err = -ENOMEM;
 		goto out;
 	}
 
@@ -867,7 +883,8 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 	if (ictx->block_size < NTFS_BLOCK_SIZE) {
 		ntfs_error(sb, "Index block size (%d) is smaller than the sector size (%d)",
 				ictx->block_size, NTFS_BLOCK_SIZE);
-		err = -EIO;
+		ntfs_report_file_metadata_error(VFS_I(ndir), -EFSCORRUPTED);
+		err = -EFSCORRUPTED;
 		goto out;
 	}
 
@@ -1054,6 +1071,11 @@ int ntfs_check_empty_dir(struct ntfs_inode *ni, struct mft_record *ni_mrec)
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
@@ -1158,8 +1180,13 @@ static int ntfs_dir_fsync(struct file *filp, loff_t start, loff_t end,
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
index 2a6480211fe3..c05768a49440 100644
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

