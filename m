Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA2D2DBF75
	for <ntfs@lists.linux.dev>; Sun, 23 Aug 2026 07:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787469212; cv=none; b=W6byalNs9r5lZbeF6o7VtqO5+Ovj6Fz4IVe8WzkTOFqAu6YFIFrwREIeUvxoaWIXT2IiuJbFGbgn569P0Yb3nvFVKppoMxliUfmgsn4UoTtRUAnFuiVJWJv80GXEs+IuZ7T8YH07kylCA+qRAaRSRVkHe8Az5p+CPVQFG4v6bPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787469212; c=relaxed/simple;
	bh=uCTGtqJXrK8lwhvEJIOKmTFFVlddUz3i6sN9V9Rec3Y=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=DhwqYvgmSQVtzuww3L7o1gb/GCtq9uNgKHkLaUlgfoxJ/wEXcz/BNA19Ta+aK/rux5afsApiRvVrxv53p6wO25+FEUrrccK3yGd/BJnB3e33FnZpy9AJw1rXG+BHQKXzcXnfcnLngM1aKJjoxNjF7FWdbkibHSah89hl/lVjOwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWGfGCNW; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWGfGCNW"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3259283a91.2
        for <ntfs@lists.linux.dev>; Sun, 23 Aug 2026 00:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787469211; x=1788074011; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:subject:cc:to:from
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPYc6Oovb7zE053E0oPNH9wsZBParJtaMt+S6mevKmU=;
        b=WWGfGCNWDyWXAv32oO3DW6yWVyfmz3bB4kaRwv1xL28jsIVhbNMfId4iPC8YsrYgJt
         wCgYqlTEQO+znSNnOy8Eye2CJ+xXO0PyhAAM8ee0e6B3Mk4wJMeP7gB5bSC42ICW4v17
         M1/uBSO29pD841vmVmocr1gO8rX8nkwQJDgTYxn7RUWtaeh65X0x5URW8UgYHzL788N1
         +ldfJb2xkI7Ig1LL/Dlx+fK9UnqSEdS1jC7fXVZs4vhJOCdODQNQAfBakjxA6qEIKGg+
         GWYamMVhtdJ5ZWy6aUPLmtjXPxHgBbTdpsZ3Di8NXwe+4Te+WV65J87k28BhDVpP+KDQ
         VNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787469211; x=1788074011;
        h=content-disposition:content-type:mime-version:subject:cc:to:from
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPYc6Oovb7zE053E0oPNH9wsZBParJtaMt+S6mevKmU=;
        b=KnCvf3sfsOUeFW8ZBVHVIg7g9d/w4QKpTj+xVDGOebir7T14IaabEEyU9YeHgXdofH
         F292eYA0NaFniWx6ByjR+81M1vZrmOSTKlozorjd3+ebyHUKXXxtN7i9Y/MRNm5uHssY
         90mBaq43TSmx14Nj6jsLFa4IfYn91GxNO6ONlPKQNo6PABzacZ3Xbh85VCR66CBXvMtT
         CRGtdgADEQ36JEyXk8cLQe7jJ44dflnK4YvifPT2WBC6NQKlyxVqnkbx/155zHlJH8vl
         Ew1Vb9oUmD5dSAEwvjBQPYU1QyUZxCit0Zbvk6krqkM3Pka3x0RsAU944EvwdIrbyzfE
         fAGA==
X-Gm-Message-State: AFuF++mMa9kkcsM3X6FhnK+8A/NA/T3DcK8/nl29ztyNTPEc4r3yPhbF
	V9CW3cCuP8IWAH3TqdMXWPT77a6VjZ7OTsTcQqEN6kx7AsHUapL8bi+q5FKS3Ezq6dM=
X-Gm-Gg: AR+sD10RqKgVpGYoQKbGtc8i2CJedRcdU+Cp5OXVE4aECZfZiCg3N9at7z2t0881XO4
	po1b7QYLVnrZFuprJwU/wYUwDqII8V9NV1Q+RRzONPWVvsacU+17pyvSpOIeZaYb4EkCB/z4w1n
	ur93v5TjP+7hTGzqGBiOHvqnxr4xO2Gpwi/fr8SQgcxgq4zpCqJlv9EJfG4ekeNmifspaBBoKpx
	03ToDfg+v+JUqx+nBA9Q+Q5Pmk9rtNVztTO4TFWRGFANqLS1mqO+85dgS7yp+Qyyi57exi1/Sei
	79bTF2hjGIvQkxbGgkoApGCA+LIJsy/OgrYI1TvnD3UdqD6jjT/20Pd9El/XjJXq82Ak0/ldCli
	1cXRu88Hz90bLzM5ucJamZyhdqnF0VNmrw0mTJsfMIGJ4KROWKKK/Yoj3lFWgbeL1tO3LfTCRW0
	/7Plc7ehg2JgqPi18aUs4fN6S966Od2wgsB2Vrg85XgHYQ1j2WGiOnV3oJqqmo62t3Hr/LQtFuz
	1FEOyNc2Xn77sSc7DhHAkZcZmJyTZDHNxC6blDdrtvELg==
X-Received: by 2002:a17:90b:3c84:b0:390:b41a:b92b with SMTP id 98e67ed59e1d1-395c3542369mr35043137a91.4.1787469210789;
        Sun, 23 Aug 2026 00:13:30 -0700 (PDT)
Received: from localhost (75-172-9-230.tukw.qwest.net. [75.172.9.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49985fcsm5214872a91.7.2026.08.23.00.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 00:13:30 -0700 (PDT)
Message-ID: <6a8a9d9a.fdee0002.34cbe9.559f@mx.google.com>
X-Google-Original-Message-ID: <aoqdlayttiHJyF0L@DESKTOP-HH660AU.>
Date: Sun, 23 Aug 2026 00:13:25 -0700
From: Dennis Tighe <dennis.tighe@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs: compute bi_sector in 512-byte units
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

bi_sector counts in 512 byte sectors and not in multiples of the
volume's sector size. Under "normal" circumstances (with 512 byte
sectors in NTFS) the current code works as is; however, when we have
a 4k sector size on the volume the current usage of NTFS_B_TO_SECTOR()
and ntfs_bytes_to_sector() end up converting to the number of 4k
sectors after mount.

Reads work today on 4k volumes as bdev-io.c as performing the shift
correctly inline. With writes, we end up with significant silent disk
corruption on these volumes.

This fixes changes to use the new ntfs_bytes_to_bio_sector() function
everywhere we're performing this calculation (including the existing
read path). For the change in inode.c it removes a dead code block
rather than updating.

Fixes: 40796051991d ("ntfs: update in-memory, on-disk structures and headers")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Dennis Tighe <dennis.tighe@gmail.com>
---
I tested this with local volumes that were created with 4k logical
sector sizes. This change seems to prevent the primary silent corruption
that was occuring without it (due to writes being made in unrelated
places).

Note this was found and test with AI assistance. 

 fs/ntfs/bdev-io.c  |  2 +-
 fs/ntfs/compress.c |  2 +-
 fs/ntfs/inode.c    | 10 ++--------
 fs/ntfs/mft.c      | 12 ++++++------
 fs/ntfs/ntfs.h     | 10 ++++------
 5 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/fs/ntfs/bdev-io.c b/fs/ntfs/bdev-io.c
index 86db4d9298ed..4f27eed3b072 100644
--- a/fs/ntfs/bdev-io.c
+++ b/fs/ntfs/bdev-io.c
@@ -34,7 +34,7 @@ int ntfs_bdev_read(struct block_device *bdev, char *data, loff_t start, size_t s
 	int error;
 	struct bio *bio;
 	blk_opf_t op;
-	sector_t sector = start >> SECTOR_SHIFT;
+	sector_t sector = ntfs_bytes_to_bio_sector(start);
 
 	if (start & (SECTOR_SIZE - 1))
 		return -EINVAL;
diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 2225630b19d7..197d8607fc63 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -1414,7 +1414,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 	bio_pos = ntfs_cluster_to_bytes(vol, bio_lcn);
 	bio = bio_alloc(vol->sb->s_bdev, DIV_ROUND_UP(bio_size, PAGE_SIZE),
 			REQ_OP_WRITE, GFP_NOIO);
-	bio->bi_iter.bi_sector = ntfs_bytes_to_sector(vol, bio_pos);
+	bio->bi_iter.bi_sector = ntfs_bytes_to_bio_sector(bio_pos);
 
 	for (i = 0; bio_size; i++) {
 		unsigned int len = min_t(unsigned int, bio_size, PAGE_SIZE);
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 32edb4045178..5aedc045f65a 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1852,7 +1852,7 @@ int ntfs_read_inode_mount(struct inode *vi)
 	struct mft_record *m = NULL;
 	struct attr_record *a;
 	struct ntfs_attr_search_ctx *ctx;
-	unsigned int i, nr_blocks;
+	unsigned int i;
 	int err;
 	size_t new_rl_count;
 
@@ -1896,11 +1896,6 @@ int ntfs_read_inode_mount(struct inode *vi)
 		goto err_out;
 	}
 
-	/* Determine the first block of the $MFT/$DATA attribute. */
-	nr_blocks = ntfs_bytes_to_sector(vol, vol->mft_record_size);
-	if (!nr_blocks)
-		nr_blocks = 1;
-
 	/* Load $MFT/$DATA's first mft record. */
 	err = ntfs_bdev_read(sb->s_bdev, (char *)m,
 			     ntfs_cluster_to_bytes(vol, vol->mft_lcn), i);
@@ -3780,8 +3775,7 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(struct inode *vi,
 				bio = bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRITE,
 						GFP_NOIO);
 				bio->bi_iter.bi_sector =
-					ntfs_bytes_to_sector(vol,
-							ntfs_cluster_to_bytes(vol, lcn) +
+					ntfs_bytes_to_bio_sector(ntfs_cluster_to_bytes(vol, lcn) +
 							lcn_folio_off);
 
 				length = min_t(unsigned long,
diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 984a0827f9ac..299a1d0dd6df 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -499,8 +499,8 @@ int ntfs_sync_mft_mirror(struct ntfs_volume *vol, const u64 mft_no,
 
 	bio = bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRITE, GFP_NOIO);
 	bio->bi_iter.bi_sector =
-		NTFS_B_TO_SECTOR(vol, NTFS_CLU_TO_B(vol, vol->mftmirr_lcn) +
-				 lcn_folio_off + folio_ofs);
+		ntfs_bytes_to_bio_sector(NTFS_CLU_TO_B(vol, vol->mftmirr_lcn) +
+					 lcn_folio_off + folio_ofs);
 
 	if (bio_add_folio(bio, folio, vol->mft_record_size, folio_ofs))
 		err = submit_bio_wait(bio);
@@ -592,8 +592,8 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 
 		bio = bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRITE, GFP_NOIO);
 		bio->bi_iter.bi_sector =
-			NTFS_B_TO_SECTOR(vol, NTFS_CLU_TO_B(vol, ni->mft_lcn[i]) +
-					 clu_off);
+			ntfs_bytes_to_bio_sector(NTFS_CLU_TO_B(vol, ni->mft_lcn[i]) +
+						 clu_off);
 
 		if (!bio_add_folio(bio, folio, folio_size,
 				   ni->folio_ofs + offset)) {
@@ -2740,8 +2740,8 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 				bio = bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRITE,
 						GFP_NOIO);
 				bio->bi_iter.bi_sector =
-					ntfs_bytes_to_sector(vol,
-							ntfs_cluster_to_bytes(vol, lcn) + off);
+					ntfs_bytes_to_bio_sector(
+						ntfs_cluster_to_bytes(vol, lcn) + off);
 			}
 
 			if (vol->cluster_size == NTFS_BLOCK_SIZE &&
diff --git a/fs/ntfs/ntfs.h b/fs/ntfs/ntfs.h
index df5a75d506f6..45f77848a9cf 100644
--- a/fs/ntfs/ntfs.h
+++ b/fs/ntfs/ntfs.h
@@ -19,6 +19,7 @@
 #include <linux/nls.h>
 #include <linux/smp.h>
 #include <linux/pagemap.h>
+#include <linux/blk_types.h>
 #include <linux/uidgid.h>
 
 #include "volume.h"
@@ -71,8 +72,6 @@
 #define NTFS_CLU_TO_POFS(vol, clu) (((u64)(clu) << (vol)->cluster_size_bits) & \
 				    ~PAGE_MASK)
 
-#define NTFS_B_TO_SECTOR(vol, b) ((b) >> ((vol)->sb)->s_blocksize_bits)
-
 enum {
 	NTFS_BLOCK_SIZE		= 512,
 	NTFS_BLOCK_SIZE_BITS	= 9,
@@ -154,11 +153,10 @@ static inline u64 ntfs_cluster_to_poff(const struct ntfs_volume *vol,
 	return (clu << vol->cluster_size_bits) & ~PAGE_MASK;
 }
 
-/* Convert byte offset to sector (block) number. */
-static inline sector_t ntfs_bytes_to_sector(const struct ntfs_volume *vol,
-		u64 bytes)
+/* Convert a byte offset on the volume to a bio sector number. */
+static inline sector_t ntfs_bytes_to_bio_sector(u64 bytes)
 {
-	return bytes >> vol->sb->s_blocksize_bits;
+	return bytes >> SECTOR_SHIFT;
 }
 
 /* Global variables. */
-- 
2.43.0

