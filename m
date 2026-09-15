Received: from hades.hexcom.net (hades.hexcom.net [94.130.240.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D953290B7
	for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 07:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.130.240.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458469; cv=none; b=gWhns7awMccCN/js2GDGrYkieaKoYlLnutWKctcBzrB4u6rRT8URmcB9dJwF/TGFWNLRPSpksVAlxHgWFYZCbj4xQSH4lt1k5I/ESlcjZkM5VAenGvcT2MGZ0Sy5llauJLQpaM/qAO9I9zWoZuD+urpW+07hFNgJTQdAlj0Eh5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458469; c=relaxed/simple;
	bh=w7Jx7VXtwY8gQG8K5eWnWC2gUCvVin0t05NWi3I7aBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vx4aGeoNcEjwyShzI1Mof3MjuNc+EKWJ/c0jhLAbshQ5lgUHdPk24AP8s6JTTFl87FTeWGDLQA+EnWvO+NpRc3792gSr/aLM9kJKsa+wvBJ8fQvZH7g041tor3DTtHgpXIs6G8JyT6PUqrKROyedEXLh54LB0rv11Rav4ZY1V3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesolowski.eu.org; spf=pass smtp.mailfrom=wesolowski.eu.org; arc=none smtp.client-ip=94.130.240.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesolowski.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wesolowski.eu.org
Received: from [78.30.104.81] (helo=PI.tailc0d925.ts.net)
	by hades.hexcom.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <marek@wesolowski.eu.org>)
	id 1x6NtB-003l8A-1P;
	Tue, 15 Sep 2026 09:47:37 +0200
From: =?UTF-8?q?Marek=20Weso=C5=82owski?= <marek@wesolowski.eu.org>
To: ntfs@lists.linux.dev
Cc: Baolin Liu <liubaolin12138@163.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH v3] ntfs: fix directory lookup on large-page systems
Date: Tue, 15 Sep 2026 09:47:22 +0200
Message-ID: <20260915074722.27533-1-marek@wesolowski.eu.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <81955f5b-ee97-4856-bb77-bffc739a8f5d@163.com>
References: <81955f5b-ee97-4856-bb77-bffc739a8f5d@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-YourOrg-MailScanner-Information: Please contact the ISP for more information
X-YourOrg-MailScanner-ID: 1x6NtB-003l8A-1P
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
and propagate fixup failures before validating the block. Report fixup
failures through ntfs_error() so the configured errors= policy is applied.

Return -EIO when post_read_mst_fixup() detects an incomplete multi sector
transfer, since this indicates an on-disk metadata integrity error.

Reproduced on arm64 with 16 KiB pages and 4 KiB NTFS index blocks. The
affected entry was visible in readdir but stat returned ENOENT. Both exact
and case-insensitive lookup succeed after this change.

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Signed-off-by: Marek Wesołowski <marek@wesolowski.eu.org>
---
Changes in v3:
- Rebased onto the current kernel.org ntfs-next branch at 65829d51fa81.
- Report MST fixup failures through ntfs_error() so the configured
  errors= policy is applied.

Changes in v2:
- Rebased onto the kernel.org ntfs-next branch.
- Updated the Fixes tag as requested.

 fs/ntfs/dir.c | 9 ++++++++-
 fs/ntfs/mst.c | 4 ++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index 2d594cb..af2f648 100644
--- a/fs/ntfs/dir.c
+++ b/fs/ntfs/dir.c
@@ -331,7 +331,6 @@ descend_into_child_node:
 	}
 
 	memcpy_from_folio(kaddr, folio, 0, PAGE_SIZE);
-	post_read_mst_fixup((struct ntfs_record *)kaddr, PAGE_SIZE);
 	folio_unlock(folio);
 	folio_put(folio);
 fast_descend_into_child_node:
@@ -352,6 +351,14 @@ fast_descend_into_child_node:
 			   vcn, dir_ni->mft_no);
 		goto unm_err_out;
 	}
+	err = post_read_mst_fixup((struct ntfs_record *)ia,
+				  dir_ni->itype.index.block_size);
+	if (err) {
+		ntfs_error(sb,
+			   "MST fixup failed for index block vcn %lld in directory inode 0x%llx.",
+			   vcn, dir_ni->mft_no);
+		goto unm_err_out;
+	}
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

base-commit: 65829d51fa811ebcbf082c1e5d0cbecad2f9a836
-- 
2.47.3
