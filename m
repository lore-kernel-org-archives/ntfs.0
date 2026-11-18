Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992989;
	b=HLS72lQyVLVrk9YnhzZPXBS1e0vGYAw3XDMWHNU+GoAZ3+lkN61UcXyAZVS75lUMmULd
	 mKdntiCO7AABPs+5PWN7bfqgNWwUzn5vHCUdGatuIdXt/FHhqiJdpnnepavu1el+AICNi
	 6N9ius5T8/QSFHqrFtRxkp/X6UDkxFKLWWrwLgSTD5BCdSOVOzN38CUUX0ygIZtYgaCoj
	 tQkjpQyAbn8LEUD34vNeYJReD59yPPLgDl/zz30IG0Dj0dVvdW157ga3+jM+kdYgHosFj
	 zjWn4l5mhyu3udNJdPjKop0bGHa4jY0v5DcGImGDaH70yXo5djkSGYg4FynGhHkJMuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992989;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=oJ9jVLEAy14PRsphsCskVCGSGOoNWJ3gAEgjsz6bxQw=;
	b=EoTCQpjIagZYh+/tdaxRqyX6KwPodcyZsMJmSo45fOFXtuwsm2Xt7Jld08j8Vde8FICC
	 QbZusG/AbdKRlOoEcxvEr5SuRJFQF37L/IHq2MCFiKx5K/Mt68kNGI+ePs12GIUYYoyWm
	 rXHdbVecMcaXs8KDTGyzqgSARi8NMXIOkz01NxgjOlklt62mCUP+DdZkalfbUxjxahSvp
	 hHWimLff7PQa213gwdaE4unACbx5oE8u3Tvj6KhTkOx2fv2bWmCCW7u12DsPLNTVWnKX3
	 hMcPbvnPOtrEIoQr/FeGfdK/YLdYrbPj97CVx6wobm99w5kKLDdDHB8Bfwlr8AV/jGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=DW3ba0oe;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB88606A883
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAB88606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=DW3ba0oe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=oJ
	9jVLEAy14PRsphsCskVCGSGOoNWJ3gAEgjsz6bxQw=; b=DW3ba0oeRBYxcvcwIM
	aJLswiDis8tFZuhTTH304vSI4yejzDYHoJtVyh4IkTO/CLNS9MHCTZNkzt7+qJZ4
	j+iGmvHio+ZWBX1G/BZ9jSw8KaPXhJsTeq0MqTsppREejDaKr1Gv8RMQcxahZfg5
	cYBVvJNAK/jXcX/92Uyba1CAM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3xC1Pa_1qPhPuGg--.62323S7;
	Wed, 18 Nov 2026 17:09:38 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 21/37] ntfs: report attribute resize and relocation recovery failures
Date: Wed, 18 Nov 2026 17:06:45 +0800
Message-Id: <20261118090701.1858849-22-wangxuewen_ky@163.com>
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
X-CM-TRANSID:PigvCgC3xC1Pa_1qPhPuGg--.62323S7
X-Coremail-Antispam: 1Uf129KBjvAXoW3uF47Aw1kXr45Aw48Ar1kKrg_yoW8Gw4Duo
	WSvF4FywnY9r1Yy3yjk3WktasrZw4DG3yrJrWYyrsrC3Z2qw1DCw13Gw15W3yfuw1Fgrn0
	qw1xtF4kAF18JFy3n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUntx6DUUUU
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC7xMJ8Wr9a1PCJgAA3P

From: Dandan Wu <wudandan@kylinos.cn>

Resize can fail after changing allocation or record placement without
reporting the resulting state. Report failed recovery and missing
required attributes, preserving allocation errors and using
EFSCORRUPTED for confirmed corruption.

After a nonresident shrink, report context or lookup failures when the
old data size exceeds the shortened allocation. Track record moves in
resident resize and attribute-list mapping updates, and report
interrupted changes or failed list persistence unless the updater
already reported the error. Preserve resize and relocation errnos,
keeping early allocation failures distinct.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
Changes in v6:
Rebase onto the updated ntfs-next; retain the v5 reporting behavior.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.

 fs/ntfs/attrib.c | 139 +++++++++++++++++++++++++++++++++++++----------
 fs/ntfs/inode.c  |  11 +++-
 fs/ntfs/inode.h  |   2 +-
 3 files changed, 119 insertions(+), 33 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 29c6dca8cd22..f74746a38433 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -4150,6 +4150,9 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 			 * attributes and try again.
 			 */
 			if (ni->type == AT_ATTRIBUTE_LIST) {
+				bool moved;
+				bool reported;
+
 				ntfs_attr_put_search_ctx(ctx);
 				ctx = NULL;
 				if (locked_ni == ni || defer_attrlist) {
@@ -4157,12 +4160,19 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 					goto put_err_out;
 				}
 				err = ntfs_inode_free_space(base_ni, mp_size -
-							cur_max_mp_size);
-				if (err)
-					return err;
-				err = ntfs_attrlist_update_locked(base_ni, locked_ni, NULL);
-				if (err)
-					return err;
+							cur_max_mp_size, &moved);
+				if (err) {
+					if (moved)
+						report_err = err;
+					goto put_err_out;
+				}
+				err = ntfs_attrlist_update_locked(base_ni, locked_ni,
+								  &reported);
+				if (err) {
+					if (moved && !reported)
+						report_err = err;
+					goto put_err_out;
+				}
 				goto retry;
 			}
 
@@ -4214,10 +4224,16 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 		mark_mft_record_dirty(ctx->ntfs_ino);
 		if ((ctx->ntfs_ino->nr_extents == -1 || NInoAttrList(ctx->ntfs_ino)) &&
 		    ctx->attr->type != AT_ATTRIBUTE_LIST) {
+			bool reported;
+
 			ctx->al_entry->lowest_vcn = cpu_to_le64(stop_vcn);
-			err = ntfs_attrlist_update_locked(base_ni, locked_ni, NULL);
-			if (err)
+			err = ntfs_attrlist_update_locked(base_ni, locked_ni,
+							  &reported);
+			if (err) {
+				if (!reported)
+					report_err = err;
 				goto put_err_out;
+			}
 		}
 
 		/*
@@ -4569,6 +4585,7 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 					struct ntfs_inode *locked_ni,
 					bool pagecache_truncated)
 {
+	int report_err = 0;
 	struct ntfs_volume *vol;
 	struct ntfs_attr_search_ctx *ctx;
 	s64 first_free_vcn;
@@ -4576,6 +4593,7 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 	int err;
 	struct ntfs_inode *base_ni;
 	bool runlist_locked = locked_ni == ni;
+	bool sizes_inconsistent = false;
 
 	ntfs_debug("Inode 0x%llx attr 0x%x new size %lld\n",
 		(unsigned long long)ni->mft_no, ni->type, (long long)newsize);
@@ -4653,7 +4671,9 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 		ntfs_attr_put_search_ctx(ctx);
 
 		/* Truncate the runlist itself. */
-		if (ntfs_rl_truncate_nolock(vol, &ni->runlist, first_free_vcn)) {
+		err = ntfs_rl_truncate_nolock(vol, &ni->runlist, first_free_vcn);
+		if (err) {
+			report_err = err;
 			/*
 			 * Failed to truncate the runlist, so just throw it
 			 * away, it will be mapped afresh on next use.
@@ -4681,24 +4701,36 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 		err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 		if (err) {
 			ntfs_debug("Eeek! Mapping pairs update failed. Leaving inconstant metadata. Run chkdsk.\n");
+			report_err = err;
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
+			report_err = PTR_ERR(ctx);
 		ntfs_error(vol->sb, "%s: Failed to get search context", __func__);
-		return PTR_ERR(ctx);
+		err = PTR_ERR(ctx);
+		goto out;
 	}
 
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 				CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (err) {
-		if (err == -ENOENT)
-			err = -EIO;
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
+		} else if (sizes_inconsistent &&
+			   (err == -ENOMEM || err == -EINTR || err == -ERESTARTSYS)) {
+			/* Lookup does not report these otherwise harmless errors. */
+			report_err = err;
+		}
 		ntfs_debug("Eeek! Lookup of first attribute extent failed. Leaving inconstant metadata.\n");
 		goto put_err_out;
 	}
@@ -4747,11 +4779,14 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 	return 0;
 put_err_out:
 	ntfs_attr_put_search_ctx(ctx);
-	return err;
+	goto out;
 
 unlock_runlist:
 	if (!runlist_locked)
 		up_write(&ni->runlist.lock);
+out:
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(base_ni), report_err);
 	return err;
 }
 
@@ -4770,6 +4805,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		const s64 prealloc_size, unsigned int holes,
 		struct ntfs_inode *locked_ni)
 {
+	int report_err = 0;
 	s64 lcn_seek_from;
 	s64 first_free_vcn;
 	struct ntfs_volume *vol;
@@ -4948,7 +4984,9 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
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
@@ -4969,11 +5007,19 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 			/* Append new clusters to attribute runlist. */
 			rln = ntfs_runlists_merge(&ni->runlist, rl, 0, &new_rl_count);
 			if (IS_ERR(rln)) {
+				int free_err;
+
+				err = PTR_ERR(rln);
+				if (err != -ENOMEM) {
+					err = -EFSCORRUPTED;
+					report_err = -EFSCORRUPTED;
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
@@ -5019,8 +5065,10 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			       CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (err) {
-		if (err == -ENOENT)
-			err = -EIO;
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
+		}
 		if (ni->allocated_size != org_alloc_size)
 			goto rollback;
 		goto put_err_out;
@@ -5044,8 +5092,10 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
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
@@ -5067,10 +5117,14 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
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
@@ -5082,14 +5136,17 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		up_write(&ni->runlist.lock);
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
-	return err;
+	goto out;
 put_err_out:
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
-	return err;
+	goto out;
 unlock_runlist:
 	if (!runlist_locked)
 		up_write(&ni->runlist.lock);
+out:
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(base_ni), report_err);
 	return err;
 }
 
@@ -5110,6 +5167,7 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 	struct super_block *sb = vol->sb;
 	int err = -EIO;
 	struct ntfs_inode *base_ni, *ext_ni = NULL;
+	bool moved, reported;
 
 attr_resize_again:
 	ntfs_debug("Inode 0x%llx attr 0x%x new size %lld\n",
@@ -5131,6 +5189,11 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
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
@@ -5283,6 +5346,10 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 			continue;
 		}
 		if (IS_ERR(tvi)) {
+			if (PTR_ERR(tvi) == -ENOENT) {
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								-EFSCORRUPTED);
+			}
 			ntfs_error(sb, "Couldn't open attribute");
 			continue;
 		}
@@ -5318,16 +5385,22 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 				return err;
 		}
 
-		err = ntfs_inode_free_space(base_ni, sizeof(struct attr_record));
+		err = ntfs_inode_free_space(base_ni, sizeof(struct attr_record),
+					    &moved);
 		if (err) {
-			err = -ENOSPC;
+			/* Previously moved records are not restored on this exit. */
+			if (moved)
+				ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 			ntfs_error(sb,
 				"Couldn't free space in the MFT record to make attribute list non resident");
 			return err;
 		}
-		err = ntfs_attrlist_update(base_ni);
-		if (err)
+		err = ntfs_attrlist_update_locked(base_ni, NULL, &reported);
+		if (err) {
+			if (moved && !reported)
+				ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 			return err;
+		}
 		goto attr_resize_again;
 	}
 
@@ -5341,6 +5414,11 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
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
@@ -5377,13 +5455,16 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 	err = ntfs_attr_record_move_to(ctx, ext_ni);
 	if (err) {
 		ntfs_error(sb, "Couldn't move attribute to new MFT record");
-		err = -ENOMEM;
 		goto put_err_out;
 	}
 
-	err = ntfs_attrlist_update(base_ni);
-	if (err < 0)
+	err = ntfs_attrlist_update_locked(base_ni, NULL, &reported);
+	if (err < 0) {
+		/* The record moved, but its on-disk list entry is still stale. */
+		if (!reported)
+			ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 		goto put_err_out;
+	}
 
 	ntfs_attr_put_search_ctx(ctx);
 	/* Try to perform resize once again. */
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 2e9c11580633..3f5e9948319c 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3351,7 +3351,7 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 	/* Free space if there is not enough it for $ATTRIBUTE_LIST. */
 	if (le32_to_cpu(ni_mrec->bytes_allocated) -
 			le32_to_cpu(ni_mrec->bytes_in_use) < attr_al_len) {
-		if (ntfs_inode_free_space(ni, (int)attr_al_len)) {
+		if (ntfs_inode_free_space(ni, (int)attr_al_len, NULL)) {
 			/* Failed to free space. */
 			err = -ENOSPC;
 			ntfs_error(ni->vol->sb, "Failed to free space for attrlist");
@@ -3634,16 +3634,19 @@ static int ntfs_attr_position(__le32 type, struct ntfs_attr_search_ctx *ctx)
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
@@ -3651,7 +3654,7 @@ int ntfs_inode_free_space(struct ntfs_inode *ni, int size)
 	sb = ni->vol->sb;
 	ni_mrec = map_mft_record(ni);
 	if (IS_ERR(ni_mrec))
-		return -EIO;
+		return PTR_ERR(ni_mrec);
 
 	freed = (le32_to_cpu(ni_mrec->bytes_allocated) -
 			le32_to_cpu(ni_mrec->bytes_in_use));
@@ -3724,6 +3727,8 @@ int ntfs_inode_free_space(struct ntfs_inode *ni, int size)
 			break;
 		}
 		freed += record_size;
+		if (moved)
+			*moved = true;
 
 		/* Check whether we done. */
 		if (size <= freed) {
diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
index 3fcf5b761eab..0ab677210086 100644
--- a/fs/ntfs/inode.h
+++ b/fs/ntfs/inode.h
@@ -373,7 +373,7 @@ int ntfs_inode_attach_all_extents(struct ntfs_inode *ni);
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

