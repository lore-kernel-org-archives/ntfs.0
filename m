Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486079;
	b=aStpdsqBWOIsZZUK4cgtvNhYxbct/7SYfL67yi0KLqXy5PE9tLPAqc+x66ppIolYtjWu
	 E3vX+UjEZoW88mbnBRLpqmBjIPNIM7ZGg3XElnwu427Qm+OLkHyHhpkM1VlSdVn2a7Cnj
	 +Hzfx5BjahdW0W6Yt5zU71yADw6gtjJu/RSa888GT4QQWKjkHVzIg//uzmlFwMBAmm5CJ
	 dVQzHy/kz4ScRrnhS2YUWAAFGEKwiejlluTWWvk2vCsO8msgqu8eDFG/f/gNJTzXYi04R
	 OJflbP/2jGjfkZZyd2KbonIjEvi9o4R3KiTqRtvaziu1+Hws0rn322BfFR47X724cpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486079;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=2tRcMZCAWDgYnAJTocKiSMbQaCpWnMQECq8KAFpKqhY=;
	b=kkdXcoJeHACFlW6zP6B3ahH6qwc/9NTU/15NoBNxKCG07+1RkKBGtHFS0j3Lv1tA8b90
	 X9DM4emNx4Q6J6azMUj/PF3w7e+7kuOAjtMzDvTIH+7R087kmAK3IMo/Fxyyu867MtGFf
	 fpyXOKd1lpdJQciYltlHvA7SSs4nICVZu6ahGpQVjFMHfSj6ueLQyy/HJ+wBriTPy4zEo
	 JlGRrJbhM1N7A93fpJpJopQ8ljnQ46Z3JWDRyZ6p8BmfhDJ05N7/LDk//fH597hmBGV2Y
	 vZ6Ov01ucZRtL4bKcvAEDNmQS0Rfh7NqTgVDCYVtQ4iH/tvlR0U9Qa1r3KTRwichAhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cfJGUHgC;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B7E606A332
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B7E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cfJGUHgC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2t
	RcMZCAWDgYnAJTocKiSMbQaCpWnMQECq8KAFpKqhY=; b=cfJGUHgCD0AFkmKRoo
	PRwXLpSsTnoeDm3JWLO+EXdbetmDlwTDjtdx7mAcJWvdnmkJ9qZa2x6UoxCkXv7p
	cjfdTfpQLpZoMVtzOY0t6mIE3R8Y9yYlOuD9DgHz7SjxDczaYW50egTqGU/9ZG3n
	mJZ1R0HUVw8lU2xjPMW4Y8oHQ=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3t62yKtdqN_ayBQ--.9980S3;
	Tue, 20 Oct 2026 16:47:48 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 25/31] ntfs: report MFT record validation and lifecycle errors
Date: Tue, 20 Oct 2026 16:44:15 +0800
Message-ID: <20261020084421.2196486-26-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3t62yKtdqN_ayBQ--.9980S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFWkCry7XFWxWF4rZw4fXwb_yoWfGFWkpF
	nxA3srKrs7JrnFvrsrt3WYya4akas2gw4DWr97G3Wfuan5tw1jqa1DtFyv9FyrKrZ5Gwn7
	J3Wqq3y3Za4UZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joGQhUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hRIE2rXKrSZ2AAA3H

From: Baolin Liu <liubaolin@kylinos.cn>

MFT mapping, allocation and freeing can detect invalid records or
failed cleanup without reporting them. Cover stale extent references,
malformed reserved records and failures to restore allocation bits or
record state.

Use EFSCORRUPTED for corruption while retaining normal reserved-record
ineligibility. Use ntfs_inode_base() for file attribution and volume
reports when no usable file reference exists.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/mft.c | 70 +++++++++++++++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 27 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 9b14e69c9c6f..f494f283408b 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -26,7 +26,7 @@
  * Make sure its general fields are safe, then examine all its
  * attributes and apply generic checks to them.
  *
- * Returns 0 if the checks are successful. If not, return -EIO.
+ * Returns 0 if the checks are successful. If not, return -EFSCORRUPTED.
  */
 int ntfs_mft_record_check(const struct ntfs_volume *vol, struct mft_record *m,
 		u64 mft_no)
@@ -88,7 +88,7 @@ int ntfs_mft_record_check(const struct ntfs_volume *vol, struct mft_record *m,
 	return 0;
 
 err_out:
-	return -EIO;
+	return -EFSCORRUPTED;
 }
 
 /*
@@ -112,6 +112,7 @@ int ntfs_mft_record_check(const struct ntfs_volume *vol, struct mft_record *m,
 static inline struct mft_record *map_mft_record_folio(struct ntfs_inode *ni)
 {
 	loff_t i_size;
+	struct ntfs_inode *base_ni;
 	struct ntfs_volume *vol = ni->vol;
 	struct inode *mft_vi = vol->mft_ino;
 	struct folio *folio;
@@ -169,8 +170,9 @@ static inline struct mft_record *map_mft_record_folio(struct ntfs_inode *ni)
 		folio_put(folio);
 		kfree(ni->mrec);
 		ni->mrec = NULL;
-		folio = ERR_PTR(-EIO);
-		NVolSetErrors(vol);
+		folio = ERR_PTR(-EFSCORRUPTED);
+		base_ni = ntfs_inode_base(ni);
+		ntfs_report_file_metadata_error(VFS_I(base_ni), -EFSCORRUPTED);
 	}
 err_out:
 	ni->folio = NULL;
@@ -313,7 +315,9 @@ struct mft_record *map_extent_mft_record(struct ntfs_inode *base_ni, u64 mref,
 			unmap_mft_record(ni);
 			ntfs_error(base_ni->vol->sb,
 					"Found stale extent mft reference! Corrupt filesystem. Run chkdsk.");
-			return ERR_PTR(-EIO);
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+			return ERR_PTR(-EFSCORRUPTED);
 		}
 map_err_out:
 		ntfs_error(base_ni->vol->sb,
@@ -344,8 +348,9 @@ struct mft_record *map_extent_mft_record(struct ntfs_inode *base_ni, u64 mref,
 	if (seq_no && (le16_to_cpu(m->sequence_number) != seq_no)) {
 		ntfs_error(base_ni->vol->sb,
 				"Found stale extent mft reference! Corrupt filesystem. Run chkdsk.");
+		ntfs_report_file_metadata_error(VFS_I(base_ni), -EFSCORRUPTED);
 		destroy_ni = true;
-		m = ERR_PTR(-EIO);
+		m = ERR_PTR(-EFSCORRUPTED);
 		goto unm_nolock_err_out;
 	}
 
@@ -1034,7 +1039,7 @@ static bool mft_reserved_is_free(struct ntfs_volume *vol,
 	folio_unlock(folio);
 	folio_put(folio);
 	if (post_read_mst_fixup((struct ntfs_record *)m, vol->mft_record_size))
-		goto free_m;
+		goto corrupt;
 
 	if (!ntfs_is_mft_record(m->magic) ||
 	    !(m->flags & MFT_RECORD_IN_USE) || m->base_mft_record ||
@@ -1045,7 +1050,7 @@ static bool mft_reserved_is_free(struct ntfs_volume *vol,
 	bytes_in_use = le32_to_cpu(m->bytes_in_use);
 	if (attrs_offset > bytes_in_use || bytes_in_use > vol->mft_record_size ||
 	    bytes_in_use - attrs_offset < sizeof(a->type))
-		goto out;
+		goto corrupt;
 
 	for (a = (struct attr_record *)((u8 *)m + attrs_offset);
 	     (u8 *)a + sizeof(a->type) <= (u8 *)m + bytes_in_use;) {
@@ -1054,36 +1059,40 @@ static bool mft_reserved_is_free(struct ntfs_volume *vol,
 		if (a->type == AT_END) {
 			if ((u8 *)a + sizeof(a->type) + sizeof(a->length) >
 			    (u8 *)m + bytes_in_use)
-				break;
+				goto corrupt;
 			/* Also accept a record emptied by an earlier bootstrap. */
 			available = have_std ||
 				    (u8 *)a == (u8 *)m + attrs_offset;
-			break;
+			goto out;
 		}
 		if (a->type == AT_FILE_NAME)
-			break;
+			goto out;
 		len = le32_to_cpu(a->length);
 		if (len < offsetof(struct attr_record, data) ||
 		    (u8 *)a + len > (u8 *)m + bytes_in_use)
-			break;
+			goto corrupt;
 		if (a->type == AT_STANDARD_INFORMATION) {
 			u32 value_len, value_ofs;
 
 			if (have_std || a->non_resident ||
 			    len < offsetof(struct attr_record,
 					   data.resident.reserved) + 1)
-				break;
+				goto corrupt;
 			value_len = le32_to_cpu(a->data.resident.value_length);
 			value_ofs = le16_to_cpu(a->data.resident.value_offset);
 			if (value_ofs > len || value_len > len - value_ofs)
-				break;
+				goto corrupt;
 			have_std = true;
 		}
 		a = (struct attr_record *)((u8 *)a + len);
 	}
+	/* No attribute terminator within the used part of the record. */
+	goto corrupt;
 out:
 	kfree(m);
 	return available;
+corrupt:
+	ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 free_m:
 	kfree(m);
 	return false;
@@ -2317,8 +2326,8 @@ static int ntfs_mft_record_format(const struct ntfs_volume *vol, const s64 mft_n
  *
  * On error, the volume will be left in a consistent state and no record will
  * be allocated.  If rolling back a partial operation fails, we may leave some
- * inconsistent metadata in which case we set NVolErrors() so the volume is
- * left dirty when unmounted.
+ * inconsistent metadata in which case we report the error so the volume is
+ * left dirty when unmounted and userspace is notified.
  *
  * Note, this function cannot make use of most of the normal functions, like
  * for example for attribute resizing, etc, because when the run list overflows
@@ -2349,7 +2358,7 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
 	struct attr_record *a;
 	pgoff_t index;
 	unsigned int ofs;
-	int err;
+	int err, rollback_err;
 	__le16 seq_no, usn;
 	bool record_formatted = false, from_reserve = false, tail_alloc = false;
 	bool reserve_created = false;
@@ -2678,6 +2687,10 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (unlikely(err)) {
 		ntfs_error(vol->sb, "Failed to find first attribute extent of mft data attribute.");
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
+		}
 		ntfs_attr_put_search_ctx(ctx);
 		unmap_mft_record(mft_ni);
 		goto undo_data_init;
@@ -2754,7 +2767,7 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
 			folio_unlock(folio);
 			kunmap_local(m);
 			folio_put(folio);
-			NVolSetErrors(vol);
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 			goto search_free_rec;
 		}
 		/*
@@ -2910,9 +2923,12 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
 	if (!base_ni || base_ni->mft_no != FILE_MFT)
 		down_write(&vol->mftbmp_lock);
 undo_mftbmp_alloc_nolock:
-	if (!forced_reserved_record && ntfs_bitmap_clear_bit(vol->mftbmp_ino, bit)) {
+	rollback_err = 0;
+	if (!forced_reserved_record)
+		rollback_err = ntfs_bitmap_clear_bit(vol->mftbmp_ino, bit);
+	if (rollback_err) {
 		ntfs_error(vol->sb, "Failed to clear bit in mft bitmap.%s", es);
-		NVolSetErrors(vol);
+		ntfs_report_metadata_error(vol, rollback_err);
 	}
 	if ((from_reserve || reserve_created) &&
 	    vol->mft_record_reserve_pos == bit + 1)
@@ -2949,7 +2965,7 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
 int ntfs_mft_record_free(struct ntfs_volume *vol, struct ntfs_inode *ni)
 {
 	u64 mft_no;
-	int err;
+	int err, rollback_err;
 	u16 seq_no;
 	__le16 old_seq_no;
 	__le64 old_base_mft_record;
@@ -2965,14 +2981,11 @@ int ntfs_mft_record_free(struct ntfs_volume *vol, struct ntfs_inode *ni)
 
 	ni_mrec = map_mft_record(ni);
 	if (IS_ERR(ni_mrec))
-		return -EIO;
+		return PTR_ERR(ni_mrec);
 
 	/* Cache the mft reference for later. */
 	mft_no = ni->mft_no;
-	if (likely(ni->nr_extents >= 0))
-		base_ni = ni;
-	else
-		base_ni = ni->ext.base_ntfs_ino;
+	base_ni = ntfs_inode_base(ni);
 	keep_reserved = mft_no >= FILE_reserved12 &&
 			mft_no <= FILE_reserved15 &&
 			base_ni->mft_no == FILE_MFT;
@@ -3043,8 +3056,11 @@ int ntfs_mft_record_free(struct ntfs_volume *vol, struct ntfs_inode *ni)
 	memalloc_flags = memalloc_nofs_save();
 	if (base_ni->mft_no != FILE_MFT)
 		down_write(&vol->mftbmp_lock);
-	if (ntfs_bitmap_set_bit(vol->mftbmp_ino, mft_no))
+	rollback_err = ntfs_bitmap_set_bit(vol->mftbmp_ino, mft_no);
+	if (rollback_err) {
 		ntfs_error(vol->sb, "ntfs_bitmap_set_bit failed in bitmap_rollback\n");
+		ntfs_report_metadata_error(vol, rollback_err);
+	}
 	if (base_ni->mft_no != FILE_MFT)
 		up_write(&vol->mftbmp_lock);
 	memalloc_nofs_restore(memalloc_flags);
-- 
2.51.0

