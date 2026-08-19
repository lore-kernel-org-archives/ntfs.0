Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C659255F28
	for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787125426; cv=none; b=a2//lB/RjJLmDb540s6WvWHpJptQlru8YXQb2RcBq8VlB2M58+LYnS7NfbwtAimQnABCggwk3p3tnpzuS32XnnG5FSKqFYfbzZC+zFQnUgo8ACY7xSpSrL+83yPJ6TBBKu6v1PkIr8RCT3K6j6QnNGFyrdGWndQ9XYOmfK6VOUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787125426; c=relaxed/simple;
	bh=0UQNyVmJYfdBgX6/MSNSx2J6luZyDXjqhPD6XOSRCuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j1sTk6ROjRy1XWCy9CkMAUkraX9FYQZlO+Z6FGOQFZAsNuxfpaS1SVhOX1kZ09g3SWz/TYK5nGWpuRlse0dRyM4tRRom7KShp3YbadSp4ZfxQ0n08Y/+708O+BLNUwpI6lhZGIA9ER8TT8pLSrOU9Y+nraxicLW0PaKAoYvbfFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6n/cCPf; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6n/cCPf"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so655083b3a.3
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 00:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787125425; x=1787730225; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DeuNNYhc8zxJyGq0KMBRaUOlAG4DH8ILTl/g96a0CLY=;
        b=m6n/cCPfkkDXdjeywXlu4DwMASs0tAdD600KZHxqoCp0yxyYCFdtjR+bfty4wsHZO4
         GrlUyraantdXmZ237sIusbq/zCnQkQnIXDvchCBEHT21O8oNUW1lNO4nk0KhFKKvaGVU
         5EmQedVEfnfA0QY93CICfA4v3x/jTr3K/aEu/L7eWIwiahj5NHzph1sp5jEFkd21+7gi
         46crjm/PLSgvNveR/HaDPcJrcjOfTVZUQ+rr+BItuSrf1oK/tCcvuoVuYQ3VVuK3DYUG
         z/fDBxeo0yhoHDvTcPtMXsJWzc+AGTGwOCZoJE5zZ4xKAXauwYyHabXJAZ3Lr5gYY7Ds
         DF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787125425; x=1787730225;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeuNNYhc8zxJyGq0KMBRaUOlAG4DH8ILTl/g96a0CLY=;
        b=PARRkJpDCzmAyJTY6eUK8WadXaUBBRKxUgykGpJdUPU/6rGJmXl2dOiKG6yi+aulLJ
         ly3JB02znbO/6/8gZEgIMueyXlnU/ARDzhhcvMKfrjlB1nTtIyH/KCgmJF1LjUfdHE8O
         ZFMRLyyxLfAF09saF7Y59N/mrhslw1fFYI+Szd3U7Bx6YoM10gmOSw+tfmTO6Qzb0g3V
         EIcnD/pCHDejBVxPETE0h1iG/AOjUpCU1yx2BFMQaDWkUJkoX2MUTRRzHqk0IsR7Qgs+
         6dbMliHoIxn0L0W4H6EMl4t/yuAtKrysJvOhooTLR/0TW8cSgYv7B5OexciAvGM318vl
         gXiQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXaPOov+RtOKF89TRuXigSVEa/j6LMwQZ2NCecM/FQuNrDHMYZXfxYQYZ6DtWi1XP7RZXn@lists.linux.dev
X-Gm-Message-State: AOJu0YxmXAIrp+qsKB58wHU2lij59mty246lxFHzy4mdAwJVHbGEEHbN
	XAhCFMpM4/5r6y7fgOBUky+6xa9KVqwzqFyWhVDC0fpn+KagVQoyCbIPHPwvW3Mv
X-Gm-Gg: AR+sD11m+chJ55B1zfB7Id4iUZip9UELDipCOi6PBh73l5XhpYrERYraD/ZiyZvyCtH
	nXLlQPzsQY3PMkn8manqkb6YbDWghbE2XlXYYJXd9Y5/y+wA6XCMY5VlRh2UlRArw/dEeDkn0OP
	EUd+omKeTmPfw8fFjpaRGW+S18cmieVxBSDYKpnlfDl2cp6JD3/sFB4dEpGyg3QLVMyp1/dCwFD
	E0yExedm1FMpFrHTv4Om82Kw5+NWswFTMwinm3e4nJ/HUtIIp+ym/P640eN+mSv1qY0Uh5uHHYf
	my4jJnaSRAeCJLtxCttO6w8vwfD4gOSZEl3T8RD3coCBuT/NtMbWpjhQUCUC3OkhBqYS7FtusoY
	ZecKW8OfbyL0LMdmNFx9CWXlEl0TXgDbr1xJ+teOolzWFiG9je4+CaDTd3ocBO1lFZwaLWjnRha
	2omvsXfMrcaYjFser5S4BMf2Z4KHXd0ruTISDtJOXHigR9VVcdNJPeeTbo3AiEOH3C0Zk=
X-Received: by 2002:a05:6a00:438e:b0:84a:29a7:f3b1 with SMTP id d2e1a72fcca58-851d391fa9fmr4369318b3a.16.1787125424626;
        Wed, 19 Aug 2026 00:43:44 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a19sm314623b3a.43.2026.08.19.00.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 00:43:44 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2 1/8] ntfs: introduce transparent compression codec interface
Date: Wed, 19 Aug 2026 16:43:19 +0900
Message-ID: <20260819-topic-wof-v2-v2-1-40f56903e7e7@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=0UQNyVmJYfdBgX6/MSNSx2J6luZyDXjqhPD6XOSRCuY=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhV5v64jamIBqE/85w0WZQC/RrNaraedjknqXX
 azbgNH7ajiJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoVebwAKCRA08jD6945I
 0xGHD/9dTJ57gMkuioPhD+fZ6vAZ7W1QTWui2XbPENp+QGQeosLYDQtuhvbANba5C3ucedi80uC
 fw7dT7Ksp/7lTNJP1mVnaYcc4OfmfVivK+vY/u5lwlRLIFk3IRbxH89u/2kZuTjHERbJVZZTuFq
 PL6upbM7jX3odajvMwADh+3bJSRfIBQFeI6q3LoOY28MxEHSYKFMtOeXrMOGOydc1gYRq1Q0JS7
 +2fcui5KkRIIT+tW/EFvHzp8AyH/bL/oWIsRaoGeCJfN8iO2f0LNtIBL11L7I8CN1WuLdOVd82O
 OoGfMoG3sL1dp3/VuTx3k4niIa5gqqfsPRteHoLoBhIfkKKNpjULBQx7ODZGVJf6RxvXux+W1c4
 uwag9ayxfAFyv75SUTg0EOFlZUS8/OlBaV5uljD0aecJEbFMpppcUQNP/YxhuU0Wybqa6yJg432
 Bjhk22gZrqdUWy/r5Mz9OsLHc/yUbW5e2JMeMjr/1ZuFMnG30BXfimcGv9XqbPFmwqXGyGaa//R
 RMU+khMUdkIds3FKcvU+wq/gj0OMl/A1KRamIslOmg7nCzf7WkojCeCx/MDXwo49PV4d3dXwcfQ
 jFw0PqrGZnKtcbXOTXgTT2C3CFNQhXTcsF7c1anbgnLYb9so+Qm1T5V+O/4bpTYPWt7cggux0Sr TwiNs3H9Cfl/fCg==
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

