Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424595;
	b=DlPRuJjKfSgg4t/1xbqzVWpfPHiD8oBV89QL3RRCc766eBKpIbYJ6bOqUeB4sWuRkRh2
	 Ot+BSJnFw40oPnutREhperiEvrmYl9zuTcjHMw6ZMsuH3Yp9X2Oa5o4OvPUQITwlbWcS7
	 0FlQC8nCkNiK2M2cmvzabQZk6eIx8N0f4xETPhLHc1JuzpInCGmtoPRaiA6j5/BBJi5C2
	 MfPJANyxlS/tDCYPZkruT9Y+retH8bcC0Xldri4FN5AIr5voTn7JlnS7+y78cwAUrnqLe
	 9fQdcJ+10qaUmu7eD9bhMOovWothq4Ud/FNCOBNzPwEQLOg6DmJQAr4OCBnT48EV/QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424595;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=nL/9OEvzp0wni4a813pH/mmFd+eunbb0XEVJmCXLCDE=;
	b=eu+bHoTaafh4Ue5bVF4MLQKaHzcZf/6sJ4nFakx0RmCZ+9ahGa7lbqnNGFlwTr0GhYdr
	 wMdGJHarswt55UPjHlVwTR6Dbq14SHYgOy69xx3TXWllleTc/fCgZ//9GO+CXC58701+u
	 Nnwhq/P33QC/ABx3g6WIvaCaazRiMK32Uw6TFjY13V7ZAAtDPEv6+9ZyX/W6RfwmrZXlf
	 kys19IpyD+XCTJzQbCQDo5go+ExwwvWijUPsgNEgqPYMu0nJ9gE6lZl0IXSPngI0Wt0hs
	 jTskFqNA4ausYy6UKfMSAPBxL4DnwhvAHZj7FzpmouIwPEVdsbLD4tYuRcRSTSqmz5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="kZmlI/nk";
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF2E606A31A
	for <ntfs@lists.linux.dev>; Sat, 31 Oct 2026 05:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF2E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kZmlI/nk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=nL
	/9OEvzp0wni4a813pH/mmFd+eunbb0XEVJmCXLCDE=; b=kZmlI/nkEDkarh/oZx
	ADoPNvtwciOwGtZQFcLZPDQuxXM+LseKAULBBX5m6vU4oxOXoZ6ORYjKxdthLlyz
	PI+uwMOk1aPjDzmp8c1tAtOAG8QHaFd8F4Z/PJagLl2mexU2MYcPY8YoOs2aRGjR
	9TnFpSkJe1vep9LYqPj2mu+FQ=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDX37adfOVqFDprDA--.9490S3;
	Sat, 31 Oct 2026 13:29:04 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 1/5] ntfs: initialize inherited ACLs after allocating the MFT record
Date: Sat, 31 Oct 2026 13:28:53 +0800
Message-ID: <20261031052857.1542936-2-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261031052857.1542936-1-liubaolin12138@163.com>
References: <20261031052857.1542936-1-liubaolin12138@163.com>
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
X-CM-TRANSID:QCgvCgDX37adfOVqFDprDA--.9490S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gr1xZFyruFyfJw1UCF4xCrg_yoW7AFW8pa
	93urW7JwsrXr1Sg3Zayw45ur13t3ykZFWUWr47J3WfA3WFgw1aga4xKryjkF93trZ5G3sr
	XF4Ut3y7JrZ8u3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j718kUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QBbJmrlfKDqugAA3X

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_init_acl() can write EAs, but __ntfs_create() calls it before
allocating the new inode's MFT record. An inherited access ACL can appear
correct in the inode cache and disappear after eviction.

Initialize the ACL after allocating the MFT record and adding the standard
attributes. Release the parent and child record locks around the ACL
helpers to avoid recursive locking, then refresh the local mode from the
inode. On creation failure, remove any EA and EA_INFORMATION attributes
before freeing the MFT record.

Initialize the new FILE_NAME ctime from the inode after ACL setup, since
writing the inherited ACL may advance the inode ctime. This also keeps
the directory index copy consistent with STANDARD_INFORMATION.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
Tested the standalone five-patch series in QEMU with four CPUs, NTFS
debug and lockdep enabled. Ordinary files inherited an access ACL, and
published temporary-file ACLs remained readable after cache eviction,
remount and reboot. These checks used the existing cached default ACL
path; the separate cold-cache ACL defect is not fixed here.

Changes in v2:
- Initialize FILE_NAME ctime after ACL setup to avoid retaining the
  pre-ACL timestamp.
- Refresh context for ntfs-next, including the updated early ACL
  error path. The relocated ACL failure still uses MFT/EA rollback.
  Existing attribute rollback defects are handled separately.

 fs/ntfs/namei.c | 49 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index b46fe44b63b5..14eaf7204ead 100644
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
 	__le64 parent_mft_ref;
 	u64 child_mft_ref;
 	__le16 ea_size;
@@ -469,19 +471,6 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 
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
 
@@ -646,6 +635,24 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
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
@@ -679,7 +686,8 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	if (NVolHideDotFiles(vol) && name_len > 0 && name[0] == cpu_to_le16('.'))
 		fn->file_attributes |= FILE_ATTR_HIDDEN;
 	fn->creation_time = fn->last_data_change_time = utc2ntfs(ni->i_crtime);
-	fn->last_mft_change_time = fn->last_access_time = fn->creation_time;
+	fn->last_mft_change_time = utc2ntfs(inode_get_ctime(vi));
+	fn->last_access_time = fn->creation_time;
 	memcpy(fn->file_name, name, name_len * sizeof(__le16));
 
 	/* Add FILE_NAME attribute to inode. */
@@ -720,6 +728,15 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
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
 
@@ -766,6 +783,10 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	mutex_unlock(&dir_ni->mrec_lock);
 	mutex_unlock(&ni->mrec_lock);
 
+	if (rollback_ea_vi)
+		iput(rollback_ea_vi);
+	if (rollback_eai_vi)
+		iput(rollback_eai_vi);
 	if (rollback_data_vi)
 		iput(rollback_data_vi);
 	if (rollback_sd_vi)

