Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5613619F115
	for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 05:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787204989; cv=none; b=rkvBUtRASIwHCI9pZ897wSe4JRrDLXoRDFFRBtt2y/eWoS0Uy+v4ywI9LWqmKPxwG0/dBb3kvFkImj7ZH/iuKdAHPb9zbYVcfyvYJUs7NeAGpgi37MIoP6seGhJi4KePZneuGUyHOZJIJiEAT6gV0Taq4x41Z3GTRmCCsSxzZFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787204989; c=relaxed/simple;
	bh=ezLLljtWUNmvnqnVKGP/WLXf/QhjLRYsYSNqXYlPugs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L/JXcLv8cwHlLwO1Voc84qRP01bp2G42/qL/TkhHDCQ7Qip/ymDK4+K8vKnK/cJV4XYhlrNn3ae55uAiq60By2hAZQWgJWOY8FmezgpsdUzPpJAQceu17u/6U27REf7WwA8fDos2T0bAqLdscvAVfYrYU1CdMcOmazSBE9QkL94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrBqlUs2; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrBqlUs2"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e347638adso2017946a91.0
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 22:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787204987; x=1787809787; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k0NUImn1oG7DqNp4/p8jkehokCgj80N7VsU6UHcMCgo=;
        b=HrBqlUs2teVoKpYMgejks/NA4IGv9SpfapJMM/v3mvEy3mztnd4Cjrl8jmGMjYu3HC
         t9/RLdsejmDlWZndDll7VETTkzF6U86fph3Ej/u3SHJoHw3f18LHw3jlyoC4VoZJgzgX
         RiABMDKsrieqx6Zn3L2FlhR5wtrlRIiviapV38Adf10OkD5BbiCsazwb6e7Lil8mr0NW
         vWR8Lm2CUPbVDZpqDzvFV4AVPh2ZhgecU9cecSiQCYhqm1uG1dhFrbeISC/ykbs50eI8
         fhvR2V86YwUz3oDr1Rc3ihuPhfES6URYC0s+eiz2KJUCfoJL2LQYUAdcl0dl/LwCS+GJ
         4g8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204987; x=1787809787;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0NUImn1oG7DqNp4/p8jkehokCgj80N7VsU6UHcMCgo=;
        b=jU/NL9gk9lzjawuPd2Wo53SqrRkKePK9RSiMPr0W/ffjg80ZMXGSj77zFP4+0RcZSN
         YwtYVv7C09OfCWECpC6vRnoQBHdtzc4YeZeSnWsNbHYtcRdzCSVJQAqBYbdGC90bxNOv
         qbbbP56JChA3KvBFSj0rANLFPItkqGEBjIGovA5uPCM8Qu12L6unsq9Ba7OlkkTGtS0M
         XtBo168shbtrzWcvqcGj6EMmal+CH0KORuY9BTa9SYJylRejkOWYLOIi89Z1fdtT5NxZ
         gNQZOwaZp9K5FHSNT7PXhd29AwA+9p6NtvXKNBaC8tflDmZugHBU5F25OZyXMTZPR6Xe
         zJhg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2hnk2xRYgaJDGEoZ6LbviBRZJRcW5oL0NsKjyuadm/3rfKHI9aG0ekgHKmi1vZi+Ee0ix@lists.linux.dev
X-Gm-Message-State: AFuF++kV0awv/LpHYe7yzkAl6OreYa6kV6IR2BHxGA1u8e419Cm2elxy
	dEQBo3Zp70gbnmzhyMch8+ws9gObCor++8yEWOwcAkt+5qxzzr2qjS4z5Ip43K2x
X-Gm-Gg: AR+sD12vtTrVjcJOWOq5DnI3UB2HMVZCmwI4N4pDAmgrrM2xzyI8VBC6bcgBWFnFEZS
	lePP1/QUEhI+9OCniiV/EHulZYOGFXKbHGT5nPXJ8UOSdzGhXuyQiNaeWx94Y3xGzTYInmwTZTD
	Kjr6vIWr3Zgjvp2Pj+RecX84CzGvUIMeYQwhgdj6m8WJ+uztKTh5Lt/i3pJ9F6V/U3IK+ujFUA/
	xEngQM4AW7sGX6PgzshXV8C+sv5ENG+Vdi/+kx8uB1e5x11kXqAY1PSdgDHGAj2oseB91hWlDah
	8XakVWbTh5Eb4TxH6SyOWnZkgEseAQ1QTgDTURjHuvGb9yASfYZjNCy9SVU20gOo/r85wbGQw2a
	H10QW+TT7AHbQ6XyWhwn0lQshD4JdFyRnsD117cradbQd9UuiUgPaAX2iP/21FPx6s34T7pXrJJ
	kMpR6p3QXCzUZMwHmDbxswQAznzxPtRTXabWitToKQMxY2EHCR0rMTbkAHzsb+y5ExAFU=
X-Received: by 2002:a17:90b:280a:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-39580a81304mr19470461a91.2.1787204987470;
        Wed, 19 Aug 2026 22:49:47 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395b66bccf5sm106766a91.2.2026.08.19.22.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:49:46 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 7/9] ntfs: implement codec ops for LZX and XPRESS
Date: Thu, 20 Aug 2026 14:48:20 +0900
Message-ID: <20260820-topic-wof-v2-v3-7-ef6149b4541e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3634; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=ezLLljtWUNmvnqnVKGP/WLXf/QhjLRYsYSNqXYlPugs=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhpUNMa79HRhJOgiMpfK0kXP5lLCJVcTnk2hGJ
 gRijaUHDm2JAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoaVDQAKCRA08jD6945I
 08/0D/9z6Lhk1D30dt68fkLjIOw7aUOrwNHgcqr4UWZPTgzEHvriNst1/uJhfjPLNZ3nKrUrtwP
 24Ep7Sv8EdH6F57EDZoMa2iwhDs352Rff0n7FE/784ttCNXbT5DIPpwH5Xw6ghDim5ubB1fcw11
 bUm3pvRB1mqL21ShrHO2IbKSfAmeXL1oWKD9RiBVuiw/W1k5dEaAwJ6MO6q0n069OEs0ZjVXTsn
 hE+1u/cAp1l1ChnhaQ7nS7YL2mpi6mb83nwnA4mFpXzkjVH4zG9uQ8+WnGhfuKUxppHBOQny6pF
 fUorrjC9o4LzVwhqivd5kkCDLtyZnu7WiEXHwFEzQjsSHbMrFgLfc3ToP0BDzJoMQB3QjZ3t/qx
 fYNZFkTBU9Kbn1UL/17Y/brByZQHl8Mm1uLBkQ8C+EWVNgfZPDlIGAgcTFKdFYhPhvp1v9OxGYk
 3vDENiAlvW1lX32lnx2+S5sT15/p8jt6vv1g3Dgxur5EjSeyw5KsQtB5QWVHVRW0/uiYWRvhyKm
 P46pGkumQhMRRbJ3oEuSJrcVOrRI8/s1uWM3E+w/oOpczHc2HFTIFE63g72TdCEOKRjGQ/+WIQP
 xDzNI6MAZPU2pw3gCroNxWzrLPHYQAH8pbnOW/JFPxU6OulL/o3zaGxlBkSYPv5uDCsuCfloyQP 9kOsmBAT3yHMLXw==
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

