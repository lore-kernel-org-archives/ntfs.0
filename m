Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04A0DF6C
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 01:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520648; cv=none; b=QpYUEASiwpJO1jVil3uIQw+GR0EjXWII5KRkMZc5z66rjWdcUSHGGpI4Q6miLRTqN5TeliarDRRp+6W5Ofs3vIK0fpTMgLBtU0q28NNj5Fo0n6VQw4RjzqLGKiFMWekecAsbYVJur0Ua4LBkVZNovstViX3EulExF4A15kMNelQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520648; c=relaxed/simple;
	bh=igyadd/dUZ/QYoCNUqfGHSrDvu9twPsgSFPGkYHEtOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mBha4eFaG7ZXH5wwbetPYeuC85EhvYIxDk7DtX6P33MUY2bqyv8VBU627m7ZPvD5nAGNobfHQvNWPRvNbM8qAm5y7fSMwDUMJ51BvyKmxbHcaN2tzIcEfLlLPq/wq69eIlZclSh0jd3XcDwl8LkEYHiWoaxdWTvauVaS3BTivtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ohGUtbpl; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohGUtbpl"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso316155a12.0
        for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 18:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520646; x=1790125446; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uaPFFQsbAe0pWOvkglT6TVjYtCN3aizgLkKbgRKoYxw=;
        b=ohGUtbplOI+QzuzgFk1bBtYW+KARUc29XXKFWSrwb8/sxKLPRnsIwH5annNBWPQj8x
         YezwVS4a4KI8GXzz8UanvywONjEhp24HEkfLSuK4OGoR/nxRQxWEiWCZMu7ATv1PbznW
         bByWoWOFbVm8W3zhf0n5QriNpLzXHzcf1QHf4XcbU6xhGG6W5fjzVRhiRnlMtSxbowlF
         VX2rYj0HSXV7iDOseSLUm7Zw/18xP53b7oSHxknUJtk0QgbMEkMBL2WMfo/vu+e/02WM
         UQXJ7izgdJsapQtEjkMMuqzO0cpl85ctygCEvi0Shw9CCWblbFvtq74OorOreGRiDJwc
         lUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520646; x=1790125446;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uaPFFQsbAe0pWOvkglT6TVjYtCN3aizgLkKbgRKoYxw=;
        b=q1i5JH41VM4lHBWQYMTbsmp5BbO/3VwAD72pB/BI/3GqtFPky6BktbJsYVpP4Ld40A
         4UsU/pJnE/zoMFbN+/jHN8Gz140j1Ci3Oj18IN+JL3VfSI3NWtA7Idb/84Wo0GTZ/a0M
         yjMathEg0QoZiEOdhC09O789+yK1tuGiHmGOLj6mDRlKHygL3TrSB5chMVSoInjF4IQR
         XqFQi5ZdUVAP7/g7rbfUHUNZttQIjnOTNpjPrIxhh/1wYkdkEM4Ob0GL3ld8uwA14dIN
         K1WKxG4ydBGQDn6bkDlLaBx3UwmJ6cgDZXweaeL7kcKHuRQsd+kdCG1wGHEX88PMWW2b
         FhnA==
X-Forwarded-Encrypted: i=1; AKwUvBzTL2RAJoJ1l+JQwdPt1EO6ONLjM42rWzgEc+3qnvKbw0+l7aDzB4UCMHqJlNbcukU+5+8D@lists.linux.dev
X-Gm-Message-State: AFuF++k9gAy3OeSXfs9yEcPQzH5gSvwByQJwPbH3uUGz9DDH7VquFgtY
	VVaSfqYKfUCeL0WaBC2/Ybzu7rDaxhXWztGUPjvVJRAFuFOuYUFyiPRFHB0qgA==
X-Gm-Gg: AYBFou1CX83B37IUEcp4j2zqXTPYMORxLUqyQFOw5EDbYzWp5CUmZpNxzymCXmqMRfF
	iAegOeZEmCVolj56b8+atilCZfY4k1ceehKXERYZAKBRpESka9Ro6s76pV17wahXua1XdwOblw0
	mczA8FFw3S622Pb3iYKs/ZNmpwq5pn5Fb2AMjTEK96jPQK74L+AUgpJiw2Gsz4Hx5TZQNWvQUiQ
	AgCf+Yby4yIPq90ZjpcYshOuaplEEor8QgUweqPrUnKbQ+nVZF7oavmeA8fDz3a2LgHewVT/4B+
	BIEIfm+vhWtYfmjjPnV8R8iwLBNY8M80MN6rcadUNle/8pupd2qZC3+UCspEJNia52W77w344Ki
	lLjzIXSu7AsWQcvTUTHTUOGUKRhdFTE9z2wjkXkAdBEDDVElYOIU570ABu5l2h92mAA7vnmVxrs
	4DqCVxTs9xCa1y/2mW9icXnNcAOKPIcdznDgJlmXzF2x9Yb7M1qbu+xgNyFHKiTTyyBLaunExa8
	fwBvw==
X-Received: by 2002:a17:90b:1d44:b0:39e:1693:c3c1 with SMTP id 98e67ed59e1d1-39e1e4c8bb8mr1466604a91.17.1789520645777;
        Tue, 15 Sep 2026 18:04:05 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fff3sm2880995ad.8.2026.09.15.18.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:04:03 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 07/10] ntfs: write MFT records through containing I/O units
Date: Wed, 16 Sep 2026 10:03:19 +0900
Message-ID: <20260916-topic-4kn-lkml-v4-7-4f8a574ba3fb@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5948; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=igyadd/dUZ/QYoCNUqfGHSrDvu9twPsgSFPGkYHEtOE=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqqeq3sy/QLuTkkd5mden6vSmBU9X76Mww9aKQr
 Uvzo1+VVZiJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqnqtwAKCRA08jD6945I
 05d9D/9HBDq+0d1NFJmcG8NDQEa8L83tEzGWvWSH67kdK4IhWR2tTpLwjUXcu+/GQirIC+ec2ju
 9Ejc06qGQZF4+DoVAKAgVsra3bmsVgV1t1IX8vBApeGtJ4fpCkwsP6XP4ZJzSEC4OuavBe75HU+
 8Tv9Tb5YakzqMHop+cJ793zQsRCpxPEaHQkx5F/GnCnPG+PaG3Eb4i2az2tp8GKOrlTjq6GxFjO
 mUdFTVl5TsDDQaIxDay/E6FVQqr3xlEFZUZZN5G4myocY97M80M4RHSZfe8L5RA6RC/iOH8TiYp
 Dp8msYd8rbYBaqJmN1b1OuicPIIFdAM88SP+kS0OArVSG8osSd5woNxwkaRY9NYj5typv1dL9sn
 geXVTaxsi6qFiXcgqrGdrOxFRDQBjSqcN02hoYlKtkXo7VSOofgQBEj04Oc/yWDhNY+S/XPXJpJ
 mVSCptugL0+bGNSoy2YoTLf72eK3eb9fsmlKzaOC0c2bqV6Y72Q5ZlHilVbvVGLwGqzLV6R8MBB
 ntOhqkWw0uS+KEAq4VNSs6nXtXH73KJLEQBdKY92ZgPCVwQo79Ze9hAOvEB5UcgjoaiLO9nhdCW
 QEsgygVD+9fiZqNw5OoEkFaLFONRaRqETx6W9WB43bCxTFrl2sHcl9kL5ia8geIOFy8sX7lahpV lvkOrwHl+qElPYQ==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Use the configured MFT I/O unit for direct writes, mirror updates, and
generic folio writeback. On native 4Kn devices, multiple MFT records can
share a device block, so submit complete containing units while preserving
unselected neighboring records.

Track selected records separately from records owned by direct inode
writeback, and retain the existing runlist and cluster-boundary checks.
Force direct MFT writes to complete synchronously when the I/O unit is
larger than an individual record. the following patch restores
caller-controlled completion.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/mft.c | 57 +++++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 2adc7688b44d..6379c7b39bff 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -597,13 +597,18 @@ static int ntfs_sync_mft_mirror_unit(struct ntfs_volume *vol,
 static int ntfs_sync_mft_mirror_record(struct ntfs_volume *vol,
 				       struct folio *source, const u64 mft_no)
 {
+	u64 mirror_file_ofs = (u64)mft_no * vol->mft_record_size;
 	struct ntfs_mft_io_unit unit = {
 		.folio_ofs = NTFS_MFT_NR_TO_POFS(vol, mft_no),
 		.len = vol->mft_record_size,
 	};
 
-	return ntfs_sync_mft_mirror_unit(vol, source,
-					 (u64)mft_no * vol->mft_record_size, &unit);
+	mirror_file_ofs =
+		round_down(mirror_file_ofs, (u64)vol->mft_io_unit_size);
+	unit.folio_ofs = round_down(unit.folio_ofs, vol->mft_io_unit_size);
+	unit.len = vol->mft_io_unit_size;
+
+	return ntfs_sync_mft_mirror_unit(vol, source, mirror_file_ofs, &unit);
 }
 
 static int ntfs_prepare_mft_record_io_units(struct ntfs_inode *ni,
@@ -623,6 +628,18 @@ static int ntfs_prepare_mft_record_io_units(struct ntfs_inode *ni,
 			return -EIO;
 
 	cluster_ofs = ntfs_bytes_to_cluster_off(vol, record_byte);
+	if (vol->mft_io_unit_size > vol->mft_record_size) {
+		cluster_ofs = round_down(cluster_ofs, vol->mft_io_unit_size);
+		disk_byte = NTFS_CLU_TO_B(vol, ni->mft_lcn[0]) + cluster_ofs;
+		units[0] = (struct ntfs_mft_io_unit){
+			.sector = ntfs_bytes_to_bio_sector(disk_byte),
+			.folio_ofs = round_down(ni->folio_ofs,
+						vol->mft_io_unit_size),
+			.len = vol->mft_io_unit_size,
+		};
+		return 1;
+	}
+
 	disk_byte = NTFS_CLU_TO_B(vol, ni->mft_lcn[0]) + cluster_ofs;
 	units[0] = (struct ntfs_mft_io_unit){
 		.sector = ntfs_bytes_to_bio_sector(disk_byte),
@@ -676,6 +693,8 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 	WARN_ON(NInoAttr(ni));
 	WARN_ON(!folio_test_locked(folio));
 
+	if (vol->mft_io_unit_size > vol->mft_record_size)
+		sync = 1;
 	if (folio_test_writeback(folio))
 		folio_wait_writeback(folio);
 
@@ -3063,7 +3082,7 @@ static int ntfs_map_mft_io_for_folio(struct ntfs_inode *ni, u64 folio_byte,
 
 static int ntfs_prepare_mft_folio_units(struct ntfs_inode *ni, u64 folio_byte,
 					u64 file_limit,
-					const unsigned long *record_writable,
+					const unsigned long *record_selected,
 					struct ntfs_mft_io_unit *units,
 					unsigned int *nr_units,
 					unsigned int max_units, bool *defer)
@@ -3075,15 +3094,19 @@ static int ntfs_prepare_mft_folio_units(struct ntfs_inode *ni, u64 folio_byte,
 	while (unit_byte < folio_end && unit_byte < file_limit) {
 		struct ntfs_mft_io_unit unit;
 		u64 record_byte;
-		u64 cluster_end = ntfs_cluster_to_bytes(
-			vol, ntfs_bytes_to_cluster(vol, unit_byte) + 1);
-		u64 record_end =
-			round_down(unit_byte, (u64)vol->mft_record_size) +
-			vol->mft_record_size;
-		u64 unit_end = min3(record_end, cluster_end, folio_end);
-		bool writable = true;
+		u64 unit_end;
+		u64 io_unit_end;
+		u64 cluster_end;
+		bool selected = false;
 		int err;
 
+		io_unit_end =
+			round_down(unit_byte, (u64)vol->mft_io_unit_size) +
+			vol->mft_io_unit_size;
+		cluster_end = ntfs_cluster_to_bytes(
+			vol, ntfs_bytes_to_cluster(vol, unit_byte) + 1);
+		unit_end = min3(io_unit_end, cluster_end, folio_end);
+
 		record_byte = round_down(unit_byte, (u64)vol->mft_record_size);
 		while (record_byte < min(unit_end, file_limit)) {
 			unsigned int record;
@@ -3096,7 +3119,12 @@ static int ntfs_prepare_mft_folio_units(struct ntfs_inode *ni, u64 folio_byte,
 			}
 			record_byte += vol->mft_record_size;
 		}
-		if (!writable)
+		/*
+		 * Direct inode writeback owns unselected records.  Their folio
+		 * images are stable while this folio is locked, so a containing
+		 * unit can preserve them when writing a selected record.
+		 */
+		if (!selected)
 			goto next;
 
 		unit = (struct ntfs_mft_io_unit){
@@ -3153,7 +3181,7 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 	struct bio *parent = NULL, *child = NULL;
 	struct ntfs_mft_write_ctx *ctx = NULL;
 	u8 *kaddr = NULL;
-	DECLARE_BITMAP(record_writable, PAGE_SIZE / NTFS_BLOCK_SIZE) = {};
+	DECLARE_BITMAP(record_selected, PAGE_SIZE / NTFS_BLOCK_SIZE) = {};
 	u64 folio_byte, file_limit, folio_end, mirror_size;
 	unsigned int nr_records, nr_units = 0, max_units;
 	unsigned int nr_locked_nis = 0, nr_ref_inos = 0;
@@ -3221,11 +3249,11 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 			    tni->ext.base_ntfs_ino == NTFS_I(vol->mft_ino))
 				continue;
 		}
-		__set_bit(record, record_writable);
+		__set_bit(record, record_selected);
 	}
 
 	err = ntfs_prepare_mft_folio_units(ni, folio_byte, file_limit,
-					   record_writable, units, &nr_units,
+					   record_selected, units, &nr_units,
 					   max_units, &defer);
 	if (err)
 		goto out_noio;
@@ -3309,6 +3337,7 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 	submit_bio(parent);
 	ntfs_release_mft_write_refs(locked_nis, nr_locked_nis, ref_inos,
 				    nr_ref_inos);
+
 	return 0;
 
 out_noio:

-- 
2.43.0

