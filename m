Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34B1396597
	for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 07:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787125425; cv=none; b=Z8Yh9BSa1N/FbSqaSVqVOqRaMFvc4yct9iRAoYihdh83e2WPCXYSqbq497p5RyvZUaeFdFc/hECzrXBi6FVIXatGMAmTec4KvnYBkCXDjjhNIIy4hRvrv6S4VVZsEDjW6Eg+1fXczv4xQH18/1YawEZ0DStTcK7hEGnCtuv7KIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787125425; c=relaxed/simple;
	bh=KsqHXShzanekTNrv54HWsmJjZ5Dxkwg4i/rANtLARRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bReRMdqQUEHTbFG5u3k3eQQnbtg12NW3puqFY93bR5RpXT+r2DoDyfgtAVUE2HXt536H1KRdCXnImD3ATb/72Dr76OlVAYH1304szp0vgXsWytzOeQT65tcqbxoNrX8D9KVlIFsbG27mzxnUzCeEeeQXkYsvrtk2jvRQgR3Abm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2e1WM6X; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2e1WM6X"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso599641b3a.1
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 00:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787125422; x=1787730222; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m4M3QXMzw/mkeFvG3mYSU9UxItQEn1ASfvi5qox4yZE=;
        b=Z2e1WM6XqxKTTahwMxTJ+N2uyX6t+ThEgUxgvwetKSpG8gDkupOnLR4f7X0narJ42B
         piwXpCs/Kcwio2ui+Lnbhxtdysr4ZZyNLwZrPi4vrQcROiorktJUgkfZb9bbIdrumgy3
         V/weQS2x8u8+TqwoUm+fulv9vEpXwzG0JyPwEqe0jI6MTsDsrPAGNFatitacB0LnfMRm
         0x33G5WR8+15cQSlsh3tBuaiZmx4H7eocQtlmp/WZZI+MXptGl8y9H18boUCcRzf5jiZ
         zvFLCbCDRq+ux4r43Srz2IfN9V6meP45EGbcZiCVlD3BBB1KGlJTCMvEtK5EKKk4IMTi
         IPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787125422; x=1787730222;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m4M3QXMzw/mkeFvG3mYSU9UxItQEn1ASfvi5qox4yZE=;
        b=NceskD9rJSmQb6vcKr1bSxjPWIXj171PparHz+afYUiGzYZzGFGM8qEWCrfapIfr6f
         dB2K9+CNeGjg7NmnZEJWLoup+NgKrzRJZizlUlRJcKZJCKkts7/QYnsYdUUi3LTGon0L
         kbCkzhW6+FTBBQvJu6kSkOB82akAUXDCIRqPAxTu7I/zXtldKP3knG5wF7v1L1Jqobmj
         /d0KPvyGtQ4mQNNeBuD79mUKNbdAItK1lgwKloHeOIc8Z3Hqm37Zg5FGA1TSEyVfQufs
         0aY705Y8VNvHBSxjOJuh6KR78pVZ3ku8y7Sb6/hslVHCg1FRiwQTHA4yo9uj7msLdbKK
         dsAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqcPFUqHaRo60Wbn5NZ//L0LxpMRQ4HPEZqhUK3s21M5jPavkQddw2JQRFbcYNTF5glmiW@lists.linux.dev
X-Gm-Message-State: AOJu0YykShVOvfgNaFC/X01lzYJMZHxGrZ48Q1wG+lLsa1emAgyWdhv6
	kPOUUs5BG81kkhH8u32dXiacqqZv4V50wqruPlQKKschncoY/8SdJiyM
X-Gm-Gg: AR+sD12IbRYFx5Di99TAuF6ZlkXs1SqQ/kU2TaewgdUtPpjEZUEGjAK/q4Ng16mQlO7
	/G9yC6lKYoAmqi1mRpK2XT5XyMqaWe8Fbje7xgwE1UGtIRxAl+Y8zwOoUfP3FOxbd4izj8o140b
	0v5XyRlPWfFZNMBv05lRhx15n8rrR4p6VIv66it4fC+62N/QpnU5ZUqFU8cU6DVGS9w4LTjrG+o
	hvYEl9a47f6TH3AWQD4xcYiqSIYdoOmpXcdLLG3Qvix8AeS+BKisufV1Lf2wVh3lgMMKe2wG52v
	EBP1C2fXXE/BTTnuvuA7HXjnUnREQ2fN23uy+t6M7IQT5DsKV5N8OVOygmIWIv4b/4lRx7+a4DX
	K6yoHS4kZAQQSNgtKCx59ijiqIEKomaH+XAPv4ss8N0GjckTYq+vCjE+brRa6culzrnYvmV9Oms
	DOsga586EQjefDcJLRvoTvDdUuaGDZefWlXGIh0lnJxUXDpCqG5RuTOD3BZ212B6WXHx4=
X-Received: by 2002:a05:6a00:2354:b0:847:852f:c28a with SMTP id d2e1a72fcca58-851d1931170mr3139856b3a.5.1787125421925;
        Wed, 19 Aug 2026 00:43:41 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a19sm314623b3a.43.2026.08.19.00.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 00:43:41 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2 0/8] ntfs: add Windows system compression support
Date: Wed, 19 Aug 2026 16:43:18 +0900
Message-ID: <20260819-topic-wof-v2-v2-0-40f56903e7e7@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3064; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=KsqHXShzanekTNrv54HWsmJjZ5Dxkwg4i/rANtLARRk=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhV5rRVuFw9E3VjbIkTU0aY7JLSLQ+TcxTpQqa
 4f6WlAlhESJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoVeawAKCRA08jD6945I
 0xl5EACSZns2qz3Ac6WWChWas7PkRFdnqUBm2/MyhoEn4Cgs5b3AUtyuAEOGuneOOuxOq+4mDB3
 R8QoN4KtsYPNP0oul3vmkCWAje+aMHsefQhKZXWMw+xZ0s+nM5bmGuGmBbXi76crrvcVwwpss9U
 diDmU4bvf3GMCJbntt9xllC1cx32WNC3uF/e+FVb0MKA9Rh0x7b33x0dq2wnHp215ZGK6j7ILTf
 QXMjZUX3qjjD2TdzwPL1tmy0ZOpW8p1u/Vb45iKPFL3ic25rI+9P2Z/PPkWixdQui2ZTv4TCX3H
 fLlIICoBTezpqAkLUJbkcJEHkOCd2Om8kCDE2eA+V00wRpI3c44BPiLnmcBGiBdjMn22s8jqM+W
 X/KgdJpBjl7IPt98yXvypGXBubTkzPMmcO+KeJKdEjEbhBruNJQb5Mp6+kiPuG4tsxa/Pz5AnxO
 R8muF+cCfm207lgblueWpWi1bqFqOnnL7flL9cdRjrh3kpImGQkL2sLAUezr7g5nJJXNW/SjI6n
 24MMZdIbZSu8gjJfZ2kMPmE5kCmjcZQmLlbsgwnoGcAA5Wzj5AS92eUcVi/Sg/R3fnnuMd7YRjg
 eoGQMqeWBW/ip9N6Ye/ZvXzNU9U/bAEOnjgxXPRNgrr8vuc8sS/z5gRu1HDZAyAB4JxZ/8pffUS JP0lLJIkneLEOwA==
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
Hyunchul Lee (8):
      ntfs: introduce transparent compression codec interface
      ntfs: define LZNT1 codec ops under transparent codec interface
      ntfs: add WOF compression config option
      ntfs: parse REPARSE_TAG_WOF
      ntfs: port lzx/xpress decompressors from ntfs-3g-system-compression
      ntfs: implement codec ops for LZX and XPRESS
      ntfs: add non-resident WOF decompression
      ntfs: support resident WOF decompression

 fs/ntfs/Kconfig                 |  11 +
 fs/ntfs/Makefile                |   3 +
 fs/ntfs/aops.c                  |  19 +-
 fs/ntfs/attrib.c                |   2 +-
 fs/ntfs/bdev-io.c               |   4 +-
 fs/ntfs/compress.c              |  12 +-
 fs/ntfs/ea.c                    |  28 +-
 fs/ntfs/file.c                  |  47 ++-
 fs/ntfs/inode.c                 |  16 +-
 fs/ntfs/inode.h                 |   2 +
 fs/ntfs/lib/decompress_common.c | 200 +++++++++++
 fs/ntfs/lib/decompress_common.h | 444 +++++++++++++++++++++++++
 fs/ntfs/lib/lib.h               |  29 ++
 fs/ntfs/lib/lzx_decompress.c    | 631 +++++++++++++++++++++++++++++++++++
 fs/ntfs/lib/xpress_decompress.c | 154 +++++++++
 fs/ntfs/ntfs.h                  |   4 +
 fs/ntfs/ntfs_codec.h            |  54 +++
 fs/ntfs/reparse.c               |  94 +++++-
 fs/ntfs/reparse.h               |   2 +-
 fs/ntfs/super.c                 |   3 +
 fs/ntfs/wof.c                   | 720 ++++++++++++++++++++++++++++++++++++++++
 21 files changed, 2442 insertions(+), 37 deletions(-)
---
base-commit: df7dce2090342170b7643d36f694204cae7792a9
change-id: 20260818-topic-wof-v2-53051d7f0848

Best regards,
-- 
Thanks,
Hyunchul

