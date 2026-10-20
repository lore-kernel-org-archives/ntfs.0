Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486099;
	b=vrvFnqhOYPfhpdkKqZHeAUxmeGoxDUGkeI1Xxt6xVpRITCf9ocNjNJzAnoRRQqxGH+RF
	 n4wMT3eMPoGiIN5zzV32taSVzRZwzJhgFDTzagyEfiWwJgmmWUl0fW0MTRfAupqXVTFJc
	 XckjiYvfugOss8oNGw4Dv2VcDkHSKMS3J/rQt3x0/+m+K8hiOVSMiDFumR4quUDEM1Vpn
	 jxAaSBz3WUzIkTuZhFsxnLMiDZJnnKB0t8FQY8z/hRiCOBiZjFE7QLXnQlwO/EFnUDSEV
	 RuGRHBKQVXuRemRlXi+jlzBTcD1HNQlRwM8RXMt7TuEWfFLMxAXKM2h768H1rD66DeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486099;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=SuRGT8qs6NxW/ULUzYvBSCgnQOs1/96cbqNg/RCn3LU=;
	b=qro7zcHvD5iXCb1sKXjtfNGuoDNrEAdLqcdiSGsTkhymPPj4n3p88XnKMfG7jVPYrw4Q
	 NIzyOee2Ef6kd5m1uRG+8g/B9F23phwyydo+BICe4GgOTho1CylHsN4Ci/Y1R8QwUXImV
	 0pGxoV/H0CePpzgA17G7+EHQVt2RIOlZCcrafDa9Oq0ZUfAFABMcGk2d7K55f/lSqA+xB
	 vRkyecN4p9kl6aeAfIGQSudPYFih3SrEsPOlqhAqsnvI3j67ZZRIN2dtoqWYLp4DfLlOh
	 sjkl9Kx+FECFf1YuUVzsKhXzbk2qwoTmOan150AC78XYJMOzsJLmo59KloDgHyzjG/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nCTPZuwL;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE33660A261C
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE33660A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nCTPZuwL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Su
	RGT8qs6NxW/ULUzYvBSCgnQOs1/96cbqNg/RCn3LU=; b=nCTPZuwL9wML9zz/Me
	aoSmoCxyuyT37Rp1Zp+LExA0LAyGfgZxOnKb+J+JOMHLYF6wcujFZqeThXXzNKso
	7m/CMGeEbKNA7EDGNVTsR0KA3tBsyNhhQVxYXxAyd3k2QQ3zMTgwVvIOakKxS/yc
	m1HRYw2Fm6u+96nkamoQqhtvA=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3t62yKtdqN_ayBQ--.9980S6;
	Tue, 20 Oct 2026 16:47:51 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 28/31] ntfs: report EA metadata and restoration errors
Date: Tue, 20 Oct 2026 16:44:18 +0800
Message-ID: <20261020084421.2196486-29-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261020084421.2196486-1-liubaolin12138@163.com>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3t62yKtdqN_ayBQ--.9980S6
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jw43Jw15KFWDJFW7Xw1rCrg_yoWxAr4UpF
	ZxG3s5t3Z5tr9rWrn3twnxZ3WY9FyIg3yjk347K3Z293Z8Kw1ktFWYkFWF9FZ29rZ5Gw4Y
	qa1DG398Ca1UZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UNAwsUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RdIE2rXKrd2oQAA3S

From: Xuewen Wang <wangxuewen@kylinos.cn>

Report malformed EA chains, orphaned attributes and invalid Linux flag
sizes. Convert EINVAL from stored ACL decoding and inconsistent saved-ACL
read lengths to EFSCORRUPTED. Keep missing values, unsupported ACL versions
and allocation failures distinct from corruption.

Report EA and EA_INFORMATION restoration failures separately, and failed
ACL restoration after a WSL mode update. Even ENOMEM here can leave
metadata inconsistent. Preserve the initiating error and existing
shutdown decisions.

Preserve EFSCORRUPTED for missing $AttrDef definitions instead of masking
it as EFBIG. Keep non-ENOENT file-flag lookup errors. Report mapping-pairs
sizing errors only for EFSCORRUPTED; an unmapped cache returning EINVAL
does not prove corruption.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 fs/ntfs/ea.c | 72 +++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 21 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 1198f3059c5d..ee4d7d082b2c 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -129,6 +129,7 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
 		return PTR_ERR(p_ea_info);
 	if (ea_info_size != sizeof(struct ea_information)) {
 		kvfree(p_ea_info);
+		ntfs_report_file_metadata_error(inode, -EUCLEAN);
 		return -EUCLEAN;
 	}
 
@@ -168,6 +169,8 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
 	if (err == -ENOENT)
 		err = -ENODATA;
 free_ea_buf:
+	if (err == -EUCLEAN)
+		ntfs_report_file_metadata_error(inode, err);
 	kvfree(ea_buf);
 	return err;
 }
@@ -253,8 +256,10 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 	if (err && err != -ENOENT)
 		return err;
 	/* Do not silently discard an orphaned attribute. */
-	if (exists != !err)
+	if (exists != !err) {
+		ntfs_report_file_metadata_error(inode, -EUCLEAN);
 		return -EUCLEAN;
+	}
 
 	if (exists) {
 		old_info = ntfs_attr_readall(ni, AT_EA_INFORMATION, NULL, 0,
@@ -307,9 +312,13 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 
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
@@ -366,7 +375,10 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
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
@@ -385,6 +397,8 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 	else
 		NInoClearHasEA(ni);
 out:
+	if (err == -EUCLEAN)
+		ntfs_report_file_metadata_error(inode, err);
 	kvfree(ea);
 	kvfree(old_ea);
 	kvfree(old_info);
@@ -492,10 +506,12 @@ int ntfs_ea_get_linuxflags(struct inode *inode)
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
@@ -605,6 +621,8 @@ ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	} while (next > 0 && offset < ea_info_qsize);
 
 out:
+	if (err == -EUCLEAN)
+		ntfs_report_file_metadata_error(inode, err);
 	mutex_unlock(&NTFS_I(inode)->mrec_lock);
 	kvfree(ea_info);
 	kvfree(ea_buf);
@@ -694,7 +712,8 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni, __le32 fattr)
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (err) {
-		err = -EINVAL;
+		if (err == -ENOENT)
+			err = -EINVAL;
 		goto err_out;
 	}
 
@@ -744,7 +763,11 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni, __le32 fattr)
 				CASE_SENSITIVE,
 				0, NULL, 0, ctx);
 		if (err) {
-			err = -EINVAL;
+			if (err == -ENOENT) {
+				err = -EFSCORRUPTED;
+				ntfs_report_file_metadata_error(VFS_I(ni),
+								-EFSCORRUPTED);
+			}
 			goto err_out;
 		}
 		a = ctx->attr;
@@ -770,6 +793,8 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni, __le32 fattr)
 	mp_size = ntfs_get_size_for_mapping_pairs(ni->vol, ni->runlist.rl, 0, -1, -1);
 	if (unlikely(mp_size < 0)) {
 		err = mp_size;
+		if (err == -EFSCORRUPTED)
+			ntfs_report_file_metadata_error(VFS_I(ni), err);
 		ntfs_debug("Failed to get size for mapping pairs array, error code %i.\n", err);
 		goto err_out;
 	}
@@ -1036,12 +1061,17 @@ struct posix_acl *ntfs_get_acl(struct mnt_idmap *idmap, struct dentry *dentry,
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
@@ -1118,8 +1148,11 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
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
@@ -1163,12 +1196,9 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
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
-- 
2.51.0

