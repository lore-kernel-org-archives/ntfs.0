Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E369F351C35
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288538; cv=none; b=JmTqkhiPIFS84etUXqoq+FuVY6lD+GeCFsTw8UmaEirDRGRjwljFnJbfGAhG76pF88ducmSZq/mMAHTEalMdgpTqBPYTOThKU8cd+xUaPImKLivVXTWu8VLwIwJd18yRrlpGpuABy5sPlC9dbau2WdAMOE2dlHSH54NUZL1ZSSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288538; c=relaxed/simple;
	bh=+bbXnq9ogoJtXyldpew1XU76OWC+js6FFZ3dpWCvzy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Us/0f69qhuJTSY1o6n5cbU8hb2SVVPpaSldVwU/ijYG2WuRgvx+NrgU8N/l979bIyC/PL9XwvsehWO2OCm6T2H7SEoffRExPbkxQ+3flrKzfkBIwoQdP+u2DXcjjRHAvWgSmP0NdxPJfBEu2vSmyCHFkRkZSF4aTpd+cWX8Bdys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eg4XE82L; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eg4XE82L"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so494052b3a.0
        for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 22:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787288536; x=1787893336; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p5zrL5jWvlDR2b1iEThCEBY2/HvpSWL9vrwrGgXBlmw=;
        b=Eg4XE82LRiEBpieAbyx0KT3LnXB1TygZBOCcVvKA+q/3odmq5PIfJZPK1M7ss9CgaJ
         YBw4t4pwU/gWbaCR/aOlFYZGYTvmzTm7B8R5g08isFl1eTY6TaRmabE8CxdwG/mQ59if
         f5qyIK/qwHMxKiVPWtRnx1bipYxxXXgu75syTvwp4ECxEAwCzQMESu/XqcT2Qb4WCBLn
         87YDcFkvZ0L9YJXCuCu6FSI3ru47Usz2JPZT8O8hj7naffntPWidakH53rLq+QYtA82/
         FUFedKFGtRPRNUkMc1UfQ01557BOfw6EZ1Ygwt+qB/EDbBGPb5P/K5TBynSOoIF6IqWe
         At7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288536; x=1787893336;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5zrL5jWvlDR2b1iEThCEBY2/HvpSWL9vrwrGgXBlmw=;
        b=ZhsbIQhSffCOQBiWQVUxaCQrDVZuvNyD4g4BEhaKVFv5UlaSjdE5b3EWd5ez7UVGcm
         WcmRQjUMH7it/b+7/3g33+dV12xnLLMv5jgZvhPJqPqj7OigcJslNerfNSNZkbqAojNk
         3bh9evUIIpKjnEVWvoql708/NYRbEOx2JwOyXOZqnovrXfo3tXJhSSXZ93QlsGJ7Ahs8
         NH9D2Fpi0bteGYeO1lcNMTEpSMUmzlLZfEEGAF+m/1lPhX9354jvp8wsDpH3kQZ/wfnu
         2bj65SiOviFW5EDiQCNiroiCt1H38vzhiM8f67r1Pt3RGhomoSlBk7bYcV5z5oX7Eoh3
         GMDg==
X-Forwarded-Encrypted: i=1; AHgh+RoDon2R2xgKbwkNPFxT7TZAX3wt8WJ/RsXN2h+l5Z+fF2kLJLMoMrN6UCYmQHk/u9+nlRkq@lists.linux.dev
X-Gm-Message-State: AFuF++n3SaLcygNhn9z+Xmho3xgPdwfeJ0NM9fXy2PUk0h6RxEH2hdNe
	4NarLc4fpYKyOQH/mXZ+c3nbIHWrsnOsvteIUuD9TLUHUO/6i1Ah5UR4nQyMvg==
X-Gm-Gg: AR+sD10iiln6ld5aWlJW9Rh+kFgdwikMFB8kQgdnJc+alk4dK7ETzb+3Nih80QIQ6tD
	gK9eR8qYzprz+s/5AJnLwSx6aKk9+TX7bUbmXiYKterAMEOSyIJ8Svct3pfJZa/iFbNn6G9zedh
	dI8H632WZTM+iSAqbmOXTGn+Tp3iCI/PrS5na8md+odKRuzviADKY+BV9K08zrf3tTKkjmGk4Tm
	Q9D0c6Kcl0+JuoPYrcF4WcfDGy4Far0gE7iJSpmAtWH+YhopN9xQtRlGlbk3BCLsQ9LiYXpoAxr
	yjeTjMx2vYk1BhwnvgwNbipmQ0++JXQKBBcWZ+fKldzFWAOC6eXf7pIWWOFXaw48/HAtFcgPOmG
	o8/S86pnpe4qpqEyuZDD4b6X9UBbeCARCVeMSN6Ce09CdOfHQQ2AJ4hwGhl00e/eFj4KqweiM6J
	e5aRJOYFF39BNojY0gw3vzRC9Z1NNudS7SMuTXf9XZbO7B/MIkr4UCp3RYSH+fCggCr+I=
X-Received: by 2002:a05:6a00:3992:b0:847:77e9:acbb with SMTP id d2e1a72fcca58-851f9fd0324mr5241349b3a.13.1787288536190;
        Thu, 20 Aug 2026 22:02:16 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a19sm2319545b3a.43.2026.08.20.22.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:02:15 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 10/10] ntfs: support resident WOF decompression
Date: Fri, 21 Aug 2026 14:00:59 +0900
Message-ID: <20260821-topic-wof-v2-v4-10-7a6fa10743b8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821-topic-wof-v2-v4-0-7a6fa10743b8@gmail.com>
References: <20260821-topic-wof-v2-v4-0-7a6fa10743b8@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6952; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=+bbXnq9ogoJtXyldpew1XU76OWC+js6FFZ3dpWCvzy4=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqh9tQMe6w7UYBTVboDnwMyFd4ZO5UaKExIiX8c
 gXCuCTf33qJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaofbUAAKCRA08jD6945I
 06GAEACmNIJWpuqsiU7CdTYxRZeMaCOQvrXKrhvv58jlY4nykHYOxYj9r1rmvGM3hpgGKaODlnt
 2XiDbLU4yRKA+rwRCSdauGM57QsUy8C9xp7y3FciI63+TRJ146pvLMo6X8cEDGy3CptdV294Qtf
 WE/dKIc8sTaFl+0B6R1nhFlaHsvwpHmoQOFOe/NadBjg+6OWnqXdDkaHzq2R4QpFNVQaNskZKA0
 UNOXITbjdgVYEMbswmOlsHW9A9HTsjQ/X2EtYdIFQjY8EADvpnxYCtCPb78qMlFX8m4Rbab6I3b
 j00BNqKszU1wtFZWkBgmbDHCpoPTdJ42YD9+Q1/nLQ2VE03DaswKOaOtYM40ZZX3KMsqnPRr5wt
 BnjPnyTBxig1KUZ72xQkIGyGYa7sq7PDLFywFyAODiSIcEFVMynUdzOdfxQAYxXJXCz+fzxfZt2
 MG0EdR18MfBWXRrvnUsNlZEjzfZR6LQcH7IZ4HglSdz0E8glbpO0Amhfo9iLjLgjm3KOXPUgKdw
 1MhRfD1TtGrwWhE17BA/Moxe/4je/aM0N3sRU+H3sLuT3Zy3Nnq/Hb9zorbiDm1EwkOOb7DghXh
 Ux2Tae41682Ldm4FSAe5SvW3qN4nl+N75iXEgFrF6A85hOZqp0lwh4fR46NQpvv4+NmS1fK3E4m gMYyGwu5Cn1AwIA==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Extend WOF decompression to support files where the  reparse named
data attribute or the compressed chunks themselves are resident. Retrieve
resident metadata using ntfs_attr_lookup() and copy compressed chunks
directly from the resident attribute payload.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/wof.c | 136 ++++++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 94 insertions(+), 42 deletions(-)

diff --git a/fs/ntfs/wof.c b/fs/ntfs/wof.c
index 407c180a733d..8f84c2212eee 100644
--- a/fs/ntfs/wof.c
+++ b/fs/ntfs/wof.c
@@ -244,9 +244,9 @@ static int ntfs_bdev_read_from_rl(struct ntfs_volume *vol,
 
 static int parse_wof_chunk_table(struct ntfs_inode *base_ni,
 				 struct ntfs_inode *ni, u64 chunk_idx,
-				 u64 chunk_count, u64 *chunk_offset,
-				 u32 *chunk_size, void *table_buf,
-				 size_t table_buf_size)
+				 u64 chunk_count, u32 decomp_size,
+				 u64 *chunk_offset, u32 *chunk_size,
+				 void *table_buf, size_t table_buf_size)
 {
 	u8 bytes_per_off;
 	u8 *buf;
@@ -269,11 +269,11 @@ static int parse_wof_chunk_table(struct ntfs_inode *base_ni,
 	chunk_data_size = (u64)ni->data_size - table_size;
 
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
@@ -281,10 +281,7 @@ static int parse_wof_chunk_table(struct ntfs_inode *base_ni,
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
@@ -294,11 +291,45 @@ static int parse_wof_chunk_table(struct ntfs_inode *base_ni,
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
@@ -320,14 +351,15 @@ static int parse_wof_chunk_table(struct ntfs_inode *base_ni,
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
@@ -335,23 +367,54 @@ static int ntfs_read_wof_chunk(struct ntfs_volume *vol,
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
@@ -580,11 +643,7 @@ int ntfs_read_wof_compressed_block(struct folio *folio)
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
@@ -607,22 +666,15 @@ int ntfs_read_wof_compressed_block(struct folio *folio)
 		u64 chunk_file_offset;
 		loff_t chunk_end, copy_start, copy_end;
 
-		err = parse_wof_chunk_table(ni, wof_ni, chunk_idx, chunk_count,
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

