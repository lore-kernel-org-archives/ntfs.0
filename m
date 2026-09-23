Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535033A1A23
	for <ntfs@lists.linux.dev>; Wed, 23 Sep 2026 06:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143419; cv=none; b=IFzMGJMFHI0BIcjVJmrwGSjKON/5RE0NIgywiSjoWmE28i+PtDUQ6UWWbxPMa3Sc18im1KGB+evbJt06v2R7gw+CQo5lzqFcRyuODj9Po0RKvK+JeMbYfDzXArmPYTBsiA1pCB1sPCoszasryJ46DY3nASZ+mIoCXAf484YsHNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143419; c=relaxed/simple;
	bh=z9FjYaAWb4GTLQIi4odkLF+16Gv2WFoNNnH9R88QkxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSwsLehrLxcwrI63q4aQ5FlVUIlR8g50+5l4oB7AgtBMZec15rMVIacJ7V6ESR81OV/SIhzI6jgW/pO4k/RpRKUacr4Wewpe6YOSw9H/09GVJ1DBiLgZfV1zLYfvi8jXJ9vYALanY/uvOjhgbnhB15ULWxEkXDtzXPcfddOyPTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ox/3Lfls; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ox/3Lfls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=zE
	uiFnhdmn5p2+jZmwYejIT0454wV9ELKGT/9ac1Qwc=; b=Ox/3LflsJFQfOAWl+i
	p+uBMj9VkW5BdpYaaDlTgfl7oMegCSGdd3CXV4D63IfgBS37w5vCNzC1aVmHfayN
	ZVJzLUpuujxighGE3s5V/od7+yxpa2fNMtXfAXJojPgkUb3z8M83u34nM7+SxjRN
	diyloUEmBK+omrpl/QGDNsIDU=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCH_E+Ia7NqXdW_Aw--.58316S3;
	Wed, 23 Sep 2026 14:02:54 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 01/10] ntfs: keep the EA presence flag after creating the first entry
Date: Wed, 23 Sep 2026 14:02:37 +0800
Message-ID: <20260923060246.2499192-2-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260923060246.2499192-1-liubaolin12138@163.com>
References: <20260923060246.2499192-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgCH_E+Ia7NqXdW_Aw--.58316S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrWrXr15WF15CF4xAFyrZwb_yoWftFg_Wa
	4xZr1kKw4Utrn3J3Z7GryY9r4SqF4kKr1qq3s3trs7XayDtws8KrWkuws5uF4Du3yktrZ8
	urykWa4UXrs5WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0038UUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Q6FUGqza47GIwAA3r

From: Baolin Liu <liubaolin@kylinos.cn>

The successful EA update path tests ea_info_qsize when updating
NInoHasEA, but this size excludes the appended entry. Creating the first
EA, or replacing the only entry, can therefore clear the cached presence
flag despite a successful update. Reads then return ENODATA until
reload.

Include the appended entry in the size used for the presence test.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/ea.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index b4fcfbe2da4c..bb97df3045a0 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -402,6 +402,7 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 
 	if (packed_ea_size)
 		*packed_ea_size = p_ea_info->ea_length;
+	ea_info_qsize += new_ea_size;
 	mark_mft_record_dirty(ni);
 out:
 	if (!err) {
-- 
2.51.0

