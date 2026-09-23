Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8B34398FA
	for <ntfs@lists.linux.dev>; Wed, 23 Sep 2026 06:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143412; cv=none; b=CSws0He5VF3sKkyhxO2fJBD7YED67mBR+882bMhMegLEesMrFxcjbPdJ7JesMPNvzflgaSeLmohxCBiAabqSBHpcpU65KNZTxOpN/qwe3b7zfItyGvZRDPR6Ro7oTm89lNyiGm4lfMU9rNR7ZhZH3hbF1YJb5XAmth1iJ9+Abow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143412; c=relaxed/simple;
	bh=SLvIRF/BQQYJeKvS9wwLImD5kOoExEE25bLIsUlvVXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=isSbU8HjQUiBwNBPS5RWl1JCDM4sFVx3aA2pzADvURSsJK8JbAfufNMmznq1KgucBLeOkzUmZLW7fFUs48xq90GmU27FMd/QN7q8DIYOQVFM74nKjTbC9lEPP6ll9vxw8ti6ofiD6hPY1MLZn0OES1U3g/szJlC4bnyDmT4pIZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MK6Tc/0C; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MK6Tc/0C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=by
	VHPD1vO1LiJiOEAeBdTEB0gw669olCIOtfkHmfpt4=; b=MK6Tc/0CIdhpY/3Vsx
	YjRCCRnmGxZkOjCj7K9qnYLHjDmDdlAfnzgUW2F02qZMzo59hrnM7vY5+smigl3F
	j0AmRgSoyXekm/8QdYpjFiuLVAPmmjBlZFJ52wFIllu0kmMlIGlMa9oPjpGGvqJv
	f6I0cr1cOkyBYA+8s0XBDbNX4=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCH_E+Ia7NqXdW_Aw--.58316S9;
	Wed, 23 Sep 2026 14:03:04 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 07/10] ntfs: add fileattr query support
Date: Wed, 23 Sep 2026 14:02:43 +0800
Message-ID: <20260923060246.2499192-8-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260923060246.2499192-1-liubaolin12138@163.com>
References: <20260923060246.2499192-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgCH_E+Ia7NqXdW_Aw--.58316S9
X-Coremail-Antispam: 1Uf129KBjvJXoWxAry8Zr4DZw43uF48GFWxZwb_yoWrZw43pF
	Z3CFyfKa1rXFy2g392kFWjv3WY9ryxWw4UXryxX34IkFnrtr93KF1fK3WruFn5KrZ5A3yU
	XF1YqrWUGr45ZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4Q6LUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RmIU2qza5nHOgAA39

From: Baolin Liu <liubaolin@kylinos.cn>

Add fileattr_get operations for files and directories, as well as the
existing symlink and special inode operation tables. Report compression,
encryption, immutable and append-only from cached inode state, and
FS_CASEFOLD_FL from the mount-wide case sensitivity policy.

This introduces querying only. It neither reads a private flag EA nor
allows userspace to change the reported flags.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 Documentation/filesystems/ntfs.rst |  8 ++++++++
 fs/ntfs/file.c                     | 33 ++++++++++++++++++++++++++++++
 fs/ntfs/namei.c                    |  1 +
 fs/ntfs/ntfs.h                     |  2 ++
 4 files changed, 44 insertions(+)

diff --git a/Documentation/filesystems/ntfs.rst b/Documentation/filesystems/ntfs.rst
index 4bfa392daec6..0a4c43d6c890 100644
--- a/Documentation/filesystems/ntfs.rst
+++ b/Documentation/filesystems/ntfs.rst
@@ -9,6 +9,7 @@ The Linux NTFS filesystem driver
 
    - Overview
    - Utilities support
+   - Linux file attributes
    - Supported mount options
 
 
@@ -34,6 +35,13 @@ The project is available at:
   https://github.com/ntfsprogs-plus/ntfsprogs-plus
 
 
+Linux file attributes
+=====================
+
+The driver supports querying compression, encryption, immutable, append-only
+and mount-wide case folding through lsattr(1). Case folding is reported
+according to the mount options.
+
 Supported mount options
 =======================
 
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 99a2c7a5cf81..e5846bf498b0 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -15,6 +15,7 @@
 #include <linux/posix_acl_xattr.h>
 #include <linux/compat.h>
 #include <linux/falloc.h>
+#include <linux/fileattr.h>
 
 #include "lcnalloc.h"
 #include "ntfs.h"
@@ -136,6 +137,35 @@ static int ntfs_file_release(struct inode *vi, struct file *filp)
 	return 0;
 }
 
+/*
+ * ntfs_fileattr_get - inode_operations::fileattr_get
+ * @dentry:	dentry to report the flags of
+ * @fa:		filled in with the flags of @dentry
+ */
+int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
+{
+	struct inode *vi = d_inode(dentry);
+	struct ntfs_inode *ni = NTFS_I(vi);
+	u32 flags = 0;
+
+	if (NVolShutdown(ni->vol))
+		return -EIO;
+
+	if (NInoCompressed(ni) || NInoWofCompressed(ni))
+		flags |= FS_COMPR_FL;
+	if (NInoEncrypted(ni))
+		flags |= FS_ENCRYPT_FL;
+	if (vi->i_flags & S_IMMUTABLE)
+		flags |= FS_IMMUTABLE_FL;
+	if (vi->i_flags & S_APPEND)
+		flags |= FS_APPEND_FL;
+	if (!NVolCaseSensitive(ni->vol))
+		flags |= FS_CASEFOLD_FL;
+
+	fileattr_fill_flags(fa, flags);
+	return 0;
+}
+
 /*
  * ntfs_file_fsync - sync a file to disk
  * @filp:	file to be synced
@@ -1234,6 +1264,7 @@ const struct file_operations ntfs_file_ops = {
 };
 
 const struct inode_operations ntfs_file_inode_ops = {
+	.fileattr_get	= ntfs_fileattr_get,
 	.setattr	= ntfs_setattr,
 	.getattr	= ntfs_getattr,
 	.listxattr	= ntfs_listxattr,
@@ -1243,12 +1274,14 @@ const struct inode_operations ntfs_file_inode_ops = {
 };
 
 const struct inode_operations ntfs_symlink_inode_operations = {
+	.fileattr_get	= ntfs_fileattr_get,
 	.get_link	= ntfs_get_link,
 	.setattr	= ntfs_setattr,
 	.listxattr	= ntfs_listxattr,
 };
 
 const struct inode_operations ntfs_special_inode_operations = {
+	.fileattr_get	= ntfs_fileattr_get,
 	.setattr	= ntfs_setattr,
 	.getattr	= ntfs_getattr,
 	.listxattr	= ntfs_listxattr,
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 3e0adb9a0ea4..ee451700b766 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1548,6 +1548,7 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
  * Inode operations for directories.
  */
 const struct inode_operations ntfs_dir_inode_ops = {
+	.fileattr_get	= ntfs_fileattr_get,
 	.lookup		= ntfs_lookup,	/* VFS: Lookup directory. */
 	.create		= ntfs_create,
 	.unlink		= ntfs_unlink,
diff --git a/fs/ntfs/ntfs.h b/fs/ntfs/ntfs.h
index dd56894762a9..a5c5c18671d2 100644
--- a/fs/ntfs/ntfs.h
+++ b/fs/ntfs/ntfs.h
@@ -183,6 +183,8 @@ extern const struct inode_operations ntfs_dir_inode_ops;
 extern const struct  file_operations ntfs_empty_file_ops;
 extern const struct inode_operations ntfs_empty_inode_ops;
 
+int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
+
 extern const struct export_operations ntfs_export_ops;
 
 /*
-- 
2.51.0

