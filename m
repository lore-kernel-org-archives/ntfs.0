Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485948;
	b=OgeeQVx4MMqxkHTtOMAPR+MEmMa9qCvds0nynoUXAepeezM9tNjw2H1N1HbQQ6afUy8A
	 yRH8Fmbi2Xvv3CV30/q4hiQc4R6dAdF1psNyPvnHJ9zbk6Cx3gTqbhMvkjb09a18e5GYg
	 LtMkbc1XikRS6qIW/g1ERFxUh2Wx/sHGQhyrU/Tb3PnHnpTHMrbdmdrLjIFgsFvklVhAl
	 /y7JVkeafdRfCNwX/ZTNNt04bgTIDousMuXCC7b9M1rodassH9pK0HROT3KZk88wgcCAw
	 cjajERo4FpPp1g+XONMZ1Sp2EuMWNoRhzaxGHHvEDdAlzMZGClM63viYAXT5RGeAQ/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485948;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=GvQYReHTyjPXgbqz4jfR3fGHNGAzctT5dPDRm+e17Bo=;
	b=pmafm0zmOiCLmP2A2qcVueunSFOhzic0vfGDwfpwhiHI+EmT/nenfjHLNKojuAMaWiPe
	 1YUR9BZZ4iw3U0b+YTL5yOpCRfNNYT1O/TEHH7VhBBGpqAOzeGP8eaCrWv+E5l2tvpvrS
	 mbTxQls91sOMRdU4KxhyN6IpQHrB1Kzu6CX1Jg5AFsvJQK71/tWMPccKsJPzk3pJRcfEF
	 7FGnvmATaxAS9SyXYO1vzDq9TrF5MrG+TQpEx2QGvXaAPlK9HC/wUtRcp+RHbhEIIGhhV
	 e5snadb/Dto07A4HJqsbqQMX+ZWF1X4O4Q2kMg60sAycfEM63oeSIqfpj5+UiBGe/lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KMNbQseI;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCEC606A322
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDCEC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KMNbQseI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Gv
	QYReHTyjPXgbqz4jfR3fGHNGAzctT5dPDRm+e17Bo=; b=KMNbQseIHelh/SrMv8
	Q6NniiP/zFDMUjJ5cqpaqlJZVEn6zYY95EUE6DqnHTjKgL2zyHAO5B15rA1BQFza
	yGYX9LCrXhu2vh04DDu1IB0lK5kfMShXEgs1W7SQoiOODrGSzxkV0XZH+8Ck2dwf
	XA/yI+OEYVORLvYannE8Mpj+I=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3n0ksKtdq7UkHBg--.56105S8;
	Tue, 20 Oct 2026 16:45:38 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 14/31] ntfs: report attribute list update and recovery failures
Date: Tue, 20 Oct 2026 16:44:04 +0800
Message-ID: <20261020084421.2196486-15-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3n0ksKtdq7UkHBg--.56105S8
X-Coremail-Antispam: 1Uf129KBjvJXoWxtF4xCw43Jr15ZFWxuw1Dtrb_yoW3Cr43pa
	sxCrsrt393tryxKrsay34DXa4YkryIgryUury7G3ZFv3Z0kw1IqrWxKay09rWfKrZ5Ja4q
	qr4qgrW7CF47XFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzMKAUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RIn8WrXKjJZyQAA3Y

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
index 6ed995b09a3f..564682f59203 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3231,7 +3231,7 @@ int ntfs_inode_attach_all_extents(struct ntfs_inode *ni)
  */
 int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 {
-	int err;
+	int err, rollback_err;
 	struct ntfs_attr_search_ctx *ctx;
 	u8 *al = NULL, *aln;
 	int al_len = 0;
@@ -3252,7 +3252,7 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 
 	ni_mrec = map_mft_record(ni);
 	if (IS_ERR(ni_mrec))
-		return -EIO;
+		return PTR_ERR(ni_mrec);
 
 	/* Form attribute list. */
 	ctx = ntfs_attr_get_search_ctx(ni, ni_mrec);
@@ -3267,7 +3267,9 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 		int ale_size;
 
 		if (ctx->attr->type == AT_ATTRIBUTE_LIST) {
-			err = -EIO;
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
 			ntfs_error(ni->vol->sb, "Attribute list already present");
 			goto put_err_out;
 		}
@@ -3355,15 +3357,19 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
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
@@ -3378,17 +3384,21 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
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
@@ -3401,8 +3411,13 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
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

