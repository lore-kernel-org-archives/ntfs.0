Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FC92110E
	for <ntfs@lists.linux.dev>; Fri,  2 Oct 2026 04:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915708; cv=none; b=N4s43uqUgTMv1V1BTPHXyyuHhKY85OSW2Euz+jx0Ck6ma3qLbG4EXrHbtnbiOfYF3TwgR8yt30BkHPKRo5BB0MV2iTzny+ut+M/x7f7YQbz7hg/PXXnOjOKECM7/HjohW+vt2TfMXCiteEB6k8U1JDlBEIhXXHYd1FJNX0s///4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915708; c=relaxed/simple;
	bh=2e2ewE55nFNffXiMvgPSdZOW+I2BZ3pUVfDPP1mxhA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ey+zYt4Gyd14NMLrTnmFAxnobCnW708oT7l05lK7amgoTPVDVnNTp8l3Ww20uTftGOntsz3KMprVswH0UqVlBz5WZW+8S6WEyyPbV0yLPgh1yU3MiObyZ1Gg1ugGf41NPLFYmRMlmUr2Frbie6TbwJU1pYmGIl3F0QMCxZBckBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlreRYo2; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlreRYo2"
Received: by mail-pz2-f36.google.com with SMTP id d2e1a72fcca58-888e95f3e96so979804b3a.1
        for <ntfs@lists.linux.dev>; Thu, 01 Oct 2026 21:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915705; x=1791520505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jDBf+2qnn5uR69+p18LQWYci7uKNqgSq+C3LtYBfIyc=;
        b=RlreRYo2Wy0H15Vh+tS2TcCiFFkzsWPUCVxW3Jwwcb6UpH7TGMYTSqJU3umwutGsBv
         6xxMOboCVKEL5Ar6VKevASDV1Xh16Mjw+b0I5rOSuSVKk2c6PmrPYXpu4BEatfDrFhZ+
         NODFvyK9z59pEpSXb3pEKWfYmhOZKk2LNa8WlOSBCYFQz2yWv4ZZ9e3irA7iewVQjlOA
         0fiKqNWs3k/LvVsXibvOr00KxR1j5JkoAEkyq23sF98K5y4eQrXhfU6wqNx+LDB9Qn9a
         QSIWXR1AeUBSPovUfJyIpOvCsspDUCfkhtWcmo0kHlz8GeXnLQLH8qk84VzHL0Z2zpTp
         KrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915705; x=1791520505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDBf+2qnn5uR69+p18LQWYci7uKNqgSq+C3LtYBfIyc=;
        b=FOtJEBu+NLYzxhhTtHUcB6sM5UQoNbsgKoUQ+6lhU1IiMHnxlbf9RYgNMY5Y8gtzf4
         RO+6Elwl5sFBCaAHYzAeRcQSNacg1vX6XR8kbcTmH/aqWJHMzgC3siwbUgkt/58VQlkC
         weyhieWyZmN4VD51X0p3sLzPZFR3prdp5+M/YWxyxsDN70kiCfnY9Srh/Azy8gAHLZbb
         8sBViyvVo/IzH2Egxrd23MEAdZBb7HIM3QhzBK9CV6yOGx3iRPQ7ItteNs/wRBFdgQly
         +mYibIWmO72EXOgpC3Kr0EJSDc4YOyEV+uiiRHC61ywYoUTr4wuMMoox9xrh/b20fsxJ
         qCzg==
X-Forwarded-Encrypted: i=1; AKwUvBxIWOhRy4QMb6bXu9eCj/3HRJ0FpKUij3iTAV6SEPVRYEl+pN3Wzi2R2Qb/HUhTtHMZsLTM@lists.linux.dev
X-Gm-Message-State: AFuF++nYKcqpaw8VYtG3sr4jK4OqF+d+az/cUXGyry5Gf1LRe0MTS1UM
	Xb+52BOBJdNH4Es8Ng6zMh9kQwWHIOj/U/qByMeG+oI4XIdpEqhp2FMB
X-Gm-Gg: AYBFou2NDj/CIaQguk92G4ciVtPdPD2wpEc+5WQzbe2UqlMTjxkdv1kcVRev8AQmvpJ
	qCSU5d66XYS4AnGQaUzIPz8SIc/ASqm5ilnLBa0PqYnqE94cldqsxeOl2S49YxFeRo5GdilLB0L
	79ZI62Z+p4sRuwq1jDcxP8cRgPV3n8RDSxaimNPs217xe+r/lgf4GFWmSG22wgoHG3vMX9Q1mCT
	edPOkVaIXE05dBfiR7TVr2LMMdvCMIcaknpDydpiH0ES42BA1wa1lWPSARKJWIsCLp3oynKSCNW
	jASNZU5LPT3Kf3KL5alUeCV2eGBDEooh9V2QCrKxCqeZWDrGwEJ//+rErpNwuBvNCRdL0T36zQg
	7qnAODIF3bV2r9WUGjdzliwEiIn1R0DUjKP8Scksjt3/HzMsYvSo+iIgXGm6eacL7jiA3BX/RG+
	Is3DgJL0jwk4LJd5yvAFb8CrZnW2oxwHLqz5Y0rrPGGTOVXZVTKnMlNGqO4MP1HTMYTXNfWhMsi
	S/LV1KOtvlpBpQDNIleq+eWta5S6CFbJZlJMk9DghHmu5i2FEOQJ5Tocsl12uYs0mjdEp2wEkNa
	RP9uxiRBNeVb0L4LqI3m2CSFuMCG2pg9CU1mgeIkJ9NurySN/3pXEhY2rmM=
X-Received: by 2002:a05:6a21:a344:b0:3c3:6f6c:aa21 with SMTP id adf61e73a8af0-3e0bceba7d1mr1718503637.11.1790915704636;
        Thu, 01 Oct 2026 21:35:04 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7370db1sm436432a12.17.2026.10.01.21.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:35:03 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] ntfs: fix the undo path of $MFT data extension
Date: Fri,  2 Oct 2026 12:34:56 +0800
Message-ID: <20261002043459.1695429-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fix two bugs in the undo path of
ntfs_mft_data_extend_allocation_nolock(): patch 1 fixes a use-after-free
of a pointer into the runlist across the truncation, and patch 3 makes
its $MFT runlist locking consistent.  Patch 2 adds the runlist merge
that patch 3 uses to keep the runlist of the new clusters for the undo.

The undo path only runs when something fails while $MFT grows, so I
tested it in QEMU by forcing each failure once with a debug patch, and
tested patch 2 in userspace against the merge code it changes.  The
debug patch, the test scripts, the volume images and the userspace test
are at
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-10-02-ntfs-mft-extend-undo-v3

Changes in v3:
- Patch 3 frees the clusters from the runlist that ntfs_cluster_alloc()
  returned, using the merge from patch 2, which leaves that runlist
  intact, instead of copying the new runs with ntfs_mft_copy_tail() in
  undo_alloc (Hyunchul Lee).  The undo path no longer allocates.
- Patch 1 (patch 2 in v2) is unchanged and keeps Baolin Liu's
  Reviewed-by.  It now comes first, as it can be applied on its own.
- Rebased onto current ntfs-next.

v2: https://lore.kernel.org/all/20260930033556.169300-1-matthias.goergens@gmail.com/
v1: https://lore.kernel.org/all/20260927105706.3111333-1-matthias.goergens@gmail.com/

Thanks,
Matthias

Matthias Goergens (3):
  ntfs: do not use a stale runlist pointer when undoing $MFT extension
  ntfs: add a runlist merge that leaves the source runlist to the caller
  ntfs: balance the $MFT runlist lock in data extension error paths

 fs/ntfs/mft.c     | 59 +++++++++++++++++++---------
 fs/ntfs/runlist.c | 98 ++++++++++++++++++++++++++++++++++++++---------
 fs/ntfs/runlist.h |  3 ++
 3 files changed, 123 insertions(+), 37 deletions(-)


base-commit: 708f9d56cacae21aeee98d16bcdd50a66edc04a0
-- 
2.56.0

