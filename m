Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485884;
	b=T31TlPUAK52y4/IvJqF30meZGPkAymDYalG/r7khVqyGbsyoZT/65MQdeuj6qWT17c1g
	 1dRGWj2TuI/JqWtxnZbrJPzOCxTHQVP2Fz1sYhqpfqEVGMRkGvYY8ShEKqedAMU6PBMAY
	 M2J9kJtW1ioOTtN7utZo2DVX+7tcVzAxT5NXDJ7UmshqS6cqvTQYYlzdS/5pCDMmp+tdw
	 Zvs/K9a1sp2Yxrx/Z90T1j5WRJrPxMv7Zq+K75HPjyprf31YZHMCNuczwh1QQzxQFW+G2
	 My0YApdKVzYTZQnUPwBxgbCosirXBUzvUK0eVBswAaoGbxI8J4tWxAO+nUGsPTNoTDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485884;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=l3H5Qsy2xR//HAVKMlgqPVZptsQlS1KABAcZXWSUHlY=;
	b=LXL9sFOl1wGlpIaD4VNnORfcfEKMq8Mw8JotPp+w68QzMLKaqnNzTCcB6ti31V7U7oH7
	 5cIU4Kljk49+3AJmaYHOdUNMw0bQum4U7kLo0PyxLPwRUOQnxdX0oiSJdni0026yCvqaQ
	 d9WWtt6RjE7cdIE+JYBaEw8d8EwahRKlnjlp5RldkXv17J41AJ/cGb3TIvTEI8eB9sMru
	 l9mE+AiakBqjn4emOOcyBXdKioYh19bxGbcLBY1AdEPwltqkVeBq1WommPu8ZHF1uQTnM
	 x10H6G6Er/g7yJ8VcKfCCjD0RVnl/hmmdpl2mbRSa8mOqVHHQlnMrAJuGWlMZzEqmVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="n0v5/w4X";
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D95606A31D
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6D95606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=n0v5/w4X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=l3
	H5Qsy2xR//HAVKMlgqPVZptsQlS1KABAcZXWSUHlY=; b=n0v5/w4Xvz8/RJz44V
	Ig5C/2wCxOliBU2W4L4nXfG0OMPIW/VnMKOJ1Ga4sGVKo5vjpAWGJyHpIak/lnE3
	xijrk3lxeIJafxA0F7CXvyO7a7+lfQdF3cQpYB1W4lV4CC/w1uklEjS6ReiQPjvD
	VWziQAlyPmTUuxwS3x54Mkqto=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3XyPnKddq1latBA--.56704S4;
	Tue, 20 Oct 2026 16:44:27 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 02/31] ntfs: preserve cluster-free counts in attribute cleanup
Date: Tue, 20 Oct 2026 16:43:52 +0800
Message-ID: <20261020084421.2196486-3-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261020084421.2196486-1-liubaolin12138@163.com>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3XyPnKddq1latBA--.56704S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxuryxtr4kWw1UZFW3Cr4rXwb_yoWrWrWkpa
	yxCr1fK3y7X3srWrs7Kw1DZa4Sg3y0gryjgryDJw1Sy3Z0qw1xJFy2yrW8ur1fKrWUGwn8
	Xr4jk3y7ua1UX37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jhR6rUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gsV32rXKettTgAA33

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_cluster_free() returns a signed 64-bit cluster count on success,
not an integer status. Several attribute cleanup paths truncate that
count or treat a positive count as an error. ntfs_attr_rm() can even
return the count to callers that expect zero on success.

Store the result in s64 variables, test negative results for failure,
and compare the full count when validating an allocation rollback.
Return zero from ntfs_attr_rm() after successful removal. This keeps
successful deallocation from being misclassified by later reporting.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/attrib.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index fce7144d7bef..0be410973176 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -4164,7 +4164,7 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
 	struct super_block *sb = vol->sb;
 	struct attr_record *a = ctx->attr;
 	int name_ofs, val_ofs, err;
-	s64 arec_size;
+	s64 arec_size, freed;
 
 	ntfs_debug("Entering for inode 0x%llx, attr 0x%x.\n",
 			(unsigned long long)ni->mft_no, ni->type);
@@ -4252,8 +4252,8 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
 	 * the whole run list and thus it doesn't matter that the attribute
 	 * record is in a transiently corrupted state at this moment in time.
 	 */
-	err = ntfs_cluster_free(ni, 0, -1, ctx);
-	if (err) {
+	freed = ntfs_cluster_free(ni, 0, -1, ctx);
+	if (freed < 0) {
 		ntfs_error(sb, "Eeek! Failed to release allocated clusters");
 		ntfs_debug("Ignoring error and leaving behind wasted clusters.\n");
 	}
@@ -4496,6 +4496,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	struct ntfs_attr_search_ctx *ctx = NULL;
 	struct runlist_element *rl, *rln;
 	s64 org_alloc_size, org_compressed_size;
+	s64 freed;
 	int err, err2;
 	struct ntfs_inode *base_ni;
 	struct super_block *sb = ni->vol->sb;
@@ -4760,9 +4761,9 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		down_write(&ni->runlist.lock);
 rollback_locked:
 	/* Free allocated clusters. */
-	err2 = ntfs_cluster_free(ni, ntfs_bytes_to_cluster(vol, org_alloc_size),
-				-1, ctx);
-	if (err2)
+	freed = ntfs_cluster_free(ni, ntfs_bytes_to_cluster(vol, org_alloc_size),
+				  -1, ctx);
+	if (freed < 0)
 		ntfs_debug("Leaking clusters");
 
 	/*
@@ -5229,6 +5230,7 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 	struct runlist_element *rl, *rlc;
 	struct runlist_element *old_rl = NULL;
 	s64 vcn = vcn_start, lcn, clu_count;
+	s64 freed;
 	s64 lcn_seek_from = -1;
 	int err = 0;
 	size_t new_rl_count, old_rl_count;
@@ -5359,10 +5361,8 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 		ntfs_attr_reinit_search_ctx(ctx);
 		err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 		if (err) {
-			int err2;
-
-			err2 = ntfs_cluster_free(ni, vcn, clu_count, ctx);
-			if (err2 < 0 || err2 != clu_count) {
+			freed = ntfs_cluster_free(ni, vcn, clu_count, ctx);
+			if (freed < 0 || freed != clu_count) {
 				ntfs_error(vol->sb,
 					   "Failed to free cluster allocation. Leaving inconsistent metadata.\n");
 				NVolSetErrors(vol);
@@ -5410,6 +5410,7 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 {
 	struct ntfs_attr_search_ctx *ctx;
 	int err = 0, ret = 0;
+	s64 freed = 0;
 	struct ntfs_inode *base_ni;
 	struct super_block *sb = ni->vol->sb;
 
@@ -5431,10 +5432,12 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 			return -ENOMEM;
 		}
 
-		ret = ntfs_cluster_free(ni, 0, -1, ctx);
-		if (ret < 0)
+		freed = ntfs_cluster_free(ni, 0, -1, ctx);
+		if (freed < 0) {
+			ret = freed;
 			ntfs_error(sb,
 				"Failed to free cluster allocation. Leaving inconstant metadata.\n");
+		}
 		ntfs_attr_put_search_ctx(ctx);
 	}
 
-- 
2.51.0

