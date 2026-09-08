Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D19F4F0531
	for <ntfs@lists.linux.dev>; Tue,  8 Sep 2026 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860696; cv=none; b=dFpl6dDg/f6jenvNYlzV5hXLze8hiQki3DWEw5FQUQWEQ9ZrJmjMK6XvC/a6TZtUTn2hXbtEbwb0BP9OcwJq4Pq3QYTg/2PZE9muF+QTYDkQcaXmVAcGX0USbgHJIZlqT1CyOR12a5HrcxcSGZlYiQKATS7GBlOJdpVS2ZW5sgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860696; c=relaxed/simple;
	bh=wTsFvbgaD8DnFcwak9FMpZXtX2YbgEtFe3e/Y6XdGWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OH+WkcsFFLBkfGYYMXqx5su0DX2ZK2IR3W8+/WT5AyGukljZQayal1lLKD0I6t9McLjtLtSgeDzg6XG7mmndOVY4t+FBP4P6Fzhcm6QSclwWuXZgobD6Z7e3QkWSgyVI/t8vv16S7a6kbDprG8abdMoQf+LTFLQo4cu8luv/Z0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWLwYF33; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWLwYF33"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598731F00A3F;
	Tue,  8 Sep 2026 09:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788860694;
	bh=QBnIfJ3TDuW59JwJ6SeNuPGlyXqurPJqnuQpwdLkt5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KWLwYF33ks0I505P5gCb00DxPQ3IxBk/8Lrs9YzYxP+Xq/9ZgHWi8nLIE51vEwXKo
	 j6tOoHe7AzPCFt+KYm6wV8HGfaFK5u1pALh5+XWSUVKj2/y4Ntf5Mx9xHVq5jX4Yai
	 5fOx5yxDahmebXr7fA07FmprH9/eXqKe1XFQKO0dxYyZyJw7CiSx2Fe+QEic4YZpht
	 NFJ6DyEMD342s1501JXn9xkVmp34baOg2p726jyj/ipY+hWxMKLlSYDPfoSS6Lp9GI
	 h6TpgZQcotMYYus6f6FVuFMgcLMuQfoIabrzHduzw+Okx/m47Tuc7T2PB4Nz6g/3QQ
	 Zf2B4jeKII/kQ==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH] ntfs: unhash failed inode reads
Date: Tue,  8 Sep 2026 18:44:16 +0900
Message-Id: <20260908094416.10534-8-linkinjeon@kernel.org>
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

Remove a newly allocated inode from the inode hash before discarding it.
NTFS may set i_nlink before a later initialization step fails, in which
case iput alone can retain the incomplete inode in the cache.

Fixes: bf6be898fbc5 ("ntfs: discard inodes that fail initialization")
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/inode.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 5f0201610e2d..cc0e3271a85d 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -170,9 +170,10 @@ struct inode *ntfs_iget(struct super_block *sb, u64 mft_no)
 	/* If this is a freshly allocated inode, need to read it now. */
 	if (inode_state_read_once(vi) & I_NEW) {
 		err = ntfs_read_locked_inode(vi);
-		if (err)
+		if (err) {
+			remove_inode_hash(vi);
 			discard_new_inode(vi);
-		else
+		} else
 			unlock_new_inode(vi);
 	}
 	/*
@@ -232,9 +233,10 @@ struct inode *ntfs_attr_iget(struct inode *base_vi, __le32 type,
 	/* If this is a freshly allocated inode, need to read it now. */
 	if (inode_state_read_once(vi) & I_NEW) {
 		err = ntfs_read_locked_attr_inode(base_vi, vi);
-		if (err)
+		if (err) {
+			remove_inode_hash(vi);
 			discard_new_inode(vi);
-		else
+		} else
 			unlock_new_inode(vi);
 	}
 	/*
@@ -288,9 +290,10 @@ struct inode *ntfs_index_iget(struct inode *base_vi, __le16 *name,
 	/* If this is a freshly allocated inode, need to read it now. */
 	if (inode_state_read_once(vi) & I_NEW) {
 		err = ntfs_read_locked_index_inode(base_vi, vi);
-		if (err)
+		if (err) {
+			remove_inode_hash(vi);
 			discard_new_inode(vi);
-		else
+		} else
 			unlock_new_inode(vi);
 	}
 	/*
-- 
2.25.1
