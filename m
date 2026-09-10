Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B653E1696
	for <ntfs@lists.linux.dev>; Thu, 10 Sep 2026 09:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033609; cv=none; b=HWg2OaGZNJ/n+Mqd0UhO4919adl+9fhvw8qeL/9jBDQeMeGOB8SwZEev8uXC6PMAjC0IRzcHAoOXt8q32O1ZGFvcraae5lBOs0E9nOWwnt1H+CGzIgaLnLloANfyOH2G6Jh37L9OaovMuGPePfMp+UdevDxKG55Jmum12xzf9bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033609; c=relaxed/simple;
	bh=CczLbAp4/Y09X4t7NtfluxmctRl+3g7cZxTFMEwGVaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YlXm2Mn4sbMQy4LyApr3FAmmCvmAFIq1Omqf2wCK7zcQ4eoJ2l0ZziorTk1AAxyB68IE01Ov9gFd0G7c+E/Rj/vjFEM41eHZYFzHcASzaygGgOOiPV6RJfif6jWUduoYtViggb+giXnYRdH5W7B0ukPyeps7splwVvlMJjKlzog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icuQ1wKP; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icuQ1wKP"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so11931395ad.2
        for <ntfs@lists.linux.dev>; Thu, 10 Sep 2026 02:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789033602; x=1789638402; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=leg/4PNA5+dgeugg1M0PEx/+ktT1W1NNhX95D1rPpG4=;
        b=icuQ1wKPQEKxFlfFYhAD8DMOOTd62XMTHsB2/7nqUSC1gKaTSxbuw0g3D+LszUxjjK
         guGywjK5+Ka7g8H1+2d8BkUH+RtT/lwquDIn5n7EI5bQ0FhtajUzRJmai2QsI60G/mc8
         4CR2sn+8DTzdlNTBSt+yi8mxYHTtYRf9qW3Ij0YBA7sFqECpmW+B+eTRdx1pOq08wDfZ
         q4f64fAM+5INqkyP47lJW5K5+pcft29Vncb8vx9OdDZKOwRpWAc9u2p7gn95xBrM98OG
         UZ2Knr0b/9A6jAhlOHNPMlD5NX81W3QV05mFgaUhzxu85Inyn5iXhuD6ceTOCWQH3Y59
         Mvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033602; x=1789638402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=leg/4PNA5+dgeugg1M0PEx/+ktT1W1NNhX95D1rPpG4=;
        b=jz/8cari9gxvBhNcZSwCwzEvHkrgiD5nfJGkyfLCHnedP+uijgSapIUf0fbMrvGA12
         R5Axv9w+pzoLaSmqv9LAtBDT9ZxWnq2HaZR9PHAscThlv3gjLpLbHizveNhSgyHn9Ig1
         jpBnrj/fJmdMg+nrUHouAR03kB/H3dMxr9paBQTQ6Dhmpd100VA2ZoH5LX3AGyy1Bovr
         4Vxh7bDLfkQ3dgUXPDb5bm1o8bwOgiiWR9dpNv9FcXVJuWIhunyZxXDsiZY8n896NFGC
         1De4r8rU0S3i7Gov4fTsFuJfzfO8uZ5SieDOaFMQZQ//vnb3dy62nfSymt2XLMye+An8
         q4ug==
X-Forwarded-Encrypted: i=1; AKwUvBwde8TXVw6Zb2hPJUL5OHMQB65P/XI140lp81D+chWWt2qfcikp+T7MHbyms0c498whQdr7@lists.linux.dev
X-Gm-Message-State: AFuF++mg2YkuqkbgcHD5tdfQcTMWpYofXy07+NxHZdyJ3ZgRDgipbM+l
	C5CDnEIhxq7FPsSyZ0+npcSvgZYV4NOiiFaJeDSwL2MyUTGPk1X/joWX8mDIdQ==
X-Gm-Gg: AYBFou1/pwDgM4sqomCPcQNZH6Gga1CH2vgrMnH0iQSaPhOXGuBvcGvaKGy4qAO3W0B
	CLvMtSJcqyj50Jqiek1TVY0LaUGTHOLCn9RXFY8pekhAZ7omHkb9eeafZS85kQqiy2kjUa1ReqR
	OavX8tr0dYKdNEKxY5rJl1ojgbcumiwgt5XkyuL1BhNj5n78afDWqwxhbmEY82iwENpWTP4BVfh
	Vv0M4NrKyyFPLdO1q5NEwwrPjnz2CykDn8lzOkbNJee73FA3CmUrx97wP+kUe9v5i9L6FtuVjSY
	A/Uip0G/xrr3wI/ARM10ZVB45Vy/2AL5nBuG8PC6VpvTCX/2sXa1ZDq+9e9Isil8DvUjs14OEcD
	aEfnvGgMDcmDO6x63z4W+ndF5yZYjqtz9ddk0f33DxmOOs3fu2nbQPpDo5iCyjk0l+iGv+CRXG4
	9SlBw8l0rV9jbH6bi4yTEObSGAJYrg8YE/6MbMK1IErWgNChm5lo4zQKvoHVSoq/cB0Wx5kmlU0
	nD2JA==
X-Received: by 2002:a17:903:2287:b0:2db:2ae9:fab3 with SMTP id d9443c01a7336-2dd0797b327mr94851115ad.11.1789033601574;
        Thu, 10 Sep 2026 02:46:41 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14841054sm86827285ad.3.2026.09.10.02.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:46:41 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 3/8] ntfs: write MFT mirror data in mapped I/O units
Date: Thu, 10 Sep 2026 18:46:05 +0900
Message-ID: <20260910-fix-4kn-lkml-series-v2-v1-3-f10a09fc0176@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910-fix-4kn-lkml-series-v2-v1-0-f10a09fc0176@gmail.com>
References: <20260910-fix-4kn-lkml-series-v2-v1-0-f10a09fc0176@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7848; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=CczLbAp4/Y09X4t7NtfluxmctRl+3g7cZxTFMEwGVaw=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqonw6RYSaSQcBC5awuMo1dOEzoX4ENJEzKCyro
 21yDES6xkqJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqJ8OgAKCRA08jD6945I
 095XD/9BvlPSZ8nyJdhmPpwFZafs466cQRJGXFNN4TSfOstDoEZpukmngn6rycPO2L/zOW9bl/U
 KZ2gItHgH3uHu5DrOv54N0Vlya8+gnUr6BZW6hnYThXhk8gI1g4PhKkFdYGEyyAcZnX4xIY0Aep
 gjcLPEFzJ23kSygKK5i4T3JXql/Y1KYf3jjpK/EgWOqw443G5ceA0mNdbAPYOr78xNFvfX11qeZ
 DLXUXqRviCth4R5mLywNnTFoGHlmhnp6gNbAPjXZgzE641yUVrsauLtjc9kJ3SrSBbq9HViI0Cu
 QZlH1d7zUX26P+c9/6t/TugkBszZMHQ3PSn76I0maz6+XZ3QtWVvHtPtxjVxwcUEeWFDH3lk1nB
 fvtGpZfC8mu/Zi0VnMS3Mh0sYcPHnPEgE2FEoRvBkaQpZAR6l5ZFArLFDZXyWoU6pB1v5WE/fuS
 82cv/j1L6dsOwcRr+b44f/sL2TuGIn43QCYZV4qFUpT6GeiVnnonB2CyxCyFUkAkpioVBP6qsr2
 PmQ6VBD0RdF+NgyGG5hueJZZWwuGvJCSYMe434kxQzRTOP3+wJ3z/lRZVuQ+8OuAXzRMhMOQVsK
 vXINvIb4qY0Gmz8V7gX+GovxrIsV3zdd9YF7rX7q2FQZ5OppjGy/juYcCogbZ+pJqvij9zRokG2 uvgrk8Zr6CuiBdA==
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
index 19e042474df6..565599d58703 100644
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
+	return ntfs_sync_mft_mirror_unit(vol, source
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

