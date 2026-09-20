Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327D43655C2
	for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 08:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893147; cv=none; b=nHJ1suvT2xUIZSSquilBhhA3oNYU4ybKXseoCfUoUtO60a45SWwQdCft2ZO14hrts1S4rhgT80fAKWb4s8ivN27qQl7nyFS5cc0f+Vq3ZwJ0fzXPloHt3tjBhOT292EybOfyGYHbmdTx/8PuOzFuUkwVvB2GFMrLhaWBECPNPto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893147; c=relaxed/simple;
	bh=KnWBpetLSIW2NcgHc/qdOhtbAgG7QeEht7w12H7gtoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKkGj3IPEdPpptKtHBs8VAKxE41hA9Q3MsaSIqXVElONAAVyQ2bOKdVLH92c/+QmXsfW8eLoI23v8a/lbAan1nymDTo4ntgElYR8rLmzTj1WSbtEGkik0WqAA2T+dCnl7ycBkoHb+XXx8WIlVv/GZhfeQpjs2F7O+pWfkT/SmCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=f8DpYe5L; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="f8DpYe5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=zt
	QZCB9KQWbq+msDaiN3rOMomM+arOVVqFZ2JoMkek0=; b=f8DpYe5L6ueBAQiKSh
	6eWhgbXpb+1r8OWl2Kl9tBhaW17HV0BVZ/HN8nmJSmFLhwAPSD5cVGDbGt2HwkGS
	QgjWmG5rPS0O49yV0PDpXxEpgfEXgez2X3+DASRmmCBU+lvsvUBTdhxVsKFdt6CV
	R7E/9kwN0HPLpv2bGCTv8bnRc=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgB3m07lma9qs7GbAQ--.54162S8;
	Sun, 20 Sep 2026 16:31:47 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 06/10] ntfs: restore EA attributes when an update fails
Date: Sun, 20 Sep 2026 16:31:27 +0800
Message-ID: <20260920083131.1880061-7-liubaolin12138@163.com>
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
X-CM-TRANSID:PygvCgB3m07lma9qs7GbAQ--.54162S8
X-Coremail-Antispam: 1Uf129KBjvAXoW3tFWkurW3uFyUAw13uryfZwb_yoW8JryrAo
	Wa9r45Gw1kuryjkw17Kw4qy3sxXF95K3yUJw4YkanFkF4j9w1Dtwnxt3WFgaySg3WrKF4D
	Ww1Sqwn7CF18Jryxn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxDDJDUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwRMp82qvmfMMTQAA3m

From: Baolin Liu <liubaolin@kylinos.cn>

Creating or replacing an EA can leave EA data and information out of
sync if a later update fails. Existing deletion rollback ignores its
own errors, and creation changes metadata before preparing the new list.

Prepare the complete new list while retaining both original attributes.
Update EA data and information only after preparation succeeds, restore
both on failure, and publish the cached presence state only on success.
Keep structure errors as EUCLEAN and preserve operation errors. Mark the
volume erroneous and shut it down if either restoration fails.

This handles synchronous failures; it does not make the two updates
atomic across power loss or guarantee restoration on a failing device.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/ea.c | 349 ++++++++++++++++++++-------------------------------
 1 file changed, 138 insertions(+), 211 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 15bfcdddc7ee..888b531e8174 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -204,262 +204,189 @@ static int ntfs_ea_attr_lookup(struct ntfs_inode *ni, __le32 type)
 	return err;
 }
 
+/* A NULL value means that the attribute should not exist. */
+static int ntfs_ea_update_attr(struct ntfs_inode *ni, __le32 type,
+			       char *value, s64 size)
+{
+	int err = ntfs_ea_attr_lookup(ni, type);
+
+	if (err && err != -ENOENT)
+		return err;
+	if (!value)
+		return err == -ENOENT ? 0 :
+			ntfs_attr_remove(ni, type, AT_UNNAMED, 0);
+	if (err == -ENOENT)
+		return ntfs_attr_add(ni, type, AT_UNNAMED, 0, value, size);
+	return ntfs_write_ea(ni, type, value, 0, size, true);
+}
+
 /*
- * Set a new EA, and set EA_INFORMATION accordingly
- *
- * This is roughly the same as ZwSetEaFile() on Windows, however
- * the "offset to next" of the last EA should not be cleared.
- *
- * Consistency of the new EA is first checked.
- *
- * EA_INFORMATION is set first, and it is restored to its former
- * state if setting EA fails.
+ * Prepare the new EA list before changing either NTFS attribute. Keep the
+ * original values until both updates succeed, so a failed update can be
+ * rolled back. This does not provide atomicity across a crash or power loss.
  */
 static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 		const void *value, size_t val_size, int flags,
 		__le16 *packed_ea_size)
 {
 	struct ntfs_inode *ni = NTFS_I(inode);
-	struct ea_information *p_ea_info = NULL;
-	int ea_packed, err = 0, ea_err;
-	bool has_ea;
-	struct ea_attr *p_ea;
-	u32 ea_info_qsize = 0;
-	char *ea_buf = NULL;
-	char *new_ea_buf;
-	char *old_ea_buf = NULL;
-	struct ea_information old_ea_info;
-	size_t new_ea_size = ALIGN(struct_size(p_ea, ea_name, 1 + name_len + val_size), 4);
-	s64 ea_off, ea_info_size, all_ea_size, ea_size;
-
-	if (name_len > 255)
+	struct ea_information *old_info = NULL, info = {};
+	char *old_ea = NULL, *ea = NULL;
+	struct ea_attr *entry;
+	s64 old_size = 0, info_size, offset = 0, entry_size = 0;
+	u32 size = 0, new_size, next;
+	size_t add_size;
+	int err, info_err, ea_err, packed = 0, needed = 0;
+	bool exists, remove = !value;
+
+	if (name_len > U8_MAX)
 		return -ENAMETOOLONG;
+	if (val_size > U16_MAX)
+		return -E2BIG;
 
 	err = ntfs_ea_attr_lookup(ni, AT_EA_INFORMATION);
 	if (err && err != -ENOENT)
 		return err;
-	ea_err = ntfs_ea_attr_lookup(ni, AT_EA);
-	if (ea_err && ea_err != -ENOENT)
-		return ea_err;
-	if (!err != !ea_err)
+	exists = !err;
+	err = ntfs_ea_attr_lookup(ni, AT_EA);
+	if (err && err != -ENOENT)
+		return err;
+	/* Do not silently discard an orphaned attribute. */
+	if (exists != !err)
 		return -EUCLEAN;
-	has_ea = !err;
-	if (!has_ea && (!value || (flags & XATTR_REPLACE)))
-		return -ENODATA;
-	if (has_ea) {
-		p_ea_info = ntfs_attr_readall(ni, AT_EA_INFORMATION, NULL, 0,
-						&ea_info_size);
-		if (IS_ERR(p_ea_info)) {
-			err = PTR_ERR(p_ea_info);
-			p_ea_info = NULL;
-			goto out;
-		}
-		if (ea_info_size != sizeof(struct ea_information)) {
+
+	if (exists) {
+		old_info = ntfs_attr_readall(ni, AT_EA_INFORMATION, NULL, 0,
+					     &info_size);
+		if (IS_ERR(old_info))
+			return PTR_ERR(old_info);
+		if (info_size != sizeof(*old_info)) {
 			err = -EUCLEAN;
 			goto out;
 		}
-
-		ea_buf = ntfs_attr_readall(ni, AT_EA, NULL, 0, &all_ea_size);
-		if (IS_ERR(ea_buf)) {
-			err = PTR_ERR(ea_buf);
-			ea_buf = NULL;
+		old_ea = ntfs_attr_readall(ni, AT_EA, NULL, 0, &old_size);
+		if (IS_ERR(old_ea)) {
+			err = PTR_ERR(old_ea);
+			old_ea = NULL;
 			goto out;
 		}
-
-		ea_info_qsize = le32_to_cpu(p_ea_info->ea_query_length);
-	} else {
-		p_ea_info = kzalloc_obj(struct ea_information, GFP_NOFS);
-		if (!p_ea_info)
-			return -ENOMEM;
-
-		ea_info_qsize = 0;
-		err = ntfs_attr_add(ni, AT_EA_INFORMATION, AT_UNNAMED, 0,
-				(char *)p_ea_info, sizeof(struct ea_information));
-		if (err)
+		size = le32_to_cpu(old_info->ea_query_length);
+		if (size > old_size) {
+			err = -EUCLEAN;
 			goto out;
-
-		goto alloc_new_ea;
-	}
-
-	if (ea_info_qsize > all_ea_size) {
-		err = -EUCLEAN;
-		goto out;
+		}
 	}
 
-	/* Validate the whole chain before modifying it, including its tail. */
-	err = ntfs_ea_lookup(ea_buf, ea_info_qsize, NULL, 0, &ea_off,
-			     &ea_size);
+	/* Validate even the entries following the one being replaced. */
+	err = ntfs_ea_lookup(old_ea, size, NULL, 0, &offset, &entry_size);
 	if (err != -ENOENT)
 		goto out;
-	/* A zero tail offset must be linked before appending another EA. */
-	for (ea_off = 0; ea_off < ea_info_qsize; ea_off += ea_size) {
-		p_ea = (struct ea_attr *)(ea_buf + ea_off);
-		ea_size = le32_to_cpu(p_ea->next_entry_offset);
-		if (!ea_size) {
-			ea_size = ea_info_qsize - ea_off;
-			p_ea->next_entry_offset = cpu_to_le32(ea_size);
-		}
-	}
-
-	err = ntfs_ea_lookup(ea_buf, ea_info_qsize, name, name_len, &ea_off,
-			&ea_size);
+	err = ntfs_ea_lookup(old_ea, size, name, name_len, &offset, &entry_size);
 	if (err && err != -ENOENT)
 		goto out;
-	if (ea_info_qsize && !err) {
+	if (!err) {
 		if (flags & XATTR_CREATE) {
 			err = -EEXIST;
 			goto out;
 		}
-		if (!value) {
-			old_ea_info = *p_ea_info;
-			old_ea_buf = kvmemdup(ea_buf, all_ea_size, GFP_NOFS);
-			if (!old_ea_buf) {
-				err = -ENOMEM;
-				goto out;
-			}
-		}
-
-		/* Check the final $EA size before removing the old entry. */
-		if (value &&
-		    ntfs_attr_size_bounds_check(ni->vol, AT_EA,
-					ea_info_qsize - ea_size + new_ea_size)) {
-			err = -EFBIG;
-			goto out;
-		}
-
-		p_ea = (struct ea_attr *)(ea_buf + ea_off);
-
-		if (value &&
-		    le16_to_cpu(p_ea->ea_value_length) == val_size &&
-		    !memcmp(p_ea->ea_name + p_ea->ea_name_length + 1, value,
-			    val_size))
-			goto out;
-
-		le16_add_cpu(&p_ea_info->ea_length, 0 - ea_packed_size(p_ea));
-
-		if (p_ea->flags & NEED_EA)
-			le16_add_cpu(&p_ea_info->need_ea_count, -1);
-
-		memmove((char *)p_ea, (char *)p_ea + ea_size, ea_info_qsize - (ea_off + ea_size));
-		ea_info_qsize -= ea_size;
-		p_ea_info->ea_query_length = cpu_to_le32(ea_info_qsize);
-
-		if (!value && !ea_info_qsize) {
-			err = ntfs_attr_remove(ni, AT_EA, AT_UNNAMED, 0);
-			if (err)
-				goto out;
-
-			err = ntfs_attr_remove(ni, AT_EA_INFORMATION, AT_UNNAMED, 0);
-			if (err) {
-				/* Restore the original $EA if $EA_INFORMATION removal failed. */
-				ntfs_attr_add(ni, AT_EA, AT_UNNAMED, 0, old_ea_buf,
-					      all_ea_size);
-				ea_info_qsize = le32_to_cpu(old_ea_info.ea_query_length);
-			}
-			goto out;
-		}
-
-		if (!value) {
-			err = ntfs_write_ea(ni, AT_EA, ea_buf, 0, ea_info_qsize,
-					true);
-			if (err) {
-				ntfs_write_ea(ni, AT_EA, old_ea_buf, 0,
-					      all_ea_size, false);
-				goto out;
-			}
-
-			err = ntfs_write_ea(ni, AT_EA_INFORMATION, (char *)p_ea_info,
-					0, sizeof(struct ea_information), false);
-			if (err) {
-				ntfs_write_ea(ni, AT_EA, old_ea_buf, 0,
-					      all_ea_size, false);
-				ntfs_write_ea(ni, AT_EA_INFORMATION,
-					      (char *)&old_ea_info, 0,
-					      sizeof(old_ea_info), false);
-			}
-			goto out;
+		entry = (struct ea_attr *)(old_ea + offset);
+		if (!remove && le16_to_cpu(entry->ea_value_length) == val_size &&
+		    !memcmp(entry->ea_name + name_len + 1, value, val_size)) {
+			info = *old_info;
+			goto done;
 		}
 	} else {
-		if (!value || (flags & XATTR_REPLACE)) {
+		if (remove || (flags & XATTR_REPLACE)) {
 			err = -ENODATA;
 			goto out;
 		}
+		offset = size;
+		entry_size = 0;
+	}
 
-		if (ntfs_attr_size_bounds_check(ni->vol, AT_EA,
-					ea_info_qsize + new_ea_size)) {
-			err = -EFBIG;
+	add_size = remove ? 0 : ALIGN(sizeof(*entry) + name_len + 1 + val_size, 4);
+	new_size = size - entry_size + add_size;
+	if (new_size && ntfs_attr_size_bounds_check(ni->vol, AT_EA, new_size)) {
+		err = -EFBIG;
+		goto out;
+	}
+	if (new_size) {
+		ea = kvzalloc(new_size, GFP_NOFS);
+		if (!ea) {
+			err = -ENOMEM;
 			goto out;
 		}
+		if (offset)
+			memcpy(ea, old_ea, offset);
+		if (size > offset + entry_size)
+			memcpy(ea + offset, old_ea + offset + entry_size,
+			       size - offset - entry_size);
 	}
-alloc_new_ea:
-	new_ea_buf = kvzalloc(ea_info_qsize + new_ea_size, GFP_NOFS);
-	if (!new_ea_buf) {
-		err = -ENOMEM;
-		goto out;
+	size -= entry_size;
+
+	/* Link a zero-terminated old tail before appending the new entry. */
+	for (offset = 0; offset < size; offset += next) {
+		entry = (struct ea_attr *)(ea + offset);
+		next = le32_to_cpu(entry->next_entry_offset);
+		if (!next) {
+			next = size - offset;
+			entry->next_entry_offset = cpu_to_le32(next);
+		}
+		packed += ea_packed_size(entry);
+		if (entry->flags & NEED_EA)
+			needed++;
 	}
-	if (ea_info_qsize)
-		memcpy(new_ea_buf, ea_buf, ea_info_qsize);
-	kvfree(ea_buf);
-	ea_buf = new_ea_buf;
-	p_ea = (struct ea_attr *)(ea_buf + ea_info_qsize);
-
-	/*
-	 * EA and REPARSE_POINT compatibility not checked any more,
-	 * required by Windows 10, but having both may lead to
-	 * problems with earlier versions.
-	 */
-	memcpy(p_ea->ea_name, name, name_len);
-	p_ea->ea_name_length = name_len;
-	p_ea->ea_name[name_len] = 0;
-	memcpy(p_ea->ea_name + name_len + 1, value, val_size);
-	p_ea->ea_value_length = cpu_to_le16(val_size);
-	p_ea->next_entry_offset = cpu_to_le32(new_ea_size);
-
-	ea_packed = le16_to_cpu(p_ea_info->ea_length) + ea_packed_size(p_ea);
-	p_ea_info->ea_length = cpu_to_le16(ea_packed);
-	p_ea_info->ea_query_length = cpu_to_le32(ea_info_qsize + new_ea_size);
-
-	if (ea_packed > 0xffff) {
+	if (!remove) {
+		entry = (struct ea_attr *)(ea + size);
+		entry->next_entry_offset = cpu_to_le32(add_size);
+		entry->ea_name_length = name_len;
+		entry->ea_value_length = cpu_to_le16(val_size);
+		memcpy(entry->ea_name, name, name_len);
+		memcpy(entry->ea_name + name_len + 1, value, val_size);
+		packed += ea_packed_size(entry);
+	}
+	if (packed > U16_MAX) {
 		err = -EFBIG;
 		goto out;
 	}
-
-	/*
-	 * no EA or EA_INFORMATION : add them
-	 */
-	if (!has_ea) {
-		err = ntfs_attr_add(ni, AT_EA, AT_UNNAMED, 0, ea_buf,
-				ea_info_qsize + new_ea_size);
-		if (err)
-			goto out;
-	} else {
-		err = ntfs_write_ea(ni, AT_EA, ea_buf, 0,
-				ea_info_qsize + new_ea_size, true);
-		if (err)
-			goto out;
-	}
-
-	err = ntfs_write_ea(ni, AT_EA_INFORMATION, (char *)p_ea_info, 0,
-			sizeof(struct ea_information), false);
-	if (err)
+	info.ea_length = cpu_to_le16(packed);
+	info.need_ea_count = cpu_to_le16(needed);
+	info.ea_query_length = cpu_to_le32(new_size);
+
+	/* All preparation is complete; errors from here require rollback. */
+	err = ntfs_ea_update_attr(ni, AT_EA, ea, new_size);
+	if (!err)
+		err = ntfs_ea_update_attr(ni, AT_EA_INFORMATION,
+					  new_size ? (char *)&info : NULL,
+					  sizeof(info));
+	if (err) {
+		/* Try both restorations even if the first one fails. */
+		ea_err = ntfs_ea_update_attr(ni, AT_EA, old_ea, old_size);
+		info_err = ntfs_ea_update_attr(ni, AT_EA_INFORMATION,
+					       (char *)old_info, sizeof(info));
+		if (ea_err || info_err) {
+			NVolSetErrors(ni->vol);
+			NVolSetShutdown(ni->vol);
+			ntfs_error(inode->i_sb,
+				   "Failed to restore EAs of inode 0x%llx (%d, %d); shutting down.",
+				   ni->mft_no, ea_err, info_err);
+			err = -EIO;
+		}
 		goto out;
-
-	if (packed_ea_size)
-		*packed_ea_size = p_ea_info->ea_length;
-	ea_info_qsize += new_ea_size;
+	}
+	size = new_size;
 	mark_mft_record_dirty(ni);
+done:
+	if (packed_ea_size)
+		*packed_ea_size = info.ea_length;
+	if (size)
+		NInoSetHasEA(ni);
+	else
+		NInoClearHasEA(ni);
 out:
-	if (!err) {
-		if (ea_info_qsize > 0)
-			NInoSetHasEA(ni);
-		else
-			NInoClearHasEA(ni);
-	}
-
-	kvfree(ea_buf);
-	kvfree(old_ea_buf);
-	kvfree(p_ea_info);
-
+	kvfree(ea);
+	kvfree(old_ea);
+	kvfree(old_info);
 	return err;
 }
 
-- 
2.51.0

