Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992988;
	b=i2BR4Sk2cMadK3RsNMgjHLU+X9Ocp4ykYTmB6cgqRDeBvhNdcBA6y3WMfxeKpV78Ti3H
	 8jaYUxHXaixLVaA2ZVLq+mmCgqTqBnMk/dIKe3mE0YjUJ4YFEf0C6nqE04pfQdl9Yy0kx
	 Ox9FSc+5WGZpxHJyNOjbVq0fKBFFNtE4LZyq/JszlVlZHfwt/kI2iPYxpCaALIF+ri0OO
	 H+2l7BD+ZfG8+Bi1s80SJ32AaAVYIS9Rk3OZMkhSkUFCLBDR9Cuamp7l8hZwk8HcNZdTi
	 O515pM2Vz7zEvW6SjXJ/ek8etloDOkJ1wuzVz5NlA3+97Bxk8oYZ/KemrzPr/9lq5sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992988;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=RSUtr/sujT3bdB0ENKCL3cpRcD5dDBk8rsL4GZBxPfo=;
	b=g+PAzKqy94aG9O0urElRujRs1CXqmdAHcQowhOxayN7aRQ6dlHFyR3xLkMCqZMq7qwCB
	 Eaw2DhzT1vnduHv6DL8Mw4V0kfCItDLbWSzusiMOVzw1aZNZtNCRgg7PGce0eQBVs/Kjx
	 qniRv5AEzNDFToIHqoWLvRlo/JxYHJwNZwqYwxJUn9JM5s5izoB4ICs4ujP24WptL89WQ
	 r/C0k0pp/NL/liaTKaFUQzjNYXxJ+khiNqbflWiNITyOX9xjUtk+FKlWhn1rrCljk1UdO
	 pRkPz355l5MWS5yu3KTKOyHn/0I3l6q/yG8jakaQKkclaiOwA8YH5wI+qurch1gvrUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WsvmLoud;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ACC606A334
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13ACC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WsvmLoud
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=RS
	Utr/sujT3bdB0ENKCL3cpRcD5dDBk8rsL4GZBxPfo=; b=WsvmLoudk6tW103Kk4
	x3YTiO6nkn2OW0uaaGJNYtch0D1tmQNevnd2f03F6vY/nNjm6bdMTZN5QY7hrBs8
	vigTZo/siy1/tVn77FrO6EhiwkR3ECSZ8JqqcAFG4LwiFWbZcgqZqcqE7F1YwAnO
	Ki5zcVn/jLHIpBDZZ5HJ0rZDw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3xC1Pa_1qPhPuGg--.62323S5;
	Wed, 18 Nov 2026 17:09:37 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 19/37] ntfs: report attribute list update and recovery failures
Date: Wed, 18 Nov 2026 17:06:43 +0800
Message-Id: <20261118090701.1858849-20-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118090701.1858849-1-wangxuewen_ky@163.com>
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:PigvCgC3xC1Pa_1qPhPuGg--.62323S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxtF4xZFWxKw18Jr45tw45GFg_yoW3ZF47pa
	sxArsrt393tryxKFsay3srXa4YkryIgryUury7G3ZFv3Z8Kw1IqrWxKay09rWfKrZ5Xas0
	qr4qgrW7CF47XFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYD73UUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC8BEJ8Wr9a1GVvgAA3f

From: Baolin Liu <liubaolin@kylinos.cn>

Attribute-list building, repacking and updating can leave inconsistent
metadata without reporting it. Report missing required list attributes,
invalid list state, failed mapping restoration and cluster cleanup.

Preserve the original update error and report independent recovery
failures against the base file. Use EFSCORRUPTED for confirmed corruption
while retaining allocation failures as such.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
Changes in v6:
Rebase onto the updated ntfs-next; retain the v5 reporting behavior.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.

 fs/ntfs/attrlist.c | 38 ++++++++++++++++++++++++++++----------
 fs/ntfs/inode.c    | 43 +++++++++++++++++++++++++++++--------------
 2 files changed, 57 insertions(+), 24 deletions(-)

diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
index 7e7440c5f2ba..de642af3bc30 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -39,8 +39,9 @@ int ntfs_attrlist_need(struct ntfs_inode *ni)
 	}
 
 	if (!ni->attr_list) {
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
 		ntfs_debug("Corrupt in-memory struct.\n");
-		return -EINVAL;
+		return -EFSCORRUPTED;
 	}
 
 	ale = (struct attr_list_entry *)ni->attr_list;
@@ -76,7 +77,7 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 	s64 old_alloc_size;
 	size_t old_rl_count, new_rl_count;
 	unsigned long flags;
-	int err, restore_err;
+	int err, free_err, restore_err;
 	if (attr_ni->mft_no != FILE_MFT || !NInoNonResident(attr_ni) ||
 		min_alloc_size < 0)
 		return -EINVAL;
@@ -89,8 +90,10 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 		return err;
 
 	data_size = attr_ni->data_size;
-	if (data_size < 0)
-		return -EIO;
+	if (data_size < 0) {
+		ntfs_report_file_metadata_error(attr_vi, -EFSCORRUPTED);
+		return -EFSCORRUPTED;
+	}
 
 	if (data_size) {
 		data = kvmalloc(data_size, GFP_NOFS);
@@ -99,7 +102,11 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 
 		written = ntfs_inode_attr_pread(attr_vi, 0, data_size, data);
 		if (written != data_size) {
-			err = written < 0 ? (int)written : -EIO;
+			err = written < 0 ? (int)written : -EFSCORRUPTED;
+			if (written >= 0 || written == -EIO)
+				ntfs_report_file_metadata_error(attr_vi,
+								written < 0 ?
+								(int)written : -EFSCORRUPTED);
 			goto out_free_data;
 		}
 	}
@@ -127,7 +134,9 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 		new_rl_count = 2;
 
 	if (new_rl_count != 2) {
-		ntfs_cluster_free_from_rl(vol, new_rl);
+		free_err = ntfs_cluster_free_from_rl(vol, new_rl);
+		if (free_err)
+			ntfs_report_file_metadata_error(attr_vi, free_err);
 		kvfree(new_rl);
 		err = -ENOSPC;
 		goto out_free_data;
@@ -157,11 +166,12 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 		goto restore_old_runlist;
 
 	/* The new mapping is now authoritative; release the old data runs. */
-	if (ntfs_cluster_free_from_rl(vol, old_rl)) {
+	free_err = ntfs_cluster_free_from_rl(vol, old_rl);
+	if (free_err) {
 		ntfs_error(vol->sb,
 			   "Failed to free old ATTRIBUTE_LIST extent: inode %#llx",
 			   (long long)attr_ni->mft_no);
-		NVolSetErrors(vol);
+		ntfs_report_file_metadata_error(attr_vi, free_err);
 	}
 	kvfree(old_rl);
 	kvfree(data);
@@ -186,10 +196,12 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 	if (restore_err) {
 		ntfs_error(vol->sb, "Failed to restore ATTRIBUTE_LIST mapping pairs (%d)",
 			   restore_err);
-		NVolSetErrors(vol);
+		ntfs_report_file_metadata_error(attr_vi, restore_err);
 	}
 
-	ntfs_cluster_free_from_rl(vol, new_rl);
+	free_err = ntfs_cluster_free_from_rl(vol, new_rl);
+	if (free_err)
+		ntfs_report_file_metadata_error(attr_vi, free_err);
 	kvfree(new_rl);
 	err = err ? err : restore_err;
 
@@ -218,6 +230,11 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
 	attr_vi = ntfs_attr_iget(VFS_I(base_ni), AT_ATTRIBUTE_LIST, AT_UNNAMED, 0);
 	if (IS_ERR(attr_vi)) {
 		err = PTR_ERR(attr_vi);
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+		}
 		return err;
 	}
 	attr_ni = NTFS_I(attr_vi);
@@ -293,6 +310,7 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
 					 base_ni->attr_list, false);
 	if (written != base_ni->attr_list_size) {
 		err = written < 0 ? (int)written : -EIO;
+		ntfs_report_file_metadata_error(attr_vi, err);
 		iput(attr_vi);
 		ntfs_error(base_ni->vol->sb,
 			   "Failed to write attribute list of inode %#llx",
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 21b9202fb0b3..2e9c11580633 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3256,7 +3256,7 @@ int ntfs_inode_attach_all_extents(struct ntfs_inode *ni)
  */
 int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 {
-	int err;
+	int err, rollback_err;
 	struct ntfs_attr_search_ctx *ctx;
 	u8 *al = NULL, *aln;
 	int al_len = 0;
@@ -3277,7 +3277,7 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 
 	ni_mrec = map_mft_record(ni);
 	if (IS_ERR(ni_mrec))
-		return -EIO;
+		return PTR_ERR(ni_mrec);
 
 	/* Form attribute list. */
 	ctx = ntfs_attr_get_search_ctx(ni, ni_mrec);
@@ -3292,7 +3292,9 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 		int ale_size;
 
 		if (ctx->attr->type == AT_ATTRIBUTE_LIST) {
-			err = -EIO;
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
 			ntfs_error(ni->vol->sb, "Attribute list already present");
 			goto put_err_out;
 		}
@@ -3380,15 +3382,19 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 	NInoClearAttrList(ni);
 	/* Remove $ATTRIBUTE_LIST record. */
 	ntfs_attr_reinit_search_ctx(ctx);
-	if (!ntfs_attr_lookup(AT_ATTRIBUTE_LIST, NULL, 0,
-				CASE_SENSITIVE, 0, NULL, 0, ctx)) {
-		if (ntfs_attr_record_rm(ctx))
+	rollback_err = ntfs_attr_lookup(AT_ATTRIBUTE_LIST, NULL, 0,
+					CASE_SENSITIVE, 0, NULL, 0, ctx);
+	if (!rollback_err) {
+		rollback_err = ntfs_attr_record_rm(ctx);
+		if (rollback_err)
 			ntfs_error(ni->vol->sb, "Rollback failed to remove attrlist");
 		else
 			free_empty_extents = true;
 	} else {
 		ntfs_error(ni->vol->sb, "Rollback failed to find attrlist");
 	}
+	if (rollback_err)
+		ntfs_report_file_metadata_error(VFS_I(ni), rollback_err);
 
 	/* Setup back in-memory runlist. */
 	ni->attr_list = al;
@@ -3403,17 +3409,21 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 	ale = (struct attr_list_entry *)al;
 	while ((u8 *)ale < al + al_len) {
 		if (MREF_LE(ale->mft_reference) != ni->mft_no) {
-			if (!ntfs_attr_lookup(ale->type, ale->name,
-						ale->name_length,
-						CASE_SENSITIVE,
-						le64_to_cpu(ale->lowest_vcn),
-						NULL, 0, ctx)) {
-				if (ntfs_attr_record_move_to(ctx, ni))
+			rollback_err = ntfs_attr_lookup(ale->type, ale->name,
+							ale->name_length,
+							CASE_SENSITIVE,
+							le64_to_cpu(ale->lowest_vcn),
+							NULL, 0, ctx);
+			if (!rollback_err) {
+				rollback_err = ntfs_attr_record_move_to(ctx, ni);
+				if (rollback_err)
 					ntfs_error(ni->vol->sb,
 							"Rollback failed to move attribute");
 			} else {
 				ntfs_error(ni->vol->sb, "Rollback failed to find attr");
 			}
+			if (rollback_err)
+				ntfs_report_file_metadata_error(VFS_I(ni), rollback_err);
 			ntfs_attr_reinit_search_ctx(ctx);
 		}
 		ale = (struct attr_list_entry *)((u8 *)ale + le16_to_cpu(ale->length));
@@ -3426,8 +3436,13 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 	NInoClearAttrListDirty(ni);
 	ntfs_attr_put_search_ctx(ctx);
 	ctx = NULL;
-	if (free_empty_extents && ntfs_inode_free_empty_extents(ni))
-		ntfs_error(ni->vol->sb, "Rollback failed to free empty extent");
+	if (free_empty_extents) {
+		rollback_err = ntfs_inode_free_empty_extents(ni);
+		if (rollback_err) {
+			ntfs_report_file_metadata_error(VFS_I(ni), rollback_err);
+			ntfs_error(ni->vol->sb, "Rollback failed to free empty extent");
+		}
+	}
 	goto err_out;
 put_err_out:
 	ntfs_attr_put_search_ctx(ctx);
-- 
2.51.0

