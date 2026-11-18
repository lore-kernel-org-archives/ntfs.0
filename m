Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992864;
	b=4HqbX87XIvb/N8lYFpVqbpk6h7SWMUJ8BZpkkplTx/3D4DDeiFNB6jHGyFw/bvrrGG9K
	 6LKrQ4d0akUlCPikCE/bQducJUriha/rjbIcNmOVLOpo3EQ2I5J2xrkNQ59i0y/vLY2m8
	 yp4sLElTzVAQiXcts3gHOzgwjnAt/L5FLX/XyDwRZEfkEsxh2Ace+Z7G6T4kGk3ASiEhM
	 9o5uLBRLMnNfCZhUrtYLZ7dPW0y7a8Ea6CvIinLWaiR2JL8b5AOwX/131CJ2oeeSxCTCI
	 R292wLTB5GdiztFwlGxT/JIRnf9yHtN8eEuj+ASEk3vDPWiPcWuVMW0cClvtF09VLsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992864;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=hcK9kHZSENx2nPAhL2CVxHE/w86Z+MWqPG8BqWBSFT4=;
	b=LF3Q5tmKizmzIzU/kP/QR8c7C/ZyRWD28R/ETJACg0fVJ7QG3EMgBgyIiMStLqabT6nL
	 2892OMa5iBbdD5WU0Jj86cPO+ZpNBDQWsogzy08q+f1y5Dyc+ddZ/y1apJ0mEDYhACnCK
	 oh+2BKtHmTXf3LVwR7FOgwOciGUvcN67d+50LMaixqNEuc9jPs1OI/7xsuK7W+DRQ9Fz3
	 HUBkqvF/uxkLEOWolMhVtV3CZu6jor+oJ0Wnn0PPsQmOPWYdbaBTRFi4y9JEnfLjjY5ne
	 /gA5Sr80qaC6D/90iCKUL2k0d1lALr8YegGlILGe8BeWBhfhuedlGvocI/6VnD5UYLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HOXJD+XR;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FAB606A320
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52FAB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HOXJD+XR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=hc
	K9kHZSENx2nPAhL2CVxHE/w86Z+MWqPG8BqWBSFT4=; b=HOXJD+XROcj0N5uqqR
	jB0cwzEB00bpvC/EvngtyEH7+zK7uJjekV+kvjeH0XPZqCLTn81WXGNYlFQBooiF
	QLR1al6Ie15mf0+lAJUzLc+yPeCYsa0jY4gG9Ba3jTC9UwNKBh3LEXtyk0Fr5RJE
	Ab3PYZ9PnPcLw3UaUO97Ew0Ds=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDn7yTNav1qnmzWIQ--.7895S6;
	Wed, 18 Nov 2026 17:07:28 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 04/37] ntfs: preserve attribute search context initialization errors
Date: Wed, 18 Nov 2026 17:06:28 +0800
Message-Id: <20261118090701.1858849-5-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wDn7yTNav1qnmzWIQ--.7895S6
X-Coremail-Antispam: 1Uf129KBjvAXoWfAr1kWw45uw43ArWxCw18AFb_yoW5XFykGo
	WfCF4Fvwn5uw1Yywnakw1kKF9xAas8C3ykJayYgr4qkFsFq34qyw43Zw15W34I93WrKrW5
	X348Jr4rZr1fJ343n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8HqcUUUUU
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC7xDo0Wr9atC0YwAA38

From: Xuewen Wang <wangxuewen@kylinos.cn>

ntfs_attr_get_search_ctx() returns NULL for both allocation and MFT
mapping failures, causing callers to misreport mapping errors as ENOMEM.

Return error pointers carrying the original errno and convert all callers
and the documented usage. Clear error pointers before shared cleanup.
Make ntfs_attr_exist() return 1 for present, 0 only for a lookup miss and
a negative errno on failure. Update the index and reparse callers so a
failed lookup cannot be mistaken for an absent attribute.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes in v6:
Move the context API conversion and all its callers before the helpers.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.
- No undefined references to ntfs_report_* or fserror_report_*.

 fs/ntfs/attrib.c       | 117 ++++++++++++++++++++++-------------------
 fs/ntfs/attrib.h       |   4 +-
 fs/ntfs/attrlist.c     |   5 +-
 fs/ntfs/dir.c          |  18 ++++---
 fs/ntfs/ea.c           |  10 ++--
 fs/ntfs/file.c         |   4 +-
 fs/ntfs/index.c        |  14 +++--
 fs/ntfs/inode.c        |  51 ++++++++++--------
 fs/ntfs/iomap.c        |  10 ++--
 fs/ntfs/mft.c          |  23 ++++----
 fs/ntfs/named_stream.c |  18 ++++---
 fs/ntfs/namei.c        |  13 ++---
 fs/ntfs/reparse.c      |   7 ++-
 fs/ntfs/super.c        |  14 +++--
 fs/ntfs/wof.c          |  10 ++--
 15 files changed, 183 insertions(+), 135 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index ad2691c3457d..5e9828dc92ea 100644
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
@@ -1657,13 +1658,13 @@ int ntfs_attr_lookup(const __le32 type, const __le16 *name,
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
@@ -1679,7 +1680,7 @@ static bool ntfs_attr_init_search_ctx(struct ntfs_attr_search_ctx *ctx,
 	ctx->base_mrec = NULL;
 	ctx->base_attr = NULL;
 	ctx->mapped_base_mrec = false;
-	return true;
+	return 0;
 }
 
 /*
@@ -1723,23 +1724,22 @@ void ntfs_attr_reinit_search_ctx(struct ntfs_attr_search_ctx *ctx)
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
 
@@ -2036,8 +2036,9 @@ static int __ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_s
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
@@ -2389,8 +2390,8 @@ int ntfs_attr_set_initialized_size(struct ntfs_inode *ni, loff_t new_size)
 		return -EINVAL;
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx)
-		return -ENOMEM;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			       CASE_SENSITIVE, 0, NULL, 0, ctx);
@@ -2490,10 +2491,10 @@ int ntfs_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 
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
@@ -2614,9 +2615,9 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 
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
@@ -3188,9 +3189,10 @@ int ntfs_attr_open(struct ntfs_inode *ni, const __le32 type,
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
 
@@ -3364,9 +3366,9 @@ int ntfs_attr_map_whole_runlist(struct ntfs_inode *ni)
 		base_ni = ni;
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(sb, "%s: Failed to get search context", __func__);
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 
 	/* Map all attribute extents one by one. */
@@ -3493,9 +3495,9 @@ int ntfs_attr_record_move_to(struct ntfs_attr_search_ctx *ctx, struct ntfs_inode
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
@@ -3846,9 +3848,9 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 		base_ni = ni;
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(sb, "%s: Failed to get search context", __func__);
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 
 	/* Fill attribute records with new mapping pairs. */
@@ -4404,9 +4406,10 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
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
 
@@ -4457,9 +4460,9 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 
 	/* Get the first attribute record. */
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(vol->sb, "%s: Failed to get search context", __func__);
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
@@ -4776,10 +4779,11 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
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
 
@@ -4890,9 +4894,9 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 
 	/* Get the attribute record that needs modification. */
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(sb, "%s: Failed to get search context", __func__);
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 
 	err = ntfs_attr_lookup(attr_ni->type, attr_ni->name, attr_ni->name_len,
@@ -5352,9 +5356,9 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 		return err;
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(vol->sb, "%s: Failed to get search context", __func__);
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
@@ -5539,9 +5543,9 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
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
@@ -5555,9 +5559,9 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 
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
@@ -5578,6 +5582,7 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 	return ret;
 }
 
+/* Return 1 if present, 0 if absent, or a negative errno on failure. */
 int ntfs_attr_exist(struct ntfs_inode *ni, const __le32 type, __le16 *name,
 		u32 name_len)
 {
@@ -5588,10 +5593,10 @@ int ntfs_attr_exist(struct ntfs_inode *ni, const __le32 type, __le16 *name,
 	ntfs_debug("Entering\n");
 
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(ni->vol->sb, "%s: Failed to get search context",
 				__func__);
-		return 0;
+		return PTR_ERR(ctx);
 	}
 
 	ic = type == AT_DATA && name_len ? IGNORE_CASE : CASE_SENSITIVE;
@@ -5599,7 +5604,9 @@ int ntfs_attr_exist(struct ntfs_inode *ni, const __le32 type, __le16 *name,
 			0, NULL, 0, ctx);
 	ntfs_attr_put_search_ctx(ctx);
 
-	return !ret;
+	if (ret == -ENOENT)
+		return 0;
+	return ret ? ret : 1;
 }
 
 /*
@@ -5773,8 +5780,8 @@ int ntfs_non_resident_attr_insert_range(struct ntfs_inode *ni, s64 start_vcn, s6
 		return ret;
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
-		ret = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		ret = PTR_ERR(ctx);
 		return ret;
 	}
 
@@ -5862,8 +5869,9 @@ int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn,
 	up_write(&ni->runlist.lock);
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
-		ret = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		ret = PTR_ERR(ctx);
+		ctx = NULL;
 		goto out_rl;
 	}
 
@@ -5981,8 +5989,9 @@ int ntfs_attr_fallocate(struct ntfs_inode *ni, loff_t start, loff_t byte_len, bo
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
index ce87799a28e8..a93f3566603b 100644
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
@@ -846,8 +847,9 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 	}
 
 	ctx = ntfs_attr_get_search_ctx(ndir, NULL);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto out;
 	}
 
@@ -1048,9 +1050,9 @@ int ntfs_check_empty_dir(struct ntfs_inode *ni, struct mft_record *ni_mrec)
 		return 0;
 
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(ni->vol->sb, "Failed to get search context");
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 
 	/* Find the index root attribute in the mft record. */
@@ -1149,8 +1151,8 @@ static int ntfs_dir_fsync(struct file *filp, loff_t start, loff_t end,
 		return -EIO;
 
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx)
-		return -ENOMEM;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL_CHILD);
 	while (!(err = ntfs_attr_lookup(AT_FILE_NAME, NULL, 0, 0, 0, NULL, 0, ctx))) {
diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 68397b2a4e43..817050aa24d8 100644
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
index 5ab0e3437d67..55c48d174b28 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -324,8 +324,8 @@ int ntfs_file_fsync(struct file *filp, loff_t start, loff_t end,
 	write_inode_now(vi, !datasync);
 
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx)
-		return -ENOMEM;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL_CHILD);
 	while (!(err = ntfs_attr_lookup(AT_UNUSED, NULL, 0, 0, 0, NULL, 0, ctx))) {
diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index b4462f760e3b..42e15ae2686f 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -654,8 +654,9 @@ static struct index_root *ntfs_ir_lookup(struct ntfs_inode *ni, __le16 *name,
 
 	ntfs_debug("Entering\n");
 	*ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!*ctx) {
+	if (IS_ERR(*ctx)) {
 		ntfs_error(ni->vol->sb, "%s, Failed to get search context", __func__);
+		*ctx = NULL;
 		return NULL;
 	}
 
@@ -1100,8 +1101,9 @@ static int ntfs_ibm_add(struct ntfs_index_context *icx)
 
 	ntfs_debug("Entering\n");
 
-	if (ntfs_attr_exist(icx->idx_ni, AT_BITMAP, icx->name, icx->name_len))
-		return 0;
+	ret = ntfs_attr_exist(icx->idx_ni, AT_BITMAP, icx->name, icx->name_len);
+	if (ret)
+		return ret < 0 ? ret : 0;
 	/*
 	 * AT_BITMAP must be at least 8 bytes.
 	 */
@@ -1343,7 +1345,11 @@ static int ntfs_ia_add(struct ntfs_index_context *icx)
 	if (ret)
 		return ret;
 
-	if (!ntfs_attr_exist(icx->idx_ni, AT_INDEX_ALLOCATION, icx->name, icx->name_len)) {
+	ret = ntfs_attr_exist(icx->idx_ni, AT_INDEX_ALLOCATION, icx->name,
+			      icx->name_len);
+	if (ret < 0)
+		return ret;
+	if (!ret) {
 		ret = ntfs_attr_add(icx->idx_ni, AT_INDEX_ALLOCATION, icx->name,
 					icx->name_len, NULL, 0);
 		if (ret) {
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index ba1f78fc8c66..a892540146b8 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -391,8 +391,8 @@ static int ntfs_non_resident_dealloc_clusters(struct ntfs_inode *ni)
 	int err = 0;
 
 	actx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!actx)
-		return -ENOMEM;
+	if (IS_ERR(actx))
+		return PTR_ERR(actx);
 	WARN_ON(actx->mrec->link_count != 0);
 
 	/**
@@ -798,8 +798,9 @@ static int ntfs_read_locked_inode(struct inode *vi)
 	}
 
 	ctx = ntfs_attr_get_search_ctx(ni, m);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto unm_err_out;
 	}
 
@@ -1410,8 +1411,9 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
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
@@ -1675,8 +1677,9 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
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
@@ -2067,8 +2070,9 @@ int ntfs_read_inode_mount(struct inode *vi)
 	vi->i_mapping->a_ops = &ntfs_mft_aops;
 
 	ctx = ntfs_attr_get_search_ctx(ni, m);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto err_out;
 	}
 
@@ -2677,8 +2681,8 @@ static int ntfs_inode_sync_standard_information(struct inode *vi, struct mft_rec
 
 	/* Update the access times in the standard information attribute. */
 	ctx = ntfs_attr_get_search_ctx(ni, m);
-	if (unlikely(!ctx))
-		return -ENOMEM;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 	err = ntfs_attr_lookup(AT_STANDARD_INFORMATION, NULL, 0,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (unlikely(err)) {
@@ -2778,8 +2782,8 @@ int ntfs_inode_sync_filename(struct ntfs_inode *ni)
 	ntfs_debug("Entering for inode %llu\n", ni->mft_no);
 
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx)
-		return -ENOMEM;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	/* Collect the reparse tag, if any */
 	reparse_tag = cpu_to_le32(0);
@@ -3267,8 +3271,9 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 
 	/* Form attribute list. */
 	ctx = ntfs_attr_get_search_ctx(ni, ni_mrec);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto err_out;
 	}
 
@@ -3639,9 +3644,9 @@ int ntfs_inode_free_space(struct ntfs_inode *ni, int size)
 		return 0;
 
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx) {
+	if (IS_ERR(ctx)) {
 		ntfs_error(sb, "%s, Failed to get search context", __func__);
-		return -ENOMEM;
+		return PTR_ERR(ctx);
 	}
 
 	/*
@@ -3763,10 +3768,11 @@ s64 ntfs_inode_attr_pread(struct inode *vi, s64 pos, s64 count, u8 *buf)
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
 
@@ -4103,9 +4109,10 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
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
index b459d3e6e5fa..ce916707f69b 100644
--- a/fs/ntfs/iomap.c
+++ b/fs/ntfs/iomap.c
@@ -94,8 +94,9 @@ static int ntfs_read_iomap_begin_resident(struct inode *inode, loff_t offset, lo
 	mutex_lock(&base_ni->mrec_lock);
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto out;
 	}
 
@@ -667,8 +668,9 @@ static int ntfs_write_iomap_begin_resident(struct inode *inode, loff_t offset,
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
index d2852fc68838..34fccfaa11c5 100644
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
index 70c589207713..b102baa6a52f 100644
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
@@ -600,8 +600,9 @@ struct inode *ntfs_create_named_stream(const struct mnt_idmap *idmap,
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
 
@@ -1637,9 +1639,9 @@ int ntfs_ioctl_list_streams(struct file *filp, unsigned long arg)
 		return -ENOENT;
 	}
 	actx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!actx) {
+	if (IS_ERR(actx)) {
 		mutex_unlock(&ni->mrec_lock);
-		return -ENOMEM;
+		return PTR_ERR(actx);
 	}
 
 	while ((err = ntfs_attrs_walk(actx)) == 0) {
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index b46fe44b63b5..d2d9fe732014 100644
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
@@ -943,13 +944,13 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
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
@@ -1712,9 +1713,9 @@ static struct dentry *ntfs_get_parent(struct dentry *child_dent)
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
diff --git a/fs/ntfs/reparse.c b/fs/ntfs/reparse.c
index 2a6480211fe3..775e96a43771 100644
--- a/fs/ntfs/reparse.c
+++ b/fs/ntfs/reparse.c
@@ -787,7 +787,12 @@ static int ntfs_set_ntfs_reparse_data(struct ntfs_inode *ni, char *value, size_t
 		return -EINVAL;
 	xrni = xr->idx_ni;
 
-	if (!ntfs_attr_exist(ni, AT_REPARSE_POINT, AT_UNNAMED, 0)) {
+	err = ntfs_attr_exist(ni, AT_REPARSE_POINT, AT_UNNAMED, 0);
+	if (err < 0) {
+		ntfs_index_ctx_put(xr);
+		goto out;
+	}
+	if (!err) {
 		struct reparse_point rp = {0, };
 
 		/*
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 98e6449fd79f..79c2e1c4a2ed 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -498,8 +498,9 @@ static int ntfs_write_volume_flags(struct ntfs_volume *vol,
 		goto done;
 
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (!ctx) {
-		err = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto put_unm_err_out;
 	}
 
@@ -621,8 +622,9 @@ int ntfs_write_volume_label(struct ntfs_volume *vol, char *label)
 
 	mutex_lock(&vol_ni->mrec_lock);
 	ctx = ntfs_attr_get_search_ctx(vol_ni, NULL);
-	if (!ctx) {
-		ret = -ENOMEM;
+	if (IS_ERR(ctx)) {
+		ret = PTR_ERR(ctx);
+		ctx = NULL;
 		goto out;
 	}
 
@@ -1805,8 +1807,10 @@ static int load_system_files(struct ntfs_volume *vol)
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

