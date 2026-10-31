Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424569;
	b=RLM9/xF2N/essgdf+4wslsoilm8XQAbC/SO+vDTeJBr6ckwYG1Z6a3GbmiEgdsTWjVBD
	 3RDeJaicje8PqTz39+WNxq13FZ6bqfL2ChxT2qm5cdtF8Zhb+dP3A8dpBfxYdk/3WwG4t
	 CI9IwSz0tK2JglPUaa2LlpB+PYW2IkI3mltKHb/cLJIeuGgUfVrZf6duEXmlXO07zu7Qy
	 OjRkdqvFIgRXXxqn5Z06SInXJlSTTXnKZtjLVMvDhY7Yrw2hhCI5WMlWfhV430jJMSz6l
	 7lQ71PS/SaG9IxyMgRM6e/NWXY/0vlER1UyBULweJbYvBWyu7VrDeW5E+qEU2YnJFTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424569;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=PoEJOz6BO3EABg6aGcSf6huZBWcr0145a9Y7my193cA=;
	b=waRlDgikwpokkL/7d6Q+qBqNtBC8OyhFel06zuLFiSzVxYVt0RcmFj8OD8b3N5oN1+UQ
	 /QDKdNJWTBil7xLj7d2bPXRL8NHraCVNp1t130Bb/CdzQQG+UqV35zVhD+AxhmJ1S5BTE
	 CunB1oKY31x/s1G0w0Q7Rc6xGCioHyF2hJlPTC/lvN+JOZeHoN4DzE7nBl4HSDwivc5yW
	 0ioOb4//7AcYMgCdKH2yC9CZMSQDz12bdg+ZMtAIew+8C5nJlH/I/q6HXETN0rt0/I9lI
	 /uVRyVgmiDQZtKiwmKrPmZAeDHOzH85hsBRA0YRJjN6GC0TCVJvvFDbVFSqeMyuDHtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="o/hSwahP";
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2128F606A320
	for <ntfs@lists.linux.dev>; Sat, 31 Oct 2026 05:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2128F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=o/hSwahP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Po
	EJOz6BO3EABg6aGcSf6huZBWcr0145a9Y7my193cA=; b=o/hSwahPWdzxf1Tc4Y
	JNq+LrWv9DwXJJtZHNiQLivtJAb88/8QgZLcFboo7SB3C8nTWhLYJ40MjrEuw5yv
	MXLehcmA6lVwfC/1EIXri++r4n4EnDd3lmlSnSnJDFjEWoY9IUwTyUFTXjB9RRY0
	E7vwp23hHoCMfBt0QQqQGyWx0=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDX37adfOVqFDprDA--.9490S4;
	Sat, 31 Oct 2026 13:29:05 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v2 2/5] ntfs: preserve timestamps when creating hard links
Date: Sat, 31 Oct 2026 13:28:54 +0800
Message-ID: <20261031052857.1542936-3-liubaolin12138@163.com>
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
X-CM-TRANSID:QCgvCgDX37adfOVqFDprDA--.9490S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr48uF43Xr17XFW7Ar48Crg_yoWrCFW3pF
	W3Kw1DKr4xXrW7Wrn2yF4DZFySga4I9FW7JFWUKw13Aan0qw18tF1Iqry7ZF1rtrZ5Wr1j
	qa1Fgr1UWw1UG3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jyxRhUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gFbJmrlfKFp4QAA3M

From: Xuewen Wang <wangxuewen@kylinos.cn>

ntfs_link() resets atime, mtime and ctime on both the source file and
the destination directory after creating a hard link. This overwrites
the source file's atime and mtime and the directory's atime.

Update only the source ctime and the destination directory mtime/ctime.
Use the same timestamp for the new FILE_NAME attribute, its directory
index entry and the source inode, so the new name does not retain the
old ctime. Set the inode's ctime only after the link succeeds and mark
both inodes dirty to queue their timestamps for writeback.

Keep the rename caller's existing timestamp behavior unchanged.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Tested the standalone five-patch series in QEMU. The requested unchanged
xfstests generic/004 and generic/389 passed. Hard-link tests checked that
prepared atime/mtime remained unchanged and source ctime advanced.
Offline checks compared STANDARD_INFORMATION, the new FILE_NAME and
the directory index ctime.

Changes in v2:
- Use the same new ctime for the inode, FILE_NAME and directory index,
  as requested in review.
- Update inode ctime only after the link succeeds.

 fs/ntfs/namei.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 14eaf7204ead..a83a648c8ff8 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1244,6 +1244,7 @@ static int ntfs_rmdir(struct inode *dir, struct dentry *dentry)
  * @dir_ni:	ntfs inode for directory in which new link should be placed
  * @name:	unicode name of the new link
  * @name_len:	length of the name in unicode characters
+ * @ctime:	metadata change time for the new FILE_NAME
  *
  * Create a new hard link. This involves adding an entry to the directory
  * index and adding a new FILE_NAME attribute to the target inode.
@@ -1251,7 +1252,7 @@ static int ntfs_rmdir(struct inode *dir, struct dentry *dentry)
  * Return 0 on success and -errno on error.
  */
 static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
-		__le16 *name, u8 name_len)
+		__le16 *name, u8 name_len, struct timespec64 ctime)
 {
 	struct super_block *sb;
 	struct inode *vi = VFS_I(ni);
@@ -1313,7 +1314,7 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 
 	fn->creation_time = utc2ntfs(ni->i_crtime);
 	fn->last_data_change_time = utc2ntfs(inode_get_mtime(vi));
-	fn->last_mft_change_time = utc2ntfs(inode_get_ctime(vi));
+	fn->last_mft_change_time = utc2ntfs(ctime);
 	fn->last_access_time = utc2ntfs(inode_get_atime(vi));
 	memcpy(fn->file_name, name, name_len * sizeof(__le16));
 
@@ -1464,7 +1465,8 @@ static int ntfs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 			goto err_out;
 	}
 
-	err = __ntfs_link(old_ni, new_dir_ni, uname_new, new_name_len);
+	err = __ntfs_link(old_ni, new_dir_ni, uname_new, new_name_len,
+			  inode_get_ctime(old_inode));
 	if (err)
 		goto err_out;
 
@@ -1630,6 +1632,7 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
 	int uname_len;
 	int err;
 	struct ntfs_inode *ni = NTFS_I(vi), *dir_ni = NTFS_I(dir);
+	struct timespec64 ctime;
 
 	if (NVolShutdown(vol))
 		return -EIO;
@@ -1654,7 +1657,8 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
 	ihold(vi);
 	mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
 	mutex_lock_nested(&dir_ni->mrec_lock, NTFS_INODE_MUTEX_PARENT);
-	err = __ntfs_link(NTFS_I(vi), NTFS_I(dir), uname, uname_len);
+	ctime = current_time(vi);
+	err = __ntfs_link(ni, dir_ni, uname, uname_len, ctime);
 	if (err) {
 		mutex_unlock(&dir_ni->mrec_lock);
 		mutex_unlock(&ni->mrec_lock);
@@ -1664,12 +1668,13 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
 	}
 
 	inode_inc_iversion(dir);
-	simple_inode_init_ts(dir);
+	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
+	mark_inode_dirty(dir);
 
 	inode_inc_iversion(vi);
-	simple_inode_init_ts(vi);
+	inode_set_ctime_to_ts(vi, ctime);
+	mark_inode_dirty(vi);
 
-	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
 	d_instantiate(dentry, vi);
 	mutex_unlock(&dir_ni->mrec_lock);
 	mutex_unlock(&ni->mrec_lock);

