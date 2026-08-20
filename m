Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4023AAF45
	for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 05:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787204994; cv=none; b=FHdocT+fzwAD+H4J8vBLwL/ztHfRlqqnqaOaVWrEVdECSJW6bLflOFHKizn6uoTwrGWVx+ZP3VnHqu0QmsJ+yqP4ZUMv3NPGgecGXh5z9in2YvmnPl3wAkX3oukjmabxSEeoGqZPNjLaCPaEedbMmotLpTov5fw1WXE8FiTDY5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787204994; c=relaxed/simple;
	bh=U7ZtRBuA7hunRw0EPvHlnYJVlBkFDLXj3OLhjnVi0M0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mAZ/pCuGQc7k6oBAr4GQF6LeX914iBp5vd9orw89R8q9NyZLsbREyOxkAXfuchYKxxGGb+0rm77livBgd0dt3lgsQte0ha2VaSzi2DIsCHNRCi+69g3vbYWbDQPw9giycoAe3P5TWZ4yOtPfUkY7A3zrgaOjaDNs1IrIJ5jygC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYNb8v6+; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYNb8v6+"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3900e39d935so1880979a91.0
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 22:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787204993; x=1787809793; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q0gLPPW6hJLdtv0lAsQBxVSyB84YVjMkB40qPzXR3Gk=;
        b=RYNb8v6+EVUHqhu2XtZyNteP467fBkg5/2bAULXWOqTZfFMVp5hUMyQcFZQLiNg3ZU
         p041YVC/V6iD/q1tMBNQF9DvGJ2OJ2WOzS+AlXeLqh7a/3zuGZ2PUif4UzvUM4b5byf5
         e5nArrXNGLkjYf9lZAeyQfx3pyA669Wt4/OPlUzJvjJ9gB94Hxeu1UY4oRk6NKUs3h0e
         /OjSjYRAh+dozexl9azIJNVJk6LClo/BrAoaIgmM41RcJSUwAACfoCCVC27/0VxCLKXF
         xE6sUXtMqd2qFF0D/iyxER5jpL1qapR083liXBvfONj3U76eBzREf6H/481rQqq3x3+F
         ojQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204993; x=1787809793;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0gLPPW6hJLdtv0lAsQBxVSyB84YVjMkB40qPzXR3Gk=;
        b=n/yaT4GnNOCCJhEug90ITfMK3RFPlvCfmsZo3pzyiENtvJ579mQben/ady5GBeameb
         TknCejTwm0yv6X7lqfoFYs9WTAtBOQ2OK87D4mlFBEQk2PW8lMAs2delgJ89urUm5x/z
         Zp3xqRig0qBlPkmNFVAZwfrXdZTVssK3wX4CvpiMeFyLVl6iVdobG3NQsHqCUsDPAyqU
         8XOknLqPiJp5/SZmUBRVHvH7wZujXYixfoIsrcWLp51MoIhCEP4mAIqEYVJKRyTyTF2r
         O1A2dNjNbpl1cZYUGSGnDpiC9YXwRQ8nOP4vCFlmm/qXWyORNqOuYBDdM6SKWNvS2D86
         8BFA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0HSUmDJo5YR6rFVHslpiIvgKUq0AF/dVDFvZIWcB1Pa5c4Xpn/Ozn5Sa46oiA+PzbrnjQ@lists.linux.dev
X-Gm-Message-State: AFuF++mc1X6WaIWAS7+F7ZQpqRahIkuOpqmEouRKuANHQ8LnWfdd9KPr
	Ae0jTGum0OB6+odVZ726BkQAhrzF/L8gWIPnpBxh73WvB5SQdNXqo5vP
X-Gm-Gg: AR+sD12FX74l7vpAm2t/OdDHtxYvwONRP8LOw/M6UZ7mhUt6qLK8LkhUC8JI5T179Js
	h1XzLXywF1lIHVthKXPp6Krimc4WqrwoYuv1YiLkOWtqn3uoh7VlYVIzgBTwweByfKM7qDvjxvM
	Z1CREiWs7K2hb7+uB5EEzc6tISRq9sJixyS/A9GFFUYb0JKOUBLOdz8XGjihzBYw9LxOImzcdKy
	a5QNubUZSiRwvALxIzvTEqQglc3BYnPUY1YfB1brdWSxgFzFWI2BAJ+35pBnWYwSOeQXxwu6WsZ
	bl/O43Ik5D0Eg8lJ33Ed5rvkL3adC+RXBh6OQwkgMjk81JMIMTBAD8FbFobZd/PTFnVJV/dz50M
	9PsdBwHyW9mN5hfhVMymXe56kbZoK5U3ibmjtvAL5ED3eVpu/burqdepuZ8gP+Spww+yvBRGF2V
	uy6gD7Qsq7/7Hn78TEHpz/zGznYnUyzfnjUGLiK82zgw/GvyjN/Ri0kr+Ki6FHMpqxG3M=
X-Received: by 2002:a17:90b:2b4f:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39580f0d585mr20007354a91.6.1787204992608;
        Wed, 19 Aug 2026 22:49:52 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395b66bccf5sm106766a91.2.2026.08.19.22.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:49:52 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 9/9] ntfs: support resident WOF decompression
Date: Thu, 20 Aug 2026 14:48:22 +0900
Message-ID: <20260820-topic-wof-v2-v3-9-ef6149b4541e@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820-topic-wof-v2-v3-0-ef6149b4541e@gmail.com>
References: <20260820-topic-wof-v2-v3-0-ef6149b4541e@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6947; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=U7ZtRBuA7hunRw0EPvHlnYJVlBkFDLXj3OLhjnVi0M0=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhpUOzaudWI+ShPdDda/3kSE0yuSiy5LTyAVg+
 Kdb3AB4q8qJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoaVDgAKCRA08jD6945I
 0/SjEAC407ji7Zr3S9Oqo84hzEXuLOkXd4c09wuOG1/ipmOM18FBmwmikU/+TFPUQerLf1l0v5J
 H+IIDEZ4OWprNlmptGNrsA3NZ5aDxnapIK+eC5UGOdbBfQ8CqeUJ+f1/NgnAG4Q38Jrn5/SYBPL
 ujRchE3do5QBTcVG6JyIXLT2HTt297/EUA1XNquuavhp67rA/ZrFjBhO4oBf71mteznEuzm89cz
 fiMPuyah0fprUw9H932mxGWsldfKNBCDyzlBcy4EewwiS9e3RjqMvKdMZwM3i8Az8Bcbb0HVN+a
 pTV3wU9asCvCEetJJ6Zvxi+51oUby0efw7GfZ/sYzb3lQMZArH+K3gUwO6c3DIleoJVR4cIvbM7
 29pqQ7fcsI2Q7f7lXPZMJ0lkm2mRfmx+LCA0SRFQDYBzkNu3hJDjQFGDyBJdWj3ZeYpt6ldC0fO
 DPOixIFlW2hkEWQvYwmhEFsE8u9wPLeWnjBzX7ngV4LdXtTLSqSfvjkECrxgKmwwFfuefPh6iM2
 ZG2uC0BjYZtTCnv+dm1s7xNxsLHjPTR/B6eNeaI3YCK5Y/XeFFSrHc5UqKqnZBcEumbU2zE2uPU
 KtzetMUXe9jRMpbNcWkv4iLVKbvr3Enb6BpjFxgdUcGGQ7stG81DlCPOlu0xCeNqKAv0aPFZpKp EWQv1DMKdLmiQ4A==
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
index 444b7c4ee0d6..2b4a8ae73889 100644
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
@@ -314,14 +345,15 @@ static int parse_wof_chunk_table(struct ntfs_inode *base_ni,
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
@@ -329,23 +361,54 @@ static int ntfs_read_wof_chunk(struct ntfs_volume *vol,
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
@@ -574,11 +637,7 @@ int ntfs_read_wof_compressed_block(struct folio *folio)
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
@@ -601,22 +660,15 @@ int ntfs_read_wof_compressed_block(struct folio *folio)
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

