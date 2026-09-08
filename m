Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1945E492520
	for <ntfs@lists.linux.dev>; Tue,  8 Sep 2026 09:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860685; cv=none; b=rsvUvscdtZM2T/OSZJ9LuAgT7ho+J+79XlvozaJ35T53ijjlSlSbJ8VcbhZdalIw0Q1BTupobSqrbGgU8I2bB/jGgEmQT99ChDL58uQAfbSnVhuD85vA2s/6/EsK5MArXeNlk73FT5TZtfrGcML5HV+TfR/fISMvdMQF5iX7TH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860685; c=relaxed/simple;
	bh=+SEE/7kqwv820lh3rnM0CQFIOyuVd1Dk21tjP/AoYBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k/0EQeNrfifgdOGN4fyYbV5fUG2SvtqvPMzTITByGKNcsvgSZ0PaIUuViefVqse9LQaOG2h21wIHCrwJEgjJrjsOGHdSna395lMCiGdDorGbH9PZkOZG4bV+4druESDHMYi0CEamO/cSfQfAjdqQmetPrRsYGgrr61ZgrfFrtas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IoFD3pnK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IoFD3pnK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A8D1F00A3A;
	Tue,  8 Sep 2026 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788860683;
	bh=cDsyjCo17mps3a2jk6c5TqYPlgqmsNelOxtYdZdeOoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IoFD3pnKdV8T3VJFOo2i99su76n403SiuwmwvOJkgTnHuLIXAkAh+HSkJ6DTOfuBO
	 08Q4/CFVGOGEvLDpNxvHB90B5SwFuGqYJ4fJCH5hcOyI9HkT0538UH8YP3NV2o3GMI
	 83oBhtkwwKxWcQUxK7Nc0EyUDwtX22k14PeB0+E94K7xOzo83oCcs/11VzSnugMMDV
	 PrUq1//fG9Vdpng80YwRiqxEb9xjHUCRZWPG6Wq8cZBZMnwiWowdxWVNGHRWnMK8va
	 DFviBHIWFMH89I8OhxzYFRfM/d9YSKROQ4SgcL0cArxNQi9sRnEcc8PfCUnrJMpXeX
	 ud+j6Y7ce0I0g==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH] ntfs: protect runlist updates with the runlist lock
Date: Tue,  8 Sep 2026 18:44:12 +0900
Message-Id: <20260908094416.10534-4-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260908094416.10534-1-linkinjeon@kernel.org>
References: <20260908094416.10534-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_non_resident_attr_shrink() calls runlist helpers that require the
runlist write lock, but did not hold it while freeing clusters and
truncating the runlist. Serialize those operations and the resident
conversion with the runlist lock.

ntfs_attr_map_cluster() can merge a newly allocated run before updating
mapping pairs. If the update fails, free the clusters and restore both
the in-memory runlist and on-disk mapping pairs from a saved runlist.
Mark the volume in error if either rollback step fails.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/attrib.c   | 205 +++++++++++++++++++++++++++++++++++----------
 fs/ntfs/attrib.h   |   9 ++
 fs/ntfs/attrlist.c |  46 ++++++----
 fs/ntfs/attrlist.h |   2 +
 fs/ntfs/compress.c |   2 +-
 fs/ntfs/file.c     |   3 +-
 fs/ntfs/inode.c    |   2 +-
 fs/ntfs/mft.c      |  13 +--
 8 files changed, 216 insertions(+), 66 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index d1696ce6acd5..c949ff765075 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -3574,7 +3574,8 @@ int ntfs_attr_record_move_away(struct ntfs_attr_search_ctx *ctx, int extra)
  * update allocated and compressed size.
  */
 static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
-		struct mft_record *m, struct ntfs_attr_search_ctx *ctx)
+		struct mft_record *m, struct ntfs_attr_search_ctx *ctx,
+		struct ntfs_inode *locked_ni, bool defer_attrlist)
 {
 	int sparse, err = 0;
 	struct ntfs_inode *base_ni;
@@ -3610,6 +3611,8 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
 		     le16_to_cpu(a->data.non_resident.mapping_pairs_offset) == 8) &&
 		    !(le32_to_cpu(m->bytes_allocated) - le32_to_cpu(m->bytes_in_use))) {
 
+			if (defer_attrlist)
+				return -ENOSPC;
 			if (!NInoAttrList(base_ni)) {
 				err = ntfs_inode_add_attrlist(base_ni);
 				if (err)
@@ -3623,7 +3626,7 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
 				goto out;
 			}
 
-			err = ntfs_attrlist_update(base_ni);
+			err = ntfs_attrlist_update_locked(base_ni, locked_ni);
 			if (err)
 				goto out;
 			err = -EAGAIN;
@@ -3703,6 +3706,8 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
  * ntfs_attr_update_mapping_pairs - update mapping pairs for ntfs attribute
  * @ni:		non-resident ntfs inode for which we need update
  * @from_vcn:	update runlist starting this VCN
+ * @locked_ni:	inode whose runlist write lock is already held
+ * @defer_attrlist: return -ENOSPC instead of updating an attribute list
  *
  * Build mapping pairs from @na->rl and write them to the disk. Also, this
  * function updates sparse bit, allocated and compressed size (allocates/frees
@@ -3712,7 +3717,10 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
  * call to this function. Vice-versa @na->compressed_size will be calculated and
  * set to correct value during this function.
  */
-int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
+static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
+					    s64 from_vcn,
+					    struct ntfs_inode *locked_ni,
+					    bool defer_attrlist)
 {
 	struct ntfs_attr_search_ctx *ctx;
 	struct ntfs_inode *base_ni;
@@ -3804,7 +3812,8 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 			continue;
 		}
 
-		err = ntfs_attr_update_meta(a, ni, m, ctx);
+		err = ntfs_attr_update_meta(a, ni, m, ctx, locked_ni,
+					    defer_attrlist);
 		if (err < 0) {
 			if (err == -EAGAIN) {
 				ntfs_attr_put_search_ctx(ctx);
@@ -3844,11 +3853,17 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 			 */
 			if (ni->type == AT_ATTRIBUTE_LIST) {
 				ntfs_attr_put_search_ctx(ctx);
+				ctx = NULL;
+				if (locked_ni == ni || defer_attrlist) {
+					err = -ENOSPC;
+					goto put_err_out;
+				}
 				err = ntfs_inode_free_space(base_ni, mp_size -
 							cur_max_mp_size);
 				if (err)
 					return err;
-				err = ntfs_attrlist_update(base_ni);
+				err = ntfs_attrlist_update_locked(
+					base_ni, locked_ni);
 				if (err)
 					return err;
 				goto retry;
@@ -3856,6 +3871,10 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 
 			/* Add attribute list if it isn't present, and retry. */
 			if (!NInoAttrList(base_ni)) {
+				if (defer_attrlist) {
+					err = -ENOSPC;
+					goto put_err_out;
+				}
 				ntfs_attr_put_search_ctx(ctx);
 				if (ntfs_inode_add_attrlist(base_ni)) {
 					ntfs_error(sb, "Can not add attrlist");
@@ -3883,13 +3902,21 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 			}
 		}
 
+		if (defer_attrlist &&
+		    (ctx->ntfs_ino->nr_extents == -1 ||
+		     NInoAttrList(ctx->ntfs_ino)) &&
+		    ctx->attr->type != AT_ATTRIBUTE_LIST) {
+			err = -ENOSPC;
+			goto put_err_out;
+		}
+
 		/* Update lowest vcn. */
 		a->data.non_resident.lowest_vcn = cpu_to_le64(stop_vcn);
 		mark_mft_record_dirty(ctx->ntfs_ino);
 		if ((ctx->ntfs_ino->nr_extents == -1 || NInoAttrList(ctx->ntfs_ino)) &&
 		    ctx->attr->type != AT_ATTRIBUTE_LIST) {
 			ctx->al_entry->lowest_vcn = cpu_to_le64(stop_vcn);
-			err = ntfs_attrlist_update(base_ni);
+			err = ntfs_attrlist_update_locked(base_ni, locked_ni);
 			if (err)
 				goto put_err_out;
 		}
@@ -4064,6 +4091,19 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 	return err;
 }
 
+int ntfs_attr_update_mapping_pairs_locked(struct ntfs_inode *ni,
+					  s64 from_vcn,
+					 struct ntfs_inode *locked_ni)
+{
+	return __ntfs_attr_update_mapping_pairs(ni, from_vcn, locked_ni,
+						false);
+}
+
+int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
+{
+	return ntfs_attr_update_mapping_pairs_locked(ni, from_vcn, NULL);
+}
+
 /*
  * ntfs_attr_make_resident - convert a non-resident to a resident attribute
  * @ni:		open ntfs attribute to make resident
@@ -4197,7 +4237,9 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
  *
  * Reduce the size of a non-resident, open ntfs attribute @na to @newsize bytes.
  */
-static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni, const s64 newsize)
+static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
+					 const s64 newsize,
+					struct ntfs_inode *locked_ni)
 {
 	struct ntfs_volume *vol;
 	struct ntfs_attr_search_ctx *ctx;
@@ -4205,6 +4247,7 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni, const s64 newsiz
 	s64 nr_freed_clusters;
 	int err;
 	struct ntfs_inode *base_ni;
+	bool runlist_locked = locked_ni == ni;
 
 	ntfs_debug("Inode 0x%llx attr 0x%x new size %lld\n",
 		(unsigned long long)ni->mft_no, ni->type, (long long)newsize);
@@ -4250,18 +4293,24 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni, const s64 newsiz
 	 * clusters if there is a change.
 	 */
 	if (ntfs_bytes_to_cluster(vol, ni->allocated_size) != first_free_vcn) {
-		struct ntfs_attr_search_ctx *ctx;
+		/*
+		 * ntfs_cluster_free() and ntfs_rl_truncate_nolock()
+		 * both require this lock.
+		 */
+		if (!runlist_locked)
+			down_write(&ni->runlist.lock);
 
 		err = ntfs_attr_map_whole_runlist(ni);
 		if (err) {
 			ntfs_debug("Eeek! ntfs_attr_map_whole_runlist failed.\n");
-			return err;
+			goto unlock_runlist;
 		}
 
 		ctx = ntfs_attr_get_search_ctx(ni, NULL);
 		if (!ctx) {
 			ntfs_error(vol->sb, "%s: Failed to get search context", __func__);
-			return -ENOMEM;
+			err = -ENOMEM;
+			goto unlock_runlist;
 		}
 
 		/* Deallocate all clusters starting with the first free one. */
@@ -4269,7 +4318,8 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni, const s64 newsiz
 		if (nr_freed_clusters < 0) {
 			ntfs_debug("Eeek! Freeing of clusters failed. Aborting...\n");
 			ntfs_attr_put_search_ctx(ctx);
-			return (int)nr_freed_clusters;
+			err = (int)nr_freed_clusters;
+			goto unlock_runlist;
 		}
 		ntfs_attr_put_search_ctx(ctx);
 
@@ -4282,7 +4332,8 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni, const s64 newsiz
 			kvfree(ni->runlist.rl);
 			ni->runlist.rl = NULL;
 			ntfs_error(vol->sb, "Eeek! Run list truncation failed.\n");
-			return -EIO;
+			err = -EIO;
+			goto unlock_runlist;
 		}
 
 		/* Prepare to mapping pairs update. */
@@ -4298,11 +4349,13 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni, const s64 newsiz
 			VFS_I(base_ni)->i_blocks = ni->allocated_size >> 9;
 
 		/* Write mapping pairs for new runlist. */
-		err = ntfs_attr_update_mapping_pairs(ni, 0 /*first_free_vcn*/);
+		err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 		if (err) {
 			ntfs_debug("Eeek! Mapping pairs update failed. Leaving inconstant metadata. Run chkdsk.\n");
-			return err;
+			goto unlock_runlist;
 		}
+		if (!runlist_locked)
+			up_write(&ni->runlist.lock);
 	}
 
 	/* Get the first attribute record. */
@@ -4344,7 +4397,11 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni, const s64 newsiz
 
 	/* If the attribute now has zero size, make it resident. */
 	if (!newsize && !NInoEncrypted(ni) && !NInoCompressed(ni)) {
+		if (!runlist_locked)
+			down_write(&ni->runlist.lock);
 		err = ntfs_attr_make_resident(ni, ctx);
+		if (!runlist_locked)
+			up_write(&ni->runlist.lock);
 		if (err) {
 			/* If couldn't make resident, just continue. */
 			if (err != -EPERM)
@@ -4361,6 +4418,11 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni, const s64 newsiz
 put_err_out:
 	ntfs_attr_put_search_ctx(ctx);
 	return err;
+
+unlock_runlist:
+	if (!runlist_locked)
+		up_write(&ni->runlist.lock);
+	return err;
 }
 
 /*
@@ -4369,13 +4431,14 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni, const s64 newsiz
  * @prealloc_size:	preallocation size (in bytes) to which to expand the attribute
  * @newsize:		new size (in bytes) to which to expand the attribute
  * @holes:		how to create a hole if expanding
- * @need_lock:		whether mrec lock is needed or not
+ * @locked_ni:		inode whose runlist lock is already held
  *
  * Expand the size of a non-resident, open ntfs attribute @na to @newsize bytes,
  * by allocating new clusters.
  */
 static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsize,
-		const s64 prealloc_size, unsigned int holes, bool need_lock)
+		const s64 prealloc_size, unsigned int holes,
+		struct ntfs_inode *locked_ni)
 {
 	s64 lcn_seek_from;
 	s64 first_free_vcn;
@@ -4573,7 +4636,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 
 		/* Prepare to mapping pairs update. */
 		ni->allocated_size = ntfs_cluster_to_bytes(vol, first_free_vcn);
-		err = ntfs_attr_update_mapping_pairs(ni, 0);
+		err = ntfs_attr_update_mapping_pairs_locked(
+				ni, 0, locked_ni);
 		if (err) {
 			ntfs_debug("Mapping pairs update failed");
 			goto rollback;
@@ -4617,11 +4681,11 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		ntfs_debug("Leaking clusters");
 
 	/* Now, truncate the runlist itself. */
-	if (need_lock)
+	if (ni != locked_ni)
 		down_write(&ni->runlist.lock);
 	err2 = ntfs_rl_truncate_nolock(vol, &ni->runlist,
 			ntfs_bytes_to_cluster(vol, org_alloc_size));
-	if (need_lock)
+	if (ni != locked_ni)
 		up_write(&ni->runlist.lock);
 	if (err2) {
 		/*
@@ -4635,11 +4699,11 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		/* Prepare to mapping pairs update. */
 		ni->allocated_size = org_alloc_size;
 		/* Restore mapping pairs. */
-		if (need_lock)
+		if (ni != locked_ni)
 			down_read(&ni->runlist.lock);
-		if (ntfs_attr_update_mapping_pairs(ni, 0))
+		if (__ntfs_attr_update_mapping_pairs(ni, 0, locked_ni, true))
 			ntfs_error(sb, "Failed to restore old mapping pairs");
-		if (need_lock)
+		if (ni != locked_ni)
 			up_read(&ni->runlist.lock);
 
 		if (NInoSparse(ni) || NInoCompressed(ni)) {
@@ -4744,7 +4808,8 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 		mark_mft_record_dirty(ctx->ntfs_ino);
 		ntfs_attr_put_search_ctx(ctx);
 		/* Resize non-resident attribute */
-		return ntfs_non_resident_attr_expand(attr_ni, newsize, prealloc_size, holes, true);
+		return ntfs_non_resident_attr_expand(
+				attr_ni, newsize, prealloc_size, holes, NULL);
 	} else if (err != -ENOSPC && err != -EPERM) {
 		ntfs_error(sb, "Failed to make attribute non-resident");
 		goto put_err_out;
@@ -4919,13 +4984,14 @@ int __ntfs_attr_truncate_vfs(struct ntfs_inode *ni, const s64 newsize,
 	if (NInoNonResident(ni)) {
 		if (newsize > i_size) {
 			down_write(&ni->runlist.lock);
-			err = ntfs_non_resident_attr_expand(ni, newsize, 0,
-							    NVolDisableSparse(ni->vol) ?
-							    HOLES_NO : HOLES_OK,
-							    false);
+			err = ntfs_non_resident_attr_expand(
+					ni, newsize, 0,
+					NVolDisableSparse(ni->vol) ?
+					HOLES_NO : HOLES_OK, ni);
 			up_write(&ni->runlist.lock);
 		} else
-			err = ntfs_non_resident_attr_shrink(ni, newsize);
+			err = ntfs_non_resident_attr_shrink(
+					ni, newsize, NULL);
 	} else
 		err = ntfs_resident_attr_resize(ni, newsize, 0,
 						NVolDisableSparse(ni->vol) ?
@@ -4934,7 +5000,9 @@ int __ntfs_attr_truncate_vfs(struct ntfs_inode *ni, const s64 newsize,
 	return err;
 }
 
-int ntfs_attr_expand(struct ntfs_inode *ni, const s64 newsize, const s64 prealloc_size)
+int ntfs_attr_expand_locked(struct ntfs_inode *ni, const s64 newsize,
+			    const s64 prealloc_size,
+			   struct ntfs_inode *locked_ni)
 {
 	int err = 0;
 
@@ -4964,9 +5032,10 @@ int ntfs_attr_expand(struct ntfs_inode *ni, const s64 newsize, const s64 preallo
 
 	if (NInoNonResident(ni)) {
 		if (newsize > ni->data_size || prealloc_size > ni->allocated_size)
-			err = ntfs_non_resident_attr_expand(ni, newsize, prealloc_size,
-							    NVolDisableSparse(ni->vol) ?
-							    HOLES_NO : HOLES_OK, true);
+			err = ntfs_non_resident_attr_expand(
+					ni, newsize, prealloc_size,
+					NVolDisableSparse(ni->vol) ?
+					HOLES_NO : HOLES_OK, locked_ni);
 	} else
 		err = ntfs_resident_attr_resize(ni, newsize, prealloc_size,
 						NVolDisableSparse(ni->vol) ?
@@ -4977,6 +5046,12 @@ int ntfs_attr_expand(struct ntfs_inode *ni, const s64 newsize, const s64 preallo
 	return err;
 }
 
+int ntfs_attr_expand(struct ntfs_inode *ni, const s64 newsize,
+		     const s64 prealloc_size)
+{
+	return ntfs_attr_expand_locked(ni, newsize, prealloc_size, NULL);
+}
+
 /*
  * ntfs_attr_truncate_i - resize an ntfs attribute
  * @ni:		open ntfs inode to resize
@@ -4989,7 +5064,9 @@ int ntfs_attr_expand(struct ntfs_inode *ni, const s64 newsize, const s64 preallo
  * newly allocated space is marked as not initialised and no real allocation
  * on disk is performed.
  */
-int ntfs_attr_truncate_i(struct ntfs_inode *ni, const s64 newsize, unsigned int holes)
+int ntfs_attr_truncate_i_locked(struct ntfs_inode *ni, const s64 newsize,
+				unsigned int holes,
+			       struct ntfs_inode *locked_ni)
 {
 	int err;
 
@@ -5023,15 +5100,23 @@ int ntfs_attr_truncate_i(struct ntfs_inode *ni, const s64 newsize, unsigned int
 
 	if (NInoNonResident(ni)) {
 		if (newsize > ni->data_size)
-			err = ntfs_non_resident_attr_expand(ni, newsize, 0, holes, true);
+			err = ntfs_non_resident_attr_expand(
+					ni, newsize, 0, holes, locked_ni);
 		else
-			err = ntfs_non_resident_attr_shrink(ni, newsize);
+			err = ntfs_non_resident_attr_shrink(
+					ni, newsize, locked_ni);
 	} else
 		err = ntfs_resident_attr_resize(ni, newsize, 0, holes);
 	ntfs_debug("Return status %d\n", err);
 	return err;
 }
 
+int ntfs_attr_truncate_i(struct ntfs_inode *ni, const s64 newsize,
+			 unsigned int holes)
+{
+	return ntfs_attr_truncate_i_locked(ni, newsize, holes, NULL);
+}
+
 /*
  * Resize an attribute, creating a hole if relevant
  */
@@ -5049,10 +5134,11 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 	struct ntfs_volume *vol = ni->vol;
 	struct ntfs_attr_search_ctx *ctx;
 	struct runlist_element *rl, *rlc;
+	struct runlist_element *old_rl = NULL;
 	s64 vcn = vcn_start, lcn, clu_count;
 	s64 lcn_seek_from = -1;
 	int err = 0;
-	size_t new_rl_count;
+	size_t new_rl_count, old_rl_count;
 
 	err = ntfs_attr_map_whole_runlist(ni);
 	if (err)
@@ -5145,6 +5231,19 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 	WARN_ON(rlc->vcn != vcn);
 	lcn = rlc->lcn;
 	clu_count = rlc->length;
+	old_rl_count = ni->runlist.count;
+	old_rl = kmemdup(ni->runlist.rl,
+			 old_rl_count * sizeof(*old_rl), GFP_NOFS);
+	if (!old_rl) {
+		err = -ENOMEM;
+		if (ntfs_cluster_free_from_rl(vol, rlc)) {
+			ntfs_error(vol->sb,
+				   "Failed to free cluster allocation after runlist backup failure.");
+			NVolSetErrors(vol);
+		}
+		kvfree(rlc);
+		goto out;
+	}
 
 	rl = ntfs_runlists_merge(&ni->runlist, rlc, 0, &new_rl_count);
 	if (IS_ERR(rl)) {
@@ -5168,15 +5267,32 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 
 	if (update_mp) {
 		ntfs_attr_reinit_search_ctx(ctx);
-		err = ntfs_attr_update_mapping_pairs(ni, 0);
+		err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 		if (err) {
 			int err2;
 
 			err2 = ntfs_cluster_free(ni, vcn, clu_count, ctx);
-			if (err2 < 0)
+			if (err2 < 0 || err2 != clu_count) {
 				ntfs_error(vol->sb,
-					   "Failed to free cluster allocation. Leaving inconstant metadata.\n");
-			goto out;
+					   "Failed to free cluster allocation. Leaving inconsistent metadata.\n");
+				NVolSetErrors(vol);
+				goto out;
+			}
+
+			/*
+			 * Restore the runlist before repairing the on-disk
+			 * mapping pairs.
+			 */
+			kvfree(ni->runlist.rl);
+			ni->runlist.rl = old_rl;
+			ni->runlist.count = old_rl_count;
+			old_rl = NULL;
+			if (ntfs_attr_update_mapping_pairs_locked(
+					ni, 0, ni)) {
+				ntfs_error(vol->sb,
+					   "Failed to restore mapping pairs after allocation rollback.\n");
+				NVolSetErrors(vol);
+			}
 		}
 	} else {
 		VFS_I(ni)->i_blocks += clu_count << (vol->cluster_size_bits - 9);
@@ -5188,6 +5304,7 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 	*lcn_count = clu_count;
 	*balloc = true;
 out:
+	kvfree(old_rl);
 	ntfs_attr_put_search_ctx(ctx);
 	return err;
 }
@@ -5431,7 +5548,7 @@ int ntfs_non_resident_attr_insert_range(struct ntfs_inode *ni, s64 start_vcn, s6
 	ni->data_size += ntfs_cluster_to_bytes(vol, len);
 	if (ntfs_cluster_to_bytes(vol, start_vcn) < ni->initialized_size)
 		ni->initialized_size += ntfs_cluster_to_bytes(vol, len);
-	ret = ntfs_attr_update_mapping_pairs(ni, 0);
+	ret = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 	up_write(&ni->runlist.lock);
 	if (ret)
 		return ret;
@@ -5516,7 +5633,7 @@ int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn,
 	}
 
 	if (ni->allocated_size > 0) {
-		ret = ntfs_attr_update_mapping_pairs(ni, 0);
+		ret = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 		if (ret) {
 			up_write(&ni->runlist.lock);
 			goto out_rl;
@@ -5594,7 +5711,7 @@ int ntfs_non_resident_attr_punch_hole(struct ntfs_inode *ni, s64 start_vcn, s64
 	ni->runlist.rl = rl;
 	ni->runlist.count = new_rl_count;
 
-	ret = ntfs_attr_update_mapping_pairs(ni, 0);
+	ret = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 	up_write(&ni->runlist.lock);
 	if (ret) {
 		kvfree(punch_rl);
@@ -5770,7 +5887,7 @@ int ntfs_attr_fallocate(struct ntfs_inode *ni, loff_t start, loff_t byte_len, bo
 	if (NInoRunlistDirty(ni)) {
 		mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
 		down_write(&ni->runlist.lock);
-		err = ntfs_attr_update_mapping_pairs(ni, 0);
+		err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 		if (err)
 			ntfs_error(ni->vol->sb, "Updating mapping pairs failed");
 		else
diff --git a/fs/ntfs/attrib.h b/fs/ntfs/attrib.h
index e2224fbfaabe..6b4fa9f57640 100644
--- a/fs/ntfs/attrib.h
+++ b/fs/ntfs/attrib.h
@@ -112,7 +112,13 @@ int ntfs_non_resident_attr_punch_hole(struct ntfs_inode *ni, s64 start_vcn, s64
 int __ntfs_attr_truncate_vfs(struct ntfs_inode *ni, const s64 newsize,
 		const s64 i_size);
 int ntfs_attr_expand(struct ntfs_inode *ni, const s64 newsize, const s64 prealloc_size);
+int ntfs_attr_expand_locked(struct ntfs_inode *ni, const s64 newsize,
+			    const s64 prealloc_size,
+			   struct ntfs_inode *locked_ni);
 int ntfs_attr_truncate_i(struct ntfs_inode *ni, const s64 newsize, unsigned int holes);
+int ntfs_attr_truncate_i_locked(struct ntfs_inode *ni, const s64 newsize,
+				unsigned int holes,
+			       struct ntfs_inode *locked_ni);
 int ntfs_attr_truncate(struct ntfs_inode *ni, const s64 newsize);
 int ntfs_attr_rm(struct ntfs_inode *ni);
 int ntfs_attr_exist(struct ntfs_inode *ni, const __le32 type, __le16 *name,
@@ -133,6 +139,9 @@ int ntfs_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 		__le16 *name, u8 name_len, u8 *val, u32 size,
 		__le16 flags);
 int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn);
+int ntfs_attr_update_mapping_pairs_locked(struct ntfs_inode *ni,
+					  s64 from_vcn,
+					 struct ntfs_inode *locked_ni);
 struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64 *lcn);
 
 /*
diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
index b280af3c4b77..7c09d02fd941 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -68,7 +68,8 @@ int ntfs_attrlist_need(struct ntfs_inode *ni)
  * legal list size as a reserve.
  */
 static int ntfs_attrlist_repack(struct inode *attr_vi,
-		struct ntfs_inode *attr_ni, s64 min_alloc_size)
+		struct ntfs_inode *attr_ni, s64 min_alloc_size,
+		struct ntfs_inode *locked_ni)
 {
 	struct ntfs_volume *vol = attr_ni->vol;
 	struct runlist_element *old_rl, *new_rl;
@@ -78,10 +79,12 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 	size_t old_rl_count, new_rl_count;
 	unsigned long flags;
 	int err, restore_err;
-
 	if (attr_ni->mft_no != FILE_MFT || !NInoNonResident(attr_ni) ||
 		min_alloc_size < 0)
 		return -EINVAL;
+	/* The buffered I/O below can reacquire the attribute runlist lock. */
+	if (attr_ni == locked_ni)
+		return -ENOSPC;
 
 	err = ntfs_attr_map_whole_runlist(attr_ni);
 	if (err)
@@ -131,7 +134,6 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 		err = -ENOSPC;
 		goto out_free_data;
 	}
-
 	old_rl = attr_ni->runlist.rl;
 	old_rl_count = attr_ni->runlist.count;
 	down_write(&attr_ni->runlist.lock);
@@ -152,7 +154,7 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 		}
 	}
 
-	err = ntfs_attr_update_mapping_pairs(attr_ni, 0);
+	err = ntfs_attr_update_mapping_pairs_locked(attr_ni, 0, locked_ni);
 	if (err)
 		goto restore_old_runlist;
 
@@ -177,7 +179,8 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 	attr_ni->allocated_size = old_alloc_size;
 	write_unlock_irqrestore(&attr_ni->size_lock, flags);
 
-	restore_err = ntfs_attr_update_mapping_pairs(attr_ni, 0);
+	restore_err = ntfs_attr_update_mapping_pairs_locked(
+			attr_ni, 0, locked_ni);
 	if (restore_err) {
 		ntfs_error(vol->sb, "Failed to restore ATTRIBUTE_LIST mapping pairs (%d)",
 			   restore_err);
@@ -193,7 +196,8 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 	return err;
 }
 
-int ntfs_attrlist_update(struct ntfs_inode *base_ni)
+int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
+				struct ntfs_inode *locked_ni)
 {
 	struct inode *attr_vi;
 	struct ntfs_inode *attr_ni;
@@ -215,20 +219,27 @@ int ntfs_attrlist_update(struct ntfs_inode *base_ni)
 		return err;
 	}
 	attr_ni = NTFS_I(attr_vi);
+	/* Truncation and page-cache writes can reacquire this runlist lock. */
+	if (attr_ni == locked_ni) {
+		iput(attr_vi);
+		return -ENOSPC;
+	}
 
-	err = ntfs_attr_truncate_i(attr_ni, base_ni->attr_list_size, HOLES_NO);
+	err = ntfs_attr_truncate_i_locked(
+			attr_ni, base_ni->attr_list_size, HOLES_NO, locked_ni);
 	if (err == -ENOSPC && attr_ni->mft_no == FILE_MFT &&
 		NInoNonResident(attr_ni)) {
 		retry_err = ntfs_attrlist_repack(attr_vi, attr_ni,
-					base_ni->attr_list_size);
+					base_ni->attr_list_size, locked_ni);
 		if (retry_err) {
 			ntfs_error(base_ni->vol->sb, "Failed to repack attribute list");
 			iput(attr_vi);
 			return retry_err;
 		}
 
-		retry_err = ntfs_attr_truncate_i(attr_ni, base_ni->attr_list_size,
-						 HOLES_NO);
+		retry_err = ntfs_attr_truncate_i_locked(
+				attr_ni, base_ni->attr_list_size,
+				HOLES_NO, locked_ni);
 		if (retry_err) {
 			ntfs_error(base_ni->vol->sb,
 				   "Failed to resize attribute list after repack");
@@ -252,11 +263,13 @@ int ntfs_attrlist_update(struct ntfs_inode *base_ni)
 	 */
 	if (base_ni->mft_no == FILE_MFT && NInoNonResident(attr_ni) &&
 		attr_ni->allocated_size < NTFS_MAX_ATTR_LIST_SIZE) {
-		retry_err = ntfs_attr_expand(attr_ni, base_ni->attr_list_size,
-					     NTFS_MAX_ATTR_LIST_SIZE);
+		retry_err = ntfs_attr_expand_locked(
+				attr_ni, base_ni->attr_list_size,
+				NTFS_MAX_ATTR_LIST_SIZE, locked_ni);
 		if (retry_err == -ENOSPC) {
-			retry_err = ntfs_attrlist_repack(attr_vi, attr_ni,
-					NTFS_MAX_ATTR_LIST_SIZE);
+			retry_err = ntfs_attrlist_repack(
+					attr_vi, attr_ni,
+					NTFS_MAX_ATTR_LIST_SIZE, locked_ni);
 			if (retry_err == -ENOSPC)
 				retry_err = 0;
 		}
@@ -289,6 +302,11 @@ int ntfs_attrlist_update(struct ntfs_inode *base_ni)
 	return 0;
 }
 
+int ntfs_attrlist_update(struct ntfs_inode *base_ni)
+{
+	return ntfs_attrlist_update_locked(base_ni, NULL);
+}
+
 /*
  * ntfs_attrlist_entry_add - add an attribute list attribute entry
  * @ni:	opened ntfs inode, which contains that attribute
diff --git a/fs/ntfs/attrlist.h b/fs/ntfs/attrlist.h
index 1892a3934d3a..10cc2cc8e208 100644
--- a/fs/ntfs/attrlist.h
+++ b/fs/ntfs/attrlist.h
@@ -16,5 +16,7 @@ int ntfs_attrlist_need(struct ntfs_inode *ni);
 int ntfs_attrlist_entry_add(struct ntfs_inode *ni, struct attr_record *attr);
 int ntfs_attrlist_entry_rm(struct ntfs_attr_search_ctx *ctx);
 int ntfs_attrlist_update(struct ntfs_inode *base_ni);
+int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
+				struct ntfs_inode *locked_ni);
 
 #endif /* defined _NTFS_ATTRLIST_H */
diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 197d8607fc63..6927d115d6af 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -1450,7 +1450,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 	ni->runlist.rl = rl;
 	rlc = NULL;
 
-	err = ntfs_attr_update_mapping_pairs(ni, 0);
+	err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 	up_write(&ni->runlist.lock);
 	if (err)
 		err = -EIO;
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 8164326b7812..007d1614b9ac 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -111,7 +111,8 @@ static int ntfs_trim_prealloc(struct inode *vi)
 			ntfs_error(vol->sb, "Preallocated block rollback failed");
 		} else {
 			ni->allocated_size = ntfs_cluster_to_bytes(vol, vcn_tr);
-			err = ntfs_attr_update_mapping_pairs(ni, 0);
+			err = ntfs_attr_update_mapping_pairs_locked(
+					ni, 0, ni);
 			if (err)
 				ntfs_error(vol->sb,
 					   "Failed to rollback mapping pairs for prealloc");
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index f35d6370e2fb..d1accde6d7c8 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2772,7 +2772,7 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 
 	if (NInoNonResident(ni) && NInoRunlistDirty(ni)) {
 		down_write(&ni->runlist.lock);
-		err = ntfs_attr_update_mapping_pairs(ni, 0);
+		err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 		if (!err)
 			NInoClearRunlistDirty(ni);
 		up_write(&ni->runlist.lock);
diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index f0656d0bbeeb..5b9723abb10f 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -1131,7 +1131,8 @@ static s64 mft_bitmap_alloc_free_rec(struct ntfs_volume *vol,
 	return ll;
 }
 
-static int ntfs_mft_attr_extend(struct ntfs_inode *ni)
+static int ntfs_mft_attr_extend(struct ntfs_inode *ni,
+				struct ntfs_inode *locked_ni)
 {
 	int ret = 0;
 	struct ntfs_inode *base_ni;
@@ -1152,7 +1153,7 @@ static int ntfs_mft_attr_extend(struct ntfs_inode *ni)
 		}
 	}
 
-	ret = ntfs_attr_update_mapping_pairs(ni, 0);
+	ret = ntfs_attr_update_mapping_pairs_locked(ni, 0, locked_ni);
 	if (ret)
 		pr_err("MP update failed\n");
 
@@ -1340,7 +1341,7 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 	ret = ntfs_attr_record_resize(ctx->mrec, a, mp_size +
 			le16_to_cpu(a->data.non_resident.mapping_pairs_offset));
 	if (unlikely(ret)) {
-		ret = ntfs_mft_attr_extend(mftbmp_ni);
+		ret = ntfs_mft_attr_extend(mftbmp_ni, mftbmp_ni);
 		if (!ret)
 			goto extended_ok;
 		if (ret != -EAGAIN)
@@ -1451,7 +1452,9 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 			NVolSetErrors(vol);
 		}
 		mark_mft_record_dirty(ctx->ntfs_ino);
-	} else if (status.mp_extended && ntfs_attr_update_mapping_pairs(mftbmp_ni, 0)) {
+	} else if (status.mp_extended &&
+		   ntfs_attr_update_mapping_pairs_locked(mftbmp_ni, 0,
+							  mftbmp_ni)) {
 		ntfs_error(vol->sb, "Failed to restore mapping pairs.%s", es);
 		NVolSetErrors(vol);
 	}
@@ -1776,7 +1779,7 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	ret = ntfs_attr_record_resize(ctx->mrec, a, mp_size +
 			le16_to_cpu(a->data.non_resident.mapping_pairs_offset));
 	if (unlikely(ret)) {
-		ret = ntfs_mft_attr_extend(mft_ni);
+		ret = ntfs_mft_attr_extend(mft_ni, NULL);
 		if (!ret)
 			goto extended_ok;
 		if (ret != -EAGAIN)
-- 
2.25.1

