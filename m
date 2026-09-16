Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFCFDF6C
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 01:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520633; cv=none; b=OUe9UzsOFWZRo0l45gIzkjlTYpg/6SjaNy0GHUDqZuyUlCILBR7Z6HKzrkzqQaUSDEMT81QmlhkOArrVR9E/nVKHQrlpZw5aF0RQsuZq1K6nhaQIWEM9kcGFw749KG0yRzsKcYMpy5HMxrbm7jmkF2/6tr2aWXURPJX6QSBhAG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520633; c=relaxed/simple;
	bh=Dgl4TVsK7D9C8yEpVM3SO90LMPGZFsPrEMBRrEmc/eE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EkrIa3gfc2yURd8fdltuJK3EIVetjnHeruqw8HVms+P4caGFkr2+OrFH+eSjPaFl9snt8c9R/11HY+j6Z9bHwimd/nIZT+gtCM8ATuW3Yr2MsmU6ulRo6/CsSD/JlvWscwk1YG7TGTuW0prkyclCzYdedZCimW/zX7bukpv5AnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYc+7u97; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYc+7u97"
Received: by mail-pj2-f39.google.com with SMTP id d9443c01a7336-2d8fe517774so4747535ad.0
        for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 18:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520631; x=1790125431; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vTCbjsu6bs55rfqvupFq/Cuc2iKqkMirG1tKTDqUDCI=;
        b=XYc+7u97apvOW5eVuwiljkBTMa54Vgj81zB4YPRJtcIACqeqk86fJP4Xxt6XoB1EYG
         aYUoW22c8l0nz2/yVCLq9fAKSHzpxrE4+eBQkvOIPLkaeS69HTBeVtHDqskedagkiRSm
         9ZT0wPurYSDo8d1aR5KNmYqGnVR+jDbnK1K8tm1O7eNBT10mayX3EOKIxzERS5YPPSBl
         WhAwMPG9gKgSSE5L9p4mgV3bnXTf4u05BLjYc/vLNvJGgb8ST7AlgbEFwGzDUahfZo+l
         8Glerd8XBFs0w7fW47bb64KK57jPVDQMuZl9mDxBl2PCCkEoDWNI12ZcH3lN8R3T0Zg8
         K83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520631; x=1790125431;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCbjsu6bs55rfqvupFq/Cuc2iKqkMirG1tKTDqUDCI=;
        b=BbZ9syJ9+H0Kmq1zGVA85G1mVRnPxAEd/eiZSNErwHIMXuZVQ4EBteHEiP46mSV0n2
         XVNTqk4muBKf24wS/EP16e8HLYFGFnQEoC2KlcXwWFgZKYRre2QquR5/XnO1uUj2+O7R
         16gfW5MX9FzZhfNDc0b0ECZH6i0ZFM27BfWIKWNr8yBEVdmi9jZJI0YHYF84Bj4ogyRs
         B2ak/kjbemqQaC5Xk3OG0aAglHstBv7tgrau9tPjObLldczMHGmyGyS44gPyOEk1zaip
         IfBOmA4YIJYQwSfZ+UVcDCqrANJgpIQZN+luUoskCdOrHqmGrw9jFyc3+7cmWTDdXweE
         Fqbw==
X-Forwarded-Encrypted: i=1; AKwUvBxQDy5Fmra7DlkTZb5UKe2H1wHzSnvtoVvHv0yCx99n/ujmwX05nxXvt+JwHfetfBxSI/t/@lists.linux.dev
X-Gm-Message-State: AFuF++nS98ji8rX2hZH3bVrQZpqstkOIB8eKcpUm/7x6hGeSTDnPRhO0
	X4gmulIy5H5a0ymamxiIApe+8vVcfxaDBiqu6OPe/+rfoLjLs1+g/e9PrOUG3g==
X-Gm-Gg: AYBFou3BEeCoFwerQdbEQN96WzqhnwB2XazCFgjUmaEHW/xIeptGKK17PpuA39yWaZa
	ibqVLA8N8gai+8ADaLYJyBqynzenQ0k7Wh4qhBS9U01ThZwLPOaI0tfp4/A2p5HJZIk9wIDQLyX
	ch/5ITOH95W8v61MDE/cP99sP+/e+luQEOQnAXh8/32i3Q9ER3wBAEX3m5MNj4EWRvVaJYK9zkn
	mShVFCSrQa4ygK6Kc+GJWKVgckIdbFkxQbra53i0nR2Ly8bF6QDxlAhQV38WfV6CIlV0VQT+DSs
	P+bFKfmxgC6iN+P3OvxUltTt548F2VSTNEgv42EFzSGgheaChXpMxA6MGMAydk702Jr4bnoii9W
	EhPpskQzSbl3/r4GAcADmTn9Fy9iEbWE4lEuVcO3kc93wMrSQ7NNs6munV+lyd6bmEGYcMWaSJm
	DRfOdMnuH2gLdtWdkR2/eJcsDPPzFnhvK54cZf3Fany97qwZBEXL/ecfqRIF0/vqfFglzTUIzXU
	XHsDw==
X-Received: by 2002:a17:902:d58f:b0:2db:56da:6a0b with SMTP id d9443c01a7336-2dd8e633042mr13137875ad.13.1789520630792;
        Tue, 15 Sep 2026 18:03:50 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fff3sm2880995ad.8.2026.09.15.18.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:03:49 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 02/10] ntfs: validate the MFT I/O geometry
Date: Wed, 16 Sep 2026 10:03:14 +0900
Message-ID: <20260916-topic-4kn-lkml-v4-2-4f8a574ba3fb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
References: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6800; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=Dgl4TVsK7D9C8yEpVM3SO90LMPGZFsPrEMBRrEmc/eE=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqqeq1hxJM/H2TN6cRSiYdhMhcJtQb6J1YxbplF
 xFwnixoqbGJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqnqtQAKCRA08jD6945I
 0zAhD/4v/j29cedeiic/g63r1zoMwc4h+A0sou3cPJFyVRtiooJhVCu9tOkgxtHCp3GNNVrPUh7
 Gd0qSxJdKsOo8q40KySYCi9w0kZa2XuK0wZn06Fnv+YBFV3A66DF8Sq1QIHhoSmYF5y6c6Oc2xu
 rsMV4jrHQYltxT2FLMYw8RLPXsXuBRsco0REQF5VA/tTS3MZczL0V17gS64y+HpnxV71Cx4smmz
 B8PXe7LoTQHALW1o7DtO6eo8zN8DHqNGSZcomDca8xLJfPKnsp8joX0m+XMVYWdvSyfBelLjNbZ
 1TuZEfPjlPeu+9yVOtJA0OtufGQuWHPR9dnDgrSJDhC68AHXDHTyS4rUevXPhpw/rPz6NyPKiyG
 jNDqY8APx0kizblNyXN4cjbawGjlmVlWWgOv9g/qSA2fCbvRp50EhIfoeYAUF7QUc8mH4B6FBlF
 1lS7tJ3oZUWsPlZwMx+cIz6V68peGgI9rZyIARNErzqoFz3m4QjjA8i4eSlKi3C8M31bqYzvc8w
 vtUNDVpvEQXud7Fm/07lplXQpBToywvoyeJax4QdrfmqRt1UEB/LYLYBjB1KwbQFcH1R0E1kKLB
 xs1q89QrnfL+gxlqHijRTryxNGePfRLpT7JDTGtabyKwXJPV0eVnv5j3Y6k8HvF5tIHqn9BlYw/ LoyTx6Dc2j1kc4w==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
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

