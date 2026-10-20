Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486010;
	b=VN63OuY5eIYpvpB//2gEzr6940Y8t/nUvuvn6+fhYEO9xIWir999HoorF0GkDTD1cArJ
	 AaHAb0oZkfetuC9GfGe9OCrxpq4d3uvZkSWK+xwr7b+Mmhs8JEOGQKFf6EF1XKFk1DYaf
	 EDeR4h6kAjq8phJ0ySBSb2ldKTmizi2FL5ufg5F3fJhAzwoLg5VDGe9hiEcbLu3aABW6n
	 TDFRBoVulVajhh+h5miF4Sa9Sr5YKIElhomAfyPmnUsyOlo/YwnCqU51SJKjaLBpc4Rnp
	 HitEYEi9zSGQuOMkpfz4YAgtBUvgUalKC5x9R7mMEnrOo2HM8NhIUQg8oB96kxfBCbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486010;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=S8byRuhxVMCO68MJXGoZMkq3//bzdEFz5h/LONihcR0=;
	b=v4c0TP5fkkE0Pf27oyJ3k2ZN2jf6yEYqfPSuUkQokQ7N7pfsj0SUFktE2LB+JHdiGrZ/
	 GGNkfRHhWUkUL6c2Ekr3BJHU8yrcM3x2EYJfXBVKChrtIvVQk5/+mMJ0GRHYIXdwML0HI
	 Jv/WMgqH8/i8ve0ARpYVgeOV09cV0B7Xecd417g2vTdf/IBWRvHXXHa0MekadFNEUeIfM
	 6Z4HFs1IB/MFQIiTquVp1NLn0sXqLx4pmZff1NHaW20wUHREAc+UCJFBAQIsfWxwG+2l9
	 Ks9TNbI9dPbJL1QLuIBkJ+CcpDOgggLihvacj17RP0OTKPRDVv7y89Bt/FK645gNuhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="k+pMMSj/";
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03CA606A31C
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B03CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=k+pMMSj/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=S8
	byRuhxVMCO68MJXGoZMkq3//bzdEFz5h/LONihcR0=; b=k+pMMSj/dHPLMBMUlj
	31JWkEQ/OZcNF3Ni8as+cbfct5SccgDmRI1F4IprmWcZWcjXMZNa2Wj5r+MStRWL
	mkMwW3lKjKuhXyQGwQV2g6AJHPpLzsAIpWENgAI+BaRjlGGCfRI/AG7We6b+Di1j
	T4VSyUh01wSpaXM6TetdCMLLE=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3X_tvKtdqGocHBg--.23211S2;
	Tue, 20 Oct 2026 16:46:40 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 16/31] ntfs: report attribute resize and relocation recovery failures
Date: Tue, 20 Oct 2026 16:44:06 +0800
Message-ID: <20261020084421.2196486-17-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3X_tvKtdqGocHBg--.23211S2
X-Coremail-Antispam: 1Uf129KBjvJXoWfJr1ftr4xAr43Kw1xJr1DZFb_yoWkZw1Dpa
	9xGr9rtwsxJr92grn2y34qvw1akw10g3yUWr9rW3WxAan0yw1IqFW0yFy09FWfKrWkJ3s5
	ta1UC3y7Ar4UXrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j1tC7UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RE3AmrXKnFncAAA38

From: Dandan Wu <wudandan@kylinos.cn>

Resize can fail after changing allocation or record placement without
reporting the resulting state. Report failed recovery and missing
required attributes, preserving allocation errors and using
EFSCORRUPTED for confirmed corruption.

After a nonresident shrink, report context or lookup failures when the
old data size exceeds the shortened allocation. Track whether resident
resize moved records and report interrupted moves or failed list updates
afterward. Keep early allocation failures distinct.

Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
 fs/ntfs/attrib.c | 88 ++++++++++++++++++++++++++++++++++++++++--------
 fs/ntfs/inode.c  | 11 ++++--
 fs/ntfs/inode.h  |  2 +-
 3 files changed, 83 insertions(+), 18 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 73ccc438b319..62985be67a09 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -4092,7 +4092,7 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 					goto put_err_out;
 				}
 				err = ntfs_inode_free_space(base_ni, mp_size -
-							cur_max_mp_size);
+							cur_max_mp_size, NULL);
 				if (err)
 					return err;
 				err = ntfs_attrlist_update_locked(
@@ -4514,6 +4514,7 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 	int err;
 	struct ntfs_inode *base_ni;
 	bool runlist_locked = locked_ni == ni;
+	bool sizes_inconsistent = false;
 
 	ntfs_debug("Inode 0x%llx attr 0x%x new size %lld\n",
 		(unsigned long long)ni->mft_no, ni->type, (long long)newsize);
@@ -4591,7 +4592,9 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 		ntfs_attr_put_search_ctx(ctx);
 
 		/* Truncate the runlist itself. */
-		if (ntfs_rl_truncate_nolock(vol, &ni->runlist, first_free_vcn)) {
+		err = ntfs_rl_truncate_nolock(vol, &ni->runlist, first_free_vcn);
+		if (err) {
+			ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 			/*
 			 * Failed to truncate the runlist, so just throw it
 			 * away, it will be mapped afresh on next use.
@@ -4619,15 +4622,20 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 		err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 		if (err) {
 			ntfs_debug("Eeek! Mapping pairs update failed. Leaving inconstant metadata. Run chkdsk.\n");
+			ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 			goto unlock_runlist;
 		}
 		if (!runlist_locked)
 			up_write(&ni->runlist.lock);
+		sizes_inconsistent = ni->allocated_size < ni->data_size;
 	}
 
 	/* Get the first attribute record. */
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
 	if (IS_ERR(ctx)) {
+		/* The old sizes no longer describe the shortened allocation. */
+		if (sizes_inconsistent)
+			ntfs_report_file_metadata_error(VFS_I(base_ni), PTR_ERR(ctx));
 		ntfs_error(vol->sb, "%s: Failed to get search context", __func__);
 		return PTR_ERR(ctx);
 	}
@@ -4635,8 +4643,15 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 				CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (err) {
-		if (err == -ENOENT)
-			err = -EIO;
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+		} else if (sizes_inconsistent &&
+			   (err == -ENOMEM || err == -EINTR || err == -ERESTARTSYS)) {
+			/* Lookup does not report these otherwise harmless errors. */
+			ntfs_report_file_metadata_error(VFS_I(base_ni), err);
+		}
 		ntfs_debug("Eeek! Lookup of first attribute extent failed. Leaving inconstant metadata.\n");
 		goto put_err_out;
 	}
@@ -4886,7 +4901,9 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 				 rl->length != first_free_vcn -
 					ntfs_bytes_to_cluster(vol, ni->allocated_size) ||
 				 rl[1].length)) {
-				ntfs_cluster_free_from_rl(vol, rl);
+				err2 = ntfs_cluster_free_from_rl(vol, rl);
+				if (err2)
+					ntfs_report_file_metadata_error(VFS_I(base_ni), err2);
 				kvfree(rl);
 				rl = ntfs_cluster_alloc(vol,
 						ntfs_bytes_to_cluster(vol,
@@ -4907,11 +4924,20 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 			/* Append new clusters to attribute runlist. */
 			rln = ntfs_runlists_merge(&ni->runlist, rl, 0, &new_rl_count);
 			if (IS_ERR(rln)) {
+				int free_err;
+
+				err = PTR_ERR(rln);
+				if (err != -ENOMEM) {
+					err = -EFSCORRUPTED;
+					ntfs_report_file_metadata_error(VFS_I(base_ni),
+									-EFSCORRUPTED);
+				}
 				/* Failed, free just allocated clusters. */
 				ntfs_error(sb, "Run list merge failed");
-				ntfs_cluster_free_from_rl(vol, rl);
+				free_err = ntfs_cluster_free_from_rl(vol, rl);
+				if (free_err)
+					ntfs_report_file_metadata_error(VFS_I(base_ni), free_err);
 				kvfree(rl);
-				err = -EIO;
 				goto unlock_runlist;
 			}
 			ni->runlist.rl = rln;
@@ -4957,8 +4983,11 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			       CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (err) {
-		if (err == -ENOENT)
-			err = -EIO;
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+		}
 		if (ni->allocated_size != org_alloc_size)
 			goto rollback;
 		goto put_err_out;
@@ -4982,8 +5011,10 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	/* Free allocated clusters. */
 	freed = ntfs_cluster_free(ni, ntfs_bytes_to_cluster(vol, org_alloc_size),
 				  -1, ctx);
-	if (freed < 0)
+	if (freed < 0) {
 		ntfs_debug("Leaking clusters");
+		ntfs_report_file_metadata_error(VFS_I(base_ni), freed);
+	}
 
 	/*
 	 * Now, truncate the runlist itself.  Restore allocated_size before
@@ -5005,10 +5036,14 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		kvfree(ni->runlist.rl);
 		ni->runlist.rl = NULL;
 		ntfs_error(sb, "Couldn't truncate runlist. Rollback failed");
+		ntfs_report_file_metadata_error(VFS_I(base_ni), err2);
 	} else {
 		/* Restore mapping pairs. */
-		if (__ntfs_attr_update_mapping_pairs(ni, 0, ni, true))
+		err2 = __ntfs_attr_update_mapping_pairs(ni, 0, ni, true);
+		if (err2) {
 			ntfs_error(sb, "Failed to restore old mapping pairs");
+			ntfs_report_file_metadata_error(VFS_I(base_ni), err2);
+		}
 
 		if (NInoSparse(ni) || NInoCompressed(ni)) {
 			ni->itype.compressed.size =  org_compressed_size;
@@ -5048,6 +5083,7 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 	struct super_block *sb = vol->sb;
 	int err = -EIO;
 	struct ntfs_inode *base_ni, *ext_ni = NULL;
+	bool moved;
 
 attr_resize_again:
 	ntfs_debug("Inode 0x%llx attr 0x%x new size %lld\n",
@@ -5069,6 +5105,11 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 	err = ntfs_attr_lookup(attr_ni->type, attr_ni->name, attr_ni->name_len,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (err) {
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+		}
 		ntfs_error(sb, "ntfs_attr_lookup failed");
 		goto put_err_out;
 	}
@@ -5157,6 +5198,10 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 				(__le16 *)((u8 *)a + le16_to_cpu(a->name_offset)),
 				a->name_length);
 		if (IS_ERR(tvi)) {
+			if (PTR_ERR(tvi) == -ENOENT) {
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								-EFSCORRUPTED);
+			}
 			ntfs_error(sb, "Couldn't open attribute");
 			continue;
 		}
@@ -5192,16 +5237,23 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 				return err;
 		}
 
-		err = ntfs_inode_free_space(base_ni, sizeof(struct attr_record));
+		err = ntfs_inode_free_space(base_ni, sizeof(struct attr_record),
+					    &moved);
 		if (err) {
+			/* Previously moved records are not restored on this exit. */
+			if (moved)
+				ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 			err = -ENOSPC;
 			ntfs_error(sb,
 				"Couldn't free space in the MFT record to make attribute list non resident");
 			return err;
 		}
 		err = ntfs_attrlist_update(base_ni);
-		if (err)
+		if (err) {
+			if (moved)
+				ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 			return err;
+		}
 		goto attr_resize_again;
 	}
 
@@ -5215,6 +5267,11 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 	err = ntfs_attr_lookup(attr_ni->type, attr_ni->name, attr_ni->name_len,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (err) {
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+		}
 		ntfs_error(sb, "%s: Attribute lookup failed 2", __func__);
 		goto put_err_out;
 	}
@@ -5256,8 +5313,11 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 	}
 
 	err = ntfs_attrlist_update(base_ni);
-	if (err < 0)
+	if (err < 0) {
+		/* The record moved, but its on-disk list entry is still stale. */
+		ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 		goto put_err_out;
+	}
 
 	ntfs_attr_put_search_ctx(ctx);
 	/* Try to perform resize once again. */
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 564682f59203..83d45383a5d6 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3326,7 +3326,7 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 	/* Free space if there is not enough it for $ATTRIBUTE_LIST. */
 	if (le32_to_cpu(ni_mrec->bytes_allocated) -
 			le32_to_cpu(ni_mrec->bytes_in_use) < attr_al_len) {
-		if (ntfs_inode_free_space(ni, (int)attr_al_len)) {
+		if (ntfs_inode_free_space(ni, (int)attr_al_len, NULL)) {
 			/* Failed to free space. */
 			err = -ENOSPC;
 			ntfs_error(ni->vol->sb, "Failed to free space for attrlist");
@@ -3609,16 +3609,19 @@ static int ntfs_attr_position(__le32 type, struct ntfs_attr_search_ctx *ctx)
  * ntfs_inode_free_space - free space in the MFT record of inode
  * @ni:		ntfs inode in which MFT record free space
  * @size:	amount of space needed to free
+ * @moved:	optional output, set if any attribute record was moved
  *
  * Return 0 on success or error.
  */
-int ntfs_inode_free_space(struct ntfs_inode *ni, int size)
+int ntfs_inode_free_space(struct ntfs_inode *ni, int size, bool *moved)
 {
 	struct ntfs_attr_search_ctx *ctx;
 	int freed, err;
 	struct mft_record *ni_mrec;
 	struct super_block *sb;
 
+	if (moved)
+		*moved = false;
 	if (!ni || size < 0)
 		return -EINVAL;
 	ntfs_debug("Entering for inode %llu, size %d\n", ni->mft_no, size);
@@ -3626,7 +3629,7 @@ int ntfs_inode_free_space(struct ntfs_inode *ni, int size)
 	sb = ni->vol->sb;
 	ni_mrec = map_mft_record(ni);
 	if (IS_ERR(ni_mrec))
-		return -EIO;
+		return PTR_ERR(ni_mrec);
 
 	freed = (le32_to_cpu(ni_mrec->bytes_allocated) -
 			le32_to_cpu(ni_mrec->bytes_in_use));
@@ -3699,6 +3702,8 @@ int ntfs_inode_free_space(struct ntfs_inode *ni, int size)
 			break;
 		}
 		freed += record_size;
+		if (moved)
+			*moved = true;
 
 		/* Check whether we done. */
 		if (size <= freed) {
diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
index 952398753ed1..45eee1e8d462 100644
--- a/fs/ntfs/inode.h
+++ b/fs/ntfs/inode.h
@@ -371,7 +371,7 @@ int ntfs_inode_attach_all_extents(struct ntfs_inode *ni);
 int ntfs_inode_add_attrlist(struct ntfs_inode *ni);
 int ntfs_inode_free_empty_extents(struct ntfs_inode *ni);
 void ntfs_destroy_ext_inode(struct ntfs_inode *ni);
-int ntfs_inode_free_space(struct ntfs_inode *ni, int size);
+int ntfs_inode_free_space(struct ntfs_inode *ni, int size, bool *moved);
 s64 ntfs_inode_attr_pread(struct inode *vi, s64 pos, s64 count, u8 *buf);
 s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf,
 		bool sync);
-- 
2.51.0

