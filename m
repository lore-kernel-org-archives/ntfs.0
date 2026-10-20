Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486015;
	b=DAlzdZqWnAh4ioQy7kuW2UblHZbw+JtZNUW1g6idtNToQpj6lJZkKN1mSb3CbjKRXF6L
	 ZwIbxcOnKsHvXOctQWInGOCoWkut3L1+zAm7VObA2xWvJNWKdFDemhkXfwh/aXH0z2QyL
	 uuaUXqFAqdpBQXrWOSETxYB1YXHZacSoFXly8ouamE657EOO3ehg2WPyWritLT4G9HQyw
	 En6a6dBHOyxq8IC1+kIQEVxE0+JE4xSg8pDkmmFvwhGQZeo9xhU9zR5d4uJW0wtE0EBj1
	 5C2dSf7gURpGE5m1F+ONvh1DH0a+gdKUeaKGfHaQVaC5ESi4Kls2D3d4BLfTepYz67w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486015;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=gbHIpNwAiK3o+4WIzq2wvLZj1ZEfrmapZfngrtVxpZ8=;
	b=iWJfmg0llgU7aFppIoatF4m61XqqmO5oQPzANH69s2NigFOmIuaJFKwdEzIagxR4oZvv
	 IvmcLvfHmfqa20G7TV8kQSL4ho+dzjxjxSKrXlqw4jCULRG/yFZCRRcr39MSM9goCf3Kc
	 zbY6HATuaUnj6wE/XysiaDAG+3Jiog/SBuS1Ii3IYOwl+UC3s6/1p9r6B1f8rlXDPDotO
	 PU5kKMpEAxTuiuc6MZio0pwmVRlDLzV4Bo3N5aApQCZshBJ/nygsx7snL60lsOXfK0F3Z
	 M4mn0LI6H66+eVWISQ0TabP1VzIAztdY1O6bXCdOl5y1rfdQ287YkATxHXDcB7JNYGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="Rl/bUbnH";
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBA1606A323
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BBA1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Rl/bUbnH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gb
	HIpNwAiK3o+4WIzq2wvLZj1ZEfrmapZfngrtVxpZ8=; b=Rl/bUbnHWL81XLM8rG
	FSdLjvtC59SeUf+qQPp8xHOagj0uIWPHHhO0rdxt5FcHFMPJn5y4Xj7T4K3nTmZR
	TYVRk1cIXtkqPzoniwH0GldmhBJlxs2lr0kRvgzJQI6HWWk1FMuaf+LLlp7DdDn4
	QYK7gyg3QZa/SzRqcTWv8Nw2Q=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3X_tvKtdqGocHBg--.23211S8;
	Tue, 20 Oct 2026 16:46:45 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 22/31] ntfs: report index update and recovery failures
Date: Tue, 20 Oct 2026 16:44:12 +0800
Message-ID: <20261020084421.2196486-23-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3X_tvKtdqGocHBg--.23211S8
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xw4xCrykCFW3Kry8JrW7XFb_yoWxJr1rpF
	ZxGrZ3K3y8Jr1xAr93tFyFy3Wakw1xK34DKr48G3WxA3Zxtw1IkF1FvF1Ygr93KrZ5J3y5
	JF4DJ3yxuF1UXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzq2NUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hU4A2rXKnWMJwAA3N

From: Dandan Wu <wudandan@kylinos.cn>

Index bitmap updates, root relocation and entry deletion can fail
after metadata has changed without reporting the incomplete update.
Report failed cleanup and restoration against the index owner,
including ENOMEM that leaves an unfinished deletion.

Report malformed bitmap and tree state as EFSCORRUPTED. Preserve
independent recovery errors and keep early allocation failures distinct.

Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
 fs/ntfs/index.c | 77 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 61 insertions(+), 16 deletions(-)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index ab678998afc8..4887dece73e3 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -1084,6 +1084,11 @@ static int ntfs_ibm_modify(struct ntfs_index_context *icx, s64 vcn, int set)
 
 	bmp_vi = ntfs_attr_iget(VFS_I(icx->idx_ni), AT_BITMAP, icx->name, icx->name_len);
 	if (IS_ERR(bmp_vi)) {
+		if (PTR_ERR(bmp_vi) == -ENOENT) {
+			ntfs_report_file_metadata_error(VFS_I(icx->idx_ni),
+							-EFSCORRUPTED);
+			bmp_vi = ERR_PTR(-EFSCORRUPTED);
+		}
 		ntfs_error(icx->idx_ni->vol->sb, "Failed to open $BITMAP attribute");
 		return PTR_ERR(bmp_vi);
 	}
@@ -1101,8 +1106,12 @@ static int ntfs_ibm_modify(struct ntfs_index_context *icx, s64 vcn, int set)
 		}
 	}
 
-	if (ntfs_inode_attr_pread(bmp_vi, bpos, 1, &byte) != 1) {
-		ret = -EIO;
+	ret = ntfs_inode_attr_pread(bmp_vi, bpos, 1, &byte);
+	if (ret != 1) {
+		if (ret >= 0 || ret == -EINVAL)
+			ret = -EFSCORRUPTED;
+		if (ret == -EIO || ret == -EFSCORRUPTED)
+			ntfs_report_file_metadata_error(VFS_I(icx->idx_ni), ret);
 		ntfs_error(icx->idx_ni->vol->sb, "Failed to read $BITMAP");
 		goto err;
 	}
@@ -1112,11 +1121,15 @@ static int ntfs_ibm_modify(struct ntfs_index_context *icx, s64 vcn, int set)
 	else
 		byte &= ~bit;
 
-	if (ntfs_inode_attr_pwrite(bmp_vi, bpos, 1, &byte, false) != 1) {
-		ret = -EIO;
+	ret = ntfs_inode_attr_pwrite(bmp_vi, bpos, 1, &byte, false);
+	if (ret != 1) {
+		if (ret >= 0)
+			ret = -EIO;
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni), ret);
 		ntfs_error(icx->idx_ni->vol->sb, "Failed to write $Bitmap");
 		goto err;
 	}
+	ret = 0;
 
 err:
 	iput(bmp_vi);
@@ -1130,7 +1143,12 @@ static int ntfs_ibm_set(struct ntfs_index_context *icx, s64 vcn)
 
 static int ntfs_ibm_clear(struct ntfs_index_context *icx, s64 vcn)
 {
-	return ntfs_ibm_modify(icx, vcn, 0);
+	int err = ntfs_ibm_modify(icx, vcn, 0);
+
+	/* Failure leaves an index block allocated, including during rollback. */
+	if (err)
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni), err);
+	return err;
 }
 
 static s64 ntfs_ibm_get_free(struct ntfs_index_context *icx)
@@ -1144,8 +1162,14 @@ static s64 ntfs_ibm_get_free(struct ntfs_index_context *icx)
 
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
@@ -1445,10 +1469,13 @@ static int ntfs_ir_reparent(struct ntfs_index_context *icx)
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
 
@@ -1916,8 +1943,11 @@ static int ntfs_ih_reparent_end(struct ntfs_index_context *icx, struct index_hea
 
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
@@ -1944,8 +1974,10 @@ static int ntfs_index_rm_leaf(struct ntfs_index_context *icx)
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
@@ -1972,6 +2004,9 @@ static int ntfs_index_rm_leaf(struct ntfs_index_context *icx)
 
 	ret = ntfs_ih_reparent_end(icx, parent_ih, ib);
 out:
+	/* The allocation bit is clear, but the parent update did not finish. */
+	if (ret)
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni), ret);
 	kvfree(ib);
 	return ret;
 }
@@ -2023,7 +2058,9 @@ static int ntfs_index_rm_node(struct ntfs_index_context *icx)
 		goto descend;
 
 	if (ntfs_ih_zero_entry(&ib->index)) {
-		ret = -EIO;
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni),
+						-EFSCORRUPTED);
+		ret = -EFSCORRUPTED;
 		ntfs_error(icx->idx_ni->vol->sb, "Empty index block");
 		goto out;
 	}
@@ -2068,10 +2105,14 @@ static int ntfs_index_rm_node(struct ntfs_index_context *icx)
 	ntfs_ie_delete(ih, entry);
 	ntfs_ie_insert(ih, ie, entry);
 
-	if (icx->is_in_root)
+	if (icx->is_in_root) {
 		ret = ntfs_ir_truncate(icx, new_size);
-	else
+		/* The old key has been replaced without removing its successor. */
+		if (ret)
+			ntfs_report_file_metadata_error(VFS_I(icx->idx_ni), ret);
+	} else {
 		ret = ntfs_icx_ib_write(icx);
+	}
 	if (ret)
 		goto out2;
 
@@ -2120,10 +2161,14 @@ int ntfs_index_rm(struct ntfs_index_context *icx)
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

