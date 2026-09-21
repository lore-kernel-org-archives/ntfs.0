Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA8324B28
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 00:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950028; cv=none; b=PTeCvF+TTQW7P6mc1QLuHSoQsZaW6Q1pVga9cvEG7m6kHzDNSRunhqNy9mQDX/DiZlWVK9OH0jxeRS/HgkJ7OGldQ8S8WJXrTedCqPcPyybDAee3aGHROe86YWhdd3Sc1Y9XCdKH7n1om3iEzPUewagW0WWNjQyJYczSH63PJMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950028; c=relaxed/simple;
	bh=4IhsgRPFn22q6UrpkDgVsAlEl7+wEdw3gmQ++VbpaEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FYBCvI9yphzswclWMYhAngoFmR2G6913FTkYz1078NZGnzhWKj/dJRTBuJBw5PnB/ME7LGXgARYRyZCG2T6ABvPss6Pjdq36cAjl7Xc/8ML7QYzgfgvv1ulAykyXUhfIJLWBda4rU1i+0Ds9Szhs/YQ25/9QcC1yZ0LjO4n7l5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qdhhqs+P; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qdhhqs+P"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso3154357b3a.1
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 17:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950027; x=1790554827; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=60cyZKsv9JcJFxdbCQSc4guSO63U9bxLH6U66qDuuRc=;
        b=qdhhqs+P5muLSRvtsRvI+NOu71hf1J0CU6gny79vsVPN9iJ3OfDF4zcmO1eBR0aiZr
         s9Kq3wWrad3XyjMieC/gtDrbEcku54bQXsU7wVK3VVCrCDSe1pEXJbezhmwXZeA6thX5
         qfmLzExxjQSknlIX43DF1SVlOzvtCirt0AiY6pgYVzEm0MVgtkm5PaXEvEuJPkLRMGUA
         GjiXZaMZRM6qiOSNaxc5aK41o6ulCvCr1pJoINU8ZNhyjY3ZWe/krG3oHF9gdhY9QzwE
         lbVrTAgjurWV73bqREIdsOlz+18+QnyD+s6x0teyy4zb3k/ejzYgRXBi+9IKDsVWG7uK
         Pbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950027; x=1790554827;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60cyZKsv9JcJFxdbCQSc4guSO63U9bxLH6U66qDuuRc=;
        b=R0MKsQV/wEGr4mRsDVNvqRpYVfASZ9sQV+5JDrCjvJJH2jYpRA8JhxBesbPYDPltSt
         C0bFqHWJnlMm5vqJCZqGPuhUP5vtklSiugohC6VqoFuhTdJsJtBIcIzoDUqw8BgYERhf
         Zd3sB+Z2rJQkzL+8ZHpAtp2+ARD7VDgj0WHBw/eVVWA7XXy22iGc0IwmKaMIFP5a3Haw
         rZeq6ZfBWfIm9PliMtrVTsP060kGE2iRjO2phPyVAgjUqmr1Xf2uDxKXYZN3V5xiAdB7
         5unI9oVoGe0OMz9tLTbKpiu7bFeiKPZTzYJZr+qqvgDc6lEeK3voom3d42OgA02z14lJ
         0iEw==
X-Forwarded-Encrypted: i=1; AKwUvBw3URCbCes1OSxBkbeNJFX8X3hlEyHwzaEdLAUzYIQztZ8XkOK0NZ5tdL8qXjgmI5tDrhWq@lists.linux.dev
X-Gm-Message-State: AFuF++ls/lxhD7x8w6ibcDHn5dVMtVVVYFxmRmxQLeN+eTdEpDyADUQ0
	rOTqwuoDuHPcdnAmViq2bARVD/yfEhVbOmn15ulCnJ+z9jxiXlTApwtfAXLW1g==
X-Gm-Gg: AYBFou0phfVPXLwnpu23bgY5sckSISnvg8Gh5xkuNdGMtmZVwLJWnAPC70N8V4GXpaE
	Ogzbk9R2sBpeq4kL9+zSRb8yma/RDjMHxBGxhZQdq7uyiS4S+XgUWa+WTEXcRBO4uTwnkw3aDN6
	4T8Pw6y4HOoSIb8i/3fCLnvwHoXNhxJsY8W8JT3/rPntFND1bQXGkqSB6BljGc4cSb0a3NLimXx
	WoNJSr6dqe8LUaN/2S/OOyosltGsFWcLvFaVcUrae//pziOfI1zgq0BdgMQEV2HI0JCzmyXGuHT
	P5+slt5bRikiUj5Joi17eQQlJI3LpC1D+kl1TTirSpbSx6WmlmE1IsZ2a9AYmf5F04WvWhzIXLv
	J/ZPl93D4wyqOfpIzcmWEcfMNmZv70Nf+z3F0liEYwfKprHyz7B71dibhRe4mMlSVQFU8lu8fso
	PUNjUJqIfIbj5eBb1vE/G8xn9BaVORAMCkcQpGEhr0bqay+rYzQzmEFOt+GeNT4EQhKZ/8cPp1w
	aUCrA==
X-Received: by 2002:a05:6a00:9096:b0:878:3705:571e with SMTP id d2e1a72fcca58-87837055e8cmr4092162b3a.42.1789950026702;
        Sun, 20 Sep 2026 17:20:26 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2289557b3a.21.2026.09.20.17.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 17:20:25 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v5 07/10] ntfs: write MFT records through containing I/O units
Date: Mon, 21 Sep 2026 09:19:46 +0900
Message-ID: <20260921-topic-4kn-lkml-v5-7-938afe402cd0@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6081; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=4IhsgRPFn22q6UrpkDgVsAlEl7+wEdw3gmQ++VbpaEI=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsHf0+eZOtBWR7v6gjluxn5Xbq9TJI5JBCc31/
 WwIE1u5BI+JAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarB39AAKCRA08jD6945I
 05Z4EACg1iOVbxb3UxB3dOcg+9Fgv2KREmdRFiZZjcfOKnerScnujM+7N+Hw31IIL4in7LLuiVq
 JZ6ViWVstiqiRTxTe87rz1BktiZwbiv0+X6aueT5KoB2vA7cTcojLjuO2fHZc4ZgR2TZ7HGMZcC
 vWjVB6ABI+hNbovA4x2eFCsWCvPzwiL8xq7cd76UECeRZGOq8YG2hO663Be4symMxzakcGYmw9J
 TUzWA0xmkGANBOtXfV5T3LLXETbw/cKE2dmdw+wKvO7GEXAFQLARPXK5rArF/7nLctvmyyzu80u
 3xBukUBC/Xy7QwwqrY3234p+W6JntM2nJB1CSM63Gu5bLkN58ZZKOW+cz4uopuzJZY+VNmECTwh
 BmBG0z8ANJxrBo4r1W4tcfLF8raqn3O5ijDzonyK9RDKiS4eNa4x3vhtBErkZLVTanwXedgp/FE
 xkv3nQT7GWNuIOxBtw0ejp0W59XBOcSF87gMqikzFpi3DqWfaw+B2os5UxjgIFRkkwS/U0UA/cn
 xvMrQi4cUhyHU1N12CtNnBrFCKPx1RKsiv6wX3k1CvSiUkR7pztx6aISkDE/awmqMhS5DgHK/3B
 ArnpWdQ+onzhXVXsab+1PRirxmPbBFmtRYSTnnNkJABPaMf9DX43Wx1KiRagXkpDGSK/xAH1nAJ zKWKiB8Oww+zdqg==
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
index bbbe0d4426ec..77acc26a85d9 100644
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
@@ -3075,28 +3094,37 @@ static int ntfs_prepare_mft_folio_units(struct ntfs_inode *ni, u64 folio_byte,
 	while (unit_byte < folio_end && unit_byte < file_limit) {
 		struct ntfs_mft_io_unit unit;
 		u64 record_byte;
-		u64 cluster_end = ntfs_cluster_to_bytes(
-			vol, ntfs_bytes_to_cluster(vol, unit_byte) + 1);
-		u64 record_end =
-			round_down(unit_byte, (u64)vol->mft_record_size) +
-			vol->mft_record_size;
-		u64 unit_end = min3(record_end, cluster_end, folio_end);
-		bool writable = false;
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
 
 			record = div_u64(record_byte - folio_byte,
 					 vol->mft_record_size);
-			if (test_bit(record, record_writable)) {
-				writable = true;
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

