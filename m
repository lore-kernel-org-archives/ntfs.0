Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604950;
	b=nCfnTLwzkBjFRMMPvzJC9/hStaWKLYeuz0aKROuAgPCMXOv/++KEQAKB8GyHwM7ROevf
	 m6cR0obR4gG0pKXF85fFkh8w/yP+rDlIs7K3bOjV9BbpUDK60jdrFrHgnFh3hm6PQGus1
	 LJ4B56DI9lDD3VDgKZcKb+klDvWIzyDXW8DaoPF8zaD8UgZydXllD7JwSwiyqdYs4862L
	 E/P6C062d/Re5jJCWVyjqMhxrtfQ8bYiIYDqHmX+bb7j5to3/azGvFnREVbLo4+T0kw2w
	 ty7hgvE7sE1EBYnlJ3k5d8eID7orzqeNG4e2lMtUhvrj1+omOhxJD1Q1KQOTYpAY50w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604950;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=y3mENgwKhSSG21SY4LaZZ9btVNNNXA1Fr6B47VJtfdk=;
	b=dEIQ3C13WdtzwXGMIAhPYZBZJJGs8R1qQk7/MUvrJ6I201dEdaveg6P3wCJA6vGWZzgj
	 WEC6ZIwOycyerNXTNY6etBn1Z+J41d5ilqWCpQq1gawr08Sbaj0uGHdVcAxpyClAxqFiQ
	 52e5zKhgd8Erxlf/7pmS8Xlav1dBqDtD1lkNFW78JEVBjFcRiLPu11S6i8/LoFBd1vTe+
	 We/q8TDJszV1EA0929ZgBAFkiJhZsq3X0C59pjh2IEdCYP7yvg3m0MMWTcKufpQ26vXxT
	 /UqLqo94BQHEY+h8vsQKe0J4nERzS8RdDzdA07FjmQdUBT4syH+GYtJish2B6rHeg1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=IP9SRXtt;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02013606A327
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02013606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=IP9SRXtt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=y3
	mENgwKhSSG21SY4LaZZ9btVNNNXA1Fr6B47VJtfdk=; b=IP9SRXtt5FJhy63HN+
	vWHRhZbnsVJOKkenWTmIfE4R/fnpGPxcGwgwVuh7O9FmAqXCMnlqJbhEtbmK1iJ6
	/h2HfQGQdnKMy+vmZy0I/efUl3IhfbQY0EqM/1ARyEX7p7w78nzMr3mWqQwEXmdN
	HxNx9nrPWz7pyCTM5qFk5lGo4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3f5hGPehqi52fEw--.9836S7;
	Mon, 02 Nov 2026 15:35:38 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v5 05/31] ntfs: report boot geometry and MFT bootstrap errors
Date: Mon,  2 Nov 2026 15:35:06 +0800
Message-Id: <20261102073532.98873-6-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3f5hGPehqi52fEw--.9836S7
X-Coremail-Antispam: 1Uf129KBjvAXoW3tr43Ar4ruF13Cw4fJrWDJwb_yoW8Jw4DCo
	Wava1q9w1kKw13A3Wvgw18Xasru3ZxCw4rJr45Gr4Dua1vgw1jqa47Jw13XayfWw4Fgr1D
	AryxJ3WrJFWxGryxn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOXdbUUUUU
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC7wo2H2roPUpK4gAA3R

From: Xuewen Wang <wangxuewen@kylinos.cn>

Mount initialization detects invalid MFT locations, mirror mismatches
and corrupt bootstrap metadata without consistently recording them.
Report these failures and use EFSCORRUPTED for confirmed corruption.

Preserve specific errors through boot-sector parsing and MFT loading,
including the inner ntfs_read_locked_inode() failure during bootstrap.
Use shared cleanup and reporting exits. Keep allocation failures and
unsupported geometry distinct, and retain the read-only fallback.
Before SB_ACTIVE, record the volume error state without sending events.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 fs/ntfs/inode.c | 28 +++++++++++++-------
 fs/ntfs/super.c | 69 +++++++++++++++++++++++++++++++++++--------------
 2 files changed, 69 insertions(+), 28 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 5b3d1453d5e1..c0f91b02efa0 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1880,7 +1880,7 @@ static int load_attribute_list_mount(struct ntfs_volume *vol,
 	ntfs_debug("Entering.");
 	if (!vol || !rl || !al || size <= 0 || initialized_size < 0 ||
 			initialized_size > size)
-		return -EINVAL;
+		return -EFSCORRUPTED;
 	if (!initialized_size) {
 		memset(al, 0, size);
 		return 0;
@@ -1896,7 +1896,7 @@ static int load_attribute_list_mount(struct ntfs_volume *vol,
 		/* The attribute list cannot be sparse. */
 		if (lcn < 0) {
 			ntfs_error(sb, "ntfs_rl_vcn_to_lcn() failed. Cannot read attribute list.");
-			return -EIO;
+			return -EFSCORRUPTED;
 		}
 
 		rl_byte_off = ntfs_cluster_to_bytes(vol, lcn);
@@ -1974,7 +1974,7 @@ int ntfs_read_inode_mount(struct inode *vi)
 	struct attr_record *a;
 	struct ntfs_attr_search_ctx *ctx;
 	unsigned int i;
-	int err;
+	int err = -EIO;
 	size_t new_rl_count;
 
 	ntfs_debug("Entering.");
@@ -2002,6 +2002,7 @@ int ntfs_read_inode_mount(struct inode *vi)
 
 	/* Allocate enough memory to read the first mft record. */
 	if (vol->mft_record_size > 64 * 1024) {
+		err = -EOPNOTSUPP;
 		ntfs_error(sb, "Unsupported mft record size %i (max 64kiB).",
 				vol->mft_record_size);
 		goto err_out;
@@ -2013,6 +2014,7 @@ int ntfs_read_inode_mount(struct inode *vi)
 
 	m = kzalloc(i, GFP_NOFS);
 	if (!m) {
+		err = -ENOMEM;
 		ntfs_error(sb, "Failed to allocate buffer for $MFT record 0.");
 		goto err_out;
 	}
@@ -2101,6 +2103,7 @@ int ntfs_read_inode_mount(struct inode *vi)
 		ni->attr_list = kvzalloc(round_up(ni->attr_list_size, SECTOR_SIZE),
 					 GFP_NOFS);
 		if (!ni->attr_list) {
+			err = -ENOMEM;
 			ntfs_error(sb, "Not enough memory to allocate buffer for attribute list.");
 			goto put_err_out;
 		}
@@ -2120,6 +2123,8 @@ int ntfs_read_inode_mount(struct inode *vi)
 			rl = ntfs_mapping_pairs_decompress(vol, a, NULL, &new_rl_count);
 			if (IS_ERR(rl)) {
 				err = PTR_ERR(rl);
+				if (err != -ENOMEM)
+					err = -EFSCORRUPTED;
 				ntfs_error(sb,
 					   "Mapping pairs decompression failed with error code %i.",
 					   -err);
@@ -2222,6 +2227,9 @@ int ntfs_read_inode_mount(struct inode *vi)
 		nrl = ntfs_mapping_pairs_decompress(vol, a, &ni->runlist,
 						    &new_rl_count);
 		if (IS_ERR(nrl)) {
+			err = PTR_ERR(nrl);
+			if (err != -ENOMEM)
+				err = -EFSCORRUPTED;
 			ntfs_error(sb,
 				"ntfs_mapping_pairs_decompress() failed with error code %ld.",
 				PTR_ERR(nrl));
@@ -2260,6 +2268,7 @@ int ntfs_read_inode_mount(struct inode *vi)
 			 */
 			if ((vi->i_size >> vol->mft_record_size_bits) >=
 					(1ULL << 32)) {
+				err = -EOPNOTSUPP;
 				ntfs_error(sb, "$MFT is too big! Aborting.");
 				goto put_err_out;
 			}
@@ -2285,11 +2294,7 @@ int ntfs_read_inode_mount(struct inode *vi)
 			err = ntfs_read_locked_inode(vi);
 			if (err) {
 				ntfs_error(sb, "ntfs_read_inode() of $MFT failed.\n");
-				NVolClearMftBootstrap(vol);
-				ntfs_attr_put_search_ctx(ctx);
-				/* Revert to the safe super operations. */
-				kfree(m);
-				return -1;
+				goto put_err_out;
 			}
 			/*
 			 * Re-initialize some specifics about $MFT's inode as
@@ -2356,9 +2361,14 @@ int ntfs_read_inode_mount(struct inode *vi)
 err_out:
 	/* Also reached from inside the $DATA loop. */
 	NVolClearMftBootstrap(vol);
+	if (err == -ENOENT || !err)
+		err = -EFSCORRUPTED;
+	if (err != -ENOMEM && err != -EOPNOTSUPP &&
+	    err != -EINTR && err != -ERESTARTSYS)
+		ntfs_report_metadata_error(vol, err);
 	ntfs_error(sb, "Failed. Marking inode as bad.");
 	kfree(m);
-	return -1;
+	return err;
 }
 
 static void __ntfs_clear_inode(struct ntfs_inode *ni)
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 9bf5a626abbc..eb0ebbc235a4 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -869,10 +869,10 @@ static bool ntfs_validate_mft_io_geometry(struct ntfs_volume *vol,
  * @b:		boot sector to parse
  *
  * Parse the ntfs boot sector @b and store all imporant information therein in
- * the ntfs super block @vol.  Return 'true' on success and 'false' on error.
+ * the ntfs super block @vol. Return 0 on success and -errno on error.
  */
-static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
-		const struct ntfs_boot_sector *b)
+static int parse_ntfs_boot_sector(struct ntfs_volume *vol,
+				  const struct ntfs_boot_sector *b)
 {
 	unsigned int sectors_per_cluster, sectors_per_cluster_bits, nr_hidden_sects;
 	unsigned int logical_block_size;
@@ -890,7 +890,7 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
 		ntfs_error(vol->sb,
 			"Sector size (%i) is smaller than the device block size (%lu).  This is not supported.",
 			vol->sector_size, vol->sb->s_blocksize);
-		return false;
+		return -EINVAL;
 	}
 
 	if (b->bpb.sectors_per_cluster >= 0xf4)
@@ -914,7 +914,7 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
 		ntfs_error(vol->sb,
 			"Cluster size (%i) is smaller than the sector size (%i).  This is not supported.",
 			vol->cluster_size, vol->sector_size);
-		return false;
+		return -EINVAL;
 	}
 	clusters_per_mft_record = b->clusters_per_mft_record;
 	ntfs_debug("clusters_per_mft_record = %i (0x%x)",
@@ -945,7 +945,7 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
 		ntfs_error(vol->sb,
 			"Mft record size (%i) exceeds the PAGE_SIZE on your system (%lu).  This is not supported.",
 			vol->mft_record_size, PAGE_SIZE);
-		return false;
+		return -EINVAL;
 	}
 	/* We cannot support mft record sizes below the sector size. */
 	if (vol->mft_record_size < vol->sector_size) {
@@ -953,7 +953,7 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
 				vol->mft_record_size, vol->sector_size);
 	}
 	if (!ntfs_validate_mft_io_geometry(vol, logical_block_size))
-		return false;
+		return -EINVAL;
 
 	clusters_per_index_record = b->clusters_per_index_record;
 	ntfs_debug("clusters_per_index_record = %i (0x%x)",
@@ -983,7 +983,7 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
 		ntfs_error(vol->sb,
 			   "Index record size (%i) is smaller than the sector size (%i).  This is not supported.",
 			   vol->index_record_size, vol->sector_size);
-		return false;
+		return -EINVAL;
 	}
 	/*
 	 * Get the size of the volume in clusters and check for 64-bit-ness.
@@ -993,7 +993,7 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
 	ll = le64_to_cpu(b->number_of_sectors) >> sectors_per_cluster_bits;
 	if (ll >= 1ULL << 32) {
 		ntfs_error(vol->sb, "Cannot handle 64-bit clusters.");
-		return false;
+		return -EINVAL;
 	}
 	vol->nr_clusters = ll;
 	ntfs_debug("vol->nr_clusters = 0x%llx", vol->nr_clusters);
@@ -1001,7 +1001,7 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
 	if (ll >= (u64)vol->nr_clusters) {
 		ntfs_error(vol->sb, "MFT LCN (%llu, 0x%llx) is beyond end of volume.  Weird.",
 				ll, ll);
-		return false;
+		goto corrupt;
 	}
 	vol->mft_lcn = ll;
 	ntfs_debug("vol->mft_lcn = 0x%llx", vol->mft_lcn);
@@ -1009,7 +1009,7 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
 	if (ll >= (u64)vol->nr_clusters) {
 		ntfs_error(vol->sb, "MFTMirr LCN (%llu, 0x%llx) is beyond end of volume.  Weird.",
 				ll, ll);
-		return false;
+		goto corrupt;
 	}
 	vol->mftmirr_lcn = ll;
 	ntfs_debug("vol->mftmirr_lcn = 0x%llx", vol->mftmirr_lcn);
@@ -1050,7 +1050,11 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
 		}
 	}
 
-	return true;
+	return 0;
+
+corrupt:
+	ntfs_report_metadata_error(vol, -EFSCORRUPTED);
+	return -EFSCORRUPTED;
 }
 
 /*
@@ -1127,6 +1131,18 @@ static void ntfs_setup_allocators(struct ntfs_volume *vol)
 	ntfs_debug("vol->mft_data_pos = 0x%llx", vol->mft_data_pos);
 }
 
+/* An unused record is corruption when a required system file is loaded. */
+static struct inode *ntfs_system_iget(struct ntfs_volume *vol, unsigned long mft_no)
+{
+	struct inode *inode = ntfs_iget(vol->sb, mft_no);
+
+	if (IS_ERR(inode) && PTR_ERR(inode) == -ENOENT) {
+		ntfs_report_metadata_error(vol, -EFSCORRUPTED);
+		inode = ERR_PTR(-EFSCORRUPTED);
+	}
+	return inode;
+}
+
 static struct lock_class_key mftmirr_runlist_lock_key,
 			     mftmirr_mrec_lock_key;
 /*
@@ -1142,7 +1158,7 @@ static bool load_and_init_mft_mirror(struct ntfs_volume *vol)
 
 	ntfs_debug("Entering.");
 	/* Get mft mirror inode. */
-	tmp_ino = ntfs_iget(vol->sb, FILE_MFTMirr);
+	tmp_ino = ntfs_system_iget(vol, FILE_MFTMirr);
 	if (IS_ERR(tmp_ino)) {
 		if (!IS_ERR(tmp_ino))
 			iput(tmp_ino);
@@ -1194,6 +1210,7 @@ static bool load_and_init_mft_mirror(struct ntfs_volume *vol)
  */
 static bool check_mft_mirror(struct ntfs_volume *vol)
 {
+	int report_err = 0;
 	struct super_block *sb = vol->sb;
 	struct ntfs_inode *mirr_ni;
 	struct folio *mft_folio = NULL, *mirr_folio = NULL;
@@ -1222,7 +1239,7 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 					index, NULL);
 			if (IS_ERR(mft_folio)) {
 				ntfs_error(sb, "Failed to read $MFT.");
-				return false;
+				goto out;
 			}
 			kmft_base = kmap_local_folio(mft_folio, 0);
 			kmft = kmft_base;
@@ -1242,6 +1259,7 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 		if (((struct mft_record *)kmft)->flags & MFT_RECORD_IN_USE) {
 			/* Make sure the record is ok. */
 			if (ntfs_is_baad_recordp((__le32 *)kmft)) {
+				report_err = -EFSCORRUPTED;
 				ntfs_error(sb,
 					"Incomplete multi sector transfer detected in mft record %i.",
 					i);
@@ -1251,12 +1269,13 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 mft_unmap_out:
 				kunmap_local(kmft_base);
 				folio_put(mft_folio);
-				return false;
+				goto out;
 			}
 		}
 		/* Do not check the mirror record if it is not in use. */
 		if (((struct mft_record *)kmirr)->flags & MFT_RECORD_IN_USE) {
 			if (ntfs_is_baad_recordp((__le32 *)kmirr)) {
+				report_err = -EFSCORRUPTED;
 				ntfs_error(sb,
 					"Incomplete multi sector transfer detected in mft mirror record %i.",
 					i);
@@ -1276,6 +1295,7 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 		}
 		/* Compare the two records. */
 		if (memcmp(kmft, kmirr, bytes)) {
+			report_err = -EFSCORRUPTED;
 			ntfs_error(sb,
 				   "$MFT and $MFTMirr record %i do not match.  Run chkdsk.",
 				   i);
@@ -1310,14 +1330,20 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 	do {
 		if (rl2[i].vcn != rl[i].vcn || rl2[i].lcn != rl[i].lcn ||
 				rl2[i].length != rl[i].length) {
+			report_err = -EFSCORRUPTED;
 			ntfs_error(sb, "$MFTMirr location mismatch.  Run chkdsk.");
 			up_read(&mirr_ni->runlist.lock);
-			return false;
+			goto out;
 		}
 	} while (rl2[i++].length);
 	up_read(&mirr_ni->runlist.lock);
 	ntfs_debug("Done.");
 	return true;
+
+out:
+	if (report_err)
+		ntfs_report_metadata_error(vol, report_err);
+	return false;
 }
 
 /*
@@ -2741,9 +2767,10 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	 */
 	result = parse_ntfs_boot_sector(vol, (struct ntfs_boot_sector *)boot);
 	kfree(boot);
-	if (!result) {
+	if (result) {
+		err = result;
 		if (!silent)
-			ntfs_error(sb, "Unsupported NTFS filesystem.");
+			ntfs_error(sb, "Failed to parse NTFS boot sector.");
 		goto err_out_now;
 	}
 	if (!vol->mft_write_supported && !sb_rdonly(sb)) {
@@ -2795,6 +2822,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		ntfs_set_default_dentry_ops(sb);
 	tmp_ino = new_inode(sb);
 	if (!tmp_ino) {
+		err = -ENOMEM;
 		if (!silent)
 			ntfs_error(sb, "Failed to load essential metadata.");
 		goto err_out_now;
@@ -2802,7 +2830,8 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	tmp_ino->i_ino = FILE_MFT;
 	insert_inode_hash(tmp_ino);
-	if (ntfs_read_inode_mount(tmp_ino) < 0) {
+	err = ntfs_read_inode_mount(tmp_ino);
+	if (err) {
 		if (!silent)
 			ntfs_error(sb, "Failed to load essential metadata.");
 		goto iput_tmp_ino_err_out_now;
@@ -2826,6 +2855,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	vol->lcn_empty_bits_per_page = kvmalloc_array(lcn_bit_pages, sizeof(unsigned int),
 						      GFP_KERNEL);
 	if (!vol->lcn_empty_bits_per_page) {
+		err = -ENOMEM;
 		ntfs_error(sb,
 			   "Unable to allocate pages for storing LCN empty bit counts\n");
 		goto unl_upcase_iput_tmp_ino_err_out_now;
@@ -2876,6 +2906,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		queue_work(ntfs_wq, &vol->precalc_work);
 		return 0;
 	}
+	err = -ENOMEM;
 	ntfs_error(sb, "Failed to allocate root directory.");
 	/* Clean up after the successful load_system_files() call from above. */
 	iput(vol->vol_ino);

