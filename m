Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B223E63AC
	for <ntfs@lists.linux.dev>; Wed,  2 Sep 2026 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334403; cv=none; b=EPY5bzMOMOyGsgYzQGgT1yk27hi0H2D2Rgkx8wBQ4vk8Yx10bJrcmP/5ze6r1Oa4nkBtuqxShnAtJhRl4BTbGM0daP/GCfnF9n6Ipf8HyGua2UFxNDloTZh8b29hj9xtd0l4ZzXTwScMhrWpdZLO07sDQ5H+/ATN3wUPkkalnVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334403; c=relaxed/simple;
	bh=PKafP8lb0aFCay6oa36sWJBe+Edb1ka0Im5fDrBFSPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QycABJ5xVyezeD5ahijPKSgSUa9IkqI31qbORS9CHad388vxs9IFvQUi8igvU7Z8qyFe5DXDLSuo80bTDVxgJZ2H9jVyTbQ4225UfG2AU7+fK7NVJ3hQ7AsjdevmAe4T9u4LQ9Tvfj0keM+W8/8NDY1aiIuai0v/luKwf5Zv7Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bML7CKYc; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bML7CKYc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=7j
	by0+P6rbUvUIgyhSGcpxv3WBQLiKatCra9z2tZ7l4=; b=bML7CKYcvI9Q59pf4J
	6G4LfYqCw4YN1oINVtllRHEp/T5+WVbq4xTJkGo4AfJIT+fDL/HjXvUr4fwrbcHA
	5naBERw8kepJz6MWtpJN39EDVS8rquEgS+zTbnHDAlT0L/GKApBX/Lpa+mKpZr7y
	cDT9O6xr6DHoTU/m0MbShdca8=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3x_0k0ZdqF_ZSAA--.18706S6;
	Wed, 02 Sep 2026 15:33:01 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH 4/5] ntfs: propagate the map_mft_record() error in ntfs_attrlist_entry_add()
Date: Wed,  2 Sep 2026 15:32:48 +0800
Message-ID: <20260902073249.3035977-5-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3x_0k0ZdqF_ZSAA--.18706S6
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFy3tr45uF48ZF48AF4DCFg_yoWkZwbEva
	47t3WvyFy3GF1DGan29r42yws3uw10grnxX3saqFsrtrZrKFs5Zr95Zrs8JrZ7urWUKry3
	Gw1rWFyUuFySyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU80PfPUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6g0AymqX0S27MAAA3n

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_attrlist_entry_add() replaces the map_mft_record() error with -EIO,
so an -ENOMEM allocation failure is reported as an I/O error. Both
callers pass the value on to ntfs_attr_add(), which no longer collapses
it since commit 8efe00b098b5 ("ntfs: preserve error code in
ntfs_resident_attr_record_add()").

Return PTR_ERR(ni_mrec) instead. Also fix the debug message.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/attrlist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
index be3086d34338..a1c00e426e80 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -139,8 +139,8 @@ int ntfs_attrlist_entry_add(struct ntfs_inode *ni, struct attr_record *attr)
 
 	ni_mrec = map_mft_record(ni);
 	if (IS_ERR(ni_mrec)) {
-		ntfs_debug("Invalid arguments.\n");
-		return -EIO;
+		ntfs_debug("Failed to map mft record.\n");
+		return PTR_ERR(ni_mrec);
 	}
 
 	mref = MK_LE_MREF(ni->mft_no, le16_to_cpu(ni_mrec->sequence_number));
-- 
2.51.0

