Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E4545D909
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 09:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984434; cv=none; b=muoh92i9KdWZHrpTLazgPbMia+kRcDcG0Pi7EpwYa/6dpikIS3pDbvmeqSDbxshTMyEdjYH0X33RNucmRucGZnLXRQpKaEvu/QY9mpvES+QcEhRWvBVlwX6duWYQvmMuXvrdUNoov7xisWtra+hwaW5OGgIigvJRQz7re/+sJeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984434; c=relaxed/simple;
	bh=rLdbxelTeG8hLFCPA7firrZ+9aIXIxa4kfC1KoNsm5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iyt4O8l9+GaP6Sf74onWq+x8qHFyhvBP2THWU6/qZSVsvaqHZTfAuZ3iNq6D7ouG9iqtTu6okX5+2xAf3uWJs59ltFFtJfU/7+dg012vJzmEMGvIeeLAPKhcukjsYctyUBARkYczFSM87FC59rGR2S5HmOT2Ra2+OUCp+E1zh4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EduxJwPw; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EduxJwPw"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so5208865ad.3
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 02:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789984432; x=1790589232; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tFzkwpr+u9kCSfAfq0EuKgbO/ghssMBW4B1cvb9LZ0g=;
        b=EduxJwPwKhwQvaBbNy497oMxt+26P0Lo9Rfks3u+BNKZZ6eE9XvjotG/bmIkiWW3x8
         tlhomeVUqqiPlxH3tKvOefxcVx/tXKvLQdcF/hIUVO4U2IbxYtVEhmOp+cpx7EUaHqGV
         qY2sFxMFqnGT3SFlWy+CRu7F6RYUGq04Il5vSesDb9hAw9py7rZubXaa8rk8/WcTlz12
         XnUxiWmvU+Z2SBbAE+3tFZIPlOH5Q677ZDhSKNggRBQlB2OgqFKui8Iq4W2gYJ8VsuIM
         cObnqYKEbrWJFJKm/XnWvtBz72V+0ARqwMBONf7uxcTfF6KuPcCOfIPrXdS/9Rsc93bM
         mJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984432; x=1790589232;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tFzkwpr+u9kCSfAfq0EuKgbO/ghssMBW4B1cvb9LZ0g=;
        b=J3E4xRFMBcWotlta5C74sAC5loWZ29eEjdcsUhxCZtf9AGHbcBmoxrvSwIEPjPjo/l
         7kofeFewrUgAo3KYEnLdzDY1XAt/e4ZdtSV75iHrBam+yUoeP1kB1SyylMUOd51ACo+8
         JfrIUMBad/heGAiPjZbIzQ8t5osJGvu/vWkNX49TqahOoJBhFt+CyLYalp0g7oOa/A9Q
         ayuSS87kO2Q0ovZ2J1yerw2vcWDW1HoY2KoKBvvl0umC5bpHQDGw9R+tE0gXD8ljOP2Q
         I82AUK3QAiBDlqNqXVGvkzKMrmYFpG0Abg71ZKh2+tFnkgA7J8cRD+JDTAO3VBzACSbV
         y7ag==
X-Forwarded-Encrypted: i=1; AKwUvBw8sRWNyGYEMqtw4Su/WVmIErn5ZY03xq5f40p0HPnDq/V1cf7JHSEP7oULUgXdUkDYEk0c@lists.linux.dev
X-Gm-Message-State: AFuF++mg/aS+CReHJKrf2nIfGjaPpDzdoYRiRo8SrOPI+hjkACmd7Scm
	ldL+qxyHXpBIiaKnHg1gYLjIoi1LVcsCxoepsTBku3meml0JlxCfB51W
X-Gm-Gg: AYBFou2iS1b905136qZViBd2F22arL2KWVTPHtJJcAgI0XRhoBbEGleZ9n7+F7qdycW
	S0GhGwRckUhAWwGmguqRVCQ66ku/Ivp9DRbCbHJMuOndJuPXfO1LI9UgFXW2csaiiXJ09EP+yOu
	AslcUTiiboFA24QhzPgoFH1rLOvx7rca9LWkB8RhTHxo6t2ZrAFKrUPdiOHQw3pGH0x6uSG0NRj
	yMV8YMAN63yevhe4wr3YwuKofEV4OHi+3nhJy4GSD6/VcVDCWgpTC32KMMp+3U5Xq5oC5inkmcy
	Oia0V1LHWReBuC568Tjd9VYRlqT17+cDr1mE9TlD2Z5DuqCyQcDTC78qfew6+pKZoMG260A6u2k
	FRaTHu/TWXcXWlc5lT2TRPhps7lUaSJvhLwEkHZrVcbpQXCGKQHn4XWdON8+3oOKOevSiUnauwB
	4Nd6hBZBlAG29rJl1KYJQGmVEilxffcwO1MK2ewn98QrtzcYgUZV9oUpuVobhvLgRmgKDnQfMjA
	iZDMFAfJ4RGXCBOguFx8vY=
X-Received: by 2002:a17:903:1a4e:b0:2dd:c0ff:e733 with SMTP id d9443c01a7336-2ddc0ffea2fmr82123415ad.69.1789984431802;
        Mon, 21 Sep 2026 02:53:51 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17baaebsm30505915ad.55.2026.09.21.02.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:53:51 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Baolin Liu <liubaolin@kylinos.cn>,
	=?UTF-8?q?Marek=20Weso=C5=82owski?= <marek@wesolowski.eu.org>
Subject: [PATCH v2] ntfs: fix FITRIM bitmap indexing for large pages
Date: Mon, 21 Sep 2026 18:53:32 +0900
Message-ID: <20260921095333.94659-1-hyc.lee@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The LCN bitmap has one bit per cluster, so a bitmap page represents
PAGE_SIZE * 8 clusters. ntfs_trim_fs() still used a 15-bit shift when
selecting the page. On arm64 with 16 KiB pages this selects the wrong
bitmap page and can test or discard the wrong clusters.

Compute bitmap indices from buf_clusters, use the page cluster base as
the bit-search origin, and keep the requested range as the clipping
boundary.

Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Cc: Marek Wesołowski <marek@wesolowski.eu.org>
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
Changes in v2:
  - Add Fixes tag.

 fs/ntfs/bitmap.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs/bitmap.c b/fs/ntfs/bitmap.c
index 1840b7d84c62..f0b40f374471 100644
--- a/fs/ntfs/bitmap.c
+++ b/fs/ntfs/bitmap.c
@@ -20,7 +20,7 @@ int ntfs_trim_fs(struct ntfs_volume *vol, struct fstrim_range *range)
 	struct folio *folio;
 	unsigned long *bitmap;
 	char *kaddr;
-	u64 end, trimmed = 0, start_buf, end_buf, end_cluster;
+	u64 end, trimmed = 0, start_buf, end_buf, end_cluster, page_cluster;
 	u64 start_cluster = ntfs_bytes_to_cluster(vol, range->start);
 	u32 dq = bdev_discard_granularity(vol->sb->s_bdev);
 	int ret = 0;
@@ -45,8 +45,8 @@ int ntfs_trim_fs(struct ntfs_volume *vol, struct fstrim_range *range)
 		return -ENOMEM;
 
 	buf_clusters = PAGE_SIZE * 8;
-	start_index = start_cluster >> 15;
-	end_index = (end_cluster + buf_clusters - 1) >> 15;
+	start_index = start_cluster / buf_clusters;
+	end_index = DIV_ROUND_UP_ULL(end_cluster, buf_clusters);
 
 	for (index = start_index; index < end_index; index++) {
 		folio = ntfs_get_locked_folio(vol->lcnbmp_ino->i_mapping,
@@ -59,19 +59,20 @@ int ntfs_trim_fs(struct ntfs_volume *vol, struct fstrim_range *range)
 		kaddr = kmap_local_folio(folio, 0);
 		bitmap = (unsigned long *)kaddr;
 
-		start_buf = max_t(u64, index * buf_clusters, start_cluster);
-		end_buf = min_t(u64, (index + 1) * buf_clusters, end_cluster);
+		page_cluster = (u64)index * buf_clusters;
+		start_buf = max_t(u64, page_cluster, start_cluster);
+		end_buf = min_t(u64, page_cluster + buf_clusters, end_cluster);
 
 		end = start_buf;
 		while (end < end_buf) {
 			u64 aligned_start, aligned_end, aligned_count;
-			u64 start = find_next_zero_bit(bitmap, end_buf - start_buf,
-					end - start_buf) + start_buf;
+			u64 start = find_next_zero_bit(bitmap, end_buf - page_cluster,
+					end - page_cluster) + page_cluster;
 			if (start >= end_buf)
 				break;
 
-			end = find_next_bit(bitmap, end_buf - start_buf,
-					start - start_buf) + start_buf;
+			end = find_next_bit(bitmap, end_buf - page_cluster,
+					    start - page_cluster) + page_cluster;
 
 			aligned_start = ALIGN(ntfs_cluster_to_bytes(vol, start), dq);
 			aligned_end = ALIGN_DOWN(ntfs_cluster_to_bytes(vol, end), dq);
-- 
2.43.0

