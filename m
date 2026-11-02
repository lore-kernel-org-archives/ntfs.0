Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605078;
	b=TSZY2POWXUVV5/ixM+iGwjEpzh99UvN99MTVl5CT1hKWmL13/zNw8NDmWtIWWDqBBnO0
	 r85va8QL9MGNicoZJKB5YlDRRcc66rizgvMiky7vTTCg96+HyCmzqPDD9kqpYn/Nx6CFX
	 kOW4L7XEumh9GIz+MJSV9vL66nem+Lnr1+W9fCgL9QFhLABDtyNvISYlnvyWTg00KLB4R
	 0mVj5sBHrB/qAeb3S6HNpu5Nlwms0uc1IALYRWMoezSUxutoPZDazc/X6iJERxXmUSLEt
	 r9r5tRcnKNFDBJAfSIvKJdnS/qLou47m38uqORnoO8uTY5q3vMSnKRWbK/5G7fO+IqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605078;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=L7QKOFu0gDyxciz6uxR1t/9m3fWCnDoxj4F7dIcxigQ=;
	b=iAu+nqbl8MjRARfBDTP83aUR6ClDuT+MZzhUVxSakjw7wbscx9BprrYhQDcQxQ8CeNOv
	 IUx2KepYqZAZNykhQPLQyPiZciPOOmP+xcmkM7gdEN1zBxcreCCN2Pg5gJOGcb9LOyMmk
	 hQpoj3dUfzO6Kw+GNfEpCTCit2M3YOVX4mTLxFWS3MkkTaCR+NmNrtBbmcRrGqWmiV3dH
	 8vm65vlhV2LpunubPRAybmqFAcaDNssC4FOWt0yrPTWhigHvfIXlDCnJwvLlDk2GJHH4W
	 EuZku/92hmC+QHuI6txiBYi79pruPYGx6UDdSGGQMRAfIzJjTF6sXIxbavnNpch5Zzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=QAc4Weaf;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FE4606A327
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6FE4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=QAc4Weaf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=L7
	QKOFu0gDyxciz6uxR1t/9m3fWCnDoxj4F7dIcxigQ=; b=QAc4Weaf4SMOpghHjc
	p4qCPbgjAEv06TmWGXyWidJSoX4PN+wc/4weJKYdrAouRSStbpP2jVbjbw5uVy8m
	WDLZemVOoBX7tK0cJbYFF+6OODuoes+c0ILBfT2HTMzLs8btXHb/OSw5svx5lPMy
	h4VFfkzqVRpS5Cv7TAOXvYQww=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3N9rIPehqahKgEw--.3981S6;
	Mon, 02 Nov 2026 15:37:47 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>
Subject: [PATCH v5 20/31] ntfs: preserve index traversal errors and directory retries
Date: Mon,  2 Nov 2026 15:35:21 +0800
Message-Id: <20261102073532.98873-21-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3N9rIPehqahKgEw--.3981S6
X-Coremail-Antispam: 1Uf129KBjvAXoW3Cr43ZF1rCFykZry7ArWfuFg_yoW8GrW8Zo
	WfArs09wn5uryUAF129w12qFy7ZayDG3y5tw48Gr4kuwsrCw4DCw47G345X3y3uw4rWFs8
	Zr1Iqwn3JFZ7Jry8n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUFjgxDUUUU
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC8AtWP2roPcvkfQAA3-

From: Dandan Wu <wudandan@kylinos.cn>

Index-root and allocation lookups collapse errors into NULL, and
tree traversal can turn failures into EIO or EOF. Return error pointers
and update all callers together, including both tree-walk directions.
Report missing or malformed required index metadata as EFSCORRUPTED.

Let readdir return traversal errors without marking the directory as
exhausted. Resume from the insertion position after a saved key is
deleted, advance past consumed entries before a partial result, and
retain the saved key when lookup fails before consuming it.

Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
 fs/ntfs/dir.c   |  19 +++++--
 fs/ntfs/index.c | 141 ++++++++++++++++++++++++++++++------------------
 2 files changed, 103 insertions(+), 57 deletions(-)

diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index afee30f8b501..7854a06a83b5 100644
--- a/fs/ntfs/dir.c
+++ b/fs/ntfs/dir.c
@@ -805,7 +805,9 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 		err = ntfs_index_lookup(private->key,
 					le16_to_cpu(private->key_length),
 					ictx);
-		if (!err) {
+		if (!err || err == -ENOENT) {
+			/* A deleted resume key leaves the next entry in the context. */
+			err = 0;
 			next = ictx->entry;
 			/*
 			 * Update ie_pos with private->curr_pos
@@ -819,6 +821,8 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 					goto out;
 			}
 
+			if (next->flags & INDEX_ENTRY_END)
+				goto next_entry;
 			goto nextdir;
 		} else {
 			goto out;
@@ -879,8 +883,9 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 
 	if (next->flags & INDEX_ENTRY_NODE) {
 		ictx->ia_ni = ntfs_ia_open(ictx, ictx->idx_ni);
-		if (!ictx->ia_ni) {
-			err = -EINVAL;
+		if (IS_ERR(ictx->ia_ni)) {
+			err = PTR_ERR(ictx->ia_ni);
+			ictx->ia_ni = NULL;
 			goto out;
 		}
 
@@ -901,6 +906,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 		goto nextdir;
 
 	while (1) {
+next_entry:
 		next = ntfs_index_next(next, ictx);
 		if (IS_ERR(next)) {
 			err = PTR_ERR(next);
@@ -989,7 +995,11 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 			private->key_length = next->key_length;
 			break;
 		}
+		/* The saved key is consumed; retry from the next offset. */
+		kfree(private->key);
+		private->key = NULL;
 		ie_pos += le16_to_cpu(next->length);
+		actor->pos = ie_pos;
 	}
 
 	if (!err)
@@ -1015,9 +1025,8 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 	if (err) {
 		if (private) {
 			private->curr_pos = actor->pos;
-			private->end_in_iterate = true;
+			private->end_in_iterate = false;
 		}
-		err = 0;
 	}
 	ntfs_index_ctx_put(ictx);
 	kfree(name);
diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index cd9f31da5189..4a6084b884d9 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -599,36 +599,47 @@ int ntfs_index_root_inconsistent(struct ntfs_volume *vol,
 static struct index_root *ntfs_ir_lookup(struct ntfs_inode *ni, __le16 *name,
 		u32 name_len, struct ntfs_attr_search_ctx **ctx)
 {
+	int report_err = 0;
 	struct attr_record *a;
-	struct index_root *ir = NULL;
+	struct index_root *ir;
+	int err;
 
 	ntfs_debug("Entering\n");
 	*ctx = ntfs_attr_get_search_ctx(ni, NULL);
 	if (IS_ERR(*ctx)) {
 		ntfs_error(ni->vol->sb, "%s, Failed to get search context", __func__);
+		err = PTR_ERR(*ctx);
 		*ctx = NULL;
-		return NULL;
+		return ERR_PTR(err);
 	}
 
-	if (ntfs_attr_lookup(AT_INDEX_ROOT, name, name_len, CASE_SENSITIVE,
-				0, NULL, 0, *ctx)) {
+	err = ntfs_attr_lookup(AT_INDEX_ROOT, name, name_len, CASE_SENSITIVE,
+			       0, NULL, 0, *ctx);
+	if (err) {
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
+		}
 		ntfs_error(ni->vol->sb, "Failed to lookup $INDEX_ROOT");
 		goto err_out;
 	}
 
 	a = (*ctx)->attr;
 	if (a->non_resident) {
+		report_err = -EFSCORRUPTED;
 		ntfs_error(ni->vol->sb, "Non-resident $INDEX_ROOT detected");
+		err = -EFSCORRUPTED;
 		goto err_out;
 	}
 
 	ir = (struct index_root *)((char *)a + le16_to_cpu(a->data.resident.value_offset));
-err_out:
-	if (!ir) {
-		ntfs_attr_put_search_ctx(*ctx);
-		*ctx = NULL;
-	}
 	return ir;
+err_out:
+	ntfs_attr_put_search_ctx(*ctx);
+	*ctx = NULL;
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(ni), report_err);
+	return ERR_PTR(err);
 }
 
 static struct index_root *ntfs_ir_lookup2(struct ntfs_inode *ni, __le16 *name, u32 len)
@@ -637,7 +648,7 @@ static struct index_root *ntfs_ir_lookup2(struct ntfs_inode *ni, __le16 *name, u
 	struct index_root *ir;
 
 	ir = ntfs_ir_lookup(ni, name, len, &ctx);
-	if (ir)
+	if (!IS_ERR(ir))
 		ntfs_attr_put_search_ctx(ctx);
 	return ir;
 }
@@ -650,8 +661,8 @@ static int ntfs_ir_move_to_base(struct ntfs_index_context *icx)
 	int ret = 0;
 
 	ir = ntfs_ir_lookup(icx->idx_ni, icx->name, icx->name_len, &ctx);
-	if (!ir)
-		return -ENOENT;
+	if (IS_ERR(ir))
+		return PTR_ERR(ir);
 
 	if (ctx->ntfs_ino->mft_no != icx->idx_ni->mft_no) {
 		ret = ntfs_attr_record_move_to(ctx, icx->idx_ni);
@@ -768,7 +779,7 @@ struct ntfs_inode *ntfs_ia_open(struct ntfs_index_context *icx, struct ntfs_inod
 		ntfs_error(icx->idx_ni->vol->sb,
 				"Failed to open index allocation of inode %llu",
 				(unsigned long long)ni->mft_no);
-		return NULL;
+		return ERR_CAST(ia_vi);
 	}
 
 	return NTFS_I(ia_vi);
@@ -868,6 +879,7 @@ static int ntfs_icx_parent_dec(struct ntfs_index_context *icx)
  */
 int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_context *icx)
 {
+	int report_err = 0;
 	s64 old_vcn, vcn;
 	struct ntfs_inode *ni = icx->idx_ni;
 	struct super_block *sb = ni->vol->sb;
@@ -884,12 +896,13 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 	}
 
 	ir = ntfs_ir_lookup(ni, icx->name, icx->name_len, &icx->actx);
-	if (!ir)
-		return -EIO;
+	if (IS_ERR(ir))
+		return PTR_ERR(ir);
 
 	icx->block_size = le32_to_cpu(ir->index_block_size);
 	if (icx->block_size < NTFS_BLOCK_SIZE) {
-		err = -EINVAL;
+		report_err = -EFSCORRUPTED;
+		err = -EFSCORRUPTED;
 		ntfs_error(sb,
 			"Index block size (%d) is smaller than the sector size (%d)",
 			icx->block_size, NTFS_BLOCK_SIZE);
@@ -923,8 +936,9 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 
 	/* Child node present, descend into it. */
 	icx->ia_ni = ntfs_ia_open(icx, ni);
-	if (!icx->ia_ni) {
-		err = -EIO;
+	if (IS_ERR(icx->ia_ni)) {
+		err = PTR_ERR(icx->ia_ni);
+		icx->ia_ni = NULL;
 		goto err_out;
 	}
 
@@ -959,7 +973,7 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 
 	if ((ib->index.flags & NODE_MASK) == LEAF_NODE) {
 		err = -EFSCORRUPTED;
-		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
+		report_err = -EFSCORRUPTED;
 		ntfs_error(icx->idx_ni->vol->sb,
 			"Index entry with child node found in a leaf node in inode 0x%llx.\n",
 			(unsigned long long)ni->mft_no);
@@ -975,6 +989,8 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 	kvfree(ib);
 	if (!err)
 		err = -EIO;
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(ni), report_err);
 	return err;
 done:
 	icx->entry = ie;
@@ -1184,7 +1200,8 @@ static s64 ntfs_ibm_get_free(struct ntfs_index_context *icx)
 	return vcn;
 }
 
-static struct index_block *ntfs_ir_to_ib(struct index_root *ir, s64 ib_vcn)
+static struct index_block *ntfs_ir_to_ib(struct ntfs_index_context *icx,
+					 struct index_root *ir, s64 ib_vcn)
 {
 	struct index_block *ib;
 	struct index_entry *ie_last;
@@ -1196,7 +1213,7 @@ static struct index_block *ntfs_ir_to_ib(struct index_root *ir, s64 ib_vcn)
 
 	ib = ntfs_ib_alloc(ib_vcn, le32_to_cpu(ir->index_block_size), LEAF_NODE);
 	if (!ib)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	ies_start = (char *)ntfs_ie_get_first(&ir->index);
 	ies_end   = (char *)ntfs_ie_get_end(&ir->index);
@@ -1211,9 +1228,11 @@ static struct index_block *ntfs_ir_to_ib(struct index_root *ir, s64 ib_vcn)
 	ib_cap = le32_to_cpu(ib->index.allocated_size) -
 			le32_to_cpu(ib->index.entries_offset);
 	if ((u32)i > ib_cap) {
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni),
+						-EFSCORRUPTED);
 		ntfs_error(NULL, "Entries (%d B) exceed IB capacity", i);
 		kvfree(ib);
-		return NULL;
+		return ERR_PTR(-EFSCORRUPTED);
 	}
 
 	memcpy(ntfs_ie_get_first(&ib->index), ies_start, i);
@@ -1323,8 +1342,11 @@ static int ntfs_ia_add(struct ntfs_index_context *icx)
 	}
 
 	icx->ia_ni = ntfs_ia_open(icx, icx->idx_ni);
-	if (!icx->ia_ni)
-		return -ENOENT;
+	if (IS_ERR(icx->ia_ni)) {
+		ret = PTR_ERR(icx->ia_ni);
+		icx->ia_ni = NULL;
+		return ret;
+	}
 
 	return 0;
 }
@@ -1344,8 +1366,8 @@ static int ntfs_ir_reparent(struct ntfs_index_context *icx)
 	ntfs_debug("Entering\n");
 
 	ir = ntfs_ir_lookup2(icx->idx_ni, icx->name, icx->name_len);
-	if (!ir) {
-		ret = -ENOENT;
+	if (IS_ERR(ir)) {
+		ret = PTR_ERR(ir);
 		goto out;
 	}
 
@@ -1362,14 +1384,15 @@ static int ntfs_ir_reparent(struct ntfs_index_context *icx)
 	}
 
 	ir = ntfs_ir_lookup2(icx->idx_ni, icx->name, icx->name_len);
-	if (!ir) {
-		ret = -ENOENT;
+	if (IS_ERR(ir)) {
+		ret = PTR_ERR(ir);
 		goto clear_bmp;
 	}
 
-	ib = ntfs_ir_to_ib(ir, new_ib_vcn);
-	if (ib == NULL) {
-		ret = -EIO;
+	ib = ntfs_ir_to_ib(icx, ir, new_ib_vcn);
+	if (IS_ERR(ib)) {
+		ret = PTR_ERR(ib);
+		ib = NULL;
 		ntfs_error(icx->idx_ni->vol->sb, "Failed to move index root to index block");
 		goto clear_bmp;
 	}
@@ -1380,8 +1403,8 @@ static int ntfs_ir_reparent(struct ntfs_index_context *icx)
 
 retry:
 	ir = ntfs_ir_lookup(icx->idx_ni, icx->name, icx->name_len, &ctx);
-	if (!ir) {
-		ret = -ENOENT;
+	if (IS_ERR(ir)) {
+		ret = PTR_ERR(ir);
 		goto clear_bmp;
 	}
 
@@ -1502,8 +1525,8 @@ static int ntfs_ir_truncate(struct ntfs_index_context *icx, int data_size)
 	if (!ret) {
 		i_size_write(VFS_I(icx->idx_ni), icx->idx_ni->initialized_size);
 		icx->ir = ntfs_ir_lookup2(icx->idx_ni, icx->name, icx->name_len);
-		if (!icx->ir)
-			return -ENOENT;
+		if (IS_ERR(icx->ir))
+			return PTR_ERR(icx->ir);
 
 		if (!shrink)
 			icx->ir->index.allocated_size = cpu_to_le32(data_size);
@@ -1605,8 +1628,8 @@ static int ntfs_ir_insert_median(struct ntfs_index_context *icx, struct index_en
 	ntfs_debug("Entering\n");
 
 	icx->ir = ntfs_ir_lookup2(icx->idx_ni, icx->name, icx->name_len);
-	if (!icx->ir)
-		return -ENOENT;
+	if (IS_ERR(icx->ir))
+		return PTR_ERR(icx->ir);
 
 	new_size = le32_to_cpu(icx->ir->index.index_length) +
 		le16_to_cpu(median->length);
@@ -1618,8 +1641,8 @@ static int ntfs_ir_insert_median(struct ntfs_index_context *icx, struct index_en
 		return ret;
 
 	icx->ir = ntfs_ir_lookup2(icx->idx_ni, icx->name, icx->name_len);
-	if (!icx->ir)
-		return -ENOENT;
+	if (IS_ERR(icx->ir))
+		return PTR_ERR(icx->ir);
 
 	return ntfs_ih_insert(&icx->ir->index, median, new_vcn,
 			ntfs_icx_parent_pos(icx));
@@ -1999,8 +2022,11 @@ static int ntfs_index_rm_node(struct ntfs_index_context *icx)
 
 	if (!icx->ia_ni) {
 		icx->ia_ni = ntfs_ia_open(icx, icx->idx_ni);
-		if (!icx->ia_ni)
-			return -EINVAL;
+		if (IS_ERR(icx->ia_ni)) {
+			ret = PTR_ERR(icx->ia_ni);
+			icx->ia_ni = NULL;
+			return ret;
+		}
 	}
 
 	ib = kvzalloc(icx->block_size, GFP_NOFS);
@@ -2214,11 +2240,13 @@ struct index_entry *ntfs_index_walk_down(struct index_entry *ie, struct ntfs_ind
 
 		ictx->parent_pos[ictx->pindex] = 0;
 		ictx->parent_vcn[ictx->pindex] = vcn;
-		if (!ntfs_ib_read(ictx, vcn, ictx->ib)) {
+		err = ntfs_ib_read(ictx, vcn, ictx->ib);
+		if (!err) {
 			ictx->entry = ntfs_ie_get_first(&ictx->ib->index);
 			entry = ictx->entry;
-		} else
-			entry = ERR_PTR(-EIO);
+		} else {
+			entry = ERR_PTR(err);
+		}
 	} while (!IS_ERR(entry) && (entry->flags & INDEX_ENTRY_NODE));
 
 	return entry;
@@ -2236,6 +2264,7 @@ static struct index_entry *ntfs_index_walk_up(struct index_entry *ie,
 {
 	struct index_entry *entry = ie;
 	s64 vcn;
+	int err;
 
 	if (ictx->pindex <= 0)
 		return NULL;
@@ -2252,21 +2281,23 @@ static struct index_entry *ntfs_index_walk_up(struct index_entry *ie,
 				ntfs_attr_put_search_ctx(ictx->actx);
 			ictx->ir = ntfs_ir_lookup(ictx->idx_ni, ictx->name,
 						  ictx->name_len, &ictx->actx);
-			if (ictx->ir)
+			if (!IS_ERR(ictx->ir))
 				entry = ntfs_ie_get_by_pos(
 					&ictx->ir->index,
 					ictx->parent_pos[ictx->pindex]);
 			else
-				entry = NULL;
+				return ERR_CAST(ictx->ir);
 		} else {
 			/* up into non-root node */
 			vcn = ictx->parent_vcn[ictx->pindex];
-			if (!ntfs_ib_read(ictx, vcn, ictx->ib)) {
+			err = ntfs_ib_read(ictx, vcn, ictx->ib);
+			if (!err) {
 				entry = ntfs_ie_get_by_pos(
 					&ictx->ib->index,
 					ictx->parent_pos[ictx->pindex]);
-			} else
-				entry = NULL;
+			} else {
+				return ERR_PTR(err);
+			}
 		}
 		ictx->entry = entry;
 	} while (entry && (ictx->pindex > 0) &&
@@ -2276,7 +2307,7 @@ static struct index_entry *ntfs_index_walk_up(struct index_entry *ie,
 
 /*
  * ntfs_index_next - get next entry in an index according to collating sequence.
- * Returns next entry or NULL if none.
+ * Returns the next entry, NULL if none, or an error pointer.
  *
  * Sample layout :
  *
@@ -2326,8 +2357,11 @@ struct index_entry *ntfs_index_next(struct index_entry *ie, struct ntfs_index_co
 		if (flags & INDEX_ENTRY_NODE) {
 			if (!ictx->ia_ni) {
 				ictx->ia_ni = ntfs_ia_open(ictx, ictx->idx_ni);
-				if (!ictx->ia_ni)
-					return ERR_PTR(-EIO);
+				if (IS_ERR(ictx->ia_ni)) {
+					next = ERR_CAST(ictx->ia_ni);
+					ictx->ia_ni = NULL;
+					return next;
+				}
 			}
 
 			next = ntfs_index_walk_down(next, ictx);
@@ -2341,6 +2375,9 @@ struct index_entry *ntfs_index_next(struct index_entry *ie, struct ntfs_index_co
 		}
 	}
 
+	if (IS_ERR(next))
+		return next;
+
 	/* return NULL if stuck at end of a block */
 	if (next && (next->flags & INDEX_ENTRY_END))
 		next = NULL;

