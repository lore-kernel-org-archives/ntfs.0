Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605162;
	b=FMMgNSUR18mhKIbFT611S0LWx/oY/SD+sD+b8fvx2EDEa6oc2ciKe/odrfDHX6LRsY4r
	 hoLPLpJj3pO+s6Ydh4Up2WH152tPf+eFrBOOJOKuCtER5/JWdbZoPE/Nh6U3N2E/z8Fdx
	 TXVeTLL2aC+bvVfN3A2HzvVJvze5q3pzBo+ZDKznLX6h5dOdqXm/UK8uwPDr9YKoRUy+Q
	 +SNWR7IwbzSyf7cCZtRFncrXPs4YWY4cp3nPmu//zcShFEj5W/svXSjDdcbDtbnXHXgzj
	 wUZC6TOzeDbaZcLcKgNOHBYi39AXU4CZKhJU9CZUw5c3SwgGo9pp04VwE2HXd4zSZ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605162;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=UZkhM64B3iVTj0d2Nfd0iog7sOl8qjtMQX36hh/0U30=;
	b=jJdBYgYHrv2FnwvGKX+vYDhnCAMSYcOTEvR+sDvJI/AZjnfhMwWNJl/fmdRxBsptqtLv
	 APCZeT0vZ9J2Xz0m3GUjomNfdbOOJHw5cQCwAgRy2BK+dITiInNUeI1cY+Z5guNfcLtN8
	 H9PpmwHu6Dcy5OjNRDJ1s5I7U2TfDEXl86BlI/WQPS2TFz2xnFYvxmMsH/hxKwktov4Ci
	 4WY0QiNVNuULm4B9svQ4EeaafHT3biw64ubpmPk+Pd2xEzeIdhD0pFrhBvO/1ye/inhjs
	 DCSFX5WQF9XtpfIVOQMzXxyzXMGG8MMEg+swknyUcl6F7MSPoljEy58ewB3mkWKOINQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="E8PGOw/W";
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416C760A2629
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 416C760A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=E8PGOw/W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=UZ
	khM64B3iVTj0d2Nfd0iog7sOl8qjtMQX36hh/0U30=; b=E8PGOw/WG0/5pitMpn
	jUl2H7GLR55T0xdp3fPec3z7c1ooGqkmhYrdra/XzNeRHR/6Mg/4EFh/NxQf35X7
	qWNmRl6EZnD79dNAMj5jUvM16oRK31vAcbN2wEVAmlwy+HcSCHcc/ZPlFmYlGU3f
	b1FIGol8tNHX3KDYKWpkVczRg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3nygJPuhqucJHEg--.56690S8;
	Mon, 02 Nov 2026 15:38:53 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v5 30/31] ntfs: report reparse and object ID metadata errors
Date: Mon,  2 Nov 2026 15:35:31 +0800
Message-Id: <20261102073532.98873-31-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3nygJPuhqucJHEg--.56690S8
X-Coremail-Antispam: 1Uf129KBjvJXoWfGw4kXryrCF4kXr13Jr43Jrb_yoWDuryUpF
	9rGwn3t3yxtr1I9392ya1jvr13Kw1Ig3yUGrZ3J3WSy3WYvr18tF42qryYgryFkrW8A3sx
	tF45J398CF4UXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UWMKNUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzQ1nUGroPg0L8wAA3+

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
 fs/ntfs/object_id.c | 50 ++++++++++++++++++------
 fs/ntfs/reparse.c   | 93 ++++++++++++++++++++++++++++++++++++---------
 2 files changed, 113 insertions(+), 30 deletions(-)

diff --git a/fs/ntfs/object_id.c b/fs/ntfs/object_id.c
index 89002c3759df..557c58fc6d11 100644
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
@@ -99,22 +109,38 @@ static struct ntfs_index_context *open_object_id_index(struct ntfs_volume *vol)
  */
 static int remove_object_id_index(struct ntfs_inode *ni, struct ntfs_index_context *xo)
 {
+	int report_err = 0;
 	struct object_id_index_key key = {0};
 	s64 size;
+	int err;
 
-	if (ni->data_size == 0)
-		return -ENODATA;
+	if (ni->data_size == 0) {
+		report_err = -EFSCORRUPTED;
+		err = -EFSCORRUPTED;
+		goto out;
+	}
 
 	/* read the existing object id attribute */
 	size = ntfs_inode_attr_pread(VFS_I(ni), 0, sizeof(struct guid),
 				     (char *)&key);
-	if (size != sizeof(struct guid))
-		return -ENODATA;
+	if (size != sizeof(struct guid)) {
+		if (size >= 0 || size == -EIO)
+			report_err = size < 0 ? (int)size : -EFSCORRUPTED;
+		err = size < 0 ? size : -EFSCORRUPTED;
+		goto out;
+	}
 
-	if (!ntfs_index_lookup(&key, sizeof(struct object_id_index_key), xo))
+	err = ntfs_index_lookup(&key, sizeof(struct object_id_index_key), xo);
+	if (!err)
 		return ntfs_index_rm(xo);
-
-	return 0;
+	if (err == -ENOENT)
+		report_err = -EFSCORRUPTED;
+
+	err = 0;
+out:
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(ni), report_err);
+	return err;
 }
 
 /*
@@ -139,7 +165,7 @@ int ntfs_delete_object_id_index(struct ntfs_inode *ni)
 	/*
 	 * read the existing object id and un-index it
 	 */
-	xo = open_object_id_index(ni->vol);
+	xo = open_object_id_index(ni);
 	if (xo) {
 		xoni = xo->idx_ni;
 		mutex_lock_nested(&xoni->mrec_lock, NTFS_EXTEND_MUTEX_PARENT);
diff --git a/fs/ntfs/reparse.c b/fs/ntfs/reparse.c
index f6cac20081e1..d3cd1d28fc6e 100644
--- a/fs/ntfs/reparse.c
+++ b/fs/ntfs/reparse.c
@@ -586,6 +586,7 @@ static int set_reparse_index(struct ntfs_inode *ni, struct ntfs_index_context *x
 static int remove_reparse_index(struct inode *rp, struct ntfs_index_context *xr,
 				__le32 *preparse_tag)
 {
+	int report_err = 0;
 	struct reparse_index_key key;
 	u64 file_id_cpu;
 	__le64 file_id;
@@ -598,26 +599,39 @@ static int remove_reparse_index(struct inode *rp, struct ntfs_index_context *xr,
 
 	/* read the existing reparse_tag */
 	size = ntfs_inode_attr_pread(rp, 0, 4, (char *)preparse_tag);
-	if (size != 4)
-		return -ENODATA;
+	if (size != 4) {
+		if (size >= 0 || size == -EIO)
+			report_err = size < 0 ? (int)size : -EFSCORRUPTED;
+		ret = size < 0 ? size : -EFSCORRUPTED;
+		goto out;
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
+		report_err = -EFSCORRUPTED;
 	}
+out:
+	if (report_err)
+		ntfs_report_file_metadata_error(rp, report_err);
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
@@ -628,14 +642,19 @@ static struct ntfs_index_context *open_reparse_index(struct ntfs_volume *vol)
 
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
@@ -644,16 +663,30 @@ static struct ntfs_index_context *open_reparse_index(struct ntfs_volume *vol)
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
@@ -678,8 +711,14 @@ static int update_reparse_data(struct ntfs_inode *ni, struct ntfs_index_context
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
@@ -693,19 +732,26 @@ static int update_reparse_data(struct ntfs_inode *ni, struct ntfs_index_context
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
@@ -732,14 +778,24 @@ int ntfs_delete_reparse_index(struct ntfs_inode *ni)
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
@@ -785,9 +841,10 @@ static int ntfs_set_ntfs_reparse_data(struct ntfs_inode *ni, char *value, size_t
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
 
 	err = ntfs_attr_exist(ni, AT_REPARSE_POINT, AT_UNNAMED, 0);

