Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486012;
	b=idDce40G71ePGkr/7YOnoTX9ODAI9gvuVgflFUaFhEqhqN3RSNaR150p+CehRzgtVMcu
	 B6dDhTqZgqK/+dXEAbtpQsRjD5BMM9/ysrqBG+/8Qs7l252JPmOP/z8MWIMoZ3AP1gPg7
	 AgE1wnC4RgkPRWJiB2QXzrPsWB/c4MsNkdY3N95uIJetGXOwYFXQCl2FsPYZmdEudaetK
	 ciC8lsvjGJEXU522ylrvtRK5Apt/kCq36W264hu+GPiE8arlQP2T3d1tCeKdcQVxZFnl1
	 0Eh2QxtxyJ0FY6dcgtgcxf7mN1+bDdSTEDd0fxQbDK/ozCzAN27GfT3F2biucjX/CUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486012;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=hbOFKnFjUCtgqOD11D6jHJkwiuvo3qg3ScBJZhcrXj0=;
	b=KatZKItcc2Yn6DCt+dLqEUSxDAJRkMcVNhUQYyDs5sE20qWooKQ2m8f2HtHLVX97x7TX
	 sZwQyfCVK+FcuHJQWh32tf03HaifngdNfXbfAV+tutxQT3YIW7xkB1JAGj0NRqxtOHwF1
	 k2t5w4aX8YGIkO24OBhgP2fPZLInDDMJFna0a4pBJhg+UnKZAH5zw4pdtgfrmoJnloZVq
	 /MFvvyzpsLDMSmpgLLvITzuWmU2Ke8uX4+HH2LIcCR/dvoK84CrVus41UWQrFX6wvZhzx
	 lCNSte2PswjN9bMsL/LR4tOJFh74L540sWST88hIcziTI2ire4mFpgI1cOkBiqlfcow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=LAIE3vLO;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F339606A31F
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F339606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=LAIE3vLO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hb
	OFKnFjUCtgqOD11D6jHJkwiuvo3qg3ScBJZhcrXj0=; b=LAIE3vLObWTlsq5onp
	LhyvMtEnCVEMTxtLq+C2M8pqTgkZYklYZ3ZtXCheeCEJ8MmEn8yhcKOr1MX6xw3l
	S1bMVMbBIBdcOePs0uX52ZA1xgxrAx+nRFGdVWOmpWI7iHXcxPt/bRLo3eHjHudD
	wPatOgbIlAfW9Sx6s1Y9meEYs=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3X_tvKtdqGocHBg--.23211S4;
	Tue, 20 Oct 2026 16:46:42 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 18/31] ntfs: report inode metadata and eviction cleanup errors
Date: Tue, 20 Oct 2026 16:44:08 +0800
Message-ID: <20261020084421.2196486-19-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3X_tvKtdqGocHBg--.23211S4
X-Coremail-Antispam: 1Uf129KBjvAXoW3CF1rWw1xAryxJFy8GF1xZrb_yoW8Jw4xCo
	W3Ars0vwnYgw1Yy3yYk3WxAas8ZanrCws5JryrArsFkFn2q3ykJw4Sk3W7uay7u3yFgrn0
	qry8Ja1rJF4xAr98n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVPEfUUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RI3AmrXKnJnxgAA3K

From: Baolin Liu <liubaolin@kylinos.cn>

Report corrupt inode metadata, stale extent references and missing
required attributes as EFSCORRUPTED. During FILE_NAME synchronization,
report missing index entries and unused parents unless the child is
being deleted. Retain best-effort parent lookup handling.

Use volume reports for deletion and eviction cleanup. Report failed
attribute walks even on ENOMEM or interruption: deletion still frees the
MFT records and may leave unvisited allocations behind.

At eviction, report dirty base records that the final write failed to
save, using its errno or EIO if none was returned. Also report discarded
dirty runlists and extent records. Normal writeback keeps its ENOMEM
retry behavior; after SB_ACTIVE is cleared, only volume state is updated.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/inode.c | 126 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 96 insertions(+), 30 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 83d45383a5d6..0e67078552cb 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -372,8 +372,10 @@ static int ntfs_non_resident_dealloc_clusters(struct ntfs_inode *ni)
 	int err = 0;
 
 	actx = ntfs_attr_get_search_ctx(ni, NULL);
-	if (IS_ERR(actx))
+	if (IS_ERR(actx)) {
+		ntfs_report_metadata_error(ni->vol, PTR_ERR(actx));
 		return PTR_ERR(actx);
+	}
 	WARN_ON(actx->mrec->link_count != 0);
 
 	/**
@@ -383,9 +385,11 @@ static int ntfs_non_resident_dealloc_clusters(struct ntfs_inode *ni)
 	 */
 	if (NInoRunlistDirty(ni)) {
 		err = ntfs_cluster_free_from_rl(ni->vol, ni->runlist.rl);
-		if (err)
+		if (err) {
+			ntfs_report_metadata_error(ni->vol, err);
 			ntfs_error(sb,
 					"Failed to free clusters. Leaving inconsistent metadata.\n");
+		}
 	}
 
 	while ((err = ntfs_attrs_walk(actx)) == 0) {
@@ -398,19 +402,27 @@ static int ntfs_non_resident_dealloc_clusters(struct ntfs_inode *ni)
 					&new_rl_count);
 			if (IS_ERR(rl)) {
 				err = PTR_ERR(rl);
+				ntfs_report_metadata_error(ni->vol,
+							   err == -ENOMEM ? err : -EFSCORRUPTED);
 				ntfs_error(sb,
 					   "Failed to decompress runlist. Leaving inconsistent metadata.\n");
 				continue;
 			}
 
 			err = ntfs_cluster_free_from_rl(ni->vol, rl);
-			if (err)
+			if (err) {
+				ntfs_report_metadata_error(ni->vol, err);
 				ntfs_error(sb,
 					   "Failed to free attribute clusters. Leaving inconsistent metadata.\n");
+			}
 			kvfree(rl);
 		}
 	}
 
+	/* The caller frees the MFT records even if enumeration was interrupted. */
+	if (err == -ENOMEM || err == -EINTR || err == -ERESTARTSYS)
+		ntfs_report_metadata_error(ni->vol, err);
+
 	ntfs_release_dirty_clusters(ni->vol, ni->i_dealloc_clusters);
 	ntfs_attr_put_search_ctx(actx);
 	return err;
@@ -608,22 +620,22 @@ static int ntfs_is_extended_system_file(struct ntfs_attr_search_ctx *ctx)
 err_corrupt_attr:
 			ntfs_error(ctx->ntfs_ino->vol->sb,
 					"Corrupt file name attribute. You should run chkdsk.");
-			return -EIO;
+			return -EFSCORRUPTED;
 		}
 		if (attr->non_resident) {
 			ntfs_error(ctx->ntfs_ino->vol->sb,
 					"Non-resident file name. You should run chkdsk.");
-			return -EIO;
+			return -EFSCORRUPTED;
 		}
 		if (attr->flags) {
 			ntfs_error(ctx->ntfs_ino->vol->sb,
 					"File name with invalid flags. You should run chkdsk.");
-			return -EIO;
+			return -EFSCORRUPTED;
 		}
 		if (!(attr->data.resident.flags & RESIDENT_ATTR_IS_INDEXED)) {
 			ntfs_error(ctx->ntfs_ino->vol->sb,
 					"Unindexed file name. You should run chkdsk.");
-			return -EIO;
+			return -EFSCORRUPTED;
 		}
 		file_name_attr = (struct file_name_attr *)((u8 *)attr +
 				le16_to_cpu(attr->data.resident.value_offset));
@@ -656,7 +668,7 @@ static int ntfs_is_extended_system_file(struct ntfs_attr_search_ctx *ctx)
 	if (unlikely(nr_links)) {
 		ntfs_error(ctx->ntfs_ino->vol->sb,
 			"Inode hard link count doesn't match number of name attributes. You should run chkdsk.");
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 	return 0;	/* NO, it is not an extended system file. */
 }
@@ -1317,8 +1329,8 @@ static int ntfs_read_locked_inode(struct inode *vi)
 	ntfs_debug("Done.");
 	return 0;
 unm_err_out:
-	if (!err)
-		err = -EIO;
+	if (!err || (err == -ENOENT && vol_err))
+		err = -EFSCORRUPTED;
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 	if (m)
@@ -1329,7 +1341,7 @@ static int ntfs_read_locked_inode(struct inode *vi)
 		ntfs_error(vol->sb,
 			"Failed with error code %i.  Marking corrupt inode 0x%llx as bad.  Run chkdsk.",
 			err, ni->mft_no);
-		NVolSetErrors(vol);
+		ntfs_report_file_metadata_error(vi, err);
 	}
 	return err;
 }
@@ -1576,7 +1588,7 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
 
 unm_err_out:
 	if (!err)
-		err = -EIO;
+		err = -EFSCORRUPTED;
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 	unmap_mft_record(base_ni);
@@ -1586,9 +1598,9 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
 			"Failed with error code %i while reading attribute inode (mft_no 0x%llx, type 0x%x, name_len %i).  Marking corrupt inode and base inode 0x%llx as bad.  Run chkdsk.",
 			err, ni->mft_no, ni->type, ni->name_len,
 			base_ni->mft_no);
-	if (err != -ENOENT && err != -ENOMEM &&
+	if (err != -ENOENT && err != -ENOMEM && err != -EOPNOTSUPP &&
 	    err != -EINTR && err != -ERESTARTSYS)
-		NVolSetErrors(vol);
+		ntfs_report_file_metadata_error(base_vi, err);
 	return err;
 }
 
@@ -1823,8 +1835,10 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 	 * Make sure the base inode doesn't go away and attach it to the
 	 * index inode.
 	 */
-	if (!igrab(base_vi))
+	if (!igrab(base_vi)) {
+		err = -EIO;
 		goto unm_err_out;
+	}
 	ni->ext.base_ntfs_ino = base_ni;
 	ni->nr_extents = -1;
 
@@ -1833,8 +1847,8 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 iput_unm_err_out:
 	iput(bvi);
 unm_err_out:
-	if (!err)
-		err = -EIO;
+	if (!err || err == -ENOENT)
+		err = -EFSCORRUPTED;
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 	if (m)
@@ -1846,7 +1860,7 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 			err, ni->mft_no, ni->name_len);
 	if (err != -EOPNOTSUPP && err != -ENOMEM &&
 	    err != -EINTR && err != -ERESTARTSYS)
-		NVolSetErrors(vol);
+		ntfs_report_file_metadata_error(base_vi, err);
 	return err;
 }
 
@@ -2428,16 +2442,20 @@ static int ntfs_delete_base_inode(struct ntfs_inode *ni)
 	 */
 	while (ni->nr_extents) {
 		err = ntfs_mft_record_free(ni->vol, *(ni->ext.extent_ntfs_inos));
-		if (err)
+		if (err) {
+			ntfs_report_metadata_error(ni->vol, err);
 			ntfs_error(sb,
 				"Failed to free extent MFT record. Leaving inconsistent metadata.\n");
+		}
 		ntfs_inode_close(*(ni->ext.extent_ntfs_inos));
 	}
 
 	/* Deallocate base mft record */
 	err = ntfs_mft_record_free(ni->vol, ni);
-	if (err)
+	if (err) {
+		ntfs_report_metadata_error(ni->vol, err);
 		ntfs_error(sb, "Failed to free base MFT record. Leaving inconsistent metadata.\n");
+	}
 	return err;
 }
 
@@ -2468,9 +2486,11 @@ void ntfs_evict_big_inode(struct inode *vi)
 
 	if (NInoDirty(ni)) {
 		/* Committing the inode also commits all extent inodes. */
-		ntfs_commit_inode(vi);
+		int err = __ntfs_write_inode(vi, 1);
 
 		if (NInoDirty(ni)) {
+			/* Eviction discards the dirty record, so it cannot be retried. */
+			ntfs_report_metadata_error(ni->vol, err ? err : -EIO);
 			ntfs_debug("Failed to commit dirty inode 0x%llx.  Losing data!",
 				   ni->mft_no);
 			NInoClearAttrListDirty(ni);
@@ -2478,13 +2498,20 @@ void ntfs_evict_big_inode(struct inode *vi)
 		}
 	}
 
+	/* A deferred mapping update can outlive the base record's dirty bit. */
+	if (NInoRunlistDirty(ni))
+		ntfs_report_metadata_error(ni->vol, -EIO);
+
 	/* No need to lock at this stage as no one else has a reference. */
 	if (ni->nr_extents > 0) {
 		int i;
 
 		for (i = 0; i < ni->nr_extents; i++) {
-			if (ni->ext.extent_ntfs_inos[i])
+			if (ni->ext.extent_ntfs_inos[i]) {
+				if (NInoDirty(ni->ext.extent_ntfs_inos[i]))
+					ntfs_report_metadata_error(ni->vol, -EIO);
 				ntfs_clear_extent_inode(ni->ext.extent_ntfs_inos[i]);
+			}
 		}
 		ni->nr_extents = 0;
 		kvfree(ni->ext.extent_ntfs_inos);
@@ -2773,11 +2800,15 @@ int ntfs_inode_sync_filename(struct ntfs_inode *ni)
 	/* Collect the reparse tag, if any */
 	reparse_tag = cpu_to_le32(0);
 	if (ni->flags & FILE_ATTR_REPARSE_POINT) {
-		if (!ntfs_attr_lookup(AT_REPARSE_POINT, NULL,
-					0, CASE_SENSITIVE, 0, NULL, 0, ctx)) {
+		err = ntfs_attr_lookup(AT_REPARSE_POINT, NULL, 0,
+				       CASE_SENSITIVE, 0, NULL, 0, ctx);
+		if (!err) {
 			rpp = (struct reparse_point *)((u8 *)ctx->attr +
 					le16_to_cpu(ctx->attr->data.resident.value_offset));
 			reparse_tag = rpp->reparse_tag;
+		} else if (err == -ENOENT) {
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
 		}
 		ntfs_attr_reinit_search_ctx(ctx);
 	}
@@ -2791,6 +2822,9 @@ int ntfs_inode_sync_filename(struct ntfs_inode *ni)
 
 		index_vi = ntfs_iget(sb, MREF_LE(fn->parent_directory));
 		if (IS_ERR(index_vi)) {
+			if (PTR_ERR(index_vi) == -ENOENT && !NInoBeingDeleted(ni))
+				ntfs_report_file_metadata_error(VFS_I(ni),
+								-EFSCORRUPTED);
 			ntfs_error(sb, "Failed to open inode %lld with index",
 					(long long)MREF_LE(fn->parent_directory));
 			continue;
@@ -2816,6 +2850,11 @@ int ntfs_inode_sync_filename(struct ntfs_inode *ni)
 
 		err = ntfs_index_lookup(fn, sizeof(struct file_name_attr), ictx);
 		if (err) {
+			if (err == -ENOENT) {
+				err = -EFSCORRUPTED;
+				ntfs_report_file_metadata_error(index_vi,
+								-EFSCORRUPTED);
+			}
 			ntfs_debug("Index lookup failed, inode %llu",
 					index_ni->mft_no);
 			ntfs_index_ctx_put(ictx);
@@ -2886,7 +2925,8 @@ int ntfs_get_block_mft_record(struct ntfs_inode *mft_ni, struct ntfs_inode *ni)
 	rl = mft_ni->runlist.rl;
 	if (!rl) {
 		ntfs_error(mft_ni->vol->sb, "$MFT runlist is not present");
-		return -EIO;
+		ntfs_report_metadata_error(mft_ni->vol, -EFSCORRUPTED);
+		return -EFSCORRUPTED;
 	}
 
 	/* Seek to element containing target vcn. */
@@ -2968,8 +3008,11 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 	}
 
 	err = ntfs_inode_sync_standard_information(vi, m);
-	if (err)
+	if (err) {
+		if (err == -ENOENT)
+			err = -EFSCORRUPTED;
 		goto unm_err_out;
+	}
 
 	/*
 	 * when being umounted and inodes are evicted, write_inode()
@@ -2987,8 +3030,10 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 		down_read(&mft_ni->runlist.lock);
 		err = ntfs_get_block_mft_record(mft_ni, ni);
 		up_read(&mft_ni->runlist.lock);
-		if (err)
+		if (err) {
+			err = -EFSCORRUPTED;
 			goto unm_err_out;
+		}
 
 		err = write_mft_record(ni, m, sync);
 		if (err)
@@ -3006,6 +3051,7 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 			err = ntfs_get_block_mft_record(mft_ni,
 						   ni->ext.extent_ntfs_inos[i]);
 			if (err) {
+				err = -EFSCORRUPTED;
 				mutex_unlock(&ni->extent_lock);
 				up_read(&mft_ni->runlist.lock);
 				mutex_unlock(&ni->mrec_lock);
@@ -3067,7 +3113,10 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 		mark_inode_dirty(vi);
 	else {
 		ntfs_error(vi->i_sb, "Failed (error %i):  Run chkdsk.", -err);
-		NVolSetErrors(ni->vol);
+		if (err != -EINTR && err != -ERESTARTSYS)
+			ntfs_report_file_metadata_error(vi, err);
+		else
+			NVolSetErrors(ni->vol);
 	}
 	if (need_iput)
 		iput(vi);
@@ -3136,8 +3185,10 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
 			    seq_no != le16_to_cpu(ni_mrec->sequence_number)) {
 				ntfs_error(sb, "Found stale extent mft reference mft=%llu",
 						ni->mft_no);
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								-EFSCORRUPTED);
 				unmap_mft_record(ni);
-				return ERR_PTR(-EIO);
+				return ERR_PTR(-EFSCORRUPTED);
 			}
 			unmap_mft_record(ni);
 			goto out;
@@ -3200,8 +3251,9 @@ int ntfs_inode_attach_all_extents(struct ntfs_inode *ni)
 		return 0;
 
 	if (!ni->attr_list) {
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
 		ntfs_debug("Corrupt in-memory struct.\n");
-		return -EINVAL;
+		return -EFSCORRUPTED;
 	}
 
 	/* Walk through attribute list and attach all extents. */
@@ -3778,6 +3830,11 @@ s64 ntfs_inode_attr_pread(struct inode *vi, s64 pos, s64 count, u8 *buf)
 				       CASE_SENSITIVE,
 				       0, NULL, 0, ctx);
 		if (err) {
+			if (err == -ENOENT && !ntfs_inode_is_named_stream(ni)) {
+				err = -EFSCORRUPTED;
+				ntfs_report_file_metadata_error(vi,
+								-EFSCORRUPTED);
+			}
 			ntfs_error(vi->i_sb, "Failed to look up attr %#x", ni->type);
 			ntfs_attr_put_search_ctx(ctx);
 			mutex_unlock(&mrec_ni->mrec_lock);
@@ -3853,6 +3910,11 @@ static inline int ntfs_enlarge_attribute(struct inode *vi, s64 pos, s64 count,
 				       CASE_SENSITIVE,
 				       0, NULL, 0, ctx);
 		if (ret) {
+			if (ret == -ENOENT) {
+				ret = -EFSCORRUPTED;
+				ntfs_report_file_metadata_error(vi,
+								-EFSCORRUPTED);
+			}
 			ntfs_error(sb, "Failed to look up attr %#x", ni->type);
 			return ret;
 		}
@@ -4103,6 +4165,10 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
 			       CASE_SENSITIVE,
 			       0, NULL, 0, ctx);
 	if (ret) {
+		if (ret == -ENOENT && !ntfs_inode_is_named_stream(ni)) {
+			ret = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(vi, -EFSCORRUPTED);
+		}
 		ntfs_attr_put_search_ctx(ctx);
 		ntfs_error(vi->i_sb, "Failed to look up attr %#x", ni->type);
 		goto out_unlock;
-- 
2.51.0

