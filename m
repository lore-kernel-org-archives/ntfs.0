Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44F23D5221
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506650; cv=none; b=o4gfKT9Z8fySwWz1cSqjHbPdH0nxhteTC3G30ZlWzZ6958jnYOPI+RNRE9Qe3HTeV0eWfpOoV9tTuQj0YnqOvIHYRWBoSOqvEkjgeWfcDMQWitQYz8yB1InKUzBQ7Hyn1sNmtThGdjCNM/tmjHEigk4yZzbVxftBFKSpJn5Y24A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506650; c=relaxed/simple;
	bh=eNwhT3ZGqjB2HEC8B6HN9G+Zq0SEoGTqMnOPNZ4zWJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bnt0DiqyBC8uqsm8iQoHmn31ea+e2XUxd/yciOOp3r/vVs0HnU8mYVqC5lw6wl51rYNtMERFFIKj3baj+N+hp5maWyn3RUxZcfpisC9AcF7IBWK3xpT6oIt0mgQVXx8jJiFXpEZC/KKBd823a8zjBFI+04h6HTcU5BFdYDWK/NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhlOd3Mk; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhlOd3Mk"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso1628002a91.1
        for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 03:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506642; x=1791111442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZGzG0bURFDXcZw30n7m4Md6MGV3VzuOyyLqAT8l4iw=;
        b=HhlOd3Mkiv2CmKQGCyFT6nMreno2To5MMXLRMiQgIFtxpNah8H749LF6+igcBvUcC4
         0Je6kA2X//mWSrZjAZTNSINU3TlfUcrQDlQwtKAkidN8Ct/4Z/KSAEagCI+tEc+wSYtq
         zIpkU23aTSVNOjWyqsHx2aLsORgL/PIqPshWK6xPzi+Fj4uDNFNQEc1hblSNSd6bLfS9
         xJ2CzaUsu7gAeIQPbM3P/gns3it42VI89ukjMOLXH6jTOHqpQvuh/YuOFvX0LJolz/72
         v8x5fVG+PCeyGTo8G/FPkLde8pf6hFb6c6ktdZ7WJp/MwVKZL9aRgc1Dn0DrA1XhgH6k
         rZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506642; x=1791111442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZGzG0bURFDXcZw30n7m4Md6MGV3VzuOyyLqAT8l4iw=;
        b=hyQ+YeQKG2WrIZXPEWs2yYMxe+ceGKOGqBct/9AeWZc7RlLvcBYQ3i/+aCEBzySWOn
         4Mh43gmBXI/aJ12xmcjQDsw7WCDaZdxh2VdD59BRs0WNFmGDY8zP9azXPPdGLrViVuM/
         tfU61RL1NJC1Qau4te4ydJxCHDn7JIDmv2DmAx6UHNY+Xxu7FzeP5Xg3EI8krg24CR6g
         VbQiBYhqKDTGA1OGk2LtJ1PPri3b2HYa2S5tRg0g2I6LHf/pOZRqEx7Btfyb37Rg585G
         1WYBR7cNjWQjfWGhHx/MpgEg3AflRjQvMxrNww4dCEsPjdAJiAfxqwMdz2qRvrCg9zep
         iQqQ==
X-Gm-Message-State: AFq9FYIasPDGlYE6rrgyI4HXsJok/zPivses84lk1T36WSYv4OKe156f
	Qv4Vplk0Njs9UKQp+Ugn6x+ubQEI7qq/kkHiAr8ESw9iTQ7E9mr6eBGL
X-Gm-Gg: AYBFou0GQSC830ZobO4cp2xOEuhNBNRtuk59/OYqWJXx+/Qh4hf1I1godCYEum6iohe
	8Wb39pAuMUjMIcgdIqt0fEXdrfAxyZ6VGFx/PyxbxxJwUJWf5xNnJGN23ienFeYrje6ryNW9/tK
	LpVh1wegRYFwzGz3h6Y3dZuGTAyH4cBJkLEV19QZJU09Rw2o3SbbubTQVfZs5JBG4Jd3CIzCKsk
	PngEC0MtlTJvm61jkuxAUjk8YDltOQhHrtDAtFpkDBRiTfF23SQaVB99rF2f8hq47YFrxmxnpmw
	jEG9VyLFnHpcuLZjGpN1MXbakUuAYwit28zbd2Ho/nT9MFqSb2aWmhLriNGNj6yzy2/gUR0g8W8
	2MrH3+pV7ovGntimJJkR+rAF691aqXa8C/2HALjFnzYUFTtmB4AmXSrmDjjxTCv9QE+zabFjtFv
	U12bz7eTtaAKoyB1We31JTh+PvzzcUnMIhF6HbxLPbWpMZWpCiefIbOwXKeDU07IY70Ss634gfp
	IPlpXR1cVj5fcx4y+yqy5GoRwq3DupKJeIJb8rREcJoCzKklzFG2GxERZaFkiIbC5sZLylKuwE5
	qw1rx1Y1VEOwcT9TSSL+3t7YVemJQerpTRLUyGQRLP9tXVUj5iA8e2KIoUg=
X-Received: by 2002:a17:90b:4c41:b0:3a0:2ffd:1a51 with SMTP id 98e67ed59e1d1-3a0bb553257mr5933522a91.10.1790506641575;
        Sun, 27 Sep 2026 03:57:21 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99e5220sm14419192a91.16.2026.09.27.03.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:57:21 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ntfs: restart the zone search when the allocation hint fails
Date: Sun, 27 Sep 2026 18:57:13 +0800
Message-ID: <79878c7323e37a500c540b3b140102b73d46bafe.1790503811.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790503811.git.matthias.goergens@gmail.com>
References: <cover.1790503811.git.matthias.goergens@gmail.com>
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

Start the zone over as if no hint had been given.

Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/lcnalloc.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/lcnalloc.c b/fs/ntfs/lcnalloc.c
index 0d6cd08ee2e76..30faf422a5424 100644
--- a/fs/ntfs/lcnalloc.c
+++ b/fs/ntfs/lcnalloc.c
@@ -506,13 +506,25 @@ struct runlist_element *ntfs_cluster_alloc(struct ntfs_volume *vol, const s64 st
 		}
 
 		if (!used_zone_pos) {
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
2.55.0

