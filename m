Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6A929992B
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230126; cv=none; b=SYChRxr+yuyGNkcJJFzO7+YsKJgabebV4yziS+Sy4IX2NDXOcqk20ot9HqKhPLJMV7sNTcJtNthn8wfDGstJSSMT98GNq8PMu2cKqc87bHRMT6NAlB8AtRlazLJTHsmsTmsQJhO6ablnjxRKFOLe0z57JSJ9vPrlgjfLkp6kpWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230126; c=relaxed/simple;
	bh=t7V8OYNC4EgD03aJw9xoOXzVC9jLTQZlW07famkUHmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lUgBEy2ymqHHctVZVMpbaCaZNEwNtJ/OdG1zpcYgBnJW9pzqYoB3qmXLpHIoGE5WmGboh0Z4MGlxhOI6Gsw7wNs8MYPweDmMG8LSuQ/vxIlNZiXQ9WoiqiX6NI3eBogCiV8CLZogCpsWH5pbW/Wef/WtfQ1YxZYxKx9DhKR/7LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQsAXqif; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQsAXqif"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so830843a91.0
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230125; x=1789834925; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nqo62ylVnV43Qj/y0s2uuqYclkCuOfpDA6pOXa9IoLk=;
        b=bQsAXqifrOvaxHuoHWynmnK/dJN/r+02bhlcIgwbRn853P4sfmUQContO0ydzQpdgF
         N9p8JspcN0X6xZwIeiXrNS0onCjV2M5TSgCd9ltKrBGipKMxzqpmDqSgQd1JVxFKcgWh
         2zFcYiQ1ZbjffXN/QTdMeIDDOips1nXWs3qT1lhxTDgKKfmoN4vwYHeXm0UG0cEQpSXd
         jt1AILz4mr2PlrFX+1YGD7bsjZlSnQHxOmnx/MslaNBF2MwIc1a4vEl7/Kh7nGpBbz/Z
         nsgv3IIJT5idW1wZCQJFzj3HeWVAV5vxtjm7VFwhQ6bYIPYD2DHTeFYhI8xaJ7/ue+DC
         6/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230125; x=1789834925;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nqo62ylVnV43Qj/y0s2uuqYclkCuOfpDA6pOXa9IoLk=;
        b=W/OKYxEhMrBVDEsd+qSUlV8FMxrpGWGo6uggW0vZbdhXu7fJ4SxD9+9eQss4sUBp6A
         qPrDGtxwQoH0J7NV0ybpwXuWjyWNWi3QiJovTraaM9t25IFZFKZxi3KVrJEshESlzbPY
         dczhSyuDKYlxiT5r5IgQJI8Yq8oAUIlAYi1ITzO1v21xnLFNg3JlrYKy9W20dO4PAinY
         8MQ3f2vUpnPwQnMeUW/VxwYCkRPcJXZCQlC0HRmrZdxLMe72ncksiStbY42PhtRaCBFl
         rPLYQ2dyeFTMYYkWwJ0TfGOMwfNcP0i9wuXQVQbDYnvLeiM1i42p9AtDV/brEYrrIbFN
         GgWw==
X-Forwarded-Encrypted: i=1; AKwUvBy7lMKS1OQPaJCxl8Ie/eUKw2OaLMJDK8StILVbjYzld2Sif3jkrXWekoBNMbafof04BCQh@lists.linux.dev
X-Gm-Message-State: AFuF++lZhvgHwMvYhvMGZ4LfJVCKHDl7+vTT2i3FvWIG88pC+kJnOZim
	Z14+ZKJKOaSkak6gfBLwFmCsPHVBJ3O1FTxzhf6w+LF3fXlXtNWKTziWJee8mQ==
X-Gm-Gg: AYBFou1u2Lq8ytUxWxPTO829F6OIhpCgquJlqYyKfGWfv43MQtVUhQ3/oZKC7Y1kFN7
	gu2rlgjXfeIB3t8/59naat0QHtovVDeJKMfKAhDNnA6Jy9fZxU9QEr8Mk9JwoIf+sdA0vjVIlVA
	A7H4KdNqxWs86G/GxGgXkHm3Wr3icuk+l1aEfDukIvpjDQx+VcGe0+Syy4zmsjl5gFPrJFDn1vY
	/U/mwlJvnU9IKH5kl4sUxli/fT79wPhgatMy/vIZyBYsjupU84f6nkXeznk+mLmlaRgUcE4MAfC
	hdKVz1axs2dVITO/EfUyIyzy0R3hLCXkyixOk0rjHFjRHF8hHKY1HJyJHAwFit9xjFArAMJRhpT
	yTwZsUdYhmZq41cT4qbvRJWEGCDK3Xvc+bZVdB++xLeTYWYmt4Vc4H8IRdvGdy5TE7Edslu4FHH
	KIGXHdbWgTqdq0QOaUSSZFhk+lSDu2qIp3tHbNctzGBOeTsc3nYac4F22fqKWB1JNQQhyXE2Rjj
	LhEme/LGL/XH5TLMf+w0oVm
X-Received: by 2002:a17:90b:3844:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39d9c3f8c2dmr16202314a91.24.1789230124725;
        Sat, 12 Sep 2026 09:22:04 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b21sm10804999a91.13.2026.09.12.09.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 09:22:04 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2 07/10] ntfs: write MFT records through containing I/O units
Date: Sun, 13 Sep 2026 01:21:19 +0900
Message-ID: <20260913-topic-4kn-lkml-v2-7-2bc455e81635@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789229949; l=6075; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=t7V8OYNC4EgD03aJw9xoOXzVC9jLTQZlW07famkUHmQ=; b=QgNHIeoMQXoXxUnUgW6wGWa8bGkrJ8jbjVI5EdEJ4oPBN75c559DNHXHUKFT2yYBchBAFVHJu 1xTOZvyWNQ4CI11aW5VpJ9/3gPq7qzoOPE/A+yTt50H9MwejFYaftgE
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
index d99458f35529..9b9ad78575db 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -595,13 +595,18 @@ static int ntfs_sync_mft_mirror_unit(struct ntfs_volume *vol,
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
@@ -621,6 +626,18 @@ static int ntfs_prepare_mft_record_io_units(struct ntfs_inode *ni,
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
@@ -674,6 +691,8 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 	WARN_ON(NInoAttr(ni));
 	WARN_ON(!folio_test_locked(folio));
 
+	if (vol->mft_io_unit_size > vol->mft_record_size)
+		sync = 1;
 	if (folio_test_writeback(folio))
 		folio_wait_writeback(folio);
 
@@ -2805,7 +2824,7 @@ static int ntfs_map_mft_io_for_folio(struct ntfs_inode *ni, u64 folio_byte,
 
 static int ntfs_prepare_mft_folio_units(struct ntfs_inode *ni, u64 folio_byte,
 					u64 file_limit,
-					const unsigned long *record_writable,
+					const unsigned long *record_selected,
 					struct ntfs_mft_io_unit *units,
 					unsigned int *nr_units,
 					unsigned int max_units, bool *defer)
@@ -2817,28 +2836,37 @@ static int ntfs_prepare_mft_folio_units(struct ntfs_inode *ni, u64 folio_byte,
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
@@ -2895,7 +2923,7 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 	struct bio *parent = NULL, *child = NULL;
 	struct ntfs_mft_write_ctx *ctx = NULL;
 	u8 *kaddr = NULL;
-	DECLARE_BITMAP(record_writable, PAGE_SIZE / NTFS_BLOCK_SIZE) = {};
+	DECLARE_BITMAP(record_selected, PAGE_SIZE / NTFS_BLOCK_SIZE) = {};
 	u64 folio_byte, file_limit, folio_end, mirror_size;
 	unsigned int nr_records, nr_units = 0, max_units;
 	unsigned int nr_locked_nis = 0, nr_ref_inos = 0;
@@ -2963,11 +2991,11 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
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
@@ -3051,6 +3079,7 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 	submit_bio(parent);
 	ntfs_release_mft_write_refs(locked_nis, nr_locked_nis, ref_inos,
 				    nr_ref_inos);
+
 	return 0;
 
 out_noio:

-- 
2.43.0

