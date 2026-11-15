Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749254;
	b=xQAcLmpW+t6g+sWyi/j6hTbvChPUvXp1PQKkjgZbQtpmd/0t/fYfQH/Zz2U657xNGM/r
	 j9PK9QiA0l7GAiotlXpz2NELwpdwSFwbeyuz3gajF7vjO0yeteKBhqoBKDj1upmT943rd
	 NyqZyC+kvrWa9hFT8xMkO2TeyfbVwGLpFERgijs/ms8Ra9TrZSVyCsIbjxXS7IFDX0Tpa
	 bEQaV8/WItsBAZXOdLVpbvfu3+8gCvgj5pumiZ1zfgXlwxdj4VhNinSokvDQmi5Not9gc
	 F7lWyeSBJ94nH7vOWbPj32FtB2XD/gn0wZGB9EsWYgGbufZ01S0tvqekh/r5nNEBjWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749254;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=0YzvRYiv79bpbctDgzMqBgGUItuMaP+M3ARcws7Fb+s=;
	b=wlfn9hRqc+n7heEJehu+NIFmmc8b/5J8IPL3+7/SV4HrOR/HZnT8UGD5dngMH+zoK7/N
	 pXs+lVNjs5jb10zjWWicM0LM9lzSHiynrlOZ28EVUl8pGwPiYhf+ZA9E7ef+6c8VKVHFn
	 U4VD1xXyD4ALoyzUec12Y5r8Cl9S4IX/KrhYp25Bnh4mQEs4lTcKqHb3n8ur0wFZvkeL7
	 VbFzcrsbh2Sza0cWl6MS0U0yrnqcKkGnjRaiV/i/DYunU8EGCfAFke3XdQstAZLx664Bi
	 Fs82G35JTnXdaq7DFLc4YEOJdx5UXGpH7uZktqfxfnepyq/FmNSJ/Q4aK/VMw/hFEQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Ppt6upIw;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C708606A31D
	for <ntfs@lists.linux.dev>; Sun, 15 Nov 2026 13:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C708606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Ppt6upIw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=0Y
	zvRYiv79bpbctDgzMqBgGUItuMaP+M3ARcws7Fb+s=; b=Ppt6upIwMgVlkGkncK
	9Y0vCWzByR49ZFVZsPC3P5cYnRLS8D90U/oricbUcHBwIrOfCYpPuWiZaiY80h0N
	km7YetQ9uDss6x8raM1xUjarsbFVxSadDOcTCZHMfXPOG7niSZcS4sWN7xfq67Q2
	tFVcVs4GysWeqg7SzhISqnmiA=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXP_A1s_lqfjtyIQ--.47831S2;
	Sun, 15 Nov 2026 21:27:18 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 08/12] ntfs: preserve timestamps when creating hard links
Date: Sun, 15 Nov 2026 21:26:05 +0800
Message-ID: <20261115132609.209957-9-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wDXP_A1s_lqfjtyIQ--.47831S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAryUAr4xGryUKF4UZF4rAFb_yoWrWF4kpF
	W7Kw1DKr4xXrW7WFn2yF4q9rWSga4I9ay7JFWUKw12y3Z0qw18tF1Ivry2vF1rtrZ5Zr1a
	qa1rKr1UWw1UGwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0yIUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hYT3Wr5szYKLwAA3B

From: Xuewen Wang <wangxuewen@kylinos.cn>

ntfs_link() resets all timestamps on the source file and destination
directory, overwriting file atime/mtime and directory atime.

Update only source ctime and directory mtime/ctime. Use the same ctime
for the new FILE_NAME, its index entry and the source inode, updating
the inode only after the link succeeds. Mark both inodes dirty for
writeback.

Keep the rename caller's timestamp behavior unchanged.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes since v3: add the Fixes tag; no code changes.

generic/004 and generic/389 passed in QEMU. Offline checks confirmed
matching ctime in STANDARD_INFORMATION, the new FILE_NAME and its index
entry. File atime/mtime and directory atime were preserved.

 fs/ntfs/namei.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index d3c63b1c166f..4d94e3012677 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1258,6 +1258,7 @@ static int ntfs_rmdir(struct inode *dir, struct dentry *dentry)
  * @dir_ni:	ntfs inode for directory in which new link should be placed
  * @name:	unicode name of the new link
  * @name_len:	length of the name in unicode characters
+ * @ctime:	metadata change time for the new FILE_NAME
  *
  * Create a new hard link. This involves adding an entry to the directory
  * index and adding a new FILE_NAME attribute to the target inode.
@@ -1265,7 +1266,7 @@ static int ntfs_rmdir(struct inode *dir, struct dentry *dentry)
  * Return 0 on success and -errno on error.
  */
 static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
-		__le16 *name, u8 name_len)
+		__le16 *name, u8 name_len, struct timespec64 ctime)
 {
 	struct super_block *sb;
 	struct inode *vi = VFS_I(ni);
@@ -1327,7 +1328,7 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 
 	fn->creation_time = utc2ntfs(ni->i_crtime);
 	fn->last_data_change_time = utc2ntfs(inode_get_mtime(vi));
-	fn->last_mft_change_time = utc2ntfs(inode_get_ctime(vi));
+	fn->last_mft_change_time = utc2ntfs(ctime);
 	fn->last_access_time = utc2ntfs(inode_get_atime(vi));
 	memcpy(fn->file_name, name, name_len * sizeof(__le16));
 
@@ -1478,7 +1479,8 @@ static int ntfs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 			goto err_out;
 	}
 
-	err = __ntfs_link(old_ni, new_dir_ni, uname_new, new_name_len);
+	err = __ntfs_link(old_ni, new_dir_ni, uname_new, new_name_len,
+			  inode_get_ctime(old_inode));
 	if (err)
 		goto err_out;
 
@@ -1644,6 +1646,7 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
 	int uname_len;
 	int err;
 	struct ntfs_inode *ni = NTFS_I(vi), *dir_ni = NTFS_I(dir);
+	struct timespec64 ctime;
 
 	if (NVolShutdown(vol))
 		return -EIO;
@@ -1668,7 +1671,8 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
 	ihold(vi);
 	mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
 	mutex_lock_nested(&dir_ni->mrec_lock, NTFS_INODE_MUTEX_PARENT);
-	err = __ntfs_link(NTFS_I(vi), NTFS_I(dir), uname, uname_len);
+	ctime = current_time(vi);
+	err = __ntfs_link(ni, dir_ni, uname, uname_len, ctime);
 	if (err) {
 		mutex_unlock(&dir_ni->mrec_lock);
 		mutex_unlock(&ni->mrec_lock);
@@ -1678,12 +1682,13 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
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

