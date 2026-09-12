Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C560C3750D6
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230118; cv=none; b=AsdhS08D+1P0aZGfdvleqWX5zR1GyzfuXhalYz58uWLq4c64zy7MOzAlxk0CCMQeeOQwQ1/ocfeIQUDk1IHo/JZ6IRxniBr1CV5NuXA1M4YPZSuZJxxLR7KyMqK2NK6u/ZRwGnyP94FynLFP+dq1gSNbHbfmNLTRUMKD4FsSAgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230118; c=relaxed/simple;
	bh=6ig6cUNXShtnKrFZM/iofNHgSxfmFKjJRakDTDfardA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dP/ZzVLMTgX7cu3RfrwjNwZQP0473g1cvqt9Ez90cMq4tSsvmIR0cHoNtdItPE400uz7VyPMMkH8qiLuO77s7cfmq4J6M6wbbmHH5zs/vAFijK92R1CGq7Q5xtkg0KQGGw0CLdph/bwEupptJtxKuzO4fuKvAyKVjjomQA3hrj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAntgtSb; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAntgtSb"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc02279so724167a91.1
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230116; x=1789834916; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MchYj0MEojeDGsgInR2mANdegaTQU3AfPx03ts6kQxY=;
        b=iAntgtSbKHCevKT8l5B1cFh3YA5+3m6OOq8eg/rl+uT/lP80w0tDqp+ko3YauKmuYz
         fCZwgFs5qpawC/HQOQotvvH/eaafrp9NsheqbFzgB707PV+VRje/9R+0a9WHa80BurwQ
         +0k++m2njT0/0TQSJRvzG0pJgNTMe7Lz5MyJnQJ7Lbw9NQHZ3nU4vC1muRDPUItMS1sr
         A9DQprmkeApflFWH5l0uFofPU8W5nctiOgosuY15al2j2tvT9mwNd4Zu2U507G6/674H
         05JJJHFtAghZpqXmzXWKZiRRAmcNYaB/LqXWzHnFnbvhP2NKvvmaiK04iXT6bpNB/sAX
         iFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230116; x=1789834916;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MchYj0MEojeDGsgInR2mANdegaTQU3AfPx03ts6kQxY=;
        b=XGwMksS516HViam9COwTP62goKxO9Xl1YTcCrpWsYDmqlxRK+RoF1cvl16xTV2mwaK
         34zOX6iBzvuDvPlndLRRxr7G9UllSBFpOZ0VPunDPVJ3juSwJSFj4rFbZhksGywKaj8r
         jrhEjdfnevWsi3NnQBmnx1U1D9IwV8XgsBFstb3ghu4IEzkuBEAliNmcs7feD3yWPlzY
         SJnjncjqygFCInOR3nDmRWPzqRCXU9/+c8jHhYr3WPLJLzqKiGaZZTgRVhpgWh0xnceQ
         jG78f50oiWTsTfQsooF/ZA/KCiC/WZjdmvG+YgnsnGu2JoK6Oaq0KMT0HSGMzA5VsWGh
         6xaA==
X-Forwarded-Encrypted: i=1; AKwUvBxocyh9Dh+G5O5yz/Qhy9F9riFpACxTwmRRqz7ra8QFbWKwWZ2zI3ECrem6r5CZ/LdotUMb@lists.linux.dev
X-Gm-Message-State: AFuF++k43whcoP1U/OsYZlaFKk6lTxxZDjex+NouI2/1G4gYC9M7N54S
	xOs360kK7xN0SXcpuqMM9KvODqQosXDF2qz2679qzWPIyXxTZQTBVOR7
X-Gm-Gg: AYBFou1CEhcd2S3rk7r1NyyJiChxcKnEUXYisCfti9nwoXundGASl1E9VYUSj3u3mlp
	ZqshGwdOXyGUcg8RP4b+1L4L9rsbkDd7Q6XHPky+JNHukQncctVFRS0NJZpkiK+gBPGXyTIKd6i
	YATDqBaKEIzmaMX+mesOiCJLX4oP2ahwpJlRVsh3Iso3FACTpQO8jwsp4iWt4ysUmjpJ+cPczwd
	1WpNqC85x2PVGPo1yNz7Alm0jOGJk8DgTRz/Qdt0xHYVOIR3cXgFozlcgX7Z7oIpsn9e+TDJu6v
	19gi/c7F9rB5eVggcKLidYDFMZdl/2aaX3wz1EbBthP5Y5yxxSV3+6pG1sIydhmJJJkvK89KrNm
	TzdaqLkGDvkmArxdSakPiY6fvfQHuT2tJ2PhY0Np5dZpZSbwOCkFlPnof9eXkHD05PGmXBZ/0kw
	LGLCrCExDUGP6Kl6eDI4//smDcBmaNlfJKqhQnC4y5oQv9cGYZOU7cyxuz5mYtvV0iakTkZAnJj
	YKyZNgV/o+BrlWG36p6OEo=
X-Received: by 2002:a17:90b:2741:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39d9bdbb0e4mr16087536a91.6.1789230115946;
        Sat, 12 Sep 2026 09:21:55 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b21sm10804999a91.13.2026.09.12.09.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 09:21:55 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2 03/10] ntfs: write MFT mirror data in mapped I/O units
Date: Sun, 13 Sep 2026 01:21:15 +0900
Message-ID: <20260913-topic-4kn-lkml-v2-3-2bc455e81635@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913-topic-4kn-lkml-v2-0-2bc455e81635@gmail.com>
References: <20260913-topic-4kn-lkml-v2-0-2bc455e81635@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789229949; l=7987; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=6ig6cUNXShtnKrFZM/iofNHgSxfmFKjJRakDTDfardA=; b=i+S27Fk+K12i6FzUA1IrDS3LDLS2m5n4f2bFuiCkqnBPrstCW2B94Id/YOqBfWzkhsHEzw6sl S5zwSfCSic2Amcap9/U13+27jKdQM6CUtlwD5kazkYfX8Cc56umnFIt
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
Content-Transfer-Encoding: 8bit

Replace the record-specific mirror writer with a unit-based helper
and use a stack-allocated BIO for synchronous mirror writes.

Route write_mft_record_nolock() and ntfs_write_mft_block() through
the common mirror primitive. The helper only returns errors, So callers
handle volume error reporting and retry policy.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/mft.c | 146 +++++++++++++++++++++++++++++-----------------------------
 fs/ntfs/mft.h |   2 -
 2 files changed, 73 insertions(+), 75 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 09fc378eded7..1cd31c6582a9 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -428,6 +428,12 @@ void __mark_mft_record_dirty(struct ntfs_inode *ni)
 	__mark_inode_dirty(VFS_I(base_ni), I_DIRTY_DATASYNC);
 }
 
+struct ntfs_mft_io_unit {
+	sector_t sector;
+	unsigned int folio_ofs;
+	unsigned int len;
+};
+
 /*
  * ntfs_bio_end_io - bio completion callback for MFT record writes
  *
@@ -444,69 +450,60 @@ static void ntfs_bio_end_io(struct bio *bio)
 }
 
 /*
- * ntfs_sync_mft_mirror - synchronize an mft record to the mft mirror
- * @vol:	ntfs volume on which the mft record to synchronize resides
- * @mft_no:	mft record number of mft record to synchronize
- * @m:		mapped, mst protected (extent) mft record to synchronize
- *
- * Write the mapped, mst protected (extent) mft record @m with mft record
- * number @mft_no to the mft mirror ($MFTMirr) of the ntfs volume @vol.
- *
- * On success return 0.  On error return -errno and set the volume errors flag
- * in the ntfs volume @vol.
- *
- * NOTE:  We always perform synchronous i/o.
+ * Write one MFT I/O unit to $MFTMirr.  The source folio contains the MST
+ * protected image that will be written to $MFT.
  */
-int ntfs_sync_mft_mirror(struct ntfs_volume *vol, const u64 mft_no,
-		struct mft_record *m)
+static int ntfs_sync_mft_mirror_unit(struct ntfs_volume *vol,
+				     struct folio *source, u64 mirror_file_ofs,
+				     const struct ntfs_mft_io_unit *unit)
 {
-	u8 *kmirr;
-	struct folio *folio;
-	unsigned int folio_ofs, lcn_folio_off = 0;
-	int err = 0;
-	struct bio *bio;
+	struct folio *mirror;
+	struct bio_vec bvec;
+	struct bio bio;
+	u64 mirror_size;
+	unsigned int mirror_ofs;
+	u8 *src, *dst;
+	int err;
 
-	ntfs_debug("Entering for inode 0x%llx.", mft_no);
+	if (unlikely(!vol->mftmirr_ino))
+		return -EIO;
 
-	if (unlikely(!vol->mftmirr_ino)) {
-		/* This could happen during umount... */
+	mirror_size = (u64)vol->mftmirr_size * vol->mft_record_size;
+	if (mirror_file_ofs >= mirror_size ||
+	    unit->len > mirror_size - mirror_file_ofs)
+		return -EIO;
+	if (unit->folio_ofs + unit->len > folio_size(source))
+		return -EIO;
+
+	mirror = read_mapping_folio(vol->mftmirr_ino->i_mapping,
+				    mirror_file_ofs >> PAGE_SHIFT, NULL);
+	if (IS_ERR(mirror))
+		return PTR_ERR(mirror);
+
+	folio_lock(mirror);
+	if (folio_test_writeback(mirror))
+		folio_wait_writeback(mirror);
+	mirror_ofs = mirror_file_ofs - folio_pos(mirror);
+	if (mirror_ofs + unit->len > folio_size(mirror)) {
 		err = -EIO;
-		goto err_out;
-	}
-	/* Get the page containing the mirror copy of the mft record @m. */
-	folio = read_mapping_folio(vol->mftmirr_ino->i_mapping,
-			NTFS_MFT_NR_TO_PIDX(vol, mft_no), NULL);
-	if (IS_ERR(folio)) {
-		ntfs_error(vol->sb, "Failed to map mft mirror page.");
-		err = PTR_ERR(folio);
-		goto err_out;
+		goto out_unlock;
 	}
 
-	folio_lock(folio);
-	folio_clear_uptodate(folio);
-	/* Offset of the mft mirror record inside the page. */
-	folio_ofs = NTFS_MFT_NR_TO_POFS(vol, mft_no);
-	/* The address in the page of the mirror copy of the mft record @m. */
-	kmirr = kmap_local_folio(folio, 0) + folio_ofs;
-	/* Copy the mst protected mft record to the mirror. */
-	memcpy(kmirr, m, vol->mft_record_size);
-	kunmap_local(kmirr);
-
-	if (vol->cluster_size_bits > PAGE_SHIFT) {
-		lcn_folio_off = folio->index << PAGE_SHIFT;
-		lcn_folio_off &= vol->cluster_size_mask;
-	}
-
-	bio = bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRITE, GFP_NOIO);
-	bio->bi_iter.bi_sector =
-		ntfs_bytes_to_bio_sector(NTFS_CLU_TO_B(vol, vol->mftmirr_lcn) +
-					 lcn_folio_off + folio_ofs);
-
-	if (bio_add_folio(bio, folio, vol->mft_record_size, folio_ofs))
-		err = submit_bio_wait(bio);
-	else
+	folio_clear_uptodate(mirror);
+	src = kmap_local_folio(source, unit->folio_ofs);
+	dst = kmap_local_folio(mirror, mirror_ofs);
+	memcpy(dst, src, unit->len);
+	kunmap_local(dst);
+	kunmap_local(src);
+
+	bio_init(&bio, vol->sb->s_bdev, &bvec, 1, REQ_OP_WRITE);
+	bio.bi_iter.bi_sector = ntfs_bytes_to_bio_sector(NTFS_CLU_TO_B(vol, vol->mftmirr_lcn) +
+							 mirror_file_ofs);
+	if (!bio_add_folio(&bio, mirror, unit->len, mirror_ofs))
 		err = -EIO;
-	bio_put(bio);
+	else
+		err = submit_bio_wait(&bio);
+	bio_uninit(&bio);
 
 	/*
 	 * The in-memory mirror is now valid because we just memcpy()'d the
@@ -515,23 +512,26 @@ int ntfs_sync_mft_mirror(struct ntfs_volume *vol, const u64 mft_no,
 	 * the stale on-disk mirror and overwrite this copy.  The error is
 	 * propagated to the caller via @err.
 	 */
-	folio_mark_uptodate(folio);
+	folio_mark_uptodate(mirror);
 
-	folio_unlock(folio);
-	folio_put(folio);
-	if (likely(!err)) {
-		ntfs_debug("Done.");
-	} else {
-		ntfs_error(vol->sb, "I/O error while writing mft mirror record 0x%llx!", mft_no);
-err_out:
-		ntfs_error(vol->sb,
-			"Failed to synchronize $MFTMirr (error code %i).  Volume will be left marked dirty on umount.  Run chkdsk on the partition after umounting to correct this.",
-			err);
-		NVolSetErrors(vol);
-	}
+out_unlock:
+	folio_unlock(mirror);
+	folio_put(mirror);
 	return err;
 }
 
+static int ntfs_sync_mft_mirror_record(struct ntfs_volume *vol,
+				       struct folio *source, const u64 mft_no)
+{
+	struct ntfs_mft_io_unit unit = {
+		.folio_ofs = NTFS_MFT_NR_TO_POFS(vol, mft_no),
+		.len = vol->mft_record_size,
+	};
+
+	return ntfs_sync_mft_mirror_unit(vol, source,
+					 (u64)mft_no * vol->mft_record_size, &unit);
+}
+
 /*
  * write_mft_record_nolock - write out a mapped (extent) mft record
  * @ni:		ntfs inode describing the mapped (extent) mft record
@@ -603,8 +603,8 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 
 		/* Synchronize the mft mirror now if not @sync. */
 		if (!sync && ni->mft_no < vol->mftmirr_size) {
-			int sub_err = ntfs_sync_mft_mirror(vol, ni->mft_no,
-							   fixup_m);
+			int sub_err = ntfs_sync_mft_mirror_record(vol, folio,
+								  ni->mft_no);
 			if (unlikely(sub_err) && !err)
 				err = sub_err;
 		}
@@ -627,7 +627,8 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 
 	/* If @sync, now synchronize the mft mirror. */
 	if (sync && ni->mft_no < vol->mftmirr_size) {
-		int sub_err = ntfs_sync_mft_mirror(vol, ni->mft_no, fixup_m);
+		int sub_err =
+			ntfs_sync_mft_mirror_record(vol, folio, ni->mft_no);
 
 		if (unlikely(sub_err) && !err)
 			err = sub_err;
@@ -2776,8 +2777,7 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 			prev_mft_ofs = mft_ofs;
 
 			if (mft_no < vol->mftmirr_size) {
-				int sub_err = ntfs_sync_mft_mirror(vol, mft_no,
-						(struct mft_record *)(kaddr + mft_ofs));
+				int sub_err = ntfs_sync_mft_mirror_record(vol, folio, mft_no);
 
 				if (unlikely(sub_err) && !err)
 					err = sub_err;
diff --git a/fs/ntfs/mft.h b/fs/ntfs/mft.h
index 75a51a98d0f6..836632b110e8 100644
--- a/fs/ntfs/mft.h
+++ b/fs/ntfs/mft.h
@@ -42,8 +42,6 @@ static inline void mark_mft_record_dirty(struct ntfs_inode *ni)
 		__mark_mft_record_dirty(ni);
 }
 
-int ntfs_sync_mft_mirror(struct ntfs_volume *vol, const u64 mft_no,
-		struct mft_record *m);
 int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int sync);
 
 /*

-- 
2.43.0

