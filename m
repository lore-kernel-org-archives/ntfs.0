Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486099;
	b=pTpqGCo1paNTdPtjcrTFy0ipk8zYWgtIUf8EUqThcEREGLCmulXgtbHTlQg+kVj5Akcg
	 GrGAg8l+j6W8XpBg69gRinRlFJvOBipfv4DqDmhRuaA0XA6x/M5jRAx9ip6q3qN1IKa+3
	 LNiqg1SOmPT+m+utXQy9tv77kYAt78R3iNMfIVGuPRQ1bnrbkhqJqzgKWEAf8U7pyRG5a
	 N/r2xa96bor1oKRqAmhc3F47jgjsMelsso0DIhDrfmT9lXBfDIipnu7D5Zo0V6x4otATH
	 GNrAqXne7vGIT+BSR4uPfNdPJxHfWvLX0EldJE0qRqFUzjAC4rYevJU0CjNHUm2K/kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486099;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=SlM1biEb7J70bzma8sH/ffN8QGBDfZ/x6unpu62V4yA=;
	b=EvpN9zZ+ZfnkWhnvytfscI4cFfmH7YROtWqqLHtO7uxTF16i9jjFQ4saCL92NSqZ6BDe
	 bLF7kIWEOJi/eJg33lMXYtxqlT/6s62OyFfYyN3wpK6KjdW6Y70CK8ZG5X2dzHkSoOEy4
	 scNtaXUjQZ/k1nqvGIm07vP0WdGIKuxktrK2SpTLeixSD6IatbBfA4FrydLUEZY3+GV/A
	 nRYEilm+022fH2CwR9fvwsNTusIQcmGN/QWuvnbaROEwOxJQ82tPL+WoyEtLXW+AsPnO+
	 cfMBG2j2d6S3PyoVxytILW30fkywk9JfboJp9UZF0wkARNh0y8BM8kB5/JS97l5TjkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RNiX0mVg;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5F2606A33B
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C5F2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RNiX0mVg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Sl
	M1biEb7J70bzma8sH/ffN8QGBDfZ/x6unpu62V4yA=; b=RNiX0mVgYlVTrEwReQ
	rzzPF8Cq6YReaemIKmkysAfd+mo3B4nJQZHFOt7knibAbAJ8Cd/6jICPaCf6AEGm
	T9JXw3jQvyVXAC/4AMnBSyEI6DYkbsD4qKD2Fhy1merggzR7bEeAOz2FdXUGRE8y
	UUYKYH6o+QwmWImdtj8uxkvu0=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3t62yKtdqN_ayBQ--.9980S4;
	Tue, 20 Oct 2026 16:47:49 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 26/31] ntfs: report MFT bitmap and data growth recovery failures
Date: Tue, 20 Oct 2026 16:44:16 +0800
Message-ID: <20261020084421.2196486-27-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3t62yKtdqN_ayBQ--.9980S4
X-Coremail-Antispam: 1Uf129KBjvAXoW3KFW7XFy7Jw45CFWUXF1fZwb_yoW8XFyUuo
	WS9r10yw4DW34jk34ayas5Aas8Aan8Ca95Jry5CrZrCa92vw1q9rW7K3y3W3y7G3WrGr4a
	vrn7Jrn5AFs3AFyUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVPl1DUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hVIE2rXKrWZ-wAA3g

From: Baolin Liu <liubaolin@kylinos.cn>

Growing the MFT bitmap or data allocation can detect missing or
inconsistent metadata and leave failed recovery unreported. Record
corruption and failures to restore mappings, allocation, or search state
through volume metadata reports.

Use EFSCORRUPTED for corrupt mappings and preserve ENOMEM from runlist
merges. After a failed merge, report cluster-release failure separately
without replacing the merge error.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/mft.c | 179 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 116 insertions(+), 63 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index f494f283408b..cc264a0fc073 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -1349,8 +1349,9 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
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
@@ -1381,10 +1382,12 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 		up_write(&mftbmp_ni->runlist.lock);
 		ntfs_error(vol->sb,
 			"Failed to determine last allocated cluster of mft bitmap attribute.");
-		if (!IS_ERR(rl))
-			ret = -EIO;
-		else
+		if (!IS_ERR(rl)) {
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
+			ret = -EFSCORRUPTED;
+		} else {
 			ret = PTR_ERR(rl);
+		}
 		return ret;
 	}
 	lcn = rl->lcn + rl->length;
@@ -1453,15 +1456,20 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 		status.added_cluster = rl2->lcn == lcn;
 		rl = ntfs_runlists_merge(&mftbmp_ni->runlist, rl2, 0, &new_rl_count);
 		if (IS_ERR(rl)) {
+			int merge_err = PTR_ERR(rl);
+
+			if (merge_err != -ENOMEM)
+				ntfs_report_metadata_error(vol, -EFSCORRUPTED);
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
-			return PTR_ERR(rl);
+			return merge_err == -ENOMEM ? merge_err : -EFSCORRUPTED;
 		}
 		mftbmp_ni->runlist.rl = rl;
 		mftbmp_ni->runlist.count = new_rl_count;
@@ -1494,8 +1502,10 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 	if (unlikely(ret)) {
 		ntfs_error(vol->sb,
 			"Failed to find last attribute extent of mft bitmap attribute.");
-		if (ret == -ENOENT)
-			ret = -EIO;
+		if (ret == -ENOENT) {
+			ret = -EFSCORRUPTED;
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
+		}
 		goto undo_alloc;
 	}
 	a = ctx->attr;
@@ -1514,7 +1524,9 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 			"Get size for mapping pairs failed for mft bitmap attribute extent.");
 		ret = mp_size;
 		if (!ret)
-			ret = -EIO;
+			ret = -EFSCORRUPTED;
+		if (ret == -EFSCORRUPTED)
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 		goto undo_alloc;
 	}
 	/* Expand the attribute record if necessary. */
@@ -1537,6 +1549,8 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 	if (unlikely(ret)) {
 		ntfs_error(vol->sb,
 			"Failed to build mapping pairs array for mft bitmap attribute.");
+		if (ret == -EFSCORRUPTED)
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 		goto undo_alloc;
 	}
 	/* Update the highest_vcn. */
@@ -1559,6 +1573,10 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 		if (unlikely(ret)) {
 			ntfs_error(vol->sb,
 				"Failed to find first attribute extent of mft bitmap attribute.");
+			if (ret == -ENOENT) {
+				ret = -EFSCORRUPTED;
+				ntfs_report_metadata_error(vol, -EFSCORRUPTED);
+			}
 			goto restore_undo_alloc;
 		}
 		a = ctx->attr;
@@ -1579,9 +1597,10 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 
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
@@ -1594,7 +1613,7 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 		 * The only thing that is now wrong is ->allocated_size of the
 		 * base attribute extent which chkdsk should be able to fix.
 		 */
-		NVolSetErrors(vol);
+		ntfs_report_metadata_error(vol, err);
 		return ret;
 	}
 	a = ctx->attr;
@@ -1613,31 +1632,36 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
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
@@ -1670,7 +1694,7 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 	struct ntfs_attr_search_ctx *ctx;
 	struct mft_record *mrec;
 	struct attr_record *a;
-	int ret;
+	int err, ret;
 
 	ntfs_debug("Extending mft bitmap initialized (and data) size.");
 	mft_ni = NTFS_I(vol->mft_ino);
@@ -1694,8 +1718,10 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 	if (unlikely(ret)) {
 		ntfs_error(vol->sb,
 			"Failed to find first attribute extent of mft bitmap attribute.");
-		if (ret == -ENOENT)
-			ret = -EIO;
+		if (ret == -ENOENT) {
+			ret = -EFSCORRUPTED;
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
+		}
 		goto put_err_out;
 	}
 	a = ctx->attr;
@@ -1731,21 +1757,24 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 	mrec = map_mft_record(mft_ni);
 	if (IS_ERR(mrec)) {
 		ntfs_error(vol->sb, "Failed to map mft record.%s", es);
-		NVolSetErrors(vol);
+		err = PTR_ERR(mrec);
+		ntfs_report_metadata_error(vol, err);
 		return ret;
 	}
 	ctx = ntfs_attr_get_search_ctx(mft_ni, mrec);
 	if (IS_ERR(ctx)) {
 		ntfs_error(vol->sb, "Failed to get search context.%s", es);
-		NVolSetErrors(vol);
+		ntfs_report_metadata_error(vol, PTR_ERR(ctx));
 		ctx = NULL;
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
@@ -1807,7 +1836,7 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	struct ntfs_attr_search_ctx *ctx = NULL;
 	struct mft_record *mrec;
 	struct attr_record *a = NULL;
-	int ret, mp_size;
+	int err, ret, mp_size;
 	u32 old_alen = 0;
 	bool mp_rebuilt = false, mp_extended = false;
 	size_t new_rl_count;
@@ -1829,10 +1858,12 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 		up_write(&mft_ni->runlist.lock);
 		ntfs_error(vol->sb,
 			"Failed to determine last allocated cluster of mft data attribute.");
-		if (!IS_ERR(rl))
-			ret = -EIO;
-		else
+		if (!IS_ERR(rl)) {
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
+			ret = -EFSCORRUPTED;
+		} else {
 			ret = PTR_ERR(rl);
+		}
 		return ret;
 	}
 	lcn = rl->lcn + rl->length;
@@ -1898,15 +1929,20 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	rl = ntfs_runlists_merge_keep_src(&mft_ni->runlist, alloc_rl, 0,
 			&new_rl_count);
 	if (IS_ERR(rl)) {
+		int merge_err = PTR_ERR(rl);
+
+		if (merge_err != -ENOMEM)
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 		up_write(&mft_ni->runlist.lock);
 		ntfs_error(vol->sb, "Failed to merge runlists for mft data attribute.");
-		if (ntfs_cluster_free_from_rl(vol, alloc_rl)) {
+		err = ntfs_cluster_free_from_rl(vol, alloc_rl);
+		if (err) {
 			ntfs_error(vol->sb,
 				"Failed to deallocate clusters from the mft data attribute.%s", es);
-			NVolSetErrors(vol);
+			ntfs_report_metadata_error(vol, err);
 		}
 		kvfree(alloc_rl);
-		return PTR_ERR(rl);
+		return merge_err == -ENOMEM ? merge_err : -EFSCORRUPTED;
 	}
 	mft_ni->runlist.rl = rl;
 	mft_ni->runlist.count = new_rl_count;
@@ -1934,8 +1970,10 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 			CASE_SENSITIVE, rl[1].vcn, NULL, 0, ctx);
 	if (unlikely(ret)) {
 		ntfs_error(vol->sb, "Failed to find last attribute extent of mft data attribute.");
-		if (ret == -ENOENT)
-			ret = -EIO;
+		if (ret == -ENOENT) {
+			ret = -EFSCORRUPTED;
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
+		}
 		goto undo_alloc;
 	}
 	a = ctx->attr;
@@ -1956,7 +1994,9 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 			"Get size for mapping pairs failed for mft data attribute extent.");
 		ret = mp_size;
 		if (!ret)
-			ret = -EIO;
+			ret = -EFSCORRUPTED;
+		if (ret == -EFSCORRUPTED)
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 		up_write(&mft_ni->runlist.lock);
 		goto undo_alloc;
 	}
@@ -1981,6 +2021,8 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 			mp_size, rl2, ll, -1, NULL, NULL, NULL);
 	if (unlikely(ret)) {
 		ntfs_error(vol->sb, "Failed to build mapping pairs array of mft data attribute.");
+		if (ret == -EFSCORRUPTED)
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 		goto undo_alloc;
 	}
 	/* Update the highest_vcn. */
@@ -2005,6 +2047,10 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 		if (unlikely(ret)) {
 			ntfs_error(vol->sb,
 				"Failed to find first attribute extent of mft data attribute.");
+			if (ret == -ENOENT) {
+				ret = -EFSCORRUPTED;
+				ntfs_report_metadata_error(vol, -EFSCORRUPTED);
+			}
 			goto restore_undo_alloc;
 		}
 		a = ctx->attr;
@@ -2024,8 +2070,9 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
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
@@ -2038,7 +2085,7 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 		 * The only thing that is now wrong is ->allocated_size of the
 		 * base attribute extent which chkdsk should be able to fix.
 		 */
-		NVolSetErrors(vol);
+		ntfs_report_metadata_error(vol, err);
 		return ret;
 	}
 	ctx->attr->data.non_resident.highest_vcn =
@@ -2050,9 +2097,10 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	 * is dropped, as lcnbmp_lock nests outside it (see above).
 	 */
 	down_write(&mft_ni->runlist.lock);
-	if (ntfs_rl_truncate_nolock(vol, &mft_ni->runlist, old_last_vcn)) {
+	err = ntfs_rl_truncate_nolock(vol, &mft_ni->runlist, old_last_vcn);
+	if (err) {
 		ntfs_error(vol->sb, "Failed to truncate mft data attribute runlist.%s", es);
-		NVolSetErrors(vol);
+		ntfs_report_metadata_error(vol, err);
 		/*
 		 * The runlist may still reference the clusters, so leave them
 		 * allocated until chkdsk.
@@ -2061,15 +2109,19 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 		alloc_rl = NULL;
 	}
 	up_write(&mft_ni->runlist.lock);
-	if (ntfs_cluster_free_from_rl(vol, alloc_rl)) {
+	err = ntfs_cluster_free_from_rl(vol, alloc_rl);
+	if (err) {
 		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
-		NVolSetErrors(vol);
+		ntfs_report_metadata_error(vol, err);
 	}
 	kvfree(alloc_rl);
-	if (mp_extended && ntfs_attr_update_mapping_pairs(mft_ni, 0)) {
-		ntfs_error(vol->sb, "Failed to restore mapping pairs.%s",
-			   es);
-		NVolSetErrors(vol);
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
@@ -2085,16 +2137,17 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 			up_read(&mft_ni->runlist.lock);
 			if (err) {
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
-- 
2.51.0

