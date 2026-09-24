Received: from mta1.migadu.com (out-217.mta1.migadu.com [95.215.58.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9CD25B095
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 04:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223449; cv=none; b=VyP1ZO6D6wE34E8fTWRuKqJmCHwEQRmhnZd42fbCSEk667W6Q/iTRNLs4yYNgyC+A2E1DBV0h1hf9eiC/pW8+Wrkon39616Z4aLnPg82jJ2cZZbnUnBpcXkCRTrelEQ9qcwge5pmDwhWepmsKnXgXSabYQYP6fBm0Kh3Gqgw3UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223449; c=relaxed/simple;
	bh=nMPnE+cQpNJeJ+D+zqkXY1Fai7+zycPMt1Imwgwn4OU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JCZ0SPEWnNbLYfKOa0KQpmXpNjpMq7NCJ46UMCZU2lAYng5Bso3JN8VZuomsEv0fvsxRk4q16WzHaAHixA1y0INMnAE6L8Fe5s6l77GDagdnmt2SFbdf3flY5TMmUWWblM87XIkdFmI6TiyjIOSiqQjj3t0McsdnseRb9/TH3rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=woolweaver.bid; spf=pass smtp.mailfrom=woolweaver.bid; dkim=pass (2048-bit key) header.d=woolweaver.bid header.i=@woolweaver.bid header.b=ua3fCaiM; arc=none smtp.client-ip=95.215.58.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=woolweaver.bid
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=woolweaver.bid
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=woolweaver.bid header.i=@woolweaver.bid header.b="ua3fCaiM"
X-Envelope-To: ntfs@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=nMPnE+cQpNJeJ+D+zqkXY1Fai7+zycPMt1Imwgwn4OU=;
 c=simple/simple; d=woolweaver.bid;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790223444; v=1; x=1790828244;
 b=ua3fCaiMj9dmgxjMvakf8SQxP4X+GOGY3I8vRTBxrLMtREAkKpqK7ajeH8dXCV+0Y4Wg2nDP
 H9qtLZOnimXP3M9uDSK4EpQnUO+dcPtAkl03YkHxykTSfGQBj1LBUALBBjy7IJWHE9vd8PBvcVq
 oINOIA9HLdehMJgmIFIFt2TeTKRd5rjG88ZqhPFcXA0Dm2JwPMSkO09CV9IKsyuJLSIKNrHB5eG
 NDZrhM8vfkQO1axdkKzSm8oxAkUQT6INM50z04MEqjClgehHLXZUuvLPTvGHdi8XkcAhv29KT3b
 bBPsaHtTmei4ix0PlFy6f1/iTtjy5L+IQxTfU4LRoFepA==
X-Envelope-To: ntfs@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 9894b03afe6d6956;
	Thu, 24 Sep 2026 04:17:24 +0000
X-Mizu-Trace-ID: 9894b03afe6d6956
X-Migadu-Flow: FLOW_OUT
From: Michael Woolweaver <michael@woolweaver.bid>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Woolweaver <michael@woolweaver.bid>
Subject: [PATCH] ntfs: exclude DOS aliases from VFS link count
Date: Wed, 23 Sep 2026 23:17:20 -0500
Message-ID: <20260924041720.16477-1-michael@woolweaver.bid>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NTFS counts each $FILE_NAME attribute in the MFT record link_count.
A file with separate Win32 and DOS 8.3 names therefore has a link_count
of two even though the DOS name is an alias and does not represent a
separate VFS hard link.

ntfs_read_locked_inode() copies the MFT link_count directly to i_nlink,
causing stat() to report an extra hard link for files with a separate
DOS alias.

The same distinction is needed when unlinking. ntfs_delete() removes
both the DOS and Win32 $FILE_NAME attributes, decrementing the on-disk
link_count for each, but it must decrement the VFS link count only for
the Win32 name. Otherwise a real hard link can reach i_nlink zero while
another VFS-visible name still exists.

Count non-DOS $FILE_NAME attributes when initializing i_nlink, while
still verifying that the MFT link_count matches the total number of
name attributes. Do not drop i_nlink when ntfs_delete() removes a DOS
alias.

This was reproduced with a file containing separate Win32 and DOS
names. Its MFT link_count was 2 while stat() incorrectly reported 2
links. With the fix, stat() reports 1.

After adding a real POSIX hard link, the MFT contained three
$FILE_NAME attributes while the VFS correctly reported two links.
Removing the Win32/DOS pair left the POSIX hard link with both the MFT
link_count and VFS i_nlink equal to 1.

The fix was runtime-tested with fs/ntfs on a disposable NTFS image and
compile-tested on ntfs-next with W=1. checkpatch.pl reports no issues.

Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
Assisted-by: LLM
Signed-off-by: Michael Woolweaver <michael@woolweaver.bid>
---
 fs/ntfs/inode.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ntfs/namei.c |  5 +++-
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 9583b2c6c7a2..74a0d9d1e82b 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -621,6 +621,67 @@ static int ntfs_is_extended_system_file(struct ntfs_attr_search_ctx *ctx)
 	return 0;	/* NO, it is not an extended system file. */
 }
 
+/*
+ * ntfs_count_vfs_links - count VFS-visible hard links
+ * @ctx: initialized attribute search context
+ *
+ * The MFT link count counts all $FILE_NAME attributes.  A separate DOS 8.3
+ * name therefore contributes to the on-disk count even though it is an alias
+ * for its Win32 name and does not represent another VFS hard link.
+ *
+ * Return the number of VFS-visible links or -errno on error.
+ */
+static int ntfs_count_vfs_links(struct ntfs_attr_search_ctx *ctx)
+{
+	unsigned int expected, names = 0, links = 0;
+	int err;
+
+	expected = le16_to_cpu(ctx->mrec->link_count);
+	ntfs_attr_reinit_search_ctx(ctx);
+
+	while (!(err = ntfs_attr_lookup(AT_FILE_NAME, NULL, 0, 0, 0, NULL, 0,
+					ctx))) {
+		struct attr_record *attr = ctx->attr;
+		struct file_name_attr *fn;
+		u32 attr_len, value_len;
+		u16 value_off;
+
+		if (unlikely(attr->non_resident))
+			goto corrupt;
+
+		attr_len = le32_to_cpu(attr->length);
+		value_len = le32_to_cpu(attr->data.resident.value_length);
+		value_off = le16_to_cpu(attr->data.resident.value_offset);
+
+		if (unlikely(value_off > attr_len ||
+			     value_len > attr_len - value_off ||
+			     value_len < offsetof(struct file_name_attr, file_name)))
+			goto corrupt;
+
+		fn = (struct file_name_attr *)((u8 *)attr + value_off);
+		names++;
+		if (fn->file_name_type != FILE_NAME_DOS)
+			links++;
+	}
+
+	if (unlikely(err != -ENOENT))
+		return err;
+
+	if (unlikely(names != expected || !links)) {
+		ntfs_error(ctx->ntfs_ino->vol->sb,
+			   "Inode link count doesn't match file name attributes. You should run chkdsk.");
+		return -EIO;
+	}
+
+	ntfs_attr_reinit_search_ctx(ctx);
+	return links;
+
+corrupt:
+	ntfs_error(ctx->ntfs_ino->vol->sb,
+		   "Corrupt file name attribute. You should run chkdsk.");
+	return -EIO;
+}
+
 static struct lock_class_key ntfs_dir_inval_lock_key;
 
 void ntfs_set_vfs_operations(struct inode *inode, mode_t mode, dev_t dev)
@@ -872,6 +933,22 @@ static int ntfs_read_locked_inode(struct inode *vi)
 		}
 	}
 skip_attr_list_load:
+	/*
+	 * The MFT link count includes separate DOS 8.3 aliases.  Once the
+	 * attribute list is available, derive the VFS link count from the
+	 * $FILE_NAME namespaces instead.
+	 */
+	if (!(m->flags & MFT_RECORD_IS_DIRECTORY) && vi->i_ino != FILE_MFT) {
+		int nr_links;
+
+		nr_links = ntfs_count_vfs_links(ctx);
+		if (unlikely(nr_links < 0)) {
+			err = nr_links;
+			goto unm_err_out;
+		}
+		set_nlink(vi, nr_links);
+	}
+
 	err = ntfs_attr_lookup(AT_EA_INFORMATION, NULL, 0, 0, 0, NULL, 0, ctx);
 	if (!err) {
 		NInoSetHasEA(ni);
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 75e201096525..891ee697c0d2 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -829,6 +829,7 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 	struct file_name_attr *fn = NULL;
 	bool looking_for_dos_name = false, looking_for_win32_name = false;
 	bool case_sensitive_match = true;
+	bool is_dos_name;
 	int err = 0;
 	struct mft_record *ni_mrec;
 	struct super_block *sb;
@@ -932,6 +933,8 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 	if (err)
 		goto err_out;
 
+	is_dos_name = fn->file_name_type == FILE_NAME_DOS;
+
 	err = ntfs_index_remove(dir_ni, fn, le32_to_cpu(actx->attr->data.resident.value_length));
 	if (err)
 		goto err_out;
@@ -942,7 +945,7 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 
 	ni_mrec = actx->base_mrec ? actx->base_mrec : actx->mrec;
 	ni_mrec->link_count = cpu_to_le16(le16_to_cpu(ni_mrec->link_count) - 1);
-	if (!S_ISDIR(VFS_I(ni)->i_mode))
+	if (!S_ISDIR(VFS_I(ni)->i_mode) && !is_dos_name)
 		drop_nlink(VFS_I(ni));
 
 	mark_mft_record_dirty(ni);

base-commit: 401898d748fcc8e19ceea1a37ed0de9075fe9ff2
-- 
2.55.0

