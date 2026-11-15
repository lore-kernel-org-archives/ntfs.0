Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749195;
	b=Wq33jxEUYvQnVUfW9zCZ/sZ+Jk/V4ffGayH6QM8Fi+tEbFv/x+DfJgUa5rlRnnJ2Hjk4
	 7B/S/xwjhzNMRGz6KN+wU3vr2LO8ZiOEFppjc41SULC13G820zylDkd/Q3hiv4mMnVX3f
	 X6uZF4+V1U0Cx037Wl6WgqhFto5HAzCEcjYwP4vLsJs09BOy6/FTmQPj/7F13TxkO0Br/
	 sHhFNyyIUXol5ske8cbioEW2jOwrPS7rVD/yRMNGAPR+k0wcbiiD6edpN8LsXF4V74Wr2
	 aN/IAiyZmpphk3a46pyJt2p0iC5P/bJVvctzmimCuwvt9OuIN9nT9uhdYzzqg4m2ocQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749195;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=cr+vimpw5jt0758YqtYxZsFHqQP3QlFB5SQYksHXPPA=;
	b=qF2NCooxLfB5Ab+9S047+bePodVuKVQGXlol2DWEK8/EZmmoRLGEqyh4JGXF9+S62JEA
	 4i3F1rrK8RI5Qs9FM8lWJ4BkvjDU207yaWvZGGOxRe4PuYmJmdpQhhHo/dzbNztIjR00h
	 9Gjy62/gCyP4U3JfhCN/mtJxnV78nuXMb2XWTZCBtDppW9E/vCgEqpdJMspHe4MF6+XlS
	 gkcZgPwW25CtkPYFdBeqIsP3xKVc4g/MQAaYGhG+vy6UQyR7H0UCYl52fBDsOhRez7QUY
	 3CNuDQzZfj8J8EEqmqmh2NCgx0p+GN3gCY9nFkUJ0WgoWRCm6iCxSyphcPIGTA5EZrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=m3v7hcnt;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ADB606A31E
	for <ntfs@lists.linux.dev>; Sun, 15 Nov 2026 13:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22ADB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=m3v7hcnt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=cr
	+vimpw5jt0758YqtYxZsFHqQP3QlFB5SQYksHXPPA=; b=m3v7hcntc3Dt9YPTbh
	JFOpRV7nEXxGiNhbruiT7wd3I5xVEEQB5R/g/iU1GGzHEVf18rBVwKEgqyayTBgU
	ZwSiZc2VOizKiA50w/UsGQtlHO76dAHRwMsUY6aoAI/IoWQ8TzxydM0Gx9xapwnV
	5mzKPW3EuB/wGvjDw2SUvUXaE=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD33yHzsvlqXCkHHw--.36757S7;
	Sun, 15 Nov 2026 21:26:16 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 05/12] ntfs: initialize inherited ACLs after allocating the MFT record
Date: Sun, 15 Nov 2026 21:26:02 +0800
Message-ID: <20261115132609.209957-6-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261115132609.209957-1-liubaolin12138@163.com>
References: <20261115132609.209957-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD33yHzsvlqXCkHHw--.36757S7
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gr1xXF1UZF47XFy7XrWDJwb_yoW7CF1rpF
	s3urW7J39rXrySgFs3Kr4Y9r13K397ur4UGr47J3WSy3WFgw1a9a48KFy0kFn3trZ5G3sF
	qF4UKw47ArZ8u37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2FALUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RgEzmr5svhthQAA3K

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_init_acl() can write EAs before __ntfs_create() allocates an MFT
record, so inherited ACLs can disappear after inode eviction.

Initialize ACLs after MFT allocation and standard attribute setup,
releasing the record locks around the ACL helpers. Refresh the mode and
use the post-ACL ctime for FILE_NAME and its index entry. Roll back EA
and EA_INFORMATION on failure.

Skip writeback while I_CREATING is set: failed creation clears I_NEW but
retains I_CREATING after freeing the MFT record.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
Changes since v3: add the I_CREATING guard and Fixes tag, and apply
after the cleanup fixes. Drop Reviewed-by because the code changed.

Tested cold-cache ACL inheritance and creation rollback. Forced writeback
after I_NEW was cleared in failed named and anonymous creation; no access
to the freed MFT record occurred, and subsequent creation passed remount.

 fs/ntfs/inode.c |  4 ++++
 fs/ntfs/namei.c | 49 +++++++++++++++++++++++++++++++++++--------------
 2 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 6a9f488e2775..885818f00b78 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2955,6 +2955,10 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 		return 0;
 	}
 
+	/* Failed creations retain I_CREATING after discard_new_inode(). */
+	if (inode_state_read_once(vi) & I_CREATING)
+		return 0;
+
 	/* igrab prevents vi from being evicted while mrec_lock is hold. */
 	if (igrab(vi) != NULL)
 		need_iput = true;
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index abb3675757e9..05e2747bae54 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -422,6 +422,7 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	struct ntfs_volume *vol = dir_ni->vol;
 	struct ntfs_inode *ni;
 	bool rollback_data = false, rollback_sd = false, rollback_reparse = false;
+	bool rollback_ea = false;
 	struct file_name_attr *fn = NULL;
 	struct standard_information *si = NULL;
 	int err = 0, fn_len, si_len;
@@ -429,6 +430,7 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	struct mft_record *ni_mrec, *dni_mrec;
 	struct super_block *sb = dir_ni->vol->sb;
 	struct inode *rollback_data_vi = NULL, *rollback_sd_vi = NULL;
+	struct inode *rollback_ea_vi = NULL, *rollback_eai_vi = NULL;
 	struct inode *rollback_rp_vi = NULL, *rollback_al_vi = NULL;
 	__le64 parent_mft_ref;
 	u64 child_mft_ref;
@@ -470,19 +472,6 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 
 	mode = vi->i_mode;
 
-#ifdef CONFIG_NTFS_FS_POSIX_ACL
-	if (!S_ISLNK(mode) && (sb->s_flags & SB_POSIXACL)) {
-		err = ntfs_init_acl(idmap, vi, dir);
-		if (err) {
-			iput(vi);
-			return ERR_PTR(err);
-		}
-	} else
-#endif
-	{
-		vi->i_flags |= S_NOSEC;
-	}
-
 	if (uid_valid(vol->uid))
 		vi->i_uid = vol->uid;
 
@@ -647,6 +636,24 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 			goto err_out;
 	}
 
+	/* ACL EAs need the allocated MFT record and initialized attributes. */
+	rollback_ea = true;
+#ifdef CONFIG_NTFS_FS_POSIX_ACL
+	if (!S_ISLNK(mode) && (sb->s_flags & SB_POSIXACL)) {
+		/* The ACL helpers acquire both the parent's and child's locks. */
+		mutex_unlock(&dir_ni->mrec_lock);
+		mutex_unlock(&ni->mrec_lock);
+		err = ntfs_init_acl(idmap, vi, dir);
+		mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
+		mutex_lock_nested(&dir_ni->mrec_lock, NTFS_INODE_MUTEX_PARENT);
+		if (err)
+			goto err_out;
+		mode = vi->i_mode;
+	}
+#endif
+	if (S_ISLNK(mode) || !(sb->s_flags & SB_POSIXACL))
+		vi->i_flags |= S_NOSEC;
+
 	err = ntfs_ea_set_wsl_inode(vi, dev, &ea_size,
 			NTFS_EA_UID | NTFS_EA_GID | NTFS_EA_MODE);
 	if (err)
@@ -680,7 +687,8 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	if (NVolHideDotFiles(vol) && name_len > 0 && name[0] == cpu_to_le16('.'))
 		fn->file_attributes |= FILE_ATTR_HIDDEN;
 	fn->creation_time = fn->last_data_change_time = utc2ntfs(ni->i_crtime);
-	fn->last_mft_change_time = fn->last_access_time = fn->creation_time;
+	fn->last_mft_change_time = utc2ntfs(inode_get_ctime(vi));
+	fn->last_access_time = fn->creation_time;
 	memcpy(fn->file_name, name, name_len * sizeof(__le16));
 
 	/* Add FILE_NAME attribute to inode. */
@@ -721,6 +729,15 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	return ni;
 
 err_out:
+	if (rollback_ea) {
+		if (ntfs_attr_exist(ni, AT_EA, AT_UNNAMED, 0) &&
+		    ntfs_attr_remove(ni, AT_EA, AT_UNNAMED, 0, &rollback_ea_vi))
+			ntfs_error(sb, "Failed to roll back EA attribute.");
+		if (ntfs_attr_exist(ni, AT_EA_INFORMATION, AT_UNNAMED, 0) &&
+		    ntfs_attr_remove(ni, AT_EA_INFORMATION, AT_UNNAMED, 0,
+				     &rollback_eai_vi))
+			ntfs_error(sb, "Failed to roll back EA_INFORMATION attribute.");
+	}
 	if (rollback_sd) {
 		int rollback_err;
 
@@ -776,6 +793,10 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	mutex_unlock(&dir_ni->mrec_lock);
 	mutex_unlock(&ni->mrec_lock);
 
+	if (rollback_ea_vi)
+		iput(rollback_ea_vi);
+	if (rollback_eai_vi)
+		iput(rollback_eai_vi);
 	if (rollback_al_vi)
 		iput(rollback_al_vi);
 	if (rollback_rp_vi)

