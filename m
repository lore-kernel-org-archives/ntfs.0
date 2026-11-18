Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993011;
	b=0+F9LMye1DWz6Fu2XHR440cmw9ut0xmZouhKf+BTPIIleRKVImu5et2ZbDaNPJ6SDLor
	 j2/j621uN9iPAZs+6/KvJcPp5e9TC4H66jE25h7DrszKYJ6oRukCiG+tJQ6XukQUDFqQx
	 zqBJTFU5FM+bI75mFG/Vb4amMGnYuwdT6UsPcF31czxqbqu62s/7UiobC35SSHVX4d9z7
	 89gT8i/Y0/ZopBVmlu+jsQhbhPQBRLbB/8oSpeslj4dCBujGRbhO06I9tF8TtMA31HVCM
	 iwUepYTNrAbjHYI8yV/vJpqjsGwAghKtK3KFKE68FFWcp/BJvSoVGndsWt+fhKMulfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993011;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ut1WDZh357VcgryaWJdugg8z31Tg8OQNngjP5rygcbQ=;
	b=AVEcNEgNB+ONEk3tDQZiI0dH/L7kPiHc+5fuczsG3hlOXOQeidmb0cxj+YdxlvBIgpZ7
	 wlW5YrYs+xNtd6SgEksNGyleepN3sqkk/LtiL02I78r8d57NyS9jPDRP3X32OHnCcjGv8
	 3sWYwN1P0EjGiyoUR3d/z+v9REVcXbqgMyUkfhariCm0Qq2yJErP012Df+Eu6/DOLiN5E
	 Xab6X6QfUOiEyOaq7upYcxAVoezp2/5qToOQ2p+ZZWWuIt1Kol9XHRUAUFBifsbNYXpsH
	 09cRykzwVUBRlwP8UncNI4Cb8JfWI2z3VcABnQzxwe/yA9UDhAAnRJSDlOd209A/x1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ezlpkpzI;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489BB606A320
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 489BB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ezlpkpzI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ut
	1WDZh357VcgryaWJdugg8z31Tg8OQNngjP5rygcbQ=; b=ezlpkpzIRTariYMQrQ
	CIXtEq8lu6FVD+FdsNXS8QMpp6fGmRj6Mu7dhx7NaSrMEeaKJDjDtWkbI6wghb4u
	jk+HIr1JQ7OJg8tv8LF8sHg9duWxxLbC8Cla45KOa/ZPWHcafK/OxgP3ROP6md6V
	HkudxcEXauMrIhPqRupml2NRc=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3xC1Pa_1qPhPuGg--.62323S2;
	Wed, 18 Nov 2026 17:09:36 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 16/37] ntfs: report LZNT1 and WOF compressed stream errors
Date: Wed, 18 Nov 2026 17:06:40 +0800
Message-Id: <20261118090701.1858849-17-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118090701.1858849-1-wangxuewen_ky@163.com>
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:PigvCgC3xC1Pa_1qPhPuGg--.62323S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3JFyrKFy8Xw43Cr1fGFy8Zrb_yoWxXFyUpF
	93Gr93trWkXr9rWrnxtrs0va1a9340g3yUGrWxG3W7Xa15twn5tFWqqwnYgrWrKr95J3sr
	JayDCrWUGF1UXF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRIoGQUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzRAJ8Wr9a1AoOgAA3b

From: Dandan Wu <wudandan@kylinos.cn>

Compressed I/O can detect malformed LZNT1 data or WOF metadata and
compressed data without reporting it. Report corruption as EFSCORRUPTED
and retain underlying read, mapping and allocation errors.

Also report EIO from LZNT1 block reads and direct reads of nonresident
WOF tables and chunks. Avoid repeating metadata reports from resident
WOF mapping and lookup failures.

Report failed mapping updates after compressed writes and failed
cluster release separately from the initiating error.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
Changes in v6:
Keep compressed-stream reporting here; errno preservation is now a
preceding patch.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.

 fs/ntfs/compress.c | 25 ++++++++++++++++++++++---
 fs/ntfs/wof.c      | 39 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 56 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 6a393e7fc1dd..dfb3215531d4 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -790,6 +790,8 @@ int ntfs_read_compressed_block(struct folio *folio)
 			ntfs_error(vol->sb,
 				"ntfs_decompress() failed in inode 0x%llx with error code %i. Skipping this compression block.",
 				ni->mft_no, -err);
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(ni), err);
 			/* Release the unfinished pages. */
 			for (; prev_cur_page < cur_page; prev_cur_page++) {
 				page = pages[prev_cur_page];
@@ -842,13 +844,16 @@ int ntfs_read_compressed_block(struct folio *folio)
 	goto err_out;
 
 rl_err:
-	err = -EIO;
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
@@ -1319,6 +1324,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		int pages_per_cb, unsigned int page_offset,
 		struct compress_context *ctx, struct ntfs_compress_workspace *ws)
 {
+	int report_err = 0;
 	struct ntfs_volume *vol = ni->vol;
 	char *outbuf = ws->outbuf, *pbuf;
 	u32 compsz, p, insz = ni->itype.compressed.block_size;
@@ -1447,6 +1453,9 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		up_write(&ni->runlist.lock);
 		ntfs_error(vol->sb, "Failed to merge runlists");
 		err = PTR_ERR(rl);
+		if (err != -ENOMEM)
+			err = -EFSCORRUPTED;
+		report_err = err;
 		goto free_rlc;
 	}
 
@@ -1456,16 +1465,26 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 
 	err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 	up_write(&ni->runlist.lock);
+	if (err)
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
-- 
2.51.0

