Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4DD4746BE
	for <ntfs@lists.linux.dev>; Tue,  1 Sep 2026 09:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254146; cv=none; b=XOk/w6xU5ZWYpKkgy6PQK4e0CTkZ/AdWSbES5QECbv6VYWybz0NyC0jDSrbI7tAyW/fb+G4Z42Bnw3lsx3HuEexoPDiQz8D5jeomi2yNjRGhG7xxI/TcWV17ZF0z3ImABMN8w7sfO+QQhxZgLRE6cDuQQ8lLNV5iZVJ81PFNIPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254146; c=relaxed/simple;
	bh=e+TnL+Hjy0zOw8pk2BwP+QadpoM/zU7FgWPSM7/hgec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R0gDFnIZI8ioGxZSKwHNrvjlQrwhoIi0SmP7vN+xDZBfrG04BauacV4+x0HPbCrtUenXx9Tayae4Fgl/SlhQ5jEW52Ei3Lm+sQbYRKlC6VtAKT2Te4rZ+t4B7GTPDWVi1eiz/ehjBng3/fyWLTz7Cv/z4Etwt/7iZc6W9YfPRA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZB7FHVbY; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZB7FHVbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=D2
	QWu7eHZZMS4ZOhJkjuAzZd0y97wwL2svj4oicLWM0=; b=ZB7FHVbYGfNR8TlGBs
	flKuFryg29AXBITQAKfiWRMynmh/KawQYX3FPkFOHKboTuY+WvRWjPSJcMIR7SXm
	OU5HD5PCmMVr3j8imaisYaV3kc3ppXEGaaS4mcYTC77OSE21MW3HrOrWKksxA8j+
	LCC1qkJpAkpevh81NLxIJaRPE=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDXmJ6pl5ZqstwpQw--.142S3;
	Tue, 01 Sep 2026 17:15:29 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH 1/2] ntfs: implement fileattr_get and fileattr_set
Date: Tue,  1 Sep 2026 17:15:17 +0800
Message-ID: <20260901091519.2885376-2-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260901091519.2885376-1-liubaolin12138@163.com>
References: <20260901091519.2885376-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXmJ6pl5ZqstwpQw--.142S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF1Utw4UJw4DuFWkKw43GFg_yoWrXFy8pa
	n3JFyrGw4fWry2g39akFWUu3WF9w1xXr4UZry7W34IyFnrtryxKryfKF1rCF1rtrZ5CrnF
	gF1UtrWUCF13Zw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRY9aDUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhFSHWqWl7FiZQAA3B

From: Baolin Liu <liubaolin@kylinos.cn>

Wire up the fileattr inode operations so that lsattr(1) and chattr(1)
work on ntfs.

fileattr_get reports the compressed and encrypted state of the attribute
and the immutable and append-only flags, the same states ntfs_getattr()
already reports through STATX_ATTR_*.

fileattr_set accepts only FS_IMMUTABLE_FL and FS_APPEND_FL. Compression
and encryption are rejected because changing them would require
rewriting the attribute data. Both accepted flags go to inode->i_flags,
so the VFS enforces them.

Neither flag has an on-disk representation of its own, so a value set
through fileattr_set only lives for the lifetime of the mount. Note also
that S_IMMUTABLE is re-derived on every mount, from FILE_ATTR_SYSTEM when
mounted with sys_immutable and unconditionally for system files, so
clearing it on such a file does not survive a remount either.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/file.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ntfs/ntfs.h |  4 ++++
 2 files changed, 60 insertions(+)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 1969e4f444f7..b7a0fb2d8229 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -15,6 +15,7 @@
 #include <linux/posix_acl_xattr.h>
 #include <linux/compat.h>
 #include <linux/falloc.h>
+#include <linux/fileattr.h>
 
 #include "lcnalloc.h"
 #include "ntfs.h"
@@ -135,6 +136,59 @@ static int ntfs_file_release(struct inode *vi, struct file *filp)
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
+	if (NInoCompressed(ni) || NInoWofCompressed(ni))
+		flags |= FS_COMPR_FL;
+	if (NInoEncrypted(ni))
+		flags |= FS_ENCRYPT_FL;
+	if (vi->i_flags & S_IMMUTABLE)
+		flags |= FS_IMMUTABLE_FL;
+	if (vi->i_flags & S_APPEND)
+		flags |= FS_APPEND_FL;
+
+	fileattr_fill_flags(fa, flags);
+	return 0;
+}
+
+/*
+ * ntfs_fileattr_set - inode_operations::fileattr_set
+ * @idmap:	idmap of the mount @dentry was found from
+ * @dentry:	dentry to set the flags of
+ * @fa:		flags to set
+ */
+int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
+		      struct file_kattr *fa)
+{
+	struct inode *vi = d_inode(dentry);
+	unsigned int new_fl = 0;
+
+	if (fileattr_has_fsx(fa))
+		return -EOPNOTSUPP;
+	if (fa->flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL))
+		return -EOPNOTSUPP;
+
+	if (fa->flags & FS_IMMUTABLE_FL)
+		new_fl |= S_IMMUTABLE;
+	if (fa->flags & FS_APPEND_FL)
+		new_fl |= S_APPEND;
+
+	inode_set_flags(vi, new_fl, S_IMMUTABLE | S_APPEND);
+
+	inode_set_ctime_current(vi);
+	mark_inode_dirty(vi);
+	return 0;
+}
+
 /*
  * ntfs_file_fsync - sync a file to disk
  * @filp:	file to be synced
@@ -1215,6 +1269,8 @@ const struct file_operations ntfs_file_ops = {
 const struct inode_operations ntfs_file_inode_ops = {
 	.setattr	= ntfs_setattr,
 	.getattr	= ntfs_getattr,
+	.fileattr_get	= ntfs_fileattr_get,
+	.fileattr_set	= ntfs_fileattr_set,
 	.listxattr	= ntfs_listxattr,
 	.get_acl	= ntfs_get_acl,
 	.set_acl	= ntfs_set_acl,
diff --git a/fs/ntfs/ntfs.h b/fs/ntfs/ntfs.h
index 45f77848a9cf..6a8d5c1aeedc 100644
--- a/fs/ntfs/ntfs.h
+++ b/fs/ntfs/ntfs.h
@@ -183,6 +183,10 @@ extern const struct inode_operations ntfs_dir_inode_ops;
 extern const struct  file_operations ntfs_empty_file_ops;
 extern const struct inode_operations ntfs_empty_inode_ops;
 
+extern int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
+extern int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
+			     struct file_kattr *fa);
+
 extern const struct export_operations ntfs_export_ops;
 
 /*
-- 
2.51.0

