Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01CA47F78B
	for <ntfs@lists.linux.dev>; Fri,  9 Oct 2026 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532534; cv=none; b=kWqRojDSKhvikBoUiE0blqYStqbyZKfHWRFiS8tPeHn34SyNtp7i2GB0kcAjg+FVBTweZzvsHJ9PNe/s6oipKnWqnU0rxyoZCazSoBVShzgKObiNcnMU+nBZtxaqiLIVe7U5WKxat7TiRk83Ur/NmedhDLbdogK8d4rHber+BiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532534; c=relaxed/simple;
	bh=GGWG3PvZ+dj8ILoMzIykvL89QNaM5P9n7sLzJHHke88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ENFd4+tHcUu/rD99SnVnkPnTX1yAl97l4pSD/xMpAQtCbRnnT1Tvdj1IwWCSTJp2TMNgB0nO26XlGgYop6rCgBa4hOeOCyrzRHidiaG+Q/HBleEGiHNcaqw6fkEr0KOYEtfqMtl1GyUxc4WMuc4EE5dv674Oo9xa7A1hQXkFlic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bB08EW5T; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bB08EW5T"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398b3c37877so2460660a91.0
        for <ntfs@lists.linux.dev>; Fri, 09 Oct 2026 00:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791532529; x=1792137329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PldMFnVlgQbE+SWzFQzANLNCaFlxPpZ8LNtou8BYP7c=;
        b=bB08EW5TkTWCe3MzO+6691z5P6NWYvoXtg37/QWtpg+iypK1NUaJ9Ky9ZT8Ad0kqRw
         jKtwCCKt2h+AVnDKiERmJ4yU9JqFXN395vTWyOc0ahIX35xp/vBNUQeVry1g1XCDUYuv
         aM6Ur641zskKN3nPV4WKoGxr1VUqSohxG+UPKzugEK60gSMn7c2fXvkBk0d+KJ0EV8Mj
         i34YP2DXBMl30PHgnOua7/l3hfPvNtJdTJxe9a+v16rEKzKgqfVBr9e+suMW0b9B355U
         yHvJeSuNvlXvvM38nx0+sLk9hZkNhqIkQJE8Aid1uuii7+wNib6RxDxS/40ls/Ye87kz
         r1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791532529; x=1792137329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PldMFnVlgQbE+SWzFQzANLNCaFlxPpZ8LNtou8BYP7c=;
        b=O9gVpkpR/Y0wjbNhJ0jzk3EyRABguMHG7CEsjLhGyporU0vl6Hc+EZwFIYdgfi5x6q
         NyRQe8iMnSmDwDVaPTuYykGRzzWrgf1P+eyd1JqbyBZYPZFWFRz3vguf65pR7YqU5YnK
         d8IUNDZNJ1Nt2tDlJNPsp2jHgpkPqTJaZbu6e+m4seMW+G+OEEFaR27PvNiAbWiYC3SQ
         wb/rZv7pomOA8eh/exxYZvhNz122W4foO3RpguDfwB9sDENr+uhzzGBnXHaTAx/uHBTD
         Y19ppbdxuYEZOIaR1l0CTQ2TQhM6Wg57YFKIzdMPmhU5ED6gyDGAS54L8MBMduPgxgRY
         z08w==
X-Gm-Message-State: AFq9FYJwamVhP6ZSAZYNHlRY7JKVYoQ0t5laL+CqTz9B7imWJ9X2WWrm
	2gSHqRrA1SNw6omNcT0W11kBSUajZ56MsbuADFmhnrFBXDkZj57e33EO
X-Gm-Gg: AYBFou3F/WKWQl8b/051NkHePT7E+/UN9Stub+pUV+4N/EXmJA3Rf4Ei8uMrTBoLMWU
	aVTTJZ9YBtw5NGfQy8LVaLZr84occyiHIOguWuO9/+Jbee7j6vGcuu2X4LMe0ecx4SK4q0KphS2
	BWKe/oB1S96/WCyGST12J23L7Pw2fk8V+Ttgskl4JNhdpt2NAMoQIV7IGwhKTcG04PrO4nLK5My
	zyDdzh2+tjSu7pO1d9Df/0pRpVAUUmnYyKNkHKNioQN/lNIDeKvIqEH3Rf2fe7iqBleTzdyhJy3
	bOskqHeNRVnsv2+dVwO8fBPn+Mk7f9GEQt7HWc0pfGnIgy+hOLItKgRpMe502wqVWUZKwu2KyFs
	aMlvyC7zXcburQhmD/ayGcqBME7A8tnsjO7J7WS+ON0T1KWbw7GogEZ9BrO72hBiy+h9a+/cl9T
	gzfzSXXrn0w83WjkM9NxATWrYRIN7GPJS5RnO+AMbr5ciraugid65dsXisXBfUHzxO8gTvEJhBk
	d/5sRda6NKY
X-Received: by 2002:a17:90b:4b85:b0:3a0:f4ee:d2a6 with SMTP id 98e67ed59e1d1-3ab3ac54b32mr1040897a91.19.1791532529056;
        Fri, 09 Oct 2026 00:55:29 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38dd5864sm2246769a91.8.2026.10.09.00.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:55:28 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] ntfs: widen the sub-block offsets in ntfs_decompress()
Date: Fri,  9 Oct 2026 15:55:23 +0800
Message-ID: <20261009075523.3135206-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_decompress() tracks where the current sub-block starts and ends
inside the destination page with two u16s:

	u16 do_sb_start;
	u16 do_sb_end;
	...
	do_sb_start = *dest_ofs;
	do_sb_end = do_sb_start + NTFS_SB_SIZE;

*dest_ofs is an int page offset masked with ~PAGE_MASK, and
NTFS_SB_SIZE is 0x1000, so do_sb_end needs PAGE_SIZE + 0xfff of range.
That exceeds u16 once PAGE_SIZE reaches 0x10000: the last sub-block of a
page starts at 0xf000 and do_sb_end wraps from 0x10000 to 0.

The zero-fill that pads a short sub-block then computes a negative
length:

	if (dp_addr < dp_sb_end) {
		int nr_bytes = do_sb_end - *dest_ofs;

		memset(dp_addr, 0, nr_bytes);

A sub-block made only of symbol tokens reaches this without consulting
do_sb_end on the way, because that path just does

	*dp_addr++ = *cb++;
	++*dest_ofs;

and is bounded by dp_addr against dp_sb_end.  With do_sb_start at 0xf000
and eight literal bytes emitted, nr_bytes is -61448 and the memset()
runs for 18446744073709490168 bytes.

Getting there is cheap: fifteen sub-blocks of eleven bytes each advance
*dest_ofs to 0xf000, since the same zero-fill pads each of them out to
0x1000 while do_sb_end is still exact, and the sixteenth one triggers
the wrap.  A compression block is 0x10000 bytes with 4 KiB clusters and
the fixed compression unit of 4, so all sixteen fit with room to spare.

Phrase tokens are bounded against do_sb_end and so return -EOVERFLOW
instead, and the

	if (*dest_index == dest_max_index && do_sb_end > dest_max_ofs)

check at the top of the sub-block stops firing for the same reason.

Use int for both, matching *dest_ofs and dest_max_ofs.  The narrow type
came in with the original import and survived the removal and revert of
the driver.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
---
 fs/ntfs/compress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 075b57fc1de61..82c7c7d290737 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -182,8 +182,8 @@ static int ntfs_decompress(struct page *dest_pages[], int completed_pages[],
 	u8 *dp_addr;		/* Current pointer into dp. */
 	u8 *dp_sb_start;	/* Start of current sub-block in dp. */
 	u8 *dp_sb_end;		/* End of current sb in dp (dp_sb_start + NTFS_SB_SIZE). */
-	u16 do_sb_start;	/* @dest_ofs when starting this sub-block. */
-	u16 do_sb_end;		/* @dest_ofs of end of this sb (do_sb_start + NTFS_SB_SIZE). */
+	int do_sb_start;	/* @dest_ofs when starting this sub-block. */
+	int do_sb_end;		/* @dest_ofs of end of this sb (do_sb_start + NTFS_SB_SIZE). */
 
 	/* Variables for tag and token parsing. */
 	u8 tag;			/* Current tag. */

base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898
-- 
2.43.0

