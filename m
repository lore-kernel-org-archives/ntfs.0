Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485944;
	b=J3vqv6dQ3jTUCibT1GkYLRsSd889MeBrAk4RDMrn4fxrLEV8eTg+ygoQ+mQeglat1gC6
	 OWZh/W6/30vSuC9+FBj+6plwsy70TD//KO/b6FgauTy4IEGETkJdjbha1kakTIBiODtzZ
	 Bep9BlH+rUNq7UtTvZTIVo9fy43yXdV7eqKKgNYHBYlS3CHvHUeMGrVi06E1GI2FIAn3q
	 6n+rxbMwKyzn5WA3dhSS75lTbLK7bTSE//edmVAFct4r9/12FObEZ6Em70O5iQCxdLyXm
	 LLMYwoumcEc05YZbvBFRdfrB1aSvnjp50h2cr0GAeRHx7b7z2xOaQsK3crvjY4ok3WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485944;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=R1TKDnz0dRBjHnsdRjR2nfAQ6jHAq2ebQ9Nly2yHRPU=;
	b=kNUXWpgoUwkgME9KH2p3S15BTJjBi2IJOdlvLzN86iOwjSjFJbFIXkKmV/BzatdQycQ2
	 mKMYeXNVv2vnaRDgVsbWNRJoghWrPrDYEaS9eOmrXXodL00J+JdDKI6VAtcMsLuj6ma2J
	 afCCbfdt5uDWVFsx16J560O5rCB2tpQJ5aixfKzNMcRh6m2cPWxTsK0UB1NWUlFVFuusB
	 ptjSzE/w0k73m9WpGmp1Y85jquXqt4ZTVKCOD6alSFRBylgph9cB621vwuoq7vyis3d1K
	 4H3o5Az/qa6MTqve1fUPyJxpfw8kplA14f2qis/oS3rr7dq6qdBlHPZjYS+xurTJGBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pT+lwCgw;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B280606A32A
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B280606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pT+lwCgw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=R1
	TKDnz0dRBjHnsdRjR2nfAQ6jHAq2ebQ9Nly2yHRPU=; b=pT+lwCgwfeAcKUxj8j
	gcyudm1m0LFvuuU0bV5FR0EksKboNdzrA1AGGE5lfRSJvCpal16Aj7dMQ+tzjcht
	0Ccc4Lgt7UM/NKOMZW3ZgneSol+/v3n/E/J6kOI/RgjLal0HMi+wbXmreWQITto4
	r2Zlo+ZVWECC/IsJNbZ9BpPwc=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3n0ksKtdq7UkHBg--.56105S2;
	Tue, 20 Oct 2026 16:45:33 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 08/31] ntfs: report runlist and cluster allocation metadata errors
Date: Tue, 20 Oct 2026 16:43:58 +0800
Message-ID: <20261020084421.2196486-9-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3n0ksKtdq7UkHBg--.56105S2
X-Coremail-Antispam: 1Uf129KBjvAXoW3ZFy8Zr1DWr18ArWfAF1UJrb_yoW8Xw4rXo
	ZI9r1Fkw4vgryYk34Ykw1aqa4Dua1DC398JF4rCr1qkF92qw4DK34xJw13Way3uayFgrn0
	vr1DJws5AF1vyry5n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUc-eoUUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Q4m8GrXKi5Y4wAA3z

From: Baolin Liu <liubaolin@kylinos.cn>

Runlist mapping and cluster cleanup can detect invalid mappings or
failed recovery without reporting them. Report malformed mapping pairs,
missing extents within allocated_size, and failed bitmap or allocation
recovery. Preserve valid sparse holes and EOF.

Use EFSCORRUPTED for corruption and propagate it through mapping callers
and an LCN_EFSCORRUPTED sentinel. Keep allocation and underlying I/O
errors distinct, including when freeing clusters.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/aops.c     |   2 +-
 fs/ntfs/attrib.c   | 121 +++++++++++++++++++++++++++++++++++----------
 fs/ntfs/bitmap.c   |   2 +-
 fs/ntfs/lcnalloc.c |  17 +++++--
 fs/ntfs/runlist.c  |  16 +++---
 fs/ntfs/runlist.h  |   1 +
 6 files changed, 119 insertions(+), 40 deletions(-)

diff --git a/fs/ntfs/aops.c b/fs/ntfs/aops.c
index ad781674fef1..7884737657d5 100644
--- a/fs/ntfs/aops.c
+++ b/fs/ntfs/aops.c
@@ -175,7 +175,7 @@ static sector_t ntfs_bmap(struct address_space *mapping, sector_t block)
 		/*
 		 * Step down to an integer to avoid gcc doing a long long
 		 * comparision in the switch when we know @lcn is between
-		 * LCN_HOLE and LCN_EIO (i.e. -1 to -5).
+		 * LCN_HOLE and LCN_EFSCORRUPTED (i.e. -2 to -8).
 		 *
 		 * Otherwise older gcc (at least on some architectures) will
 		 * try to use __cmpdi2() which is of course not available in
diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 28099ed6ad99..c59643fb766a 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -112,7 +112,7 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
 		     base_ni == NTFS_I(ni->vol->mft_ino))) {
 		ntfs_error(ni->vol->sb,
 			   "$MFT needs its own extent records to describe itself; cannot mount.");
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 	if (!ctx) {
 		ctx_is_temporary = ctx_needs_reset = true;
@@ -131,7 +131,9 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
 		WARN_ON(IS_ERR(ctx->mrec));
 		a = ctx->attr;
 		if (!a->non_resident) {
-			err = -EIO;
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+			err = -EFSCORRUPTED;
 			goto err_out;
 		}
 		end_vcn = le64_to_cpu(a->data.non_resident.highest_vcn);
@@ -183,12 +185,17 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
 		err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 				CASE_SENSITIVE, vcn, NULL, 0, ctx);
 		if (unlikely(err)) {
-			if (err == -ENOENT)
-				err = -EIO;
+			if (err == -ENOENT) {
+				err = -EFSCORRUPTED;
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								-EFSCORRUPTED);
+			}
 			goto err_out;
 		}
 		if (unlikely(!ctx->attr->non_resident)) {
-			err = -EIO;
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+			err = -EFSCORRUPTED;
 			goto err_out;
 		}
 	}
@@ -201,13 +208,25 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
 	 */
 	end_vcn = le64_to_cpu(a->data.non_resident.highest_vcn) + 1;
 	if (unlikely(vcn && vcn >= end_vcn)) {
+		/* Report missing extents inside the allocation to direct callers. */
 		err = -ENOENT;
+		read_lock_irqsave(&ni->size_lock, flags);
+		if (vcn >= 0 && vcn < ntfs_bytes_to_cluster(ni->vol,
+							    ni->allocated_size))
+			err = -EFSCORRUPTED;
+		read_unlock_irqrestore(&ni->size_lock, flags);
+		if (err == -EFSCORRUPTED)
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
 		goto err_out;
 	}
 	rl = ntfs_mapping_pairs_decompress(ni->vol, a, &ni->runlist, &new_rl_count);
-	if (IS_ERR(rl))
+	if (IS_ERR(rl)) {
 		err = PTR_ERR(rl);
-	else {
+		if (err != -ENOMEM)
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+	} else {
 		ni->runlist.rl = rl;
 		ni->runlist.count = new_rl_count;
 	}
@@ -335,7 +354,7 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
 	if (!rl) {
 		err = ntfs_attr_map_whole_runlist(ni);
 		if (err)
-			return ERR_PTR(-ENOENT);
+			return ERR_PTR(err);
 		rl = ni->runlist.rl;
 	}
 
@@ -357,12 +376,11 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
 	/*
 	 * Neither the runlist nor the retry mapped @vcn, e.g. because the
 	 * extent mft record holding it is corrupt or because the mapping
-	 * pairs end too soon.  ntfs_map_runlist_nolock() reports the latter
-	 * as -ENOENT, as @vcn lies past the extent it found.  Below the
-	 * allocated size, callers would treat LCN_RL_NOT_MAPPED or LCN_ENOENT
-	 * as a hole, so fail instead.  At or beyond it nothing is mapped: the
-	 * runlist ends there with LCN_ENOENT, or with LCN_RL_NOT_MAPPED if
-	 * only a later extent has been mapped, so return that end as it is.
+	 * pairs end too soon.  Below the allocated size, callers would treat
+	 * LCN_RL_NOT_MAPPED or LCN_ENOENT as a hole, so fail instead.  At or
+	 * beyond it nothing is mapped: the runlist ends there with LCN_ENOENT,
+	 * or with LCN_RL_NOT_MAPPED if only a later extent has been mapped,
+	 * so return that end as it is.
 	 */
 	if (*lcn <= LCN_RL_NOT_MAPPED) {
 		unsigned long flags;
@@ -371,8 +389,12 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
 		read_lock_irqsave(&ni->size_lock, flags);
 		allocated_size = ni->allocated_size;
 		read_unlock_irqrestore(&ni->size_lock, flags);
-		if ((s64)ntfs_cluster_to_bytes(ni->vol, vcn) < allocated_size)
-			return ERR_PTR(err == -ENOMEM ? -ENOMEM : -EIO);
+		if ((s64)ntfs_cluster_to_bytes(ni->vol, vcn) < allocated_size) {
+			if (!err || err == -ENOENT)
+				ntfs_report_file_metadata_error(VFS_I(ni),
+								-EFSCORRUPTED);
+			return ERR_PTR(!err || err == -ENOENT ? -EFSCORRUPTED : err);
+		}
 	}
 
 	return rl;
@@ -401,7 +423,8 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
  *  LCN_HOLE	Hole / not allocated on disk.
  *  LCN_ENOENT	There is no such vcn in the runlist, i.e. @vcn is out of bounds.
  *  LCN_ENOMEM	Not enough memory to map runlist.
- *  LCN_EIO	Critical error (runlist/file is corrupt, i/o error, etc).
+ *  LCN_EIO	I/O or other mapping failure.
+ *  LCN_EFSCORRUPTED	Corrupt runlist or file metadata.
  *
  * Locking: - The runlist must be locked on entry and is left locked on return.
  *	    - If @write_locked is 'false', i.e. the runlist is locked for reading,
@@ -434,8 +457,11 @@ s64 ntfs_attr_vcn_to_lcn_nolock(struct ntfs_inode *ni, const s64 vcn,
 		return lcn;
 	}
 	if (lcn != LCN_RL_NOT_MAPPED) {
-		if (lcn != LCN_ENOENT)
-			lcn = LCN_EIO;
+		if (lcn != LCN_ENOENT) {
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
+			lcn = LCN_EFSCORRUPTED;
+		}
 	} else if (!is_retry) {
 		int err;
 
@@ -462,8 +488,23 @@ s64 ntfs_attr_vcn_to_lcn_nolock(struct ntfs_inode *ni, const s64 vcn,
 			lcn = LCN_ENOENT;
 		else if (err == -ENOMEM)
 			lcn = LCN_ENOMEM;
+		else if (err == -EFSCORRUPTED)
+			lcn = LCN_EFSCORRUPTED;
 		else
 			lcn = LCN_EIO;
+	} else {
+		lcn = LCN_EFSCORRUPTED;
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
+	}
+	if (lcn == LCN_ENOENT) {
+		read_lock_irqsave(&ni->size_lock, flags);
+		if (vcn >= 0 && vcn < ntfs_bytes_to_cluster(ni->vol,
+							    ni->allocated_size))
+			lcn = LCN_EFSCORRUPTED;
+		read_unlock_irqrestore(&ni->size_lock, flags);
+		if (lcn == LCN_EFSCORRUPTED)
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
 	}
 	if (lcn != LCN_ENOENT)
 		ntfs_error(ni->vol->sb, "Failed with error code %lli.",
@@ -585,8 +626,11 @@ struct runlist_element *ntfs_attr_find_vcn_nolock(struct ntfs_inode *ni, const s
 			err = PTR_ERR(rl);
 		else if (rl->lcn >= LCN_HOLE)
 			return rl;
-		else if (rl->lcn <= LCN_ENOENT)
-			err = -EIO;
+		else if (rl->lcn <= LCN_ENOENT) {
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
+			err = -EFSCORRUPTED;
+		}
 	}
 	if (!err && !is_retry) {
 		/*
@@ -608,8 +652,20 @@ struct runlist_element *ntfs_attr_find_vcn_nolock(struct ntfs_inode *ni, const s
 		}
 		if (err == -EINVAL)
 			err = -EIO;
-	} else if (!err)
-		err = -EIO;
+	} else if (!err) {
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
+		err = -EFSCORRUPTED;
+	}
+	if (err == -ENOENT) {
+		read_lock_irqsave(&ni->size_lock, flags);
+		if (vcn >= 0 && vcn < ntfs_bytes_to_cluster(ni->vol,
+							    ni->allocated_size))
+			err = -EFSCORRUPTED;
+		read_unlock_irqrestore(&ni->size_lock, flags);
+		if (err == -EFSCORRUPTED)
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
+	}
 	if (err != -ENOENT)
 		ntfs_error(ni->vol->sb, "Failed with error code %i.", err);
 	return ERR_PTR(err);
@@ -3365,6 +3421,9 @@ int ntfs_attr_map_whole_runlist(struct ntfs_inode *ni)
 							   &new_rl_count);
 			if (IS_ERR(rl)) {
 				err = PTR_ERR(rl);
+				if (err != -ENOMEM)
+					ntfs_report_file_metadata_error(VFS_I(base_ni),
+									-EFSCORRUPTED);
 				goto err_out;
 			}
 			ni->runlist.rl = rl;
@@ -3374,7 +3433,9 @@ int ntfs_attr_map_whole_runlist(struct ntfs_inode *ni)
 		/* Are we in the first extent? */
 		if (!next_vcn) {
 			if (a->data.non_resident.lowest_vcn) {
-				err = -EIO;
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								-EFSCORRUPTED);
+				err = -EFSCORRUPTED;
 				ntfs_error(sb,
 					"First extent of inode %llu attribute has non-zero lowest_vcn",
 					(unsigned long long)ni->mft_no);
@@ -3397,18 +3458,26 @@ int ntfs_attr_map_whole_runlist(struct ntfs_inode *ni)
 
 		/* Avoid endless loops due to corruption. */
 		if (next_vcn < le64_to_cpu(a->data.non_resident.lowest_vcn)) {
-			err = -EIO;
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+			err = -EFSCORRUPTED;
 			ntfs_error(sb, "Inode %llu has corrupt attribute list",
 					(unsigned long long)ni->mft_no);
 			goto err_out;
 		}
 	}
 	if (!a) {
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+		}
 		ntfs_error(sb, "Couldn't find attribute for runlist mapping");
 		goto err_out;
 	}
 	if (not_mapped && highest_vcn && highest_vcn != last_vcn - 1) {
-		err = -EIO;
+		ntfs_report_file_metadata_error(VFS_I(base_ni), -EFSCORRUPTED);
+		err = -EFSCORRUPTED;
 		ntfs_error(sb,
 			"Failed to load full runlist: inode: %llu highest_vcn: 0x%llx last_vcn: 0x%llx",
 			(unsigned long long)ni->mft_no,
diff --git a/fs/ntfs/bitmap.c b/fs/ntfs/bitmap.c
index af86fb1c199b..fabf03cf6cef 100644
--- a/fs/ntfs/bitmap.c
+++ b/fs/ntfs/bitmap.c
@@ -340,7 +340,7 @@ int __ntfs_bitmap_set_bits_in_run(struct inode *vi, const s64 start_bit,
 		ntfs_error(vi->i_sb,
 			"Failed to map subsequent page (error %i) and rollback failed (error %i). Aborting and leaving inconsistent metadata. Unmount and run chkdsk.",
 			err, pos);
-		NVolSetErrors(NTFS_SB(vi->i_sb));
+		ntfs_report_file_metadata_error(vi, pos);
 	}
 	return err;
 }
diff --git a/fs/ntfs/lcnalloc.c b/fs/ntfs/lcnalloc.c
index 3ebcac4c2864..d368207d1773 100644
--- a/fs/ntfs/lcnalloc.c
+++ b/fs/ntfs/lcnalloc.c
@@ -792,7 +792,7 @@ switch_to_data1_zone:		search_zone = 2;
 			ntfs_error(vol->sb,
 				"Failed to rollback (error %i). Leaving inconsistent metadata! Unmount and run chkdsk.",
 				err2);
-			NVolSetErrors(vol);
+			ntfs_report_metadata_error(vol, err2);
 		}
 		/* Free the runlist. */
 		kvfree(rl);
@@ -921,9 +921,11 @@ s64 __ntfs_cluster_free(struct ntfs_inode *ni, const s64 start_vcn, s64 count,
 		goto err_out;
 	}
 	if (unlikely(rl->lcn < LCN_HOLE)) {
+		ntfs_report_file_metadata_error(VFS_I(ntfs_inode_base(ni)),
+						-EFSCORRUPTED);
 		if (!is_rollback)
 			ntfs_error(vol->sb, "First runlist element has invalid lcn, aborting.");
-		err = -EIO;
+		err = -EFSCORRUPTED;
 		goto err_out;
 	}
 	/* Find the starting cluster inside the run that needs freeing. */
@@ -968,17 +970,24 @@ s64 __ntfs_cluster_free(struct ntfs_inode *ni, const s64 start_vcn, s64 count,
 			rl = ntfs_attr_find_vcn_nolock(ni, vcn, ctx);
 			if (IS_ERR(rl)) {
 				err = PTR_ERR(rl);
+				if (err == -ENOENT) {
+					err = -EFSCORRUPTED;
+					ntfs_report_file_metadata_error(VFS_I(ni),
+									-EFSCORRUPTED);
+				}
 				if (!is_rollback)
 					ntfs_error(vol->sb,
 						"Failed to map runlist fragment or failed to find subsequent runlist element.");
 				goto err_out;
 			}
 			if (unlikely(rl->lcn < LCN_HOLE)) {
+				ntfs_report_file_metadata_error(VFS_I(ntfs_inode_base(ni)),
+								-EFSCORRUPTED);
 				if (!is_rollback)
 					ntfs_error(vol->sb,
 						"Runlist element has invalid lcn (0x%llx).",
 						rl->lcn);
-				err = -EIO;
+				err = -EFSCORRUPTED;
 				goto err_out;
 			}
 		}
@@ -1073,7 +1082,7 @@ s64 __ntfs_cluster_free(struct ntfs_inode *ni, const s64 start_vcn, s64 count,
 		ntfs_error(vol->sb,
 			"Failed to rollback (error %i).  Leaving inconsistent metadata!  Unmount and run chkdsk.",
 			(int)delta);
-		NVolSetErrors(vol);
+		ntfs_report_metadata_error(vol, delta);
 	} else {
 		ntfs_dec_free_clusters(vol, delta);
 	}
diff --git a/fs/ntfs/runlist.c b/fs/ntfs/runlist.c
index 76ba6ab72b8a..606a30ab9fa7 100644
--- a/fs/ntfs/runlist.c
+++ b/fs/ntfs/runlist.c
@@ -817,7 +817,7 @@ struct runlist_element *ntfs_mapping_pairs_decompress(const struct ntfs_volume *
 	/* Validate lowest_vcn from on-disk metadata to ensure it is sane. */
 	if (overflows_type(lowest_vcn, vcn)) {
 		ntfs_error(vol->sb, "Invalid lowest_vcn in mapping pairs.");
-		return ERR_PTR(-EIO);
+		return ERR_PTR(-EFSCORRUPTED);
 	}
 	/* Start at vcn = lowest_vcn and lcn 0. */
 	vcn = lowest_vcn;
@@ -828,7 +828,7 @@ struct runlist_element *ntfs_mapping_pairs_decompress(const struct ntfs_volume *
 	attr_end = (u8 *)attr + le32_to_cpu(attr->length);
 	if (unlikely(buf < (u8 *)attr || buf >= attr_end)) {
 		ntfs_error(vol->sb, "Corrupt attribute.");
-		return ERR_PTR(-EIO);
+		return ERR_PTR(-EFSCORRUPTED);
 	}
 
 	/*
@@ -843,7 +843,7 @@ struct runlist_element *ntfs_mapping_pairs_decompress(const struct ntfs_volume *
 	     le64_to_cpu(attr->data.non_resident.data_size) ||
 	     le64_to_cpu(attr->data.non_resident.initialized_size))) {
 		ntfs_error(vol->sb, "Invalid empty mapping pairs array.");
-		return ERR_PTR(-EIO);
+		return ERR_PTR(-EFSCORRUPTED);
 	}
 	if (!vcn && !*buf && old_runlist && old_runlist->rl) {
 		*new_rl_count = old_runlist->count;
@@ -1079,12 +1079,12 @@ struct runlist_element *ntfs_mapping_pairs_decompress(const struct ntfs_volume *
 		return new_rl;
 	kvfree(rl);
 	ntfs_error(vol->sb, "Failed to merge runlists.");
-	return new_rl;
+	return PTR_ERR(new_rl) == -ENOMEM ? new_rl : ERR_PTR(-EFSCORRUPTED);
 io_error:
 	ntfs_error(vol->sb, "Corrupt attribute.");
 err_out:
 	kvfree(rl);
-	return ERR_PTR(-EIO);
+	return ERR_PTR(-EFSCORRUPTED);
 }
 
 /*
@@ -1337,7 +1337,7 @@ int ntfs_get_size_for_mapping_pairs(const struct ntfs_volume *vol,
 	if (rl->lcn == LCN_RL_NOT_MAPPED)
 		rls = -EINVAL;
 	else
-		rls = -EIO;
+		rls = -EFSCORRUPTED;
 	return rls;
 }
 
@@ -1426,7 +1426,7 @@ static inline int ntfs_write_significant_bytes(s8 *dst, const s8 *dst_max,
  * defined:
  *	-EINVAL	- Run list contains unmapped elements.  Make sure to only pass
  *		  fully mapped runlists to this function.
- *	-EIO	- The runlist is corrupt.
+ *	-EFSCORRUPTED - The runlist is corrupt.
  *	-ENOSPC	- The destination buffer is too small.
  *
  * Locking: @rl must be locked on entry (either for reading or writing), it
@@ -1585,7 +1585,7 @@ int ntfs_mapping_pairs_build(const struct ntfs_volume *vol, s8 *dst,
 	if (rl->lcn == LCN_RL_NOT_MAPPED)
 		err = -EINVAL;
 	else
-		err = -EIO;
+		err = -EFSCORRUPTED;
 	return err;
 }
 
diff --git a/fs/ntfs/runlist.h b/fs/ntfs/runlist.h
index 0d4c32b1a338..85073f9fb6ec 100644
--- a/fs/ntfs/runlist.h
+++ b/fs/ntfs/runlist.h
@@ -63,6 +63,7 @@ enum {
 	LCN_ENOMEM		= -5,
 	LCN_EIO			= -6,
 	LCN_EINVAL		= -7,
+	LCN_EFSCORRUPTED	= -8,
 };
 
 struct runlist_element *ntfs_runlists_merge(struct runlist *d_runlist,
-- 
2.51.0

