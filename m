Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBE53BF684
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506653; cv=none; b=JCT6fuKHazlHb1KsRRkptZDreK4HhRKGBVWRD8AJpP6uouJ1u5msYt6QaX24+dnwJSdHjAPbKdmrRQcS3/EdyACd7BrB/fhW+kNq6Egxt1wNzddVj7o2bYENayf6zE8cC35Y1Hi43Zi8d8412LUSM0ahSKJCLzowv1j5gtYjo8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506653; c=relaxed/simple;
	bh=Y9FffLNiSXHIXGdQDT5BK/jzm2kA9XM4TuzHSNvoE0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQmlvK9gPANFgZjXa/Fv5H0GG18tjG348xZw/daFRefHRuBrmiJuUeBDCxdaoBJkNaBbutDqQjJyu9xnBf7A6w180mlgCdsX+wS2md4bSdOS+qR5bEaVeYkuzZoLgiXT/2l3pM1uyoIqmmaL3YfkuegDmQ2W+gYcGBPpljzVEqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sI1itgPp; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sI1itgPp"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba91so1002873a91.1
        for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 03:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506643; x=1791111443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNhuqNyiZflMWMLYzKj40EbjoI3SE3GVYg6+rQBmhgM=;
        b=sI1itgPpHe3v/ktxn/0EGQGO91b9Az8VEgagPrxhP2iltHzDxy5VIFC47YVe4NmN+/
         69uhPP45I12NMVCFWc2cKSBT7WgdNn1a74oBTHSswyJJvpHA2R2545W/reBV2s28Rhza
         b3AukdO+glw602OcCZFhIz/qR9Zvcqp9LFoeqYClzrc+s67EqmpAYZS+q+N+gYPbNENb
         l1lzzzED+OrjWqiiE+Yx9wzNXCshG3K39H4KhdJZQbMFvhmdfBfAVDNLWUsGDymlVTJ+
         DenMFNlYHk/yn74wuGuaGcyQTdvpUDu2mSDIvClmgmW2W9Ao2N9FwSEsFuc/4cHdy8kN
         gs+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506643; x=1791111443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNhuqNyiZflMWMLYzKj40EbjoI3SE3GVYg6+rQBmhgM=;
        b=1FpN3hblbp8Z/U6aefH7SAprCeWrSyZPBdJ0qxJV+7v0NQufu7QOiQo8spW+MjfcXm
         zDORvltxpd1K/5UszW7tDIOJRu9+8ijlxoW53TXIRDRmPaPBa/q41Z4WUNBhdTgkYtL1
         x930VkPA7exlJaS2NT8pJg8OalDRjJIvQfjcnZBp18P/petXe8yKaBRDbaQ9FClG2/OX
         ljBSPDEoUaqND0gKwxCZO4dkigsh3bMlwM30XKsILkAQdgWkZIC5jRtcG2xZ3yZgAsUs
         spDw30SwBSHud01WuizdGia/hb4dM3heV/0vQjbFID+W+n8yoXL0pps2xdFsJjV19KzP
         Rl/w==
X-Gm-Message-State: AFq9FYItPR/G5qr6hLci5ujsTR4Ei/PemSd/xMS6BT4GKTi3Z+WOJOt7
	Dbfk7GUVdm49bAIS7St/TH572bm5QBXERajmqGVOqFc2GDlPwteMmYID
X-Gm-Gg: AYBFou1AHnulDOW5tRLn7XhgiPvckX7RkPxTFhdsHo3M+ahV1RrdWVv85Dj8M1DquqM
	5Ox6IT4hmLaUgWP9S22pXlufVHG+S6Y5cBD+/UwLbOYEKVREmMsZNGTVftRPwJJx6OtEgZcIOYO
	7ps8PFjvHHlxDHl6mKZR2eiPZXIqX8fIqR647J3kzJumHRd2NNFIio0GMrH/pSdFgR3mWWoGA/n
	oCmU2uzLx40KqHkibz4wp6aF1eKm8T4Shg6ZWN8FX2v3UOv6995GjcHZB0K3DfJI5zyINex2R3Z
	zhPHBXtlt2RN7oWNv+qUOmgYXT7jxnx//NR7NYAYXT1KzSfsTKMx9m2mE4O5WJcBVW9tQMaFI5H
	+IBSQldE0PvjqRJaY/GjHtVrSWhJ3XKI6TGgW/tWKRhgUf44e7OC5eiqQsUgpdWnJZUq76C84/H
	bXbDihcWXfXUGbzWJsh32jMcFBYOsh3ct7YG5EgKr9roCR5aRsx6MV3nfJpVvBh7wyrKPLjnDYA
	/3fU5XJZxiljrOtxVOYaYyI4hxQY7OpYQ4UDYmkPRSYsq18s5nrSCTSZ6mALuG/HNzLag9hIYcW
	IDt0R2TnSJpGhBcK12YIc6z84uZr9c7ZFoK+puIatNYMW3JxGplTFi7HHrc=
X-Received: by 2002:a17:90b:384a:b0:3a0:c156:3f8a with SMTP id 98e67ed59e1d1-3a0c156441fmr5811233a91.56.1790506643527;
        Sun, 27 Sep 2026 03:57:23 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99e5220sm14419192a91.16.2026.09.27.03.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:57:23 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ntfs: do not refuse fallocate() when the MFT zone is empty
Date: Sun, 27 Sep 2026 18:57:14 +0800
Message-ID: <77d2e237e1c2ded042f8220350fd92cce5f502e7.1790503811.git.matthias.goergens@gmail.com>
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

ntfs_fallocate() fails with -ENOSPC whenever the MFT zone has shrunk to
nothing.  The cluster allocator gives the MFT zone up when it cannot
find free clusters elsewhere, and nothing restores it before the next
mount, so after one such failure every fallocate() on the volume fails
with ENOSPC, punching holes included, however much space is freed.  The
allocator failure fixed by the previous patch was enough to get there:
afterwards a one-cluster fallocate() failed with ENOSPC while 123 MiB of
the 128 MiB volume were free.

write() and truncate() do not look at the MFT zone, and
ntfs_allocate_range() already fails with -ENOSPC when too few clusters
are free.  Remove the check.

Fixes: 9c87959601e8 ("ntfs: update file operations")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/file.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 3ec82715a5882..762045d262963 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -1163,9 +1163,6 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 	if (!NVolFreeClusterKnown(vol))
 		wait_event(vol->free_waitq, NVolFreeClusterKnown(vol));
 
-	if ((ni->vol->mft_zone_end - ni->vol->mft_zone_start) == 0)
-		return -ENOSPC;
-
 	if (NInoNonResident(ni) && !NInoFullyMapped(ni)) {
 		down_write(&ni->runlist.lock);
 		err = ntfs_attr_map_whole_runlist(ni);
-- 
2.55.0

