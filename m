Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E7244C641
	for <ntfs@lists.linux.dev>; Tue, 21 Jul 2026 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627697; cv=none; b=C7EHbvbGOMMpFTf3mMJuLRDZF5OqWs5bqcQm4S+zw8kLbiU57fAQQC7VV6fVSKhTnKpsNVjkFLUbml+Y94wkjQ+Voo/Zc9iSRXLt8pJUwl6P9eoUAAVDKUfy85zcHI2xHGvx6EWqubRXVq7Sdl78st3rwOMwpk1UPJsicDS+Hcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627697; c=relaxed/simple;
	bh=+zS03zd+58SgNxVjuL42xS2wEj3ZZF1j/mh3xiFGD68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b4sLDYFHNStQkkYFgxgTu+GmliRtc6cVZUwMcsi/ABJ3s0QmHC0blqEJKZbf6z/PXFbxWRbsiwXwjL4wgNadqLnpmrriY6B/hOuwafYA+T4Bjr1kILrzD2qr/BrXky4u8jKV58hMZUpaLVjCPY7CHbAp1O/jpup+1cra25OzLxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYv0qoLf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYv0qoLf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677CE1F00A3E;
	Tue, 21 Jul 2026 09:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784627696;
	bh=USq3cMAgLVS+rgf7+EKuwztTb8xi+1FiQ5WR5qpbhxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fYv0qoLflAqGGGAG6SVzBh+d8eCkhyEywoLvzaIkSHu3fD+yCeFJmOVgIwf/jmjC9
	 Z0gYIabI4NTcPiRcTgaoVm7X6WCwA9LbY+ZCHXc5s3ZMl1Hsfx2ahlG/8UwHTdW8qS
	 nPcaZAUZMwY5RZNP3e/DhfJQNc5iK8JDR8laVRuw5xDT2+GXNrj9+HO4YZmFIW1mrN
	 dxz6JS/qU8D+wKBxfGfcEm/k1p0VRLZg7tTf5JXbFkJ8IuCROBazyJ0vmdU7gwrVyp
	 TLZFiD3mHvpwECHq9soaHPBV2v90YFTuiIuRCYF8a8uhKtzo0DnK6q4mHqJUUwEZED
	 hfAZsU13236CA==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH 04/11] ntfs: write compressed data before replacing old clusters
Date: Tue, 21 Jul 2026 18:54:24 +0900
Message-Id: <20260721095431.6619-4-linkinjeon@kernel.org>
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

ntfs_write_cb() punches the old compression unit and publishes the new
mapping before submitting the replacement data. An allocation or I/O
failure after the punch loses the previous contents and can leave the
mapping pointing at unwritten clusters.

Allocate and write the replacement clusters first. Replace the runlist only
after the synchronous write succeeds, and free new clusters on failure.

Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/compress.c | 63 ++++++++++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 33ed0456bf7e..5b5cd494e5d8 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -1373,10 +1373,6 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 
 	new_length = ntfs_bytes_to_cluster(vol, round_up(bio_size, vol->cluster_size));
 
-	err = ntfs_non_resident_attr_punch_hole(ni, new_vcn, ni->itype.compressed.block_clusters);
-	if (err < 0)
-		goto out;
-
 	rlc = ntfs_cluster_alloc(vol, new_vcn, new_length, -1, DATA_ZONE,
 			false, true, true);
 	if (IS_ERR(rlc)) {
@@ -1385,28 +1381,6 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 	}
 
 	bio_lcn = rlc->lcn;
-	down_write(&ni->runlist.lock);
-	rl = ntfs_runlists_merge(&ni->runlist, rlc, 0, &new_rl_count);
-	if (IS_ERR(rl)) {
-		up_write(&ni->runlist.lock);
-		ntfs_error(vol->sb, "Failed to merge runlists");
-		err = PTR_ERR(rl);
-		if (ntfs_cluster_free_from_rl(vol, rlc))
-			ntfs_error(vol->sb, "Failed to free hot clusters.");
-		kvfree(rlc);
-		goto out;
-	}
-
-	ni->runlist.count = new_rl_count;
-	ni->runlist.rl = rl;
-
-	err = ntfs_attr_update_mapping_pairs(ni, 0);
-	up_write(&ni->runlist.lock);
-	if (err) {
-		err = -EIO;
-		goto out;
-	}
-
 	i = 0;
 	while (bio_size > 0) {
 		int page_size;
@@ -1423,6 +1397,10 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		if (!bio) {
 			bio = bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRITE,
 					GFP_NOIO);
+			if (!bio) {
+				err = -ENOMEM;
+				goto free_rlc;
+			}
 			bio->bi_iter.bi_sector =
 				ntfs_bytes_to_sector(vol,
 						ntfs_cluster_to_bytes(vol, bio_lcn) +
@@ -1433,7 +1411,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 			err = submit_bio_wait(bio);
 			bio_put(bio);
 			if (err)
-				goto out;
+				goto free_rlc;
 			bio = NULL;
 			goto setup_bio;
 		}
@@ -1442,6 +1420,37 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 
 	err = submit_bio_wait(bio);
 	bio_put(bio);
+	if (err)
+		goto free_rlc;
+
+	/* Do not discard the old compression block until the new one is safe. */
+	err = ntfs_non_resident_attr_punch_hole(ni, new_vcn, cb_clusters);
+	if (err)
+		goto free_rlc;
+
+	down_write(&ni->runlist.lock);
+	rl = ntfs_runlists_merge(&ni->runlist, rlc, 0, &new_rl_count);
+	if (IS_ERR(rl)) {
+		up_write(&ni->runlist.lock);
+		ntfs_error(vol->sb, "Failed to merge runlists");
+		err = PTR_ERR(rl);
+		goto free_rlc;
+	}
+
+	ni->runlist.count = new_rl_count;
+	ni->runlist.rl = rl;
+	rlc = NULL;
+
+	err = ntfs_attr_update_mapping_pairs(ni, 0);
+	up_write(&ni->runlist.lock);
+	if (err)
+		err = -EIO;
+	goto out;
+
+free_rlc:
+	if (ntfs_cluster_free_from_rl(vol, rlc))
+		ntfs_error(vol->sb, "Failed to free hot clusters.");
+	kvfree(rlc);
 out:
 	if (outbuf)
 		vunmap(outbuf);
-- 
2.34.1

