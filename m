Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C091F34A3BF
	for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893146; cv=none; b=CNlWnY4B1eGR9UpnuCARirxSGQEq5+22xf3lpS/BSwoBw2TI3lLcMtJB99WaaeexLSCBgXySzCmK/aQiWRmgkvaXhGtWXJrWjYwblTEtz0AhYT6YQ0TV5o/ojUCg7Mu+TsdSORyXHk9bkaQ/BQb/aEvSNde6Z1uxZ6kD7cKDr1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893146; c=relaxed/simple;
	bh=kBh7AbZYNmKoXkGK12cwDvQlee8zECCwGA2jplrh6Us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IdI3S2cB0+KQEo3hYxYTg6j+1RIIBWRfOvcxDedR5opkc9c58tXpJqUzxH93ViKLK4WuuyNEh68Eox7/Tvoksa12vtrBIc19ZaONTQxIg3gEwVM1FvkyzMpWE6W76gOOQwBdmXh0EInnAYVJb5wFaR+x+AmTzuaBXMXDWvkw8Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IEKZ0UGj; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IEKZ0UGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=w1
	v8rrx+E6za1gVQbjxg4L9ygBuJSLjc6UDn0w5PHOs=; b=IEKZ0UGjL7AmWfCWgQ
	BetnwipjAg0VN7hTAU6kCDIQm4jDJtayIXTmwVu+TYQLMdt85KrH74U849q2h9jc
	0vjg1eRG2SBcDeGN9H8+jf2rQvDCyHGcgMjGxWEykXscbVvROdgLJmZFw2KEESJ3
	qPrXaacAiBmaR5im9LWcZL1Vk=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgB3m07lma9qs7GbAQ--.54162S12;
	Sun, 20 Sep 2026 16:31:54 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 10/10] ntfs: persist nodump in the $LXFLAGS EA
Date: Sun, 20 Sep 2026 16:31:31 +0800
Message-ID: <20260920083131.1880061-11-liubaolin12138@163.com>
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
X-CM-TRANSID:PygvCgB3m07lma9qs7GbAQ--.54162S12
X-Coremail-Antispam: 1Uf129KBjvJXoWxKry7CF1xtrWfGrWfAFy3twb_yoW7Ary7pF
	Z3GFyxKw4FqFy7K397Cr4j9a1Fvrs3ZF4UXr92gw18Aas8J3WSqrySyF4rXa4kCr1Sk342
	qF4UtrWUZFWYvwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcrc-UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhor9WqvmfokgAAA3E

From: Baolin Liu <liubaolin@kylinos.cn>

Store nodump in bit 2 of LXFLAGS and allow it through fileattr_set.
Report the cached persistent bit through fileattr_get and
STATX_ATTR_NODUMP, including the statx supported-attribute mask. Reuse
the existing EA update and inode-load paths; nodump needs no additional
inode flag enforcement.

Document the complete immutable, append-only and nodump bitmask.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 Documentation/filesystems/ntfs.rst | 34 +++++++++++++++++-------------
 fs/ntfs/ea.h                       |  3 ++-
 fs/ntfs/file.c                     | 11 ++++++++--
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/Documentation/filesystems/ntfs.rst b/Documentation/filesystems/ntfs.rst
index f00b618a3911..8b71bc6fca81 100644
--- a/Documentation/filesystems/ntfs.rst
+++ b/Documentation/filesystems/ntfs.rst
@@ -38,21 +38,25 @@ The project is available at:
 Linux file attributes
 =====================
 
-The driver supports lsattr(1) and setting immutable and append-only with chattr(1).
-Immutable is stored in bit 0 and append-only in bit 1 of a private ``$LXFLAGS`` extended attribute
-within the standard NTFS ``$EA``/``$EA_INFORMATION`` attributes. Its value
-is a 32-bit little-endian bitmask. Unknown bits are preserved; the entry
-is removed when the entire value becomes zero. These settings survive
-inode eviction, unmount and reboot. Direct writes or removal through
-xattr interfaces are rejected; use chattr(1) instead.
-
-System metadata files and files protected by ``sys_immutable`` cannot
-have their immutable protection cleared. Protection derived solely from
-that policy is not stored in the EA. Compression, encryption
-and mount-wide case folding are reported but cannot be changed through
-chattr(1).
-
-Windows does not enforce the Linux immutable and append-only flags stored in this EA.
+The driver supports lsattr(1) and chattr(1). Immutable, append-only and
+nodump are stored in a private ``$LXFLAGS`` extended attribute within the
+standard NTFS ``$EA``/``$EA_INFORMATION`` attributes. Its value is a
+32-bit little-endian bitmask: bit 0 is immutable, bit 1 is append-only,
+and bit 2 is nodump. Unknown bits are preserved when updating the flags;
+the entry is removed when the entire value becomes zero. These settings
+survive inode eviction, unmount and reboot. Direct writes to this EA
+through setxattr(2) or removexattr(2) are rejected; use chattr(1) instead.
+
+System metadata files and files protected by the ``sys_immutable`` mount
+option cannot have their immutable protection cleared with chattr(1).
+Protection derived solely from the mount option is not stored in the EA.
+Case folding is reported according to the mount options and cannot be
+configured per file. Compression and encryption are reported but cannot
+be changed through chattr(1).
+
+These Linux flags are enforced by Linux. Storing them in an NTFS EA does
+not make Windows enforce immutable, append-only or nodump semantics.
+
 
 Supported mount options
 =======================
diff --git a/fs/ntfs/ea.h b/fs/ntfs/ea.h
index eac5ab4da44a..d66cdb4e2fe1 100644
--- a/fs/ntfs/ea.h
+++ b/fs/ntfs/ea.h
@@ -10,8 +10,9 @@
 /* $LXFLAGS stores these bits in a single little-endian 32-bit value. */
 #define NTFS_LXFLAGS_IMMUTABLE	BIT(0)
 #define NTFS_LXFLAGS_APPEND	BIT(1)
+#define NTFS_LXFLAGS_NODUMP	BIT(2)
 #define NTFS_LXFLAGS_MASK	(NTFS_LXFLAGS_IMMUTABLE | \
-				 NTFS_LXFLAGS_APPEND)
+				 NTFS_LXFLAGS_APPEND | NTFS_LXFLAGS_NODUMP)
 
 extern const struct xattr_handler *const ntfs_xattr_handlers[];
 
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 5b2a31790275..421dfa34ee7f 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -159,6 +159,8 @@ int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 		flags |= FS_IMMUTABLE_FL;
 	if (vi->i_flags & S_APPEND)
 		flags |= FS_APPEND_FL;
+	if (ni->lxflags & NTFS_LXFLAGS_NODUMP)
+		flags |= FS_NODUMP_FL;
 	if (!NVolCaseSensitive(ni->vol))
 		flags |= FS_CASEFOLD_FL;
 
@@ -190,7 +192,7 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 {
 	struct inode *vi = d_inode(dentry);
 	struct ntfs_inode *ni = NTFS_I(vi);
-	u32 allowed = FS_IMMUTABLE_FL | FS_APPEND_FL;
+	u32 allowed = FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL;
 	u32 readonly = 0;
 	u32 lxflags = ni->lxflags & ~NTFS_LXFLAGS_MASK;
 	unsigned int new_fl = 0;
@@ -233,6 +235,8 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 		new_fl |= S_APPEND;
 		lxflags |= NTFS_LXFLAGS_APPEND;
 	}
+	if (fa->flags & FS_NODUMP_FL)
+		lxflags |= NTFS_LXFLAGS_NODUMP;
 
 	mutex_lock(&ni->mrec_lock);
 	err = ntfs_ea_set_lxflags(vi, lxflags);
@@ -507,9 +511,12 @@ int ntfs_getattr(struct mnt_idmap *idmap, const struct path *path,
 
 	if (inode->i_flags & S_APPEND)
 		stat->attributes |= STATX_ATTR_APPEND;
+	if (ni->lxflags & NTFS_LXFLAGS_NODUMP)
+		stat->attributes |= STATX_ATTR_NODUMP;
 
 	stat->attributes_mask |= STATX_ATTR_COMPRESSED | STATX_ATTR_ENCRYPTED |
-				 STATX_ATTR_IMMUTABLE | STATX_ATTR_APPEND;
+				 STATX_ATTR_IMMUTABLE | STATX_ATTR_APPEND |
+				 STATX_ATTR_NODUMP;
 
 	/*
 	 * If it's a compressed or encrypted file, NTFS currently
-- 
2.51.0

