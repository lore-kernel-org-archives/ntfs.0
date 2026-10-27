Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093740;
	b=M1XdcYD9enOvLNdMNXaQux0IqhtNf5fNQ0SqoGv5il8a8Gxxx1yHPjJT3tJrgpZ+69eL
	 WSK6bspP4tgGan6RSnFHYQ+qEYb/8XuYh9yabQLvdaKO1QJPP4qgKPStjPDN2ssb19oqM
	 A58VHTYKGxbNcmfMG4Ly5M8GKijF5dvVbgWWUPxNPmJ+R5oqn74QsAQn45FvAmZ7EH+1W
	 tUq/AEnvaTp01sXyXWwGvUt+j8wNRbmXcTTD7xEnfpHLlsX2KF6n5LVdeXEOw+Vjvero5
	 PB36ZvwMfrVVVltQFe0G4TG59U/wpMDIXHlqEo4qFQtlPKvFTfWQxcoTFDlglMY8wcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093740;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=lPdRcKjHxkKTRhDMzjbMQbkH1Y7BdzgdFX+1uhRYEJE=;
	b=amkMnJw5xlSbiGTdEXU6tO8f66XAm13SA1d/CW6k4v3o3vbSEBXyVeB/LrSw2Fl/JVco
	 1xB1X0lElHUqeURYspipDtKP0dy//kSo6vSYQQdavUrARGkjXUE39gXOGceyKwv6hEaLD
	 cOdHvVesv7S4YVW5tQE4FdWObzaVSwcLAkg35+VZRKX7QS0Zy2QzU3Nwg62dYZYHkY5xQ
	 jf49d5wmnzVqC9GJ7svVmCrnAy717h4Agenhk5SKBaQxsvfthLp54s4m8kPI8QeKK133I
	 bSTkS9d7+LyzW7zmf3efNAPvvVYs6Ta8rHe7u6EtyVYshkOAU6/ZaLoCECWhKq2zvFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="Fk3bMv/D";
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7864C606A31B
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 09:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7864C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Fk3bMv/D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=lP
	dRcKjHxkKTRhDMzjbMQbkH1Y7BdzgdFX+1uhRYEJE=; b=Fk3bMv/DZvLXWlR5+i
	44ak2152VXXtCiRjoaW0IHK+hfsKFa8Bf8d2k6Tmr1SRFNJDPVoOGczyKVCEXj1G
	MhbNDqljlmj1Sx6Bt+WB+oDahlXNH3WCfZkR/beAqz1Ew7cn8hm9VMpkKNlw7gaX
	gy4XxrEz08nu26WzEV2giAgnY=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD33xFVcOBqdMGFDQ--.18497S7;
	Tue, 27 Oct 2026 17:35:21 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 5/5] ntfs: support O_TMPFILE
Date: Tue, 27 Oct 2026 17:35:15 +0800
Message-ID: <20261027093515.344799-6-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261027093515.344799-1-liubaolin12138@163.com>
References: <20261027093515.344799-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD33xFVcOBqdMGFDQ--.18497S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxtr43Ar17Ar1rWFW5uFW7Arb_yoWxZF1xpF
	sxWryfGws7Jry2g392ka1UZr4Sga1xCF4UXrWxW3W3A3Wqqw1FgF1ftFy5uF1fKrWrArWq
	qF1UG34UWryUZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjjgxUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RkFz2rgcFlK0AAA3D

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
Tested the complete five-patch series in QEMU (x86-64, four CPUs, NTFS
debug and lockdep enabled) on disposable NTFS images. Checked anonymous
creation, last-reference cleanup, O_EXCL, linkat publication and failed
publication retry, ACLs, nonresident EAs, prepared timestamps, direct I/O,
mmap, fallocate, truncation, permissions and idmapped mounts. Named-stream
writes were rejected before publication; stream writes, reads and removal
worked after publication.

Verified published file contents, a 12000-byte EA, mode and explicitly set
atime/mtime after cache eviction, read-only and read-write remounts,
unmount/mount and a fresh boot. The inherited access ACL remained readable
in those checks.

Created 400 files using four worker threads, including 100 publications.
Also checked concurrent publication of the same inode, competing target
names, last-unlink races and ENOSPC followed by space reuse. Injected
ENOSPC at five sites in creation, publication and final-open paths and
checked the failure behavior. Offline inspection found the recorded base
MFT records' in-use flags and MFT bitmap bits clear after cleanup.

 Documentation/filesystems/ntfs.rst | 15 +++++++++
 fs/ntfs/namei.c                    | 54 ++++++++++++++++++++++++++----
 2 files changed, 63 insertions(+), 6 deletions(-)

diff --git a/Documentation/filesystems/ntfs.rst b/Documentation/filesystems/ntfs.rst
index 699e91f..a0acc01 100644
--- a/Documentation/filesystems/ntfs.rst
+++ b/Documentation/filesystems/ntfs.rst
@@ -10,6 +10,7 @@ The Linux NTFS filesystem driver
    - Overview
    - Utilities support
    - Linux file attributes
+   - Temporary files
    - Supported mount options
 
 
@@ -58,6 +59,20 @@ These Linux flags are enforced by Linux. Storing them in an NTFS EA does
 not make Windows enforce immutable, append-only or nodump semantics.
 
 
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
index b26fd9c..4f58b80 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -489,9 +489,11 @@ static struct ntfs_inode *__ntfs_create(struct mnt_idmap *idmap, struct inode *d
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
@@ -513,6 +515,10 @@ static struct ntfs_inode *__ntfs_create(struct mnt_idmap *idmap, struct inode *d
 	inode_set_iversion(vi, 1);
 	insert_inode_hash(vi);
 
+	/* Attribute inodes must not pin an unpublished file in cache. */
+	if (!name)
+		clear_nlink(vi);
+
 	mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
 	mutex_lock_nested(&dir_ni->mrec_lock, NTFS_INODE_MUTEX_PARENT);
 	if (NInoBeingDeleted(dir_ni)) {
@@ -658,6 +664,12 @@ static struct ntfs_inode *__ntfs_create(struct mnt_idmap *idmap, struct inode *d
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
@@ -709,12 +721,13 @@ static struct ntfs_inode *__ntfs_create(struct mnt_idmap *idmap, struct inode *d
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
@@ -782,6 +795,8 @@ err_out:
 	mutex_unlock(&dir_ni->mrec_lock);
 	mutex_unlock(&ni->mrec_lock);
 
+	/* The MFT record has already been freed above. */
+	set_nlink(vi, 1);
 	if (rollback_ea_vi)
 		iput(rollback_ea_vi);
 	if (rollback_eai_vi)
@@ -856,6 +871,31 @@ out_free_stream_names:
 	return 0;
 }
 
+static int ntfs_tmpfile(struct mnt_idmap *idmap, struct inode *dir,
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
@@ -1270,7 +1310,8 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 		goto err_out;
 	}
 
-	if (le16_to_cpu(ni_mrec->link_count) == 0) {
+	if (!ni_mrec->link_count &&
+	    !(inode_state_read_once(vi) & I_LINKABLE)) {
 		err = -ENOENT;
 		goto err_out;
 	}
@@ -1703,6 +1744,7 @@ out:
 const struct inode_operations ntfs_dir_inode_ops = {
 	.lookup		= ntfs_lookup,	/* VFS: Lookup directory. */
 	.create		= ntfs_create,
+	.tmpfile	= ntfs_tmpfile,
 	.unlink		= ntfs_unlink,
 	.mkdir		= ntfs_mkdir,
 	.rmdir		= ntfs_rmdir,

