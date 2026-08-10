Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634C1381B0A
	for <ntfs@lists.linux.dev>; Mon, 10 Aug 2026 04:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337314; cv=none; b=B5M9Kn33IHRE1S2zNQ6vRouKdr4kwkR6zsuTPdvEQXu9F/OQ7wfRpHJfE0UhfokU9bQjzuLA+ksu072TUtFaOib1NhZlblqZSpVYbPRAc1GjzVCvNv48Wdh9sfd4Y9vhj80NgbK0xHRb3lrYYjHT6Qe7Or8CzopSdqajCdjQeJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337314; c=relaxed/simple;
	bh=0o99TCxw3kqSLrzy385lULUQzqEFEzibqtMiGKQLAqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JtP2HhBdMwLrfrbapieHOKIMQru/7e67bCyNFpT02IrDObWo9E6X8C0kOJSvBhNBqLwRZtEOWQcFuiCMPVvRm0T55Z+VQuzVWe2cAyq4+qqSMH9NRu3mcu1yYRPaXFcKDdfgnigMyHYDvVH5kT2zM7LZGpWPj4EiOP40kY+yitU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpzC6NaK; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpzC6NaK"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e7109321dso779264a91.3
        for <ntfs@lists.linux.dev>; Sun, 09 Aug 2026 21:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786337310; x=1786942110; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fq7nhTSTTRPtGaEtu6ggKx7xggpzDEzW+A1IoaMWaMA=;
        b=DpzC6NaKdnuSjWtxKp0KAXGH4hmLyviYfOL3ytxa9o8RF+5qehYmYiKUw+bJFniBax
         MMj5MjaQZgKbCoDQlmopREiZj4EBDmloqteD+Zk0wR9bzM530EazzXfGRK2KanhjLmRQ
         uus87I6Sg0VbQ2+7hAz0DTXZkENhxiYUKf2oxj6yYQTojjT3dKk4f6LshxfKkrkKysFh
         +BfDbZeaRR06AjeOzhUWUqQ87/PvHuizZ7d8gzKnjc7Yc2qUHbVyL+fzv10W1iRNH9WA
         d65LgY7AxYjg69cLgP3hJEsjb2IMmp3ibEjh2LINxT3Qn6DbwK6ItEbxHf0pqb1padhU
         SvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337310; x=1786942110;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fq7nhTSTTRPtGaEtu6ggKx7xggpzDEzW+A1IoaMWaMA=;
        b=Qfku/CvvMhjnnbX1IlIXRQ/Ml194JhPhKcGaiqcI/s6azg+udZcYNsNELqMgIOWUPu
         upiqvDQwyR9WcOD115uSSnBDfnFsZTvOIxAcHmY/d/570II4sd4tNaG1Pwuk/GsDSRTk
         jhGofeIOxRj6TrtK/SNL8tkTvNRSdkkNSXtkNpNnreXw0fgo1I6dr8XCNlgA5UFedJiE
         AHnMgpUhe9rQQq6NSgI8q9U3B4LzWM/xOBb/K+0q0xTsbDX7nHx6lHN2BzQSJBicpBwR
         N1whjhFwmXu4bhRHxWmJBK55wk2B171iYJjuA9dKNk5n9mx7JpS4Nu57wO76nrUv521A
         vinw==
X-Forwarded-Encrypted: i=1; AHgh+RqHkjRXY1io2ACCpQzi8pMJulc4AWcY7UwmfP44+OBxtVkvddmRNsMmul0GqIvcOBeDl5wa@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx7xVR9GcExri9FkSRLwUeD8OXNgA1JsX298UFbWZ08AzJMaLO
	OvddS0nv51ca42XVnJvDQXQRCQc9WsJrBzvQats8IFd1kwk1AKtkgxhN
X-Gm-Gg: AR+sD10w/sokWohEGZlTlW9o6NDpQ8Qtzxf6ksYUDwTRKPkeQt2LahDPEsK/GFfPle+
	PDuIMQF5YIfp8gWek1TyCFcTBljyyNNoty5nsJvpznvQY4U65m6OTB5F8Sw3ZwapsrCN6ApYY5U
	AlzYokFulvVYvU6di3XJsFAYTdOruFQRGte5ffYRzp7p0yQ5RLB2BB8VNjZt4vAgXk/U1iWKXVv
	F0WoLc+N2AK65cN0e1ES0/iy4zKtrGZcQUWcEzUnQUsgPNNUkW3If2Lx/PajHO5v63lg/qRgz+J
	Ul/klKSbekCPHKKNDVrhkzqSSP5/d6O8KhvogVfmUZtcH3Gd6SHYpWFd2ZPDsAI9LP0AUSEp+pM
	Jk4u3Nvm1L7Dp6bf4c5WO9JrCkxVALV/pNL+PD/N+Di25dETlj08Xc0F0NQZtm0dTylcepXcNPL
	cwGLQz0kWmc74OTyj2kvWf3cVOKVkSFTw9/y/heY1AeD2erKv2XbhxREdVth9f/wNE5Ys=
X-Received: by 2002:a17:90b:1807:b0:38e:6dd:a9ad with SMTP id 98e67ed59e1d1-39281b1b0c8mr15915394a91.0.1786337310456;
        Sun, 09 Aug 2026 21:48:30 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dc396dsm13045106a91.3.2026.08.09.21.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:48:29 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 8/8] ntfs: support resident WOF decompression
Date: Mon, 10 Aug 2026 13:48:02 +0900
Message-ID: <20260810-topic-wof-v1-8-6a97cfa3bb59@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810-topic-wof-v1-0-6a97cfa3bb59@gmail.com>
References: <20260810-topic-wof-v1-0-6a97cfa3bb59@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5062; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=0o99TCxw3kqSLrzy385lULUQzqEFEzibqtMiGKQLAqE=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqeVeR3Llq1VY0kLf3v0x0vtItOMkQ6mtJzV3xy
 FJTaKyNE7iJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCanlXkQAKCRA08jD6945I
 0yVhD/9hTqT/qmhOyg4sF6iz2MtCTdCdxX9QBHztRuiEs1kqWOE6SO0+zbIf36SGnaIoowrLm/l
 a70OgDW8XtyioiTd0BrdsMISGRri19SiYxqIhOFM1vTVlGzzxPWP2XcO1a/QQZK6B90Vi1hd4wd
 0u46tlfx/TxxZpYTeuTwIK4FGohd9idxoLEISwUJ99fbjJ31OHIL3ouaz9uEZakXhj4ij4cn/lF
 hlZG2hgEt4VoeRV/Ng6SRM/Z8fn+loZES8fl4tEuEK5oMtz5RjJJ+DxqRWD6Y4AOa0O6sWjsD0x
 HzXbNB/OLbvW+hl0lMY5iCBwf2p++4YSorjYo9R/RYdKXihvBpnUtCglj+Rcek7gdzUzfcY6wGR
 xbH9JY+HxhD0JPsmBA+dZEq6AYp2Tgz5hiXdXRluyUadss64TWotRLGINikJpJpttrEVvJl6cwO
 dsjAwZj+kmKW0rdLwV72G/dQBs2QR3Q4vknw65MThkQAdXeGrQuTM3F1MTJrGv6CToytJnGKH+x
 i1akXWjSN8sZUmp7reV+jIQPxAhZGbdT7F9pdxMHNpqdQGDWdWlZomhpWbJFiO+ES/4xY35HN9T
 885rVrQmamO19jy0DizzOcGZBExUfcPdlHYakhEqSW4itDyuv9xW6VJW+yAHGy6Ov6PI8KlNCRG rfMkY0WKm+GVtjg==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Extend WOF decompression to support files where the  reparse named
data attribute or the compressed chunks themselves are resident. Retrieve
resident metadata using ntfs_attr_lookup() and copy compressed chunks
directly from the resident attribute payload.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/wof.c | 114 +++++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 90 insertions(+), 24 deletions(-)

diff --git a/fs/ntfs/wof.c b/fs/ntfs/wof.c
index 4c2a5943ffaf..dd80b30cf123 100644
--- a/fs/ntfs/wof.c
+++ b/fs/ntfs/wof.c
@@ -99,7 +99,8 @@ static int parse_wof_chunk_table(struct ntfs_inode *ni, u64 chunk_idx, u64 chunk
 {
 	u8 bytes_per_off;
 	u8 *buf_aligned = NULL, *buf = NULL;
-	u64 off[2];
+	u64 addr[2] = {0, }, off[2];
+	u64 byte_off;
 	u64 chunk_data_size;
 	int ret = 0;
 
@@ -114,16 +115,15 @@ static int parse_wof_chunk_table(struct ntfs_inode *ni, u64 chunk_idx, u64 chunk
 		return -EINVAL;
 	chunk_data_size = ni->data_size - (chunk_count - 1) * bytes_per_off;
 
+	if (chunk_idx > 0)
+		byte_off = (chunk_idx - 1) * bytes_per_off;
+	else
+		byte_off = 0;
+
 	if (NInoNonResident(ni)) {
-		u64 byte_off;
 		sector_t start_sector;
 		u32 sector_off, sectors;
 
-		if (chunk_idx > 0)
-			byte_off = (chunk_idx - 1) * bytes_per_off;
-		else
-			byte_off = 0;
-
 		start_sector = byte_off >> 9;
 		sector_off = byte_off & ((1 << 9) - 1);
 		sectors = DIV_ROUND_UP(sector_off + 2 * bytes_per_off, 512);
@@ -139,21 +139,61 @@ static int parse_wof_chunk_table(struct ntfs_inode *ni, u64 chunk_idx, u64 chunk
 			goto out;
 		}
 		buf = buf_aligned + sector_off;
+	} else {
+		struct ntfs_attr_search_ctx *ctx = NULL;
+		u32 value_length;
+		u16 value_offset;
+		u8 *attr;
+
+		ctx = ntfs_attr_get_search_ctx(ni, NULL);
+		if (!ctx) {
+			ret = -ENOMEM;
+			goto out;
+		}
 
-		if (chunk_idx + 1 == chunk_count) {
-			if (bytes_per_off == sizeof(__le32))
-				((__le32 *)buf)[1] =
-					cpu_to_le32(ni->data_size -
-						    (chunk_count - 1) * bytes_per_off);
-			else
-				((__le64 *)buf)[1] =
-					cpu_to_le64(ni->data_size -
-						    (chunk_count - 1) * bytes_per_off);
+		ret = ntfs_attr_lookup(AT_DATA, (__le16 *)WOF_NAME,
+				       WOF_NAME_LEN, CASE_SENSITIVE, 0, NULL, 0,
+				       ctx);
+		if (ret) {
+			ntfs_attr_put_search_ctx(ctx);
+			goto out;
 		}
-	} else {
-		/* Resident WOF chunk table logic will be added in Commit 8 */
-		ret = -EOPNOTSUPP;
-		goto out;
+
+		value_length =
+			le32_to_cpu(ctx->attr->data.resident.value_length);
+		value_offset =
+			le16_to_cpu(ctx->attr->data.resident.value_offset);
+
+		if (byte_off + bytes_per_off > value_length ||
+		    (chunk_idx + 1 != chunk_count &&
+		     byte_off + 2 * bytes_per_off > value_length)) {
+			ntfs_attr_put_search_ctx(ctx);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		attr = (u8 *)ctx->attr + value_offset;
+
+		if (chunk_idx + 1 == chunk_count)
+			memcpy((u8 *)addr, attr + byte_off, bytes_per_off);
+		else
+			memcpy((u8 *)addr, attr + byte_off, 2 * bytes_per_off);
+
+		buf = (u8 *)addr;
+
+		ntfs_attr_put_search_ctx(ctx);
+	}
+
+	/* Last chunk has an implicit end offset derived from data_size. */
+	if (chunk_idx + 1 == chunk_count) {
+		if (bytes_per_off == sizeof(__le32))
+			((__le32 *)buf)[1] =
+				cpu_to_le32(ni->data_size -
+					    (chunk_count - 1) * bytes_per_off);
+		else
+			((__le64 *)buf)[1] =
+				cpu_to_le64(ni->data_size -
+					    (chunk_count - 1) * bytes_per_off);
 	}
 
 	if (bytes_per_off == sizeof(__le32)) {
@@ -243,7 +283,7 @@ int ntfs_read_wof_compressed_block(struct folio *folio)
 	}
 
 	wof_ni = NTFS_I(wof_inode);
-	if (!wof_ni->runlist.rl) {
+	if (NInoNonResident(wof_ni) && !NInoFullyMapped(wof_ni)) {
 		err = ntfs_attr_map_whole_runlist(wof_ni);
 		if (err)
 			goto out_iput;
@@ -308,9 +348,35 @@ int ntfs_read_wof_compressed_block(struct folio *folio)
 
 	/* Read compressed data from disk */
 	if (!NInoNonResident(wof_ni)) {
-		/* Resident WOF data read logic will be added in Commit 8 */
-		err = -EOPNOTSUPP;
-		goto out_free;
+		struct ntfs_attr_search_ctx *ctx = NULL;
+
+		ctx = ntfs_attr_get_search_ctx(wof_ni, NULL);
+		if (!ctx) {
+			err = -ENOMEM;
+			goto out_free;
+		}
+
+		err = ntfs_attr_lookup(AT_DATA, (__le16 *)WOF_NAME,
+				       WOF_NAME_LEN, CASE_SENSITIVE,
+				       0, NULL, 0, ctx);
+		if (err) {
+			ntfs_attr_put_search_ctx(ctx);
+			goto out_free;
+		}
+
+		if (chunk_offset + chunk_size >
+		    le32_to_cpu(ctx->attr->data.resident.value_length)) {
+			ntfs_attr_put_search_ctx(ctx);
+			err = -EINVAL;
+			goto out_free;
+		}
+
+		memcpy(chunk_mem_aligned,
+		       (u8 *)ctx->attr +
+		       le16_to_cpu(ctx->attr->data.resident.value_offset) +
+		       chunk_offset, chunk_size);
+		ntfs_attr_put_search_ctx(ctx);
+		chunk_mem = chunk_mem_aligned;
 	} else {
 		err = ntfs_bdev_read_from_rl(vol, &wof_ni->runlist,
 					     chunk_offset >> 9,

-- 
2.43.0

