Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72744A5C59
	for <ntfs@lists.linux.dev>; Thu,  1 Oct 2026 15:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867165; cv=none; b=AImhYz2LsunNqRk//t3E4RrCTmIJBoByUFQORrE0s8Lu/GyWqyq1Puv1lldnLsRUpDGmNUgppOo0fpTGdENPp36yrSry8UFWn/tBPEo4i4Pv/zUYwYnDjnD+pTrCmNpHRTMSa3Qm1kqeeYDzB0aCHhTn7e+7fED5+vz6nYMkuj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867165; c=relaxed/simple;
	bh=959PKmDmqbYmphBObUuUZb2yNOoX2/DlcuuCqeq0DMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QMvF0k/GgrJWqhKmuoc4jBGPaz/VWah+dFMLQb3gcKMwvG4XxDK8JgNISS2SCYlZDyiTHyUh60Dcj6nZytUh+QTNqRZxUP22vll8yzBAk2WUwcuwmw1cJPG5cdLP5z+vkXhiZi7wf8rz6QB/OrQGV2c4/VnNnA5twsDH6Wuu9iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abrEQPQ8; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abrEQPQ8"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7c9c2df74so827858a12.0
        for <ntfs@lists.linux.dev>; Thu, 01 Oct 2026 08:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790867163; x=1791471963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNFuIUXNuGIMK04aFKXkSC9USRBbb3SEJPHqr2VtdVw=;
        b=abrEQPQ8WXgMRVUHhpfoRxlUZl08IRdqogzx3wsr8ePAZXI6J0rZCk4qtCPCazM9t4
         Z1ql8iTMCkH2Y/nqtmCM12MQ5Gbkp6VZcuy0TEIfO/4QoLGEDBw6/1KfJPCKUFk5OLjR
         adlpZZAE5vSVE0sw7H4YXVpwA2s+VseupNuLC9YQxK0XINs+ThafgvaJpF20Lfu9EDyd
         zPsONAO0Yl3kN9m0k+SOFLqVQ4WRAc7NLuDbLvFfpVgP1tnpPwPAfC4N8sWlfdJEWmQN
         aMekBl6Gb70FFv5StVAy7jhRZeok5qxhXe4VG0gvIUE3R8Fuk9ILPYEl7UF1SMM3mu1b
         /fZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867163; x=1791471963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNFuIUXNuGIMK04aFKXkSC9USRBbb3SEJPHqr2VtdVw=;
        b=fk5rSAZjS0O6pNlHzudYbkbE5xyVrJUtlDY+Cw72dxPnYQSEczc2RAAlm5dkHJFwQx
         rmCWR5ixaescteJPAsR2x82SDDUvZsO+Z5mEG7iYmvSbSttyYlTQmmF10lc+4KYdIIuN
         mOVPXf36xY8fgGc30B7exU3k45tz4LcxKHbKSOLo+Fa6QrbQtNQS40RzMsltvcOQhBnh
         NvPizd7JdKUTh6rv26X1ceq230HYW7he4e2OzJR2cdPZyFfgRAn1sAsSAoIFgipweL3H
         G+NfMqpXMeVv+yc8NFJ5VQxBUy6Xav39nuyET7Ph1mwVqlUMX9QcLumpn4896ezhuEG6
         11Uw==
X-Forwarded-Encrypted: i=1; AKwUvByhvhgBjv7X/YAwyVYOviOb6JjPRZXDMl6obW9xOkJsVClVJVQeSyBFXriPWdVCUwD0dk7N@lists.linux.dev
X-Gm-Message-State: AFq9FYKdLC80CYEuBCInceJ7aVRhFqO98OuadKzYyP5yQ4XzKB64g0oT
	zcFXfIac/vDn8rKKpQ3oRPbOEFpRBXVK1Mtj8zOh0jyBFz7hm+jbsOGv+YidXbJuQzYn9w==
X-Gm-Gg: AYBFou2opVbNc6v2/1fE09pmKtaRQkF3F3Q+Ym0GO//gpUG7P2Wa78fK4LYGHNQPDpy
	yiuEfubHVFLzcuzvDJTRDsJgMlxhs/zZYZTxGPFCNUPnaaRXP1fNeeg9n8pBXsB7nc3cIUA6omc
	WDb54PElt2IxLAu/UICzykNOBApQmRyrDxB37Z2okVIv+7tzRiLoi3T+kQukT8hg/p3jHBYd+d6
	BDdxaxvTSXke+ob7zBIswoiV/rgNip0Gyn4XMxGvWc1JY3/iuml84C8EOn5PtGZkz5urPB/w/f0
	sBXNLwdCd5WeHCpkpZeH+BzzPaFGLvyhnGwVrYqu5wnFuJXZ1RQTjjc3WwOV0ToDxf+nJvEHM3V
	aHshEjdZWM+4Vg8Tlcu8eVdJuVGZQvwvMaCBtYtBIdRPDbCK7JFT0/pHQ6mA+cFxVrbyN+dTrgO
	/Qrbb45WopNVR1to/47i4Txqp6bS/DA16tGLdQfHXnuh/YeVTM7uOv6031Uzl8tDO4b77Opaa9w
	F6cUgh7lDXRSvxGBYhjME3oLLEusKBK/9Sw6QpL5JWigHFPPNhcduYDAYp43ekeKOuZUIwjwguZ
	y1d9eAm8MIAtyTMPYBYRzCN9hCwtIHYXadNXVkpOj2MpMFBqNRh2pUR6v+8=
X-Received: by 2002:a17:90b:54c4:b0:3a4:b3a4:e7a6 with SMTP id 98e67ed59e1d1-3a4f2d2f534mr1881980a91.11.1790867162529;
        Thu, 01 Oct 2026 08:06:02 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm5248555a91.16.2026.10.01.08.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:06:02 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ntfs: hold the runlist lock while expanding a non-resident attribute
Date: Thu,  1 Oct 2026 23:05:58 +0800
Message-ID: <20261001150558.3970385-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
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
already calls this function with the runlist lock held.  Where the
caller says it holds the lock (locked_ni == ni), assert that it holds it
for writing.

For an $ATTRIBUTE_LIST whose lock the caller does not hold, drop the
lock again before the mapping pairs update: that update can resize the
same list through ntfs_attrlist_update_locked(), which returns -ENOSPC
when told that the list's lock is held.  Holding it there made punching
holes into a large fragmented file fail with -ENOSPC.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
Changes since v1:

 - Add lockdep_assert_held_write(&ni->runlist.lock) for the case where
   the caller says it holds the lock, as Hyunchul asked.  The only
   caller that passes locked_ni == ni is __ntfs_attr_truncate_vfs(),
   which takes the lock for writing just before the call.  Callers
   from ntfs_attrlist_update_locked() never pass the list's own inode
   as locked_ni, because that function returns -ENOSPC first.
 - Rebase onto current ntfs-next (708f9d56caca).  The rollback hunk
   conflicted with the new restore of allocated_size under size_lock;
   that now runs with the runlist lock held.
 - Keep both Reviewed-by tags.  Baolin, Hyunchul: the assertion is the
   only functional addition, so shout if you would rather I dropped
   yours.

A reproducer that extends two files with interleaved clusters while
FIEMAP loops over them hits the KASAN report above within two seconds in
each of three runs without this patch.  With it, six 60-second runs are
clean (three on v1, three on v2).  I can send it privately if you want
it.

Also tested v2 in a VM with KASAN, lockdep and the hung task detector:
writes past EOF, fallocate, truncate-up, sparse and compressed files,
growing xattrs, directories and a non-resident attribute list, with
FIEMAP after each step.  Output is identical to v1, and lockdep reports
nothing.  A build with a printk in front of the new assertion shows it
running on the truncate-up path, and swapping that caller's down_write()
for down_read() makes it fire.

 fs/ntfs/attrib.c | 74 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 21 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 5439c12f9280..565bd468b893 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -4487,6 +4487,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	struct super_block *sb = ni->vol->sb;
 	size_t new_rl_count;
 	unsigned long flags;
+	bool runlist_locked = locked_ni == ni;
 
 	ntfs_debug("Inode 0x%llx, attr 0x%x, new size %lld old size %lld\n",
 			(unsigned long long)ni->mft_no, ni->type,
@@ -4528,10 +4529,19 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	 * clusters if there is a change.
 	 */
 	if (ntfs_bytes_to_cluster(vol, ni->allocated_size) < first_free_vcn) {
+		/*
+		 * The runlist array is replaced below.  Readers such as the
+		 * iomap read path hold only the runlist lock, not mrec_lock.
+		 */
+		if (runlist_locked)
+			lockdep_assert_held_write(&ni->runlist.lock);
+		else
+			down_write(&ni->runlist.lock);
+
 		err = ntfs_attr_map_whole_runlist(ni);
 		if (err) {
 			ntfs_error(sb, "ntfs_attr_map_whole_runlist failed");
-			return err;
+			goto unlock_runlist;
 		}
 
 		/*
@@ -4556,7 +4566,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 						last + more_entries + 1);
 				if (IS_ERR(rl)) {
 					err = -ENOMEM;
-					goto put_err_out;
+					goto unlock_runlist;
 				}
 
 				alloc_size = ni->allocated_size;
@@ -4581,7 +4591,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 				rl = kmalloc(sizeof(struct runlist_element) * 2, GFP_NOFS);
 				if (!rl) {
 					err = -ENOMEM;
-					goto put_err_out;
+					goto unlock_runlist;
 				}
 
 				rl[0].vcn = ntfs_bytes_to_cluster(vol, ni->allocated_size);
@@ -4628,7 +4638,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 				ntfs_debug("Cluster allocation failed (%lld)",
 						(long long)first_free_vcn -
 						ntfs_bytes_to_cluster(vol, ni->allocated_size));
-				return PTR_ERR(rl);
+				err = PTR_ERR(rl);
+				goto unlock_runlist;
 			}
 			/*
 			 * A contiguous ATTRIBUTE_LIST allocation keeps its mapping
@@ -4652,8 +4663,10 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
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
 
@@ -4665,7 +4678,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 				ntfs_error(sb, "Run list merge failed");
 				ntfs_cluster_free_from_rl(vol, rl);
 				kvfree(rl);
-				return -EIO;
+				err = -EIO;
+				goto unlock_runlist;
 			}
 			ni->runlist.rl = rln;
 			ni->runlist.count = new_rl_count;
@@ -4673,11 +4687,28 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 
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
 
@@ -4711,6 +4742,9 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	ntfs_attr_put_search_ctx(ctx);
 	return 0;
 rollback:
+	if (!runlist_locked)
+		down_write(&ni->runlist.lock);
+rollback_locked:
 	/* Free allocated clusters. */
 	err2 = ntfs_cluster_free(ni, ntfs_bytes_to_cluster(vol, org_alloc_size),
 				-1, ctx);
@@ -4722,8 +4756,6 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	 * dropping the lock: ntfs_attr_vcn_to_rl() fails a lookup below the
 	 * allocated size that falls past the end of the runlist.
 	 */
-	if (ni != locked_ni)
-		down_write(&ni->runlist.lock);
 	err2 = ntfs_rl_truncate_nolock(vol, &ni->runlist,
 			ntfs_bytes_to_cluster(vol, org_alloc_size));
 	if (!err2) {
@@ -4731,8 +4763,6 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		ni->allocated_size = org_alloc_size;
 		write_unlock_irqrestore(&ni->size_lock, flags);
 	}
-	if (ni != locked_ni)
-		up_write(&ni->runlist.lock);
 	if (err2) {
 		/*
 		 * Failed to truncate the runlist, so just throw it away, it
@@ -4743,12 +4773,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		ntfs_error(sb, "Couldn't truncate runlist. Rollback failed");
 	} else {
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
@@ -4756,6 +4782,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		} else
 			VFS_I(base_ni)->i_blocks = ni->allocated_size >> 9;
 	}
+	if (!runlist_locked)
+		up_write(&ni->runlist.lock);
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 	return err;
@@ -4763,6 +4791,10 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 	return err;
+unlock_runlist:
+	if (!runlist_locked)
+		up_write(&ni->runlist.lock);
+	return err;
 }
 
 /*

base-commit: 708f9d56cacae21aeee98d16bcdd50a66edc04a0
-- 
2.56.0

