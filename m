Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971F7374A01
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 02:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525450; cv=none; b=Gla+1Gt5mQxMrzn59wrbLb5bh91T45hfAhx+Ue9FOni/RSq+p0CwSg7SAq6qcfh71NN6RI5dAlujcrftx30oWu6LDEXGvEQu+mm7aRJoB+KN8XMC/fg/SiyVIzr53btW1C+mQyQjOB0v36269DNFi3Z2E9pMEPKcDqsXTNfQmQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525450; c=relaxed/simple;
	bh=XXTjMs4aVhyAu3NjwGU1gn0pA79ggF1DQAsPzmR5Rbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwbeSliZ4jcEVzms4A6gf4srkuTu75K775HWpn80rRv3DupzLlv9KpmdPktJsOEGjn955gjxuOu3nezx36ytpoYbxg+SHS+5uCuZ796eJBI+Rjo+HAer+S5T4fwUv8kJwpsmWe5hwsQA4OsZakh33pRJpfLvVOO+F2c0XbVVwfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fSc1ME88; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fSc1ME88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=+p
	GDLOOORkqjfws3dt7zf+KvtByCqkMZDyWZMkAAUFk=; b=fSc1ME88woRBKgxiz9
	b4JiG86+f6MMgQStd8LRU2UJg8xAoWuJEt/cYRqsgLpoIKL5CeeQEsMG66DVbv2n
	H8UXGpfDZgCvWYWLrpwr0/69PnGXxwX9KDmJYhGwXKi3ptGfB6/YEPg0HZQx4Qx9
	owx3oQoIrxa1MkRWq7FhN1dJM=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3J2qz_alqzNjjAw--.2073S4;
	Wed, 16 Sep 2026 10:23:54 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 2/5] ntfs: report attribute errors to fsnotify
Date: Wed, 16 Sep 2026 10:23:42 +0800
Message-ID: <20260916022345.1151836-3-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260916022345.1151836-1-liubaolin12138@163.com>
References: <20260916022345.1151836-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3J2qz_alqzNjjAw--.2073S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3KFWrAF1UXrWUXw43ZFWrXwb_yoWktrWxpF
	9rGwnxtw43try2gws2y34jv34Sk348Wryjvry5Jw13Zan8twn7tF48KFyfuF1S9rWrJwsa
	qr4jg3y7Cr4UXrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jyxRhUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwRqyfWqp-bq9bwAA3C

From: Baolin Liu <liubaolin@kylinos.cn>

Add a file-level helper and report attribute validation and lookup
failures against the affected inode. Cover bitmap, cluster, and
ATTRIBUTE_LIST rollback errors while preserving the original errno.
Track reports in search contexts and through mapping-pairs updates.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/attrib.c   | 71 ++++++++++++++++++++++++++++++++++------------
 fs/ntfs/attrib.h   |  6 ++++
 fs/ntfs/attrlist.c | 16 +++++++----
 fs/ntfs/bitmap.c   |  2 +-
 fs/ntfs/super.c    |  7 +++++
 fs/ntfs/volume.h   |  1 +
 6 files changed, 78 insertions(+), 25 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index b01cbc9eea4a..136bda6433bb 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -205,6 +205,8 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
 			ntfs_attr_put_search_ctx(ctx);
 		unmap_mft_record(base_ni);
 	} else if (ctx_needs_reset) {
+		if (ctx->error_reported)
+			old_ctx.error_reported = true;
 		/*
 		 * If there is no attribute list, restoring the search context
 		 * is accomplished simply by copying the saved context back over
@@ -838,6 +840,7 @@ static int ntfs_attr_find(const __le32 type, const __le16 *name,
 		const u8 *val, const u32 val_len, struct ntfs_attr_search_ctx *ctx)
 {
 	struct attr_record *a;
+	struct ntfs_inode *base_ni;
 	struct ntfs_volume *vol = ctx->ntfs_ino->vol;
 	__le16 *upcase = vol->upcase;
 	u32 upcase_len = vol->upcase_len;
@@ -964,7 +967,12 @@ static int ntfs_attr_find(const __le32 type, const __le16 *name,
 	}
 	ntfs_error(vol->sb, "mft %#llx, type %#x is corrupt. Run chkdsk.",
 		   (long long)ctx->ntfs_ino->mft_no, le32_to_cpu(type));
-	NVolSetErrors(vol);
+	if (ctx->ntfs_ino->nr_extents >= 0)
+		base_ni = ctx->ntfs_ino;
+	else
+		base_ni = ctx->ntfs_ino->ext.base_ntfs_ino;
+	ntfs_report_file_metadata_error(VFS_I(base_ni), -EIO);
+	ctx->error_reported = true;
 	return -EIO;
 }
 
@@ -1501,8 +1509,14 @@ static int ntfs_external_attr_find(const __le32 type,
 		err = -EIO;
 	}
 
-	if (err != -ENOMEM)
-		NVolSetErrors(vol);
+	if (err != -ENOMEM) {
+		if (err != -EINTR && err != -ERESTARTSYS) {
+			ntfs_report_file_metadata_error(VFS_I(base_ni), err);
+			ctx->error_reported = true;
+		} else {
+			NVolSetErrors(vol);
+		}
+	}
 	return err;
 not_found:
 	/*
@@ -1597,6 +1611,7 @@ int ntfs_attr_lookup(const __le32 type, const __le16 *name,
 	struct ntfs_inode *base_ni;
 
 	ntfs_debug("Entering.");
+	ctx->error_reported = false;
 	if (ctx->base_ntfs_ino)
 		base_ni = ctx->base_ntfs_ino;
 	else
@@ -1633,6 +1648,7 @@ static bool ntfs_attr_init_search_ctx(struct ntfs_attr_search_ctx *ctx,
 	/* Sanity checks are performed elsewhere. */
 	ctx->attr = (struct attr_record *)((u8 *)mrec + le16_to_cpu(mrec->attrs_offset));
 	ctx->is_first = true;
+	ctx->error_reported = false;
 	ctx->ntfs_ino = ni;
 	ctx->al_entry = NULL;
 	ctx->base_ntfs_ino = NULL;
@@ -2233,10 +2249,11 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 rl_err_out:
 	up_write(&ni->runlist.lock);
 	if (rl) {
-		if (ntfs_cluster_free_from_rl(vol, rl) < 0) {
+		err2 = ntfs_cluster_free_from_rl(vol, rl);
+		if (err2 < 0) {
 			ntfs_error(vol->sb,
 				"Failed to release allocated cluster(s) in error code path.  Run chkdsk to recover the lost cluster(s).");
-			NVolSetErrors(vol);
+			ntfs_report_file_metadata_error(vi, err2);
 		}
 		kvfree(rl);
 folio_err_out:
@@ -3720,7 +3737,8 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
 static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 					    s64 from_vcn,
 					    struct ntfs_inode *locked_ni,
-					    bool defer_attrlist)
+					    bool defer_attrlist,
+					    bool *error_reported)
 {
 	struct ntfs_attr_search_ctx *ctx;
 	struct ntfs_inode *base_ni;
@@ -4086,8 +4104,11 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 	return 0;
 
 put_err_out:
-	if (ctx)
+	if (ctx) {
+		if (error_reported && ctx->error_reported)
+			*error_reported = true;
 		ntfs_attr_put_search_ctx(ctx);
+	}
 	return err;
 }
 
@@ -4096,7 +4117,16 @@ int ntfs_attr_update_mapping_pairs_locked(struct ntfs_inode *ni,
 					 struct ntfs_inode *locked_ni)
 {
 	return __ntfs_attr_update_mapping_pairs(ni, from_vcn, locked_ni,
-						false);
+						false, NULL);
+}
+
+int ntfs_attr_update_mapping_pairs_locked_reported(struct ntfs_inode *ni,
+						   s64 from_vcn,
+						   struct ntfs_inode *locked_ni,
+						   bool *error_reported)
+{
+	return __ntfs_attr_update_mapping_pairs(ni, from_vcn, locked_ni,
+						false, error_reported);
 }
 
 int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
@@ -4704,7 +4734,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		/* Restore mapping pairs. */
 		if (ni != locked_ni)
 			down_read(&ni->runlist.lock);
-		if (__ntfs_attr_update_mapping_pairs(ni, 0, locked_ni, true))
+		if (__ntfs_attr_update_mapping_pairs(ni, 0, locked_ni, true, NULL))
 			ntfs_error(sb, "Failed to restore old mapping pairs");
 		if (ni != locked_ni)
 			up_read(&ni->runlist.lock);
@@ -5140,7 +5170,8 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 	struct runlist_element *old_rl = NULL;
 	s64 vcn = vcn_start, lcn, clu_count;
 	s64 lcn_seek_from = -1;
-	int err = 0;
+	int err = 0, err2;
+	bool error_reported = false;
 	size_t new_rl_count, old_rl_count;
 
 	err = ntfs_attr_map_whole_runlist(ni);
@@ -5239,10 +5270,11 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 			 old_rl_count * sizeof(*old_rl), GFP_NOFS);
 	if (!old_rl) {
 		err = -ENOMEM;
-		if (ntfs_cluster_free_from_rl(vol, rlc)) {
+		err2 = ntfs_cluster_free_from_rl(vol, rlc);
+		if (err2) {
 			ntfs_error(vol->sb,
 				   "Failed to free cluster allocation after runlist backup failure.");
-			NVolSetErrors(vol);
+			ntfs_report_file_metadata_error(VFS_I(ni), err2);
 		}
 		kvfree(rlc);
 		goto out;
@@ -5272,13 +5304,13 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 		ntfs_attr_reinit_search_ctx(ctx);
 		err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 		if (err) {
-			int err2;
-
 			err2 = ntfs_cluster_free(ni, vcn, clu_count, ctx);
 			if (err2 < 0 || err2 != clu_count) {
 				ntfs_error(vol->sb,
 					   "Failed to free cluster allocation. Leaving inconsistent metadata.\n");
-				NVolSetErrors(vol);
+				if (err2 >= 0)
+					err2 = -EIO;
+				ntfs_report_file_metadata_error(VFS_I(ni), err2);
 				goto out;
 			}
 
@@ -5290,11 +5322,14 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 			ni->runlist.rl = old_rl;
 			ni->runlist.count = old_rl_count;
 			old_rl = NULL;
-			if (ntfs_attr_update_mapping_pairs_locked(
-					ni, 0, ni)) {
+			err2 = ntfs_attr_update_mapping_pairs_locked_reported(ni, 0,
+									      ni,
+									      &error_reported);
+			if (err2) {
 				ntfs_error(vol->sb,
 					   "Failed to restore mapping pairs after allocation rollback.\n");
-				NVolSetErrors(vol);
+				if (!error_reported)
+					ntfs_report_file_metadata_error(VFS_I(ni), err2);
 			}
 		}
 	} else {
diff --git a/fs/ntfs/attrib.h b/fs/ntfs/attrib.h
index 6b4fa9f57640..56cec2c8b914 100644
--- a/fs/ntfs/attrib.h
+++ b/fs/ntfs/attrib.h
@@ -21,6 +21,7 @@ extern __le16 AT_UNNAMED[];
  * @mapped_mrec: true if @mrec was mapped by the search functions
  * @attr: attribute record in @mrec where to begin/continue search
  * @is_first: if true ntfs_attr_lookup() begins search with @attr, else after
+ * @error_reported: current lookup already reported its metadata error
  * @ntfs_ino: Inode owning this attribute search
  * @al_entry: Current attribute list entry
  * @base_ntfs_ino: Base inode
@@ -44,6 +45,7 @@ struct ntfs_attr_search_ctx {
 	bool mapped_mrec;
 	struct attr_record *attr;
 	bool is_first;
+	bool error_reported;
 	struct ntfs_inode *ntfs_ino;
 	struct attr_list_entry *al_entry;
 	struct ntfs_inode *base_ntfs_ino;
@@ -142,6 +144,10 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn);
 int ntfs_attr_update_mapping_pairs_locked(struct ntfs_inode *ni,
 					  s64 from_vcn,
 					 struct ntfs_inode *locked_ni);
+int ntfs_attr_update_mapping_pairs_locked_reported(struct ntfs_inode *ni,
+						   s64 from_vcn,
+						   struct ntfs_inode *locked_ni,
+						   bool *error_reported);
 struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64 *lcn);
 
 /*
diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
index 7c09d02fd941..69365bf94d91 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -78,7 +78,8 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 	s64 old_alloc_size;
 	size_t old_rl_count, new_rl_count;
 	unsigned long flags;
-	int err, restore_err;
+	int err, free_err, restore_err;
+	bool error_reported = false;
 	if (attr_ni->mft_no != FILE_MFT || !NInoNonResident(attr_ni) ||
 		min_alloc_size < 0)
 		return -EINVAL;
@@ -159,11 +160,12 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 		goto restore_old_runlist;
 
 	/* The new mapping is now authoritative; release the old data runs. */
-	if (ntfs_cluster_free_from_rl(vol, old_rl)) {
+	free_err = ntfs_cluster_free_from_rl(vol, old_rl);
+	if (free_err) {
 		ntfs_error(vol->sb,
 			   "Failed to free old ATTRIBUTE_LIST extent: inode %#llx",
 			   (long long)attr_ni->mft_no);
-		NVolSetErrors(vol);
+		ntfs_report_file_metadata_error(attr_vi, free_err);
 	}
 	kvfree(old_rl);
 	kvfree(data);
@@ -179,12 +181,14 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 	attr_ni->allocated_size = old_alloc_size;
 	write_unlock_irqrestore(&attr_ni->size_lock, flags);
 
-	restore_err = ntfs_attr_update_mapping_pairs_locked(
-			attr_ni, 0, locked_ni);
+	restore_err = ntfs_attr_update_mapping_pairs_locked_reported(attr_ni, 0,
+								     locked_ni,
+								     &error_reported);
 	if (restore_err) {
 		ntfs_error(vol->sb, "Failed to restore ATTRIBUTE_LIST mapping pairs (%d)",
 			   restore_err);
-		NVolSetErrors(vol);
+		if (!error_reported)
+			ntfs_report_file_metadata_error(attr_vi, restore_err);
 	}
 
 	ntfs_cluster_free_from_rl(vol, new_rl);
diff --git a/fs/ntfs/bitmap.c b/fs/ntfs/bitmap.c
index 1840b7d84c62..c3faad256e2e 100644
--- a/fs/ntfs/bitmap.c
+++ b/fs/ntfs/bitmap.c
@@ -286,7 +286,7 @@ int __ntfs_bitmap_set_bits_in_run(struct inode *vi, const s64 start_bit,
 		ntfs_error(vi->i_sb,
 			"Failed to map subsequent page (error %i) and rollback failed (error %i). Aborting and leaving inconsistent metadata. Unmount and run chkdsk.",
 			err, pos);
-		NVolSetErrors(NTFS_SB(vi->i_sb));
+		ntfs_report_file_metadata_error(vi, pos);
 	}
 	return err;
 }
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 340aad497b88..7f6812d27fd1 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -345,6 +345,13 @@ void ntfs_report_metadata_error(struct ntfs_volume *vol, int error)
 		fserror_report_metadata(vol->sb, error, GFP_ATOMIC);
 }
 
+void ntfs_report_file_metadata_error(struct inode *inode, int error)
+{
+	NVolSetErrors(NTFS_SB(inode->i_sb));
+	if (inode->i_sb->s_flags & SB_ACTIVE)
+		fserror_report_file_metadata(inode, error, GFP_ATOMIC);
+}
+
 void ntfs_handle_error(struct super_block *sb)
 {
 	struct ntfs_volume *vol = NTFS_SB(sb);
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index 55d08319820e..7daac7048a4c 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -251,6 +251,7 @@ DEFINE_NVOL_BIT_OPS(NativeSymlinkRel)
 DEFINE_NVOL_BIT_OPS(SymlinkNative)
 
 void ntfs_report_metadata_error(struct ntfs_volume *vol, int error);
+void ntfs_report_file_metadata_error(struct inode *inode, int error);
 
 static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 nr)
 {
-- 
2.51.0

