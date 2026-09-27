Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDFD22A4E1
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 06:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790490717; cv=none; b=cEKdGIqFIOR2sGn/1fbvEjskJ1oWyJrye9w07auxoPvD354k/ciR2l1UxsC1ciumD284tKKDFrvyecqL4zi3KNlSq40330ZDaZOpQZXifG3FO3+astTAr/n1aQz1vHUB7700ERBZq69Lwsai47Cyz53uzmB9k1wTecYShdujJW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790490717; c=relaxed/simple;
	bh=vtNPIYhScpsR4YZxlcRVKHjWbp5bx3kM23+yYBCdUTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ACttPivm+sxV+SwCqWyGnAmY/nsIIhyTUNjPMxU+2UARcqabQXvlC+9/Dz4DMYXItm4KDltHm1WF9TLbjli0ZibbIexiKgWIx1Do/kXYfQUEAHa29SjdJ99TziJxhmWxMlmbCJ5oGvpa9W+af3r08+jJNitv/OBtdihbYfrQDvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3t1bw1A; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3t1bw1A"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8804b59404aso846454b3a.3
        for <ntfs@lists.linux.dev>; Sat, 26 Sep 2026 23:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790490715; x=1791095515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LvdoT+4B+s9J9ndPoCUfTNkadsVmUKhDZhjNaBl2CAA=;
        b=D3t1bw1AUgttPcAj+n74rRZYxQSzgxKChLiXPN1t/Oxm4WjjovC3H3Z4gk9Zq+tDR6
         Cj8B16AZyI85UISlTdq2OMiESzU2rQNgUNLjW/4V65EiPSCHDHv7H0QH12ikgqRAk4a9
         lNFg2CeONrLj5YzLNYx0x3nwwl2DmN5OO14II04jnhOsZN6+y6G3mDTux0Ze607hs7CT
         eCRQqTrTP88cQS8fR7rPS0hLUH+uh90wq3qzU5Fos8WZH6PumN7UGkAExJ4ZSZ45g5yI
         vOBPfwaAkzqWWhaEXYLsiOduBoEbJ40W60OciJKgRdoqfGbVRzDWjFgwe/bsr+quCs9N
         q+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790490715; x=1791095515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LvdoT+4B+s9J9ndPoCUfTNkadsVmUKhDZhjNaBl2CAA=;
        b=EUC/VvNbXgL9KQMrfq7d7kgqxIpyGBOrLA0Yh5UII0r0gGeYo/pmEQeeFvPzwTZCbR
         F8R65Oy+AdqJRHmZpYkcbMKlfJHwahht+1vMrzt7ZXCKogNsSGF9x9Z9NAxCnXUr76kK
         vIfuFcckS7gslNJKyHEL3AudkFCM6nkJiRW3njBUjwHG3bhz0ZL1CcmiqkqyTzQwAlFv
         78gG6RiGCTUaqxHl2pHOjfTqDVQRxOosWGqQY+v5THf2QbCWqzaJOEc6cCKFOyzAJdv4
         mJ62SJSqSDtOmfg2Brs4k441YRv+DK4Fj71T6TzrncNr3urb2iLwe9m9n6WxDRkyyX+m
         7UIA==
X-Gm-Message-State: AFuF++l0nDWKYyKSdnI9kw4CdMUUU5tyP4FplayL3W8CYOpK/LIDPvjm
	VpaYFVPYLNPCPq8brasu1V4DE6PmwTHQbVo4JthC2T7kxjsWXbAsCQyx
X-Gm-Gg: AYBFou0YflPhLjbT/ozCTkr28mHFkOx+F25o2Xll3OYr4lX+nFiiOr1mjglJMLVA6hM
	L5FEmpNWp9NbKySO+7fu/kohBeLngkilMWBxj8m5bB+08XQF1NQxBBFyA+uUj9GKcDVBqs2Isxk
	YdQQkWi9U4t/3OxvjxYJf8m0EpvfKp2MqQhwHRYjEcC8FPmtEFVQlKhfh9hjJ0sjfEnFOlnEonY
	eF7NOu7eLwO62NN148xN49SfvED/0LZ272aFTQYSt+cn9Fa+3qnXL8wlKWb0EdnAkrVNiBZSPfC
	GxdYs90Ft0Eddne2OHE8XtS1ztaPxJk27eRXeP02DCTXlCOsu0UAYuWxIct9/O3/U4/FiDjHhh6
	c5sxAks/kxtJLaoj2xnkkkumvC46rdMzMUE/Bh9qWB0yzVVPdM8q/euVOOMtVtGTWejILsEMcUP
	w4RE23c0UN+yQx5CEHSfaCB71cQEvB8A+1HDyoRyFUNbw4DoyCQGy/hAqwb3B/FeoIvzkIYvNsg
	cxQ9qCxih3ySy+/8X/0ISi8GA2q59XMe4PUofEV1LiJyPoWExHJZQiwAW1dcxR6McQTC1hLYKQb
	quJmnHdMoLOLY7WnHf2Uu5KZRdgsYr0NXrNyisfQOGjIg8b3AC1VfMbexsA=
X-Received: by 2002:a05:6a00:7585:b0:87f:dcc3:62f with SMTP id d2e1a72fcca58-87fdcc35542mr4470794b3a.60.1790490714783;
        Sat, 26 Sep 2026 23:31:54 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feaf85551sm2732199b3a.40.2026.09.26.23.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 23:31:54 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs: hold the runlist lock while expanding a non-resident attribute
Date: Sun, 27 Sep 2026 14:31:49 +0800
Message-ID: <20260927063149.3356920-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_non_resident_attr_expand() changes ni->runlist.rl while it
allocates clusters: ntfs_attr_map_whole_runlist(), the compressed
branch's ntfs_rl_realloc() and ntfs_runlists_merge() can each kvfree()
the old array.  Unless the caller already holds ni->runlist.lock, none
of this happens under it; only the rollback takes it.  Callers without
it include the write path, fallocate, ntfs_inode_attr_pwrite() and
ntfs_resident_attr_resize().

Those callers hold mrec_lock, and the write path also inode_lock, but
the iomap read side takes neither: FIEMAP, page faults, readahead and
splice read reach ntfs_read_iomap_begin_non_resident(), which takes only
ni->runlist.lock.  A FIEMAP running while write(2) extends the same file
can walk the array that ntfs_runlists_merge() has just freed:

  BUG: KASAN: slab-use-after-free in ntfs_attr_vcn_to_rl+0x19b/0x200

A reader that finds a vcn unmapped in the stale array also maps it from
disk into the runlist the writer is changing, which shows up as "Run
lists overlap. Cannot merge!".

Take ni->runlist.lock for writing around the part of the expansion that
changes the runlist and allocated_size, up to and including the mapping
pairs update, as ntfs_non_resident_attr_shrink() does since commit
91709ba5d6d7 ("ntfs: protect runlist updates with the runlist lock"),
and hold it throughout the rollback, where ntfs_cluster_free() requires
it.  The lock nests inside mrec_lock, as on the truncate-up path, which
already calls this function with the runlist lock held.

For an $ATTRIBUTE_LIST whose lock the caller does not hold, drop the
lock again before the mapping pairs update: that update can resize the
same list through ntfs_attrlist_update_locked(), which returns -ENOSPC
when told that the list's lock is held.  Holding it there made punching
holes into a large fragmented file fail with -ENOSPC.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
A reproducer that extends two files with interleaved clusters while
FIEMAP loops over them hits the KASAN report above within two seconds in
each of three runs; with this patch, three 60-second runs are clean.  I
can send it privately if you want it.

Also tested in a VM with KASAN, lockdep and the hung task detector:
writes past EOF, fallocate, truncate-up, sparse and compressed files,
growing xattrs, directories and a non-resident attribute list, with
FIEMAP after each step.  Output matches the unpatched kernel, and
lockdep reports nothing.

 fs/ntfs/attrib.c | 72 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 51 insertions(+), 21 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 333b3371acb47..a07acef3a03e8 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -4453,6 +4453,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	struct ntfs_inode *base_ni;
 	struct super_block *sb = ni->vol->sb;
 	size_t new_rl_count;
+	bool runlist_locked = locked_ni == ni;
 
 	ntfs_debug("Inode 0x%llx, attr 0x%x, new size %lld old size %lld\n",
 			(unsigned long long)ni->mft_no, ni->type,
@@ -4494,10 +4495,17 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	 * clusters if there is a change.
 	 */
 	if (ntfs_bytes_to_cluster(vol, ni->allocated_size) < first_free_vcn) {
+		/*
+		 * The runlist array is replaced below.  Readers such as the
+		 * iomap read path hold only the runlist lock, not mrec_lock.
+		 */
+		if (!runlist_locked)
+			down_write(&ni->runlist.lock);
+
 		err = ntfs_attr_map_whole_runlist(ni);
 		if (err) {
 			ntfs_error(sb, "ntfs_attr_map_whole_runlist failed");
-			return err;
+			goto unlock_runlist;
 		}
 
 		/*
@@ -4522,7 +4530,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 						last + more_entries + 1);
 				if (IS_ERR(rl)) {
 					err = -ENOMEM;
-					goto put_err_out;
+					goto unlock_runlist;
 				}
 
 				alloc_size = ni->allocated_size;
@@ -4547,7 +4555,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 				rl = kmalloc(sizeof(struct runlist_element) * 2, GFP_NOFS);
 				if (!rl) {
 					err = -ENOMEM;
-					goto put_err_out;
+					goto unlock_runlist;
 				}
 
 				rl[0].vcn = ntfs_bytes_to_cluster(vol, ni->allocated_size);
@@ -4594,7 +4602,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 				ntfs_debug("Cluster allocation failed (%lld)",
 						(long long)first_free_vcn -
 						ntfs_bytes_to_cluster(vol, ni->allocated_size));
-				return PTR_ERR(rl);
+				err = PTR_ERR(rl);
+				goto unlock_runlist;
 			}
 			/*
 			 * A contiguous ATTRIBUTE_LIST allocation keeps its mapping
@@ -4618,8 +4627,10 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 								ni->allocated_size),
 						lcn_seek_from, DATA_ZONE, false,
 						false, false);
-				if (IS_ERR(rl))
-					return PTR_ERR(rl);
+				if (IS_ERR(rl)) {
+					err = PTR_ERR(rl);
+					goto unlock_runlist;
+				}
 			}
 		}
 
@@ -4631,7 +4642,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 				ntfs_error(sb, "Run list merge failed");
 				ntfs_cluster_free_from_rl(vol, rl);
 				kvfree(rl);
-				return -EIO;
+				err = -EIO;
+				goto unlock_runlist;
 			}
 			ni->runlist.rl = rln;
 			ni->runlist.count = new_rl_count;
@@ -4639,11 +4651,28 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 
 		/* Prepare to mapping pairs update. */
 		ni->allocated_size = ntfs_cluster_to_bytes(vol, first_free_vcn);
-		err = ntfs_attr_update_mapping_pairs_locked(
-				ni, 0, locked_ni);
-		if (err) {
-			ntfs_debug("Mapping pairs update failed");
-			goto rollback;
+		if (ni->type == AT_ATTRIBUTE_LIST && !runlist_locked) {
+			/*
+			 * Making room for the list's mapping pairs can resize
+			 * this attribute list again through
+			 * ntfs_attrlist_update_locked(), which takes its
+			 * runlist lock.
+			 */
+			up_write(&ni->runlist.lock);
+			err = ntfs_attr_update_mapping_pairs_locked(ni, 0,
+								    locked_ni);
+			if (err) {
+				ntfs_debug("Mapping pairs update failed");
+				goto rollback;
+			}
+		} else {
+			err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
+			if (err) {
+				ntfs_debug("Mapping pairs update failed");
+				goto rollback_locked;
+			}
+			if (!runlist_locked)
+				up_write(&ni->runlist.lock);
 		}
 	}
 
@@ -4677,6 +4706,9 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	ntfs_attr_put_search_ctx(ctx);
 	return 0;
 rollback:
+	if (!runlist_locked)
+		down_write(&ni->runlist.lock);
+rollback_locked:
 	/* Free allocated clusters. */
 	err2 = ntfs_cluster_free(ni, ntfs_bytes_to_cluster(vol, org_alloc_size),
 				-1, ctx);
@@ -4684,12 +4716,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		ntfs_debug("Leaking clusters");
 
 	/* Now, truncate the runlist itself. */
-	if (ni != locked_ni)
-		down_write(&ni->runlist.lock);
 	err2 = ntfs_rl_truncate_nolock(vol, &ni->runlist,
 			ntfs_bytes_to_cluster(vol, org_alloc_size));
-	if (ni != locked_ni)
-		up_write(&ni->runlist.lock);
 	if (err2) {
 		/*
 		 * Failed to truncate the runlist, so just throw it away, it
@@ -4702,12 +4730,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		/* Prepare to mapping pairs update. */
 		ni->allocated_size = org_alloc_size;
 		/* Restore mapping pairs. */
-		if (ni != locked_ni)
-			down_read(&ni->runlist.lock);
-		if (__ntfs_attr_update_mapping_pairs(ni, 0, locked_ni, true))
+		if (__ntfs_attr_update_mapping_pairs(ni, 0, ni, true))
 			ntfs_error(sb, "Failed to restore old mapping pairs");
-		if (ni != locked_ni)
-			up_read(&ni->runlist.lock);
 
 		if (NInoSparse(ni) || NInoCompressed(ni)) {
 			ni->itype.compressed.size =  org_compressed_size;
@@ -4715,6 +4739,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		} else
 			VFS_I(base_ni)->i_blocks = ni->allocated_size >> 9;
 	}
+	if (!runlist_locked)
+		up_write(&ni->runlist.lock);
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 	return err;
@@ -4722,6 +4748,10 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 	return err;
+unlock_runlist:
+	if (!runlist_locked)
+		up_write(&ni->runlist.lock);
+	return err;
 }
 
 /*

base-commit: 259abb551e2944998cad4214c201954ab1ac5c8d
-- 
2.55.0

