Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C593803E1
	for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 05:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787204989; cv=none; b=qOH1/LZMo5/MkjYxWjy9IPV6mMm3bfaPb1QodR6Q6pGt5CTp+KxrGjlwGAvN89MnfOrrTd9NqAaBxlemKn2n1yU6qGIo/E5U+bZW1Q69NR7d830LArJ5FMsWx/MuDlrOkZb5NnvQDE6+3+5MVMEq968KL3m3ROmS4ATc7y5rFOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787204989; c=relaxed/simple;
	bh=+iBsitCOBW5Aj3NrPDOUKbl5s8gPBGWypBI+ibTJUxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XNib9A3gD9up1QaPfL1BiRtOTIIGpAPIt3FFqb9gU0SlLv6Gpky96jo0iF8o9fv/PgWWl/eRSi+aV6xCW1GFxu1E8+wOsDTPDJvFMLetccrOu0Jm0Xl3fjzqMOOxVzOI2fy0LM8+Rp1us28/+U9ANFsbbp7xjK5SwWas61nce/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hs+v6eH2; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hs+v6eH2"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso1379127a12.2
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 22:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787204986; x=1787809786; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=767zd7QfrURcWnppc6qu0UmolFtjv0Se+YBPR1hul78=;
        b=hs+v6eH250c+8PPuNQ21cU9Jcf3a3ogjIy5Rrd/KDq7P+mQLC+/fuEAYaTATC5ESUo
         UWe4sVFW7F1hRhtfqPSYNCw9AnE0Ntc6fIZ3jiM5If2UfqK7BQAWgbXWkemb/uWjI26U
         qVfv2AxTdbS/RYGIXag4gJ2NDVL8406Vi7nJldi5zdfJ33GnKE9yT0g71PQ3Y1XOcOlG
         FNL+m46oVnz5KVJ3QtZXZ5ezEbVBfDQhI6PK2ADCe7sQdvtdpREft3QIf6IB5I1oYz+E
         V9qugWWaFolEJGmZ/DBe6V3uOi0GPMnMya8sSh7A2LzXl47sO4gld+yzHQOLZxMoAXtE
         +DPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204986; x=1787809786;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=767zd7QfrURcWnppc6qu0UmolFtjv0Se+YBPR1hul78=;
        b=OyvHYMRYYqoDO20VM1K1NRj+qddFkKN+L8VsbmCbo43g/qmVRtWvCHWYaG0C6Khetb
         zeRfx6ouKPGlJum/WhozevRs7bzU9AUbIvKF2f6mQjV20hJxpV2r5BQLROMV43H4ul8P
         eoBcdzsW0u8E99LF2FAD5+ZPImpnY+bk/Wjff6NvDyneLrECEPaBErsR2OM9sYyMlKUi
         Vbhc5WBTwclm6KZM5RBStDMuzbKWQCr+MKAGXwHHD257nbK3/DFpYIGXnYnpByMHQyKq
         3XTqVJAAhDOVHsFUDMOcwrSndz0f7tELewB6Y4eHm3CK/MMYFSfa2mMWybgPE8XdJ4p1
         eBog==
X-Forwarded-Encrypted: i=1; AHgh+RpVMC5eZkTvytZ6QcMDmyOhduHuE3dLLEGFQraFml1jnJ/IcGsQs3H8UvlC7xKgC3isgpxz@lists.linux.dev
X-Gm-Message-State: AFuF++m7lz2S/q98vEXGIrH/pYvBKi+egPR6TVohYN28vjVgaCk44yDk
	0RlTDa2Pst4wK7+Yqhpzdr4D1GT/gJQkewNDUIT6i7mAjg0OlsbaL3BaruUnXvLC
X-Gm-Gg: AR+sD10ejtrzxo1t+A8DkB553zGiRfu+U2uGaZuITX9WYE7wojsfdJZ6NaTDlHmQa5K
	5kAbbHRlwcUlsE1QeVm1Ci0LeN8EGo9KcRjUahMhbNe0x1H3DKTPrzUJx5jWPC4sZcAkDgBDWR+
	zvhs8QgxIvheswcGlN5gOG82a1Tems/9f2TrmIoyuztEosJ/dHHYquBszAAW5V+m6lNr6KRqAAi
	CqHZYZBuNz2vwLtXugOjN6YlEaMHA7bemwiPLP1tR62MVV9ls3vm3zCOFpNVj4yHGUf0IIn3hCH
	s4xvGvGzT/ZsZFXalyI1vBltjL53OL3kgQCVwS2gS3Yau3O1PCbwtt9/OBox8ZxgKzRtf6CXUiV
	DVgGdHmNYbqi8nFzVw59I11JxaQCf7S0nOn31VqobxWODRh35vs+vJB48iPRvez3dkoZHHfOgwZ
	oD1nw78EFCcL48i/8rFNCP0eLnttZoCp0yp0hdFLFohmTgCyZDKyD5xDc0lCO9Ji8wvOU=
X-Received: by 2002:a17:90b:4c8c:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-3958108a4bbmr16645526a91.10.1787204985089;
        Wed, 19 Aug 2026 22:49:45 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395b66bccf5sm106766a91.2.2026.08.19.22.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:49:44 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 6/9] ntfs: port lzx/xpress decompressors from ntfs-3g-system-compression
Date: Thu, 20 Aug 2026 14:48:19 +0900
Message-ID: <20260820-topic-wof-v2-v3-6-ef6149b4541e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=51732; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=+iBsitCOBW5Aj3NrPDOUKbl5s8gPBGWypBI+ibTJUxg=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhpUNea+ei0spnJuLory4sTK2vt7OFG1suEHFc
 mxfq1xMsSiJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoaVDQAKCRA08jD6945I
 0yNFD/9bsksSXuTKAjW61sHFrZcZjrYRVdieL16GzCb51NkRBrqYGY5mHCwvkzCgXT8Xk5zBxfQ
 LkzHMpOQUY8/tyV+bDsVYtni0V9LrIrVV2cOXVp8GB2ZvXKYFu0P3mZ5DSzfmCXpga1msCij5+7
 UIj1JIqmtlbdhPyjYOY2ETm55iV/gaIQfPNO5iqx0XROnrRbanAGg/ULTPWme7DCv0iSCFimm/L
 Ybwc7b3/r6V4a+oY5vrnHoQYYpEvEwrVIj08aLhPFS81z8L2+TJFzEuyP07ANPMj16W9PM2buEr
 jfqQtfeo3ux5fvrSwXeategno5TTqFtc+0KgW4HTJDO12hgpFJVinI2wgsRzzuWSF6T+yoRspK+
 qge4/iG4SLM0VCiBPlKtwrQPCXEGxG5DfHCBFJaaGuaUSRtg2tIqI38t34YomGp09eZRUQ6UQhV
 ruiFqSUlROT+6BIh/976VwamjTAhNO6RZd8HXcolHgZ3Oy/IswKwqdiaPIQG0HbKZOQcBTWl/76
 SdgIBBbXBtt5A3oW1OHFd0BiMpaz1w+WEI57b5skME5Sibqe93BjA2CtI9jkoVPq1K14NckUW+R
 xpZTCJKLTZ5Rfup5ev08UJ2b/StMVL+54B5fBOXg0HwIMaUP0yYGUL0y2OqX5DcAzpqYQyAMNvX zFDgNaKuZXJp+uQ==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Port the LZX and XPRESS decompressors from the userspace
ntfs-3g-system-compression plugin (Eric Biggers,
https://github.com/ebiggers/ntfs-3g-system-compression) into the in-tree
NTFS driver under lib/, and adapt them to the kernel environment.

The upstream plugin implements WOF ("Windows Overlay Filesystem", a.k.a.
system compression / "Compact OS") decompression for the NTFS-3G FUSE
driver, and itself borrows the LZX/XPRESS decompressors that the same
author wrote for wimlib (https://wimlib.net/).  The XPRESS and LZX
formats used here are identical to those used in WIM archives.  This
commit is the kernel-side port that lets fs/ntfs/wof.c read
system-compressed files.

The library keeps the upstream subtable-based Huffman decoder (root
table + contiguous subtables decoded with MAKE_DECODE_TABLE_ENTRY()), so
long codewords only need one extra lookup instead of bit-by-bit tree
traversal.  The ntfs_codec_ops interface exported to fs/ntfs/wof.c
(ntfs_lzx32k_codec_ops and ntfs_xpress{4k,8k,16k}_codec_ops) matches
what the WOF layer expects.

Modifications made while porting from the upstream plugin:

- Replace the variable LZX window order (2^15..2^21) with a fixed
  32768-byte window, which is the only size WOF uses

- Simplify the bitstream helper:
  - bitstream_ensure_bits() now guarantees 16 valid bits instead of the
    carried-over 17-bit refill path from wimlib.  Neither LZX (max
    codeword length 16) nor XPRESS (max 15) needs more than 16 bits.

- Refactor codes to satisfy checkpatch.

Assisted-by: Copilot:gpt-5.6
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/Makefile                |   3 +
 fs/ntfs/lib/decompress_common.c | 200 +++++++++++++
 fs/ntfs/lib/decompress_common.h | 444 +++++++++++++++++++++++++++++
 fs/ntfs/lib/lib.h               |  29 ++
 fs/ntfs/lib/lzx_decompress.c    | 610 ++++++++++++++++++++++++++++++++++++++++
 fs/ntfs/lib/xpress_decompress.c | 120 ++++++++
 6 files changed, 1406 insertions(+)

diff --git a/fs/ntfs/Makefile b/fs/ntfs/Makefile
index e120c2e69862..5e5fd05f5863 100644
--- a/fs/ntfs/Makefile
+++ b/fs/ntfs/Makefile
@@ -7,4 +7,7 @@ ntfs-y := aops.o attrib.o collate.o dir.o file.o index.o inode.o \
 	  upcase.o bitmap.o lcnalloc.o logfile.o reparse.o compress.o \
 	  iomap.o debug.o sysctl.o object_id.o bdev-io.o
 
+ntfs-$(CONFIG_NTFS_FS_WOF_COMPRESSION) += \
+	lib/decompress_common.o lib/lzx_decompress.o lib/xpress_decompress.o
+
 ccflags-$(CONFIG_NTFS_DEBUG) += -DDEBUG
diff --git a/fs/ntfs/lib/decompress_common.c b/fs/ntfs/lib/decompress_common.c
new file mode 100644
index 000000000000..1705face42a3
--- /dev/null
+++ b/fs/ntfs/lib/decompress_common.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: MIT
+/*
+ * decompress_common.c - Code shared by the XPRESS and LZX decompressors
+ *
+ * This is a port of the upstream wimlib "decompress_common.c" which builds
+ * subtable-based Huffman decode tables, as opposed to the older
+ * binary-tree-based format previously used in this library.  The vectorized
+ * (SSE2/AVX2) fill paths are omitted for portability in the kernel.
+ *
+ * Copyright (C) 2022 Eric Biggers
+ */
+
+#include "decompress_common.h"
+
+/* Compute the number of bits with which a subtable must be indexed for a
+ * codeword of length @codeword_len, given that the root table is indexed with
+ * @table_bits bits.
+ */
+static u32 compute_subtable_bits(u32 table_bits,
+				 u32 codeword_len, u16 len_counts[])
+{
+	u32 subtable_bits = codeword_len - table_bits;
+	s32 remainder = (s32)1 << subtable_bits;
+
+	for (;;) {
+		remainder -= len_counts[table_bits + subtable_bits];
+		if (remainder <= 0)
+			break;
+		subtable_bits++;
+		remainder <<= 1;
+	}
+	return subtable_bits;
+}
+
+/* Build the subtables for codewords longer than table_bits. */
+static int build_subtables(u16 decode_table[], u32 num_syms, u32 table_bits,
+			   u16 len_counts[], const u16 sorted_syms[], u32 sym_idx,
+			   u32 decode_table_pos, u32 decode_table_size)
+{
+	u32 subtable_pos = 1U << table_bits;
+	u32 subtable_bits = table_bits;
+	u32 subtable_prefix = (u32)-1;
+	u32 codeword_len = table_bits + 1;
+	u32 codeword = decode_table_pos << 1;
+	u32 prefix;
+	u16 entry;
+	u32 n;
+
+	for (; sym_idx < num_syms; sym_idx++) {
+		while (len_counts[codeword_len] == 0) {
+			codeword_len++;
+			codeword <<= 1;
+		}
+
+		prefix = codeword >> (codeword_len - table_bits);
+
+		if (prefix != subtable_prefix) {
+			subtable_prefix = prefix;
+			subtable_bits = compute_subtable_bits(table_bits, codeword_len,
+							      len_counts);
+			decode_table[subtable_prefix] =
+				MAKE_DECODE_TABLE_ENTRY(subtable_pos, subtable_bits);
+		}
+
+		entry = MAKE_DECODE_TABLE_ENTRY(sorted_syms[sym_idx],
+						codeword_len - table_bits);
+		n = 1U << (subtable_bits - (codeword_len - table_bits));
+
+		/* Defensive bound check: 'lens' is derived from untrusted
+		 * on-disk compressed data, and subtable growth depends on
+		 * its content.  This should never trigger for a correctly
+		 * sized DECODE_TABLE_ENOUGH() value, but turns a wrong value
+		 * into a clean decode failure instead of writing past the
+		 * caller's decode_table[].
+		 */
+		if (unlikely(subtable_pos + n > decode_table_size))
+			return -1;
+
+		do {
+			decode_table[subtable_pos++] = entry;
+		} while (--n);
+
+		len_counts[codeword_len]--;
+		codeword++;
+	}
+
+	return 0;
+}
+
+/*
+ * Given an alphabet of symbols and the length of each symbol's codeword in a
+ * canonical prefix code, build a table for quickly decoding symbols that were
+ * encoded with that code.
+ *
+ * The root table is indexed with 'table_bits' bits.  Codewords not longer than
+ * 'table_bits' are decoded directly from the root table.  Longer codewords are
+ * decoded via subtables: the corresponding root entry is a pointer (the index
+ * of the subtable plus the number of bits with which the subtable is indexed),
+ * and the subtable is indexed with the remaining bits of the codeword.
+ *
+ * Each entry stores both the symbol (high 12 bits) and the codeword length (low
+ * 4 bits), so a single lookup yields the symbol and lets the bitstream be
+ * advanced by the correct number of bits.
+ *
+ * @decode_table:  array in which to build the table (declared with
+ *		   DECODE_TABLE()).  May alias @lens.
+ * @num_syms:      number of symbols in the alphabet.
+ * @table_bits:    log2 of the number of root table entries.
+ * @lens:         array of @num_syms codeword lengths, indexed by symbol.
+ * @max_codeword_len: longest codeword length allowed for this code.
+ * @working_space: temporary array declared with DECODE_TABLE_WORKING_SPACE().
+ * @decode_table_size: number of u16 entries in @decode_table (i.e.
+ *		   ARRAY_SIZE(decode_table) at the call site).  Used only as a
+ *		   defensive bound check against @lens-dependent subtable growth.
+ *
+ * Returns 0 on success, or -1 if the lengths do not form a valid prefix code,
+ * or if building the subtables would overflow @decode_table_size entries.
+ */
+int make_huffman_decode_table(u16 decode_table[], u32 num_syms, u32 table_bits,
+			      const u8 lens[], u32 max_codeword_len,
+			      u16 working_space[], u32 decode_table_size)
+{
+	u16 *const len_counts = &working_space[0];
+	u16 *const offsets = &working_space[1 * (max_codeword_len + 1)];
+	u16 *const sorted_syms = &working_space[2 * (max_codeword_len + 1)];
+	u32 decode_table_pos = 0;
+	u32 sym_idx;
+	u32 codeword_len;
+	s32 remainder = 1;
+	void *entry_ptr = decode_table;
+	u32 len;
+	u32 sym;
+
+	/* Count how many codewords have each length, including 0. */
+	for (len = 0; len <= max_codeword_len; len++)
+		len_counts[len] = 0;
+	for (sym = 0; sym < num_syms; sym++)
+		len_counts[lens[sym]]++;
+
+	/* A codeword of length n should require a proportion of the codespace
+	 * equaling (1/2)^n.  The code is complete iff the codespace is exactly
+	 * filled by the lengths.
+	 */
+	for (len = 1; len <= max_codeword_len; len++) {
+		remainder = (remainder << 1) - len_counts[len];
+		if (unlikely(remainder < 0))
+			return -1;	/* over-subscribed */
+	}
+
+	if (remainder != 0) {
+		/* Incomplete code.  Permitted only if the code is empty. */
+		if (unlikely(remainder != (s32)(1U << max_codeword_len)))
+			return -1;
+
+		/* Empty code: zero the root table so lookups yield symbol 0
+		 * without consuming any bits.
+		 */
+		memset(decode_table, 0, sizeof(decode_table[0]) << table_bits);
+		return 0;
+	}
+
+	/* Sort the symbols primarily by increasing codeword length and
+	 * secondarily by increasing symbol value.
+	 */
+	offsets[0] = 0;
+	for (len = 0; len < max_codeword_len; len++)
+		offsets[len + 1] = offsets[len] + len_counts[len];
+	for (sym = 0; sym < num_syms; sym++)
+		sorted_syms[offsets[lens[sym]]++] = sym;
+
+	/* Fill the root table entries for codewords no longer than table_bits. */
+	sym_idx = offsets[0];
+	codeword_len = 1;
+	for (; codeword_len <= table_bits; codeword_len++) {
+		u32 stores_per_loop = 1U << (table_bits - codeword_len);
+		u32 end_sym_idx = sym_idx + len_counts[codeword_len];
+
+		for (; sym_idx < end_sym_idx; sym_idx++) {
+			u16 v = MAKE_DECODE_TABLE_ENTRY(sorted_syms[sym_idx],
+							codeword_len);
+			u32 n = stores_per_loop;
+			u16 *p = entry_ptr;
+
+			do {
+				*p++ = v;
+			} while (--n);
+			entry_ptr = p;
+		}
+	}
+	decode_table_pos = (u16 *)entry_ptr - decode_table;
+
+	/* If all symbols were processed, no subtables are required. */
+	if (sym_idx == num_syms)
+		return 0;
+
+	/* At least one subtable is required.  Process the remaining symbols. */
+	return build_subtables(decode_table, num_syms, table_bits, len_counts,
+			       sorted_syms, sym_idx, decode_table_pos,
+			       decode_table_size);
+}
diff --git a/fs/ntfs/lib/decompress_common.h b/fs/ntfs/lib/decompress_common.h
new file mode 100644
index 000000000000..9bf85cd52e6d
--- /dev/null
+++ b/fs/ntfs/lib/decompress_common.h
@@ -0,0 +1,444 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * decompress_common.h - Code shared by the XPRESS and LZX decompressors
+ *
+ * This is a port of the upstream wimlib "decompress_common.h" which uses a
+ * subtable-based Huffman decode table format, as opposed to the older
+ * binary-tree-based format previously used in this library.
+ *
+ * Copyright (C) 2022 Eric Biggers
+ */
+
+#ifndef _LINUX_NTFS_LIB_DECOMPRESS_COMMON_H
+#define _LINUX_NTFS_LIB_DECOMPRESS_COMMON_H
+
+#include <linux/compiler.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+
+/* "Force inline" macro (not required, but helpful for performance). */
+#define forceinline __always_inline
+
+/* Size of a machine word. */
+#define WORDBYTES	sizeof(size_t)
+#define WORDBITS	(8 * WORDBYTES)
+
+/* UNALIGNED_ACCESS_IS_FAST should be 1 if unaligned memory accesses can be
+ * performed efficiently on the target platform.
+ */
+#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+#  define UNALIGNED_ACCESS_IS_FAST 1
+#else
+#  define UNALIGNED_ACCESS_IS_FAST 0
+#endif
+
+/* Deprecated name kept for compatibility with the upstream source. */
+#define FAST_UNALIGNED_ACCESS	UNALIGNED_ACCESS_IS_FAST
+
+/* likely()/unlikely() are provided by <linux/compiler.h>. */
+
+/* STATIC_ASSERT() - verify the truth of an expression at compile time. */
+#define STATIC_ASSERT(expr)	((void)sizeof(char[1 - 2 * !(expr)]))
+
+/* STATIC_ASSERT_ZERO() - like STATIC_ASSERT() but evaluates to 0 so it can be
+ * used in constant expressions.
+ */
+#define STATIC_ASSERT_ZERO(expr) ((int)sizeof(char[-!(expr)]))
+
+/* Unaligned word load/store helpers. */
+static forceinline size_t load_word_unaligned(const void *p)
+{
+	size_t v;
+
+	memcpy(&v, p, sizeof(v));
+	return v;
+}
+
+static forceinline void store_word_unaligned(size_t v, void *p)
+{
+	memcpy(p, &v, sizeof(v));
+}
+
+static forceinline void copy_word_unaligned(const void *src, void *dst)
+{
+	store_word_unaligned(load_word_unaligned(src), dst);
+}
+
+static forceinline size_t repeat_u16(u16 b)
+{
+	size_t v = b;
+
+	STATIC_ASSERT(WORDBITS == 32 || WORDBITS == 64);
+	v |= v << 16;
+	v |= v << ((WORDBITS == 64) ? 32 : 0);
+	return v;
+}
+
+static forceinline size_t repeat_byte(u8 b)
+{
+	return repeat_u16(((u16)b << 8) | b);
+}
+
+/******************************************************************************/
+/*                   Input bitstream for XPRESS and LZX                       */
+/*----------------------------------------------------------------------------*/
+
+/* Structure that encapsulates a block of in-memory data being interpreted as a
+ * stream of bits, optionally with interwoven literal bytes.  Bits are assumed
+ * to be stored in little endian 16-bit coding units, with the bits ordered high
+ * to low.
+ */
+struct input_bitstream {
+	/* Bits that have been read from the input buffer.  The bits are
+	 * left-justified; the next bit is always bit 31.
+	 */
+	u32 bitbuf;
+
+	/* Number of bits currently held in @bitbuf. */
+	u32 bitsleft;
+
+	/* Pointer to the next byte to be retrieved from the input buffer. */
+	const u8 *next;
+
+	/* Pointer past the end of the input buffer. */
+	const u8 *end;
+};
+
+/* Initialize a bitstream to read from the specified input buffer. */
+static forceinline void init_input_bitstream(struct input_bitstream *is,
+					     const void *buffer, u32 size)
+{
+	is->bitbuf = 0;
+	is->bitsleft = 0;
+	is->next = buffer;
+	is->end = is->next + size;
+}
+
+/* Note: for performance reasons, the following methods don't return error
+ * codes to the caller if the input buffer is overrun.  Instead, they just
+ * assume that all overrun data is zeroes.
+ */
+
+/* Ensure the bit buffer variable for the bitstream contains at least @num_bits
+ * bits.  Following this, bitstream_peek_bits() and/or bitstream_remove_bits()
+ * may be called on the bitstream to peek or remove up to @num_bits bits.  This
+ * works for at most 16 bits, which is sufficient for LZX (max codeword length
+ * 16) and XPRESS (max codeword length 15).
+ */
+static forceinline void bitstream_ensure_bits(struct input_bitstream *is,
+					      unsigned int num_bits)
+{
+	if (is->bitsleft >= num_bits)
+		return;
+
+	if (unlikely(is->end - is->next < 2))
+		goto overflow;
+
+	is->bitbuf |= (u32)get_unaligned_le16(is->next) << (16 - is->bitsleft);
+	is->next += 2;
+	is->bitsleft += 16;
+	return;
+
+overflow:
+	is->bitsleft = 32;
+}
+
+/* Return the next @num_bits bits from the bitstream, without removing them.
+ * There must be at least @num_bits remaining in the buffer variable.
+ */
+static forceinline u32 bitstream_peek_bits(const struct input_bitstream *is,
+					   unsigned int num_bits)
+{
+	return (is->bitbuf >> 1) >> (sizeof(is->bitbuf) * 8 - num_bits - 1);
+}
+
+/* Remove @num_bits from the bitstream. */
+static forceinline void bitstream_remove_bits(struct input_bitstream *is,
+					      unsigned int num_bits)
+{
+	is->bitbuf <<= num_bits;
+	is->bitsleft -= num_bits;
+}
+
+/* Remove and return @num_bits bits from the bitstream. */
+static forceinline u32 bitstream_pop_bits(struct input_bitstream *is,
+					  unsigned int num_bits)
+{
+	u32 bits = bitstream_peek_bits(is, num_bits);
+
+	bitstream_remove_bits(is, num_bits);
+	return bits;
+}
+
+/* Read and return the next @num_bits bits from the bitstream. */
+static forceinline u32 bitstream_read_bits(struct input_bitstream *is,
+					   unsigned int num_bits)
+{
+	bitstream_ensure_bits(is, num_bits);
+	return bitstream_pop_bits(is, num_bits);
+}
+
+/* Read and return the next literal byte embedded in the bitstream. */
+static forceinline u8 bitstream_read_byte(struct input_bitstream *is)
+{
+	if (unlikely(is->end == is->next))
+		return 0;
+	return *is->next++;
+}
+
+/* Read and return the next 16-bit integer embedded in the bitstream. */
+static forceinline u16 bitstream_read_u16(struct input_bitstream *is)
+{
+	u16 v;
+
+	if (unlikely(is->end - is->next < 2))
+		return 0;
+	v = get_unaligned_le16(is->next);
+	is->next += 2;
+	return v;
+}
+
+/* Read and return the next 32-bit integer embedded in the bitstream. */
+static forceinline u32 bitstream_read_u32(struct input_bitstream *is)
+{
+	u32 v;
+
+	if (unlikely(is->end - is->next < 4))
+		return 0;
+	v = get_unaligned_le32(is->next);
+	is->next += 4;
+	return v;
+}
+
+/* Read into @dst_buffer an array of literal bytes embedded in the bitstream.
+ * Return 0 if there were enough bytes remaining in the input, otherwise -1.
+ */
+static forceinline int bitstream_read_bytes(struct input_bitstream *is,
+					    void *dst_buffer, size_t count)
+{
+	if (unlikely((size_t)(is->end - is->next) < count))
+		return -1;
+	memcpy(dst_buffer, is->next, count);
+	is->next += count;
+	return 0;
+}
+
+/* Align the input bitstream on a coding-unit boundary. */
+static forceinline void bitstream_align(struct input_bitstream *is)
+{
+	is->bitsleft = 0;
+	is->bitbuf = 0;
+}
+
+/******************************************************************************/
+/*                             Huffman decoding                               */
+/*----------------------------------------------------------------------------*/
+
+/*
+ * Required alignment for the Huffman decode tables.  We require this alignment
+ * so that we can fill the entries with word instructions without having to deal
+ * with misaligned buffers.
+ */
+#define DECODE_TABLE_ALIGNMENT 16
+
+/*
+ * Each decode table entry is 16 bits divided into two fields: 'symbol' (high 12
+ * bits) and 'length' (low 4 bits).  See the comments in decompress_common.c for
+ * the precise meaning of these fields depending on the entry type.
+ */
+#define DECODE_TABLE_SYMBOL_SHIFT  4
+#define DECODE_TABLE_MAX_SYMBOL	   ((1 << (16 - DECODE_TABLE_SYMBOL_SHIFT)) - 1)
+#define DECODE_TABLE_MAX_LENGTH    ((1 << DECODE_TABLE_SYMBOL_SHIFT) - 1)
+#define DECODE_TABLE_LENGTH_MASK   DECODE_TABLE_MAX_LENGTH
+#define MAKE_DECODE_TABLE_ENTRY(symbol, length) \
+	(((symbol) << DECODE_TABLE_SYMBOL_SHIFT) | (length))
+
+/*
+ * Read and return the next Huffman-encoded symbol from the given bitstream
+ * using the given decode table.  If the input data is exhausted, then the
+ * Huffman symbol will be decoded as if the missing bits were all zeroes.
+ */
+static forceinline unsigned int read_huffsym(struct input_bitstream *is,
+					     const u16 decode_table[],
+					     unsigned int table_bits,
+					     unsigned int max_codeword_len)
+{
+	unsigned int entry;
+	unsigned int symbol;
+	unsigned int length;
+
+	/* Preload the bitbuffer with 'max_codeword_len' bits. */
+	bitstream_ensure_bits(is, max_codeword_len);
+
+	/* Index the root table by the next 'table_bits' bits of input. */
+	entry = decode_table[bitstream_peek_bits(is, table_bits)];
+
+	/* Extract the "symbol" and "length" from the entry. */
+	symbol = entry >> DECODE_TABLE_SYMBOL_SHIFT;
+	length = entry & DECODE_TABLE_LENGTH_MASK;
+
+	/* If the codeword is longer than 'table_bits', the root entry is a
+	 * subtable pointer.  Discard the bits used to index the root table and
+	 * index the subtable by the next 'length' bits.
+	 */
+	if (max_codeword_len > table_bits &&
+	    entry >= (1U << (table_bits + DECODE_TABLE_SYMBOL_SHIFT))) {
+		bitstream_remove_bits(is, table_bits);
+		entry = decode_table[symbol + bitstream_peek_bits(is, length)];
+		symbol = entry >> DECODE_TABLE_SYMBOL_SHIFT;
+		length = entry & DECODE_TABLE_LENGTH_MASK;
+	}
+
+	/* Discard the (remaining) bits of the codeword. */
+	bitstream_remove_bits(is, length);
+
+	return symbol;
+}
+
+/*
+ * DECODE_TABLE_ENOUGH() evaluates to the maximum number of decode table
+ * entries, including all subtable entries, that may be required for decoding a
+ * given Huffman code.  It is a compile-time mapping computed by the zlib
+ * 'enough' utility.  An unknown combination produces a build error.
+ */
+#define DECODE_TABLE_ENOUGH(num_syms, table_bits, max_codeword_len) (	\
+	((num_syms) == 8 && (table_bits) == 5 && (max_codeword_len) == 7) ? 36 : \
+	((num_syms) == 8 && (table_bits) == 6 && (max_codeword_len) == 7) ? 66 : \
+	((num_syms) == 8 && (table_bits) == 7 && (max_codeword_len) == 7) ? 128 : \
+	((num_syms) == 20 && (table_bits) == 5 && (max_codeword_len) == 15) ? 1062 : \
+	((num_syms) == 20 && (table_bits) == 6 && (max_codeword_len) == 15) ? 582 : \
+	((num_syms) == 20 && (table_bits) == 7 && (max_codeword_len) == 15) ? 390 : \
+	((num_syms) == 54 && (table_bits) == 9 && (max_codeword_len) == 15) ? 618 : \
+	((num_syms) == 54 && (table_bits) == 10 && (max_codeword_len) == 15) ? 1098 : \
+	((num_syms) == 249 && (table_bits) == 9 && (max_codeword_len) == 16) ? 878 : \
+	((num_syms) == 249 && (table_bits) == 10 && (max_codeword_len) == 16) ? 1326 : \
+	((num_syms) == 249 && (table_bits) == 11 && (max_codeword_len) == 16) ? 2318 : \
+	((num_syms) == 496 && (table_bits) == 11 && (max_codeword_len) == 16) ? 2566 : \
+	((num_syms) == 256 && (table_bits) == 9 && (max_codeword_len) == 15) ? 822 : \
+	((num_syms) == 256 && (table_bits) == 10 && (max_codeword_len) == 15) ? 1302 : \
+	((num_syms) == 256 && (table_bits) == 11 && (max_codeword_len) == 15) ? 2310 : \
+	((num_syms) == 512 && (table_bits) == 10 && (max_codeword_len) == 15) ? 1558 : \
+	((num_syms) == 512 && (table_bits) == 11 && (max_codeword_len) == 15) ? 2566 : \
+	((num_syms) == 512 && (table_bits) == 12 && (max_codeword_len) == 15) ? 4606 : \
+	((num_syms) == 656 && (table_bits) == 10 && (max_codeword_len) == 16) ? 1734 : \
+	((num_syms) == 656 && (table_bits) == 11 && (max_codeword_len) == 16) ? 2726 : \
+	((num_syms) == 656 && (table_bits) == 12 && (max_codeword_len) == 16) ? 4758 : \
+	((num_syms) == 799 && (table_bits) == 9 && (max_codeword_len) == 15) ? 1366 : \
+	((num_syms) == 799 && (table_bits) == 10 && (max_codeword_len) == 15) ? 1846 : \
+	((num_syms) == 799 && (table_bits) == 11 && (max_codeword_len) == 15) ? 2854 : \
+	-1)
+
+/* Wrapper around DECODE_TABLE_ENOUGH() that does additional compile-time
+ * validation.
+ */
+#define DECODE_TABLE_SIZE(num_syms, table_bits, max_codeword_len) (	\
+	STATIC_ASSERT_ZERO((num_syms) > 0) +				\
+	STATIC_ASSERT_ZERO((table_bits) > 0) +				\
+	STATIC_ASSERT_ZERO((max_codeword_len) > 0) +			\
+	STATIC_ASSERT_ZERO((num_syms) <= 1U << (max_codeword_len)) +	\
+	STATIC_ASSERT_ZERO((table_bits) <= (max_codeword_len)) +	\
+	STATIC_ASSERT_ZERO((num_syms) - 1 <= DECODE_TABLE_MAX_SYMBOL) +	\
+	STATIC_ASSERT_ZERO((table_bits) <= DECODE_TABLE_MAX_LENGTH) +	\
+	STATIC_ASSERT_ZERO((max_codeword_len) - (table_bits) <=		\
+			   DECODE_TABLE_MAX_LENGTH) +			\
+	STATIC_ASSERT_ZERO((1U << table_bits) > (num_syms) - 1) +	\
+	STATIC_ASSERT_ZERO(DECODE_TABLE_ENOUGH(				\
+				(num_syms), (table_bits),		\
+				(max_codeword_len)) > 0) +		\
+	STATIC_ASSERT_ZERO(DECODE_TABLE_ENOUGH(				\
+				(num_syms), (table_bits),		\
+				(max_codeword_len)) - 1 <=		\
+					DECODE_TABLE_MAX_SYMBOL) +	\
+	DECODE_TABLE_ENOUGH((num_syms), (table_bits),			\
+			    (max_codeword_len))				\
+)
+
+/* Declare the decode table for a Huffman code. */
+#define DECODE_TABLE(name, num_syms, table_bits, max_codeword_len) \
+	u16 name[DECODE_TABLE_SIZE((num_syms), (table_bits),		\
+				   (max_codeword_len))]		\
+		__aligned(DECODE_TABLE_ALIGNMENT)
+
+/* Declare the temporary "working_space" array needed for building the decode
+ * table for a Huffman code.
+ */
+#define DECODE_TABLE_WORKING_SPACE(name, num_syms, max_codeword_len)	\
+	u16 name[2 * ((max_codeword_len) + 1) + (num_syms)]
+
+int make_huffman_decode_table(u16 decode_table[], u32 num_syms,
+			      u32 table_bits, const u8 lens[],
+			      u32 max_codeword_len, u16 working_space[],
+			      u32 decode_table_size);
+
+/******************************************************************************/
+/*                             LZ match copying                               */
+/*----------------------------------------------------------------------------*/
+
+/*
+ * Copy an LZ77 match of 'length' bytes from the match source at 'out_next -
+ * offset' to the match destination at 'out_next'.  The source and destination
+ * may overlap.  This handles validating the length and offset; it returns 0 if
+ * the match was valid (and was copied), otherwise -1.
+ */
+static forceinline int lz_copy(u32 length, u32 offset, u8 *out_begin,
+			       u8 *out_next, u8 *out_end, u32 min_length)
+{
+	const u8 *src;
+	u8 *end;
+
+	/* Validate the offset. */
+	if (unlikely(offset > (u32)(out_next - out_begin)))
+		return -1;
+
+	src = out_next - offset;
+
+	/* Fast path: copy a short, non-overlapping match whose end is not too
+	 * close to the end of the buffer.
+	 */
+	if (UNALIGNED_ACCESS_IS_FAST && length <= 3 * WORDBYTES &&
+	    offset >= WORDBYTES && out_end - out_next >= 3 * WORDBYTES) {
+		copy_word_unaligned(src + WORDBYTES * 0, out_next + WORDBYTES * 0);
+		copy_word_unaligned(src + WORDBYTES * 1, out_next + WORDBYTES * 1);
+		copy_word_unaligned(src + WORDBYTES * 2, out_next + WORDBYTES * 2);
+		return 0;
+	}
+
+	/* Validate the length. */
+	if (unlikely(length > (u32)(out_end - out_next)))
+		return -1;
+	end = out_next + length;
+
+	if (UNALIGNED_ACCESS_IS_FAST && likely(out_end - end >= WORDBYTES - 1)) {
+		if (offset >= WORDBYTES) {
+			do {
+				copy_word_unaligned(src, out_next);
+				src += WORDBYTES;
+				out_next += WORDBYTES;
+			} while (out_next < end);
+			return 0;
+		} else if (offset == 1) {
+			size_t v = repeat_byte(*(out_next - 1));
+
+			do {
+				store_word_unaligned(v, out_next);
+				src += WORDBYTES;
+				out_next += WORDBYTES;
+			} while (out_next < end);
+			return 0;
+		}
+	}
+
+	/* Fall back to a bytewise copy. */
+	if (min_length >= 2)
+		*out_next++ = *src++;
+	if (min_length >= 3)
+		*out_next++ = *src++;
+	do {
+		*out_next++ = *src++;
+	} while (out_next != end);
+	return 0;
+}
+
+#endif /* _LINUX_NTFS_LIB_DECOMPRESS_COMMON_H */
diff --git a/fs/ntfs/lib/lib.h b/fs/ntfs/lib/lib.h
new file mode 100644
index 000000000000..a684d600fd3c
--- /dev/null
+++ b/fs/ntfs/lib/lib.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * lib.h - Public declarations for the LZX and XPRESS decompressors.
+ *
+ * Adapted for the linux kernel.  These are the low-level decompressor
+ * allocations; WOF (system-compressed) access goes through the
+ * ntfs_codec_ops interface declared in "../ntfs_codec.h".
+ */
+
+#ifndef _LINUX_NTFS_LIB_LIB_H
+#define _LINUX_NTFS_LIB_LIB_H
+
+#include <linux/types.h>
+
+/* globals from xpress_decompress.c */
+struct xpress_decompressor *xpress_allocate_decompressor(void);
+void xpress_free_decompressor(struct xpress_decompressor *d);
+int xpress_decompress(struct xpress_decompressor *d,
+		      const void *compressed_data, size_t compressed_size,
+		      void *uncompressed_data, size_t uncompressed_size);
+
+/* globals from lzx_decompress.c */
+struct lzx_decompressor *lzx_allocate_decompressor(void);
+void lzx_free_decompressor(struct lzx_decompressor *d);
+int lzx_decompress(struct lzx_decompressor *d, const void *compressed_data,
+		   size_t compressed_size, void *uncompressed_data,
+		   size_t uncompressed_size);
+
+#endif /* _LINUX_NTFS_LIB_LIB_H */
diff --git a/fs/ntfs/lib/lzx_decompress.c b/fs/ntfs/lib/lzx_decompress.c
new file mode 100644
index 000000000000..3b3c198d07e4
--- /dev/null
+++ b/fs/ntfs/lib/lzx_decompress.c
@@ -0,0 +1,610 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * lzx_decompress.c - A decompressor for the LZX compression format
+ *
+ * This is a port of the upstream wimlib "lzx_decompress.c" which uses a
+ * subtable-based Huffman decode table format.  The window size is fixed at
+ * 32768 bytes, which is the only size used in System-compressed (WOF) files.
+ *
+ * Copyright (C) 2012-2016 Eric Biggers
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+
+#include "decompress_common.h"
+#include "lib.h"
+
+/* Number of literal byte values. */
+#define LZX_NUM_CHARS		256
+
+/* The smallest and largest allowed match lengths. */
+#define LZX_MIN_MATCH_LEN	2
+#define LZX_MAX_MATCH_LEN	257
+
+/* Number of distinct match lengths that can be represented. */
+#define LZX_NUM_LENS		(LZX_MAX_MATCH_LEN - LZX_MIN_MATCH_LEN + 1)
+
+/* Number of match lengths for which no length symbol is required. */
+#define LZX_NUM_PRIMARY_LENS	7
+#define LZX_NUM_LEN_HEADERS	(LZX_NUM_PRIMARY_LENS + 1)
+
+/* Valid values of the 3-bit block type field. */
+#define LZX_BLOCKTYPE_VERBATIM		1
+#define LZX_BLOCKTYPE_ALIGNED		2
+#define LZX_BLOCKTYPE_UNCOMPRESSED	3
+
+/* LZX window size is fixed at 32768 bytes for System-compressed files. */
+
+/* Number of offset slots for a 32768-byte window. */
+#define LZX_NUM_OFFSET_SLOTS	30
+
+/* Number of symbols in the main code. */
+#define LZX_MAINCODE_NUM_SYMBOLS	\
+	(LZX_NUM_CHARS + (LZX_NUM_OFFSET_SLOTS * LZX_NUM_LEN_HEADERS))
+
+/* Number of symbols in the length code. */
+#define LZX_LENCODE_NUM_SYMBOLS		(LZX_NUM_LENS - LZX_NUM_PRIMARY_LENS)
+
+/* Number of symbols in the precode. */
+#define LZX_PRECODE_NUM_SYMBOLS		20
+
+/* Number of bits in which each precode codeword length is represented. */
+#define LZX_PRECODE_ELEMENT_SIZE	4
+
+/* Number of low-order bits of each match offset that are entropy-encoded in
+ * aligned offset blocks.
+ */
+#define LZX_NUM_ALIGNED_OFFSET_BITS	3
+
+/* Number of symbols in the aligned offset code. */
+#define LZX_ALIGNEDCODE_NUM_SYMBOLS	BIT(LZX_NUM_ALIGNED_OFFSET_BITS)
+
+/* Mask for the match offset bits that are entropy-encoded in aligned offset
+ * blocks.
+ */
+#define LZX_ALIGNED_OFFSET_BITMASK	(BIT(LZX_NUM_ALIGNED_OFFSET_BITS) - 1)
+
+/* Number of bits in which each aligned offset codeword length is represented. */
+#define LZX_ALIGNEDCODE_ELEMENT_SIZE	3
+
+/* The first offset slot which requires an aligned offset symbol in aligned
+ * offset blocks.
+ */
+#define LZX_MIN_ALIGNED_OFFSET_SLOT	8
+
+/* Maximum lengths (in bits) of the codewords in each Huffman code. */
+#define LZX_MAX_MAIN_CODEWORD_LEN	16
+#define LZX_MAX_LEN_CODEWORD_LEN	16
+#define LZX_MAX_PRE_CODEWORD_LEN	((1 << LZX_PRECODE_ELEMENT_SIZE) - 1)
+#define LZX_MAX_ALIGNED_CODEWORD_LEN	((1 << LZX_ALIGNEDCODE_ELEMENT_SIZE) - 1)
+
+/* For LZX-compressed blocks in WIM/system-compressed files this value is
+ * always used as the filesize parameter for the E8 call preprocessing.
+ */
+#define LZX_WIM_MAGIC_FILESIZE	12000000
+
+/* Assumed LZX block size when the encoded block size begins with a 0 bit. */
+#define LZX_DEFAULT_BLOCK_SIZE	32768
+
+/* Number of offsets in the recent (or "repeat") offsets queue. */
+#define LZX_NUM_RECENT_OFFSETS	3
+
+/* An offset of n bytes is actually encoded as (n + LZX_OFFSET_ADJUSTMENT). */
+#define LZX_OFFSET_ADJUSTMENT	(LZX_NUM_RECENT_OFFSETS - 1)
+
+/* These values are chosen for fast decompression. */
+#define LZX_MAINCODE_TABLEBITS		11
+#define LZX_LENCODE_TABLEBITS		9
+#define LZX_PRECODE_TABLEBITS		6
+#define LZX_ALIGNEDCODE_TABLEBITS	7
+
+#define LZX_READ_LENS_MAX_OVERRUN	50
+
+/* Mapping: offset slot => first match offset that uses that offset slot.
+ * The offset slots for repeat offsets map to "fake" offsets < 1.
+ */
+static const s32 lzx_offset_slot_base[LZX_NUM_OFFSET_SLOTS + 1] = {
+	-2,      -1,      0,       1,       2,       /* 0  --- 4  */
+	4,       6,       10,      14,      22,      /* 5  --- 9  */
+	30,      46,      62,      94,      126,     /* 10 --- 14 */
+	190,     254,     382,     510,     766,     /* 15 --- 19 */
+	1022,    1534,    2046,    3070,    4094,    /* 20 --- 24 */
+	6142,    8190,    12286,   16382,   24574,   /* 25 --- 29 */
+	32766,					 /* extra     */
+};
+
+/* Mapping: offset slot => how many extra bits must be read and added to the
+ * corresponding offset slot base to decode the match offset.
+ */
+static const u8 lzx_extra_offset_bits[LZX_NUM_OFFSET_SLOTS] = {
+	0,  0,  0,  0,  1,
+	1,  2,  2,  3,  3,
+	4,  4,  5,  5,  6,
+	6,  7,  7,  8,  8,
+	9,  9,  10, 10, 11,
+	11, 12, 12, 13, 13,
+};
+
+/* Like lzx_extra_offset_bits[], but with the entropy-coded aligned offset
+ * bits already subtracted.  Valid only for offset slots that may appear in
+ * aligned offset blocks.
+ */
+static const u8 lzx_extra_offset_bits_minus_aligned[LZX_NUM_OFFSET_SLOTS] = {
+	0,  0,  0,  0,  1,
+	1,  2,  2,  0,  0,
+	1,  1,  2,  2,  3,
+	3,  4,  4,  5,  5,
+	6,  6,  7,  7,  8,
+	8,  9,  9,  10, 10,
+};
+
+/* Reusable heap-allocated memory for LZX decompression.  The decode tables and
+ * their corresponding codeword length arrays are grouped in unions so the
+ * memory can be reused across phases, and the per-code working spaces share a
+ * single union since only one is needed at a time.
+ */
+struct lzx_decompressor {
+	DECODE_TABLE(maincode_decode_table, LZX_MAINCODE_NUM_SYMBOLS,
+		     LZX_MAINCODE_TABLEBITS, LZX_MAX_MAIN_CODEWORD_LEN);
+	u8 maincode_lens[LZX_MAINCODE_NUM_SYMBOLS + LZX_READ_LENS_MAX_OVERRUN];
+
+	DECODE_TABLE(lencode_decode_table, LZX_LENCODE_NUM_SYMBOLS,
+		     LZX_LENCODE_TABLEBITS, LZX_MAX_LEN_CODEWORD_LEN);
+	u8 lencode_lens[LZX_LENCODE_NUM_SYMBOLS + LZX_READ_LENS_MAX_OVERRUN];
+
+	union {
+		DECODE_TABLE(alignedcode_decode_table,
+			     LZX_ALIGNEDCODE_NUM_SYMBOLS,
+			     LZX_ALIGNEDCODE_TABLEBITS,
+			     LZX_MAX_ALIGNED_CODEWORD_LEN);
+		u8 alignedcode_lens[LZX_ALIGNEDCODE_NUM_SYMBOLS];
+	};
+
+	union {
+		DECODE_TABLE(precode_decode_table, LZX_PRECODE_NUM_SYMBOLS,
+			     LZX_PRECODE_TABLEBITS, LZX_MAX_PRE_CODEWORD_LEN);
+		u8 precode_lens[LZX_PRECODE_NUM_SYMBOLS];
+		/* extra_offset_bits[] is used as scratch in aligned blocks. */
+		u8 extra_offset_bits[LZX_NUM_OFFSET_SLOTS];
+	};
+
+	union {
+		DECODE_TABLE_WORKING_SPACE(maincode_working_space,
+					   LZX_MAINCODE_NUM_SYMBOLS,
+					   LZX_MAX_MAIN_CODEWORD_LEN);
+		DECODE_TABLE_WORKING_SPACE(lencode_working_space,
+					   LZX_LENCODE_NUM_SYMBOLS,
+					   LZX_MAX_LEN_CODEWORD_LEN);
+		DECODE_TABLE_WORKING_SPACE(alignedcode_working_space,
+					   LZX_ALIGNEDCODE_NUM_SYMBOLS,
+					   LZX_MAX_ALIGNED_CODEWORD_LEN);
+		DECODE_TABLE_WORKING_SPACE(precode_working_space,
+					   LZX_PRECODE_NUM_SYMBOLS,
+					   LZX_MAX_PRE_CODEWORD_LEN);
+	};
+} __aligned(DECODE_TABLE_ALIGNMENT);
+
+static forceinline unsigned int read_presym(const struct lzx_decompressor *d,
+					    struct input_bitstream *is)
+{
+	return read_huffsym(is, d->precode_decode_table, LZX_PRECODE_TABLEBITS,
+			    LZX_MAX_PRE_CODEWORD_LEN);
+}
+
+static forceinline unsigned int read_mainsym(const struct lzx_decompressor *d,
+					     struct input_bitstream *is)
+{
+	return read_huffsym(is, d->maincode_decode_table,
+			    LZX_MAINCODE_TABLEBITS, LZX_MAX_MAIN_CODEWORD_LEN);
+}
+
+static forceinline unsigned int read_lensym(const struct lzx_decompressor *d,
+					    struct input_bitstream *is)
+{
+	return read_huffsym(is, d->lencode_decode_table, LZX_LENCODE_TABLEBITS,
+			    LZX_MAX_LEN_CODEWORD_LEN);
+}
+
+static forceinline unsigned int
+read_alignedsym(const struct lzx_decompressor *d, struct input_bitstream *is)
+{
+	return read_huffsym(is, d->alignedcode_decode_table,
+			    LZX_ALIGNEDCODE_TABLEBITS,
+			    LZX_MAX_ALIGNED_CODEWORD_LEN);
+}
+
+/*
+ * Read a precode from the compressed bitstream, then use it to decode
+ * @num_lens codeword length values and write them to @lens.
+ */
+static int lzx_read_codeword_lens(struct lzx_decompressor *d,
+				  struct input_bitstream *is, u8 *lens,
+				  u32 num_lens)
+{
+	u8 *len_ptr = lens;
+	u8 *lens_end = lens + num_lens;
+	u32 i;
+
+	/* Read the lengths of the precode codewords.  These are stored
+	 * explicitly.
+	 */
+	for (i = 0; i < LZX_PRECODE_NUM_SYMBOLS; i++) {
+		d->precode_lens[i] =
+			bitstream_read_bits(is, LZX_PRECODE_ELEMENT_SIZE);
+	}
+
+	/* Build the decoding table for the precode. */
+	if (make_huffman_decode_table(d->precode_decode_table,
+				      LZX_PRECODE_NUM_SYMBOLS,
+				      LZX_PRECODE_TABLEBITS,
+				      d->precode_lens,
+				      LZX_MAX_PRE_CODEWORD_LEN,
+				      d->precode_working_space,
+				      ARRAY_SIZE(d->precode_decode_table)))
+		return -1;
+
+	/* Decode the codeword lengths. */
+	do {
+		u32 presym;
+		u8 len;
+
+		presym = read_presym(d, is);
+		if (presym < 17) {
+			/* Difference from old length. */
+			len = *len_ptr - presym;
+			if ((s8)len < 0)
+				len += 17;
+			*len_ptr++ = len;
+		} else {
+			/* Special RLE values. */
+			u32 run_len;
+
+			if (presym == 17) {
+				run_len = 4 + bitstream_read_bits(is, 4);
+				len = 0;
+			} else if (presym == 18) {
+				run_len = 20 + bitstream_read_bits(is, 5);
+				len = 0;
+			} else {
+				run_len = 4 + bitstream_read_bits(is, 1);
+				presym = read_presym(d, is);
+				if (unlikely(presym > 17))
+					return -1;
+				len = *len_ptr - presym;
+				if ((s8)len < 0)
+					len += 17;
+			}
+
+			do {
+				*len_ptr++ = len;
+			} while (--run_len);
+			/* The worst case overrun is when presym == 18,
+			 * run_len == 20 + 31, and only 1 length was
+			 * remaining, so LZX_READ_LENS_MAX_OVERRUN == 50.
+			 * Overrun while reading the first half of
+			 * maincode_lens can corrupt the previous values in
+			 * the second half, but the resulting lengths will
+			 * still be in range, and data that generates overruns
+			 * is invalid anyway.
+			 */
+		}
+	} while (len_ptr < lens_end);
+
+	return 0;
+}
+
+static void undo_translate_target(void *target, s32 input_pos)
+{
+	s32 abs_offset, rel_offset;
+
+	abs_offset = get_unaligned_le32(target);
+	if (abs_offset >= 0) {
+		if (abs_offset < LZX_WIM_MAGIC_FILESIZE) {
+			/* "good translation" */
+			rel_offset = abs_offset - input_pos;
+			put_unaligned_le32(rel_offset, target);
+		}
+	} else {
+		if (abs_offset >= -input_pos) {
+			/* "compensating translation" */
+			rel_offset = abs_offset + LZX_WIM_MAGIC_FILESIZE;
+			put_unaligned_le32(rel_offset, target);
+		}
+	}
+}
+
+/*
+ * Undo the 'E8' preprocessing used in LZX.  Before compression, the
+ * uncompressed data was preprocessed by changing the targets of suspected x86
+ * CALL instructions from relative offsets to absolute offsets.  After
+ * match/literal decoding, the decompressor must undo the translation.
+ *
+ * E8 preprocessing is disabled in the last 6 bytes of the data, which means
+ * the 5-byte call instruction cannot start in the last 10 bytes.  The scalar
+ * implementation below exploits this by replacing the last 6 bytes with 0xE8
+ * trap bytes, eliminating end-of-buffer checks from the inner loop.
+ */
+static void lzx_postprocess(u8 *data, u32 size)
+{
+	u8 *tail;
+	u8 saved_bytes[6];
+	u8 *p;
+
+	if (size <= 10)
+		return;
+
+	tail = &data[size - 6];
+	memcpy(saved_bytes, tail, 6);
+	memset(tail, 0xE8, 6);
+	p = data;
+	for (;;) {
+		while (*p != 0xE8)
+			p++;
+		if (p >= tail)
+			break;
+		undo_translate_target(p + 1, (s32)(p - data));
+		p += 5;
+	}
+	memcpy(tail, saved_bytes, 6);
+}
+
+static int lzx_read_block_header(struct lzx_decompressor *d,
+				 struct input_bitstream *is,
+				 u32 recent_offsets[], int *block_type_ret,
+				 u32 *block_size_ret)
+{
+	int block_type;
+	u32 block_size;
+	u32 i;
+
+	bitstream_ensure_bits(is, 4);
+
+	/* Read the block type. */
+	block_type = bitstream_pop_bits(is, 3);
+
+	/* Read the block size.  With the 32768-byte window used in system
+	 * compression, block sizes are always encoded in 16 bits.
+	 */
+	if (bitstream_pop_bits(is, 1))
+		block_size = LZX_DEFAULT_BLOCK_SIZE;
+	else
+		block_size = bitstream_read_bits(is, 16);
+
+	switch (block_type) {
+	case LZX_BLOCKTYPE_ALIGNED:
+		/* Read the aligned offset codeword lengths. */
+		for (i = 0; i < LZX_ALIGNEDCODE_NUM_SYMBOLS; i++) {
+			d->alignedcode_lens[i] =
+				bitstream_read_bits(is,
+						    LZX_ALIGNEDCODE_ELEMENT_SIZE);
+		}
+		/* Fall though, since the rest of the header for aligned offset
+		 * blocks is the same as that for verbatim blocks.
+		 */
+		fallthrough;
+
+	case LZX_BLOCKTYPE_VERBATIM:
+		/* Read the main codeword lengths, which are divided into two
+		 * parts: literal symbols and match headers.
+		 */
+		if (lzx_read_codeword_lens(d, is, d->maincode_lens,
+					   LZX_NUM_CHARS))
+			return -1;
+		if (lzx_read_codeword_lens(d, is,
+					   d->maincode_lens + LZX_NUM_CHARS,
+					   LZX_MAINCODE_NUM_SYMBOLS - LZX_NUM_CHARS))
+			return -1;
+
+		/* Read the length codeword lengths. */
+		if (lzx_read_codeword_lens(d, is, d->lencode_lens,
+					   LZX_LENCODE_NUM_SYMBOLS))
+			return -1;
+		break;
+
+	case LZX_BLOCKTYPE_UNCOMPRESSED:
+		/* The header of an uncompressed block contains new values for
+		 * the recent offsets queue, starting on the next 16-bit
+		 * boundary in the bitstream.  If the stream is *already*
+		 * aligned, the next 16 bits must be discarded.
+		 */
+		bitstream_ensure_bits(is, 1);
+		bitstream_align(is);
+		recent_offsets[0] = bitstream_read_u32(is);
+		recent_offsets[1] = bitstream_read_u32(is);
+		recent_offsets[2] = bitstream_read_u32(is);
+
+		/* Offsets of 0 are invalid. */
+		if (recent_offsets[0] == 0 || recent_offsets[1] == 0 ||
+		    recent_offsets[2] == 0)
+			return -1;
+		break;
+
+	default:
+		/* Unrecognized block type. */
+		return -1;
+	}
+
+	*block_type_ret = block_type;
+	*block_size_ret = block_size;
+	return 0;
+}
+
+static int lzx_decompress_block(struct lzx_decompressor *d,
+				struct input_bitstream *is, int block_type,
+				u32 block_size, u8 *const out_begin,
+				u8 *out_next, u32 recent_offsets[])
+{
+	u8 *const block_end = out_next + block_size;
+	unsigned int min_aligned_offset_slot;
+	const u8 *extra_offset_bits;
+
+	/* Build the Huffman decode tables.  The main and length tables are
+	 * always needed; for aligned blocks the aligned offset table is also
+	 * needed.
+	 */
+	if (make_huffman_decode_table(d->maincode_decode_table,
+				      LZX_MAINCODE_NUM_SYMBOLS,
+				      LZX_MAINCODE_TABLEBITS, d->maincode_lens,
+				      LZX_MAX_MAIN_CODEWORD_LEN,
+				      d->maincode_working_space,
+				      ARRAY_SIZE(d->maincode_decode_table)))
+		return -1;
+
+	if (make_huffman_decode_table(d->lencode_decode_table,
+				      LZX_LENCODE_NUM_SYMBOLS,
+				      LZX_LENCODE_TABLEBITS, d->lencode_lens,
+				      LZX_MAX_LEN_CODEWORD_LEN,
+				      d->lencode_working_space,
+				      ARRAY_SIZE(d->lencode_decode_table)))
+		return -1;
+
+	if (block_type == LZX_BLOCKTYPE_ALIGNED) {
+		if (make_huffman_decode_table(d->alignedcode_decode_table,
+					      LZX_ALIGNEDCODE_NUM_SYMBOLS,
+					      LZX_ALIGNEDCODE_TABLEBITS,
+					      d->alignedcode_lens,
+					      LZX_MAX_ALIGNED_CODEWORD_LEN,
+					      d->alignedcode_working_space,
+					      ARRAY_SIZE(d->alignedcode_decode_table)))
+			return -1;
+		min_aligned_offset_slot = LZX_MIN_ALIGNED_OFFSET_SLOT;
+		extra_offset_bits = lzx_extra_offset_bits_minus_aligned;
+	} else {
+		min_aligned_offset_slot = LZX_NUM_OFFSET_SLOTS;
+		extra_offset_bits = lzx_extra_offset_bits;
+	}
+
+	/* Decode the literals and matches. */
+	do {
+		unsigned int mainsym;
+		unsigned int length;
+		u32 offset;
+		unsigned int offset_slot;
+
+		mainsym = read_mainsym(d, is);
+		if (mainsym < LZX_NUM_CHARS) {
+			/* Literal */
+			*out_next++ = mainsym;
+			continue;
+		}
+
+		/* Match */
+
+		/* Decode the length header and offset slot.
+		 */
+		STATIC_ASSERT(LZX_NUM_CHARS % LZX_NUM_LEN_HEADERS == 0);
+		length = mainsym % LZX_NUM_LEN_HEADERS;
+		offset_slot = (mainsym - LZX_NUM_CHARS) / LZX_NUM_LEN_HEADERS;
+
+		/* If needed, read a length symbol to decode the full length. */
+		if (length == LZX_NUM_PRIMARY_LENS)
+			length += read_lensym(d, is);
+		length += LZX_MIN_MATCH_LEN;
+
+		if (offset_slot < LZX_NUM_RECENT_OFFSETS) {
+			/* Repeat offset.  This isn't a real LRU queue, since
+			 * using the R2 offset doesn't bump the R1 offset down
+			 * to R2.
+			 */
+			offset = recent_offsets[offset_slot];
+			recent_offsets[offset_slot] = recent_offsets[0];
+		} else {
+			/* Explicit offset. */
+			offset = bitstream_read_bits(is,
+						     extra_offset_bits[offset_slot]);
+			if (offset_slot >= min_aligned_offset_slot) {
+				offset = (offset << LZX_NUM_ALIGNED_OFFSET_BITS) |
+					 read_alignedsym(d, is);
+			}
+			offset += lzx_offset_slot_base[offset_slot];
+
+			/* Update the match offset LRU queue. */
+			STATIC_ASSERT(LZX_NUM_RECENT_OFFSETS == 3);
+			recent_offsets[2] = recent_offsets[1];
+			recent_offsets[1] = recent_offsets[0];
+		}
+		recent_offsets[0] = offset;
+
+		/* Validate the match and copy it to the current position. */
+		if (unlikely(lz_copy(length, offset, out_begin, out_next,
+				     block_end, LZX_MIN_MATCH_LEN)))
+			return -1;
+		out_next += length;
+	} while (out_next != block_end);
+
+	return 0;
+}
+
+int lzx_decompress(struct lzx_decompressor *d, const void *compressed_data,
+		   size_t compressed_size, void *uncompressed_data,
+		   size_t uncompressed_size)
+{
+	u8 *const out_begin = uncompressed_data;
+	u8 *out_next = out_begin;
+	u8 *const out_end = out_begin + uncompressed_size;
+	struct input_bitstream is;
+
+	STATIC_ASSERT(LZX_NUM_RECENT_OFFSETS == 3);
+	u32 recent_offsets[LZX_NUM_RECENT_OFFSETS] = {1, 1, 1};
+	bool may_have_e8_byte = false;
+
+	init_input_bitstream(&is, compressed_data, compressed_size);
+
+	/* Codeword lengths begin as all 0's for delta encoding purposes. */
+	memset(d->maincode_lens, 0, LZX_MAINCODE_NUM_SYMBOLS);
+	memset(d->lencode_lens, 0, LZX_LENCODE_NUM_SYMBOLS);
+
+	/* Decompress blocks until we have all the uncompressed data.
+	 */
+	while (out_next != out_end) {
+		int block_type;
+		u32 block_size;
+
+		if (lzx_read_block_header(d, &is, recent_offsets, &block_type,
+					  &block_size))
+			return -1;
+
+		if (block_size < 1 || block_size > (u32)(out_end - out_next))
+			return -1;
+
+		if (likely(block_type != LZX_BLOCKTYPE_UNCOMPRESSED)) {
+			/* Compressed block. */
+			if (lzx_decompress_block(d, &is, block_type, block_size,
+						 out_begin, out_next,
+						 recent_offsets))
+				return -1;
+
+			/* If the first E8 byte was in this block, then it
+			 * must have been encoded as a literal (mainsym E8).
+			 */
+			if (d->maincode_lens[0xE8])
+				may_have_e8_byte = true;
+		} else {
+			/* Uncompressed block. */
+			if (bitstream_read_bytes(&is, out_next, block_size))
+				return -1;
+			if (block_size & 1)
+				bitstream_read_byte(&is);
+			/* There may have been an E8 byte in the block. */
+			may_have_e8_byte = true;
+		}
+		out_next += block_size;
+	}
+
+	/* Postprocess the data unless it cannot possibly contain E8 bytes. */
+	if (may_have_e8_byte)
+		lzx_postprocess(uncompressed_data, uncompressed_size);
+
+	return 0;
+}
+
+struct lzx_decompressor *lzx_allocate_decompressor(void)
+{
+	return kmalloc_obj(struct lzx_decompressor, GFP_NOFS);
+}
+
+void lzx_free_decompressor(struct lzx_decompressor *d)
+{
+	kfree(d);
+}
diff --git a/fs/ntfs/lib/xpress_decompress.c b/fs/ntfs/lib/xpress_decompress.c
new file mode 100644
index 000000000000..7066810ee6cd
--- /dev/null
+++ b/fs/ntfs/lib/xpress_decompress.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * xpress_decompress.c - A decompressor for the XPRESS compression format
+ * (Huffman variant), which can be used in "System Compressed" (WOF) files.
+ *
+ * This is a port of the upstream wimlib "xpress_decompress.c" which uses a
+ * subtable-based Huffman decode table format.  The decode table and the
+ * codeword-length array share a union since the lengths are fully consumed
+ * before the table is written.
+ *
+ * Copyright (C) 2012-2016 Eric Biggers
+ */
+
+#include <linux/array_size.h>
+
+#include "decompress_common.h"
+#include "lib.h"
+
+#define XPRESS_NUM_CHARS	256
+#define XPRESS_NUM_SYMBOLS	512
+#define XPRESS_MAX_CODEWORD_LEN	15
+#define XPRESS_MIN_MATCH_LEN	3
+
+/* This value is chosen for fast decompression. */
+#define XPRESS_TABLEBITS	11
+
+/* Reusable heap-allocated memory for XPRESS decompression.  The decode table
+ * and the codeword-length array alias each other in a union: all lengths are
+ * consumed into the working space before any decode-table entry is written.
+ */
+struct xpress_decompressor {
+	union {
+		DECODE_TABLE(decode_table, XPRESS_NUM_SYMBOLS, XPRESS_TABLEBITS,
+			     XPRESS_MAX_CODEWORD_LEN);
+		u8 lens[XPRESS_NUM_SYMBOLS];
+	};
+	DECODE_TABLE_WORKING_SPACE(working_space, XPRESS_NUM_SYMBOLS,
+				   XPRESS_MAX_CODEWORD_LEN);
+} __aligned(DECODE_TABLE_ALIGNMENT);
+
+int xpress_decompress(struct xpress_decompressor *d,
+		      const void *compressed_data, size_t compressed_size,
+		      void *uncompressed_data, size_t uncompressed_size)
+{
+	const u8 *const in_begin = compressed_data;
+	u8 *const out_begin = uncompressed_data;
+	u8 *out_next = out_begin;
+	u8 *const out_end = out_begin + uncompressed_size;
+	struct input_bitstream is;
+	u32 i;
+
+	/* Read the Huffman codeword lengths (512 4-bit values packed into 256
+	 * bytes).
+	 */
+	if (compressed_size < XPRESS_NUM_SYMBOLS / 2)
+		return -1;
+	for (i = 0; i < XPRESS_NUM_SYMBOLS / 2; i++) {
+		d->lens[2 * i + 0] = in_begin[i] & 0xf;
+		d->lens[2 * i + 1] = in_begin[i] >> 4;
+	}
+
+	/* Build a decoding table for the Huffman code. */
+	if (make_huffman_decode_table(d->decode_table, XPRESS_NUM_SYMBOLS,
+				      XPRESS_TABLEBITS, d->lens,
+				      XPRESS_MAX_CODEWORD_LEN,
+				      d->working_space,
+				      ARRAY_SIZE(d->decode_table)))
+		return -1;
+
+	/* Decode the matches and literals. */
+	init_input_bitstream(&is, in_begin + XPRESS_NUM_SYMBOLS / 2,
+			     compressed_size - XPRESS_NUM_SYMBOLS / 2);
+
+	while (out_next != out_end) {
+		u32 sym;
+		u32 log2_offset;
+		u32 length;
+		u32 offset;
+
+		sym = read_huffsym(&is, d->decode_table, XPRESS_TABLEBITS,
+				   XPRESS_MAX_CODEWORD_LEN);
+		if (sym < XPRESS_NUM_CHARS) {
+			/* Literal */
+			*out_next++ = sym;
+		} else {
+			/* Match */
+			length = sym & 0xf;
+			log2_offset = (sym >> 4) & 0xf;
+
+			bitstream_ensure_bits(&is, 16);
+
+			offset = ((u32)1 << log2_offset) |
+				 bitstream_pop_bits(&is, log2_offset);
+
+			if (length == 0xf) {
+				length += bitstream_read_byte(&is);
+				if (length == 0xf + 0xff)
+					length = bitstream_read_u16(&is);
+			}
+			length += XPRESS_MIN_MATCH_LEN;
+
+			if (unlikely(lz_copy(length, offset, out_begin, out_next,
+					     out_end, XPRESS_MIN_MATCH_LEN)))
+				return -1;
+
+			out_next += length;
+		}
+	}
+	return 0;
+}
+
+struct xpress_decompressor *xpress_allocate_decompressor(void)
+{
+	return kmalloc_obj(struct xpress_decompressor, GFP_NOFS);
+}
+
+void xpress_free_decompressor(struct xpress_decompressor *d)
+{
+	kfree(d);
+}

-- 
2.43.0

