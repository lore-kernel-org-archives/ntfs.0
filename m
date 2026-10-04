Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999E838E8B1
	for <ntfs@lists.linux.dev>; Sun,  4 Oct 2026 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107780; cv=none; b=r8i6ln1JlptKBMYMPtrb+Ec/25Oa/rECyEBHRFy5mcfCsKDS28fsClBpZOmSecQHxl7XX6VFI/dY11VGeI+RSNzZeaFyVmbGZ8i67YhLWtl4/ifQ8IrpjlgT6wtsiKEwANDeGgui2FaUQk7BMt0/uxNzSLrS58us0HYIQgYZ2UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107780; c=relaxed/simple;
	bh=vt2nIiQCTuAtlH470dtgkLlGm7ANZh3anMSq3rEFmEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbQi20ndwB885valRDLkPhuaB2MziVVrAkoEqSRCj65xarbEN+aE6q8esvKR+mSYr5RatmZSxFsvm1SALrNm/6uvwgQ/pfJvb1GVgbYrgI8LsDw86xazWk3IPQUnGJeA2zlHwp++H4MsQqg5hlvRqePmuOvVx1dalriqYYMpBDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQH0NdO9; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQH0NdO9"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-88b5f43cb8aso203937b3a.3
        for <ntfs@lists.linux.dev>; Sun, 04 Oct 2026 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791107778; x=1791712578; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvUr8Pztb0lV2mGS9jKexhNyTqSHcH6Gdx3TiQSyUcA=;
        b=FQH0NdO9LZcl3njaBzLoVMMDaL+qmsUM7QiUJyr44eTS0ecppenOKjBC8ms/TmNGcM
         paPxn0/JRuMYfc+lqGzM04ISqgGNpDcAkbZidSinnJXnR/TnmkiBl+u3GL8+kgD2HZe+
         OVtHVWQFQw+7HPqUYSRgNvkXHfEGqjyHj3Kw5Orm5ZqSvuao+x6shO3ZBtmfmER4/ftj
         x/+2CAT1Jnpw1RxhKlQ/Hn8ABg4Wse3CTruiIsfVVKdCee32G6PNCJ8QfJwHklaqiYF6
         Tyhg53gePjfwScWOEY2oEV2kZpdauxC7F7Eyk2e7XBT4Azl52fN3djgN2nDWukI+nSeb
         hiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107778; x=1791712578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NvUr8Pztb0lV2mGS9jKexhNyTqSHcH6Gdx3TiQSyUcA=;
        b=DorPXevMaxWZAinu+m6mxFzfWzuZp5A+brOxBM/sFalthNjGX/qHzMAnFlwrufu1p8
         kqNeXdghDOrfbR1XN9bv8WtOJzvwEVeKKF9YlLVad5wYPlXHzI3jpkmokpkR9e+R+sZC
         wDjRnSsu2J+GD4RySdniyj754dLD4eLgwvHMjCdYgegNa9PttPG6NdVxZDAhNgNf6khE
         yl1ASusD1u926aa931YTjWBgi4bDkHPExBfwKYwzURIfU2nGfO5oW/WRjkcie5+e3KZb
         kxWndiFBMLaPhZxdervzPRQCNsmV2gH1XQOvWGpmBTz1sLytq+XTbJ76+lUgrF2gFXXs
         g3sg==
X-Forwarded-Encrypted: i=1; AKwUvByMXdh95Eag/whCsBxDpA1J0yz3RitrP3J7ZUYMwaA1IBY8tgU8/ZvK6elcZtatKi+cDZDz@lists.linux.dev
X-Gm-Message-State: AFuF++muBe+9J4oc5cHS/X57W9L6Zq7jG9sVgAjWQpLv8MDWNocUD/MP
	ud475WB/Jrmv2W0q1XEV0WnvNszvoqU4NA72odV3Pp9xaDbFsQnc+FPdEFfWQAsZcxlpSA==
X-Gm-Gg: AYBFou3sEwk7M+K4FxfaJVOg9LPNDyq6jD722spG4PhbNVv5pWsHJKGx2sir2gXqucT
	zFr4/HtiSgCg4nzKM6NOQ0ZqbFVAPCCdS4poc/IamuM67/hR/0XLTl31gJgaB6JrR+mirBX7HjT
	1sip4ZQGbcma9qBsvR3LdZJQRFkXEJ1Ts8kdHcdgR9nBoARJFhvkLvfFW9lIfO9t7cngCR1Nk6I
	DiVYPDwYSlMFbhAPYzd+LYwnNnAXpy578hp1d/o+mrbfdY2jX+ZviQOFVGA9Vyx2ooCluV/DzIu
	D2vgVyuiAHb1fTa35c5oM255tHXAtpkX1JONVTprnomk+jgNd6RHMzW7/Grui6Q2WMk/yG4cTYa
	YjKihVUNRvY0igbxMuGnJDQ7BZlXOmrN7o/d4to6PzW1xQSkgbQq+XktyOqhbCZ0w/MXak2KzqG
	Xel1xDcDjUwX4b+UJrHxXXkb5ZB63gtw2maEmQJi2VoWpJ/WCRMFGPW0RIIUR7ko152xYdVJTmO
	k8vJSFCCG7zJHBcZeRuv0C8czAE3+stZfoNyOXDhql4ANANYmDtZetZB2jGvWirWUBB5hgNEg4o
	Sdgl3dUO8M2OH5Wl/7YtflotXqbMHRfSFSuu/cDjJ8Mc1Ga5l5Pqr7xWBYxk
X-Received: by 2002:a05:6a00:23d6:b0:882:1b4d:1847 with SMTP id d2e1a72fcca58-88c632c2abcmr3416786b3a.39.1791107777902;
        Sun, 04 Oct 2026 02:56:17 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c3a39f6sm2418175b3a.28.2026.10.04.02.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:56:17 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] ntfs: restart the zone search when the allocation hint fails
Date: Sun,  4 Oct 2026 17:56:06 +0800
Message-ID: <271a56763c9c63de326e93906ee8686fb03270e1.1791107674.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1791107674.git.matthias.goergens@gmail.com>
References: <cover.1791107674.git.matthias.goergens@gmail.com>
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
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
v2: for a contiguous request, return the run from the hint instead of
going on at the zone position (Baolin Liu).  This also fixes the stale
data after fallocate() described in the last paragraph.

v3: unchanged.  The other ways to a second run that Namjae Jeon asked
about, after the search has left the hint, are fixed in patch 4.
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

