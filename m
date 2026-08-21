Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C3B4052DE
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290390; cv=none; b=N10jSB9vdnfJsxLsasBfU10aqlJkGYBxLFDs1yOPLeEpDyqm9+YmOGCBDDhCkMzc/noLt5gi8kTRCXRO5iwnzydBwC+EGI16LNJ4uo5uqDzF8UB5n7VNxQspBJDEEapEZ51BG+oWVu0aW19qceXuypCtWVCze8544/iCBg7hRDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290390; c=relaxed/simple;
	bh=HBBuvzT4wS9YFsivgZ2CKY9EfvTvgWdjA/n4NsLezYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lPzbJTTIUHj+FM0WDWlI/LqBjcy3t77tAQ04WWRzPzq4KiQa0Zww8vQQUTI7za1cnEfZymaDB9CLiyHMvDI6eiB1lzdk6qqiaNDqxV3OSJuPfl5gE/djP+XF+fvYk0nPsbeZfg/ONTdE4DTQ9Moa3O4CUpSus+BmsfrVk/dsWLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RlIxZE4D; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RlIxZE4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=yy
	ewxQpzTX4jMIjjHf6ILa7KbCm0j8w8sc+Bg4zybjY=; b=RlIxZE4DDq/QbWE264
	9HRko/AuorbH0+bdH1YAbABzlId67xJ+ZMLK7RstDFM0Ix2RYtGqY9govNQpxwi2
	hkvT9a8Ve+mfS/Ea135iUAjGC/KcQX0wUjgwOEj3/ghN9So0c+ZakzyuQLQ+dg1r
	PdVzBwq+k6CtX3PS5Zq9rOmtY=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnzHn44odqtfQKPQ--.8742S8;
	Fri, 21 Aug 2026 13:32:53 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 6/9] ntfs: return real error from ntfs_non_resident_attr_record_add()
Date: Fri, 21 Aug 2026 13:32:35 +0800
Message-ID: <20260821053238.1281310-7-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wDnzHn44odqtfQKPQ--.8742S8
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyfZw4fCw15tw4kJFWkZwb_yoW3uwb_Ca
	1xX3WkCrn8JF95Ca1kC34aka13ta4rurs8K34rGFnrG34jyF15ZrWDArs8tFWDXr17K345
	Gr1FgFyY9F1SyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRJ8nYPUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gV2QWqH4wXXcQAA31

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_non_resident_attr_record_add() returns -1 at its put_err_out
label, which callers propagate as -EPERM to userspace.

Return the actual error code. Every path reaching the label has
err set to a negative errno.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/attrib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 3d0b305703d3..a2502eee717e 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -2639,7 +2639,7 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 	return offset;
 put_err_out:
 	ntfs_attr_put_search_ctx(ctx);
-	return -1;
+	return err;
 }
 
 /*
-- 
2.51.0

