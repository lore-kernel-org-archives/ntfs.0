Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3051D369D6E
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290393; cv=none; b=FGHm0UHgGOh8SJu13RkTow58Md1mmowIwSFsjwueD4OMwa5t2ZQO72woRmcmH8G2dmD831h6/th8RsnMvaxf1D+jJSrCNNucZLW54HLLDfLOtuCWmwCVQhy+TSPmL0O7JgjD8Lh49cV0JwVVyhQfk1LxrFFG6rLlPYJ9FlDZRiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290393; c=relaxed/simple;
	bh=Jg1anYCcLfSpOVEs8Qq4zxReVpkLqMbbUzyxB/Zl8/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ym/WcC/8hLks/2CVXIM1MNQVnYLILBNZSDPA4QKiXr4rLlljnevjXQGIrPj93OczFixYZlaq5Ucjyi8pLDwXfYr3iOG/c81EE+ntLXCvA5m5L/6CQzOEKLbN5G5e2Fh+j86FwDSrQ2w/FK0m0RRZczzROuDZdEgfx+3uBN/Ka2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Le1GA0Li; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Le1GA0Li"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=L3
	r+pw+SkSw77dGpHhU+FrNHZM9TPC0TXs+iZt1rokY=; b=Le1GA0LigKtvEYoc96
	wAhtyNQ+C4WECkNXzWquYtYLpqZHDGPJWeQ9XTeqt/otXRPGPhphDHv7M0s/4svN
	cPvqHpQP+M2OtMLUexsh816D8DpH3BfAYDKm/NUrn1LV4LLfIe3if+1jimQBPQiI
	BtFH6BKYz83eGsTJYRMnPGXiM=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnzHn44odqtfQKPQ--.8742S11;
	Fri, 21 Aug 2026 13:32:58 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 9/9] ntfs: skip free cluster decrement when rollback fails
Date: Fri, 21 Aug 2026 13:32:38 +0800
Message-ID: <20260821053238.1281310-10-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wDnzHn44odqtfQKPQ--.8742S11
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF15AF4fCr47WF15KrW5Awb_yoWkKrcEga
	yUJFZrG34UtF1rGa4vg39FgrWIv3WkK3s2g3y5tFZ8A3yfCa1rZa4DArZ5Aw4Igr4jkw45
	JwnY9FyrAF1SqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRJUUU3UUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Qp3QmqH4woHyQAA3c

From: Baolin Liu <liubaolin@kylinos.cn>

When the rollback in __ntfs_cluster_free() fails, the recursive
call returns a negative errno and the subsequent
ntfs_dec_free_clusters(vol, delta) subtracts that negative value,
adding bogus clusters to the counter on an already-failing volume.

Skip the decrement when the rollback failed.

Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/lcnalloc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/lcnalloc.c b/fs/ntfs/lcnalloc.c
index 795f71d26895..0d6cd08ee2e7 100644
--- a/fs/ntfs/lcnalloc.c
+++ b/fs/ntfs/lcnalloc.c
@@ -1045,8 +1045,9 @@ s64 __ntfs_cluster_free(struct ntfs_inode *ni, const s64 start_vcn, s64 count,
 			"Failed to rollback (error %i).  Leaving inconsistent metadata!  Unmount and run chkdsk.",
 			(int)delta);
 		NVolSetErrors(vol);
+	} else {
+		ntfs_dec_free_clusters(vol, delta);
 	}
-	ntfs_dec_free_clusters(vol, delta);
 	up_write(&vol->lcnbmp_lock);
 	memalloc_nofs_restore(memalloc_flags);
 	ntfs_error(vol->sb, "Aborting (error %i).", err);
-- 
2.51.0

