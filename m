Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08531403B1E
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290387; cv=none; b=Ag4rljb4uplxre0Sr1KmzKrKCfTbud0ULVy2bFN0JsjvZ9GMHdql7qpxj5VEcdLGVZQJzofK6ZKrtLSNsSVjxvkdPROmjlWD7dg94RNSvhu4NZTScYqGzK5BoKzlWKsG+e96/4fy4645m+dU0CyPK72JtFI90d8y3CTGMEDiy48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290387; c=relaxed/simple;
	bh=2mLYyqLFMIwzeXQBfFgm+G71LdtYzTnFxEfui/ZcBfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/wurgoYSGvbNevxWr4hVtQz1Y5RQ6bPCzxQJzZTIeSlOwW8K8MknDMb0LvLMyJ8sd3BrY26AXRXua4XIAVgss9EGe2fQvGhJWf1KLrNN7DglGrwALoqcrdxzoCCm9WdpcmPHjEyL2rHrXJZLUxFsk4gEwxNKIZ6YCCHuhnu/wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YmTR8D1z; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YmTR8D1z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=zr
	1AaFjT/F5Yyyq/ldc7qcfTWLX1MLOt+Y6zjHnfMqg=; b=YmTR8D1zdBW0o8ri3G
	q7eMQ+E7mWa5EWxQvj23PkSIpXl1CuByR7g4r3cy1hWaCkcUOozEsVLWEHwmbc2L
	NDOVu1gjqgrdY6QZmIyejR0bOIxj3JCafffUVqus+A3eAS7WJgd565yX1jZZE90z
	gEflCxgeSg1DlUWKHPBF5xdcg=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnzHn44odqtfQKPQ--.8742S3;
	Fri, 21 Aug 2026 13:32:44 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 1/9] ntfs: return DT_UNKNOWN on inode lookup failure in readdir
Date: Fri, 21 Aug 2026 13:32:30 +0800
Message-ID: <20260821053238.1281310-2-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wDnzHn44odqtfQKPQ--.8742S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyxtw1fGFWxXw43Wr15Jwb_yoWDtFc_W3
	W3Aayv9FnxKFsFg3ZxGFW2vF9aqF40grs7urW3JFZIy398Ar1DGFsYyrs5XFWkurW5Jry5
	X3yDWry7Cr1ayjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRgmiRJUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hx0P2qH4vzWrwAA33

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_reparse_tag_dt_types() returns PTR_ERR(vi) when ntfs_iget()
fails, but its return type is unsigned int and the caller passes
the value straight to dir_emit() as d_type. A stale or corrupt MFT
reference in a directory index thus makes readdir report a garbage
d_type value to userspace.

Return DT_UNKNOWN on lookup failure instead.

Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/reparse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/reparse.c b/fs/ntfs/reparse.c
index 0d3988992119..a8e413c61353 100644
--- a/fs/ntfs/reparse.c
+++ b/fs/ntfs/reparse.c
@@ -331,7 +331,7 @@ unsigned int ntfs_reparse_tag_dt_types(struct ntfs_volume *vol, unsigned long mr
 
 	vi = ntfs_iget(vol->sb, mref);
 	if (IS_ERR(vi))
-		return PTR_ERR(vi);
+		return DT_UNKNOWN;
 
 	reparse_attr = (struct reparse_point *)ntfs_attr_readall(NTFS_I(vi),
 			AT_REPARSE_POINT, NULL, 0, &attr_size);
-- 
2.51.0

