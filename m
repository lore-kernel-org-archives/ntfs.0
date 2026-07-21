Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD6F4499A7
	for <ntfs@lists.linux.dev>; Tue, 21 Jul 2026 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627693; cv=none; b=s2Ve5eMN2mML2AyVsPtiXACc5gIh+Un8jXxUSjaAf7upVzM9YChm47vUdaYr6Zl/nzsosnfeIqi8+Akn8F3S3xyhesUBpVGwXNTKt7gVRDtUqi/7KEZYt/6l86qvVl3rZGyOBlVPHzoT4SMsqT+ZIHEu6hqoLfu4Jv87ViDZMj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627693; c=relaxed/simple;
	bh=OKvT+/1gFNpbxl6yI1IPAgn9eHGvkXJMQRxOxrduyrw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JfL5Y6F+ig8c+5DsBXgxUpycXF4LrSBTaCn/P1RGHr0nZIIcOo2Z7L7dhYai073bNfVcCqxUd+zquJsBRQoGwuN/xpLOWdHPn+e88pVAVqAAzOhVvyAvOIZvXBpz9GtnmRhHXKdqNGfSpWS1VOqE5VbOAB5WfbRws/PF0c1kqUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiEiifCy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiEiifCy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B921F00A3F;
	Tue, 21 Jul 2026 09:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784627691;
	bh=Y2zr811VEWJiDotvJE2NqsX0z78NB/SQddZGTJC8eOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jiEiifCy4ISphfDlt7rTxmZF5A6+R/LHiWtBRUe7AuOXzqmr5N8WwCHyN0tP05OP8
	 gKhc5Ok4Rv0W/QBlY/CwfawFg4tzDy1a3MugN+OOjcpfdmkeWSzAHDXb7yaLuXJrlm
	 T8st0WWMNkdf9zbhwnzChabFMuT4TmoY2H8eo1PR7jUmeBfs/hG/f0prW+/SJfb020
	 dfcDR+4by88y4fIUvyCfLJQa1hr4lmZMLWeVZhnEBwzpeDakgP8d+39xMc/oQ3uj60
	 8OKISBJa5YzOppUv8F3QnQmAnoe6XkN3snq6+AaI/H3nPzAgkkgsi7HQD7G0IPxo8Y
	 9FHIntjDRThJg==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH 02/11] ntfs: support large pages in compressed writes
Date: Tue, 21 Jul 2026 18:54:22 +0900
Message-Id: <20260721095431.6619-2-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260721095431.6619-1-linkinjeon@kernel.org>
References: <20260721095431.6619-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_compress_write() derives its page count by shifting the compression
block size and assumes that every compression block begins at a page
boundary. This produces a zero page count for small compression blocks on
large-page systems and ignores an in-page compression block offset.

Map every page covering the compression block, pass the in-page offset to
ntfs_write_cb(), and stage uncompressed output in page-aligned pages.

Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/compress.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 6b78a8efe3ac..006b8831836c 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -1258,11 +1258,11 @@ static int ntfs_compress_block(const char *inbuf, const int bufsize,
 }
 
 static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
-		int pages_per_cb)
+		int pages_per_cb, unsigned int page_offset)
 {
 	struct ntfs_volume *vol = ni->vol;
-	char *outbuf = NULL, *pbuf, *inbuf;
-	u32 compsz, p, insz = pages_per_cb << PAGE_SHIFT;
+	char *outbuf = NULL, *pbuf, *inbuf, *in_mapping;
+	u32 compsz, p, insz = ni->itype.compressed.block_size;
 	s32 rounded, bio_size;
 	int sz;
 	unsigned int bsz;
@@ -1284,14 +1284,15 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 	loff_t new_length;
 	s64 new_vcn;
 
-	inbuf = vmap(pages, pages_per_cb, VM_MAP, PAGE_KERNEL_RO);
-	if (!inbuf)
+	in_mapping = vmap(pages, pages_per_cb, VM_MAP, PAGE_KERNEL_RO);
+	if (!in_mapping)
 		return -ENOMEM;
+	inbuf = in_mapping + page_offset;
 
 	/* may need 2 extra bytes per block and 2 more bytes */
 	pages_disk = kcalloc(pages_count, sizeof(struct page *), GFP_NOFS);
 	if (!pages_disk) {
-		vunmap(inbuf);
+		vunmap(in_mapping);
 		return -ENOMEM;
 	}
 
@@ -1361,7 +1362,9 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		err = 0;
 		goto out;
 	} else {
+		memcpy(outbuf, inbuf, insz);
 		bio_size = insz;
+		pages = pages_disk;
 	}
 
 	new_vcn = ntfs_bytes_to_cluster(vol,
@@ -1420,7 +1423,8 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 					GFP_NOIO);
 			bio->bi_iter.bi_sector =
 				ntfs_bytes_to_sector(vol,
-						ntfs_cluster_to_bytes(vol, bio_lcn + i));
+						ntfs_cluster_to_bytes(vol, bio_lcn) +
+						((s64)i << PAGE_SHIFT));
 		}
 
 		if (!bio_add_page(bio, pages[i], page_size, 0)) {
@@ -1437,7 +1441,8 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 	err = submit_bio_wait(bio);
 	bio_put(bio);
 out:
-	vunmap(outbuf);
+	if (outbuf)
+		vunmap(outbuf);
 	for (i = 0; i < pages_count; i++) {
 		pg = pages_disk[i];
 		if (pg) {
@@ -1446,7 +1451,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		}
 	}
 	kfree(pages_disk);
-	vunmap(inbuf);
+	vunmap(in_mapping);
 	NInoSetFileNameDirty(ni);
 	mark_mft_record_dirty(ni);
 
@@ -1458,12 +1463,15 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 {
 	struct folio *folio;
 	struct page **pages = NULL, *page;
-	int pages_per_cb = ni->itype.compressed.block_size >> PAGE_SHIFT;
+	int pages_per_cb;
 	int cb_size = ni->itype.compressed.block_size, cb_off, err = 0;
 	int i, ip;
 	size_t written = 0;
 	struct address_space *mapping = VFS_I(ni)->i_mapping;
 
+	pages_per_cb = DIV_ROUND_UP(offset_in_page(pos & ~(cb_size - 1)) +
+			cb_size, PAGE_SIZE);
+
 	pages = kmalloc_array(pages_per_cb, sizeof(struct page *), GFP_NOFS);
 	if (!pages)
 		return -ENOMEM;
@@ -1471,6 +1479,7 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 	while (count) {
 		pgoff_t index;
 		size_t copied, bytes;
+		unsigned int page_offset;
 		int off;
 
 		off = pos & (cb_size - 1);
@@ -1479,6 +1488,8 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 			bytes = count;
 
 		cb_off = pos & ~(cb_size - 1);
+		page_offset = offset_in_page(cb_off);
+		pages_per_cb = DIV_ROUND_UP(page_offset + cb_size, PAGE_SIZE);
 		index = cb_off >> PAGE_SHIFT;
 
 		if (unlikely(fault_in_iov_iter_readable(from, bytes))) {
@@ -1527,7 +1538,7 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 			}
 		}
 
-		err = ntfs_write_cb(ni, pos, pages, pages_per_cb);
+		err = ntfs_write_cb(ni, pos, pages, pages_per_cb, page_offset);
 
 		for (i = 0; i < pages_per_cb; i++) {
 			folio = page_folio(pages[i]);
-- 
2.34.1

