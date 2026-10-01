Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1C53955F0
	for <ntfs@lists.linux.dev>; Thu,  1 Oct 2026 14:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866184; cv=none; b=UD63HrsIs9+TvjaLkW0ZT+haA4quiP5dskh7C7eaPeZ7wcZ3KqTiIVq4uOCVFmSQzqCvvFlb77By6aJ06yxGhFlK7EdKE8KtVCb/58BIx0r8FPzQf7yhKvudvZ23Ew404SkMjNrotxuoEqzjOovrSb07FQIaeo20KA21ldiXdW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866184; c=relaxed/simple;
	bh=Oj5C4Mfx0dTb9luGBZORcT2IiZ7I3lUSzqMSLKqiAiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XipF9LAoTSdyFWtN0vTRLZUFdmFkpbSps+63J20HxXpWDHil1smMjkIx3no8GgzejNivRlFe/suupLDYQZ5olxhTtFpzSOKJskROVLMt85YFfgQRqDLKUXvtEixptvmgviUlZGtUAGuyIDDDtz6qY0TIPKC4R+714eYfbBjUCvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ul0dr6Xg; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ul0dr6Xg"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2db9f927cso13213225ad.1
        for <ntfs@lists.linux.dev>; Thu, 01 Oct 2026 07:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790866182; x=1791470982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kxg73ytnb8qP6pJiBvg4zQ5ISBtXzCRO0EIz45SrSkE=;
        b=Ul0dr6XgmQ/7VaCQe/F6tmyKDcm8UGLxESQ9UhIZ47coRdBpzfAhu2cF9eL7kak0Qf
         87CHGNuBuYJIKWHSNzQ8a+Hi7uflFZXS8SUaLybYNyucEMjilP1L22pmYn0WpRstjykz
         Qg3oJXHiNpA5vWj4j4AJ+pVw7DWxiFQ9S83GU35TOxLP1ogEDLW88C1WUCAd82NuoyqB
         LrNsYcsahEWUZXrXzuCqy0q89O6YsCVKlV1AjCTPfBBBSn18T5ReF7zTJ1qQ9sS3gXIi
         zRQy7H5qLekrfjqa5z4N5mgt3gGTaaOH+jI8qtNA1JjgJGo31ErUiW5sIlV1NJl2GjDS
         jdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866182; x=1791470982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kxg73ytnb8qP6pJiBvg4zQ5ISBtXzCRO0EIz45SrSkE=;
        b=J1r/ik3kfKZqyqI0VzTRfTmmqucPOOsrIG1D1B9ew5i28Nkls7rxSHFmu9KMLJTOEU
         qzYkGTWlH5YYV4qQwjLAfQlbVyKZRQmPKFvR2Dnp8cJ5ERIClwvVooJOR21v4vOoUV08
         vmRKBhPaSd1+MhzEBRFZHwA1uugWuVDQr4Z/CfY6HkoNtKS2C5pff9scKmtNs9PnY3Dt
         bfWuaq4cWJMCydab18nfPgeQfQx6jdOCNYwj1qbNAHNscfFPhZeCc966jC/MJ5W5WG8Z
         xheNp4OLb4wMXPt0WZ8Kx7DCQfGOzP7IvUEYuHvgHWeMNqsHSPI8nPF0T0P3PG/D0FOe
         xwdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxslVvvpLquD1XKzUHkY4QK6hTCdg2FgjfjmTrcjJiRtiAbfvfv4x/WHFPIX3C04/tBE5vs@lists.linux.dev
X-Gm-Message-State: AFq9FYJRLewY7taOO2le4wFEQ+UHY1tiByyFZjKcJhpWzPaHNf9R+8FG
	4MrABNMJfLDTEarNRSmj1okEtfYUjjxMjFGYQhnXASp3iFOnzG5VPSxc0ZToTGIcvB814w==
X-Gm-Gg: AYBFou2jqfiijCwc96fGeRVsSzbS4tUj7R0Azh8ZXswe3kQF9pA3ewq59Gqm8CVtqhW
	KRnoxF5Fs0rkGSvSJzS7kifGBqkc9RDOZbTbjA3xLRyijp1YGCR05JGhNSNdQk1XIQnLvRSP3aF
	SXvHSGE3DopbU8H1zHAEQXsSNmtmJxM/0Aby+O0NwkbumCOUH4bh8Y9eaj0k8r4d2i+e2lHQZpk
	3pKzQC8Cw8V25YDdu50BeJL+mxGxCktz2EqzfvdvaGkBdwAybq1S93MXjfCJyOFPm1j8kTaRnUB
	y0cO+rMpl0Agbfj2MMD6SKz3BMDpItQTcfS8021FvRppWzvEeFuCF6VWtsQ4vnbc1wRiP55kWK8
	DKCCmnygsSO5n0/odOpe9PWFi2aB5ODfAzKHr1J1HL81c/MYmbBpvkI+LLPqwnlcmYcy29lq2PP
	5dI7pSjnnmB8MSCeLqeE+Fm+cJTPhjTHijjA7Zo29gbCPsxnriD4C8N4OA9kuvvHoWnXjyVQw0P
	FooW/VPJBdmWnYrcfaXPRXE5cvPgocKPK+D2juVjLcwOHfNR0BJWFBCxXu7FbnJYcVlp9rwwZUK
	ab7yfujEbgkKzr/3FvVanw6pUB7h0Zn0PijzIrc4XOVS101GlK92ieyYjyQ=
X-Received: by 2002:a17:903:2b04:b0:2dd:2b8:7198 with SMTP id d9443c01a7336-2e2e49962aemr46519465ad.6.1790866182244;
        Thu, 01 Oct 2026 07:49:42 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e317cd0624sm6636775ad.30.2026.10.01.07.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:49:41 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	liubaolin <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] ntfs: fix spurious EIO and ENOSPC on nearly full volumes
Date: Thu,  1 Oct 2026 22:49:35 +0800
Message-ID: <cover.1790853718.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fix three errors returned while free space is left.  Patch 1
fixes file creation failing with EIO on a nearly full volume; it now
goes on until the volume is full and then fails with ENOSPC.  Patch 2
fixes the cluster allocator missing free clusters when its start hint
lies at or past the end of the volume, which empties the MFT zone, and
patch 3 removes the fallocate() check that then fails every later call.
Together the two bugs make fallocate() refuse space that is free until
the next mount.  Reproducers, run with KASAN and lockdep:
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-10-01-ntfs-nearfull-v2

Changes in v2: in patch 2, a contiguous request whose run from the hint
stops at the end of a bitmap buffer or of the zone now gets that run
back, instead of a second, non-adjacent run from the zone position, as
Baolin Liu suggested.  That second run also happens on ntfs-next
without this series, and fallocate() over a hole then leaves part of the
range reading the data of a deleted file; patch 2 now fixes that as
well.  Rebased on ntfs-next, with Baolin's Reviewed-by on patches 1
and 3.

v1: https://lore.kernel.org/all/cover.1790503811.git.matthias.goergens@gmail.com/

Matthias Goergens (3):
  ntfs: set the attribute list size before reserving space for it
  ntfs: restart the zone search when the allocation hint fails
  ntfs: do not refuse fallocate() when the MFT zone is empty

 fs/ntfs/attrlist.c |  5 +++--
 fs/ntfs/file.c     |  3 ---
 fs/ntfs/lcnalloc.c | 25 ++++++++++++++++++++++---
 3 files changed, 25 insertions(+), 8 deletions(-)


base-commit: 708f9d56cacae21aeee98d16bcdd50a66edc04a0
-- 
2.56.0

