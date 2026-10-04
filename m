Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EE338E8B1
	for <ntfs@lists.linux.dev>; Sun,  4 Oct 2026 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107775; cv=none; b=jkMr5DX0/kZrBVmOmahbAYi8r1MhlTV/Rr/WWI2bWhwLKvo55RwI02PpUaV63NgA2FuL8nmjs1OVkKCl8X8j4wZCqL8NtWd1ruhKN/oVgPsIS8LPpvXUQ2aoMTiKSQMcmUVd3PXuDKBEf47nNE//o0A0dc+iepESFKE33Dzc/vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107775; c=relaxed/simple;
	bh=ZpBnja49FVnQcL435Kbkb+kuHE6T5X0obVqilKKMzjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xkoatm+TNBT/Mbr0mTtmiTDOFKCX1SaIBJpGp4/DK9HaE1sdSh265TcGTNSfgi3NZVp9+2dJK0ykMWDR1arIZwk9Z4ETWNuLuE9FuTBXKfq8nTVAvrfopAZZwh7HhojhXZNWhV0QtoXTAMOFb1AQ9P2B0GB0ubwcPxK2CMz4KbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQz3lgYF; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQz3lgYF"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-88b7d853b11so333963b3a.1
        for <ntfs@lists.linux.dev>; Sun, 04 Oct 2026 02:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791107773; x=1791712573; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDHu6N6WqaDVYQcb2PQWKiWT8vncXO+aoop0XtK3ZMY=;
        b=CQz3lgYFfyN9O7hmABYCX4Z9mFlLHLf2k9Jo4fn97s0z/UpSK8xLxMbiqUQ4pVKp42
         rlg3TnYJjV9Jqayss3mjUdX7LMsL0zdNb+PkttOx1chCZxVt7CRzKTgGxYDNhWWMLN4Q
         BiaLmogRUCRu1Aort+bA56icmgkg9r+cAR8ScTfvUZF2uIKYrRqco6iKl+LfmY1j/CKT
         n71sY8a35PikYOCjJufbLzJpts4Ib43yOKfEATX0dagJRY9BK3j9ar6IZaH2YwypGOAp
         QcHu6sJDAToKNgD10zyxKpNRydBz0tLx5TMhI/UR+jkrghf9YhNISOU5xXADPDrocQ6L
         TA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107773; x=1791712573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDHu6N6WqaDVYQcb2PQWKiWT8vncXO+aoop0XtK3ZMY=;
        b=G+oATH760g7IgfsVPMcI3DTzg/FOqhfPGmlDDDC8RBPXYVmtPOv93hOgk9/zDs8lAe
         f/sr5KjQWmhPKCJAsoneXjba6+Sf6U1YGqjg9MYfXE5rAn3xYmZcm9QxT9r+8rXbWCMq
         v11ifmXBU7hrFtEWmDtnIL+nKNcqjQwLu2IPg3hWa5WPdSjmdcQtZbO/MlNlIiQTr8t5
         QI54xxUm3hAfa0yYFuC9oSx1Jax4FnECBgN5Y+tKARALMNfBhw7JmaRzLDh7V2jgE/l5
         hdAVTGI0GTHa3/pt4c4gw2EetNrhBw1l0AWGhZ89ePPGOTgrqor4dU5jWklZ+sw9HflK
         v13w==
X-Forwarded-Encrypted: i=1; AKwUvByg6lKEyih5MR3DCxJhlDDN0d/c5uFHTsY1BxVWz7JFSd9whgTE77iQy7GjXmyv/peu3Jzv@lists.linux.dev
X-Gm-Message-State: AFuF++lxR4qFtdcB7lEH5VKG7H/uLFR1Uk3NEb9JQ0+MTUaqn4EhSXKm
	KMznshRmBY7aAxV/9kh4en4SwvKy17BBUmZISVhD5HByjLLijZsqplzU
X-Gm-Gg: AYBFou1u2xanuDu1IXl0L3mLFx66J0Hw/xIkjD60sh7OYziRsMze6Rynao132rOXsik
	6aJ57qCiWRJqe5B0kmAZLjIaQlt07GD4mfx7TAZFUQSQE8vN63t+7OT0XtgsIlDT3+SLG/PjvR8
	K4o8HTj/MqlpBbRSa5/bKFseJANejCjybooEpcOUMpSMGCBu6eWSakjndPznYcDhypSWg5CKJyB
	ZQib/bTCTRSvkjzZBqGaYxcmE1DFM/Qi59hJ9r2v1kazrWP/B2v3Qgw106Vt7BYAbk7QKkNfdyX
	0DqY92ZLm9plPYTZX8uIcQcL1ZpLxjDMMpERG7hFuqnU875k4H5mBi5xw6ge5tBU/jUuZecI1ZJ
	U9FVtB8Y62M/6FaIOP3+vunskxbu0vBmV4KQsChX4k7G66tluKpY2ZTSR6HPiF1odzReO5wXgSa
	zhvL9puvy/pWbsI1KEGopfqqK9l06gcMzHRRdujjY4VGH9qqzFxjTtA+CFVFlbUJvm9iw+paPRq
	gs/vMX0kxcPPL5ValKdJYLYPr/ZnfHK1QHVI8YOY0Av6jT05p6rhQskqDJ2/JXXcN9DrXtAooRI
	lKqjVuWVmtwf8OOByOz3w49XQW1wUFFckP7TCYGiI5kPiLWEizKOdAq1JTA=
X-Received: by 2002:a05:6a00:a114:b0:87a:3144:8c4c with SMTP id d2e1a72fcca58-88c64064002mr3596683b3a.59.1791107773270;
        Sun, 04 Oct 2026 02:56:13 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c3a39f6sm2418175b3a.28.2026.10.04.02.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:56:11 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] ntfs: fix spurious EIO and ENOSPC on nearly full volumes
Date: Sun,  4 Oct 2026 17:56:04 +0800
Message-ID: <cover.1791107674.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fix three errors returned while free space is left, and a
contiguous cluster allocation that comes back in two runs.  Patch 1
fixes file creation failing with EIO on a nearly full volume; it now
goes on until the volume is full and then fails with ENOSPC.  Patch 2
fixes the cluster allocator missing free clusters when its start hint
lies at or past the end of the volume, which empties the MFT zone, and
patch 3 removes the fallocate() check that then fails every later call.
Together the two bugs make fallocate() refuse space that is free until
the next mount.  Patch 4 keeps a contiguous request to a single run:
fallocate() zeroes only the first run, so the clusters of a second one
kept the data of a deleted file.  Reproducers, run with KASAN and
lockdep:
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-10-04-ntfs-nearfull-v3

Changes in v3: Namjae Jeon asked whether a contiguous request can still
get a second run once the search has left the hint, for instance when
the run reaches the end of a bitmap page and the next page is skipped as
full.  It can, on that path and on two more: where the search wraps to
pass 2, and where it shrinks the MFT zone after trying every zone.  On
ntfs-next each left 16 of 20 fallocated clusters reading the data of a
deleted file.  New patch 4 does what he suggested: before setting a
cluster's bit, it checks that the cluster follows the run, and returns
the run otherwise.  Patches 1 to 3 are unchanged apart from Hyunchul
Lee's Reviewed-by.  Rebased on ntfs-next.

v2: https://lore.kernel.org/all/cover.1790853718.git.matthias.goergens@gmail.com/
v1: https://lore.kernel.org/all/cover.1790503811.git.matthias.goergens@gmail.com/

Matthias Goergens (4):
  ntfs: set the attribute list size before reserving space for it
  ntfs: restart the zone search when the allocation hint fails
  ntfs: do not refuse fallocate() when the MFT zone is empty
  ntfs: do not give a contiguous cluster allocation a second run

 fs/ntfs/attrlist.c |  5 +++--
 fs/ntfs/file.c     |  3 ---
 fs/ntfs/lcnalloc.c | 35 ++++++++++++++++++++++++++++++++---
 3 files changed, 35 insertions(+), 8 deletions(-)


base-commit: b2a3b6b6c7b09040e3f44ade6e20a7689e4acd28
-- 
2.56.0

