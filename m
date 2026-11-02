Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605013;
	b=x6jCJcCNLjx8ac4npzcgjhhQpw2cgqG6JM+BaKzUVZPhEZ3sMDQO+3HdyqM6tH0Q/yPY
	 zStMVTat+hrWKsHzZYG21KnuvcGmBp6xTRcklqOlKv2SZFyh93wZUJlZO6O4xCVwYYf/S
	 HOOxgpiR/wTxb1d/KlVpeMOYwdMVmHfhyJU/5+L7KUfzfQIRFbfCgvq0jfR9KRBb896eB
	 Soro9QLTpaZ59QojGT0gBQ4fWu+rpJHakcjkAe82/TTTrnqabsdJf81+4TiV4cPKMm1UE
	 HBJK0pTZbm/gS06LWlY4jNnAHJKSsjsD3cTJNXXYnjCG0E6IJYdcGxdn/GhJERoDIOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605013;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=EQO88btgx49MOzqpRzIf6A12eC+7Euowl2SJ1Z4a7YY=;
	b=2TP8dh7S7LEW2aGWIokKLP92t6c+ltVYwFsUhF3Mnv7ISxH908v6tWUm2nFYVO/osvJk
	 KYIyj8A/jABWmwk6aC+WfaJ+k4/r7VF7AnYzCbRfuOVWrMOTE9qce32ZzvoA15vyt0VLO
	 gP1cO6iUgrieAb5NovqxieqUSpaLkbUA10LyN5k2qBZOAzDg8P6Q3GdHG8jsL7Unm0pfs
	 sh/nrRVoVDNfW4kwBQ7Xpr3wsc69xKP4p7w4QwS2STLs+0oDUYfZKAL1nLQy0Ryicnet1
	 quUJM4Dozue2hrjl78bHYfLqEwzLp8VnnMgNGRxwwsEeTtXf+4iZxQ3+VSm/XkPj3Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=N4Tu62Ej;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1A0606A324
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C1A0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=N4Tu62Ej
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=EQ
	O88btgx49MOzqpRzIf6A12eC+7Euowl2SJ1Z4a7YY=; b=N4Tu62Ej+SYbrFxJ5r
	jJUGY+y2FOS+Hjn+roWOkV2ePo3xF/klxbZt/Buu1XpPkOhFEZP95f5rQUtIaFPQ
	dRLZTr+fHTz2zWnCPFSK+gaspLRjoB9A6IFERAlGIWPQxtkF1weNsskBRaGEwQhA
	1Hy0hmHjC+21pViZskI75y6V8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3vy+HPehqF0lcEw--.2040S8;
	Mon, 02 Nov 2026 15:36:43 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v5 14/31] ntfs: report attribute list update and recovery failures
Date: Mon,  2 Nov 2026 15:35:15 +0800
Message-Id: <20261102073532.98873-15-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3vy+HPehqF0lcEw--.2040S8
X-Coremail-Antispam: 1Uf129KBjvJXoWxtF4xCw43Jr15ZFWxuw1Dtrb_yoW3Cr1Dpa
	sxCrsrtws3tryxKrsay3srXa4YkryIgryUury7G3ZFv3Z8Kw1IqrWxKay09rWfKrZ5Ja4q
	qr4qgrW7CF47XFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UH5l8UUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC7wtGL2roPYtRGgAA3y

From: Baolin Liu <liubaolin@kylinos.cn>

Attribute-list building, repacking and updating can leave inconsistent
metadata without reporting it. Report missing required list attributes,
invalid list state, failed mapping restoration and cluster cleanup.

Preserve the original update error and report independent recovery
failures against the base file. Use EFSCORRUPTED for confirmed corruption
while retaining allocation failures as such.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
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
index c0f91b02efa0..b851b848bc2e 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3222,7 +3222,7 @@ int ntfs_inode_attach_all_extents(struct ntfs_inode *ni)
  */
 int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 {
-	int err;
+	int err, rollback_err;
 	struct ntfs_attr_search_ctx *ctx;
 	u8 *al = NULL, *aln;
 	int al_len = 0;
@@ -3243,7 +3243,7 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 
 	ni_mrec = map_mft_record(ni);
 	if (IS_ERR(ni_mrec))
-		return -EIO;
+		return PTR_ERR(ni_mrec);
 
 	/* Form attribute list. */
 	ctx = ntfs_attr_get_search_ctx(ni, ni_mrec);
@@ -3258,7 +3258,9 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 		int ale_size;
 
 		if (ctx->attr->type == AT_ATTRIBUTE_LIST) {
-			err = -EIO;
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
 			ntfs_error(ni->vol->sb, "Attribute list already present");
 			goto put_err_out;
 		}
@@ -3346,15 +3348,19 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
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
@@ -3369,17 +3375,21 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
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
@@ -3392,8 +3402,13 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
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

