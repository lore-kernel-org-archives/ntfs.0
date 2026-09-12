Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4962B32B125
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230115; cv=none; b=oiZsOxw8vw309brRNTpbGNa44jTgnIVVTxa7WD52QPHM/CcrIORK63BvstIasJtDqUsgxfbMdlQutssv2ugv5l8nMp1QnDkGW967UmO0vvYbMQDEPr9yckun5Rje7PZzyAyqKUFsV3nXz4JhS3EBgd7ktsGXFEt/dzchnhm9vXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230115; c=relaxed/simple;
	bh=+d/7Xy63w2R9xqCMjN7w3xl7ofKXl8qoLpSe9MUMA4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ULyaA57I8XGHzbaMGsOi4YnNWtrJhvADAcfwrVH4THuzJ5SLSteClUkZUgQxUxAuQQnLvrQcCsruyTpyyLJaj/vqnL6HSwdt334ihjhKhh+P0BxpwV0M/QXSQLb8n9L7WEwzV8aYjSp7uKqAVqGnkQfFTQY0LM7qqo86kpcWDv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=el3tcb7W; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="el3tcb7W"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so830727a91.0
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230113; x=1789834913; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IaDPYlYr6yGNLlT+PzoRAf1mD6Qibx/N43RnMmSbRZU=;
        b=el3tcb7WxFYwdbx61BDNbw4ZpEDCv6+yq3CDY8O4bUAqjWhrRI04szwREhBzU4el4J
         7254qhFwOiquiOyLOFFNGLhOZut3NST3KRcmaz2y2fxgUCh3hKW9yu/iKhkjHDuq+2RM
         vDe3RIvugD/ViKGSQ63ldm3Z/yGHjxoCsk+On36KPe2PtLQ6sjh/IrLsO8RMlx7SbQqv
         bLEqleUAM3OKhhd/C0LdZ1ZNm+kG58kpvwFFxC/EkSODwPaisv/DhcsCOrv5n1PudWhG
         MqPzFazhFniU0Y7po1bYu3lU9FsC4ZFsbI2P5f2EeBTdMROEDjsnE0H6/3U2j6FdQk7e
         0hag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230113; x=1789834913;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IaDPYlYr6yGNLlT+PzoRAf1mD6Qibx/N43RnMmSbRZU=;
        b=UfhylXUu2rdYIlpfZt21Il1UutEi3djnIIXG5rI3+Sh4L8YkLS+XtnONcqxcYCWNYL
         sE7rGD9o9eZ3ANVPxO62Uj9tZBObsDiIWOjadr8N24ZxVMUkzBezB0QhQ8/7geaiEXMc
         348p4IYsRx10oF44Vk5fLLR9gWgheqrwsP5IKGZzvhf/HHKJBiX9xlHH9lUW2swd0az4
         DC26eSCd59o3/DIzy3i+IdH+hT9ks1NFlf+VJmkxF/rS8k/0Kpg5dC3hn5TY2bVChNKv
         QXNju2gcvY62+c2OO6p6FUkL04YA3bXFwakkBRw9PgZ6ItMLmNpTfyI14GiuWkXFOekg
         BmBw==
X-Forwarded-Encrypted: i=1; AKwUvBywjmAnvOVuGWDfhaVIT0F0Gn+DBaG/aEBtY45IbNwUj1WxgjitaBfla4B7BjSNILhHUKUJ@lists.linux.dev
X-Gm-Message-State: AFuF++nAkzwB5VJtRECi3L2+eo6ZMCWA+H1vOU/0Hub63RSfrUz0fkg3
	D9MkEhcBEYeh1++Pzi21yeXGW2+9k/QzdNI+KvSR0saNbTKipmuX1LNgjija9w==
X-Gm-Gg: AYBFou1d5LbwK3kenhPT45y1UwpnAA4dvIUJlT5cH5E74ikO4AOKF+4Qirrk4LGoBS2
	u5LH6EGJPgWtQUMBxtQtOqpn+BqGpFsw2E1R5pIR7TKM6XAjqY5X+z2yH2/A4Ut0Lpn5sGZbWbn
	6bkkxsL9Em0W/OgerOGOIx5x5teG2YtK/Hqs9tMhT2qB0hFTDI4mXC42Iu2sePqk92u6VnzalhS
	hnHuaYCOaS5ABmjxhR4mNjGTJKIPv2Ycd3fNMLFt95zfzBxglya4zu4RcmHkKl8zaIo7MOItNP4
	5bOxWPzm5P11xqyN4NZmYsG1A5t4I7qUY0Hp0TTzSF6ee99r1812hsINu12Q1bNmp5PVTdO4RUN
	o4mjDAceKSgg/TkabiUcaWo7S0AI2jZjnL/PrLQwnUtugjL0znc//+tjV4l5T00ebi9Cykr/WRA
	ichvUeLDaOkhQ4uASCtpO57v0QFrrOw8fxjWpTcJFZeXBYfy657Z6eG1kiCMTWleReuVdEcp3g8
	c/kkaAsHjjMeMBwjpRcyrH+
X-Received: by 2002:a17:90b:4486:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39d9c2346b9mr15727618a91.16.1789230113372;
        Sat, 12 Sep 2026 09:21:53 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b21sm10804999a91.13.2026.09.12.09.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 09:21:52 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2 02/10] ntfs: validate the MFT I/O geometry
Date: Sun, 13 Sep 2026 01:21:14 +0900
Message-ID: <20260913-topic-4kn-lkml-v2-2-2bc455e81635@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913-topic-4kn-lkml-v2-0-2bc455e81635@gmail.com>
References: <20260913-topic-4kn-lkml-v2-0-2bc455e81635@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789229949; l=6800; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=+d/7Xy63w2R9xqCMjN7w3xl7ofKXl8qoLpSe9MUMA4M=; b=6xvHwo+Spkf+yPr1ifpROUZQCdS1mkPpJeswvRJVJ9Y9VAjtaMe4uXXs2Gb4gD4FIqZ67hLyb KhIziE9z3u8A2xYOjXoHdZqCXh0ItuzAZLsyqzNXalSexBW+NbUrxpa
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
index 60d43339c590..8c0ec982093f 100644
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
@@ -2284,6 +2351,11 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
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
index 65fd3908af26..0e7c472fc9f9 100644
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
@@ -107,6 +108,13 @@ struct ntfs_volume {
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

