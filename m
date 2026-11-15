Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749256;
	b=d9SmOKgy+nqcuodLHwTmrQn6EYy6xbyOdwVkDu4yk7GKqg74aNpbKD300eFAmaJ2HOfJ
	 rpOLB1YSqFP4Eu5HFYZ+1fBg1o/UAEM2OLtkyrKrSol8vJghD9iKKXLJElqXtq2U5xSgw
	 l8TCHJTD3MfASm14hFeb3iDtE9ayy4nkg0fe1ikMVpOpR9Mr1dGeGPd5ujACVFy6opbM5
	 +wPpF2EbB7gf0wg1S3tAYn1Z81z0o1scTujwLXgdTH82e9TllkHu4jgRvVYJK+dDcdW2Z
	 hrzcfDX445hsx8wCaWAyMjts1Uvsw0h4f6gP0iU7F+S3D/dSKfVf7xmgL3znP7HZ+Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749256;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=4tyCGDIewA+GiAVeQEatz7b2can7eSkfz9IJpWESZLk=;
	b=ycGj+iqpsidxaSDLKvLdaGKrFqzxyda18QmTxSTF5BBalmJplR+AXIaKG0mnhlsmgCr8
	 paekpWjGj+jvrFx7kMRpsYiu5m2Cj/mOzRgH1IJAjS5QcGzUIrJumqC/l0dNdhTXqcDuT
	 yDYF1D0IQznNIsMc7QMXa+WqFGplb5hc3Fd1jUBPnz8Rl0gzlYOLk1fzPEtK9WhXIxdxo
	 roJb2Ct/ZFlEEuARR2ZOJzhaW3PI+7/0ys6sTOeJYqVfJP29rxPB3I5H4V08n+2y0w7VF
	 oOLfIwcf2OrALAoC1o9G3emnO4BmgScyIO5GdY5InA1OWMNNtrT+fqLzhHXf0c5rzrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=QQMednry;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A183C606A31F
	for <ntfs@lists.linux.dev>; Sun, 15 Nov 2026 13:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A183C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=QQMednry
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=4t
	yCGDIewA+GiAVeQEatz7b2can7eSkfz9IJpWESZLk=; b=QQMednryB+x5rXOyWY
	hgILGhS6/V6OxWXOp2msp1VJoEdxdug7612IiLkHdlQilxeG94qYBKfkP8tIgd5O
	ur5fXQVFLutNdH18XkK4+RfFm1mzh/y6kEYnXJ5noHCjMn8Yaf8ENep2oIGzE3dE
	Ny1irrgjgvVA02hCjdg6NjSEE=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXP_A1s_lqfjtyIQ--.47831S6;
	Sun, 15 Nov 2026 21:27:20 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 12/12] ntfs: support O_TMPFILE
Date: Sun, 15 Nov 2026 21:26:09 +0800
Message-ID: <20261115132609.209957-13-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261115132609.209957-1-liubaolin12138@163.com>
References: <20261115132609.209957-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wDXP_A1s_lqfjtyIQ--.47831S6
X-Coremail-Antispam: 1Uf129KBjvJXoW3AF43Gr4rJr4DurW5ZF1DKFg_yoWxJr18pF
	ZxWryxGw4xXry2g392ka1UZr4SgayxuF4UXrWxG3W3AFn8tw1FgF1ftFy3uF1ftrWrCrs0
	qF4UK34UWr15ZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uio7NUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RgU3mr5szh1ewAA3t

From: Baolin Liu <liubaolin@kylinos.cn>

Create regular files without FILE_NAME or directory index entries, with
zero on-disk links, and attach them using d_tmpfile(). Clear the in-
memory link count before EA setup so attribute inodes cannot pin
unpublished files in cache.

Allow the first link only with I_LINKABLE, preserving existing deletion
checks. Let the VFS enforce O_EXCL and clear I_LINKABLE after
publication. Reuse zero-link eviction for cleanup.

Document the interface and named-stream restrictions before publication.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
No code changes since v3; rebased on the preceding fixes.

QEMU creation, publication, cleanup, O_EXCL, ACLs, permissions, idmapped
mounts, streams, EAs, direct I/O, mmap and concurrency checks passed.
Persistence, full-volume retries and injected rollback checks passed,
as did generic/004 and generic/389.

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
index 1b4d1e02e183..67f1d7eecf2b 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -490,9 +490,11 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
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
@@ -514,6 +516,10 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	inode_set_iversion(vi, 1);
 	insert_inode_hash(vi);
 
+	/* Attribute inodes must not pin an unpublished file in cache. */
+	if (!name)
+		clear_nlink(vi);
+
 	mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
 	mutex_lock_nested(&dir_ni->mrec_lock, NTFS_INODE_MUTEX_PARENT);
 	if (NInoBeingDeleted(dir_ni)) {
@@ -659,6 +665,12 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
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
@@ -711,12 +723,13 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
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
@@ -793,6 +806,8 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	mutex_unlock(&dir_ni->mrec_lock);
 	mutex_unlock(&ni->mrec_lock);
 
+	/* The MFT record has already been freed above. */
+	set_nlink(vi, 1);
 	if (rollback_ea_vi)
 		iput(rollback_ea_vi);
 	if (rollback_eai_vi)
@@ -871,6 +886,31 @@ static int ntfs_create(const struct mnt_idmap *idmap, struct inode *dir,
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
@@ -1340,7 +1380,8 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 		goto err_out;
 	}
 
-	if (le16_to_cpu(ni_mrec->link_count) == 0) {
+	if (!ni_mrec->link_count &&
+	    !(inode_state_read_once(vi) & I_LINKABLE)) {
 		err = -ENOENT;
 		goto err_out;
 	}
@@ -1781,6 +1822,7 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
 const struct inode_operations ntfs_dir_inode_ops = {
 	.lookup		= ntfs_lookup,	/* VFS: Lookup directory. */
 	.create		= ntfs_create,
+	.tmpfile	= ntfs_tmpfile,
 	.unlink		= ntfs_unlink,
 	.mkdir		= ntfs_mkdir,
 	.rmdir		= ntfs_rmdir,

