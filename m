Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993054;
	b=umOToFGbQ/Ep91WQ7iCyv6qzSvHhcndCE6SJeqy48BT5w0xBmMeZR59QswMoKEtOfNbh
	 y+zp7V+D+dzdBVhgAaxf+1JxbCc2XvLyXYZK+B8f2vW56AF9X6SePDO/F+8hGdHleeRg2
	 TnEIPgPSsGdubq/8J/vgFpT/KIPhMskk4G5AWtUEni0hvpLAU5JrR3yyK+AySWk2KpMn4
	 AAN4COb01wB5BzjrzX+zevlrS8EX5HtizxHKden9SK5haFryNkv3GtVkmd/ouRYKl1YiB
	 2P4fce3zbrn4ZtpF5uFYghKAnWrbbHmLVPqPhnm+ObjEYcq+vKzzXzP1lh2sqhMHZ9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993054;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=hQku02Rq2iPYx7Shc6qsEzR3D3nqhFXNdke18TH02d0=;
	b=Z/Z+lhpMB0HBtd6sCYphVgbxkEomUISvPEGBWkeY8dpZ4EGseimTGgD1T0dZOWAExYbB
	 b3QlK+oBKhORYSrDOW8Uoaox50z9NOnqIr87sW58cb81ccJYRK7z36MZ7H28MRJXTFYLY
	 3kAV4hnNatnR9JkUFezsNkV5LRaBFppv386F5ekK/4Dciv9rYJ/GFAFTRUK1Sswk69Hg8
	 tWIp8UU6AI6xUDbHo0rMAzhxpXXfRlL/JWgpN9likwGA/tbSLM953hAJxTyFLUGYjFg48
	 wN/fmXiLfSzfcA2yAia83WlOUc7Fn2OEni1KT69Now5Iv2RraYJa4O1mN27OEFaMmPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EADEDiaK;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79AE606A325
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C79AE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EADEDiaK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=hQ
	ku02Rq2iPYx7Shc6qsEzR3D3nqhFXNdke18TH02d0=; b=EADEDiaKFyRlmAY+Kb
	X/azDCHAsMAbi9nXBdabWn2/4ssv6ZUJ2qBhpxhJox9IfB7S16IHQ2Dl0W7qmWLq
	cYGKIuc6xtVtX+n7hDAIgdTS26/5Q6sRRMKCegAN+H0ox42Zfh59VnCF2b7fIKT0
	lL+1mCz5Y8JVu2CRA+KcMt/PA=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3UiuQa_1qEjvuGg--.61000S3;
	Wed, 18 Nov 2026 17:10:41 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 25/37] ntfs: preserve and report index traversal errors
Date: Wed, 18 Nov 2026 17:06:49 +0800
Message-Id: <20261118090701.1858849-26-wangxuewen_ky@163.com>
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
X-CM-TRANSID:PigvCgD3UiuQa_1qEjvuGg--.61000S3
X-Coremail-Antispam: 1Uf129KBjvAXoW3Cr43trW7tF1fCr1DKF4rZrb_yoW8Jw1kZo
	WfAr4q9ws3uryUAF129w12qFy7ZayDWw45tw48Gr4vkwsFkw4DCw47G345X3y3ua1FgFs8
	Zr1Iqwn3JFZ7Jry8n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU0mhFDUUUU
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzRIZAmr9a5Iu2QAA3d

From: Dandan Wu <wudandan@kylinos.cn>

Index-root and allocation lookups collapse errors into NULL, and tree
traversal can turn failures into EIO or EOF. Return error pointers and
update all callers together, including ntfs_icx_ia_ensure() and both
tree-walk directions. Clear failed allocation pointers before cleanup.

Report missing or malformed required index metadata as EFSCORRUPTED.
The preceding directory iteration fix retains retry state when traversal
returns an error.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
Changes in v6:
Update the new ntfs_icx_ia_ensure() caller for error pointers and clear
a failed allocation pointer before cleanup. Directory retry handling
is now a preceding patch.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.
- The final allocation guard and VCN validator passed 13 controlled cases.

 fs/ntfs/dir.c   |   5 +-
 fs/ntfs/index.c | 150 +++++++++++++++++++++++++++++++-----------------
 2 files changed, 99 insertions(+), 56 deletions(-)

diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index ed1d4188e947..69ed34fff23f 100644
--- a/fs/ntfs/dir.c
+++ b/fs/ntfs/dir.c
@@ -897,8 +897,9 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 
 	if (next->flags & INDEX_ENTRY_NODE) {
 		ictx->ia_ni = ntfs_ia_open(ictx, ictx->idx_ni);
-		if (!ictx->ia_ni) {
-			err = -EINVAL;
+		if (IS_ERR(ictx->ia_ni)) {
+			err = PTR_ERR(ictx->ia_ni);
+			ictx->ia_ni = NULL;
 			goto out;
 		}
 
diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 596fece97532..48efc2f3766d 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -104,10 +104,15 @@ static s64 ntfs_ib_pos_to_vcn(struct ntfs_index_context *icx, s64 pos)
 /* Open the index allocation inode if no earlier step of the operation did. */
 static int ntfs_icx_ia_ensure(struct ntfs_index_context *icx)
 {
+	int err;
+
 	if (!icx->ia_ni) {
 		icx->ia_ni = ntfs_ia_open(icx, icx->idx_ni);
-		if (!icx->ia_ni)
-			return -EIO;
+		if (IS_ERR(icx->ia_ni)) {
+			err = PTR_ERR(icx->ia_ni);
+			icx->ia_ni = NULL;
+			return err;
+		}
 	}
 	/* Without $INDEX_ALLOCATION the index inode is an empty resident stub. */
 	if (!NInoNonResident(icx->ia_ni)) {
@@ -660,36 +665,47 @@ int ntfs_index_root_inconsistent(struct ntfs_volume *vol,
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
@@ -698,7 +714,7 @@ static struct index_root *ntfs_ir_lookup2(struct ntfs_inode *ni, __le16 *name, u
 	struct index_root *ir;
 
 	ir = ntfs_ir_lookup(ni, name, len, &ctx);
-	if (ir)
+	if (!IS_ERR(ir))
 		ntfs_attr_put_search_ctx(ctx);
 	return ir;
 }
@@ -711,8 +727,8 @@ static int ntfs_ir_move_to_base(struct ntfs_index_context *icx)
 	int ret = 0;
 
 	ir = ntfs_ir_lookup(icx->idx_ni, icx->name, icx->name_len, &ctx);
-	if (!ir)
-		return -ENOENT;
+	if (IS_ERR(ir))
+		return PTR_ERR(ir);
 
 	if (ctx->ntfs_ino->mft_no != icx->idx_ni->mft_no) {
 		ret = ntfs_attr_record_move_to(ctx, icx->idx_ni);
@@ -829,7 +845,7 @@ struct ntfs_inode *ntfs_ia_open(struct ntfs_index_context *icx, struct ntfs_inod
 		ntfs_error(icx->idx_ni->vol->sb,
 				"Failed to open index allocation of inode %llu",
 				(unsigned long long)ni->mft_no);
-		return NULL;
+		return ERR_CAST(ia_vi);
 	}
 
 	return NTFS_I(ia_vi);
@@ -933,6 +949,7 @@ static int ntfs_icx_parent_dec(struct ntfs_index_context *icx)
  */
 int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_context *icx)
 {
+	int report_err = 0;
 	s64 old_vcn, vcn;
 	struct ntfs_inode *ni = icx->idx_ni;
 	struct super_block *sb = ni->vol->sb;
@@ -949,12 +966,13 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
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
@@ -988,8 +1006,9 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 
 	/* Child node present, descend into it. */
 	icx->ia_ni = ntfs_ia_open(icx, ni);
-	if (!icx->ia_ni) {
-		err = -EIO;
+	if (IS_ERR(icx->ia_ni)) {
+		err = PTR_ERR(icx->ia_ni);
+		icx->ia_ni = NULL;
 		goto err_out;
 	}
 
@@ -1024,7 +1043,7 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 
 	if ((ib->index.flags & NODE_MASK) == LEAF_NODE) {
 		err = -EFSCORRUPTED;
-		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
+		report_err = -EFSCORRUPTED;
 		ntfs_error(icx->idx_ni->vol->sb,
 			"Index entry with child node found in a leaf node in inode 0x%llx.\n",
 			(unsigned long long)ni->mft_no);
@@ -1040,6 +1059,8 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 	kvfree(ib);
 	if (!err)
 		err = -EIO;
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(ni), report_err);
 	return err;
 done:
 	icx->entry = ie;
@@ -1249,7 +1270,8 @@ static s64 ntfs_ibm_get_free(struct ntfs_index_context *icx)
 	return vcn;
 }
 
-static struct index_block *ntfs_ir_to_ib(struct index_root *ir, s64 ib_vcn)
+static struct index_block *ntfs_ir_to_ib(struct ntfs_index_context *icx,
+					 struct index_root *ir, s64 ib_vcn)
 {
 	struct index_block *ib;
 	struct index_entry *ie_last;
@@ -1261,7 +1283,7 @@ static struct index_block *ntfs_ir_to_ib(struct index_root *ir, s64 ib_vcn)
 
 	ib = ntfs_ib_alloc(ib_vcn, le32_to_cpu(ir->index_block_size), LEAF_NODE);
 	if (!ib)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	ies_start = (char *)ntfs_ie_get_first(&ir->index);
 	ies_end   = (char *)ntfs_ie_get_end(&ir->index);
@@ -1276,9 +1298,11 @@ static struct index_block *ntfs_ir_to_ib(struct index_root *ir, s64 ib_vcn)
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
@@ -1388,8 +1412,11 @@ static int ntfs_ia_add(struct ntfs_index_context *icx)
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
@@ -1409,8 +1436,8 @@ static int ntfs_ir_reparent(struct ntfs_index_context *icx)
 	ntfs_debug("Entering\n");
 
 	ir = ntfs_ir_lookup2(icx->idx_ni, icx->name, icx->name_len);
-	if (!ir) {
-		ret = -ENOENT;
+	if (IS_ERR(ir)) {
+		ret = PTR_ERR(ir);
 		goto out;
 	}
 
@@ -1427,14 +1454,15 @@ static int ntfs_ir_reparent(struct ntfs_index_context *icx)
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
@@ -1445,8 +1473,8 @@ static int ntfs_ir_reparent(struct ntfs_index_context *icx)
 
 retry:
 	ir = ntfs_ir_lookup(icx->idx_ni, icx->name, icx->name_len, &ctx);
-	if (!ir) {
-		ret = -ENOENT;
+	if (IS_ERR(ir)) {
+		ret = PTR_ERR(ir);
 		goto clear_bmp;
 	}
 
@@ -1567,8 +1595,8 @@ static int ntfs_ir_truncate(struct ntfs_index_context *icx, int data_size)
 	if (!ret) {
 		i_size_write(VFS_I(icx->idx_ni), icx->idx_ni->initialized_size);
 		icx->ir = ntfs_ir_lookup2(icx->idx_ni, icx->name, icx->name_len);
-		if (!icx->ir)
-			return -ENOENT;
+		if (IS_ERR(icx->ir))
+			return PTR_ERR(icx->ir);
 
 		if (!shrink)
 			icx->ir->index.allocated_size = cpu_to_le32(data_size);
@@ -1670,8 +1698,8 @@ static int ntfs_ir_insert_median(struct ntfs_index_context *icx, struct index_en
 	ntfs_debug("Entering\n");
 
 	icx->ir = ntfs_ir_lookup2(icx->idx_ni, icx->name, icx->name_len);
-	if (!icx->ir)
-		return -ENOENT;
+	if (IS_ERR(icx->ir))
+		return PTR_ERR(icx->ir);
 
 	new_size = le32_to_cpu(icx->ir->index.index_length) +
 		le16_to_cpu(median->length);
@@ -1683,8 +1711,8 @@ static int ntfs_ir_insert_median(struct ntfs_index_context *icx, struct index_en
 		return ret;
 
 	icx->ir = ntfs_ir_lookup2(icx->idx_ni, icx->name, icx->name_len);
-	if (!icx->ir)
-		return -ENOENT;
+	if (IS_ERR(icx->ir))
+		return PTR_ERR(icx->ir);
 
 	return ntfs_ih_insert(&icx->ir->index, median, new_vcn,
 			ntfs_icx_parent_pos(icx));
@@ -2064,8 +2092,11 @@ static int ntfs_index_rm_node(struct ntfs_index_context *icx)
 
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
@@ -2279,11 +2310,13 @@ struct index_entry *ntfs_index_walk_down(struct index_entry *ie, struct ntfs_ind
 
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
@@ -2301,6 +2334,7 @@ static struct index_entry *ntfs_index_walk_up(struct index_entry *ie,
 {
 	struct index_entry *entry = ie;
 	s64 vcn;
+	int err;
 
 	if (ictx->pindex <= 0)
 		return NULL;
@@ -2317,21 +2351,23 @@ static struct index_entry *ntfs_index_walk_up(struct index_entry *ie,
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
@@ -2341,7 +2377,7 @@ static struct index_entry *ntfs_index_walk_up(struct index_entry *ie,
 
 /*
  * ntfs_index_next - get next entry in an index according to collating sequence.
- * Returns next entry or NULL if none.
+ * Returns the next entry, NULL if none, or an error pointer.
  *
  * Sample layout :
  *
@@ -2391,8 +2427,11 @@ struct index_entry *ntfs_index_next(struct index_entry *ie, struct ntfs_index_co
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
@@ -2406,6 +2445,9 @@ struct index_entry *ntfs_index_next(struct index_entry *ie, struct ntfs_index_co
 		}
 	}
 
+	if (IS_ERR(next))
+		return next;
+
 	/* return NULL if stuck at end of a block */
 	if (next && (next->flags & INDEX_ENTRY_END))
 		next = NULL;
-- 
2.51.0

