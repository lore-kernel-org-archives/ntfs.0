Received: from mail-pj2-f28.google.com (mail-pj2-f28.google.com [74.125.227.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C0152123F
	for <ntfs@lists.linux.dev>; Thu,  1 Oct 2026 14:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866191; cv=none; b=jRCgPTnn46I0HNnmsXsI3ORDRjI2ZhPnnRh347EjGjzdJATzz/s1fIiTDgXkcznSqA1TMHwQELcu9chOVBrvSP+OnDR1QiF38DbPTIwNhEXWU4qJdrJOt23gJUG3+euBGyj1fpS2aTmJWpQJSc9fe4A6pT3wsf1oll0FHP/Pzdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866191; c=relaxed/simple;
	bh=cakvKhsl5eoMRP2BRapw+CA6V+bKMVx0udnly4hraEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSrUUuD60PMeynB+Ri8bI9S3bsh05sAXa7Of7XIVAngvsCdTiIKoHKxsSbiKXjp0kwwIp4bIuiS6nraStLZ/AVJ5FDvSEOvUuEr0bhu+g2L/t3Ssgseil0eq2qvOLN54HOvjPRqMcl4ba1l8BkcogY/by8kcGdtSXpCqyROWIgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McKFnBC0; arc=none smtp.client-ip=74.125.227.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McKFnBC0"
Received: by mail-pj2-f28.google.com with SMTP id d9443c01a7336-2e2dd05994cso9017145ad.2
        for <ntfs@lists.linux.dev>; Thu, 01 Oct 2026 07:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790866187; x=1791470987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qSjgAlkXQv8MXGqZfLAg27uITdisEmnV1k+2Gszlo30=;
        b=McKFnBC0RpSy4uS4I0pJGDLYht5YPzWbcnltMEA7473+G7KkUK6vr1yNmWVWaP6aHp
         E+T2FNqVTXP143IY2sSINkPuMKI4xoETTOsdi1+6ZtFQx/H+wkFF6Q8SnaPJ5UJeUGEY
         CG04fCSzwDcl5sWd/lYAuB8Nl9iA5O54mGEVt9yeJzg+/XM75t4X5hFHLu/55EnM+P0M
         dFr5QN//RGbHcmL82AxWNq/PekpKXooXDYLoC6pVff4ey8fu7wsaRgFHB6kz4GrCWgTc
         X8KBPBVVqGjPiOHJVk/ojyDseW5vDkW1VEuEG1RknCHx11ODvmmKo+Wc8J0urVnng6us
         c86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866187; x=1791470987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qSjgAlkXQv8MXGqZfLAg27uITdisEmnV1k+2Gszlo30=;
        b=hL3RdUwnYfjTihcSRjAlmBG2AhjllUNbJpI3qymyaCWElUncmmqonVmR3f5QwJCH5l
         qmrT6Ha11/2plTnRoK+/99EwJ9MYklPabYQOlElQNYsNUGeeVloe1lEYlB5KRzf0wA7j
         4Det9eYlGibqSdskVBjzVGmmFgtIVxaq/OL6H7Bfev0F4LYCuTSp9N8Oa7v9t/H/8bnH
         ofzUapFoaDGBmO3bMCjqezyQ+dv1/nzZAVmyi6OdOhb47Z8iUyqYhCUUjx3/ckocimia
         2WLCsH56aLsOuBrkqj2DZxPHYAYmQvhjCz+AF90JWdXwJnbxrD+ZVbDz6Nh22qAhvosh
         iCGQ==
X-Forwarded-Encrypted: i=1; AKwUvByA1pC8kOUKuHFnBwpjz7K1mOQxgM3vDQEUSA/9CzRxgBnsMtUTvRA0JQYZ5403jasXC9N8@lists.linux.dev
X-Gm-Message-State: AFq9FYIl9nMBk5ck7SbWQfez5LOXsC0IcYlufKHDieF1mdSLuYp+T0x8
	TQaAhbZQJowhnqZIjgS7wLyJwSob+5r34akZQzpknlTieuhyv84nUkPKqEFehi9nFg6Dog==
X-Gm-Gg: AYBFou0RMj5KgjswrxAG1nCjIVALMMibMyvJwiu2Wg3k/dAervsMXRH7sKFWWLEvMm6
	Ka9Q4FqAolxAFoVfTrGY3VnM8YOBw+l2a9Pni9NeoRp7dUUUGJxIbKKXUXGpAXjyjFcm6UpkQye
	L/W/ioZYfetpxf76PkDcy7v45R02wjJGPLl4ajetCsA05JwJvVkXAp9TIdqMJ7gJqLJ7ly+zU5O
	yZ71TFvmBagLL8Ycv/AX2ExPplOKuzvT8jtizUvD+n/SxeFRYdcwqlk6VQkHjQeema9l53YR4kX
	30Lv4MEUxcxvCdC3LiQVOtkwtJdIuNCtowdpYUiRSHFCkeALPdpJj4E4Gi7GxuaCHOH4bZXpMwF
	j6TvQ1hvfuGsYIWluyDLFXBqvXBCCr8aSOKeFQ5S/rhc9BAH85PfS1fQ+JZHKfzR+1aCl4qNOV4
	BKJMnmsc+Zln9CKzfYk4jIYoaCllqR/TMXpi5jZj323C/mTOyyIZxmeQPcI/RZjeqMPcjonX1wb
	R2C6RceqYSR2/WxzlNEKVdDA7ZbwXfRcUJwrwpJ2I1ytNe/dFNNTE6ORdlmXcSg22cQYBqCi/op
	r/ZsT9em/Du5X71ZIEGepr/1eFMPPQluVInbsG3TxQM3/YX+o1FdxgUCSR96
X-Received: by 2002:a17:903:3888:b0:2dd:ad73:c983 with SMTP id d9443c01a7336-2e2e4b35641mr41899545ad.27.1790866186801;
        Thu, 01 Oct 2026 07:49:46 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e317cd0624sm6636775ad.30.2026.10.01.07.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:49:46 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	liubaolin <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] ntfs: restart the zone search when the allocation hint fails
Date: Thu,  1 Oct 2026 22:49:37 +0800
Message-ID: <10fbacf8091e8e5aa7210b1c64750f20b655d960.1790853718.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1790853718.git.matthias.goergens@gmail.com>
References: <cover.1790853718.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When ntfs_cluster_alloc() is given a start_lcn, it first tries the
clusters from there on.  If that does not satisfy the request, it moves
on to the zone's current position, but keeps the pass, the zone_end and
the has_guess state it had.  That loses free clusters in two ways.  If
the search had already moved on to pass 2, whose range ends at the hint,
it scans only from the zone position to the hint and misses every free
cluster between the start of the zone and the zone position.  If no
cluster had been tested yet, has_guess is still set, so the cluster at
the zone position is tried as if it had been the hint, and when that
cluster is in use the rest of the bitmap buffer is skipped.

Both happen when the hint lies at or past the end of the volume, which
ntfs_attr_map_cluster() produces when it extrapolates from the last
allocated run across a hole.  The allocator then finds nothing, shrinks
the MFT zone to nothing trying to satisfy the request, and fails with
-ENOSPC.

To reproduce on a 128 MiB volume with 4 KiB clusters, extend two files
in turn by one cluster at a time, alternating between fallocate(),
write() past EOF and truncate() up, so that the runs of each file are
separated by holes.  When the volume is full, truncate both files back
to 1 MiB and start again.  During the second round a one-cluster
fallocate() fails with ENOSPC while 40 MiB is free.

Start the zone over as if no hint had been given.  A contiguous request
can get there with the run from the hint already allocated, when that
run reached the end of a bitmap buffer or of the zone.  Return that run
instead, as when a cluster in use ends it; going on at the zone position
gives the request a second run that its caller does not expect.  That
could happen before this patch too, whenever the cluster at the zone
position was free.  ntfs_attr_map_cluster() reports and zeroes only the
first run, so after a fallocate() of 20 clusters over a hole, with the
hint 4 clusters before the end of the volume, 16 of them read back the
data of a deleted file.

Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")
Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
v2: for a contiguous request, return the run from the hint instead of
going on at the zone position (Baolin Liu).  This also fixes the stale
data after fallocate() described in the last paragraph.
---
 fs/ntfs/lcnalloc.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/lcnalloc.c b/fs/ntfs/lcnalloc.c
index 0d6cd08ee2e7..c58e689fb585 100644
--- a/fs/ntfs/lcnalloc.c
+++ b/fs/ntfs/lcnalloc.c
@@ -506,13 +506,32 @@ struct runlist_element *ntfs_cluster_alloc(struct ntfs_volume *vol, const s64 st
 		}
 
 		if (!used_zone_pos) {
+			/*
+			 * The run at @start_lcn reached the end of the buffer
+			 * or the zone.  A contiguous request gets that run
+			 * alone, not a second one from the zone position.
+			 */
+			if (is_contig && rlpos)
+				goto out;
+			/*
+			 * Leaving @start_lcn for the zone position starts the
+			 * zone over as if no hint had been given, even if the
+			 * search had already reached pass 2, whose range ends
+			 * at @start_lcn.
+			 */
 			used_zone_pos = 1;
-			if (search_zone == 1)
+			has_guess = 0;
+			pass = 1;
+			if (search_zone == 1) {
 				zone_start = vol->mft_zone_pos;
-			else if (search_zone == 2)
+				zone_end = vol->mft_zone_end;
+			} else if (search_zone == 2) {
 				zone_start = vol->data1_zone_pos;
-			else
+				zone_end = vol->nr_clusters;
+			} else {
 				zone_start = vol->data2_zone_pos;
+				zone_end = vol->mft_zone_start;
+			}
 
 			if (!zone_start || zone_start == vol->mft_zone_start ||
 			    zone_start == vol->mft_zone_end)
-- 
2.56.0

