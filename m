Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDE438D006
	for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 07:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787125446; cv=none; b=AmnqUWzO3M9VgKMDqxaAovACEDF6l2ILNsFrbaTGEuP70w0EX0jVIkxUcfJjLZSKCxLy0NJmKT5IxkY4qvGYs/xRHQA9hakdAFEvTQo583QDKeR3UOQBpuhL894kjSH5INYSKDoP2tfJ8g5cMou3IKs8vV+rgzipMpJ5vP/4e/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787125446; c=relaxed/simple;
	bh=SUPmh6CPVP4L1qs+0WNoJf8EKQBdE8Z/EE1dAgHjG+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dzgq644lXNIo5DDI3Kj/sju/uybc3UH4WWGmryjqVNT6WxGa5E6rJGIvzYrLqw6ZCr1F1FxY9mtGzPcUJgPKpAQzhXbd2SHVv7WHvOcy7mCu5TlmP0Mb9gRUl0L1ZU3ZeAuk+4cKeMFl9sflL2LyDlmTHitJgFFyoMPVnCZIu18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ql+y+Wtd; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ql+y+Wtd"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-848643382fcso926324b3a.1
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 00:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787125443; x=1787730243; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8w43mAkc7SQNdT1gFvXCWZd/3R2nddvGvjsG6tiKsMQ=;
        b=ql+y+WtdwGpcvBq+NgdY7oTmEh5uTd075RDpUPcD/u6YNZeVS41Poo5E9ZAfttOP7l
         UakJ/X0zNiEGrsONM8eDj/MnWnpQUB9RW4/JMVt+4WVNiKRSoD9ea+ocfhyAdncNu0e1
         qm8y44YWxhXP33RaVm4YCJZyq8+0MJgZxY9qiyQVi+4wtY903/tbXaUZW3sR4uIS7xJA
         RmOZZG1vUKgm2ib55qkrHZNvqSwgF2rAsd+14qUm6EgiBd0Xv4y5zi+Mk45QCim6b9ng
         4z2/xh+oXwJvfyTtJNCcI29N7nf0+tXQs8dF9XVO4vP3Vzs/s3pOTYrE0LF8cp+p6kNO
         WkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787125443; x=1787730243;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8w43mAkc7SQNdT1gFvXCWZd/3R2nddvGvjsG6tiKsMQ=;
        b=AyBdIxBDUV06SHJsbj9hb9DjQx57AQk1WFPgsjel3rvR5mWrtGBUvSB/jFaPo5/aPk
         ze0vCDWclA91V4hDvQBlHEM/ztUeMN+KSv7c9VSdae9VA4gf9eUa309tLywO5JdpLQcA
         YdKGhPf4YEU3uJF6IJlPoBVi0Y5s2/fw6uQ1xNjBIlWdFBN6qghqk3fylc0P1bWNtZdE
         vI14OyG+MWeTr9Yb37AUYo2iW/0MEbjQIJpcu+XXCOzMDyK47KGXUZOaLAEaIfY8ZYrO
         mFrpznaHmx2S6K0DfmhWfBhdY0nyJXcOUHkaMPVnMZUL/RJ8RorAetx7Bo44aQPR33a0
         duPA==
X-Forwarded-Encrypted: i=1; AHgh+RptmOVNpTB2K0msfGXPu/ePsxucVhvU2whaX0di97faWiiPLuCLMKQ52IIVeZOYTOVr9n+L@lists.linux.dev
X-Gm-Message-State: AOJu0YxsHIf6ioNH76sl3PoHzhjY8oTXsRVxfdmgYgvxYUZOfzFNTryJ
	owJc6WR/5H1xPjNn5zs4RSlk4OObOIbNQSxTEQA5SCRL0f5oz8u0ku/3
X-Gm-Gg: AR+sD11gZ2+bwaG/ZKLSslXpxoeaV08zD7gJi5MXwmQTTS9lpGnyidxTWT5GsaBzvSz
	PtG6McAyUe/0x07fcXI+ParEKQ1JUQJDJEGKDJsemCTyChjjMkv7o8Yen7iaP5lrrU6upzTjNA5
	Ww5tOoE+FpVq1O0M3HROJuwV5Wq6i8RzUzp6/wLCSixc+vB+ptsm5NDt37zx6OD5c3ZNr0XKIED
	iWa2CAZYtGq0vjUbmMPBhhGmKJLG2goIMNSXlTWwaMk35St7aQZK99ox8QeW0zAuxS/1leI4zFQ
	Pi5HMSguuvPmF11DDl+1yk70LOREXaPAiAmjLB1YnL61Sj6xzDXP+FcrS9V4kiJKFCrL/fSiTnu
	e9QB9GZXPwYheli86V6tERaktapPhHrDEokHHZuhF+y/x+dVBbHqoSanmKN5hKp1cMgTjhoNXp/
	PdYk5JN52DHhBAD0ue55q1SxLX1UmAn1SMB0861FFEHEfZMz3q4mYkbaOvCVbfKZtR6H0=
X-Received: by 2002:a05:6a00:8d96:b0:848:599f:26b with SMTP id d2e1a72fcca58-851d3923319mr4743105b3a.14.1787125443293;
        Wed, 19 Aug 2026 00:44:03 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a19sm314623b3a.43.2026.08.19.00.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 00:44:02 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2 8/8] ntfs: support resident WOF decompression
Date: Wed, 19 Aug 2026 16:43:26 +0900
Message-ID: <20260819-topic-wof-v2-v2-8-40f56903e7e7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819-topic-wof-v2-v2-0-40f56903e7e7@gmail.com>
References: <20260819-topic-wof-v2-v2-0-40f56903e7e7@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7378; i=hyc.lee@gmail.com; h=from:subject:message-id; bh=SUPmh6CPVP4L1qs+0WNoJf8EKQBdE8Z/EE1dAgHjG+o=; b=kA0DAAoBNPIw+veOSNMByyZiAGqFXnGj0aOhJRcCW0iqok+przeNA+uRRpzKt9PbmY0ujtPPH okCMwQAAQoAHRYhBNWFKcxTduNtbh5vYjTyMPr3jkjTBQJqhV5xAAoJEDTyMPr3jkjTDKIP/R58 I2hoMDYHkxpTLNPuGKdcgd57tetPbqIJcYITBpnU6j9nJBnEofZsd2jDgXRLHu8Nyd3dMMwpaI3 0TY3ha/69/eaVyhWP98rUglInZ73kA2R6iZugRgrMWJvLruagW1/h53hHCWs5ee34QW8IRE4/1W KLXDExk6XeCGrc4rksAt8/CMqjjLFFHsxRKeT8cVCeBSP4vTmxXij2GXZESs9MQc5L9p1X3/rdT fomHkB9Gcztrp3H4qg2TQSOC9r6FKFJN4J3UutCJeC8zAROC4a3vJJDoGFfhm46Qeg+wT1acJ9P sNioJxr9QDJo689iRAsy4APYPEpOxQNvWXOqawiD3Zz5Bb5bUuJvIdWjftEztXsUlEm1SeTEZAM NxJZFqIwBJc6tGNcA5wV0iKHaz1cavSEKUe9/TT6sp/xzigy88uD7lWBrC4oYzCSjgPUCl1j7tA cNwuJr+9i8zZ4kowUo94ee6QAO/ikOcyP8vdc5FJI1MXwfUS5KxniiqBkFuCS4UBV68SAk/fjWE RT9U9LjRXYofgpHNCuG4PLNmVfQ9S4faI6bV++qp511E8YjdPSkWSzz25gFIIU2YHjXPvyxQfqD o7GtaNgBBUdWPu+39NrqkmHNaaMtWggjWUz4ULDgC6joJppfW/ocJHo0R0FPJb7USp8EYu56sip jCrR9
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Extend WOF decompression to support files where the  reparse named
data attribute or the compressed chunks themselves are resident. Retrieve
resident metadata using ntfs_attr_lookup() and copy compressed chunks
directly from the resident attribute payload.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/wof.c | 141 ++++++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 97 insertions(+), 44 deletions(-)

diff --git a/fs/ntfs/wof.c b/fs/ntfs/wof.c
index b1d89df75dcf..2b4a8ae73889 100644
--- a/fs/ntfs/wof.c
+++ b/fs/ntfs/wof.c
@@ -242,10 +242,11 @@ static int ntfs_bdev_read_from_rl(struct ntfs_volume *vol,
 	return err;
 }
 
-static int parse_wof_chunk_table(struct ntfs_inode *ni, u64 chunk_idx,
-				 u64 chunk_count, u64 *chunk_offset,
-				 u32 *chunk_size, void *table_buf,
-				 size_t table_buf_size)
+static int parse_wof_chunk_table(struct ntfs_inode *base_ni,
+				 struct ntfs_inode *ni, u64 chunk_idx,
+				 u64 chunk_count, u32 decomp_size,
+				 u64 *chunk_offset, u32 *chunk_size,
+				 void *table_buf, size_t table_buf_size)
 {
 	u8 bytes_per_off;
 	u8 *buf;
@@ -254,7 +255,7 @@ static int parse_wof_chunk_table(struct ntfs_inode *ni, u64 chunk_idx,
 	u32 bytes_to_read;
 	int ret = 0;
 
-	if (ni->data_size < (1ULL << 32))
+	if (i_size_read(VFS_I(base_ni)) < (1ULL << 32))
 		bytes_per_off = sizeof(__le32);
 	else
 		bytes_per_off = sizeof(__le64);
@@ -268,11 +269,11 @@ static int parse_wof_chunk_table(struct ntfs_inode *ni, u64 chunk_idx,
 	chunk_data_size = ni->data_size - table_size;
 
 	if (chunk_count == 1) {
-		if (chunk_data_size > U32_MAX)
+		if (chunk_data_size > decomp_size)
 			return -EINVAL;
 		*chunk_offset = 0;
 		*chunk_size = chunk_data_size;
-		return 0;
+		goto out;
 	}
 
 	byte_off = chunk_idx ? (chunk_idx - 1) * bytes_per_off : 0;
@@ -280,10 +281,7 @@ static int parse_wof_chunk_table(struct ntfs_inode *ni, u64 chunk_idx,
 				bytes_per_off :
 				(chunk_idx ? 2 : 1) * bytes_per_off;
 
-	if (!NInoNonResident(ni))
-		return -EOPNOTSUPP;
-
-	{
+	if (NInoNonResident(ni)) {
 		sector_t start_sector = byte_off >> 9;
 		u32 sector_off = byte_off & ((1 << 9) - 1);
 		u32 sectors = DIV_ROUND_UP(sector_off + bytes_to_read, 512);
@@ -293,11 +291,45 @@ static int parse_wof_chunk_table(struct ntfs_inode *ni, u64 chunk_idx,
 		buf = table_buf;
 		ret = ntfs_bdev_read_from_rl(ni->vol, &ni->runlist,
 					     start_sector, sectors, buf);
-		if (ret) {
-			ret = -EIO;
-			return ret;
-		}
+		if (ret)
+			return -EIO;
 		buf += sector_off;
+	} else {
+		struct ntfs_attr_search_ctx *ctx;
+		u32 value_length;
+		u16 value_offset;
+
+		if (bytes_to_read > table_buf_size)
+			return -EINVAL;
+
+		mutex_lock(&base_ni->mrec_lock);
+		ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
+		if (!ctx) {
+			ret = -ENOMEM;
+			goto out_unlock_mrec;
+		}
+		ret = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
+				       CASE_SENSITIVE, 0, NULL, 0, ctx);
+		if (ret)
+			goto out_put_ctx;
+
+		value_length =
+			le32_to_cpu(ctx->attr->data.resident.value_length);
+		value_offset =
+			le16_to_cpu(ctx->attr->data.resident.value_offset);
+		if (byte_off + bytes_to_read > value_length) {
+			ret = -EINVAL;
+			goto out_put_ctx;
+		}
+		memcpy(table_buf, (u8 *)ctx->attr + value_offset + byte_off,
+		       bytes_to_read);
+		buf = table_buf;
+out_put_ctx:
+		ntfs_attr_put_search_ctx(ctx);
+out_unlock_mrec:
+		mutex_unlock(&base_ni->mrec_lock);
+		if (ret)
+			return ret;
 	}
 
 	if (bytes_per_off == sizeof(__le32)) {
@@ -313,14 +345,15 @@ static int parse_wof_chunk_table(struct ntfs_inode *ni, u64 chunk_idx,
 	}
 
 	if (off[1] <= off[0] || off[1] > chunk_data_size ||
-	    off[1] - off[0] > U32_MAX) {
-		ret = -EINVAL;
-		return ret;
-	}
+	    off[1] - off[0] > decomp_size)
+		return -EINVAL;
 
 	*chunk_offset = table_size + off[0];
 	*chunk_size = off[1] - off[0];
-	return ret;
+out:
+	if (!*chunk_size)
+		return -EINVAL;
+	return 0;
 }
 
 static int ntfs_read_wof_chunk(struct ntfs_volume *vol,
@@ -328,23 +361,54 @@ static int ntfs_read_wof_chunk(struct ntfs_volume *vol,
 			       u32 chunk_size, void *input, size_t input_size,
 			       char **chunk_mem)
 {
+	struct ntfs_inode *base_ni = wof_ni->ext.base_ntfs_ino;
+	struct ntfs_attr_search_ctx *ctx;
 	u32 input_offset = chunk_offset & 511;
 	u32 input_size_aligned;
+	u32 value_length;
+	u16 value_offset;
 	int err;
 
 	input_size_aligned = round_up(chunk_size + input_offset, 512);
 	if (input_size_aligned > input_size)
 		return -EINVAL;
 
-	if (!NInoNonResident(wof_ni))
-		return -EOPNOTSUPP;
+	if (NInoNonResident(wof_ni)) {
+		err = ntfs_bdev_read_from_rl(vol, &wof_ni->runlist,
+					     chunk_offset >> 9,
+					     input_size_aligned >> 9, input);
+		if (err)
+			return err;
+		*chunk_mem = (u8 *)input + input_offset;
+		return 0;
+	}
+
+	mutex_lock(&base_ni->mrec_lock);
+	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
+	if (!ctx) {
+		err = -ENOMEM;
+		goto out_unlock_mrec;
+	}
 
-	err = ntfs_bdev_read_from_rl(vol, &wof_ni->runlist, chunk_offset >> 9,
-				     input_size_aligned >> 9, input);
+	err = ntfs_attr_lookup(wof_ni->type, wof_ni->name, wof_ni->name_len,
+			       CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (err)
-		return err;
-	*chunk_mem = (u8 *)input + input_offset;
-	return 0;
+		goto out_put_ctx;
+
+	value_length = le32_to_cpu(ctx->attr->data.resident.value_length);
+	value_offset = le16_to_cpu(ctx->attr->data.resident.value_offset);
+	if (chunk_offset + chunk_size > value_length) {
+		err = -EINVAL;
+		goto out_put_ctx;
+	}
+	memcpy(input, (u8 *)ctx->attr + value_offset + chunk_offset,
+	       chunk_size);
+	*chunk_mem = input;
+out_put_ctx:
+	ntfs_attr_put_search_ctx(ctx);
+out_unlock_mrec:
+	mutex_unlock(&base_ni->mrec_lock);
+	return err;
 }
 
 struct ntfs_wof_dest {
@@ -573,11 +637,7 @@ int ntfs_read_wof_compressed_block(struct folio *folio)
 		err = -EIO;
 		goto out_iput;
 	}
-	if (!NInoNonResident(wof_ni)) {
-		err = -EOPNOTSUPP;
-		goto out_iput;
-	}
-	if (!NInoFullyMapped(wof_ni)) {
+	if (NInoNonResident(wof_ni) && !NInoFullyMapped(wof_ni)) {
 		down_write(&wof_ni->runlist.lock);
 		if (!NInoFullyMapped(wof_ni))
 			err = ntfs_attr_map_whole_runlist(wof_ni);
@@ -600,22 +660,15 @@ int ntfs_read_wof_compressed_block(struct folio *folio)
 		u64 chunk_file_offset;
 		loff_t chunk_end, copy_start, copy_end;
 
-		err = parse_wof_chunk_table(wof_ni, chunk_idx, chunk_count,
-					    &chunk_offset, &chunk_size,
-					    ws->input, ws->input_size);
-		if (err)
-			goto out_unlock_ws;
 		decomp_size = chunk_idx + 1 == chunk_count ?
 				      i_size - chunk_idx * ws->comp_unit :
 				      ws->comp_unit;
-		if (!chunk_size || chunk_size > decomp_size) {
-			ntfs_error(
-				vol->sb,
-				"Invalid compressed size (%u) for frame size (%u)",
-				chunk_size, decomp_size);
-			err = -EINVAL;
+		err = parse_wof_chunk_table(ni, wof_ni, chunk_idx, chunk_count,
+					    decomp_size, &chunk_offset,
+					    &chunk_size, ws->input,
+					    ws->input_size);
+		if (err)
 			goto out_unlock_ws;
-		}
 
 		err = ntfs_read_wof_chunk(vol, wof_ni, chunk_offset, chunk_size,
 					  ws->input, ws->input_size,

-- 
2.43.0

