Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449A34499B5
	for <ntfs@lists.linux.dev>; Tue, 21 Jul 2026 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627702; cv=none; b=RDKADGBhu/3P5VKpIFOJkyX03WV+9P+yVKjLmsZcCohxfmRfRxwoQB59Hz8gj/aWOlkRUTY3ExbJuORaLBFaqIFz8NmWnE7Lb8Gs8Ee/1RXD6rIlQO/azPN0CqyE8CliuH73Oo9+sGqXO/tp32ujGUE0XAKG8FxDKN1haRrs4qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627702; c=relaxed/simple;
	bh=jdBHQLm4cMR+4x0t98rdy5X05gsIgQDGrfNBuLID8Dg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s7OW4Y3OMSUaJoW9pcSk9fbKPUHQxxenUaHb2MWoIMwU2i8WumcEEHPe7RU+gvpoaZuuocglLvbSGzCMxcvAiIPmhyd5Abv4dnICtQu5Q2uuRQQ+72Vanl2NPXUDqfzQAJif9odgbwkoG0B/lgyi3Yq7AMqjQ2UgzUpsLIL1/WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2h2celf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2h2celf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926921F00AC4;
	Tue, 21 Jul 2026 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784627701;
	bh=0uamrqXeQg9fj6kzVJwifh4BWOA6d6gshwzlfP8rb3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M2h2celfFBw4pT0Y6lXh7qoGk9p5GxXs/xNlWDya40Q3sqktBJNa94NqW4LxMN/5f
	 psdvCxxLnu1cvcqu6+szRcO7gnRd3ikEF6/+oplJKlLMHrY81fHaPNtQMBBanWxgCQ
	 IbpNCqoZxpuQ8qDYbFnh4MLeJWEzHjqr1GsbvI/b06rRcvMmOeMVNqwowshfrjwxhA
	 sEaZHaClYyrqsXSlkfojWIfhjNrfqoePswDD2HXz3Kfxcc0uAzAJHNG5f7eyHTSSbE
	 uQ65B6T9SC5TX1IFS6pnlIEdBCmjvFEsEIIds5p95FcL5wbhK07ONANq5M7J5K2xcl
	 xQiDK72+t86oQ==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH 07/11] ntfs: reuse compression output workspace across write units
Date: Tue, 21 Jul 2026 18:54:27 +0900
Message-Id: <20260721095431.6619-7-linkinjeon@kernel.org>
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

ntfs_write_cb() allocates output pages and creates input and output
vmaps for every compression unit. Sequential writes repeatedly pay
those allocation and page-table costs even though each unit has the
same maximum output size.
Allocate and map the output workspace once per write request. Access

input sub-blocks with kmap_local_page(), and reuse the output pages and
mapping for every compression unit in the request.

Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/compress.c | 135 ++++++++++++++++++++++++++++-----------------
 1 file changed, 85 insertions(+), 50 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index f073a53f6136..f3c14518f78e 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -894,6 +894,12 @@ struct compress_context {
 	s16 prev[NTFS_SB_SIZE];
 };
 
+struct ntfs_compress_workspace {
+	struct page **pages;
+	char *outbuf;
+	unsigned int nr_pages;
+};
+
 /*
  * Hash the next 3-byte sequence in the input buffer
  */
@@ -1247,12 +1253,69 @@ static int ntfs_compress_block(struct compress_context *pctx,
 	return xout;
 }
 
+static int ntfs_compress_workspace_init(struct ntfs_inode *ni,
+					struct ntfs_compress_workspace *ws)
+{
+	unsigned int size, i;
+
+	size = ni->itype.compressed.block_size + 2 *
+		(ni->itype.compressed.block_size / NTFS_SB_SIZE) + 2;
+	ws->nr_pages = DIV_ROUND_UP(size, PAGE_SIZE);
+	ws->pages = kcalloc(ws->nr_pages, sizeof(*ws->pages), GFP_NOFS);
+	if (!ws->pages)
+		return -ENOMEM;
+
+	for (i = 0; i < ws->nr_pages; i++) {
+		ws->pages[i] = alloc_page(GFP_NOFS);
+		if (!ws->pages[i])
+			goto free_pages;
+	}
+
+	ws->outbuf = vmap(ws->pages, ws->nr_pages, VM_MAP, PAGE_KERNEL);
+	if (!ws->outbuf)
+		goto free_pages;
+	return 0;
+
+free_pages:
+	while (i)
+		put_page(ws->pages[--i]);
+	kfree(ws->pages);
+	return -ENOMEM;
+}
+
+static void ntfs_compress_workspace_free(struct ntfs_compress_workspace *ws)
+{
+	unsigned int i;
+
+	vunmap(ws->outbuf);
+	for (i = 0; i < ws->nr_pages; i++)
+		put_page(ws->pages[i]);
+	kfree(ws->pages);
+}
+
+static void ntfs_copy_cb(struct page **pages, int pages_per_cb,
+			 unsigned int page_offset,
+			 struct ntfs_compress_workspace *ws, unsigned int bytes)
+{
+	unsigned int copied = 0, i;
+
+	for (i = 0; i < pages_per_cb && copied < bytes; i++) {
+		unsigned int offset = i ? 0 : page_offset;
+		unsigned int len = min(bytes - copied, PAGE_SIZE - offset);
+		void *addr = kmap_local_page(pages[i]);
+
+		memcpy(ws->outbuf + copied, addr + offset, len);
+		kunmap_local(addr);
+		copied += len;
+	}
+}
+
 static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		int pages_per_cb, unsigned int page_offset,
-		struct compress_context *ctx)
+		struct compress_context *ctx, struct ntfs_compress_workspace *ws)
 {
 	struct ntfs_volume *vol = ni->vol;
-	char *outbuf = NULL, *pbuf, *inbuf, *in_mapping;
+	char *outbuf = ws->outbuf, *pbuf;
 	u32 compsz, p, insz = ni->itype.compressed.block_size;
 	s32 rounded, bio_size;
 	int sz;
@@ -1264,55 +1327,32 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 	static char twozeroes[] = {0x02, 0xb0, 0x00, 0x00, 0x00};
 	/* more compressed zeroes, to be followed by some count */
 	static char morezeroes[] = {0x03, 0xb0, 0x02, 0x00};
-	struct page **pages_disk = NULL, *pg;
 	s64 bio_lcn;
 	struct runlist_element *rlc, *rl;
 	int i, err;
-	int pages_count = (round_up(ni->itype.compressed.block_size + 2 *
-		(ni->itype.compressed.block_size / NTFS_SB_SIZE) + 2, PAGE_SIZE)) / PAGE_SIZE;
 	u32 cb_clusters = ni->itype.compressed.block_clusters;
 	size_t new_rl_count;
 	struct bio *bio = NULL;
 	loff_t cb_pos, new_length;
 	s64 new_vcn;
 
-	in_mapping = vmap(pages, pages_per_cb, VM_MAP, PAGE_KERNEL_RO);
-	if (!in_mapping)
-		return -ENOMEM;
-	inbuf = in_mapping + page_offset;
-
-	/* may need 2 extra bytes per block and 2 more bytes */
-	pages_disk = kcalloc(pages_count, sizeof(struct page *), GFP_NOFS);
-	if (!pages_disk) {
-		vunmap(in_mapping);
-		return -ENOMEM;
-	}
-
-	for (i = 0; i < pages_count; i++) {
-		pg = alloc_page(GFP_KERNEL);
-		if (!pg) {
-			err = -ENOMEM;
-			goto out;
-		}
-		pages_disk[i] = pg;
-		lock_page(pg);
-	}
-
-	outbuf = vmap(pages_disk, pages_count, VM_MAP, PAGE_KERNEL);
-	if (!outbuf) {
-		err = -ENOMEM;
-		goto out;
-	}
-
 	compsz = 0;
 	allzeroes = true;
 	for (p = 0; (p < insz) && !fail; p += NTFS_SB_SIZE) {
+		unsigned int input_offset = page_offset + p;
+		unsigned int page_idx = input_offset >> PAGE_SHIFT;
+		const char *input;
+		void *addr;
+
 		if ((p + NTFS_SB_SIZE) < insz)
 			bsz = NTFS_SB_SIZE;
 		else
 			bsz = insz - p;
 		pbuf = &outbuf[compsz];
-		sz = ntfs_compress_block(ctx, &inbuf[p], bsz, pbuf);
+		addr = kmap_local_page(pages[page_idx]);
+		input = addr + offset_in_page(input_offset);
+		sz = ntfs_compress_block(ctx, input, bsz, pbuf);
+		kunmap_local(addr);
 		if (sz < 0) {
 			err = sz;
 			goto out;
@@ -1352,14 +1392,12 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		rounded = ((compsz - 1) | (vol->cluster_size - 1)) + 1;
 		memset(&outbuf[compsz], 0, rounded - compsz);
 		bio_size = rounded;
-		pages = pages_disk;
 	} else if (allzeroes) {
 		err = ntfs_non_resident_attr_punch_hole(ni, new_vcn, cb_clusters);
 		goto out;
 	} else {
-		memcpy(outbuf, inbuf, insz);
+		ntfs_copy_cb(pages, pages_per_cb, page_offset, ws, insz);
 		bio_size = insz;
-		pages = pages_disk;
 	}
 
 	new_length = ntfs_bytes_to_cluster(vol, round_up(bio_size, vol->cluster_size));
@@ -1398,7 +1436,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 						((s64)i << PAGE_SHIFT));
 		}
 
-		if (!bio_add_page(bio, pages[i], page_size, 0)) {
+		if (!bio_add_page(bio, ws->pages[i], page_size, 0)) {
 			err = submit_bio_wait(bio);
 			bio_put(bio);
 			if (err)
@@ -1443,17 +1481,6 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		ntfs_error(vol->sb, "Failed to free hot clusters.");
 	kvfree(rlc);
 out:
-	if (outbuf)
-		vunmap(outbuf);
-	for (i = 0; i < pages_count; i++) {
-		pg = pages_disk[i];
-		if (pg) {
-			unlock_page(pg);
-			put_page(pg);
-		}
-	}
-	kfree(pages_disk);
-	vunmap(in_mapping);
 	NInoSetFileNameDirty(ni);
 	mark_mft_record_dirty(ni);
 
@@ -1463,6 +1490,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 		struct iov_iter *from)
 {
+	struct ntfs_compress_workspace ws = {};
 	struct compress_context *ctx;
 	struct folio *folio;
 	struct page **pages = NULL, *page;
@@ -1483,6 +1511,12 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 		kfree(pages);
 		return -ENOMEM;
 	}
+	err = ntfs_compress_workspace_init(ni, &ws);
+	if (err) {
+		kvfree(ctx);
+		kfree(pages);
+		return err;
+	}
 
 	while (count) {
 		pgoff_t index;
@@ -1551,7 +1585,7 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 			goto release_pages;
 		}
 
-		err = ntfs_write_cb(ni, pos, pages, pages_per_cb, page_offset, ctx);
+		err = ntfs_write_cb(ni, pos, pages, pages_per_cb, page_offset, ctx, &ws);
 		if (!err && pos + copied > ni->initialized_size) {
 			mutex_lock(&ni->mrec_lock);
 			err = ntfs_attr_set_initialized_size(ni, pos + copied);
@@ -1581,6 +1615,7 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 	}
 
 out:
+	ntfs_compress_workspace_free(&ws);
 	kvfree(ctx);
 	kfree(pages);
 	if (err < 0)
-- 
2.34.1

