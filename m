Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCF4396572
	for <ntfs@lists.linux.dev>; Fri,  4 Sep 2026 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512501; cv=none; b=lIn9UHzjn1H5gm4hZ+Ewkl+2hXjkCJfHq5bLxTSKhUcbdsxyhLzN2FgdNG6COBweBUtNRIGAIeL4pCZbPTgLD+lUH9t7yF4DtUkwfx3HOpmW6cUfU1KhnHIQGpngo1shUqTgTWcNAtHYdC08JcPDhezrwlKWoLIxWE4gDOwZthk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512501; c=relaxed/simple;
	bh=x0u4nn+phvIo4zTiyC73ZSVY80IPnQsT5OcowsFdGfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPDipmjxF7s6CvlwJUCUDge4v8kVaJ6CURl39JRjWqECPzLykIuFkapkIM3iOdKgawSA+SxcE/ve4AYdOHcWFdYPSIcCUf3TsgRfhek2kC+fyvoQROz0O45/C6U6seg2xwzsWbGMOP0gGkN2ND55BQdTSf2WZVycI6wDaP5m5Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=VVzNP5/T; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="VVzNP5/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=mb
	lHzv1W0QmRiNpHJyRAvAGrR6YKXJiBdzlZw01hfkM=; b=VVzNP5/TOQ7efZ5wI+
	G0H7AuOjpIFIEjsQn9d6WLb1viQoq+r2ZhohnINeoCo0l+ToitBQqPkm/tG+BCkX
	gH1aBxCZeA2sQ/jBwT6Inig/PO5EMRJ1H5nP5LH1lvJpkHQGg1JdV6aRWGpMvcPD
	F8TMnnVaHPIbsC//MHOKNY26Q=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAHU97ViJpqDNWCAg--.41284S7;
	Fri, 04 Sep 2026 17:01:26 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 5/5] ntfs: propagate the ntfs_attr_iget() error in update_reparse_data()
Date: Fri,  4 Sep 2026 17:00:54 +0800
Message-ID: <20260904090054.3365538-6-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260904090054.3365538-1-liubaolin12138@163.com>
References: <20260904090054.3365538-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHU97ViJpqDNWCAg--.41284S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFy5uw15AFy3ZrW5Kry8Zrb_yoWkCrg_X3
	WxJr4qk3WUXFn3Wan3Ca1ayrsYq3W0grnYgrWfKFZFyw4DJr4kXr1kKws5JFWkXrW7Gry5
	G3y7KFy5ur13JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1RVbPUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwgacZ2qaiOYNgAAA3s

From: Baolin Liu <liubaolin@kylinos.cn>

update_reparse_data() replaces the ntfs_attr_iget() error with -EINVAL,
so an -ENOMEM from iget5_locked() or a read failure from
ntfs_read_locked_attr_inode() is reported to userspace as EINVAL.

The path is reached from __ntfs_create() via the three
ntfs_reparse_set_*() helpers, so symlink() and mknod() are affected.

Return PTR_ERR(rp_inode) instead.

Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
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

