Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB263D3B3
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 00:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950014; cv=none; b=BrriVeaNZEhNZymDCLhutKCK7+vPFvAb8Qr9Snd3KfWzikAMRIpvdf20NFHHuJ8RKTCSOYL4ygWWGQ/nEAySV9XPsnMCXwkYy5UPfnSfKGjAyGKpIgR1Bis6DySbWS+0Ta/vNW2mnPXAkRY0eRml8KNXOJUvmhOWwQE46QSaDrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950014; c=relaxed/simple;
	bh=T2Cz2OVO1tHo7/utifasBhSnaS2K/prmNjB+AQ4TWUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tV2We7pVAIEcdwCC2cwJi5XD8m1j4Rpkd4+LIR18eqJBO7Ntyec0tVPcPm6gbglKsqZVTiIFoQWAt7MVirMkZ91npiESfjg4gEV+AIaYc/NLPu6l9bsOY3geC52Q97lyVfnNrI6m35FylL+3PLOPVsGfrRQMRi8zIH6CCEz2q48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQw9chZA; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQw9chZA"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87ac7657a24so16892b3a.3
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 17:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950012; x=1790554812; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aj2GirdUCPCqt69A8KYuumXOdCUgFWYJd+haJwi34dg=;
        b=sQw9chZAT9e/ki8AUwzHPP14QiWVO7qk63mV1xO4L8jWFjmqhK1S0L0fcF/YeqWSLd
         1EdE9c7TT7Dkmf3fjlkTws3F3+UaX1HN6DSqn67WYjsHrKS+uH7ahKDHpkAb18Dplm+3
         kzNSur6gGd0+LxvpXQl4q111Yhg/14qPGGlo9M2HLKyQWeELaZyOsCBACU4ACUcHfuBi
         56CLd1CPAWrB2vduY5oEDocouMW4qLqUCxQbeEVvzgGz3631p4MWfv14SSxvst/VBy5q
         rKOkM1fAJ45FDBkQuBHik+T9U00adE20TXLPp4pIa2OcbsgDydGCr7Jmg99EG8DkwFIx
         ju5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950012; x=1790554812;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aj2GirdUCPCqt69A8KYuumXOdCUgFWYJd+haJwi34dg=;
        b=JK0EeV6U4YN19EXKJU5hKbvbfDqWJRqnTkfYQXBb3ltGxkd5NstYK8ka00qpWhMgB5
         3je/BtlqZ6IdSBKuIP3i4sHxue7JYjqSMxKWlzn4ht4RRJ+iWKMF/G+yrBI36Lw1Do4M
         ILSCuX5H7upTqni3Th4AwesIXRT/IxuVrQ45tezevrf1f4b9SCmnVIzrRrA0wka2BX8c
         e0onLRpoGGBprQDa+iXYX8+n8OGr07YI8MEU1tpDxjPY8xv/NQ+i/Cft7zgglbQJAfuI
         jHc0RHVD7Pvu7G1kwPtb2YXSjMZnwqPYM1n6Cjm+x8Mnx348xpTHJNrRtRXMHk5l7JYw
         j82w==
X-Forwarded-Encrypted: i=1; AKwUvBwoO+g1d9CQLDDRehhKkInScEC9jvMPZvDI+rN0q3VhxhBNP8r5Pf4HZLOOYrDCT7BsCh0+@lists.linux.dev
X-Gm-Message-State: AFuF++ninFbN/psHwNlScPu8lnk8HxVDDT9i361TMnZuw/ld8dPv6AuI
	+0BtXCCaC70CouRnEsUUkk0M2XQSFRR2v3zFqSlOmJ8WImBoNqc6hkZH
X-Gm-Gg: AYBFou1Xjtj1j8ESCzoE1AncZ4YsrHYxL2NRVvJpYwdADofdvJgi5V/fE3G83djrLXj
	D3XfWOAvPxZp6i7zVRoq/elaYUpVv0WPRL8yvjqq/zO+SXO3rHFGofQLeWHRbLQuu1qX4V6/Bii
	Pd2UeqJ7J2Io+NBtMLxClqmW1FHNUE/ixBD9grZzbTeIA4S8IwDJ976tQiKeSxXTgqGd7mXvYGL
	+PnV8VPF757342T7+YzYzTRBonk4UBWwH1yUgiP2DNAFF2DB6m9gn6LOP0PDSRuU9iOTMbMKmR/
	vQfzoL2jgHWM/sZ7PH5y4RxHOUo+BS5+/MwPHfFk6LS9ABwhwpHcp8c7qLsrZNVESD4SzAE5hF+
	n5jovIO3lSc16pQW/8WJ39mF3sgxyIjeMZ3Mk+5hBqXSEIowV31nfhrWBXB1b/JI2jqU663gUBs
	G8xltqOD3fsPipM/ZvTYjQV7qcUGP9pxKTUuyWNf6yzHNsQPfN9qyG3svwGVbfiO7L3Ad8A4YMW
	8DnRQlLnc7Ad3RQ
X-Received: by 2002:a05:6a00:1309:b0:878:34d7:699a with SMTP id d2e1a72fcca58-87834d76e1emr5522302b3a.42.1789950011988;
        Sun, 20 Sep 2026 17:20:11 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2289557b3a.21.2026.09.20.17.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 17:20:10 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v5 03/10] ntfs: write MFT mirror data in mapped I/O units
Date: Mon, 21 Sep 2026 09:19:42 +0900
Message-ID: <20260921-topic-4kn-lkml-v5-3-938afe402cd0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
References: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7849; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=T2Cz2OVO1tHo7/utifasBhSnaS2K/prmNjB+AQ4TWUE=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsHfzKaGjdeCQUo4w2hIBTOsMCzHRGuIBKkvIp
 D8i+oTlWruJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarB38wAKCRA08jD6945I
 0//UEACJ8sWV3XGA5zayBDMySRvty1eRSLcrqY6WeI3YBRPhirYGAG2HMrRz3GKLD6uu0KMfGrg
 qQcWhGs6tFNor3Q5zjwaukFGHhCkSv+mweFX/uO1YyzpWeXnfqjB7B8nMs3fcMYapEWjU0cXJM1
 qEEpOBl08jHqo6DsUijHOdGTbsYPAabeMtX5PloachBg3KeZE+evCpKLM9AQZz41sBke5b6Ow8j
 HGYETZ8jTeFHyaZRoYpn0FG1Yu62blmc26BLzDtbFWEom2jZpjSHxh3aWflC0qVAren+xchQXoJ
 wKbf9djrf/UZFyWZ0jJ14Pj+sCa1aDHYkazD4EN4b1qGwGiBo6x5XLzhptFlX8NO6pQwGZd7eef
 XiCy7FVry9X9Mjgdsg5/zHR90G+ZoNKOj2tnSTSUzguEce5WssNl42T7QDcvNqwYoX8sU5g8G1e
 cmIBm3sRscgFZqHXXEAuQ/7s1ier8xJHJ4r6DnhA9EpZz67IbH0lt4RMtJm2Dz9w7+gYzA0hB+S
 XPLns0MVIOgmaxnTfBk11kjDpVfcNBC5s4wPwXjMPY0+FZbGwC1FkmBK6BNRLSL+2SyJHL6AVu2
 UpqVXwpbPZAiSac+EoXB6wESJ2tCFsShvQt0+67VUB3jiVMArFdwrpwLj9RUXUnrNAy4ZB4erIa /ner1EChz7zJwIQ==
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
index c9ea11198aa6..b102e0204eba 100644
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
@@ -3031,8 +3036,7 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
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

