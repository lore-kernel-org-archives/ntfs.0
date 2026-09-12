Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E28345EA2
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230111; cv=none; b=Q6vMpuwteFSzkdxMb97VrIvkVbsc+Dv9trOnactGmMSk7TR/WSV9iPMnW9gZGqvMe5NGtkiM5y7K5anzU+kqVx/nugowxEl/QenmmKZm0cabpxyEEHDWbVJGXIApbRqFrdBH6Yn1nHCPClph5B46LC/HHlOIkI3niQY3I66bvAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230111; c=relaxed/simple;
	bh=tD2QyIT8MrAKFAnm6Wqgb1tDtErdCXo4i9SX1m2DoWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YHai6m7ppNBssrk9nno7ozD083Y4upKJH4Y6EKZ/HU05uJbenFGHQXrbiUcvwUYnA983GLbRJZVNdKd/sGLO7PgEtT3ad5KeJBNqDoHcynfCcKILH2h698a1JvMCrnJ79mrV9rXGg3uQxgfC70+qSOFaZ75hLtiN88dU/Nzp7Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7oQl/PC; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7oQl/PC"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso426841a91.1
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230109; x=1789834909; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VFgTR59d6zVGt+Zn7lWGwconcka2wNuMAqYuaibpJfo=;
        b=b7oQl/PC+stCxD0D08Yzfi3vaBLHDAI2R13wRO0bjz6m9ZgRuvJCGAAtWwbZAaLw6A
         Fy1BxH7XJPjd3E3kp3+gqOJTfHA62IcOv0NtcA5rEzuh83456zPcxWWehnEvV1Lflpx7
         +RxqS1xY2P9cNqCwDU5GwXCkgbpg+yuzPioMyGBhQzhQ9vGDEJZIGhbdNj8jCnNerfon
         pRDMbge8XFxXqJ3jU/pUPA2U0pgGZdGHuDu/qgljBz5tGkqI0Pp4ouOCY61CzOaJaZ5o
         zR5vm52Fj8+TR3lGwYldCFnb0DVP7T7JmKn5kmbFL0XO/wCKF4Tc7xANKXbJ2/WvX/Ac
         Npcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230109; x=1789834909;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VFgTR59d6zVGt+Zn7lWGwconcka2wNuMAqYuaibpJfo=;
        b=J7JCeYggxMfOSXF4z1rlmyfxtH087l/Un2SsupZwwlDNoS1AGcx+0iW39PTLBZX4Ix
         TiCySnnm9MlyAt1OZtsxT3s/OZWJOuM76APc8FCgaj/TRu3Q3WQbVsn9cN/nBwQA13La
         rmjronmXGiLWF/qLGPf21cdrLtyAMvlUXUtpKj5Q+HNYPeIM2gMjdSxeOTnBCSNsSps0
         xwiGakPUvepIOyWUns74WddM+7cKY59FlfqCeZFnvVIrwQTCwGbHlLZ2KrznwPqVtzfv
         9DxmxSV/R7ID2/pQWHq96slfSeK6vQia/hhl06hpZ3tDxBQn8mVVcITOygdOQMPSby3v
         Ofpw==
X-Forwarded-Encrypted: i=1; AKwUvBw09YRScHnFmAjn9hU0ML+J7qbpmh4/Zow5Z3UMFDcPYnJeW90srLHhr9D8SUyIoWCI5qAb@lists.linux.dev
X-Gm-Message-State: AFuF++kBPDm2EORdGeQSnRl9FOVgMg2GhifwTYPAHc8wJ5I4Up+zfOf9
	+OFJdDmOMvhRyvlKR18xEZvo6xgbrWCuUQrqnY24uQYl0wOlOESsmtYa4hw3xA==
X-Gm-Gg: AYBFou0PcxwAw+sGUsLPKmMrpaKMA27z9TBvAWPAfaoSL4Fn+2xpE/sVxIzL0gy1Cq/
	Rl6Ih/054efZIKTVmJycq3OuiLt3yIfBs/2J8c5yuF26EVjkiupq0yU15f0Zb11cmXaNMjkqCfA
	oDPPp5dXagL+sVGLgW+snyCRc8xmFv4OYJwjjtOiiGmbo9QosqhvhElI6QjbPLagd9DzxDnuJ8Y
	2V84d9nwQh39Q4e5lMJPhpi5EfPgPMEwU3foYQMwGcVXLO6G/rla24FGI+M3pSfx214QrTMtbAO
	OR1XX/dnsQ7A34L0mJyFX0i66xSsxUwmV41eBw8IBy6GzF9sMaEyYH2le4crijrE193fNWnztvc
	NaLb9VW+xLJgTM56Rfs08c/vTeTSYHItGoN4ONaErsoNxCaUE1AAmER9pY1dWR/NhT1kGXGmpN/
	wxnqHHJ8akK7R3wm57JDwj7vj/8oU6lyrBgqujeL9A8CaQc0zpF10Nv2zzoSUhkLtmSlReeIyWE
	iGlfg1aT12vbE4Yw30zhkI=
X-Received: by 2002:a17:90b:3b4f:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-39dbbea461fmr6224924a91.4.1789230109098;
        Sat, 12 Sep 2026 09:21:49 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b21sm10804999a91.13.2026.09.12.09.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 09:21:48 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2 00/10] ntfs: support 4K-native devices with smaller MFT records
Date: Sun, 13 Sep 2026 01:21:12 +0900
Message-ID: <20260913-topic-4kn-lkml-v2-0-2bc455e81635@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789229949; l=2044; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=tD2QyIT8MrAKFAnm6Wqgb1tDtErdCXo4i9SX1m2DoWk=; b=jo79WTjuBGNMSwFjqBRmBI4uCY4F/FALVrjEqu903+OI6/ZoDpcjkV4BMe6B8jybNtkhVNGST nnpgULKcmKNAUSvU0S7Jw69Ls+LjH8HrTSE63/BUxSvGYB1F6ZSrLra
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
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

 fs/ntfs/file.c   |  33 +-
 fs/ntfs/inode.c  |   2 +
 fs/ntfs/mft.c    | 892 ++++++++++++++++++++++++++++++++++++-------------------
 fs/ntfs/mft.h    |  19 +-
 fs/ntfs/super.c  |  86 +++++-
 fs/ntfs/volume.h |   8 +
 6 files changed, 716 insertions(+), 324 deletions(-)
---
base-commit: 0fecc393f2060e6bc25138df32cb923ec7071c6b
change-id: 20260913-topic-4kn-lkml-8ccfb4922915

Best regards,
-- 
Hyunchul Lee <hyc.lee@gmail.com>

