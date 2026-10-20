Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485946;
	b=RgDl63UFcf6ckMi5ovU5fq28dqH6VIuw5L/huct6MljiCi1B1xOXhqH5GozAUyLBmL4k
	 FWMlDLPcoafI3KjDQAqLsuKqCftMr/KMaZf5J2frF4WG7yMCLsIZUyt/tUFXCkmrUF5pP
	 cSK3VoVjkDSzw088lUVtr6aU5zNL0LqPv38vzygcHNMKbSN+CeBFJRnn542/RbRUG3718
	 ZWwI5Xq04GaCeL4GFYsHqJlAwBz2GBx67Aj324Tzbedot9L74nPNlMCydNQ+XVDKWRkjH
	 O/LBrOsvUsvxILv7BJEwjKGflYkTktUSvP/NVLRbrrUgHro2fGV1cZvnO8ud8GGI4GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485946;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=oxkfujyVc2eQy1/MpqOq6I/E5Mjp0uEQpe4Bwk+hZek=;
	b=2vKa0Sdcucu9PDPSAMaqLuGkTVwBOTKN8b7JQb3fYct2ZsyIFHYXr6iujjEvTjeeNRky
	 IkNd6vhpaAm55D4xSDREjZgEYHpwaoufRayjqbaZ+QKf2zIUDYJZ7+IlmAgrTzbNp0kfX
	 8VhcUJEmVa2FqQv0XYG3+7+DAPnFSWwe7mo5DrScag1WD/Do7+hIWMmta6/5cStBQPc7N
	 usDhNJzZE6yQFJ7oOwkDWfhXAH6eW0YHE51rzRIKMiXlTaagP+LokC2Ha+u2r4PRo1YtY
	 Jhoay2KpptdcyQYB3tEVTe34G/194zb5PzJHzSbj4M6P65PxDKACvrOd0aTyn6Hk//A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=enChBHj4;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4605760A2610
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4605760A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=enChBHj4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ox
	kfujyVc2eQy1/MpqOq6I/E5Mjp0uEQpe4Bwk+hZek=; b=enChBHj4q0rxqCq+Ep
	xtbaFql+Fy1sn7Zpb5Yo3PNatwyEX0Xyd/IXBMxarNUzmKJYOhoxJ8OFa6sr2eWK
	SEHyB+CMP15C9XCOUmSNGGAqj8xg7E6kUR8QvbrGvJqhndr92ZT0LSIaAd9wm+rc
	hZFilvPns2rlJ2t0jg9pAw0Nk=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3n0ksKtdq7UkHBg--.56105S6;
	Tue, 20 Oct 2026 16:45:36 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 12/31] ntfs: report attribute lookup and validation errors
Date: Tue, 20 Oct 2026 16:44:02 +0800
Message-ID: <20261020084421.2196486-13-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3n0ksKtdq7UkHBg--.56105S6
X-Coremail-Antispam: 1Uf129KBjvJXoW3ZF18GryrZFyDGr13Zry7Jrb_yoWkJw1kpF
	9xG3srKw43Jr12g392y347Zw1SvFyxWr18XryxJw1Ivan8tw17tFW8tFy09FyfKry8Gw1r
	Xr4Ut3y7Zw47ZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwmiiUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hEn8WrXKjF9TAAA36

From: Baolin Liu <liubaolin@kylinos.cn>

Attribute lookup and reading can detect malformed records and lists,
invalid stored flags or sizes, and short metadata reads without reporting
them. Report corruption against the base file and use EFSCORRUPTED.

Report missing required attributes and missing AttrDef definitions while
preserving underlying errors, ordinary lookup misses and size-limit
results.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/attrib.c | 86 +++++++++++++++++++++++++++++++++---------------
 fs/ntfs/attrib.h |  4 +--
 2 files changed, 62 insertions(+), 28 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 07fb1c77c7af..9eafa87dce7b 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -894,7 +894,7 @@ static bool ntfs_attr_value_is_valid(struct ntfs_volume *vol,
  * @ctx->attr will point to the attribute before which the attribute being
  * searched for would need to be inserted if such an action were to be desired.
  *
- * On actual error, ntfs_attr_find() returns -EIO.  In this case @ctx->attr is
+ * On actual error, ntfs_attr_find() returns -EFSCORRUPTED.  In this case @ctx->attr is
  * undefined and in particular do not rely on it not changing.
  *
  * If @ctx->is_first is 'true', the search begins with @ctx->attr itself.  If it
@@ -932,6 +932,7 @@ static int ntfs_attr_find(const __le32 type, const __le16 *name,
 		const u8 *val, const u32 val_len, struct ntfs_attr_search_ctx *ctx)
 {
 	struct attr_record *a;
+	struct ntfs_inode *base_ni;
 	struct ntfs_volume *vol = ctx->ntfs_ino->vol;
 	__le16 *upcase = vol->upcase;
 	u32 upcase_len = vol->upcase_len;
@@ -1058,8 +1059,9 @@ static int ntfs_attr_find(const __le32 type, const __le16 *name,
 	}
 	ntfs_error(vol->sb, "mft %#llx, type %#x is corrupt. Run chkdsk.",
 		   (long long)ctx->ntfs_ino->mft_no, le32_to_cpu(type));
-	NVolSetErrors(vol);
-	return -EIO;
+	base_ni = ntfs_inode_base(ctx->ntfs_ino);
+	ntfs_report_file_metadata_error(VFS_I(base_ni), -EFSCORRUPTED);
+	return -EFSCORRUPTED;
 }
 
 void ntfs_attr_name_free(unsigned char **name)
@@ -1157,31 +1159,42 @@ bool ntfs_attr_list_is_valid(const u8 *al_start, s64 size)
 int load_attribute_list(struct ntfs_inode *base_ni, u8 *al_start, const s64 size)
 {
 	struct inode *attr_vi = NULL;
+	s64 read;
 
 	if (!al_start || size <= 0)
 		return -EINVAL;
 
 	attr_vi = ntfs_attr_iget(VFS_I(base_ni), AT_ATTRIBUTE_LIST, AT_UNNAMED, 0);
 	if (IS_ERR(attr_vi)) {
+		if (PTR_ERR(attr_vi) == -ENOENT) {
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+			attr_vi = ERR_PTR(-EFSCORRUPTED);
+		}
 		ntfs_error(base_ni->vol->sb,
 			   "Failed to open an inode for Attribute list, mft = %llu",
 			   base_ni->mft_no);
 		return PTR_ERR(attr_vi);
 	}
 
-	if (ntfs_inode_attr_pread(attr_vi, 0, size, al_start) != size) {
+	read = ntfs_inode_attr_pread(attr_vi, 0, size, al_start);
+	if (read != size) {
+		if (read >= 0)
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
 		iput(attr_vi);
 		ntfs_error(base_ni->vol->sb,
 			   "Failed to read attribute list, mft = %llu",
 			   base_ni->mft_no);
-		return -EIO;
+		return read < 0 ? read : -EFSCORRUPTED;
 	}
 	iput(attr_vi);
 
 	if (!ntfs_attr_list_is_valid(al_start, size)) {
+		ntfs_report_file_metadata_error(VFS_I(base_ni), -EFSCORRUPTED);
 		ntfs_error(base_ni->vol->sb, "Corrupt attribute list, mft = %llu",
 			   base_ni->mft_no);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 	return 0;
 }
@@ -1233,7 +1246,7 @@ int load_attribute_list(struct ntfs_inode *base_ni, u8 *al_start, const s64 size
  * attribute list entry for the inserted attribute should be inserted in the
  * attribute list attribute at @ctx->al_entry.
  *
- * On actual error, ntfs_external_attr_find() returns -EIO.  In this case
+ * On actual error, ntfs_external_attr_find() returns -EFSCORRUPTED.  In this case
  * @ctx->attr is undefined and in particular do not rely on it not changing.
  */
 static int ntfs_external_attr_find(const __le32 type,
@@ -1355,7 +1368,9 @@ static int ntfs_external_attr_find(const __le32 type,
 
 			/* Not found?!? Absurd! */
 			ntfs_error(ctx->ntfs_ino->vol->sb, "Attribute list wasn't found");
-			return -EIO;
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+			return -EFSCORRUPTED;
 		}
 	}
 	for (;; al_entry = next_al_entry) {
@@ -1454,7 +1469,8 @@ static int ntfs_external_attr_find(const __le32 type,
 				ntfs_error(vol->sb,
 					"Found stale mft reference in attribute list of base inode 0x%llx.%s",
 					base_ni->mft_no, es);
-				err = -EIO;
+
+				err = -EFSCORRUPTED;
 				break;
 			}
 		} else { /* Mft references do not match. */
@@ -1479,7 +1495,7 @@ static int ntfs_external_attr_find(const __le32 type,
 							base_ni->mft_no, es);
 					err = PTR_ERR(ctx->mrec);
 					if (err == -ENOENT)
-						err = -EIO;
+						err = -EFSCORRUPTED;
 					/* Cause @ctx to be sanitized below. */
 					ni = NULL;
 					break;
@@ -1533,7 +1549,7 @@ static int ntfs_external_attr_find(const __le32 type,
 		/*
 		 * If the type and/or the name are mismatched between the
 		 * attribute list entry and the attribute record, there is
-		 * corruption so we break and return error EIO.
+		 * corruption so we break and return error EFSCORRUPTED.
 		 */
 		if (al_entry->type != a->type)
 			break;
@@ -1592,11 +1608,17 @@ static int ntfs_external_attr_find(const __le32 type,
 			"Base inode 0x%llx contains corrupt attribute, mft %#llx, type %#x. %s",
 			(long long)base_ni->mft_no, (long long)mft_no, type,
 			"Unmount and run chkdsk.");
-		err = -EIO;
+
+		err = -EFSCORRUPTED;
 	}
 
-	if (err != -ENOMEM)
-		NVolSetErrors(vol);
+	if (err != -ENOMEM) {
+		if (err != -EINTR && err != -ERESTARTSYS)
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							err);
+		else
+			NVolSetErrors(vol);
+	}
 	return err;
 not_found:
 	/*
@@ -1824,8 +1846,8 @@ void ntfs_attr_put_search_ctx(struct ntfs_attr_search_ctx *ctx)
  *
  * Return the attribute type definition record if found and NULL if not found.
  */
-static struct attr_def *ntfs_attr_find_in_attrdef(const struct ntfs_volume *vol,
-		const __le32 type)
+static struct attr_def *ntfs_attr_find_in_attrdef(struct ntfs_volume *vol,
+						  const __le32 type)
 {
 	struct attr_def *ad;
 
@@ -1841,7 +1863,8 @@ static struct attr_def *ntfs_attr_find_in_attrdef(const struct ntfs_volume *vol,
 		/* We have gone too far already.  No point in continuing. */
 		break;
 	}
-	/* Attribute not found. */
+	/* The requested attribute type must have a definition on this volume. */
+	ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 	ntfs_debug("Attribute type 0x%x not found in $AttrDef.",
 			le32_to_cpu(type));
 	return NULL;
@@ -1856,8 +1879,8 @@ static struct attr_def *ntfs_attr_find_in_attrdef(const struct ntfs_volume *vol,
  * Check whether the @size in bytes is valid for an attribute of @type on the
  * ntfs volume @vol.  This information is obtained from $AttrDef system file.
  */
-int ntfs_attr_size_bounds_check(const struct ntfs_volume *vol, const __le32 type,
-		const s64 size)
+int ntfs_attr_size_bounds_check(struct ntfs_volume *vol, const __le32 type,
+				const s64 size)
 {
 	struct attr_def *ad;
 
@@ -1873,7 +1896,7 @@ int ntfs_attr_size_bounds_check(const struct ntfs_volume *vol, const __le32 type
 	/* Get the $AttrDef entry for the attribute @type. */
 	ad = ntfs_attr_find_in_attrdef(vol, type);
 	if (unlikely(!ad))
-		return -ENOENT;
+		return -EFSCORRUPTED;
 	/* Do the bounds check. */
 	if (((le64_to_cpu(ad->min_size) > 0) &&
 			size < le64_to_cpu(ad->min_size)) ||
@@ -1891,15 +1914,15 @@ int ntfs_attr_size_bounds_check(const struct ntfs_volume *vol, const __le32 type
  * Check whether the attribute of @type on the ntfs volume @vol is allowed to
  * be non-resident.  This information is obtained from $AttrDef system file.
  */
-static int ntfs_attr_can_be_non_resident(const struct ntfs_volume *vol,
-		const __le32 type)
+static int ntfs_attr_can_be_non_resident(struct ntfs_volume *vol,
+					 const __le32 type)
 {
 	struct attr_def *ad;
 
 	/* Find the attribute definition record in $AttrDef. */
 	ad = ntfs_attr_find_in_attrdef(vol, type);
 	if (unlikely(!ad))
-		return -ENOENT;
+		return -EFSCORRUPTED;
 	/* Check the flags and return the result. */
 	if (ad->flags & ATTR_DEF_RESIDENT)
 		return -EPERM;
@@ -3281,10 +3304,11 @@ int ntfs_attr_open(struct ntfs_inode *ni, const __le32 type,
 	    ((!(a->flags & ATTR_IS_COMPRESSED) != !NInoCompressed(ni)) ||
 	     (!(a->flags & ATTR_IS_SPARSE)     != !NInoSparse(ni)) ||
 	     (!(a->flags & ATTR_IS_ENCRYPTED)  != !NInoEncrypted(ni)))) {
-		err = -EIO;
+		err = -EFSCORRUPTED;
 		pr_err("Inode %lld has corrupt attribute flags (0x%x <> 0x%x)\n",
 				(unsigned long long)ni->mft_no,
 				a->flags, ni->flags);
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
 		goto put_err_out;
 	}
 
@@ -3300,7 +3324,9 @@ int ntfs_attr_open(struct ntfs_inode *ni, const __le32 type,
 		}
 
 		if ((a->flags & ATTR_IS_COMPRESSED) && !a->data.non_resident.compression_unit) {
-			err = -EIO;
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
 			pr_err("Compressed inode %lld attr 0x%x has no compression unit\n",
 					(unsigned long long)ni->mft_no, type);
 			goto put_err_out;
@@ -5653,6 +5679,11 @@ void *ntfs_attr_readall(struct ntfs_inode *ni, const __le32 type,
 	}
 	bmp_ni = NTFS_I(bmp_vi);
 
+	if (bmp_ni->data_size < 0) {
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
+		ret = ERR_PTR(-EFSCORRUPTED);
+		goto out;
+	}
 	if (bmp_ni->data_size > NTFS_ATTR_READALL_MAX_SIZE &&
 		(bmp_ni->type != AT_BITMAP ||
 		bmp_ni->data_size > ((ni->vol->nr_clusters + 7) >> 3))) {
@@ -5670,8 +5701,11 @@ void *ntfs_attr_readall(struct ntfs_inode *ni, const __le32 type,
 	size = ntfs_inode_attr_pread(VFS_I(bmp_ni), 0, bmp_ni->data_size,
 			(u8 *)data);
 	if (size != bmp_ni->data_size) {
+		if (size >= 0 || size == -EIO)
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							size < 0 ? (int)size : -EFSCORRUPTED);
 		ntfs_error(sb, "ntfs_attr_pread failed");
-		ret = size < 0 ? ERR_PTR((int)size) : ERR_PTR(-EIO);
+		ret = size < 0 ? ERR_PTR((int)size) : ERR_PTR(-EFSCORRUPTED);
 		kvfree(data);
 		goto out;
 	}
diff --git a/fs/ntfs/attrib.h b/fs/ntfs/attrib.h
index 9d6bf0320219..5a133ba741a6 100644
--- a/fs/ntfs/attrib.h
+++ b/fs/ntfs/attrib.h
@@ -89,8 +89,8 @@ void ntfs_attr_reinit_search_ctx(struct ntfs_attr_search_ctx *ctx);
 struct ntfs_attr_search_ctx *ntfs_attr_get_search_ctx(struct ntfs_inode *ni,
 		struct mft_record *mrec);
 void ntfs_attr_put_search_ctx(struct ntfs_attr_search_ctx *ctx);
-int ntfs_attr_size_bounds_check(const struct ntfs_volume *vol,
-		const __le32 type, const s64 size);
+int ntfs_attr_size_bounds_check(struct ntfs_volume *vol,
+				const __le32 type, const s64 size);
 int ntfs_attr_can_be_resident(const struct ntfs_volume *vol,
 		const __le32 type);
 int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
-- 
2.51.0

