Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FCB395ACA
	for <ntfs@lists.linux.dev>; Thu, 10 Sep 2026 09:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033605; cv=none; b=CnHBU0l3HsDmO+NzH39ugLg2kopEXc0Sc56jacbyf/O87gaibg7rh2eDAfIIIMp+cw8WA31hdNih/UpVymsapreuzVYeQbynXyBCHPrGmfFqbI/29fGp2ggDIiCaKLxpndb6dvVY9IgNrcTMFZd/hvSaHJW7LAVRr9i6t4p/ENI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033605; c=relaxed/simple;
	bh=+iVxDv/XkCnBtNuUbKKzsPTeS6af2ulEai4aaMMCk34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VMH4aXEVvIRj3oNuzFB09cgUjJNoXQ+yXYDDv481fPc4/uyhNFXiv1CrZhWM34FNrlJ4K3cRorXkw2r51QH5Jwzr1G/RXLktZeUY4T+EAv6IKcqB1mM99BBUajnla8DkLBtRXvVqzeIVB7QHIjRpB32LE95wnKFwqdb0Xdf5tos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nx5FsUhH; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nx5FsUhH"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334ddcso11215755ad.0
        for <ntfs@lists.linux.dev>; Thu, 10 Sep 2026 02:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789033599; x=1789638399; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gni+3pq0Yw93w50xNVXz/4czA7TxMJjefRXqeqEit64=;
        b=Nx5FsUhHIczRs/LSbKNykzPIlihOG5kvLUujOKgq73Qjbsvv/+1FkSX3XKnQlqNm+0
         0rwQLvNMAMJlrZqcV3FUY8yDHM/Uxt71d9vv+GfkixFq+BionkhRq776hraNS2d1wsCg
         Ezonm+5GVMGkyuvLg40GUR5Zg/RIbX1J/DJ0fZhJYVgG5SBGYdge4fTUyR2Oa0GJf7IF
         lhQaK6I4gjQ3u5L6gjTvzKUyl+iZ3aePfSZijCzaW0VhE0bbxybhuOWG7ZHK4he3cgy8
         6HLeDhv3ev8df2CveBjnVuMu9vmhHuVg8Fb0DkFjJPfuQAmwVoXTFqU53kjEbAobM/1Y
         ph6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033599; x=1789638399;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gni+3pq0Yw93w50xNVXz/4czA7TxMJjefRXqeqEit64=;
        b=QUPoGbEGVcwbee4uRsXFFNtTBJxmeKNUxA4cf3VqOPGPXwjveTBO26dU42v6uj30J6
         nGHYX6aQ94n72jCgnU2K7DljHe/TqHChF4AP4IG+B1kYi7GAhWyd8A4d6OD7+lI1BIcl
         v3dyBsQHRjersGD2NFNCReSqzO6H9o4gEd504HUvNLpwZlKHCd3V533NqoSGvrd9pJKH
         25qtCvIH9HyCLB1vx9Z+SIa9os7+nap2Vg2ZJRrkYqN23GT881Hkq1+hWIq7iGsGoOnO
         LAhdWsYOcyioIyaW/kuPaXOpVTj0o6vDW6pYxD6l2TEyTieM0Ml08zgGKTxApQRk72y+
         p5Hg==
X-Forwarded-Encrypted: i=1; AKwUvBw7MID3LO1YzqTtTA1UbnXfa8Dl602uZJwTn1eNDNkWKPnDAAskQ3b9vC+iqGJss1dSS5WZ@lists.linux.dev
X-Gm-Message-State: AFuF++l2Oa1QyRGZ7Z1zB+BwN2FtoPSCvbwm1pP/3Fujf+hWBpz3PaIx
	Ov+RJK8w9s88ULDLsro1jJfQxMpwhNoy90JzdSA0FGrd+pjoDNq1Sf0N
X-Gm-Gg: AYBFou2lhL98UbCY9z4TLhgTlcq7ajFMafgyRh8OXdl1hSUKDUl7KEmflwE24CUtFhq
	aVMWlrujMm4I+rK69FsmMuG/teufbSNue7gZ17EQsGXlE8g7QE2aOFX9qkEu7Gz5CbAHdAS5NWO
	/u7q6PhERIGSVoDwfTupal93T1pwwokS4VRmxEK2pf06r6v5emLJlDkZGP0nG3P/8EtCNU7WY1N
	Ezm/EmiHT40eJr7nM5a5oXvgLi4wX2I7LHrsAu5puENoJfxSjRw1u01w4Igri+cT0lI28SRufCo
	523/GMh4Q6PZxukzAb8oQKuiczRI1SN9z8r3QLIRZOhtxZgxI/fJngQ8AEyKwldfL3i5sq7p/D8
	32ham/vcL6Dezznn3Ycp/6cGkfN1G/FaqF1y6SpXhCiXT3URJyxOZ3635P8sbDEFiIOMTzHHH01
	Dff54fa4lO8/ePnsiR+0xOjmzHF8Kb63ALn5gXz07Fy4r8mbK/blCJ811q3+GKxzgAL4RW36cG1
	I2XCBcxkAnVgysE
X-Received: by 2002:a17:903:46cd:b0:2db:39da:90f2 with SMTP id d9443c01a7336-2dd07809f49mr92208995ad.8.1789033599147;
        Thu, 10 Sep 2026 02:46:39 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14841054sm86827285ad.3.2026.09.10.02.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:46:38 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 2/8] ntfs: validate the MFT I/O geometry
Date: Thu, 10 Sep 2026 18:46:04 +0900
Message-ID: <20260910-fix-4kn-lkml-series-v2-v1-2-f10a09fc0176@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910-fix-4kn-lkml-series-v2-v1-0-f10a09fc0176@gmail.com>
References: <20260910-fix-4kn-lkml-series-v2-v1-0-f10a09fc0176@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5054; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=+iVxDv/XkCnBtNuUbKKzsPTeS6af2ulEai4aaMMCk34=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqonw6LCsWhkegzbCcfo5OTyJRpz6AucbQb7oQJ
 lQ5CwwyfUaJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqJ8OgAKCRA08jD6945I
 05vtD/9SxteU+fQC2aRH3gqTW1sfV5A1DiZpbS4Uyw2T10/2JWAzxPKMXy9nHu2L7rodh6aRxS4
 P4NP2OMrB8iZgVUOrGlQY3/Xoi7O55v001MRww0SkjW8EOG6COeWBTYSY2Gy1vOkirP5U8/KIMH
 6fES5dzksfhnC3TlGMOFZtrzYJ/nAV16FPtg9h63iT+L3P8pWZFKFvQgMWx5SCrAkFg7xLg36E2
 OG2dXKYrEWu3M92CfU5DGIWCV6LwGy4ZA15n4k8Wk/uOM69gs2DL3jg2I86WTsOxrzEY0dIxreQ
 vTHX0M9ISwuBWsZEVC9jg/hQPkNPdaJ7u6ZFwcZ0sHF+y28D0lbrOuu/YykKYbcBU7ibN6nAecj
 456GleX6GLmRBG45PEZgJrr/jj7DkPRGGvt73yHOS3k+/0fKaMYo8IB/rvRw5hXjyuKRcdV+YN6
 Gboe1uwQOS1fbCIuRz1ndL1rMkuDH5QypajTj9R/sv9iUZYc4L3W4Yn+BIfEGTV7GcaxJT67Jdw
 8na60H739fl4UCyey92sY7m968qWIOOG3easZVgyHdSPcq1h2nCm59N0yxuOYud7PKj0UGyUrL7
 afMym7v+G1CM7O9Vx26ZuOFnqFwAI6BalKydEKx5dwQFEx7QCMl/HNIGO1nHcSHDyqL3Dvuh6EK sPE2tsCADHMI7UQ==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

MFT writes must consider both the device logical block size and the NTFS
record geometry. Validate those values at mount time, then cache the MFT
I/O unit used by all MFT write paths.

Reject unsupported geometries and use the larger of the device logical
block and MFT record sizes as the MFT I/O unit.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/super.c  | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 fs/ntfs/volume.h |  6 ++++++
 2 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index f4a73e45773d..44a8614507ae 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -530,6 +530,8 @@ int ntfs_write_volume_label(struct ntfs_volume *vol, char *label)
 static bool is_boot_sector_ntfs(const struct super_block *sb,
 		const struct ntfs_boot_sector *b, const bool silent)
 {
+	u16 sector_size = le16_to_cpu(b->bpb.bytes_per_sector);
+
 	/*
 	 * Check that checksum == sum of u32 values from b to the checksum
 	 * field.  If checksum is zero, no checking is done.  We will work when
@@ -550,8 +552,8 @@ static bool is_boot_sector_ntfs(const struct super_block *sb,
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
@@ -632,6 +634,51 @@ static char *read_ntfs_boot_sector(struct super_block *sb,
 	return boot_sector;
 }
 
+static bool ntfs_validate_mft_io_geometry(struct ntfs_volume *vol,
+					  const unsigned int logical_block_size)
+{
+	struct super_block *sb = vol->sb;
+	u32 mft_io_unit_size = 0;
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
+	    mft_io_unit_size % vol->mft_record_size ||
+	    vol->mft_record_size > 2 * (u64)vol->cluster_size)
+		goto err;
+
+	/*
+	 * A containing device block is mapped through one MFT runlist
+	 * element. Keep it within a cluster so that direct MFT writes do
+	 * not cross an extent boundary.
+	 */
+	if (mft_io_unit_size > vol->mft_record_size &&
+	    (vol->cluster_size < mft_io_unit_size ||
+	     vol->cluster_size % mft_io_unit_size))
+		goto err;
+
+	vol->mft_io_unit_size = mft_io_unit_size;
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
@@ -644,9 +691,11 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
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
@@ -719,6 +768,9 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
 		ntfs_warning(vol->sb, "Mft record size (%i) is smaller than the sector size (%i).",
 				vol->mft_record_size, vol->sector_size);
 	}
+	if (!ntfs_validate_mft_io_geometry(vol, logical_block_size))
+		return false;
+
 	clusters_per_index_record = b->clusters_per_index_record;
 	ntfs_debug("clusters_per_index_record = %i (0x%x)",
 			clusters_per_index_record, clusters_per_index_record);
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index bc85a9592245..9b465a227a7a 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -111,6 +111,12 @@ struct ntfs_volume {
 	u32 mft_record_size;
 	u32 mft_record_size_mask;
 	u8 mft_record_size_bits;
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

