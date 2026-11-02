Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605017;
	b=jS5fCWhuJAbgD74Iy6WK3+b/on4mUPlXPldoUgpMhWjFyEER+xUSyG7k0PafdMoQHtRM
	 K5WMVYgaHU0/KehgAw9hM5XgHjkneWCjUG24lJOMPK5e4nVGiGmolfksB8CRzb937iKQ+
	 eoTLFkxxRCQSxryEYSYhJ57V28qSDCjj4ZD1iBhu4qlVHyCVzMJL/YIMRmQU/xMeUyn+x
	 fBz80g360hdq61vsxSR0GIM1FFhCInEPuRd1F5L75kpmQNTxoxx1uwIh+UwVXc7b1LlTz
	 ti2mus1UlJ95eQVAqn2EhO5Vum6FSplAVPSTmQeuLxue4RMu9paycYiELJgj5l7AlkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605017;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=12PC29x0Bm2vD4kp21o5azBZNl4yc4wZcEihRswdyaU=;
	b=16YlzwmBGn0iu83lce6wr6/d+FxN9umzgzpTTZA3sRDSm/0nIXZ0Wy/WwxanwU+rkGFN
	 lisWPSB55UlzHkQ5PffNaSCTN603XgNtg+DCjIQ3nTCi/lzHGOJljA0iU/4lvR2kIYFq/
	 +dJS+Kh6P8vQr37GTS2CrZaCC+dD4S9/lJytY63IsJEv5q2IgtXBDg7GxhJ2oNcU9ZIMc
	 LISQfDMieEbRHPE5YBpYzjFcDbarSw7BI6W36sO6zZQ9+RtlHlIlPx0dyW5ixDsN6OVNO
	 A7aHuY/4eiiRZ2Iws6tKwU5/6znFea7VFX5Qqi9ZZkZhBIv42WacXt+XdpbL282YLpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aCrKIR6g;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601B3606A32C
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 601B3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aCrKIR6g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=12
	PC29x0Bm2vD4kp21o5azBZNl4yc4wZcEihRswdyaU=; b=aCrKIR6gggrG32q9LJ
	avDXjh0RcuWPY6T/1XRRAtidqDLZ261WiOlbsd4AlFqteRfLRGoG8a0zhKq829uH
	K9tcs+8soYWAFX77RaauUmGoL4lLRRviGjN43id9rV51X/pJTuNXU1DtNRcpO2hT
	Y/OSuZPvlhtNqOac07Okm4ack=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3vy+HPehqF0lcEw--.2040S2;
	Mon, 02 Nov 2026 15:36:40 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v5 08/31] ntfs: report runlist and cluster allocation metadata errors
Date: Mon,  2 Nov 2026 15:35:09 +0800
Message-Id: <20261102073532.98873-9-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102073532.98873-1-wangxuewen_ky@163.com>
References: <20261102073532.98873-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3vy+HPehqF0lcEw--.2040S2
X-Coremail-Antispam: 1Uf129KBjvAXoW3ZFy8Zr1DXw47Ww48Jr1kXwb_yoW8AryDAo
	ZxursYvw1vgryYy3yYkw1fJa4Dua1DC398JF4rAr1qvas2qw1DK34xJw13Way3uayFgFn0
	vr18JanYyF10yF98n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU0UUUUUUUU
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC8AhGL2roPYjeUAAA3o

From: Baolin Liu <liubaolin@kylinos.cn>

Runlist mapping and cluster cleanup can detect invalid mappings or
failed recovery without reporting them. Report malformed mapping pairs,
missing extents within allocated_size, and failed bitmap or allocation
recovery. Preserve valid sparse holes and EOF.

Use EFSCORRUPTED for corruption and propagate it through mapping callers
and an LCN_EFSCORRUPTED sentinel. Keep allocation and underlying I/O
errors distinct, including when freeing clusters. Do not interpret a
failed extent lookup as proof that the remaining extents are missing.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
Validation:
- Twelve scenarios verify preservation of ENOMEM, EIO, EUCLEAN, EINTR
  and ERESTARTSYS from extent lookups. Only ENOENT permits the
  missing-extent check; valid exhaustion succeeds.
- All pass in an extracted-source userspace harness with controlled
  dependencies under ASan/UBSan.

 fs/ntfs/aops.c     |   2 +-
 fs/ntfs/attrib.c   | 123 +++++++++++++++++++++++++++++++++++----------
 fs/ntfs/bitmap.c   |   2 +-
 fs/ntfs/lcnalloc.c |  17 +++++--
 fs/ntfs/runlist.c  |  16 +++---
 fs/ntfs/runlist.h  |   1 +
 6 files changed, 121 insertions(+), 40 deletions(-)

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
index 42608c9f8069..5af8ac41af17 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -85,6 +85,7 @@ __le16 AT_UNNAMED[] = { cpu_to_le16('\0') };
  */
 int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_search_ctx *ctx)
 {
+	int report_err = 0;
 	s64 end_vcn;
 	unsigned long flags;
 	struct ntfs_inode *base_ni;
@@ -112,7 +113,7 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
 		     base_ni == NTFS_I(ni->vol->mft_ino))) {
 		ntfs_error(ni->vol->sb,
 			   "$MFT needs its own extent records to describe itself; cannot mount.");
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 	if (!ctx) {
 		ctx_is_temporary = ctx_needs_reset = true;
@@ -131,7 +132,8 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
 		WARN_ON(IS_ERR(ctx->mrec));
 		a = ctx->attr;
 		if (!a->non_resident) {
-			err = -EIO;
+			report_err = -EFSCORRUPTED;
+			err = -EFSCORRUPTED;
 			goto err_out;
 		}
 		end_vcn = le64_to_cpu(a->data.non_resident.highest_vcn);
@@ -183,12 +185,15 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
 		err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 				CASE_SENSITIVE, vcn, NULL, 0, ctx);
 		if (unlikely(err)) {
-			if (err == -ENOENT)
-				err = -EIO;
+			if (err == -ENOENT) {
+				err = -EFSCORRUPTED;
+				report_err = -EFSCORRUPTED;
+			}
 			goto err_out;
 		}
 		if (unlikely(!ctx->attr->non_resident)) {
-			err = -EIO;
+			report_err = -EFSCORRUPTED;
+			err = -EFSCORRUPTED;
 			goto err_out;
 		}
 	}
@@ -201,13 +206,23 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
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
+			report_err = -EFSCORRUPTED;
 		goto err_out;
 	}
 	rl = ntfs_mapping_pairs_decompress(ni->vol, a, &ni->runlist, &new_rl_count);
-	if (IS_ERR(rl))
+	if (IS_ERR(rl)) {
 		err = PTR_ERR(rl);
-	else {
+		if (err != -ENOMEM)
+			report_err = -EFSCORRUPTED;
+	} else {
 		ni->runlist.rl = rl;
 		ni->runlist.count = new_rl_count;
 	}
@@ -295,6 +310,8 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
 		if (put_this_folio)
 			folio_put(put_this_folio);
 	}
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(base_ni), report_err);
 	return err;
 }
 
@@ -335,7 +352,7 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
 	if (!rl) {
 		err = ntfs_attr_map_whole_runlist(ni);
 		if (err)
-			return ERR_PTR(-ENOENT);
+			return ERR_PTR(err);
 		rl = ni->runlist.rl;
 	}
 
@@ -357,12 +374,11 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
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
@@ -371,8 +387,12 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
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
@@ -401,7 +421,8 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
  *  LCN_HOLE	Hole / not allocated on disk.
  *  LCN_ENOENT	There is no such vcn in the runlist, i.e. @vcn is out of bounds.
  *  LCN_ENOMEM	Not enough memory to map runlist.
- *  LCN_EIO	Critical error (runlist/file is corrupt, i/o error, etc).
+ *  LCN_EIO	I/O or other mapping failure.
+ *  LCN_EFSCORRUPTED	Corrupt runlist or file metadata.
  *
  * Locking: - The runlist must be locked on entry and is left locked on return.
  *	    - If @write_locked is 'false', i.e. the runlist is locked for reading,
@@ -411,6 +432,7 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
 s64 ntfs_attr_vcn_to_lcn_nolock(struct ntfs_inode *ni, const s64 vcn,
 		const bool write_locked)
 {
+	int report_err = 0;
 	s64 lcn;
 	unsigned long flags;
 	bool is_retry = false;
@@ -434,8 +456,10 @@ s64 ntfs_attr_vcn_to_lcn_nolock(struct ntfs_inode *ni, const s64 vcn,
 		return lcn;
 	}
 	if (lcn != LCN_RL_NOT_MAPPED) {
-		if (lcn != LCN_ENOENT)
-			lcn = LCN_EIO;
+		if (lcn != LCN_ENOENT) {
+			report_err = -EFSCORRUPTED;
+			lcn = LCN_EFSCORRUPTED;
+		}
 	} else if (!is_retry) {
 		int err;
 
@@ -462,12 +486,28 @@ s64 ntfs_attr_vcn_to_lcn_nolock(struct ntfs_inode *ni, const s64 vcn,
 			lcn = LCN_ENOENT;
 		else if (err == -ENOMEM)
 			lcn = LCN_ENOMEM;
+		else if (err == -EFSCORRUPTED)
+			lcn = LCN_EFSCORRUPTED;
 		else
 			lcn = LCN_EIO;
+	} else {
+		lcn = LCN_EFSCORRUPTED;
+		report_err = -EFSCORRUPTED;
+	}
+	if (lcn == LCN_ENOENT) {
+		read_lock_irqsave(&ni->size_lock, flags);
+		if (vcn >= 0 && vcn < ntfs_bytes_to_cluster(ni->vol,
+							    ni->allocated_size))
+			lcn = LCN_EFSCORRUPTED;
+		read_unlock_irqrestore(&ni->size_lock, flags);
+		if (lcn == LCN_EFSCORRUPTED)
+			report_err = -EFSCORRUPTED;
 	}
 	if (lcn != LCN_ENOENT)
 		ntfs_error(ni->vol->sb, "Failed with error code %lli.",
 				(long long)lcn);
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(ni), report_err);
 	return lcn;
 }
 
@@ -561,6 +601,7 @@ struct runlist_element *__ntfs_attr_find_vcn_nolock(struct runlist *runlist, con
 struct runlist_element *ntfs_attr_find_vcn_nolock(struct ntfs_inode *ni, const s64 vcn,
 		struct ntfs_attr_search_ctx *ctx)
 {
+	int report_err = 0;
 	unsigned long flags;
 	struct runlist_element *rl;
 	int err = 0;
@@ -585,8 +626,10 @@ struct runlist_element *ntfs_attr_find_vcn_nolock(struct ntfs_inode *ni, const s
 			err = PTR_ERR(rl);
 		else if (rl->lcn >= LCN_HOLE)
 			return rl;
-		else if (rl->lcn <= LCN_ENOENT)
-			err = -EIO;
+		else if (rl->lcn <= LCN_ENOENT) {
+			report_err = -EFSCORRUPTED;
+			err = -EFSCORRUPTED;
+		}
 	}
 	if (!err && !is_retry) {
 		/*
@@ -608,10 +651,23 @@ struct runlist_element *ntfs_attr_find_vcn_nolock(struct ntfs_inode *ni, const s
 		}
 		if (err == -EINVAL)
 			err = -EIO;
-	} else if (!err)
-		err = -EIO;
+	} else if (!err) {
+		report_err = -EFSCORRUPTED;
+		err = -EFSCORRUPTED;
+	}
+	if (err == -ENOENT) {
+		read_lock_irqsave(&ni->size_lock, flags);
+		if (vcn >= 0 && vcn < ntfs_bytes_to_cluster(ni->vol,
+							    ni->allocated_size))
+			err = -EFSCORRUPTED;
+		read_unlock_irqrestore(&ni->size_lock, flags);
+		if (err == -EFSCORRUPTED)
+			report_err = -EFSCORRUPTED;
+	}
 	if (err != -ENOENT)
 		ntfs_error(ni->vol->sb, "Failed with error code %i.", err);
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(ni), report_err);
 	return ERR_PTR(err);
 }
 
@@ -3314,6 +3370,7 @@ void ntfs_attr_close(struct ntfs_inode *ni)
  */
 int ntfs_attr_map_whole_runlist(struct ntfs_inode *ni)
 {
+	int report_err = 0;
 	s64 next_vcn, last_vcn, highest_vcn;
 	struct ntfs_attr_search_ctx *ctx;
 	struct ntfs_volume *vol = ni->vol;
@@ -3365,6 +3422,8 @@ int ntfs_attr_map_whole_runlist(struct ntfs_inode *ni)
 							   &new_rl_count);
 			if (IS_ERR(rl)) {
 				err = PTR_ERR(rl);
+				if (err != -ENOMEM)
+					report_err = -EFSCORRUPTED;
 				goto err_out;
 			}
 			ni->runlist.rl = rl;
@@ -3374,7 +3433,8 @@ int ntfs_attr_map_whole_runlist(struct ntfs_inode *ni)
 		/* Are we in the first extent? */
 		if (!next_vcn) {
 			if (a->data.non_resident.lowest_vcn) {
-				err = -EIO;
+				report_err = -EFSCORRUPTED;
+				err = -EFSCORRUPTED;
 				ntfs_error(sb,
 					"First extent of inode %llu attribute has non-zero lowest_vcn",
 					(unsigned long long)ni->mft_no);
@@ -3397,18 +3457,27 @@ int ntfs_attr_map_whole_runlist(struct ntfs_inode *ni)
 
 		/* Avoid endless loops due to corruption. */
 		if (next_vcn < le64_to_cpu(a->data.non_resident.lowest_vcn)) {
-			err = -EIO;
+			report_err = -EFSCORRUPTED;
+			err = -EFSCORRUPTED;
 			ntfs_error(sb, "Inode %llu has corrupt attribute list",
 					(unsigned long long)ni->mft_no);
 			goto err_out;
 		}
 	}
 	if (!a) {
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
+		}
 		ntfs_error(sb, "Couldn't find attribute for runlist mapping");
 		goto err_out;
 	}
+	/* Only a lookup miss can establish that an extent is missing. */
+	if (err != -ENOENT)
+		goto err_out;
 	if (not_mapped && highest_vcn && highest_vcn != last_vcn - 1) {
-		err = -EIO;
+		report_err = -EFSCORRUPTED;
+		err = -EFSCORRUPTED;
 		ntfs_error(sb,
 			"Failed to load full runlist: inode: %llu highest_vcn: 0x%llx last_vcn: 0x%llx",
 			(unsigned long long)ni->mft_no,
@@ -3425,6 +3494,8 @@ int ntfs_attr_map_whole_runlist(struct ntfs_inode *ni)
 
 err_out:
 	ntfs_attr_put_search_ctx(ctx);
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(base_ni), report_err);
 	return err;
 }
 
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

