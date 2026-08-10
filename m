Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE897E0FF
	for <ntfs@lists.linux.dev>; Mon, 10 Aug 2026 04:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337307; cv=none; b=TYriSGqHGrMgcgJ1v94BTU/0qfYFW/rzcnNFGeFXgJx3Va0xU/ujfYsU9np0oBxJ2CZGP6XNT/Ksu0HrfHbCjJOULOrSkM4Tw1iiEzJ4szNK29Nf9NCpE+9AYuig7WhCdH4uQpvSRn+nVWAnC5S0HLaWGuvHWxauV129NA2vOHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337307; c=relaxed/simple;
	bh=ezLLljtWUNmvnqnVKGP/WLXf/QhjLRYsYSNqXYlPugs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VYdvFpBn0F1GFcySGgRXdMp0XK9bxWr+nHKA6A/pPRu7ClYmm2m7TlzIvIGvS8+FOThC30eMNPfst1tFC1RUjCAEt2V5ToRHFDdlC4mshMI6k6WIpBZzAIWG7xIMqvvZR1QlK22kFXJX8ecgU48vIijP7+gQDUC/rrDjkk5+zqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skxSholW; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skxSholW"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1214075a91.0
        for <ntfs@lists.linux.dev>; Sun, 09 Aug 2026 21:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786337306; x=1786942106; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k0NUImn1oG7DqNp4/p8jkehokCgj80N7VsU6UHcMCgo=;
        b=skxSholWlj2iiQB8lpJ/DS/vskUNeHdi/CnnZhk+FGjfk1ck0PX4Z1Hlz1u/4xPnD/
         lO/pSw+2NGw6LW5L5EgSr9E4wkam8ayBOTEQRqwmyvsXeCTaYJRdIFbN0iUYp/Jr+elv
         NPzL9Z39D/q9N+orOwhy3OtCwLh4oPsF3MwI1dQn2SDDW1JJcoEZ4nbDrrjUz0/6dEdF
         3cPJVkrkhN+attIvKUUCoD97ulUFSXix3YAMxN7nd9+8BVoUWImhSo5CXSxvOeVAxHUQ
         +J8cc6D5dJWfUlg/8AsE2MNKm1ezFLtreaDInU/v96hS/lMkdi4hzsAdNLsaxsrNZCCo
         f7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337306; x=1786942106;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0NUImn1oG7DqNp4/p8jkehokCgj80N7VsU6UHcMCgo=;
        b=FDqiGoMDNlvXqqhZgBrkC1rHTr57/iAkzx5l2xMTGELTwOlIqTlU3x1sQxWxpLTlU0
         J+qBtbiJLf63fOz0CfkNTJ+c3A1WMBYd3bb32srxhAe5C4EyerbxV8LfQFURsj+8FfLb
         HXX0onBhNh7cGUY7Ab472yLDLtrS3oi6Ik8pemLJ2o6dpDFpnARUh0GQjlwSZJemC0Do
         EX8zs3aqeFiqzRNXsjAjGDRG6OAPfYAxklXbXZkwFcEy0bmClg8zt4lHyHynFqAGlwuI
         D51ns+4ZM75pr+2SSmmrjX3dh4ZAzuRu82tT3wr2MBqhwE8jFSFgXLYjIR2zUJwt/Iio
         vqPg==
X-Forwarded-Encrypted: i=1; AHgh+RoDgP1Y0Yu61hwtgZ72TvoGFdc8EX4ze+OIagL1kwr7ECdZ4reNDmGml7msLqcCiUX822Od@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4l+dWchFskaVd6PD7sKwfIyWwLEE7nGc+qLvmbEfwUievOg5Y
	rayoAIDQBjyC9ENCXPFvN1fQ7sxanFvQyoBxH0QePpR4/nEsemqHcAd7nFh+4Q==
X-Gm-Gg: AR+sD13u/WUFdPG5gmYE/UCNTMsdz9jsEFhh64k/JaLhG4fP0ex7q6a/AWfm4l5cs2G
	I0k6lCpxnKwzk2FStddE0IBUc82b/Abdwr4f4o8h1xi8j0hhvvalr+8xeC/Us5UjE+DwERdZAis
	/vJG46kHPefUvh0SlrP9QEZeInV83qR6uMUS95c7BqNkm4jbbMjapbgrjVnBTzEVog/nvR08xmR
	yCDHtu3hGLIJecAfAkAPqw3i83sDdbraCH5/tgkdbPbmh5H4OSJi7ua4kQoE4Nl16QK6tuJrq0M
	f1fldpPJPMAFQH0X73LxYMBzxpxj+OwsGbPrOlcU+QDl5WRi3+w+uBnFPjPCLyX1uMJS+9UiRNC
	Wgggfc22jOLSCsb/GpL7msYAUsl5sJvFZPPuLQLNuQwKehNmINxIyJ6m8r4qzEI3Z5Y5zH6T3Eo
	jaMC2dHqlVkfGfA9r1DgoWfxMdV4VDWRD+Ilj39J0RLngoamUcz3Gldqg1n5xfw4Uc+QQ=
X-Received: by 2002:a17:90b:3f43:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-3903c54302bmr41829240a91.8.1786337305612;
        Sun, 09 Aug 2026 21:48:25 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dc396dsm13045106a91.3.2026.08.09.21.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:48:25 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 6/8] ntfs: implement codec ops for LZX and XPRESS
Date: Mon, 10 Aug 2026 13:48:00 +0900
Message-ID: <20260810-topic-wof-v1-6-6a97cfa3bb59@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3634; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=ezLLljtWUNmvnqnVKGP/WLXf/QhjLRYsYSNqXYlPugs=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqeVeRXkhOqpfhv5m4TB9l4K8NnKNzguVhlsxma
 Mc8QSo16gCJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCanlXkQAKCRA08jD6945I
 0wQID/wLI3s7wyvE82URmwjP1dhlC6d992aeybHJxl7aOoEZ+m1bwznoR9N56ClTugVMLC2B3As
 pLoPRa0hyj1IL9112Ug+D+1jBAwYExNOqWQn2DUGWtG8K5txEV4JYD81cr7mPGSPmwwxx40hOX+
 X/2rIz1Rsb0HNrPiuBy7qiHHqyJh+lP6AVgd17CoVqaiMss15PDIYijUPcAsFzBVaSz+SawuR99
 6NDTJKqgFW+yd4vfEJzpMt0QYNW85sdmAjiuNdsENhMvJNAFSZDHtLN0PZQYl9sU290Xke25ut2
 eBMu5K1gijclsPHYUt/Z3JvQLqO/RLHHKBNQ/u1JeiUW//7/6ebeJTI9wfJZHjmN23ADV4q2Hhc
 ehN+2EcCkYR4PCnUeBjE80VSi9dCM/Mrhi1/joDzC1kojYJdEbI46gX1aYE5JEcqBTKIptd2GbC
 SAlN8m6S7RMuOR82ItZt+NnECvYMiGRtjK85ngzXstpLiz3clTRyUmaxgQnS1x0Yts7mGC7VNbE
 yquVbAhY99a4x3oYKkkfGaRjdaEqTsQssuNOk3hn0wk84/30YVoAlzuIbvhrU+DOlYD46eoIfid
 sumHOT3RwyE2oPJOOifKnQei0XehKMMjeZHYTy1HYtp2mkma5yhiGyykvrg7CuFq3o2R8p3wHJ8 DUqyp7As8iqcp0A==
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

