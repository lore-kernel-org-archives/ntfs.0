Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486099;
	b=N2h5mWje63MDdzDplCpfFudBIBvZy4xDuWlkQFIQo/LzDEAv+U7RGS4/foervEkhMP2x
	 LOORLbPYEJ1BkGYsgvOSvcMgluZKPpxwKpEsgJLIzyBCKbvsHRY6+QBnk6XOEk82dHg02
	 1tvTMdMXtcr58xdRn9weU58dz6MUy3ddKi7rvdspPJprjF58mEnfFrmU7A3KRK85tgOrf
	 vtaCFmbF0pzIATnF4mV3RQ6Dy9RvM15GeFdgImFQ692WpYU498KDDZNlaXg4WtQsXQ2ab
	 SJGuyVQgB360jqg3qI8sfRNFNFIunL6UeOHjGVS2rax0Hp0aJRAoc/WWJkTtcmT73sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486099;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=3/lQ5si9mtA/sfGG0Baet0IBP4mJnpsETFmvRfL9TLQ=;
	b=lWSwFsOtvwi7UIJ8ocxUkFAUYwYJCOaHOT914l0I326+MbUwDsBY9PTdA+KJ5wc2A49T
	 GgsdlByQcGMOmaFqGk0IetNTb0T7J/ioQv3dA9NW1E8O/MtrWZg1nuu+CM9843CfQP0z9
	 pnaNzvOlH7onzIeHP7M61gnHs04ixbf0zhMo1Jqxg+QwFw5yI16BsUQMpt89u07Zc2/dP
	 HBGkYD2NvC7HC01BYiXy7TXsYwLp7hyur2erXEYYhrje1mHwJPXnPCSryQuRzsBU+Oix3
	 DYptdzMM6uQ0dpoSYlBMlMGTBY2GPc56I1HeTzOJWh/hKdEr/mMwCVzazhUovkzGzgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BppTo3Oa;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AAB60A260F
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96AAB60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BppTo3Oa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=3/
	lQ5si9mtA/sfGG0Baet0IBP4mJnpsETFmvRfL9TLQ=; b=BppTo3Oa5z6I8OyWng
	2faBkCtYyxrsR1c9tx8zERBjO1g600WAJhHMcXh67Da6A2rN6BFh8o+YpoirNXju
	SlP7vAzJxpM5m6hdMz9ElE1O/3rIU37WG0It7okLlqfpPv+8OdgpOof/DHOPySWw
	7Rt6enLv1OfgqL0Cz9MdAY3Fw=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3t62yKtdqN_ayBQ--.9980S5;
	Tue, 20 Oct 2026 16:47:50 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 27/31] ntfs: report MFT writeback errors to fsnotify
Date: Tue, 20 Oct 2026 16:44:17 +0800
Message-ID: <20261020084421.2196486-28-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261020084421.2196486-1-liubaolin12138@163.com>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3t62yKtdqN_ayBQ--.9980S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxtFW8tFyDuF45Xry8WF4xCrg_yoW7Zw15pF
	9xK393GrWkJr42qwn3tF4jya4Sy34xK3yUCrWxG3Wxuws5tr1jqF4UtrsYgFyrKr93G3yr
	Jw4DGrZ8uF1UZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jH7KsUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RZIE2rXKrZ2fwAA3M

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
index cc264a0fc073..6f84a4e78aa4 100644
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
 
@@ -3165,7 +3180,7 @@ static int ntfs_map_mft_io_locked(struct ntfs_inode *ni, u64 folio_byte,
 
 	lockdep_assert_held(&ni->runlist.lock);
 	if (!ni->runlist.rl)
-		return -EIO;
+		return -EFSCORRUPTED;
 
 	vcn = ntfs_bytes_to_cluster(vol, file_ofs);
 	/*
@@ -3177,10 +3192,10 @@ static int ntfs_map_mft_io_locked(struct ntfs_inode *ni, u64 folio_byte,
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
@@ -3271,7 +3286,7 @@ static void ntfs_mft_write_error(struct ntfs_volume *vol,
 				 struct address_space *mapping, int err)
 {
 	mapping_set_error(mapping, err);
-	NVolSetErrors(vol);
+	ntfs_report_file_metadata_error(mapping->host, err);
 	ntfs_error(vol->sb, "Error while writing MFT folio: %d", err);
 }
 
@@ -3375,8 +3390,10 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
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
@@ -3429,6 +3446,7 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 						ctx->error = -EIO;
 					redirty = true;
 					err = -EIO;
+					ntfs_mft_write_error(vol, mapping, err);
 					break;
 				}
 			}
-- 
2.51.0

