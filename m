Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486083;
	b=YtuqJSGlrmrGErwW1ogWJk+W2EXwIsw3AjazSZrpuAPn7DshVP77bYkNd/oqBlqTz+jF
	 C176jd+QGHXd4YynHC9tvX+N0b6DqfCXlQSgroG/Xeui4SStZIPwI+CiGK2mOTeNjpi05
	 op02kcJY49TNByEMsT2JrUhY/9GeFml08aGDPDtvZsY8rxxNDmixzl1D8RLe4ffoNwjds
	 9gqTHCsj6gEOiBgOZj3MyN2Xi3tI17g0n06fNiR8TrQQoNDz7CTDu0z0HeMhdVU5fGoGv
	 8ARp3czRXUxahHgm2Xq0l4Xkr9BaI5WSsIx8FyziBprDwOJY613v6j9gHCVda0wjUqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486083;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=aXENEXjwtgZ7tLM7yqI+DBuwXtRjLS7fmgJEmi4RChg=;
	b=hkj0oplkpfHtFBlgvHDkceMZndjDvl3JcEmWXVuc/Sz4fvGcfcL7M9ifgyiurFmlZV6d
	 /db9cPx6QNJYfUkL24tgqaj6h5s67xV7GckTBTNpuTqVrCQWuXdpvj7+TPSrZuciOmSW0
	 /1owQjHcd0fg60CKs2hkn6OWUjHnnzE25nbaUrMDx1UQULj03lPohb/PGXQkck3u9dnFa
	 zNqwBFDEtJwxAL5nVYJYZ3DhXLu8Y4M7DqZkhSWkBLJ95km5fGR7BmRJ5996oEV7EOiwF
	 TDX43U/NfCkZBn3ffTqKocv+g7RN2yEWCnJARPhkb198LkNwxCHlQdvBHxW7NWkSW8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="I/nIuIq8";
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE32A60A3802
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE32A60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=I/nIuIq8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=aX
	ENEXjwtgZ7tLM7yqI+DBuwXtRjLS7fmgJEmi4RChg=; b=I/nIuIq8ZQ+UtIu2Kp
	o0yd3fdrQfHRoQ88PcTdmweukzGW9FLG/6gIgnkGSnzzP8jMQZ/DWv7Jyhx4EqGg
	KNa+aXKSVJf/5EbJXX4QhB4z67kCkkKdmTwoIn3eBAwpJadHVFFOIzKdSAjQTZpL
	vWHmLVqLxk5LGBvlkFx1deoBM=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3t62yKtdqN_ayBQ--.9980S8;
	Tue, 20 Oct 2026 16:47:52 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 30/31] ntfs: report reparse and object ID metadata errors
Date: Tue, 20 Oct 2026 16:44:20 +0800
Message-ID: <20261020084421.2196486-31-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3t62yKtdqN_ayBQ--.9980S8
X-Coremail-Antispam: 1Uf129KBjvJXoWfGw4kCFW3Zr1DJrW7WrykZrb_yoWDWrW5pF
	9rG3s7t3yxtr1I9392ya1UZr13Kw1Ig3yUGrWfA3WSy3WYvw10yF42qryFgryFkrW8J3sx
	JF45J3y5AF4UXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzq2NUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RlJFGrXKrl27AAA3Z

From: Xuewen Wang <wangxuewen@kylinos.cn>

Report missing required reparse/ObjectID indexes or entries, short stored
values and missing reparse attributes. Use EFSCORRUPTED for corruption
while preserving read errors. Keep new zero-tag reparse placeholders
valid before index insertion.

Return error pointers from reparse-index lookup to preserve specific
errors instead of replacing them with EINVAL. Retain best-effort handling
of index-removal lookup failures.

Report failed reparse writes when replacing existing data or after a
partial write, and failures in the existing index-insertion rollback.
Keep the initiating error separate from cleanup errors.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 fs/ntfs/object_id.c | 40 +++++++++++++++-----
 fs/ntfs/reparse.c   | 89 ++++++++++++++++++++++++++++++++++++---------
 2 files changed, 101 insertions(+), 28 deletions(-)

diff --git a/fs/ntfs/object_id.c b/fs/ntfs/object_id.c
index 89002c3759df..2a1b0f6910fc 100644
--- a/fs/ntfs/object_id.c
+++ b/fs/ntfs/object_id.c
@@ -37,15 +37,16 @@ __le16 objid_index_name[] = {cpu_to_le16('$'), cpu_to_le16('O'), 0};
 
 /*
  * open_object_id_index - Open the $Extend/$ObjId file and its index
- * @vol: NTFS volume structure
+ * @ni: NTFS inode with an existing object ID attribute
  *
  * Opens the $ObjId system file and retrieves its index context.
  *
  * Return: The index context if opened successfully, or NULL if an error
  *	   occurred.
  */
-static struct ntfs_index_context *open_object_id_index(struct ntfs_volume *vol)
+static struct ntfs_index_context *open_object_id_index(struct ntfs_inode *ni)
 {
+	struct ntfs_volume *vol = ni->vol;
 	struct inode *dir_vi, *vi;
 	struct ntfs_inode *dir_ni;
 	struct ntfs_index_context *xo = NULL;
@@ -62,6 +63,8 @@ static struct ntfs_index_context *open_object_id_index(struct ntfs_volume *vol)
 	/* do not use path_name_to inode - could reopen root */
 	dir_vi = ntfs_iget(vol->sb, FILE_Extend);
 	if (IS_ERR(dir_vi)) {
+		if (vol->major_ver >= 3 && PTR_ERR(dir_vi) == -ENOENT)
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 		kmem_cache_free(ntfs_name_cache, uname);
 		return NULL;
 	}
@@ -72,12 +75,19 @@ static struct ntfs_index_context *open_object_id_index(struct ntfs_volume *vol)
 	mutex_unlock(&dir_ni->mrec_lock);
 	kfree(name);
 	kmem_cache_free(ntfs_name_cache, uname);
-	if (IS_ERR_MREF(mref))
+	if (IS_ERR_MREF(mref)) {
+		if (MREF_ERR(mref) == -ENOENT)
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
 		goto put_dir_vi;
+	}
 
 	vi = ntfs_iget(vol->sb, MREF(mref));
-	if (IS_ERR(vi))
+	if (IS_ERR(vi)) {
+		if (PTR_ERR(vi) == -ENOENT)
+			ntfs_report_file_metadata_error(dir_vi, -EFSCORRUPTED);
 		goto put_dir_vi;
+	}
 
 	xo = ntfs_index_ctx_get(NTFS_I(vi), objid_index_name, 2);
 	if (!xo)
@@ -101,18 +111,28 @@ static int remove_object_id_index(struct ntfs_inode *ni, struct ntfs_index_conte
 {
 	struct object_id_index_key key = {0};
 	s64 size;
+	int err;
 
-	if (ni->data_size == 0)
-		return -ENODATA;
+	if (ni->data_size == 0) {
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
+		return -EFSCORRUPTED;
+	}
 
 	/* read the existing object id attribute */
 	size = ntfs_inode_attr_pread(VFS_I(ni), 0, sizeof(struct guid),
 				     (char *)&key);
-	if (size != sizeof(struct guid))
-		return -ENODATA;
+	if (size != sizeof(struct guid)) {
+		if (size >= 0 || size == -EIO)
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							size < 0 ? (int)size : -EFSCORRUPTED);
+		return size < 0 ? size : -EFSCORRUPTED;
+	}
 
-	if (!ntfs_index_lookup(&key, sizeof(struct object_id_index_key), xo))
+	err = ntfs_index_lookup(&key, sizeof(struct object_id_index_key), xo);
+	if (!err)
 		return ntfs_index_rm(xo);
+	if (err == -ENOENT)
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
 
 	return 0;
 }
@@ -139,7 +159,7 @@ int ntfs_delete_object_id_index(struct ntfs_inode *ni)
 	/*
 	 * read the existing object id and un-index it
 	 */
-	xo = open_object_id_index(ni->vol);
+	xo = open_object_id_index(ni);
 	if (xo) {
 		xoni = xo->idx_ni;
 		mutex_lock_nested(&xoni->mrec_lock, NTFS_EXTEND_MUTEX_PARENT);
diff --git a/fs/ntfs/reparse.c b/fs/ntfs/reparse.c
index c05768a49440..1d076ecc2f9a 100644
--- a/fs/ntfs/reparse.c
+++ b/fs/ntfs/reparse.c
@@ -598,26 +598,36 @@ static int remove_reparse_index(struct inode *rp, struct ntfs_index_context *xr,
 
 	/* read the existing reparse_tag */
 	size = ntfs_inode_attr_pread(rp, 0, 4, (char *)preparse_tag);
-	if (size != 4)
-		return -ENODATA;
+	if (size != 4) {
+		if (size >= 0 || size == -EIO)
+			ntfs_report_file_metadata_error(rp,
+							size < 0 ? (int)size : -EFSCORRUPTED);
+		return size < 0 ? size : -EFSCORRUPTED;
+	}
 
 	file_id_cpu = MK_MREF(ni->mft_no, ni->seq_no);
 	file_id = cpu_to_le64(file_id_cpu);
 	key.reparse_tag = *preparse_tag;
 	/* danger on processors which require proper alignment! */
 	memcpy(&key.file_id, &file_id, 8);
-	if (!ntfs_index_lookup(&key, sizeof(struct reparse_index_key), xr)) {
+	err = ntfs_index_lookup(&key, sizeof(struct reparse_index_key), xr);
+	if (!err) {
 		err = ntfs_index_rm(xr);
 		if (err)
 			ret = err;
+	} else if (err == -ENOENT && *preparse_tag) {
+		/* A newly created attribute has a zero tag and is not indexed yet. */
+		ntfs_report_file_metadata_error(rp, -EFSCORRUPTED);
 	}
 	return ret;
 }
 
 /*
  * Open the $Extend/$Reparse file and its index
+ * @inode is non-NULL when existing reparse metadata requires the index.
  */
-static struct ntfs_index_context *open_reparse_index(struct ntfs_volume *vol)
+static struct ntfs_index_context *open_reparse_index(struct ntfs_volume *vol,
+						     struct inode *inode)
 {
 	struct ntfs_index_context *xr = NULL;
 	u64 mref;
@@ -628,14 +638,19 @@ static struct ntfs_index_context *open_reparse_index(struct ntfs_volume *vol)
 
 	/* do not use path_name_to inode - could reopen root */
 	dir_vi = ntfs_iget(vol->sb, FILE_Extend);
-	if (IS_ERR(dir_vi))
-		return NULL;
+	if (IS_ERR(dir_vi)) {
+		if (vol->major_ver >= 3 && PTR_ERR(dir_vi) == -ENOENT) {
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
+			dir_vi = ERR_PTR(-EFSCORRUPTED);
+		}
+		return ERR_CAST(dir_vi);
+	}
 
 	uname_len = ntfs_nlstoucs(vol, "$Reparse", 8, &uname,
 				  NTFS_MAX_NAME_LEN);
 	if (uname_len < 0) {
 		iput(dir_vi);
-		return NULL;
+		return ERR_PTR(uname_len);
 	}
 
 	mutex_lock_nested(&NTFS_I(dir_vi)->mrec_lock, NTFS_EXTEND_MUTEX_PARENT);
@@ -644,16 +659,30 @@ static struct ntfs_index_context *open_reparse_index(struct ntfs_volume *vol)
 	mutex_unlock(&NTFS_I(dir_vi)->mrec_lock);
 	kfree(name);
 	kmem_cache_free(ntfs_name_cache, uname);
-	if (IS_ERR_MREF(mref))
+	if (IS_ERR_MREF(mref)) {
+		if (MREF_ERR(mref) == -ENOENT && inode) {
+			ntfs_report_file_metadata_error(inode, -EFSCORRUPTED);
+			mref = ERR_MREF(-EFSCORRUPTED);
+		}
+		xr = ERR_PTR(MREF_ERR(mref));
 		goto put_dir_vi;
+	}
 
 	vi = ntfs_iget(vol->sb, MREF(mref));
-	if (IS_ERR(vi))
+	if (IS_ERR(vi)) {
+		if (PTR_ERR(vi) == -ENOENT) {
+			ntfs_report_file_metadata_error(dir_vi, -EFSCORRUPTED);
+			vi = ERR_PTR(-EFSCORRUPTED);
+		}
+		xr = ERR_CAST(vi);
 		goto put_dir_vi;
+	}
 
 	xr = ntfs_index_ctx_get(NTFS_I(vi), reparse_index_name, 2);
-	if (!xr)
+	if (!xr) {
 		iput(vi);
+		xr = ERR_PTR(-ENOMEM);
+	}
 put_dir_vi:
 	iput(dir_vi);
 	return xr;
@@ -678,8 +707,14 @@ static int update_reparse_data(struct ntfs_inode *ni, struct ntfs_index_context
 	struct ntfs_inode *rp_ni;
 
 	rp_inode = ntfs_attr_iget(VFS_I(ni), AT_REPARSE_POINT, AT_UNNAMED, 0);
-	if (IS_ERR(rp_inode))
+	if (IS_ERR(rp_inode)) {
+		if (PTR_ERR(rp_inode) == -ENOENT) {
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
+			rp_inode = ERR_PTR(-EFSCORRUPTED);
+		}
 		return PTR_ERR(rp_inode);
+	}
 	rp_ni = NTFS_I(rp_inode);
 
 	/* remove the existing reparse data */
@@ -693,19 +728,26 @@ static int update_reparse_data(struct ntfs_inode *ni, struct ntfs_index_context
 	written = ntfs_inode_attr_pwrite(rp_inode, 0, size, value, false);
 	if (written != size) {
 		ntfs_error(ni->vol->sb, "Failed to update reparse data\n");
-		err = -EIO;
+		if (oldsize > 0 || written > 0)
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							written < 0 ? (int)written : -EIO);
+		err = written < 0 ? written : -EIO;
 		goto put_rp_inode;
 	}
 
 	err = set_reparse_index(ni, xr,
 				((const struct reparse_point *)value)->reparse_tag);
 	if (err && oldsize > 0) {
+		int rollback_err;
+
 		/*
 		 * If cannot index, try to remove the reparse
 		 * data and log the error. There will be an
 		 * inconsistency if removal fails.
 		 */
-		ntfs_attr_rm(rp_ni);
+		rollback_err = ntfs_attr_rm(rp_ni);
+		if (rollback_err)
+			ntfs_report_file_metadata_error(VFS_I(ni), rollback_err);
 		ntfs_error(ni->vol->sb,
 			   "Failed to index reparse data. Possible corruption.\n");
 	}
@@ -732,14 +774,24 @@ int ntfs_delete_reparse_index(struct ntfs_inode *ni)
 		return 0;
 
 	vi = ntfs_attr_iget(VFS_I(ni), AT_REPARSE_POINT, AT_UNNAMED, 0);
-	if (IS_ERR(vi))
+	if (IS_ERR(vi)) {
+		if (PTR_ERR(vi) == -ENOENT) {
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
+			vi = ERR_PTR(-EFSCORRUPTED);
+		}
 		return PTR_ERR(vi);
+	}
 
 	/*
 	 * read the existing reparse data (the tag is enough)
 	 * and un-index it
 	 */
-	xr = open_reparse_index(ni->vol);
+	xr = open_reparse_index(ni->vol, VFS_I(ni));
+	if (IS_ERR(xr)) {
+		err = PTR_ERR(xr);
+		goto out;
+	}
 	if (xr) {
 		xrni = xr->idx_ni;
 		mutex_lock_nested(&xrni->mrec_lock, NTFS_EXTEND_MUTEX_PARENT);
@@ -785,9 +837,10 @@ static int ntfs_set_ntfs_reparse_data(struct ntfs_inode *ni, char *value, size_t
 	if (valid_reparse_data(ni, (const struct reparse_point *)value, size) == false)
 		return -EINVAL;
 
-	xr = open_reparse_index(ni->vol);
-	if (!xr)
-		return -EINVAL;
+	xr = open_reparse_index(ni->vol,
+				ni->flags & FILE_ATTR_REPARSE_POINT ? VFS_I(ni) : NULL);
+	if (IS_ERR(xr))
+		return PTR_ERR(xr);
 	xrni = xr->idx_ni;
 
 	if (!ntfs_attr_exist(ni, AT_REPARSE_POINT, AT_UNNAMED, 0)) {
-- 
2.51.0

