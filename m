Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0239933B975
	for <ntfs@lists.linux.dev>; Thu, 10 Sep 2026 09:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033617; cv=none; b=VIWLcwom3iGOGVaNXyUSaC11NKU9JCOpZLN6y2zI+EGbWsK2mj38goFlbjqaL/snK9qyITT+W1JKNeAmLn8z26lAXhs+F/wDxApARPPhkOWgg+tNCl2gWCJEy4z0us3sIA7wptdhtYqvYFDzIe2+hu0ydBlMTj4sDj9nUKq1uEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033617; c=relaxed/simple;
	bh=1zPQz9JWSbXzSa++vrJudhJdvd26fF3c0EeuY1bME/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YMo+kyBIXGsFe+D1UhBjy+DWNt09lR/khWlCYUOdp+/yyRJxUvOqLGcSen12vlCnL+di1FozTWlyHXY5Nlb0oXzFt3axzt8OA5wKcGhLpP46G2qIY1OObwnRx59OmAC5TfVoLagzZDfRS7OXjPMy1H51KoOrWjZxCM4/Hi+Ty9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MN7AkEjw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MN7AkEjw"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d560775ca2so49058695ad.1
        for <ntfs@lists.linux.dev>; Thu, 10 Sep 2026 02:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789033611; x=1789638411; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rzg5oAX+i6E3eJKhSOXaYCCVqgmAZWSbtoqlwDpAUGA=;
        b=MN7AkEjw9XENfiRKDqDEeyJA6YrcgFz6ZHo2U908wkFX+iVCtFHS3Uvzvs+15bqouU
         UYAX0jOIXwyMH7vvGYEnzY92ldVrtF9udR2xc44t6kzudeF6OEXIJ2MhrL+23pjezyAf
         Px0bE1iZtl6jPB1LUq7TAkcaSGx6DsTELfgUR7Llc1OFG7ccbfbtDAjhYzPr4LaKEl2n
         npNI7dCQysd0qLUwLwqXAuMjc03MK2zkWBgjJ4ZxUJLwf3cZSWMyZ4BdZmInMvc3lkfP
         0NC4dsE2TbGcalMUuUwUcmGuu8aDBBaozUSKpL9/Tnvv8q7OvL9ScybMWggJN4XYv7jq
         h/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033611; x=1789638411;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rzg5oAX+i6E3eJKhSOXaYCCVqgmAZWSbtoqlwDpAUGA=;
        b=TFs6j5kY2gSalODGuM8MOmchEzSLyoh2Fr9vY0MF0bhwIF5a9lUyItafTHICyT73xw
         jr3oTgCwzP9wYvtXFi7OzRD3DtatB/At6KPdnc7r9w4uWWBJAPBfO2CEe4zD5G/U5XK4
         bd7iNCqaw+Es6m4Swy5g3V9S6eogOXGDkQFMHgqKwDuBNmwUEM2jRCTi9YgF8gjRjG8Y
         yufJYfS2PR+oeEyzcbLa2yeiGy/zaPCGMvxVQRjdwvQvHvVxctydfUPp+pNWH6uPVycW
         cPL7lvR6wu2yPn8P30uHwVLbXQHKKHVj+g1szr2g1YbFK0zEEe4d6HR0dIbym4FVJd2I
         rHkA==
X-Forwarded-Encrypted: i=1; AKwUvBxhHSwmwSHAIahLC1Q4YHVIAJf6eCOayE2MPdq1V4ZBuRqDFS8ugpnfOJKUb3rKQYEgaJlk@lists.linux.dev
X-Gm-Message-State: AFuF++ktvIVrlZPx/nP0YIczUsUeHqaSqQVdDtvKp1Vjfi+P9gUeVpXM
	TR8VCL1Y9tjeC/Pg21inzqEOclwlR9nRjJr8E8Ad4qrOL9PU54tVdlBb
X-Gm-Gg: AYBFou1m7ETdwZAI6p0bbn5Vb5nTMhhZ0n5XIuwekdDWos2i1tIpDREizCEmTqiXuw0
	3TEpmOPlIgaQFYY8ndFeDJ40fVDAzDL4fw604XSWi3AAabWoE1li1/+OT4G2aIv68dzTvGDHgeK
	tBamylg0lXQBNjcPOf2ckCZBvMN7yi2Wj/xgb/Nc2Ge+y8jrxkAiLVZxEeH9bc49DaFpwWRmoZL
	jnGAGZ5aT9AB3oMiZFdk+5yvyyPhLBM9sX59AOBzpm0W5lvroFkmdDnmjmYN6b3NRzRIwW+ZWn0
	pc78/ixVgggCVXnLHGUEQ0zjvsgF7f7C8dGu4zALnUpm2I+ZP0+7oIgkqlyN6/64GLyF9+wT9AT
	V36x7T9U30dAxp06noWVjXxBPaO4OPQoLB04miUNIj+UC3FjTVnauRnWk19U76a9h6mxfgroG2D
	XdJUmsmMSS5dAc1KYwq/r5o3C1JCsNQVEm9lPJCAProWBlbmcjO1ljWk0K/2fjH12bAXjTsmhqU
	fg61A==
X-Received: by 2002:a17:902:c406:b0:2dd:2b8:7198 with SMTP id d9443c01a7336-2dd02b874a9mr103258215ad.6.1789033611354;
        Thu, 10 Sep 2026 02:46:51 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14841054sm86827285ad.3.2026.09.10.02.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:46:50 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 7/8] ntfs: write MFT records through containing I/O units
Date: Thu, 10 Sep 2026 18:46:09 +0900
Message-ID: <20260910-fix-4kn-lkml-series-v2-v1-7-f10a09fc0176@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6072; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=1zPQz9JWSbXzSa++vrJudhJdvd26fF3c0EeuY1bME/Q=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqonw7/tb8s0pIzL3NB+wxE/0RbA2ayYPzzka1s
 CljTnh4OJGJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqJ8OwAKCRA08jD6945I
 07CvEADD2E2mbXLe+EAmTLBFrn8qW6Ii8kkGvG7fJFfjwwOB1ZsKoEBHjLb5rGUA6a0TIe/uZH2
 M1tIxfIgNSnxUGU3AHSSrDkD0g0NIMn1OqrSym+AwkjXl7j1ZRcMckpirz8F+n21wBc68b6qpf6
 1ThAuYccMRj8DEHYV/XKZmjJF90Ru0/QX0sBxTXhfCXSb+8NCMOPgnVxIo/XFCWrytdubQMWZ3P
 haHLq+C2Oh5iePK3e2RvfGQX1ym+SrfyBVuZ68fwMxg47amQRU04j5vxJcqcH5XND2i8DZsXr5y
 M+hANaNE9sOzADtoGCGHXhmkyEALYbh9Dl5zT2NyzazXFwSkGhUghD9vTf5jNIQIC9WvEKQ8j6g
 lJjdqziWPLqO+XVMXhnI4f17bBpgAhlmDpM5LbbnGMIVxkrwCJXwrVjQsysWEvf5RMZw3dmrGs/
 7YPvsnPDKlpBa3ODOjLkFXAU4AmSg63wRVsHI1wyinmg/31LWgL/aWpPM081AYyGkGzyPsKjCt8
 8dBH+Zk+Ohd1qO+M82Qoir86RpR7uf1YGySyRiwH1pEng1kNk4l7cFui110e2JCcOnaHxzZHyKO
 AjgRqe6ub283BRXc8KybjD8FZ4CFlpSD6CvmaGE2Etivu+8M4nXuOZ+Jn10wKiaD9Zt5UH+M6N+ B1UDLtmwPFGJ4Aw==
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
 fs/ntfs/mft.c | 61 +++++++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 16 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 16e0ad5439db..667f8dcd9f57 100644
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
 
-	return ntfs_sync_mft_mirror_unit(
-		vol, source, (u64)mft_no * vol->mft_record_size, &unit);
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

