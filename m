Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555DA44C644
	for <ntfs@lists.linux.dev>; Tue, 21 Jul 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627691; cv=none; b=cQGW+eak2oxBja13i/6nttWwqqqxZG7HapjbHIxsH7dYtP+ZjytU0wyZ2lZOQdhe9mjEb8ZDpeDbwEBZhjf+ASwsoi9laHLxVOYbaEcW7zhou6jb4Ifjbnrzc62xQ9mYvKOfAI7LpOFeJ6wwJ/3PPRJsbfREnuZMbCauSk+mcB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627691; c=relaxed/simple;
	bh=1XbEG3kqQOGU1ag/jiB6Van7N4405g1V7FcfRzLsU0c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nz1mdn4d3aH2Y/M5SWDVao7iv0jtpHK7CQzQdq5yJhbEReYLq8Gxq6BA8nER6X+aVhvhXOgZCjQzyoHR5qla44hPRNTCuT0kqVmLiMIsvnUH4YbdQTCQsvytz2VEJlikb3WucHZhF1J+PDdf4x4lSLLnaWAte5AG18xEaIvE9KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbjQSqrI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbjQSqrI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F451F00A3A;
	Tue, 21 Jul 2026 09:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784627690;
	bh=iQck3le49/Msz/cV6lX6ywsTTiuo0rXvcuMgaSG35tY=;
	h=From:To:Cc:Subject:Date;
	b=NbjQSqrIUWwgUxmLiFwuiFYrfpC2yJKfAX4qhvq0DuxUofpcdUjlKxWiTexh5OB7f
	 cbSTd0odJ/KW2iC1y9p2cdN/ymDOyY6/bYfull1ZlWfCMpfom06QZ+h+tAufZIKYqM
	 8r0l7yqP5Gg4glCDULtO2DBGGpTe1pZDgSGHmxihxiDc2EwTcydGr5n338qtDYD+j2
	 4N7wTmWvVHtyTWTV1v08H9Nr2fOxPVADMb0qjQoIxBVerrYilqC/9hQ0tGoMNiErX0
	 dct6HFXv/W35nHiejXT47T6PcSIT+MaRGj7zE9FA8ToiE5r8kK0HrZ/88LJbhhourW
	 So6QPlb69/1Nw==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH 01/11] ntfs: propagate compression context allocation errors
Date: Tue, 21 Jul 2026 18:54:21 +0900
Message-Id: <20260721095431.6619-1-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_compress_block() returns -ENOMEM when its compression context cannot
be allocated, but its unsigned return type turns the error into a large
positive value. ntfs_write_cb() then hides the allocation failure.

Use a signed return type and propagate negative errors to the caller.

Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/compress.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index fe1877b86f49..6b78a8efe3ac 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -1070,10 +1070,10 @@ static void ntfs_skip_position(struct compress_context *pctx, const int i)
  *
  * Returns the size of the compressed block, including the
  * header (minimal size is 2, maximum size is 4098)
- * 0 if an error has been met.
+ * A negative error code if an error has been met.
  */
-static unsigned int ntfs_compress_block(const char *inbuf, const int bufsize,
-		char *outbuf)
+static int ntfs_compress_block(const char *inbuf, const int bufsize,
+			       char *outbuf)
 {
 	struct compress_context *pctx;
 	int i; /* current position */
@@ -1264,7 +1264,8 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 	char *outbuf = NULL, *pbuf, *inbuf;
 	u32 compsz, p, insz = pages_per_cb << PAGE_SHIFT;
 	s32 rounded, bio_size;
-	unsigned int sz, bsz;
+	int sz;
+	unsigned int bsz;
 	bool fail = false, allzeroes;
 	/* a single compressed zero */
 	static char onezero[] = {0x01, 0xb0, 0x00, 0x00};
@@ -1319,6 +1320,10 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 			bsz = insz - p;
 		pbuf = &outbuf[compsz];
 		sz = ntfs_compress_block(&inbuf[p], bsz, pbuf);
+		if (sz < 0) {
+			err = sz;
+			goto out;
+		}
 		/* fail if all the clusters (or more) are needed */
 		if (!sz || ((compsz + sz + vol->cluster_size + 2) >
 			    ni->itype.compressed.block_size))
-- 
2.34.1

