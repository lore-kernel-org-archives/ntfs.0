Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298E93F39EF
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288505; cv=none; b=o/WPJCLS935XUGefDtw9i0J8qyvyaICGURLO2pmETfrNXPCSuijNF4/MrqtrIhhc62HL9sYcQpggcbkcmbnZILqdxXI3kSDtdybV+M42pVWauVBEz/WNnWE78e/1VRMdJZvOoGW/NOXrhRZ2IWkS2tPal51/o5F+ysyVz1KhTmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288505; c=relaxed/simple;
	bh=0UQNyVmJYfdBgX6/MSNSx2J6luZyDXjqhPD6XOSRCuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a8H7oF4HTHs1ezKevzQJNEkBLdlP3TIm86KFqGTwLKK4WDPqJZ3i/lQhOuBkWNC11v/BayH0rVz+/LlMNt/I9iQwtQpzNzBN7y+5txh5m6DU4MGgOSKK+mcY7hDqNJE5EuDEqSU/8c0pnUv4Y+ttjxdXqCVcLIzJhR/468SlFJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKE4poWx; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKE4poWx"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso411760b3a.2
        for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 22:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787288503; x=1787893303; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DeuNNYhc8zxJyGq0KMBRaUOlAG4DH8ILTl/g96a0CLY=;
        b=OKE4poWxBe474CLkjv1dZj9SGmHMc5yzKVP1ioz0sabsTmVePwd3Nasvotf85u5JOS
         ZodCQ1WBW6PzHp8Fy73xN/AI1kzK/MoEYlh5HEJaZYwNHoQpR1j6xKR0ks7yeq9T1wba
         KRCcW3ga0VnWdwEsn/KcKm7zKb9oeqgqPzhJyzR/r/1Tw7knVffR863l+sm46is9gk03
         sQYA5sTbvn4C19glZ8GKYA3JFCjLyCUT0Iey23lBQlXajisA5vMol0n5KeGJrQLRmSXh
         FEvwpfvOZKUON7D3DdJAJdIus3B2nhWlE9sYx1B3xAqmiovUzMoMpgsh49lr3TTS36hN
         G1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288503; x=1787893303;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeuNNYhc8zxJyGq0KMBRaUOlAG4DH8ILTl/g96a0CLY=;
        b=K/6/71meIdudXMQSya2XnZHm8qCFeczVmWFqw4slFaX4TPpF69m/oftz2m19mcTHQz
         Y8POIK4e4z09h0Iabbvt59MH9Rj26llLm8gzed0uAoU5fu6pquTLgsDb2rCqel2NszWO
         Nuze0+6S+jwzs+J59Icazrzh0vm8dzYnY2cg0cIuEVkUGhrcAuAAmCJtEvnrsz3+vSsN
         Y/q8Wa8OnOID48MSs21zj8SRV4JxxZGf+obF26YZPGKG/gky2PPmMJtm9VtqlcjMhAyf
         riwgSJ+O7aBlAnIufe9RIpzEJaW/A3d2vIXI4dwYZLHLNNeXg1WbksYf8c4+Yx/AdWtH
         6wDw==
X-Forwarded-Encrypted: i=1; AHgh+RpDAO8+LZahUxkjxkcmG87tr4p5o1n/3Z7jNyda7jxZuLNpGpf8XMwFE79C7AEGLw2orK9d@lists.linux.dev
X-Gm-Message-State: AFuF++kHt9ka3ZSkKH6WUXphoQ/iFUwDQZijn6cLwasvyAKKM0tKwx+J
	4JYlMeasmEasV24q4yrnq+ZAfr6OEeZ9TCKXs+JraJLdJn4uSVN2vTqWjyNehg==
X-Gm-Gg: AR+sD12Ez03XVeI5RMHwBNEWIyrBBitlqSVnFvB6QfVavOO1QRxU/VHqJ2w2XrK8hkJ
	Jnigus6sti4RhRMNRC94qTABL8D3uMJ2SKgyZBj3pWqApiiqUQNXG57xc9ReHv/bw1oQf47sJL6
	/T6smt+H3nhIKRcqwoHbIJUubGBRW8JtydNNJEguMiLduKu7hFmBAAxcpI+p9H9a3qbjLNDduim
	ow2/KDS+U3KXh412pXWVvv+LBgXjMh1chb7nzxij9/S7BOrGXegC849eWlUux1K5U7LKrFtMJ/3
	6XGBH+Oi+lEzaLtdgOZUS3CjOSARfb/oMQ6Vk1D8QzKIkuh7BrUTSpK6hnpFd8Vk/9har6C57Q9
	lzYcQQyY1Y5un0K6oiRQA8ieKCmhJ8u1HeEFNMzZnybnuzc4eVXtpmOkJDAZNL7A5ztGkk/mECl
	hDwF0DOfeNoXylHjdbHxjrdvw2vK/tdhN4wCKgSk7Q2OOAmjTvg1dBE75jbRWsqtc/XoU=
X-Received: by 2002:a05:6a00:3d55:b0:848:3fe2:c88b with SMTP id d2e1a72fcca58-851f9cd4e1amr4919620b3a.6.1787288503452;
        Thu, 20 Aug 2026 22:01:43 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a19sm2319545b3a.43.2026.08.20.22.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:01:42 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 01/10] ntfs: introduce transparent compression codec interface
Date: Fri, 21 Aug 2026 14:00:50 +0900
Message-ID: <20260821-topic-wof-v2-v4-1-7a6fa10743b8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=0UQNyVmJYfdBgX6/MSNSx2J6luZyDXjqhPD6XOSRCuY=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqh9tMM+PvUYNia+hnyQPCWF1njj5nOqmM4jhjz
 hBLkKy9RNWJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaofbTAAKCRA08jD6945I
 057KD/0c9Fw6DHHV6Wp6eafxDsinHb+aU4Ymzwal3Xq33sFeQScbx09XX7W4pBIFM8e1p3VFeOK
 xBDGdwxnUHLrgw25a7rIhvVJInR1JRPfLXHK8HDPgXGkNwZxxDygQlthZBFOPUDMY1kiqVJCYCO
 8UEeGD5a5ldr8RD9Xw2hC56rAjgM+DQBTscBBrEU8gE6seIo7wKz8kEhbnLbOoEfiAej8HgBkn9
 HLCDuCMz+RPdANHK/i65+E09XWJ5B9WBNPt3BGlU11xCZP9QVkW1gMfU6ko5sli0EQihvCmcMA+
 D37fcLAzu6vUrXmIBn2skpkFTVSDhurDzMToLmIBuIctBFH2TBbcyJwTOQwEQCagCXfGuoeK4I5
 4MvBqGg4gn0X4n9FdRT4WP1KxqCKgonxUNDvEZS76d7qxZe/dCmJ/GPH0Ci4LY+UNQ8pi/TxoVe
 apTeg3H4T2Z1N77a6OWRqgSi3Il33MOSAlg+fS8S8pehN4Qy/fVN8ENSde4YR1RQtzFq4m4DeE6
 nbB8wwQquQRZ3VZwkSuaI4srxSxrQXqznjvXke2WNCnXPy/dfSzUKtTYr+HOjjEODrmAC9v8VKS
 /MlUuviJHF1FiCrIg4wYb6mPZSYtRiNybKv09YB9RUPFVaDLN4nGla0YIAdO0+WlgnggWllhQJq j66ApYNxWg0IMkA==
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

