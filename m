Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33D24C77BD
	for <ntfs@lists.linux.dev>; Tue,  8 Sep 2026 09:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860693; cv=none; b=lPtE1vj+zRBEGQYQ0IdtxbFTfLQ+0KcSgWcHEUJxqQhpAgD11upgTSp5G0RbVRfUA24Ae0AhYuG9MU4tMkOvCXlWHwkTvkqmnpQBk86jcK4Ux/dUhqoOzvmV6cvvl4vFbYajBin8WbOqWOzs+sKg1cI396rx10jq1ilsD61GleM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860693; c=relaxed/simple;
	bh=yxdbqkKFnvraPex59NBlk/JvCKcQtvyI8Z5OOPryJvY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ghopJ5a+ED1HWvSCg1eW08EpeVjtaEUpxHdsD/jXVfr44dN1dHziWgkTK8PtjSeM/4vXY9exauIaxprNqqc5oybn/NoCBlIQ8J09VelPhniEtL8+jzjLXTh93O5EK/7+Hq/5Wdyl3Na9BnSZC0LzQDopOi/nzgJBFdKxWlVFBGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fd5GLw4Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fd5GLw4Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004A81F00A3D;
	Tue,  8 Sep 2026 09:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788860692;
	bh=97fFwfl/XrdNiDBrx50rfo7I+LS2aoizG9mzghGcFYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fd5GLw4ZBRJqJWMxSy9i8Sc0qjsXLozrKBLO/0Vd1/ZJiBW/9g/FhZHWTikHb9OD2
	 BjitG1tCgJI6NKKHtAXYDh/k618yte873XY4IFmZ4Pmd57lfNAiYpmwP8FUFRX81BZ
	 YkJqFmTG2ZOrUq1o7EQUu4Y+EeRqPdknl4FeEiPIAGU0ffNZQ5cI/AFzrbIlRbFOr+
	 S9KVJJNsFJkC4eNctov13IZj06BFz3zI5IfJ6tVe+g4c9zYR9tZhhm0ztJfVO8dqdS
	 Izj+RXuk7BX0tkE1V5WRlnOTO53BAR5jYEAZJBks5EsSJ+Z4oIJujv9iFbXTle5VxE
	 03aBAzlvbYCmA==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH] ntfs: discard inodes that fail initialization
Date: Tue,  8 Sep 2026 18:44:15 +0900
Message-Id: <20260908094416.10534-7-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260908094416.10534-1-linkinjeon@kernel.org>
References: <20260908094416.10534-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Discard a newly allocated normal, attribute, or index inode when
initialization fails. Keeping an incompletely initialized inode in the
inode cache can expose stale sequence data to later directory lookups.

Fixes: d7aa04984f12 ("ntfs: return errors from inode initialization")
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/inode.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index b735cd829120..5f0201610e2d 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -170,17 +170,18 @@ struct inode *ntfs_iget(struct super_block *sb, u64 mft_no)
 	/* If this is a freshly allocated inode, need to read it now. */
 	if (inode_state_read_once(vi) & I_NEW) {
 		err = ntfs_read_locked_inode(vi);
-		unlock_new_inode(vi);
+		if (err)
+			discard_new_inode(vi);
+		else
+			unlock_new_inode(vi);
 	}
 	/*
 	 * There is no point in keeping bad inodes around. This also
 	 * simplifies things in that we never need to check for bad inodes
 	 * elsewhere.
 	 */
-	if (unlikely(err)) {
-		iput(vi);
+	if (unlikely(err))
 		vi = ERR_PTR(err);
-	}
 	return vi;
 }
 
@@ -231,17 +232,18 @@ struct inode *ntfs_attr_iget(struct inode *base_vi, __le32 type,
 	/* If this is a freshly allocated inode, need to read it now. */
 	if (inode_state_read_once(vi) & I_NEW) {
 		err = ntfs_read_locked_attr_inode(base_vi, vi);
-		unlock_new_inode(vi);
+		if (err)
+			discard_new_inode(vi);
+		else
+			unlock_new_inode(vi);
 	}
 	/*
 	 * There is no point in keeping bad attribute inodes around. This also
 	 * simplifies things in that we never need to check for bad attribute
 	 * inodes elsewhere.
 	 */
-	if (unlikely(err)) {
-		iput(vi);
+	if (unlikely(err))
 		vi = ERR_PTR(err);
-	}
 	return vi;
 }
 
@@ -286,17 +288,18 @@ struct inode *ntfs_index_iget(struct inode *base_vi, __le16 *name,
 	/* If this is a freshly allocated inode, need to read it now. */
 	if (inode_state_read_once(vi) & I_NEW) {
 		err = ntfs_read_locked_index_inode(base_vi, vi);
-		unlock_new_inode(vi);
+		if (err)
+			discard_new_inode(vi);
+		else
+			unlock_new_inode(vi);
 	}
 	/*
 	 * There is no point in keeping bad index inodes around.  This also
 	 * simplifies things in that we never need to check for bad index
 	 * inodes elsewhere.
 	 */
-	if (unlikely(err)) {
-		iput(vi);
+	if (unlikely(err))
 		vi = ERR_PTR(err);
-	}
 	return vi;
 }
 
-- 
2.25.1
