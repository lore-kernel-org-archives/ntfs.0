Received: from hades.hexcom.net (hades.hexcom.net [94.130.240.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788753F0A92
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 08:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.130.240.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373916; cv=none; b=b0QwYsvrO+UktQtVT82pA87+Q4jI1sMRYbYF6U6WvjmVqJ+h7UTHqNdC+ZA9jSM1Jc6Q1uvY+Q5pgLu1nSakxySXlfXEW6gNlWGijlSLiJw6jy8iQGjIg5MdszLdQBE6rTTd40hZottGctoa6RgvCF1tmkh8d031i7qstE2Lqeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373916; c=relaxed/simple;
	bh=Tnb7Uv3s7Adzh61DDqSz7RFOEE89n3lXQzXsHKwQHg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qXZUZYc0rIMBEQI8b18IjIMgrzcKnURwc1nRWUJ8U10226wAjs+pUE9v9IpnT2uSYr1Q3dXad3GAo7O1N/+RnXUfe4u7z7ZrTLKobeOesjoqtQtqAwCKA5Oze1L55lm9H2sQbmZr7piXDPnah2Zye7vtpXfmq0lcMR78F+u7LYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesolowski.eu.org; spf=pass smtp.mailfrom=wesolowski.eu.org; arc=none smtp.client-ip=94.130.240.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesolowski.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wesolowski.eu.org
Received: from [78.30.104.81] (helo=PI.tailc0d925.ts.net)
	by hades.hexcom.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <marek@wesolowski.eu.org>)
	id 1x61eb-009fpJ-Ph;
	Mon, 14 Sep 2026 10:03:05 +0200
From: =?UTF-8?q?Marek=20Weso=C5=82owski?= <marek@wesolowski.eu.org>
To: ntfs@lists.linux.dev
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH] ntfs: fix directory lookup on large-page systems
Date: Mon, 14 Sep 2026 10:02:43 +0200
Message-ID: <20260914080243.10704-1-marek@wesolowski.eu.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-YourOrg-MailScanner-Information: Please contact the ISP for more information
X-YourOrg-MailScanner-ID: 1x61eb-009fpJ-Ph
X-YourOrg-MailScanner: Found to be clean
X-YourOrg-MailScanner-SpamCheck: 
X-YourOrg-MailScanner-From: marek@wesolowski.eu.org
X-Authenticated-Id: marek@wesolowski.eu.org

ntfs_lookup_inode_by_name() copies PAGE_SIZE bytes from the index
allocation mapping and applies MST fixups to that entire buffer before
selecting the requested INDX block.

When PAGE_SIZE is larger than the NTFS index block size, the USA count
belongs to the smaller INDX block. post_read_mst_fixup() therefore treats
the PAGE_SIZE call as not applicable and leaves the update sequence words
in place. A directory entry crossing a sector boundary can then be returned
by readdir but missed by lookup.

Select the INDX block first, apply the fixup using its actual block size,
and propagate fixup failures before validating the block.

Return -EIO when post_read_mst_fixup() detects an incomplete multi sector
transfer, since this indicates an on-disk metadata integrity error.

Reproduced on arm64 with 16 KiB pages and 4 KiB NTFS index blocks. The
affected entry was visible in readdir but stat returned ENOENT. Both exact
and case-insensitive lookup succeed after this change.

Fixes: d3ad708fecaa ("ntfs: Initial commit")
Signed-off-by: Marek Wesołowski <marek@wesolowski.eu.org>
---
 dir.c | 6 ++++--
 mst.c | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/dir.c b/dir.c
index f22fea6..0e535a6 100644
--- a/dir.c
+++ b/dir.c
@@ -338,7 +338,6 @@ descend_into_child_node:
 	}
 
 	memcpy_from_folio(kaddr, folio, 0, PAGE_SIZE);
-	post_read_mst_fixup((struct ntfs_record *)kaddr, PAGE_SIZE);
 	folio_unlock(folio);
 	folio_put(folio);
 #else
@@ -357,7 +356,6 @@ descend_into_child_node:
 		goto unm_err_out;
 	}
 	memcpy(kaddr, (u8 *)page_address(page), PAGE_SIZE);
-	post_read_mst_fixup((struct ntfs_record *)kaddr, PAGE_SIZE);
 	unlock_page(page);
 	kunmap(page);
 	put_page(page);
@@ -380,6 +378,10 @@ fast_descend_into_child_node:
 			   vcn, dir_ni->mft_no);
 		goto unm_err_out;
 	}
+	err = post_read_mst_fixup((struct ntfs_record *)ia,
+			dir_ni->itype.index.block_size);
+	if (err)
+		goto unm_err_out;
 	err = ntfs_index_block_inconsistent(vol, ia,
 					    dir_ni->itype.index.block_size,
 					    vcn, COLLATION_FILE_NAME,
diff --git a/mst.c b/mst.c
index 7f9faad..cc63634 100644
--- a/mst.c
+++ b/mst.c
@@ -19,7 +19,7 @@
  * magic of the ntfs record header being processed with "BAAD" (in memory only!)
  * and abort processing.
  *
- * Return 0 on success and -EINVAL on error ("BAAD" magic will be present).
+ * Return 0 on success and -EIO on error ("BAAD" magic will be present).
  *
  * NOTE: We consider the absence / invalidity of an update sequence array to
  * mean that the structure is not protected at all and hence doesn't need to
@@ -71,7 +71,7 @@ int post_read_mst_fixup(struct ntfs_record *b, const u32 size)
 			 * Note that magic_BAAD is already converted to le32.
 			 */
 			b->magic = magic_BAAD;
-			return -EINVAL;
+			return -EIO;
 		}
 		data_pos += NTFS_BLOCK_SIZE / sizeof(u16);
 	}
-- 
2.47.3

