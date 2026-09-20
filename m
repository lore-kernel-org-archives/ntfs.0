Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBC82F8E8F
	for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 08:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893126; cv=none; b=WOWPqdM5/Qq/sGcaBtvckMc5OTIkj4UZ48TzeYpoSKnShOLZwiItME6bTt4t+qTdrbJPT5OhLcdt3c1knp7MYRetlGHZuzR/LTfsxYJm+PQyXobWTf/DdgVU1Wxv3BN4csd4J+1u819+C/+BDrpe7rptjyUyo5rldv3XwKFcy3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893126; c=relaxed/simple;
	bh=Ie5COk0tmhQEcp5kIuQPo/ZUSVcEEGAhl4hJioiuhIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZOxU/Prqoc7wqD9jVo3iSKfrFDEqhhTtdM/aYtA2sDnFT9LDNaqkTNf0mkL8wQneBNBIzY+CfiphQv8LcJo/ec/w2mej4bMpVs4KwkgINAyiNFgUrgzfw50oUsxA8bbmGO6J5dSF32Mg3CYFpO0fx/LCC3u9tcLVDL18MY+Pg3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hgMBDczh; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hgMBDczh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=sl
	m6wwvgS9oQ7CXUMaxnmw9GzX+LFkkuBvWkyoC2kCg=; b=hgMBDczhlZr7K79THU
	LX/Sur3f3BUO9giErav0VGo0ddMBknBX++H8XYBOfD/UHG36xKFENp7AmxB+eKPx
	6KZAzmbXaqPgoEYL5tzJy90UO9DGXloLNTzfNu6rabPXI3aJaOSlRg5esY1iXe8p
	p6ubQDa30PA1OonPxkBBEGSbM=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgB3m07lma9qs7GbAQ--.54162S5;
	Sun, 20 Sep 2026 16:31:41 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 03/10] ntfs: propagate EA write and truncate errors
Date: Sun, 20 Sep 2026 16:31:24 +0800
Message-ID: <20260920083131.1880061-4-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260920083131.1880061-1-liubaolin12138@163.com>
References: <20260920083131.1880061-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgB3m07lma9qs7GbAQ--.54162S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyfWFW7ZF4DXF17XF17Awb_yoWkXFX_u3
	WxZF1kKr4jqF1kGanrArnI9ryqqa18ZF1qvwn5K3Wvy34Dt34qvrZ0grs5KFsrua10kr98
	Gwn3WFy3AF13GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnuVbPUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Q0o8mqvme2yPAAA3B

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_write_ea() replaces negative write errors with EIO and ignores
errors when shrinking the attribute after writing a shorter list.
This can report success even though the final resize failed.

Preserve negative write errors, use EIO for short writes, and return
truncate failures to the caller.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/ea.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 59160e49a53f..5c6facae4ed5 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -32,12 +32,12 @@ static int ntfs_write_ea(struct ntfs_inode *ni, __le32 type, char *value, s64 ea
 
 	written = ntfs_inode_attr_pwrite(ea_vi, ea_off, ea_size, value, false);
 	if (written != ea_size)
-		err = -EIO;
+		err = written < 0 ? written : -EIO;
 	else {
 		struct ntfs_inode *ea_ni = NTFS_I(ea_vi);
 
 		if (need_truncate && ea_ni->data_size > ea_off + ea_size)
-			ntfs_attr_truncate(ea_ni, ea_off + ea_size);
+			err = ntfs_attr_truncate(ea_ni, ea_off + ea_size);
 		mark_mft_record_dirty(ni);
 	}
 
-- 
2.51.0

