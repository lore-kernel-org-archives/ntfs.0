Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E62724B28
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 00:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950021; cv=none; b=JKnL7pbSCpS7O2xpTpRWi1uKBz1Sp0BtDEkrI4ZfshPFpEtHD2/ENKtPYg6xZHXX1tE3cWmVe0bW7/ZsZMWSareKu25unij/dMAV7z6Q5H5uG4lY8k74zcqKXdyjutGXm0IVO7gghiiI2MyhOA0IVbC5Fn7/T7nAAXfq1Smue9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950021; c=relaxed/simple;
	bh=2mIG60j2Lh8RraLgDPAz6Hm0rcNd/PygpNYWyupbl9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=slK8CWaMM0jQCPslJi9zYZ+RsbJFEk+2iACbBVYhj+ebhVnSgxIpRBpheqhqRnPcg/2PGQOPqcpT8h7KIXgrp3dy49ldoJXmCYLmojKcxFaL6oaHJOPS2PrxUdmI+jOy/GuyE3piC8V/rA1QiQyCxFFhoIMZ07OAFKR1kDvCnhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyF7Ki+y; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyF7Ki+y"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8674704dab1so3474537b3a.2
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 17:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950019; x=1790554819; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N1tKV7K9AitESn5igAYDaeT/IahfzswxXd+QKEGICp0=;
        b=gyF7Ki+yiYRJ5bJjRfdM5Vuq31Le5cL1sP/8B0qo+pUFEEQg1J/5xdN1+sshgufD12
         ewcVEFV1m3TKZUphHg9HwhHlkwTE0gT/drilbiPIXWp8NNx6qP27J2uYPtUnaF7Y9LW6
         8vqQgZyR5aLsVf6+aRmpU9OxC7KNGayIkiOQ5vwxrZIwQcNTTx07ub4lS9pXOmqP5zXo
         pLn+KbRj/AFExgyPBSpkVNFl8XxTt1KmLhhy4vPUjqn4I6lOzUx1miUoXKgL/u/j3M0h
         OSSXBg2KeqzgQgfazuQouKCEZaEvuUVjcARBu053aj3ym7O0yXYkrwqbWpJqB1qs+uhk
         lMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950019; x=1790554819;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1tKV7K9AitESn5igAYDaeT/IahfzswxXd+QKEGICp0=;
        b=EXVYLwDejibYjVqCspjo0hgJ6tcRJW5jvm+EstYU1L826RRZdUik8oDTsZqld3KNRC
         VM/DaWUN+hrwW+xWBxvNX9vrvp1Viz8mBwL0l/0Ipxz8B/he92SfoS76XMOLFuRfTXfb
         x86NFUW/OmB+1EbpU56xr1DyKJeGLDMgRvSQrV5E420ae5WF7gnmveIWduWYk6eiUPCY
         WSsgDles1CH5iKZAI/6EMkEq+hNoA1oijR+4ih49MFHwFkUVVYKmlH623xGUbXZKhu9V
         W0NtrfvrJe2gfuqKf2oS+w1rvkONlcb3SSACyx2LjR8eNm1KMQzxTFHgNK56JMsYX3gB
         Yuew==
X-Forwarded-Encrypted: i=1; AKwUvBwoUGBKvZuatdMQpXyzmhqTbOk0A6kJaW/AGTklaz0wA+oSX7RamwuaBC8+cvCcN7+BnCZw@lists.linux.dev
X-Gm-Message-State: AFuF++lxLkMV7rNtNAd3H8zQ9DhtsOkiGMUh79uWUuP7veBiAkzxzDNe
	fBnRbLUR6AwHwmidnuOzhQKHH3vQZ4L3e/Y1QfAqWok+AenQgvnbb8Jv
X-Gm-Gg: AYBFou1XiWan7ScoLtbuxhaM9n+1Jin1uVB7l8oB8yqHDfLG3wwd9AC+AWdeSdeQmLq
	/IJErRrgF3tndVWepNbQgj3Ujx5nL7WTlaXcAhxIpZIH5B+GRxcb7HDZceeL+zvB9B5GewibDBe
	BEElLVmXJmV95yVNbS8I/SuQA8Id3ogDhvaKvksAcStr1yF84V7pvL2uVJJbD12WBt5qhEne+HA
	Kqvum5ghCqgxKBji32/pD+W236JYkhahrZMTs07fL2Z/ufW4vAj6Xf01NFL9pkXb25o8q5Evxj+
	fbGPRCXy7jlawsmPefvK3H/MOZLgIahl2nMNc83K7AE0sQUTczML9i3WotxnDWKYzAjAa7SRuSK
	SbC/t7y8iSx4Bo9YvSO5fjKFqr8Ki/RpcInNnrg768uuZoKxjq32UsQHcBcGVrS3sXHiuSbkZj4
	BTMFHVFPZvWyfFn6qcTcsUAxCv8TOLTKDebceImrqcHIw+UoXZjHDQlTld+PobaMzXdxh11ByT/
	YN9eQ==
X-Received: by 2002:a05:6a00:2d1e:b0:878:34d7:6a34 with SMTP id d2e1a72fcca58-87834d76ed2mr5872813b3a.40.1789950019400;
        Sun, 20 Sep 2026 17:20:19 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2289557b3a.21.2026.09.20.17.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 17:20:17 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v5 05/10] ntfs: track direct MFT writes until BIO completion
Date: Mon, 21 Sep 2026 09:19:44 +0900
Message-ID: <20260921-topic-4kn-lkml-v5-5-938afe402cd0@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12159; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=2mIG60j2Lh8RraLgDPAz6Hm0rcNd/PygpNYWyupbl9g=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsHf0rzkkc4BbHx64I2IjsCOTQ1TdEHYbIJTzL
 sxM9FWPOpSJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarB39AAKCRA08jD6945I
 03O2D/0cP9V3tnBBjxoziyTx2ilcsuehNBEeBkRvKFMZAnU1KQ1wNVmCz5JRzz6NNVd3yrgXxtG
 vGWaPpeiByXuShhADSW0fR19EqOeOPeLG3v34Ez8e19yjU/44FNt0m6lZkkPQQrk+FGabV0Zoi2
 ZugvQnobY1gnQhX8tTxNHrcXWGx+SYBNE1pzqqx1Oaxq1tjVILQ65XmfiZYo4zfBPiCSTyDXikm
 b5KRpdghADXA+REHBArYQr8KiqpvhyQc89/BDhMPxJ9vxCCH68QHIwqzqkUhPwtf+RJS0hLRPdk
 HJLg+p96k+gYYsViSHogdSfDXJ+7t7DVT74Qs5nNHxl14N1d4Qam+PpMAyEJ+mxgUOftsgYEoLH
 BURrpQmHnRcGy+t2TX+XkwkpG3yyoc7eeno2EkRfesyZrgOinpr/bqzJw5A9jpHSMjMEUFzdl6D
 WN17owjimDE2xnCcdTJWtqnz104Y0EgFTnj1THyCcl3BlEj16Avt8sYHDwrz+4ZRici4JEV29ci
 IvQcbXBXriDxiPzuVMOEWygr5IKYn6yxTkYo4UWsH8OECuWeYf7emqAA6sFNbiAUW2ybjQ4rkzm
 wEEtLHaxOezt59LJMscTLmNUe2WXluxCs6cKsT9No8YEkbdxCK/yHwzrCCBSYOhCjdf1uXKNh2E kDzivK7gQOsCavA==
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
index c7577c322454..51066b403757 100644
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
index 1b66efbd3990..6a107ec0d0f6 100644
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
@@ -2850,6 +2851,13 @@ static int __init init_ntfs_fs(void)
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
@@ -2917,6 +2925,7 @@ static int __init init_ntfs_fs(void)
 actx_err_out:
 	kmem_cache_destroy(ntfs_index_ctx_cache);
 ictx_err_out:
+	ntfs_mft_bioset_exit();
 	if (!err) {
 		pr_crit("Aborting NTFS filesystem driver registration...\n");
 		err = -ENOMEM;
@@ -2935,6 +2944,7 @@ static void __exit exit_ntfs_fs(void)
 	 * destroy cache.
 	 */
 	rcu_barrier();
+	ntfs_mft_bioset_exit();
 #ifdef CONFIG_NTFS_FS_WOF_COMPRESSION
 	ntfs_wof_free_workspaces();
 #endif

-- 
2.43.0

