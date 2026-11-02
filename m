Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605078;
	b=kUeZ2RWeziaUG4sWVuRiQk91c5IPVScBZruLrSKJMqDJsqyviqeqJ6nqfH4S3CpiKA9f
	 b7U8stevyZsRVxXIZJrc3JgkLv7bRaTyI0L6ZeWHJUS3G5dIKRl8fDdXlRfqrJxe84ZnR
	 WOJ+iLu3m8zYfEpoYU/McDULcnjICe2K7uez/Egi/zT65zZaHdK/Z+wvJ8M5BtCDm0lXg
	 MCHaWO/E8oieUsVm7w+VuN49UUnucgy38m03xZoZYSAfIlOAWYgE5FAYI9Hl1eKbxO3pj
	 RvULPMecLs9Rki7RXrmNgRcAGC8G45tyq75rmQICJ8ly8+k42Opwrm4WXxv+326tLFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605078;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=CS6HkonQXszH13n1k1gvC4w80deM3psSazfP4xKT8Zc=;
	b=E9suG+1gql7/nnNA1o5BxVHdKtXhVVZDWPHyTj9fF0fpf2/FbrC/dEyrdp0g5ZQOFLbR
	 eYcpyA197kcFNJpyhqcGRoCMFd30M2HZjYX1AUFFU7WG6qLMD/+6eXnPmqwethdDWUwRX
	 bRI685lV89Fmyxyk+caWkbFYm3wmyyrfXqBatUOZA0OAgeJgVtt5ttrYUW9udKRulYjZq
	 Cd3eQE4BFF2Mh/bPNn2F+LXJ7wjfdQF3LFCr+DBQ+alWIhl+emui3oBvnx1TzykAjZlw1
	 nzHqC1bQb+IHq0dTqunTSE3C8XpqlbnivP2JL+7gufC9hs7QnUUD+kxJ7diELIFMELg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="jcmdCR/E";
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8705606A329
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8705606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=jcmdCR/E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=CS
	6HkonQXszH13n1k1gvC4w80deM3psSazfP4xKT8Zc=; b=jcmdCR/EjBkfGuEESG
	aToM66DUVkeR1jp/qj+xehPwxTMhYtltjbnOGlfldTcbXorV3HLwNWtlTBw68sXm
	kWKJc5qw9GF7D9hfkdeZ8F8ArvKhYojNL0QWuvpOJax3+AAXHe/H24K3hnJIcn2Z
	fTp8NTMmDqahLPl0Qds4Qu3fs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3N9rIPehqahKgEw--.3981S8;
	Mon, 02 Nov 2026 15:37:48 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>
Subject: [PATCH v5 22/31] ntfs: report index update and recovery failures
Date: Mon,  2 Nov 2026 15:35:23 +0800
Message-Id: <20261102073532.98873-23-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3N9rIPehqahKgEw--.3981S8
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xw4xCrykCFWDCF18XryfCrg_yoWxurWkpF
	W3GrZak3y8Jr1xArn3tF10v3Wakw4xKryDKr48G3WxA3W3tw10yF10vF1YqrZ3trWrJ3y5
	JF4DJ397GF1UZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UWMKNUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC8AxXQGroPczkmQAA3l

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

Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
Validation:
- Forty bitmap set/clear cases cover success and failures, checking
  errno preservation and reporting at the shared exit.
- The thirty combined index/bitmap cases also described in patch 19
  verify that allocation does not repeat propagated read-corruption
  reports, while failed clearing reports its unfinished cleanup.
- All pass in extracted-source userspace harnesses with controlled
  dependencies under ASan/UBSan. These check reporting calls, not kernel
  FAN_FS_ERROR event delivery.

 fs/ntfs/index.c | 83 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 67 insertions(+), 16 deletions(-)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 4a6084b884d9..69923fc46af6 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -1100,6 +1100,7 @@ static int ntfs_ibm_add(struct ntfs_index_context *icx)
 
 static int ntfs_ibm_modify(struct ntfs_index_context *icx, s64 vcn, int set)
 {
+	int report_err = 0;
 	u8 byte;
 	u64 pos = ntfs_ibm_vcn_to_pos(icx, vcn);
 	u32 bpos = pos / 8;
@@ -1112,8 +1113,13 @@ static int ntfs_ibm_modify(struct ntfs_index_context *icx, s64 vcn, int set)
 
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
@@ -1129,8 +1135,14 @@ static int ntfs_ibm_modify(struct ntfs_index_context *icx, s64 vcn, int set)
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
@@ -1140,14 +1152,24 @@ static int ntfs_ibm_modify(struct ntfs_index_context *icx, s64 vcn, int set)
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
 
@@ -1172,8 +1194,14 @@ static s64 ntfs_ibm_get_free(struct ntfs_index_context *icx)
 
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
@@ -1477,10 +1505,13 @@ static int ntfs_ir_reparent(struct ntfs_index_context *icx)
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
 
@@ -1948,8 +1979,11 @@ static int ntfs_ih_reparent_end(struct ntfs_index_context *icx, struct index_hea
 
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
@@ -1976,8 +2010,10 @@ static int ntfs_index_rm_leaf(struct ntfs_index_context *icx)
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
@@ -2004,12 +2040,16 @@ static int ntfs_index_rm_leaf(struct ntfs_index_context *icx)
 
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
@@ -2055,7 +2095,8 @@ static int ntfs_index_rm_node(struct ntfs_index_context *icx)
 		goto descend;
 
 	if (ntfs_ih_zero_entry(&ib->index)) {
-		ret = -EIO;
+		report_err = -EFSCORRUPTED;
+		ret = -EFSCORRUPTED;
 		ntfs_error(icx->idx_ni->vol->sb, "Empty index block");
 		goto out;
 	}
@@ -2100,10 +2141,14 @@ static int ntfs_index_rm_node(struct ntfs_index_context *icx)
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
 
@@ -2118,6 +2163,8 @@ static int ntfs_index_rm_node(struct ntfs_index_context *icx)
 	kfree(ie);
 out:
 	kvfree(ib);
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni), report_err);
 	return ret;
 }
 
@@ -2152,10 +2199,14 @@ int ntfs_index_rm(struct ntfs_index_context *icx)
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

