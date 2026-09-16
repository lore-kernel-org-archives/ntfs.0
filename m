Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFBDDF6C
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 01:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520635; cv=none; b=K+yxXgDxhPJp5txaMHtd82D9MIuarJI9MKHqSqrEt4xU26PhWyVG4u8fyKPU8WrvFT8Phzf3ij3+JtyfLz2FDRxLczqpDD83NPCdhr67892+evLutN90jZsGo2dM/d6Z4r6DvqAINeKy93mbBKrTN0cP1/uLYXOn6PpfUZpoCok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520635; c=relaxed/simple;
	bh=T0O12x06V7R2SNPzjoPAHq2I7plcHGW58pBct1G33N4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jMEuGev/hqIeCFUFj1KyNoM7sbb1HsIEQxHqa+iuOd1F6C5ImBxdijXdhg2OkPdGtU0L3UQF5fMRe3Uxlccfn1x1HCGK0+SGpEMtIS0bAHT7DHn6vIyKkF5l2w4RrSU46Z398scTPpUAXLT93WS0la4Pinuuq+rtac5gN3BzQg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVUg9KpS; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVUg9KpS"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6185so2831195ad.0
        for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 18:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520633; x=1790125433; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GgeONSa/3d2Fwvws25GBM0nFyHlHKKjX0Ma3GAh9H6s=;
        b=gVUg9KpS89KS/eLrTrxUjbb6FyhTWbO5F3M6i5+sQPqOFRRcH5I6xkmmjrMWJ1YVoz
         v7Aa1gUX+6KgKt9pRfv5UJwbhl6WBhRZhWWmmTNGsJFjOI9buQ0RYaQXP2ipUHOJc58n
         JR0mEL9BiYlKLLCMZOz50PlUVpqPotSJjkqqnPiDSIbZg+kX2YpLzmD63OwkIcEe68bw
         YiMVxPE5L8FsnqIZN5lIdYMasWeH8D7ErMLdWS8IqZqB0ZG6jRBh03Bl37l57/FRDBR3
         mFe0jWu30gnAFYEEAZt8pKexrxwzVSqF4Y15eGpA3MpIOIgNiG7520yR45xe2RWc0NCV
         l9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520633; x=1790125433;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgeONSa/3d2Fwvws25GBM0nFyHlHKKjX0Ma3GAh9H6s=;
        b=PGFSEYWxyCspIqQhvDl0XgqGAq0Hrbq69utVKnwwQzf799jfJ3uv8oXjfsFuj3CHWf
         h5ZXFzB211Ja4si1eYJUKIEnM4G5g8kWIyXJYBJh5Jmkq5IR9lO1fvY29TbmRcMRVj1l
         hmMSxvpYe6A7tvdAfIvVLOccvqCsh0BSFrVdofLF/mb9vbFjtQWLwf4RY+Qt2Oobl71o
         HLToMuUgYJBW4IffrsZ06Ru4YxZdZxcignkVkgeOobVm+5j57SiNJMQf+S5gwcJPXuLz
         EJQh+62Q2llz4I6JEA4RSCoVNChu6zw1vr7fudtRDi2HqgteSPqABOCC4FTsFVLR5bDg
         hhfw==
X-Forwarded-Encrypted: i=1; AKwUvBx534hveCoVTcRT4ReCNqKKmHOfvFd9D35YK0U588wgA61cvIqxObRSq0Z2vYf/if4RG36H@lists.linux.dev
X-Gm-Message-State: AFuF++lqNnVA+Nnsg6H8IEH4xd9mBHf+sFojOXvY7Yt4+lue5Nmpl3AE
	mEZRoM/3s/V1V/LP4qCyj2bOgTD1FTGetFXsJWbM95b/0Y5uVgz179ax
X-Gm-Gg: AYBFou0XRHVNQxEXGI1OexT6yR6oZj1A0WvCGO+F7iSkaELxVDJ27JQLRgGNqxfW7A0
	3Ceo2XI8nWRZdQXS31og1ZZ+hFOQdiK3fAiGj973EBW5k+Zc/Rfcv5Zc19IeeaLHlw4dQDH/Ud6
	ECycaEXjAOm2EMINt3P5K1TMl59aBMv7AjZaYoxeVfG2ucAKyVqo6AIH/PCk+ZAvPkawKFr93Bh
	rnVirtTN8vDLsnbArzVQ4xlUerhqSpHzPIY4OgJIhMmkumxq7Vqij0SF2sR6lolEnunpwjJr6gP
	KC4I6kEe9c38rO6z4V58TZR6I/Nh9FXiOmqj7Nh8RiIwwfnVdA/9Kv13rgI2ZJ+7/jGqW0mcns/
	wGHwpcvV0QPUkiEINWa416EIv0BiQjJCFSOonPUiErPPqkYK12y36jNnkE77O8C0ZJsoCiaK8TY
	hnMh2ZQS2G3aoyXRictxrrWTyqtf3inS2rtNn3BTNo13VVyE+xgV1nzOsB17DOBln00clGYZqE6
	AsyfqtwA9IU7Ep4
X-Received: by 2002:a17:902:ce8f:b0:2da:e967:7953 with SMTP id d9443c01a7336-2dd8e404066mr11549575ad.12.1789520633386;
        Tue, 15 Sep 2026 18:03:53 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fff3sm2880995ad.8.2026.09.15.18.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:03:52 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 03/10] ntfs: write MFT mirror data in mapped I/O units
Date: Wed, 16 Sep 2026 10:03:15 +0900
Message-ID: <20260916-topic-4kn-lkml-v4-3-4f8a574ba3fb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
References: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7849; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=T0O12x06V7R2SNPzjoPAHq2I7plcHGW58pBct1G33N4=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqqeq2N5px4phVicjIUhPFmA6MwQ3b9VBfS5T/i
 Y4Jr3FNsRaJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqnqtgAKCRA08jD6945I
 0xMqEACdUn5Avn4FuzJ0PrY3Z0Xi9JXhhjhB1J+dEsZN9k5KdZ9TiQ4dergUs7XAQley4ZQJGLk
 G80N7in9VyWW79NLO2QvYN629OxRTZjB23SWzZ7Cnieag/EnEftMQwtj4V1debkbrP9s6mDushO
 X7D8o/XeazYewJcbJUnuYdAIOG4qoCDVG8xi+6M4hPfCuxQKJeRkZ5MynNcAnHSl/owpIktruM6
 Y+ZFbpNvI6TCp3lQGbeHZOrh9pwuYJEkV+sgXbgXXCYjwkZQaGD6OF1wT3ZNDaPecPSgMUgXzdu
 Ru3gRmXbMeH3CseXCdyCvahghRf9C4A3Q6s88yciGZfBa73jhwu/OBa16TGs2mDfO91yrNn0ogx
 VaIn85KKFaGpzSIWjWnhRygkG8lSwGI0XwBl+lMMdas+BWv2AGibchqERRkMNmwQbdI+Vx/2uPl
 01mONS5S26HpyTPRLtf3KzdOdVfwhVZ1UCqhHIH66rcFEjgfXD/0FFz3A/DZ0pCOF8gkcE2PjjX
 +DNXZxs/tmOkba2b0mu04Io2z54n3LVEdxE5LaxgrcldZiURk9S1VTFa+qFFrNcD8N/jWW+UOEz
 I3JQNhW5b3V+faUTGAxv5iaXEoF8/dJDcRjaYNJN4RtiyabYUtLEJBtD1qzFocuIzk474WPd+8H BKcVNK3PPu6zT+g==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
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

