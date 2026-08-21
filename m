Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DB64052B9
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290389; cv=none; b=B2rCK4ACZcPrturg5eOPcIUqguGJjF0jbkKBzkqGZ/xDk3u7bvbzfAXq9ccYsVxw008m8HzwlVIzw9Ei5QYa44uoSqexncxOnccvpZSG3KjfBVxNFiKdCqO+tOsv7cmrT0RvK2wCnAlOUNMfm/GHkEyfE7l6dQpMnuktCFELGQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290389; c=relaxed/simple;
	bh=WOMgitPXnTyuSOQbnhbBYEnkEo2IesBN+n9T9cGpq6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1UlrEGP9a7W0oFUIPXQH5dC1iHrKgDvnfxhuHATWxsfZo1345Qn19x5aYYYqDKadRwLR7yL9DhUynjAEnxMnmbzsQEj+FgPgvGvtoiXfHimCwFGg6bBJNfJwgZcbxEfJXi4npV06YXCdHfh6AcL47OfBzKqfHfvfXPwFlECNUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=b4slQSlj; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="b4slQSlj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Fg
	nC+JQL1LSAx/hPAuK2YYZ3/dkpmLcQq9L3IACv9Ts=; b=b4slQSlj6AZ283rr/f
	kSRkmIF92H5ZFBM3wMyj++/5945HIus5SYoV7N25Zbr3CEIMvveptB7lQfobU2Ba
	VPXOF3i96SOwhnx72vIpvrOTrdJaTzgZdMOdG34DAPcCna08R/u4nxWfIVTSlFsD
	eC0DuG/9XIBdqTJR/I3Koxwtc=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnzHn44odqtfQKPQ--.8742S6;
	Fri, 21 Aug 2026 13:32:49 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 4/9] ntfs: return -ERANGE for undersized xattr buffer
Date: Fri, 21 Aug 2026 13:32:33 +0800
Message-ID: <20260821053238.1281310-5-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wDnzHn44odqtfQKPQ--.8742S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Gr1rCr1DKw1rCr4fAw4Dtwb_yoW8JF1fpF
	ZakFy8Kan7tFyjyF4qkr4qvw4xur9rGFyjkr9xKwnay3Z8tw1I9as5K34Ikr1IqFyxAr1k
	Gr1DurW7X3s8Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_18BUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwgF1QGqH4wGjHAAA3G

From: Baolin Liu <liubaolin@kylinos.cn>

When the value buffer passed to getxattr(2) for system.dos_attrib,
system.ntfs_attrib or system.ntfs_attrib_be is smaller than the
attribute value, ntfs_getxattr() returns -ENODATA, which tells
userspace the attribute does not exist. The xattr API expects
-ERANGE in this case, and ntfs_get_ea() in the same file already
returns -ERANGE for regular EAs.

Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/ea.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 10d5b192f07e..616eb0d65ee3 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -595,7 +595,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler,
 		if (!buffer) {
 			err = sizeof(u8);
 		} else if (size < sizeof(u8)) {
-			err = -ENODATA;
+			err = -ERANGE;
 		} else {
 			err = sizeof(u8);
 			*(u8 *)buffer = (u8)(le32_to_cpu(ni->flags) & 0x3F);
@@ -608,7 +608,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler,
 		if (!buffer) {
 			err = sizeof(u32);
 		} else if (size < sizeof(u32)) {
-			err = -ENODATA;
+			err = -ERANGE;
 		} else {
 			err = sizeof(u32);
 			*(u32 *)buffer = le32_to_cpu(ni->flags);
-- 
2.51.0

