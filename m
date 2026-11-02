Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605148;
	b=mV7I/FCvypi0S9DnNBeA6l48WzjD/AWiUWaSpDueBd0KBNPutWGVFdWUZLWXsrwGtMi1
	 3kdFheI7gLMG3hGX9g8L6Wa5NF4aZvk8jVfNcdgSuIVkHopgXdX9g86LAMaMAqMYwAB66
	 zgXbCktaPLpT1ptKJRG3OeXBIBvvV+QSJV5J+V4OLMC9xoj/JQYqPNSSQ0UTc9M+X6Gmz
	 3n8crroSsM8oQJQFQ/4vamiR8LMUfAW5ePILlJTCNCdEaJF1jzXFVg/ZnDwPPn+5xZsm5
	 kS6zTZ8rg9DaxCqqdqarcU0NpilMYTa0eaFjM6znFqIn4dvIW2jeTSvb/3rCjr+dEow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605148;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=8G6DzkDFSwNiHiey9Xd0QWhXNtihceLENI2CRig4N+g=;
	b=SCNcwYZWspeFiKzsFbvZO6M2DAIiTTWD8Bh1t5+KbW/Zm36t454VvePu0WRi0QeoKh4Q
	 qG/7/6p41Yr+m4JbaR3EtqZVswvk+5ocYsR/WYnfFrib/soh/4xhQCx42bgXLpMT5rqN2
	 Svo3c1VEvwWcPCXR69iGckpCO3SI8Q8mcTeV8YIDsW4bcXVEuQrguED/e3U7DqTA5B/qz
	 ghHEzpDBXaClnn1EWA/tEMFLK5nad/1gpXg2R6NsR1d8pPFTP7TMXow6aZfdKrmuBLPa2
	 OcIKg5CCvj5Y1XuaMZD4nEWbYp5AGz3DCqyEE7TF8WE9t+ELoW8rS/EM5qKfEnrgZDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JmHMEJ+W;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3BE606A32D
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A3BE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JmHMEJ+W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8G
	6DzkDFSwNiHiey9Xd0QWhXNtihceLENI2CRig4N+g=; b=JmHMEJ+W51UqMSaHe9
	4OfvlQYCuVueqOBN95k7B3UaGuTreisrwlMCGVb2d42s7/MAdO1Ch16cx+TmGFBO
	RBGju/O9yx3NR16jP7zn63vCoFf3j+dYkW/HpBw43/9uqIfdO9FWe84lVQ/nSqLB
	kxbFoeD2ImxrLEqqb57rb747g=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3nygJPuhqucJHEg--.56690S5;
	Mon, 02 Nov 2026 15:38:51 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v5 27/31] ntfs: report MFT writeback errors to fsnotify
Date: Mon,  2 Nov 2026 15:35:28 +0800
Message-Id: <20261102073532.98873-28-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3nygJPuhqucJHEg--.56690S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxtFW8tFyDuFW5GrWDZr13Jwb_yoW7ZFW7pF
	9xG393GrWkJr42qwn3tF4jya4Sy34xK3yUCrWxG3Wxuws5tr1jqa1UtrsagFyrKr93Gw4r
	Jw4DKrZ8uF1UZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jIlksUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzQtmT2roPgsL1QAA3G

From: Baolin Liu <liubaolin@kylinos.cn>

MFT write failures mark the volume without notifying error listeners.
Report device failures from the existing BIO completion callback for
both synchronous and asynchronous writes. Use blk_status_to_errno(),
matching the error recorded in the address_space.

Also report mirror and write-preparation failures. Use EFSCORRUPTED for
invalid record geometry, mappings and MST preparation, preserving the
errno through the affected error exits and mapping_set_error(). Keep
ENOMEM redirty and retry behavior.

Use the generic deferred reporter for completion-context notifications.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/mft.c | 54 ++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 7290feeb1803..f5092666b688 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -479,9 +479,11 @@ static void ntfs_mft_end_io(struct bio *bio)
 		err = blk_status_to_errno(bio->bi_status);
 	else
 		err = ctx->error;
+	/* Report device errors from both synchronous and asynchronous writes. */
+	if (bio->bi_status)
+		ntfs_report_file_metadata_error(ctx->mapping->host, err);
 	if (err) {
 		mapping_set_error(ctx->mapping, err);
-		NVolSetErrors(ctx->vol);
 		ntfs_error(ctx->vol->sb, "I/O error while writing MFT: %d",
 			   err);
 	}
@@ -542,29 +544,31 @@ static int ntfs_sync_mft_mirror_unit(struct ntfs_volume *vol,
 	u64 mirror_size;
 	unsigned int mirror_ofs;
 	u8 *src, *dst;
-	int err;
+	int err = -EFSCORRUPTED;
 
 	if (unlikely(!vol->mftmirr_ino))
-		return -EIO;
+		goto out_report;
 
 	mirror_size = (u64)vol->mftmirr_size * vol->mft_record_size;
 	if (mirror_file_ofs >= mirror_size ||
 	    unit->len > mirror_size - mirror_file_ofs)
-		return -EIO;
+		goto out_report;
 	if (unit->folio_ofs + unit->len > folio_size(source))
-		return -EIO;
+		goto out_report;
 
 	mirror = read_mapping_folio(vol->mftmirr_ino->i_mapping,
 				    mirror_file_ofs >> PAGE_SHIFT, NULL);
-	if (IS_ERR(mirror))
-		return PTR_ERR(mirror);
+	if (IS_ERR(mirror)) {
+		err = PTR_ERR(mirror);
+		goto out_report;
+	}
 
 	folio_lock(mirror);
 	if (folio_test_writeback(mirror))
 		folio_wait_writeback(mirror);
 	mirror_ofs = mirror_file_ofs - folio_pos(mirror);
 	if (mirror_ofs + unit->len > folio_size(mirror)) {
-		err = -EIO;
+		err = -EFSCORRUPTED;
 		goto out_unlock;
 	}
 
@@ -596,6 +600,9 @@ static int ntfs_sync_mft_mirror_unit(struct ntfs_volume *vol,
 out_unlock:
 	folio_unlock(mirror);
 	folio_put(mirror);
+out_report:
+	if (err)
+		ntfs_report_metadata_error(vol, err);
 	return err;
 }
 
@@ -627,10 +634,10 @@ static int ntfs_prepare_mft_record_io_units(struct ntfs_inode *ni,
 	unsigned int i;
 
 	if (!nr_units || nr_units > ARRAY_SIZE(ni->mft_lcn))
-		return -EIO;
+		return -EFSCORRUPTED;
 	for (i = 0; i < nr_units; i++)
 		if (ni->mft_lcn[i] < 0)
-			return -EIO;
+			return -EFSCORRUPTED;
 
 	cluster_ofs = ntfs_bytes_to_cluster_off(vol, record_byte);
 	if (vol->mft_io_unit_size > vol->mft_record_size) {
@@ -715,8 +722,10 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 		goto done;
 
 	err = ntfs_prepare_mft_record_io_units(ni, units);
-	if (err < 0)
+	if (err < 0) {
+		err = -EFSCORRUPTED;
 		goto err_out;
+	}
 	nr_units = err;
 
 	kaddr = kmap_local_folio(folio, 0);
@@ -727,6 +736,7 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 	err = pre_write_mst_fixup((struct ntfs_record *)fixup_m, vol->mft_record_size);
 	if (err) {
 		ntfs_error(vol->sb, "Failed to apply mst fixups!");
+		err = -EFSCORRUPTED;
 		goto unmap_err_out;
 	}
 
@@ -813,8 +823,13 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 		mark_mft_record_dirty(ni);
 		if (!sync)
 			err = 0;
-	} else
-		NVolSetErrors(vol);
+	} else {
+		struct ntfs_inode *base_ni = ntfs_inode_base(ni);
+
+		mapping_set_error(folio->mapping, err);
+		ntfs_report_file_metadata_error(VFS_I(base_ni),
+						err);
+	}
 	return err;
 }
 
@@ -3180,7 +3195,7 @@ static int ntfs_map_mft_io_locked(struct ntfs_inode *ni, u64 folio_byte,
 
 	lockdep_assert_held(&ni->runlist.lock);
 	if (!ni->runlist.rl)
-		return -EIO;
+		return -EFSCORRUPTED;
 
 	vcn = ntfs_bytes_to_cluster(vol, file_ofs);
 	/*
@@ -3192,10 +3207,10 @@ static int ntfs_map_mft_io_locked(struct ntfs_inode *ni, u64 folio_byte,
 	if (lcn == LCN_RL_NOT_MAPPED)
 		return -EAGAIN;
 	if (lcn < 0)
-		return -EIO;
+		return -EFSCORRUPTED;
 	if (ntfs_bytes_to_cluster_off(vol, file_ofs) + unit->len >
 	    vol->cluster_size)
-		return -EIO;
+		return -EFSCORRUPTED;
 
 	unit->sector = ntfs_bytes_to_bio_sector(
 		NTFS_CLU_TO_B(vol, lcn) +
@@ -3286,7 +3301,7 @@ static void ntfs_mft_write_error(struct ntfs_volume *vol,
 				 struct address_space *mapping, int err)
 {
 	mapping_set_error(mapping, err);
-	NVolSetErrors(vol);
+	ntfs_report_file_metadata_error(mapping->host, err);
 	ntfs_error(vol->sb, "Error while writing MFT folio: %d", err);
 }
 
@@ -3390,8 +3405,10 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 	err = ntfs_prepare_mft_folio_units(ni, folio_byte, file_limit,
 					   record_selected, units, &nr_units,
 					   max_units, &defer);
-	if (err)
+	if (err) {
+		err = -EFSCORRUPTED;
 		goto out_noio;
+	}
 	if (!nr_units) {
 		if (defer)
 			goto out_noio;
@@ -3444,6 +3461,7 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 						ctx->error = -EIO;
 					redirty = true;
 					err = -EIO;
+					ntfs_mft_write_error(vol, mapping, err);
 					break;
 				}
 			}

