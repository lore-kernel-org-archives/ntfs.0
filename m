Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A6644C67F
	for <ntfs@lists.linux.dev>; Tue, 21 Jul 2026 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627700; cv=none; b=JAp/V0QId7dlb6FsUsggXK9gHSmZMjb+ECuSHheF1fUNyS7SgFsIQXhWq+dLopuU2y8xo0UMZM/jF3qCYZbkmAxCBuMrsjQYLUyWoNQUMPLTDxrH0TcqwXHw4TaHwKGSqGVNVmHWG0Q8e3J8J/xRKFXaFbyPAPbS/yDJwP806YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627700; c=relaxed/simple;
	bh=wU5j9ltHy4f1hwW9KkbKzNaUluhbaIQJfxVMGtVS6Mk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RepkRG0uOJwkWPatHXfZUnNOYHFzvs28X7aVc+Oz1tbjS/00QS0fxrtYK1J8nE9O22TlYlIdO/REfew8ZYsk3SwlWdYM6s8Z0wWIKEUvAX6vymy4bTpRrij2IyZOz7M5o6YOLnPlInCLBsNJHt+5lOQIlHsmqtL1z9z/VKYfvcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4Ae7GhH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4Ae7GhH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE2B1F00A3D;
	Tue, 21 Jul 2026 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784627699;
	bh=WQtFVDMpqPEEP2Sv8/9AdVzDEz33AiLTJ5T1IgJcU3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R4Ae7GhHADS22gEoOuCRmQuneERq0FllthybAR7ThGn+GzL8DyhpWSMcCyHI+1PiK
	 l6Z9KWtzlRXmeS/xg97E8E4EqowT3CsFJU7D5Ju7YE+9CTg6/abQNwt8ddBrGNdi5z
	 EI+4o98FQIAaQCkbd6GTVXwKgyZrjx9LgfMCXyyO6/TA0adIw4VrlU6GrmtFRBlBym
	 z0LfDp5TTErPmh9ss9HnNKuaXpRJU30sDzin1uhiSivYOeJeouaIujcI7tlhiv4PBP
	 yfvZsjSZ082sW6J0dJ6/5b3Tgl9rokgT3/sBzeIwzNMhhfZlZB/8jzwMvvMNJ7MhAp
	 oyPXst9JnNWaA==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH 06/11] ntfs: reuse the compression context during writes
Date: Tue, 21 Jul 2026 18:54:26 +0900
Message-Id: <20260721095431.6619-6-linkinjeon@kernel.org>
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

ntfs_compress_block() allocates and initializes a roughly 40 KiB match
finder context for every 4 KiB sub-block. A 64 KiB compression unit thus
performs sixteen large allocations even though the calls are serialized.

Allocate one context for the complete write request and reset its hash
chains for each sub-block as before.

Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/compress.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index a993cba3b961..f073a53f6136 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -1072,10 +1072,9 @@ static void ntfs_skip_position(struct compress_context *pctx, const int i)
  * header (minimal size is 2, maximum size is 4098)
  * A negative error code if an error has been met.
  */
-static int ntfs_compress_block(const char *inbuf, const int bufsize,
-			       char *outbuf)
+static int ntfs_compress_block(struct compress_context *pctx,
+			       const char *inbuf, const int bufsize, char *outbuf)
 {
-	struct compress_context *pctx;
 	int i; /* current position */
 	int j; /* end of best match from current position */
 	int k; /* end of best match from next position */
@@ -1090,10 +1089,6 @@ static int ntfs_compress_block(const char *inbuf, const int bufsize,
 	int tag;    /* current value of tag */
 	int ntag;   /* count of bits still undefined in tag */
 
-	pctx = kvzalloc(sizeof(struct compress_context), GFP_NOFS);
-	if (!pctx)
-		return -ENOMEM;
-
 	/*
 	 * All hash chains start as empty.  The special value '-1' indicates the
 	 * end of each hash chain.
@@ -1249,16 +1244,12 @@ static int ntfs_compress_block(const char *inbuf, const int bufsize,
 		xout = NTFS_SB_SIZE + 2;
 	}
 
-	/*
-	 * Free the compression context and return the total number of bytes
-	 * written to 'outbuf'.
-	 */
-	kvfree(pctx);
 	return xout;
 }
 
 static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
-		int pages_per_cb, unsigned int page_offset)
+		int pages_per_cb, unsigned int page_offset,
+		struct compress_context *ctx)
 {
 	struct ntfs_volume *vol = ni->vol;
 	char *outbuf = NULL, *pbuf, *inbuf, *in_mapping;
@@ -1321,7 +1312,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		else
 			bsz = insz - p;
 		pbuf = &outbuf[compsz];
-		sz = ntfs_compress_block(&inbuf[p], bsz, pbuf);
+		sz = ntfs_compress_block(ctx, &inbuf[p], bsz, pbuf);
 		if (sz < 0) {
 			err = sz;
 			goto out;
@@ -1472,6 +1463,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 		struct iov_iter *from)
 {
+	struct compress_context *ctx;
 	struct folio *folio;
 	struct page **pages = NULL, *page;
 	int pages_per_cb;
@@ -1486,6 +1478,11 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 	pages = kmalloc_array(pages_per_cb, sizeof(struct page *), GFP_NOFS);
 	if (!pages)
 		return -ENOMEM;
+	ctx = kvzalloc_obj(*ctx, GFP_NOFS);
+	if (!ctx) {
+		kfree(pages);
+		return -ENOMEM;
+	}
 
 	while (count) {
 		pgoff_t index;
@@ -1554,7 +1551,7 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 			goto release_pages;
 		}
 
-		err = ntfs_write_cb(ni, pos, pages, pages_per_cb, page_offset);
+		err = ntfs_write_cb(ni, pos, pages, pages_per_cb, page_offset, ctx);
 		if (!err && pos + copied > ni->initialized_size) {
 			mutex_lock(&ni->mrec_lock);
 			err = ntfs_attr_set_initialized_size(ni, pos + copied);
@@ -1584,6 +1581,7 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 	}
 
 out:
+	kvfree(ctx);
 	kfree(pages);
 	if (err < 0)
 		written = err;
-- 
2.34.1

