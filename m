Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424574;
	b=wjT+YWSTeLyXEH2TYJSwhZz5aOTReNz84+VnrVRRtKUWa+JqAuD7Smv1ufljqGHHd9sQ
	 3P2HUsqnZJanJi6m+5/r4/DQctT+4u0ajq6neEhpVGH1Eb3Y7Yu1JYkOD7lsDy8dKvUeN
	 ODttufeStKNlmsJd/ylot5nSwbn5hrUwnVgLtFaEOcZS+G2paEGwEChRVfPFwk3DKEBWR
	 ssl+IRmRB0blKKPmEfJM/UmpOwDIot/dXzWzjmzJASuU2AV2c8Af0uadF1A9wQ1bSw+JO
	 phuJCACUmiPBIx1DhnKYjGP9hJ9ram7pxYvWYJlF/VNMPhRDcLF6/QrGUMU/HakIsCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424574;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=nGm5yCrNVeSCMBQgnmxXs6DZv3hUR4rfiv6S3nAO3Bw=;
	b=he+Csg2XgIZIgqNeXW72CgS9Y4d6Eb/Eq1963bMpOoMP2ctIjBMqVUsWYcZo+9wz8FUo
	 xO/GSD3B4yC00AbDr7M9xdfgYWdYBQZKxKY5Le1FvbgjoayJCYev4mkhlkKqWyjhr73uY
	 9kkXFsoV9DihGA3GWFIYMCAexkFOWv6LinlC47uM2jdkBUilhGPK72bqUSBtcovi+j0cl
	 G427+WQPwfy+BGjyLhBgljVqkuXKVaIAkfHj4QIoFQCElTbSMU83ncmfi/+0P28wbzRWX
	 w1AY8s0qHKpApaR9qW/rBF9iHaV4fIgoOj4S1xKz0w3luQ21j5f2EPD/B+b+6VFLV6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="k/ffEtm9";
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3BC606A31E
	for <ntfs@lists.linux.dev>; Sat, 31 Oct 2026 05:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC3BC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=k/ffEtm9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=nG
	m5yCrNVeSCMBQgnmxXs6DZv3hUR4rfiv6S3nAO3Bw=; b=k/ffEtm9bfyzfDKWAi
	EkG0OnzRrJlgRlJUU8jeHLmhPoFJBrYM2SXdmxGvaVPtCgL2+cH/0HUoddgu4NPQ
	W029smdjMPiyicYzRBGcqUB/ZHAZo7sWDJecgZNT0cn6+lxvz+7jVbuz4rLwaIlT
	2f2z47lVes6q6eXKW2LTU1+8U=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDX37adfOVqFDprDA--.9490S7;
	Sat, 31 Oct 2026 13:29:08 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 5/5] ntfs: support O_TMPFILE
Date: Sat, 31 Oct 2026 13:28:57 +0800
Message-ID: <20261031052857.1542936-6-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261031052857.1542936-1-liubaolin12138@163.com>
References: <20261031052857.1542936-1-liubaolin12138@163.com>
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
X-CM-TRANSID:QCgvCgDX37adfOVqFDprDA--.9490S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxtr43Ar17Zr1UGrW7GryDZFb_yoWxZryrpF
	ZxWryfGws7Jry2g392ka1UZr4Sgayxur4UXrW8W3W3A3Z0qw1FgF1xtFyUuF1fKrWrur4q
	qF1UK3yUWr1UZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URCJQUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QRcJ2rlfKTrOQAA3T

From: Baolin Liu <liubaolin@kylinos.cn>

Allow regular files to be created without a FILE_NAME attribute or
a directory index entry. Keep their on-disk link count at zero and use
d_tmpfile() to attach the inode to the anonymous dentry. Clear the base
inode's in-memory link count before initializing EAs so that attribute
inodes inherit zero links and can be evicted rather than pinning an
unpublished file in cache.

Allow the first hard link of a zero-link inode only when the VFS marks
it I_LINKABLE. Existing deletion checks remain in place, and the VFS
controls O_EXCL and clears I_LINKABLE after publication. Reuse the
zero-link eviction path for unpublished files.

Document the interface and the named-stream restriction before
publication.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
Tested the standalone five-patch series in QEMU with four CPUs, NTFS
debug and lockdep enabled. Checked creation, last-reference cleanup,
O_EXCL, linkat publication, permissions, normal idmapped ownership,
nonresident EAs, direct I/O, mmap, allocation and named streams.
Published data and metadata survived cache eviction, remount and reboot.
Concurrent publication and the basic ENOSPC probe passed. The requested
unchanged xfstests generic/004 and generic/389 passed.

The basic ENOSPC probe does not cover all ACL-backed creation failures.
Full-volume ACL creation retries still failed after freeing space on
this five-patch series. Attribute rollback and cold-cache ACL fixes are
prepared as a separate follow-up series.

Changes in v2:
- Rebase onto ntfs-next and use the const mnt_idmap callback signature.
- Run the requested fstests and keep the original five-patch scope.

 Documentation/filesystems/ntfs.rst | 15 +++++++++
 fs/ntfs/namei.c                    | 54 ++++++++++++++++++++++++++----
 2 files changed, 63 insertions(+), 6 deletions(-)

diff --git a/Documentation/filesystems/ntfs.rst b/Documentation/filesystems/ntfs.rst
index d5819da6ab53..635301117807 100644
--- a/Documentation/filesystems/ntfs.rst
+++ b/Documentation/filesystems/ntfs.rst
@@ -10,6 +10,7 @@ The Linux NTFS filesystem driver
    - Overview
    - Utilities support
    - Linux file attributes
+   - Temporary files
    - Supported mount options
 
 
@@ -63,6 +64,20 @@ These Linux flags are enforced by Linux. Storing them in an NTFS EA does
 not make Windows enforce immutable, append-only, nodump or noatime semantics.
 
 
+Temporary files
+===============
+
+The driver supports ``O_TMPFILE`` for regular files. The file has no
+directory entry until it is linked with linkat(2); ``O_EXCL`` prevents
+this publication. Ownership and mode follow normal file creation rules.
+With ACLs enabled, the file's access ACL is derived from the creation
+directory's default ACL. Unpublished files are reclaimed when their last
+reference is released.
+
+Named stream ioctls cannot create or open streams on an unpublished
+temporary file. They can be used after the file has been linked.
+
+
 Supported mount options
 =======================
 
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 5124e7a3e124..a8bfc732b558 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -489,9 +489,11 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	simple_inode_init_ts(vi);
 	ni->i_crtime = inode_get_ctime(vi);
 
-	inode_set_mtime_to_ts(dir, ni->i_crtime);
-	inode_set_ctime_to_ts(dir, ni->i_crtime);
-	mark_inode_dirty(dir);
+	if (name) {
+		inode_set_mtime_to_ts(dir, ni->i_crtime);
+		inode_set_ctime_to_ts(dir, ni->i_crtime);
+		mark_inode_dirty(dir);
+	}
 
 	err = ntfs_mft_record_alloc(dir_ni->vol, mode, &ni, NULL,
 			&ni_mrec, -1);
@@ -513,6 +515,10 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	inode_set_iversion(vi, 1);
 	insert_inode_hash(vi);
 
+	/* Attribute inodes must not pin an unpublished file in cache. */
+	if (!name)
+		clear_nlink(vi);
+
 	mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
 	mutex_lock_nested(&dir_ni->mrec_lock, NTFS_INODE_MUTEX_PARENT);
 	if (NInoBeingDeleted(dir_ni)) {
@@ -658,6 +664,12 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	if (err)
 		goto err_out;
 
+	if (!name) {
+		ni_mrec->link_count = 0;
+		mark_mft_record_dirty(ni);
+		goto done;
+	}
+
 	/* Create FILE_NAME attribute. */
 	fn_len = sizeof(struct file_name_attr) + name_len * sizeof(__le16);
 	fn = kzalloc(fn_len, GFP_NOFS);
@@ -710,12 +722,13 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 		goto err_out;
 	}
 
+	ni->flags = fn->file_attributes |
+		    (ni->flags & FILE_ATTRIBUTE_RECALL_ON_OPEN);
+done:
 	unmap_mft_record(ni);
 	mutex_unlock(&dir_ni->mrec_lock);
 	mutex_unlock(&ni->mrec_lock);
 
-	ni->flags = fn->file_attributes |
-		    (ni->flags & FILE_ATTRIBUTE_RECALL_ON_OPEN);
 	/* Set the sequence number. */
 	vi->i_generation = ni->seq_no;
 	set_nlink(vi, 1);
@@ -783,6 +796,8 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	mutex_unlock(&dir_ni->mrec_lock);
 	mutex_unlock(&ni->mrec_lock);
 
+	/* The MFT record has already been freed above. */
+	set_nlink(vi, 1);
 	if (rollback_ea_vi)
 		iput(rollback_ea_vi);
 	if (rollback_eai_vi)
@@ -857,6 +872,31 @@ static int ntfs_create(const struct mnt_idmap *idmap, struct inode *dir,
 	return 0;
 }
 
+static int ntfs_tmpfile(const struct mnt_idmap *idmap, struct inode *dir,
+			struct file *file, umode_t mode)
+{
+	struct ntfs_volume *vol = NTFS_SB(dir->i_sb);
+	struct ntfs_inode *ni;
+	struct inode *inode;
+	int err;
+
+	if (NVolShutdown(vol))
+		return -EIO;
+
+	err = ntfs_set_volume_flags(vol, VOLUME_IS_DIRTY);
+	if (err)
+		return err;
+
+	ni = __ntfs_create(idmap, dir, NULL, 0, mode, 0, NULL, 0);
+	if (IS_ERR(ni))
+		return PTR_ERR(ni);
+
+	inode = VFS_I(ni);
+	d_tmpfile(file, inode);
+	unlock_new_inode(inode);
+	return finish_open_simple(file, 0);
+}
+
 static int ntfs_check_unlinkable_dir(struct ntfs_attr_search_ctx *ctx, struct file_name_attr *fn)
 {
 	int link_count;
@@ -1272,7 +1312,8 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 		goto err_out;
 	}
 
-	if (le16_to_cpu(ni_mrec->link_count) == 0) {
+	if (!ni_mrec->link_count &&
+	    !(inode_state_read_once(vi) & I_LINKABLE)) {
 		err = -ENOENT;
 		goto err_out;
 	}
@@ -1708,6 +1749,7 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
 const struct inode_operations ntfs_dir_inode_ops = {
 	.lookup		= ntfs_lookup,	/* VFS: Lookup directory. */
 	.create		= ntfs_create,
+	.tmpfile	= ntfs_tmpfile,
 	.unlink		= ntfs_unlink,
 	.mkdir		= ntfs_mkdir,
 	.rmdir		= ntfs_rmdir,

