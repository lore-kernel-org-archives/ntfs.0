Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486082;
	b=WmpCJIA3q6Hg8BsIAiEsCdLOAO6eyAhRWL5Snk3g/1C3eoO337nCE84CKW8BRJL7mPu/
	 vbfb9woMmyiyQW/A7c2Pm6p3nzzfzzaq5FAXGTqZd7os6ptHgLWmD1y32yIPssfsm6jPR
	 tfCaqV4KP6Lk175O9nIEBM4HKMAfN1QcAYYMr+SvqJdLQ3FeO2pyW0HWrLx2f2J1KPmhr
	 N3h+sirWLGQl3DUskyfmt2anPdKqBNSfBbW9+b+E7OdlD/eLwLHbDunDQ4+GgSqV+1S86
	 5JxqDLETxg/eLKRxdsWVpe/pC4J4j7ETT6sJ8inHE/Tl5lobT5bCjzWad3NW99qolPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486082;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=mVS2Zzmo2aNS6iZnAY+DB7ysTEdcEOsDvaLXa+jkuGg=;
	b=XLJOM08sTgTebxLExSq78pUoHOeq1conO8VnNG+6dQy26nntYz0PAUw9dFaJ1PH42qeO
	 em771G2ptKWgDV9qRAAdnM/NQW1AYmShL6VdGWyaehbnpcofw/3/4b/mjdqvYZooWaA6A
	 nqjtI8s0iPQjNN9pzyRIBY4nfDmHIoAxgA/Q2MbLWxONJdjmX8w/glFcwSZfqfcMJ1sEZ
	 UNcj6ajri7K00C26b42GH9tpulQL8wqbT8hxY0KI/J3hN9LdL+CDlHExNNawBwOePEOnH
	 5FnFqveubCt9qQLfiB+54IZGpeaalINLRFWN4O442FHMioCgIBCxfHom0JS51aSk+Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="WCipe/tH";
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DE460A2636
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0DE460A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WCipe/tH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=mV
	S2Zzmo2aNS6iZnAY+DB7ysTEdcEOsDvaLXa+jkuGg=; b=WCipe/tHU73lQWhe1X
	yaq0vChJx8sbnvhmJzW6q1dtuvbf/mSw5hfQ/yDqiYB3MKY6offLTebjFj3ZZn5+
	3UsFhE1KFLHWKxYtaGg5Ux9PFAyTiTH57wZzFwj8yEDxLsEeMLb7KNtYgoKqtyec
	oD9mZKVSXETcBJh4IQIrwCETQ=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3t62yKtdqN_ayBQ--.9980S7;
	Tue, 20 Oct 2026 16:47:52 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 29/31] ntfs: report named stream metadata and recovery errors
Date: Tue, 20 Oct 2026 16:44:19 +0800
Message-ID: <20261020084421.2196486-30-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3t62yKtdqN_ayBQ--.9980S7
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xw13Jw4DtFW3Cr45GrWrGrg_yoW7Kr1kpF
	WxC393K3s3tFyxKwn7tan0v34fKFn7Kw47Kr4UJ3W7ArsYqr15tF4jkr1I9FWrtryrWanI
	qF45twsxur17ZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzq2NUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RhJFGrXKrh2xgAA3z

From: Xuewen Wang <wangxuewen@kylinos.cn>

Report missing or stale MFT references after a successful base-name
lookup as EFSCORRUPTED only when the caller holds the directory i_rwsem.
Pass that locking state through the helper and its callers. Unlocked
revalidation can race with unlink or record reuse and must not report
those races as corruption.

Also report missing required stream attributes and cleanup failures.
For rollback failures that trigger shutdown, report the cleanup errno
and retain the EIO operation result. Preserve the existing ENOMEM and
interruption exceptions, and keep ordinary missing streams silent.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 fs/ntfs/named_stream.c | 35 +++++++++++++++++++++++++++--------
 fs/ntfs/stream.h       |  2 +-
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs/named_stream.c b/fs/ntfs/named_stream.c
index 6130359f616a..1073ff7e12f7 100644
--- a/fs/ntfs/named_stream.c
+++ b/fs/ntfs/named_stream.c
@@ -252,6 +252,7 @@ int ntfs_stream_path_check(struct ntfs_volume *vol,
  * @dir_ino: directory containing the base file or directory
  * @uname: UTF-16LE base name
  * @uname_len: Length of @uname in UTF-16 code units
+ * @dir_locked: caller holds the directory i_rwsem against namespace changes
  *
  * Resolve the directory entry and verify its MFT reference before returning
  * the inode.
@@ -259,7 +260,7 @@ int ntfs_stream_path_check(struct ntfs_volume *vol,
  * Return: Referenced inode on success, or ERR_PTR() on failure.
  */
 struct inode *ntfs_stream_lookup_inode_by_name(struct inode *dir_ino,
-		__le16 *uname, int uname_len)
+		__le16 *uname, int uname_len, bool dir_locked)
 {
 	struct ntfs_volume *vol = NTFS_SB(dir_ino->i_sb);
 	struct ntfs_name *name = NULL;
@@ -276,12 +277,20 @@ struct inode *ntfs_stream_lookup_inode_by_name(struct inode *dir_ino,
 		return ERR_PTR(MREF_ERR(mref));
 
 	inode = ntfs_iget(vol->sb, MREF(mref));
-	if (IS_ERR(inode))
+	if (IS_ERR(inode)) {
+		if (dir_locked && PTR_ERR(inode) == -ENOENT) {
+			ntfs_report_file_metadata_error(dir_ino, -EFSCORRUPTED);
+			inode = ERR_PTR(-EFSCORRUPTED);
+		}
 		return inode;
+	}
 	if (MSEQNO(mref) != NTFS_I(inode)->seq_no &&
 	    MREF(mref) != FILE_MFT) {
+		/* Unlocked dentry revalidation can race with unlink and reuse. */
+		if (dir_locked)
+			ntfs_report_file_metadata_error(dir_ino, -EFSCORRUPTED);
 		iput(inode);
-		return ERR_PTR(-EIO);
+		return ERR_PTR(dir_locked ? -EFSCORRUPTED : -EIO);
 	}
 	return inode;
 }
@@ -333,7 +342,7 @@ static int ntfs_stream_d_revalidate(struct inode *dir,
 			ni->vol->upcase_len))
 		goto out;
 
-	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len);
+	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len, false);
 	if (IS_ERR(base_vi))
 		goto out;
 	if (NTFS_I(base_vi) != ni->ext.base_ntfs_ino) {
@@ -441,7 +450,7 @@ struct dentry *ntfs_lookup_stream(struct inode *dir_ino,
 	}
 
 	base_vi = ntfs_stream_lookup_inode_by_name(dir_ino, base_uname,
-			base_len);
+			base_len, true);
 	kmem_cache_free(ntfs_name_cache, base_uname);
 	if (IS_ERR(base_vi)) {
 		err = PTR_ERR(base_vi);
@@ -564,7 +573,7 @@ struct inode *ntfs_create_named_stream(struct mnt_idmap *idmap,
 	bool stream_created = false;
 	int err, rollback_err;
 
-	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len);
+	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len, true);
 	if (IS_ERR(base_vi))
 		return base_vi;
 	if (!S_ISREG(base_vi->i_mode) && !S_ISDIR(base_vi->i_mode)) {
@@ -635,6 +644,10 @@ struct inode *ntfs_create_named_stream(struct mnt_idmap *idmap,
 	else
 		err = PTR_ERR(stream_vi);
 	if (err) {
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(base_vi, -EFSCORRUPTED);
+		}
 		if (stream_created) {
 			rollback_err = ntfs_attr_remove(base_ni, AT_DATA,
 					stream_name, stream_len, &rollback_vi);
@@ -646,7 +659,8 @@ struct inode *ntfs_create_named_stream(struct mnt_idmap *idmap,
 				    rollback_err == -ERESTARTSYS) {
 					err = rollback_err;
 				} else {
-					NVolSetErrors(base_ni->vol);
+					ntfs_report_file_metadata_error(base_vi,
+									rollback_err);
 					NVolSetShutdown(base_ni->vol);
 					err = -EIO;
 				}
@@ -698,7 +712,7 @@ int ntfs_unlink_named_stream(struct inode *dir, struct dentry *dentry)
 	if (!path_result)
 		return -EINVAL;
 
-	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len);
+	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len, true);
 	if (IS_ERR(base_vi)) {
 		err = PTR_ERR(base_vi);
 		goto out_free;
@@ -1044,6 +1058,7 @@ static int ntfs_stream_finish_remove(struct inode *attr_vi)
 		remove_inode_hash(attr_vi);
 	} else {
 		NInoSetBeingDeleted(attr_ni);
+		ntfs_report_file_metadata_error(VFS_I(ni), err);
 		remove_inode_hash(attr_vi);
 	}
 
@@ -1279,6 +1294,10 @@ static int ntfs_stream_ioctl_get_inode(struct inode *base_vi, __le16 *sname,
 	attr_vi = ntfs_attr_iget(base_vi, AT_DATA, sname, sname_len);
 	if (IS_ERR(attr_vi)) {
 		err = PTR_ERR(attr_vi);
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(base_vi, -EFSCORRUPTED);
+		}
 		attr_vi = NULL;
 		goto out_unlock;
 	}
diff --git a/fs/ntfs/stream.h b/fs/ntfs/stream.h
index 5cbf6e8f6b68..84929e755689 100644
--- a/fs/ntfs/stream.h
+++ b/fs/ntfs/stream.h
@@ -29,7 +29,7 @@ int ntfs_stream_path_names(struct ntfs_volume *vol,
 		__le16 **stream_name, int *stream_len);
 
 struct inode *ntfs_stream_lookup_inode_by_name(struct inode *dir,
-		__le16 *name, int name_len);
+		__le16 *name, int name_len, bool dir_locked);
 struct dentry *ntfs_lookup_stream(struct inode *dir, struct dentry *dentry,
 		const struct ntfs_stream_path *path);
 struct inode *ntfs_create_named_stream(struct mnt_idmap *idmap,
-- 
2.51.0

