Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A414E38D014
	for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 07:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787125440; cv=none; b=TriBvbdYtEuUoraZ2M2GxOPgNVqVgecRgTQAFuIgKClY9ZA5GwweehwziXnlVMcjvmmOLF2lHhTq+uW3525LwWEJHIT5mMY7xclzVN3oEfbu3M1hNT7PkXJQMWdCg99CF8Jg/Wl4Q2Midy8cX4HxfbRfc/NIdy7KoHRZgD/O+R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787125440; c=relaxed/simple;
	bh=ezLLljtWUNmvnqnVKGP/WLXf/QhjLRYsYSNqXYlPugs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mZo6Quy6kQncl/aejA1aWIECTmj14bv+ECtL0c/yut0bQlB6+eJBoW/SVF1OhwmNJToq2QuzPmuAkN4o9UceYkIIiixSW4zKwfF6AjQiZdUlxahv6kITiresjLGvpHm4LYn2SygH4RzgJmf7XFXknNFLGS69tzi1yxg7sIxyKXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRXkjETm; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRXkjETm"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-848643382fcso926271b3a.1
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 00:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787125438; x=1787730238; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k0NUImn1oG7DqNp4/p8jkehokCgj80N7VsU6UHcMCgo=;
        b=SRXkjETmYaSTeNTE7JC4SBvIgSbMmADVin1ntt1PeW4XLfOASDUsDE4ghbeW1S/jhC
         5jJNbd5aaYb3rH/xqgGzO45r903yEDE+9Vh4rryJ2Bl6uRTDtSPXMcXitE3J52NyZdpy
         t8mw0JNjJUELTwuQ16HtMhWc0PD+jfrFAmnPOajQ97sE98kQZB5D/xSXg/1tbjoen0gf
         KJtsjK/8lRVe3ymE45Se5dpdLSBTryaXg8lAJsEelpkD3QRmrhdJRSn0VK1Ko3m53b78
         r+ICHyp5PUJWMNxFaa1UoiFIKhUWWfVjeaafgtOqEoADUWjIR3C4mLYguKyKFa7MMqgr
         QFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787125438; x=1787730238;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0NUImn1oG7DqNp4/p8jkehokCgj80N7VsU6UHcMCgo=;
        b=e8LmJ+08oCtpHCcmWk8ScCtUig9hn2jWCQ+UXN5/qprKouL+jleCopFtDdjUO9aU2c
         dryv6BBws53r+shVp9hwSCLhTSXppiN84PlNr0XIUTyfoWc7mjTHK/g9wlELCCOe94VW
         CJdbCJHU5R8ZPdTjslaET1C/tUcFeq8zSH6+B3NunpdD4MJqNPA0ewHij1xwFx6MYUpc
         IQaoT/rttijlNa6/MKVY8QcolA6HlUSHL9bWubWKTtlQjth3GrWlESFaxd8KPDViPP+c
         +z8eUcHeaZRu/MJEaw9ctFi93q+wHSMmksNfvm6Fa2Fq23TEPoPL+Q3C0qfnNjHHp27X
         j0Rw==
X-Forwarded-Encrypted: i=1; AHgh+RpLRkhdXRilhCxnXyAGeD1LlXivNCZmpprUl0l4IoqXmMzvU8Vb3hMn3oxfbbYoFXmcfYWS@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm03TP4x9p0FN5ZZG6E5XQtqtAoCdxFy+VuM+KDGQpOoHKo7ic
	Y3vTcGh/6sVomgscJuE370fEROZCk9mRrtEDlIogZSk+cqbDIJDHq/xA
X-Gm-Gg: AR+sD13/FET8VdS3G+vbrvsEYqf78FBhENFWC/jBMYcNfQCvYKnnT1CKOCrsbMdRx3F
	t7kiGgMeMTks324PJFrmH1Ip2A0mhbeAQzJ/1Z9BkHEBvDiNd5QL5n5LYXEgnSAThemSYIOwpEs
	hLgsl2jwUrvHRG5bIUknnwjJ+e8BC4NQk3SqMOBiuWopztqqXTvcc8U4Pb1Cb9y+EumR0cE0WEt
	aemPr4TWIp13w26MyNrW1ZNUAUCcZWlczrKj1ZCRREaqaCheW0e423SqRj0i0OUfq94Qrh+Jpa9
	/Ngz6qdsk5UkOEz20TxZgoLz2TrspxffOXchKHZx2jNvpl7i0Zb7TLSBXv0nqRtkQSKTiVtkRxP
	UblrBs0bUnewrge3Sq2d293Kr7AT/z/iQsk009YqinBEfB5ihiQs6Kc0ubhCmrAN5sBqkUDk2nF
	NonClhAwSr0Rjnw1xGpU3M1IoAYcY1shfiIHhqBcWbcsRvhcF+kVE1ZfJ9EK2x0jZ7ky0uDy8MC
	FK85A==
X-Received: by 2002:a05:6a00:418e:b0:84f:dd30:1890 with SMTP id d2e1a72fcca58-851d392e1cemr4798716b3a.15.1787125437911;
        Wed, 19 Aug 2026 00:43:57 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a19sm314623b3a.43.2026.08.19.00.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 00:43:57 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2 6/8] ntfs: implement codec ops for LZX and XPRESS
Date: Wed, 19 Aug 2026 16:43:24 +0900
Message-ID: <20260819-topic-wof-v2-v2-6-40f56903e7e7@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3634; i=hyc.lee@gmail.com; h=from:subject:message-id; bh=ezLLljtWUNmvnqnVKGP/WLXf/QhjLRYsYSNqXYlPugs=; b=kA0DAAoBNPIw+veOSNMByyZiAGqFXnGjoKRtSr9l19zeLak0sTFZXLK/tOyzeDrGyNn7Yzsmo YkCMwQAAQoAHRYhBNWFKcxTduNtbh5vYjTyMPr3jkjTBQJqhV5xAAoJEDTyMPr3jkjTiHwP/iF4 nPozEl+rjH1/R1SBn6vB3nDoMpanAvwAbLXPCHVsbnaPF41lsAx5WtjTm2pi9vPvz67dnwcP6Lf uc3ugMXs9absimmZnn+AWDC1Ov/cUklQj/fPfcG9MkOM7wAr0IxQkv6H+eDtccYQPl09pENKBlM TQzhwNg0zlA1Pestf4qoiVFpantul9vmri5Ppj/gX9bYbGIcf9sLl4FUGo7BgONOHM9fc1x04H9 qDkjT9Ub+jvUm7/54qHs/0aNPjSW92pyxixBxWfGf+EkzLoB/7uSe3qnudK7l1xjV8IGdYinwsa sLYusEU84pDPZ4W3t8BDmC2rLJkwir+Bn8P9fx0N9F4JrSowUcnlXwTsp+nWCplqZNoxhfH4Kw7 ds+rLXSpdONdjez8HSkRhQLkL8lQ8x8nHa+lKtaRWeus99QeGpBOTgyQlbN6r/AelBbT3gdLryG /nrBC3BI7ejbObiw8mKCfRaqPYNv6oBerMLPa8rR/+dIk9LmaLqtdHmFr8NRpiv5EyQqZfIVsKp apA1oj/2fSlxjiKImCJzUZ999t3AYTtIjLYfI9mfNRGL6KDMOHXWkZO9vTp8W97LFXWgzIp5YMw NuyhFWAmhVfI+KCi+iMXSvOc4wivrcZf3dCZt7/9+z5rEJjqwLVzt7/NUwe1J37w+6zktRNWJV6 zi0VS
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Implement the transparent compression codec ops for XPRESS (4K, 8K,
16K) and LZX (32K) algorithms. The xpress_scratch_size,
lzx_scratch_size, xpress_decompress_chunk, and lzx_decompress_chunk
wrappers provide unified interfaces and use per-call dynamic scratch
state allocation (avoiding global mutexed singletons).

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/lib/lzx_decompress.c    | 21 +++++++++++++++++++++
 fs/ntfs/lib/xpress_decompress.c | 34 ++++++++++++++++++++++++++++++++++
 fs/ntfs/ntfs_codec.h            |  6 ++++++
 3 files changed, 61 insertions(+)

diff --git a/fs/ntfs/lib/lzx_decompress.c b/fs/ntfs/lib/lzx_decompress.c
index 3b3c198d07e4..be040dce6e23 100644
--- a/fs/ntfs/lib/lzx_decompress.c
+++ b/fs/ntfs/lib/lzx_decompress.c
@@ -14,6 +14,7 @@
 
 #include "decompress_common.h"
 #include "lib.h"
+#include "../ntfs_codec.h"
 
 /* Number of literal byte values. */
 #define LZX_NUM_CHARS		256
@@ -608,3 +609,23 @@ void lzx_free_decompressor(struct lzx_decompressor *d)
 {
 	kfree(d);
 }
+
+static size_t lzx_scratch_size(u32 chunk_size)
+{
+	return sizeof(struct lzx_decompressor);
+}
+
+static int lzx_decompress_chunk(void *scratch, const void *src, size_t src_len,
+				void *dst, size_t dst_len, u32 chunk_size)
+{
+	struct lzx_decompressor *d = scratch;
+
+	return lzx_decompress(d, src, src_len, dst, dst_len);
+}
+
+const struct ntfs_codec_ops ntfs_lzx32k_codec_ops = {
+	.id = NTFS_CODEC_LZX32K,
+	.name = "lzx32k",
+	.scratch_size = lzx_scratch_size,
+	.decompress_chunk = lzx_decompress_chunk,
+};
diff --git a/fs/ntfs/lib/xpress_decompress.c b/fs/ntfs/lib/xpress_decompress.c
index 7066810ee6cd..cb212543268d 100644
--- a/fs/ntfs/lib/xpress_decompress.c
+++ b/fs/ntfs/lib/xpress_decompress.c
@@ -15,6 +15,7 @@
 
 #include "decompress_common.h"
 #include "lib.h"
+#include "../ntfs_codec.h"
 
 #define XPRESS_NUM_CHARS	256
 #define XPRESS_NUM_SYMBOLS	512
@@ -118,3 +119,36 @@ void xpress_free_decompressor(struct xpress_decompressor *d)
 {
 	kfree(d);
 }
+
+static size_t xpress_scratch_size(u32 chunk_size)
+{
+	return sizeof(struct xpress_decompressor);
+}
+
+static int xpress_decompress_chunk(void *scratch, const void *src,
+				   size_t src_len, void *dst, size_t dst_len,
+				   u32 chunk_size)
+{
+	return xpress_decompress(scratch, src, src_len, dst, dst_len);
+}
+
+const struct ntfs_codec_ops ntfs_xpress4k_codec_ops = {
+	.id = NTFS_CODEC_XPRESS4K,
+	.name = "xpress4k",
+	.scratch_size = xpress_scratch_size,
+	.decompress_chunk = xpress_decompress_chunk,
+};
+
+const struct ntfs_codec_ops ntfs_xpress8k_codec_ops = {
+	.id = NTFS_CODEC_XPRESS8K,
+	.name = "xpress8k",
+	.scratch_size = xpress_scratch_size,
+	.decompress_chunk = xpress_decompress_chunk,
+};
+
+const struct ntfs_codec_ops ntfs_xpress16k_codec_ops = {
+	.id = NTFS_CODEC_XPRESS16K,
+	.name = "xpress16k",
+	.scratch_size = xpress_scratch_size,
+	.decompress_chunk = xpress_decompress_chunk,
+};
diff --git a/fs/ntfs/ntfs_codec.h b/fs/ntfs/ntfs_codec.h
index 408b18561a03..6030055fb0c1 100644
--- a/fs/ntfs/ntfs_codec.h
+++ b/fs/ntfs/ntfs_codec.h
@@ -44,5 +44,11 @@ struct ntfs_codec_ops {
 };
 
 extern const struct ntfs_codec_ops ntfs_lznt1_codec_ops;
+#ifdef CONFIG_NTFS_FS_WOF_COMPRESSION
+extern const struct ntfs_codec_ops ntfs_xpress4k_codec_ops;
+extern const struct ntfs_codec_ops ntfs_xpress8k_codec_ops;
+extern const struct ntfs_codec_ops ntfs_xpress16k_codec_ops;
+extern const struct ntfs_codec_ops ntfs_lzx32k_codec_ops;
+#endif
 
 #endif /* _NTFS_CODEC_H */

-- 
2.43.0

