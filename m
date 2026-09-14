Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6534A2078
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 15:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399335; cv=none; b=S3Aa/gWb5z6pJBFJOKn1MnmaVv3TWmIxJ17CUUH6xlBcwv7gjkyycZTe62Z228B2ZTXA4uTllcRID/gliocxmQGt1s2SwXIPatUlU984CEB/z4thp8C+p7EZcKTixOCuQPrMBaxmJzWOuaVAFLmCivyDrK+nrm4G/S44At77qW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399335; c=relaxed/simple;
	bh=4mCd96zwH3IsMJU4wWdSF9IpqMtC6pkVBNNia17qRZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RcDAABtTjfgPT8lPaD2zm+3W0dcxMTsAnR8Xvpk1Eu6Gk9ZLtgyAoof1oUTjrwvQZZvxMWrKoSAuasc3FU7RFzynP9jVKJ3iDYNBvWKBRB66d/1PJaqUkQjF1sS4F7UOVnBzMyzMkA/byl9ITa56iSs6azzSc8aAueCMx8GNF98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gC5d3+kl; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gC5d3+kl"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so1784234a91.2
        for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 08:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399333; x=1790004133; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XB7NjisC+848C1/agi/aSuj/fy/fJeYSh61sQdlT/Zs=;
        b=gC5d3+klLU7/dXNSaAO+IQZRPj9UN7hbJ0AmUDilanDDcQQRbarrCLawL8wsYGJGHE
         iY+o7cM51vcnlfs3ZPhk+x95B00Acc2iLryi/Gb/xjvLvv1YqZC290xyolXcUB3xWmpE
         0H2krx3X6PT8qAzdgmodYdX/ciqRZlFoklKcwUAIMGudrqj0ZpR+BKx+bRhDzH0PGiWy
         pPYCtG/2atMNjRma86Pd/JxsjSoabha4iWLMNJUbQ0en2aqLG6g8+oSbqor4A6PyNGBC
         uwIV2pbW/AYa9EjodXKZXpFIV6sVjCrzRP8pwnOdtTtpUKGzQ9UiuvxcsX4bUPtVwB/c
         fSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399333; x=1790004133;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XB7NjisC+848C1/agi/aSuj/fy/fJeYSh61sQdlT/Zs=;
        b=fs7fkn+Zs7HzkFa79n/Gso+Hc3lDAjUZzunD9KtZGi6K8Dfx+lhBdkcUD4nVamYyT5
         di4mZXhrE2yidBFOw4k40d1bcNU+56iZRIty+alCvU7521APDo60CcGIPsLnBa3wrB4Q
         64vFsg8OLZbSf4OqIzPWrJ3uK93POSDtWB1NgnOeAmz5Y0Gn35KLeeGhGMKYiSKrBjsA
         u/sWvjnZNZ+ArqoUTpv8QYXObDzAgrYB0eGoDgJmZm7sXI5ZkhYw//arDHkdEa5ETfkh
         O/NhCYJ3IckBp98JK7Gr+lDBgp7EOx1tmWJXWuFTF0mQgULFWfR6aipXa36l4TPvsFT9
         BrMg==
X-Forwarded-Encrypted: i=1; AKwUvBy5XAcAo3qSQPfgyrfFuBgrLsMuuUXB5q0wLgCKOh2Q7HPsn9NKgAG+iWhzFAq7SnrbWDGK@lists.linux.dev
X-Gm-Message-State: AFuF++mwoBeZwD2XInjSZ6Qu4jmBehtPcHRBjl9v12sP3BBMnKwiG/YS
	2X6xV1jMp+c8RgC2+UgmJOuNT7RSZO6oAcALYO5I4z/BOfPGM4JI1fU5NO+5pA==
X-Gm-Gg: AYBFou1MoABi6ShIaWSaZ9xW3/ykc8qY2Wviq4zDQRTAMoIk1MiYxm3z57RDYS/3Rvb
	CMjT6fOlh1ylqCzYWFkvMkhB4xWUnAdt6Wh/wfv/+SMpqd8235Q7lvKR610cYMCAWaI0CxRdqEB
	6f5neLkTec7nZzeUueaoQSbjaYDiTf/eKeI9YXJT37znfwqU8ritwdgjHagD/wlW2siDVxHdauq
	ZoEDib2N8IN693S+1OmGZmeSdP0waccuWYqcCWYWcZ61jwOLguqHDNSVwtUAlQ9E42nHxqHN4Zy
	5dy+YL0Bb644nC0JqovJ7k7k7gfpqx6JvM90LPdw8hFHOQ0/V3IwG/RnDvkGEeNGtbp5H06suKV
	ozmFRWjFiOlZ+RDeoJ++64WqELB5h02FfYt7dn6dBTzS3w9DqPrq2bHXFtedqbij8SnMmAST9ef
	tenFVJLvPGWCWp4xhSUYHmrq+nZhaw8Z3c96Syzc6VcCfoqWSMpHuxMCsFFiFmBOjE9CRGCDhrV
	+apO2xt+Yk62NuRgmIx99E=
X-Received: by 2002:a17:90b:3c05:b0:39d:ec16:46ae with SMTP id 98e67ed59e1d1-39deff7281dmr4746081a91.5.1789399332932;
        Mon, 14 Sep 2026 08:22:12 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd6cd982sm31667a91.0.2026.09.14.08.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:22:12 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 07/10] ntfs: write MFT records through containing I/O units
Date: Tue, 15 Sep 2026 00:21:36 +0900
Message-ID: <20260915-topic-4kn-lkml-v3-7-447cfa17f780@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789399242; l=6075; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=4mCd96zwH3IsMJU4wWdSF9IpqMtC6pkVBNNia17qRZw=; b=Wc1WfB/NpwiIJ4g3jnqmLE2fGNqRjy2yocVAFG32J+TCkAnc0kafFdCaE3x0SpWM1U+4VVOty lV9afFG9TH4BoF39uYxyuf9KcEXznwOvg60+/BodDuhdn3d2Miz+y3c
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
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
 fs/ntfs/mft.c | 61 +++++++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 16 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 786c8f837a9e..667f8dcd9f57 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -596,13 +596,18 @@ static int ntfs_sync_mft_mirror_unit(struct ntfs_volume *vol,
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
@@ -622,6 +627,18 @@ static int ntfs_prepare_mft_record_io_units(struct ntfs_inode *ni,
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
@@ -675,6 +692,8 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 	WARN_ON(NInoAttr(ni));
 	WARN_ON(!folio_test_locked(folio));
 
+	if (vol->mft_io_unit_size > vol->mft_record_size)
+		sync = 1;
 	if (folio_test_writeback(folio))
 		folio_wait_writeback(folio);
 
@@ -3062,7 +3081,7 @@ static int ntfs_map_mft_io_for_folio(struct ntfs_inode *ni, u64 folio_byte,
 
 static int ntfs_prepare_mft_folio_units(struct ntfs_inode *ni, u64 folio_byte,
 					u64 file_limit,
-					const unsigned long *record_writable,
+					const unsigned long *record_selected,
 					struct ntfs_mft_io_unit *units,
 					unsigned int *nr_units,
 					unsigned int max_units, bool *defer)
@@ -3074,28 +3093,37 @@ static int ntfs_prepare_mft_folio_units(struct ntfs_inode *ni, u64 folio_byte,
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
 
 			record = (record_byte - folio_byte) /
 				 vol->mft_record_size;
-			if (!test_bit(record, record_writable)) {
-				writable = false;
+			if (test_bit(record, record_selected)) {
+				selected = true;
 				break;
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
@@ -3152,7 +3180,7 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 	struct bio *parent = NULL, *child = NULL;
 	struct ntfs_mft_write_ctx *ctx = NULL;
 	u8 *kaddr = NULL;
-	DECLARE_BITMAP(record_writable, PAGE_SIZE / NTFS_BLOCK_SIZE) = {};
+	DECLARE_BITMAP(record_selected, PAGE_SIZE / NTFS_BLOCK_SIZE) = {};
 	u64 folio_byte, file_limit, folio_end, mirror_size;
 	unsigned int nr_records, nr_units = 0, max_units;
 	unsigned int nr_locked_nis = 0, nr_ref_inos = 0;
@@ -3220,11 +3248,11 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
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
@@ -3308,6 +3336,7 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 	submit_bio(parent);
 	ntfs_release_mft_write_refs(locked_nis, nr_locked_nis, ref_inos,
 				    nr_ref_inos);
+
 	return 0;
 
 out_noio:

-- 
2.43.0

