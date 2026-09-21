Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A108C371860
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 06:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973088; cv=none; b=g7kOe0lz+6Q0LORQaLTrL6bmWK2ZbRCFFCvfYe2Fyu/WdFF0KFZG6spmiq58prXPjnjsVGp2txusw6lfVzMy4u2V5AG6MB8YbB1A2lUPsdlAUQefEMrHM/2A2zzpB2GC6uS7VojJ7SXOuB+mab7mO5+H6hOckTFOVvr/WVbcrwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973088; c=relaxed/simple;
	bh=IpSiwDmdKQsjJsaCQWSMEOGLDJyF7CV7cBWIz9hMXb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bNAyXkqAq3uvkP/ACmfkf98smhM0u6UbQfXsAU0K/ogJW8i0VDzqpuH6K0bMpllkaQCgE+O8yMQrqR3M8rZx2oMn7WXwfIzAutVx9DscUd+QGgw02b+vYXdH3roFUvezQgRoEcAYBumuxn3yOHTuZ8rF2uQC42C99jpVM1e1NiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJ3Y0dXF; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJ3Y0dXF"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d9004a1ac0so16448945ad.3
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 23:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789973086; x=1790577886; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gi3PYWeB+rNYtm/OyH0a3umjBKe6+UrfciZfFEgVt7Q=;
        b=VJ3Y0dXFvJ7/5UXe7HPwFTp7pSNnsXbeTZSjUBKjyaO7CnOPNhG2QhnOQ/zDsslQG1
         Goapk6yDQRqyZA2vDN3MHCE8I5d3Bx6ityHUKvwMXrIPYYPyhEADICeLouujz75o98rG
         FUzGsCMBjCE467fZapsITxMvHqfQh4Vvtd1jTcNNk5+tDB6FHZPi4M8ICbNvDlR23Yjw
         juOlCQcbMz0b7f7hN2Bo7VqhiOFv5SgH36mL09lSq1SPMf2LvfySWKlrKjiB4uFFZxSu
         KY6bUSDdQvrrMGaWRgJBVn07i3qDtVHosS96wdJloNnYFayXyGJFR2PEGTWWDNTfFVEc
         5gfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973086; x=1790577886;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gi3PYWeB+rNYtm/OyH0a3umjBKe6+UrfciZfFEgVt7Q=;
        b=YKLClRCS9rkt/dj115TNYf8sIkz2DMlfYXs4LWGngHYmTSoBpa2w/XZnOYDziaSyIl
         HhbwcfafE6Wn95v2zt4AZdJ0vZG73U1B6XQtj54ATjTtCAT05daxu61uB8TNYoNg+YH3
         Iu0Xb0HCwQH9sOO8aMr+7GEt/TxXEiWiOzULPWX80CRLH5QSKI6Da3DlVVn9kp0+r2BL
         fUkk6nm0SbB2/zfQfpc7b9Ahqzm7U468dJd6z/M/tzLCo1jR9mqVncbBccsLFXDMcGHx
         a5PoHL4PdEpmZ5+yRUqOaFa9YUuxVDojetm16IQqlWst5F2YA6OeqUgnB9RYE0hOnQYo
         5uOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPwrRnMKOMdjpLD5NNcVO2lYR+C9/Q4Kv08E4ty7ogPS+PoKYGDedDLGu0maiSfyXrL15F@lists.linux.dev
X-Gm-Message-State: AFuF++nMNHmKjhF+zo8W+Jpd7JUsfLq7N8Q3+nO2m3TfwYZU2Rvg6twe
	dTmQCIaMQTZhOOqrzXvYPYy/FQhVMvYD9saINwAysNoNfmuoxefHWEwR
X-Gm-Gg: AYBFou2FmvuU1ASpRJ3LPv5woXbzVy1zHIzkmX1wYqGHyrTCc47/N6dBcktF5ZuucI/
	iOyDq0QU3UiUoovDBZhU8gVKR9Pc//1GexPeVrEffDVWezP6QDuzqajNBAceCJK/Yj/g2t2yuSZ
	lnL7rX4Simx3hk9K9yxlReZRMPAnaWo7KmbSD8SZoXdS2c5E/6Wc3KNp0p0JbjPW0XfyXF+7btz
	KiaOTPtkttTdN57/1PD3kfq+7/dsm5BBb5JrVjM+/nDAY8yHhYQyf8Tje4DeMQByl/M6p4sYyLQ
	kHKFlP46mx20BScsVYrF3b2E8vGFwE+W6qeCWZcYi7rzW5yP6Ct4OilDf07ks8UnjwA3VPU50Bd
	tpgOl19XeFTwWrSckqpwTsd/IwHssgYgZUXEHjvJZieF0TRMZMGyzP2GOaDmpiehNPW39K9FXMB
	cgHEME40nKvapOFA0ObzTPCCYsOOGibsPXLsWvvI4f52XZrTDdckLmsyp2LJxUr55IrFAHIREge
	jK71g==
X-Received: by 2002:a17:903:22c9:b0:2ca:660:b1d with SMTP id d9443c01a7336-2ddb1ae69cfmr162740505ad.11.1789973085878;
        Sun, 20 Sep 2026 23:44:45 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc180395fsm28097345ad.81.2026.09.20.23.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:44:43 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v6 07/10] ntfs: write MFT records through containing I/O units
Date: Mon, 21 Sep 2026 15:44:09 +0900
Message-ID: <20260921-topic-4kn-lkml-v6-7-75069f590b22@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6162; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=IpSiwDmdKQsjJsaCQWSMEOGLDJyF7CV7cBWIz9hMXb4=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsNILNogJaLv10gInUAD++Gdw3G9DbruN7+hmF
 dXFKAh79oSJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarDSCwAKCRA08jD6945I
 0/9YEAC1VFv5fl5I3o1/48jQ1FcrltBIo2xYSqqrcCIi9SrO0YmAZhPhxGtoCTTBtz6tknnTASu
 BJ1bACVsSDIJK9EZj+SWGkzt7UpLmR/IapS2SwJM4j6ybTbvptLGrpceRlaOOYIJypaCTrfCahk
 qRAVcqOf+x/f1ioVYIxdfoRovIDzZrMsQ5BU1lwSpqIeYTfFtaKE8SyaAKXU8vjZN2bLQmjVug8
 SC17tXMOnvEjAneKO5Ib2rQjRM2//YyV+NKlIqnoe/MrF8OTm5OZMNTQk+C7Uv1XXwvIGaLzOdy
 YGKAL8xeihgIcpXIzghIIBUxhAvoULi/iRlNYVgdItTZ29LQ4yMlT77tzjEWcoUAPpo2FNDElhX
 spZRHXT7TytL+LiIXi8jw1iHBiuK8+1EPcj6H9vz435O9n3Tt+D2V7ETwjgZUZ2Z+5yB/otFJv+
 o3e+o93CRDHEmZMcY89tzmQ91wT+Dg16F52BSq+0JIy6aDj+m7YHsqADkUFFpz+UuE5rUvAnRM/
 D2zOmeE4Mp8gQQpP4nEkhh5M/5pHM/wDbnlKkfaKz9gw4HPTaD1xkLb9pXPLkCw83SD2CZyCJG9
 ulA56Q6EzMVbld0q1frNHCGPfvi7IH4CT559RtIhjc0Gr3ppuOtbL1prQswjJZP8n2NacnQObQ7 ma0V7nnIr1wTTPw==
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

Fixes: 115380f9a2f9 ("ntfs: update mft operations")
Cc: stable@vger.kernel.org
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

