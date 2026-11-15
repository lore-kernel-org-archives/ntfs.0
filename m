Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749251;
	b=MEEJXnsYBJrrFjDKjriacMCHJKeQYyAu268tmaCVxqtnU4rFvsIHq7c1WqYC+9qtA5Vp
	 5YUae6aEMg8FzYJErI3nzuezTd/nuxhBDquC6wy/y9F4fpO8wNggR+Jt/Bl0MqxY+lxe/
	 v4AVsfVjYjFJwXbKGAmwBcmLriINOmdxTtyVaYGNarUZuSDAVdysJ+2+bIgiiybLTZU60
	 BCgt4nPOzro2cx1C+mzBW4WBhQC85hZniALC9iUXJ1FoSZKuOsuzENC2kZY0xoG+pBvsO
	 TAt+2GUE1IbKWFUnYPESLLnukFb3tGPaHLa+fu3hUiixy99DVJShBciuMXGH1/B+b0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749251;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=1jFE1IGMcuyCuZXQl2Is0ps1VLwkmCGSQjEBczV5rqA=;
	b=IkZv2apBUrY6B5wCIjn1KCGA57MxvwNawm+L1sI9pT7OpgwAcqT9aXTiqb8btKGqQBWT
	 y6gs1n8ubO8yuCM/utIfF3Ko+V4AJhUaYrdHTrDaBCb+ec4Cl/pp2nj3uR9yu//3ZK8Gz
	 jcw0w4ICAM1i/PQgfywHp5Bh3XckLVCCMZVnwmuVUR4L2LTaBxtVnqDAjb49JAKFOVLl+
	 07x2RF/oqS4Ec5pSlnWbq82cxe5o1s6sytHq5xJT8FFJS2iC80Ov4tYeRVUbT4uU8zI1O
	 uOOIPvGJ9wmSGs0UjeVP+ib/TL/5lb7onBnWVQ68LvaHDZWgmtq4Ko3+8mK/OeVW/+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PVvisqBE;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A131606A31A
	for <ntfs@lists.linux.dev>; Sun, 15 Nov 2026 13:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A131606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PVvisqBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=1j
	FE1IGMcuyCuZXQl2Is0ps1VLwkmCGSQjEBczV5rqA=; b=PVvisqBEAKPMfSdUHG
	jEbkgZojMl8o8FQa1bDrVQVEUu5dWaCWS3vpDSUuOtzrVRNdd25T+wKidvb8+6jN
	PrnRkPSQ18lKKOnaWnTBGX3InQw/aVf6fX0whL6AhoqR0uz0wjSQxr3oEfveNNfm
	+v2ErsBKw/J+y+F92ARcNP338=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXP_A1s_lqfjtyIQ--.47831S4;
	Sun, 15 Nov 2026 21:27:19 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 10/12] ntfs: write unlinked file attributes before dropping their cache
Date: Sun, 15 Nov 2026 21:26:07 +0800
Message-ID: <20261115132609.209957-11-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wDXP_A1s_lqfjtyIQ--.47831S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxKF1ftr1UuFWDWrW8Jr4DXFb_yoW7Aw1fpF
	Z3CrZxtr4DXw12gws3ta1jq3WSq34xKr4UJry7Gr17A3ZYqr12gFWIk348tF1ftrWDWrWq
	qr4q9r4xuFWxXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDwIDUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RcT3Wr5szd1XgAA3M

From: Xuewen Wang <wangxuewen@kylinos.cn>

Zero-link internal attribute inodes are evicted at the final iput(),
discarding dirty folios while the base file may still be open.

Make writes and conversions synchronous when the attribute inode's own
link count is zero, even after O_TMPFILE publication. Preserve the named
stream writeback path.

Write converted data before committing the nonresident layout so
failures preserve the resident value. Propagate conversion I/O errors
while still skipping busy candidates.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes since v3: check the attribute inode's own link count in both
write paths. Adapt to the merged named-stream conversion fix, retaining
NOWAIT and skipping busy candidates while propagating I/O errors.

Tested publication/rewrite while fsync held a zero-link EA inode, SD/EA
persistence with 512-byte/4 KiB/8 KiB clusters, and block-write EIO during
EA conversion. The resident value and free space were preserved on EIO;
retry and reboot passed. Locked fallback folios, conversion errors and
uncached named-stream conversion also passed.

 fs/ntfs/attrib.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++--
 fs/ntfs/inode.c  |  8 +++++++
 2 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index a88dc62c6a4e..af044ea895fc 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -16,6 +16,7 @@
  * Copyright (c) 2010 Erik Larsson
  */
 
+#include <linux/bio.h>
 #include <linux/string_choices.h>
 #include <linux/writeback.h>
 #include <linux/iomap.h>
@@ -1961,6 +1962,40 @@ int ntfs_resident_attr_value_resize(struct mft_record *m, struct attr_record *a,
 	return 0;
 }
 
+/* Write the resident value to its new clusters before committing conversion. */
+static int ntfs_attr_write_conversion(struct ntfs_volume *vol, struct folio *folio,
+				      const struct runlist_element *rl, u32 size)
+{
+	unsigned int offset = 0;
+
+	size = round_up(size, vol->sector_size);
+	while (size) {
+		struct bio *bio;
+		unsigned int len;
+		int err;
+
+		if (!rl->length || rl->lcn < 0)
+			return -EIO;
+		len = min_t(s64, size, ntfs_cluster_to_bytes(vol, rl->length));
+		bio = bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRITE | REQ_SYNC,
+				GFP_NOIO);
+		bio->bi_iter.bi_sector =
+			ntfs_bytes_to_bio_sector(ntfs_cluster_to_bytes(vol, rl->lcn));
+		if (!bio_add_folio(bio, folio, len, offset)) {
+			bio_put(bio);
+			return -EIO;
+		}
+		err = submit_bio_wait(bio);
+		bio_put(bio);
+		if (err)
+			return err;
+		offset += len;
+		size -= len;
+		rl++;
+	}
+	return 0;
+}
+
 /*
  * ntfs_attr_make_non_resident - convert a resident to a non-resident attribute
  * @ni:		ntfs inode describing the attribute to convert
@@ -2004,6 +2039,7 @@ static int __ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_s
 	int mp_size, mp_ofs, name_ofs, arec_size, err, err2;
 	u32 attr_size;
 	u8 old_res_attr_flags;
+	bool sync;
 
 	if (NInoNonResident(ni)) {
 		ntfs_warning(vol->sb,
@@ -2028,6 +2064,8 @@ static int __ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_s
 		base_ni = ni;
 	else
 		base_ni = ni->ext.base_ntfs_ino;
+	sync = NInoAttr(ni) && !vi->i_nlink &&
+		!ntfs_inode_is_named_stream(ni);
 	m = map_mft_record(base_ni);
 	if (IS_ERR(m)) {
 		err = PTR_ERR(m);
@@ -2150,6 +2188,18 @@ static int __ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_s
 		folio_mark_uptodate(folio);
 	}
 
+	/*
+	 * A zero-link attribute inode can be evicted by the caller's iput().
+	 * Write its data before changing the record so an I/O failure leaves
+	 * the resident value intact. Normal writeback would take mrec_lock,
+	 * which callers may already hold.
+	 */
+	if (folio && sync) {
+		err = ntfs_attr_write_conversion(vol, folio, rl, attr_size);
+		if (err)
+			goto rl_err_out;
+	}
+
 	/* Backup the attribute flag. */
 	old_res_attr_flags = a->data.resident.flags;
 	/* Resize the resident part of the attribute record. */
@@ -2238,7 +2288,8 @@ static int __ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_s
 	unmap_mft_record(base_ni);
 	up_write(&ni->runlist.lock);
 	if (folio) {
-		iomap_dirty_folio(vi->i_mapping, folio);
+		if (!sync)
+			iomap_dirty_folio(vi->i_mapping, folio);
 		folio_unlock(folio);
 		folio_put(folio);
 	}
@@ -5040,8 +5091,11 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 			continue;
 		}
 
-		if (__ntfs_attr_make_non_resident(NTFS_I(tvi), value_len, true)) {
+		err = __ntfs_attr_make_non_resident(NTFS_I(tvi), value_len, true);
+		if (err) {
 			iput(tvi);
+			if (err != -ENOSPC && err != -EPERM && err != -EAGAIN)
+				goto put_err_out;
 			continue;
 		}
 
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 885818f00b78..4a4d7d36ad34 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -4090,6 +4090,14 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
 
 	WARN_ON(!NInoAttr(ni));
 
+	/*
+	 * A zero-link attribute inode is evicted at the final iput(), even
+	 * if its base file has since been linked. Write its data before
+	 * eviction can discard the dirty pages.
+	 */
+	if (!vi->i_nlink && !ntfs_inode_is_named_stream(ni))
+		sync = true;
+
 	if (ntfs_inode_is_named_stream(ni)) {
 		if (NInoEncrypted(ni))
 			return -EACCES;

