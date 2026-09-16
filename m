Received: from mail-pj2-f23.google.com (mail-pj2-f23.google.com [74.125.227.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39392DF6C
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 01:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520640; cv=none; b=RlQIOJZMvs6xAkuQPF3DGnK0OQTsy7oqQ4jFj0/VwElvscX1auB77yvIPMYFwEzZ474Jq+yDVw8rJhhRdjUXQfcCSOei+iBWGvKuFblB83aBAjWx5iremgAqA01ZsIbS0Oq5jSSITp8sfd181XYSRk0uTJG1BtG0gHMQE2vvsn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520640; c=relaxed/simple;
	bh=ZaV8JzGOVnFiIt4wM9XN1Xr4f4BRWPQncG+3Wy4qt24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AP5IeZ5BRQGxT91EAdHeVOhuHUdMIesazwWloQ/RTp9sx4D6ZTr/g+uUFtL5Or5KrPyFAWAFR4E2TjP5Q6Dym0eJF724GfGSDg2C5ntUwRu/g3xpQLeVI2Lv+sJPtdnAxgC0Qr5J+xuFegQp1HgrZ7qzee/qGrjPRffvgny+Yno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImZ4ZSFo; arc=none smtp.client-ip=74.125.227.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImZ4ZSFo"
Received: by mail-pj2-f23.google.com with SMTP id d9443c01a7336-2d747f066d8so935545ad.1
        for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 18:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520638; x=1790125438; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h92hF7RZovnoczHvpiJQj5EFOHyIVskt1LcTMXHJQC0=;
        b=ImZ4ZSFoMz7HzZqTdtVBi28eG33/BmbFs7Y7S4h+BhLN/ACfKUMXcDNIG1vFHtGRuC
         H/qW5xxvN1Xz+2/b1R9f/ntOYWF8nzI0+i2NpuAwZmZSTHTfLUbCRQrDKSQ2Su3qP3AY
         reDyDb8J6Gj+YCTDTmUjWNfdKpFpIdx9w3Zg6xMRJbPpjFhWN1lrXOrQWI84DOtJZj8A
         R44Zkp/1f1129xdmGsNkUamUNnfkazqdKKU8y41XaQ7YqiOaf6AE0yZwd9Cm3WJBwGH1
         Hj4wWlZi89igA+5wh8TiAynPesJ6DgNAGZPignJANvbUyt/b3Ov3QOJbJOdTK5HXqFpR
         akjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520638; x=1790125438;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h92hF7RZovnoczHvpiJQj5EFOHyIVskt1LcTMXHJQC0=;
        b=RUQfFo0eJjhvEGMW+vGhLquuXof0HYzC5l7b1oipxWpbiH/sGO4sMhNY3nvYLz7hlp
         rwhPG532Vly1KepNPIXtuOnTFmRSONmXUII48tkiguI1mLZJlOyMH+oNfNhMdipl+RSM
         uRpZE/+qfjvJ27J25peznOK6w9dezKEPMUVhQExZGTFvk0K9GS2eXpfdd69X6Rtv/nFP
         STPrgd0gv4DmyR/swERS/qT9e/y64C3saYY3t5DPxFmbCt7U1RhcA8pdCpRFd7d6JYPG
         j76VQGJZPHLTgH75C2MH24B06YogguqO1wrum1zl9+3q7BgUI4N9YPmEQK1tPxKaQ81X
         UB5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwQqUg/q4IJ7w+U+dvbgrOQbELyNyijHIhVAx0Ssv2yQ7OsRPI/LaXVF6bcOsdqo8JulJWU@lists.linux.dev
X-Gm-Message-State: AFuF++kC4RV29DOXgfzNnXyBFosmKpx+ccAu1eOPY0aUaRDRQZBuqGN7
	tkMncga8UsSL/wNmUzfIIpK675lj/1ZqpDH3KeTcOAhY5zRNEYqC6e/EV5qmRA==
X-Gm-Gg: AYBFou0SLsaAvDxxwjIKs5HveSYTSAxkVVB9Js6HK1lqwqzuRyCAGLru02CwZppmhz8
	uI+bXEJjde6HF7qETWwfu7hsagq5/7QC9nUuH7/Dy92beNZT/nC/nLnhqfSADYxvgfl5lcSuhbL
	vb6Gelv7509hLH3N09rL44C4d7B+dercvSYNBfqs7I5tCP5DV+9fE1yM+WNGD9xxvp5rdkUIVcJ
	TNqRWrY5JoJyXe4en3EaLMHw/5mIHmfxgx765c4iJl3HrP87nMiGgjPURHMfv4biukjFvvWMX5s
	mF9pF7eoVlkvqmUYluBaAGB4xhPr09urVVj44qeFzzAeBtXot2TG4tYxtGBmEuNUni8f5vaIQHH
	2PsKLDH8FNnuEuicYmoiEIqRWe0Wfx/b6iL+C1MZTLaUkh50uLtNEPXD7eljmgGl24I1GW37Z62
	uG/rN7tubdwSEsGKBLXXhBJIYtEHtWBOag0KcAc1v+HNk37q+Ed0gl7OZmgjBxIsY2tzZz1pZiJ
	uwHAbYcdMcfHioD
X-Received: by 2002:a17:903:1112:b0:2d3:6cb4:e79e with SMTP id d9443c01a7336-2dd8e8f27b5mr6440355ad.5.1789520638360;
        Tue, 15 Sep 2026 18:03:58 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fff3sm2880995ad.8.2026.09.15.18.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:03:57 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 05/10] ntfs: track direct MFT writes until BIO completion
Date: Wed, 16 Sep 2026 10:03:17 +0900
Message-ID: <20260916-topic-4kn-lkml-v4-5-4f8a574ba3fb@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12159; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=ZaV8JzGOVnFiIt4wM9XN1Xr4f4BRWPQncG+3Wy4qt24=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqqeq28yNdAWvshSNYG8XPaN/MoHByTY+S/F5UZ
 9DYgQhEuDuJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqnqtgAKCRA08jD6945I
 0ysmD/4xFppNH5IYCtazaPGWojZe6wttuvuZetLBrkqxgakwUDr4qU4xLUoJK+t/ym3qoc9Om6R
 xPFTXdEWhmxzvMPEqgJUn1zc7IN0epzPRUboCdUbtXZkp2lPyQct1yPLEm97LYrTCYF6kAzfrF8
 yQ5peBztUAJp07srZ+O6e8ATVY2VcP7/vwNlSCCGsMxcfiPhncEvKaiI5UnoeWWcQobuGiaTmtC
 icvmQDSl3Qqj0AKfBy5oNImXr9nKHfWWAXeWS88D0p5VgZzbkUhi7URl7melOVcyRhB+aM8hyeJ
 qddti4mvJA2cOKgFZXPbvcH3RCDVcz5EWXgLXyWlrvya5KWPlbQN6nl0SK7TzXRXdsNVjIb5mdu
 FQah5XTGEqskA795zsMyzsQzA83xDEeAvxjDUV6IxY/nlxWxKqFOIvCdlgFw38CmN3vBuAMW8qb
 jF3Xjk0XeYmWPVpad84CCJdJt8myhqxzjrqRE9Zt83n3u6UEWKYy4KObhEeemDzlR7p5QXdvMNE
 msvMC8XbiYyxiCnQljv/E4cNZxzOZ7lcKmCH/nJikwOTwhQHCiNiJ1SICSsL18aHdUODdpAz3yU
 wbGCCK5EY69e6J5M/9OXxlEzzQztMkb1iPG1pxgKr6ASRibn9C7Z3FmKYusKjVmt+lfCwv1BVjQ j/zYuBLEGW5XrEA==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Use an aggregate parent BIO, with optional chained child BIOs, for direct
MFT record writes. Keep the folio reference and PG_writeback set until all
physical segments complete.

For asynchronous writes, release the parent BIO embedded in the write
context before ending folio writeback. Synchronous callers retain ownership
of the parent BIO after waiting.

Wait for any prior folio writeback before modifying a direct MFT record.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/mft.c   | 236 ++++++++++++++++++++++++++++++++++++++++++++------------
 fs/ntfs/mft.h   |  15 ++--
 fs/ntfs/super.c |  10 +++
 3 files changed, 206 insertions(+), 55 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 75945f89cd0c..a11b1a5432b2 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -10,6 +10,7 @@
 
 #include <linux/writeback.h>
 #include <linux/bio.h>
+#include <linux/completion.h>
 #include <linux/iomap.h>
 
 #include "bitmap.h"
@@ -450,6 +451,91 @@ static void ntfs_bio_end_io(struct bio *bio)
 	bio_put(bio);
 }
 
+struct ntfs_mft_write_ctx {
+	struct folio *folio;
+	struct address_space *mapping;
+	struct ntfs_volume *vol;
+	struct completion *done;
+	int error;
+	bool writeback_started;
+	struct bio bio;
+};
+
+static struct bio_set ntfs_mft_bioset;
+
+int ntfs_mft_bioset_init(void)
+{
+	return bioset_init(&ntfs_mft_bioset, BIO_POOL_SIZE,
+			   offsetof(struct ntfs_mft_write_ctx, bio),
+			   BIOSET_NEED_BVECS);
+}
+
+void ntfs_mft_bioset_exit(void)
+{
+	bioset_exit(&ntfs_mft_bioset);
+}
+
+static void ntfs_mft_end_io(struct bio *bio)
+{
+	struct ntfs_mft_write_ctx *ctx =
+		container_of(bio, struct ntfs_mft_write_ctx, bio);
+	struct folio *folio = ctx->folio;
+	struct completion *done = ctx->done;
+	int err;
+
+	if (bio->bi_status)
+		err = blk_status_to_errno(bio->bi_status);
+	else
+		err = ctx->error;
+	if (err) {
+		mapping_set_error(ctx->mapping, err);
+		NVolSetErrors(ctx->vol);
+		ntfs_error(ctx->vol->sb, "I/O error while writing MFT: %d",
+			   err);
+	}
+
+	if (!done)
+		bio_put(bio);
+	folio_end_writeback(folio);
+	folio_put(folio);
+	if (done)
+		complete(done);
+}
+
+static void ntfs_start_mft_writeback(struct ntfs_mft_write_ctx *ctx)
+{
+	if (ctx->writeback_started)
+		return;
+
+	inode_attach_wb(ctx->mapping->host, NULL);
+	folio_get(ctx->folio);
+	folio_start_writeback(ctx->folio);
+	ctx->writeback_started = true;
+}
+
+static struct bio *ntfs_alloc_mft_parent_bio(struct ntfs_volume *vol,
+					     struct folio *folio,
+					     struct completion *done)
+{
+	struct ntfs_mft_write_ctx *ctx;
+	struct bio *parent;
+
+	parent = bio_alloc_bioset(vol->sb->s_bdev, 1, REQ_OP_WRITE, GFP_NOIO,
+				  &ntfs_mft_bioset);
+	if (!parent)
+		return NULL;
+
+	ctx = container_of(parent, struct ntfs_mft_write_ctx, bio);
+	ctx->folio = folio;
+	ctx->mapping = folio->mapping;
+	ctx->vol = vol;
+	ctx->done = done;
+	ctx->error = 0;
+	ctx->writeback_started = false;
+	parent->bi_end_io = ntfs_mft_end_io;
+	return parent;
+}
+
 /*
  * Write one MFT I/O unit to $MFTMirr.  The source folio contains the MST
  * protected image that will be written to $MFT.
@@ -533,6 +619,42 @@ static int ntfs_sync_mft_mirror_record(struct ntfs_volume *vol,
 					 (u64)mft_no * vol->mft_record_size, &unit);
 }
 
+static int ntfs_prepare_mft_record_io_units(struct ntfs_inode *ni,
+					    struct ntfs_mft_io_unit units[2])
+{
+	struct ntfs_volume *vol = ni->vol;
+	u64 record_byte = (u64)ni->mft_no * vol->mft_record_size;
+	u64 disk_byte;
+	unsigned int nr_units = ni->mft_lcn_count;
+	unsigned int cluster_ofs;
+	unsigned int i;
+
+	if (!nr_units || nr_units > ARRAY_SIZE(ni->mft_lcn))
+		return -EIO;
+	for (i = 0; i < nr_units; i++)
+		if (ni->mft_lcn[i] < 0)
+			return -EIO;
+
+	cluster_ofs = ntfs_bytes_to_cluster_off(vol, record_byte);
+	disk_byte = NTFS_CLU_TO_B(vol, ni->mft_lcn[0]) + cluster_ofs;
+	units[0] = (struct ntfs_mft_io_unit){
+		.sector = ntfs_bytes_to_bio_sector(disk_byte),
+		.folio_ofs = ni->folio_ofs,
+		.len = vol->mft_record_size,
+	};
+	if (nr_units == 1)
+		return 1;
+
+	units[0].len = vol->cluster_size;
+	disk_byte = NTFS_CLU_TO_B(vol, ni->mft_lcn[1]);
+	units[1] = (struct ntfs_mft_io_unit){
+		.sector = ntfs_bytes_to_bio_sector(disk_byte),
+		.folio_ofs = ni->folio_ofs + vol->cluster_size,
+		.len = vol->mft_record_size - vol->cluster_size,
+	};
+	return 2;
+}
+
 /*
  * write_mft_record_nolock - write out a mapped (extent) mft record
  * @ni:		ntfs inode describing the mapped (extent) mft record
@@ -553,17 +675,23 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 {
 	struct ntfs_volume *vol = ni->vol;
 	struct folio *folio = ni->folio;
-	int err = 0, i = 0;
+	DECLARE_COMPLETION_ONSTACK(done);
+	struct ntfs_mft_io_unit units[2];
+	struct ntfs_mft_write_ctx *ctx;
+	struct bio *parent, *child = NULL;
+	unsigned int nr_units;
+	int err = 0;
 	u8 *kaddr;
 	struct mft_record *fixup_m;
-	struct bio *bio;
-	unsigned int offset = 0, folio_size;
 
 	ntfs_debug("Entering for inode 0x%llx.", ni->mft_no);
 
 	WARN_ON(NInoAttr(ni));
 	WARN_ON(!folio_test_locked(folio));
 
+	if (folio_test_writeback(folio))
+		folio_wait_writeback(folio);
+
 	/*
 	 * If the struct ntfs_inode is clean no need to do anything.  If it is dirty,
 	 * mark it as clean now so that it can be redirtied later on if needed.
@@ -573,6 +701,11 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 	if (!NInoTestClearDirty(ni))
 		goto done;
 
+	err = ntfs_prepare_mft_record_io_units(ni, units);
+	if (err < 0)
+		goto err_out;
+	nr_units = err;
+
 	kaddr = kmap_local_folio(folio, 0);
 	fixup_m = (struct mft_record *)(kaddr + ni->folio_ofs);
 	memcpy(fixup_m, m, vol->mft_record_size);
@@ -584,69 +717,74 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 		goto unmap_err_out;
 	}
 
-	folio_size = vol->mft_record_size / ni->mft_lcn_count;
-	while (i < ni->mft_lcn_count) {
-		unsigned int clu_off;
-
-		clu_off = (unsigned int)((s64)ni->mft_no * vol->mft_record_size + offset) &
-			vol->cluster_size_mask;
-
-		bio = bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRITE, GFP_NOIO);
-		bio->bi_iter.bi_sector =
-			ntfs_bytes_to_bio_sector(NTFS_CLU_TO_B(vol, ni->mft_lcn[i]) +
-						 clu_off);
+	parent = ntfs_alloc_mft_parent_bio(vol, folio, sync ? &done : NULL);
+	if (!parent) {
+		err = -ENOMEM;
+		goto unmap_err_out;
+	}
+	ctx = container_of(parent, struct ntfs_mft_write_ctx, bio);
 
-		if (!bio_add_folio(bio, folio, folio_size,
-				   ni->folio_ofs + offset)) {
-			err = -EIO;
-			goto put_bio_out;
+	parent->bi_iter.bi_sector = units[0].sector;
+	if (!bio_add_folio(parent, folio, units[0].len, units[0].folio_ofs)) {
+		err = -EIO;
+		goto put_bios_out;
+	}
+
+	if (nr_units == 2) {
+		if (bio_end_sector(parent) != units[1].sector ||
+		    !bio_add_folio(parent, folio, units[1].len,
+				   units[1].folio_ofs)) {
+			child = bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRITE,
+					  GFP_NOIO);
+			if (!child) {
+				err = -ENOMEM;
+				goto put_bios_out;
+			}
+			child->bi_iter.bi_sector = units[1].sector;
+			if (!bio_add_folio(child, folio, units[1].len,
+					   units[1].folio_ofs)) {
+				err = -EIO;
+				goto put_bios_out;
+			}
 		}
+	}
 
-		/* Synchronize the mft mirror now if not @sync. */
-		if (!sync && ni->mft_no < vol->mftmirr_size) {
-			int sub_err = ntfs_sync_mft_mirror_record(vol, folio,
-								  ni->mft_no);
-			if (unlikely(sub_err) && !err)
-				err = sub_err;
-		}
+	if (ni->mft_no < vol->mftmirr_size) {
+		err = ntfs_sync_mft_mirror_record(vol, folio, ni->mft_no);
+		if (err)
+			ctx->error = err;
+	}
 
-		if (sync) {
-			int sub_err = submit_bio_wait(bio);
+	kunmap_local(kaddr);
 
-			bio_put(bio);
-			if (unlikely(sub_err) && !err)
-				err = sub_err;
-		} else {
-			folio_get(folio);
-			bio->bi_private = folio;
-			bio->bi_end_io = ntfs_bio_end_io;
-			submit_bio(bio);
-		}
-		offset += vol->cluster_size;
-		i++;
+	ntfs_start_mft_writeback(ctx);
+	if (child) {
+		bio_chain(child, parent);
+		submit_bio(child);
 	}
+	submit_bio(parent);
 
-	/* If @sync, now synchronize the mft mirror. */
-	if (sync && ni->mft_no < vol->mftmirr_size) {
-		int sub_err =
-			ntfs_sync_mft_mirror_record(vol, folio, ni->mft_no);
-
-		if (unlikely(sub_err) && !err)
-			err = sub_err;
+	if (sync) {
+		wait_for_completion(&done);
+		if (!err && parent->bi_status)
+			err = blk_status_to_errno(parent->bi_status);
+		bio_put(parent);
 	}
-	kunmap_local(kaddr);
+
 	if (unlikely(err)) {
 		/* I/O error during writing.  This is really bad! */
 		ntfs_error(vol->sb,
 			"I/O error while writing mft record 0x%llx!  Marking base inode as bad.  You should unmount the volume and run chkdsk.",
 			ni->mft_no);
-		goto err_out;
+		return err;
 	}
 done:
 	ntfs_debug("Done.");
 	return 0;
-put_bio_out:
-	bio_put(bio);
+put_bios_out:
+	if (child)
+		bio_put(child);
+	bio_put(parent);
 unmap_err_out:
 	kunmap_local(kaddr);
 err_out:
diff --git a/fs/ntfs/mft.h b/fs/ntfs/mft.h
index eb8a6f0d7944..28a79bf4c1c6 100644
--- a/fs/ntfs/mft.h
+++ b/fs/ntfs/mft.h
@@ -42,6 +42,8 @@ static inline void mark_mft_record_dirty(struct ntfs_inode *ni)
 		__mark_mft_record_dirty(ni);
 }
 
+int ntfs_mft_bioset_init(void);
+void ntfs_mft_bioset_exit(void);
 int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int sync);
 
 /*
@@ -51,16 +53,17 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
  * @sync:	if true, wait for i/o completion
  *
  * This is just a wrapper for write_mft_record_nolock() (see mft.c), which
- * locks the page for the duration of the write.  This ensures that there are
- * no race conditions between writing the mft record via the dirty inode code
- * paths and via the page cache write back code paths or between writing
- * neighbouring mft records residing in the same page.
+ * locks the folio for the duration of the write.  The folio lock prevents
+ * races between writing the mft record via the dirty inode code paths and via
+ * page cache writeback or between neighbouring mft records residing in the
+ * same folio.
  *
  * Locking the page also serializes us against ->read_folio() if the page is not
  * uptodate.
  *
- * On success, clean the mft record and return 0.  On error, leave the mft
- * record dirty and return -errno.
+ * On success, clean the mft record and return 0.  On allocation failure,
+ * redirty the record for retry and return 0.  On other errors, return -errno
+ * and mark the volume with errors.
  */
 static inline int write_mft_record(struct ntfs_inode *ni, struct mft_record *m, int sync)
 {
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 062302ed0234..b8bb2268e609 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -18,6 +18,7 @@
 #include "sysctl.h"
 #include "logfile.h"
 #include "index.h"
+#include "mft.h"
 #include "ntfs.h"
 #include "ea.h"
 #include "volume.h"
@@ -2681,6 +2682,13 @@ static int __init init_ntfs_fs(void)
 		return err;
 	}
 
+	err = ntfs_mft_bioset_init();
+	if (err) {
+		pr_crit("Failed to initialize NTFS MFT bioset!\n");
+		ntfs_workqueue_destroy();
+		return err;
+	}
+
 	ntfs_index_ctx_cache = kmem_cache_create(ntfs_index_ctx_cache_name,
 			sizeof(struct ntfs_index_context), 0 /* offset */,
 			SLAB_HWCACHE_ALIGN, NULL /* ctor */);
@@ -2748,6 +2756,7 @@ static int __init init_ntfs_fs(void)
 actx_err_out:
 	kmem_cache_destroy(ntfs_index_ctx_cache);
 ictx_err_out:
+	ntfs_mft_bioset_exit();
 	if (!err) {
 		pr_crit("Aborting NTFS filesystem driver registration...\n");
 		err = -ENOMEM;
@@ -2766,6 +2775,7 @@ static void __exit exit_ntfs_fs(void)
 	 * destroy cache.
 	 */
 	rcu_barrier();
+	ntfs_mft_bioset_exit();
 #ifdef CONFIG_NTFS_FS_WOF_COMPRESSION
 	ntfs_wof_free_workspaces();
 #endif

-- 
2.43.0

