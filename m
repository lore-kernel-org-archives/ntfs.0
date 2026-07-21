Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2BF44BCB8
	for <ntfs@lists.linux.dev>; Tue, 21 Jul 2026 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627695; cv=none; b=BSBQvClWbroHn93dD6ThzBQmfTIi49rRXh28nPHbtMS4pfxHDeLLDjdTmCqQqe3TZjUDboRDqL3eaj9YBmOGK4L1pgH7fYlqh52+gYdeUuuDXm/3+coQHE7rB5L44+XGIjaoTSdOxc9jq5V0ckfr4Epe5VDttnpwkR0vPbsO5aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627695; c=relaxed/simple;
	bh=K5ONLth5awWS8lMFnkDgh4UPPZMdCOPdKdzyZwZEoqc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RmeE8lSNKULN98eDxr8NHmWKdskFFd8F1oK/b27fK81WedNulPmWLAb15C+xg7xNnZdNykMX8KaRMUXk/JITEwFqhG3M03TYJAW8faZKhQf/VhCGOuznCD4eQcsDXQMWebzKFEIyOJAwFSZef7kEpdida/GBMEI0cdDTj4EqZ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYOQmbrH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYOQmbrH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927B01F00A3A;
	Tue, 21 Jul 2026 09:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784627694;
	bh=+fyKSZUtK6AtfZ62lEM/T20qc02IAjOxEv6rANqwLG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DYOQmbrHDY4Pz0P0hScz00OfXrhQ/URJ08Yx6Yc9R1sDwUaxmTJvmZGNnBL8UTPnO
	 KhL4ucQns1ts/LK04icPmK35vMq+PO0toZT2CCbb4kPgrB79Wh+OO3Lhvpm0/MB4tD
	 FnyQk6WfQsa1qtZPIgcdVG/v0g0A59kz+VA/xtEZ2Ej2JauFESb7hR4fI+akoqhmyV
	 RopGeEzc2Ye/RvoL2JhfM2KKItv7d/S3s3wD0B4Z1ayqRwBqSyIX6MqJXszAivh/XH
	 u4EanRUStKzmrnMiMp1uhXiI/qPbO5Q4uyH9K64+NATBkCR80ohB7LrRLI9njMtcHJ
	 3BaITSe11SO0Q==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH 03/11] ntfs: punch all-zero compressed blocks
Date: Tue, 21 Jul 2026 18:54:23 +0900
Message-Id: <20260721095431.6619-3-linkinjeon@kernel.org>
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

When a rewritten compression block consists entirely of zeroes,
ntfs_write_cb() returns without replacing its existing runlist mapping.
The old on-disk contents therefore remain visible after cache eviction.

Punch the compression unit so that reads resolve it as a sparse block and
release any clusters that held the previous contents.

Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/compress.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 006b8831836c..33ed0456bf7e 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -1279,9 +1279,10 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 	int i, err;
 	int pages_count = (round_up(ni->itype.compressed.block_size + 2 *
 		(ni->itype.compressed.block_size / NTFS_SB_SIZE) + 2, PAGE_SIZE)) / PAGE_SIZE;
+	u32 cb_clusters = ni->itype.compressed.block_clusters;
 	size_t new_rl_count;
 	struct bio *bio = NULL;
-	loff_t new_length;
+	loff_t cb_pos, new_length;
 	s64 new_vcn;
 
 	in_mapping = vmap(pages, pages_per_cb, VM_MAP, PAGE_KERNEL_RO);
@@ -1351,6 +1352,9 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		}
 	}
 
+	cb_pos = pos & ~((loff_t)ni->itype.compressed.block_size - 1);
+	new_vcn = ntfs_bytes_to_cluster(vol, cb_pos);
+
 	if (!fail && !allzeroes) {
 		outbuf[compsz++] = 0;
 		outbuf[compsz++] = 0;
@@ -1359,7 +1363,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		bio_size = rounded;
 		pages = pages_disk;
 	} else if (allzeroes) {
-		err = 0;
+		err = ntfs_non_resident_attr_punch_hole(ni, new_vcn, cb_clusters);
 		goto out;
 	} else {
 		memcpy(outbuf, inbuf, insz);
@@ -1367,8 +1371,6 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		pages = pages_disk;
 	}
 
-	new_vcn = ntfs_bytes_to_cluster(vol,
-			pos & ~((loff_t)ni->itype.compressed.block_size - 1));
 	new_length = ntfs_bytes_to_cluster(vol, round_up(bio_size, vol->cluster_size));
 
 	err = ntfs_non_resident_attr_punch_hole(ni, new_vcn, ni->itype.compressed.block_clusters);
-- 
2.34.1

