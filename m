Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D563C8732
	for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 08:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893127; cv=none; b=AWe1+6b9cE68U/3tpy9DqZ2IntHwsGZAZ2CJ5T4k6rnZ8ENXba+BvlTxa+8TJzsKjm8sA/mSX1Ufc0G8hcQP5fQ72ksoeHG/0fwHNA5+tbz7BbODbIGhCZ62Fba+FIaExK22xPMyqA/fUy0ClaeiW1MpmSggLVAikHiFgw+tiAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893127; c=relaxed/simple;
	bh=OAk+ZZyO/WsyeGMYR/MQlroUkxN57pM03f4R2zSzQmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sD5zN9SFteR8wUtOCqLf8MaD7A11J3SxGM6LsIvfDJSM8FGECCX3tllbKkgzRSluOApi7XvISUcdgT0x028t842gJTVo7NW+I7xGMdWnxsEKeKCTtqsnLQJBYXedB9N3/XnxC58XEOTAOLzeXacWywiWv1EHjGbOYONyeR1D6kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lrD2a/gE; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lrD2a/gE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=RQ
	K/MZMQWWwOZGtI4bGVeoefpm14oEciDO4il997Sfo=; b=lrD2a/gEdXc0XEQrqE
	YWc200UNY/9lOgTR72U1S/mYdgoW+dzbhyT3Kz6ZyzGEgRp/aLF+Rd9QT3VtbTrB
	UWVDA7zWoahLuQ8PCbm4bJzoyPbxJg9GieTO4VVrWmVXYkzo2H1L7aXQ3yYg0WUM
	dhzorxQdSHFNf4MpROn+KMJPg=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgB3m07lma9qs7GbAQ--.54162S10;
	Sun, 20 Sep 2026 16:31:50 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 08/10] ntfs: persist immutable in the $LXFLAGS EA
Date: Sun, 20 Sep 2026 16:31:29 +0800
Message-ID: <20260920083131.1880061-9-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260920083131.1880061-1-liubaolin12138@163.com>
References: <20260920083131.1880061-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgB3m07lma9qs7GbAQ--.54162S10
X-Coremail-Antispam: 1Uf129KBjvAXoW3urW8KFykAw1fWF4fCrW5GFg_yoW8JrWUJo
	WS9r13uws5ury5A3yFk3WxtayDWayUCrWxJ3y5C3yDCFnIqw1Duw17Ww43uF47Ww1F9Fn8
	J34xXw4rJFW8XF98n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx6RRDUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Rcq9GqvmfezHAAA3k

From: Baolin Liu <liubaolin@kylinos.cn>

Add a fileattr setter for immutable and store its state in bit 0 of a
little-endian u32 in the private $LXFLAGS EA. Reuse the standard NTFS EA
attributes and restore the flag when loading an inode, so eviction and
unmount do not discard the setting.

Preserve unknown bits and delete the entry only when the entire value
is zero. Reject malformed values with EUCLEAN. Reject direct xattr writes
and removal to avoid bypassing fileattr permissions or stale cached state.
Update the cached flags only after the EA update succeeds.

Reject clearing immutable on system metadata files and files protected
by sys_immutable, following inode-load policy. Do not persist a bit derived
solely from this policy. Preserve append state without allowing it to be
changed at this stage. Compression, encryption and mount-wide case folding
remain read-only. Document the format and its Linux-only enforcement.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
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
index 0a4c43d6c890..ced164216a5b 100644
--- a/Documentation/filesystems/ntfs.rst
+++ b/Documentation/filesystems/ntfs.rst
@@ -38,9 +38,21 @@ The project is available at:
 Linux file attributes
 =====================
 
-The driver supports querying compression, encryption, immutable, append-only
-and mount-wide case folding through lsattr(1). Case folding is reported
-according to the mount options.
+The driver supports lsattr(1) and setting immutable with chattr(1).
+Immutable is stored in bit 0 of a private ``$LXFLAGS`` extended attribute
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
index 888b531e8174..1e9b66e88655 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -482,6 +482,51 @@ int ntfs_ea_set_wsl_inode(struct inode *inode, dev_t rdev, __le16 *ea_size,
 	return err;
 }
 
+int ntfs_ea_get_lxflags(struct inode *inode)
+{
+	struct ntfs_inode *ni = NTFS_I(inode);
+	__le32 value;
+	int err;
+
+	err = ntfs_get_ea(inode, "$LXFLAGS", sizeof("$LXFLAGS") - 1,
+			  &value, sizeof(value));
+	if (err == -ENODATA)
+		return 0;
+	if (err < 0)
+		return err == -ERANGE ? -EUCLEAN : err;
+	if (err != sizeof(value))
+		return -EUCLEAN;
+
+	ni->lxflags = le32_to_cpu(value);
+	if (ni->lxflags & NTFS_LXFLAGS_IMMUTABLE)
+		inode->i_flags |= S_IMMUTABLE;
+	return 0;
+}
+
+int ntfs_ea_set_lxflags(struct inode *inode, u32 lxflags)
+{
+	struct ntfs_inode *ni = NTFS_I(inode);
+	__le32 value;
+	int err;
+
+	if (lxflags) {
+		value = cpu_to_le32(lxflags);
+		err = ntfs_set_ea(inode, "$LXFLAGS", sizeof("$LXFLAGS") - 1,
+				  &value, sizeof(value), 0, NULL);
+	} else if (NInoHasEA(ni)) {
+		err = ntfs_set_ea(inode, "$LXFLAGS", sizeof("$LXFLAGS") - 1,
+				  NULL, 0, XATTR_REPLACE, NULL);
+		if (err == -ENODATA)
+			err = 0;
+	} else {
+		err = 0;
+	}
+
+	if (!err)
+		ni->lxflags = lxflags;
+	return err;
+}
+
 ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 {
 	struct inode *inode = d_inode(dentry);
@@ -858,6 +903,10 @@ static int ntfs_setxattr(const struct xattr_handler *handler,
 	if (NVolShutdown(ni->vol))
 		return -EIO;
 
+	/* Only fileattr_set may change the flags and their cached state. */
+	if (!strcmp(name, "$LXFLAGS"))
+		return -EPERM;
+
 	if (ntfs_is_reserved_lxattr(name) && !capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
diff --git a/fs/ntfs/ea.h b/fs/ntfs/ea.h
index acb39c2a6fbc..19aea162b909 100644
--- a/fs/ntfs/ea.h
+++ b/fs/ntfs/ea.h
@@ -7,6 +7,10 @@
 #define NTFS_EA_GID	BIT(2)
 #define NTFS_EA_MODE	BIT(3)
 
+/* $LXFLAGS stores these bits in a single little-endian 32-bit value. */
+#define NTFS_LXFLAGS_IMMUTABLE	BIT(0)
+#define NTFS_LXFLAGS_MASK	NTFS_LXFLAGS_IMMUTABLE
+
 extern const struct xattr_handler *const ntfs_xattr_handlers[];
 
 int ntfs_ea_set_wsl_not_symlink(struct ntfs_inode *ni, mode_t mode, dev_t dev);
@@ -14,6 +18,8 @@ int ntfs_ea_get_wsl_inode(struct inode *inode, dev_t *rdevp, unsigned int flags,
 			  bool *has_lxmod);
 int ntfs_ea_set_wsl_inode(struct inode *inode, dev_t rdev, __le16 *ea_size,
 		unsigned int flags);
+int ntfs_ea_get_lxflags(struct inode *inode);
+int ntfs_ea_set_lxflags(struct inode *inode, u32 lxflags);
 ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size);
 
 #ifdef CONFIG_NTFS_FS_POSIX_ACL
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index e5846bf498b0..882d33b67560 100644
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
+	u32 lxflags = ni->lxflags & ~NTFS_LXFLAGS_MASK;
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
+		    (ni->lxflags & NTFS_LXFLAGS_IMMUTABLE))
+			lxflags |= NTFS_LXFLAGS_IMMUTABLE;
+	}
+
+	mutex_lock(&ni->mrec_lock);
+	err = ntfs_ea_set_lxflags(vi, lxflags);
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
index 4375ad477809..6841dbc18a20 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -498,6 +498,7 @@ void __ntfs_init_inode(struct super_block *sb, struct ntfs_inode *ni)
 	ni->reparse_tag = 0;
 	ni->reparse_flags = 0;
 	ni->target = NULL;
+	ni->lxflags = 0;
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
+		err = ntfs_ea_get_lxflags(vi);
+		if (err)
+			goto unm_err_out;
+	} else if (err != -ENOENT) {
+		goto unm_err_out;
 	}
 
 	if (ni->flags & FILE_ATTR_REPARSE_POINT) {
diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
index ff61bd402df0..2968ffa92eb0 100644
--- a/fs/ntfs/inode.h
+++ b/fs/ntfs/inode.h
@@ -95,6 +95,7 @@ enum ntfs_inode_mutex_lock_class {
  *   belongs.
  * @i_dealloc_clusters: delayed allocated clusters.
  * @target: symlink buffer.
+ * @lxflags: Linux-specific file attributes loaded from the $LXFLAGS EA.
  */
 struct ntfs_inode {
 	rwlock_t size_lock;
@@ -145,6 +146,7 @@ struct ntfs_inode {
 	__le32 reparse_tag;
 	__le32 reparse_flags;
 	char *target;
+	u32 lxflags;
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

