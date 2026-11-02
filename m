Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605077;
	b=kS4m4295+Hk2KTLu81ldVAk0Hk8yvTvt+Ns1uT+hnKm5mRCr5JJueUT0Iyozm+wb34Q0
	 GPKmTioVhTgzz2iEIbit/6pL4dQRsY6iOTc5TA3nS8cDs+70C9D5YRbAYvdkx3sYH2d0r
	 NdStGrJlv2es0hyjKB+KR62mqsbP3D3lryqVYJoT5w9D0t51omHXbAkpfF9ssOmcC8JRU
	 +NJOmN+mEEtVkx5ALO5QAMGJSX+PvWdTF0878NKY7uRqOGP4OlZatc96zlT3pfwm7LzJB
	 EPbqCRz4xzWj1uMLugXaOAfqrgnzmOH9C0xOy9+eLx9NdElwe/C8YJ/hWUdN5WvXz6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605077;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=xll7feIfr0h0OH8feArFqtykvO+Ua78jbypypnIiWOY=;
	b=HIowU95uqhBda+h2BwEwVlwgDeL8vW/7UGH3joM9oEBQgHSMAtCguEYk82mTXQBq5bri
	 MPmwQYDxbzvaW+y4wGEW020hN2IdeORDbkQNMm+3k2Yi9i0nrY3fSK+vXWESQ49DGaA3B
	 +pr6g14EkvXZlgyU93bpTnZvMTQQZwVXOiLY+YTqTGXqInZpWzQzu3tlbf39KqipxU8OP
	 ER+8NCSvg6wxUBxcv+J2y5LSTCfb6gUJIUNE0hkOjNR39lQGz9RqOJ0u9pipJ1MfSKc3R
	 CfKvwa5/+kMy6EdRDEmLYsRgzZvoJQBZWFPdDTyTrGPA+qysVYmp26GTDNZMUtZJndQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EHU5KYw4;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA13606A324
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA13606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EHU5KYw4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=xl
	l7feIfr0h0OH8feArFqtykvO+Ua78jbypypnIiWOY=; b=EHU5KYw4p+Hs6wLf6P
	rrz0BZp9cRsKZ+OvTORqqnu4kXj0qz+c0b3DiuQTEaFREz8hh5cJUlqnndqm9Eqm
	Klwk8P6XMQW0NS2QDCXxe9PYchyVEAxvDeE6U4Uh6cXg11tUWfQ0ipmFzifjRm/i
	VRrPbLAcvIDwE/Q5JiuOxSm7Y=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3N9rIPehqahKgEw--.3981S4;
	Mon, 02 Nov 2026 15:37:46 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v5 18/31] ntfs: report inode metadata and eviction cleanup errors
Date: Mon,  2 Nov 2026 15:35:19 +0800
Message-Id: <20261102073532.98873-19-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3N9rIPehqahKgEw--.3981S4
X-Coremail-Antispam: 1Uf129KBjvAXoW3CF1rWw1xAryxJFy8WFyUZFb_yoW8Jw4xCo
	W3Ars0vwnYgw1Yy3yYk3WxAas8ZanrCws5Jr1rArsFkFn7X3yDJw4Sk3WUuay7u3yFgrn0
	qry8Ja1rJF4xAr98n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUczuAUUUUU
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzgpWP2roPcpHdwAA3o

From: Baolin Liu <liubaolin@kylinos.cn>

Report corrupt inode metadata, stale extent references and missing
required attributes as EFSCORRUPTED. During FILE_NAME synchronization,
report missing index entries. Also report unused parents unless the
child is being deleted. Retain best-effort parent lookup handling.

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
index 958c949009b9..5d1f724014e8 100644
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
 
@@ -2419,16 +2433,20 @@ static int ntfs_delete_base_inode(struct ntfs_inode *ni)
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
 
@@ -2459,9 +2477,11 @@ void ntfs_evict_big_inode(struct inode *vi)
 
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
@@ -2469,13 +2489,20 @@ void ntfs_evict_big_inode(struct inode *vi)
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
@@ -2764,11 +2791,15 @@ int ntfs_inode_sync_filename(struct ntfs_inode *ni)
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
@@ -2782,6 +2813,9 @@ int ntfs_inode_sync_filename(struct ntfs_inode *ni)
 
 		index_vi = ntfs_iget(sb, MREF_LE(fn->parent_directory));
 		if (IS_ERR(index_vi)) {
+			if (PTR_ERR(index_vi) == -ENOENT && !NInoBeingDeleted(ni))
+				ntfs_report_file_metadata_error(VFS_I(ni),
+								-EFSCORRUPTED);
 			ntfs_error(sb, "Failed to open inode %lld with index",
 					(long long)MREF_LE(fn->parent_directory));
 			continue;
@@ -2807,6 +2841,11 @@ int ntfs_inode_sync_filename(struct ntfs_inode *ni)
 
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
@@ -2877,7 +2916,8 @@ int ntfs_get_block_mft_record(struct ntfs_inode *mft_ni, struct ntfs_inode *ni)
 	rl = mft_ni->runlist.rl;
 	if (!rl) {
 		ntfs_error(mft_ni->vol->sb, "$MFT runlist is not present");
-		return -EIO;
+		ntfs_report_metadata_error(mft_ni->vol, -EFSCORRUPTED);
+		return -EFSCORRUPTED;
 	}
 
 	/* Seek to element containing target vcn. */
@@ -2959,8 +2999,11 @@ int __ntfs_write_inode(struct inode *vi, int sync)
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
@@ -2978,8 +3021,10 @@ int __ntfs_write_inode(struct inode *vi, int sync)
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
@@ -2997,6 +3042,7 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 			err = ntfs_get_block_mft_record(mft_ni,
 						   ni->ext.extent_ntfs_inos[i]);
 			if (err) {
+				err = -EFSCORRUPTED;
 				mutex_unlock(&ni->extent_lock);
 				up_read(&mft_ni->runlist.lock);
 				mutex_unlock(&ni->mrec_lock);
@@ -3058,7 +3104,10 @@ int __ntfs_write_inode(struct inode *vi, int sync)
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
@@ -3127,8 +3176,10 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
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
@@ -3191,8 +3242,9 @@ int ntfs_inode_attach_all_extents(struct ntfs_inode *ni)
 		return 0;
 
 	if (!ni->attr_list) {
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
 		ntfs_debug("Corrupt in-memory struct.\n");
-		return -EINVAL;
+		return -EFSCORRUPTED;
 	}
 
 	/* Walk through attribute list and attach all extents. */
@@ -3769,6 +3821,11 @@ s64 ntfs_inode_attr_pread(struct inode *vi, s64 pos, s64 count, u8 *buf)
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
@@ -3844,6 +3901,11 @@ static inline int ntfs_enlarge_attribute(struct inode *vi, s64 pos, s64 count,
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
@@ -4094,6 +4156,10 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
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

