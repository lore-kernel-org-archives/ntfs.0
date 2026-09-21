Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1871DA23
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 01:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789954893; cv=none; b=bXqCMbWfo7ZGHEY/KdVE6p4FbUhJhPxYwADN/z077ltJ00mu0G+S1kmeNBPubM+sF5PAdJtSidgYjUISjWbGUbePHuCDqpjxX0Jk+UiTUn05TOaahpTgCR994/3y6v0rPSlp8p++zTE9M7Pphhng0wKGwmmIXxaY8otjsTj11BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789954893; c=relaxed/simple;
	bh=sZVSVNnmqug24rEI1vY+L2FnqpiG6JF+5hzcQz5sBX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GQfXXBLcYjnAcquLkxny0eFVDJcxvaMet8gE+cmbnkRf7w3rrXJs3yrK9RUneU4fV9cC0Wxak3HG4GowEURZUVbkWkJ9aKtdwWP9+BoUQW7veDIsIlHHfhJPQKzrHjJqt6QY7aKzszCt7zK1zOwbrP7+Sz/xRyjK25YjrIVFg7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2DoFIqR; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2DoFIqR"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso2148282a91.0
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 18:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789954891; x=1790559691; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYBYldwjPEz+RxhJV5xhs6Rr3vF8vz2+BiAfSL6O5Kw=;
        b=r2DoFIqRnEDvnoxovN/J66EQWOHwZfhCoOG2WdG8G9U0ptz5/W47l1wrT2VzY5E1+R
         rVKvP+uyLuKxml3CIHf5j0OB4T6APtd01HI9uAIZmil/1+uddX25WOcaaDzS+sGNbHXh
         mMlPvyv0NE2BGl06w3iYds21wchoM8D7k8hWREAVhz4ozKMV4JmWzKiVvvkIv/PysXgq
         abvTybeDxAXtLBsC06F97QeTWRjYTLtvoXnXA2UaB8vG3t8aDP8BowllAcnTOiPO7Ek7
         i28Q6F8aXG9qv+ajit+Ho8XWdWFUA7rVmfLQqCb1TcVP+QTFkLd1mYH1BacUpUr1n/Lf
         XpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789954891; x=1790559691;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dYBYldwjPEz+RxhJV5xhs6Rr3vF8vz2+BiAfSL6O5Kw=;
        b=k4/VPuBoTacBa7XtlDRSiMjqf8PXguO2RHjR0pnH7thLStRgChtSnt44L5G2D3sL2x
         MDCkGI7yUQWr6K2bIgJReu2oYo9pX0zUXnwTiUiCQU/FxSblLe2T+2rqPtRgkdy9LEN3
         DZuGMsVqiadfdH5njHV0YfmVSJiUf0KDSTDfdVzbl5btLx06FUPsCrxJ5m3zMFgXEbGd
         svmQiKo5bm0TA5Ur2tQIKeGf7ga5vDXjTH/slRjcIr8G9xlBCKo2pixk1dBp1t7V5Fc2
         CN1seHoorc3YPOcz8zcK7CDvC8++1BWQInWU9wdnTuZrpxXDxQk5aMtTFVqlYCwKta9r
         ZNKw==
X-Forwarded-Encrypted: i=1; AKwUvBy3LhvPMwd1QQnHi1W4aKvv90iphbwNwbcd0cf0UTvueGLqW8ETgNj2FZfRIo+1a+6fRhmF@lists.linux.dev
X-Gm-Message-State: AFuF++lCirqSO6Z2YB8JpXsK4w7GkQWvHyVvoDZuUSlsdfjYHBsOwjLK
	lr14rQgAKAMH5KfhenhZtVyyfakvSDtP2n/kvMEz5JZo/X0fag0aEtfY
X-Gm-Gg: AYBFou1E1UTTZFzgV7dqT/tqVRW+ic1xfQ5f+y0HBPT+zA8z9O1mR1sn2rwY9W9uMO0
	HmKK3EC1/uZUhkF1u4Ugrs0pVOMKkGBLLsP/L6UAd/JM5iuGGf9HunzkY0mPcPzgOxG2OFEEJDE
	uPDj9fnphM2uZqwT3Dfsu56U4sKnOdyAfyS52IO+IH6kYw9+c7qZtvyEsrlbZspwcJ8gUbbzHer
	MpYCb8bJmcESZaqi6NP3EWr9lkC8lemH6AxO3vUhogzIe7qt2NeHNCE3hyopib2UIc/yllU1mV/
	YwWBK6PP5ej3Y15vqvhRNTZqUSLU6OGBUUC2lbBak5dGZvIr5YA0Rn1Vm6DCmvAA/tBRzU7S0nu
	KCA3RYNr5lueK3D7DBkoqUk7Qv9F+8WBi+d1u/i+ZcndzOHluzBTCmVhnIlMue0Z21eVX/LvF9Z
	n2ffBmN1ag56aMQD3ROXmKSNaXXBzsA4htnBhzc7kP7T26DfqX1aYR66zoo6su3mRj/SDyhr/BC
	VGh9vMf57rqZTDkSlDl+4t0nBq8nddxag==
X-Received: by 2002:a17:90b:6c5:b0:3a0:295e:6e58 with SMTP id 98e67ed59e1d1-3a0295e7719mr5639903a91.2.1789954890587;
        Sun, 20 Sep 2026 18:41:30 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a04982be8dsm2441598a91.13.2026.09.20.18.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 18:41:29 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	gunho@lge.com,
	=?UTF-8?q?Marek=20Weso=C5=82owski?= <marek@wesolowski.eu.org>
Subject: [PATCH] ntfs: fix FITRIM bitmap indexing for large pages
Date: Mon, 21 Sep 2026 10:41:15 +0900
Message-ID: <20260921014116.2781001-1-hyc.lee@gmail.com>
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

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Marek Wesołowski <marek@wesolowski.eu.org>
---
 fs/ntfs/bitmap.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs/bitmap.c b/fs/ntfs/bitmap.c
index 1840b7d84c62..df97970dc3d0 100644
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
+					start - page_cluster) + page_cluster;
 
 			aligned_start = ALIGN(ntfs_cluster_to_bytes(vol, start), dq);
 			aligned_end = ALIGN_DOWN(ntfs_cluster_to_bytes(vol, end), dq);
-- 
2.43.0

