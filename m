Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888B7509EE4
	for <ntfs@lists.linux.dev>; Thu,  1 Oct 2026 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866193; cv=none; b=FrYl51MJceroLKY7J7COLNzA4Q76O33xWEQtukVG0eYUGmlO1DtQErx2/cpLzlkXg8iC4Js69SSnAkjHKGYnADapUoKqNGrOA0190ik/ftM0kpHzPO4VyqtbUOdZvrZcnxZ3cuWh/AjkeE9hINqt2n3DsM6+3uFqStFYdDfqs6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866193; c=relaxed/simple;
	bh=ERxfbW3SLmn3MJiIEH2RCTtXQiqkLAFMno7w5RJW/AY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSTxDiWzfcxctLLi2llKOe8fOYl9SO7ca0mYywlivm91skH/tbCGzccRbnC/FISbktKFJjegNf4bF+rHrGAi7upQji6r1RHefpLZ+M2NaESGyJFIA1p3PpfpmI3iiSJPJSDhZbFM803BPdsX+tTsu0VR98NUAPosS0Tgi5bcIzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DoorMj6C; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoorMj6C"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f7so30095185ad.1
        for <ntfs@lists.linux.dev>; Thu, 01 Oct 2026 07:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790866189; x=1791470989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zULKRtuPS5k7AM5/JLrNzrwWExGeWJhTe+kTdy8fnM=;
        b=DoorMj6CsOsRrTl3wiaoqn8s0Rotjve9/Abpjz9qQ4zo3AxgONGQHVqIaeXJ46Zy1n
         iD/rPyJh1e5+VI5BVu8rNFWYoW/FvHU81CLYqmJ1C/HITtYOktB/XeUPo4vbMvSaQaEM
         DZxKTCkoe+dkiQvnmDYRk+x3uSW7gBuDjJd9p3hI88ddfxU22M6CWVMgTPxBn2ELsYyu
         RQrFkVcz03iUsKl1oE+092Kj+oRxcMkszedFhNvFZwy2YLPJfsRDpvmufZL+opAn76tX
         7A1mLMPjqiTM9rC1MlfOfIi9CjWkeXLFAccLaAKCdQRI/y6+A/87gFPYYKHqEi091NUY
         Epcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866189; x=1791470989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zULKRtuPS5k7AM5/JLrNzrwWExGeWJhTe+kTdy8fnM=;
        b=t8GBLQz1krBTocpWjQV7JjZAtkIdFCk3ZA1UgORbpz+xIjw90bWG+nKCWozvQsQBHn
         n3dKtb5PZLAKonxgnd4Lr5VHQJ0xU6XMKoDnnMTpu6z3vjNvOk8XA0WMK6eTLUCSjiEs
         amhaIGeLC79np1iC7FJKmQC1su83k2nYv+Uy6Y3BC+PC+G1nHmQNHxMXb4ALEMwmzq12
         KhSglNjTvddkRKOPtnBghBtOvUg8iG7pis+4Np+nuUkKi3psF2uZnu4Qd2LObW74Ovg6
         yD9djrMYdvz5ay2GO5rhSTL8fYKl0VAUBBOERLDG4ixcg0HoJizWWA8xOOsXb/u80bl0
         UmsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQ0SdpDsgH6eb/cvhVy5qI0J2NgoS9rNOGd8KXyStMqlpXeznYECNgoBQ5Myo7N/EUY7wS@lists.linux.dev
X-Gm-Message-State: AFq9FYKCY/+Jvy2qG0ULokw01UxkE4NZv3S4tpZwAmk+LbSIwbw8rQZh
	d31vs42nqkesdru/GkY8ljJtGmo7Mqn7sEYPhMhSDAbG4w6v3xtnx5cp
X-Gm-Gg: AYBFou1xSZva6+f6cmPU7jH/wxoCRC77NdO/67XbKafij8v7YwprLXqsBDeVtnu9k7u
	K3DelnmZMPDeu+9TeTTxGDhlT/+mBQaD1B4rO2HWd2fY8L5+LLMU0lbA86kCjwuUyPthmezu3y4
	nNSTdGjY/5P/ULEWmu5IKzTwwzPm5cmJiY4Bt8OjuqK8Rsv95hfc4eGjvr3Yq0Fq1QvfwR0OwLo
	XzkoPq+zqnfXHYoTwuzVt+77miNTHbkiVaaJSh/kywab/NfvYXKw81AhzZURcxgwEseU9DhyY/R
	3Ch/I6eYszrku0VO4aX0yRrb2UXOX0XsWJNie2zP3MN+t6xqG7f89B7FM1ncal9xUTsHRXfMu3Z
	5GVrBZEEEPai7mE39Mit4ACJYXN4yQMTIn7SOjLYWBbE8qcjtQwne7zvzB1hIDvCXxKtwMw1w6t
	lQO/1lyacgetPISbpkyEMYaaREjt3onebQaJR61B01NNXr5jMDVuuaQuHCuHUE9u80K1xXKNghX
	48ozz/Xtbcz897O1/Ljt1HikV6WVaSIxQwXBtGToQcQuUrdchMs6XDNd9mztJZeq2mebTNMmsY5
	4MhyRpkvDt7NZJgY5Dki2EO+ESdUjKuR1LnI+a7djyGYaP/1aiDrSg0on3E=
X-Received: by 2002:a17:902:fc85:b0:2dd:ad73:c988 with SMTP id d9443c01a7336-2e2e4b48e34mr40167755ad.32.1790866189323;
        Thu, 01 Oct 2026 07:49:49 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e317cd0624sm6636775ad.30.2026.10.01.07.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:49:48 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	liubaolin <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] ntfs: do not refuse fallocate() when the MFT zone is empty
Date: Thu,  1 Oct 2026 22:49:38 +0800
Message-ID: <17b1ff77bafd136d170c23f34610d06cd684c490.1790853718.git.matthias.goergens@gmail.com>
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

