Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F79369D6E
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290388; cv=none; b=QDeOQ/Mb5zX13NXWcAoGA4nyN7cp6G7VVZewOTTL05eHqyfdBuKa7lfdJAsn2B6FOPi1vV//L5eGJdFLls+chYSMv8x5lYPYg+hZg+n1Wh/NVw8s3kyZKXJkCUIpPGplMuEF+GVFyf7fF9kzdLO0Ued6yRZWXioVqRR5fhOAft0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290388; c=relaxed/simple;
	bh=TNJfgiaZ17tAwJ8i6L6P/6Wxfrx3nOdhnuOnH+u/BpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJRAGGDr2aF2TRr5dR05zYKURtWl4RNOrn9e6UJAaxXamPlUH0/zhN+75ILsjFAeF7zlS8W6e1RzGQuFDvUVgEW+FQZ4pPWlvK/4PQrLnJl567q+cdnrR1L7qe8TGEWXznM6EOHg2hTw9fWrtvDaPz49wKSqglxQLAyZ7Bgf5gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cvFJAntp; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cvFJAntp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gp
	V1L9g1DfafpIAWW3muAXKg2f0TnoM38dxC0AXtMUI=; b=cvFJAntpE4uSFElgbm
	QB6Q9MC+o2XeOv6Gktz44o+cvz4O5SDbMzIzGTBjFW+TKW/52vDHHsJQB9eIEGdo
	La81QyQzAq60GZXkhLUEN/jxK16bQE+5sMGBoNTOXMkAoGB65gIBGkStksp7L8rU
	U99WCbcBVcJ4WgaXuq4BaezV0=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnzHn44odqtfQKPQ--.8742S7;
	Fri, 21 Aug 2026 13:32:51 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 5/9] ntfs: preserve error code in ntfs_resident_attr_record_add()
Date: Fri, 21 Aug 2026 13:32:34 +0800
Message-ID: <20260821053238.1281310-6-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wDnzHn44odqtfQKPQ--.8742S7
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFy3Ww43try7KFy7uryrXrb_yoWDXrc_ua
	1xZF1kCF1jqFs3C3Z29w1a9a1aqayIgrn8WryrGFsrW34qyFn8XFWDArs0yFWDXr17K345
	Wr1FgFy5uF1SyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRJwIqPUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwgN1QGqH4wOjPAAA3m

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_resident_attr_record_add() collapses every failure to -EIO at
its put_err_out label. This defeats the resident-to-non-resident
fallback in ntfs_attr_add(), which relies on seeing -ENOSPC to
convert the attribute when the MFT record has no room, and also
hides -EEXIST and -ENOMEM from callers.

Return the actual error code. Every path reaching the label has
err set to a negative errno.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/attrib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 990c3937a551..3d0b305703d3 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -2500,7 +2500,7 @@ int ntfs_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 	return offset;
 put_err_out:
 	ntfs_attr_put_search_ctx(ctx);
-	return -EIO;
+	return err;
 }
 
 /*
-- 
2.51.0

