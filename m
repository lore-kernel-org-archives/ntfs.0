Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993054;
	b=FH9Udfd6X+bFauCKLSNhDNygMy18IyH68r9mIFIoGbLzRHf096sZ2jSbZG6LSp2toJh1
	 SECRWk963oEFlwQCTAgWx7i6vacqHhHPV8cdZjYj7BZH1NexVr5rn7CkcnLBNHq8y0xSv
	 2JQkLJd2GaAOY2LxVxA3uZvudCoMW0+ERTxI0nYyHntxUEkvOSH0LX5KH91q6tIVg5Yji
	 MRRsl+MIb88eoV5HpaMmkchZxVPI+2iAjeQNPiacmF6b1UxRfqsG1VX5hP0v9n8bUEla8
	 cM9vXwIM8diQN45ARlIXDMhOY8+HW6nmLg6ycOVHq5rUyp0TxYPMUIMBK5TC0UBsa3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993054;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Q5AepEaLz7Y1cCBoiC8PZZLm2tsMBlxMV9mqzcRczoA=;
	b=eJDgHY++jZ+y8Rx0j9hr4GbKFv4r3qGo7MBRl1H3eFnnSGiQ5PtpFXkRWEqMb980SLeI
	 lYEBfl4zWMUPz8Gq3Fg8S2WGPhq3ECz2OzDjv0UqHClYCodYK07HhuQ7WKU8uW8WwvXk7
	 60VcF0+QblfbwKDYEy1+v7atSWuKc9JjD7Ys2/jjyFeszIc6O9ysRupZ9Bl2QugVLNDJ+
	 tFB1ovHTzOph7NBD0KKHwfdMi2c20LVlxMdzcj9lW1G/3e/1OjOAxWPiYWhKGXpzNbIsr
	 v915T6XQpOe3yndEnnAZTKYEvRVIRMvajWpvacxZLWxteao/9o81LXsubO39/7MAPrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JUOfntu0;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF0D606A31C
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDF0D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JUOfntu0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Q5
	AepEaLz7Y1cCBoiC8PZZLm2tsMBlxMV9mqzcRczoA=; b=JUOfntu0bLCrmjUuSP
	pnh6B5o1iuj1ThJUluqB+tk1XjMgle/jZy+2pK3qxA5BDMEzHk8vvbo/LX3aj75Y
	i/Kqcc6nweMCBwRaTUOr1AYZR02gprNKbsAr6/UgSYX8icJk67olVJRaXPyE0p8M
	oG+aigcst4vfvH+4TfJVwckCA=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3UiuQa_1qEjvuGg--.61000S5;
	Wed, 18 Nov 2026 17:10:43 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 27/37] ntfs: report index update and recovery failures
Date: Wed, 18 Nov 2026 17:06:51 +0800
Message-Id: <20261118090701.1858849-28-wangxuewen_ky@163.com>
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
X-CM-TRANSID:PigvCgD3UiuQa_1qEjvuGg--.61000S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xw4xCrykCw1fXw45ZFW7CFg_yoWxAw4DpF
	W7G39akay8JF1xArn3tF10v3Wakw4IgryDKr48G3WxC3W3tw1IkF10vF1YqrZ3KrWrJ3y3
	JF4DJ397CF4UZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jeKZXUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC8BMZAmr9a5OcXwAA3U

From: Dandan Wu <wudandan@kylinos.cn>

Index bitmap updates, root relocation and entry deletion can fail
after metadata has changed without reporting the incomplete update.
Report failed cleanup and restoration against the index owner,
including ENOMEM that leaves an unfinished deletion.

Report malformed bitmap and tree state as EFSCORRUPTED. Preserve
independent recovery errors and keep early allocation failures distinct.

Report bitmap failures at the modifier's shared exit, without repeating
propagated read corruption during allocation. A failed clear still
reports the unfinished cleanup.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
Changes in v6:
Rebase onto the updated ntfs-next; retain the v5 reporting behavior.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.

 fs/ntfs/index.c | 83 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 67 insertions(+), 16 deletions(-)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 48efc2f3766d..90f7e0df09f3 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -1170,6 +1170,7 @@ static int ntfs_ibm_add(struct ntfs_index_context *icx)
 
 static int ntfs_ibm_modify(struct ntfs_index_context *icx, s64 vcn, int set)
 {
+	int report_err = 0;
 	u8 byte;
 	u64 pos = ntfs_ibm_vcn_to_pos(icx, vcn);
 	u32 bpos = pos / 8;
@@ -1182,8 +1183,13 @@ static int ntfs_ibm_modify(struct ntfs_index_context *icx, s64 vcn, int set)
 
 	bmp_vi = ntfs_attr_iget(VFS_I(icx->idx_ni), AT_BITMAP, icx->name, icx->name_len);
 	if (IS_ERR(bmp_vi)) {
+		if (PTR_ERR(bmp_vi) == -ENOENT) {
+			report_err = -EFSCORRUPTED;
+			bmp_vi = ERR_PTR(-EFSCORRUPTED);
+		}
 		ntfs_error(icx->idx_ni->vol->sb, "Failed to open $BITMAP attribute");
-		return PTR_ERR(bmp_vi);
+		ret = PTR_ERR(bmp_vi);
+		goto out;
 	}
 
 	bmp_ni = NTFS_I(bmp_vi);
@@ -1199,8 +1205,14 @@ static int ntfs_ibm_modify(struct ntfs_index_context *icx, s64 vcn, int set)
 		}
 	}
 
-	if (ntfs_inode_attr_pread(bmp_vi, bpos, 1, &byte) != 1) {
-		ret = -EIO;
+	ret = ntfs_inode_attr_pread(bmp_vi, bpos, 1, &byte);
+	if (ret != 1) {
+		if (ret >= 0 || ret == -EINVAL) {
+			ret = -EFSCORRUPTED;
+			report_err = ret;
+		} else if (ret == -EIO) {
+			report_err = ret;
+		}
 		ntfs_error(icx->idx_ni->vol->sb, "Failed to read $BITMAP");
 		goto err;
 	}
@@ -1210,14 +1222,24 @@ static int ntfs_ibm_modify(struct ntfs_index_context *icx, s64 vcn, int set)
 	else
 		byte &= ~bit;
 
-	if (ntfs_inode_attr_pwrite(bmp_vi, bpos, 1, &byte, false) != 1) {
-		ret = -EIO;
+	ret = ntfs_inode_attr_pwrite(bmp_vi, bpos, 1, &byte, false);
+	if (ret != 1) {
+		if (ret >= 0)
+			ret = -EIO;
+		report_err = ret;
 		ntfs_error(icx->idx_ni->vol->sb, "Failed to write $Bitmap");
 		goto err;
 	}
+	ret = 0;
 
 err:
 	iput(bmp_vi);
+out:
+	/* A failed clear leaves a block allocated, including during rollback. */
+	if (!set && ret)
+		report_err = ret;
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni), report_err);
 	return ret;
 }
 
@@ -1242,8 +1264,14 @@ static s64 ntfs_ibm_get_free(struct ntfs_index_context *icx)
 
 	bm = ntfs_attr_readall(icx->idx_ni, AT_BITMAP,  icx->name, icx->name_len,
 			&size);
-	if (IS_ERR(bm))
+	if (IS_ERR(bm)) {
+		if (PTR_ERR(bm) == -ENOENT) {
+			ntfs_report_file_metadata_error(VFS_I(icx->idx_ni),
+							-EFSCORRUPTED);
+			bm = ERR_PTR(-EFSCORRUPTED);
+		}
 		return PTR_ERR(bm);
+	}
 
 	for (byte = 0; byte < size; byte++) {
 		if (bm[byte] == 255)
@@ -1547,10 +1575,13 @@ static int ntfs_ir_reparent(struct ntfs_index_context *icx)
 			ntfs_attr_put_search_ctx(ctx);
 			ctx = NULL;
 			rollback_ret = ntfs_ir_move_to_base(icx);
-			if (rollback_ret)
+			if (rollback_ret) {
+				ntfs_report_file_metadata_error(VFS_I(icx->idx_ni),
+								rollback_ret);
 				ntfs_error(icx->idx_ni->vol->sb,
 					   "Failed to roll back INDEX_ROOT relocation: %d",
 					   rollback_ret);
+			}
 			goto clear_bmp;
 		}
 
@@ -2018,8 +2049,11 @@ static int ntfs_ih_reparent_end(struct ntfs_index_context *icx, struct index_hea
 
 	ie = ntfs_ie_get_by_pos(ih, ntfs_icx_parent_pos(icx));
 	ie_prev = ntfs_ie_prev(ih, ie);
-	if (!ie_prev)
-		return -EIO;
+	if (!ie_prev) {
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni),
+						-EFSCORRUPTED);
+		return -EFSCORRUPTED;
+	}
 	ntfs_ie_set_vcn(ie, ntfs_ie_get_vcn(ie_prev));
 
 	return ntfs_ih_takeout(icx, ih, ie_prev, ib);
@@ -2046,8 +2080,10 @@ static int ntfs_index_rm_leaf(struct ntfs_index_context *icx)
 		parent_ih = &icx->ir->index;
 	else {
 		ib = kvzalloc(icx->block_size, GFP_NOFS);
-		if (!ib)
-			return -ENOMEM;
+		if (!ib) {
+			ret = -ENOMEM;
+			goto out;
+		}
 
 		ret = ntfs_ib_read(icx, ntfs_icx_parent_vcn(icx), ib);
 		if (ret)
@@ -2074,12 +2110,16 @@ static int ntfs_index_rm_leaf(struct ntfs_index_context *icx)
 
 	ret = ntfs_ih_reparent_end(icx, parent_ih, ib);
 out:
+	/* The allocation bit is clear, but the parent update did not finish. */
+	if (ret)
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni), ret);
 	kvfree(ib);
 	return ret;
 }
 
 static int ntfs_index_rm_node(struct ntfs_index_context *icx)
 {
+	int report_err = 0;
 	int entry_pos, pindex;
 	s64 vcn;
 	struct index_block *ib = NULL;
@@ -2125,7 +2165,8 @@ static int ntfs_index_rm_node(struct ntfs_index_context *icx)
 		goto descend;
 
 	if (ntfs_ih_zero_entry(&ib->index)) {
-		ret = -EIO;
+		report_err = -EFSCORRUPTED;
+		ret = -EFSCORRUPTED;
 		ntfs_error(icx->idx_ni->vol->sb, "Empty index block");
 		goto out;
 	}
@@ -2170,10 +2211,14 @@ static int ntfs_index_rm_node(struct ntfs_index_context *icx)
 	ntfs_ie_delete(ih, entry);
 	ntfs_ie_insert(ih, ie, entry);
 
-	if (icx->is_in_root)
+	if (icx->is_in_root) {
 		ret = ntfs_ir_truncate(icx, new_size);
-	else
+		/* The old key has been replaced without removing its successor. */
+		if (ret)
+			report_err = ret;
+	} else {
 		ret = ntfs_icx_ib_write(icx);
+	}
 	if (ret)
 		goto out2;
 
@@ -2188,6 +2233,8 @@ static int ntfs_index_rm_node(struct ntfs_index_context *icx)
 	kfree(ie);
 out:
 	kvfree(ib);
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni), report_err);
 	return ret;
 }
 
@@ -2222,10 +2269,14 @@ int ntfs_index_rm(struct ntfs_index_context *icx)
 	} else if (icx->is_in_root || !ntfs_ih_one_entry(ih)) {
 		ntfs_ie_delete(ih, icx->entry);
 
-		if (icx->is_in_root)
+		if (icx->is_in_root) {
 			ret = ntfs_ir_truncate(icx, le32_to_cpu(ih->index_length));
-		else
+			/* The entry is already removed and will not be restored. */
+			if (ret)
+				ntfs_report_file_metadata_error(VFS_I(icx->idx_ni), ret);
+		} else {
 			ret = ntfs_icx_ib_write(icx);
+		}
 		if (ret)
 			goto err_out;
 	} else {
-- 
2.51.0

