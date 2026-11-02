Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605147;
	b=r5bqEaLc4HbWLA7Hnh+mBaxnj5U21GcGnTrwOSY21ObpLrMhpTdQUMV8vCq6RHMEOVhi
	 AElaPzVjSaG/p2XUWO7ry1krY4SoqS1BqsqKksO1Fn+2uwMIOsZwIIDOsHFh3m86+ZlPU
	 SrBR9qrTNkqQwmM8qj9s7CeCcK6LDntPzKGpR+aJcrS6JvjKJSPz1/xJ2kXgyqQ3ejYm2
	 0f6vLJauk+C1Q8eU7QAkbvbvsasU/S3fLOJGdiAXlAaC8rsLYJ7sTDAifo96itDfgiVxr
	 hoVBMm9tjNDuXeols8ZY229B2reEpehUpjCeMtn/cbR8sgk2vJQ7E77Ra8Ojsy0QyLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605147;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=pc+t/sBP4msBuO2u5r/6zX21HNjMObf3cA+ETzGNpmk=;
	b=P07xhNxn0rWFbm8c5mYUZyuq8Fdgm7nXCnqhmDYLmu19dZEjJvhW0jrLilFzwdqfOvCE
	 PLvPg0ha1vpOa+rY8oKRWtwHdyhN0A5d4IKAfG3EjujKLCd6kCyxssj9A86lP4G8/ZYIu
	 3Y1XFKCjMKIQsqxIMV6D3LR//9MjRstagNhoVeLc/j3QxQfYj5KRNzojCSyxw2vyLqzvS
	 5B1TLbOOBL1sEo+P1sBjqekiq/ND2R9yZb/CJocIfaZJUxqqpGkz8pp6SCM+jP13pNO2q
	 F1gFvT2nDPi629Y3LNFA2dEqJK1v0ydZGRbjthhcverbuuPoJacYFwnp1CWn7jMXjoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nuG48Gt7;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF86606A327
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DF86606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nuG48Gt7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=pc
	+t/sBP4msBuO2u5r/6zX21HNjMObf3cA+ETzGNpmk=; b=nuG48Gt7cl6kduCZoj
	FYg7W6o4zE8rB3SmwQ2J9tWVHYCSp2xl85ysDXl+YgJxpZYYnb6QDLiTo/TOGPcE
	FXp3zZEd6ZAWUbpfmJJKWNqW6FO4DKuIA8s7hQKYzI20ZA0JDXZ+CFcxXB1rr2uy
	6bhx9FEPVCQDCusJ4vHQVrNt8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3nygJPuhqucJHEg--.56690S6;
	Mon, 02 Nov 2026 15:38:52 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v5 28/31] ntfs: report EA metadata and restoration errors
Date: Mon,  2 Nov 2026 15:35:29 +0800
Message-Id: <20261102073532.98873-29-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102073532.98873-1-wangxuewen_ky@163.com>
References: <20261102073532.98873-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3nygJPuhqucJHEg--.56690S6
X-Coremail-Antispam: 1Uf129KBjvJXoW3Cw4kZw15GFyfJF47Xr4xZwb_yoWkZFWxpF
	yfC34Dt3yrJr9rWrn2ywnFq3WY9ryIgrWUGryxK3WIk3Z8twn0qa4q9FWa9FZYkrWkGw18
	KF4Dtws8AF4UXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UzlksUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC7wxnUGroPgxc2wAA3j

From: Xuewen Wang <wangxuewen@kylinos.cn>

Report malformed EA chains, orphaned attributes and invalid Linux flag
sizes. Check HasEA under mrec_lock in listxattr; when it is set, missing
EA_INFORMATION or EA is corruption. Preserve read errors already reported
below, ordinary missing keys and buffer-size errors. Report local setter
validation failures once without repeating lower-level reports.

Convert invalid stored ACLs and inconsistent saved-ACL read lengths to
EFSCORRUPTED. Keep unsupported ACL versions and allocation failures
distinct. Preserve missing AttrDef errors and non-ENOENT flag lookup
errors; report mapping-pairs sizing errors only for EFSCORRUPTED.

Report EA and EA_INFORMATION restoration failures separately, and failed
ACL restoration after a WSL mode update. Preserve the initiating error
and existing shutdown decisions, including on recovery-time ENOMEM.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Validation:
- Thirteen cases cover EA setter report ownership, local corruption,
  lower read/update errors, missing AttrDef, ENOMEM and the attribute-size
  limit. Lower-level reports are not duplicated.
- All pass in an extracted-source userspace harness with controlled
  dependencies under ASan/UBSan; checks cover reporting calls.

 fs/ntfs/ea.c | 161 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 103 insertions(+), 58 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index fc8a57e0e7d0..2fec8bfcdd89 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -113,7 +113,7 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
 {
 	struct ntfs_inode *ni = NTFS_I(inode);
 	const struct ea_attr *p_ea;
-	char *ea_buf;
+	char *ea_buf = NULL;
 	s64 ea_off, ea_size, all_ea_size, ea_info_size;
 	int err;
 	u32 ea_info_qlen;
@@ -125,25 +125,28 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
 
 	p_ea_info = ntfs_attr_readall(ni, AT_EA_INFORMATION, NULL, 0,
 			&ea_info_size);
-	if (IS_ERR(p_ea_info))
-		return PTR_ERR(p_ea_info);
+	if (IS_ERR(p_ea_info)) {
+		err = PTR_ERR(p_ea_info);
+		goto read_error;
+	}
 	if (ea_info_size != sizeof(struct ea_information)) {
 		kvfree(p_ea_info);
-		return -EUCLEAN;
+		goto corrupt;
 	}
 
 	ea_info_qlen = le32_to_cpu(p_ea_info->ea_query_length);
 	kvfree(p_ea_info);
 
 	ea_buf = ntfs_attr_readall(ni, AT_EA, NULL, 0, &all_ea_size);
-	if (IS_ERR(ea_buf))
-		return PTR_ERR(ea_buf);
-
-	if (ea_info_qlen > all_ea_size) {
-		err = -EUCLEAN;
-		goto free_ea_buf;
+	if (IS_ERR(ea_buf)) {
+		err = PTR_ERR(ea_buf);
+		ea_buf = NULL;
+		goto read_error;
 	}
 
+	if (ea_info_qlen > all_ea_size)
+		goto corrupt;
+
 	err = ntfs_ea_lookup(ea_buf, ea_info_qlen, name, name_len, &ea_off,
 			&ea_size);
 	if (!err) {
@@ -165,11 +168,23 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
 		return ea_value_len;
 	}
 
+	if (err == -EUCLEAN)
+		goto corrupt;
 	if (err == -ENOENT)
 		err = -ENODATA;
 free_ea_buf:
 	kvfree(ea_buf);
 	return err;
+
+read_error:
+	/* I/O and decoding errors are already reported by the read path. */
+	if (err != -ENOENT)
+		goto free_ea_buf;
+corrupt:
+	/* With HasEA set, both NTFS EA attributes must exist. */
+	err = -EUCLEAN;
+	ntfs_report_file_metadata_error(inode, err);
+	goto free_ea_buf;
 }
 
 static inline int ea_packed_size(const struct ea_attr *p_ea)
@@ -181,7 +196,7 @@ static inline int ea_packed_size(const struct ea_attr *p_ea)
 	return 5 + p_ea->ea_name_length + le16_to_cpu(p_ea->ea_value_length);
 }
 
-/* Unlike ntfs_attr_exist(), preserve lookup errors. */
+/* Return the lookup errno, including -ENOENT for an absent attribute. */
 static int ntfs_ea_attr_lookup(struct ntfs_inode *ni, __le32 type)
 {
 	struct ntfs_attr_search_ctx *ctx;
@@ -254,17 +269,15 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 		return err;
 	/* Do not silently discard an orphaned attribute. */
 	if (exists != !err)
-		return -EUCLEAN;
+		goto corrupt;
 
 	if (exists) {
 		old_info = ntfs_attr_readall(ni, AT_EA_INFORMATION, NULL, 0,
 					     &info_size);
 		if (IS_ERR(old_info))
 			return PTR_ERR(old_info);
-		if (info_size != sizeof(*old_info)) {
-			err = -EUCLEAN;
-			goto out;
-		}
+		if (info_size != sizeof(*old_info))
+			goto corrupt;
 		old_ea = ntfs_attr_readall(ni, AT_EA, NULL, 0, &old_size);
 		if (IS_ERR(old_ea)) {
 			err = PTR_ERR(old_ea);
@@ -272,19 +285,17 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 			goto out;
 		}
 		size = le32_to_cpu(old_info->ea_query_length);
-		if (size > old_size) {
-			err = -EUCLEAN;
-			goto out;
-		}
+		if (size > old_size)
+			goto corrupt;
 	}
 
 	/* Validate even the entries following the one being replaced. */
 	err = ntfs_ea_lookup(old_ea, size, NULL, 0, &offset, &entry_size);
 	if (err != -ENOENT)
-		goto out;
+		goto corrupt;
 	err = ntfs_ea_lookup(old_ea, size, name, name_len, &offset, &entry_size);
 	if (err && err != -ENOENT)
-		goto out;
+		goto corrupt;
 	if (!err) {
 		if (flags & XATTR_CREATE) {
 			err = -EEXIST;
@@ -307,9 +318,13 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 
 	add_size = remove ? 0 : ALIGN(sizeof(*entry) + name_len + 1 + val_size, 4);
 	new_size = size - entry_size + add_size;
-	if (new_size && ntfs_attr_size_bounds_check(ni->vol, AT_EA, new_size)) {
-		err = -EFBIG;
-		goto out;
+	if (new_size) {
+		err = ntfs_attr_size_bounds_check(ni->vol, AT_EA, new_size);
+		if (err) {
+			if (err == -ERANGE)
+				err = -EFBIG;
+			goto out;
+		}
 	}
 	if (new_size) {
 		ea = kvzalloc(new_size, GFP_NOFS);
@@ -366,7 +381,10 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 		info_err = ntfs_ea_update_attr(ni, AT_EA_INFORMATION,
 					       (char *)old_info, sizeof(info));
 		if (ea_err || info_err) {
-			NVolSetErrors(ni->vol);
+			if (ea_err)
+				ntfs_report_file_metadata_error(inode, ea_err);
+			if (info_err)
+				ntfs_report_file_metadata_error(inode, info_err);
 			NVolSetShutdown(ni->vol);
 			ntfs_error(inode->i_sb,
 				   "Failed to restore EAs of inode 0x%llx (%d, %d); shutting down.",
@@ -389,6 +407,11 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 	kvfree(old_ea);
 	kvfree(old_info);
 	return err;
+
+corrupt:
+	err = -EUCLEAN;
+	ntfs_report_file_metadata_error(inode, err);
+	goto out;
 }
 /*
  * Check for the presence of an EA "$LXDEV" (used by WSL)
@@ -492,10 +515,12 @@ int ntfs_ea_get_linuxflags(struct inode *inode)
 			  &value, sizeof(value));
 	if (err == -ENODATA)
 		return 0;
-	if (err < 0)
-		return err == -ERANGE ? -EUCLEAN : err;
-	if (err != sizeof(value))
+	if (err < 0 && err != -ERANGE)
+		return err;
+	if (err != sizeof(value)) {
+		ntfs_report_file_metadata_error(inode, -EUCLEAN);
 		return -EUCLEAN;
+	}
 
 	ni->linuxflags = le32_to_cpu(value);
 	if (ni->linuxflags & NTFS_LINUXFLAGS_IMMUTABLE)
@@ -543,23 +568,21 @@ ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	u32 ea_info_qsize;
 	char *ea_buf = NULL;
 	ssize_t ret = 0;
-	struct ea_information *ea_info;
+	struct ea_information *ea_info = NULL;
 
+	mutex_lock(&ni->mrec_lock);
+	/* Recheck after locking: the last EA may have just been removed. */
 	if (!NInoHasEA(ni))
-		return 0;
-
-	mutex_lock(&NTFS_I(inode)->mrec_lock);
+		goto out;
 	ea_info = ntfs_attr_readall(ni, AT_EA_INFORMATION, NULL, 0,
 			&ea_info_size);
 	if (IS_ERR(ea_info)) {
 		err = PTR_ERR(ea_info);
 		ea_info = NULL;
-		goto out;
-	}
-	if (ea_info_size != sizeof(struct ea_information)) {
-		err = -EUCLEAN;
-		goto out;
+		goto read_error;
 	}
+	if (ea_info_size != sizeof(struct ea_information))
+		goto corrupt;
 
 	ea_info_qsize = le32_to_cpu(ea_info->ea_query_length);
 
@@ -567,19 +590,17 @@ ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	if (IS_ERR(ea_buf)) {
 		err = PTR_ERR(ea_buf);
 		ea_buf = NULL;
-		goto out;
+		goto read_error;
 	}
 
-	if (ea_info_qsize > ea_buf_size) {
-		err = -EUCLEAN;
-		goto out;
-	}
+	if (ea_info_qsize > ea_buf_size)
+		goto corrupt;
 
 	/* Validate the entire chain, including size-only queries. */
 	err = ntfs_ea_lookup(ea_buf, ea_info_qsize, NULL, 0, &offset,
 			     &ea_size);
 	if (err != -ENOENT)
-		goto out;
+		goto corrupt;
 	err = 0;
 	if (!ea_info_qsize)
 		goto out;
@@ -605,11 +626,21 @@ ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	} while (next > 0 && offset < ea_info_qsize);
 
 out:
-	mutex_unlock(&NTFS_I(inode)->mrec_lock);
+	mutex_unlock(&ni->mrec_lock);
 	kvfree(ea_info);
 	kvfree(ea_buf);
 
 	return err ? err : ret;
+
+read_error:
+	/* I/O and decoding errors are already reported by the read path. */
+	if (err != -ENOENT)
+		goto out;
+corrupt:
+	/* HasEA was checked under mrec_lock; this is not an absent xattr. */
+	err = -EUCLEAN;
+	ntfs_report_file_metadata_error(inode, err);
+	goto out;
 }
 
 // clang-format off
@@ -673,6 +704,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler,
 
 static int ntfs_new_attr_flags(struct ntfs_inode *ni, __le32 fattr)
 {
+	int report_err = 0;
 	struct ntfs_attr_search_ctx *ctx;
 	struct mft_record *m;
 	struct attr_record *a;
@@ -694,7 +726,8 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni, __le32 fattr)
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (err) {
-		err = -EINVAL;
+		if (err == -ENOENT)
+			err = -EINVAL;
 		goto err_out;
 	}
 
@@ -744,7 +777,10 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni, __le32 fattr)
 				CASE_SENSITIVE,
 				0, NULL, 0, ctx);
 		if (err) {
-			err = -EINVAL;
+			if (err == -ENOENT) {
+				err = -EFSCORRUPTED;
+				report_err = -EFSCORRUPTED;
+			}
 			goto err_out;
 		}
 		a = ctx->attr;
@@ -770,6 +806,8 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni, __le32 fattr)
 	mp_size = ntfs_get_size_for_mapping_pairs(ni->vol, ni->runlist.rl, 0, -1, -1);
 	if (unlikely(mp_size < 0)) {
 		err = mp_size;
+		if (err == -EFSCORRUPTED)
+			report_err = err;
 		ntfs_debug("Failed to get size for mapping pairs array, error code %i.\n", err);
 		goto err_out;
 	}
@@ -878,6 +916,8 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni, __le32 fattr)
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 	unmap_mft_record(ni);
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(ni), report_err);
 	return err;
 }
 
@@ -1036,12 +1076,17 @@ struct posix_acl *ntfs_get_acl(const struct mnt_idmap *idmap, struct dentry *den
 	mutex_unlock(&ni->mrec_lock);
 
 	/* Translate extended attribute to acl. */
-	if (err >= 0)
+	if (err >= 0) {
 		acl = posix_acl_from_xattr(&init_user_ns, buf, err);
-	else if (err == -ENODATA)
+		if (IS_ERR(acl) && PTR_ERR(acl) == -EINVAL) {
+			acl = ERR_PTR(-EFSCORRUPTED);
+			ntfs_report_file_metadata_error(inode, -EFSCORRUPTED);
+		}
+	} else if (err == -ENODATA) {
 		acl = NULL;
-	else
+	} else {
 		acl = ERR_PTR(err);
+	}
 
 	if (!IS_ERR(acl))
 		set_cached_acl(inode, type, acl);
@@ -1118,8 +1163,11 @@ static noinline int ntfs_set_acl_ex(const struct mnt_idmap *idmap,
 			if (err != old_len) {
 				kfree(old_value);
 				old_value = NULL;
-				if (err >= 0)
-					err = -EIO;
+				if (err >= 0) {
+					err = -EFSCORRUPTED;
+					ntfs_report_file_metadata_error(inode,
+									-EFSCORRUPTED);
+				}
 				goto out_unlock;
 			}
 		} else if (old_len != -ENODATA) {
@@ -1163,12 +1211,9 @@ static noinline int ntfs_set_acl_ex(const struct mnt_idmap *idmap,
 							XATTR_REPLACE, NULL);
 				}
 				if (undo_err) {
-					/*
-					 * Record a failed rollback so the next
-					 * persistence point marks the volume
-					 * dirty.  Run chkdsk.
-					 */
-					NVolSetErrors(NTFS_I(inode)->vol);
+					/* The ACL and WSL mode may now disagree. */
+					ntfs_report_file_metadata_error(inode,
+									undo_err);
 					ntfs_error(inode->i_sb,
 						   "Failed to undo the ACL xattr: %d",
 						   undo_err);

