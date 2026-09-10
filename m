Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A343E1701
	for <ntfs@lists.linux.dev>; Thu, 10 Sep 2026 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033617; cv=none; b=UJx4csW0NxrGIIcdLywdgA1YprH1CHATZBc9/HrBS7/tLLrsBxv3D8xnh0x8cbAqBlJhbZ1xXeDBoUEfI+lV7hJW+mJ0RyaDS+TkYdCn4KAcp29TlcbkF6SRQkGVtOgTfjplUWZPQ9304zGGHazkhrNsA7jP1zSqUiKUWKjNzqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033617; c=relaxed/simple;
	bh=qwh9gc+R851ILOXHds00M9q1xw3Tv/H5JQzL1fggeK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CLofkJyFFeydosSayNaEDnnCwXB9lcgSJegcsKLd9NoVV6P9l6fsjIpmxUYHV7aMbHVlqjZURu4pb8OTdvP3+CI7nobO/OsO6nfi2A4mc2kvSeqCUC0BX5zZBBGr8OWZLs0xhbgs1w5sKcQ5S16mn/kG76QpP2LXo1EC2qIyJFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oM4Mb/Lk; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oM4Mb/Lk"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so53292655ad.1
        for <ntfs@lists.linux.dev>; Thu, 10 Sep 2026 02:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789033609; x=1789638409; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=28QdaCsLoVR95KNGz99pDYquImFqEER6j3nZif9i//0=;
        b=oM4Mb/Lk7HdBBC5bbMs/uMliU2P0Ryn7erNrjNiuUKunLjj36TVBD2YQ/2Xclv5HY8
         fgAdO9B8g4uIr7ccKYq48Fl4JOL2Yah6KnDZs2RPHXYmenzpkE6l+ieW1DQJUtSsKf6s
         YHQuc/Q/6hP3QsggK9r3nQorzdmYKC8DT5XYPl7Fl6/avvWYfHqoWtX0IusiidkyYSpz
         pvZXoOKoUd91mVTb7rbj6qmHRLgraNCCBtXZuE25XOBYMKfgMGW5n5V1khpCWmaOKg0a
         QyBIU/76lBdJQBUA1QE0F35j1mPeDHaYBRtVPwIq3fqcZ2MzmAYZBYrvnNZdm3MhETIi
         P8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033609; x=1789638409;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=28QdaCsLoVR95KNGz99pDYquImFqEER6j3nZif9i//0=;
        b=rJvOa+dtnQtEOxKIFSNxHKuoYe859DH6kCJkVncswQn1DVvFxAgIJ4/iDxbHV78DGZ
         jnuX4yYFOA8ZxT4V9BjMcXUf+jVCztmuZoaQ5+8HsMVpKAi4YJhognLfZ6yjqKSI9Izq
         mXxfotdzbanZW0Cbek+Y+dz0BCoe9FGF5nCLyv8wB1KTCsNnMGavsZbDAG02RSGfSr9P
         FYkJGMnFr2pcgxmCAp5GrRnpOC61xmWzgGSCGtodQRPCcEo8DUL/2nRn6WcIsjt/kc0g
         1FIgqZxWM86uAGnz7px5f356MQ72VpY1hlOVPa8Gjo4NqRjFioWlgY2I6QDBPEAp7dKh
         r1qg==
X-Forwarded-Encrypted: i=1; AKwUvBw9hjnq+tdf6ZCy8c0r0ac/kqexs9LL0l6/CpgzEtsr3mAnpgYnJDQtx1AN81Tmv+MNCklW@lists.linux.dev
X-Gm-Message-State: AFuF++nx4M31re8KdxckV09/a5hWqObHE3cSPirYV/wfmbpEEQF61MAx
	fidh0SI5akSk+5rSnKwcX/5hoAQ4Ni9iRQWgYIVBWxj39/UkhxUj82za
X-Gm-Gg: AYBFou2e6TvCBZGtjr86OUd1gHZuXM5Fb1bOJNWLFEfiBhHJeheQ8hMLWP9p41j2FHY
	0x5L9FqP1CuLfBObPN3lGBoFBlaZTdoFAV3UYVfpKcP8WvjbxlO7s3O3Q58XQiQhTpmAhcmQzLK
	NZPhRoOSJ61r+Op9MZ/HOk8VzTkDMmGpo6ItxKsG0XGey5y6s1BTWKg6LO79+lf/ipgxvkY0esx
	ERXTgM9MzNMC4K8ihM8g5JiQVAoXwv+9UtiYywx6kzTNvMR2UkKqFU5GUkB+60e0M51FxXWOsoh
	oz0l0dQOotvSX1jCLEb0D6CQkvAKuYepm0vuT07AvHLO3w5Olo+6T52Pt6fRc9CbkEqCGKRdqDm
	hyjzv29ASOji3x6nMER/7OFmF6rLHh+xi338oQRx10YpEYZNH/SGVidBmLyl7oIFpnOXdS0dpQj
	60AObvqO1qHekuTumkU1v6EVcOaEnxAsoGZeXbeCFkOB0O9TwajpN/LAqxIRBWLJfJIcTfEgutP
	KWCt2U=
X-Received: by 2002:a17:903:324e:b0:2d9:484:861d with SMTP id d9443c01a7336-2db12599ad4mr570473925ad.10.1789033608724;
        Thu, 10 Sep 2026 02:46:48 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14841054sm86827285ad.3.2026.09.10.02.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:46:48 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 6/8] ntfs: write MFT folios through mapped I/O units
Date: Thu, 10 Sep 2026 18:46:08 +0900
Message-ID: <20260910-fix-4kn-lkml-series-v2-v1-6-f10a09fc0176@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19215; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=qwh9gc+R851ILOXHds00M9q1xw3Tv/H5JQzL1fggeK4=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqonw7U6FSYVq0W66ndWaU9ZHmee5ttW1npWj/8
 sT64LX8QcOJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqJ8OwAKCRA08jD6945I
 03X1D/9D7s/e1DLeV+ceHvHKC7Eiuqh1VXzVl8Qm9seqJsIRNe0dVMMdWkEUX/WU/jVc9Y1VvP0
 hKl22PZMZ29FJOBhdojWChrFeytL7K/gGeRCSusmT2dJFEBZxw57OZ23xOPK3LpRD17uXNIAiOr
 IUMasdHQrib5d7AzW/TrFm6ZaRpRDKQqJbth3B7dtE1RjiFrL/rsNfSyTip6TQ7ftSJCXyfkaij
 TYUjMkr97RlQPwz9n5TkCYK5X9zFHyH5IUAYYp2gDKl27IVAQV5FracAPJBMEmzHUpJ4vvoSkHh
 UPmLKPgHP/GwQxoLe0n5NB3z9iUIWprX+OyX1plF9auCPJuD572FT8PCRmuqZbdxJHtuFJGdqh1
 QBSOsmacOWqRIpkq0d4OflO02TR7T3YXOruEWmLt/QylRG8irzoni7yJ8JeXd4WenVlvoj9+/0Q
 n7gYJsS0Tn7hrCuKpxaTWWKIr/8yBPAWiT9aNSL4XRt2V9Ggnpz7I9PAsjTlB+guwGzpkv2wauQ
 Q5WbgAfngSkrfsJDetJndACLPayITvD0Ui8U6zAlGiAC0/cbz+rjPKniwpw5OItRx6ybBCZqTcO
 S82Y47wDZmpKFHles9lUt9ZAK/nlO6bawkKG7GRzA2sjRuhPieH4YDnNZtnwzyjWNk3csvdz9L8 BMl+XVX6exbmwFw==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Replace the legacy MFT folio writeback loop with a mapped I/O-unit
writeback path. Map the I/O units covering selected records under the
runlist lock and submit them through an aggregate parent BIO with optional
chained child BIOs.

Defer transient mapping failures, preserve partial-progress redirty
semantics, and complete folio writeback from aggregate parent completion.

Do not set defer for records that generic writeback does not own. Dirty
FILE records remain under direct inode writeback; other rejected records
and the special $MFT extent are skipped rather than treated as transient
failures.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/mft.c | 484 +++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 291 insertions(+), 193 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index ca87bbe33064..16e0ad5439db 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -10,6 +10,7 @@
 
 #include <linux/writeback.h>
 #include <linux/bio.h>
+#include <linux/blkdev.h>
 #include <linux/completion.h>
 #include <linux/iomap.h>
 
@@ -436,21 +437,6 @@ struct ntfs_mft_io_unit {
 	unsigned int len;
 };
 
-/*
- * ntfs_bio_end_io - bio completion callback for MFT record writes
- *
- * Decrements the folio reference count that was incremented before
- * submit_bio(). This prevents a race condition where umount could
- * evict the inode and release the folio while I/O is still in flight,
- * potentially causing data corruption or use-after-free.
- */
-static void ntfs_bio_end_io(struct bio *bio)
-{
-	if (bio->bi_private)
-		folio_put((struct folio *)bio->bi_private);
-	bio_put(bio);
-}
-
 struct ntfs_mft_write_ctx {
 	struct folio *folio;
 	struct address_space *mapping;
@@ -584,8 +570,8 @@ static int ntfs_sync_mft_mirror_unit(struct ntfs_volume *vol,
 	kunmap_local(src);
 
 	bio_init(&bio, vol->sb->s_bdev, &bvec, 1, REQ_OP_WRITE);
-	bio.bi_iter.bi_sector = ntfs_bytes_to_bio_sector(NTFS_CLU_TO_B(vol, vol->mftmirr_lcn) +
-							 mirror_file_ofs);
+	bio.bi_iter.bi_sector = ntfs_bytes_to_bio_sector(
+		NTFS_CLU_TO_B(vol, vol->mftmirr_lcn) + mirror_file_ofs);
 	if (!bio_add_folio(&bio, mirror, unit->len, mirror_ofs))
 		err = -EIO;
 	else
@@ -615,8 +601,8 @@ static int ntfs_sync_mft_mirror_record(struct ntfs_volume *vol,
 		.len = vol->mft_record_size,
 	};
 
-	return ntfs_sync_mft_mirror_unit(vol, source
-					 (u64)mft_no * vol->mft_record_size, &unit);
+	return ntfs_sync_mft_mirror_unit(
+		vol, source, (u64)mft_no * vol->mft_record_size, &unit);
 }
 
 static int ntfs_prepare_mft_record_io_units(struct ntfs_inode *ni,
@@ -857,7 +843,8 @@ static int ntfs_test_inode_wb(struct inode *vi, u64 ino, void *data)
  * it in @ref_vi instead of calling iput() directly.  The caller must call
  * iput() on @ref_vi after releasing the folio lock.
  *
- * Return 'true' if the mft record may be written out and 'false' if not.
+ * Return 'true' if the mft record may be written out by this path and 'false'
+ * if direct inode writeback owns it.
  *
  * The caller has locked the page and cleared the uptodate flag on it which
  * means that we can safely write out any dirty mft records that do not have
@@ -954,9 +941,10 @@ static bool ntfs_may_write_mft_record(struct ntfs_volume *vol, const u64 mft_no,
 				mft_no);
 		/*
 		 * The write has to occur while we hold the mft record lock so
-		 * return the locked ntfs inode.
+		 * return the locked ntfs inode and its vfs inode reference.
 		 */
 		*locked_ni = ni;
+		*ref_vi = vi;
 		return true;
 	}
 	ntfs_debug("Inode 0x%llx is not in icache.", mft_no);
@@ -3001,19 +2989,141 @@ int ntfs_mft_record_free(struct ntfs_volume *vol, struct ntfs_inode *ni)
 	return err;
 }
 
-static s64 lcn_from_index(struct ntfs_volume *vol, struct ntfs_inode *ni,
-		unsigned long index)
+static bool ntfs_add_mft_io_unit(struct bio *bio, struct folio *folio,
+				 const struct ntfs_mft_io_unit *unit)
 {
-	s64 vcn;
-	s64 lcn;
+	if (!bio->bi_iter.bi_size)
+		bio->bi_iter.bi_sector = unit->sector;
+	else if (bio_end_sector(bio) != unit->sector)
+		return false;
+
+	return bio_add_folio(bio, folio, unit->len, unit->folio_ofs);
+}
+
+static void ntfs_release_mft_write_refs(struct ntfs_inode **locked_nis,
+					unsigned int nr_locked_nis,
+					struct inode **ref_inos,
+					unsigned int nr_ref_inos)
+{
+	while (nr_locked_nis-- > 0) {
+		struct ntfs_inode *tni = locked_nis[nr_locked_nis];
+
+		mutex_unlock(&tni->mrec_lock);
+		atomic_dec(&tni->count);
+	}
+
+	while (nr_ref_inos-- > 0)
+		iput(ref_inos[nr_ref_inos]);
+}
+
+static int ntfs_map_mft_io_locked(struct ntfs_inode *ni, u64 folio_byte,
+				  struct ntfs_mft_io_unit *unit)
+{
+	struct ntfs_volume *vol = ni->vol;
+	u64 file_ofs = folio_byte + unit->folio_ofs;
+	s64 vcn, lcn;
+
+	lockdep_assert_held(&ni->runlist.lock);
+	if (!ni->runlist.rl)
+		return -EIO;
+
+	vcn = ntfs_bytes_to_cluster(vol, file_ofs);
+	/*
+	 * $MFT is fully mapped at mount time and extensions merge already
+	 * mapped runs under the write lock. Do not remap here: the generic
+	 * helper may drop this read lock while upgrading it.
+	 */
+	lcn = ntfs_rl_vcn_to_lcn(ni->runlist.rl, vcn);
+	if (lcn == LCN_RL_NOT_MAPPED)
+		return -EAGAIN;
+	if (lcn < 0)
+		return -EIO;
+	if (ntfs_bytes_to_cluster_off(vol, file_ofs) + unit->len >
+	    vol->cluster_size)
+		return -EIO;
+
+	unit->sector = ntfs_bytes_to_bio_sector(
+		NTFS_CLU_TO_B(vol, lcn) +
+		ntfs_bytes_to_cluster_off(vol, file_ofs));
+	return 0;
+}
 
-	vcn = ntfs_pidx_to_cluster(vol, index);
+static int ntfs_map_mft_io_for_folio(struct ntfs_inode *ni, u64 folio_byte,
+				     struct ntfs_mft_io_unit *unit)
+{
+	int err;
 
-	down_read(&ni->runlist.lock);
-	lcn = ntfs_attr_vcn_to_lcn_nolock(ni, vcn, false);
+	if (!down_read_trylock(&ni->runlist.lock))
+		return -EAGAIN;
+	err = ntfs_map_mft_io_locked(ni, folio_byte, unit);
 	up_read(&ni->runlist.lock);
+	return err;
+}
+
+static int ntfs_prepare_mft_folio_units(struct ntfs_inode *ni, u64 folio_byte,
+					u64 file_limit,
+					const unsigned long *record_writable,
+					struct ntfs_mft_io_unit *units,
+					unsigned int *nr_units,
+					unsigned int max_units, bool *defer)
+{
+	struct ntfs_volume *vol = ni->vol;
+	u64 folio_end = folio_byte + PAGE_SIZE;
+	u64 unit_byte = folio_byte;
+
+	while (unit_byte < folio_end && unit_byte < file_limit) {
+		struct ntfs_mft_io_unit unit;
+		u64 record_byte;
+		u64 cluster_end = ntfs_cluster_to_bytes(
+			vol, ntfs_bytes_to_cluster(vol, unit_byte) + 1);
+		u64 record_end =
+			round_down(unit_byte, (u64)vol->mft_record_size) +
+			vol->mft_record_size;
+		u64 unit_end = min3(record_end, cluster_end, folio_end);
+		bool writable = true;
+		int err;
+
+		record_byte = round_down(unit_byte, (u64)vol->mft_record_size);
+		while (record_byte < min(unit_end, file_limit)) {
+			unsigned int record;
+
+			record = (record_byte - folio_byte) /
+				 vol->mft_record_size;
+			if (!test_bit(record, record_writable)) {
+				writable = false;
+				break;
+			}
+			record_byte += vol->mft_record_size;
+		}
+		if (!writable)
+			goto next;
+
+		unit = (struct ntfs_mft_io_unit){
+			.folio_ofs = unit_byte - folio_byte,
+			.len = unit_end - unit_byte,
+		};
+		err = ntfs_map_mft_io_for_folio(ni, folio_byte, &unit);
+		if (err == -EAGAIN) {
+			*defer = true;
+			goto next;
+		}
+		if (err)
+			return err;
+		if (*nr_units >= max_units)
+			return -EOVERFLOW;
+		units[(*nr_units)++] = unit;
+next:
+		unit_byte = unit_end;
+	}
+	return 0;
+}
 
-	return lcn;
+static void ntfs_mft_write_error(struct ntfs_volume *vol,
+				 struct address_space *mapping, int err)
+{
+	mapping_set_error(mapping, err);
+	NVolSetErrors(vol);
+	ntfs_error(vol->sb, "Error while writing MFT folio: %d", err);
 }
 
 /*
@@ -3022,9 +3132,8 @@ static s64 lcn_from_index(struct ntfs_volume *vol, struct ntfs_inode *ni,
  * @wbc:	Writeback control structure
  *
  * This function is called as part of the address_space_operations
- * .writepages implementation for the $MFT inode (or $MFTMirr).
- * It handles writing one folio (normally 4KiB page) worth of MFT records
- * to the underlying block device.
+ * .writepages implementation for the $MFT inode.  Despite its historical
+ * name, it handles one folio containing MFT records.
  *
  * Return: 0 on success, or -errno on error.
  */
@@ -3034,200 +3143,189 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 	struct inode *vi = mapping->host;
 	struct ntfs_inode *ni = NTFS_I(vi);
 	struct ntfs_volume *vol = ni->vol;
-	u8 *kaddr;
-	struct ntfs_inode **locked_nis __free(kfree) = kmalloc_array(PAGE_SIZE / NTFS_BLOCK_SIZE,
-							sizeof(struct ntfs_inode *), GFP_NOFS);
-	int nr_locked_nis = 0, err = 0, mft_ofs, prev_mft_ofs;
-	struct inode **ref_inos __free(kfree) = kmalloc_array(PAGE_SIZE / NTFS_BLOCK_SIZE,
-							      sizeof(struct inode *), GFP_NOFS);
-	int nr_ref_inos = 0;
-	struct bio *bio = NULL;
-	u64 mft_no;
-	struct ntfs_inode *tni;
-	s64 lcn;
-	s64 vcn = ntfs_pidx_to_cluster(vol, folio->index);
-	s64 end_vcn;
-	unsigned int folio_sz;
+	struct ntfs_inode **locked_nis __free(kfree) =
+		kmalloc_array(PAGE_SIZE / NTFS_BLOCK_SIZE,
+			      sizeof(struct ntfs_inode *), GFP_NOFS);
+	struct inode **ref_inos __free(kfree) = kmalloc_array(
+		PAGE_SIZE / NTFS_BLOCK_SIZE, sizeof(struct inode *), GFP_NOFS);
+	struct ntfs_mft_io_unit *units __free(kfree) = NULL;
+	struct bio *parent = NULL, *child = NULL;
+	struct ntfs_mft_write_ctx *ctx = NULL;
+	u8 *kaddr = NULL;
+	DECLARE_BITMAP(record_writable, PAGE_SIZE / NTFS_BLOCK_SIZE) = {};
+	u64 folio_byte, file_limit, folio_end, mirror_size;
+	unsigned int nr_records, nr_units = 0, max_units;
+	unsigned int nr_locked_nis = 0, nr_ref_inos = 0;
+	unsigned int record, unit_idx;
+	unsigned long flags;
 	loff_t i_size;
 	s64 allocated_size;
-	unsigned long flags;
+	bool defer = false, redirty = false;
+	int err = 0;
 
 	read_lock_irqsave(&ni->size_lock, flags);
 	i_size = i_size_read(vi);
 	allocated_size = ni->allocated_size;
 	read_unlock_irqrestore(&ni->size_lock, flags);
-	end_vcn = ntfs_bytes_to_cluster(vol, allocated_size);
 
-	ntfs_debug("Entering for inode 0x%llx, attribute type 0x%x, folio index 0x%lx.",
-			ni->mft_no, ni->type, folio->index);
+	ntfs_debug("Entering for inode 0x%llx, folio index 0x%lx.", ni->mft_no,
+		   folio->index);
+	WARN_ON(!folio_test_locked(folio));
 
-	if (!locked_nis || !ref_inos) {
-		folio_redirty_for_writepage(wbc, folio);
-		folio_unlock(folio);
-		return -ENOMEM;
+	folio_byte = folio_pos(folio);
+	folio_end = folio_byte + PAGE_SIZE;
+	mirror_size = (u64)vol->mftmirr_size * vol->mft_record_size;
+
+	if (i_size <= folio_byte)
+		folio_zero_segment(folio, 0, PAGE_SIZE);
+	else if ((u64)i_size < folio_end)
+		folio_zero_segment(folio, i_size - folio_byte, PAGE_SIZE);
+
+	file_limit = min_t(u64, i_size, allocated_size);
+	nr_records = PAGE_SIZE / vol->mft_record_size;
+	max_units = PAGE_SIZE / min(vol->cluster_size, vol->mft_record_size);
+	units = kmalloc_array(max_units, sizeof(*units), GFP_NOFS);
+	if (!locked_nis || !ref_inos || !units) {
+		err = -ENOMEM;
+		goto out_noio;
 	}
 
-	/* We have to zero every time due to mmap-at-end-of-file. */
-	if (folio->index >= (i_size >> folio_shift(folio)))
-		/* The page straddles i_size. */
-		folio_zero_segment(folio,
-				   offset_in_folio(folio, i_size),
-				   folio_size(folio));
+	kaddr = kmap_local_folio(folio, 0);
+	folio_clear_uptodate(folio);
+
+	for (record = 0; record < nr_records; record++) {
+		struct ntfs_inode *tni = NULL;
+		struct inode *ref_vi = NULL;
+		u64 record_byte =
+			folio_byte + (u64)record * vol->mft_record_size;
+		u64 mft_no;
+
+		if (record_byte >= file_limit)
+			continue;
+		mft_no = record_byte >> vol->mft_record_size_bits;
+		if (!ntfs_may_write_mft_record(
+			    vol, mft_no,
+			    (struct mft_record *)(kaddr +
+						  record * vol->mft_record_size),
+			    &tni, &ref_vi)) {
+			if (ref_vi)
+				ref_inos[nr_ref_inos++] = ref_vi;
+			continue;
+		}
+		if (ref_vi)
+			ref_inos[nr_ref_inos++] = ref_vi;
+		if (tni) {
+			locked_nis[nr_locked_nis++] = tni;
+			if (tni->nr_extents < 0 &&
+			    tni->ext.base_ntfs_ino == NTFS_I(vol->mft_ino))
+				continue;
+		}
+		__set_bit(record, record_writable);
+	}
 
-	lcn = lcn_from_index(vol, ni, folio->index);
-	if (lcn <= LCN_HOLE) {
+	err = ntfs_prepare_mft_folio_units(ni, folio_byte, file_limit,
+					   record_writable, units, &nr_units,
+					   max_units, &defer);
+	if (err)
+		goto out_noio;
+	if (!nr_units) {
+		if (defer)
+			goto out_noio;
+		folio_mark_uptodate(folio);
+		kunmap_local(kaddr);
 		folio_start_writeback(folio);
 		folio_unlock(folio);
 		folio_end_writeback(folio);
-		return -EIO;
+		ntfs_release_mft_write_refs(locked_nis, nr_locked_nis, ref_inos,
+					    nr_ref_inos);
+		return 0;
 	}
 
-	/* Map folio so we can access its contents. */
-	kaddr = kmap_local_folio(folio, 0);
-	/* Clear the page uptodate flag whilst the mst fixups are applied. */
-	folio_clear_uptodate(folio);
+	parent = ntfs_alloc_mft_parent_bio(vol, folio, NULL);
+	if (!parent) {
+		err = -ENOMEM;
+		goto out_noio;
+	}
+	ctx = container_of(parent, struct ntfs_mft_write_ctx, bio);
 
-	for (mft_ofs = 0; mft_ofs < PAGE_SIZE && vcn < end_vcn;
-	     mft_ofs += vol->mft_record_size) {
-		/* Get the mft record number. */
-		mft_no = (((s64)folio->index << PAGE_SHIFT) + mft_ofs) >>
-			vol->mft_record_size_bits;
-		vcn = ntfs_mft_no_to_cluster(vol, mft_no);
-		/* Check whether to write this mft record. */
-		tni = NULL;
-		if (ntfs_may_write_mft_record(vol, mft_no,
-					(struct mft_record *)(kaddr + mft_ofs),
-					&tni, &ref_inos[nr_ref_inos])) {
-			unsigned int mft_record_off = 0;
-			s64 vcn_off = vcn;
-			s64 rl_len = 0;
+	if (!ntfs_add_mft_io_unit(parent, folio, &units[0])) {
+		err = -EIO;
+		goto out_noio;
+	}
 
-			/*
-			 * The record should be written.  If a locked ntfs
-			 * inode was returned, add it to the array of locked
-			 * ntfs inodes.
-			 */
-			if (tni)
-				locked_nis[nr_locked_nis++] = tni;
-			else if (ref_inos[nr_ref_inos])
-				nr_ref_inos++;
-
-			if (bio && (mft_ofs != prev_mft_ofs + vol->mft_record_size)) {
-flush_bio:
-				bio->bi_end_io = ntfs_bio_end_io;
-				submit_bio(bio);
-				bio = NULL;
-			}
+	for (unit_idx = 0; unit_idx < nr_units; unit_idx++) {
+		struct ntfs_mft_io_unit *unit = &units[unit_idx];
+		u64 file_ofs = folio_byte + unit->folio_ofs;
 
-			if (vol->cluster_size < folio_size(folio)) {
-				struct runlist_element *rl;
+		if (unit_idx) {
+			struct bio *target = child ? child : parent;
 
-				down_write(&ni->runlist.lock);
-				rl = ntfs_attr_vcn_to_rl(ni, vcn_off, &lcn);
-				if (!IS_ERR(rl))
-					rl_len = rl->length - (vcn_off - rl->vcn);
-				up_write(&ni->runlist.lock);
-				if (IS_ERR(rl) || lcn < 0) {
-					err = -EIO;
-					goto unm_done;
+			if (!ntfs_add_mft_io_unit(target, folio, unit)) {
+				if (child) {
+					ntfs_start_mft_writeback(ctx);
+					bio_chain(child, parent);
+					submit_bio(child);
+					child = NULL;
 				}
-
-				if (bio &&
-				   (bio_end_sector(bio) >> (vol->cluster_size_bits - 9)) !=
-				    lcn) {
-					bio->bi_end_io = ntfs_bio_end_io;
-					submit_bio(bio);
-					bio = NULL;
+				child = bio_alloc(vol->sb->s_bdev, 1,
+						  REQ_OP_WRITE, GFP_NOIO);
+				if (!child) {
+					defer = true;
+					break;
+				}
+				if (!ntfs_add_mft_io_unit(child, folio, unit)) {
+					bio_put(child);
+					child = NULL;
+					if (!ctx->error)
+						ctx->error = -EIO;
+					redirty = true;
+					err = -EIO;
+					break;
 				}
 			}
+		}
+		if (file_ofs < mirror_size) {
+			int mirror_err = ntfs_sync_mft_mirror_unit(
+				vol, folio, file_ofs, unit);
 
-			if (!bio) {
-				unsigned int off;
-
-				off = ((mft_no << vol->mft_record_size_bits) +
-				       mft_record_off) & vol->cluster_size_mask;
-
-				bio = bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRITE,
-						GFP_NOIO);
-				bio->bi_iter.bi_sector =
-					ntfs_bytes_to_bio_sector(
-						ntfs_cluster_to_bytes(vol, lcn) + off);
-			}
-
-			if (vol->cluster_size == NTFS_BLOCK_SIZE &&
-			    (mft_record_off ||
-			     rl_len == 1 ||
-			     mft_ofs + NTFS_BLOCK_SIZE >= PAGE_SIZE))
-				folio_sz = NTFS_BLOCK_SIZE;
-			else
-				folio_sz = vol->mft_record_size;
-			if (!bio_add_folio(bio, folio, folio_sz,
-					   mft_ofs + mft_record_off)) {
-				err = -EIO;
-				bio_put(bio);
-				goto unm_done;
-			}
-			mft_record_off += folio_sz;
-
-			if (mft_record_off != vol->mft_record_size) {
-				vcn_off++;
-				goto flush_bio;
-			}
-			prev_mft_ofs = mft_ofs;
-
-			if (mft_no < vol->mftmirr_size) {
-				int sub_err = ntfs_sync_mft_mirror_record(vol, folio, mft_no);
-
-				if (unlikely(sub_err) && !err)
-					err = sub_err;
-			}
-		} else if (ref_inos[nr_ref_inos])
-			nr_ref_inos++;
+			if (mirror_err && !ctx->error)
+				ctx->error = mirror_err;
+		}
 	}
 
-	if (bio) {
-		bio->bi_end_io = ntfs_bio_end_io;
-		submit_bio(bio);
+	if (child) {
+		ntfs_start_mft_writeback(ctx);
+		bio_chain(child, parent);
+		submit_bio(child);
 	}
-unm_done:
+	ntfs_start_mft_writeback(ctx);
 	folio_mark_uptodate(folio);
+	if (defer || redirty)
+		folio_redirty_for_writepage(wbc, folio);
 	kunmap_local(kaddr);
-
-	folio_start_writeback(folio);
+	kaddr = NULL;
 	folio_unlock(folio);
-	folio_end_writeback(folio);
-
-	/* Unlock any locked inodes. */
-	while (nr_locked_nis-- > 0) {
-		struct ntfs_inode *base_tni;
-
-		tni = locked_nis[nr_locked_nis];
-		mutex_unlock(&tni->mrec_lock);
-
-		/* Get the base inode. */
-		mutex_lock(&tni->extent_lock);
-		if (tni->nr_extents >= 0)
-			base_tni = tni;
-		else
-			base_tni = tni->ext.base_ntfs_ino;
-		mutex_unlock(&tni->extent_lock);
-		ntfs_debug("Unlocking %s inode 0x%llx.",
-				tni == base_tni ? "base" : "extent",
-				tni->mft_no);
-		atomic_dec(&tni->count);
-		iput(VFS_I(base_tni));
-	}
+	submit_bio(parent);
+	ntfs_release_mft_write_refs(locked_nis, nr_locked_nis, ref_inos,
+				    nr_ref_inos);
+	return 0;
 
-	/* Dropping deferred references */
-	while (nr_ref_inos-- > 0) {
-		if (ref_inos[nr_ref_inos])
-			iput(ref_inos[nr_ref_inos]);
+out_noio:
+	if (kaddr) {
+		folio_mark_uptodate(folio);
+		kunmap_local(kaddr);
 	}
-
-	if (unlikely(err && err != -ENOMEM))
-		NVolSetErrors(vol);
-	if (likely(!err))
-		ntfs_debug("Done.");
+	if (err && err != -ENOMEM)
+		ntfs_mft_write_error(vol, mapping, err);
+	if (parent)
+		bio_put(parent);
+	if (redirty || defer || err == -ENOMEM)
+		folio_redirty_for_writepage(wbc, folio);
+	folio_unlock(folio);
+	ntfs_release_mft_write_refs(locked_nis, nr_locked_nis, ref_inos,
+				    nr_ref_inos);
+	if (err == -ENOMEM || (defer && !err))
+		return 0;
 	return err;
 }
 

-- 
2.43.0

