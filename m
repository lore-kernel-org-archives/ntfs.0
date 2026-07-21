Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B524499B5
	for <ntfs@lists.linux.dev>; Tue, 21 Jul 2026 09:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627704; cv=none; b=P7eqvlC5Vu+QwXEJWWwGNxSxoZgii50RtB5jRb78LWNdiUv6mgPVpzRyIyFDxGBgCQvQwOVCB99CsMqkGC7SbBAORHodsKxUoK+If/qNy3dF99D6G+dwnc0wLtM6EmO6c3V9Sc55XGlpwM1rGf/E7FAGaqW76IimeYXNlhiJ3hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627704; c=relaxed/simple;
	bh=nxyNYLkwKgD4YB6hXlqCaSBtqw6zIk0wftsnUv0MFeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SqcpZWE6dJwY9/iNIIadJr/9gf3Oa5lIgUEPXMoY5h97Sbu/BQ1RVccJFgML4ePm4pHkfgiRLPMlCsxLlolXszU+jSeI3U84ohfbzSNIiUn3Wl/rf7ilZZ++48Dtn0yfsjZVHu10aFHdo0cyAqUmrK2nBbOv35jA6yBJMWhG5DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMUk8uQ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMUk8uQ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354901F00A3A;
	Tue, 21 Jul 2026 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784627702;
	bh=dP4CVqCyOaL1Mzc3DgqRlfhQOkU5yos8SskDLSoqgOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AMUk8uQ6qB+QfAhYYp3BvxiUdN9tpQQN/1pVkxp+dy5p5fIYDkb3/FHYhxlv2Ptu0
	 atz0TUGXWezxJvTGmIuQCv00OnXcYfLSxg1wfdlGgFz1r1hcm0e+KSftXZpo4cCN+j
	 HPaTUjhsZYd53d62+snjd/xn5I2ooTCiXW9OMW0QlKlkQkEFwl++bBGdRBtWqVQL8l
	 szgR6MbtI8gt7XZPKJNSD5yiECRO0j6UIAG1SR+IqLTHvUVCGMCfUX5lFhEFA8LrA1
	 0CXLYCtWY2KLcxR8pzkoFWuKUwxhLDGFCJ6KJMvNx7u2BJOXN/73DgeCjsaS23+Eq6
	 bD5/ZcNlBJCQg==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH 08/11] ntfs: submit one bio per compressed write unit
Date: Tue, 21 Jul 2026 18:54:28 +0900
Message-Id: <20260721095431.6619-8-linkinjeon@kernel.org>
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

ntfs_write_cb() allocates a single-vector bio and synchronously submits it
whenever another output page cannot be added. A 64 KiB uncompressed unit
therefore requires up to sixteen separate bio submissions.

Allocate enough vectors for the complete unit, add all output pages, and
perform one synchronous submission.

Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/compress.c | 43 +++++++++++--------------------------------
 1 file changed, 11 insertions(+), 32 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index f3c14518f78e..a3af669b1008 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -1327,7 +1327,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 	static char twozeroes[] = {0x02, 0xb0, 0x00, 0x00, 0x00};
 	/* more compressed zeroes, to be followed by some count */
 	static char morezeroes[] = {0x03, 0xb0, 0x02, 0x00};
-	s64 bio_lcn;
+	s64 bio_lcn, bio_pos;
 	struct runlist_element *rlc, *rl;
 	int i, err;
 	u32 cb_clusters = ni->itype.compressed.block_clusters;
@@ -1410,41 +1410,20 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 	}
 
 	bio_lcn = rlc->lcn;
-	i = 0;
-	while (bio_size > 0) {
-		int page_size;
-
-		if (bio_size >= PAGE_SIZE) {
-			page_size = PAGE_SIZE;
-			bio_size -= PAGE_SIZE;
-		} else {
-			page_size = bio_size;
-			bio_size = 0;
-		}
+	bio_pos = ntfs_cluster_to_bytes(vol, bio_lcn);
+	bio = bio_alloc(vol->sb->s_bdev, DIV_ROUND_UP(bio_size, PAGE_SIZE),
+			REQ_OP_WRITE, GFP_NOIO);
+	bio->bi_iter.bi_sector = ntfs_bytes_to_sector(vol, bio_pos);
 
-setup_bio:
-		if (!bio) {
-			bio = bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRITE,
-					GFP_NOIO);
-			if (!bio) {
-				err = -ENOMEM;
-				goto free_rlc;
-			}
-			bio->bi_iter.bi_sector =
-				ntfs_bytes_to_sector(vol,
-						ntfs_cluster_to_bytes(vol, bio_lcn) +
-						((s64)i << PAGE_SHIFT));
-		}
+	for (i = 0; bio_size; i++) {
+		unsigned int len = min_t(unsigned int, bio_size, PAGE_SIZE);
 
-		if (!bio_add_page(bio, ws->pages[i], page_size, 0)) {
-			err = submit_bio_wait(bio);
+		if (bio_add_page(bio, ws->pages[i], len, 0) != len) {
+			err = -EIO;
 			bio_put(bio);
-			if (err)
-				goto free_rlc;
-			bio = NULL;
-			goto setup_bio;
+			goto free_rlc;
 		}
-		i++;
+		bio_size -= len;
 	}
 
 	err = submit_bio_wait(bio);
-- 
2.34.1

