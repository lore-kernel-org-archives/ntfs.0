Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA434F0526
	for <ntfs@lists.linux.dev>; Tue,  8 Sep 2026 09:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860692; cv=none; b=hBVdEnjk6BDrOdRgVWsLXoUIBvWUsiLERFwbJn/CqnvddQQN1eogymH0our3c6EUErBWwRdKNuAF8RqHZei8Q6vet3p7vXsmaqU/JEUZcVI2TaspY8m/eWQ4vdF6X187VDombfgGIB6Z05hhsj7Ljf8+DSXBGySnn5O3sWOFV+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860692; c=relaxed/simple;
	bh=AyLkuTKYFY+y3XB15Q1XhV6wYtQQv+JbMTgsBbrsDUA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LltC2k4jHibH7+CKZDbXoVUG9JXn3NttF7dpMGQQ17Wg5bNm/UrX/1DWcvehTPCXPuM91GSbIDik2drCLsQnsyC9hhMoVFy79AVHBxnzxLQcxek4LlAaKwe1Qho7ceHGoKtq++sTI+PaYLqmDfAZEwTdIie2IhOU+kU64H16xfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+gunWG3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+gunWG3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11DE1F00A3A;
	Tue,  8 Sep 2026 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788860690;
	bh=dLHZWwr9VAhQOTLTkANARRt17W7bfz0HG2A5B/eAM2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A+gunWG3PrYaPB4VPymlEFE90pOgHcuVurBN+GlA5oRHbV7aR3yuKZaq/nN2WInZP
	 mBx6E0HtmwLszhv6ETVx/6FGerdQMADR9s6y7y0nzIVeb6eHbEdyYOeTli6Sfy5t5E
	 AFerBS/AfESpUPaAsxHYcYXMscvg4TN9bAmTu8PTl3ZiZceKYV0wbo/uW0FVMMW/Tq
	 /Sfs1T0wnnUqtmBaaLM899ooz4PHP6YHbVQRCF01oR7fAbl5tncyl/xnylmewmTQGY
	 LD9GjwlbrZl263lJ/a1b3p7lDuynBpngBM6N9jSBg7qlfrxKj/+m4na/96jI4zu/N+
	 uqmTcKwMNKH3Q==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH] ntfs: ignore interrupted inode reads as corruption
Date: Tue,  8 Sep 2026 18:44:14 +0900
Message-Id: <20260908094416.10534-6-linkinjeon@kernel.org>
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

Do not mark the volume in error or report an inode as corrupt when
reading it was interrupted by a signal. -EINTR and -ERESTARTSYS indicate
a transient read failure rather than on-disk NTFS corruption.

Fixes: 115380f9a2f9 ("ntfs: update mft operations")
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/inode.c | 21 +++++++++++++--------
 fs/ntfs/mft.c   |  3 ++-
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index bb97cc6c6ba7..b735cd829120 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1241,7 +1241,8 @@ static int ntfs_read_locked_inode(struct inode *vi)
 	if (m)
 		unmap_mft_record(ni);
 err_out:
-	if (err != -EOPNOTSUPP && err != -ENOMEM && vol_err == true) {
+	if (err != -EOPNOTSUPP && err != -ENOMEM &&
+	    err != -EINTR && err != -ERESTARTSYS && vol_err == true) {
 		ntfs_error(vol->sb,
 			"Failed with error code %i.  Marking corrupt inode 0x%llx as bad.  Run chkdsk.",
 			err, ni->mft_no);
@@ -1467,12 +1468,13 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
 		ntfs_attr_put_search_ctx(ctx);
 	unmap_mft_record(base_ni);
 err_out:
-	if (err != -ENOENT)
+	if (err != -ENOENT && err != -EINTR && err != -ERESTARTSYS)
 		ntfs_error(vol->sb,
 			"Failed with error code %i while reading attribute inode (mft_no 0x%llx, type 0x%x, name_len %i).  Marking corrupt inode and base inode 0x%llx as bad.  Run chkdsk.",
 			err, ni->mft_no, ni->type, ni->name_len,
 			base_ni->mft_no);
-	if (err != -ENOENT && err != -ENOMEM)
+	if (err != -ENOENT && err != -ENOMEM &&
+	    err != -EINTR && err != -ERESTARTSYS)
 		NVolSetErrors(vol);
 	return err;
 }
@@ -1676,8 +1678,9 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 	/* Get the index bitmap attribute inode. */
 	bvi = ntfs_attr_iget(base_vi, AT_BITMAP, ni->name, ni->name_len);
 	if (IS_ERR(bvi)) {
-		ntfs_error(vi->i_sb, "Failed to get bitmap attribute.");
 		err = PTR_ERR(bvi);
+		if (err != -EINTR && err != -ERESTARTSYS)
+			ntfs_error(vi->i_sb, "Failed to get bitmap attribute.");
 		goto unm_err_out;
 	}
 	bni = NTFS_I(bvi);
@@ -1721,10 +1724,12 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 	if (m)
 		unmap_mft_record(base_ni);
 err_out:
-	ntfs_error(vi->i_sb,
-		"Failed with error code %i while reading index inode (mft_no 0x%llx, name_len %i.",
-		err, ni->mft_no, ni->name_len);
-	if (err != -EOPNOTSUPP && err != -ENOMEM)
+	if (err != -EINTR && err != -ERESTARTSYS)
+		ntfs_error(vi->i_sb,
+			"Failed with error code %i while reading index inode (mft_no 0x%llx, name_len %i.",
+			err, ni->mft_no, ni->name_len);
+	if (err != -EOPNOTSUPP && err != -ENOMEM &&
+	    err != -EINTR && err != -ERESTARTSYS)
 		NVolSetErrors(vol);
 	return err;
 }
diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 5b9723abb10f..6d5e56378afd 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -213,7 +213,8 @@ struct mft_record *map_mft_record(struct ntfs_inode *ni)
 		return m;
 
 	atomic_dec(&ni->count);
-	ntfs_error(ni->vol->sb, "Failed with error code %lu.", -PTR_ERR(m));
+	if (PTR_ERR(m) != -EINTR && PTR_ERR(m) != -ERESTARTSYS)
+		ntfs_error(ni->vol->sb, "Failed with error code %lu.", -PTR_ERR(m));
 	return m;
 }
 
-- 
2.25.1
