Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8466C3C8732
	for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 08:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893129; cv=none; b=m9Mgkvcnp800AXBM7rY48IdWVQVA8E3a74i/y1m032O7zs0I5JmVCu6BAhW8+/k4Kh58J38dOqG6giU8evhn0wsrkvT6PHWumQap/8bXYFjwjNHzZMmC1b9GJR3QmNSOG1HOlhzBxMd9Ihs+5uOoYz+iTTfjfS9UhXTy7xFlDBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893129; c=relaxed/simple;
	bh=hEj7I8IgfGqJ/cTL1OJazCZCq/g+2hBc263juLIj6/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/paneFXqw9lBiXSVrs4qkDvri1LYMSJ+JxQlZXE/kAuAqqV2VnbknCEYk0luqUUvLX8Fs6rJW8w+Us5tyodC6fn0nZJwbnQNWYCnl7ft/wrjagxQiHvOj8bdk5VH3pjNiuTceEn6g2gEyGtu93QsqeOgBGPH92CGUtjFTtBZw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SMytY0MS; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SMytY0MS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=0i
	phEToKxwJp7tGqiPSTQxmduIvvdFiWOZBziqAo1yc=; b=SMytY0MSI1SEczfIRU
	C71P34GIrUkrJL13jYOsqpzq1lOrbEbJT5lUovGavi8CogY/rKoS2HVXTpnpcnB2
	ZWxKpDUDb3+IpDOQdbFpYnsJBNoOLScLcC6CIwXbpIOjXMkdx9CPENEb7wMfAv2Z
	XQiJpT5S4ZXEimmS6K4CpDTOM=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgB3m07lma9qs7GbAQ--.54162S11;
	Sun, 20 Sep 2026 16:31:52 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 09/10] ntfs: persist append-only in the $LXFLAGS EA
Date: Sun, 20 Sep 2026 16:31:30 +0800
Message-ID: <20260920083131.1880061-10-liubaolin12138@163.com>
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
X-CM-TRANSID:PygvCgB3m07lma9qs7GbAQ--.54162S11
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrW5Zw47KF18Jryxtw4kCrg_yoW7JF4xpF
	Z3JFyIg3yrWFyjgrZ2kF4q93WFvws3XF4UArWvgw18AasxJw1ftF1rtF4rGa48CryfC342
	qF45trWUXrW3Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jU18PUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwRgr9WqvmfgMswAA3c

From: Baolin Liu <liubaolin@kylinos.cn>

Extend the persistent fileattr interface to append-only using bit 1
of LXFLAGS. Restore S_APPEND on inode load and update it after successful
EA writes. Include append in the known-bit mask while retaining all other
unknown bits. Reuse the existing VFS capability checks and EA safeguards.

Document append-only alongside immutable. Both flags now survive inode
reclaim and remount without changing the NTFS attribute format.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 Documentation/filesystems/ntfs.rst | 10 +++++-----
 fs/ntfs/ea.c                       |  2 ++
 fs/ntfs/ea.h                       |  4 +++-
 fs/ntfs/file.c                     | 13 ++++++-------
 4 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/Documentation/filesystems/ntfs.rst b/Documentation/filesystems/ntfs.rst
index ced164216a5b..f00b618a3911 100644
--- a/Documentation/filesystems/ntfs.rst
+++ b/Documentation/filesystems/ntfs.rst
@@ -38,21 +38,21 @@ The project is available at:
 Linux file attributes
 =====================
 
-The driver supports lsattr(1) and setting immutable with chattr(1).
-Immutable is stored in bit 0 of a private ``$LXFLAGS`` extended attribute
+The driver supports lsattr(1) and setting immutable and append-only with chattr(1).
+Immutable is stored in bit 0 and append-only in bit 1 of a private ``$LXFLAGS`` extended attribute
 within the standard NTFS ``$EA``/``$EA_INFORMATION`` attributes. Its value
 is a 32-bit little-endian bitmask. Unknown bits are preserved; the entry
-is removed when the entire value becomes zero. The setting survives
+is removed when the entire value becomes zero. These settings survive
 inode eviction, unmount and reboot. Direct writes or removal through
 xattr interfaces are rejected; use chattr(1) instead.
 
 System metadata files and files protected by ``sys_immutable`` cannot
 have their immutable protection cleared. Protection derived solely from
-that policy is not stored in the EA. Compression, encryption, append-only
+that policy is not stored in the EA. Compression, encryption
 and mount-wide case folding are reported but cannot be changed through
 chattr(1).
 
-Windows does not enforce the Linux immutable flag stored in this EA.
+Windows does not enforce the Linux immutable and append-only flags stored in this EA.
 
 Supported mount options
 =======================
diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 1e9b66e88655..ddac912de78c 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -500,6 +500,8 @@ int ntfs_ea_get_lxflags(struct inode *inode)
 	ni->lxflags = le32_to_cpu(value);
 	if (ni->lxflags & NTFS_LXFLAGS_IMMUTABLE)
 		inode->i_flags |= S_IMMUTABLE;
+	if (ni->lxflags & NTFS_LXFLAGS_APPEND)
+		inode->i_flags |= S_APPEND;
 	return 0;
 }
 
diff --git a/fs/ntfs/ea.h b/fs/ntfs/ea.h
index 19aea162b909..eac5ab4da44a 100644
--- a/fs/ntfs/ea.h
+++ b/fs/ntfs/ea.h
@@ -9,7 +9,9 @@
 
 /* $LXFLAGS stores these bits in a single little-endian 32-bit value. */
 #define NTFS_LXFLAGS_IMMUTABLE	BIT(0)
-#define NTFS_LXFLAGS_MASK	NTFS_LXFLAGS_IMMUTABLE
+#define NTFS_LXFLAGS_APPEND	BIT(1)
+#define NTFS_LXFLAGS_MASK	(NTFS_LXFLAGS_IMMUTABLE | \
+				 NTFS_LXFLAGS_APPEND)
 
 extern const struct xattr_handler *const ntfs_xattr_handlers[];
 
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 882d33b67560..5b2a31790275 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -190,7 +190,7 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 {
 	struct inode *vi = d_inode(dentry);
 	struct ntfs_inode *ni = NTFS_I(vi);
-	u32 allowed = FS_IMMUTABLE_FL;
+	u32 allowed = FS_IMMUTABLE_FL | FS_APPEND_FL;
 	u32 readonly = 0;
 	u32 lxflags = ni->lxflags & ~NTFS_LXFLAGS_MASK;
 	unsigned int new_fl = 0;
@@ -203,11 +203,6 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (fileattr_has_fsx(fa))
 		return -EOPNOTSUPP;
 
-	if ((fa->flags & FS_APPEND_FL) !=
-	    (IS_APPEND(vi) ? FS_APPEND_FL : 0))
-		return -EOPNOTSUPP;
-	allowed |= fa->flags & FS_APPEND_FL;
-
 	/* chattr passes the unchanged read-only flags back to us too. */
 	if (NInoCompressed(ni) || NInoWofCompressed(ni))
 		readonly |= FS_COMPR_FL;
@@ -234,6 +229,10 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 		    (ni->lxflags & NTFS_LXFLAGS_IMMUTABLE))
 			lxflags |= NTFS_LXFLAGS_IMMUTABLE;
 	}
+	if (fa->flags & FS_APPEND_FL) {
+		new_fl |= S_APPEND;
+		lxflags |= NTFS_LXFLAGS_APPEND;
+	}
 
 	mutex_lock(&ni->mrec_lock);
 	err = ntfs_ea_set_lxflags(vi, lxflags);
@@ -241,7 +240,7 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (err)
 		return err;
 
-	inode_set_flags(vi, new_fl, S_IMMUTABLE);
+	inode_set_flags(vi, new_fl, S_IMMUTABLE | S_APPEND);
 	inode_set_ctime_current(vi);
 	mark_inode_dirty(vi);
 	return 0;
-- 
2.51.0

