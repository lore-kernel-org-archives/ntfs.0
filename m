Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605013;
	b=YrzyjFSPw4RiFkFeDb9vxVTVHaZfN9fFupOGERYCMtj2xvAFLDk5AdXOk33HYuTU4Rlz
	 QBO7hSsFiFeTJkFdETZFXEn364hHdTYjnOYhofsmxFKTEYcy2BusIrjIueaigFxmktEea
	 MUHXOpid9j3jzjwby9WfngNnyhFadCMQ3yhkyFYtroivxmULNJd/MXQFkb5g6+XyhAoEE
	 N+i/7Q25MNqubgUOzO5mFoqoH7QkEVK8iFRe3ZdWwvaJtZeyLZhKGAwXYkPHq3ssY3xbM
	 krrhLqCylTzTwJ4FY1fsfcoTwkzIYxw5wM0/r57aQhzVlv+YGyqUByd5cL5hPQc4GOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605013;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=LZDJHQQx6zFLg0ujdRLGPa6MNrqwy4p7otdqELOivMk=;
	b=uUyvJZZ6TCCtdx9d4iYc8lzT3TmcKKQ4SjrvMYuDg9xL+SWeWnNkJHE8WA8ntHIQK+5M
	 OM6+TOc9rI7vavF9t1JV2ZEGkdBSHYDgZHwBXHZU8kWf8ZJtPb6KSWwjl3h3vNFp+uAKZ
	 wuuMYzNV4zpj018V7puwRG6ydTm0RsH81gWWxN1y/fPgDeeIotNp82veaEZINfTej9jH7
	 JXyp5HblML9V08V+QL4VIy2l/+JH73kek9A35E09YfM7wNYlTwWNbJn88E6usrJGonv8X
	 vLUw7lm9cnW/wZiqA2WwsMKnY79tflJJbi3GAw5MjbSM6GVYUMUD5GE0/HqDpN8Kn/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="jV1t/4kd";
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7D4606A327
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F7D4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=jV1t/4kd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=LZ
	DJHQQx6zFLg0ujdRLGPa6MNrqwy4p7otdqELOivMk=; b=jV1t/4kdDJdx2liUyF
	fNjaFGb2dYKlT6ZJSmIxkDUBcz5D1/vKDnbEF5Y9Tk8VDL7//sj7N0C+APLGEAR8
	tQ7jm5HWMo9OzypV6RuJ0bqDwUXpe0VnU8Z8dVl+V5d/G6I80bGL1c2HlS6sBnY+
	D9dtsNs3OhsmtWtbRK/oLQelg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3vy+HPehqF0lcEw--.2040S6;
	Mon, 02 Nov 2026 15:36:42 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v5 12/31] ntfs: report attribute lookup and validation errors
Date: Mon,  2 Nov 2026 15:35:13 +0800
Message-Id: <20261102073532.98873-13-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3vy+HPehqF0lcEw--.2040S6
X-Coremail-Antispam: 1Uf129KBjvAXoW3ZF18GryrZFyDGr13Wr17Jrb_yoW8Jr43Wo
	Wavrs0vw4kZr1UAr4vk3Z5AF9xua45GrWUGry5Cr4DAas2qw1DAw1fG343Ga45uw15Gr4q
	gry8Jwn5AF1kAFy5n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOYFCUUUUU
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC7wpGL2roPYpQ9wAA3e

From: Baolin Liu <liubaolin@kylinos.cn>

Attribute lookup and reading can detect malformed records and lists,
invalid stored flags or sizes, and short metadata reads without reporting
them. Report corruption against the base file and use EFSCORRUPTED.

Report missing required attributes and missing AttrDef definitions while
preserving underlying errors and ordinary lookup misses. Use EFBIG for
the readall size limit so it is not mistaken for an I/O failure. Combine
local reports at shared exits while retaining lower-level reporting.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/attrib.c | 105 +++++++++++++++++++++++++++++++++--------------
 fs/ntfs/attrib.h |   4 +-
 2 files changed, 77 insertions(+), 32 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index f1c99e0d8dca..a69b0c6e9de1 100644
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
@@ -1156,34 +1158,52 @@ bool ntfs_attr_list_is_valid(const u8 *al_start, s64 size)
 
 int load_attribute_list(struct ntfs_inode *base_ni, u8 *al_start, const s64 size)
 {
+	int report_err = 0;
 	struct inode *attr_vi = NULL;
+	s64 read;
+	int err;
 
 	if (!al_start || size <= 0)
 		return -EINVAL;
 
 	attr_vi = ntfs_attr_iget(VFS_I(base_ni), AT_ATTRIBUTE_LIST, AT_UNNAMED, 0);
 	if (IS_ERR(attr_vi)) {
+		if (PTR_ERR(attr_vi) == -ENOENT) {
+			report_err = -EFSCORRUPTED;
+			attr_vi = ERR_PTR(-EFSCORRUPTED);
+		}
 		ntfs_error(base_ni->vol->sb,
 			   "Failed to open an inode for Attribute list, mft = %llu",
 			   base_ni->mft_no);
-		return PTR_ERR(attr_vi);
+		err = PTR_ERR(attr_vi);
+		goto out;
 	}
 
-	if (ntfs_inode_attr_pread(attr_vi, 0, size, al_start) != size) {
+	read = ntfs_inode_attr_pread(attr_vi, 0, size, al_start);
+	if (read != size) {
+		if (read >= 0)
+			report_err = -EFSCORRUPTED;
 		iput(attr_vi);
 		ntfs_error(base_ni->vol->sb,
 			   "Failed to read attribute list, mft = %llu",
 			   base_ni->mft_no);
-		return -EIO;
+		err = read < 0 ? read : -EFSCORRUPTED;
+		goto out;
 	}
 	iput(attr_vi);
 
 	if (!ntfs_attr_list_is_valid(al_start, size)) {
+		report_err = -EFSCORRUPTED;
 		ntfs_error(base_ni->vol->sb, "Corrupt attribute list, mft = %llu",
 			   base_ni->mft_no);
-		return -EIO;
+		err = -EFSCORRUPTED;
+		goto out;
 	}
-	return 0;
+	err = 0;
+out:
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(base_ni), report_err);
+	return err;
 }
 
 /*
@@ -1233,7 +1253,7 @@ int load_attribute_list(struct ntfs_inode *base_ni, u8 *al_start, const s64 size
  * attribute list entry for the inserted attribute should be inserted in the
  * attribute list attribute at @ctx->al_entry.
  *
- * On actual error, ntfs_external_attr_find() returns -EIO.  In this case
+ * On actual error, ntfs_external_attr_find() returns -EFSCORRUPTED.  In this case
  * @ctx->attr is undefined and in particular do not rely on it not changing.
  */
 static int ntfs_external_attr_find(const __le32 type,
@@ -1355,7 +1375,8 @@ static int ntfs_external_attr_find(const __le32 type,
 
 			/* Not found?!? Absurd! */
 			ntfs_error(ctx->ntfs_ino->vol->sb, "Attribute list wasn't found");
-			return -EIO;
+			err = -EFSCORRUPTED;
+			goto report_error;
 		}
 	}
 	for (;; al_entry = next_al_entry) {
@@ -1454,7 +1475,8 @@ static int ntfs_external_attr_find(const __le32 type,
 				ntfs_error(vol->sb,
 					"Found stale mft reference in attribute list of base inode 0x%llx.%s",
 					base_ni->mft_no, es);
-				err = -EIO;
+
+				err = -EFSCORRUPTED;
 				break;
 			}
 		} else { /* Mft references do not match. */
@@ -1479,7 +1501,7 @@ static int ntfs_external_attr_find(const __le32 type,
 							base_ni->mft_no, es);
 					err = PTR_ERR(ctx->mrec);
 					if (err == -ENOENT)
-						err = -EIO;
+						err = -EFSCORRUPTED;
 					/* Cause @ctx to be sanitized below. */
 					ni = NULL;
 					break;
@@ -1533,7 +1555,7 @@ static int ntfs_external_attr_find(const __le32 type,
 		/*
 		 * If the type and/or the name are mismatched between the
 		 * attribute list entry and the attribute record, there is
-		 * corruption so we break and return error EIO.
+		 * corruption so we break and return error EFSCORRUPTED.
 		 */
 		if (al_entry->type != a->type)
 			break;
@@ -1592,11 +1614,18 @@ static int ntfs_external_attr_find(const __le32 type,
 			"Base inode 0x%llx contains corrupt attribute, mft %#llx, type %#x. %s",
 			(long long)base_ni->mft_no, (long long)mft_no, type,
 			"Unmount and run chkdsk.");
-		err = -EIO;
+
+		err = -EFSCORRUPTED;
 	}
 
-	if (err != -ENOMEM)
-		NVolSetErrors(vol);
+report_error:
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
@@ -1824,8 +1853,8 @@ void ntfs_attr_put_search_ctx(struct ntfs_attr_search_ctx *ctx)
  *
  * Return the attribute type definition record if found and NULL if not found.
  */
-static struct attr_def *ntfs_attr_find_in_attrdef(const struct ntfs_volume *vol,
-		const __le32 type)
+static struct attr_def *ntfs_attr_find_in_attrdef(struct ntfs_volume *vol,
+						  const __le32 type)
 {
 	struct attr_def *ad;
 
@@ -1841,7 +1870,8 @@ static struct attr_def *ntfs_attr_find_in_attrdef(const struct ntfs_volume *vol,
 		/* We have gone too far already.  No point in continuing. */
 		break;
 	}
-	/* Attribute not found. */
+	/* The requested attribute type must have a definition on this volume. */
+	ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 	ntfs_debug("Attribute type 0x%x not found in $AttrDef.",
 			le32_to_cpu(type));
 	return NULL;
@@ -1856,8 +1886,8 @@ static struct attr_def *ntfs_attr_find_in_attrdef(const struct ntfs_volume *vol,
  * Check whether the @size in bytes is valid for an attribute of @type on the
  * ntfs volume @vol.  This information is obtained from $AttrDef system file.
  */
-int ntfs_attr_size_bounds_check(const struct ntfs_volume *vol, const __le32 type,
-		const s64 size)
+int ntfs_attr_size_bounds_check(struct ntfs_volume *vol, const __le32 type,
+				const s64 size)
 {
 	struct attr_def *ad;
 
@@ -1873,7 +1903,7 @@ int ntfs_attr_size_bounds_check(const struct ntfs_volume *vol, const __le32 type
 	/* Get the $AttrDef entry for the attribute @type. */
 	ad = ntfs_attr_find_in_attrdef(vol, type);
 	if (unlikely(!ad))
-		return -ENOENT;
+		return -EFSCORRUPTED;
 	/* Do the bounds check. */
 	if (((le64_to_cpu(ad->min_size) > 0) &&
 			size < le64_to_cpu(ad->min_size)) ||
@@ -1891,15 +1921,15 @@ int ntfs_attr_size_bounds_check(const struct ntfs_volume *vol, const __le32 type
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
@@ -3189,6 +3219,7 @@ static void ntfs_attr_init(struct ntfs_inode *ni, const bool non_resident,
 int ntfs_attr_open(struct ntfs_inode *ni, const __le32 type,
 		__le16 *name, u32 name_len)
 {
+	int report_err = 0;
 	struct ntfs_attr_search_ctx *ctx;
 	__le16 *newname = NULL;
 	struct attr_record *a;
@@ -3281,10 +3312,11 @@ int ntfs_attr_open(struct ntfs_inode *ni, const __le32 type,
 	    ((!(a->flags & ATTR_IS_COMPRESSED) != !NInoCompressed(ni)) ||
 	     (!(a->flags & ATTR_IS_SPARSE)     != !NInoSparse(ni)) ||
 	     (!(a->flags & ATTR_IS_ENCRYPTED)  != !NInoEncrypted(ni)))) {
-		err = -EIO;
+		err = -EFSCORRUPTED;
 		pr_err("Inode %lld has corrupt attribute flags (0x%x <> 0x%x)\n",
 				(unsigned long long)ni->mft_no,
 				a->flags, ni->flags);
+		report_err = -EFSCORRUPTED;
 		goto put_err_out;
 	}
 
@@ -3300,7 +3332,8 @@ int ntfs_attr_open(struct ntfs_inode *ni, const __le32 type,
 		}
 
 		if ((a->flags & ATTR_IS_COMPRESSED) && !a->data.non_resident.compression_unit) {
-			err = -EIO;
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
 			pr_err("Compressed inode %lld attr 0x%x has no compression unit\n",
 					(unsigned long long)ni->mft_no, type);
 			goto put_err_out;
@@ -3333,6 +3366,8 @@ int ntfs_attr_open(struct ntfs_inode *ni, const __le32 type,
 	ntfs_attr_put_search_ctx(ctx);
 out:
 	ntfs_debug("\n");
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(ni), report_err);
 	return err;
 
 put_err_out:
@@ -5642,6 +5677,7 @@ int ntfs_attr_remove(struct ntfs_inode *ni, const __le32 type, __le16 *name,
 void *ntfs_attr_readall(struct ntfs_inode *ni, const __le32 type,
 		__le16 *name, u32 name_len, s64 *data_size)
 {
+	int report_err = 0;
 	struct ntfs_inode *bmp_ni;
 	struct inode *bmp_vi;
 	void *data, *ret = NULL;
@@ -5658,11 +5694,16 @@ void *ntfs_attr_readall(struct ntfs_inode *ni, const __le32 type,
 	}
 	bmp_ni = NTFS_I(bmp_vi);
 
+	if (bmp_ni->data_size < 0) {
+		report_err = -EFSCORRUPTED;
+		ret = ERR_PTR(-EFSCORRUPTED);
+		goto out;
+	}
 	if (bmp_ni->data_size > NTFS_ATTR_READALL_MAX_SIZE &&
 		(bmp_ni->type != AT_BITMAP ||
 		bmp_ni->data_size > ((ni->vol->nr_clusters + 7) >> 3))) {
-		ntfs_error(sb, "Invalid attribute data size");
-		ret = ERR_PTR(-EIO);
+		ntfs_error(sb, "Attribute data exceeds readall size limit");
+		ret = ERR_PTR(-EFBIG);
 		goto out;
 	}
 
@@ -5675,8 +5716,10 @@ void *ntfs_attr_readall(struct ntfs_inode *ni, const __le32 type,
 	size = ntfs_inode_attr_pread(VFS_I(bmp_ni), 0, bmp_ni->data_size,
 			(u8 *)data);
 	if (size != bmp_ni->data_size) {
+		if (size >= 0 || size == -EIO)
+			report_err = size < 0 ? (int)size : -EFSCORRUPTED;
 		ntfs_error(sb, "ntfs_attr_pread failed");
-		ret = size < 0 ? ERR_PTR((int)size) : ERR_PTR(-EIO);
+		ret = size < 0 ? ERR_PTR((int)size) : ERR_PTR(-EFSCORRUPTED);
 		kvfree(data);
 		goto out;
 	}
@@ -5687,6 +5730,8 @@ void *ntfs_attr_readall(struct ntfs_inode *ni, const __le32 type,
 	iput(bmp_vi);
 err_exit:
 	ntfs_debug("\n");
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(ni), report_err);
 	return ret;
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

