Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F943DD516
	for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 08:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893146; cv=none; b=BwvRO+dQXKgBLgHj5iDwDFqtWjXjWwORdHXXQLLMHVDyZLpB+Tk5sLw/B0J6+MnZc+03EatjwGtYFsUCgqmRiijFBBN/7xIFpQl750/Ix3nkPGPuJeQNxyk1znOdTu6DmOwyxmDyQOUbppCujLuFoHcp0sitThqoKQJ90i8Gs/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893146; c=relaxed/simple;
	bh=aZth6nxuWM8ERphc/6Yf1Tf9N1VgkBIYC4VUoYbavjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ln3vFZYACThjCZA19ydpI5E8FtLdI0t3kWmbIdlKubvAETryFeNF33MLJq/J+4W/VdyMb3ljm3B3lLGYgqHXew+LwYB90HIiLxbEBUdIVU0BdVSrorfYfN6gKP/p2u9IU0XlS0jzYOT6kuJR5yp/K5Oc02zwQ+P0cShZCVJOdYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ElDCOoo2; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ElDCOoo2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=B3
	utF3Yej1TLrgwxqsdULLbpamiQnMXrQzVkb8JA0fY=; b=ElDCOoo2v3x8XVt/5L
	efPcJE7LNfvpaIWCPzyuxd1+8hvutejF+zR+brC8x5yU5LSjq7/GMAqEsng6dsdP
	uFg1E6iZRBylNxQblIzncyE47L2nj5sYpCejU94yZ/VhgkVOUXvTiQn0hATNUoTM
	SlAc9wiiIHXizUw3kqteGjC8I=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgB3m07lma9qs7GbAQ--.54162S4;
	Sun, 20 Sep 2026 16:31:40 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 02/10] ntfs: validate EA chains and link zero-terminated tails
Date: Sun, 20 Sep 2026 16:31:23 +0800
Message-ID: <20260920083131.1880061-3-liubaolin12138@163.com>
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
X-CM-TRANSID:PygvCgB3m07lma9qs7GbAQ--.54162S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF4rJFy7JF1fAr1kJrWkWFg_yoWrCrW3pF
	Z8A3s8tr4fJrnrGFsayr4DXayYy397WFyUt347Kw1vkrnYvr15tas0kasa9ayFkrWkZr1F
	qFZ8KF48uF1UArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jqeHDUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Qwo8mqvmeyyDQAA3w

From: Baolin Liu <liubaolin@kylinos.cn>

A zero next-entry offset terminates an EA list. Appending an entry
without linking the old tail makes the new entry unreachable. Invalid
entries are also treated as missing names, allowing setters to proceed
on corrupt metadata.

Validate the entire chain before modifying it and connect a zero tail
to the append position. Check name terminators and retain the full tail
span when removing an entry. Return EUCLEAN for malformed EA structures
and inconsistent information lengths, preserving that error through the
get and set paths. Keep ENOENT for a missing name and translate it to
ENODATA only at the xattr read boundary. Preserve lower-level read errors.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/ea.c | 49 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index bb97df3045a0..59160e49a53f 100644
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
 		goto out;
 	}
 
+	/* Validate the whole chain before modifying it, including its tail. */
+	err = ntfs_ea_lookup(ea_buf, ea_info_qsize, NULL, 0, &ea_off,
+			     &ea_size);
+	if (err != -ENOENT)
+		goto out;
+	/* A zero tail offset must be linked before appending another EA. */
+	for (ea_off = 0; ea_off < ea_info_qsize; ea_off += ea_size) {
+		p_ea = (struct ea_attr *)(ea_buf + ea_off);
+		ea_size = le32_to_cpu(p_ea->next_entry_offset);
+		if (!ea_size) {
+			ea_size = ea_info_qsize - ea_off;
+			p_ea->next_entry_offset = cpu_to_le32(ea_size);
+		}
+	}
+
 	err = ntfs_ea_lookup(ea_buf, ea_info_qsize, name, name_len, &ea_off,
 			&ea_size);
+	if (err && err != -ENOENT)
+		goto out;
 	if (ea_info_qsize && !err) {
 		if (flags & XATTR_CREATE) {
 			err = -EEXIST;
-- 
2.51.0

