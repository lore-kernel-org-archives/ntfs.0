Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04FB4A2078
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 15:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399321; cv=none; b=kiHOK9n+jfYcM8PwOxsqLKrbUnwp0JFGlrQ1etXtZ4cIuewq5yZtBUagqKLT4qW1dWbCc0Z74BLo5WfPl7Z4jiM38NjnPKc0lqpnL+jW1bzjNHvQAtCP4K/x8KURAxWB6lbu74/UiyuiphlMew6qQHFDrUPSS6CCgLVwyC0u/6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399321; c=relaxed/simple;
	bh=Dgl4TVsK7D9C8yEpVM3SO90LMPGZFsPrEMBRrEmc/eE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b6VkFZGitpP+acBINwI/0JLDlqx3oGKiTSJf9U3SAdTdJcEIQFGTias82/Pnf5vwdeOK8TnYjGFK3NxNYTXr2iR2lq7jywJDFW6MwstzpUEusjDQ79pZCe+uXDZExOy0Q8aj+TzSrzEeIv4wQRfO3NMshNiyO7Y27sCF54L0FW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbqtPlLq; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbqtPlLq"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381b831d535so6199328a91.0
        for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 08:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399319; x=1790004119; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vTCbjsu6bs55rfqvupFq/Cuc2iKqkMirG1tKTDqUDCI=;
        b=CbqtPlLqgEHrVQuRNKpbWeHzz6aPkUWmDBKFb+Jbm/grrg0qaGYZZ57IeVG+XpLviN
         J+z02eEX+to3xw8E318XkOPvfNC8pQRIpX+gh6CjcG5s67d4vIkApKVl0m8DAXUekEZA
         Cb7exeLYRp6L340UBckzsq47rbP5Ob44Q2ogUmL1P8ncjAHPXnDnJyCM0HhRH/XAKxAs
         h0u8bTgIOT1C3yMrm0JXRcKPEqe7+Hkrs90Ht3LzH2Ux5JRRyA2wJd8KtlAOy+0EdoFF
         k4WTIHPXpnbQTbW/7XhOTZrGrsUJ3QKpzmcdar6WUKW6XTOExBsPGvc7R6suMMCEebeu
         jAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399319; x=1790004119;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCbjsu6bs55rfqvupFq/Cuc2iKqkMirG1tKTDqUDCI=;
        b=JGh0W31l9zwXlC6EjhM5BltxlZRpHY8UhkrhFFzjXv+BaoCzpU5HweBXXkjSqh0goi
         nPnYTvKGD/DThtyaXMFj2NIqtBFIHonvSWaijs78xLOg6BLQJBNXv64hYlpREKtY6mOx
         17QlYrTz3/Zsk+b3zC/Sbar2P408pXg644ScY/fAHH+fSyRQyM5s625AwhQkOnDmgDsy
         6USmp7F2nT6N1frG/gpyE7UBzpY+frjZFWZlo0ascuyRHjrjiJnIKzg8Xjii/5FXUcUH
         A0vbHmkTIKaGP5vJEp79zjTMtf07Oax2L/Zhc313R5xQmFQaM4qJlaE4mFpUFl+2RmWs
         fz/w==
X-Forwarded-Encrypted: i=1; AKwUvBxtSmWxgARSsBPtk/aQ7pBnaaydqRktXAQdBD6Ozz7FCzVuZPZ5QOe+vx3Ew1otc7UlTvd0@lists.linux.dev
X-Gm-Message-State: AFuF++lK0zUiQyLJcxoD0DbjrNbZRNyfK4QbBy9L0ct5MYb7xt2ZZsbe
	YMukmfSAV2I3uOX6T5XeM1K1PRj7t5mV1PS/iwD6Wdy69Ml3E/+nH8jb
X-Gm-Gg: AYBFou0VAxzaSHDENTRiu8pig12AvOvRhBGaomGDp+Pn6uf5uYx6pMyrUjOGfpEExlA
	ZOfIDKfWQLGAL7SGItFcM8qRuUZ14FEYTbdi1hQG6zVW4B7vwPPJkb3JF98Cwfivu0P3wfFP/Cy
	mjTWvXNQAASBs9EWylqcQJryeZazpmf+aJPdMlFSJ/x9YI748fFIZNk6gloIujL9C2hB/IEWWwy
	qikjvO/o3Boj8iuDTDL4w8o6HB91aGw4/o3ijx1mb1gsQ4QMtLQCGNZ1igEvuJvx9MhPVCzF0Iq
	AezXv9WKUoclJ0+DxRJvkhJtOvh7Skrw1HlfVzrEJ/Fe1KwLhErq+jQ/MRGTl99oFzfqU24oK7d
	aN9v9emE4puwmvaq8g1+xaeZgbiQO6E+5Blqef/toTLmPZwsKeVFE4u3zRhc5fQZK+sXArs2trD
	w6NzT+H8P9qYYc26ujhJldAkahYrc01nTLM2A1RleRHRxZGfE5cqUfBQQCiwLuZCxmodlJ/1pnU
	sl4Pf97mdRglSTteOZ2XkY=
X-Received: by 2002:a17:90b:2885:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-39dec0bf165mr6602063a91.20.1789399318856;
        Mon, 14 Sep 2026 08:21:58 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd6cd982sm31667a91.0.2026.09.14.08.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:21:57 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 02/10] ntfs: validate the MFT I/O geometry
Date: Tue, 15 Sep 2026 00:21:31 +0900
Message-ID: <20260915-topic-4kn-lkml-v3-2-447cfa17f780@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915-topic-4kn-lkml-v3-0-447cfa17f780@gmail.com>
References: <20260915-topic-4kn-lkml-v3-0-447cfa17f780@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789399242; l=6800; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=Dgl4TVsK7D9C8yEpVM3SO90LMPGZFsPrEMBRrEmc/eE=; b=1f9phVVCRJRA8vTWBqJ4qQe+q6+uESQ9atf2UGYxxcPjCJpVRJgImMcVLqiQQhEmEtXrum90I r0RVCUtVwrxCVksmkaCZ7xc/WMCVMOy7/B/BGzIE1poDuImFORw/TqL
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
Content-Transfer-Encoding: 8bit

MFT writes must consider both the device logical block size and the NTFS
record geometry. Validate those values at mount time, then cache the MFT
I/O unit used by all MFT write paths.

Use the larger of the device logical block and MFT record sizes as the MFT
I/O unit. Keep valid geometries that the current write paths cannot safely
handle read-only until their mapping support is generalized.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/super.c  | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 fs/ntfs/volume.h |  8 ++++++
 2 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index f4a73e45773d..062302ed0234 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -286,6 +286,12 @@ static int ntfs_reconfigure(struct fs_context *fc)
 		static const char *es = ".  Cannot remount read-write.";
 
 		/* Remounting read-write. */
+		if (!vol->mft_write_supported) {
+			ntfs_error(sb,
+				   "MFT writeback is unsupported for this geometry%s",
+				   es);
+			return -EROFS;
+		}
 		if (NVolErrors(vol)) {
 			ntfs_error(sb, "Volume has errors and is read-only%s",
 					es);
@@ -530,6 +536,8 @@ int ntfs_write_volume_label(struct ntfs_volume *vol, char *label)
 static bool is_boot_sector_ntfs(const struct super_block *sb,
 		const struct ntfs_boot_sector *b, const bool silent)
 {
+	u16 sector_size = le16_to_cpu(b->bpb.bytes_per_sector);
+
 	/*
 	 * Check that checksum == sum of u32 values from b to the checksum
 	 * field.  If checksum is zero, no checking is done.  We will work when
@@ -550,8 +558,8 @@ static bool is_boot_sector_ntfs(const struct super_block *sb,
 	if (b->oem_id != magicNTFS)
 		goto not_ntfs;
 	/* Check bytes per sector value is between 256 and 4096. */
-	if (le16_to_cpu(b->bpb.bytes_per_sector) < 0x100 ||
-	    le16_to_cpu(b->bpb.bytes_per_sector) > 0x1000)
+	if (sector_size < 0x100 || sector_size > 0x1000 ||
+	    !is_power_of_2(sector_size))
 		goto not_ntfs;
 	/*
 	 * Check sectors per cluster value is valid and the cluster size
@@ -632,6 +640,60 @@ static char *read_ntfs_boot_sector(struct super_block *sb,
 	return boot_sector;
 }
 
+static bool ntfs_validate_mft_io_geometry(struct ntfs_volume *vol,
+					  const unsigned int logical_block_size)
+{
+	struct super_block *sb = vol->sb;
+	u32 mft_io_unit_size = 0;
+	bool mft_write_supported = true;
+
+	if (!is_power_of_2(logical_block_size) ||
+	    logical_block_size > PAGE_SIZE ||
+	    !is_power_of_2(vol->sector_size) ||
+	    vol->sector_size < logical_block_size ||
+	    vol->sector_size % logical_block_size ||
+	    !is_power_of_2(vol->cluster_size) ||
+	    !is_power_of_2(vol->mft_record_size) ||
+	    vol->mft_record_size > PAGE_SIZE)
+		goto err;
+
+	mft_io_unit_size = max(logical_block_size, vol->mft_record_size);
+	if (mft_io_unit_size > PAGE_SIZE ||
+	    mft_io_unit_size % logical_block_size ||
+	    mft_io_unit_size % vol->mft_record_size)
+		goto err;
+
+	/*
+	 * The current direct-write path stores at most two MFT runlist
+	 * segments. Keep valid but larger records read-only until that path
+	 * can map an arbitrary number of segments.
+	 */
+	if (vol->mft_record_size > 2 * (u64)vol->cluster_size)
+		mft_write_supported = false;
+
+	/*
+	 * A containing device block is currently mapped through one MFT
+	 * runlist element. Keep valid geometries that require crossing a
+	 * cluster read-only until the mapping is generalized.
+	 */
+	if (mft_io_unit_size > vol->mft_record_size &&
+	    (vol->cluster_size < mft_io_unit_size ||
+	     vol->cluster_size % mft_io_unit_size))
+		mft_write_supported = false;
+
+	vol->mft_io_unit_size = mft_io_unit_size;
+	vol->mft_write_supported = mft_write_supported;
+	return true;
+
+err:
+	ntfs_error(sb,
+		   "Unsupported MFT I/O geometry (logical %u, block %lu, sector %u, cluster %u, MFT record %u, I/O unit %u).",
+		   logical_block_size, sb->s_blocksize,
+		   (unsigned int)vol->sector_size, vol->cluster_size,
+		   vol->mft_record_size, mft_io_unit_size);
+	return false;
+}
+
 /*
  * parse_ntfs_boot_sector - parse the boot sector and store the data in @vol
  * @vol:	volume structure to initialise with data from boot sector
@@ -644,9 +706,11 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
 		const struct ntfs_boot_sector *b)
 {
 	unsigned int sectors_per_cluster, sectors_per_cluster_bits, nr_hidden_sects;
+	unsigned int logical_block_size;
 	int clusters_per_mft_record, clusters_per_index_record;
 	u64 ll;
 
+	logical_block_size = bdev_logical_block_size(vol->sb->s_bdev);
 	vol->sector_size = le16_to_cpu(b->bpb.bytes_per_sector);
 	vol->sector_size_bits = ffs(vol->sector_size) - 1;
 	ntfs_debug("vol->sector_size = %i (0x%x)", vol->sector_size,
@@ -719,6 +783,9 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
 		ntfs_warning(vol->sb, "Mft record size (%i) is smaller than the sector size (%i).",
 				vol->mft_record_size, vol->sector_size);
 	}
+	if (!ntfs_validate_mft_io_geometry(vol, logical_block_size))
+		return false;
+
 	clusters_per_index_record = b->clusters_per_index_record;
 	ntfs_debug("clusters_per_index_record = %i (0x%x)",
 			clusters_per_index_record, clusters_per_index_record);
@@ -2286,6 +2353,11 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 			ntfs_error(sb, "Unsupported NTFS filesystem.");
 		goto err_out_now;
 	}
+	if (!vol->mft_write_supported && !sb_rdonly(sb)) {
+		sb->s_flags |= SB_RDONLY;
+		ntfs_warning(sb,
+			     "MFT writeback is unsupported for this geometry. Mounting read-only.");
+	}
 
 	if (vol->sector_size > blocksize) {
 		blocksize = sb_set_blocksize(sb, vol->sector_size);
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index bc85a9592245..8c17a66b4f22 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -43,6 +43,7 @@
  * @mft_record_size: in bytes
  * @mft_record_size_mask: mft_record_size - 1
  * @mft_record_size_bits: log2(mft_record_size)
+ * @mft_write_supported: Whether the MFT write paths support the geometry.
  * @index_record_size: in bytes
  * @index_record_size_mask: index_record_size - 1
  * @index_record_size_bits: log2(index_record_size)
@@ -111,6 +112,13 @@ struct ntfs_volume {
 	u32 mft_record_size;
 	u32 mft_record_size_mask;
 	u8 mft_record_size_bits;
+	bool mft_write_supported;
+	/*
+	 * Unit size used for MFT I/O. This is the MFT record size when
+	 * it is at least as large as the device logical block, or the
+	 * containing device logical block when the record is smaller.
+	 */
+	u32 mft_io_unit_size;
 	u32 index_record_size;
 	u32 index_record_size_mask;
 	u8 index_record_size_bits;

-- 
2.43.0

