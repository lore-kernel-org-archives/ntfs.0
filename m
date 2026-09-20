Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650DC386C39
	for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893128; cv=none; b=PMYN+0qca5M3d0ooyRr3tNzka8FxhFyGArS1qF9ypY2zpnS4k7fr7V0OgCkMtx1LIzS6iIOtslpvbYjQj9s/z42xDHqCaEIRqE9y0OuJj2YpM2jBx7wDS/R4pTFEgObDqQOHlVQ3ckvg3Pix3NsdSX1i4bT/ff9sorwQYfTNlA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893128; c=relaxed/simple;
	bh=bQEf9vL5/VwlJlkWG8rTHjE1YUHTXkblTVwOrV3ixzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ozVbKcEauRDZ5UkQzfuWAmTT3sOD27VjIOBM+iHj4Arnc8prU2yV1FbYrlaYwA7eBt92t+1uYOYh1Ec4qEJwAPl0Ky0+fIojjBDOE9JhUAtMqULGoxLdHfxw0IpB3xIu4UQNemOIXXZ/dAT1usK+NlVgP8Yc8oQR75+4hUuM0wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EfMDAOnW; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EfMDAOnW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=TO
	4+oQ7uYeq8iFmmQjDy915DK04djidl/nzAmYzA3oQ=; b=EfMDAOnWrS5cIZ48S5
	HRgX8olVFeVUnyD9Vcjw3h31jLp9nkjaGb/f+hTxtnBiNYMeG2LvsEzgmYEAniX7
	B1o+eaxx58tmTFWy5k8GSPSHlDU9KpumVKC7f6I8uvIuLjajd1cnu+jJhIpPsNDL
	c31xjdw8LqFVK2AnaZj+Vc99w=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgB3m07lma9qs7GbAQ--.54162S7;
	Sun, 20 Sep 2026 16:31:45 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 05/10] ntfs: distinguish empty EA values from removal
Date: Sun, 20 Sep 2026 16:31:26 +0800
Message-ID: <20260920083131.1880061-6-liubaolin12138@163.com>
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
X-CM-TRANSID:PygvCgB3m07lma9qs7GbAQ--.54162S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr4UKrW8uw47XryDCw4fuFg_yoW5Xw13pF
	W3CrW5tF1rXFyDGr1vyw1DW3W5Zry8Kry8K3s7K3Wxurnaqw1Dt3Z5KFyagF4SyFykJ3W0
	ganYgw4rXa17JFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URCJQUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hIp82qvmfJU5QAA39

From: Baolin Liu <liubaolin@kylinos.cn>

The EA setter identifies removal using a zero value length together
with XATTR_REPLACE. A replacement with a valid empty value is therefore
mistaken for deletion.

Use a NULL value to identify removal and keep zero-length values valid.
Reject removal or XATTR_REPLACE for an absent entry before creating
metadata, including when the file has no EA attributes.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/ea.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index f5a112495fc9..15bfcdddc7ee 100644
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

