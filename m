Received: from mail-pj2-f25.google.com (mail-pj2-f25.google.com [74.125.227.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1F738886B
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 06:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973073; cv=none; b=UCvutl0evn1fRDJ99DWMmFotWVb/yYG4h4rcMSnXQZOIw1Wyq1Q1mLW3PcEguKMNTCf6Lhgb2HCrdk/2MXJELuei0K3gy1SDWWAc1qtzFrtPiKRyg/0CQn/OYKxywwBgrxfQbe3xDQFFa7+8a7H90tanXqWF7yaX/ZIhSlEW3xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973073; c=relaxed/simple;
	bh=I26losMSlTUNGAA7664DnM0GItW4WfcX2N9VB9tgSAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iOnGHa+RB4/QYejgu/1EoW8s86m8cqop/cGFt4oULA2w9sQNPb7l3YL6FquT741VqOC9fTt9Xa6W30IQpg4x1kKaFboiI6vuE9vtyDFs9ppSRrzHAMbEth3oGBRleA4rTvb8M2FT0+GZBOTaXjOZzNsovFgKKZi9dfqYeDQR4ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRpEMDLt; arc=none smtp.client-ip=74.125.227.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRpEMDLt"
Received: by mail-pj2-f25.google.com with SMTP id d9443c01a7336-2dd4b43b20bso17714605ad.1
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 23:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789973071; x=1790577871; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ajHqkhrgq6QMtTm9a5/qhqLuekh2yikP/oF6kQVtU9s=;
        b=FRpEMDLtgkbxbrKLssTcIKyCjZFrCPLAB8yrZOlQhSFaDgQen8599tZKLoUCFgryd1
         hyHW4uTQ6dokjhjieA7VmzZMCuLx4+UiQWqeZ2isFPuwF4sKga2LBQmN4uPaNVTWg2Iv
         iLxuMOXbjseszhtgBAKaw04kZvQD9VaO3Yb/yEmGOQ8RLuVCRZ0Qx3qG1/32DBUsPVfd
         XUhp/z4JDkOuvdLNY3JRX/VenMfdC67bVHA5aw3rYglfQb9sFy9NkyTtfeiPNpbMUCz4
         jJTXzRMUxD7hByV5xe7Bf4e+k9bVwd4fdfDUMIvA1vCQ9U0jmKBrrQdW12KsRUe4aKgu
         mksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973071; x=1790577871;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajHqkhrgq6QMtTm9a5/qhqLuekh2yikP/oF6kQVtU9s=;
        b=fpjmXxfuivGopXJHW5SGfVPwGeArDI9pcMm2m3rj7P0n1AOp8vCEXrIy/oomHC9HJP
         sjM4czUlQFLgQ/3rKVXmdF1bfQaEELdw7ZMWWnIyejE52CjwcKup29Y4y7OIfanxyxir
         AUGh6jD/Q2pBQvOV1MlhcNErDsciZtSLZHJVB8T4T7aUYnvb1Y8fdlFzfbDlMwlr0dN1
         xa7/JK3ZXGM6p/Fi0D/AzHdUMGhf4pGDFFdtO4X3cwgDllW8JztOm1/VWfM9LVHskvhb
         GVX91UNeW4phS//8JDiWOoCe1b811bWuOFLqzgl5jkd3aLVlLr/VMkhkFqg+dzfEODvO
         aMYA==
X-Forwarded-Encrypted: i=1; AKwUvBy+IRQ2j5if8si5nKY//+ZiNlC8Ya/BhS0FhuHrM1oCpBrkdHQ9d7T1czZgJgXfBdy9BSOZ@lists.linux.dev
X-Gm-Message-State: AFuF++lGhW5Pp8z6L8Zbn5MGinAcPbxnM0PjSGC/O0LDAmddBBJZ6XBR
	5mYI2yq1b4dNoWYj8pUSAGPjs6YYBmeYxu3QOfbdj47yUGYw+mopDtUU
X-Gm-Gg: AYBFou1d5X30r+qEf+M3zUOZZnzPj9aU4wgkMwkifQmNmehwxYXaSPhsMYTvwrO1EXZ
	3Auv4UWJg5l+BheNjQ5THVQJpiuoWfVw0yorKM6Xuv7WqnLkmY8q5OuwC7MKGuZNVvoqoD2bLWu
	XX1rLSMpDXXXHppqNS1YUohMip+caQtQZAdTgHLu3MUSUKlsc3SerXimVhLlhDLAgwvFhUX18wt
	hANJLmT4WmBl1ym3NG5xqmqSjeEgHF4LOZIhOfKnQMJJy7Ne3lmEjiHFRGQh5uaS+TS37VY0BDt
	fimu/c1lROOQd/avgd1oi1wOGEDd8D2dIDr3ZfWnoBdgmLdhUyYxV0VY4zlU+pyT+zSMc/w8KmD
	szilNoCVJKUOget4bEbMewBofshptEEd3cSQCcJ+Oo0FzwLUGtT3JRyUvmOWC8jOsFiyvI8Csrv
	LqEqIcvipDzsZsrjxEJ2jLZX+VgVD2lxOcOt3XqQwOOB9D3lOH8WZw4HvA00RMXJvCm2k3gylr0
	b7fkw==
X-Received: by 2002:a17:903:2349:b0:2dd:c100:424e with SMTP id d9443c01a7336-2ddc10044e2mr80381165ad.50.1789973071211;
        Sun, 20 Sep 2026 23:44:31 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc180395fsm28097345ad.81.2026.09.20.23.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:44:30 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v6 02/10] ntfs: validate the MFT I/O geometry
Date: Mon, 21 Sep 2026 15:44:04 +0900
Message-ID: <20260921-topic-4kn-lkml-v6-2-75069f590b22@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921-topic-4kn-lkml-v6-0-75069f590b22@gmail.com>
References: <20260921-topic-4kn-lkml-v6-0-75069f590b22@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6881; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=I26losMSlTUNGAA7664DnM0GItW4WfcX2N9VB9tgSAk=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsNIKEnpuLaJxasv5dhAcuCx/3GIATnSWeaiRS
 wxXo33GJq2JAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarDSCgAKCRA08jD6945I
 04FJD/9AHSp3325gDAYNj9VkYPAJtuude3698pQNIok9UGEm2CvrtIwCTQynx3dI6iyKiw8Mfi/
 Rd6FZkAII1CBOyjxiR1KGfUyCDqBNadq6u96hQ3lgWqqeBnlZvHdQBFwutxoRAcIbdYhWBBupty
 cbsoY0DFeLJJp2MpEBlI/QfzEwFHUucOAnKJsRNnAb72LTfj1Q6yXzN7EWK6nYRt0AJQIfYCjBk
 chlerMCOk/lRIJ1LSwQ8a0UzZWUzu0dLkBRJq1QGrdofecAANqiQuFR9pUWIWi4gc6Si2z9i4eH
 yLxiHDrYDd5z7W41UZ18cdMIIBjZoospnVq8UPArL1nYF2hKaeKefGYDjz0k6p77j/FG6kFFypz
 GrsKbPstD/mcx3dADggs7IpEu73ZaUX4WjwG68FfZ+BZhWoN/UVU6FpQWc8s9jdjd3btsnB1lJI
 v/0VODcQ6WM56YZPqgRLbCjSpuIFqoFIsrFMiQ6HPDKzMpVWFb8R3fkZnWbeqlcLfonchKpM2/P
 IcTVn19/kkLoYnoGRhnCgAnk2SAPBxqJGwj0LCgtjw8aLUZ9Q+OmL0KMwkNjqMQ2Abeyo69yeLL
 xDz7NySrv2gtzoTbGedK9bx2/YZjJjgBT1dV744Eva72b2bXbewIV21a/5ETUM5O3cySLU2sFh2 E50hJ2/yFZDXGXg==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

MFT writes must consider both the device logical block size and the NTFS
record geometry. Validate those values at mount time, then cache the MFT
I/O unit used by all MFT write paths.

Use the larger of the device logical block and MFT record sizes as the MFT
I/O unit. Keep valid geometries that the current write paths cannot safely
handle read-only until their mapping support is generalized.

Fixes: 115380f9a2f9 ("ntfs: update mft operations")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/super.c  | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 fs/ntfs/volume.h |  8 ++++++
 2 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index a012c081dd4c..1b66efbd3990 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -295,6 +295,12 @@ static int ntfs_reconfigure(struct fs_context *fc)
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
@@ -635,6 +641,8 @@ int ntfs_write_volume_label(struct ntfs_volume *vol, char *label)
 static bool is_boot_sector_ntfs(const struct super_block *sb,
 		const struct ntfs_boot_sector *b, const bool silent)
 {
+	u16 sector_size = le16_to_cpu(b->bpb.bytes_per_sector);
+
 	/*
 	 * Check that checksum == sum of u32 values from b to the checksum
 	 * field.  If checksum is zero, no checking is done.  We will work when
@@ -655,8 +663,8 @@ static bool is_boot_sector_ntfs(const struct super_block *sb,
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
@@ -737,6 +745,60 @@ static char *read_ntfs_boot_sector(struct super_block *sb,
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
@@ -749,9 +811,11 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
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
@@ -824,6 +888,9 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
 		ntfs_warning(vol->sb, "Mft record size (%i) is smaller than the sector size (%i).",
 				vol->mft_record_size, vol->sector_size);
 	}
+	if (!ntfs_validate_mft_io_geometry(vol, logical_block_size))
+		return false;
+
 	clusters_per_index_record = b->clusters_per_index_record;
 	ntfs_debug("clusters_per_index_record = %i (0x%x)",
 			clusters_per_index_record, clusters_per_index_record);
@@ -2455,6 +2522,11 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
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
index c7cd27b6dc1a..fdb57279de84 100644
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

