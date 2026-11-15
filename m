Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749234;
	b=qwqm2Mav3BX3dKcHuPN1SZG1u0kjKmdlb5Uw7F/41ruvoU8NNMTxjtYek46bMxMMyDoq
	 Sz6RjRe3lJSIa24hy9Jh4mnJVDgprZ9qF/bbjIbJQkYybw/HDJII+nN9TNoSWK0gBOOU7
	 ZU5sG3fjAdT/JBQPGWZo63dmJ6D21QcCJ3cQxrR+ThOjI9q7qQn5hyCdA47E/MKPX84xz
	 iRLZK39ljy39eTI46Hc58CZHvf5VfgI/XtYSBXZ6ivAP8p6QNG3Wsl+Jaes2v+sRBxtOu
	 RdCemPvy4K8GHfmXH4xmNnNSh4+HzIBqkLEttY2a6M7mDu1r2OsGisFg6WRGPPCDXSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749234;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=DX9VM9jkTgK560Jv3EZhZ53vVQdjW3sO2tpZaZM1PhE=;
	b=bhzxDQWbCKi5qidJC/mQQHUqINUKXQ72fbVDwmYPYrFfPdu7YnX/yMUQuH8mqeVCHcVM
	 5Udp/fGpowj5KIsAxsAEEXp6EWJj6QduGaXmcheCoPaSl/blJXBh/bzMe5Ny4ghzJU9U7
	 XFVzGNHjeVLE8igP+69bA/ThLbHdjVKtG123NTgOvdZ8BFplH0pNK5OHc6SHl7vdoC/Ba
	 bOde+25TuB3qzh0QTzDzXeJUQVdy/0/ReozgfM+UeA0lUnsUp7DXotS7517F+u46UmMA+
	 yEBux2oWvpVYFWUQaSp0E+5MJc6oyVYLs3YLdhPd9H6cKpASIQpGb2khIi4XWY4vY1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=IVS4TsRx;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0C8606A327
	for <ntfs@lists.linux.dev>; Sun, 15 Nov 2026 13:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D0C8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=IVS4TsRx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=DX
	9VM9jkTgK560Jv3EZhZ53vVQdjW3sO2tpZaZM1PhE=; b=IVS4TsRxdA9ZcV9mt4
	ragq/3JNwXbuoHocfrQk4eGah1z6gIpCk0EIsPqkQLciu02UApSIF/o8pu+xwVi9
	6B3u1X4stxakvmYsRvK7apNBA8BNP+4xHMfhgXd95LqyhXbh0HShr6EyTYWaDrPe
	8+zn0XNatvSI/zQ97sjFT2KKo=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD33yHzsvlqXCkHHw--.36757S8;
	Sun, 15 Nov 2026 21:26:16 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 06/12] ntfs: read ACLs using their stored size
Date: Sun, 15 Nov 2026 21:26:03 +0800
Message-ID: <20261115132609.209957-7-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261115132609.209957-1-liubaolin12138@163.com>
References: <20261115132609.209957-1-liubaolin12138@163.com>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD33yHzsvlqXCkHHw--.36757S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF1fuFW5Xw45Gr48Ar1UKFg_yoW8Cw1fpF
	sxJr1YgF4xXry2vF1vyr4DXry093WxKay5G34fKa1Ik3yYqrnI9Fy3tFy09a1ftF93Jwn0
	qF15KrZIv347uwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2FALUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RgEzmr5svhtmgAA3V

From: Baolin Liu <liubaolin@kylinos.cn>

The ACL setter accepts values larger than PATH_MAX, but ntfs_get_acl()
uses a fixed PATH_MAX buffer. Valid ACLs larger than 4096 bytes cannot be
read back after inode eviction. Inode-based ACL lookup also propagates
this error to permission checks and default ACL inheritance.

Query the EA length and allocate the required buffer with GFP_NOFS.
Keep the record lock across the size query and read so a concurrent ACL
replacement cannot change the required size in between.

Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
New in v4.

Tested access/default ACLs of 4092, 4100 and 4836 bytes with 512-byte/4 KiB
clusters. Inheritance, permissions, remount and reboot checks passed for
regular files, O_TMPFILEs, directories and FIFOs.

 fs/ntfs/ea.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 68397b2a4e43..834f38ea4a00 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -1019,11 +1019,7 @@ struct posix_acl *ntfs_get_acl(const struct mnt_idmap *idmap, struct dentry *den
 	size_t name_len;
 	struct posix_acl *acl;
 	int err;
-	void *buf;
-
-	buf = kmalloc(PATH_MAX, GFP_KERNEL);
-	if (!buf)
-		return ERR_PTR(-ENOMEM);
+	void *buf = NULL;
 
 	/* Possible values of 'type' was already checked above. */
 	if (type == ACL_TYPE_ACCESS) {
@@ -1035,7 +1031,14 @@ struct posix_acl *ntfs_get_acl(const struct mnt_idmap *idmap, struct dentry *den
 	}
 
 	mutex_lock(&ni->mrec_lock);
-	err = ntfs_get_ea(inode, name, name_len, buf, PATH_MAX);
+	err = ntfs_get_ea(inode, name, name_len, NULL, 0);
+	if (err > 0) {
+		buf = kmalloc(err, GFP_NOFS);
+		if (!buf)
+			err = -ENOMEM;
+		else
+			err = ntfs_get_ea(inode, name, name_len, buf, err);
+	}
 	mutex_unlock(&ni->mrec_lock);
 
 	/* Translate extended attribute to acl. */

