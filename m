Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4990DF6C
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 01:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520627; cv=none; b=KVteJyoGlSrsyeVdO+9WMNrFCXVOu8lOTQdAsa0oNmfvBQyShK9G8h0NCDMIUv8M+qpLiMY/SW/XK4e2bO76cORGNOIt9FKsIqbgPI7Apqm3y1aoRgcUesoj4+4vx1NUK8BjMWxGjGU+b+o4skUR4FmbWXAq0aSEGi1gm0Nz/mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520627; c=relaxed/simple;
	bh=m8LXxOTUGNDUCAapGAxZQM4Lkibs1orQXGcVg3PlrnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a5p9RhODIPjf3vJNEza7EcDZg6YScwM+hkAPDj6rpMJpBORkemQ7PiWxQTK/VeG9rg5qbSMXTk6c/zNfi4QwD3Hs+Nc7g4mGDEFmzJCr6i9SmpWz72dBE1baqqju3Nvj4rtgFNCA0/gV26Y4ge+SFG5SYE9Xjp+NYgpRntDJWqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4oma7H0; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4oma7H0"
Received: by mail-pj2-f39.google.com with SMTP id d9443c01a7336-2d8fe517774so4746835ad.0
        for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 18:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520625; x=1790125425; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXM1Z8nQs9w17igWKuJQsvjtYQCxLZygm2ls1+FEdaY=;
        b=A4oma7H083aHcQwXrj5S9JTX9ttII43oCCWVoP3BalC3hg5pcjKMuUZiIh+AqZG/+w
         dqaUeNK1lpgKfvx485FgT1YPasiiyFXd/FYUhSbzRtIu6BXvc2Kc0geGB6o4gfDVvP42
         TONTUDCH5Jq2VwIn+eG52kSnBHEu5meF5QYvulG7XwOqZrDYPuMtOjPAyyCnUoI/xJtU
         Es8xeUXEOWR3CxuI8nWNrRCZdo19BS5/rLEjcmTqa6SWma33vnRhxtVX4OW0ANborjx1
         5YRVfdqs+F0zvUIyYodEjXwZeWNzpjqvNBzafy4MkyTY7r2bGLqEMN2hsRiASUjieJXk
         A5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520625; x=1790125425;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXM1Z8nQs9w17igWKuJQsvjtYQCxLZygm2ls1+FEdaY=;
        b=lLzt7dspy7aJ+Sp6gTxLfW76BeUkXA2AiYcI5ipjoMOdNalIOdwulLYe+d94gsRC65
         ZD2mDuA2OuE/Y0IPY8NBxc4DLuEequrID9n73O9GiVeTIw0KaqjOyRNI+5a7eJLmaPhr
         xKLJDJ5AZaBLyQujaBzs+kvkNFKiBifjrI/aSEYNq81QNKqbz3y3XsptZJVB9c1qk0YF
         zVg1rW8WRVr42oWmqSllaPB5DH6pKYeNIO634uW66Y2sxBT1IvhvN2WnAV+AKCdrPEcc
         RX6Gs7HBHljLI/CpT1tF5q5ri9TaWXwWwN/1DF/ZiCKcc4+BDRVczZsIhwh7hfswUk4S
         oNSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPXZLc31pwSVu2QcVQ0wyBwY2/E6U+hvGHzSulHL+ugPZg5j3vtcT8vjZyI0yQ1Fng1RTp@lists.linux.dev
X-Gm-Message-State: AFuF++lu1FEXDt+mOTvRS5AQFtPys13MGeOInfnIM+Fv+m0smF5cHC76
	LhwkPg22saWtMoImlPtYLJnvT+KkoljNhnrFXz2ug37tFtgn4EXnW74N
X-Gm-Gg: AYBFou1J0+5Z9OvMD7s/iPmR9SioFQ7W7ssA3TCCvxDwOTUuMlGUaZT8RjCiwnqsZm/
	hb/QwMT4VEtDIuKZQsjLMeTYjUaCmOv3oE8Rbz9jKWnYm/j4FU7gVV6ctvmHRAqqYEbfaQSPNpY
	XrzK/JLOHJLoRSqV0wxzMQgcC0uIf50Ryf4ICHGueyopNAOgjWjeQdymX4RVuKxlCGskfK+UFSY
	QiQtHctLaHUbVvekVMGXM0OUHHGYlPJxtStdShhouCZS0WRqZ0lNo9foAwik+864L8eozAHb4BE
	4AQn9B2Ya6vv/HzrZ3l8KIFdj1eQTj6SadAIggEeWInjxFsHHp6MJ8fXKp4lO7PQ0qb+hSyF8an
	Oyq/5PHVWhtS9QPdFe3nBcmaZ/7G78AjODwp/2RrFYT5wBELmqXEe7U9fTpSLvBs5xJroe1+nQ0
	LLnTfTkvE95TwIk15UE4yGp96fiPn0uPm7sy/z12qIBNG/RGrsnxb5kjBUWmEvmqKwuvJcy0nSW
	Qrp0g==
X-Received: by 2002:a17:902:ef02:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2dd8dc009eamr13458595ad.2.1789520625113;
        Tue, 15 Sep 2026 18:03:45 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fff3sm2880995ad.8.2026.09.15.18.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:03:43 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 00/10] ntfs: support 4K-native devices with smaller MFT records
Date: Wed, 16 Sep 2026 10:03:12 +0900
Message-ID: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2115; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=m8LXxOTUGNDUCAapGAxZQM4Lkibs1orQXGcVg3PlrnQ=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqqeqy+KUVcWIKxz1LwTPRMnO19d17abJ27y4KU
 /Xz0ShWG56JAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqnqsgAKCRA08jD6945I
 06CuD/wKrm/m1MsmWUmod3CN16DhCogNqhlELoQSQy2nL9boOkXY6vjEdGU9EvzbUphKut8spko
 JbB+AFfGtbLHaITjgZbtlkN9YTO5m6JerFtLZABJBGveHCv9D/p22tjGg0aOv7KuFlbLFGrS7wK
 lDGLKN7IiTPkX70Qz2fA4eNsnwuXMfNcdh0kiAG+LVKcUg67lZJUH9ReFMe/kGy1Tu61BNlYUgA
 K0Qrezy/snBilcijz0Ci0GUPR5swNU6wiCJmfKxkatCC+oafZBpJN39PhLDRqI14icTmq5c5dYU
 QN1CU07ODtaV8WohV4n4ee3+AWvrnwDhjpZXJP7QXIxcLAXwlFnKjQSD36e1Wqk3NbTRfYPZidg
 e2fsZobe8ZAKzxasLF6joOv8UYwNsenQAH6VPaHYoxvDMGJ/kIuhSF3k5x55TXyOydXDcEtxJ1Z
 mGI50nTOY5reC1driI+wTHPN/pxJXmiQ5ZeVRmLqvMzSVbwzLN7zK3BIhQibafypJtagwxhAmny
 FVWq6MVdDJSIJQU+i1Su0CS6FDFDKI5al9s9OzMIoG8bO978PTcAceBKS+yS8fZGW+c/P0tsqSn
 CTRyOQZooKhQH4Ah9qvcNpwVFKpGf3xc05BgsbZtK3WseXtVeJXsPA5h/DapJf47y/I3i90oYzs //7qwuOGdCB1QOw==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Make MFT writeback safe on native 4Kn devices when MFT records are
smaller than the device I/O unit.

Validate MFT I/O geometry, map and submit containing I/O units, and
coordinate direct writes with generic folio writeback. When a write
covers multiple MFT records, preserve the unchanged contents of
neighboring records in the containing I/O unit. Keep the completion
behavior requested by each direct-write caller, while requiring
synchronous completion before releasing an MFT bitmap entry.

---
Changes in v4:
  * Patch 6: fix for the 32-bit ARM __aeabi_uldivmod link failure

Changes in v2:
  * Fix compilation error in Patch 3.
  * Keep valid but unsupported MFT geometries read-only and reject
    read-write remounts.
  * Document the sync-dependent -ENOMEM return from write_mft_record().
  * Add Patch 9, which trigger page_mkwrite after native 4Kn partial-EOF
    size extensions.
  * Add Patch 10, which wait for attribute folio writeback before copying
    a new non-resident attribute.

To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev

---
Hyunchul Lee (10):
      ntfs: read MFT writeback bounds under size_lock
      ntfs: validate the MFT I/O geometry
      ntfs: write MFT mirror data in mapped I/O units
      ntfs: serialize raw MFT updates against folio writeback
      ntfs: track direct MFT writes until BIO completion
      ntfs: write MFT folios through mapped I/O units
      ntfs: write MFT records through containing I/O units
      ntfs: use sync flag for direct MFT writes
      ntfs: trigger page_mkwrite for native 4Kn size extension
      ntfs: wait for attribute folio writeback before update

 fs/ntfs/file.c   |  33 ++-
 fs/ntfs/inode.c  |   2 +
 fs/ntfs/mft.c    | 889 ++++++++++++++++++++++++++++++++++++-------------------
 fs/ntfs/mft.h    |  19 +-
 fs/ntfs/super.c  |  86 +++++-
 fs/ntfs/volume.h |   8 +
 6 files changed, 717 insertions(+), 320 deletions(-)
---
base-commit: 8809c3f29555f9d1e66fe015080a8d4979d91eaa
change-id: 20260913-topic-4kn-lkml-8ccfb4922915

Best regards,
-- 
Thanks,
Hyunchul

