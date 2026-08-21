Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2623F23A4
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288502; cv=none; b=CBtcN+sCasqz1fMXtxnvm9HdQdKxGzfJ7gzgI1GGQd07BN0UbVdPsDlZ+WTNsiqeyPg/w+1Hx5peUToxRSNqg3RF8zCxay9k4a4xbpPW3K4dSs5NgPC7gVtYmVFRfbJSHdzLbfAS+5RnRG0Kzk0u8H2dHGuPCdxXPOkm7KhQWZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288502; c=relaxed/simple;
	bh=2ZAhiVkIfnz4CoyGlRqSAtc/yzHfCBC/APqmjR/Ru4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IbRMEqg86r3QXiD6ePUZAccEijHggtt5bkWCQoa+plMLoDGdocWXd+2yS9oiKQzIScvCy9atCKs6MBXDxtEWsWPCFWJ5I6NyDZlKSo8JNj1b2kiWsFygrttvudcHBHvHuRojN/dVftd5D7YDfxq0PbpVx/kVXR9AZ+mPf5wiq3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFYQE6f0; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFYQE6f0"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1469c1b83so819644a12.1
        for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 22:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787288500; x=1787893300; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6sBNCpM9bkGZ3XXgKwfK1GYy5igJ2F9W7NgiYm/oZE=;
        b=CFYQE6f0qEw3joZJ9WuOqiAe3PC3DQyQxIYHas/GwQ/fqD/hGexzcTIubK6Xr+9Pk0
         VdV18DrMawIeTNxE30hjFyqMXIQs0iGA9CybSBBVfMO51BAoTyr8BAD+DpFCsrmfyx1h
         vBw3fTKHdC19Hgd1/coki+YDqzG0afThyuy5sevbppusptrKfNckEaKI15gTynNG+FmK
         V/TEQXSAlkTg+/UFSh5bIeGx1TcPnb7NYPfg/rhTaS+TwLSP8hPBXBAIOvK04k0xvA0m
         jSQnuqDP4yr6EGei5I/aZANeXt4G4l0YxHrJo9jplZm+Ktknq1t13pCoHfkjxrzgiGJa
         SKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288500; x=1787893300;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P6sBNCpM9bkGZ3XXgKwfK1GYy5igJ2F9W7NgiYm/oZE=;
        b=U5O0ih48TnMROYmVXKJnaW5UXNdscYzaVIIcTH5a90w5yfBCXz9Mi6rIc81az5+HYV
         j9DSxYrkMJ/YbG4ecmcgFY19uouyYHi0dO0sQS6oSD8H0zsgcCOu8WGwxHiJs7No3m3y
         uo/48322+e8hZDohAyn2swFvJx/uL/CJc25INHl7cU86ITl878yBHnW3MrK22nzWBR2a
         b3ALo5LzfWrx69qSy+t7OXPZuCqcriCZeHtx80OfxBNbidoWNJ+FWtnG5wYC+3BUNJOf
         puojZR17SBXC6FfKaAUHMWqdaMhe4dof4zcAWv+jEsg3J4vePp9ATaRQ/+sCzY83Zgx5
         FHDg==
X-Forwarded-Encrypted: i=1; AHgh+RqGmxzUU4XfyPiuDXGwFrBE5lO1l2OgqhNOucXQkAT5LGuUXkin4dWGdy7MQOaAhi6qdYVs@lists.linux.dev
X-Gm-Message-State: AFuF++kNNNEoCsnsuPJde0EOmdg53a3+rk178snV1+FkAXD3kiorlyO2
	fapf4C/quamR/qtdYCDJPpep1FoulhJzeM/iQ2jC0od8UnFgFjz03fOT
X-Gm-Gg: AR+sD13UYmPMfQ4is7hECSiYBGrh+T9YF28T2O4r7/WKD8nwMJldSz0CYhkSwbCJ6Cl
	0gaZCJqnF1jX0y1nJWzNmIfmq3QWoUTKVM8m0X31ntUHFmGhhHRrJysmcozVjExG1J2LyO00MOI
	4V0DUGYJxRsR05BI9TBDIusELmc8BNE1NgbMq3/aDNy7wn+lfK4S612U6Efk7MM8u6K5sflkbGd
	52k18p8nqbaKYFKpBXerh1VH4Uw0DMwVOxCoqs/e66CGRUNsUIL6MJ1lEUpoEktXqkoacmrSWwm
	NPY94697MYBmVBUE3nADRjGKjvWIoQ6b6fUseP5xoLMbkmZQn/kCS3nDXu14nk+7CNHroPJ/E1R
	e6gtU6QdJhF0zxTTx0+pV51jYTkxyFzz3yTIIIxqGtPdEL9sN3G/dJLeewr4gZ39lWpTCbkUyLp
	m2iJzSj0/Fgit07jLUB4ndoUlMVHnGOcXg7ZzPiEcIZszXRqRhip1HLH74mqNkPyew3KY=
X-Received: by 2002:a05:6a00:4397:b0:837:e9cc:d474 with SMTP id d2e1a72fcca58-851f9bb6a9amr5925077b3a.2.1787288500264;
        Thu, 20 Aug 2026 22:01:40 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a19sm2319545b3a.43.2026.08.20.22.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:01:39 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 00/10] ntfs: add Windows system compression support
Date: Fri, 21 Aug 2026 14:00:49 +0900
Message-ID: <20260821-topic-wof-v2-v4-0-7a6fa10743b8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3852; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=2ZAhiVkIfnz4CoyGlRqSAtc/yzHfCBC/APqmjR/Ru4U=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqh9tFEYu2ODRio3oUZYF7RES86yUnOSyugbQMi
 ynzBPnf6T6JAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaofbRQAKCRA08jD6945I
 0y4QD/9pFvVTsgPYEwiAwnf8K6+CQaci4y1Tw+zuMs5Ysy7SHyup3Co/cBGiru10qU1IgysIsId
 FHqLEW6epct0i0Qb6zd1e9movDWeQB/eYbhSCSpAVY+6eeUcsCCuTwYhyNKWYyWnZ01LPOXP370
 cmMHejxRGBJI1vS2vyYohUJRNTdOBwBKhC79VFzovxnbFExlslRMFZYSBrf/K6m9R9OgqI5LXNo
 WGM/qxnZ7PrZlBHywcRH1WHl5+/Ofsq5k87PpzplkeaBQlyuO4g52SL4pYD7/XDJWav/p24/Kql
 9jYaZ1ucbpctznKkBy3nYvRkUt7i8UWYgXDt/xXsCAC1L3RIKJAfi/33NeIAUVolhdalIcVK4CD
 2rcjEfqR4aV44a73KGQFkpHG7bOunlPFddEZw3hrhTpVwVyZ/feCmCcUZRLUFTjZ2W6N0RuayN1
 GzmbiWX9Ffj3lD0a+nGsvfuUG+DMYZ2gaO0Hldx0BUw2YjAveP2n3yyeP1k0DpthKKzLEhaNmFs
 Yh+c8LlDOYxstJwPODeVb5fOINbqy+BhZrWwmXUqAxbNq9KRgAP38LH3KSFc4UrIkO/adGvvvh3
 wjKWh57quVwus4NcL9DfRAsoSk7JWEd+V+2rg85A9fENoSYQ1E0Q4Ty9ADWpiQwu4cHvLdcGXya i4pw2oT99SJwuJQ==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

This series adds Windows system compression support to the NTFS driver.

Windows system compression more aggressively compresses system files,
such as binaries and DLLs, using XPRESS or LZX.  It is intended for
files that are rarely modified.

The series adds a CONFIG_NTFS_FS_WOF_COMPRESSION option, parses WOF
reparse points, and adds XPRESS and LZX codec support. It handles both
resident and non-resident WOF metadata and compressed data.

The first two patches introduce the generic compression codec interface
and bind the existing LZNT1 implementation.  The remaining patches add
the configuration option, WOF parsing, decompression libraries, codec
operations, and WOF decompression support.

Changes in v4:
  * Patch 6: add the inode initialization error propagation patch. Return
    all errors through ntfs_iget(), not only -ENOMEM, so malformed
    WOF/reparse data cannot expose a partially initialized inode.
  * Patches 9: fix the first WOF chunk's end offset to avoid an
    off-by-one lookup.
Changes in v3:
  * Patch 4: Added to make ntfs_attr_readall() return errors, including
    -ENOMEM, so transient read failures are not reported as filesystem
    corruption.
  * Patch 8: derive WOF chunk table entry width from the base file size
    and fold this fix into the non-resident WOF decompression patch.
Changes in v2:
  * Patch 3: fix the missing space in the WOF Kconfig help text.
  * Patch 4: validate WOF reparse data and retain WOF state without a
    decoder, returning -EOPNOTSUPP for unsupported providers or formats.
  * Patch 7: reject WOF direct I/O and data-changing paths, report WOF
    files as compressed without DIO alignment, serialize runlist access,
    and avoid sibling-page lock cycles with private-buffer/direct-folio
    fallback.
  * Patch 8: derive offset width from the base file size, handle
    one-chunk streams, validate chunk sizes while parsing, and use the
    base inode's MFT-record lock for resident metadata lookups.

---
Hyunchul Lee (10):
      ntfs: introduce transparent compression codec interface
      ntfs: define LZNT1 codec ops under transparent codec interface
      ntfs: add WOF compression config option
      ntfs: return errors from ntfs_attr_readall
      ntfs: parse REPARSE_TAG_WOF
      ntfs: return errors from inode initialization
      ntfs: port lzx/xpress decompressors from ntfs-3g-system-compression
      ntfs: implement codec ops for LZX and XPRESS
      ntfs: add non-resident WOF decompression
      ntfs: support resident WOF decompression

 fs/ntfs/Kconfig                 |  11 +
 fs/ntfs/Makefile                |   3 +
 fs/ntfs/aops.c                  |  19 +-
 fs/ntfs/attrib.c                |  10 +-
 fs/ntfs/bdev-io.c               |   4 +-
 fs/ntfs/compress.c              |  12 +-
 fs/ntfs/ea.c                    |  66 +++-
 fs/ntfs/file.c                  |  47 ++-
 fs/ntfs/index.c                 |   4 +-
 fs/ntfs/inode.c                 |  23 +-
 fs/ntfs/inode.h                 |   2 +
 fs/ntfs/lib/decompress_common.c | 200 +++++++++++
 fs/ntfs/lib/decompress_common.h | 444 ++++++++++++++++++++++++
 fs/ntfs/lib/lib.h               |  29 ++
 fs/ntfs/lib/lzx_decompress.c    | 631 ++++++++++++++++++++++++++++++++++
 fs/ntfs/lib/xpress_decompress.c | 154 +++++++++
 fs/ntfs/ntfs.h                  |   4 +
 fs/ntfs/ntfs_codec.h            |  54 +++
 fs/ntfs/reparse.c               | 196 +++++++----
 fs/ntfs/reparse.h               |   2 +-
 fs/ntfs/super.c                 |   3 +
 fs/ntfs/wof.c                   | 726 ++++++++++++++++++++++++++++++++++++++++
 22 files changed, 2545 insertions(+), 99 deletions(-)
---
base-commit: df7dce2090342170b7643d36f694204cae7792a9
change-id: 20260818-topic-wof-v2-53051d7f0848

Best regards,
-- 
Thanks,
Hyunchul

