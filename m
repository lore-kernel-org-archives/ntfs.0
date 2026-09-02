Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5299F3E7624
	for <ntfs@lists.linux.dev>; Wed,  2 Sep 2026 07:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334404; cv=none; b=ToJTNCKu5yRydc5JD6CPQfCZuhz8sNlrzdfI9M2p5i0kPOiGJT9aBvQxuFHVsZM9ukRzkkNNXIVMDYuBRWL8tQBtpeuHUWMxV2erzHke6tMLrkwIz3oyHO1L36+t//dNQ+enXf3l8RN53LRPCzi+0W+gkyfBFIUD9ONl3z5qDzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334404; c=relaxed/simple;
	bh=OF0VchsXAwyeBFR3RujPo4LNg9EgGyntY/P+gOn3XGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J78kptjcid3Q/sHEfns4P2N73VD5M74kNSMnrkG1hFl9nkZECL3osE4XlCyk4JkSwwZgvdowGu/LkZ9Ma9a8ULKgMEsBttKF+JUEIsvFRDLdC3P3PiaGXqTImiHl+qAf9aMdnhueiFa8IrsxAKhBC4eGwj0kvrC3mNoXTI5r7D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NXtSjZkH; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NXtSjZkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=vC
	Xr7BvH2aJ/WLlmao4ATdB754VnA2grj//HiiprKgE=; b=NXtSjZkHXpPN7mtS2Q
	8FwhaHt0LAIPxSJdSSim99ALTH/bH5H+E3WH0tQlaIShTWLzeEUVcxmClr/SKyh9
	zeeQzLxFZrA9Ejy+suwwEhvuJVK3ZxnxlaqF1mT1u2xO62BnM/bLmmKICY3bwwyT
	KHZKXCLsslpDA6jP6jOlWWU8o=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3x_0k0ZdqF_ZSAA--.18706S7;
	Wed, 02 Sep 2026 15:33:03 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH 5/5] ntfs: propagate the ntfs_attr_iget() error in update_reparse_data()
Date: Wed,  2 Sep 2026 15:32:49 +0800
Message-ID: <20260902073249.3035977-6-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260902073249.3035977-1-liubaolin12138@163.com>
References: <20260902073249.3035977-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3x_0k0ZdqF_ZSAA--.18706S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFy5uw15AFy3ZrW5Kry8Zrb_yoWkGrb_X3
	WfJr4qkF1jqFn3Wanaka13trsYq3W0grn5KrWrKFZFyw4DJr4kXr4kKws5JFWkXrW7Gryr
	J3y7KFy5ur13JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1RnQ5UUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwg8AymqX0S+ImQAA3V

From: Baolin Liu <liubaolin@kylinos.cn>

update_reparse_data() replaces the ntfs_attr_iget() error with -EINVAL,
so an -ENOMEM from iget5_locked() or a read failure from
ntfs_read_locked_attr_inode() is reported to userspace as EINVAL.

The path is reached from __ntfs_create() via the three
ntfs_reparse_set_*() helpers, so symlink() and mknod() are affected.

Return PTR_ERR(rp_inode) instead.

Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/reparse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/reparse.c b/fs/ntfs/reparse.c
index 1a6073e22677..2a6480211fe3 100644
--- a/fs/ntfs/reparse.c
+++ b/fs/ntfs/reparse.c
@@ -676,7 +676,7 @@ static int update_reparse_data(struct ntfs_inode *ni, struct ntfs_index_context
 
 	rp_inode = ntfs_attr_iget(VFS_I(ni), AT_REPARSE_POINT, AT_UNNAMED, 0);
 	if (IS_ERR(rp_inode))
-		return -EINVAL;
+		return PTR_ERR(rp_inode);
 	rp_ni = NTFS_I(rp_inode);
 
 	/* remove the existing reparse data */
-- 
2.51.0

