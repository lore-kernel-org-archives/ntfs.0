Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E8E17B50A
	for <ntfs@lists.linux.dev>; Wed, 23 Sep 2026 06:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143416; cv=none; b=CcfN1J0cAdBYaBHZwVeWpsbDUzNlYtr1AYSOj+xPTs3S0eZAmTM6PziN/FbqWj4R67o9QTil6K60r0Wv5zF9ndRfLHiE+XN30DNb3LvTuH00hDpAKglVup6oldZ4030i5BryL4cvZsfWxb4tVInuoHG9leEtdV/0ilPaUuJ5fIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143416; c=relaxed/simple;
	bh=eW154vuwCnKz1c7KGfng2fP6i6tTVHMoUQoTPohS0FM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1Gobd8qRyoV8Jt4kR/WaKsTO48e9m5+WwpwqAvyEbIrljyl9hed1a0VXVYRAXnGffYUmP1U1o51kLDTu1hFimX7ANVrwygJY1nJXGIBTCjNcIIMD6toH9nTeFSmKO0d8H63XNU38CLBxV8TU5hqDh42VLrWMTFycVQU6HdGtzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZLDJy1Mm; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZLDJy1Mm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=3U
	NTJfnZWBERJSwwoqadnuJwoSrBHaFkDYINBMhHsH8=; b=ZLDJy1MmBRNzXEEaIt
	z9xrGmGmynYVxuTwfBp+Y+TiWuRH+JKD/B3HSFMd+soXQE2ivF8QXarQ8wzpssBJ
	UGieTv8B8pylcELjSsozIGLL7SEq3sthqtleDFqr09sk1k/pZr2n8f3CfifYs4JT
	nQTtHYrmVAVh9IlCm7i+jZOzY=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCH_E+Ia7NqXdW_Aw--.58316S12;
	Wed, 23 Sep 2026 14:03:09 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 10/10] ntfs: persist nodump in the $LINUXFLAGS EA
Date: Wed, 23 Sep 2026 14:02:46 +0800
Message-ID: <20260923060246.2499192-11-liubaolin12138@163.com>
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
X-CM-TRANSID:PygvCgCH_E+Ia7NqXdW_Aw--.58316S12
X-Coremail-Antispam: 1Uf129KBjvJXoWxKry7CF1xtrWfGrWfZF4ruFg_yoW7CF18pF
	Z3GFyxKw4rXFy7W397CF4UWa1Fvrn3XFWUXr92qw18Aa4DJ3WSqFWfKF4rXa4kCrySk347
	XayUtrWUXFWjv37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4ApnUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwR6JVGqza56+iAAA3Y

From: Baolin Liu <liubaolin@kylinos.cn>

Store nodump in bit 2 of LINUXFLAGS and allow it through fileattr_set.
Report the cached persistent bit through fileattr_get and
STATX_ATTR_NODUMP, including the statx supported-attribute mask. Reuse
the existing EA update and inode-load paths; nodump needs no additional
inode flag enforcement.

Document the complete immutable, append-only and nodump bitmask.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 Documentation/filesystems/ntfs.rst | 34 +++++++++++++++++-------------
 fs/ntfs/ea.h                       |  3 ++-
 fs/ntfs/file.c                     | 11 ++++++++--
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/Documentation/filesystems/ntfs.rst b/Documentation/filesystems/ntfs.rst
index fb9c89b9b493..d305fd4314d2 100644
--- a/Documentation/filesystems/ntfs.rst
+++ b/Documentation/filesystems/ntfs.rst
@@ -38,21 +38,25 @@ The project is available at:
 Linux file attributes
 =====================
 
-The driver supports lsattr(1) and setting immutable and append-only with chattr(1).
-Immutable is stored in bit 0 and append-only in bit 1 of a private ``$LINUXFLAGS`` extended attribute
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
+nodump are stored in a private ``$LINUXFLAGS`` extended attribute within the
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
index b988b39f5f00..8f144fa4f9bb 100644
--- a/fs/ntfs/ea.h
+++ b/fs/ntfs/ea.h
@@ -10,8 +10,9 @@
 /* $LINUXFLAGS stores these bits in a single little-endian 32-bit value. */
 #define NTFS_LINUXFLAGS_IMMUTABLE	BIT(0)
 #define NTFS_LINUXFLAGS_APPEND	BIT(1)
+#define NTFS_LINUXFLAGS_NODUMP	BIT(2)
 #define NTFS_LINUXFLAGS_MASK	(NTFS_LINUXFLAGS_IMMUTABLE | \
-				 NTFS_LINUXFLAGS_APPEND)
+				 NTFS_LINUXFLAGS_APPEND | NTFS_LINUXFLAGS_NODUMP)
 
 extern const struct xattr_handler *const ntfs_xattr_handlers[];
 
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index cda8d02c130e..38309cbd98c2 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -159,6 +159,8 @@ int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 		flags |= FS_IMMUTABLE_FL;
 	if (vi->i_flags & S_APPEND)
 		flags |= FS_APPEND_FL;
+	if (ni->linuxflags & NTFS_LINUXFLAGS_NODUMP)
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
 	u32 linuxflags = ni->linuxflags & ~NTFS_LINUXFLAGS_MASK;
 	unsigned int new_fl = 0;
@@ -233,6 +235,8 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 		new_fl |= S_APPEND;
 		linuxflags |= NTFS_LINUXFLAGS_APPEND;
 	}
+	if (fa->flags & FS_NODUMP_FL)
+		linuxflags |= NTFS_LINUXFLAGS_NODUMP;
 
 	mutex_lock(&ni->mrec_lock);
 	err = ntfs_ea_set_linuxflags(vi, linuxflags);
@@ -507,9 +511,12 @@ int ntfs_getattr(struct mnt_idmap *idmap, const struct path *path,
 
 	if (inode->i_flags & S_APPEND)
 		stat->attributes |= STATX_ATTR_APPEND;
+	if (ni->linuxflags & NTFS_LINUXFLAGS_NODUMP)
+		stat->attributes |= STATX_ATTR_NODUMP;
 
 	stat->attributes_mask |= STATX_ATTR_COMPRESSED | STATX_ATTR_ENCRYPTED |
-				 STATX_ATTR_IMMUTABLE | STATX_ATTR_APPEND;
+				 STATX_ATTR_IMMUTABLE | STATX_ATTR_APPEND |
+				 STATX_ATTR_NODUMP;
 
 	/*
 	 * If it's a compressed or encrypted file, NTFS currently
-- 
2.51.0

