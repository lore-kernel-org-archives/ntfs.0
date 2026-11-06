Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946724;
	b=nVg/iDpRg1rxFAR1VdYBlnX2/0rqTwkQEgFeRhZfLnrmXQVlyibxvpO2zi4stW4NC+m6
	 inCdbIrj7eYdZdVPyusFPi7VgkB2OXnF8WFUOWkm9vfIbOTltajYvybqqoBu2jY4zzg6N
	 Z+DbKCLI/WYm18n4OwYQK5rwXG/uhDJiQyAGlPUsob7j8lHCuW2jIu7+pajg6Qp872xNp
	 ZP6gjozbrGcAnO9ckH4fVFKVTHnuyqSZGmQlWYYtVePzJiyyFZ0M0/XGh6XNeJm0R8jXy
	 9gUV2aiuu9yxHNIFZKLQ+XWyw+uBJbFL4uAnZetMdJiq48tDbQsHyTMerMASdpSnlOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946724;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=GwUsEzLxJ8DBjLH4zCH7CqJV5Ls9bvaj/W8a+VYFwkw=;
	b=XsSee9CO8wDjIZ6OcxeY+Tw3OoS0qPnCUxS131uCb2S9hPvT/6N3Cbo+1QXf+UJtYwHY
	 n1vLWxwIoJkTgPn70z711E5yfOmaQXrqHo5cY0Uh0Rd1OVibzoKvfN7yTPVeO9I9vyWj0
	 YTKeH5RAE9DIpAqQOoBGY0ewpQjmUHosNopvPeCraclE8wcj6IgEXLbRFhBfAIp57x8HT
	 QfoaNwbikuzEDvS9YLzut+467pLThhyYVQ8yYEcA49CdVevXwg0XQPnCYqVMS6JFo9WCR
	 LC6g7GNzs+7/FCH4979JDL8g6vNZy4heLECercuo7tkowSotXfEPhxNmmZrtKJwRhiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mipdzMGZ;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3165606A32F
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 06:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3165606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mipdzMGZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Gw
	UsEzLxJ8DBjLH4zCH7CqJV5Ls9bvaj/W8a+VYFwkw=; b=mipdzMGZ/1AYa8O+2m
	oBIDnZTBFRbATN48TqLGmkcdyhwKIumNRZuPIr2CzV4/1MA9UXQK6wEyJ7m78oyX
	2xByt8aFU8bCT3zSSuOAv/PEkG90BwcJ5nrHpi9/O1v5PFcMVamza+DxLIbuxV1F
	nls1FOWKyaR9mc0bsMRNAYqjE=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3lzdFdO1qwIxJFg--.3403S4;
	Fri, 06 Nov 2026 14:31:37 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v3 2/5] ntfs: preserve timestamps when creating hard links
Date: Fri,  6 Nov 2026 14:30:56 +0800
Message-ID: <20261106063059.2904988-3-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261106063059.2904988-1-liubaolin12138@163.com>
References: <20261106063059.2904988-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3lzdFdO1qwIxJFg--.3403S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr48uF43Xr17XFW7Ww48JFb_yoWrAr18pF
	W7K34DGrs7XrW7Wrn2yF4DZrWS9a4I9FW7JFWUKw13Aan0qw18tF1Iqry7ZF1rtrZ5Wr42
	qa1rKw1UWw1UGw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jyxRhUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QlFEGrtdElBwQAA3P

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

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Tested in QEMU; generic/004 and generic/389 passed. Hard links preserved
atime/mtime and advanced ctime. Offline checks confirmed matching ctime
in STANDARD_INFORMATION, the new FILE_NAME and the directory index.

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

