Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA82298CAF
	for <ntfs@lists.linux.dev>; Mon, 10 Aug 2026 04:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337310; cv=none; b=MaSRrgY40rXlWpo9Cb4GkdlA8Q806amLcWy1hjGCKwLTzwXVDq1u/1UHW9Rb50thMd+gXxegIW2t64boBo5S21a4UEYIDCoxdE2ykee5rDyj+6bd1PDWBsHfzSj5Hcq00zTTbJGKyR/Us4KUHuKNb2fc8+3BkwA4D30ITKwQkGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337310; c=relaxed/simple;
	bh=y9Ka3GoFfH7ME1EdMIauAkDmtDLocMwMf9MrNO1h5yI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zm0hSdmjvcAd3nLEu3BCg4QZNE02dm5lMtQtCuCmZ7NzrXV51YMPHmAj+P4OmekVPi/zjeSGkzPcsv0hGfalDXpUwlYbLo1pKuGoR25ivVjToULje30fBWCjfJN5WlhXzth423vwvaMiUfjxxzla1P5pkYj3b6qIoxhMb34GWSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9P/YDFk; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9P/YDFk"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e041ea211so1559700a91.0
        for <ntfs@lists.linux.dev>; Sun, 09 Aug 2026 21:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786337308; x=1786942108; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VvM9uzibDT1dsmmdiyZzYqWH8kKxedUBcxK8X9AYyRE=;
        b=j9P/YDFk6vILW5We16BIdhIlczkL2QbkF8IjuGdxu4oVkC+6m8MP1nRPw3L6hpSJ3r
         IXYkjx+F06LkXQKlCLuWFjiGsJKX+UexytMj6ooUXEpOSJVQRkcssTcjZ8+NZHjA9qOH
         Vy1kCX8hO2hLsVD7sJIpLik7TNDI43Pfjwsmio3YIVjNUWiNVQcxKfHma1yaVuJOeALl
         4OoqzSKysIM0QZApqdCB/zC/uerXUymlG8OGlnpwmxKSzteV/RG21HVvLFD+Qvh8Xcrc
         heCFYiKWeQEFtd1J4uidQH8FpfjNFyi1XbmnR4dayvLwSNUQS+O0fd9leoN4iC9YjhAk
         s7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337308; x=1786942108;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VvM9uzibDT1dsmmdiyZzYqWH8kKxedUBcxK8X9AYyRE=;
        b=snuGr+pS9WYHnYc5VLjd8Z2PjqMxSHezl2hGg8YKF2B82Wi0ZZwzB5gG5FSnbu/Z5U
         tZKxdin6GXrPONueyK2gJjjJ5bJ9tdUJ7AeM+WAsakJgwa1Y/OH4o9/ONIk6dEGWJXE3
         6D4XU5lzx7lfMYV9DfTM/R+fWmWXfBd/EDbh2sDQUYlOdMrbX8kMNcFKahOUwYh+flae
         f/8sTj21G5Ui6EmwUvGrZCmP0PfM7ixM04DX+4+DuPthtBBfJ8mJWoY8w3ZzLpYAlobw
         NARMKSR040NuhIpanEn7gHAnAT2ft1XiQxV/meenSu+WzaDX4QSZhernK13TcJhPDEq3
         N5ig==
X-Forwarded-Encrypted: i=1; AHgh+RrrgaMxk12ORaU2Y/fCMlCP4KqsNfFGDTZewbU/1nADDCsMqj/Nr4Amc2jv+k38oYyKMkiP@lists.linux.dev
X-Gm-Message-State: AOJu0YyGtgMDk0mZIJJVhnepp65o0K1FLHLAAfh9eaIpQczdd09/D2LM
	sBmPksTuDNiQGrO7U56zHwuSL/mrq6GY2uxJIH+2sdnxQH+5lu8bHe2u
X-Gm-Gg: AR+sD129VDMEeWvhVZJN4FUKTueVujZeDg7kBWdw3S7ACp0f07CUbrQC4OShKTP5OPH
	Teo9xhvORCqxHSLPuj59rNDjIfT2vUCZdthp1mSwN4pL/x3DVV/ryGWqQHc2B+S3X6qT8XO0Io2
	yBEcGIZihNjE+maXXhYecXmJ4sb1fRxkJaZuEA/E035/gUl4vJI92lcWZk7iOKfXAJnB3lmLYop
	pG9IL0VhKcP5L8lqR9QTo2yrXuuNAnBm0O/Uw5LYX4uwhP8qocw6u/JewcYE2OBUjcnPO9nlE8P
	p2JlvgN4WNb34+VI3HunEzZgKVer7ciqzyyJ9zOmv6EtzuT8wulmgXBHE7JJNWvemZMxMZWTGV8
	WYTx033thqU/rbvm952a/2J86exZUtQ3NzQL1I5c7J1HUPP9F82PeTq3K8Md/jLNJ1NfdHObvPL
	hXsFnIKsTvqB9SuJLeXXzgL+CDmdasobTj4h6aikEuFo+cUNBubpBH4OZJ4n5PbdrQHOcz4V4ZS
	Rzcqw==
X-Received: by 2002:a17:90b:28c3:b0:381:bc4c:da56 with SMTP id 98e67ed59e1d1-3903c6128c6mr42689252a91.19.1786337308075;
        Sun, 09 Aug 2026 21:48:28 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dc396dsm13045106a91.3.2026.08.09.21.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:48:27 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 7/8] ntfs: add non-resident WOF decompression
Date: Mon, 10 Aug 2026 13:48:01 +0900
Message-ID: <20260810-topic-wof-v1-7-6a97cfa3bb59@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14742; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=y9Ka3GoFfH7ME1EdMIauAkDmtDLocMwMf9MrNO1h5yI=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqeVeRbd62q3+150TePEMCZC8ukjIznmLkfP9OY
 GxeA/VggoOJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCanlXkQAKCRA08jD6945I
 0/MzEACqyAGCTruVPvwhqsaxfuf7CaJj+UcKR0hWPhm/7OYUvpAAVzcb9pF9aNoiNCRC6QW6Ul3
 3orrMF++52cyyTsC2R3dpVoEYcOhSY1DGSUPbRBpJ/N2UDG05EojwsVNdSUZaB0e04fEoes6Loe
 w4kk4xUFtdzWzjPnhXzRDLQh8/ENvrPRQNgJTSEYUiiS2z8hgTNrv2jIEcZFkkwKRyk8FerSqCH
 URlB7yUiMfGfZbuEMMCvm020oLbcO3TnYLtxQIItmTBW8nDyH3qJdRk0zDwB6SCslSuldNA8Z0+
 /Yjipt61A0O7ePdl+aHmsezOuz9+qlOqDhrj5feGDHpM4cLEYJUoWkr5oaeSegUTDtcHMJw3wWx
 lWqrZ6CnWecGb4u/WUUzdZBiDqqTbfR9u/7LYjw4F+5tS5LM5OvR+8F4gCvicC7E5S/h6kyp8tN
 GAfeKcC1UM/urTrs4eN7Puy2M3s7RxF4gaLwP1V67cLHhYkL1DmRwy89duSCw3jiYRtya/ygzyW
 W/I62ejU0YWEVgu8QHfC7FM/EDaeVhQHceIVFSsx6AVLmZY09H5kHqY76JzfsAIS9RC/3RF+Ukg
 6RWtbRiVV1QqmVoa/pco8udrOio9rTMMfIoX0Se6vGLRDDoWegeUk1+px0pFEZzgBLk6k4HQtOz 87ALjugR1cywc5w==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Introduce non-resident Windows System Compression (WOF) decompression
support. Add wof.c containing parse_wof_chunk_table() and
ntfs_read_wof_compressed_block(), and routing them via transparent
codec ops table with dynamic scratch memory allocation. Hook up
ntfs_readpage/read_folio paths in aops.c to delegate to the WOF block
reader when NInoWofCompressed is set.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/Makefile |   2 +-
 fs/ntfs/aops.c   |   7 +-
 fs/ntfs/attrib.c |   2 +-
 fs/ntfs/inode.c  |   4 +-
 fs/ntfs/ntfs.h   |   3 +
 fs/ntfs/wof.c    | 380 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 393 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs/Makefile b/fs/ntfs/Makefile
index 5e5fd05f5863..ee8987e496a8 100644
--- a/fs/ntfs/Makefile
+++ b/fs/ntfs/Makefile
@@ -7,7 +7,7 @@ ntfs-y := aops.o attrib.o collate.o dir.o file.o index.o inode.o \
 	  upcase.o bitmap.o lcnalloc.o logfile.o reparse.o compress.o \
 	  iomap.o debug.o sysctl.o object_id.o bdev-io.o
 
-ntfs-$(CONFIG_NTFS_FS_WOF_COMPRESSION) += \
+ntfs-$(CONFIG_NTFS_FS_WOF_COMPRESSION) += wof.o \
 	lib/decompress_common.o lib/lzx_decompress.o lib/xpress_decompress.o
 
 ccflags-$(CONFIG_NTFS_DEBUG) += -DDEBUG
diff --git a/fs/ntfs/aops.c b/fs/ntfs/aops.c
index 173de4cbee0f..57dfb99ae567 100644
--- a/fs/ntfs/aops.c
+++ b/fs/ntfs/aops.c
@@ -93,6 +93,10 @@ static int ntfs_read_folio(struct file *file, struct folio *folio)
 		/* Compressed data streams are handled in compress.c. */
 		if (NInoNonResident(ni) && NInoCompressed(ni))
 			return ntfs_read_compressed_block(folio);
+#ifdef CONFIG_NTFS_FS_WOF_COMPRESSION
+		else if (NInoWofCompressed(ni))
+			return ntfs_read_wof_compressed_block(folio);
+#endif
 	}
 
 	iomap_read_folio(&ntfs_read_iomap_ops, &ctx, NULL);
@@ -234,7 +238,8 @@ static void ntfs_readahead(struct readahead_control *rac)
 	 * Resident files are not cached in the page cache,
 	 * and readahead is not implemented for compressed files.
 	 */
-	if (!NInoNonResident(ni) || NInoCompressed(ni))
+	if (!NInoNonResident(ni) || NInoCompressed(ni) ||
+	    NInoWofCompressed(ni))
 		return;
 	iomap_readahead(&ntfs_read_iomap_ops, &ctx, NULL);
 }
diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index c62c8ca8b987..45624e3d1dc9 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -2137,7 +2137,7 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 		ni->runlist.count = 0;
 	write_lock_irqsave(&ni->size_lock, flags);
 	ni->allocated_size = new_size;
-	if (NInoSparse(ni) || NInoCompressed(ni)) {
+	if ((NInoSparse(ni) && !NInoWofCompressed(ni)) || NInoCompressed(ni)) {
 		ni->itype.compressed.size = ni->allocated_size;
 		if (a->data.non_resident.compression_unit) {
 			ni->itype.compressed.block_size = 1U <<
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 8d9bbc151309..0d7d19cd6c49 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1119,7 +1119,7 @@ static int ntfs_read_locked_inode(struct inode *vi)
 		}
 		if (a->non_resident) {
 			NInoSetNonResident(ni);
-			if (NInoCompressed(ni) || NInoSparse(ni)) {
+			if (NInoCompressed(ni) || (NInoSparse(ni) && !NInoWofCompressed(ni))) {
 				if (NInoCompressed(ni) &&
 				    a->data.non_resident.compression_unit != 4) {
 					ntfs_error(vi->i_sb,
@@ -1398,7 +1398,7 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
 				"Attribute name is placed after the mapping pairs array.");
 			goto unm_err_out;
 		}
-		if (NInoCompressed(ni) || NInoSparse(ni)) {
+		if (NInoCompressed(ni) || (NInoSparse(ni) && !NInoWofCompressed(ni))) {
 			if (NInoCompressed(ni) && a->data.non_resident.compression_unit != 4) {
 				ntfs_error(vi->i_sb,
 					"Found non-standard compression unit (%u instead of 4).  Cannot handle this.",
diff --git a/fs/ntfs/ntfs.h b/fs/ntfs/ntfs.h
index 45064dbcc2e4..e6dbe382de4e 100644
--- a/fs/ntfs/ntfs.h
+++ b/fs/ntfs/ntfs.h
@@ -202,6 +202,9 @@ static inline struct ntfs_volume *NTFS_SB(struct super_block *sb)
 
 /* From fs/ntfs/compress.c */
 int ntfs_read_compressed_block(struct folio *folio);
+#ifdef CONFIG_NTFS_FS_WOF_COMPRESSION
+int ntfs_read_wof_compressed_block(struct folio *folio);
+#endif
 int allocate_compression_buffers(void);
 void free_compression_buffers(void);
 int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
diff --git a/fs/ntfs/wof.c b/fs/ntfs/wof.c
new file mode 100644
index 000000000000..4c2a5943ffaf
--- /dev/null
+++ b/fs/ntfs/wof.c
@@ -0,0 +1,380 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Windows System Compression (WOF) decompression glue.
+ *
+ * Copyright (c) 2026 LG Electronics Co., Ltd.
+ */
+
+#include <linux/fs.h>
+#include <linux/blkdev.h>
+#include <linux/highmem.h>
+#include <linux/vmalloc.h>
+#include <linux/slab.h>
+
+#include "ntfs.h"
+#include "inode.h"
+#include "debug.h"
+#include "ntfs_codec.h"
+#include "attrib.h"
+
+static const __le16 WOF_NAME[] = {
+	cpu_to_le16('W'), cpu_to_le16('o'), cpu_to_le16('f'),
+	cpu_to_le16('C'), cpu_to_le16('o'), cpu_to_le16('m'),
+	cpu_to_le16('p'), cpu_to_le16('r'), cpu_to_le16('e'),
+	cpu_to_le16('s'), cpu_to_le16('s'), cpu_to_le16('e'),
+	cpu_to_le16('d'), cpu_to_le16('D'), cpu_to_le16('a'),
+	cpu_to_le16('t'), cpu_to_le16('a'),
+};
+
+#define WOF_NAME_LEN 17
+
+static int ntfs_bdev_read_from_rl(struct ntfs_volume *vol, struct runlist *runlist,
+				  sector_t start_sector, u32 sector_count, void *buf)
+{
+	struct runlist_element *rl;
+	u32 sec_per_clu_bits = vol->cluster_size_bits - 9;
+	s64 vcn = start_sector >> sec_per_clu_bits;
+	u32 sec_off = start_sector & ((1 << sec_per_clu_bits) - 1);
+	u32 buf_off = 0;
+	int err;
+
+	down_read(&runlist->lock);
+	if (!runlist->rl) {
+		up_read(&runlist->lock);
+		return -EINVAL;
+	}
+
+	rl = __ntfs_attr_find_vcn_nolock(runlist, vcn);
+	if (IS_ERR(rl)) {
+		err = PTR_ERR(rl);
+		goto out_unlock;
+	}
+
+	while (sector_count > 0) {
+		s64 lcn;
+		loff_t byte_off;
+		u32 byte_len, sectors;
+
+		if (!rl->length || vcn < rl->vcn) {
+			err = -EINVAL;
+			goto out_unlock;
+		}
+
+		lcn = ntfs_rl_vcn_to_lcn(rl, vcn);
+		if (lcn < 0 && lcn != LCN_HOLE) {
+			err = -EINVAL;
+			goto out_unlock;
+		}
+
+		/* Sectors available in remaining clusters of this rl element */
+		sectors = ((rl->vcn + rl->length - vcn) << sec_per_clu_bits) - sec_off;
+		sectors = min_t(u32, sector_count, sectors);
+		byte_off = ntfs_cluster_to_bytes(vol, lcn) + (sec_off << 9);
+		byte_len = sectors << 9;
+
+		if (lcn == LCN_HOLE) {
+			memset((u8 *)buf + buf_off, 0, byte_len);
+		} else {
+			err = ntfs_bdev_read(vol->sb->s_bdev, (char *)buf + buf_off,
+					     byte_off, byte_len);
+			if (err)
+				goto out_unlock;
+		}
+
+		buf_off += byte_len;
+		sector_count -= sectors;
+		rl++;
+		vcn = rl->vcn;
+		sec_off = 0;
+	}
+
+	err = 0;
+out_unlock:
+	up_read(&runlist->lock);
+	return err;
+}
+
+static int parse_wof_chunk_table(struct ntfs_inode *ni, u64 chunk_idx, u64 chunk_count,
+				 u64 *chunk_offset, u32 *chunk_size)
+{
+	u8 bytes_per_off;
+	u8 *buf_aligned = NULL, *buf = NULL;
+	u64 off[2];
+	u64 chunk_data_size;
+	int ret = 0;
+
+	/* Determine offset table entry size based on file size */
+	if (ni->data_size < (1ULL << 32))
+		bytes_per_off = sizeof(__le32);
+	else
+		bytes_per_off = sizeof(__le64);
+
+	if (!chunk_count ||
+	    ni->data_size < (chunk_count - 1) * bytes_per_off)
+		return -EINVAL;
+	chunk_data_size = ni->data_size - (chunk_count - 1) * bytes_per_off;
+
+	if (NInoNonResident(ni)) {
+		u64 byte_off;
+		sector_t start_sector;
+		u32 sector_off, sectors;
+
+		if (chunk_idx > 0)
+			byte_off = (chunk_idx - 1) * bytes_per_off;
+		else
+			byte_off = 0;
+
+		start_sector = byte_off >> 9;
+		sector_off = byte_off & ((1 << 9) - 1);
+		sectors = DIV_ROUND_UP(sector_off + 2 * bytes_per_off, 512);
+
+		buf_aligned = kmalloc(sectors << 9, GFP_NOFS);
+		if (!buf_aligned)
+			return -ENOMEM;
+		if (ntfs_bdev_read_from_rl(ni->vol, &ni->runlist,
+					   start_sector,
+					   sectors,
+					   buf_aligned)) {
+			ret = -EIO;
+			goto out;
+		}
+		buf = buf_aligned + sector_off;
+
+		if (chunk_idx + 1 == chunk_count) {
+			if (bytes_per_off == sizeof(__le32))
+				((__le32 *)buf)[1] =
+					cpu_to_le32(ni->data_size -
+						    (chunk_count - 1) * bytes_per_off);
+			else
+				((__le64 *)buf)[1] =
+					cpu_to_le64(ni->data_size -
+						    (chunk_count - 1) * bytes_per_off);
+		}
+	} else {
+		/* Resident WOF chunk table logic will be added in Commit 8 */
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
+	if (bytes_per_off == sizeof(__le32)) {
+		__le32 *addr = (__le32 *)buf;
+
+		off[0] = chunk_idx ? le32_to_cpu(addr[0]) : 0;
+		off[1] = chunk_idx ? le32_to_cpu(addr[1]) : le32_to_cpu(addr[0]);
+	} else {
+		__le64 *addr = (__le64 *)buf;
+
+		off[0] = chunk_idx ? le64_to_cpu(addr[0]) : 0;
+		off[1] = chunk_idx ? le64_to_cpu(addr[1]) : le64_to_cpu(addr[0]);
+	}
+
+	if (off[1] <= off[0] || off[1] > chunk_data_size) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	*chunk_offset = (chunk_count - 1) * bytes_per_off + off[0];
+	*chunk_size = (u32)(off[1] - off[0]);
+
+out:
+	kfree(buf_aligned);
+	return ret;
+}
+
+int ntfs_read_wof_compressed_block(struct folio *folio)
+{
+	struct page *page = &folio->page;
+	struct address_space *mapping = folio->mapping;
+	struct ntfs_inode *ni = NTFS_I(mapping->host), *wof_ni;
+	struct inode *wof_inode;
+	struct ntfs_volume *vol = ni->vol;
+	loff_t i_size = i_size_read(VFS_I(ni));
+	char *decomp_mem = NULL, *chunk_mem = NULL, *chunk_mem_aligned;
+	struct page **pages = NULL;
+	u32 comp_unit, pages_per_chunk, chunk_size, chunk_size_aligned, decomp_size;
+	u64 chunk_offset_aligned, chunk_idx, chunk_count, chunk_offset;
+	unsigned long index;
+	int i, err = 0;
+	const struct ntfs_codec_ops *codec;
+
+	index = folio->index;
+
+	/* Determine frame size and frame number */
+	comp_unit = 1U << ni->itype.compressed.block_size_bits;
+	chunk_offset_aligned = (u64)index << PAGE_SHIFT;
+	chunk_offset_aligned &= ~((u64)comp_unit - 1);
+	chunk_idx = chunk_offset_aligned >> ni->itype.compressed.block_size_bits;
+	chunk_count = DIV_ROUND_UP_ULL(i_size, comp_unit);
+
+	/*
+	 * If the requested page is past the end of the file, there is no
+	 * chunk to decompress.  Zero the page and return success.
+	 */
+	if (chunk_idx >= chunk_count) {
+		folio_zero_segments(folio, 0, PAGE_SIZE, 0, 0);
+		SetPageUptodate(page);
+		unlock_page(page);
+		return 0;
+	}
+
+	/* Select codec based on block size bits */
+	switch (ni->itype.compressed.block_size_bits) {
+	case 12:
+		codec = &ntfs_xpress4k_codec_ops;
+		break;
+	case 13:
+		codec = &ntfs_xpress8k_codec_ops;
+		break;
+	case 14:
+		codec = &ntfs_xpress16k_codec_ops;
+		break;
+	case 15:
+		codec = &ntfs_lzx32k_codec_ops;
+		break;
+	default:
+		err = -EINVAL;
+		goto out;
+	}
+
+	wof_inode = ntfs_attr_iget(VFS_I(ni), AT_DATA, (__le16 *)WOF_NAME, WOF_NAME_LEN);
+	if (IS_ERR(wof_inode)) {
+		err = PTR_ERR(wof_inode);
+		goto out;
+	}
+
+	wof_ni = NTFS_I(wof_inode);
+	if (!wof_ni->runlist.rl) {
+		err = ntfs_attr_map_whole_runlist(wof_ni);
+		if (err)
+			goto out_iput;
+	}
+
+	err = parse_wof_chunk_table(wof_ni, chunk_idx, chunk_count,
+				    &chunk_offset, &chunk_size);
+	if (err)
+		goto out_iput;
+
+	if (chunk_size > comp_unit) {
+		ntfs_error(vol->sb, "Compressed size (%u) > frame size (%u)",
+			   chunk_size, comp_unit);
+		err = -EINVAL;
+		goto out_iput;
+	}
+
+	if (chunk_idx + 1 == chunk_count)
+		decomp_size = 1 + ((i_size - 1) & (comp_unit - 1));
+	else
+		decomp_size = comp_unit;
+
+	/* Allocate pages for the uncompressed chunk */
+	pages_per_chunk = comp_unit >> PAGE_SHIFT;
+	pages = kcalloc(pages_per_chunk, sizeof(struct page *), GFP_NOFS);
+	if (!pages) {
+		err = -ENOMEM;
+		goto out_iput;
+	}
+
+	for (i = 0; i < pages_per_chunk; i++) {
+		unsigned long pg_index = (chunk_offset_aligned >> PAGE_SHIFT) + i;
+		struct page *p;
+
+		if (pg_index == index) {
+			pages[i] = page;
+			continue;
+		}
+		p = grab_cache_page_nowait(mapping, pg_index);
+		if (!p) {
+			err = -ENOMEM;
+			goto out_unlock;
+		}
+		pages[i] = p;
+	}
+
+	decomp_mem = vmap(pages, pages_per_chunk, VM_MAP, PAGE_KERNEL);
+	if (!decomp_mem) {
+		err = -ENOMEM;
+		goto out_unlock;
+	}
+
+	/* Allocate buffer for compressed data */
+	chunk_size_aligned = DIV_ROUND_UP_ULL(chunk_offset + chunk_size, 1 << 9) -
+			     (chunk_offset >> 9);
+	chunk_size_aligned <<= 9;
+	chunk_mem_aligned = kvmalloc(chunk_size_aligned, GFP_NOFS);
+	if (!chunk_mem_aligned) {
+		err = -ENOMEM;
+		goto out_unmap;
+	}
+
+	/* Read compressed data from disk */
+	if (!NInoNonResident(wof_ni)) {
+		/* Resident WOF data read logic will be added in Commit 8 */
+		err = -EOPNOTSUPP;
+		goto out_free;
+	} else {
+		err = ntfs_bdev_read_from_rl(vol, &wof_ni->runlist,
+					     chunk_offset >> 9,
+					     chunk_size_aligned >> 9,
+					     chunk_mem_aligned);
+		if (err)
+			goto out_free;
+		chunk_mem = chunk_mem_aligned + (chunk_offset & ((1 << 9) - 1));
+	}
+
+	/* Decompress using codec ops with dynamic scratch */
+	if (chunk_size == decomp_size) {
+		memcpy(decomp_mem, chunk_mem, decomp_size);
+	} else {
+		void *scratch;
+
+		scratch = kvzalloc(codec->scratch_size(comp_unit), GFP_NOFS);
+		if (!scratch) {
+			err = -ENOMEM;
+			goto out_free;
+		}
+		err = codec->decompress_chunk(scratch, chunk_mem, chunk_size,
+					      decomp_mem, decomp_size, comp_unit);
+		kvfree(scratch);
+		if (err) {
+			ntfs_error(vol->sb, "Decompression failed: %d", err);
+			err = -EINVAL;
+			goto out_free;
+		}
+	}
+
+	/* Zero any partial page at end */
+	if (decomp_size < comp_unit)
+		memset(decomp_mem + decomp_size, 0, comp_unit - decomp_size);
+
+	/* Mark pages as uptodate */
+	for (i = 0; i < pages_per_chunk; i++) {
+		if (pages[i]) {
+			SetPageUptodate(pages[i]);
+			flush_dcache_page(pages[i]);
+		}
+	}
+
+out_free:
+	kvfree(chunk_mem_aligned);
+out_unmap:
+	vunmap(decomp_mem);
+out_unlock:
+	for (i = 0; i < pages_per_chunk; i++) {
+		if (pages[i] && pages[i] != page) {
+			if (err)
+				ClearPageUptodate(pages[i]);
+			unlock_page(pages[i]);
+			put_page(pages[i]);
+		}
+	}
+	kfree(pages);
+out_iput:
+	iput(wof_inode);
+out:
+	if (err)
+		ClearPageUptodate(page);
+	else
+		SetPageUptodate(page);
+	unlock_page(page);
+	return err;
+}

-- 
2.43.0

