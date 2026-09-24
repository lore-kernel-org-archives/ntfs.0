Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A983C73CC
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 09:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240492; cv=none; b=GFMXCUYnTpD7dSI2CWQhD+eNBhJIeKKLufgD67369aFPVIvSwJmJmtEYa6uFUQe4lAwox2KY4ZYBoCMwH+vMu3/PqjC9r81Iy2qle3rEqQGowo6y+fifQlhJerfrQDJExQmnn+dKdHKbebg+q9zeDcKoWvHZVjdljPBxjbM+aoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240492; c=relaxed/simple;
	bh=URnx+KRu+EBokNvm0JYAZE5u8FlO6vN1AwaGb3rIO60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ljSKIBk1ARQGB36IyL0wxF7anWtHAmr5FDZxwV/YLljCEcYJDXDVaOyV/FerjZbX30yrCJTPV3fgTnRIw3Z767+IdorffoN0pfuDszpm0ZnLSPV34ni/3fGRtLsRVVVhih1t9gzKBnEktgXVHq9wgPSPiUIrlQKajCy5WqIh988=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mmtswZig; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mmtswZig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pd
	6oZG92vv/3ivhx7v3ox5s2RlQW7KTGSNXZ1YwA9lQ=; b=mmtswZigk9gJnKqDai
	wljRQVyJ4rEB6mB8oBwhzUQxYDkUhOdCDLcYsmBsW5B9qFcm/hP80I0gH7tsH5m4
	HoBBgkXUExW+txHAEGCZoy9gzNYf4ELM2GlNp5nCz/jJatzRQFuipnRpIOl+h9Ff
	AMSRB3QTfr2oiGGp0oW8fB5bo=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3H73Q5rRqL6EhAg--.34883S4;
	Thu, 24 Sep 2026 17:01:11 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v3 2/6] ntfs: report attribute errors to fsnotify
Date: Thu, 24 Sep 2026 17:00:58 +0800
Message-ID: <20260924090102.2865942-3-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3H73Q5rRqL6EhAg--.34883S4
X-Coremail-Antispam: 1Uf129KBjvAXoW3ZrWkJw1kur4rJFykur48WFg_yoW8JrWDWo
	ZIya1j9w4kKr1Yy3y09wn8tas8uan8GrZ8JFW5Jrnrur9Fqw4DGw1xG3W3Wayxu3yFgr1q
	grykt395AFs7try5n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3CzuDUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Re2gWq05tf2kQAA3B

From: Baolin Liu <liubaolin@kylinos.cn>

Attribute corruption and failed allocation rollbacks can leave files
unusable or their metadata inconsistent without notifying health monitors.

Add a file-level reporting helper and notify fsnotify when attribute
validation fails or a rollback cannot release clusters or restore mapping
pairs. Keep the original operation's return value separate from the
rollback error reported to userspace.

Report rollback failures independently of earlier lookup or mapping
errors. Leave event merging to fanotify instead of carrying reporting
state through search contexts and mapping-pairs updates.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/attrib.c   | 84 ++++++++++++++++++++++++++++++++--------------
 fs/ntfs/attrlist.c | 17 ++++++----
 fs/ntfs/bitmap.c   |  2 +-
 fs/ntfs/super.c    | 12 +++++++
 fs/ntfs/volume.h   |  1 +
 5 files changed, 84 insertions(+), 32 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 333b3371acb4..10b7f9b7c051 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -838,6 +838,7 @@ static int ntfs_attr_find(const __le32 type, const __le16 *name,
 		const u8 *val, const u32 val_len, struct ntfs_attr_search_ctx *ctx)
 {
 	struct attr_record *a;
+	struct ntfs_inode *base_ni;
 	struct ntfs_volume *vol = ctx->ntfs_ino->vol;
 	__le16 *upcase = vol->upcase;
 	u32 upcase_len = vol->upcase_len;
@@ -964,7 +965,11 @@ static int ntfs_attr_find(const __le32 type, const __le16 *name,
 	}
 	ntfs_error(vol->sb, "mft %#llx, type %#x is corrupt. Run chkdsk.",
 		   (long long)ctx->ntfs_ino->mft_no, le32_to_cpu(type));
-	NVolSetErrors(vol);
+	if (ctx->ntfs_ino->nr_extents >= 0)
+		base_ni = ctx->ntfs_ino;
+	else
+		base_ni = ctx->ntfs_ino->ext.base_ntfs_ino;
+	ntfs_report_file_metadata_error(VFS_I(base_ni), -EIO);
 	return -EIO;
 }
 
@@ -1501,8 +1506,12 @@ static int ntfs_external_attr_find(const __le32 type,
 		err = -EIO;
 	}
 
-	if (err != -ENOMEM)
-		NVolSetErrors(vol);
+	if (err != -ENOMEM) {
+		if (err != -EINTR && err != -ERESTARTSYS)
+			ntfs_report_file_metadata_error(VFS_I(base_ni), err);
+		else
+			NVolSetErrors(vol);
+	}
 	return err;
 not_found:
 	/*
@@ -2233,10 +2242,11 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
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
@@ -3728,6 +3738,7 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 	struct attr_record *a;
 	s64 stop_vcn;
 	int err = 0, mp_size, cur_max_mp_size, exp_max_mp_size;
+	int rollback_err;
 	bool finished_build;
 	bool first_updated = false;
 	struct super_block *sb;
@@ -4016,10 +4027,14 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 		m = map_mft_record(ext_ni);
 		if (IS_ERR(m)) {
 			ntfs_error(sb, "Could not map new MFT record");
-			if (ntfs_mft_record_free(ni->vol, ext_ni))
+			rollback_err = ntfs_mft_record_free(ni->vol, ext_ni);
+			if (rollback_err) {
 				ntfs_error(sb, "Could not free MFT record");
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								rollback_err);
+			}
 			ntfs_inode_close(ext_ni);
-			err = -ENOMEM;
+			err = PTR_ERR(m);
 			ext_ni = NULL;
 			goto put_err_out;
 		}
@@ -4053,8 +4068,12 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 		if (err < 0) {
 			ntfs_error(sb, "Could not add attribute extent");
 			unmap_mft_record(ext_ni);
-			if (ntfs_mft_record_free(ni->vol, ext_ni))
+			rollback_err = ntfs_mft_record_free(ni->vol, ext_ni);
+			if (rollback_err) {
 				ntfs_error(sb, "Could not free MFT record");
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								rollback_err);
+			}
 			ntfs_inode_close(ext_ni);
 			goto put_err_out;
 		}
@@ -4067,8 +4086,12 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 		if (err < 0 && err != -ENOSPC) {
 			ntfs_error(sb, "Failed to build MP");
 			unmap_mft_record(ext_ni);
-			if (ntfs_mft_record_free(ni->vol, ext_ni))
+			rollback_err = ntfs_mft_record_free(ni->vol, ext_ni);
+			if (rollback_err) {
 				ntfs_error(sb, "Couldn't free MFT record");
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								rollback_err);
+			}
 			goto put_err_out;
 		}
 		a->data.non_resident.highest_vcn = cpu_to_le64(stop_vcn - 1);
@@ -4449,6 +4472,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	struct ntfs_attr_search_ctx *ctx = NULL;
 	struct runlist_element *rl, *rln;
 	s64 org_alloc_size, org_compressed_size;
+	s64 freed;
 	int err, err2;
 	struct ntfs_inode *base_ni;
 	struct super_block *sb = ni->vol->sb;
@@ -4678,10 +4702,12 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	return 0;
 rollback:
 	/* Free allocated clusters. */
-	err2 = ntfs_cluster_free(ni, ntfs_bytes_to_cluster(vol, org_alloc_size),
-				-1, ctx);
-	if (err2)
+	freed = ntfs_cluster_free(ni, ntfs_bytes_to_cluster(vol, org_alloc_size),
+				  -1, ctx);
+	if (freed < 0) {
 		ntfs_debug("Leaking clusters");
+		ntfs_report_file_metadata_error(VFS_I(base_ni), freed);
+	}
 
 	/* Now, truncate the runlist itself. */
 	if (ni != locked_ni)
@@ -4698,14 +4724,18 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		kvfree(ni->runlist.rl);
 		ni->runlist.rl = NULL;
 		ntfs_error(sb, "Couldn't truncate runlist. Rollback failed");
+		ntfs_report_file_metadata_error(VFS_I(base_ni), err2);
 	} else {
 		/* Prepare to mapping pairs update. */
 		ni->allocated_size = org_alloc_size;
 		/* Restore mapping pairs. */
 		if (ni != locked_ni)
 			down_read(&ni->runlist.lock);
-		if (__ntfs_attr_update_mapping_pairs(ni, 0, locked_ni, true))
+		err2 = __ntfs_attr_update_mapping_pairs(ni, 0, locked_ni, true);
+		if (err2) {
 			ntfs_error(sb, "Failed to restore old mapping pairs");
+			ntfs_report_file_metadata_error(VFS_I(base_ni), err2);
+		}
 		if (ni != locked_ni)
 			up_read(&ni->runlist.lock);
 
@@ -5139,8 +5169,9 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 	struct runlist_element *rl, *rlc;
 	struct runlist_element *old_rl = NULL;
 	s64 vcn = vcn_start, lcn, clu_count;
+	s64 freed;
 	s64 lcn_seek_from = -1;
-	int err = 0;
+	int err = 0, err2;
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
@@ -5252,8 +5284,11 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 	if (IS_ERR(rl)) {
 		ntfs_error(vol->sb, "Failed to merge runlists");
 		err = PTR_ERR(rl);
-		if (ntfs_cluster_free_from_rl(vol, rlc))
+		err2 = ntfs_cluster_free_from_rl(vol, rlc);
+		if (err2) {
 			ntfs_error(vol->sb, "Failed to free hot clusters.");
+			ntfs_report_file_metadata_error(VFS_I(ni), err2);
+		}
 		kvfree(rlc);
 		goto out;
 	}
@@ -5272,13 +5307,12 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 		ntfs_attr_reinit_search_ctx(ctx);
 		err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 		if (err) {
-			int err2;
-
-			err2 = ntfs_cluster_free(ni, vcn, clu_count, ctx);
-			if (err2 < 0 || err2 != clu_count) {
+			freed = ntfs_cluster_free(ni, vcn, clu_count, ctx);
+			if (freed < 0 || freed != clu_count) {
 				ntfs_error(vol->sb,
 					   "Failed to free cluster allocation. Leaving inconsistent metadata.\n");
-				NVolSetErrors(vol);
+				err2 = freed < 0 ? freed : -EIO;
+				ntfs_report_file_metadata_error(VFS_I(ni), err2);
 				goto out;
 			}
 
@@ -5290,11 +5324,11 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 			ni->runlist.rl = old_rl;
 			ni->runlist.count = old_rl_count;
 			old_rl = NULL;
-			if (ntfs_attr_update_mapping_pairs_locked(
-					ni, 0, ni)) {
+			err2 = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
+			if (err2) {
 				ntfs_error(vol->sb,
 					   "Failed to restore mapping pairs after allocation rollback.\n");
-				NVolSetErrors(vol);
+				ntfs_report_file_metadata_error(VFS_I(ni), err2);
 			}
 		}
 	} else {
diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
index 1bbd2bc62c58..3c36e849a8ab 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -76,7 +76,7 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 	s64 old_alloc_size;
 	size_t old_rl_count, new_rl_count;
 	unsigned long flags;
-	int err, restore_err;
+	int err, free_err, restore_err;
 	if (attr_ni->mft_no != FILE_MFT || !NInoNonResident(attr_ni) ||
 		min_alloc_size < 0)
 		return -EINVAL;
@@ -127,7 +127,9 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 		new_rl_count = 2;
 
 	if (new_rl_count != 2) {
-		ntfs_cluster_free_from_rl(vol, new_rl);
+		free_err = ntfs_cluster_free_from_rl(vol, new_rl);
+		if (free_err)
+			ntfs_report_file_metadata_error(attr_vi, free_err);
 		kvfree(new_rl);
 		err = -ENOSPC;
 		goto out_free_data;
@@ -157,11 +159,12 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
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
@@ -182,10 +185,12 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 	if (restore_err) {
 		ntfs_error(vol->sb, "Failed to restore ATTRIBUTE_LIST mapping pairs (%d)",
 			   restore_err);
-		NVolSetErrors(vol);
+		ntfs_report_file_metadata_error(attr_vi, restore_err);
 	}
 
-	ntfs_cluster_free_from_rl(vol, new_rl);
+	free_err = ntfs_cluster_free_from_rl(vol, new_rl);
+	if (free_err)
+		ntfs_report_file_metadata_error(attr_vi, free_err);
 	kvfree(new_rl);
 	err = err ? err : restore_err;
 
diff --git a/fs/ntfs/bitmap.c b/fs/ntfs/bitmap.c
index 912fdcca8e01..54efcb054d0a 100644
--- a/fs/ntfs/bitmap.c
+++ b/fs/ntfs/bitmap.c
@@ -287,7 +287,7 @@ int __ntfs_bitmap_set_bits_in_run(struct inode *vi, const s64 start_bit,
 		ntfs_error(vi->i_sb,
 			"Failed to map subsequent page (error %i) and rollback failed (error %i). Aborting and leaving inconsistent metadata. Unmount and run chkdsk.",
 			err, pos);
-		NVolSetErrors(NTFS_SB(vi->i_sb));
+		ntfs_report_file_metadata_error(vi, pos);
 	}
 	return err;
 }
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 827313df0e28..a7a7ecf9d074 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -402,6 +402,18 @@ void ntfs_report_metadata_error(struct ntfs_volume *vol, int error)
 		fserror_report_metadata(vol->sb, error, GFP_ATOMIC);
 }
 
+void ntfs_report_file_metadata_error(struct inode *inode, int error)
+{
+	struct ntfs_inode *ni = NTFS_I(inode);
+
+	/* Attribute inodes share the file handle of their base inode. */
+	if (NInoAttr(ni))
+		inode = VFS_I(ni->ext.base_ntfs_ino);
+	NVolSetErrors(NTFS_SB(inode->i_sb));
+	if (inode->i_sb->s_flags & SB_ACTIVE)
+		fserror_report_file_metadata(inode, error, GFP_ATOMIC);
+}
+
 void ntfs_handle_error(struct super_block *sb)
 {
 	struct ntfs_volume *vol = NTFS_SB(sb);
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index 5bcd0dd2a19d..366e9f5d0443 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -255,6 +255,7 @@ DEFINE_NVOL_BIT_OPS(NativeSymlinkRel)
 DEFINE_NVOL_BIT_OPS(SymlinkNative)
 
 void ntfs_report_metadata_error(struct ntfs_volume *vol, int error);
+void ntfs_report_file_metadata_error(struct inode *inode, int error);
 
 static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 nr)
 {
-- 
2.51.0

