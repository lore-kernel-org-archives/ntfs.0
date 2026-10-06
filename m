Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1903D34C140
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 04:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262380; cv=none; b=QsErdGD0Udh97vwjT4azryEz60CFMeLNhn9rcSLLVwhKdnK7dwurnaDxp9q5TkScpECWuu9lo9zEe7fowTnX62Px2gh8R+iH7VYnHziuTua4Tf0A8+8d0nIsno/dYAbT9nKWNNdLr5IxxOr5ioZaQjlWGRuX6OBeZUzghBWBoGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262380; c=relaxed/simple;
	bh=5BRAI2mjiiwdWYknuhUNvmuD+TSUC4TBhnYkEEFLqBI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EKOUfaZMGuorfRPVPczhZknUk1bbJURdFQVDRFMIDRO5AcvfV7xquAGI8oKI2bWGW0jvDr2iNhDRJQfrwAW7M7xQSxB2CqQ1RVieUWWL6Gt4uEgQnRQHiZibEKqb88uFRPY0qUUIv+K65gzK3dZD6sxRIi6ObZENlyrHfcT2/RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsRjlAEK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsRjlAEK"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so2996595e9.3
        for <ntfs@lists.linux.dev>; Mon, 05 Oct 2026 21:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791262377; x=1791867177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qa1bAuBiY4hv5m/kE0JClTqqzG/RYABtp9TEFFjsc0o=;
        b=ZsRjlAEKgWSlqTC07rz2P57Idp+iwZOy3yrEYKR8Q6Mi+Q+efuIjW3xAUbuWGANBY3
         s9/4vLPz6Lt3oUOvoZzAWQ9/d2A9Govt3Jd2ilWYX0XPlL/3zh0Ui8O8Qp7yIWBi6qyn
         OAA9gCyqhbmgy8kfryHe60Y3JhMTYBXXsGwkTzNhsVgd8E18UVbaCMoKvYgZ5QVcPqAo
         ozEGx+DOiGf/3ZGiH0hCzAGF3tm+au9BrmepL5uUIXv5/HkJgqfrJBg/mrGxh+ekebQr
         1H8639IELWt0QCDmo7fO1cKWLTRocfjFgSi/XIrRvX68b73GOWsNtKAAEu0hUr53jYof
         2tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791262377; x=1791867177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qa1bAuBiY4hv5m/kE0JClTqqzG/RYABtp9TEFFjsc0o=;
        b=w3klLuSHxuvRBgdeR5y3uEUra6Bw9g4nclNvFy3NrquTrp1/0Gi3Wxsn8QdD+jLpI9
         JxM7DKWTskn4nvnJ/ADHDq/oZcxF4B/lNZqx9QV8UYNF5lO9oTQIk5KBzmZgs7NtiHiN
         bp6C7aJ2sJgAJANf/nECsJhhYa9X+4iWtS+mb7/4+JRbpHJfNn2GK8i1qBsbNoWlfqTe
         6p0kZ9TvlboQApPSR0QWe20IbrZaQGV77Sr9Tdk6PKcaXfG+XgWZtmAtmF4m04OdMqSZ
         cJTybZF5/FA52gYxBGMHhSTq0CI8dhWKikfnFB/eA5n/SyEKYeJUXbxEIcDEC7068c0W
         yXKg==
X-Forwarded-Encrypted: i=1; AKwUvBxxgllMcZ77qyEjOVP8CQ+TP02Gj9QsGA6sxpc8DQByU77yDG+2ACtWkjG+oG3eNjx4yYsO@lists.linux.dev
X-Gm-Message-State: AFuF++mmewBWr+I+h5rx+jfZvAazQG5tl69qHsvaMObYrO1d/2yHxXuk
	Xy4IBF/ehkQFyKkGPhb2VowjmrgstTSECSdpU/NY+vogaxb5h3Sv9sZ1
X-Gm-Gg: AYBFou1Bik2wYBN7qJ+hhIVKz7hbPAcBNaEuea8J5KsvoRN40vqo5yXX3u0PCRLxzsg
	eOHKOwUsoEMYZ9MEuOd8wQaFCTyd48L0V9hmzh32LDsTFPM3dmXYmzF3fSIbuv6mTZHyf9TtNba
	PaaWnPGeqpdlbb9MuKGnChdj8x25RVPThlEhjv35jlqEYc8qok2J9Yag0vdh1XSqzA6/C7fd9zD
	wgnOMe0PJWpJyq029kDRlecfIkzdme9XDJm7Mcsxe1RePoGAsbuObtkKkyK9tr7wutlrU7p0lew
	SASQbdCoYkXoumJohNpFv1zcryexjM/7OzP02FCEzP008Dr3ILzf8cwPVX3LSUmopSD6/vFwwXR
	nBz9bo2qkohnm6Y+AZECOp5ZNW8hKaLPG4pwn4KmUHv0HqzP3AET8GprXpwcDezCpJUQNELzqxd
	8Qs2Eu+5qYQR9Pg7/w0jGOobX53AYhVsMuPtKt/EV8t02fDQGAQ+nD72dkxnOWDe0O/E+/AFq4o
	xXdFleiYoJl/69EiUNm0apoYyIw+ezQo3uMqpOOglV/xSVX3FG4BUkDWwD//6K7Y7IFInIVS6P/
	Bty88FugCyzvDbpwopKtIjX6195vHUBdnmE=
X-Received: by 2002:a05:600d:82c1:b0:4a0:1a7f:2abf with SMTP id 5b1f17b1804b1-4a17b536decmr4681335e9.7.1791262377155;
        Mon, 05 Oct 2026 21:52:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-040-097.95.117.pool.telefonica.de. [95.117.40.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm72322225e9.11.2026.10.05.21.52.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 21:52:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ntfs: fix two kmap_local bugs on 32-bit kernels
Date: Tue,  6 Oct 2026 06:51:34 +0200
Message-Id: <20261006045136.5911-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two kmap_local bugs in the mount path of fs/ntfs. Both only show on
32-bit kernels with HIGHMEM, where kmap_local_folio() hands out fixmap
slots from a per task stack of 16 entries. multi_v7_defconfig enables
both NTFS_FS and HIGHMEM, so the stock 32-bit ARM configuration is
affected.

Patch 1: check_mft_mirror() unmaps pointers that were advanced past the
end of the page. On 32-bit ARM this clears the wrong fixmap entry and
the mount dies with a BUG a few calls later. syzkaller found it on a
multi_v7_defconfig kernel. A fresh mkntfs volume reproduces it on the
first mount.

Patch 2: ntfs_check_logfile() maps the same page once per loop
iteration and unmaps it once, so a mount leaves three entries on the
stack of the mounting task. After one mount the CPU it ran on can no
longer be taken offline. A process that mounts ntfs volumes five times
hits the BUG_ON() in kmap_local_idx_push(). x86-32 also warns when
mount(2) returns.

The two fixes are independent of each other. Patch 2 was tested on top
of patch 1. Both were tested on 32-bit ARM and x86-32 in QEMU. Details
are below the --- line of each patch.

Changes in v2:
- v1 carried an older copy of patch 2 as a second 2/2 by mistake. The
  patches are unchanged.

v1:
  https://lore.kernel.org/r/20261006043810.5393-1-kmehltretter@gmail.com/

Karl Mehltretter (2):
  ntfs: fix kunmap_local() of advanced pointers in check_mft_mirror()
  ntfs: fix kmap_local leak in ntfs_check_logfile()

 fs/ntfs/logfile.c | 11 ++++++-----
 fs/ntfs/super.c   | 20 +++++++++++---------
 2 files changed, 17 insertions(+), 14 deletions(-)


base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.53.0

