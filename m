Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CC73B71A3
	for <ntfs@lists.linux.dev>; Wed,  7 Oct 2026 13:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379149; cv=none; b=XkOxu03xCswBOcGEjBJ/TsP3gXHg4/Z0IcTNrPkvpjMnFfvaH9C7BolEUp0P5AVII1WcP9aYAHd+FeNbqtntLy3BWWmhHdtMeZcLHOT3tWzK03rLZdaWFJEWwKmyMIxRGWY7w3STwcjE0w6xkYxISTbEu26+IHFKT/2aULy2jtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379149; c=relaxed/simple;
	bh=WfqbsxQtN9pBi4MAytMD7QzVgm5OBbehm6cqiv6Go8c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rR9x3r8WKM4o+migIIxqKXaSuMF0Wr4I/B8os044FwPXXL5sbHXUfI1Bku6ab6h7pVFnc+BoUDoHN8S7pwwD7+V4F+bbB/hR9jZGr+lIWL/IAdvdo+eiqEQYZQATBnReBrkGAXandHjTNBXsGu5eWo1nJCbr7B07Sg25f1Q27uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QR/v6bFx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QR/v6bFx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A591F0089B;
	Wed,  7 Oct 2026 13:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791379137;
	bh=b+VWtvc5spFXXO+FD0CPDe5LwD9lv1FIcOIspepSkmU=;
	h=From:To:Cc:Subject:Date;
	b=QR/v6bFxTVUmaQmSJkhkvjYBLAd8UWTN1iiKrdAxVHQzZ9Vl4e1ltd/nbrb99ZAcK
	 JirJpS9+UFl5fr5J5o29GR2XXQZ8G5YWPmz1uGMBMjavKtiYfO0dCyZLSnIO3BIAkf
	 Emvdqu+3mg6J+nNvGH9QHdMeZCU4/TD7ml3JNSzx1wLSCLra1lC9hdzDETJkhjmSzU
	 YF31S1MqNq6HprzzybfGBaey9sN4xYlOtH4kw+swJRMydanXFLv9G3vE0dP1BoPrtx
	 PMlQwzsx4d3wY64gfYoScdH4LfINXrusVXzsU7RLrdOE0ycNw8mVN4gjVmfKR/+ifP
	 w1znyVofCc0ag==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH 1/4] ntfs: replace put_folio zeroing with iomap tail handling
Date: Wed,  7 Oct 2026 22:18:41 +0900
Message-Id: <20261007131844.8013-1-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NTFS put_folio callbacks clear uninitialized data around buffered
writes and zero ranges. Move this work to iomap block preparation and
use the default folio release path.

Set IOMAP_F_ZERO_TAIL only for mapped writes and zero ranges starting
at or beyond initialized_size. Split mapped ranges at initialized_size
and use iomap_truncate_page() to clear the boundary block's uninitialized
tail when a mapping includes initialized bytes in that block. This
preserves valid data when a short copy retries with a smaller length
inside a cached iomap. Apply this to buffered write mappings and the
read mappings reused by iomap_zero_range().

Record initialized_size in the validity cookie and revalidate it after
locking each folio. Skip bytes initialized since the tail range was
selected to preserve data written through a concurrent shared mapping.

Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/iomap.c | 133 ++++++++++++++++++++++++++----------------------
 1 file changed, 71 insertions(+), 62 deletions(-)

diff --git a/fs/ntfs/iomap.c b/fs/ntfs/iomap.c
index b4475963e57a..754d5d91b6dc 100644
--- a/fs/ntfs/iomap.c
+++ b/fs/ntfs/iomap.c
@@ -12,73 +12,47 @@
 #include "ntfs.h"
 #include "iomap.h"
 
-static void ntfs_iomap_put_folio_non_resident(struct inode *inode, loff_t pos,
-					      unsigned int len, struct folio *folio)
+static bool ntfs_iomap_valid_initialized_size(struct inode *inode,
+		const struct iomap *iomap)
 {
-	struct ntfs_inode *ni = NTFS_I(inode);
-	unsigned long sector_size = 1UL << inode->i_blkbits;
-	loff_t start_down, end_up, init;
-
-	start_down = round_down(pos, sector_size);
-	end_up = (pos + len - 1) | (sector_size - 1);
-	init = ni->initialized_size;
-
-	if (init >= start_down && init <= end_up) {
-		if (init < pos) {
-			loff_t offset = offset_in_folio(folio, pos + len);
-
-			if (offset == 0)
-				offset = folio_size(folio);
-			folio_zero_segments(folio,
-					    offset_in_folio(folio, init),
-					    offset_in_folio(folio, pos),
-					    offset,
-					    folio_size(folio));
-
-		} else  {
-			loff_t offset = max_t(loff_t, pos + len, init);
-
-			offset = offset_in_folio(folio, offset);
-			if (offset == 0)
-				offset = folio_size(folio);
-			folio_zero_segment(folio,
-					   offset,
-					   folio_size(folio));
-		}
-	} else if (init <= pos) {
-		loff_t offset = 0, offset2 = offset_in_folio(folio, pos + len);
-
-		if ((init >> folio_shift(folio)) == (pos >> folio_shift(folio)))
-			offset = offset_in_folio(folio, init);
-		if (offset2 == 0)
-			offset2 = folio_size(folio);
-		folio_zero_segments(folio,
-				    offset,
-				    offset_in_folio(folio, pos),
-				    offset2,
-				    folio_size(folio));
-	}
-	folio_unlock(folio);
-	folio_put(folio);
+	return iomap->type == IOMAP_INLINE ||
+		iomap->validity_cookie == READ_ONCE(NTFS_I(inode)->initialized_size);
 }
 
+const struct iomap_write_ops ntfs_iomap_folio_ops = {
+	.iomap_valid = ntfs_iomap_valid_initialized_size,
+};
+
+static const struct iomap_ops ntfs_zero_tail_iomap_ops;
+
 /*
- * iomap_zero_range is called for an area beyond the initialized size,
- * garbage values can be read, so zeroing out is needed.
+ * Only set IOMAP_F_ZERO_TAIL at or beyond initialized_size: short-copy
+ * retries can end before the end of a cached iomap. For initialized
+ * mappings, split at initialized_size and zero only the boundary block's
+ * uninitialized tail.
  */
-static void ntfs_iomap_put_folio(struct inode *inode, loff_t pos,
-		unsigned int len, struct folio *folio)
+static int ntfs_iomap_prepare_tail(struct inode *inode, struct iomap *iomap)
 {
-	if (NInoNonResident(NTFS_I(inode)))
-		return ntfs_iomap_put_folio_non_resident(inode, pos,
-							 len, folio);
-	folio_unlock(folio);
-	folio_put(folio);
-}
+	loff_t init = READ_ONCE(NTFS_I(inode)->initialized_size);
+	loff_t end;
 
-const struct iomap_write_ops ntfs_iomap_folio_ops = {
-	.put_folio = ntfs_iomap_put_folio,
-};
+	iomap->validity_cookie = init;
+	if (iomap->type != IOMAP_MAPPED)
+		return 0;
+
+	if (iomap->offset >= init) {
+		iomap->flags |= IOMAP_F_ZERO_TAIL;
+		return 0;
+	}
+
+	iomap->length = min_t(u64, iomap->length, init - iomap->offset);
+	end = iomap->offset + iomap->length;
+	if (round_up(end, i_blocksize(inode)) <= init)
+		return 0;
+
+	return iomap_truncate_page(inode, init, NULL, &ntfs_zero_tail_iomap_ops,
+				   &ntfs_iomap_folio_ops, NULL);
+}
 
 static int ntfs_read_iomap_begin_resident(struct inode *inode, loff_t offset, loff_t length,
 		unsigned int flags, struct iomap *iomap, bool keep_mrec_lock)
@@ -256,6 +230,14 @@ static int ntfs_read_iomap_begin_non_resident(struct inode *inode, loff_t offset
 		iomap->length = length;
 	up_write(&ni->runlist.lock);
 
+	if (flags & IOMAP_ZERO) {
+		int err;
+
+		err = ntfs_iomap_prepare_tail(inode, iomap);
+		if (err)
+			return err;
+	}
+
 	if (!(flags & IOMAP_ZERO) &&
 			iomap->type == IOMAP_MAPPED &&
 			iomap->offset < ni->initialized_size &&
@@ -332,7 +314,6 @@ static bool ntfs_iomap_valid(struct inode *inode, const struct iomap *iomap)
 }
 
 static const struct iomap_write_ops ntfs_zero_iomap_folio_ops = {
-	.put_folio = ntfs_iomap_put_folio,
 	.iomap_valid = ntfs_iomap_valid,
 };
 
@@ -364,6 +345,34 @@ const struct iomap_ops ntfs_seek_iomap_ops = {
 	.iomap_next = ntfs_seek_iomap_next,
 };
 
+static int ntfs_zero_tail_iomap_begin(struct inode *inode, loff_t offset,
+		loff_t length, unsigned int flags, struct iomap *iomap,
+		struct iomap *srcmap)
+{
+	loff_t init = READ_ONCE(NTFS_I(inode)->initialized_size);
+	int err;
+
+	/* Skip bytes initialized after the tail range was selected. */
+	if (offset < init) {
+		iomap->type = IOMAP_HOLE;
+		iomap->addr = IOMAP_NULL_ADDR;
+		iomap->offset = offset;
+		iomap->length = min(length, init - offset);
+		return 0;
+	}
+
+	err = ntfs_seek_iomap_begin(inode, offset, length, flags, iomap, srcmap);
+	iomap->validity_cookie = init;
+	return err;
+}
+
+static DEFINE_IOMAP_ITER_NEXT(ntfs_zero_tail_iomap_next,
+		ntfs_zero_tail_iomap_begin);
+
+static const struct iomap_ops ntfs_zero_tail_iomap_ops = {
+	.iomap_next = ntfs_zero_tail_iomap_next,
+};
+
 int ntfs_dio_zero_range(struct inode *inode, loff_t offset, loff_t length)
 {
 	if ((offset | length) & (SECTOR_SIZE - 1))
@@ -573,7 +582,7 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 			iomap->length = length;
 	}
 
-	return 0;
+	return ntfs_iomap_prepare_tail(inode, iomap);
 }
 
 #define NTFS_IOMAP_FLAGS_BEGIN		BIT(1)
-- 
2.25.1

