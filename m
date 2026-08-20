Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108503803E1
	for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 05:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787204973; cv=none; b=Cj+4aOyiOCYRI+CihzTjOb6JlffmZZ/Vj+cgKZseXM03RSYq16KxujYMxQ7cwqlk6FGWOAiKrkw31k3PjMuiCM0UKkua9Phwxu97Oi+Y4Dh3SHZ0VHMVYm2RfLiR6e3JwgIzFbdwqrbsY9G9CqFZbD3Q7szIVk2PaOBVnp3ywUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787204973; c=relaxed/simple;
	bh=0UQNyVmJYfdBgX6/MSNSx2J6luZyDXjqhPD6XOSRCuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U+R4hE/44f14MzUYJMm8Pj1idiFxyZH5iiVFVdLJhUOSU+a/N0jhW499iryynoupatbDN90MTesIpoPfdKDiZzCscc3PnXhxX4tuvxsJTHjnyP4BWD9ET/bpEIGcMEG84ZhN7evjnZIL2l1NYXCd2ku2T7chfjN2vpx5+YIgH1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeLVtsir; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeLVtsir"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca7c1176317so1259109a12.1
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 22:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787204971; x=1787809771; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DeuNNYhc8zxJyGq0KMBRaUOlAG4DH8ILTl/g96a0CLY=;
        b=aeLVtsir47aroJ3Yrnn9UoBy5tnLe3u9mZB/AdUQuvIXmZ1MptU9GEyofJl6cTz9xY
         n0M8hFVmU4kDQFXw6m0mi4hE5h6LiaxNME40bHNuvuNRfElj+GkzRlgTtu1I/UKUf56k
         ttyPkqB+NPWOJ3R1Fk4wcAAWNeu+WaFy3jmlNekh3LJ/fEGeNSj6XruaD7iZfLokoRTU
         lnEFw/lUFWC9V5sbHV2pTZK8Fq6UQAm4/iP/tRXwHtJyaI42EadQtH0ziNiapmWcd7Ag
         Jm6vkUZrgnPpqJH2s0BgwfnXYkCrGXX4tX/kQM2iqt+fjjsrD17tORsXTu8Y32Yvai00
         uaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204971; x=1787809771;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeuNNYhc8zxJyGq0KMBRaUOlAG4DH8ILTl/g96a0CLY=;
        b=gPlZNVAcI4T+cLYo0Ln+iOF4RILDLwfjCQf+CFGgteBU4BBVu+E9EepuYp1FJfdKPE
         o7yYn2pPdTDg9t8COKiD39jnlpMpTUhxdtOqAXIa68npOMIPbTy1OShewNdZRBw1uF8o
         Rpb6djqYYLT4HSOrAwuHkqTKlX0qhd31nGPUo++b4cnDADiTLvxGwEa7q7pXiw4SU3Mu
         Jq/VH+2SDJ/QU0C7Q1DU5jjymjv5gN7kZh0Bb6VNjlhUh8+gd5+kr7pEimwnplRIakM1
         f6IoQGXAlt6a1WlOXFyB+QtboX6HonNStXraH1WU2iUtuBWP8kdOcyrAPHqWDzS+Weoz
         OdWw==
X-Forwarded-Encrypted: i=1; AHgh+RrrzXgbYhiztu2qlXAdvHnKfdJcXTDNySjJ1yk3hCoinfTcwnX4JLxcY6nlMtMlJGCG4Vol@lists.linux.dev
X-Gm-Message-State: AFuF++kwk7J9v0c5MPvK3or5POZSyGn72zAWi3NzMSwTzMNeBQP6YwOu
	9hXkGjg1LeK2ynSiEO/8mYS8WBJAPyVNGJVC0w0Ri7+OGLt063ZHMcCj
X-Gm-Gg: AR+sD10IOQqqAs6pIawQIdZRYGUWUieHSD4iXlm5y/KMS0W3TChzVvGV6A9qxwcoiq0
	jq1iTzOBBGfSW2E6Ii8oiHF89YqgHzdke5GVbGy3ATgewDZ28r8BzFqHtHUxfrWVC/aOyXSy26L
	dkkK9sMABC62/lKhFAMstx+vx1fjDjwn1mAqOxEky/JtZBaVaSZsmDuleBLLNypBLR0unZTPF6l
	/DYIzEOJaVMnZ+iTF+NGXEVPmMJBiAtcl1U7wyL0M5+NkwiBMaAlfwgVSfXTtRxhGXBt8g5yYUA
	qxr1qQMc68QhCB33+0kTgT5ZxkE+ny7ZITRxxGgtmcx0VRMUBW4c1oWuvjNr7js8h+dhVwkbrGz
	lnWXWMvvBJ3zVWfMm4hsUWIgFXfd9nf+t/pdtz4Ie7n+FRjHdXrzk2hAj4IYU5/+u9agOWT52Kj
	Yhj5fLDCYp4KUppGX98foTX52zq/pPOt7JC382Y/Pn/qmOKjlU+Im6SC+9DVxcBi3jL6E=
X-Received: by 2002:a17:90b:2241:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-39581228dbdmr17899762a91.16.1787204971249;
        Wed, 19 Aug 2026 22:49:31 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395b66bccf5sm106766a91.2.2026.08.19.22.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:49:30 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 1/9] ntfs: introduce transparent compression codec interface
Date: Thu, 20 Aug 2026 14:48:14 +0900
Message-ID: <20260820-topic-wof-v2-v3-1-ef6149b4541e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=0UQNyVmJYfdBgX6/MSNSx2J6luZyDXjqhPD6XOSRCuY=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhpULFMXtRU4ksm2dC3VhZRLhf4/AfR9o7+FON
 YZlIqOSWoeJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoaVCwAKCRA08jD6945I
 097HEACNB7H52mEzvUXVP84mHbi8yVutGdx3AA81CMSC/3vHZyLFAHEE1V7GhgtuykHRpbwWAg9
 Yoii95t4bxoeX67hmgibTaU4zl/hwY4zA3j+Ad/XEoySH5oXhoDmV6vuvi68mcpj1Ew2MA3NJtb
 j7akW7OkC+qb6PP33X7jtRn4iuYiE2zEGqSQPkIsiYwpba9hD35X1bfjLr0piZzQXPaMmSJ4bxg
 WcU4w1l20w1rwTaYHX9iHNU4uTfeSBEGpuBYzUv3kWBZxrmwQAGNlFCN/cbuWPPLidI3uWllnU5
 Ry28fVd9ttdwkHIAuiQZhLGH9WdgsAuE/6F0nA5D42UYHbapMlq9ka5ona1g70Fw83dx1Buf6cJ
 n81luFAzfLlLRSDe6pw+m98wF8fM4L2hCbYhl625fQ9ybkJrDAaVoHXppVLDyFiQD1AeisB8muO
 4qYAm15ehyCSwEMjYll+aUZSy+Cl0sD4IEfvSG16MQK4PMY7k6I/8W6S9NLgyuDWC3/frjmaoBn
 xeImEvaEaCpc7/9SlYEb6+VuIjTTWaX5/HCkrUWWHe2OQMP7VBz5oJ0KVFz6yuIh5OOt8XwiFB5
 SLf7gNchO1S+2m9BHceFs8dybIwK7xyjj/GHGjqYnsreF/OwtQeX69V0XDMkUA1E7p7+DgzDTK6 oQl1PZstcoi5dCw==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Introduce struct ntfs_codec_ops and enum ntfs_codec_id to provide a
unified interface for compression and decompression algorithms. This
interface supports WOF and LZNT1 decompression.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/ntfs_codec.h | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/fs/ntfs/ntfs_codec.h b/fs/ntfs/ntfs_codec.h
new file mode 100644
index 000000000000..14a69d1e4d7f
--- /dev/null
+++ b/fs/ntfs/ntfs_codec.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Transparent compression codec interface.
+ *
+ * Copyright (c) 2026 LG Electronics Co., Ltd.
+ */
+
+#ifndef _NTFS_CODEC_H
+#define _NTFS_CODEC_H
+
+#include <linux/types.h>
+#include <linux/fs.h>
+#include <linux/mm.h>
+
+struct compress_context;
+
+enum ntfs_codec_id {
+	NTFS_CODEC_LZNT1,
+#ifdef CONFIG_NTFS_FS_WOF_COMPRESSION
+	NTFS_CODEC_XPRESS4K,
+	NTFS_CODEC_XPRESS8K,
+	NTFS_CODEC_XPRESS16K,
+	NTFS_CODEC_LZX32K,
+#endif
+};
+
+struct ntfs_codec_ops {
+	enum ntfs_codec_id id;
+	const char *name;
+	size_t (*scratch_size)(u32 chunk_size);
+	int (*decompress_chunk)(void *scratch,
+				const void *src, size_t src_len,
+				void *dst, size_t dst_len,
+				u32 chunk_size);
+	int (*decompress_pages)(struct page *dest_pages[],
+				int completed_pages[],
+				int *dest_index, int *dest_ofs,
+				int dest_max_index, int dest_max_ofs,
+				int xpage, char *xpage_done,
+				u8 *cb_start, u32 cb_size,
+				loff_t i_size, s64 initialized_size);
+	int (*compress_subblock)(struct compress_context *pctx,
+				 const char *inbuf, int bufsize, char *outbuf);
+};
+
+#endif /* _NTFS_CODEC_H */

-- 
2.43.0

