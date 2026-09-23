Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91A03F65E0
	for <ntfs@lists.linux.dev>; Wed, 23 Sep 2026 06:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143415; cv=none; b=r3i9bqw8/pYO8Re/Q9ZzZ7gel09JT0Y9JmSJQgme7BofHOrvu+aOHmj+5Yj9pO6AYYP/0F885yVKTfEvrGst/yMQrt/Fuu4aWosj/wu3/CMoTkAgh8Eh1nGNCTw4Wk/N8K0mw+OXD0f5q7kCyVbJwm7QaA5TRFAPICj7onueIlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143415; c=relaxed/simple;
	bh=NBhoAf2O5JIjgNEdkMTlfN2KwkGjIFkeMJAxZaJ1vlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikVWddRc4LPejny1EC7QfkhPIWVxsSU8sspbnmzrU0ROsN3vRr+Gm19SdkRMB0f/Woa+9k80dRY1aL1bwbaKJNOcvsVdoKnlTMrNN5dnzAXsNRuKSpT664Xt8tmex3DSRYR0gbC+VQsh1tZGJHQ3gRCHUWJRPtpt24c36AQrejc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nWCtjaGA; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nWCtjaGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=V0
	qO9ft2lJyJhqr2pcv48scKfPx+JP0jGXG9uoDqQv8=; b=nWCtjaGAI0GxEz62A8
	8UBDEz2MocrF3YVoqAcceun+hBQNSXWkwwbtMICYQW+U0fu2sDJNHeSVxszm6/gV
	f7+0xoTDS1/8kFKHh+jS2M8iOuLDYyc0JbwRCublCRXRs3ix9oTGBLGLm8zdHUtY
	pusrlmAoZ51GQnCHoOfnHGBgU=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCH_E+Ia7NqXdW_Aw--.58316S11;
	Wed, 23 Sep 2026 14:03:08 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 09/10] ntfs: persist append-only in the $LINUXFLAGS EA
Date: Wed, 23 Sep 2026 14:02:45 +0800
Message-ID: <20260923060246.2499192-10-liubaolin12138@163.com>
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
X-CM-TRANSID:PygvCgCH_E+Ia7NqXdW_Aw--.58316S11
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr1Dtr15uF1UuFy8WFykZrb_yoW7Gw18pa
	93JFyIgw4rW342grZ2kF4UW3WFvwn3XFWUArWvgw18AasxAw1SqF4ftF4rW3W8GFyfCry2
	ga15trWUXrW8Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjq2_UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhyJVGqza5zHwwAA3p

From: Baolin Liu <liubaolin@kylinos.cn>

Extend the persistent fileattr interface to append-only using bit 1 of
LINUXFLAGS. Restore S_APPEND on inode load and update it after
successful EA writes. Include append in the known-bit mask while
retaining all other unknown bits. Reuse the existing VFS capability
checks and EA safeguards.

Document append-only alongside immutable. Both flags now survive inode
reclaim and remount without changing the NTFS attribute format.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 Documentation/filesystems/ntfs.rst | 10 +++++-----
 fs/ntfs/ea.c                       |  2 ++
 fs/ntfs/ea.h                       |  4 +++-
 fs/ntfs/file.c                     | 13 ++++++-------
 4 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/Documentation/filesystems/ntfs.rst b/Documentation/filesystems/ntfs.rst
index 173af66ae73f..fb9c89b9b493 100644
--- a/Documentation/filesystems/ntfs.rst
+++ b/Documentation/filesystems/ntfs.rst
@@ -38,21 +38,21 @@ The project is available at:
 Linux file attributes
 =====================
 
-The driver supports lsattr(1) and setting immutable with chattr(1).
-Immutable is stored in bit 0 of a private ``$LINUXFLAGS`` extended attribute
+The driver supports lsattr(1) and setting immutable and append-only with chattr(1).
+Immutable is stored in bit 0 and append-only in bit 1 of a private ``$LINUXFLAGS`` extended attribute
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
index daa3b430ca76..4c99743c4dee 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -500,6 +500,8 @@ int ntfs_ea_get_linuxflags(struct inode *inode)
 	ni->linuxflags = le32_to_cpu(value);
 	if (ni->linuxflags & NTFS_LINUXFLAGS_IMMUTABLE)
 		inode->i_flags |= S_IMMUTABLE;
+	if (ni->linuxflags & NTFS_LINUXFLAGS_APPEND)
+		inode->i_flags |= S_APPEND;
 	return 0;
 }
 
diff --git a/fs/ntfs/ea.h b/fs/ntfs/ea.h
index 5ec118e29425..b988b39f5f00 100644
--- a/fs/ntfs/ea.h
+++ b/fs/ntfs/ea.h
@@ -9,7 +9,9 @@
 
 /* $LINUXFLAGS stores these bits in a single little-endian 32-bit value. */
 #define NTFS_LINUXFLAGS_IMMUTABLE	BIT(0)
-#define NTFS_LINUXFLAGS_MASK	NTFS_LINUXFLAGS_IMMUTABLE
+#define NTFS_LINUXFLAGS_APPEND	BIT(1)
+#define NTFS_LINUXFLAGS_MASK	(NTFS_LINUXFLAGS_IMMUTABLE | \
+				 NTFS_LINUXFLAGS_APPEND)
 
 extern const struct xattr_handler *const ntfs_xattr_handlers[];
 
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 135e5be69e77..cda8d02c130e 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -190,7 +190,7 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 {
 	struct inode *vi = d_inode(dentry);
 	struct ntfs_inode *ni = NTFS_I(vi);
-	u32 allowed = FS_IMMUTABLE_FL;
+	u32 allowed = FS_IMMUTABLE_FL | FS_APPEND_FL;
 	u32 readonly = 0;
 	u32 linuxflags = ni->linuxflags & ~NTFS_LINUXFLAGS_MASK;
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
 		    (ni->linuxflags & NTFS_LINUXFLAGS_IMMUTABLE))
 			linuxflags |= NTFS_LINUXFLAGS_IMMUTABLE;
 	}
+	if (fa->flags & FS_APPEND_FL) {
+		new_fl |= S_APPEND;
+		linuxflags |= NTFS_LINUXFLAGS_APPEND;
+	}
 
 	mutex_lock(&ni->mrec_lock);
 	err = ntfs_ea_set_linuxflags(vi, linuxflags);
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

