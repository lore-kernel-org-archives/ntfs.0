Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1483803E1
	for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 05:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787204993; cv=none; b=lWmprsHW5Mw3XMrcrlrdd7ndowkGtWH7UKFySRPwpkEyEcSNL5dG8OAo5EncquP6RnjUFWxve7bbP8ZtxQwVn+eDeJgdOTfIfn8o8otyIdRZ8NoscQBaAgCNBrlB+wHqJdyXdTKDgAWAp8a4vG5cy6wrOdc/CGh1oIx/f4UVKtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787204993; c=relaxed/simple;
	bh=N8bLta72TLhrje9BMtjfbj8BdJ7k9UHN/XCTrA8a8iI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IFxPL9kckjulKHE6w35tRFUcN5+l0Q/FuW0n8McdQG+ldLpstGCgGr0C5F9ddbEqjmZQOtQ8XzVz4irvBGYI7vQzyrubsWYQajtfOhRycW5EBSZH/wC5I5Njzl1BCt1hXbQbwsk4hsB7oJ5kldlWqSkvSLfRI8NKDh0IgYsQK3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkVbCLYI; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkVbCLYI"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so1494364a12.0
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 22:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787204991; x=1787809791; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NKkCLsX18tdbgo1nP3bcYmySQtlF37G6tKI3dD+h0vw=;
        b=OkVbCLYIqM8I/OAcNyWV3HhioPj5j8hMg/HHLT4O0WraeiPz66+QfJrd6kpyaZZe5R
         fPBuLG3Pw/5k3T7qIluZ+vf6UxJ6cF3nHOHHUKoefXqEkXXhTLrfdQ4K+r7/eu1llyJ9
         MO97wG6zagS5AkY2TUtbFKgpUuSXfbsVvqkLP37yrKlimwVel2sSvnynSGLMLfgm8S2J
         aitE52ZTqKpOgbdS3wBu6W6zlw0psCW/fm2kdyfMCsyXBUlQvhlqhl1cp+NeoM3ZZ3eX
         piCugmfbH+G7k3mV4N+5LVg3tBlQgzybI5PmI/rklgEQ4VMMWGPX+zUiYfhO5rWps8F6
         uMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204991; x=1787809791;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NKkCLsX18tdbgo1nP3bcYmySQtlF37G6tKI3dD+h0vw=;
        b=A0rxo3Rz2w7n0Kx3dH2t9uCkiYuqoMcl0ZX5lc9TSEs6f+LieIHsD6meJB5lNZMc5F
         mreeQbBwOVxhJ1wJVpaigO7gQ7hso908SI0bZSjVzPjNEY3jAolwrFlDQZPjzcq5v+j2
         3+kg7BLp6YDO5mNa0jWGH10TQMaPdsDbX3kWgX925A8l1G/UfQafivT3dEQcwr+HR/sG
         GzS/OKzVoNyQY6sGBRdx3WApGP+1VGXdhDTe1i9gdTF38ykO439tjPtbISaq3+9g0wrt
         jEwrc9zuNVLx/a4sIquSmVUgPol+4keEMvsi90DTe0dUiNOxTMUHbI8mRVL3KQyPDqWY
         A5HQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSsMZ0kZygVqdItUUpJ+wsIy2T4LClxXECCz08sa2LDmMywJeNkBTkNTI5m/opch/s+Xy+@lists.linux.dev
X-Gm-Message-State: AFuF++nN/Sh8eCWZqCqLojaTo/fzlpthFBRWsCok5q4/nT/kMnyw5pTF
	oc52Ha5YE3jRr2j1a5AT6WJGZEZYrM0O1Kn4KydtkSG6fZCt4ThyNSZY
X-Gm-Gg: AR+sD11CYU4smWjz46DLD5HLXwR+PTAjIe3RrodCWv9c5Hqt9HzBnNu81YGDUR95zy8
	9jgYyPgFt4sBup3VIFSLsK0HTEV72Dt+Q2oR0q3wd53P4TCVSGs9EMTalXHAnus86ey7tYszjt8
	ruk+J8HUuZAUGic2SVvSipLMa48eRG4loNiZQWa+b6OQVvy/m/Di5U5iwpaXmRXJMD+Dxd/fO4c
	h7d6oLOBF9pvjQ31Q0LHU5mvChAHVPUkQvkwsjkJlSTTMFtlheBaQGmyc0eVwcWwHm/uGtT7VCH
	zOB+KyguOOUX2SQkNobNLdyFbShwR3TzbUqKv5/2Zq0Rx+WEo93tZHHWu1Al1x8JrG8Aa5Fy/a8
	ka+oXHuG6/x+xE7Ry8xIuyIzm4OW31f7hzG72j37Za45LdM1JRW4RNNGJnOYQ4puhiY+tj9T1pQ
	SlKcpt9/ddqVU5DxxIhrGjKYULnN6fEBrqe/6u8FgwR09wWWrzO31b810NTAzZkny95Uw=
X-Received: by 2002:a17:90b:540b:b0:38f:837e:fc5d with SMTP id 98e67ed59e1d1-39580a8de4emr20902651a91.3.1787204990274;
        Wed, 19 Aug 2026 22:49:50 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395b66bccf5sm106766a91.2.2026.08.19.22.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:49:49 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 8/9] ntfs: add non-resident WOF decompression
Date: Thu, 20 Aug 2026 14:48:21 +0900
Message-ID: <20260820-topic-wof-v2-v3-8-ef6149b4541e@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820-topic-wof-v2-v3-0-ef6149b4541e@gmail.com>
References: <20260820-topic-wof-v2-v3-0-ef6149b4541e@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=35208; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=N8bLta72TLhrje9BMtjfbj8BdJ7k9UHN/XCTrA8a8iI=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhpUNxG0v6nDRvJrfazt2eHtqiPIMAByenouWc
 1703uQ8ShOJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoaVDQAKCRA08jD6945I
 0+fsD/9Fc3XEuix4eRaDMFvuWjz2QGjXGygn+Ea5/5CnOAsgcvmWsqSm9TSAGkHlHqITOgIEWZU
 0YVrrPw3a5yv2dDQBkh5KzQL5nxSUk8He2WWFCrJkvHJYXaMKpX9nkpxKuQqUzJURpAKBcP5ALg
 mEi7OHEeEbku5UV/QMWJuH0bFwhUdDedjQmpRmKBJ4JBI//9mip590v8u7l5zTzx3GjKmvcl6KY
 cgsYbHU7U1KdmTK0GINIu95AYhi/Mj31Y7i8Q7S5HZiYXf9JZd2Iusc+g2BJRpWysDc+xNbwWYA
 IjR9ZK18VWbakgIE+7P+8LSrB3ll+Y+kxqpB1EjhWeb3tTIG/m0/D9L3yxp2v/tr4jHs7tqAIwg
 0TAxUtZYDRK9lul6xB0QHYE8qfQTVpjw5KIL6PrM3/XI/eQ24NpZxIV5s6NX26pUfT7afL7NesU
 Trfe777DXls32fXTtSTH6hdMQFHComQXr+AMIUAlHFQHw5BB8wRnjn1QaYT7I46eMhaiETAvmSe
 oDq5yeR+P5r8bNWRe+PViXuQ5gnMr8xy/8M3BbRXx28+ZYUQr/FWyj3b3sOSIWVZsgUbQcxzjC9
 XR4vHFaupuqYlQKUy8bB4CZgOBjEtijbkBYlyYdGXUMS8lqTn9wsSjGcMNbiFkTkQj7k+klsYeb Jpb0JC1Jdsd7k4w==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Introduce non-resident Windows System Compression (WOF) decompression
support. Add wof.c containing parse_wof_chunk_table() and
ntfs_read_wof_compressed_block(), and routing them via transparent
codec ops table with dynamic scratch memory allocation. Hook up
ntfs_readpage/read_folio paths in aops.c to delegate to the WOF block
reader when NInoWofCompressed is set.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/Makefile  |   2 +-
 fs/ntfs/aops.c    |  19 +-
 fs/ntfs/attrib.c  |   2 +-
 fs/ntfs/bdev-io.c |   4 +-
 fs/ntfs/ea.c      |  28 ++-
 fs/ntfs/file.c    |  47 +++-
 fs/ntfs/inode.c   |   9 +-
 fs/ntfs/ntfs.h    |   4 +
 fs/ntfs/reparse.c |  59 +++--
 fs/ntfs/super.c   |   3 +
 fs/ntfs/wof.c     | 668 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 11 files changed, 792 insertions(+), 53 deletions(-)

diff --git a/fs/ntfs/Makefile b/fs/ntfs/Makefile
index 5e5fd05f5863..ee8987e496a8 100644
--- a/fs/ntfs/Makefile
+++ b/fs/ntfs/Makefile
@@ -7,7 +7,7 @@ ntfs-y := aops.o attrib.o collate.o dir.o file.o index.o inode.o \
 	  upcase.o bitmap.o lcnalloc.o logfile.o reparse.o compress.o \
 	  iomap.o debug.o sysctl.o object_id.o bdev-io.o
 
-ntfs-$(CONFIG_NTFS_FS_WOF_COMPRESSION) += \
+ntfs-$(CONFIG_NTFS_FS_WOF_COMPRESSION) += wof.o \
 	lib/decompress_common.o lib/lzx_decompress.o lib/xpress_decompress.o
 
 ccflags-$(CONFIG_NTFS_DEBUG) += -DDEBUG
diff --git a/fs/ntfs/aops.c b/fs/ntfs/aops.c
index 173de4cbee0f..517d9a1563e7 100644
--- a/fs/ntfs/aops.c
+++ b/fs/ntfs/aops.c
@@ -90,6 +90,14 @@ static int ntfs_read_folio(struct file *file, struct folio *folio)
 			folio_unlock(folio);
 			return -EOPNOTSUPP;
 		}
+		if (NInoWofCompressed(ni)) {
+#ifdef CONFIG_NTFS_FS_WOF_COMPRESSION
+			return ntfs_read_wof_compressed_block(folio);
+#else
+			folio_unlock(folio);
+			return -EOPNOTSUPP;
+#endif
+		}
 		/* Compressed data streams are handled in compress.c. */
 		if (NInoNonResident(ni) && NInoCompressed(ni))
 			return ntfs_read_compressed_block(folio);
@@ -136,11 +144,12 @@ static sector_t ntfs_bmap(struct address_space *mapping, sector_t block)
 	ntfs_debug("Entering for mft_no 0x%llx, logical block 0x%llx.",
 			ni->mft_no, (unsigned long long)block);
 	if (ni->type != AT_DATA || !NInoNonResident(ni) || NInoEncrypted(ni) ||
-	    NInoMstProtected(ni)) {
+	    NInoWofCompressed(ni) || NInoMstProtected(ni)) {
 		ntfs_error(vol->sb, "BMAP does not make sense for %s attributes, returning 0.",
 				(ni->type != AT_DATA) ? "non-data" :
 				(!NInoNonResident(ni) ? "resident" :
-				"encrypted"));
+				(NInoWofCompressed(ni) ? "WOF-compressed" :
+				"encrypted")));
 		return 0;
 	}
 	/* None of these can happen. */
@@ -234,7 +243,8 @@ static void ntfs_readahead(struct readahead_control *rac)
 	 * Resident files are not cached in the page cache,
 	 * and readahead is not implemented for compressed files.
 	 */
-	if (!NInoNonResident(ni) || NInoCompressed(ni))
+	if (!NInoNonResident(ni) || NInoCompressed(ni) ||
+	    NInoWofCompressed(ni))
 		return;
 	iomap_readahead(&ntfs_read_iomap_ops, &ctx, NULL);
 }
@@ -286,6 +296,9 @@ static int ntfs_writepages(struct address_space *mapping,
 static int ntfs_swap_activate(struct swap_info_struct *sis,
 		struct file *swap_file, sector_t *span)
 {
+	if (NInoWofCompressed(NTFS_I(file_inode(swap_file))))
+		return -EOPNOTSUPP;
+
 	return iomap_swapfile_activate(sis, swap_file, span,
 			&ntfs_read_iomap_ops);
 }
diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index d9e844c481d8..60264833bb63 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -2137,7 +2137,7 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 		ni->runlist.count = 0;
 	write_lock_irqsave(&ni->size_lock, flags);
 	ni->allocated_size = new_size;
-	if (NInoSparse(ni) || NInoCompressed(ni)) {
+	if ((NInoSparse(ni) && !NInoWofCompressed(ni)) || NInoCompressed(ni)) {
 		ni->itype.compressed.size = ni->allocated_size;
 		if (a->data.non_resident.compression_unit) {
 			ni->itype.compressed.block_size = 1U <<
diff --git a/fs/ntfs/bdev-io.c b/fs/ntfs/bdev-io.c
index 27d7c2767a33..86db4d9298ed 100644
--- a/fs/ntfs/bdev-io.c
+++ b/fs/ntfs/bdev-io.c
@@ -33,7 +33,7 @@ int ntfs_bdev_read(struct block_device *bdev, char *data, loff_t start, size_t s
 	unsigned int done = 0, added;
 	int error;
 	struct bio *bio;
-	enum req_op op;
+	blk_opf_t op;
 	sector_t sector = start >> SECTOR_SHIFT;
 
 	if (start & (SECTOR_SIZE - 1))
@@ -66,7 +66,7 @@ int ntfs_bdev_read(struct block_device *bdev, char *data, loff_t start, size_t s
 	error = submit_bio_wait(bio);
 	bio_put(bio);
 
-	if (op == REQ_OP_READ)
+	if ((op & REQ_OP_MASK) == REQ_OP_READ)
 		invalidate_kernel_vmap_range(data, size);
 	return error;
 }
diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index c8a3d9f07dc4..74995a84c88c 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -838,6 +838,17 @@ static bool ntfs_is_reserved_lxattr(const char *name)
 	       !strcmp(name, "$LXMOD") || !strcmp(name, "$LXDEV");
 }
 
+static int ntfs_validate_fattr(struct ntfs_inode *ni, __le32 fattr)
+{
+	const __le32 wof_flags = FILE_ATTR_SPARSE_FILE |
+				 FILE_ATTR_REPARSE_POINT;
+
+	if (NInoWofCompressed(ni) && ((ni->flags ^ fattr) & wof_flags))
+		return -EPERM;
+
+	return 0;
+}
+
 static int ntfs_setxattr(const struct xattr_handler *handler,
 		struct mnt_idmap *idmap, struct dentry *unused,
 		struct inode *inode, const char *name, const void *value,
@@ -858,7 +869,8 @@ static int ntfs_setxattr(const struct xattr_handler *handler,
 			err = -EINVAL;
 			goto out;
 		}
-		fattr = cpu_to_le32(*(u8 *)value);
+		fattr = cpu_to_le32((le32_to_cpu(ni->flags) & ~0xffU) |
+				    *(u8 *)value);
 		goto set_fattr;
 	}
 
@@ -873,6 +885,10 @@ static int ntfs_setxattr(const struct xattr_handler *handler,
 		else
 			fattr = cpu_to_le32(*(u32 *)value);
 
+		err = ntfs_validate_fattr(ni, fattr);
+		if (err)
+			goto out;
+
 		if (S_ISREG(inode->i_mode)) {
 			mutex_lock(&ni->mrec_lock);
 			err = ntfs_new_attr_flags(ni, fattr);
@@ -887,6 +903,10 @@ static int ntfs_setxattr(const struct xattr_handler *handler,
 		else
 			fattr &= ~FILE_ATTR_DIRECTORY;
 
+		err = ntfs_validate_fattr(ni, fattr);
+		if (err)
+			goto out;
+
 		if (ni->flags != fattr) {
 			ni->flags = fattr;
 			if (fattr & FILE_ATTR_READONLY)
@@ -905,8 +925,10 @@ static int ntfs_setxattr(const struct xattr_handler *handler,
 	mutex_unlock(&ni->mrec_lock);
 
 out:
-	inode_set_ctime_current(inode);
-	mark_inode_dirty(inode);
+	if (!err) {
+		inode_set_ctime_current(inode);
+		mark_inode_dirty(inode);
+	}
 	return err;
 }
 
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index d4282822b3ce..88747217ba61 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -128,7 +128,8 @@ static int ntfs_trim_prealloc(struct inode *vi)
 
 static int ntfs_file_release(struct inode *vi, struct file *filp)
 {
-	if (!NInoCompressed(NTFS_I(vi)))
+	if (!NInoCompressed(NTFS_I(vi)) &&
+	    !NInoWofCompressed(NTFS_I(vi)))
 		return ntfs_trim_prealloc(vi);
 
 	return 0;
@@ -256,10 +257,11 @@ static int ntfs_setattr_size(struct inode *vi, struct iattr *attr)
 	int err;
 	loff_t old_size = vi->i_size;
 
-	if (NInoCompressed(ni) || NInoEncrypted(ni)) {
-		ntfs_warning(vi->i_sb,
-			"Changes in inode size are not supported yet for %s files, ignoring.",
-			NInoCompressed(ni) ? "compressed" : "encrypted");
+	if (NInoCompressed(ni) || NInoEncrypted(ni) || NInoWofCompressed(ni)) {
+		ntfs_warning(
+			vi->i_sb,
+			"Changes in inode size are not supported yet for %s files.",
+			NInoEncrypted(ni) ? "encrypted" : "compressed");
 		return -EOPNOTSUPP;
 	}
 
@@ -308,6 +310,13 @@ int ntfs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (err)
 		goto out;
 
+	if ((ia_valid & ATTR_SIZE) &&
+	    (NInoCompressed(ni) || NInoEncrypted(ni) ||
+	     NInoWofCompressed(ni))) {
+		err = -EOPNOTSUPP;
+		goto out;
+	}
+
 	if (!(vol->vol_flags & VOLUME_IS_DIRTY))
 		ntfs_set_volume_flags(vol, VOLUME_IS_DIRTY);
 
@@ -370,7 +379,7 @@ int ntfs_getattr(struct mnt_idmap *idmap, const struct path *path,
 	stat->result_mask |= STATX_BTIME;
 	stat->btime = NTFS_I(inode)->i_crtime;
 
-	if (NInoCompressed(ni))
+	if (NInoCompressed(ni) || NInoWofCompressed(ni))
 		stat->attributes |= STATX_ATTR_COMPRESSED;
 
 	if (NInoEncrypted(ni))
@@ -395,7 +404,8 @@ int ntfs_getattr(struct mnt_idmap *idmap, const struct path *path,
 			bdev_logical_block_size(inode->i_sb->s_bdev);
 
 		stat->result_mask |= STATX_DIOALIGN;
-		if (!NInoCompressed(ni) && !NInoEncrypted(ni)) {
+		if (!NInoCompressed(ni) && !NInoEncrypted(ni) &&
+		    !NInoWofCompressed(ni)) {
 			stat->dio_mem_align = align;
 			stat->dio_offset_align = align;
 		}
@@ -408,6 +418,10 @@ static loff_t ntfs_file_llseek(struct file *file, loff_t offset, int whence)
 {
 	struct inode *inode = file->f_mapping->host;
 
+	if (NInoWofCompressed(NTFS_I(inode)) &&
+	    (whence == SEEK_HOLE || whence == SEEK_DATA))
+		return -EOPNOTSUPP;
+
 	switch (whence) {
 	case SEEK_HOLE:
 		inode_lock_shared(inode);
@@ -438,7 +452,8 @@ static ssize_t ntfs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	if (NVolShutdown(NTFS_SB(sb)))
 		return -EIO;
 
-	if (NInoCompressed(NTFS_I(vi)) && iocb->ki_flags & IOCB_DIRECT)
+	if ((NInoCompressed(NTFS_I(vi)) || NInoWofCompressed(NTFS_I(vi))) &&
+	    iocb->ki_flags & IOCB_DIRECT)
 		return -EOPNOTSUPP;
 
 	inode_lock_shared(vi);
@@ -569,6 +584,9 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	if (NVolShutdown(vol))
 		return -EIO;
 
+	if (NInoWofCompressed(ni))
+		return -EOPNOTSUPP;
+
 	if (NInoEncrypted(ni)) {
 		ntfs_error(vi->i_sb, "Writing for %s files is not supported yet",
 			   NInoCompressed(ni) ? "Compressed" : "Encrypted");
@@ -653,6 +671,9 @@ static vm_fault_t ntfs_filemap_page_mkwrite(struct vm_fault *vmf)
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	vm_fault_t ret;
 
+	if (NInoWofCompressed(NTFS_I(inode)))
+		return VM_FAULT_SIGBUS;
+
 	sb_start_pagefault(inode->i_sb);
 	file_update_time(vmf->vma->vm_file);
 
@@ -675,7 +696,7 @@ static int ntfs_file_mmap_prepare(struct vm_area_desc *desc)
 	if (NVolShutdown(NTFS_SB(file->f_mapping->host->i_sb)))
 		return -EIO;
 
-	if (NInoCompressed(NTFS_I(inode)))
+	if (NInoCompressed(NTFS_I(inode)) || NInoWofCompressed(NTFS_I(inode)))
 		return -EOPNOTSUPP;
 
 	if (vma_desc_test_all(desc, VMA_SHARED_BIT, VMA_MAYWRITE_BIT)) {
@@ -703,6 +724,9 @@ static int ntfs_file_mmap_prepare(struct vm_area_desc *desc)
 static int ntfs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		u64 start, u64 len)
 {
+	if (NInoWofCompressed(NTFS_I(inode)))
+		return -EOPNOTSUPP;
+
 	return iomap_fiemap(inode, fieinfo, start, len, &ntfs_read_iomap_ops);
 }
 
@@ -1097,6 +1121,9 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 	if (mode & ~(NTFS_FALLOC_FL_SUPPORTED))
 		return -EOPNOTSUPP;
 
+	if (NInoCompressed(ni) || NInoEncrypted(ni) || NInoWofCompressed(ni))
+		return -EOPNOTSUPP;
+
 	if (!NVolFreeClusterKnown(vol))
 		wait_event(vol->free_waitq, NVolFreeClusterKnown(vol));
 
@@ -1120,7 +1147,7 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 	old_size = i_size_read(vi);
 
 	inode_lock(vi);
-	if (NInoCompressed(ni) || NInoEncrypted(ni)) {
+	if (NInoCompressed(ni) || NInoEncrypted(ni) || NInoWofCompressed(ni)) {
 		err = -EOPNOTSUPP;
 		goto out;
 	}
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 45e013eb3541..591dc63cb24c 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1091,6 +1091,11 @@ static int ntfs_read_locked_inode(struct inode *vi)
 		/* Setup the state. */
 		if (a->flags & (ATTR_COMPRESSION_MASK | ATTR_IS_SPARSE)) {
 			if (a->flags & ATTR_COMPRESSION_MASK) {
+				if (NInoWofCompressed(ni)) {
+					ntfs_error(vi->i_sb,
+						"Found native compression on a WOF file.");
+					goto unm_err_out;
+				}
 				NInoSetCompressed(ni);
 				ni->flags |= FILE_ATTR_COMPRESSED;
 				if (vol->cluster_size > 4096) {
@@ -1121,7 +1126,7 @@ static int ntfs_read_locked_inode(struct inode *vi)
 		}
 		if (a->non_resident) {
 			NInoSetNonResident(ni);
-			if (NInoCompressed(ni) || NInoSparse(ni)) {
+			if (NInoCompressed(ni) || (NInoSparse(ni) && !NInoWofCompressed(ni))) {
 				if (NInoCompressed(ni) &&
 				    a->data.non_resident.compression_unit != 4) {
 					ntfs_error(vi->i_sb,
@@ -1400,7 +1405,7 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
 				"Attribute name is placed after the mapping pairs array.");
 			goto unm_err_out;
 		}
-		if (NInoCompressed(ni) || NInoSparse(ni)) {
+		if (NInoCompressed(ni) || (NInoSparse(ni) && !NInoWofCompressed(ni))) {
 			if (NInoCompressed(ni) && a->data.non_resident.compression_unit != 4) {
 				ntfs_error(vi->i_sb,
 					"Found non-standard compression unit (%u instead of 4).  Cannot handle this.",
diff --git a/fs/ntfs/ntfs.h b/fs/ntfs/ntfs.h
index 45064dbcc2e4..df5a75d506f6 100644
--- a/fs/ntfs/ntfs.h
+++ b/fs/ntfs/ntfs.h
@@ -202,6 +202,10 @@ static inline struct ntfs_volume *NTFS_SB(struct super_block *sb)
 
 /* From fs/ntfs/compress.c */
 int ntfs_read_compressed_block(struct folio *folio);
+#ifdef CONFIG_NTFS_FS_WOF_COMPRESSION
+int ntfs_read_wof_compressed_block(struct folio *folio);
+void ntfs_wof_free_workspaces(void);
+#endif
 int allocate_compression_buffers(void);
 void free_compression_buffers(void);
 int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
diff --git a/fs/ntfs/reparse.c b/fs/ntfs/reparse.c
index 12a7baf1badd..8761511dbffb 100644
--- a/fs/ntfs/reparse.c
+++ b/fs/ntfs/reparse.c
@@ -223,25 +223,9 @@ static bool valid_reparse_data(struct ntfs_inode *ni,
 			return false;
 		break;
 	case IO_REPARSE_TAG_WOF: {
-		const struct wof_reparse_data *wof_data =
-			(const struct wof_reparse_data *)reparse_attr->reparse_data;
-
 		if (!valid_reparse_buffer(ni, reparse_attr, size,
 					  sizeof(struct wof_reparse_data)))
 			return false;
-
-		if (le16_to_cpu(reparse_attr->reparse_data_length) <
-		    sizeof(struct wof_reparse_data) ||
-		    wof_data->version != WOF_CURRENT_VERSION ||
-		    wof_data->provider != WOF_PROVIDER_FILE ||
-		    wof_data->provider_version !=
-		    WOF_PROVIDER_CURRENT_VERSION)
-			return false;
-		if (wof_data->compression_format != WOF_COMPRESSION_XPRESS4K &&
-		    wof_data->compression_format != WOF_COMPRESSION_XPRESS8K &&
-		    wof_data->compression_format != WOF_COMPRESSION_XPRESS16K &&
-		    wof_data->compression_format != WOF_COMPRESSION_LZX)
-			return false;
 		break;
 	}
 	default:
@@ -361,22 +345,35 @@ int ntfs_parse_reparse(struct ntfs_inode *ni, unsigned int *mode)
 			const struct wof_reparse_data *wof_data =
 				(const struct wof_reparse_data *)reparse_attr->reparse_data;
 
-			switch (wof_data->compression_format) {
-			case WOF_COMPRESSION_XPRESS4K:
-				ni->itype.compressed.block_size_bits = 12;
-				break;
-			case WOF_COMPRESSION_XPRESS8K:
-				ni->itype.compressed.block_size_bits = 13;
-				break;
-			case WOF_COMPRESSION_XPRESS16K:
-				ni->itype.compressed.block_size_bits = 14;
-				break;
-			case WOF_COMPRESSION_LZX:
-				ni->itype.compressed.block_size_bits = 15;
-				break;
+			ni->itype.compressed.block_size_bits = 0;
+			ni->itype.compressed.block_size = 0;
+			if (wof_data->version == WOF_CURRENT_VERSION &&
+			    wof_data->provider == WOF_PROVIDER_FILE &&
+			    wof_data->provider_version ==
+				    WOF_PROVIDER_CURRENT_VERSION) {
+				switch (wof_data->compression_format) {
+				case WOF_COMPRESSION_XPRESS4K:
+					ni->itype.compressed.block_size_bits =
+						12;
+					break;
+				case WOF_COMPRESSION_XPRESS8K:
+					ni->itype.compressed.block_size_bits =
+						13;
+					break;
+				case WOF_COMPRESSION_XPRESS16K:
+					ni->itype.compressed.block_size_bits =
+						14;
+					break;
+				case WOF_COMPRESSION_LZX:
+					ni->itype.compressed.block_size_bits =
+						15;
+					break;
+				}
 			}
-			ni->itype.compressed.block_size =
-				1 << ni->itype.compressed.block_size_bits;
+			if (ni->itype.compressed.block_size_bits)
+				ni->itype.compressed.block_size =
+					1
+					<< ni->itype.compressed.block_size_bits;
 #endif
 			NInoSetWofCompressed(ni);
 			VFS_I(ni)->i_mode &= ~0222;
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 8abe7bee4c0d..ab3f9847eea3 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -2691,6 +2691,9 @@ static void __exit exit_ntfs_fs(void)
 	 * destroy cache.
 	 */
 	rcu_barrier();
+#ifdef CONFIG_NTFS_FS_WOF_COMPRESSION
+	ntfs_wof_free_workspaces();
+#endif
 	kmem_cache_destroy(ntfs_big_inode_cache);
 	kmem_cache_destroy(ntfs_inode_cache);
 	kmem_cache_destroy(ntfs_name_cache);
diff --git a/fs/ntfs/wof.c b/fs/ntfs/wof.c
new file mode 100644
index 000000000000..444b7c4ee0d6
--- /dev/null
+++ b/fs/ntfs/wof.c
@@ -0,0 +1,668 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Windows System Compression (WOF) decompression glue.
+ *
+ * Copyright (c) 2026 LG Electronics Co., Ltd.
+ */
+
+#include <linux/fs.h>
+#include <linux/blkdev.h>
+#include <linux/overflow.h>
+#include <linux/pagemap.h>
+#include <linux/sched/mm.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+#include <linux/vmalloc.h>
+
+#include "ntfs.h"
+#include "inode.h"
+#include "debug.h"
+#include "ntfs_codec.h"
+#include "attrib.h"
+
+static const __le16 WOF_NAME[] = {
+	cpu_to_le16('W'), cpu_to_le16('o'), cpu_to_le16('f'),
+	cpu_to_le16('C'), cpu_to_le16('o'), cpu_to_le16('m'),
+	cpu_to_le16('p'), cpu_to_le16('r'), cpu_to_le16('e'),
+	cpu_to_le16('s'), cpu_to_le16('s'), cpu_to_le16('e'),
+	cpu_to_le16('d'), cpu_to_le16('D'), cpu_to_le16('a'),
+	cpu_to_le16('t'), cpu_to_le16('a'),
+};
+
+#define WOF_NAME_LEN 17
+
+#define NTFS_WOF_MAX_COMP_UNIT (1U << 15)
+#define NTFS_WOF_MAX_PAGES \
+	DIV_ROUND_UP(NTFS_WOF_MAX_COMP_UNIT + PAGE_SIZE - 1, PAGE_SIZE)
+
+struct ntfs_wof_workspace {
+	struct mutex *lock;
+	const struct ntfs_codec_ops *codec;
+	u32 comp_unit;
+	void *input;
+	size_t input_size;
+	void *output;
+	void *scratch;
+};
+
+static DEFINE_MUTEX(ntfs_wof_xpress4k_lock);
+static DEFINE_MUTEX(ntfs_wof_xpress8k_lock);
+static DEFINE_MUTEX(ntfs_wof_xpress16k_lock);
+static DEFINE_MUTEX(ntfs_wof_lzx32k_lock);
+
+static struct ntfs_wof_workspace ntfs_wof_xpress4k_workspace = {
+	.lock = &ntfs_wof_xpress4k_lock,
+	.codec = &ntfs_xpress4k_codec_ops,
+	.comp_unit = 1U << 12,
+};
+
+static struct ntfs_wof_workspace ntfs_wof_xpress8k_workspace = {
+	.lock = &ntfs_wof_xpress8k_lock,
+	.codec = &ntfs_xpress8k_codec_ops,
+	.comp_unit = 1U << 13,
+};
+
+static struct ntfs_wof_workspace ntfs_wof_xpress16k_workspace = {
+	.lock = &ntfs_wof_xpress16k_lock,
+	.codec = &ntfs_xpress16k_codec_ops,
+	.comp_unit = 1U << 14,
+};
+
+static struct ntfs_wof_workspace ntfs_wof_lzx32k_workspace = {
+	.lock = &ntfs_wof_lzx32k_lock,
+	.codec = &ntfs_lzx32k_codec_ops,
+	.comp_unit = 1U << 15,
+};
+
+static struct ntfs_wof_workspace *const ntfs_wof_workspaces[] = {
+	&ntfs_wof_xpress4k_workspace,
+	&ntfs_wof_xpress8k_workspace,
+	&ntfs_wof_xpress16k_workspace,
+	&ntfs_wof_lzx32k_workspace,
+};
+
+static struct ntfs_wof_workspace *ntfs_wof_workspace(u8 block_size_bits)
+{
+	switch (block_size_bits) {
+	case 12:
+		return &ntfs_wof_xpress4k_workspace;
+	case 13:
+		return &ntfs_wof_xpress8k_workspace;
+	case 14:
+		return &ntfs_wof_xpress16k_workspace;
+	case 15:
+		return &ntfs_wof_lzx32k_workspace;
+	default:
+		return NULL;
+	}
+}
+
+static int ntfs_wof_workspace_prepare(struct ntfs_wof_workspace *ws)
+{
+	void *input, *output, *scratch;
+	size_t scratch_size;
+
+	if (ws->input)
+		return 0;
+
+	ws->input_size = round_up((size_t)ws->comp_unit + 511, 512);
+	scratch_size = ws->codec->scratch_size(ws->comp_unit);
+	if (!scratch_size)
+		return -EINVAL;
+
+	input = kvmalloc(ws->input_size, GFP_NOFS);
+	output = kvmalloc(ws->comp_unit, GFP_NOFS);
+	scratch = kvzalloc(scratch_size, GFP_NOFS);
+	if (!input || !output || !scratch) {
+		kvfree(input);
+		kvfree(output);
+		kvfree(scratch);
+		return -ENOMEM;
+	}
+
+	ws->input = input;
+	ws->output = output;
+	ws->scratch = scratch;
+	return 0;
+}
+
+void ntfs_wof_free_workspaces(void)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ntfs_wof_workspaces); i++) {
+		struct ntfs_wof_workspace *ws = ntfs_wof_workspaces[i];
+
+		mutex_lock(ws->lock);
+		kvfree(ws->input);
+		kvfree(ws->output);
+		kvfree(ws->scratch);
+		ws->input = NULL;
+		ws->output = NULL;
+		ws->scratch = NULL;
+		mutex_unlock(ws->lock);
+	}
+}
+
+static int ntfs_bdev_read_from_rl(struct ntfs_volume *vol,
+				  struct runlist *runlist,
+				  sector_t start_sector, u64 sector_count,
+				  void *buf)
+{
+	struct runlist_element *rl;
+	u32 sec_per_clu_bits;
+	s64 vcn;
+	u64 sec_off;
+	size_t buf_off = 0;
+	unsigned int nofs_flags;
+	int err;
+
+	if (vol->cluster_size_bits < 9)
+		return -EINVAL;
+	sec_per_clu_bits = vol->cluster_size_bits - 9;
+	vcn = start_sector >> sec_per_clu_bits;
+	sec_off = start_sector & ((1ULL << sec_per_clu_bits) - 1);
+
+	nofs_flags = memalloc_nofs_save();
+	down_read(&runlist->lock);
+	if (!runlist->rl) {
+		err = -EINVAL;
+		goto out_unlock;
+	}
+
+	rl = __ntfs_attr_find_vcn_nolock(runlist, vcn);
+	if (IS_ERR(rl)) {
+		err = PTR_ERR(rl);
+		goto out_unlock;
+	}
+
+	while (sector_count > 0) {
+		s64 lcn;
+		s64 rl_end;
+		u64 byte_off, byte_len, sectors, available;
+
+		if (rl->length <= 0 || vcn < rl->vcn) {
+			err = -EINVAL;
+			goto out_unlock;
+		}
+
+		lcn = ntfs_rl_vcn_to_lcn(rl, vcn);
+		if (lcn < 0 && lcn != LCN_HOLE) {
+			err = -EINVAL;
+			goto out_unlock;
+		}
+
+		if (check_add_overflow(rl->vcn, rl->length, &rl_end) ||
+		    rl_end <= vcn ||
+		    (u64)(rl_end - vcn) > (U64_MAX >> sec_per_clu_bits)) {
+			err = -EOVERFLOW;
+			goto out_unlock;
+		}
+		available = (u64)(rl_end - vcn) << sec_per_clu_bits;
+		if (available <= sec_off) {
+			err = -EINVAL;
+			goto out_unlock;
+		}
+		available -= sec_off;
+		sectors = min_t(u64, sector_count, available);
+		if (check_mul_overflow(sectors, (u64)SECTOR_SIZE, &byte_len) ||
+		    byte_len > SIZE_MAX - buf_off) {
+			err = -EOVERFLOW;
+			goto out_unlock;
+		}
+
+		if (lcn == LCN_HOLE) {
+			memset((u8 *)buf + buf_off, 0, byte_len);
+		} else {
+			byte_off = ntfs_cluster_to_bytes(vol, lcn);
+			if (check_add_overflow(byte_off, sec_off << 9,
+					       &byte_off) ||
+			    byte_off > S64_MAX) {
+				err = -EOVERFLOW;
+				goto out_unlock;
+			}
+			err = ntfs_bdev_read(vol->sb->s_bdev,
+					     (char *)buf + buf_off,
+					     (loff_t)byte_off, byte_len);
+			if (err)
+				goto out_unlock;
+		}
+
+		buf_off += byte_len;
+		sector_count -= sectors;
+		rl++;
+		vcn = rl->vcn;
+		sec_off = 0;
+	}
+
+	err = 0;
+out_unlock:
+	up_read(&runlist->lock);
+	memalloc_nofs_restore(nofs_flags);
+	return err;
+}
+
+static int parse_wof_chunk_table(struct ntfs_inode *base_ni,
+				 struct ntfs_inode *ni, u64 chunk_idx,
+				 u64 chunk_count, u64 *chunk_offset,
+				 u32 *chunk_size, void *table_buf,
+				 size_t table_buf_size)
+{
+	u8 bytes_per_off;
+	u8 *buf;
+	u64 off[2];
+	u64 byte_off, chunk_data_size, table_size;
+	u32 bytes_to_read;
+	int ret = 0;
+
+	if (i_size_read(VFS_I(base_ni)) < (1ULL << 32))
+		bytes_per_off = sizeof(__le32);
+	else
+		bytes_per_off = sizeof(__le64);
+
+	if (!chunk_count || chunk_idx >= chunk_count)
+		return -EINVAL;
+
+	table_size = (chunk_count - 1) * bytes_per_off;
+	if (ni->data_size < table_size)
+		return -EINVAL;
+	chunk_data_size = ni->data_size - table_size;
+
+	if (chunk_count == 1) {
+		if (chunk_data_size > U32_MAX)
+			return -EINVAL;
+		*chunk_offset = 0;
+		*chunk_size = chunk_data_size;
+		return 0;
+	}
+
+	byte_off = chunk_idx ? (chunk_idx - 1) * bytes_per_off : 0;
+	bytes_to_read = chunk_idx + 1 == chunk_count ?
+				bytes_per_off :
+				(chunk_idx ? 2 : 1) * bytes_per_off;
+
+	if (!NInoNonResident(ni))
+		return -EOPNOTSUPP;
+
+	{
+		sector_t start_sector = byte_off >> 9;
+		u32 sector_off = byte_off & ((1 << 9) - 1);
+		u32 sectors = DIV_ROUND_UP(sector_off + bytes_to_read, 512);
+
+		if ((size_t)sectors << 9 > table_buf_size)
+			return -EINVAL;
+		buf = table_buf;
+		ret = ntfs_bdev_read_from_rl(ni->vol, &ni->runlist,
+					     start_sector, sectors, buf);
+		if (ret) {
+			ret = -EIO;
+			return ret;
+		}
+		buf += sector_off;
+	}
+
+	if (bytes_per_off == sizeof(__le32)) {
+		off[0] = chunk_idx ? get_unaligned_le32(buf) : 0;
+		off[1] = chunk_idx + 1 == chunk_count ?
+				 chunk_data_size :
+				 get_unaligned_le32(buf + bytes_per_off);
+	} else {
+		off[0] = chunk_idx ? get_unaligned_le64(buf) : 0;
+		off[1] = chunk_idx + 1 == chunk_count ?
+				 chunk_data_size :
+				 get_unaligned_le64(buf + bytes_per_off);
+	}
+
+	if (off[1] <= off[0] || off[1] > chunk_data_size ||
+	    off[1] - off[0] > U32_MAX) {
+		ret = -EINVAL;
+		return ret;
+	}
+
+	*chunk_offset = table_size + off[0];
+	*chunk_size = off[1] - off[0];
+	return ret;
+}
+
+static int ntfs_read_wof_chunk(struct ntfs_volume *vol,
+			       struct ntfs_inode *wof_ni, u64 chunk_offset,
+			       u32 chunk_size, void *input, size_t input_size,
+			       char **chunk_mem)
+{
+	u32 input_offset = chunk_offset & 511;
+	u32 input_size_aligned;
+	int err;
+
+	input_size_aligned = round_up(chunk_size + input_offset, 512);
+	if (input_size_aligned > input_size)
+		return -EINVAL;
+
+	if (!NInoNonResident(wof_ni))
+		return -EOPNOTSUPP;
+
+	err = ntfs_bdev_read_from_rl(vol, &wof_ni->runlist, chunk_offset >> 9,
+				     input_size_aligned >> 9, input);
+	if (err)
+		return err;
+	*chunk_mem = (u8 *)input + input_offset;
+	return 0;
+}
+
+struct ntfs_wof_dest {
+	struct folio *folios[NTFS_WOF_MAX_PAGES];
+	struct page *pages[NTFS_WOF_MAX_PAGES];
+	unsigned int nr_folios;
+	unsigned int nr_pages;
+};
+
+static void ntfs_wof_release_dest(struct ntfs_wof_dest *dest,
+				  struct folio *target, bool success)
+{
+	unsigned int i;
+
+	for (i = 0; i < dest->nr_folios; i++) {
+		struct folio *folio = dest->folios[i];
+
+		if (folio == target)
+			continue;
+		if (success) {
+			flush_dcache_folio(folio);
+			folio_mark_uptodate(folio);
+		} else {
+			folio_clear_uptodate(folio);
+		}
+		folio_unlock(folio);
+		folio_put(folio);
+	}
+}
+
+static int ntfs_wof_collect_dest(struct address_space *mapping,
+				 struct folio *target, loff_t chunk_start,
+				 loff_t chunk_end, struct ntfs_wof_dest *dest)
+{
+	pgoff_t index, last, page_index;
+	unsigned int i;
+
+	memset(dest, 0, sizeof(*dest));
+	index = chunk_start >> PAGE_SHIFT;
+	last = (chunk_end - 1) >> PAGE_SHIFT;
+	while (index <= last) {
+		struct folio *folio;
+		pgoff_t next;
+		bool is_target;
+
+		if (folio_contains(target, index)) {
+			folio = target;
+			is_target = true;
+		} else {
+			folio = __filemap_get_folio(
+				mapping, index,
+				FGP_LOCK | FGP_CREAT | FGP_NOFS | FGP_NOWAIT,
+				GFP_NOFS);
+			if (IS_ERR(folio))
+				return PTR_ERR(folio);
+			is_target = false;
+			if (folio_pos(folio) < chunk_start ||
+			    folio_next_pos(folio) > chunk_end) {
+				folio_unlock(folio);
+				folio_put(folio);
+				return -EAGAIN;
+			}
+		}
+
+		if (dest->nr_folios == ARRAY_SIZE(dest->folios)) {
+			if (!is_target) {
+				folio_unlock(folio);
+				folio_put(folio);
+			}
+			return -EINVAL;
+		}
+		dest->folios[dest->nr_folios++] = folio;
+		next = folio->index + folio_nr_pages(folio);
+		if (next <= index)
+			return -EAGAIN;
+		index = next;
+	}
+
+	for (page_index = chunk_start >> PAGE_SHIFT; page_index <= last;
+	     page_index++) {
+		struct folio *folio = NULL;
+
+		for (i = 0; i < dest->nr_folios; i++) {
+			if (folio_contains(dest->folios[i], page_index)) {
+				folio = dest->folios[i];
+				break;
+			}
+		}
+		if (!folio || dest->nr_pages == ARRAY_SIZE(dest->pages))
+			return -EAGAIN;
+		dest->pages[dest->nr_pages++] =
+			folio_page(folio, page_index - folio->index);
+	}
+	return 0;
+}
+
+static int ntfs_wof_decode(struct ntfs_wof_workspace *ws, const void *src,
+			   u32 src_len, void *dst, u32 dst_len)
+{
+	if (src_len == dst_len) {
+		memcpy(dst, src, dst_len);
+		return 0;
+	}
+	return ws->codec->decompress_chunk(ws->scratch, src, src_len, dst,
+					   dst_len, ws->comp_unit);
+}
+
+static int ntfs_wof_decode_page_direct(struct ntfs_wof_workspace *ws,
+				       struct folio *target, loff_t chunk_start,
+				       const void *src, u32 src_len,
+				       u32 dst_len)
+{
+	unsigned int page_offset = offset_in_page(chunk_start);
+	struct page *page;
+	pgoff_t page_index;
+	void *addr;
+	int err;
+
+	page_index = chunk_start >> PAGE_SHIFT;
+	if (!folio_contains(target, page_index))
+		return -EAGAIN;
+
+	page = folio_page(target, page_index - target->index);
+	addr = kmap_local_page(page);
+	err = ntfs_wof_decode(ws, src, src_len, (u8 *)addr + page_offset,
+			      dst_len);
+	kunmap_local(addr);
+	if (err)
+		return -EINVAL;
+	return 0;
+}
+
+static int ntfs_wof_decode_folios_direct(struct ntfs_wof_workspace *ws,
+					 struct address_space *mapping,
+					 struct folio *target,
+					 loff_t chunk_start, loff_t chunk_end,
+					 const void *src, u32 src_len,
+					 u32 dst_len)
+{
+	unsigned int page_offset = offset_in_page(chunk_start);
+	struct ntfs_wof_dest dest;
+	void *addr;
+	unsigned int nofs_flags;
+	int err;
+
+	err = ntfs_wof_collect_dest(mapping, target, chunk_start, chunk_end,
+				    &dest);
+	if (err) {
+		ntfs_wof_release_dest(&dest, target, false);
+		return -EAGAIN;
+	}
+
+	nofs_flags = memalloc_nofs_save();
+	addr = vmap(dest.pages, dest.nr_pages, VM_MAP, PAGE_KERNEL);
+	memalloc_nofs_restore(nofs_flags);
+	if (!addr) {
+		ntfs_wof_release_dest(&dest, target, false);
+		return -EAGAIN;
+	}
+
+	err = ntfs_wof_decode(ws, src, src_len, (u8 *)addr + page_offset,
+			      dst_len);
+	vunmap(addr);
+	if (err) {
+		ntfs_wof_release_dest(&dest, target, false);
+		return -EINVAL;
+	}
+	ntfs_wof_release_dest(&dest, target, true);
+	return 0;
+}
+
+static int ntfs_wof_try_direct(struct ntfs_wof_workspace *ws,
+			       struct address_space *mapping,
+			       struct folio *target, loff_t chunk_start,
+			       loff_t chunk_end, const void *src, u32 src_len,
+			       u32 dst_len)
+{
+	unsigned int page_offset = offset_in_page(chunk_start);
+
+	if (dst_len <= PAGE_SIZE - page_offset)
+		return ntfs_wof_decode_page_direct(ws, target, chunk_start, src,
+						   src_len, dst_len);
+
+	return ntfs_wof_decode_folios_direct(ws, mapping, target, chunk_start,
+					     chunk_end, src, src_len, dst_len);
+}
+
+int ntfs_read_wof_compressed_block(struct folio *folio)
+{
+	struct address_space *mapping = folio->mapping;
+	struct ntfs_inode *ni = NTFS_I(mapping->host), *wof_ni;
+	struct inode *wof_inode;
+	struct ntfs_volume *vol = ni->vol;
+	struct ntfs_wof_workspace *ws;
+	loff_t i_size = i_size_read(VFS_I(ni));
+	loff_t folio_start = folio_pos(folio);
+	loff_t folio_end = folio_next_pos(folio);
+	char *chunk_mem;
+	u32 decomp_size;
+	u64 chunk_count, chunk_idx, last_chunk, chunk_offset;
+	int err = 0;
+
+	ws = ntfs_wof_workspace(ni->itype.compressed.block_size_bits);
+	if (!ws) {
+		err = -EOPNOTSUPP;
+		goto out;
+	}
+
+	if (folio_start >= i_size) {
+		folio_zero_segment(folio, 0, folio_size(folio));
+		goto out;
+	}
+
+	wof_inode = ntfs_attr_iget(VFS_I(ni), AT_DATA, (__le16 *)WOF_NAME,
+				   WOF_NAME_LEN);
+	if (IS_ERR(wof_inode)) {
+		err = PTR_ERR(wof_inode);
+		goto out;
+	}
+
+	wof_ni = NTFS_I(wof_inode);
+	if (wof_ni->initialized_size != wof_ni->data_size) {
+		ntfs_error(vol->sb,
+			   "WOF compressed stream is not fully initialized (init %lld, data %lld).",
+			   wof_ni->initialized_size, wof_ni->data_size);
+		err = -EIO;
+		goto out_iput;
+	}
+	if (!NInoNonResident(wof_ni)) {
+		err = -EOPNOTSUPP;
+		goto out_iput;
+	}
+	if (!NInoFullyMapped(wof_ni)) {
+		down_write(&wof_ni->runlist.lock);
+		if (!NInoFullyMapped(wof_ni))
+			err = ntfs_attr_map_whole_runlist(wof_ni);
+		up_write(&wof_ni->runlist.lock);
+		if (err)
+			goto out_iput;
+	}
+
+	mutex_lock(ws->lock);
+	err = ntfs_wof_workspace_prepare(ws);
+	if (err)
+		goto out_unlock_ws;
+
+	chunk_idx = div_u64(folio_start, ws->comp_unit);
+	last_chunk =
+		div_u64(min_t(loff_t, folio_end, i_size) - 1, ws->comp_unit);
+	chunk_count = DIV_ROUND_UP_ULL(i_size, ws->comp_unit);
+	for (; chunk_idx <= last_chunk; chunk_idx++) {
+		u32 chunk_size;
+		u64 chunk_file_offset;
+		loff_t chunk_end, copy_start, copy_end;
+
+		err = parse_wof_chunk_table(ni, wof_ni, chunk_idx, chunk_count,
+					    &chunk_offset, &chunk_size,
+					    ws->input, ws->input_size);
+		if (err)
+			goto out_unlock_ws;
+		decomp_size = chunk_idx + 1 == chunk_count ?
+				      i_size - chunk_idx * ws->comp_unit :
+				      ws->comp_unit;
+		if (!chunk_size || chunk_size > decomp_size) {
+			ntfs_error(
+				vol->sb,
+				"Invalid compressed size (%u) for frame size (%u)",
+				chunk_size, decomp_size);
+			err = -EINVAL;
+			goto out_unlock_ws;
+		}
+
+		err = ntfs_read_wof_chunk(vol, wof_ni, chunk_offset, chunk_size,
+					  ws->input, ws->input_size,
+					  &chunk_mem);
+		if (err)
+			goto out_unlock_ws;
+
+		chunk_file_offset = chunk_idx * ws->comp_unit;
+		chunk_end = chunk_file_offset + decomp_size;
+		err = ntfs_wof_try_direct(ws, mapping, folio, chunk_file_offset,
+					  chunk_end, chunk_mem, chunk_size,
+					  decomp_size);
+		if (!err)
+			continue;
+		if (err != -EAGAIN)
+			goto out_unlock_ws;
+
+		err = ntfs_wof_decode(ws, chunk_mem, chunk_size, ws->output,
+				      decomp_size);
+		if (err) {
+			ntfs_error(vol->sb, "Decompression failed: %d", err);
+			err = -EINVAL;
+			goto out_unlock_ws;
+		}
+		copy_start = max_t(loff_t, folio_start, chunk_file_offset);
+		copy_end = min_t(loff_t, folio_end,
+				 chunk_file_offset + decomp_size);
+		memcpy_to_folio(folio, copy_start - folio_start,
+				ws->output + copy_start - chunk_file_offset,
+				copy_end - copy_start);
+	}
+
+	if (folio_end > i_size)
+		folio_zero_segment(folio, i_size - folio_start,
+				   folio_size(folio));
+out_unlock_ws:
+	mutex_unlock(ws->lock);
+out_iput:
+	iput(wof_inode);
+out:
+	if (!err) {
+		flush_dcache_folio(folio);
+		folio_mark_uptodate(folio);
+	} else {
+		folio_clear_uptodate(folio);
+	}
+	folio_unlock(folio);
+	return err;
+}

-- 
2.43.0

