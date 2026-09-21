Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B55217648
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 00:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950010; cv=none; b=abNPQhCJNE9yOQYPjd5wyYLFm4Wn6EO7yupfdVYcgtPVqQrW8D14zPmJsmJ38jKvm8ETYSW2ZJ8NG/OdSAMUsowF1B77UXdVP5WS8C1yxgHBsMxKT/4bnrpsIygfDZZL9DdRFkkGZ/HjNwQSfAWiVdU6YSoyyeqiiQNr6ckKpaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950010; c=relaxed/simple;
	bh=vI3Rih4fsjG7pE+BpNKXjzIctM75Zkg4mW9f07Yjfvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gm6yJEqXgLjzCDndPD90a33vd16RC8uCuXFon8ss0wya5rgiPV8Or2x1z8AFjft7k/5pckAGu+NZDJBDg02hHC7g23BM66jMEXgCZIHc3EHVrQ4c0NOvLNEXwXAKn2fwazAu6+jl11FLfas+4adZ2GQPS+Co8f90CVBdeWGPDEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gx9vjj11; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gx9vjj11"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e25187so1319288b3a.2
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 17:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950008; x=1790554808; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kkLcYN3uRxWbi8ZMmnE1rmLo1CitPI3+eWi0uPYL3/U=;
        b=Gx9vjj11IoqjBm/DdL80fHoGiRR3vDHfD9HMaQK0VwNlwbQUjlrksoGKSPmPA9L1bJ
         b+N9pHI7IEUECgH9olB9TwtXLl884kyQ/b7NLiLhu7ht0zLiH5PFh++Dk0ckZ/V5v12n
         JSXKvB35J1s/g03HTkfyU3sMRX9+B81WIVvqA0vrc3ErOX+j+DOTINbce+r9K+302Na0
         OA9NuvBPjOsoqHtG3CJUTvCzEVnaNFkoW0XguQAHj6I2GedelEzJf+GtYy9pFk8hn+5g
         MZe44h7rlO8vHH1MTGoGCxLYve41yft+rfY1cpOxn4VzmNbbaXXarpOtW1UGeRX75ZhL
         OfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950008; x=1790554808;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkLcYN3uRxWbi8ZMmnE1rmLo1CitPI3+eWi0uPYL3/U=;
        b=U/ZWMeTZT91hO+5aueVBZTNfr0PJrS1BVJqeljdgUSpbvJWUKwbCQPlmE7Y0f2Naef
         d6wdaAwKrQz8UcRAwX0V5qbElXehVFYcwd0sZhTR/TXD3LUQdlDb0g0D9HcRxPkgpcBN
         1juQcGaPRoP4lGRK27NBfmK6KTUU7WyfCszf0BFU0KfZvZwuD39Y6rcOrmAbStbV08Zr
         ScKQ6l27x8+MKOtcc9vQHD5I8yNRStIB3DYMQrv7cPcyAFjwka4Vm2II3mxQmyI2Y0DW
         8AwRZVqGF95y3XQUYnhuCtXTQkmWBdXYF6V6ChmdXFMLGXWD/XxlqOQ13O7Wie5KCYgz
         EsGQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1+btw1MaQSbmMza0zHoFM+gsqtRV4JqcNoNhN/L3x1LtkJ2EywQ6PIYSne5lJcG5KS+Ub@lists.linux.dev
X-Gm-Message-State: AFuF++kxniqAmkPjXQwfsxSBsXxE60Ef+aMEWMjy2vXs5o9vHgtpkTz2
	RpXQNZ2aHsgCM96e/1MowF4KFaYKE0on6XDWcJdwM/VYjkLP9IPKlwdI
X-Gm-Gg: AYBFou1jUGe8Ek7yr0LdcILwEtygfzEQsb4oSuL/EN9u3Auz+nCCb2TzjXWU+Z6ss6p
	LmxyX4NkMG9hWuH2m/Z941vGEHCDko8hwrLQW7xnZ39lJcqIfjaxeF4kQWlewWxUB7f52CpQI7a
	RlM/4079WnvbcogkfgHUTY+UtDpnXY2zdmCYK/DuqxS2aZzj+9Q3dE7PgqaDcRvGoK/QNriHdRj
	wV3RAnOTgjXdZHp92X1mebE4odRWYF+7ItBYwBAKTZoAyGt40RfCwlGmx5RyrLOQ+dyO/b51Cvp
	NOKCOSr1DP1nPWGCH9T0YTusne4IvFalGWT7EDfxD5sGd72aEEMxJEJPcvHiPPMW2bolUIzsK0t
	WmB2pMkzd/CdLuxSnv0xHHdHDsbTGrFsXZXxKguMew6zMJMNqMrLELHCiuajtD3LaeANuVMY7D8
	/haDLoNL2ZpyNDRrKbJyMRhfsZXzSxMCoADyyvqte7JIxnMc/miXuTb/e8SGrn1ZuGj+tUn1qSx
	sNYHg==
X-Received: by 2002:a05:6a00:e15:b0:871:e76a:2a35 with SMTP id d2e1a72fcca58-874dc9e013bmr12089560b3a.19.1789950007783;
        Sun, 20 Sep 2026 17:20:07 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2289557b3a.21.2026.09.20.17.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 17:20:06 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v5 02/10] ntfs: validate the MFT I/O geometry
Date: Mon, 21 Sep 2026 09:19:41 +0900
Message-ID: <20260921-topic-4kn-lkml-v5-2-938afe402cd0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
References: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6800; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=vI3Rih4fsjG7pE+BpNKXjzIctM75Zkg4mW9f07Yjfvw=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsHfz2ZmaoO/W4VVAleP1IvLvXZ9bmBZBI/pUz
 NMQubWW9dSJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarB38wAKCRA08jD6945I
 0+YVD/0aSsCCE/mo4/6N8SRwzRUaIhe3BLoxEizL3ecfy1UfsYQuNU42AtdM4is0EKUmwQcDYPv
 Z0grnOUL4mhdI/q2mmcsM2MD+LjMnC/ZOcmg4Yo6wdCvdX4odgviuloRskQQkGe20UdCN+l+pTU
 udO35SgJjwmMGSPh43qwixoichRjNFrpcbapMvbLrfEec5ra3ghU533Kq4O2Rxn9d9+7/JVa3Ij
 rqRpU6qs6NL6040EGiXehRCSgaAaJeHRpcJzWXTwb4ORHp0oxmS07gei+LVyIdKv3XtGXyPPYCJ
 U48ZruRcQPNkWZwdzwbv+/ylCRrSTwYTctSZS4IaEKayqCVLa9gaK0UGFdEC+f5/bsPrAVfsZ70
 oVL0pA497bE1ZVhV7fQQfaeetBCIkmIZsQbDlaVgKtHVtzZMQ3rzz2A9m+mkVZ2YFGFt62GUuap
 XBDrCNCW0PwLaUyCzKOjkZ9jzY+B/mhWoGz7zVcrCQg3ZC6ZbDL+s+/XugVRst4NygSCtCfpKlL
 RCAewLRNk0JHpjQzyTJtGRvmQtIbB3hl8fZl8aapOzEvOxI1Q+2q1Rup4xPuK5jto35Qd0K+XKT
 nqMCunTVP/7GhM/JtNMInzx+7Jkv//hQTAskmlsssSVYASDYiRRlnpyHlXn6mEQkZzoxMQS4DbJ WmFE0phEh7jrhpg==
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

