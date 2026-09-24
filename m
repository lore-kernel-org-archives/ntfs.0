Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4EF3F7877
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240517; cv=none; b=afperXeptEoI+ilongC9nbrFMbHUTFQIhvFY1ew8vLVTnvQaectd3ghWZxHXjq+yPEVPbSZl5g2U5ch+mGl8w0OUyP0dGJkklaOxIDiKOWsiXWm/Ws3egyyFfXir3cpvJB2lhzoAFj4l1w4/Fp+hIiaYNULZlL4C/wlaKy0ShpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240517; c=relaxed/simple;
	bh=29P/UPzRRz+wSW8YsgUOLEMqtIhjGVN4Ze1tHsTCo3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktMAVas4ITtBWjNiSWKUR5i3NilP8t9HtfhthQtNkvueBUkvJQJCGMPLD3DygIOSgF44gJYv97TAzg2XZFxlKr8CfGbhKa5JoIH4ogGMmyor6vezMxT1hOzUKQFJYiqL36ahdveJKGXMGy3D25XDqzaQvMQvrPCEuYt+oqQkHfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TLr7tYf1; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TLr7tYf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=xx
	qamFhghV3me5i+3ZPwhqveYKpTL8j99C20bPCfdDc=; b=TLr7tYf13enMKpjPvE
	dEn43Prxfl5sj2tHRRl3ln/Pgd1nrittCQWfXjAsUgibhgpAfsoDDemG8FRn7El+
	bkn+bTlw7qlfGOetOLG4QQvE0CT68TtwAyv/HA4PsVJY95J7FmQk0tdWjBp/zEex
	/XlE9U7bUa14SU7RHQ26gBJdM=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3H73Q5rRqL6EhAg--.34883S6;
	Thu, 24 Sep 2026 17:01:14 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v3 4/6] ntfs: report MFT metadata and recovery errors to fsnotify
Date: Thu, 24 Sep 2026 17:01:00 +0800
Message-ID: <20260924090102.2865942-5-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260924090102.2865942-1-liubaolin12138@163.com>
References: <20260924090102.2865942-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H73Q5rRqL6EhAg--.34883S6
X-Coremail-Antispam: 1Uf129KBjvAXoW3KF1UXFWUXryftw43ZF45trb_yoW8Xry5Co
	ZIvrn0yw4kWw1jy34jywn8Xas8Aan8C3ykJry5CrsruFZ2gw1jg3yxKw43uay7W3WrWr42
	9rn7twn5AFnxJFy7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx_-PUUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhq3gmq05trZ+wAA3t

From: Baolin Liu <liubaolin@kylinos.cn>

MFT record corruption, stale extent references and allocation bitmap
inconsistencies can leave files or volume metadata unusable without
notifying filesystem health monitors.

Report these errors against the affected base inode or the volume, as
appropriate. Also report failures to release clusters, restore mapping
pairs and attribute records, or restore MFT bitmap state during recovery.

Keep recovery errors separate from the original operation's return value.
Report each failed recovery where it is detected and leave event merging
to fanotify, without passing reporting state through the mapping APIs.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/mft.c | 158 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 96 insertions(+), 62 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 8bb8b4085c8b..a1b1c080b256 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -112,6 +112,7 @@ int ntfs_mft_record_check(const struct ntfs_volume *vol, struct mft_record *m,
 static inline struct mft_record *map_mft_record_folio(struct ntfs_inode *ni)
 {
 	loff_t i_size;
+	struct ntfs_inode *base_ni;
 	struct ntfs_volume *vol = ni->vol;
 	struct inode *mft_vi = vol->mft_ino;
 	struct folio *folio;
@@ -170,7 +171,11 @@ static inline struct mft_record *map_mft_record_folio(struct ntfs_inode *ni)
 		kfree(ni->mrec);
 		ni->mrec = NULL;
 		folio = ERR_PTR(-EIO);
-		NVolSetErrors(vol);
+		if (ni->nr_extents >= 0)
+			base_ni = ni;
+		else
+			base_ni = ni->ext.base_ntfs_ino;
+		ntfs_report_file_metadata_error(VFS_I(base_ni), -EIO);
 	}
 err_out:
 	ni->folio = NULL;
@@ -313,6 +318,7 @@ struct mft_record *map_extent_mft_record(struct ntfs_inode *base_ni, u64 mref,
 			unmap_mft_record(ni);
 			ntfs_error(base_ni->vol->sb,
 					"Found stale extent mft reference! Corrupt filesystem. Run chkdsk.");
+			ntfs_report_file_metadata_error(VFS_I(base_ni), -EIO);
 			return ERR_PTR(-EIO);
 		}
 map_err_out:
@@ -344,6 +350,7 @@ struct mft_record *map_extent_mft_record(struct ntfs_inode *base_ni, u64 mref,
 	if (seq_no && (le16_to_cpu(m->sequence_number) != seq_no)) {
 		ntfs_error(base_ni->vol->sb,
 				"Found stale extent mft reference! Corrupt filesystem. Run chkdsk.");
+		ntfs_report_file_metadata_error(VFS_I(base_ni), -EIO);
 		destroy_ni = true;
 		m = ERR_PTR(-EIO);
 		goto unm_nolock_err_out;
@@ -1340,8 +1347,9 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 	struct ntfs_attr_search_ctx *ctx = NULL;
 	struct mft_record *mrec;
 	struct attr_record *a = NULL;
-	int ret, mp_size;
+	int err, ret, mp_size;
 	u32 old_alen = 0;
+	u16 mp_ofs;
 	u8 *b, tb;
 	struct {
 		u8 added_cluster:1;
@@ -1426,10 +1434,11 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
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
@@ -1549,9 +1558,10 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 
 restore_undo_alloc:
 	ntfs_attr_reinit_search_ctx(ctx);
-	if (ntfs_attr_lookup(mftbmp_ni->type, mftbmp_ni->name,
-			mftbmp_ni->name_len, CASE_SENSITIVE, rl[1].vcn, NULL,
-			0, ctx)) {
+	err = ntfs_attr_lookup(mftbmp_ni->type, mftbmp_ni->name,
+			       mftbmp_ni->name_len, CASE_SENSITIVE, rl[1].vcn,
+			       NULL, 0, ctx);
+	if (err) {
 		ntfs_error(vol->sb,
 			"Failed to find last attribute extent of mft bitmap attribute.%s", es);
 		write_lock_irqsave(&mftbmp_ni->size_lock, flags);
@@ -1564,7 +1574,7 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 		 * The only thing that is now wrong is ->allocated_size of the
 		 * base attribute extent which chkdsk should be able to fix.
 		 */
-		NVolSetErrors(vol);
+		ntfs_report_metadata_error(vol, err);
 		return ret;
 	}
 	a = ctx->attr;
@@ -1583,31 +1593,36 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
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
+		err = ntfs_attr_update_mapping_pairs_locked(mftbmp_ni, 0,
+							    mftbmp_ni);
+		if (err) {
+			ntfs_error(vol->sb, "Failed to restore mapping pairs.%s", es);
+			ntfs_report_metadata_error(vol, err);
+		}
 	}
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
@@ -1640,7 +1655,7 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 	struct ntfs_attr_search_ctx *ctx;
 	struct mft_record *mrec;
 	struct attr_record *a;
-	int ret;
+	int err, ret;
 
 	ntfs_debug("Extending mft bitmap initialized (and data) size.");
 	mft_ni = NTFS_I(vol->mft_ino);
@@ -1700,20 +1715,23 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 	mrec = map_mft_record(mft_ni);
 	if (IS_ERR(mrec)) {
 		ntfs_error(vol->sb, "Failed to map mft record.%s", es);
-		NVolSetErrors(vol);
+		err = PTR_ERR(mrec);
+		ntfs_report_metadata_error(vol, err);
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
+		ntfs_report_metadata_error(vol, err);
 put_err_out:
 		ntfs_attr_put_search_ctx(ctx);
 unm_err_out:
@@ -1767,6 +1785,7 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 {
 	s64 lcn;
+	s64 freed;
 	s64 old_last_vcn;
 	s64 min_nr, nr, ll;
 	unsigned long flags;
@@ -1775,8 +1794,9 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	struct ntfs_attr_search_ctx *ctx = NULL;
 	struct mft_record *mrec;
 	struct attr_record *a = NULL;
-	int ret, mp_size;
+	int err, ret, mp_size;
 	u32 old_alen = 0;
+	u16 mp_ofs;
 	bool mp_rebuilt = false, mp_extended = false;
 	size_t new_rl_count;
 
@@ -1863,10 +1883,11 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
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
@@ -1986,8 +2007,9 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	return 0;
 restore_undo_alloc:
 	ntfs_attr_reinit_search_ctx(ctx);
-	if (ntfs_attr_lookup(mft_ni->type, mft_ni->name, mft_ni->name_len,
-			CASE_SENSITIVE, rl[1].vcn, NULL, 0, ctx)) {
+	err = ntfs_attr_lookup(mft_ni->type, mft_ni->name, mft_ni->name_len,
+			       CASE_SENSITIVE, rl[1].vcn, NULL, 0, ctx);
+	if (err) {
 		ntfs_error(vol->sb,
 			"Failed to find last attribute extent of mft data attribute.%s", es);
 		write_lock_irqsave(&mft_ni->size_lock, flags);
@@ -2000,45 +2022,51 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 		 * The only thing that is now wrong is ->allocated_size of the
 		 * base attribute extent which chkdsk should be able to fix.
 		 */
-		NVolSetErrors(vol);
+		ntfs_report_metadata_error(vol, err);
 		return ret;
 	}
 	ctx->attr->data.non_resident.highest_vcn =
 			cpu_to_le64(old_last_vcn - 1);
 undo_alloc:
-	if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
+	freed = ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx);
+	if (freed < 0) {
 		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
-		NVolSetErrors(vol);
+		ntfs_report_metadata_error(vol, freed);
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
+		err = ntfs_attr_update_mapping_pairs(mft_ni, 0);
+		if (err) {
+			ntfs_error(vol->sb, "Failed to restore mapping pairs.%s",
+				   es);
+			ntfs_report_metadata_error(vol, err);
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
@@ -2270,8 +2298,8 @@ static int ntfs_mft_record_format(const struct ntfs_volume *vol, const s64 mft_n
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
@@ -2302,7 +2330,7 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
 	struct attr_record *a;
 	pgoff_t index;
 	unsigned int ofs;
-	int err;
+	int err, rollback_err;
 	__le16 seq_no, usn;
 	bool record_formatted = false, from_reserve = false, tail_alloc = false;
 	bool reserve_created = false;
@@ -2706,7 +2734,7 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
 			folio_unlock(folio);
 			kunmap_local(m);
 			folio_put(folio);
-			NVolSetErrors(vol);
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 			goto search_free_rec;
 		}
 		/*
@@ -2862,9 +2890,12 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
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
@@ -2901,7 +2932,7 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
 int ntfs_mft_record_free(struct ntfs_volume *vol, struct ntfs_inode *ni)
 {
 	u64 mft_no;
-	int err;
+	int err, rollback_err;
 	u16 seq_no;
 	__le16 old_seq_no;
 	__le64 old_base_mft_record;
@@ -2995,8 +3026,11 @@ int ntfs_mft_record_free(struct ntfs_volume *vol, struct ntfs_inode *ni)
 	memalloc_flags = memalloc_nofs_save();
 	if (base_ni->mft_no != FILE_MFT)
 		down_write(&vol->mftbmp_lock);
-	if (ntfs_bitmap_set_bit(vol->mftbmp_ino, mft_no))
+	rollback_err = ntfs_bitmap_set_bit(vol->mftbmp_ino, mft_no);
+	if (rollback_err) {
 		ntfs_error(vol->sb, "ntfs_bitmap_set_bit failed in bitmap_rollback\n");
+		ntfs_report_metadata_error(vol, rollback_err);
+	}
 	if (base_ni->mft_no != FILE_MFT)
 		up_write(&vol->mftbmp_lock);
 	memalloc_nofs_restore(memalloc_flags);
-- 
2.51.0

