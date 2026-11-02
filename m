Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605019;
	b=vAjSYawKtrQZIC6LBh0aYskEg6WznjCbLbJ4BurNkD6qk+iNklzonMyZ7MaqUSt2BdEK
	 15MLLubKBpJeb+polZ2MKS9dqEBUZKu33URJf5jWJodzxyaRnHFAhSAPH0OJUKGnb1daC
	 TWinWMR4PUWhW1VCN+RN9V453YORqa4B2iPEsE8+lorF5UglKVhXQkIUsRKDuxLZFehDl
	 mT8T9R8kYr34UwP0a7m3f1Qz3NOxwTRHaocfqegCWMZRikAUQuYaS2j/qIlFePJKlfBqP
	 XiP/y8RU5rMkSprdsLEdA6LswWG8UhHI91/UewAvyf1Gt6nQBhkNJ77+WqThBioyPqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605019;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=PuUinAhCOTVlksQZ/mQ7drmW/XHTAEGJQyty3Gkl5Lc=;
	b=jiT1Wq9mmUovqDWJrKoS00xLQkprN/cCMLY/GkY0z/EOHQiUe/+3DInbHxdo8s7Ku5o+
	 D2irso/49ogpPcvvb2ahLiDPuDELDR+StW2XpU4dpVpvvcy0i1cmMj9LqHxoXVIUUbIHZ
	 Lc7Chf2uArZVnVxNXi2lb6EIbXCJaObitBeFynccK7CLM12KxjsHxQsNYzlPk6EB+qLSI
	 YzRouSIbOS5DDhqL//QDYjq8eZzrrepjvjoB2K6RyuZk4rQpBbyLAithdP/EmCTERsGZ3
	 sW2CCzbF1uUiNNJL9Tqm3BpzHo2C4KXG9DX++ddczOUSobdjlaaRAXXPOV5sJCuECrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Q1HCtuax;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3092260A260F
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3092260A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Q1HCtuax
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Pu
	UinAhCOTVlksQZ/mQ7drmW/XHTAEGJQyty3Gkl5Lc=; b=Q1HCtuaxdYiQwBCLFU
	OWBNTFpACfTr+ldybV+DI2BdEhnQv+I1lhPkoUyKF6tBV70i7IcL70MYtSgPpv+/
	cF+ukMogXkaV2i21HQMoYvTSOGg6Mz+BdyUsZxR3YqdqYYQDkorkfIELaikseqeJ
	yz4aFLHAvLtzee1fUjirtWYik=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3vy+HPehqF0lcEw--.2040S7;
	Mon, 02 Nov 2026 15:36:42 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v5 13/31] ntfs: report attribute record update and cleanup failures
Date: Mon,  2 Nov 2026 15:35:14 +0800
Message-Id: <20261102073532.98873-14-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3vy+HPehqF0lcEw--.2040S7
X-Coremail-Antispam: 1Uf129KBjvAXoW3tr43uFWUZry3Cr1xXw15CFg_yoW8JFW8Ko
	W3Zr4Yyw4v9w15Aw1093WDXF9xua98G3y8JrW5AwsrAFs2q3WDC343J343Gayruw4Fgrs0
	gw1xtws5ZFn3Ary7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOXo2UUUUU
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC7wtGL2roPYtRDQAA3l

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

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Validation:
- Twelve cases exercise record removal and the outer attribute-removal
  loop together, checking that propagated failures are reported once.
- All pass in an extracted-source userspace harness with controlled
  dependencies under ASan/UBSan; checks cover reporting calls.

 fs/ntfs/attrib.c | 136 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 101 insertions(+), 35 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index a69b0c6e9de1..7a0af1e4c69d 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -2565,7 +2565,6 @@ int ntfs_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 		goto put_err_out;
 	}
 	if (err != -ENOENT) {
-		err = -EIO;
 		goto put_err_out;
 	}
 	a = ctx->attr;
@@ -2616,7 +2615,9 @@ int ntfs_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
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
@@ -2644,6 +2645,7 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 		__le16 *name, u8 name_len, s64 lowest_vcn, int dataruns_size,
 		__le16 flags)
 {
+	int report_err = 0;
 	struct ntfs_attr_search_ctx *ctx;
 	u32 length;
 	struct attr_record *a;
@@ -2689,7 +2691,6 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 	}
 	if (err != -ENOENT) {
 		pr_err("ntfs_attr_find failed\n");
-		err = -EIO;
 		goto put_err_out;
 	}
 	a = ctx->attr;
@@ -2744,7 +2745,8 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 		err = ntfs_attrlist_entry_add(ni, a);
 		if (err) {
 			pr_err("Failed add attr entry to attrlist\n");
-			ntfs_attr_record_resize(m, a, 0);
+			if (ntfs_attr_record_resize(m, a, 0))
+				report_err = -EFSCORRUPTED;
 			goto put_err_out;
 		}
 	}
@@ -2758,9 +2760,12 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
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
@@ -2768,6 +2773,8 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 	return offset;
 put_err_out:
 	ntfs_attr_put_search_ctx(ctx);
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(base_ni), report_err);
 	return err;
 }
 
@@ -2780,6 +2787,7 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
  */
 int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 {
+	int report_err = 0;
 	struct ntfs_inode *base_ni, *ni;
 	__le32 type;
 	int err;
@@ -2799,8 +2807,10 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 
 	/* Remove attribute itself. */
 	if (ntfs_attr_record_resize(ctx->mrec, ctx->attr, 0)) {
+		report_err = -EFSCORRUPTED;
 		ntfs_debug("Couldn't remove attribute record. Bug or damaged MFT record.\n");
-		return -EIO;
+		err = -EFSCORRUPTED;
+		goto out;
 	}
 	mark_mft_record_dirty(ni);
 
@@ -2811,8 +2821,9 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 	if (NInoAttrList(base_ni) && type != AT_ATTRIBUTE_LIST) {
 		err = ntfs_attrlist_entry_rm(ctx);
 		if (err) {
+			report_err = err;
 			ntfs_debug("Couldn't delete record from $ATTRIBUTE_LIST.\n");
-			return err;
+			goto out;
 		}
 	}
 
@@ -2827,19 +2838,21 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
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
@@ -2847,10 +2860,15 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
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
@@ -2860,17 +2878,22 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
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
@@ -2886,7 +2909,13 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
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
@@ -2920,7 +2949,7 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
 {
 	struct super_block *sb;
 	u32 attr_rec_size;
-	int err, i, offset;
+	int err, i, offset, rollback_err;
 	bool is_resident;
 	bool can_be_non_resident = false;
 	struct ntfs_inode *attr_ni;
@@ -2997,7 +3026,7 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
 retry:
 	ni_mrec = map_mft_record(ni);
 	if (IS_ERR(ni_mrec)) {
-		err = -EIO;
+		err = PTR_ERR(ni_mrec);
 		goto err_out;
 	}
 
@@ -3020,7 +3049,7 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
 		attr_ni = ni->ext.extent_ntfs_inos[i];
 		ni_mrec = map_mft_record(attr_ni);
 		if (IS_ERR(ni_mrec)) {
-			err = -EIO;
+			err = PTR_ERR(ni_mrec);
 			goto err_out;
 		}
 
@@ -3086,18 +3115,31 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
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
@@ -3108,12 +3150,18 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
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
@@ -3125,13 +3173,18 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
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
@@ -3598,7 +3651,7 @@ int ntfs_attr_record_move_to(struct ntfs_attr_search_ctx *ctx, struct ntfs_inode
 	/* Make space and move attribute. */
 	ni_mrec = map_mft_record(ni);
 	if (IS_ERR(ni_mrec)) {
-		err = -EIO;
+		err = PTR_ERR(ni_mrec);
 		goto put_err_out;
 	}
 
@@ -3687,7 +3740,7 @@ int ntfs_attr_record_move_away(struct ntfs_attr_search_ctx *ctx, int extra)
 			ntfs_error(sb, "Can not map mft record for mft_no %lld",
 					(unsigned long long)ni->mft_no);
 			mutex_unlock(&base_ni->extent_lock);
-			return -EIO;
+			return PTR_ERR(m);
 		}
 		if (le32_to_cpu(m->bytes_allocated) -
 		    le32_to_cpu(m->bytes_in_use) < le32_to_cpu(ctx->attr->length) + extra) {
@@ -3722,11 +3775,16 @@ int ntfs_attr_record_move_away(struct ntfs_attr_search_ctx *ctx, int extra)
 
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
@@ -5531,6 +5589,7 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 	struct ntfs_attr_search_ctx *ctx;
 	int err = 0, ret = 0;
 	s64 freed = 0;
+	bool removed = false;
 	struct ntfs_inode *base_ni;
 	struct super_block *sb = ni->vol->sb;
 
@@ -5555,6 +5614,7 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 		freed = ntfs_cluster_free(ni, 0, -1, ctx);
 		if (freed < 0) {
 			ret = freed;
+			ntfs_report_file_metadata_error(VFS_I(base_ni), ret);
 			ntfs_error(sb,
 				"Failed to free cluster allocation. Leaving inconstant metadata.\n");
 		}
@@ -5564,6 +5624,8 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 	/* Search for attribute extents and remove them all. */
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
 	if (IS_ERR(ctx)) {
+		if (freed > 0)
+			ntfs_report_file_metadata_error(VFS_I(base_ni), PTR_ERR(ctx));
 		ntfs_error(sb, "%s: Failed to get search context", __func__);
 		return PTR_ERR(ctx);
 	}
@@ -5574,11 +5636,15 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
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

