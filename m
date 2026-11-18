Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992988;
	b=LJ/d7Ifg5S8qZ4LLRqRu0xVCf7/uEJXbaQhBc3XaAmxUncvSR3T/XU8C08cCJvEM+OF8
	 N/PbCLkbzSsbqBB+n+yq2roh1lixTGhn1JXf1DQ36NLVfzErxpmU52s2WVqRjp/jolx8E
	 sflw0Hl1KfFulOA7shk/YCNJke8bYraJeyRjV9z/jQ7UPor9elsxTr06IDjbn3fth2gRF
	 cGvHIUc/3i1YfPRy8GY2UymlTnbqNJft57wExVWDwddga40DEFiTpprRk8HJektqCKr26
	 gVfR5M/zV7F5+/TKSGwqH7SRWEYyUFNk1Jym3Ju7KrVlZcZrCfqYgz7lOs+W8TTeE5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992988;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=hLxB5eM2GADtf8HMSLKcmmAhVcOP6ftbHnMk3D4lq+4=;
	b=RxXxhrqNyEy2JevlOEPEKzLPgulxX8BKrvZP8xwmOvHApOfM88OcSPEsQJsvtnNLGc19
	 3CTv5vWxgx1p4Dqy7G85dO1l3Ak7FB2nxFmxm2NpvXC7fFUaJ9Mdg7w2UJWoVyeOnKpqz
	 z4snm5yJbO+pyBh4sgCvfMdlv/D2iOO7XD2JeCpGgs8TvHZtoSPGfL/gDl6SFe+ZSXNqE
	 qpZP7GEv8wUlEKrpY6jYGJWUAlVSbodab8Q3NDLz6A05PNSK0H7ut9Q0I13eenTVf1XHn
	 UX+gYpGMBc1/43a3vEEvvJ1bClaVamiAd71c/Wr6HvZci1jC+nKPsgTKMi/nfodG01w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GDMVrPqm;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCF5606A32C
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FCF5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GDMVrPqm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=hL
	xB5eM2GADtf8HMSLKcmmAhVcOP6ftbHnMk3D4lq+4=; b=GDMVrPqmfVoNhIAV+6
	dSAUXobLiMQ4lqTaqNZgoEiDy847WSwPcQX3ouzB1h6EbfX2rZeBk1UVQHpTRwuB
	k2OzDo2dZaIFujXtwoC9YSWFQEjGqZqeT1yryUPgYR5IesEKD60TikaetluvHDix
	8l+2P4mElRWmUuVeyxGMsIIOs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3xC1Pa_1qPhPuGg--.62323S4;
	Wed, 18 Nov 2026 17:09:37 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 18/37] ntfs: report attribute record update and cleanup failures
Date: Wed, 18 Nov 2026 17:06:42 +0800
Message-Id: <20261118090701.1858849-19-wangxuewen_ky@163.com>
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
X-CM-TRANSID:PigvCgC3xC1Pa_1qPhPuGg--.62323S4
X-Coremail-Antispam: 1Uf129KBjvAXoW3tr43uFWUZF43CrW3Aw4kXrb_yoW8JF17Zo
	W3Zr4Yyw4v9w1UAw1093WDXF9xZa98G3y8JrW5Aw4DA3Z2q3WDC34fJ347Gayruw4Ygrs0
	gw1xtws5ZFn3Ary7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwa0PDUUUU
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzhEJ8Wr9a1EA2wAA3R

From: Xuewen Wang <wangxuewen@kylinos.cn>

Attribute creation, removal and relocation can fail after modifying
metadata without reporting the incomplete update. Report failed record
restoration, cluster release and cleanup, preserving the initiating
error separately from recovery failures.

Include interrupted removal after clusters or records have been freed.
Retain best-effort removal behavior and ordinary early allocation errors;
the earlier cluster-count fix keeps successful deallocation from being
reported as a failure.

Let record removal report its own failures without repeating the same
report in the outer attribute-removal loop.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes in v6:
Rebase onto the updated ntfs-next; retain the v5 reporting behavior.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.

 fs/ntfs/attrib.c | 134 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 100 insertions(+), 34 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index a6750863d795..60d134688371 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -2595,7 +2595,6 @@ int ntfs_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 		goto put_err_out;
 	}
 	if (err != -ENOENT) {
-		err = -EIO;
 		goto put_err_out;
 	}
 	a = ctx->attr;
@@ -2646,7 +2645,9 @@ int ntfs_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
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
@@ -2674,6 +2675,7 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 		__le16 *name, u8 name_len, s64 lowest_vcn, int dataruns_size,
 		__le16 flags)
 {
+	int report_err = 0;
 	struct ntfs_attr_search_ctx *ctx;
 	u32 length;
 	struct attr_record *a;
@@ -2719,7 +2721,6 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 	}
 	if (err != -ENOENT) {
 		pr_err("ntfs_attr_find failed\n");
-		err = -EIO;
 		goto put_err_out;
 	}
 	a = ctx->attr;
@@ -2774,7 +2775,8 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 		err = ntfs_attrlist_entry_add(ni, a);
 		if (err) {
 			pr_err("Failed add attr entry to attrlist\n");
-			ntfs_attr_record_resize(m, a, 0);
+			if (ntfs_attr_record_resize(m, a, 0))
+				report_err = -EFSCORRUPTED;
 			goto put_err_out;
 		}
 	}
@@ -2788,9 +2790,12 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 	err = ntfs_attr_lookup(type, name, name_len, ic,
 				lowest_vcn, NULL, 0, ctx);
 	if (err) {
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
+		}
 		pr_err("%s: attribute lookup failed\n", __func__);
-		ntfs_attr_put_search_ctx(ctx);
-		return err;
+		goto put_err_out;
 
 	}
 	offset = (u8 *)ctx->attr - (u8 *)ctx->mrec;
@@ -2798,6 +2803,8 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 	return offset;
 put_err_out:
 	ntfs_attr_put_search_ctx(ctx);
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(base_ni), report_err);
 	return err;
 }
 
@@ -2810,6 +2817,7 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
  */
 int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 {
+	int report_err = 0;
 	struct ntfs_inode *base_ni, *ni;
 	__le32 type;
 	int err;
@@ -2829,8 +2837,10 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 
 	/* Remove attribute itself. */
 	if (ntfs_attr_record_resize(ctx->mrec, ctx->attr, 0)) {
+		report_err = -EFSCORRUPTED;
 		ntfs_debug("Couldn't remove attribute record. Bug or damaged MFT record.\n");
-		return -EIO;
+		err = -EFSCORRUPTED;
+		goto out;
 	}
 	mark_mft_record_dirty(ni);
 
@@ -2841,8 +2851,9 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 	if (NInoAttrList(base_ni) && type != AT_ATTRIBUTE_LIST) {
 		err = ntfs_attrlist_entry_rm(ctx);
 		if (err) {
+			report_err = err;
 			ntfs_debug("Couldn't delete record from $ATTRIBUTE_LIST.\n");
-			return err;
+			goto out;
 		}
 	}
 
@@ -2857,19 +2868,21 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 	/* Free MFT record, if it doesn't contain attributes. */
 	if (le32_to_cpu(ctx->mrec->bytes_in_use) -
 			le16_to_cpu(ctx->mrec->attrs_offset) == 8) {
-		if (ntfs_mft_record_free(ni->vol, ni)) {
+		err = ntfs_mft_record_free(ni->vol, ni);
+		if (err) {
+			report_err = err;
 			ntfs_debug("Couldn't free MFT record.\n");
-			return -EIO;
+			goto out;
 		}
 		/* Remove done if we freed base inode. */
 		if (ni == base_ni)
-			return 0;
+			goto done;
 		ntfs_inode_close(ni);
 		ctx->ntfs_ino = ni = NULL;
 	}
 
 	if (type == AT_ATTRIBUTE_LIST || !NInoAttrList(base_ni))
-		return 0;
+		goto done;
 
 	/* Remove attribute list if we don't need it any more. */
 	if (!ntfs_attrlist_need(base_ni)) {
@@ -2877,10 +2890,15 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 		struct inode *attr_vi;
 
 		ntfs_attr_reinit_search_ctx(ctx);
-		if (ntfs_attr_lookup(AT_ATTRIBUTE_LIST, NULL, 0, CASE_SENSITIVE,
-					0, NULL, 0, ctx)) {
+		err = ntfs_attr_lookup(AT_ATTRIBUTE_LIST, NULL, 0, CASE_SENSITIVE,
+				       0, NULL, 0, ctx);
+		if (err) {
+			if (err == -ENOENT) {
+				err = -EFSCORRUPTED;
+				report_err = -EFSCORRUPTED;
+			}
 			ntfs_debug("Couldn't find attribute list. Succeed anyway.\n");
-			return 0;
+			goto done;
 		}
 		/* Deallocate clusters. */
 		if (ctx->attr->non_resident) {
@@ -2890,17 +2908,22 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 			al_rl = ntfs_mapping_pairs_decompress(base_ni->vol,
 					ctx->attr, NULL, &new_rl_count);
 			if (IS_ERR(al_rl)) {
+				if (PTR_ERR(al_rl) != -ENOMEM)
+					report_err = -EFSCORRUPTED;
 				ntfs_debug("Couldn't decompress attribute list runlist. Succeed anyway.\n");
-				return 0;
+				goto done;
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
 		if (ntfs_attr_record_rm(ctx)) {
 			ntfs_debug("Couldn't remove attribute list. Succeed anyway.\n");
-			return 0;
+			goto done;
 		}
 
 		na.mft_no = VFS_I(base_ni)->i_ino;
@@ -2916,7 +2939,13 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 		}
 
 	}
-	return 0;
+
+done:
+	err = 0;
+out:
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(base_ni), report_err);
+	return err;
 }
 
 /*
@@ -2950,7 +2979,7 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
 {
 	struct super_block *sb;
 	u32 attr_rec_size;
-	int err, i, offset;
+	int err, i, offset, rollback_err;
 	bool is_resident;
 	bool can_be_non_resident = false;
 	struct ntfs_inode *attr_ni;
@@ -3027,7 +3056,7 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
 retry:
 	ni_mrec = map_mft_record(ni);
 	if (IS_ERR(ni_mrec)) {
-		err = -EIO;
+		err = PTR_ERR(ni_mrec);
 		goto err_out;
 	}
 
@@ -3050,7 +3079,7 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
 		attr_ni = ni->ext.extent_ntfs_inos[i];
 		ni_mrec = map_mft_record(attr_ni);
 		if (IS_ERR(ni_mrec)) {
-			err = -EIO;
+			err = PTR_ERR(ni_mrec);
 			goto err_out;
 		}
 
@@ -3116,18 +3145,31 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
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
@@ -3138,12 +3180,18 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
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
@@ -3155,13 +3203,18 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
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
@@ -3725,7 +3778,7 @@ int ntfs_attr_record_move_away(struct ntfs_attr_search_ctx *ctx, int extra)
 			ntfs_error(sb, "Can not map mft record for mft_no %lld",
 					(unsigned long long)ni->mft_no);
 			mutex_unlock(&base_ni->extent_lock);
-			return -EIO;
+			return PTR_ERR(m);
 		}
 		if (le32_to_cpu(m->bytes_allocated) -
 		    le32_to_cpu(m->bytes_in_use) < le32_to_cpu(ctx->attr->length) + extra) {
@@ -3760,11 +3813,16 @@ int ntfs_attr_record_move_away(struct ntfs_attr_search_ctx *ctx, int extra)
 
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
@@ -5633,6 +5691,7 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 	struct ntfs_attr_search_ctx *ctx;
 	int err = 0, ret = 0;
 	s64 freed = 0;
+	bool removed = false;
 	struct ntfs_inode *base_ni;
 	struct super_block *sb = ni->vol->sb;
 
@@ -5657,6 +5716,7 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 		freed = ntfs_cluster_free(ni, 0, -1, ctx);
 		if (freed < 0) {
 			ret = freed;
+			ntfs_report_file_metadata_error(VFS_I(base_ni), ret);
 			ntfs_error(sb,
 				"Failed to free cluster allocation. Leaving inconstant metadata.\n");
 		}
@@ -5666,6 +5726,8 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 	/* Search for attribute extents and remove them all. */
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
 	if (IS_ERR(ctx)) {
+		if (freed > 0)
+			ntfs_report_file_metadata_error(VFS_I(base_ni), PTR_ERR(ctx));
 		ntfs_error(sb, "%s: Failed to get search context", __func__);
 		return PTR_ERR(ctx);
 	}
@@ -5676,11 +5738,15 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
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

