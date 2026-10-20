Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485886;
	b=jZs7whr6voGVZmu2aakavmuVLq5iQ1QmY9E+jfbbZv06Sh3nP7IuulfJLrNQSyvkZ+xM
	 PatKeXEz9rbi1aG+TrcUsjmwdAtOul25vGKdaita6CYKuBxTpUvnG5WrzylAHcfqVGJNs
	 anf64CD47eoauQHvC0QMP+8hwQwi3DiVMWRET7Ng9iaLKlljmpa6y4wuqFb79IsONtcv5
	 G4cLPwCNIyhCqBrFwvgw2djGb+zYnrrEYIhfFM0uaQwpvC7hP3AW7CLrocJNWYbixwbMW
	 zx5aHKneTjDtQGjvD17ucUqO32Bhq5Xv3ILCH2GiKFZrX7nhRv9C9CBrlP3PiVITu9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485886;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=CrMmDeEgN9fy/W9yqU+loITc7Dki6XL62Lc+gNl1pJU=;
	b=nEKUjXL8KTGVBVDWjielHELztN/YHbKv+mWgHMm1l7dEzjjvxaWiHcAFsdLlDVrtd5qO
	 IsSM47Gcq1pZ8dAxloR+QRJwPfOcOrVh1pdb6JgtWo1vpjVgtfPRHBgSH72jEBZcn8PqS
	 PSeQ2dHj7pSxhuyicBdsaL6xmagASPsIuNfp1iIkZVQ4KaIWlsE5GT3AD0Trrrp4zxK14
	 QcnfaTucqfsG7VCCtp3GsMCQE41nVIbQe4NnjwVggWa6vNJ0TO+ZyMlkdlo5N/LxhPuiC
	 JnkwCDuZmkoe9kp7txH7mhu7dG0Yg3ztZl6Tj2tFv3g45duyUBjq57A2j6oYon94m/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=hzKjVrHE;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E73606A31A
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28E73606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=hzKjVrHE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Cr
	MmDeEgN9fy/W9yqU+loITc7Dki6XL62Lc+gNl1pJU=; b=hzKjVrHEGM1gyfvwCL
	Vo7XsTNgvtU172V8wGiEpureCbxDBWlI/rIQqfxXB5G9pnR8bQoSru913DI9xOt1
	GuCI7j1pBZ/SM6zZ68Znt0rPloROf1hYPpHGHbzLqAtn8G/DJ64cbGUsUj+er9kE
	3256jEET9OcyrF+SbAxbqg+Sc=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3XyPnKddq1latBA--.56704S6;
	Tue, 20 Oct 2026 16:44:29 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 04/31] ntfs: preserve attribute search context initialization errors
Date: Tue, 20 Oct 2026 16:43:54 +0800
Message-ID: <20261020084421.2196486-5-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3XyPnKddq1latBA--.56704S6
X-Coremail-Antispam: 1Uf129KBjvAXoWfAF4fWFyrtr4fAr1kKr1fXrb_yoW5JFWfCo
	WSkF4Fvwn5Cw1Yywnakw1kKF9xAas8C3y8Ja90gr4qkFsFq34qyw43Zw15W34I93WrKrW5
	Xry8Jr4rZr1fJ343n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxUGYUUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Q0W4GrXKe1KKQAA3I

From: Xuewen Wang <wangxuewen@kylinos.cn>

ntfs_attr_get_search_ctx() returns NULL for both allocation and MFT
mapping failures, causing callers to misreport mapping errors as ENOMEM.

Return error pointers carrying the original errno. Convert all callers
and the documented usage, clearing pointers before shared cleanup where
needed. Preserve deliberate boolean and best-effort behavior while making
those callers recognize error pointers.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 fs/ntfs/attrib.c       | 110 ++++++++++++++++++++++-------------------
 fs/ntfs/attrib.h       |   4 +-
 fs/ntfs/attrlist.c     |   5 +-
 fs/ntfs/dir.c          |  18 ++++---
 fs/ntfs/ea.c           |  10 ++--
 fs/ntfs/file.c         |   4 +-
 fs/ntfs/index.c        |   3 +-
 fs/ntfs/inode.c        |  51 ++++++++++---------
 fs/ntfs/iomap.c        |  10 ++--
 fs/ntfs/mft.c          |  23 +++++----
 fs/ntfs/named_stream.c |  18 ++++---
 fs/ntfs/namei.c        |  13 ++---
 fs/ntfs/super.c        |  14 ++++--
 fs/ntfs/wof.c          |  10 ++--
 14 files changed, 164 insertions(+), 129 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 0be410973176..28099ed6ad99 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -120,8 +120,9 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
 		if (IS_ERR(m))
 			return PTR_ERR(m);
 		ctx = ntfs_attr_get_search_ctx(base_ni, m);
-		if (unlikely(!ctx)) {
-			err = -ENOMEM;
+		if (IS_ERR(ctx)) {
+			err = PTR_ERR(ctx);
+			ctx = NULL;
 			goto err_out;
 		}
 	} else {
@@ -1654,13 +1655,13 @@ int ntfs_attr_lookup(const __le32 type, const __le16 *name,
  *
  * Initialize the attribute search context @ctx with @ni and @mrec.
  */
-static bool ntfs_attr_init_search_ctx(struct ntfs_attr_search_ctx *ctx,
-		struct ntfs_inode *ni, struct mft_record *mrec)
+static int ntfs_attr_init_search_ctx(struct ntfs_attr_search_ctx *ctx,
+				     struct ntfs_inode *ni, struct mft_record *mrec)
 {
 	if (!mrec) {
 		mrec = map_mft_record(ni);
 		if (IS_ERR(mrec))
-			return false;
+			return PTR_ERR(mrec);
 		ctx->mapped_mrec = true;
 	} else {
 		ctx->mapped_mrec = false;
@@ -1676,7 +1677,7 @@ static bool ntfs_attr_init_search_ctx(struct ntfs_attr_search_ctx *ctx,
 	ctx->base_mrec = NULL;
 	ctx->base_attr = NULL;
 	ctx->mapped_base_mrec = false;
-	return true;
+	return 0;
 }
 
 /*
@@ -1720,23 +1721,22 @@ void ntfs_attr_reinit_search_ctx(struct ntfs_attr_search_ctx *ctx)
  * @mrec:	mft record with which to initialize the search context
  *
  * Allocate a new attribute search context, initialize it with @ni and @mrec,
- * and return it. Return NULL if allocation failed.
+ * and return it. Return ERR_PTR(-errno) on allocation or mapping failure.
  */
 struct ntfs_attr_search_ctx *ntfs_attr_get_search_ctx(struct ntfs_inode *ni,
 		struct mft_record *mrec)
 {
 	struct ntfs_attr_search_ctx *ctx;
-	bool init;
+	int err;
 
 	ctx = kmem_cache_alloc(ntfs_attr_ctx_cache, GFP_NOFS);
-	if (ctx) {
-		init = ntfs_attr_init_search_ctx(ctx, ni, mrec);
-		if (init == false) {
-			kmem_cache_free(ntfs_attr_ctx_cache, ctx);
-			ctx = NULL;
-		}
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+	err = ntfs_attr_init_search_ctx(ctx, ni, mrec);
+	if (err) {
+		kmem_cache_free(ntfs_attr_ctx_cache, ctx);
+		return ERR_PTR(err);
 	}
-
 	return ctx;
 }
 
@@ -2019,8 +2019,9 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 		goto err_out;
 	}
 	ctx = ntfs_attr_get_search_ctx(base_ni, m);
-	if (unlikely(!ctx)) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto err_out;
 	}
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
@@ -2359,8 +2360,8 @@ int ntfs_attr_set_initialized_size(struct ntfs_inode *ni, loff_t new_size)
 		return -EINVAL;
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx)
-		return -ENOMEM;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			       CASE_SENSITIVE, 0, NULL, 0, ctx);
@@ -2460,10 +2461,10 @@ int ntfs_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 
 	/* Locate place where record should be. */
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(ni->vol->sb, "%s: Failed to get search context",
 				__func__);
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 	/*
 	 * Use ntfs_attr_find instead of ntfs_attr_lookup to find place for
@@ -2584,9 +2585,9 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 
 	/* Locate place where record should be. */
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		pr_err("%s: Failed to get search context\n", __func__);
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 	/*
 	 * Use ntfs_attr_find instead of ntfs_attr_lookup to find place for
@@ -3158,9 +3159,10 @@ int ntfs_attr_open(struct ntfs_inode *ni, const __le32 type,
 	}
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
 		pr_err("%s: Failed to get search context\n", __func__);
+		ctx = NULL;
 		goto err_out;
 	}
 
@@ -3334,9 +3336,9 @@ int ntfs_attr_map_whole_runlist(struct ntfs_inode *ni)
 		base_ni = ni;
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(sb, "%s: Failed to get search context", __func__);
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 
 	/* Map all attribute extents one by one. */
@@ -3462,9 +3464,9 @@ int ntfs_attr_record_move_to(struct ntfs_attr_search_ctx *ctx, struct ntfs_inode
 	/* Find place in MFT record where attribute will be moved. */
 	a = ctx->attr;
 	nctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!nctx) {
+	if (IS_ERR(nctx)) {
 		ntfs_error(sb, "%s: Failed to get search context", __func__);
-		return -ENOMEM;
+		return PTR_ERR(nctx);
 	}
 
 	/*
@@ -3798,9 +3800,9 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 		base_ni = ni;
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(sb, "%s: Failed to get search context", __func__);
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 
 	/* Fill attribute records with new mapping pairs. */
@@ -4356,9 +4358,10 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 		}
 
 		ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-		if (!ctx) {
+		if (IS_ERR(ctx)) {
 			ntfs_error(vol->sb, "%s: Failed to get search context", __func__);
-			err = -ENOMEM;
+			err = PTR_ERR(ctx);
+			ctx = NULL;
 			goto unlock_runlist;
 		}
 
@@ -4409,9 +4412,9 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 
 	/* Get the first attribute record. */
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(vol->sb, "%s: Failed to get search context", __func__);
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
@@ -4728,10 +4731,11 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	}
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
 		if (ni->allocated_size == org_alloc_size)
 			return err;
+		ctx = NULL;
 		goto rollback;
 	}
 
@@ -4842,9 +4846,9 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 
 	/* Get the attribute record that needs modification. */
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(sb, "%s: Failed to get search context", __func__);
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 
 	err = ntfs_attr_lookup(attr_ni->type, attr_ni->name, attr_ni->name_len,
@@ -5240,9 +5244,9 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 		return err;
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(vol->sb, "%s: Failed to get search context", __func__);
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
@@ -5427,9 +5431,9 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 		if (err)
 			return err;
 		ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-		if (!ctx) {
+		if (IS_ERR(ctx)) {
 			ntfs_error(sb, "%s: Failed to get search context", __func__);
-			return -ENOMEM;
+			return PTR_ERR(ctx);
 		}
 
 		freed = ntfs_cluster_free(ni, 0, -1, ctx);
@@ -5443,9 +5447,9 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 
 	/* Search for attribute extents and remove them all. */
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(sb, "%s: Failed to get search context", __func__);
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 	while (!(err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 				CASE_SENSITIVE, 0, NULL, 0, ctx))) {
@@ -5476,7 +5480,7 @@ int ntfs_attr_exist(struct ntfs_inode *ni, const __le32 type, __le16 *name,
 	ntfs_debug("Entering\n");
 
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(ni->vol->sb, "%s: Failed to get search context",
 				__func__);
 		return 0;
@@ -5661,8 +5665,8 @@ int ntfs_non_resident_attr_insert_range(struct ntfs_inode *ni, s64 start_vcn, s6
 		return ret;
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
-		ret = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		ret = PTR_ERR(ctx);
 		return ret;
 	}
 
@@ -5750,8 +5754,9 @@ int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn,
 	up_write(&ni->runlist.lock);
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
-		ret = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		ret = PTR_ERR(ctx);
+		ctx = NULL;
 		goto out_rl;
 	}
 
@@ -5869,8 +5874,9 @@ int ntfs_attr_fallocate(struct ntfs_inode *ni, loff_t start, loff_t byte_len, bo
 	}
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, mrec);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto out_unmap;
 	}
 
diff --git a/fs/ntfs/attrib.h b/fs/ntfs/attrib.h
index bee91c9f6f81..9d6bf0320219 100644
--- a/fs/ntfs/attrib.h
+++ b/fs/ntfs/attrib.h
@@ -158,8 +158,8 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
  *
  *	int err;
  *	struct ntfs_attr_search_ctx *ctx = ntfs_attr_get_search_ctx(ni, NULL);
- *	if (!ctx)
- *		// Error code is in errno. Handle this case.
+ *	if (IS_ERR(ctx))
+ *		// PTR_ERR(ctx) is the error code. Handle this case.
  *	while (!(err = ntfs_attrs_walk(ctx))) {
  *		struct attr_record *attr = ctx->attr;
  *		// attr now contains the next attribute. Do whatever you want
diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
index 8291c4c95b37..7e7440c5f2ba 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -362,9 +362,10 @@ int ntfs_attrlist_entry_add(struct ntfs_inode *ni, struct attr_record *attr)
 
 	/* Find place for the new entry. */
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
 		ntfs_error(ni->vol->sb, "Failed to get search context");
+		ctx = NULL;
 		goto err_out;
 	}
 	if (attr->non_resident)
diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index fce10baa2b93..afee30f8b501 100644
--- a/fs/ntfs/dir.c
+++ b/fs/ntfs/dir.c
@@ -100,8 +100,9 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		return ERR_MREF(PTR_ERR(m));
 	}
 	ctx = ntfs_attr_get_search_ctx(dir_ni, m);
-	if (unlikely(!ctx)) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto err_out;
 	}
 	/* Find the index root attribute in the mft record. */
@@ -832,8 +833,9 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 	}
 
 	ctx = ntfs_attr_get_search_ctx(ndir, NULL);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto out;
 	}
 
@@ -1034,9 +1036,9 @@ int ntfs_check_empty_dir(struct ntfs_inode *ni, struct mft_record *ni_mrec)
 		return 0;
 
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(ni->vol->sb, "Failed to get search context");
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 
 	/* Find the index root attribute in the mft record. */
@@ -1135,8 +1137,8 @@ static int ntfs_dir_fsync(struct file *filp, loff_t start, loff_t end,
 		return -EIO;
 
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx)
-		return -ENOMEM;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL_CHILD);
 	while (!(err = ntfs_attr_lookup(AT_FILE_NAME, NULL, 0, 0, 0, NULL, 0, ctx))) {
diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 199a602348d4..1198f3059c5d 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -192,8 +192,9 @@ static int ntfs_ea_attr_lookup(struct ntfs_inode *ni, __le32 type)
 	if (IS_ERR(mrec))
 		return PTR_ERR(mrec);
 	ctx = ntfs_attr_get_search_ctx(ni, mrec);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto out;
 	}
 	err = ntfs_attr_lookup(type, AT_UNNAMED, 0, CASE_SENSITIVE,
@@ -684,8 +685,9 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni, __le32 fattr)
 		return PTR_ERR(m);
 
 	ctx = ntfs_attr_get_search_ctx(ni, m);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto err_out;
 	}
 
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index d810ca5904bd..cd5ed8bf3164 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -331,8 +331,8 @@ int ntfs_file_fsync(struct file *filp, loff_t start, loff_t end,
 		goto sync_volume;
 
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx)
-		return -ENOMEM;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL_CHILD);
 	while (!(err = ntfs_attr_lookup(AT_UNUSED, NULL, 0, 0, 0, NULL, 0, ctx))) {
diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index ac22d8407a77..afb08f0aa596 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -579,8 +579,9 @@ static struct index_root *ntfs_ir_lookup(struct ntfs_inode *ni, __le16 *name,
 
 	ntfs_debug("Entering\n");
 	*ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!*ctx) {
+	if (IS_ERR(*ctx)) {
 		ntfs_error(ni->vol->sb, "%s, Failed to get search context", __func__);
+		*ctx = NULL;
 		return NULL;
 	}
 
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index c8560dd47d44..5b3d1453d5e1 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -372,8 +372,8 @@ static int ntfs_non_resident_dealloc_clusters(struct ntfs_inode *ni)
 	int err = 0;
 
 	actx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!actx)
-		return -ENOMEM;
+	if (IS_ERR(actx))
+		return PTR_ERR(actx);
 	WARN_ON(actx->mrec->link_count != 0);
 
 	/**
@@ -779,8 +779,9 @@ static int ntfs_read_locked_inode(struct inode *vi)
 	}
 
 	ctx = ntfs_attr_get_search_ctx(ni, m);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto unm_err_out;
 	}
 
@@ -1390,8 +1391,9 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
 		goto err_out;
 	}
 	ctx = ntfs_attr_get_search_ctx(base_ni, m);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto unm_err_out;
 	}
 	/* Find the attribute. */
@@ -1655,8 +1657,9 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 		goto err_out;
 	}
 	ctx = ntfs_attr_get_search_ctx(base_ni, m);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto unm_err_out;
 	}
 	/* Find the index root attribute. */
@@ -2046,8 +2049,9 @@ int ntfs_read_inode_mount(struct inode *vi)
 	vi->i_mapping->a_ops = &ntfs_mft_aops;
 
 	ctx = ntfs_attr_get_search_ctx(ni, m);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto err_out;
 	}
 
@@ -2643,8 +2647,8 @@ static int ntfs_inode_sync_standard_information(struct inode *vi, struct mft_rec
 
 	/* Update the access times in the standard information attribute. */
 	ctx = ntfs_attr_get_search_ctx(ni, m);
-	if (unlikely(!ctx))
-		return -ENOMEM;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 	err = ntfs_attr_lookup(AT_STANDARD_INFORMATION, NULL, 0,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (unlikely(err)) {
@@ -2744,8 +2748,8 @@ int ntfs_inode_sync_filename(struct ntfs_inode *ni)
 	ntfs_debug("Entering for inode %llu\n", ni->mft_no);
 
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx)
-		return -ENOMEM;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	/* Collect the reparse tag, if any */
 	reparse_tag = cpu_to_le32(0);
@@ -3233,8 +3237,9 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 
 	/* Form attribute list. */
 	ctx = ntfs_attr_get_search_ctx(ni, ni_mrec);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto err_out;
 	}
 
@@ -3598,9 +3603,9 @@ int ntfs_inode_free_space(struct ntfs_inode *ni, int size)
 		return 0;
 
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(sb, "%s, Failed to get search context", __func__);
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 
 	/*
@@ -3722,10 +3727,11 @@ s64 ntfs_inode_attr_pread(struct inode *vi, s64 pos, s64 count, u8 *buf)
 		u8 *attr;
 
 		ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-		if (!ctx) {
+		if (IS_ERR(ctx)) {
 			ntfs_error(vi->i_sb, "Failed to get attr search ctx");
-			err = -ENOMEM;
+			err = PTR_ERR(ctx);
 			mutex_unlock(&mrec_ni->mrec_lock);
+			ctx = NULL;
 			goto out;
 		}
 
@@ -4047,9 +4053,10 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
 	}
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(vi->i_sb, "Failed to get attr search ctx");
-		ret = -ENOMEM;
+		ret = PTR_ERR(ctx);
+		ctx = NULL;
 		goto out_unlock;
 	}
 
diff --git a/fs/ntfs/iomap.c b/fs/ntfs/iomap.c
index 2940a5587add..c248c61854cc 100644
--- a/fs/ntfs/iomap.c
+++ b/fs/ntfs/iomap.c
@@ -68,8 +68,9 @@ static int ntfs_read_iomap_begin_resident(struct inode *inode, loff_t offset, lo
 	mutex_lock(&base_ni->mrec_lock);
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto out;
 	}
 
@@ -688,8 +689,9 @@ static int ntfs_write_iomap_begin_resident(struct inode *inode, loff_t offset,
 	char *kattr;
 
 	ctx = ntfs_attr_get_search_ctx(mrec_ni, NULL);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto out;
 	}
 
diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 89288b794348..9b14e69c9c6f 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -1473,9 +1473,10 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 		goto undo_alloc;
 	}
 	ctx = ntfs_attr_get_search_ctx(mft_ni, mrec);
-	if (unlikely(!ctx)) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(vol->sb, "Failed to get search context.");
-		ret = -ENOMEM;
+		ret = PTR_ERR(ctx);
+		ctx = NULL;
 		goto undo_alloc;
 	}
 	ret = ntfs_attr_lookup(mftbmp_ni->type, mftbmp_ni->name,
@@ -1673,9 +1674,10 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 		return PTR_ERR(mrec);
 	}
 	ctx = ntfs_attr_get_search_ctx(mft_ni, mrec);
-	if (unlikely(!ctx)) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(vol->sb, "Failed to get search context.");
-		ret = -ENOMEM;
+		ret = PTR_ERR(ctx);
+		ctx = NULL;
 		goto unm_err_out;
 	}
 	ret = ntfs_attr_lookup(mftbmp_ni->type, mftbmp_ni->name,
@@ -1724,9 +1726,10 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 		return ret;
 	}
 	ctx = ntfs_attr_get_search_ctx(mft_ni, mrec);
-	if (unlikely(!ctx)) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(vol->sb, "Failed to get search context.%s", es);
 		NVolSetErrors(vol);
+		ctx = NULL;
 		goto unm_err_out;
 	}
 	if (ntfs_attr_lookup(mftbmp_ni->type, mftbmp_ni->name,
@@ -1912,9 +1915,10 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 		goto undo_alloc;
 	}
 	ctx = ntfs_attr_get_search_ctx(mft_ni, mrec);
-	if (unlikely(!ctx)) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(vol->sb, "Failed to get search context.");
-		ret = -ENOMEM;
+		ret = PTR_ERR(ctx);
+		ctx = NULL;
 		goto undo_alloc;
 	}
 	ret = ntfs_attr_lookup(mft_ni->type, mft_ni->name, mft_ni->name_len,
@@ -2663,10 +2667,11 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
 		goto undo_data_init;
 	}
 	ctx = ntfs_attr_get_search_ctx(mft_ni, m);
-	if (unlikely(!ctx)) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(vol->sb, "Failed to get search context.");
-		err = -ENOMEM;
+		err = PTR_ERR(ctx);
 		unmap_mft_record(mft_ni);
+		ctx = NULL;
 		goto undo_data_init;
 	}
 	err = ntfs_attr_lookup(mft_ni->type, mft_ni->name, mft_ni->name_len,
diff --git a/fs/ntfs/named_stream.c b/fs/ntfs/named_stream.c
index e44dbf09057b..6130359f616a 100644
--- a/fs/ntfs/named_stream.c
+++ b/fs/ntfs/named_stream.c
@@ -129,8 +129,8 @@ int ntfs_stream_inode_validate(struct inode *vi)
 		return -ESTALE;
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx)
-		return -ENOMEM;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 	err = ntfs_attr_lookup(AT_DATA, ni->name, ni->name_len,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
 	ntfs_attr_put_search_ctx(ctx);
@@ -600,8 +600,9 @@ struct inode *ntfs_create_named_stream(struct mnt_idmap *idmap,
 		goto out_unlock;
 	}
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto out_unlock;
 	}
 
@@ -1255,8 +1256,9 @@ static int ntfs_stream_ioctl_get_inode(struct inode *base_vi, __le16 *sname,
 	}
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto out_unlock;
 	}
 
@@ -1633,9 +1635,9 @@ int ntfs_ioctl_list_streams(struct file *filp, unsigned long arg)
 
 	mutex_lock(&ni->mrec_lock);
 	actx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!actx) {
+	if (IS_ERR(actx)) {
 		mutex_unlock(&ni->mrec_lock);
-		return -ENOMEM;
+		return PTR_ERR(actx);
 	}
 
 	while ((err = ntfs_attrs_walk(actx)) == 0) {
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 0db7da017233..8918379140f1 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -290,8 +290,9 @@ static struct dentry *ntfs_lookup(struct inode *dir_ino, struct dentry *dent,
 				goto err_out;
 			}
 			ctx = ntfs_attr_get_search_ctx(ni, m);
-			if (unlikely(!ctx)) {
-				err = -ENOMEM;
+			if (IS_ERR(ctx)) {
+				err = PTR_ERR(ctx);
+				ctx = NULL;
 				goto err_out;
 			}
 			do {
@@ -941,13 +942,13 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 	 * only then remove WIN32 name.
 	 */
 	actx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!actx) {
+	if (IS_ERR(actx)) {
 		ntfs_error(sb, "%s, Failed to get search context", __func__);
 		if (need_lock) {
 			mutex_unlock(&dir_ni->mrec_lock);
 			mutex_unlock(&ni->mrec_lock);
 		}
-		return -ENOMEM;
+		return PTR_ERR(actx);
 	}
 search:
 	while ((err = ntfs_attr_lookup(AT_FILE_NAME, AT_UNNAMED, 0, CASE_SENSITIVE,
@@ -1710,9 +1711,9 @@ static struct dentry *ntfs_get_parent(struct dentry *child_dent)
 		return ERR_CAST(mrec);
 	/* Find the first file name attribute in the mft record. */
 	ctx = ntfs_attr_get_search_ctx(ni, mrec);
-	if (unlikely(!ctx)) {
+	if (IS_ERR(ctx)) {
 		unmap_mft_record(ni);
-		return ERR_PTR(-ENOMEM);
+		return ERR_PTR(PTR_ERR(ctx));
 	}
 try_next:
 	err = ntfs_attr_lookup(AT_FILE_NAME, NULL, 0, CASE_SENSITIVE, 0, NULL,
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index df09c277ee54..9bf5a626abbc 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -527,8 +527,9 @@ static int ntfs_write_volume_flags(struct ntfs_volume *vol,
 		goto done;
 
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto put_unm_err_out;
 	}
 
@@ -650,8 +651,9 @@ int ntfs_write_volume_label(struct ntfs_volume *vol, char *label)
 
 	mutex_lock(&vol_ni->mrec_lock);
 	ctx = ntfs_attr_get_search_ctx(vol_ni, NULL);
-	if (!ctx) {
-		ret = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		ret = PTR_ERR(ctx);
+		ctx = NULL;
 		goto out;
 	}
 
@@ -1834,8 +1836,10 @@ static int load_system_files(struct ntfs_volume *vol)
 	}
 
 	ctx = ntfs_attr_get_search_ctx(NTFS_I(vol->vol_ino), m);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
+		ret = PTR_ERR(ctx);
 		ntfs_error(sb, "Failed to get attribute search context.");
+		ctx = NULL;
 		goto get_ctx_vol_failed;
 	}
 
diff --git a/fs/ntfs/wof.c b/fs/ntfs/wof.c
index 294dbe5d711f..e64f40835957 100644
--- a/fs/ntfs/wof.c
+++ b/fs/ntfs/wof.c
@@ -306,8 +306,9 @@ static int parse_wof_chunk_table(struct ntfs_inode *base_ni,
 
 		mutex_lock(&base_ni->mrec_lock);
 		ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-		if (!ctx) {
-			ret = -ENOMEM;
+		if (IS_ERR(ctx)) {
+			ret = PTR_ERR(ctx);
+			ctx = NULL;
 			goto out_unlock_mrec;
 		}
 		ret = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
@@ -394,8 +395,9 @@ static int ntfs_read_wof_chunk(struct ntfs_volume *vol,
 
 	mutex_lock(&base_ni->mrec_lock);
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto out_unlock_mrec;
 	}
 
-- 
2.51.0

