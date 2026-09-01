Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA36246D570
	for <ntfs@lists.linux.dev>; Tue,  1 Sep 2026 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254148; cv=none; b=bPHcXKznX1l5trcPZFz0Llm4kZ6e/H/VyMgXmYo0tm7Ozv61gC3eTNlyKhJ00cLAS/49ej+2o+o5ietEPqIIlvrRRlgIngFelg7ojDRFRrPo+3hYfiR+0zrGCgnDZZ3iPklTfE23FZD+QiPJWI5UvijBgSRrG1vUo9GDfXRSA8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254148; c=relaxed/simple;
	bh=QYFtU56wHUIHz9DqB9/4PCaSfSoLvAsDwkg+srcbm7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bblFt24EAicvyM3uAOl7HIbnCteWWL3A6qHHrM9L87vIPvLVRk9eE7vLP8nUiKvchjruRF2uWGBswBgun3DxcM+gaAo2LbNX0APW38lDbsLA7kREZvvTK5zROyubWmoJaz4PKCvwMXrynqciimCWdCQjTSYRb/fKSpLgXO9Jmwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nhgXXPI9; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nhgXXPI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=VX
	5Cuk3BS+hb9L7FUjA0yrHAyqJD41h0HN4osJ2eN5s=; b=nhgXXPI9Ks84rYMzio
	CEgTm/Xg/Bkr+jQDNcyN3z9Vnd1bFnp/gf/LBJeedEO75EqspnFyyTLmCr/GpEiN
	5pYJ/Z4SwjNGvUBINdpXuvYPP37zq9YzQ1pHXxClQsA+I4JvfqFzJ2OkUDSiD2zS
	CvQEhSj0zcSYNwcuSiROTgMK0=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDXmJ6pl5ZqstwpQw--.142S4;
	Tue, 01 Sep 2026 17:15:31 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH 2/2] ntfs: support the nodump flag
Date: Tue,  1 Sep 2026 17:15:18 +0800
Message-ID: <20260901091519.2885376-3-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wDXmJ6pl5ZqstwpQw--.142S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw1ktF43WF43GFyfAr1UKFg_yoW5Wr4kpF
	Z3JFyfGa18Wry2grZ29r4jg3W0yanrGrWUurW5Aw1Iy3ZxJr1aqFySk3W0grnYqrWku342
	qFyUt3yUAFW2937anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR8hL8UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwRRTHmqWl7RmCAAA3p

From: Baolin Liu <liubaolin@kylinos.cn>

Add FS_NODUMP_FL to the flags fileattr_set accepts, so that chattr +d
works, and report it back from both fileattr_get and ntfs_getattr(), the
latter as STATX_ATTR_NODUMP.

The flag is advisory: it only tells backup tools such as dump(8) to skip
the file, so the driver merely has to remember it. NTFS has no on-disk
attribute for it, so it is kept in a new ntfs_inode field and lives for
the lifetime of the mount. ntfs3 does the same.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/file.c  | 11 +++++++++--
 fs/ntfs/inode.c |  1 +
 fs/ntfs/inode.h |  1 +
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index b7a0fb2d8229..2ff1d2c74343 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -155,6 +155,8 @@ int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 		flags |= FS_IMMUTABLE_FL;
 	if (vi->i_flags & S_APPEND)
 		flags |= FS_APPEND_FL;
+	if (ni->nodump)
+		flags |= FS_NODUMP_FL;
 
 	fileattr_fill_flags(fa, flags);
 	return 0;
@@ -174,7 +176,7 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 
 	if (fileattr_has_fsx(fa))
 		return -EOPNOTSUPP;
-	if (fa->flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL))
+	if (fa->flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL))
 		return -EOPNOTSUPP;
 
 	if (fa->flags & FS_IMMUTABLE_FL)
@@ -183,6 +185,7 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 		new_fl |= S_APPEND;
 
 	inode_set_flags(vi, new_fl, S_IMMUTABLE | S_APPEND);
+	NTFS_I(vi)->nodump = fa->flags & FS_NODUMP_FL;
 
 	inode_set_ctime_current(vi);
 	mark_inode_dirty(vi);
@@ -445,8 +448,12 @@ int ntfs_getattr(struct mnt_idmap *idmap, const struct path *path,
 	if (inode->i_flags & S_APPEND)
 		stat->attributes |= STATX_ATTR_APPEND;
 
+	if (ni->nodump)
+		stat->attributes |= STATX_ATTR_NODUMP;
+
 	stat->attributes_mask |= STATX_ATTR_COMPRESSED | STATX_ATTR_ENCRYPTED |
-				 STATX_ATTR_IMMUTABLE | STATX_ATTR_APPEND;
+				 STATX_ATTR_IMMUTABLE | STATX_ATTR_APPEND |
+				 STATX_ATTR_NODUMP;
 
 	/*
 	 * If it's a compressed or encrypted file, NTFS currently
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 5aedc045f65a..5520df707162 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -492,6 +492,7 @@ void __ntfs_init_inode(struct super_block *sb, struct ntfs_inode *ni)
 	ni->reparse_tag = 0;
 	ni->reparse_flags = 0;
 	ni->target = NULL;
+	ni->nodump = 0;
 	ni->i_dealloc_clusters = 0;
 }
 
diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
index ff61bd402df0..bc24dcf0b49f 100644
--- a/fs/ntfs/inode.h
+++ b/fs/ntfs/inode.h
@@ -145,6 +145,7 @@ struct ntfs_inode {
 	__le32 reparse_tag;
 	__le32 reparse_flags;
 	char *target;
+	bool nodump;
 };
 
 /*
-- 
2.51.0

