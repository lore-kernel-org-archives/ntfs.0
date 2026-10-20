Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485967;
	b=wAr8P79UOQG9G8nrlc0i5zc1KD9kYJheLUqQI0cxwSoczguEdgQSokwSMMrs51iXRaZu
	 7aZPm6txLc108aUZlBCSmrfDJLmQM99J3YORzHD666efOACDSyKxDjx1tdlyByeNz6d8N
	 stiowtTRzRULCDmTFZaDZfDXzh2tReoUPjHq2o/ZmnToR30owdx+YJHVJgKbgdd+bWwPR
	 Jgzo54G5HRMA4wFjVVxWpaXwvLe2hrXHL/38vDGoNJuGOFo1xXM5Wn8ziW4KQQnVT2BMD
	 UDwzlnYsgYZeanfyew5dVTEn8uHLXvwxFSPo6ed0rQX9J80HGniZJapY8DYlhOe/Gsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485967;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=bB6D1d4fa+14bHmty14QqjF7Yn69EtS4CQRrOs93Nn4=;
	b=F18a+4AJFXUWLjmssfQa44IPbMGxkPK4J12UbPKBKiCGpxW19OzRbGJUmev1Ip7Lur17
	 LUpoXRU2K34KCArtzmq1WaGX4TxS1cKiEeAAADFMLeRjIjeeoPaqq5Ln1S7Kis0Miin1h
	 MTxNCQZoLH3Ezhvimi99zKo2Lx1oYWCttgd7eMTRvOFpSn3E0eFFoI+rWd/MRY9BR17Ix
	 RczPgwqnYLtVWJ3iK5Qq3oHNXkosThZyQYt8M8zc0gC8hr9zkRlAbuW17LJ3wOAGQHqZD
	 izCtG7t8Nv3Ql6F+YHmbIvsK8HYLHXB5VCynKzucYPNnpCaP26XY8Y2cwfNjww78vOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="NS/rUeaB";
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF51960A382D
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF51960A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NS/rUeaB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=bB
	6D1d4fa+14bHmty14QqjF7Yn69EtS4CQRrOs93Nn4=; b=NS/rUeaBS+IeAVqQYJ
	BOkYxkkVHMPbmgTJCV123EItC7TvV0+kdKs7mF25SqLGdOrWSeysk2X4JyYz8iix
	+RnQU87L9QR/dzc3Qh5/UNNOa7Myg7rhkopukxiuhP50kkL0hx7m9Dg0mc4D2i4L
	hK7tp45rRv2vPSs2moRA26fz8=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3n0ksKtdq7UkHBg--.56105S7;
	Tue, 20 Oct 2026 16:45:37 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 13/31] ntfs: report attribute record update and cleanup failures
Date: Tue, 20 Oct 2026 16:44:03 +0800
Message-ID: <20261020084421.2196486-14-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3n0ksKtdq7UkHBg--.56105S7
X-Coremail-Antispam: 1Uf129KBjvJXoW3tr43Ar45Kr1fuF1rGFWrGrg_yoWkWw47pF
	9xGr97Kws3tr12qrsayw1Yqa4a9ry0gr4UWry7K3ZrAan0ywn2qFWjqFy09rWfKr95J3s8
	tF4DK3y3Aay7XFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzMKAUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RIn8WrXKjJZrAAA39

From: Xuewen Wang <wangxuewen@kylinos.cn>

Attribute creation, removal and relocation can fail after modifying
metadata without reporting the incomplete update. Report failed record
restoration, cluster release and cleanup, preserving the initiating
error separately from recovery failures.

Include interrupted removal after clusters or records have been freed.
Retain best-effort removal behavior and ordinary early allocation errors;
the earlier cluster-count fix keeps successful deallocation from being
reported as a failure.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 fs/ntfs/attrib.c | 113 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 87 insertions(+), 26 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 9eafa87dce7b..66845c78ab8d 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -2558,7 +2558,6 @@ int ntfs_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 		goto put_err_out;
 	}
 	if (err != -ENOENT) {
-		err = -EIO;
 		goto put_err_out;
 	}
 	a = ctx->attr;
@@ -2609,7 +2608,9 @@ int ntfs_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 	if (type != AT_ATTRIBUTE_LIST && NInoAttrList(base_ni)) {
 		err = ntfs_attrlist_entry_add(ni, a);
 		if (err) {
-			ntfs_attr_record_resize(m, a, 0);
+			if (ntfs_attr_record_resize(m, a, 0))
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								-EFSCORRUPTED);
 			mark_mft_record_dirty(ctx->ntfs_ino);
 			ntfs_debug("Failed add attribute entry to ATTRIBUTE_LIST.\n");
 			goto put_err_out;
@@ -2682,7 +2683,6 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 	}
 	if (err != -ENOENT) {
 		pr_err("ntfs_attr_find failed\n");
-		err = -EIO;
 		goto put_err_out;
 	}
 	a = ctx->attr;
@@ -2737,7 +2737,9 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 		err = ntfs_attrlist_entry_add(ni, a);
 		if (err) {
 			pr_err("Failed add attr entry to attrlist\n");
-			ntfs_attr_record_resize(m, a, 0);
+			if (ntfs_attr_record_resize(m, a, 0))
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								-EFSCORRUPTED);
 			goto put_err_out;
 		}
 	}
@@ -2751,6 +2753,11 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 	err = ntfs_attr_lookup(type, name, name_len, ic,
 				lowest_vcn, NULL, 0, ctx);
 	if (err) {
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+		}
 		pr_err("%s: attribute lookup failed\n", __func__);
 		ntfs_attr_put_search_ctx(ctx);
 		return err;
@@ -2792,8 +2799,9 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 
 	/* Remove attribute itself. */
 	if (ntfs_attr_record_resize(ctx->mrec, ctx->attr, 0)) {
+		ntfs_report_file_metadata_error(VFS_I(base_ni), -EFSCORRUPTED);
 		ntfs_debug("Couldn't remove attribute record. Bug or damaged MFT record.\n");
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 	mark_mft_record_dirty(ni);
 
@@ -2804,6 +2812,7 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 	if (NInoAttrList(base_ni) && type != AT_ATTRIBUTE_LIST) {
 		err = ntfs_attrlist_entry_rm(ctx);
 		if (err) {
+			ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 			ntfs_debug("Couldn't delete record from $ATTRIBUTE_LIST.\n");
 			return err;
 		}
@@ -2820,9 +2829,11 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 	/* Free MFT record, if it doesn't contain attributes. */
 	if (le32_to_cpu(ctx->mrec->bytes_in_use) -
 			le16_to_cpu(ctx->mrec->attrs_offset) == 8) {
-		if (ntfs_mft_record_free(ni->vol, ni)) {
+		err = ntfs_mft_record_free(ni->vol, ni);
+		if (err) {
+			ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 			ntfs_debug("Couldn't free MFT record.\n");
-			return -EIO;
+			return err;
 		}
 		/* Remove done if we freed base inode. */
 		if (ni == base_ni)
@@ -2840,8 +2851,14 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 		struct inode *attr_vi;
 
 		ntfs_attr_reinit_search_ctx(ctx);
-		if (ntfs_attr_lookup(AT_ATTRIBUTE_LIST, NULL, 0, CASE_SENSITIVE,
-					0, NULL, 0, ctx)) {
+		err = ntfs_attr_lookup(AT_ATTRIBUTE_LIST, NULL, 0, CASE_SENSITIVE,
+				       0, NULL, 0, ctx);
+		if (err) {
+			if (err == -ENOENT) {
+				err = -EFSCORRUPTED;
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								-EFSCORRUPTED);
+			}
 			ntfs_debug("Couldn't find attribute list. Succeed anyway.\n");
 			return 0;
 		}
@@ -2853,11 +2870,17 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 			al_rl = ntfs_mapping_pairs_decompress(base_ni->vol,
 					ctx->attr, NULL, &new_rl_count);
 			if (IS_ERR(al_rl)) {
+				if (PTR_ERR(al_rl) != -ENOMEM)
+					ntfs_report_file_metadata_error(VFS_I(base_ni),
+									-EFSCORRUPTED);
 				ntfs_debug("Couldn't decompress attribute list runlist. Succeed anyway.\n");
 				return 0;
 			}
-			if (ntfs_cluster_free_from_rl(base_ni->vol, al_rl))
+			err = ntfs_cluster_free_from_rl(base_ni->vol, al_rl);
+			if (err) {
+				ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 				ntfs_debug("Leaking clusters! Run chkdsk. Couldn't free clusters from attribute list runlist.\n");
+			}
 			kvfree(al_rl);
 		}
 		/* Remove attribute record itself. */
@@ -2913,7 +2936,7 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
 {
 	struct super_block *sb;
 	u32 attr_rec_size;
-	int err, i, offset;
+	int err, i, offset, rollback_err;
 	bool is_resident;
 	bool can_be_non_resident = false;
 	struct ntfs_inode *attr_ni;
@@ -2990,7 +3013,7 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
 retry:
 	ni_mrec = map_mft_record(ni);
 	if (IS_ERR(ni_mrec)) {
-		err = -EIO;
+		err = PTR_ERR(ni_mrec);
 		goto err_out;
 	}
 
@@ -3013,7 +3036,7 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
 		attr_ni = ni->ext.extent_ntfs_inos[i];
 		ni_mrec = map_mft_record(attr_ni);
 		if (IS_ERR(ni_mrec)) {
-			err = -EIO;
+			err = PTR_ERR(ni_mrec);
 			goto err_out;
 		}
 
@@ -3079,18 +3102,31 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
 	attr_vi = ntfs_attr_iget(VFS_I(ni), type, name, name_len);
 	if (IS_ERR(attr_vi)) {
 		err = PTR_ERR(attr_vi);
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
+		}
 		ntfs_error(sb, "Failed to open just added attribute");
 		goto rm_attr_err_out;
 	}
 	attr_ni = NTFS_I(attr_vi);
 
 	/* Resize and set attribute value. */
-	if (ntfs_attr_truncate(attr_ni, size) ||
-		(val && (ntfs_inode_attr_pwrite(attr_vi, 0, size, val, false) != size))) {
-		err = -EIO;
+	err = ntfs_attr_truncate(attr_ni, size);
+	if (!err && val) {
+		s64 written = ntfs_inode_attr_pwrite(attr_vi, 0, size, val, false);
+
+		if (written != size)
+			err = written < 0 ? written : -EIO;
+	}
+	if (err) {
 		ntfs_error(sb, "Failed to initialize just added attribute");
-		if (ntfs_attr_rm(attr_ni))
+		rollback_err = ntfs_attr_rm(attr_ni);
+		if (rollback_err) {
+			ntfs_report_file_metadata_error(VFS_I(ni), rollback_err);
 			ntfs_error(sb, "Failed to remove just added attribute");
+		}
 		iput(attr_vi);
 		goto err_out;
 	}
@@ -3101,12 +3137,18 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
 	/* Remove just added attribute. */
 	ni_mrec = map_mft_record(attr_ni);
 	if (!IS_ERR(ni_mrec)) {
-		if (ntfs_attr_record_resize(ni_mrec,
-					(struct attr_record *)((u8 *)ni_mrec + offset), 0))
+		struct attr_record *a = (struct attr_record *)((u8 *)ni_mrec + offset);
+
+		rollback_err = ntfs_attr_record_resize(ni_mrec, a, 0);
+		if (rollback_err) {
+			ntfs_report_file_metadata_error(VFS_I(ni), rollback_err);
 			ntfs_error(sb, "Failed to remove just added attribute #2");
+		}
 		unmap_mft_record(attr_ni);
-	} else
+	} else {
+		ntfs_report_file_metadata_error(VFS_I(ni), PTR_ERR(ni_mrec));
 		pr_err("EIO when try to remove new added attr\n");
+	}
 
 free_err_out:
 	/* Free MFT record, if it doesn't contain attributes. */
@@ -3118,13 +3160,18 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
 			le16_to_cpu(ni_mrec->attrs_offset);
 		unmap_mft_record(attr_ni);
 		if (attr_size == 8) {
-			if (ntfs_mft_record_free(attr_ni->vol, attr_ni))
+			rollback_err = ntfs_mft_record_free(attr_ni->vol, attr_ni);
+			if (rollback_err) {
+				ntfs_report_file_metadata_error(VFS_I(ni), rollback_err);
 				ntfs_error(sb, "Failed to free MFT record");
+			}
 			if (attr_ni->nr_extents < 0)
 				ntfs_inode_close(attr_ni);
 		}
-	} else
+	} else {
+		ntfs_report_file_metadata_error(VFS_I(ni), PTR_ERR(ni_mrec));
 		pr_err("EIO when testing mft record is free-able\n");
+	}
 
 err_out:
 	return err;
@@ -3587,7 +3634,7 @@ int ntfs_attr_record_move_to(struct ntfs_attr_search_ctx *ctx, struct ntfs_inode
 	/* Make space and move attribute. */
 	ni_mrec = map_mft_record(ni);
 	if (IS_ERR(ni_mrec)) {
-		err = -EIO;
+		err = PTR_ERR(ni_mrec);
 		goto put_err_out;
 	}
 
@@ -3676,7 +3723,7 @@ int ntfs_attr_record_move_away(struct ntfs_attr_search_ctx *ctx, int extra)
 			ntfs_error(sb, "Can not map mft record for mft_no %lld",
 					(unsigned long long)ni->mft_no);
 			mutex_unlock(&base_ni->extent_lock);
-			return -EIO;
+			return PTR_ERR(m);
 		}
 		if (le32_to_cpu(m->bytes_allocated) -
 		    le32_to_cpu(m->bytes_in_use) < le32_to_cpu(ctx->attr->length) + extra) {
@@ -3711,11 +3758,16 @@ int ntfs_attr_record_move_away(struct ntfs_attr_search_ctx *ctx, int extra)
 
 	err = ntfs_attr_record_move_to(ctx, ni);
 	if (err) {
+		int free_err;
+
 		ntfs_error(sb, "Couldn't move attribute to MFT record");
-		if (ntfs_mft_record_free(base_ni->vol, ni))
+		free_err = ntfs_mft_record_free(base_ni->vol, ni);
+		if (free_err) {
+			ntfs_report_file_metadata_error(VFS_I(base_ni), free_err);
 			ntfs_error(sb, "Couldn't free empty MFT record");
-		else
+		} else {
 			ntfs_inode_close(ni);
+		}
 	}
 
 	return err;
@@ -5520,6 +5572,7 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 	struct ntfs_attr_search_ctx *ctx;
 	int err = 0, ret = 0;
 	s64 freed = 0;
+	bool removed = false;
 	struct ntfs_inode *base_ni;
 	struct super_block *sb = ni->vol->sb;
 
@@ -5544,6 +5597,7 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 		freed = ntfs_cluster_free(ni, 0, -1, ctx);
 		if (freed < 0) {
 			ret = freed;
+			ntfs_report_file_metadata_error(VFS_I(base_ni), ret);
 			ntfs_error(sb,
 				"Failed to free cluster allocation. Leaving inconstant metadata.\n");
 		}
@@ -5553,6 +5607,8 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 	/* Search for attribute extents and remove them all. */
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
 	if (IS_ERR(ctx)) {
+		if (freed > 0)
+			ntfs_report_file_metadata_error(VFS_I(base_ni), PTR_ERR(ctx));
 		ntfs_error(sb, "%s: Failed to get search context", __func__);
 		return PTR_ERR(ctx);
 	}
@@ -5560,14 +5616,19 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 				CASE_SENSITIVE, 0, NULL, 0, ctx))) {
 		err = ntfs_attr_record_rm(ctx);
 		if (err) {
+			ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 			ntfs_error(sb,
 				"Failed to remove attribute extent. Leaving inconstant metadata.\n");
 			ret = err;
+		} else {
+			removed = true;
 		}
 		ntfs_attr_reinit_search_ctx(ctx);
 	}
 	ntfs_attr_put_search_ctx(ctx);
 	if (err != -ENOENT) {
+		if (freed > 0 || removed)
+			ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 		ntfs_error(sb, "Attribute lookup failed. Probably leaving inconstant metadata.\n");
 		ret = err;
 	}
-- 
2.51.0

