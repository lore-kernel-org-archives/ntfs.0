Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FDC3A6B99
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 10:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506637; cv=none; b=lgTvKpRnongyFl/hg5ekgb8ZAyc+qA3cV7j2E24s4kPTMzbnLhK2cygH/R9aHNDfUcFDJgJrZTiV5S8NFZf4I6YQjFV3hrPdrqY5YO74KScQdh/spgmJ1G7FfPxsWyw7L6wOmjGH3kAA2tDhQmeN8aiKm3D9gmHiJbRZATJKfiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506637; c=relaxed/simple;
	bh=anBpznAiBHOZYVVLdRQG8ojWmyerA7QIN+GG/ul3n/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ix4uTPgpscKpdr6WLiDYwm/Z4QXyqfYVfFSBqxfpfEhRBur+al6pZh0e+VE0jychku4Jw9Y99toM5Wi1NiA2KW+jmROvfV41zGRwzvVb2RBjvGxEN/uVx5Kqxqf+KSeTlp0kh8NqCKPCsFXWA4D0/bf0G4yOM+diwMNlY4S0qrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C++C+Zdm; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C++C+Zdm"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db1ca069c8so9238685ad.3
        for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 03:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506632; x=1791111432; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8Z9MR0KdfPZejftAKzmRNamwRbZ6Puylih67+dfFsQ=;
        b=C++C+ZdmtilNK9kqPf4031tMdgFjeIX4DqVTbK1kU+bOdWklGhtqYQ52nsLwVc63Zb
         hs53T1kbzflPwbbK086fhlA3F4yYEMs25lCGf0po65T5/pNGZZfjGrq871RznvEOzc+d
         l75R6g9yZQo/JVRwl5WC1X2WDllfRV5gqx5Xzj75tqY98eff9q0ThpC/inpcJyoqNxCz
         Z/t43Lh72xwxD2Aji0vvaqZhoeFJIsHWMSLaxEr0eObbfrXnYHrdj8kMB1jqz953ynX/
         /QR9ay41qDOq6ryZgJICIkBtxoid4eBhirdiX+OvB/SwZ6MSU99GvNbLw/reb3vVVysj
         u9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506632; x=1791111432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o8Z9MR0KdfPZejftAKzmRNamwRbZ6Puylih67+dfFsQ=;
        b=auqkC6ZoeB26TlPrFzYDhQRQiuPTkdjQlIpanGRKeGX4slCN7iezaW9m/RO49ukcyB
         N6AUEmwPyCEJpGG6R3kzg9MFURogRUOVllrpVX1OxHZt06RoO7+TB0AjWwZM8Rbft339
         +qdGcofLpuGji5xBUus0w7P+d/H2wKDK86/kFT6rvBZbgrzlROClKIA1pW5Qr48eZOd4
         QQ2JVv1S4UgT3a3CRHije0d3WO8Veh+RbqquXJUo9fDOFZi5+P0HoXhwfyfdMihWJcOI
         6Vn+yL0GnKSA1cLfcU6mcD7jkXI3ix4OSjaMqf8H57nvJuZLNxVYA1t3EFxLlL1CcSBH
         DK4Q==
X-Gm-Message-State: AFq9FYLlDOzjdOq8JDH5B/P2yiTUMHfdKzonoXmfopwDE5L4gcM5EyvS
	i3DJ2uiFNruuYi0hIJlnqMOHlzPmxjWt37Wp51MGWc4U6fANknrHf9Lr
X-Gm-Gg: AYBFou0EF56zkOYHTM0UcwdAAXF3/kMCGakyOfLWVYeDUAaLRVnCTJgO4HpngGDGt9O
	KnjG7rG8FgOFAkBsFATDFnikhqjM0bDlzvbQsNSdF+qEjsuYlwaJtftALvyVuhHwP/hYOptbVvk
	PU7r5bpEiE4+wVVprvOmoNd204GH0lYjN121JUPxJWkGj09DQS6Z2OFnpXyRPYXt5HkB7nJ10ba
	0OkeSaqd1hDr+kjOvb1D/PoJ25TCHzjiVPmLM9RZ2Ly1247bWuaKeDZ9HTeTjvVPNIWnHSuUbR3
	85wUdgW8mO6AtrVWEf7FjRxbN0BDFX0yBBvzqPjlfSlOJFS5YBNQtFkifPXALoSm8Obnh3UzMio
	hztFIIxy4m5wQmVkxvDqenqE1IZPnE5TZaYNr4L7duVjZBhkvg60DHN1eFAng7g9joKH74L2gPy
	HDQ8sL5mTCDt/bOQAW4ELkZ0sUTJnY6kxOVIq+N/DumE8t1XTWels9jHLlDNvlORgdogRCIxAHY
	ErDqnWTSWYQY1ObhQytIknPDYkZJ7/daX6fl1I+WkLdJWV0y9OoFvh6Tp858odOQHYBpXjOMZ2l
	wSwCL8fBgyqb/nNXPv0/97Uuh9S6+mB9kLfKTgsst9L8osWyi4GiPqdTXJM=
X-Received: by 2002:a17:903:3202:b0:2dd:c100:b2c2 with SMTP id d9443c01a7336-2df7dc49ac5mr93559505ad.45.1790506632334;
        Sun, 27 Sep 2026 03:57:12 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91442ef4sm28521145ad.55.2026.09.27.03.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:57:11 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ntfs: balance the $MFT runlist lock in data extension error paths
Date: Sun, 27 Sep 2026 18:57:05 +0800
Message-ID: <20260927105706.3111333-2-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927105706.3111333-1-matthias.goergens@gmail.com>
References: <20260927105706.3111333-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_mft_data_extend_allocation_nolock() drops the $MFT runlist lock
before allocating clusters, and every path into undo_alloc arrives
without it, except a map_mft_record() failure, which takes it first.
undo_alloc never releases it, so the lock leaks and the next $MFT
extension and $MFT writeback hang.  The restore_undo_alloc failure
path, on the other hand, releases the lock without holding it.  And
undo_alloc frees the clusters with ntfs_cluster_free() and truncates
the runlist without the lock, although both require it.

Enter undo_alloc without the lock on every path.  Under the lock, copy
the new runs and truncate the runlist; after dropping it, free the
clusters from the copy with ntfs_cluster_free_from_rl().  That keeps
lcnbmp_lock outside the runlist lock, as the function documents.  Like
the runlist merge failure above, this does not discard the clusters,
which were never written.  If the copy cannot be allocated, the
clusters stay allocated and the volume is marked for chkdsk.

A shorter fix would keep calling ntfs_cluster_free() on the live
runlist without the lock, relying on $MFT's runlist being fully mapped
and changed only by this function under mrec_lock.  That breaks
ntfs_cluster_free()'s documented locking rule on an argument about the
rest of the driver, so this patch does not do that.

Fixes: 115380f9a2f9 ("ntfs: update mft operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
Without this patch, a forced map_mft_record() failure gives "WARNING:
lock held when returning to user space" for the $MFT runlist lock, and
the next file create and $MFT writeback block on it.  A forced lookup
failure in restore_undo_alloc gives "bad unlock balance".  With it, the
create fails with EIO, lockdep stays quiet and the volume keeps working,
also when the copy allocation is forced to fail.  $MFT growth on a
fragmented volume behaves as before.

 fs/ntfs/mft.c | 54 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index e01e367a588d9..58676042444b6 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -1764,6 +1764,36 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 	return ret;
 }
 
+/*
+ * ntfs_mft_copy_tail - copy the runs of a runlist from a vcn onwards
+ * @rl:		runlist to copy from
+ * @vcn:	first vcn to copy
+ *
+ * Return a terminated copy of the runs of @rl covering @vcn and everything
+ * after it, NULL if there are none, or ERR_PTR(-ENOMEM).  The caller must
+ * hold the runlist lock and free the copy with kfree().
+ */
+static struct runlist_element *ntfs_mft_copy_tail(struct runlist_element *rl, s64 vcn)
+{
+	struct runlist_element *end, *copy;
+	s64 delta;
+
+	rl = ntfs_rl_find_vcn_nolock(rl, vcn);
+	if (!rl || !rl->length)
+		return NULL;
+	for (end = rl; end->length; end++)
+		;
+	copy = kmemdup(rl, (end - rl + 1) * sizeof(*rl), GFP_NOFS);
+	if (!copy)
+		return ERR_PTR(-ENOMEM);
+	delta = vcn - copy->vcn;
+	copy->vcn = vcn;
+	copy->length -= delta;
+	if (copy->lcn >= 0)
+		copy->lcn += delta;
+	return copy;
+}
+
 /*
  * ntfs_mft_data_extend_allocation_nolock - extend mft data attribute
  * @vol:	volume on which to extend the mft data attribute
@@ -1791,7 +1821,7 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	s64 min_nr, nr, ll;
 	unsigned long flags;
 	struct ntfs_inode *mft_ni;
-	struct runlist_element *rl, *rl2;
+	struct runlist_element *rl, *rl2, *tail_rl;
 	struct ntfs_attr_search_ctx *ctx = NULL;
 	struct mft_record *mrec;
 	struct attr_record *a = NULL;
@@ -1904,7 +1934,6 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	if (IS_ERR(mrec)) {
 		ntfs_error(vol->sb, "Failed to map mft record.");
 		ret = PTR_ERR(mrec);
-		down_write(&mft_ni->runlist.lock);
 		goto undo_alloc;
 	}
 	ctx = ntfs_attr_get_search_ctx(mft_ni, mrec);
@@ -2015,7 +2044,6 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 		write_unlock_irqrestore(&mft_ni->size_lock, flags);
 		ntfs_attr_put_search_ctx(ctx);
 		unmap_mft_record(mft_ni);
-		up_write(&mft_ni->runlist.lock);
 		/*
 		 * The only thing that is now wrong is ->allocated_size of the
 		 * base attribute extent which chkdsk should be able to fix.
@@ -2026,15 +2054,25 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	ctx->attr->data.non_resident.highest_vcn =
 			cpu_to_le64(old_last_vcn - 1);
 undo_alloc:
-	if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
-		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
-		NVolSetErrors(vol);
-	}
-
+	/*
+	 * Entered without the runlist lock.  Take the new runs off the
+	 * runlist under it, and free their clusters from a copy once it is
+	 * dropped, as lcnbmp_lock nests outside it (see above).  If the copy
+	 * cannot be allocated, the clusters stay allocated until chkdsk.
+	 */
+	down_write(&mft_ni->runlist.lock);
+	tail_rl = ntfs_mft_copy_tail(mft_ni->runlist.rl, old_last_vcn);
 	if (ntfs_rl_truncate_nolock(vol, &mft_ni->runlist, old_last_vcn)) {
 		ntfs_error(vol->sb, "Failed to truncate mft data attribute runlist.%s", es);
 		NVolSetErrors(vol);
 	}
+	up_write(&mft_ni->runlist.lock);
+	if (IS_ERR(tail_rl) || ntfs_cluster_free_from_rl(vol, tail_rl)) {
+		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
+		NVolSetErrors(vol);
+	}
+	if (!IS_ERR(tail_rl))
+		kfree(tail_rl);
 	if (mp_extended && ntfs_attr_update_mapping_pairs(mft_ni, 0)) {
 		ntfs_error(vol->sb, "Failed to restore mapping pairs.%s",
 			   es);
-- 
2.55.0

