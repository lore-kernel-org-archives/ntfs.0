Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8094533B975
	for <ntfs@lists.linux.dev>; Thu, 10 Sep 2026 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033600; cv=none; b=D5ELwJ0EDHPp6C0QpFqYN9RWTraaKMt0a3RXzZJAeD+pCi53XI065Si4mEfG2ndksEj62sTW7bsGUtWCMqOp6028EIIFryF7g3sgfb/VATyrJeVnlaAapK0zcluwST0G/2aU4N42JlLbMh6ATB8q1aG70rHvcLXYezSlUJyuZTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033600; c=relaxed/simple;
	bh=cN36aoANS5G0wyfR6Kd9G4wVuXwpcY3NjwZwESlEr4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kpxDREokkLGLiT0vlKEF4fzxSYOAnsYwBbsqob5rxBT0j6XRSVhvID344HlM3Y+3drwxS664gedua9G7fKo1nLnDkcCl2nnwtuvDDmaqdZs7CVJSzIu/74E6pSpX2tdvwvpDYH13hhHoeRAG5xff9tzGns0r3h0BZoimQcd7eLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMxBNgYj; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMxBNgYj"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cace91f112so59424855ad.0
        for <ntfs@lists.linux.dev>; Thu, 10 Sep 2026 02:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789033595; x=1789638395; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NOf3leecRyw8XXOGtwCTiCtPSOUpMU9biNMDmc8guqQ=;
        b=dMxBNgYjPYQheKBtDK8sguvFPhV4NsSx6GWIYZsQIh5XR//VVdK6IEltkE8gB9J7Gs
         Ipc1NQB1ttZglGd7aMnxynJBrIJ6a6lF9lr344Du0U74t0/du0A23qONA5liWXiwcw5M
         /FJjvRYuUGqJVAWdcRq+mHOT6yBYxt51Pq1BnnnWxaGY9fUGtXJ18XsJaDaGXiNLQ0X/
         6ffPJM+hxNrpZE8a5pS6O7AJULLZsrzJLAE15Qxh1YzTnGT0miMwgEN8L3evDomB2PrH
         B3Wk/4TNUA+hYCc+Y/Ya7VPtO99GYXwy6hFUhlbCUi6o+tSwnT6d59o4heFZLQ0tep51
         zWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033595; x=1789638395;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NOf3leecRyw8XXOGtwCTiCtPSOUpMU9biNMDmc8guqQ=;
        b=VemK8zA+SJuJETjiLDaLUfuAyqw/vC8jWRgSkGE7mVdNTkdrGRykMDlL25j9VivWwf
         a36aAIGot0tljYA4lREbTLN6nLzGr6nojwpxZUASpqMfVnJMUwr6pZuVeaAL213ZKJAp
         Y3wWt6vqwNetrWVKC2ntAhcU92qPdtwaDGGa7VEbslT1f6qR28GXCbaO9HHoVHF4KGpS
         ciRjB7/QLk6KjakMcP/aG46BN0NdFKzX7jMqutLvyhHA1QAgOov8CMVuORG1QyzTHt4A
         b9NRQPAIFobs41F+zDrremLRHMT8EpI5Fi01WORpHKMAHRrAwwUKuvXRJUukFgJG1Q/2
         q2Bw==
X-Forwarded-Encrypted: i=1; AKwUvBzLyK1MH6nJJXbXKVcI2EXBwQq3WQY2u4X8f9yJacnqwwZpQcMkKNng+/e/eRS1g0UWnXwx@lists.linux.dev
X-Gm-Message-State: AFuF++kIkY3BLiR9aJgyFA1xSCyW44tVv+e4ly8Q68NTJViHLUZSCHfF
	1EvPHtBQSpFFulr7UCliAp+kTJIJIcDqby+1CAoi8Q6vgxVjZ++4MZ0c
X-Gm-Gg: AYBFou1vd6JHFfukgPBSmKbFc9bJzhg5VXH/nvsSZqXcvSnF535jzcisRl7yRrc9zMw
	WYjdVjagsV6vRROUtHYjSI8o+qqQTxqOvky8zLXr33fh8zMRZh9DE196sHVSj+5Cc2tKtOtRAJA
	gC8ZFBwZp1N8ws94oueW1h7ssx0jiAQ7MzqJ9KKNnyk1rDabsbtA4RZkA1WDQXd0yW/jaq2PAlq
	rSiFZCJ4b0urG/0VIh4g8YGj1mY3jVNvozx+1RghRMEiUYteYOAnPADKS0KG5pzT1TghQLx4u8N
	7RHq+JlUw/6NpfPcBGLTsUU3JY7tXvzQ7Jrbt58t8UOTAqGDtKy+4+16RmMDNyf64Pqk9YQfIH3
	w+tqwATZzvBLQ28ojYJhdtCcrfaOqANLi/3zrMoc1+bCF1RH+LYJ+UOCWZOPRYp1AUSHUU4t8BL
	dIVc2SaT2/MaIT21W2HPCCJ/faKC2idCuBo/tN75SFa/gANckUz+AzGpogbb+oF9V1X34aEPWA3
	0b9mg==
X-Received: by 2002:a17:902:ebc5:b0:2d8:d4d3:3fbd with SMTP id d9443c01a7336-2db12628584mr591497955ad.17.1789033594268;
        Thu, 10 Sep 2026 02:46:34 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14841054sm86827285ad.3.2026.09.10.02.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:46:33 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 0/8] ntfs: support 4K-native devices with smaller MFT records
Date: Thu, 10 Sep 2026 18:46:02 +0900
Message-ID: <20260910-fix-4kn-lkml-series-v2-v1-0-f10a09fc0176@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1350; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=cN36aoANS5G0wyfR6Kd9G4wVuXwpcY3NjwZwESlEr4A=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqonw2ybhUPQkS0iWTCDASM7lvY6/DbUkEn+ZRB
 fXD7/60InKJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqJ8NgAKCRA08jD6945I
 0zU7D/978S5k+tNetHb34ZamlfN2nqL2cCWGf3f8SRBY/+nLRtY+a49q98AQO7ACXrDy1vUIdoC
 ZP3m3GsuxWv2sEaCWs/HtMdTPOLL5sCtafH+tYKtVidjfIUagGOCHcyMaDsTbPl3QOE9xr6B4Oy
 lAAT5oWjMRsZYlc4/3eDuQWFVNVzHBe9tDb2FFgrrlPLYaXpx44ps5Tx/qtVnEqrixRvh2hRIDC
 4X/MK+Xsv8cGIwQiICLFfXw4SE2OsWHpMRq2tK/BycAn2AOpVTLWClGlrkZ2BmzMviCZNNPgjKu
 ZVkEiz1kO9nwWBqtsgYHGwpjACO58U8FxDmDkkTaC979AFNrv7uotpETH3cj2cDM33fXsSlJ4QV
 DlMhXwsAekN8NTZhabdKku66uINcsIXGTGstEUqbKIepLkFWyUIW+4FPuceQ+SYribdkayB+AMM
 XxuGomXAODH8lYf7wtyXt7TNgKwKeuZFsUvDokLGTXObbhytuIjZcByM3hwJdYtTgFpfX46s0Rm
 cp5Ii/LzbkdH1PvzhOTU6bryDkLakbFV4fVFVB2f4hX8RhK4pFXmIxV8Oejau7/DA3qaUmQMY8W
 ItbfonCmcQCXZYlOMwRHPZBZFmtYDeJEcfLpkDQCL8zeUqrZ2FIGQ7vTMQm5qJHT8VNdPx18Zzq eh7GO7s2psB3lXw==
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
Hyunchul Lee (8):
      ntfs: read MFT writeback bounds under size_lock
      ntfs: validate the MFT I/O geometry
      ntfs: write MFT mirror data in mapped I/O units
      ntfs: serialize raw MFT updates against folio writeback
      ntfs: track direct MFT writes until BIO completion
      ntfs: write MFT folios through mapped I/O units
      ntfs: write MFT records through containing I/O units
      ntfs: use sync flag for direct MFT writes

 fs/ntfs/mft.c    | 888 ++++++++++++++++++++++++++++++++++++-------------------
 fs/ntfs/mft.h    |  18 +-
 fs/ntfs/super.c  |  66 ++++-
 fs/ntfs/volume.h |   6 +
 4 files changed, 666 insertions(+), 312 deletions(-)
---
base-commit: 9a05b5715cfa5986597e260e2fa9aa127a012120
change-id: 20260910-fix-4kn-lkml-series-v2-62e306c5a33d

Best regards,
-- 
Thanks,
Hyunchul

