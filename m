Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5620A382368
	for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 07:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787125429; cv=none; b=IcDJvef5MqB9+2qXeWZfdxpN4GtnnW3rzS5FIi8J8GcTZPWvSQvVOmblJA6e441M6uVqqFA2W5mhR1NhmuPaTlS9Iy7uhVWCSn6gaQRcvgOoT/uurGIBZeTnDdrPvm0f/nAjKHWMZiQDRjaUK2waEmXaQJb26ahTfnGtIFyhzQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787125429; c=relaxed/simple;
	bh=m0qhCbM887aaINCPCloCfUzu7MjIdel2WBCf7XSZAS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=APB5saUQM1wHHWtuIenSnCvsuZxmFn7kvPwXEvDFCsq9igB2apQPb418AGc4ti8u6DCLK6jPwsga0IJhjEyRonrq0WHzJ/aBZNcGdlDJ85Owg8cS/uJRjgotxwkKN2+/jhDvWrhiVdQtV7Wr0S9ICKYTX2Pif6+tiYFT0MlN8MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLoVfE9e; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLoVfE9e"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso855130b3a.1
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 00:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787125427; x=1787730227; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eSqXc+GR5riKGN+J3Riw47Bg9sRiBl4VIDi0zkcGALY=;
        b=KLoVfE9e61aj3l4aL5vtHBvcNrWLJSNC/cUHK7Bg83TS2LzOoB6uEJwRseiEELCUQl
         HVojpdOJzAKC1Fa8BgxT1H9xc209lJv2whrAhZ80nR3wZEfsRs47jZ9V3cTxsqWiGqLZ
         nD9/QBYm1iXPPY/JBCtDh6r7kSbfRxiFU/8eB7R8UZGgUfZa69xHuEmiDAG2FBvxSLFU
         I/9IBo2RajbHUSXPZy0ARfYvhhkTgRhAhw8ACOYAF2UzZNMBl6ewZlHN0f1Pgr8Y/0x4
         v0b55hmoO5/ROAwXXf2IC9XxX6fHYBrL6pc10raXw3SM0i7OXu33EltUxj0f2HxsNhFn
         x5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787125428; x=1787730228;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eSqXc+GR5riKGN+J3Riw47Bg9sRiBl4VIDi0zkcGALY=;
        b=qZaky9rW5qa4TUnh+QahxCroV5oB92jdaiqkPIf1wKw0oPwP0kjDi3XlRPHPrESqsh
         E1ggiMYp2BBVQn30/zatPXrJhkPgky1SnS99oNphP5C+nbKKMY8LozVwWfOVmjx33iqT
         xumXSgVMIcBYEk2wOw8SZY8UeQc/hBuivU23uV8rsLTUKZmxBARR/qCBPyic3N2Ij7yU
         z/xTVtjbmzRYJsvfjED54rQpW68k77kfnVniTqQl3yfV4PfSLEyre+PRdgxOpbO2KWYT
         Pl0o8XI22aGRgChcx1z3EOHw5lJT1vLvNj32If+6UhEOx8kt2E3d2CSC7Cz2fIuXUqjH
         28og==
X-Forwarded-Encrypted: i=1; AHgh+RreERW1mimyMLTG+cI6evwzpHo6p/fPNVA2mSlG3rPf7je/m6CYHGE294j/awETCtD8YObQ@lists.linux.dev
X-Gm-Message-State: AOJu0YycXTFdwoVIY/klzK6nLzF/h+FDt54Ld3JTlDBQyDTVps8M782s
	94oPuB7LhzwSsae9+ftLRfhxo7ydxcahO4s53gFwu0AZrLn+sR8UCv6g
X-Gm-Gg: AR+sD10a/Nwme9PLFM3wmRrO5gg55Tw8RUkf7r/Ltllbed+qztNT9RWXg7oCkdB/cUI
	kAyjJH7w14osnkjaULXyj2oS2qdwSvC2UAfL/VM+jfMhhvdQ0ZUAJmyPA3rNBzivM89tNeVWt5a
	A20iaHfPdsKrekVIhjudnaI3zZR9Nwsbxzr4LaJN718CoBRshe7WnMpjRvRJgSiTB6f6avGz3Hu
	dwBcmV1aEGIOok71ANTtGyCf21SLNtql3fEFTSclMWImDEo6lomW7RQWfaP17K9HkqcDkswasmf
	V99Op/CnVuXCMety367b6ThrrYx9POTiuPlFx1tgHHDmKiTzNfQvyxNSloAUpyh1AZlwRi5/lNn
	pL78aHAXQFSXnoFKn7qM02QUccNwX3Vb47DuekUPd+d/dHEMEh43NdZ3zAdd/SgPx8OI4eUu+Ty
	q8T2YgMA+KuoghMfxuKLMCLkQyujgJnW1VnRg6dkvc4TOpXE7jkhfRzSZHqRQdkWhqb24W
X-Received: by 2002:a05:6a00:4c84:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-851d39405c0mr4527393b3a.14.1787125427391;
        Wed, 19 Aug 2026 00:43:47 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a19sm314623b3a.43.2026.08.19.00.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 00:43:46 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2 2/8] ntfs: define LZNT1 codec ops under transparent codec interface
Date: Wed, 19 Aug 2026 16:43:20 +0900
Message-ID: <20260819-topic-wof-v2-v2-2-40f56903e7e7@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2313; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=m0qhCbM887aaINCPCloCfUzu7MjIdel2WBCf7XSZAS0=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhV5vEmLQl2mw3b5W0zHCKdSRIdb0lAi2crDWG
 VNY00p2b+yJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoVebwAKCRA08jD6945I
 0za4EACqoVXQWCoV820CCbKtQkxKXLwxaxgG8WcDEA/TkkHomYTFd3ViRoDtItDHVCRvJ+B+vCN
 vhgCXEU2uw8pvHX9LPZIlCldxXIBoiAO664fFARlnAkBlanrWqAk1prdeUVyzXPa8l4fTIX6mVd
 Vi3yXuawStAdHWGGqwErWFk6GRsjIT+mclcqSC3pDzLTQE3enZr52bMbBWHzWa0FhLDodK9bAr8
 /oqz7HZbGvgWnJq7htVpc7mnF8c7AOTi7iJqA93gT7tbemSa4P6wK4xqQ/rweoJHmLExZYtqJhs
 XjhpufP4rNzAFjbBE5YvJeFKFVJCBoXoZMEtaKYm0sxEmqsuWVNOWjWkzynv3Kt9+M/W/TV13Ep
 P1yMn2EvCdrB0V+5AuKQQb8lNYXjtTw1nSQaAq8RAYNBlQOFrW4U7gc+5VDm6iSQkVdq4e4rqWw
 YQJSKkzivx15o7Hhb6nLNJIbJDD9MlnqUHlPb0fN4C79BcXD3jz+MOR7SVq8+/J0N6ZWP7m4g17
 n14g06GDjpZzDgzd59ZuGUSXlQaT0NPTSf3a45rK6BwoWoXjM2GgDlheAJ8i5WCnGgzQ7aOf4Vs
 m2HzhwKXblm5AUu9YBLAE5I/oJ/8wxYPKH/Mm/vDatp9pL0RVLOyf5jRebwFY1I6dyJVw/z8n9D 6c8ORQzvrtvkz0A==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Define the ntfs_lznt1_codec_ops structure containing decompress_pages
and compress_subblock callbacks in compress.c, and export it in
ntfs_codec.h. This structure binds existing LZNT1 decompress and
compress helper functions under the unified transparent compression
interface.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/compress.c   | 12 ++++++++++--
 fs/ntfs/ntfs_codec.h |  2 ++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index ea29fade9b9b..f980e0610a8f 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -21,6 +21,7 @@
 #include <linux/slab.h>
 
 #include "attrib.h"
+#include "ntfs_codec.h"
 #include "inode.h"
 #include "debug.h"
 #include "ntfs.h"
@@ -774,7 +775,7 @@ int ntfs_read_compressed_block(struct folio *folio)
 		unsigned int prev_cur_page = cur_page;
 
 		ntfs_debug("Found compressed compression block.");
-		err = ntfs_decompress(pages, completed_pages, &cur_page,
+		err = ntfs_lznt1_codec_ops.decompress_pages(pages, completed_pages, &cur_page,
 				&cur_ofs, cb_max_page, cb_max_ofs, xpage,
 				&xpage_done, cb_pos, cb_size - (cb_pos - cb),
 				i_size, initialized_size);
@@ -1351,7 +1352,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		pbuf = &outbuf[compsz];
 		addr = kmap_local_page(pages[page_idx]);
 		input = addr + offset_in_page(input_offset);
-		sz = ntfs_compress_block(ctx, input, bsz, pbuf);
+		sz = ntfs_lznt1_codec_ops.compress_subblock(ctx, input, bsz, pbuf);
 		kunmap_local(addr);
 		if (sz < 0) {
 			err = sz;
@@ -1609,3 +1610,10 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 
 	return written;
 }
+
+const struct ntfs_codec_ops ntfs_lznt1_codec_ops = {
+	.id = NTFS_CODEC_LZNT1,
+	.name = "lznt1",
+	.decompress_pages = ntfs_decompress,
+	.compress_subblock = ntfs_compress_block,
+};
diff --git a/fs/ntfs/ntfs_codec.h b/fs/ntfs/ntfs_codec.h
index 14a69d1e4d7f..408b18561a03 100644
--- a/fs/ntfs/ntfs_codec.h
+++ b/fs/ntfs/ntfs_codec.h
@@ -43,4 +43,6 @@ struct ntfs_codec_ops {
 				 const char *inbuf, int bufsize, char *outbuf);
 };
 
+extern const struct ntfs_codec_ops ntfs_lznt1_codec_ops;
+
 #endif /* _NTFS_CODEC_H */

-- 
2.43.0

