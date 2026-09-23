Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1FE223DE7
	for <ntfs@lists.linux.dev>; Wed, 23 Sep 2026 06:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143411; cv=none; b=UhhCHYU4J6uCdKbAmr56+QWYRsBnpB/JARNZOXh0PwMdBE1YKMiPf6aJwOgMMcRT7R1xdG85OIyIYobwoXmeg5utXN92saqPdqR6w063rZIGNJRymv9U2lXANoSlc4PdLvSq+a7pq1n4Yd1kwt1t6wnwm3y/HufAgVyggJ1fwdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143411; c=relaxed/simple;
	bh=15DA8yMdbjM7OxjcYoVjhAcxAeHnFqKhKTszkfbMUS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYSVN7gOQcqr/y19wV42L/EZMNwYvfPwH4Wk9e6dUkE6h02dFEHcFOJd3c95UxsDRwCt2XaZYRYGbE4laWpnoFCN52cZ9iLwi/VrrigzzQWSOnqM/IUkVcFqRlcOj5dMd5Y5p3td3Cxix89+SjEQUSul80Dy7iCOciYsULjXQi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=I+HsXE+8; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="I+HsXE+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=8d
	dyUdS2m+i5tYUvvE2C4S+itWIORgCVuUU9h54hzLM=; b=I+HsXE+8l3eCSEFG5D
	AoCykIMFpyTi8FUUwWI8T700/yCcfdYYvfD+JPv8qy9dFjYdLes5n2fU78DjTP07
	YkV51NxyCpnwciC0ERyiTGTGSLKKoFgaC7BlXKYf4WeGfQQTz0uXK/UVax3VKQ64
	PGL1CAUNY1/hm7VD9Ajm2Z8U4=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCH_E+Ia7NqXdW_Aw--.58316S10;
	Wed, 23 Sep 2026 14:03:06 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 08/10] ntfs: persist immutable in the $LINUXFLAGS EA
Date: Wed, 23 Sep 2026 14:02:44 +0800
Message-ID: <20260923060246.2499192-9-liubaolin12138@163.com>
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
X-CM-TRANSID:PygvCgCH_E+Ia7NqXdW_Aw--.58316S10
X-Coremail-Antispam: 1Uf129KBjvAXoW3urW8KFykAw1fWF4fCrW5GFg_yoW8JF4Uto
	WS9w13uw4kCry5A3y0k3WxJ3yDWayUCrWxJrW5C3yDCFnIqw1Du3y2gws7uF47Kw15WF45
	J34xXw4rJrW8XF98n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxMa0DUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RqIU2qza5rHZwAA3g

From: Baolin Liu <liubaolin@kylinos.cn>

Add a fileattr setter for immutable and store its state in bit 0 of a
little-endian u32 in the private $LINUXFLAGS EA. Reuse the standard NTFS
EA attributes and restore the flag when loading an inode, so eviction
and unmount do not discard the setting.

Use $LINUXFLAGS to avoid the WSL-owned $LX namespace.

Preserve unknown bits and delete the entry only when the entire value is
zero. Reject malformed values with EUCLEAN. Reject direct xattr writes
and removal to avoid bypassing fileattr permissions or stale cached
state. Update the cached flags only after the EA update succeeds.

Reject clearing immutable on system metadata files and files protected
by sys_immutable, following inode-load policy. Do not persist a bit
derived solely from this policy. Preserve append state without allowing
it to be changed at this stage. Compression, encryption and mount-wide
case folding remain read-only. Document the format and its Linux-only
enforcement.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 Documentation/filesystems/ntfs.rst | 18 +++++-
 fs/ntfs/ea.c                       | 49 ++++++++++++++++
 fs/ntfs/ea.h                       |  6 ++
 fs/ntfs/file.c                     | 90 +++++++++++++++++++++++++++++-
 fs/ntfs/inode.c                    | 12 ++--
 fs/ntfs/inode.h                    |  2 +
 fs/ntfs/namei.c                    |  3 +-
 fs/ntfs/ntfs.h                     |  2 +
 8 files changed, 171 insertions(+), 11 deletions(-)

diff --git a/Documentation/filesystems/ntfs.rst b/Documentation/filesystems/ntfs.rst
index 0a4c43d6c890..173af66ae73f 100644
--- a/Documentation/filesystems/ntfs.rst
+++ b/Documentation/filesystems/ntfs.rst
@@ -38,9 +38,21 @@ The project is available at:
 Linux file attributes
 =====================
 
-The driver supports querying compression, encryption, immutable, append-only
-and mount-wide case folding through lsattr(1). Case folding is reported
-according to the mount options.
+The driver supports lsattr(1) and setting immutable with chattr(1).
+Immutable is stored in bit 0 of a private ``$LINUXFLAGS`` extended attribute
+within the standard NTFS ``$EA``/``$EA_INFORMATION`` attributes. Its value
+is a 32-bit little-endian bitmask. Unknown bits are preserved; the entry
+is removed when the entire value becomes zero. The setting survives
+inode eviction, unmount and reboot. Direct writes or removal through
+xattr interfaces are rejected; use chattr(1) instead.
+
+System metadata files and files protected by ``sys_immutable`` cannot
+have their immutable protection cleared. Protection derived solely from
+that policy is not stored in the EA. Compression, encryption, append-only
+and mount-wide case folding are reported but cannot be changed through
+chattr(1).
+
+Windows does not enforce the Linux immutable flag stored in this EA.
 
 Supported mount options
 =======================
diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 8eafc7b53aab..daa3b430ca76 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -482,6 +482,51 @@ int ntfs_ea_set_wsl_inode(struct inode *inode, dev_t rdev, __le16 *ea_size,
 	return err;
 }
 
+int ntfs_ea_get_linuxflags(struct inode *inode)
+{
+	struct ntfs_inode *ni = NTFS_I(inode);
+	__le32 value;
+	int err;
+
+	err = ntfs_get_ea(inode, "$LINUXFLAGS", sizeof("$LINUXFLAGS") - 1,
+			  &value, sizeof(value));
+	if (err == -ENODATA)
+		return 0;
+	if (err < 0)
+		return err == -ERANGE ? -EUCLEAN : err;
+	if (err != sizeof(value))
+		return -EUCLEAN;
+
+	ni->linuxflags = le32_to_cpu(value);
+	if (ni->linuxflags & NTFS_LINUXFLAGS_IMMUTABLE)
+		inode->i_flags |= S_IMMUTABLE;
+	return 0;
+}
+
+int ntfs_ea_set_linuxflags(struct inode *inode, u32 linuxflags)
+{
+	struct ntfs_inode *ni = NTFS_I(inode);
+	__le32 value;
+	int err;
+
+	if (linuxflags) {
+		value = cpu_to_le32(linuxflags);
+		err = ntfs_set_ea(inode, "$LINUXFLAGS", sizeof("$LINUXFLAGS") - 1,
+				  &value, sizeof(value), 0, NULL);
+	} else if (NInoHasEA(ni)) {
+		err = ntfs_set_ea(inode, "$LINUXFLAGS", sizeof("$LINUXFLAGS") - 1,
+				  NULL, 0, XATTR_REPLACE, NULL);
+		if (err == -ENODATA)
+			err = 0;
+	} else {
+		err = 0;
+	}
+
+	if (!err)
+		ni->linuxflags = linuxflags;
+	return err;
+}
+
 ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 {
 	struct inode *inode = d_inode(dentry);
@@ -852,6 +897,10 @@ static int ntfs_setxattr(const struct xattr_handler *handler,
 	if (NVolShutdown(ni->vol))
 		return -EIO;
 
+	/* Only fileattr_set may change the flags and their cached state. */
+	if (!strcmp(name, "$LINUXFLAGS"))
+		return -EPERM;
+
 	if (ntfs_is_reserved_lxattr(name) && !capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
diff --git a/fs/ntfs/ea.h b/fs/ntfs/ea.h
index acb39c2a6fbc..5ec118e29425 100644
--- a/fs/ntfs/ea.h
+++ b/fs/ntfs/ea.h
@@ -7,6 +7,10 @@
 #define NTFS_EA_GID	BIT(2)
 #define NTFS_EA_MODE	BIT(3)
 
+/* $LINUXFLAGS stores these bits in a single little-endian 32-bit value. */
+#define NTFS_LINUXFLAGS_IMMUTABLE	BIT(0)
+#define NTFS_LINUXFLAGS_MASK	NTFS_LINUXFLAGS_IMMUTABLE
+
 extern const struct xattr_handler *const ntfs_xattr_handlers[];
 
 int ntfs_ea_set_wsl_not_symlink(struct ntfs_inode *ni, mode_t mode, dev_t dev);
@@ -14,6 +18,8 @@ int ntfs_ea_get_wsl_inode(struct inode *inode, dev_t *rdevp, unsigned int flags,
 			  bool *has_lxmod);
 int ntfs_ea_set_wsl_inode(struct inode *inode, dev_t rdev, __le16 *ea_size,
 		unsigned int flags);
+int ntfs_ea_get_linuxflags(struct inode *inode);
+int ntfs_ea_set_linuxflags(struct inode *inode, u32 linuxflags);
 ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size);
 
 #ifdef CONFIG_NTFS_FS_POSIX_ACL
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index e5846bf498b0..135e5be69e77 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -166,6 +166,87 @@ int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	return 0;
 }
 
+static bool ntfs_is_forced_immutable(struct inode *vi)
+{
+	struct ntfs_inode *ni = NTFS_I(vi);
+
+	if (ni->mft_no < FILE_first_user && S_ISREG(vi->i_mode))
+		return true;
+
+	return NVolSysImmutable(ni->vol) &&
+	       (ni->flags & FILE_ATTR_SYSTEM) &&
+	       !S_ISFIFO(vi->i_mode) && !S_ISSOCK(vi->i_mode) &&
+	       !S_ISLNK(vi->i_mode);
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
+	struct ntfs_inode *ni = NTFS_I(vi);
+	u32 allowed = FS_IMMUTABLE_FL;
+	u32 readonly = 0;
+	u32 linuxflags = ni->linuxflags & ~NTFS_LINUXFLAGS_MASK;
+	unsigned int new_fl = 0;
+	bool forced_immutable;
+	int err;
+
+	if (NVolShutdown(ni->vol))
+		return -EIO;
+
+	if (fileattr_has_fsx(fa))
+		return -EOPNOTSUPP;
+
+	if ((fa->flags & FS_APPEND_FL) !=
+	    (IS_APPEND(vi) ? FS_APPEND_FL : 0))
+		return -EOPNOTSUPP;
+	allowed |= fa->flags & FS_APPEND_FL;
+
+	/* chattr passes the unchanged read-only flags back to us too. */
+	if (NInoCompressed(ni) || NInoWofCompressed(ni))
+		readonly |= FS_COMPR_FL;
+	if (NInoEncrypted(ni))
+		readonly |= FS_ENCRYPT_FL;
+	if ((fa->flags ^ readonly) & (FS_COMPR_FL | FS_ENCRYPT_FL))
+		return -EOPNOTSUPP;
+	allowed |= readonly;
+
+	/* Case folding is a read-only, mount-wide property. */
+	if (!NVolCaseSensitive(ni->vol))
+		allowed |= FS_CASEFOLD_FL;
+	if (fa->flags & ~allowed)
+		return -EOPNOTSUPP;
+
+	forced_immutable = ntfs_is_forced_immutable(vi);
+	if (!(fa->flags & FS_IMMUTABLE_FL) && forced_immutable)
+		return -EPERM;
+
+	if (fa->flags & FS_IMMUTABLE_FL) {
+		new_fl |= S_IMMUTABLE;
+		/* Do not persist an immutable bit derived from the mount. */
+		if (!forced_immutable ||
+		    (ni->linuxflags & NTFS_LINUXFLAGS_IMMUTABLE))
+			linuxflags |= NTFS_LINUXFLAGS_IMMUTABLE;
+	}
+
+	mutex_lock(&ni->mrec_lock);
+	err = ntfs_ea_set_linuxflags(vi, linuxflags);
+	mutex_unlock(&ni->mrec_lock);
+	if (err)
+		return err;
+
+	inode_set_flags(vi, new_fl, S_IMMUTABLE);
+	inode_set_ctime_current(vi);
+	mark_inode_dirty(vi);
+	return 0;
+}
+
 /*
  * ntfs_file_fsync - sync a file to disk
  * @filp:	file to be synced
@@ -1264,9 +1345,10 @@ const struct file_operations ntfs_file_ops = {
 };
 
 const struct inode_operations ntfs_file_inode_ops = {
-	.fileattr_get	= ntfs_fileattr_get,
 	.setattr	= ntfs_setattr,
 	.getattr	= ntfs_getattr,
+	.fileattr_get	= ntfs_fileattr_get,
+	.fileattr_set	= ntfs_fileattr_set,
 	.listxattr	= ntfs_listxattr,
 	.get_acl	= ntfs_get_acl,
 	.set_acl	= ntfs_set_acl,
@@ -1274,17 +1356,19 @@ const struct inode_operations ntfs_file_inode_ops = {
 };
 
 const struct inode_operations ntfs_symlink_inode_operations = {
-	.fileattr_get	= ntfs_fileattr_get,
 	.get_link	= ntfs_get_link,
 	.setattr	= ntfs_setattr,
 	.listxattr	= ntfs_listxattr,
+	.fileattr_get	= ntfs_fileattr_get,
+	.fileattr_set	= ntfs_fileattr_set,
 };
 
 const struct inode_operations ntfs_special_inode_operations = {
-	.fileattr_get	= ntfs_fileattr_get,
 	.setattr	= ntfs_setattr,
 	.getattr	= ntfs_getattr,
 	.listxattr	= ntfs_listxattr,
+	.fileattr_get	= ntfs_fileattr_get,
+	.fileattr_set	= ntfs_fileattr_set,
 	.get_acl	= ntfs_get_acl,
 	.set_acl	= ntfs_set_acl,
 };
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 4375ad477809..9240f92b9279 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -498,6 +498,7 @@ void __ntfs_init_inode(struct super_block *sb, struct ntfs_inode *ni)
 	ni->reparse_tag = 0;
 	ni->reparse_flags = 0;
 	ni->target = NULL;
+	ni->linuxflags = 0;
 	ni->i_dealloc_clusters = 0;
 }
 
@@ -669,10 +670,8 @@ void ntfs_set_vfs_operations(struct inode *inode, mode_t mode, dev_t dev)
  * Q: What locks are held when the function is called?
  * A: i_state has I_NEW set, hence the inode is locked, also
  *    i_count is set to 1, so it is not going to go away
- *    i_flags is set to 0 and we have no business touching it.  Only an ioctl()
- *    is allowed to write to them. We should of course be honouring them but
- *    we need to do that using the IS_* macros defined in include/linux/fs.h.
- *    In any case ntfs_read_locked_inode() has nothing to do with i_flags.
+ *    i_flags is initialized from the persisted Linux file attributes and
+ *    the driver's system-file protection policy before publishing the inode.
  *
  * Return 0 on success and -errno on error.
  */
@@ -871,6 +870,11 @@ static int ntfs_read_locked_inode(struct inode *vi)
 	if (!err) {
 		NInoSetHasEA(ni);
 		ntfs_ea_get_wsl_inode(vi, &dev, flags, &has_lxmod);
+		err = ntfs_ea_get_linuxflags(vi);
+		if (err)
+			goto unm_err_out;
+	} else if (err != -ENOENT) {
+		goto unm_err_out;
 	}
 
 	if (ni->flags & FILE_ATTR_REPARSE_POINT) {
diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
index ff61bd402df0..d9168c7eb701 100644
--- a/fs/ntfs/inode.h
+++ b/fs/ntfs/inode.h
@@ -95,6 +95,7 @@ enum ntfs_inode_mutex_lock_class {
  *   belongs.
  * @i_dealloc_clusters: delayed allocated clusters.
  * @target: symlink buffer.
+ * @linuxflags: Linux-specific file attributes loaded from the $LINUXFLAGS EA.
  */
 struct ntfs_inode {
 	rwlock_t size_lock;
@@ -145,6 +146,7 @@ struct ntfs_inode {
 	__le32 reparse_tag;
 	__le32 reparse_flags;
 	char *target;
+	u32 linuxflags;
 };
 
 /*
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index ee451700b766..de326886e046 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1548,7 +1548,6 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
  * Inode operations for directories.
  */
 const struct inode_operations ntfs_dir_inode_ops = {
-	.fileattr_get	= ntfs_fileattr_get,
 	.lookup		= ntfs_lookup,	/* VFS: Lookup directory. */
 	.create		= ntfs_create,
 	.unlink		= ntfs_unlink,
@@ -1560,6 +1559,8 @@ const struct inode_operations ntfs_dir_inode_ops = {
 	.listxattr	= ntfs_listxattr,
 	.setattr	= ntfs_setattr,
 	.getattr	= ntfs_getattr,
+	.fileattr_get	= ntfs_fileattr_get,
+	.fileattr_set	= ntfs_fileattr_set,
 	.symlink	= ntfs_symlink,
 	.mknod		= ntfs_mknod,
 	.link		= ntfs_link,
diff --git a/fs/ntfs/ntfs.h b/fs/ntfs/ntfs.h
index a5c5c18671d2..489bf031d1eb 100644
--- a/fs/ntfs/ntfs.h
+++ b/fs/ntfs/ntfs.h
@@ -184,6 +184,8 @@ extern const struct  file_operations ntfs_empty_file_ops;
 extern const struct inode_operations ntfs_empty_inode_ops;
 
 int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
+int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
+		      struct file_kattr *fa);
 
 extern const struct export_operations ntfs_export_ops;
 
-- 
2.51.0

