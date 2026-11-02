Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605146;
	b=G9L21lDuxwI2Stls4V8IVankR5hCD6ShuOKFDGyxOgVedehvmfpPMMS6qA+wL7kNu1bA
	 F8AOIaoTaGU+LyQ5vH15GSHJm2VE6tqZ+5nJqV5jb+mKNA+KnRCorIxDm3CeKFa65qaNJ
	 PVhP37i4iKvR9IC+vxpt179fH4xT59RaUimLL+JPZWillsno+Oo5SxeS7rpV/2OLZ+Crr
	 ItBbIwNeAdFjXLdURx3nbnD4yCUEK8s5lfz/ZtkzDgievfJVKF5AkLocXCtyhBExhDngV
	 2ZjgZX5rtAJLHN1aZulpW3t8IUg2nANQF5Zde+XQWWTl/8913DVw1EMh0480C7nZV2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605146;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=z+Y1AGpv23b5m+805tvy8UBb6xn2aTuP/7/wM61X22c=;
	b=SSceBGeYC427gDEfRdw70SSfx7tZTV3n44q9bbmo72Gt8ags7uw+yueeUam769gcZ3o8
	 BAiQ8pPUeq+aGydL7Jd39Su7ZismHmO3kZ7P+v5/R2zivMXgJluDAQEcAAigK3d2WcYE0
	 YwZZuGE3I1rpl4JSjmUhy9m731tfDLvaSm5dZImiRg44ulHcGqiiihp9CsNvHLfgdh7xz
	 PSG1b8q+9xfyjAxIfVjNSStVRBrF7SJt2OL8XELrMTimyzuL9yUds77yV5bx6Agbg+8Sv
	 udE8q+wCWVPIto7YQb30DC3hh1t7jyAMBPKOdhiLPNu1dStaL6Wom7s98dpEPe3hx7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iw0PdiYZ;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25667606A324
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25667606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iw0PdiYZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=z+
	Y1AGpv23b5m+805tvy8UBb6xn2aTuP/7/wM61X22c=; b=iw0PdiYZSuBswsFM/G
	UIF1wOZ3L8WprluWi3jbUW8CQa7sDIxi50oU246f6H/p/5PDAMomLcftlBL5eeOm
	3v/utRTL0GFSjtWe7xQ+YN6axqhxpO0ZyzAt7qllKzVc5L6GrAsB1vCmvEhj6Uqm
	KzrLTEeAGZIPrgtpx7Qd2uu80=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3nygJPuhqucJHEg--.56690S4;
	Mon, 02 Nov 2026 15:38:51 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v5 26/31] ntfs: report MFT bitmap and data growth recovery failures
Date: Mon,  2 Nov 2026 15:35:27 +0800
Message-Id: <20261102073532.98873-27-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3nygJPuhqucJHEg--.56690S4
X-Coremail-Antispam: 1Uf129KBjvAXoW3KFW7XF4kJFy3Xw17Gr13XFb_yoW8WFykKo
	WSvr4jyw4DW34jk3yYywn5AasxAan8Ca95JrW5CrZrCa92vw1qvrW3G3y3Z3yxG3WrGr1a
	vr1xJrn5Ars3AFy3n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUczuAUUUUU
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzgtmT2roPgtNrAAA36

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
 fs/ntfs/mft.c | 204 +++++++++++++++++++++++++++++++++-----------------
 1 file changed, 136 insertions(+), 68 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index f494f283408b..7290feeb1803 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -1340,6 +1340,7 @@ static int ntfs_mft_attr_extend(struct ntfs_inode *ni,
  */
 static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 {
+	int report_err = 0;
 	s64 lcn;
 	s64 ll;
 	unsigned long flags;
@@ -1349,8 +1350,9 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
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
@@ -1381,11 +1383,13 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 		up_write(&mftbmp_ni->runlist.lock);
 		ntfs_error(vol->sb,
 			"Failed to determine last allocated cluster of mft bitmap attribute.");
-		if (!IS_ERR(rl))
-			ret = -EIO;
-		else
+		if (!IS_ERR(rl)) {
+			report_err = -EFSCORRUPTED;
+			ret = -EFSCORRUPTED;
+		} else {
 			ret = PTR_ERR(rl);
-		return ret;
+		}
+		goto out;
 	}
 	lcn = rl->lcn + rl->length;
 	ntfs_debug("Last lcn of mft bitmap attribute is 0x%llx.",
@@ -1453,15 +1457,21 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 		status.added_cluster = rl2->lcn == lcn;
 		rl = ntfs_runlists_merge(&mftbmp_ni->runlist, rl2, 0, &new_rl_count);
 		if (IS_ERR(rl)) {
+			int merge_err = PTR_ERR(rl);
+
+			if (merge_err != -ENOMEM)
+				report_err = -EFSCORRUPTED;
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
+			ret = merge_err == -ENOMEM ? merge_err : -EFSCORRUPTED;
+		goto out;
 		}
 		mftbmp_ni->runlist.rl = rl;
 		mftbmp_ni->runlist.count = new_rl_count;
@@ -1494,8 +1504,10 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 	if (unlikely(ret)) {
 		ntfs_error(vol->sb,
 			"Failed to find last attribute extent of mft bitmap attribute.");
-		if (ret == -ENOENT)
-			ret = -EIO;
+		if (ret == -ENOENT) {
+			ret = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
+		}
 		goto undo_alloc;
 	}
 	a = ctx->attr;
@@ -1514,7 +1526,9 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 			"Get size for mapping pairs failed for mft bitmap attribute extent.");
 		ret = mp_size;
 		if (!ret)
-			ret = -EIO;
+			ret = -EFSCORRUPTED;
+		if (ret == -EFSCORRUPTED)
+			report_err = -EFSCORRUPTED;
 		goto undo_alloc;
 	}
 	/* Expand the attribute record if necessary. */
@@ -1537,6 +1551,8 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 	if (unlikely(ret)) {
 		ntfs_error(vol->sb,
 			"Failed to build mapping pairs array for mft bitmap attribute.");
+		if (ret == -EFSCORRUPTED)
+			report_err = -EFSCORRUPTED;
 		goto undo_alloc;
 	}
 	/* Update the highest_vcn. */
@@ -1559,6 +1575,10 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 		if (unlikely(ret)) {
 			ntfs_error(vol->sb,
 				"Failed to find first attribute extent of mft bitmap attribute.");
+			if (ret == -ENOENT) {
+				ret = -EFSCORRUPTED;
+				report_err = -EFSCORRUPTED;
+			}
 			goto restore_undo_alloc;
 		}
 		a = ctx->attr;
@@ -1579,9 +1599,10 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 
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
@@ -1594,8 +1615,8 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 		 * The only thing that is now wrong is ->allocated_size of the
 		 * base attribute extent which chkdsk should be able to fix.
 		 */
-		NVolSetErrors(vol);
-		return ret;
+		ntfs_report_metadata_error(vol, err);
+		goto out;
 	}
 	a = ctx->attr;
 	a->data.non_resident.highest_vcn = cpu_to_le64(rl[1].vcn - 2);
@@ -1613,37 +1634,46 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
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
 	if (!IS_ERR(mrec))
 		unmap_mft_record(mft_ni);
 	up_write(&mftbmp_ni->runlist.lock);
+
+out:
+	if (report_err)
+		ntfs_report_metadata_error(vol, report_err);
 	return ret;
 }
 
@@ -1663,6 +1693,7 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
  */
 static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 {
+	int report_err = 0;
 	s64 old_data_size, old_initialized_size;
 	unsigned long flags;
 	struct inode *mftbmp_vi;
@@ -1670,7 +1701,7 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 	struct ntfs_attr_search_ctx *ctx;
 	struct mft_record *mrec;
 	struct attr_record *a;
-	int ret;
+	int err, ret;
 
 	ntfs_debug("Extending mft bitmap initialized (and data) size.");
 	mft_ni = NTFS_I(vol->mft_ino);
@@ -1694,8 +1725,10 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 	if (unlikely(ret)) {
 		ntfs_error(vol->sb,
 			"Failed to find first attribute extent of mft bitmap attribute.");
-		if (ret == -ENOENT)
-			ret = -EIO;
+		if (ret == -ENOENT) {
+			ret = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
+		}
 		goto put_err_out;
 	}
 	a = ctx->attr;
@@ -1731,21 +1764,24 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 	mrec = map_mft_record(mft_ni);
 	if (IS_ERR(mrec)) {
 		ntfs_error(vol->sb, "Failed to map mft record.%s", es);
-		NVolSetErrors(vol);
-		return ret;
+		err = PTR_ERR(mrec);
+		report_err = err;
+		goto err_out;
 	}
 	ctx = ntfs_attr_get_search_ctx(mft_ni, mrec);
 	if (IS_ERR(ctx)) {
 		ntfs_error(vol->sb, "Failed to get search context.%s", es);
-		NVolSetErrors(vol);
+		report_err = PTR_ERR(ctx);
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
+		report_err = err;
 put_err_out:
 		ntfs_attr_put_search_ctx(ctx);
 unm_err_out:
@@ -1773,6 +1809,8 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 	read_unlock_irqrestore(&mftbmp_ni->size_lock, flags);
 #endif /* DEBUG */
 err_out:
+	if (report_err)
+		ntfs_report_metadata_error(vol, report_err);
 	return ret;
 }
 
@@ -1798,6 +1836,7 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
  */
 static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 {
+	int report_err = 0;
 	s64 lcn;
 	s64 old_last_vcn;
 	s64 min_nr, nr, ll;
@@ -1807,7 +1846,7 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	struct ntfs_attr_search_ctx *ctx = NULL;
 	struct mft_record *mrec;
 	struct attr_record *a = NULL;
-	int ret, mp_size;
+	int err, ret, mp_size;
 	u32 old_alen = 0;
 	bool mp_rebuilt = false, mp_extended = false;
 	size_t new_rl_count;
@@ -1829,11 +1868,13 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 		up_write(&mft_ni->runlist.lock);
 		ntfs_error(vol->sb,
 			"Failed to determine last allocated cluster of mft data attribute.");
-		if (!IS_ERR(rl))
-			ret = -EIO;
-		else
+		if (!IS_ERR(rl)) {
+			report_err = -EFSCORRUPTED;
+			ret = -EFSCORRUPTED;
+		} else {
 			ret = PTR_ERR(rl);
-		return ret;
+		}
+		goto out;
 	}
 	lcn = rl->lcn + rl->length;
 	ntfs_debug("Last lcn of mft data attribute is 0x%llx.", lcn);
@@ -1898,15 +1939,21 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	rl = ntfs_runlists_merge_keep_src(&mft_ni->runlist, alloc_rl, 0,
 			&new_rl_count);
 	if (IS_ERR(rl)) {
+		int merge_err = PTR_ERR(rl);
+
+		if (merge_err != -ENOMEM)
+			report_err = -EFSCORRUPTED;
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
+		ret = merge_err == -ENOMEM ? merge_err : -EFSCORRUPTED;
+		goto out;
 	}
 	mft_ni->runlist.rl = rl;
 	mft_ni->runlist.count = new_rl_count;
@@ -1934,8 +1981,10 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 			CASE_SENSITIVE, rl[1].vcn, NULL, 0, ctx);
 	if (unlikely(ret)) {
 		ntfs_error(vol->sb, "Failed to find last attribute extent of mft data attribute.");
-		if (ret == -ENOENT)
-			ret = -EIO;
+		if (ret == -ENOENT) {
+			ret = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
+		}
 		goto undo_alloc;
 	}
 	a = ctx->attr;
@@ -1956,7 +2005,9 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 			"Get size for mapping pairs failed for mft data attribute extent.");
 		ret = mp_size;
 		if (!ret)
-			ret = -EIO;
+			ret = -EFSCORRUPTED;
+		if (ret == -EFSCORRUPTED)
+			report_err = -EFSCORRUPTED;
 		up_write(&mft_ni->runlist.lock);
 		goto undo_alloc;
 	}
@@ -1981,6 +2032,8 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 			mp_size, rl2, ll, -1, NULL, NULL, NULL);
 	if (unlikely(ret)) {
 		ntfs_error(vol->sb, "Failed to build mapping pairs array of mft data attribute.");
+		if (ret == -EFSCORRUPTED)
+			report_err = -EFSCORRUPTED;
 		goto undo_alloc;
 	}
 	/* Update the highest_vcn. */
@@ -2005,6 +2058,10 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 		if (unlikely(ret)) {
 			ntfs_error(vol->sb,
 				"Failed to find first attribute extent of mft data attribute.");
+			if (ret == -ENOENT) {
+				ret = -EFSCORRUPTED;
+				report_err = -EFSCORRUPTED;
+			}
 			goto restore_undo_alloc;
 		}
 		a = ctx->attr;
@@ -2024,8 +2081,9 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
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
@@ -2038,8 +2096,8 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 		 * The only thing that is now wrong is ->allocated_size of the
 		 * base attribute extent which chkdsk should be able to fix.
 		 */
-		NVolSetErrors(vol);
-		return ret;
+		ntfs_report_metadata_error(vol, err);
+		goto out;
 	}
 	ctx->attr->data.non_resident.highest_vcn =
 			cpu_to_le64(old_last_vcn - 1);
@@ -2050,9 +2108,10 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
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
@@ -2061,15 +2120,19 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
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
@@ -2085,21 +2148,26 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
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
 	if (!IS_ERR(mrec))
 		unmap_mft_record(mft_ni);
+
+out:
+	if (report_err)
+		ntfs_report_metadata_error(vol, report_err);
 	return ret;
 }
 

