Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA75A3603F6
	for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 03:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739361; cv=none; b=fOmvwqkTbAmYLx4rrLTycCyNYnF5dupoIoQUviqnvyyn8mTBcP8AIq0Qe/l3BvqBgjJPsLCPkhz75nDFufK91vZRLGnynTFo4vgrigA3hw4C7SsNuKq0xlqkq7Yie58KcrmC2KTrEMRBDUY0fv5TBR4utP27kgOrLuekL68BPkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739361; c=relaxed/simple;
	bh=dR747zwW1q0VchPqSXwvSIkoWDop9WAag1SPY9rPzVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rxhhtd0BBN50zPr1NWdEXSP0w5PG5yauqF++GPa77qP7wLZu43WrJXbz+b+uK1h91qasPbIppVmZ04Ev7RS4SWFVE5z20Rm6YpxyLV1uLA07XBUNnhU/apOJmahXVawruNNwoH/YSugjztGjNRZmoXhuk7kugKvJs0Xic+5kpq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGHRuMxk; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGHRuMxk"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba91so2299534a91.1
        for <ntfs@lists.linux.dev>; Tue, 29 Sep 2026 20:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790739359; x=1791344159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJdCn5DM6GkKH27NOplYX+VPam9K7OtehdfQdeZW9iA=;
        b=CGHRuMxk2zpaVnsQR/fF21u/WFecC3aZ+osaV0NxCdusonH+jAHMx+R6Oycbx65BRo
         qEXaJXYANoMBghQ32FGrCmC6fhUViX71mWr/YmZ/JJ8WfbTUst/DB/Ka0JjbCqDOLxBk
         Iy5/ZOG3SEGahihqbafqCH/uw5WFdIrJa74bo+gw9Y2196000/9Oy7F0jQAIQA9vqCzt
         L8kaGGVMyY5xabbVPZPN2v72rIV2vLJ3T0SHtAiVuElg7SrY7dgWKPumR5zD8ICldqSn
         n6GKVUEdtvB0+tBLz3ADzqzPutfy0TTwfZAt5UsxMbIc4norpSUb8SoO8l7Kj2Ixmoeq
         VrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790739359; x=1791344159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJdCn5DM6GkKH27NOplYX+VPam9K7OtehdfQdeZW9iA=;
        b=FV/Mvf6/b6vvY0k44DKVrVZmgZJoh+R88aEhZ0FZrwJC4FWBcAVE5pq+W5W0xB10iA
         D9IOJ1BEuSCTvzceHKSy3kqBgw/kp+MURukVNOQDvskkK+MRyrQ3niyhFrlwfU8Yln2o
         t7cbXTyD8ADdayY4XKDFKdhGP1nKSa6woY2wJ9fMhI1DRedk+R1cq3KT2jUmhqfZ9Bii
         WAz98ZybdiOH2Ktg2j3YoNqJirLWXosA+5QwoGFneiXqv8tkE+hyiIJPTnEV0wx+VtUM
         8StTpI1GpTW9/FnlYaXi18PcePs0IR6k0biJwG+MyHaW4v/Z5mZ3H21c5RcXC8T0+ztp
         z9dg==
X-Gm-Message-State: AFq9FYLKdwysCU/ks8jlkVPMzcBUoIyQUncpcgkZkMkfMeAQzKUfW77M
	J+45H3QmFF6IlaS2grBdd/NW7DIkcy93AbyL14Pts6IelQW1ih6M0iws
X-Gm-Gg: AYBFou2e4Pnkvc1CLmvpa/da1UJzA3Dbdmd/KHNeVEIPW2gl+7InMtzCigp+V62ayGN
	lHds5ZzVEfwaQunMnYU2vLRgjLa/xJlLOGSNCLGiyPZJyxc0wJeXO19nw5p42KwKFejYNlsG9LL
	9FKoRXJPKjz+LdbXKx5NqKMxIFMukN1iHp4oQiChSNpAGnF0Yixq/rU90rVViMRiv9ttm5F5JkO
	FFfKS/iLnaK5wv6EIY9BC++91WiOCSD5H6CJamN3airs+UKmk+d55SEJaU9edIvcDK7hddSmU56
	g6/PidImXfblOJLlFXzuqsUvr8gCy7rghbH8l8oFjsxG7t/younDI10aWVOZQqv/SlR7cXo2oY7
	kwzPOqdmX82jdM5Sr79dKqEF3gm4bfYIlS3THO29mBBiNiuihjRJ2+5vQfyv4Vyk3kCBz3WSWmx
	rLGv+IygNVZQ5kuA54OsRfCxcSi2D9J+6YC7C6yOuTwvMTj8tTk5j/ZpPSDwOJn37Vu+wq0vrRF
	Pn91sOkf+UzsZspLwO/PB1t/rbLL9Bq/RWUCVh31pSD6SGfZHS77qWlMRbpKPZ5+cuzTbmC555+
	SlngXBc8GbIZBTp+VHvlpCzAuTYxvKDq3EuxVoNTs7siXCpX/uTEiwddZ7A=
X-Received: by 2002:a17:90b:4c4c:b0:3a2:b70b:9cc8 with SMTP id 98e67ed59e1d1-3a4d1941780mr115836a91.61.1790739359128;
        Tue, 29 Sep 2026 20:35:59 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce16abc2sm669108a91.9.2026.09.29.20.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:35:58 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ntfs: fix the undo path of $MFT data extension
Date: Wed, 30 Sep 2026 11:35:54 +0800
Message-ID: <20260930033556.169300-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fix two bugs in the undo path of
ntfs_mft_data_extend_allocation_nolock(): patch 1 makes its $MFT
runlist locking consistent, and patch 2 fixes a use-after-free of a
pointer into the runlist across the truncation.

Both paths only run when something fails while $MFT grows, so I tested
them in QEMU by forcing each failure once with a debug patch.  The
debug patch, the test scripts and the images are at
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-28-ntfs-mft-extend-undo-v2

Changes in v2:
- Patch 1: if ntfs_rl_truncate_nolock() fails, keep the clusters
  allocated instead of freeing them, as the runlist may still reference
  them (Hyunchul Lee).  The truncation cannot fail at this call site
  today, but with a failure forced, v1 freed clusters that $MFT's
  runlist still mapped and later handed them to a data file.
- Patch 1: did not carry over Baolin Liu's Reviewed-by, as the patch
  changed.
- Patch 2: unchanged.

v1: https://lore.kernel.org/all/20260927105706.3111333-1-matthias.goergens@gmail.com/

Thanks,
Matthias

Matthias Goergens (2):
  ntfs: balance the $MFT runlist lock in data extension error paths
  ntfs: do not use a stale runlist pointer when undoing $MFT extension

 fs/ntfs/mft.c | 68 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 58 insertions(+), 10 deletions(-)


base-commit: 259abb551e2944998cad4214c201954ab1ac5c8d
-- 
2.55.0

