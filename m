Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F01F3AFCFD
	for <ntfs@lists.linux.dev>; Sun,  4 Oct 2026 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107783; cv=none; b=sBqTu9PRPQwVb2pwv62zLynwRRHaEYTYIAZo3QWQBpfBd3VWquNwyRQuNyfrUzGn1qqiEQhSAHXkitKEcegR3w5TMXo4m6s8H6kLte7VoMum6iNbVZa9uGpqAXx2URoYWFYz7iJyIuiJz7RHePRQcYcwp7HDKesV8l80Hu+CIWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107783; c=relaxed/simple;
	bh=Xkp8Ip3A8seD3miBA/ZSjvmtqN7r7RiaLWsa9arQrP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fgzj2unSHU4a4LkEN+0DNpA89Z5BRTS1F6zqdvM6yQvigB1EN3jV4dEnmZnq24A/q76b5tA1kAyrzN76JWmOQk8QX5q8o0ax/WizGSlYkNP5QkR31cIzgruUfx7YqXeuxQJtQZk3uBiC4VZl7SdpQD/waB2XL8dENnJUNlrL3h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rz4uGXkB; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rz4uGXkB"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0eeda3e03so308323a91.1
        for <ntfs@lists.linux.dev>; Sun, 04 Oct 2026 02:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791107782; x=1791712582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sv3Xutg7k+QurrnMBqbS8TX2eZEovTI1Y5eV74+MZfw=;
        b=rz4uGXkBskzrm9Bse4txouJDhKXrcDVg0DqdoUUIqOVVMwz3NMNmtZr1IiMOq3wCDK
         yk+vVt8t+Z58d2jYwviTSps4ySv5NSqL39iohDk9XnSDHpreRBChudl3HtSb6hqLRvyg
         VWt4Lu/wlCqu5u96UE8FCFYPp55hvdKphnpOzcOyvl4Gu0jxeuwKR7B9YGCPYSD4z2f5
         gZ25uwWlZCSUvsQXh5m3iCiZxCxLzcxO8iyWhhx5xA7UKoPRwMbXkHHcOW1HA+zLOuOI
         FnpRTQbbUNi3atSA7a4MDZECIZyTM1zGRHRFhGIS/x/Dj9lrJoL101bIWSaIfSVWlArJ
         J8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107782; x=1791712582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sv3Xutg7k+QurrnMBqbS8TX2eZEovTI1Y5eV74+MZfw=;
        b=zcFRKfO8+h/9LZ97sg69ewrBKxUKSO8Qc0m9j1HGVAIExauqvtTvyBM67y5+ZwtXGy
         9CDWIPlwJhUNonBijfXE1E9UZZ3G5eMxR9rMPxfitfjM8KAhZkvSCba78vrSt+PPVTa6
         wEkQCQ9wI9oQ3aPDDnJFt6HFg+2iWGM2Zo9YMMVe19hD5TygRsdk3rYv2AOXJFrfzk9y
         xexMTULjABZT6lOeZpA3WCzTzYqcarZcTqNDjjS5P7BnghXNoE7lue1Y0I3nC28Z+1F4
         SkkQEgEcY5H8XdOVh4p3jY2DhCB+WajGa/TQJnesYMb9/rmPU9nWk71XpOv+eMkSmEi/
         JcSA==
X-Forwarded-Encrypted: i=1; AKwUvBy6xSHERfrEehYNtMRbXdrWo2bQbHIzq/+79y1Bvw0RmSlukx4mSkq/sUT9vqPkJs7kZ6oY@lists.linux.dev
X-Gm-Message-State: AFuF++lsuEifPX4RF4GywCPtHovpIMQkITumnztQ3FA39dNz1X6yMSpj
	RwCve3MQmVxOTWEu3eTd+5Em9Av6/IqGdgUdh11h3V+XSJS3u22ydI3y
X-Gm-Gg: AYBFou3zjyCw3COJ3WtVpZY/ObZGDVcG9vxTkzH3Zz9V7Hsjlo/2HBlb384iMaITOyT
	+uomfCKKnwQw45F568uNu27UJIaPlsvxT9acov+UoQLXANLqlVJnlkGZGcunh/NNXN91i+p7wZO
	hVn0enWK8F1xDYXJiASONAD4PUl/cHCsgaRcjHdaIDapYbnEnGdql39YUWu9sMOTJv5O56z+/3S
	sfBBFv0mlIimBCAjxq5I04wUhfGv2bWyU7b2PM0xYITz6t3fJ0qaVA2Nq4r4YbUqL2/8s6YSWta
	uHV/K9pM/gn8QnwexlZaauL+ayBNAndQkU5S4iUbMBclRnzjvIFTSmxD16pkC1r1ns8SrWBtsZd
	PZApyCF//8HIXOLQPQHGGEHxyWkgH/4zZIOmc73G79Gtyk2PN4jgj/5BDwb1cHgVnOWrpPZZ3Y5
	gPp4GKHKBSc5Em2ZyxubFMVeR+1ulkqBv8nHzUhSh0kE1J9rpqVmfUXfKi7eDAf6e2ZBzXiXnZ1
	MviVM/gw6UbRO39+FKwvPndTblHoKjfTsnsXIvTlWXUn7VaPXAUZE6utqgt/KaZr8eeGokpm1r4
	nZB9W9h1pxcAYeFzOIJe8aCZcR08IGXKYaZ6FgLQtrMgUJITxS3sHXSj03k=
X-Received: by 2002:a05:6a21:e10a:b0:3d3:adbf:7781 with SMTP id adf61e73a8af0-3e0bd17ecf2mr7842316637.22.1791107781655;
        Sun, 04 Oct 2026 02:56:21 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c3a39f6sm2418175b3a.28.2026.10.04.02.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:56:19 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] ntfs: do not refuse fallocate() when the MFT zone is empty
Date: Sun,  4 Oct 2026 17:56:07 +0800
Message-ID: <abb9876394e7ef057b327270682e4ea864ca8d1b.1791107674.git.matthias.goergens@gmail.com>
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
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/file.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 3ec82715a588..762045d26296 100644
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
2.56.0

