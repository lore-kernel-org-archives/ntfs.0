Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BAF35CBD7
	for <ntfs@lists.linux.dev>; Fri,  2 Oct 2026 04:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915714; cv=none; b=Eph9RRQjKkkXmnyW9m/92lM8oyL5nTjzCmeDEdyPypdx/0YILYygSB24L58fbE6z9yxBhW1gm2ecxTU6snFH64lWuxMvsf2rpGr05cC4mzwxeLWLqzZ5SJNYDCkBmu6mkwMn6XuC48p0EqZBVKpo5K6bsow/kEzb9wObuhXGlnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915714; c=relaxed/simple;
	bh=HVRHOXuO/9++v5H8Rg9v6xTeqCjVL63Ax292SNlO308=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PrFYNnM9N7i0w8td4gJLcW1oubKbNd5N0s+mCgzOAWOfL5JZxZ41vpSnolup4ggg1fHtujWFgkTfRpTB97v6thFXfyExYyk1wMUaEXKmhgjnz+PGhWcz/T7AWCNH15pBUmfNZLILolX35ED43gdX1qd5So+cuYkUW+x5z2smxm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJErFOYO; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJErFOYO"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc78d45f78fso4736402a12.3
        for <ntfs@lists.linux.dev>; Thu, 01 Oct 2026 21:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915712; x=1791520512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1/BmCVKCCC5KU+7BUHsA6XB9ZAPAKahVbUM7pjQU84=;
        b=eJErFOYORVaX6r6/K+UaS/XiBFaC8Rxh7N2Yc/VmAlKFQZLOqsHeDUcreS3wGmFfWC
         n81s/zTvqmJit0fYWw3yfkOsP2T9t2eNdChmbpVfk6vZ6yCShcvZP7iyxY/DZOc03kJY
         xocdxRycerg9ueTqQKHHX/0ryyNKC/i059ZpzBxev6MjOtwDxvjko3sTjwK45qugZEhl
         ZJ9uaTb2/e+HcdeW0Z727keXBMijIzephVTeqNYxaek8uwNq5+7U29HVrs5N+GYtMlLp
         WR4m9VMOIa2SVNnfdFOAe/PmAsXqM9+F3nG/mPxrEXKakMnU7brr6AaIjvJ241zxd7A/
         Tl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915712; x=1791520512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1/BmCVKCCC5KU+7BUHsA6XB9ZAPAKahVbUM7pjQU84=;
        b=kSbFeyK98X2v6lXFAWA2P7br7Ke4qc7x03DyTFJJ2zQSCy6CekNGOe8sRJ+qtgXCg6
         3fOu/xL3O3ByZJ61nGmba2L7r1HMmeq2mS+3Yasu0WRB2wmsgZPgcbZDLfe1r7qliq4w
         TmzaV2HvVneDLMFJe2/xzKB/DycR204We/H4HZ4HXhaqUM7tYC9XrymkNsL+ZjM+WSSA
         u92MnDtOACtZvqyiYnM5UdKF2tZszLB/57fnGE1V8tPtpdJ42NZOS5SPNDukyrTGN5W0
         ej/RoDyQNXjUeuNzVo4WHwasb1IhhHRAl8Xd4OmWI5XtUN5HUnrnbT1CWJ3UAXFMoiRj
         95Mw==
X-Forwarded-Encrypted: i=1; AKwUvBzRACHJbr2w2eOS78la+tGoOhbG/7ouuSGewFZF0ITP1ACzx/AQxVoae0of5lKu9Z4r6Nfc@lists.linux.dev
X-Gm-Message-State: AFuF++kdfaHkXcWaxNuD7CUBUwka242ELv3A3+eaKEbLPlf0yBhCEWps
	ot5fNWyqsRIKHjaWXyjNmqxgDdu9GSx7y2gdU8bWlmXUCNU84dGi3Ubp
X-Gm-Gg: AYBFou19jynAndZ6TB/8MV9bX2ucW2ZkXWOcvLGgDINhsYWyfsZh4wrY1BHv/YgEjOu
	o7Px5PEeuCR7syjABH9oBnfjq5L6ypc773ocY8Ram4AeJZasA9KFgkM/2T1Gt0enykuw6ln2W80
	fKitfhxlA1qknSQtLnFq30xHSnc3dSS8JtN04MBu3MG1P98T5XEeCl66XJPlQ1N0oY77xC3NhD3
	BJBoHjJeAPNyHFGcohZDtNi4+Jzabte4s5FTN26A0wvmjhP9BjnyswJk2aNUxCqiLnP9/z453jj
	Wh2A0BwClQwg7+P/hHEJzimtJR/xjb0+4yt7BoEyPH3BKm4PYL7W8rJLmcRfWEH5i0Abes8OJUc
	c1X1hTHwSxEEgUA6OtjM2lCfszx/C9qiE/N5r2mYarMJ8s7venPJti4TKZVofrVXw/DY20WVcku
	BUXcF4eXzM9mKSNJb7c5NIxddbqGA7tH3/c9vNOc+4lAYYlZSq4/LH/AWV/11QLQ0t0dxwd0sRw
	9FH97aOWpnXjqSaC4B61M2UztDpeooet3Q6S8zuiJe56dvkmd1X27Ak8b4rcPzTSj3dH3H0K8UN
	EGj7kcOfqKgvX9GIg0ctYpr5ffoM5Z6DzJiim72teLjN+s0r5T/dI+BLDMA=
X-Received: by 2002:a05:6a20:7d8b:b0:3de:b04b:55a2 with SMTP id adf61e73a8af0-3e0bcfbd56bmr1732809637.22.1790915712245;
        Thu, 01 Oct 2026 21:35:12 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7370db1sm436432a12.17.2026.10.01.21.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:35:11 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] ntfs: balance the $MFT runlist lock in data extension error paths
Date: Fri,  2 Oct 2026 12:34:59 +0800
Message-ID: <20261002043459.1695429-4-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261002043459.1695429-1-matthias.goergens@gmail.com>
References: <20261002043459.1695429-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_mft_data_extend_allocation_nolock() drops the $MFT runlist lock
before allocating clusters, and every path into undo_alloc arrives
without it, except a map_mft_record() failure, which takes it first.
undo_alloc never releases it, so the lock leaks and the next $MFT
extension and $MFT writeback hang.  The restore_undo_alloc failure
path, on the other hand, releases the lock without holding it.  And
undo_alloc frees the clusters with ntfs_cluster_free() and truncates
the runlist without the lock, although both require it.

Enter undo_alloc without the lock on every path.  Merge the new clusters
with ntfs_runlists_merge_keep_src() and keep the runlist that
ntfs_cluster_alloc() returned until the extension is complete.  On
failure, undo_alloc truncates $MFT's runlist under the lock and, after
dropping it, frees the clusters from the kept runlist with
ntfs_cluster_free_from_rl().  That keeps lcnbmp_lock outside the runlist
lock, the order given by the comment before the cluster allocation.
Unlike ntfs_cluster_free() on a volume mounted with -o discard, this
does not issue discards for the clusters, which were never written; the
runlist merge failure path already frees them the same way.  If the
truncation fails, the runlist may still reference the clusters, so they
stay allocated and the volume is marked for chkdsk; at this call site
the truncation only shrinks the runlist and cannot fail today.

A shorter fix would keep calling ntfs_cluster_free() on the live
runlist without the lock, relying on $MFT's runlist being fully mapped
and changed only by this function under mrec_lock.  That breaks
ntfs_cluster_free()'s documented locking rule on an argument about the
rest of the driver, so this patch does not do that.

Fixes: 115380f9a2f9 ("ntfs: update mft operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
v3: free the clusters from the runlist that ntfs_cluster_alloc()
returned, kept intact by the merge from patch 2, instead of from a copy
of the new runs made with ntfs_mft_copy_tail() in undo_alloc (Hyunchul
Lee).  The undo path no longer allocates, so the case where the copy
failed and the clusters stayed allocated is gone.  A copy made before
the merge would also have worked, but would add an allocation to every
$MFT extension.

v2: do not free the clusters if ntfs_rl_truncate_nolock() fails
(Hyunchul Lee).

Without this patch, a forced map_mft_record() failure gives "WARNING:
lock held when returning to user space" for the $MFT runlist lock, and
the next file create and $MFT writeback block on it.  A forced lookup
failure in restore_undo_alloc gives "bad unlock balance".  With it, the
create fails with the injected error, lockdep stays quiet and the
volume keeps working, also when the merge is forced to fail.  With the
truncation forced to fail, nothing is freed that $MFT's runlist still
maps.  A debug check in undo_alloc found, in every undo of these runs,
that the kept runlist describes exactly the runs taken off $MFT's
runlist.  $MFT growth on a nearly full, fragmented volume behaves as
before.

 fs/ntfs/mft.c | 50 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index c2339acc6319..89288b794348 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -1791,7 +1791,7 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	s64 min_nr, nr, ll;
 	unsigned long flags;
 	struct ntfs_inode *mft_ni;
-	struct runlist_element *rl, *rl2;
+	struct runlist_element *rl, *rl2, *alloc_rl;
 	struct ntfs_attr_search_ctx *ctx = NULL;
 	struct mft_record *mrec;
 	struct attr_record *a = NULL;
@@ -1859,15 +1859,15 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	up_write(&mft_ni->runlist.lock);
 
 	do {
-		rl2 = ntfs_cluster_alloc(vol, old_last_vcn, nr, lcn, MFT_ZONE,
-				true, false, false);
-		if (!IS_ERR(rl2))
+		alloc_rl = ntfs_cluster_alloc(vol, old_last_vcn, nr, lcn,
+				MFT_ZONE, true, false, false);
+		if (!IS_ERR(alloc_rl))
 			break;
-		if (PTR_ERR(rl2) != -ENOSPC || nr == min_nr) {
+		if (PTR_ERR(alloc_rl) != -ENOSPC || nr == min_nr) {
 			ntfs_error(vol->sb,
 				"Failed to allocate the minimal number of clusters (%lli) for the mft data attribute.",
 				nr);
-			return PTR_ERR(rl2);
+			return PTR_ERR(alloc_rl);
 		}
 		/*
 		 * There is not enough space to do the allocation, but there
@@ -1878,17 +1878,22 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 		ntfs_debug("Retrying mft data allocation with minimal cluster count %lli.", nr);
 	} while (1);
 
+	/*
+	 * Keep @alloc_rl until the extension is complete: it describes exactly
+	 * the new clusters, which undo_alloc frees if a later step fails.
+	 */
 	down_write(&mft_ni->runlist.lock);
-	rl = ntfs_runlists_merge(&mft_ni->runlist, rl2, 0, &new_rl_count);
+	rl = ntfs_runlists_merge_keep_src(&mft_ni->runlist, alloc_rl, 0,
+			&new_rl_count);
 	if (IS_ERR(rl)) {
 		up_write(&mft_ni->runlist.lock);
 		ntfs_error(vol->sb, "Failed to merge runlists for mft data attribute.");
-		if (ntfs_cluster_free_from_rl(vol, rl2)) {
+		if (ntfs_cluster_free_from_rl(vol, alloc_rl)) {
 			ntfs_error(vol->sb,
 				"Failed to deallocate clusters from the mft data attribute.%s", es);
 			NVolSetErrors(vol);
 		}
-		kvfree(rl2);
+		kvfree(alloc_rl);
 		return PTR_ERR(rl);
 	}
 	mft_ni->runlist.rl = rl;
@@ -1904,7 +1909,6 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	if (IS_ERR(mrec)) {
 		ntfs_error(vol->sb, "Failed to map mft record.");
 		ret = PTR_ERR(mrec);
-		down_write(&mft_ni->runlist.lock);
 		goto undo_alloc;
 	}
 	ctx = ntfs_attr_get_search_ctx(mft_ni, mrec);
@@ -2002,6 +2006,7 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	mark_mft_record_dirty(ctx->ntfs_ino);
 	ntfs_attr_put_search_ctx(ctx);
 	unmap_mft_record(mft_ni);
+	kvfree(alloc_rl);
 	ntfs_debug("Done.");
 	return 0;
 restore_undo_alloc:
@@ -2015,7 +2020,7 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 		write_unlock_irqrestore(&mft_ni->size_lock, flags);
 		ntfs_attr_put_search_ctx(ctx);
 		unmap_mft_record(mft_ni);
-		up_write(&mft_ni->runlist.lock);
+		kvfree(alloc_rl);
 		/*
 		 * The only thing that is now wrong is ->allocated_size of the
 		 * base attribute extent which chkdsk should be able to fix.
@@ -2026,15 +2031,28 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	ctx->attr->data.non_resident.highest_vcn =
 			cpu_to_le64(old_last_vcn - 1);
 undo_alloc:
-	if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
-		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
-		NVolSetErrors(vol);
-	}
-
+	/*
+	 * Entered without the runlist lock.  Take the new runs off the
+	 * runlist under it, and free their clusters from @alloc_rl once it
+	 * is dropped, as lcnbmp_lock nests outside it (see above).
+	 */
+	down_write(&mft_ni->runlist.lock);
 	if (ntfs_rl_truncate_nolock(vol, &mft_ni->runlist, old_last_vcn)) {
 		ntfs_error(vol->sb, "Failed to truncate mft data attribute runlist.%s", es);
 		NVolSetErrors(vol);
+		/*
+		 * The runlist may still reference the clusters, so leave them
+		 * allocated until chkdsk.
+		 */
+		kvfree(alloc_rl);
+		alloc_rl = NULL;
+	}
+	up_write(&mft_ni->runlist.lock);
+	if (ntfs_cluster_free_from_rl(vol, alloc_rl)) {
+		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
+		NVolSetErrors(vol);
 	}
+	kvfree(alloc_rl);
 	if (mp_extended && ntfs_attr_update_mapping_pairs(mft_ni, 0)) {
 		ntfs_error(vol->sb, "Failed to restore mapping pairs.%s",
 			   es);
-- 
2.56.0

