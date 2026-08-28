Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B22F3A1D14
	for <ntfs@lists.linux.dev>; Fri, 28 Aug 2026 04:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787893132; cv=none; b=ew343P/KCrM3cINdD4eg2JKYYfSzlEKTeC12MzSV2jprq0K5eIBUa3uUKlY8djJfLKkSfsax5TiMsv5ftJKJENSheYI0m1AlHZltYR03tB9KEwa7neqM6E5tkUsck8BtnhVE6lIZU9XE+Lwf8/Np9jwR2rf/+l/v1Cf8HHedg8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787893132; c=relaxed/simple;
	bh=gcdiG4ir1yBGg2EXjYbybrNJaJ5DXEJHiTUBDcvtr8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MvsWLzsXRtD5gUUV1Y/j3ZvcI+Qv4R0QHQOoNtd6vmMBvg7zp9gzqilJQ32OLqftjVmp6QgMFY6MCTw7RshSbIgAPFC0MM5mSWY/HyBaKG9P1ZdiaV6GIb/CqJS6//thZ9O1VNNgE2PBLEQkwFEBw84xY4tVxwtRmSadv4qUdww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJn9iRNy; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJn9iRNy"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso523792b3a.0
        for <ntfs@lists.linux.dev>; Thu, 27 Aug 2026 21:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893130; x=1788497930; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/D4eWMfr1fA9bjkfzPRYlY4jm44++uFB2UkDiGgqMk=;
        b=PJn9iRNyOm1P+oEhUf/ku7ffDd8o7MCtWfrBvOkEo/hluezEelQ7m4Dc05iwpci/xi
         Z5kL/A5It3Oyt1YmvS+42GX0awp02V/aL69gcvi8tpOHPq7sdn/H2aaWs+whV5oE1xtH
         0gvnjtQDRoD5EKZ7eL8d2Vv4X05CtkEyvGWjWh52Cx8FSe+zrk5vErgrRfvmCNSfA/a1
         thJ3QTTp1/9E4msYo1Q6MtR2bf+FYkFqFggAqa5PWrtCmE3T2eKKHYtOuBAfNwBIQyWO
         fxCokJsCCEgAAnGoYB6K1BdZbPclMKkzvGLkftKyEhSyew/UNho/KsyxU5AFGz7rP0mP
         uYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893130; x=1788497930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/D4eWMfr1fA9bjkfzPRYlY4jm44++uFB2UkDiGgqMk=;
        b=h344fAFe9LheSZOvmboQYG8h5X/Ds6jaXiLhp/OXbVdrwOCly3FKjJPTo8828Wi0Us
         CsAbzZa+8E6XeeRMKLpBOl7Y/FyIlkFDBlVDOFhkM0pdQOHT2FyYI+V4+FD80g8SlI7R
         +raCuBv0mcSQXOBVoNV/s9FATMEVio9zAszxlOSUCvxFhGLKdah4eoTQqDSgGgLbKpVM
         D4m0Y2VEgQ7IV8xVQVjzvd2lKg9ZyeXGLs0gTlQzMtUbxSK7Crtqzt7Pb3MLH8pIlcnO
         4rWinJHo83uojNgWekde6u+Ki3+zX6LMdQb6OWesi5QMkvnc1EpN7evTClM6vhfbWjv6
         /kDQ==
X-Gm-Message-State: AFuF++kISDlhgBsr5bsG/4nwyE6rP/eAMxwa28reseKqhOmDb6OIwLaA
	07IevN4M7Gin3Wqe9Ew7RRUB1qWFZFwIdQy3l+QLVG9XZtmZ7/AfGoCO
X-Gm-Gg: AR+sD13KUl1QAf1A5lt1TfXK7AOYLLvkIndLzG9Vgrzch/0mRvDxE8oeptEx/x67CLS
	OoBD1z6m439ct90l5BWqVaGwi+kf4wUYucxZzE+UUMhmE31J/1oCBXezDGnNmbJ4Q6i0af2ODBZ
	ucqCfGH0VcAEmz+IEBaK48uqoh/d51EfEZQHkvrLIzQIS8LJcJ7yMN1AjJJqZBYx+T175jvksza
	4+zrxOAOnpo8bbaLD6WEhZid4AiY4bMBg5q64XG5ZNE4U/B40Fyyi06f1DNgGTnBKjypwdDcf7V
	1bE4+/Vx63sP8vlGzj5p37DVISsgYvTVf7XqZhBXa4b40e2XgwcgPbBd/hJbCuo/VO2dIJAjJc6
	OLKUQTKoxB6JjsSobLseVcYOTvsHx5TuQCyiM5FthlPZXm1U4CWLGveIRtHPPcUDqRxxsOpMl7P
	2lng+Q+cHkL6/PXGE5S69L42fceszpsVbFSrrHxcrQrwLh2rkSddHPqv7bH5fMoHab5sV7Fg5R
X-Received: by 2002:a05:6a00:f07:b0:848:42d0:bc91 with SMTP id d2e1a72fcca58-8562a7d99a6mr9045063b3a.12.1787893130087;
        Thu, 27 Aug 2026 21:58:50 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f36e8ee6sm168102a12.26.2026.08.27.21.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 21:58:49 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	Zhan Xusheng <zhanxusheng1024@gmail.com>
Subject: [PATCH] ntfs: read WOF chunks outside the decompression lock
Date: Fri, 28 Aug 2026 12:58:43 +0800
Message-ID: <20260828045843.1203490-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng1024@gmail.com>

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

WOF decompression uses four module-global workspaces, one per compression
format, each with a static mutex.  ntfs_read_wof_compressed_block() takes
that mutex once and holds it across the whole chunk loop, so both block
reads run inside it:

  mutex_lock(ws->lock);
  for each chunk {
          parse_wof_chunk_table(..., ws->input, ...);   /* reads disk */
          ntfs_read_wof_chunk(..., ws->input, ...);     /* reads disk */
          decompress into ws->output;
  }
  mutex_unlock(ws->lock);

Readers of system-compressed files then serialise system-wide on the disk
waits, not just on the decompressor scratch the lock exists for.  One
reader sleeping in submit_bio_wait() blocks all the rest.

The waits dominate.  Reading an 8 MiB xpress4k file (2048 chunks at a 48%
compressed ratio, so 2048 acquisitions and 4096 block reads) and timing
ws->lock against the part of it spent in ntfs_bdev_read():

  backing store                held     of that in I/O   held after
  virtio, host page cache      348 ms   321 ms  (92%)    24.6 ms
  virtio, throttled 100 MB/s   978 ms   948 ms  (96%)    36.6 ms

The page-cache row is a lower bound, having no seek cost at all, and the
share still grows with slower storage because only the wait scales while
decompression stays near 26 ms.

The reads are inside the lock only because they land in ws->input, a
buffer shared through the workspace.  Nothing else requires it:
parse_wof_chunk_table() and ntfs_read_wof_chunk() already take the buffer
as a parameter and both set *chunk_mem to a pointer inside it, so a
caller-owned buffer works unchanged.

Allocate that buffer per call, do both reads without the lock, and take
the lock only around decompression, which is the step needing ws->output
and ws->scratch.  squashfs is arranged this way already: its
squashfs_decompress() is handed a bio that has been read, and locks only
for the CPU work.

Block reads are unchanged in number, they just no longer run under the
lock, and hold time stops tracking device speed.

This also unnests two per-inode locks from the global one, runlist->lock
taken by both reads and base_ni->mrec_lock taken for a resident stream.
A resident chunk needs no I/O at all, yet used to queue behind a reader
blocked in submit_bio_wait() and then take mrec_lock inside the global
mutex.

The buffer is 4608 bytes for xpress4k and at most 33280 for lzx32k.  This
path already does GFP_NOFS allocations per call in ntfs_attr_iget(), and
in ntfs_attr_get_search_ctx() for a resident stream, so one more does not
change how it behaves under memory pressure.  The workspace keeps output
and scratch, 4 KiB to 32 KiB and 6224 bytes (xpress) or 10240 (lzx), and
its "already allocated" test moves from ws->input to ws->output.

The lock is now taken per chunk rather than per call, which differs only
for a folio spanning several chunks: a few more uncontended mutex
operations in exchange for not holding it across the reads between them.

Verified under QEMU against an uncompressed copy of the same data, on an
8 MiB file and a 100000 byte one, the latter covering the tail chunk that
is not a full comp_unit.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 fs/ntfs/wof.c | 127 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 79 insertions(+), 48 deletions(-)

diff --git a/fs/ntfs/wof.c b/fs/ntfs/wof.c
index 8f84c2212eee..9847259e5b1a 100644
--- a/fs/ntfs/wof.c
+++ b/fs/ntfs/wof.c
@@ -39,8 +39,6 @@ struct ntfs_wof_workspace {
 	struct mutex *lock;
 	const struct ntfs_codec_ops *codec;
 	u32 comp_unit;
-	void *input;
-	size_t input_size;
 	void *output;
 	void *scratch;
 };
@@ -97,30 +95,36 @@ static struct ntfs_wof_workspace *ntfs_wof_workspace(u8 block_size_bits)
 	}
 }
 
+/*
+ * Size of the buffer a chunk is read into.  A chunk is read straight off the
+ * device, so the buffer has to hold @comp_unit bytes plus the leading partial
+ * sector.
+ */
+static size_t ntfs_wof_input_size(const struct ntfs_wof_workspace *ws)
+{
+	return round_up((size_t)ws->comp_unit + 511, 512);
+}
+
 static int ntfs_wof_workspace_prepare(struct ntfs_wof_workspace *ws)
 {
-	void *input, *output, *scratch;
+	void *output, *scratch;
 	size_t scratch_size;
 
-	if (ws->input)
+	if (ws->output)
 		return 0;
 
-	ws->input_size = round_up((size_t)ws->comp_unit + 511, 512);
 	scratch_size = ws->codec->scratch_size(ws->comp_unit);
 	if (!scratch_size)
 		return -EINVAL;
 
-	input = kvmalloc(ws->input_size, GFP_NOFS);
 	output = kvmalloc(ws->comp_unit, GFP_NOFS);
 	scratch = kvzalloc(scratch_size, GFP_NOFS);
-	if (!input || !output || !scratch) {
-		kvfree(input);
+	if (!output || !scratch) {
 		kvfree(output);
 		kvfree(scratch);
 		return -ENOMEM;
 	}
 
-	ws->input = input;
 	ws->output = output;
 	ws->scratch = scratch;
 	return 0;
@@ -134,10 +138,8 @@ void ntfs_wof_free_workspaces(void)
 		struct ntfs_wof_workspace *ws = ntfs_wof_workspaces[i];
 
 		mutex_lock(ws->lock);
-		kvfree(ws->input);
 		kvfree(ws->output);
 		kvfree(ws->scratch);
-		ws->input = NULL;
 		ws->output = NULL;
 		ws->scratch = NULL;
 		mutex_unlock(ws->lock);
@@ -602,6 +604,51 @@ static int ntfs_wof_try_direct(struct ntfs_wof_workspace *ws,
 					     chunk_end, src, src_len, dst_len);
 }
 
+/*
+ * Decompress one chunk into @folio.  Only this step needs the workspace, so it
+ * is the only step that takes the workspace lock.
+ */
+static int ntfs_wof_decompress_chunk(struct ntfs_wof_workspace *ws,
+				     struct ntfs_volume *vol,
+				     struct address_space *mapping,
+				     struct folio *folio, loff_t folio_start,
+				     loff_t folio_end, u64 chunk_file_offset,
+				     char *chunk_mem, u32 chunk_size,
+				     u32 decomp_size)
+{
+	loff_t chunk_end = chunk_file_offset + decomp_size;
+	loff_t copy_start, copy_end;
+	int err;
+
+	mutex_lock(ws->lock);
+	err = ntfs_wof_workspace_prepare(ws);
+	if (err)
+		goto out_unlock;
+
+	err = ntfs_wof_try_direct(ws, mapping, folio, chunk_file_offset,
+				  chunk_end, chunk_mem, chunk_size,
+				  decomp_size);
+	if (err != -EAGAIN)
+		goto out_unlock;
+
+	err = ntfs_wof_decode(ws, chunk_mem, chunk_size, ws->output,
+			      decomp_size);
+	if (err) {
+		ntfs_error(vol->sb, "Decompression failed: %d", err);
+		err = -EINVAL;
+		goto out_unlock;
+	}
+
+	copy_start = max_t(loff_t, folio_start, chunk_file_offset);
+	copy_end = min_t(loff_t, folio_end, chunk_file_offset + decomp_size);
+	memcpy_to_folio(folio, copy_start - folio_start,
+			ws->output + copy_start - chunk_file_offset,
+			copy_end - copy_start);
+out_unlock:
+	mutex_unlock(ws->lock);
+	return err;
+}
+
 int ntfs_read_wof_compressed_block(struct folio *folio)
 {
 	struct address_space *mapping = folio->mapping;
@@ -613,6 +660,8 @@ int ntfs_read_wof_compressed_block(struct folio *folio)
 	loff_t folio_start = folio_pos(folio);
 	loff_t folio_end = folio_next_pos(folio);
 	char *chunk_mem;
+	void *input;
+	size_t input_size;
 	u32 decomp_size;
 	u64 chunk_count, chunk_idx, last_chunk, chunk_offset;
 	int err = 0;
@@ -652,10 +701,12 @@ int ntfs_read_wof_compressed_block(struct folio *folio)
 			goto out_iput;
 	}
 
-	mutex_lock(ws->lock);
-	err = ntfs_wof_workspace_prepare(ws);
-	if (err)
-		goto out_unlock_ws;
+	input_size = ntfs_wof_input_size(ws);
+	input = kvmalloc(input_size, GFP_NOFS);
+	if (!input) {
+		err = -ENOMEM;
+		goto out_iput;
+	}
 
 	chunk_idx = div_u64(folio_start, ws->comp_unit);
 	last_chunk =
@@ -663,55 +714,35 @@ int ntfs_read_wof_compressed_block(struct folio *folio)
 	chunk_count = DIV_ROUND_UP_ULL(i_size, ws->comp_unit);
 	for (; chunk_idx <= last_chunk; chunk_idx++) {
 		u32 chunk_size;
-		u64 chunk_file_offset;
-		loff_t chunk_end, copy_start, copy_end;
 
 		decomp_size = chunk_idx + 1 == chunk_count ?
 				      i_size - chunk_idx * ws->comp_unit :
 				      ws->comp_unit;
 		err = parse_wof_chunk_table(ni, wof_ni, chunk_idx, chunk_count,
 					    decomp_size, &chunk_offset,
-					    &chunk_size, ws->input,
-					    ws->input_size);
+					    &chunk_size, input, input_size);
 		if (err)
-			goto out_unlock_ws;
+			goto out_free_input;
 
 		err = ntfs_read_wof_chunk(vol, wof_ni, chunk_offset, chunk_size,
-					  ws->input, ws->input_size,
-					  &chunk_mem);
+					  input, input_size, &chunk_mem);
 		if (err)
-			goto out_unlock_ws;
-
-		chunk_file_offset = chunk_idx * ws->comp_unit;
-		chunk_end = chunk_file_offset + decomp_size;
-		err = ntfs_wof_try_direct(ws, mapping, folio, chunk_file_offset,
-					  chunk_end, chunk_mem, chunk_size,
-					  decomp_size);
-		if (!err)
-			continue;
-		if (err != -EAGAIN)
-			goto out_unlock_ws;
+			goto out_free_input;
 
-		err = ntfs_wof_decode(ws, chunk_mem, chunk_size, ws->output,
-				      decomp_size);
-		if (err) {
-			ntfs_error(vol->sb, "Decompression failed: %d", err);
-			err = -EINVAL;
-			goto out_unlock_ws;
-		}
-		copy_start = max_t(loff_t, folio_start, chunk_file_offset);
-		copy_end = min_t(loff_t, folio_end,
-				 chunk_file_offset + decomp_size);
-		memcpy_to_folio(folio, copy_start - folio_start,
-				ws->output + copy_start - chunk_file_offset,
-				copy_end - copy_start);
+		err = ntfs_wof_decompress_chunk(ws, vol, mapping, folio,
+						folio_start, folio_end,
+						chunk_idx * ws->comp_unit,
+						chunk_mem, chunk_size,
+						decomp_size);
+		if (err)
+			goto out_free_input;
 	}
 
 	if (folio_end > i_size)
 		folio_zero_segment(folio, i_size - folio_start,
 				   folio_size(folio));
-out_unlock_ws:
-	mutex_unlock(ws->lock);
+out_free_input:
+	kvfree(input);
 out_iput:
 	iput(wof_inode);
 out:

base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
-- 
2.43.0

