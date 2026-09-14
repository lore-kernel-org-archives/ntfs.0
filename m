Received: from hades.hexcom.net (hades.hexcom.net [94.130.240.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B2A3C3C11
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 10:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.130.240.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383215; cv=none; b=oTKH+5xe/PNq8AQHY8GwI+LtxB5pQ2Bmr4wqd9bfWUyd0B3+gkLDDmi6dt3mU3haIKqk/R07zNTchtXFjz7dH6sMCDUt7ZXfoo5umEGg8YfBiTLyrUlFpCsB9pKWD1MOmpYowV08ReKE2kI9xg3b31mO5U9UYNTcbdx2pKnK0Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383215; c=relaxed/simple;
	bh=IKdD78RFhZ5hhFukaEem6WSbf++Mco63dETWNBPRqzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yg3KtfienXpQaoRs/axtgFz6E9MHRetjNcYK+lwRMuhGCROXx8hvPRL34vKHJchLe4lhqaiGExj34pAU1y1wqn7X6gt7QOl8NccKXvP62VeiEDv/5oZUewLy/jykDKKwh8m0Q7j3EuUR2aP0h9XHE0597gg1PZAOh+UKiBIM7Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesolowski.eu.org; spf=pass smtp.mailfrom=wesolowski.eu.org; arc=none smtp.client-ip=94.130.240.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesolowski.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wesolowski.eu.org
Received: from [78.30.104.81] (helo=PI.tailc0d925.ts.net)
	by hades.hexcom.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <marek@wesolowski.eu.org>)
	id 1x64JQ-00BLfL-PL;
	Mon, 14 Sep 2026 12:53:24 +0200
From: =?UTF-8?q?Marek=20Weso=C5=82owski?= <marek@wesolowski.eu.org>
To: ntfs@lists.linux.dev
Cc: Baolin Liu <liubaolin12138@163.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH v2] ntfs: fix directory lookup on large-page systems
Date: Mon, 14 Sep 2026 12:53:04 +0200
Message-ID: <20260914105304.16086-1-marek@wesolowski.eu.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <38b0d495-30bb-4eda-b535-7dd67df90f05@163.com>
References: <38b0d495-30bb-4eda-b535-7dd67df90f05@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-YourOrg-MailScanner-Information: Please contact the ISP for more information
X-YourOrg-MailScanner-ID: 1x64JQ-00BLfL-PL
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

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Signed-off-by: Marek Wesołowski <marek@wesolowski.eu.org>
---
Changes in v2:
- Rebased onto the current kernel.org ntfs-next branch at 8809c3f29555.
- Updated the Fixes tag as requested.

 fs/ntfs/dir.c | 5 ++++-
 fs/ntfs/mst.c | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index 2d594cb..caf640d 100644
--- a/fs/ntfs/dir.c
+++ b/fs/ntfs/dir.c
@@ -331,7 +331,6 @@ descend_into_child_node:
 	}
 
 	memcpy_from_folio(kaddr, folio, 0, PAGE_SIZE);
-	post_read_mst_fixup((struct ntfs_record *)kaddr, PAGE_SIZE);
 	folio_unlock(folio);
 	folio_put(folio);
 fast_descend_into_child_node:
@@ -352,6 +351,10 @@ fast_descend_into_child_node:
 			   vcn, dir_ni->mft_no);
 		goto unm_err_out;
 	}
+	err = post_read_mst_fixup((struct ntfs_record *)ia,
+				  dir_ni->itype.index.block_size);
+	if (err)
+		goto unm_err_out;
 	err = ntfs_index_block_inconsistent(vol, ia,
 					    dir_ni->itype.index.block_size,
 					    vcn, COLLATION_FILE_NAME,
diff --git a/fs/ntfs/mst.c b/fs/ntfs/mst.c
index 7f9faad..cc63634 100644
--- a/fs/ntfs/mst.c
+++ b/fs/ntfs/mst.c
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
base-commit: 8809c3f29555f9d1e66fe015080a8d4979d91eaa
-- 
2.47.3
