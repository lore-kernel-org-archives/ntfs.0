Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8923C1977
	for <ntfs@lists.linux.dev>; Wed, 23 Sep 2026 06:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143409; cv=none; b=jjiTYr2JPwP8WyjvsI8qyuZZAfIigTX/pKS5oCgujfBJf4+S6RtPqIJlAGb2rl7v54TA4tUHkUwloR+hioyS5cYxqDlCcUPjpEqvFMdEw/XzBDmGY/Py6luBLnIArvh7XAhgTtWS4E/aEHm3CNROEl/4jmUV7FauLd8jEVTCKFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143409; c=relaxed/simple;
	bh=XxLdUmBno4bd5Qj5g1RgFgK0RqMw0Dv2kgbnplqeGkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YobITML2Gs2VBtNAnUFYQOCwebqQXXgTWtxUTmKe5o/eoBKfWDUcjIUlzbNBMo36GuE0T1Q0CuqmbKzyVEx7NZJs7SDTw81RxnHj1hKjNtlR9IG3BNt313/tFNXrfCkH3uZhh2EOFdkl0JezFQW8d3rccuQtloF+5iFHwYhjOQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mMxIHG0T; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mMxIHG0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ye
	bFd7WMTqJxaSa+0EPIQ3YSpYYSMXtcX0gRL2DMfBE=; b=mMxIHG0TBsR1+IGJt2
	n+x/gtx0c0qODQpDIfoADyluDgExD1Ukg0LmCUDtcTxXKcgJHZ0X4cHZFdA0FBDG
	WAtR/QN6y3a32iW5aLKcDZ1csr5XiAlbX/08igH2n8PGGXBmqPmQGbDS8IUeSVj1
	RMaSS0FQTVNfgEj1V5lX8z+yg=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCH_E+Ia7NqXdW_Aw--.58316S4;
	Wed, 23 Sep 2026 14:02:56 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 02/10] ntfs: validate EA chains and link zero-terminated tails
Date: Wed, 23 Sep 2026 14:02:38 +0800
Message-ID: <20260923060246.2499192-3-liubaolin12138@163.com>
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
X-CM-TRANSID:PygvCgCH_E+Ia7NqXdW_Aw--.58316S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxtrWDuw1DWw1fWw4DZryxXwb_yoW7uF4UpF
	9Iy3s8tr4rJrnrGFnakw4DXayF9397WryUK34xKw1Ikr1qqr15tas09F9a9ayFy3ykAr1r
	tFZ8tFs5uF1UAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jgJ5rUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hCGUWqza5ARwAAA3e

From: Baolin Liu <liubaolin@kylinos.cn>

A zero next-entry offset terminates an EA list. Appending an entry
without linking the old tail makes the new entry unreachable. Invalid
entries are also treated as missing names, allowing setters to proceed
on corrupt metadata.

Validate the entire chain before modifying it and connect a zero tail to
the append position. Check name terminators and retain the full tail
span when removing an entry. Return EUCLEAN for malformed EA structures
and inconsistent information lengths, preserving that error through the
get, set and list paths. Keep ENOENT for a missing name and translate it
to ENODATA only at the xattr read boundary. Preserve lower-level read
errors.

Reuse the same full-chain validation in ntfs_listxattr(), including
size-only queries, before copying names. Reject malformed lists with
EUCLEAN instead of returning an empty or partial list.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/ea.c | 81 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 48 insertions(+), 33 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index bb97df3045a0..2ee700f8227e 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -53,10 +53,13 @@ static int ntfs_ea_lookup(char *ea_buf, s64 ea_buf_size, const char *name,
 	loff_t offset, p_ea_size;
 	unsigned int next;
 
+	if (!ea_buf_size)
+		return -ENOENT;
+
 	offset = 0;
 	do {
 		if (ea_buf_size - offset < sizeof(struct ea_attr))
-			break;
+			return -EUCLEAN;
 
 		p_ea = (const struct ea_attr *)&ea_buf[offset];
 		next = le32_to_cpu(p_ea->next_entry_offset);
@@ -64,31 +67,31 @@ static int ntfs_ea_lookup(char *ea_buf, s64 ea_buf_size, const char *name,
 
 		if (p_ea_size < sizeof(struct ea_attr) ||
 		    offset + p_ea_size > ea_buf_size)
-			break;
+			return -EUCLEAN;
 
 		if ((s64)p_ea->ea_name_length + 1 >
 		    p_ea_size - offsetof(struct ea_attr, ea_name))
-			break;
+			return -EUCLEAN;
 
 		actual_size = ALIGN(struct_size(p_ea, ea_name, 1 + p_ea->ea_name_length +
 					le16_to_cpu(p_ea->ea_value_length)), 4);
-		if (actual_size > p_ea_size)
-			break;
+		if (actual_size > p_ea_size ||
+		    p_ea->ea_name[p_ea->ea_name_length])
+			return -EUCLEAN;
 
-		if (p_ea->ea_name_length == name_len &&
+		if (name && p_ea->ea_name_length == name_len &&
 		    !memcmp(p_ea->ea_name, name, name_len)) {
 			*ea_offset = offset;
-			*ea_size = next ? next : actual_size;
+			*ea_size = p_ea_size;
 
 			if (ea_buf_size < *ea_offset + *ea_size)
-				goto out;
+				return -EUCLEAN;
 
 			return 0;
 		}
 		offset += next;
 	} while (next > 0 && offset < ea_buf_size);
 
-out:
 	return -ENOENT;
 }
 
@@ -126,7 +129,7 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
 		return PTR_ERR(p_ea_info);
 	if (ea_info_size != sizeof(struct ea_information)) {
 		kvfree(p_ea_info);
-		return -EIO;
+		return -EUCLEAN;
 	}
 
 	ea_info_qlen = le32_to_cpu(p_ea_info->ea_query_length);
@@ -137,7 +140,7 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
 		return PTR_ERR(ea_buf);
 
 	if (ea_info_qlen > all_ea_size) {
-		err = -EIO;
+		err = -EUCLEAN;
 		goto free_ea_buf;
 	}
 
@@ -162,7 +165,8 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
 		return ea_value_len;
 	}
 
-	err = -ENODATA;
+	if (err == -ENOENT)
+		err = -ENODATA;
 free_ea_buf:
 	kvfree(ea_buf);
 	return err;
@@ -216,7 +220,7 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 			goto out;
 		}
 		if (ea_info_size != sizeof(struct ea_information)) {
-			err = -EIO;
+			err = -EUCLEAN;
 			goto out;
 		}
 
@@ -255,12 +259,29 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 	}
 
 	if (ea_info_qsize > all_ea_size) {
-		err = -EIO;
+		err = -EUCLEAN;
+		goto out;
+	}
+
+	/* Validate the whole chain before modifying it, including its tail. */
+	err = ntfs_ea_lookup(ea_buf, ea_info_qsize, NULL, 0, &ea_off,
+			     &ea_size);
+	if (err != -ENOENT)
 		goto out;
+	/* A zero tail offset must be linked before appending another EA. */
+	for (ea_off = 0; ea_off < ea_info_qsize; ea_off += ea_size) {
+		p_ea = (struct ea_attr *)(ea_buf + ea_off);
+		ea_size = le32_to_cpu(p_ea->next_entry_offset);
+		if (!ea_size) {
+			ea_size = ea_info_qsize - ea_off;
+			p_ea->next_entry_offset = cpu_to_le32(ea_size);
+		}
 	}
 
 	err = ntfs_ea_lookup(ea_buf, ea_info_qsize, name, name_len, &ea_off,
 			&ea_size);
+	if (err && err != -ENOENT)
+		goto out;
 	if (ea_info_qsize && !err) {
 		if (flags & XATTR_CREATE) {
 			err = -EEXIST;
@@ -537,7 +558,7 @@ ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 		goto out;
 	}
 	if (ea_info_size != sizeof(struct ea_information)) {
-		err = -EIO;
+		err = -EUCLEAN;
 		goto out;
 	}
 
@@ -550,32 +571,26 @@ ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 		goto out;
 	}
 
-	if (ea_info_qsize > ea_buf_size || ea_info_qsize == 0)
+	if (ea_info_qsize > ea_buf_size) {
+		err = -EUCLEAN;
+		goto out;
+	}
+
+	/* Validate the entire chain, including size-only queries. */
+	err = ntfs_ea_lookup(ea_buf, ea_info_qsize, NULL, 0, &offset,
+			     &ea_size);
+	if (err != -ENOENT)
+		goto out;
+	err = 0;
+	if (!ea_info_qsize)
 		goto out;
 
 	offset = 0;
 	do {
-		if (ea_info_qsize - offset < sizeof(struct ea_attr)) {
-			err = -EIO;
-			goto out;
-		}
-
 		p_ea = (const struct ea_attr *)&ea_buf[offset];
 		next = le32_to_cpu(p_ea->next_entry_offset);
 		ea_size = next ? next : (ea_info_qsize - offset);
 
-		if (ea_size < sizeof(struct ea_attr) ||
-		    offset + ea_size > ea_info_qsize) {
-			err = -EIO;
-			goto out;
-		}
-
-		if ((int)p_ea->ea_name_length + 1 >
-			ea_size - offsetof(struct ea_attr, ea_name)) {
-			err = -EIO;
-			goto out;
-		}
-
 		if (buffer) {
 			if (ret + p_ea->ea_name_length + 1 > size) {
 				err = -ERANGE;
-- 
2.51.0

