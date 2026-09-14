Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895D44A207C
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399325; cv=none; b=r4GrWykMJmcElCUONCNAB2Bh7/Pmyn0tRsSEl8wCrOp1WH0WLDnX2uBEowbR2TyoVI/YxRGBL0v7JWRhNtbyu/kZgOxwKuA1IssDUG1GBuyissvJ5rrI1nM+EhI2x+d6tYU00gto5VHkifHxLibA19cF1DVafvH2Tnmxpv/K9Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399325; c=relaxed/simple;
	bh=T0O12x06V7R2SNPzjoPAHq2I7plcHGW58pBct1G33N4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uJIu03nUpX1dupMlKhZNETqU9c9lNQoyZAGz/xPMSiIDsytyaXuUzOai92ksAVpr5vmHUsCMwScUVqGQulY/q7OdqnywNeLmO/OOZj5j6GEbdmuBkx3bzMR6PWwQWNUkGJo9pE+VJ12npCdEPycg0sW38NnUcvkBg4Fu1r6SgJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9qXA3wS; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9qXA3wS"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so1564878a91.0
        for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399322; x=1790004122; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GgeONSa/3d2Fwvws25GBM0nFyHlHKKjX0Ma3GAh9H6s=;
        b=o9qXA3wSNVOxUieR7/SyV493MpDVU4EnsGA5LQJyxwaIRk/a9tev3ee40cTcyxKKJK
         24z4XxyU/G//oRWmfBg+217WASLdz2NjIej+K4sGj2fhCbteBEPwvoQx+HE+4fDfMDvE
         yGZhjAm4o3yxvtXS/FreXUcgde3N3wyNAd6lGFXjQwzxQ5qISTLfXJ9cAhfrqK3VJ4y5
         /lpF3a/1ZfPz6beo2nfHDF7DmGjQJpHYbbbYt4msdxlXGdSI5X8AtPKoa5UCaIWziXZx
         QlAZj1Y9UTHIIoGycK8TkQ3fw3ZF5UxhWvgT9ppIS8Yy8P+BgyykyVN9F6hlk/JN3TTd
         xmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399322; x=1790004122;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgeONSa/3d2Fwvws25GBM0nFyHlHKKjX0Ma3GAh9H6s=;
        b=GX2z7H1+qDY7hf9KpnIfYY/11VQBnHjlq9nbM7/YVnsjeaG4uUGAti7EsTuH+5sauq
         4I+BOUX/luB2rYBcAhVG2ymU3P41JIyjwY+ll9nwcbSzVav/rosIx0ZcTOdHk7mYpRgK
         DKxb6qHgdFLApgw4S8QE9u7b85agMeHGvjhD1dBN5rfSMAFJBRMWCJzrmuP0uN6PaWzo
         Hfj2jdXUcHZQd1sZPva6zemjVNgxoX0ThRWlFItk1xLaxzAGLAau3CCBnkQ/XxejGneb
         eetEe9vc71JlyfnENGVEvV8MQl5tNwuzOCCSvQ4zPsQo84NwXfeVGYWvVlVhw9Hygx/7
         anRg==
X-Forwarded-Encrypted: i=1; AKwUvBxjzuIkZLKu8WO13RzvisEL3q/U5wH2MYaDzMtzWCzDh7L2PAtm09oZaEEwK4MrQ8f0xwad@lists.linux.dev
X-Gm-Message-State: AFuF++mC7vGWUE1+zn5JGHGNlwBaho5oX0+Oz0QbzqBCclxRctuoYnc+
	Xb9mUpwN+rRhWvwErwyIWNnuLmf67CVFsKhxgKRDzGzHdeOuTWV8knhR7KhFjQ==
X-Gm-Gg: AYBFou2sXTvTuhkZM5k6j4sIIo0bNsNI0TDeYCkjJOMRSeBxyu1ZwwVdoKgswDVg509
	B/KzGCLZSyr/I+HTvJLxB7QyXWppwMYGiIav6gc5U2L5y8LRv+y6PTrK4kuM/4SJ340xzMG51l9
	7piLJlc7lvJEqMrcgu5bCuo01LS+xFBZRU1FXmELbUuHByuc8vy8PVBQiOgY5hKTm87w9AcDe78
	YPg5MIyCmRDjQaqaps1i1uKD30MfvM0xNwbeBTpmxw49yZxWFLywr/oBtxsRSPRCvS+h2rxLD4y
	mebGmdg8X5jNBhImewXogypwLz+rrayuuRQzsP40oQs/SSvQXUyH8dGyL/LatTyte1EodN+RRCN
	a4jdb7nvgVkFKHF0IKPHEb5qTRu+KftBLkIKlddjWwiEmaVwyHy0y+FShG5jwJyMliAZqRpXU4H
	7n5Dj3Q4y9SgAnKs7ILmGIESB9HCwj0y+6JBJrj/O/Z09y/6toqwvCGplFxXXamJy9OyOTMG0sx
	LT2Q+iLj6YhWAsdXrzI9Gg=
X-Received: by 2002:a17:90b:380c:b0:39d:e1ed:fae0 with SMTP id 98e67ed59e1d1-39debf50149mr5920262a91.5.1789399321586;
        Mon, 14 Sep 2026 08:22:01 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd6cd982sm31667a91.0.2026.09.14.08.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:22:00 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 03/10] ntfs: write MFT mirror data in mapped I/O units
Date: Tue, 15 Sep 2026 00:21:32 +0900
Message-ID: <20260915-topic-4kn-lkml-v3-3-447cfa17f780@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915-topic-4kn-lkml-v3-0-447cfa17f780@gmail.com>
References: <20260915-topic-4kn-lkml-v3-0-447cfa17f780@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789399242; l=7849; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=T0O12x06V7R2SNPzjoPAHq2I7plcHGW58pBct1G33N4=; b=MfqUz8dlITWuXuy7+7EDc8srxiVTRvEK+D3ce8O+3KUuJ0xWJPRBQw/2A+nMrLo+T31yKZqI3 ABWWd0Bg6X0Dtp3gJ3Um0lK7hGRibt5bDUTQnlvRHzEIwt5+Frej5xd
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
Content-Transfer-Encoding: 8bit

Replace the record-specific mirror writer with a unit-based helper
and use a stack-allocated BIO for synchronous mirror writes.

Route write_mft_record_nolock() and ntfs_write_mft_block() through
the common mirror primitive. The helper only returns errors, So callers
handle volume error reporting and retry policy.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/mft.c | 142 ++++++++++++++++++++++++++++++----------------------------
 fs/ntfs/mft.h |   2 -
 2 files changed, 73 insertions(+), 71 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 19e042474df6..955b1f9ab372 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -429,6 +429,12 @@ void __mark_mft_record_dirty(struct ntfs_inode *ni)
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
@@ -445,65 +451,60 @@ static void ntfs_bio_end_io(struct bio *bio)
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
-	unsigned int folio_ofs;
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
+
+	mirror_size = (u64)vol->mftmirr_size * vol->mft_record_size;
+	if (mirror_file_ofs >= mirror_size ||
+	    unit->len > mirror_size - mirror_file_ofs)
+		return -EIO;
+	if (unit->folio_ofs + unit->len > folio_size(source))
+		return -EIO;
 
-	if (unlikely(!vol->mftmirr_ino)) {
-		/* This could happen during umount... */
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
-	bio = bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRITE, GFP_NOIO);
-	bio->bi_iter.bi_sector =
-		ntfs_bytes_to_bio_sector(NTFS_CLU_TO_B(vol, vol->mftmirr_lcn) +
-					 ((u64)folio->index << PAGE_SHIFT) +
-					 folio_ofs);
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
@@ -512,23 +513,26 @@ int ntfs_sync_mft_mirror(struct ntfs_volume *vol, const u64 mft_no,
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
@@ -600,8 +604,8 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 
 		/* Synchronize the mft mirror now if not @sync. */
 		if (!sync && ni->mft_no < vol->mftmirr_size) {
-			int sub_err = ntfs_sync_mft_mirror(vol, ni->mft_no,
-							   fixup_m);
+			int sub_err = ntfs_sync_mft_mirror_record(vol, folio,
+								  ni->mft_no);
 			if (unlikely(sub_err) && !err)
 				err = sub_err;
 		}
@@ -624,7 +628,8 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 
 	/* If @sync, now synchronize the mft mirror. */
 	if (sync && ni->mft_no < vol->mftmirr_size) {
-		int sub_err = ntfs_sync_mft_mirror(vol, ni->mft_no, fixup_m);
+		int sub_err =
+			ntfs_sync_mft_mirror_record(vol, folio, ni->mft_no);
 
 		if (unlikely(sub_err) && !err)
 			err = sub_err;
@@ -3029,8 +3034,7 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 			prev_mft_ofs = mft_ofs;
 
 			if (mft_no < vol->mftmirr_size) {
-				int sub_err = ntfs_sync_mft_mirror(vol, mft_no,
-						(struct mft_record *)(kaddr + mft_ofs));
+				int sub_err = ntfs_sync_mft_mirror_record(vol, folio, mft_no);
 
 				if (unlikely(sub_err) && !err)
 					err = sub_err;
diff --git a/fs/ntfs/mft.h b/fs/ntfs/mft.h
index ed5c1d595c0d..eb8a6f0d7944 100644
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

