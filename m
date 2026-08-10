Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497033546EB
	for <ntfs@lists.linux.dev>; Mon, 10 Aug 2026 04:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337296; cv=none; b=LDlGrl5mQu5hDQI1uMLA9Mm8SeQAKwsvK+swY7bS/JJzMxxjBf7eVHwBCLkETZ1ulwiGx0ap1mzSJfjhE1k9d5BHxAyaY04OC4t7G/ejOBFaHYcPL165fgqWIO5S9d1rglziHNna6dT/gSeI8X9o0DZdjqeTCEM1y2CpMptgjZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337296; c=relaxed/simple;
	bh=0UQNyVmJYfdBgX6/MSNSx2J6luZyDXjqhPD6XOSRCuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KUEluPu9e9ETAG/YCT9eE0tSSE70pGOKt8gdTu49JHnb/YXVgIUKy2cvmNrTQcpCNkPmjZ8i3XlXg/2hbOP7YzmIHvETs9qnsxyOk9RuvjnlW6+7xtm8ThKIu/jV1kEulcnkjeIKDooP2DcvWpjhoUrVSdWUEmypAMMD56Xr8Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihancBMM; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihancBMM"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso1156283a91.1
        for <ntfs@lists.linux.dev>; Sun, 09 Aug 2026 21:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786337294; x=1786942094; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DeuNNYhc8zxJyGq0KMBRaUOlAG4DH8ILTl/g96a0CLY=;
        b=ihancBMMU6La+7rrfv1h0t7ctiTeuKq3evSpBKBCBdeAeJHW6J5M+hfTmSF2rVFsGF
         N82p+G2g5vCt8HKvrSqMhE1to0dllzqrskHAl6Iod3HZVcpkxOA4rTr3fiwVuOPPYPcJ
         DpLKpoC1kpsR7B/0vKngAtXZkwK7by3AB967zLoH7Co+hePZYbPGnhmanLuKVsVNXzez
         sDyy06r55dfpdYokeD9WtdgSFaEvfI4IjpW6mVQpeZshdQ9vp6aWlzsdZcXZKGvHCLEC
         e85o5uUJCXdqMTpAZdfgGxVDlhu/m1W/ctZ5ljfOt1puXsBWpwrd+Mht6daKhxyUoX86
         KBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337294; x=1786942094;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeuNNYhc8zxJyGq0KMBRaUOlAG4DH8ILTl/g96a0CLY=;
        b=QAySGL/gPvBj+Wl/qlT/7wuMiRssV8qG8zFio6sqaRiHYGzl1q43nBtA+YZCrWpvMD
         qy+UqXckZnpxya04upa8lker6LqHv9o3qVqkBxEj4J7x6H+h/Pl8mKkWsQgivai5Hc7A
         wIwuA/c8yYe1GiMd0XJb2wERbv3O57fRAQbFcosw/OqjRIbooP2b45LTGHebvBiyaxuR
         xMu8FO+cdtAxDl3BwkBG1qdGpD0UiTGenbqUAAhEfIBuPUOHmDeCz2zw1XVJk3RAeFKi
         L1nPy4rG47Uv+/zsN46iSpSazUfPxLwC82kTbCvXwl5K98di4byU1wqPimf2XO+qSG/M
         1e5g==
X-Forwarded-Encrypted: i=1; AHgh+Ro3gIYY9SW2LVGg6YcwJYhAd4XJqpF5y25vlX/VDEPLHPUvwR2353xdIdf6WNbYIY/IdPZ2@lists.linux.dev
X-Gm-Message-State: AOJu0YzRfcj1wvtxqOLeXVwTYUBnac5FH9EgjgQfsVwiOL05U6QWOb21
	UqhJgiCt1bYpRMpTPfl9esIEA/o7QY9kh9fMXtbXiYE3ptTj3Bw1sMu1
X-Gm-Gg: AR+sD10hirTuJmNSAs/sm2HNYurqxwlVv67hxiE8qKJLU0IZ2vdW3aPLknzTSylz80b
	Cv6H5x355FpTyKVbFmeIycX9tNKNSE7NjQqun5zhYlPig9ntoSSGOr7rdPHa6dmIQRP676Lzf5h
	hXKRQcaD/gpRdR671wv2RJqHhze4khej2qo3FN5AIh9R7EsgHLLhvctz0vYabrZdd2acRuACzKg
	7b9Bp9Z7nhX6YJKF1I3q19V9d1ukgbZH/xNnsrBXHEYkLzr/XhQTJd7x7UPpdd5fjnFeg7LFMEO
	AKIKcx93EPt6sjp+BlkEhjShUwxN4NUkiWVokOSbrKrWfl14loqGyPBMy1dEm60DnnffGP9pPbX
	ZPRO1pj+YxCXqQWy/3hP0h0KmaVDBKnyjSmAGPlNW++wzN0b8d0gp4ufd7l1hjXsnIzIIONsUie
	zdzdmyiBDLpCSjJwoS/MRdVjjE8QBS0fChxIChfGRci3FFOnXZUSujwnfy0EkkKm39wds=
X-Received: by 2002:a17:90b:2d8e:b0:38f:de94:bf34 with SMTP id 98e67ed59e1d1-39284659c98mr6942814a91.10.1786337294483;
        Sun, 09 Aug 2026 21:48:14 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dc396dsm13045106a91.3.2026.08.09.21.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:48:13 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 1/8] ntfs: introduce transparent compression codec interface
Date: Mon, 10 Aug 2026 13:47:55 +0900
Message-ID: <20260810-topic-wof-v1-1-6a97cfa3bb59@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=0UQNyVmJYfdBgX6/MSNSx2J6luZyDXjqhPD6XOSRCuY=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqeVePH7yJRPk8VK1irbKz7nAWxhPoVuut7Pldm
 FtqkEDJtI+JAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCanlXjwAKCRA08jD6945I
 0zl8D/4xRjNPUtsEEasEu/mlo3UU2gtQwRPR214/yQt/wRw8L0vKWuqGBBN+59W52ebx3gM2M1G
 ksRaDJvTHSszBAyItrwuJeoPNoXD5dAVkWEnzyuWquIAI2Evc7i1Ep/YjmnuewosM1kxyBbSe/G
 b64IYOPA3o49vTSapmF0sTMBck2rifZ+uy8X85VN+cdOdnVKR65Ioxils3O7IJTUuWkwHAzNGPS
 Fg0SUM4/Axc9Myg9MUT+z7rbyinoM/Gt2heqOz46JqjCwAfa8CEDiKEHd2+xCJ1fAv5KI8gVrxp
 lFRBXFaOsfhJBsYHXcfDeKD8zq52q76zpxppc6Zae6XWLdMyG0ByOiprF4fpvPHxnTc/TEkhPKO
 +51/zvnsp5swdWqz0yqv3AhLZutG9BqxW/9NGRIjOqG7Xm0uWOq9d1xNZX/YAOG1iEbCKrcpPbE
 O2TH+PpVz+YpGlYGmJZytObYO9yXPEoQoLZy9C6RfuXCSol10SUISXKpAE036AmIyxIGZzZraUa
 Ft/DyfenvGOZJCbVVIAWTVmL6VbWC6FxDDUw6Jw0eMlG4f3FvdjC+KJDow74JSiZlMfFE4/7/JI
 +nRcYvwDToCuTN5Jo44fPsEVuN7u6f//LbfJGRGpE66vtLT4sDUzAbc13//N/r4VN4IhHmLLheZ 1QW+7JZFTNmQVNQ==
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

