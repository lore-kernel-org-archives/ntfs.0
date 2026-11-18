Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993120;
	b=rzeNKdAUM3NVCwF8JYZxsI565Jwd7/5zXUNrnt8epWhNdSS480YbowkGiisY5jhGoEps
	 /FuIfWK2YlMbLtRJenUmW2+L+JEZ4zk2RSywAiH/8KdlEtmsVHfgFZ7I5a9PdNcM6BIAb
	 U876edWRRZTEhIQxjWcVWs7i+b6YsojeZGsd6iBrkr8ubyoJOOxmhmSvlNy+aHjlfSX43
	 qEm0HQs9SDP0kNb6p+QCur0eDKlWmGXI/qGVGzYfAC4O41CerC9AT2rVOqO/BeRDAv/+G
	 lCgY9TEWvarZagi4Iavc8iwn+8zGewDyG63IdBTI/+W0yFanyzQ6RBaKx0EZcImHxPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993120;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Q+kU8V2ay0cm8aNHCEU2Xm8tX9yiEIaOiRafboIzrLs=;
	b=aBbeQUHLE1L7uXgEGMlXCQhfpAlOM+mg+XxYPNaxsA5Lkfr8gKyAUmW9ddPcEPeBEn9r
	 PUfC7T8UXHYevOkr3XU4JgZolfUhxZ8x3gtv5uSBnrt2SJuugkIJjad44MjdfaIMZPLi5
	 MnlCBt59dDUo+8rSOTYkWxn1EW8q/+20Ze3BAr+hJlauAu0A1+i9tOFCY/rj+wWiRNktb
	 Cjh0Dg4jx7B2QWdalzf3zO8yjJdQOk75sXoLBu7nhRMSoDgQ8R3Xjv142yhjN6bHCUINn
	 eKML4byPbId+09roMnRY9bqUeRnBlSeFb8kyTUxr/fHL/Y5l+OQRJl3PGqIrEebExFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EgCXshNP;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468B6606A883
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 468B6606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EgCXshNP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Q+
	kU8V2ay0cm8aNHCEU2Xm8tX9yiEIaOiRafboIzrLs=; b=EgCXshNPGr8Z22aTPL
	P9D4vqqHvYpJh3V8wk95by/qsP1g+IJyRCNcRhDeDqzf8PTrq3aVGjvReXOecPJ4
	10GhntxQSN1XLKtKETtL7AMXsVyPHmY4S4CcX5322oi6Tih6ZT8poLbfyNfYhT/V
	Mf+9lSWTkzhnhaxPIaDhBhNjM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3v0nSa_1qVwxBIg--.34758S4;
	Wed, 18 Nov 2026 17:11:48 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 34/37] ntfs: report named stream metadata and recovery errors
Date: Wed, 18 Nov 2026 17:06:58 +0800
Message-Id: <20261118090701.1858849-35-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3v0nSa_1qVwxBIg--.34758S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xw13WryDuw1UCrWUArW7CFg_yoWxGFWxpF
	WxCws3K3s3tFy7Kwn7tanYv34fKr1kKw47Kr4UX3W7ArsYqr15tF4jkrn29FWrtryrWanI
	qF4Yqwsxur17Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UK-eOUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzhQqE2r9a9QNeQAA3-

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

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes in v6:
Rebase onto the updated ntfs-next; retain the v5 reporting behavior.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.

 fs/ntfs/named_stream.c | 41 ++++++++++++++++++++++++++++++++---------
 fs/ntfs/stream.h       |  2 +-
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs/named_stream.c b/fs/ntfs/named_stream.c
index b102baa6a52f..b404c8f4154f 100644
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
@@ -259,8 +260,9 @@ int ntfs_stream_path_check(struct ntfs_volume *vol,
  * Return: Referenced inode on success, or ERR_PTR() on failure.
  */
 struct inode *ntfs_stream_lookup_inode_by_name(struct inode *dir_ino,
-		__le16 *uname, int uname_len)
+		__le16 *uname, int uname_len, bool dir_locked)
 {
+	int report_err = 0;
 	struct ntfs_volume *vol = NTFS_SB(dir_ino->i_sb);
 	struct ntfs_name *name = NULL;
 	struct inode *inode;
@@ -276,13 +278,24 @@ struct inode *ntfs_stream_lookup_inode_by_name(struct inode *dir_ino,
 		return ERR_PTR(MREF_ERR(mref));
 
 	inode = ntfs_iget(vol->sb, MREF(mref));
-	if (IS_ERR(inode))
-		return inode;
+	if (IS_ERR(inode)) {
+		if (dir_locked && PTR_ERR(inode) == -ENOENT) {
+			report_err = -EFSCORRUPTED;
+			inode = ERR_PTR(-EFSCORRUPTED);
+		}
+		goto out;
+	}
 	if (MSEQNO(mref) != NTFS_I(inode)->seq_no &&
 	    MREF(mref) != FILE_MFT) {
+		/* Unlocked dentry revalidation can race with unlink and reuse. */
+		if (dir_locked)
+			report_err = -EFSCORRUPTED;
 		iput(inode);
-		return ERR_PTR(-EIO);
+		inode = ERR_PTR(dir_locked ? -EFSCORRUPTED : -EIO);
 	}
+out:
+	if (report_err)
+		ntfs_report_file_metadata_error(dir_ino, report_err);
 	return inode;
 }
 
@@ -333,7 +346,7 @@ static int ntfs_stream_d_revalidate(struct inode *dir,
 			ni->vol->upcase_len))
 		goto out;
 
-	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len);
+	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len, false);
 	if (IS_ERR(base_vi))
 		goto out;
 	if (NTFS_I(base_vi) != ni->ext.base_ntfs_ino) {
@@ -441,7 +454,7 @@ struct dentry *ntfs_lookup_stream(struct inode *dir_ino,
 	}
 
 	base_vi = ntfs_stream_lookup_inode_by_name(dir_ino, base_uname,
-			base_len);
+			base_len, true);
 	kmem_cache_free(ntfs_name_cache, base_uname);
 	if (IS_ERR(base_vi)) {
 		err = PTR_ERR(base_vi);
@@ -564,7 +577,7 @@ struct inode *ntfs_create_named_stream(const struct mnt_idmap *idmap,
 	bool stream_created = false;
 	int err, rollback_err;
 
-	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len);
+	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len, true);
 	if (IS_ERR(base_vi))
 		return base_vi;
 	if (!S_ISREG(base_vi->i_mode) && !S_ISDIR(base_vi->i_mode)) {
@@ -635,6 +648,10 @@ struct inode *ntfs_create_named_stream(const struct mnt_idmap *idmap,
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
@@ -646,7 +663,8 @@ struct inode *ntfs_create_named_stream(const struct mnt_idmap *idmap,
 				    rollback_err == -ERESTARTSYS) {
 					err = rollback_err;
 				} else {
-					NVolSetErrors(base_ni->vol);
+					ntfs_report_file_metadata_error(base_vi,
+									rollback_err);
 					NVolSetShutdown(base_ni->vol);
 					err = -EIO;
 				}
@@ -698,7 +716,7 @@ int ntfs_unlink_named_stream(struct inode *dir, struct dentry *dentry)
 	if (!path_result)
 		return -EINVAL;
 
-	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len);
+	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len, true);
 	if (IS_ERR(base_vi)) {
 		err = PTR_ERR(base_vi);
 		goto out_free;
@@ -1044,6 +1062,7 @@ static int ntfs_stream_finish_remove(struct inode *attr_vi)
 		remove_inode_hash(attr_vi);
 	} else {
 		NInoSetBeingDeleted(attr_ni);
+		ntfs_report_file_metadata_error(VFS_I(ni), err);
 		remove_inode_hash(attr_vi);
 	}
 
@@ -1279,6 +1298,10 @@ static int ntfs_stream_ioctl_get_inode(struct inode *base_vi, __le16 *sname,
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
index 76b6c9cca5cc..701283143a39 100644
--- a/fs/ntfs/stream.h
+++ b/fs/ntfs/stream.h
@@ -29,7 +29,7 @@ int ntfs_stream_path_names(struct ntfs_volume *vol,
 		__le16 **stream_name, int *stream_len);
 
 struct inode *ntfs_stream_lookup_inode_by_name(struct inode *dir,
-		__le16 *name, int name_len);
+		__le16 *name, int name_len, bool dir_locked);
 struct dentry *ntfs_lookup_stream(struct inode *dir, struct dentry *dentry,
 		const struct ntfs_stream_path *path);
 struct inode *ntfs_create_named_stream(const struct mnt_idmap *idmap,
-- 
2.51.0

