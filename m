Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6243F44D3
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288530; cv=none; b=AaW3/BD/Xqxm4vP3KMRnli7zK606qLt0CT3r6+EJadqz1tvrjD1okUi3cad2LrLbqpRuMMJGQwZGSvzPNmJPu7qeQcoDRGOjkoKHHXsstB9aleiOWaJUCHuCRjqsOs4Wn3Qacwg6T40/RCdJdrFQkqO1LroRvKkP60u6m6S28g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288530; c=relaxed/simple;
	bh=ezLLljtWUNmvnqnVKGP/WLXf/QhjLRYsYSNqXYlPugs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sjuBR11JnhjNAibiDXfpDz40IlR3N0DXh5QvKFfvrH06U07LpUn1Tan2C9yhYOulMPv2nryuyX/kB7YiFP6rQKHNoY68+2JgaMiMMjcZ4zagHrzsuxE59AQd+A/G+FpJcr5aDXn9iv5QHqcpfBSzbFnasWqosUUBJ1vGAMOo45k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpIukrmI; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpIukrmI"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8520161fdb9so18146b3a.3
        for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 22:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787288528; x=1787893328; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k0NUImn1oG7DqNp4/p8jkehokCgj80N7VsU6UHcMCgo=;
        b=GpIukrmIPikdA2+UiyhwFFUhLcfS1SB+pSFyKJpJPllPmKzYFszXrABwK3raiFK6mJ
         rgARoaK7XHSgE41FR7QLFAZ5GhhAH9Tg98f/HHVzeu3C3UIilSct3Dbjp1blBHkboVqP
         CsSh1O4ztply/HoknFAI2OMUDQQbZkoI2iaquA101UPyqAzo1U4DJPIvFjO7MzQLpeuo
         p2tdaNtiXHUtBEJrzzbFBpq4W7h+RSMSwvfo4zkHRb0/IgkXmcVRkvsF6viWg0nAa3ir
         7f4TIoTvIcin/RREfDWVQQ/INacy7V9no+mbIGVvWehqJCO+qj5LnWH3s9/lo9TVAJY+
         oAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288528; x=1787893328;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0NUImn1oG7DqNp4/p8jkehokCgj80N7VsU6UHcMCgo=;
        b=JLLOF1ZVs2BWsP8IsRIpe7IbsCOed8MPctCFdfssxRlOGuT/uhzd4A8XommjFcifCl
         h8QwfAaWNS5f9Dw0haN60n8Z90O3XLi8VDE3nd9lMY0MA6jz/pnynXaBnSMQfhepFmp4
         nIxAFv2B6xnToBRdQEG09uTP/TYuN5kXUBawQcZa8gk1hcIvY5qnCHfS2bPRsH078r5W
         jV/WWAdhm2DFhb7FKUYKv5YENy8WHt+4rZrcoHq0FSltk6aHjmrWJzcKQmEfkcodafQH
         gjroi4k2/ko+iMI5GSsCV8uom9e+OPCISn4XzH8V6LOplyhUvu11jbxfar4To7nvRzzE
         Izbw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3PHtO3lZdJ7p+27VgXma9LZ2I3Ns3VFr0s38GHNozhH6GH1F6EMpVcttGB1Btgil0NvE5@lists.linux.dev
X-Gm-Message-State: AFuF++lYdwXRHP8Z1EIAFgPoptNi4abFJI1g93S59Pd35ZOyF+5t7Dlj
	68Mw/IjFVXARVO1TKINANm1FXyy/sV0TRQ0ieUkdN3+t2r2J+2J7aYS+
X-Gm-Gg: AR+sD11FknHMjq5l1kweAA/qK9TiKRzad9zvmGdBbjg5w0XkrvRrn2YcpBCMkLztjcR
	sbG8xPYnd9WDqIfxCpn31qd5ZwVTaIjIv7HXT+vWY4fqNHxpqMhens8FkMinqUDkQFeMEGHMACV
	RjId+eLbOG3Ka5zlJhg6CMDagcDvafgUUggam7KD+ih4UutaP7dDwmV+Ftjgwltijaaw3vrwSda
	YtPtY3Bjyz7FlPNcs+i26WzOK+IuaZnC2P86BFbmrxtBnZUH1tKeTxdh514yHIO8IyXmu8NaWxm
	ST2p3OFPpUDG+0VXFXV14BfN9VV1DsmpgVLUDi/+jidecnpMqS4pDj0o7+CKXIeQAT0hktqd/2M
	OgFSwU8E7ZNLpbZafiPwdtuIlBAId5iL9X9+RhbXSEhVmRkc9kfin7CSF71I/nL/JQUELHCKeIw
	JroeUrm1hs1+t/kM8xpYT2yQFzrr7YzhXyFL2CWsuXz5vINcubSlyuABLmdkXcZFGHqoQ=
X-Received: by 2002:a05:6a00:7497:b0:851:fb36:a702 with SMTP id d2e1a72fcca58-851fb36a9f2mr4451720b3a.9.1787288528558;
        Thu, 20 Aug 2026 22:02:08 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a19sm2319545b3a.43.2026.08.20.22.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:02:07 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 08/10] ntfs: implement codec ops for LZX and XPRESS
Date: Fri, 21 Aug 2026 14:00:57 +0900
Message-ID: <20260821-topic-wof-v2-v4-8-7a6fa10743b8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3634; i=hyc.lee@gmail.com; h=from:subject:message-id; bh=ezLLljtWUNmvnqnVKGP/WLXf/QhjLRYsYSNqXYlPugs=; b=kA0DAAoBNPIw+veOSNMByyZiAGqH20/I4Yf4A65eVQ8qBhjFudUu/TuuuTF7hbNHQxaimHafY okCMwQAAQoAHRYhBNWFKcxTduNtbh5vYjTyMPr3jkjTBQJqh9tPAAoJEDTyMPr3jkjTZA4P/R2T 0TiY8phKmpChZwIfdI0JCERD7+kqANuIiaYbPcchU7n6d5/tNBtNdcqr5aZNUm0bfqwa3EaE+YD gpV5jxEMx7w0eDVYBKykty6LQ+zxx2utoae16uT9kYuybBePSdrMO5Psto/2uPHSrATloMtjS2B 2s6oFgQSBIZjHlpvTzYeVU/vv/vzC7CgA+ksWwcLdxuN/vzARNc9mD1TQpF+0asfFvU8xG8L3Lp VG8+aW8uqeTyVy+DhsKYyPHMflwoHk32DZCJ9Fb7hJu4E6aE2LTJOkxtT6jQlFDQO5UV1uD52p4 B5HbtChVcYMQPiolwV96thJvJLGJV8EAfF2acab4sbf+CWD1ylUOAaDfoZFObbWr02Tku3c42uM jZU8qN1CdwETlPMeiHec4SVR55xzkvn+xutSTAdugyIcNBf9iyaOGvIj3hA7BQDMofCQEYVy6B6 zxKaxGe+oG9VfUtIW+55YYMerbRy8Lxe0g14vFvj2TmLzVE2TkZ81OY+IrX/jAqJH9S5NQpRRG8 YbvpY4aeaCr2zM2rSAYWtkvi5P1qEJWcBkU8KSIXGPQlVZMGzAqprRGD6iFS2+Mzpq6sBnWs820 9XZFRYOp0m4vXtYHXe8D4XMFVzNgzkKd6Gxk9jdOrqxjVvC/QgT/vrfeTQimG/00v37JbMOub0/ PsJLH
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

