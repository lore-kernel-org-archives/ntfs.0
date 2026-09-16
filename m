Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA5F370AFB
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 02:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525461; cv=none; b=QkfwGf6clb5ouxBbrcTHwUERv6IdSWKzdM+EddjTcWyO4x9LesvoV+7bpdyGTOQrA00K0rKoxjSz4KTyWON6TwoC23pi/e48De8zINm9lLWhEDtAD4aCr8MsemJiB+YkwET7luYQWvnrc4wJsH5PiGkvnBxkxqhfTnl/Pge40+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525461; c=relaxed/simple;
	bh=dnF+hnW1kSlFfktQ6P3qpFW5C4yLudBpsGLeBpSdCLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UN0JYHWItent84CW9VCQve/sKqjftsIZsUuifGHwLrnrMbhslXrHoVpSdbUvhHmCvepBLgZMssq3pcWwJLCINt4Nlmv2Zu/qeJKmHrhgXkoe3qg+Qwu71TOWvY1Jr3R8dXBscqRw7LC5hDh9lalCKzklNwmX5ODiceU4UHwtkTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=o7IMa+gR; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="o7IMa+gR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=u/
	ajqwzhgC1yyrd7vylUCVYvwt0R2itCEqfOr5Vmpto=; b=o7IMa+gRE+No9r0f+3
	vWO3JQdZjU2VymJ7cFAeO5Bqc32AAV1STPenj4/9kCE0tES0I2WFel0+/xYJoieq
	qdfA0kG4wArLKQvovrYZ1UAd1DPOoekfz5kzZra5sxoIbCPP0RecRB6zTUT8mu5j
	yVtMFCmTTe5IO3c/skSsYqEM4=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3J2qz_alqzNjjAw--.2073S6;
	Wed, 16 Sep 2026 10:23:57 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 4/5] ntfs: report MFT errors to fsnotify
Date: Wed, 16 Sep 2026 10:23:44 +0800
Message-ID: <20260916022345.1151836-5-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3J2qz_alqzNjjAw--.2073S6
X-Coremail-Antispam: 1Uf129KBjvAXoWfZw48uFyfXrW8uFW8Aw4kCrg_yoW5JF48Xo
	WavFs0yw4vk3W5Aa4jk3Z3Xas8Aws8C395trW5WrsrurZ2gw1UJ34xKw129ayxW3WrWws2
	gr1ktrs5ZF13AFyfn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU738nUUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwR2zfmqp-b29uAAA3X

From: Baolin Liu <liubaolin@kylinos.cn>

Report MFT validation, mapping, allocation, rollback, and writeback
failures through the appropriate volume-level or file-level helper.
Add reporting-aware mapping APIs and propagate their state to callers.
Report asynchronous MFT writeback errors from I/O completion.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/attrib.c |  19 ++--
 fs/ntfs/inode.c  |  10 +-
 fs/ntfs/mft.c    | 252 +++++++++++++++++++++++++++++++----------------
 fs/ntfs/mft.h    |   6 ++
 4 files changed, 191 insertions(+), 96 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 136bda6433bb..c847bffd0bca 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -94,6 +94,7 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
 	struct folio *put_this_folio = NULL;
 	int err = 0;
 	bool ctx_is_temporary = false, ctx_needs_reset = false;
+	bool mft_error_reported = false;
 	struct ntfs_attr_search_ctx old_ctx = { NULL, };
 	size_t new_rl_count;
 
@@ -238,7 +239,10 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
 				if (old_ctx.base_ntfs_ino &&
 				    old_ctx.ntfs_ino !=	old_ctx.base_ntfs_ino) {
 retry_map:
-					ctx->mrec = map_mft_record(old_ctx.ntfs_ino);
+					ctx->mrec = map_mft_record_reported(old_ctx.ntfs_ino,
+									    &mft_error_reported);
+					if (mft_error_reported)
+						old_ctx.error_reported = true;
 					/*
 					 * Something bad has happened.  If out
 					 * of memory retry till it succeeds.
@@ -1163,7 +1167,7 @@ static int ntfs_external_attr_find(const __le32 type,
 	__le16 *al_name;
 	u32 al_name_len;
 	u32 attr_len, mft_free_len;
-	bool is_first_search = false;
+	bool error_reported = false, is_first_search = false;
 	int err = 0;
 	static const char *es = " Unmount and run chkdsk.";
 
@@ -1382,10 +1386,12 @@ static int ntfs_external_attr_find(const __le32 type,
 				ctx->mrec = ctx->base_mrec;
 				ctx->mapped_mrec = ctx->mapped_base_mrec;
 			} else {
+				u64 mref = le64_to_cpu(al_entry->mft_reference);
+
 				/* We want an extent record. */
-				ctx->mrec = map_extent_mft_record(base_ni,
-						le64_to_cpu(
-						al_entry->mft_reference), &ni);
+				ctx->mrec = map_extent_mft_record_reported(base_ni, mref,
+									   &ni,
+									   &error_reported);
 				if (IS_ERR(ctx->mrec)) {
 					ntfs_error(vol->sb,
 							"Failed to map extent mft record 0x%lx of base inode 0x%llx.%s",
@@ -1511,7 +1517,8 @@ static int ntfs_external_attr_find(const __le32 type,
 
 	if (err != -ENOMEM) {
 		if (err != -EINTR && err != -ERESTARTSYS) {
-			ntfs_report_file_metadata_error(VFS_I(base_ni), err);
+			if (!error_reported)
+				ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 			ctx->error_reported = true;
 		} else {
 			NVolSetErrors(vol);
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 13f353905fb3..ab5424b1593f 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -715,7 +715,7 @@ static int ntfs_read_locked_inode(struct inode *vi)
 	if (vi->i_ino != FILE_MFT)
 		ntfs_init_big_inode(vi);
 
-	m = map_mft_record(ni);
+	m = map_mft_record_reported(ni, &error_reported);
 	if (IS_ERR(m)) {
 		err = PTR_ERR(m);
 		goto err_out;
@@ -1309,7 +1309,7 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
 	/* Set inode type to zero but preserve permissions. */
 	vi->i_mode	= base_vi->i_mode & ~S_IFMT;
 
-	m = map_mft_record(base_ni);
+	m = map_mft_record_reported(base_ni, &error_reported);
 	if (IS_ERR(m)) {
 		err = PTR_ERR(m);
 		goto err_out;
@@ -1553,7 +1553,7 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 	/* Set inode type to zero but preserve permissions. */
 	vi->i_mode	= base_vi->i_mode & ~S_IFMT;
 	/* Map the mft record for the base inode. */
-	m = map_mft_record(base_ni);
+	m = map_mft_record_reported(base_ni, &error_reported);
 	if (IS_ERR(m)) {
 		err = PTR_ERR(m);
 		goto err_out;
@@ -2793,7 +2793,7 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 
 	mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
 	/* Map, pin, and lock the mft record belonging to the inode. */
-	m = map_mft_record(ni);
+	m = map_mft_record_reported(ni, &error_reported);
 	if (IS_ERR(m)) {
 		mutex_unlock(&ni->mrec_lock);
 		err = PTR_ERR(m);
@@ -2873,7 +2873,7 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 				int ret;
 
 				mutex_lock(&tni->mrec_lock);
-				tm = map_mft_record(tni);
+				tm = map_mft_record_reported(tni, &error_reported);
 				if (IS_ERR(tm)) {
 					mutex_unlock(&tni->mrec_lock);
 					if (!err || err == -ENOMEM)
diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index c565bec49c7d..b7b018f4350e 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -108,9 +108,11 @@ int ntfs_mft_record_check(const struct ntfs_volume *vol, struct mft_record *m,
  * The return value needs to be checked with IS_ERR(). If it is true,
  * PTR_ERR() contains the negative error code.
  */
-static inline struct mft_record *map_mft_record_folio(struct ntfs_inode *ni)
+static inline struct mft_record *
+map_mft_record_folio(struct ntfs_inode *ni, bool *error_reported)
 {
 	loff_t i_size;
+	struct ntfs_inode *base_ni;
 	struct ntfs_volume *vol = ni->vol;
 	struct inode *mft_vi = vol->mft_ino;
 	struct folio *folio;
@@ -169,7 +171,13 @@ static inline struct mft_record *map_mft_record_folio(struct ntfs_inode *ni)
 		kfree(ni->mrec);
 		ni->mrec = NULL;
 		folio = ERR_PTR(-EIO);
-		NVolSetErrors(vol);
+		if (ni->nr_extents >= 0)
+			base_ni = ni;
+		else
+			base_ni = ni->ext.base_ntfs_ino;
+		ntfs_report_file_metadata_error(VFS_I(base_ni), -EIO);
+		if (error_reported)
+			*error_reported = true;
 	}
 err_out:
 	ni->folio = NULL;
@@ -195,7 +203,8 @@ static inline struct mft_record *map_mft_record_folio(struct ntfs_inode *ni)
  * Return: A pointer to the mft record. You need to check the returned
  * pointer with IS_ERR().
  */
-struct mft_record *map_mft_record(struct ntfs_inode *ni)
+static struct mft_record *__map_mft_record(struct ntfs_inode *ni,
+					   bool *error_reported)
 {
 	struct mft_record *m;
 
@@ -210,7 +219,7 @@ struct mft_record *map_mft_record(struct ntfs_inode *ni)
 	if (ni->folio)
 		return (struct mft_record *)ni->mrec;
 
-	m = map_mft_record_folio(ni);
+	m = map_mft_record_folio(ni, error_reported);
 	if (!IS_ERR(m))
 		return m;
 
@@ -220,6 +229,17 @@ struct mft_record *map_mft_record(struct ntfs_inode *ni)
 	return m;
 }
 
+struct mft_record *map_mft_record(struct ntfs_inode *ni)
+{
+	return __map_mft_record(ni, NULL);
+}
+
+struct mft_record *map_mft_record_reported(struct ntfs_inode *ni,
+					   bool *error_reported)
+{
+	return __map_mft_record(ni, error_reported);
+}
+
 /*
  * unmap_mft_record - release a reference to a mapped mft record
  * @ni:		ntfs inode whose MFT record to unmap
@@ -262,8 +282,10 @@ void unmap_mft_record(struct ntfs_inode *ni)
  * On successful return, @ntfs_ino contains a pointer to the ntfs_inode
  * structure of the mapped extent inode.
  */
-struct mft_record *map_extent_mft_record(struct ntfs_inode *base_ni, u64 mref,
-		struct ntfs_inode **ntfs_ino)
+static struct mft_record *__map_extent_mft_record(struct ntfs_inode *base_ni,
+						  u64 mref,
+						  struct ntfs_inode **ntfs_ino,
+						  bool *error_reported)
 {
 	struct mft_record *m;
 	struct ntfs_inode *ni = NULL;
@@ -299,7 +321,7 @@ struct mft_record *map_extent_mft_record(struct ntfs_inode *base_ni, u64 mref,
 		mutex_unlock(&base_ni->extent_lock);
 		atomic_dec(&base_ni->count);
 		/* We found the record; just have to map and return it. */
-		m = map_mft_record(ni);
+		m = map_mft_record_reported(ni, error_reported);
 		/* map_mft_record() has incremented this on success. */
 		atomic_dec(&ni->count);
 		if (!IS_ERR(m)) {
@@ -333,7 +355,7 @@ struct mft_record *map_extent_mft_record(struct ntfs_inode *base_ni, u64 mref,
 	ni->nr_extents = -1;
 	ni->ext.base_ntfs_ino = base_ni;
 	/* Now map the record. */
-	m = map_mft_record(ni);
+	m = map_mft_record_reported(ni, error_reported);
 	if (IS_ERR(m)) {
 		atomic_dec(&base_ni->count);
 		ntfs_clear_extent_inode(ni);
@@ -396,6 +418,21 @@ struct mft_record *map_extent_mft_record(struct ntfs_inode *base_ni, u64 mref,
 	return m;
 }
 
+struct mft_record *map_extent_mft_record(struct ntfs_inode *base_ni, u64 mref,
+					 struct ntfs_inode **ntfs_ino)
+{
+	return __map_extent_mft_record(base_ni, mref, ntfs_ino, NULL);
+}
+
+struct mft_record *
+map_extent_mft_record_reported(struct ntfs_inode *base_ni, u64 mref,
+			       struct ntfs_inode **ntfs_ino,
+			       bool *error_reported)
+{
+	return __map_extent_mft_record(base_ni, mref, ntfs_ino,
+			error_reported);
+}
+
 /*
  * __mark_mft_record_dirty - mark the base vfs inode dirty
  * @ni:		ntfs inode describing the mapped mft record
@@ -475,7 +512,8 @@ static void ntfs_mft_end_io(struct bio *bio)
 		err = ctx->error;
 	if (err) {
 		mapping_set_error(ctx->mapping, err);
-		NVolSetErrors(ctx->vol);
+		if (!done)
+			ntfs_report_file_metadata_error(ctx->mapping->host, err);
 		ntfs_error(ctx->vol->sb, "I/O error while writing MFT: %d",
 			   err);
 	}
@@ -672,8 +710,8 @@ static int ntfs_prepare_mft_record_io_units(struct ntfs_inode *ni,
  *
  * On success, clean the mft record and return 0.  On ENOMEM, redirty the
  * record so it can be retried.  Asynchronous callers return success after
- * redirtying while synchronous callers receive the error.  For other errors,
- * mark the volume with errors.
+ * redirtying while synchronous callers receive the error.  The caller is
+ * responsible for reporting other errors.
  *
  * If @sync is false, PG_writeback keeps the folio stable and serializes later
  * writers until the I/O completes.
@@ -807,8 +845,7 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 		mark_mft_record_dirty(ni);
 		if (!sync)
 			err = 0;
-	} else
-		NVolSetErrors(vol);
+	}
 	return err;
 }
 
@@ -1339,9 +1376,11 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 	struct ntfs_attr_search_ctx *ctx = NULL;
 	struct mft_record *mrec;
 	struct attr_record *a = NULL;
-	int ret, mp_size;
+	int err, ret, mp_size;
 	u32 old_alen = 0;
+	u16 mp_ofs;
 	u8 *b, tb;
+	bool error_reported = false;
 	struct {
 		u8 added_cluster:1;
 		u8 added_run:1;
@@ -1425,10 +1464,11 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 		if (IS_ERR(rl)) {
 			up_write(&mftbmp_ni->runlist.lock);
 			ntfs_error(vol->sb, "Failed to merge runlists for mft bitmap.");
-			if (ntfs_cluster_free_from_rl(vol, rl2)) {
+			err = ntfs_cluster_free_from_rl(vol, rl2);
+			if (err) {
 				ntfs_error(vol->sb, "Failed to deallocate allocated cluster.%s",
 						es);
-				NVolSetErrors(vol);
+				ntfs_report_metadata_error(vol, err);
 			}
 			kvfree(rl2);
 			return PTR_ERR(rl);
@@ -1548,9 +1588,11 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 
 restore_undo_alloc:
 	ntfs_attr_reinit_search_ctx(ctx);
-	if (ntfs_attr_lookup(mftbmp_ni->type, mftbmp_ni->name,
-			mftbmp_ni->name_len, CASE_SENSITIVE, rl[1].vcn, NULL,
-			0, ctx)) {
+	err = ntfs_attr_lookup(mftbmp_ni->type, mftbmp_ni->name,
+			       mftbmp_ni->name_len, CASE_SENSITIVE, rl[1].vcn,
+			       NULL, 0, ctx);
+	if (err) {
+		error_reported = ctx->error_reported;
 		ntfs_error(vol->sb,
 			"Failed to find last attribute extent of mft bitmap attribute.%s", es);
 		write_lock_irqsave(&mftbmp_ni->size_lock, flags);
@@ -1563,7 +1605,8 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 		 * The only thing that is now wrong is ->allocated_size of the
 		 * base attribute extent which chkdsk should be able to fix.
 		 */
-		NVolSetErrors(vol);
+		if (!error_reported)
+			ntfs_report_metadata_error(vol, err);
 		return ret;
 	}
 	a = ctx->attr;
@@ -1582,31 +1625,38 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 	}
 	/* Deallocate the cluster. */
 	down_write(&vol->lcnbmp_lock);
-	if (ntfs_bitmap_clear_bit(vol->lcnbmp_ino, lcn)) {
+	err = ntfs_bitmap_clear_bit(vol->lcnbmp_ino, lcn);
+	if (err) {
 		ntfs_error(vol->sb, "Failed to free allocated cluster.%s", es);
-		NVolSetErrors(vol);
-	} else
+		ntfs_report_metadata_error(vol, err);
+	} else {
 		ntfs_inc_free_clusters(vol, 1);
+	}
 	up_write(&vol->lcnbmp_lock);
 	if (status.mp_rebuilt) {
-		if (ntfs_mapping_pairs_build(vol, (u8 *)a + le16_to_cpu(
-				a->data.non_resident.mapping_pairs_offset),
-				old_alen - le16_to_cpu(
-				a->data.non_resident.mapping_pairs_offset),
-				rl2, ll, -1, NULL, NULL, NULL)) {
+		mp_ofs = le16_to_cpu(a->data.non_resident.mapping_pairs_offset);
+		err = ntfs_mapping_pairs_build(vol, (u8 *)a + mp_ofs,
+					       old_alen - mp_ofs, rl2, ll, -1,
+					       NULL, NULL, NULL);
+		if (err) {
 			ntfs_error(vol->sb, "Failed to restore mapping pairs array.%s", es);
-			NVolSetErrors(vol);
+			ntfs_report_metadata_error(vol, err);
 		}
-		if (ntfs_attr_record_resize(ctx->mrec, a, old_alen)) {
+		err = ntfs_attr_record_resize(ctx->mrec, a, old_alen);
+		if (err) {
 			ntfs_error(vol->sb, "Failed to restore attribute record.%s", es);
-			NVolSetErrors(vol);
+			ntfs_report_metadata_error(vol, err);
 		}
 		mark_mft_record_dirty(ctx->ntfs_ino);
-	} else if (status.mp_extended &&
-		   ntfs_attr_update_mapping_pairs_locked(mftbmp_ni, 0,
-							  mftbmp_ni)) {
-		ntfs_error(vol->sb, "Failed to restore mapping pairs.%s", es);
-		NVolSetErrors(vol);
+	} else if (status.mp_extended) {
+		err = ntfs_attr_update_mapping_pairs_locked_reported(mftbmp_ni, 0,
+								     mftbmp_ni,
+								     &error_reported);
+		if (err) {
+			ntfs_error(vol->sb, "Failed to restore mapping pairs.%s", es);
+			if (!error_reported)
+				ntfs_report_metadata_error(vol, err);
+		}
 	}
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
@@ -1639,7 +1689,8 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 	struct ntfs_attr_search_ctx *ctx;
 	struct mft_record *mrec;
 	struct attr_record *a;
-	int ret;
+	int err, ret;
+	bool error_reported = false;
 
 	ntfs_debug("Extending mft bitmap initialized (and data) size.");
 	mft_ni = NTFS_I(vol->mft_ino);
@@ -1696,23 +1747,28 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 	}
 	ntfs_error(vol->sb, "Failed to write to mft bitmap.");
 	/* Try to recover from the error. */
-	mrec = map_mft_record(mft_ni);
+	mrec = map_mft_record_reported(mft_ni, &error_reported);
 	if (IS_ERR(mrec)) {
 		ntfs_error(vol->sb, "Failed to map mft record.%s", es);
-		NVolSetErrors(vol);
+		err = PTR_ERR(mrec);
+		if (!error_reported)
+			ntfs_report_metadata_error(vol, err);
 		return ret;
 	}
 	ctx = ntfs_attr_get_search_ctx(mft_ni, mrec);
 	if (unlikely(!ctx)) {
 		ntfs_error(vol->sb, "Failed to get search context.%s", es);
-		NVolSetErrors(vol);
+		ntfs_report_metadata_error(vol, -ENOMEM);
 		goto unm_err_out;
 	}
-	if (ntfs_attr_lookup(mftbmp_ni->type, mftbmp_ni->name,
-			mftbmp_ni->name_len, CASE_SENSITIVE, 0, NULL, 0, ctx)) {
+	err = ntfs_attr_lookup(mftbmp_ni->type, mftbmp_ni->name,
+			       mftbmp_ni->name_len, CASE_SENSITIVE, 0, NULL, 0,
+			       ctx);
+	if (err) {
 		ntfs_error(vol->sb,
 			"Failed to find first attribute extent of mft bitmap attribute.%s", es);
-		NVolSetErrors(vol);
+		if (!ctx->error_reported)
+			ntfs_report_metadata_error(vol, err);
 put_err_out:
 		ntfs_attr_put_search_ctx(ctx);
 unm_err_out:
@@ -1774,9 +1830,10 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	struct ntfs_attr_search_ctx *ctx = NULL;
 	struct mft_record *mrec;
 	struct attr_record *a = NULL;
-	int ret, mp_size;
+	int err, ret, mp_size;
 	u32 old_alen = 0;
-	bool mp_rebuilt = false, mp_extended = false;
+	u16 mp_ofs;
+	bool error_reported = false, mp_rebuilt = false, mp_extended = false;
 	size_t new_rl_count;
 
 	ntfs_debug("Extending mft data allocation.");
@@ -1862,10 +1919,11 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	if (IS_ERR(rl)) {
 		up_write(&mft_ni->runlist.lock);
 		ntfs_error(vol->sb, "Failed to merge runlists for mft data attribute.");
-		if (ntfs_cluster_free_from_rl(vol, rl2)) {
+		err = ntfs_cluster_free_from_rl(vol, rl2);
+		if (err) {
 			ntfs_error(vol->sb,
 				"Failed to deallocate clusters from the mft data attribute.%s", es);
-			NVolSetErrors(vol);
+			ntfs_report_metadata_error(vol, err);
 		}
 		kvfree(rl2);
 		return PTR_ERR(rl);
@@ -1985,8 +2043,10 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	return 0;
 restore_undo_alloc:
 	ntfs_attr_reinit_search_ctx(ctx);
-	if (ntfs_attr_lookup(mft_ni->type, mft_ni->name, mft_ni->name_len,
-			CASE_SENSITIVE, rl[1].vcn, NULL, 0, ctx)) {
+	err = ntfs_attr_lookup(mft_ni->type, mft_ni->name, mft_ni->name_len,
+			       CASE_SENSITIVE, rl[1].vcn, NULL, 0, ctx);
+	if (err) {
+		error_reported = ctx->error_reported;
 		ntfs_error(vol->sb,
 			"Failed to find last attribute extent of mft data attribute.%s", es);
 		write_lock_irqsave(&mft_ni->size_lock, flags);
@@ -1999,45 +2059,55 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 		 * The only thing that is now wrong is ->allocated_size of the
 		 * base attribute extent which chkdsk should be able to fix.
 		 */
-		NVolSetErrors(vol);
+		if (!error_reported)
+			ntfs_report_metadata_error(vol, err);
 		return ret;
 	}
 	ctx->attr->data.non_resident.highest_vcn =
 			cpu_to_le64(old_last_vcn - 1);
 undo_alloc:
-	if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
+	err = ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx);
+	if (err < 0) {
 		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
-		NVolSetErrors(vol);
+		ntfs_report_metadata_error(vol, err);
 	}
 
-	if (ntfs_rl_truncate_nolock(vol, &mft_ni->runlist, old_last_vcn)) {
+	err = ntfs_rl_truncate_nolock(vol, &mft_ni->runlist, old_last_vcn);
+	if (err) {
 		ntfs_error(vol->sb, "Failed to truncate mft data attribute runlist.%s", es);
-		NVolSetErrors(vol);
-	}
-	if (mp_extended && ntfs_attr_update_mapping_pairs(mft_ni, 0)) {
-		ntfs_error(vol->sb, "Failed to restore mapping pairs.%s",
-			   es);
-		NVolSetErrors(vol);
+		ntfs_report_metadata_error(vol, err);
+	}
+	if (mp_extended) {
+		err = ntfs_attr_update_mapping_pairs_locked_reported(mft_ni, 0,
+								     NULL,
+								     &error_reported);
+		if (err) {
+			ntfs_error(vol->sb, "Failed to restore mapping pairs.%s",
+				   es);
+			if (!error_reported)
+				ntfs_report_metadata_error(vol, err);
+		}
 	}
 	if (ctx) {
 		a = ctx->attr;
 		if (mp_rebuilt && !IS_ERR(ctx->mrec)) {
-			if (ntfs_mapping_pairs_build(vol, (u8 *)a + le16_to_cpu(
-				a->data.non_resident.mapping_pairs_offset),
-				old_alen - le16_to_cpu(
-					a->data.non_resident.mapping_pairs_offset),
-				rl2, ll, -1, NULL, NULL, NULL)) {
+			mp_ofs = le16_to_cpu(a->data.non_resident.mapping_pairs_offset);
+			err = ntfs_mapping_pairs_build(vol, (u8 *)a + mp_ofs,
+						       old_alen - mp_ofs, rl2, ll,
+						       -1, NULL, NULL, NULL);
+			if (err) {
 				ntfs_error(vol->sb, "Failed to restore mapping pairs array.%s", es);
-				NVolSetErrors(vol);
+				ntfs_report_metadata_error(vol, err);
 			}
-			if (ntfs_attr_record_resize(ctx->mrec, a, old_alen)) {
+			err = ntfs_attr_record_resize(ctx->mrec, a, old_alen);
+			if (err) {
 				ntfs_error(vol->sb, "Failed to restore attribute record.%s", es);
-				NVolSetErrors(vol);
+				ntfs_report_metadata_error(vol, err);
 			}
 			mark_mft_record_dirty(ctx->ntfs_ino);
 		} else if (IS_ERR(ctx->mrec)) {
 			ntfs_error(vol->sb, "Failed to restore attribute search context.%s", es);
-			NVolSetErrors(vol);
+			ntfs_report_metadata_error(vol, PTR_ERR(ctx->mrec));
 		}
 		ntfs_attr_put_search_ctx(ctx);
 	}
@@ -2269,8 +2339,8 @@ static int ntfs_mft_record_format(const struct ntfs_volume *vol, const s64 mft_n
  *
  * On error, the volume will be left in a consistent state and no record will
  * be allocated.  If rolling back a partial operation fails, we may leave some
- * inconsistent metadata in which case we set NVolErrors() so the volume is
- * left dirty when unmounted.
+ * inconsistent metadata in which case we report the error so the volume is
+ * left dirty when unmounted and userspace is notified.
  *
  * Note, this function cannot make use of most of the normal functions, like
  * for example for attribute resizing, etc, because when the run list overflows
@@ -2301,7 +2371,7 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
 	struct attr_record *a;
 	pgoff_t index;
 	unsigned int ofs;
-	int err;
+	int err, rollback_err;
 	__le16 seq_no, usn;
 	bool record_formatted = false, from_reserve = false, tail_alloc = false;
 	bool reserve_created = false;
@@ -2705,7 +2775,7 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
 			folio_unlock(folio);
 			kunmap_local(m);
 			folio_put(folio);
-			NVolSetErrors(vol);
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 			goto search_free_rec;
 		}
 		/*
@@ -2861,9 +2931,12 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
 	if (!base_ni || base_ni->mft_no != FILE_MFT)
 		down_write(&vol->mftbmp_lock);
 undo_mftbmp_alloc_nolock:
-	if (!forced_reserved_record && ntfs_bitmap_clear_bit(vol->mftbmp_ino, bit)) {
+	rollback_err = 0;
+	if (!forced_reserved_record)
+		rollback_err = ntfs_bitmap_clear_bit(vol->mftbmp_ino, bit);
+	if (rollback_err) {
 		ntfs_error(vol->sb, "Failed to clear bit in mft bitmap.%s", es);
-		NVolSetErrors(vol);
+		ntfs_report_metadata_error(vol, rollback_err);
 	}
 	if ((from_reserve || reserve_created) &&
 	    vol->mft_record_reserve_pos == bit + 1)
@@ -2900,30 +2973,35 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
 int ntfs_mft_record_free(struct ntfs_volume *vol, struct ntfs_inode *ni)
 {
 	u64 mft_no;
-	int err;
+	int err, rollback_err;
 	u16 seq_no;
 	__le16 old_seq_no;
 	__le64 old_base_mft_record;
 	struct mft_record *ni_mrec;
 	unsigned int memalloc_flags;
 	struct ntfs_inode *base_ni;
-	bool keep_reserved;
+	bool error_reported = false, keep_reserved;
 
 	if (!vol || !ni)
 		return -EINVAL;
 
 	ntfs_debug("Entering for inode 0x%llx.\n", (long long)ni->mft_no);
+	if (likely(ni->nr_extents >= 0))
+		base_ni = ni;
+	else
+		base_ni = ni->ext.base_ntfs_ino;
 
-	ni_mrec = map_mft_record(ni);
-	if (IS_ERR(ni_mrec))
+	ni_mrec = map_mft_record_reported(ni, &error_reported);
+	if (IS_ERR(ni_mrec)) {
+		err = PTR_ERR(ni_mrec);
+		if (!error_reported && err != -ENOMEM &&
+		    err != -EINTR && err != -ERESTARTSYS)
+			ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 		return -EIO;
+	}
 
 	/* Cache the mft reference for later. */
 	mft_no = ni->mft_no;
-	if (likely(ni->nr_extents >= 0))
-		base_ni = ni;
-	else
-		base_ni = ni->ext.base_ntfs_ino;
 	keep_reserved = mft_no >= FILE_reserved12 &&
 			mft_no <= FILE_reserved15 &&
 			base_ni->mft_no == FILE_MFT;
@@ -2962,8 +3040,10 @@ int ntfs_mft_record_free(struct ntfs_volume *vol, struct ntfs_inode *ni)
 	 */
 	NInoSetDirty(ni);
 	err = write_mft_record(ni, ni_mrec, 1);
-	if (err)
+	if (err) {
+		ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 		goto sync_rollback;
+	}
 
 	if (keep_reserved) {
 		unmap_mft_record(ni);
@@ -3006,7 +3086,9 @@ int ntfs_mft_record_free(struct ntfs_volume *vol, struct ntfs_inode *ni)
 	ni_mrec->sequence_number = old_seq_no;
 	ni_mrec->base_mft_record = old_base_mft_record;
 	NInoSetDirty(ni);
-	write_mft_record(ni, ni_mrec, 0);
+	rollback_err = write_mft_record(ni, ni_mrec, 0);
+	if (rollback_err)
+		ntfs_report_file_metadata_error(VFS_I(base_ni), rollback_err);
 	unmap_mft_record(ni);
 	return err;
 }
@@ -3153,7 +3235,7 @@ static void ntfs_mft_write_error(struct ntfs_volume *vol,
 				 struct address_space *mapping, int err)
 {
 	mapping_set_error(mapping, err);
-	NVolSetErrors(vol);
+	ntfs_report_file_metadata_error(mapping->host, err);
 	ntfs_error(vol->sb, "Error while writing MFT folio: %d", err);
 }
 
diff --git a/fs/ntfs/mft.h b/fs/ntfs/mft.h
index d2a31205e08c..3eda89aab67a 100644
--- a/fs/ntfs/mft.h
+++ b/fs/ntfs/mft.h
@@ -14,9 +14,15 @@
 #include "inode.h"
 
 struct mft_record *map_mft_record(struct ntfs_inode *ni);
+struct mft_record *map_mft_record_reported(struct ntfs_inode *ni,
+					   bool *error_reported);
 void unmap_mft_record(struct ntfs_inode *ni);
 struct mft_record *map_extent_mft_record(struct ntfs_inode *base_ni, u64 mref,
 		struct ntfs_inode **ntfs_ino);
+struct mft_record *
+map_extent_mft_record_reported(struct ntfs_inode *base_ni, u64 mref,
+			       struct ntfs_inode **ntfs_ino,
+			       bool *error_reported);
 
 static inline void unmap_extent_mft_record(struct ntfs_inode *ni)
 {
-- 
2.51.0

