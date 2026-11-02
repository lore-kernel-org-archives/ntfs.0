Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605023;
	b=Mhl/81QcPeM9tDufacRie8g0pKwVQBAgaE6Vz3059v9nlqay8vK62/+y7ChVijLMpwwQ
	 EjPBHzXVVIzxcw3zjdAHKQ6uTH20mwYu90kfDDwWwogIMVM/LGvLzRBW9v89Yr7nmdXez
	 IM4o7gY5ZB4nIZbj2PYOJzuTIShVygH1oMIOLA7cyvZGecXYdV7ZGzaKNkM4UwTe70rFl
	 A+jDfHH56uYJzDMKzbflDmx3IrVw2lWsZQqjpezUKoY/boUe/6UCYyz2wdMw4W62Gdgz+
	 kMeWq2Nc2gy1gROEQnFLEaLjWJcMx2YtbM9b9M7O2di8t+XfbKy63D9zAWxK7PCGbyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605023;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=2vdehVRmmcfWaraj13ioz+/Xsn+iKGko7cIIi/UD6c4=;
	b=q19F59coBLWY4umwgoer6xvo5j9Z6XpCFLpF1cezyjf9imEkfguz0v2nYeJ5B6QFq6Qo
	 B3jualcn+8mhiVsjg32n+BmMWe+b9B4grwI9UNsOVW2zhXiqs91aX0qxT3Vzvdo78bnqq
	 sUgtHOKbLrEQSfDrcfZt9e5aDqRO7HMvS7lRFO9XVz7Zxvd/2L44k4NZG7eBApEECt200
	 cT78uMiWfPhBC4w17eB0L31KG8obpnQvrvR3UgwOKCo32vabilxEk45Af6t5bHAiitYlD
	 FFHKSIdv+DCad7lEdOO9e+/45SOgeRFnjGrOKuyVWBhyVXw+jM89QvsrzrSamwBgi+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A2E606A334
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35A2E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=2v
	dehVRmmcfWaraj13ioz+/Xsn+iKGko7cIIi/UD6c4=; b=kJDgHLVh8zNW34+2Yo
	JYDvC+quRVgCRKwHLbPLRKIjR9LR8TvXCOlhD6iHHjZItuQbc9Ua/bqStI0tSHXe
	vpRh3Xb0PspTqP/w1UkDzAltUQWkfHUp8+QKORDxjU3jGySDXcpVnPKqG3VWcz0p
	Ps4ZDY3sL5lWA0fdLdNNg2x9Q=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3vy+HPehqF0lcEw--.2040S4;
	Mon, 02 Nov 2026 15:36:41 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>
Subject: [PATCH v5 10/31] ntfs: report LZNT1 and WOF compressed stream errors
Date: Mon,  2 Nov 2026 15:35:11 +0800
Message-Id: <20261102073532.98873-11-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3vy+HPehqF0lcEw--.2040S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3JFy7JF4rCryxKF4xXF4Dtwb_yoW3Gw17pF
	WfCr93trWkXr9rWrnxtrs09w4ag34IgayUGrWxG3W7Xa15Kr1vqFWqqwnYgrWrKr95t3sr
	Ja1DGrWDG3WUXF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UveHDUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzQlGL2roPYn-8gAA3W

From: Dandan Wu <wudandan@kylinos.cn>

Compressed I/O can detect malformed LZNT1 data or WOF metadata and
compressed data without reporting it. Report corruption as EFSCORRUPTED
and retain underlying read, mapping and allocation errors.

Also report EIO from LZNT1 block reads and direct reads of nonresident
WOF tables and chunks. Avoid repeating metadata reports from resident
WOF mapping and lookup failures.

Save compression-buffer allocation errors before cleanup so ENOMEM does
not become EIO. Report failed mapping updates after compressed writes
and failed cluster release separately from the initiating error.

Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
Validation:
- Seventeen LZNT1/WOF scenarios cover EIO reporting, allocation failures,
  resident reads and cleanup.
- Thirty additional WOF table/chunk cases use the real table parser to
  check errno preservation, cleanup and resident-read report ownership.
- All pass in extracted-source userspace harnesses with controlled
  dependencies under ASan/UBSan. These check reporting calls, not kernel
  FAN_FS_ERROR event delivery.

 fs/ntfs/compress.c | 35 ++++++++++++++++++++++++++++-------
 fs/ntfs/wof.c      | 39 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 62 insertions(+), 12 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 82c7c7d29073..dfb3215531d4 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -585,11 +585,13 @@ int ntfs_read_compressed_block(struct folio *folio)
 	nr_cbs--;
 
 	mutex_lock(&ntfs_cb_lock);
-	if (!ntfs_compression_buffer)
-		if (allocate_compression_buffers()) {
+	if (!ntfs_compression_buffer) {
+		err = allocate_compression_buffers();
+		if (err) {
 			mutex_unlock(&ntfs_cb_lock);
 			goto err_out;
 		}
+	}
 
 
 	cb = ntfs_compression_buffer;
@@ -633,7 +635,8 @@ int ntfs_read_compressed_block(struct folio *folio)
 			 * duration.
 			 */
 			up_read(&ni->runlist.lock);
-			if (!ntfs_map_runlist(ni, vcn))
+			err = ntfs_map_runlist(ni, vcn);
+			if (!err)
 				goto lock_retry_remap;
 			mutex_unlock(&ntfs_cb_lock);
 			goto map_rl_err;
@@ -787,6 +790,8 @@ int ntfs_read_compressed_block(struct folio *folio)
 			ntfs_error(vol->sb,
 				"ntfs_decompress() failed in inode 0x%llx with error code %i. Skipping this compression block.",
 				ni->mft_no, -err);
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(ni), err);
 			/* Release the unfinished pages. */
 			for (; prev_cur_page < cur_page; prev_cur_page++) {
 				page = pages[prev_cur_page];
@@ -839,12 +844,16 @@ int ntfs_read_compressed_block(struct folio *folio)
 	goto err_out;
 
 rl_err:
+	err = -EFSCORRUPTED;
 	up_read(&ni->runlist.lock);
+	ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
 	ntfs_error(vol->sb, "ntfs_rl_vcn_to_lcn() failed. Cannot read compression block.");
 	goto err_out;
 
 read_err:
 	up_read(&ni->runlist.lock);
+	if (err == -EIO)
+		ntfs_report_file_metadata_error(VFS_I(ni), err);
 	ntfs_error(vol->sb, "IO error while reading compressed data.");
 
 err_out:
@@ -859,7 +868,7 @@ int ntfs_read_compressed_block(struct folio *folio)
 	}
 	kfree(pages);
 	kfree(completed_pages);
-	return -EIO;
+	return err;
 }
 
 /*
@@ -1315,6 +1324,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		int pages_per_cb, unsigned int page_offset,
 		struct compress_context *ctx, struct ntfs_compress_workspace *ws)
 {
+	int report_err = 0;
 	struct ntfs_volume *vol = ni->vol;
 	char *outbuf = ws->outbuf, *pbuf;
 	u32 compsz, p, insz = ni->itype.compressed.block_size;
@@ -1443,6 +1453,9 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		up_write(&ni->runlist.lock);
 		ntfs_error(vol->sb, "Failed to merge runlists");
 		err = PTR_ERR(rl);
+		if (err != -ENOMEM)
+			err = -EFSCORRUPTED;
+		report_err = err;
 		goto free_rlc;
 	}
 
@@ -1453,17 +1466,25 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 	err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 	up_write(&ni->runlist.lock);
 	if (err)
-		err = -EIO;
+		report_err = err;
 	goto out;
 
 free_rlc:
-	if (ntfs_cluster_free_from_rl(vol, rlc))
-		ntfs_error(vol->sb, "Failed to free hot clusters.");
+	{
+		int free_err = ntfs_cluster_free_from_rl(vol, rlc);
+
+		if (free_err) {
+			ntfs_report_file_metadata_error(VFS_I(ni), free_err);
+			ntfs_error(vol->sb, "Failed to free hot clusters.");
+		}
+	}
 	kvfree(rlc);
 out:
 	NInoSetFileNameDirty(ni);
 	mark_mft_record_dirty(ni);
 
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(ni), report_err);
 	return err;
 }
 
diff --git a/fs/ntfs/wof.c b/fs/ntfs/wof.c
index e64f40835957..25b9a87956da 100644
--- a/fs/ntfs/wof.c
+++ b/fs/ntfs/wof.c
@@ -294,7 +294,7 @@ static int parse_wof_chunk_table(struct ntfs_inode *base_ni,
 		ret = ntfs_bdev_read_from_rl(ni->vol, &ni->runlist,
 					     start_sector, sectors, buf);
 		if (ret)
-			return -EIO;
+			return ret;
 		buf += sector_off;
 	} else {
 		struct ntfs_attr_search_ctx *ctx;
@@ -655,6 +655,7 @@ static int ntfs_wof_decompress_chunk(struct ntfs_wof_workspace *ws,
 
 int ntfs_read_wof_compressed_block(struct folio *folio)
 {
+	int report_err = 0;
 	struct address_space *mapping = folio->mapping;
 	struct ntfs_inode *ni = NTFS_I(mapping->host), *wof_ni;
 	struct inode *wof_inode;
@@ -685,15 +686,20 @@ int ntfs_read_wof_compressed_block(struct folio *folio)
 				   WOF_NAME_LEN);
 	if (IS_ERR(wof_inode)) {
 		err = PTR_ERR(wof_inode);
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
+		}
 		goto out;
 	}
 
 	wof_ni = NTFS_I(wof_inode);
 	if (wof_ni->initialized_size != wof_ni->data_size) {
+		report_err = -EFSCORRUPTED;
 		ntfs_error(vol->sb,
 			   "WOF compressed stream is not fully initialized (init %lld, data %lld).",
 			   wof_ni->initialized_size, wof_ni->data_size);
-		err = -EIO;
+		err = -EFSCORRUPTED;
 		goto out_iput;
 	}
 	if (NInoNonResident(wof_ni) && !NInoFullyMapped(wof_ni)) {
@@ -725,21 +731,42 @@ int ntfs_read_wof_compressed_block(struct folio *folio)
 		err = parse_wof_chunk_table(ni, wof_ni, chunk_idx, chunk_count,
 					    decomp_size, &chunk_offset,
 					    &chunk_size, input, input_size);
-		if (err)
+		if (err) {
+			if (err == -EINVAL || err == -EOVERFLOW || err == -ENOENT) {
+				err = -EFSCORRUPTED;
+				report_err = err;
+			} else if (err == -EIO && NInoNonResident(wof_ni)) {
+				/* Resident reads already report errors below. */
+				report_err = err;
+			}
 			goto out_free_input;
+		}
 
 		err = ntfs_read_wof_chunk(vol, wof_ni, chunk_offset, chunk_size,
 					  input, input_size, &chunk_mem);
-		if (err)
+		if (err) {
+			if (err == -EINVAL || err == -EOVERFLOW || err == -ENOENT) {
+				err = -EFSCORRUPTED;
+				report_err = err;
+			} else if (err == -EIO && NInoNonResident(wof_ni)) {
+				/* Direct block reads do not report metadata errors. */
+				report_err = err;
+			}
 			goto out_free_input;
+		}
 
 		err = ntfs_wof_decompress_chunk(ws, vol, mapping, folio,
 						folio_start, folio_end,
 						chunk_idx * ws->comp_unit,
 						chunk_mem, chunk_size,
 						decomp_size);
-		if (err)
+		if (err) {
+			if (err != -ENOMEM) {
+				err = -EFSCORRUPTED;
+				report_err = err;
+			}
 			goto out_free_input;
+		}
 	}
 
 	if (folio_end > i_size)
@@ -757,5 +784,7 @@ int ntfs_read_wof_compressed_block(struct folio *folio)
 		folio_clear_uptodate(folio);
 	}
 	folio_unlock(folio);
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(ni), report_err);
 	return err;
 }

