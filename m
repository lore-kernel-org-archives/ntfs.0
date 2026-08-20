Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430C23803E1
	for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 05:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787204970; cv=none; b=LHLV7o1xxSM/1nbGZrw9QmGEOYp9AUVjF2EWIY2S95BDSZTuA4m2Vg3LuN3Gni+prfy5FA+Q1Le6nGzn1xYTJJ2RoOgYl4HhbyxbIzbVkhWtzDU40WW2gp+Z7M/pkJ92S1U+FrCBGQNFWYcQB7FLojQIL7ZdHFYSyrk0Uwh5s/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787204970; c=relaxed/simple;
	bh=AWIjpXenoWEGbURCpGUQynL0RGWRQzpaHEbPQW9D55g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BdfEUodDi5BjTGJ0wbDZ5AUkslKAN7fto2/2kJ0Vp5a6eqeygE8DKi8EgMl49lvp8hshy0H9H2lpCE9Q1IVCUoWz69bCfr4xg0Vqjj902Gz+2m22t12NktqERXxYkxLjyw3p5zLvPLD8qO9BWLcK49lj2F+wH+8G0MewA4pxXrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lek61Wu2; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lek61Wu2"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso2230034a91.2
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 22:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787204968; x=1787809768; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KcDEcUDTZLe8nKRV9dhZbAluW0n3jXcOuvSMhA1v/j8=;
        b=Lek61Wu2BEyNq6qci/pLBlwmGjWP2DKDIR87vmL5EFkTIDbjaRfOhmvZL0QUhwdkzP
         szxC+cM6Kc9dpZ+lRmAJ9OE7OqMrPenhZFc3qXIFbqexhL05JdtoS6Om435vK1cOaaUe
         V+y0FvDZOaPsEZArvUnUpQ0zsX4UiCi2Nz1itifnYB+bjMIePihxS7tjcA7c3Dux9W4a
         tux8xCiDYCdClrQ+reqbW/u0xRTfclkHVdsNzR2SkgcUYD1x/IX8eEhuyuV0eYgIxkL1
         DkPXJJbRnSJfCFZwsZViIkNsEZ9JMl3QKI9i35RXTAlRxC+tqyzVqnyEqEfqqqLfHRa1
         p9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204968; x=1787809768;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KcDEcUDTZLe8nKRV9dhZbAluW0n3jXcOuvSMhA1v/j8=;
        b=c6oNOCEBe67rd+DjYH7IQdCsxVdIxxYV/ucKvpUfrFQfH4rsdnTNBLaKyNZ7cLeh2S
         9Lcm6KMTkwCFCSNay2z6AKRbbRAba/R0StE3tb0ItN1ZMIxZ70TbG2s7/eHlZc7uW8Hx
         Qz9aFAwwO3Jmd0SsI1ppO3Z1SlZFBB45OHNVy9iRV6OTL2T9IyinZf/9zS6Vs1I/6tq4
         /QFFNRIocSg3bv3JrrklV4e6W5iq/AGAPWCugHIL/AW6WC13yTfw2GTlTgmczR7xVTvj
         knvcQUDi3wGrSnCEb/ERZr0rcb+TL4Xc+b6rQE3+PwfGVh+t9znvhVb/cGgm8nwdgxPH
         vKjg==
X-Forwarded-Encrypted: i=1; AHgh+RpE2iF/h8stpbjWPlDHqAFAdem0fsPKg+rCuyFFO7HX3AetKkkStmf7yGCfhmCS+4AZo/Mj@lists.linux.dev
X-Gm-Message-State: AFuF++nhclGoJ6k+UUzITLmifBOGsVdKBRUIFehmAzu4refqd/43rHf7
	FC7P03CDLUg8dYog5WPFVmsimiue10KtiChyfl8HX4jBifKlbH8QyCbT
X-Gm-Gg: AR+sD13ES44NszgURXGPnRNMU//rjYfqgb/LpoaBiTy/nH9jr8K2qUhDD/uBZcp3sqd
	NZTrv9WXfj6kDBBwa8w0NZyXnpz7vP2DVDFVi/LaZ6y1JmFHz/9FmsFzrW5bOSFU2VgoFJs5v9N
	tRvldQ81Wxi+Rxp75DfhN+gToYJfEqh24F5heFoSJ1wjcNZ1nVK3kjjpLXYVN5BLWzJBMf1IDdb
	Byak6D2yv3AZYHR4iMvIansgTkSzbbnFNsl62674d7CbeqoM2050GvgUxX/uO2ujBsx5NdApk5m
	oewnvnmtT+AoK9zVQuc74xLU2q0tBNyuRW9OfctYUEsv5N2LEZVJTgTo+nyb1FmMSnQYBTZpSz1
	kzwSkryDtN/9BARtNp5iE+/tn6k0aAAZmTnvjgajVI2WV20CNiWHiQXW6ilkkbIYGN+IAXGgA13
	C65favHDDNR4F13pKemEe1K9MFrPe1NltebVen6y2gdtOBVqIR842A648+3mLxDm5DLI0=
X-Received: by 2002:a17:90b:280a:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-39580a81304mr19468057a91.2.1787204968341;
        Wed, 19 Aug 2026 22:49:28 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395b66bccf5sm106766a91.2.2026.08.19.22.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:49:27 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 0/9] ntfs: add Windows system compression support
Date: Thu, 20 Aug 2026 14:48:13 +0900
Message-ID: <20260820-topic-wof-v2-v3-0-ef6149b4541e@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3480; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=AWIjpXenoWEGbURCpGUQynL0RGWRQzpaHEbPQW9D55g=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhpULkqD95xnp4jDAtyCsYe5tEyfQLOqthkbSF
 ubuqKEqZBSJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoaVCwAKCRA08jD6945I
 05kvD/0b8BoFeNXtJJWIcca1TYlB0STxA4i8PoeanEE496YGIfB1ikEphi17J/gyhl7L3IiGo/0
 AWbkyD5qCud0q2vWG9MM8bgTNU7aGYNOdrySdki/HUCj8h3kIfe36KkPLSiikGCS8Gd+bjfJNNo
 mLEWFGOhBUjv308l7SxydBAzj5ZZNLQLafizFe+aaT7MWSTLrZsmnTTgdOwnCZLtzwb1Wp0GbnY
 fIVixje3RPmJkbJqQByNvr9cjL7HxwNsq6HIheWRlN0Uhmiqrq/fRwRa+MjNoKa2YRp3u/ludYZ
 Ir6GCRdLJMXytgfThUQoQhIdC4IAp1XHVv5mNZVFh23/4YYM4eXczJHNbKP+hcJtYxZrY2HlrjC
 0zUDIIKXkAd/ifQqphAyTvw6K7jBJF16M5CqO8WFzm1M2QbYqI4LxyjrkGwepnvqsAiK9sDFJPM
 cZHFK9UFhQN0aUrvpHKOYN6qlMvlcgQfQbavusRtd35TSKW4COFkPUjec8PbojcRJLzyJJ5MZco
 n6uRCpGJjjDZg44nk1dG3cVjQ/IvzB+ALKqq+sqH1R1Tl1wcixOkCoQByVrP0EBnrbFX7cplnuZ
 cjR2Gw8Meo9JQyRiK/3Ke1okw/cYzBYRaVJIbP1EgiuE0p0GTpVbolyrP4gRCYh0FCY6BE87spo rLV1uVbtm5D0APg==
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
Hyunchul Lee (9):
      ntfs: introduce transparent compression codec interface
      ntfs: define LZNT1 codec ops under transparent codec interface
      ntfs: add WOF compression config option
      ntfs: return errors from ntfs_attr_readall
      ntfs: parse REPARSE_TAG_WOF
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
 fs/ntfs/inode.c                 |  16 +-
 fs/ntfs/inode.h                 |   2 +
 fs/ntfs/lib/decompress_common.c | 200 +++++++++++
 fs/ntfs/lib/decompress_common.h | 444 +++++++++++++++++++++++++
 fs/ntfs/lib/lib.h               |  29 ++
 fs/ntfs/lib/lzx_decompress.c    | 631 +++++++++++++++++++++++++++++++++++
 fs/ntfs/lib/xpress_decompress.c | 154 +++++++++
 fs/ntfs/ntfs.h                  |   4 +
 fs/ntfs/ntfs_codec.h            |  54 +++
 fs/ntfs/reparse.c               |  98 +++++-
 fs/ntfs/reparse.h               |   2 +-
 fs/ntfs/super.c                 |   3 +
 fs/ntfs/wof.c                   | 720 ++++++++++++++++++++++++++++++++++++++++
 22 files changed, 2486 insertions(+), 47 deletions(-)
---
base-commit: df7dce2090342170b7643d36f694204cae7792a9
change-id: 20260818-topic-wof-v2-53051d7f0848

Best regards,
-- 
Thanks,
Hyunchul

