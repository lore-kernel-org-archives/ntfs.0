Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4BF4AA416
	for <ntfs@lists.linux.dev>; Wed,  7 Oct 2026 13:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379158; cv=none; b=OE7msiq1cloMGIAZdXsqra+zhPHpSi5f03R4vt8OvWLm6H7TeP9WA6uGyCvX/ZqwrDOtDwWwMVbXS0H7ZR9aj003Wsz1fa6fevEGEFQ10a4dL7bUkvjTovHgmhWap5M0c4dayBLwdWK72hvHo+5aaqcVl2XdN7mbVCik1MFncgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379158; c=relaxed/simple;
	bh=IEVdlZmDxjI19e6nrOUoLU8TBAn4aDSffQTwK0/kVbo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JKHiZkhr84w7edhU93GHNPNX8hf7X1yU0NNSnddw5S/diOzKls0/T2ThpXDLk6hkm2emFXUGOrBIRcMtI6yK3sNx+8aJr0iaB9Y7c4Z8njUfycOJfT/M/+f0ZuVq46kaXn9g6CAijnTPLn3UgKPSN8JilOoUrDgZTDv0s122g6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZ1ndmv8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZ1ndmv8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7ED81F0089D;
	Wed,  7 Oct 2026 13:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791379143;
	bh=orqcYQOBv3zapcA5WbjZRbURcg9bB6Nu37XqiTjX5R8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IZ1ndmv8BbRZwFb0omzIPHFgmDj1F5vhwB1u1ePY1dF078HUnZdDGFNPWjdRAIiJU
	 hpMVHLvFhS9cZJVD9PN0m2kEjUFeYqC8fGTNt++rtdhSl4zb97Vk+QCN05DvieJQDY
	 77xUTImddLKEYeGueOSpiGThePtxr2w6MudGpUjoAad+NAwEpypx0F5H2mxc879/mI
	 vfW0U41VdfgsdBF3ulKgmxPWzaDNFyn+Ru4AdxGqDd2UNbvBRyuonRDlb7xElJm6M0
	 xzWYx5xKdlg7+tYjl28Wapi2Wua1uWaAemf4UJRWtYcdmyVE7XUYv/dN0+DyBNMFG7
	 6+ERFLn0O/Tdw==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH 3/4] ntfs: clear stale pagecache on initialized-size extension
Date: Wed,  7 Oct 2026 22:18:43 +0900
Message-Id: <20261007131844.8013-3-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261007131844.8013-1-linkinjeon@kernel.org>
References: <20261007131844.8013-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iomap_zero_range() skips holes, so EOF-polluted cache data can survive
gap zeroing. Discard the uninitialized cache range before advancing
initialized_size so later reads cannot expose stale bytes.

Perform the cleanup in ntfs_extend_initialized_size() so both file writes
and shared writable mmap preparation use it. Hold the invalidate lock
while reading initialized_size, clearing the cache, zeroing the gap, and
updating the attribute. Release the lock on every exit path.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/inode.c | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index eca0724c4358..6cfe8f24e4cc 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -8,6 +8,7 @@
 
 #include <linux/writeback.h>
 #include <linux/seq_file.h>
+#include <linux/mm.h>
 
 #include "lcnalloc.h"
 #include "time.h"
@@ -2484,38 +2485,50 @@ int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
 				 const loff_t new_size)
 {
 	struct ntfs_inode *ni = NTFS_I(vi);
-	loff_t old_init_size;
+	loff_t old_init_size, clear_size;
 	unsigned long flags;
-	int err;
+	int err = 0;
+
+	if (!NInoNonResident(ni))
+		return -EINVAL;
 
+	filemap_invalidate_lock(vi->i_mapping);
 	read_lock_irqsave(&ni->size_lock, flags);
 	old_init_size = ni->initialized_size;
 	read_unlock_irqrestore(&ni->size_lock, flags);
 
-	if (!NInoNonResident(ni))
-		return -EINVAL;
 	if (old_init_size >= new_size)
-		return 0;
+		goto out;
 
 	err = ntfs_attr_map_whole_runlist(ni);
 	if (err)
-		return err;
+		goto out;
 
-	if (!NInoCompressed(ni) && old_init_size < offset) {
-		err = iomap_zero_range(vi, old_init_size,
-				       offset - old_init_size,
-				       NULL, &ntfs_seek_iomap_ops,
-				       &ntfs_iomap_folio_ops, NULL);
-		if (err)
-			return err;
+	if (!NInoCompressed(ni)) {
+		/*
+		 * Zeroing skips holes, so discard cached uninitialized bytes
+		 * before making them visible to writes or shared mappings.
+		 */
+		clear_size = max_t(loff_t, i_size_read(vi), new_size);
+		truncate_pagecache_range(vi, old_init_size, clear_size - 1);
+
+		if (old_init_size < offset) {
+			err = iomap_zero_range(vi, old_init_size,
+					       offset - old_init_size,
+					       NULL, &ntfs_seek_iomap_ops,
+					       &ntfs_iomap_folio_ops, NULL);
+			if (err)
+				goto out;
+		}
 	}
 
-
 	mutex_lock(&ni->mrec_lock);
 	err = ntfs_attr_set_initialized_size(ni, new_size);
 	mutex_unlock(&ni->mrec_lock);
 	if (err)
 		truncate_setsize(vi, old_init_size);
+out:
+	filemap_invalidate_unlock(vi->i_mapping);
 	return err;
 }
 
-- 
2.25.1

