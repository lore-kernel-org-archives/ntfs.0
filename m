Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFA14052DF
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290390; cv=none; b=efuWVHYQueZXzaj1y/dwTwX/59+7uSF/bPvy3PfxUQUfISsjb1ryc/NxD5uIGRYzxuzQ9evrHCLcMmRvbKgf7tSLiJEA4+KgGdZYK6aN5+mvhwCQliAqi94mNGUvSVl/SXdPiiZamr5ekov2uqzBqM+Pza7A6vgtGSlbVBBUKqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290390; c=relaxed/simple;
	bh=wI53v+3p26wqeenQxGl71xtWzrKwa3cfsO+AWGv2JNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c1SX2MLiGps31XkOGMgHzmq20qsnczQa7HsaR5P9hdbTXO/VXjss8CPDmMmDiRg99uH5MMnpno6yYgczU8NsCuSBl3G6XHIuNHc7FlklU8YX70Q3utWJZHdqVOE8dXhfKyxdhq665R3E5oazbY8xzsKm4QpTjpX4+Z2w0HRh5mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GvgN/JPu; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GvgN/JPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=UR
	EznlCsnI2DQmSzouDGoibN2V21UlSs73INLAV9RsI=; b=GvgN/JPuA8Vwy8hkOx
	0nWWyCP1WfEy9p9pwyAMBrZ913yAfhW82cz1eTWNPCQWvnc7wlSxEHMrdaPJBk3s
	dnStoS1dmVxpkuTg7D6mG4CJk69ncfOjB7nsXM6A0x3tb7eFGwHvsFkP0KW2Ijvs
	/YDaG+uqelWgkqKS5XH4Ltt2o=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnzHn44odqtfQKPQ--.8742S10;
	Fri, 21 Aug 2026 13:32:56 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 8/9] ntfs: only count successfully cleared runs when freeing clusters
Date: Fri, 21 Aug 2026 13:32:37 +0800
Message-ID: <20260821053238.1281310-9-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260821053238.1281310-1-liubaolin12138@163.com>
References: <20260821053238.1281310-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnzHn44odqtfQKPQ--.8742S10
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyfKFWrAr15XFyDCFWfXwb_yoW8Xr1fpw
	sakw1fGr4rGa409r4DK3y0v3yrX397GaykJrykWw1Sgwnav3ZrtF4rKa1Fq3Wvk39xJ3Z5
	XryUW3y3uF1jvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_UUUnUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Qh3QmqH4wgHowAA32

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_cluster_free_from_rl_nolock() adds a run's length to nr_freed
whenever the error bookkeeping condition is false, which includes
cases where ntfs_bitmap_clear_run() actually failed - e.g. a second
run failing with the same errno as an earlier one, or any failure
after a non-ENOMEM error was already recorded. Since a failed
ntfs_bitmap_clear_run() rolls back its partial modifications, no
bits were cleared for that run, yet its length still inflates
vol->free_clusters, corrupting statfs output and the allocator's
free space gate.

Only count runs whose bitmap clear succeeded.

Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/lcnalloc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/lcnalloc.c b/fs/ntfs/lcnalloc.c
index aa2e017a4384..795f71d26895 100644
--- a/fs/ntfs/lcnalloc.c
+++ b/fs/ntfs/lcnalloc.c
@@ -53,10 +53,10 @@ int ntfs_cluster_free_from_rl_nolock(struct ntfs_volume *vol,
 		if (rl->lcn < 0)
 			continue;
 		err = ntfs_bitmap_clear_run(lcnbmp_vi, rl->lcn, rl->length);
-		if (unlikely(err && (!ret || ret == -ENOMEM) && ret != err))
-			ret = err;
-		else
+		if (likely(!err))
 			nr_freed += rl->length;
+		else if (!ret || ret == -ENOMEM)
+			ret = err;
 	}
 	ntfs_inc_free_clusters(vol, nr_freed);
 	ntfs_debug("Done.");
-- 
2.51.0

