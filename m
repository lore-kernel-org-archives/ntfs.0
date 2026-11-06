Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969174;
	b=1rvAl16EMECTWQyiU7D2icxUPbkAFYESmFln69H3M5QRuFGohn+fAhEknp2Z2OeIXqQX
	 sj3BrSl3c4cwF61+saoDm2MZJR5bQ+MLRLlki7KtnHYAExhZ8S/LTTcvzbsVoZ+8YnBQI
	 DEWzAIS86DBRmnqVq3qx7FlLi4um+k1VqU68YJ+tBd1NoV8JiJXeUqDnE6Fniohv3Ft37
	 Jl/DDwIbfdJRHEZZBjeYOTKup/+SkXjyXR3AU9AGlMP3yegadp2EpVXDtUWr+xJTwhcn3
	 rs3SwNkfhTtQFkwqdtd5S7NB0hZQajTr0AnJXuAO9zhR31cvHm3mt80F11rhms3wvpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=to5ZYe36a7Xl7ja/Fvmb8moZkHvXAEhFxAyr4iAV0io=;
	b=0Do5O9n5udAhY9DLqstjkaNbnsUoHcbs0e0PUvYu0ijbdn9//nl2JTqW7XSB2aCM0j6Y
	 ImWUussFLlOG2Vx6PXt9DWD4NMEB6lFbhtqITOisJV34362B1HikAf3zrhtUb4rke2qgp
	 tJFBkTOndhUehTw+Q4D8qJvLcJmIDi38bIviVgtfwMeAF0kxg7BqrFmLZ4Padj34yzRtk
	 6p6EFp2cm3aLhLKsXFis1kbikj/0Jd/Qr0yUtwOohEWuLVDEOfWd1KxAv7R4XPBx4cECm
	 wtzD2U2q/vcTgTgU32xgURTdkRiKwkHaQ3roCZXQXdxgQBwrbqBfwYtGYFaaqE0fLFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VK46p6aV;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423E7606D825
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 12:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 423E7606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VK46p6aV
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36f8cdd30beso496779eec.1
        for <ntfs@lists.linux.dev>; Fri, 06 Nov 2026 04:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793969173; x=1794573973; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=to5ZYe36a7Xl7ja/Fvmb8moZkHvXAEhFxAyr4iAV0io=;
        b=VK46p6aVOdy3G+WBlfZC82uxkMAqop+ERRAhxQGv7gsLoCPcw1mL8yx7YcSqTmS+R7
         eJm9XXsNcw75gSP0vhvT50M3r3IpkbqPmWOf/GRqQ0dD8blzP5mBC7jFkvnBO6IsWIYt
         8EWe16S/rh1T2mPl53WaMrmyvurjqfQzzQ8Hk2xNIAzxviPo2w/YZqXWnlF+VNyNWkCd
         sRKT8+iQyr6zlyBW8CW/gnL8rKkM6M01y5wNnSMB/xLvbjBtskdXCIFQzjgSwbo+j+kt
         6/1FMajXprxJUrBPcoYpuh2KQs98vy/Znu741fsMkcnL+Mvan6GFUqXe2gcrQyZFJcTM
         a5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793969173; x=1794573973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=to5ZYe36a7Xl7ja/Fvmb8moZkHvXAEhFxAyr4iAV0io=;
        b=L6bQ7ZbaTPUF50a5s+oIWvnvCsVjtiyxoj3kuSqr0wPPu1iux7AfUMF+JJgtjTIfKK
         f7yMX6m+5tkPaI2xYeH1AIrpxkEMNFFAb3MDJPBFALNdBrpmhbu141rJPncJ+yJzfrE1
         4nv1DjO2IQ/2DbF7WTCyZ3pOdAxSqN9L4n4pe7vU32cfRzcCWTOYRRTtDUA5Ltlyywot
         DuWohwqz2oDSB3XxmfydxDNJCC86aHgNjnCvpDOaFg+DVWpHMchQQi2CzB7WdqKqGzeL
         U0qPvHpXX+93TBEQgyeyjibWAudUdIyC9v3SZkqEFmkZcbU2JEZ4pskPgrH4fXBAGHju
         DZkw==
X-Gm-Message-State: APuU4Z8gsY9uZozox3125Nak1RjhdArenXWNPdK+LIHrEaI1MFS7mmhE
	6G2ja3Zs0AgK0cWIFHBqD2lM0ONu9CamWhmqPyVcfco7whRt6f3p64bsQwaIJcIbcY/dlw==
X-Gm-Gg: AYBFou2q6ADUE7EC5hXKQi0AhNmOVLwCJiuZFA4yLGP0ibOLdqyrp9CjxGKDX+uQJPf
	nf+uZtMSXgBPdD43ujH+fh8cuN6a88l5Kx1dB+IHAuOgEWpMiZNEIy4A0WzK0CqSZeFOrIY6ZIe
	04Iv+qyAkrJjlPLyzf0iCR9wpvSG7KUSZHDmlNE0yTzQCRt/PGuV6vkhxf71crDcZyMFLV9hVJk
	F8suDg+fr9De8VV23XV3sbA+jCkUgTDTkReexKBdJFmdrTU67+hZfWMgwNawNiPyUoZAAJvlMLs
	VEY6ojPYpmGJ20OqFx8SmfJGq/XTYBXWRizzY9UC1qCnCEGH1GV42PT1fzp5ry9Td5ymA8jhItD
	ARgGceQUp9BCq40TLvXFRyZf/ZsgDFy6Mzg2XJ7ov2F3LhlSJyUN7LgrTM230jrnMRquc9GIzGs
	LZQPXs6EK7xhZXdId3UtuOnv9DZNNmfxwYJEMvT3nQF6Tz0/FH8QNx1bj6zRjy0ZbHaFb+47hSc
	PaWK2wHGBNHUMI/SHIADTDd0J3aylsV0lXH2rZjFgWB2DN4bjCGvgK7RVm5UkzTNxuOKQJyRBs6
	9/5HFqTcbYiS96a5FBgzO3zUOKTaWn/7Opj9G5x6kxfiBAsaw+Ir/llNUWIZGmEXew==
X-Received: by 2002:a05:7301:424a:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-36f772f9061mr3192845eec.30.1793969172763;
        Fri, 06 Nov 2026 04:46:12 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651eccdsm6802331eec.1.2026.11.06.04.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:46:12 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/3] ntfs: do not convert a named $DATA stream when making room in a record
Date: Fri,  6 Nov 2026 18:15:53 +0530
Message-ID: <20261106124553.2617026-4-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106124553.2617026-1-wahidzk0091@gmail.com>
References: <20261106124553.2617026-1-wahidzk0091@gmail.com>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an attribute has to grow and the mft record is full,
ntfs_resident_attr_resize() walks the other resident attributes and
converts them to non-resident ones. For $DATA it always opens the
unnamed data inode of the base inode, even if the attribute found is a
named stream:

  tvi = ntfs_iget(sb, base_ni->mft_no);
  ntfs_attr_make_non_resident(NTFS_I(tvi), value_len);

value_len is the length of the stream, so it does not match the
attribute that ntfs_attr_make_non_resident() looks up for the unnamed
inode, and the WARN_ON() on entry fires:

  WARNING: fs/ntfs/attrib.c:2115 at ntfs_attr_make_non_resident
   ntfs_resident_attr_resize
   ntfs_attr_expand_locked
   ntfs_expand_for_write
   ntfs_file_write_iter
   vfs_write

With debug output the values were attr_size 13 (unnamed $DATA) and
data_size 550 (named stream) for the same mft record.

It does not need a damaged volume. A file with an alternate data stream
whose record has no room left is enough. The fuzzer found it through a
single changed byte in a file name of an image from mkntfs, which made
a write grow a resident attribute in such a record.

Opening the stream by name instead would convert it with only the mft
record lock held. Its folio would be locked under that lock, while the
read path takes the folio lock first and the mft record lock inside
ntfs_read_iomap_begin_resident(). Streams are not converted from this
loop, which only tries to make room, so skip them.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 fs/ntfs/attrib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index ce7c1b524..800e53df5 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -4932,6 +4932,12 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 			continue;
 		if (a->type == AT_DATA && !value_len)
 			continue;
+		/*
+		 * Named streams have inodes of their own and are not converted
+		 * from here.
+		 */
+		if (a->type == AT_DATA && a->name_length)
+			continue;
 
 		if (a->type == AT_DATA)
 			tvi = ntfs_iget(sb, base_ni->mft_no);
-- 
2.53.0

