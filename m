Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5062E419FC9
	for <ntfs@lists.linux.dev>; Wed, 23 Sep 2026 06:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143406; cv=none; b=lZLpnRC6sHKdSLuDeiRwg2aFxRMFKGCG/EKQG7c3270L9cJznVIT4N7IETULbTvzvl0yKVNnG8IRkXzQkF8Yn0/Cfxp2dD5Ob2HymXtpsdUYIBmzqrh5heztBtP68sF46qOaCLC8QBezfXLcq05GKR7mOUOoMDnvcxpCLTjSy70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143406; c=relaxed/simple;
	bh=sBOlCUJEiFsTGPin5Ftx4LyMsLxa/4JQEqaw1fbH5tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1954gZwhAyyH1OLpt7J3zU9YepkOjuHt8GNrvb9917yKe3q9mZfkIqUzqRzln12BgEc8Ia6HvuRkVHCjZTX1cQnkSt5xnI8H5PZLXuOIVytjeNNLRS2OVtqY9So2lOyQGXvvHz/BvLjMX82HPf+bLwTG3tW2095/76g9NLuql8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YsZx6SRz; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YsZx6SRz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Cn
	LdFu/70ahvxUxf+KGnrcWNDnhJLnBlLFh9tP9Tuko=; b=YsZx6SRz04u9CaxaOs
	1aUmf/Ktl+LG6dnODXslWev5zgQnGFCDclOH+7TnlkGJ/UNftSuSqVEAhOl/HZ6A
	LR/3DQODowcB531sw9e+ZGMkDFEQKoIMGObwsbopQu08KXBZ9jO5xmFpqJCZ8BHj
	5Oc4M/pLU0qV5CHMUGseu9KK4=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCH_E+Ia7NqXdW_Aw--.58316S7;
	Wed, 23 Sep 2026 14:03:01 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 05/10] ntfs: distinguish empty EA values from removal
Date: Wed, 23 Sep 2026 14:02:41 +0800
Message-ID: <20260923060246.2499192-6-liubaolin12138@163.com>
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
X-CM-TRANSID:PygvCgCH_E+Ia7NqXdW_Aw--.58316S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr4UKrW5JF4UCw17AF4DXFb_yoW5WryDpF
	W3CrW5tF1rXFyDGr1vyw1kW3W5Zry8Kry8K3s7K3Wfurnaqw1Dt3Z5KFyagF4SyFykJ3W0
	ganYgws5Xa17JFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjyIUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hWHUmqza5USSAAA3X

From: Baolin Liu <liubaolin@kylinos.cn>

The EA setter identifies removal using a zero value length together with
XATTR_REPLACE. A replacement with a valid empty value is therefore
mistaken for deletion.

Use a NULL value to identify removal and keep zero-length values valid.
Reject removal or XATTR_REPLACE for an absent entry before creating
metadata, including when the file has no EA attributes.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/ea.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 6f7273f754ae..03117749728b 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -244,6 +244,8 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 	if (!err != !ea_err)
 		return -EUCLEAN;
 	has_ea = !err;
+	if (!has_ea && (!value || (flags & XATTR_REPLACE)))
+		return -ENODATA;
 	if (has_ea) {
 		p_ea_info = ntfs_attr_readall(ni, AT_EA_INFORMATION, NULL, 0,
 						&ea_info_size);
@@ -308,7 +310,7 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 			err = -EEXIST;
 			goto out;
 		}
-		if ((flags & XATTR_REPLACE) && !val_size) {
+		if (!value) {
 			old_ea_info = *p_ea_info;
 			old_ea_buf = kvmemdup(ea_buf, all_ea_size, GFP_NOFS);
 			if (!old_ea_buf) {
@@ -318,7 +320,7 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 		}
 
 		/* Check the final $EA size before removing the old entry. */
-		if (val_size &&
+		if (value &&
 		    ntfs_attr_size_bounds_check(ni->vol, AT_EA,
 					ea_info_qsize - ea_size + new_ea_size)) {
 			err = -EFBIG;
@@ -327,7 +329,7 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 
 		p_ea = (struct ea_attr *)(ea_buf + ea_off);
 
-		if (val_size &&
+		if (value &&
 		    le16_to_cpu(p_ea->ea_value_length) == val_size &&
 		    !memcmp(p_ea->ea_name + p_ea->ea_name_length + 1, value,
 			    val_size))
@@ -342,7 +344,7 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 		ea_info_qsize -= ea_size;
 		p_ea_info->ea_query_length = cpu_to_le32(ea_info_qsize);
 
-		if ((flags & XATTR_REPLACE) && !val_size && !ea_info_qsize) {
+		if (!value && !ea_info_qsize) {
 			err = ntfs_attr_remove(ni, AT_EA, AT_UNNAMED, 0);
 			if (err)
 				goto out;
@@ -357,7 +359,7 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 			goto out;
 		}
 
-		if ((flags & XATTR_REPLACE) && !val_size) {
+		if (!value) {
 			err = ntfs_write_ea(ni, AT_EA, ea_buf, 0, ea_info_qsize,
 					true);
 			if (err) {
@@ -378,7 +380,7 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 			goto out;
 		}
 	} else {
-		if (flags & XATTR_REPLACE) {
+		if (!value || (flags & XATTR_REPLACE)) {
 			err = -ENODATA;
 			goto out;
 		}
-- 
2.51.0

