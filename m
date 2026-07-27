Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3B9134CCF
	for <ntfs@lists.linux.dev>; Mon, 27 Jul 2026 00:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785113948; cv=none; b=nly4OpHanFBko5tLH1rxmHEC1FooRhCaIi9OK2OGW+XZfEBl22CkdehJmSU+7tEZT4b50VZvKLT3+RcOjLX1dexD8O0UgqP1Q/9f84oSwLZhVtTJk1tZ8X3n4ZHsIvDBBZ/yySY2uD8Vp/JCRc3/AQYhpbeWkqaM1kl0kO6p550=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785113948; c=relaxed/simple;
	bh=26F1oUpnmZKulFZqe63zZqSGeu2TzH9QLCZvdI3p6DE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bO6hVX2lxyZzIBj3/JnclH4erkrOZfF1Za5vRTbemBzzokmcu+7n0LAvXONLZHlSpi5MxtXQhKvzVRudCtxVfu5Pu3OCcIF6zdB3WwX1uxijUywZVKubpdCSh1x9zLJmmzQgvfAse4/p9ZvQ8D3kTBP3ZxWYrazwEA1oiCd3jdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTUIla3/; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTUIla3/"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cace91f112so22340445ad.0
        for <ntfs@lists.linux.dev>; Sun, 26 Jul 2026 17:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785113946; x=1785718746; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Gp/UsE4yj3DN+x2Q7dfeJ2Yy5jqur2a6Vbab4Ud+TM=;
        b=dTUIla3/rstYQGvJId3zWGMscybez1SiNtq0vdPgZJ35OM1OqMsHw4LTolqsVUZ3BH
         mDNEbAZv7w3llv63JncNNutBn5Y8zUjJdkz5VAgYcOpQvcPnul8ndpVxr/+rqAeLgS2G
         lqwwdc5sOuJkHILvjwA4hHnq2EPXQue6MSXhckzPp0Tbe1T9SPKR01wyjVCd5CSQVZ/3
         o9QyjcTpb7Q4+NQG1Exgw8t9ZXmwZkqsXVr+Oi0ADiAjORA2iFIZZuYC2VR7l9AZ1Mpb
         sw/wuCwOskG6C0+mc/6iNFoM+mFJcXG8vJFd9EJhVWSgtVBgiEAQdTDM6lDyT9FFXlo/
         B+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785113946; x=1785718746;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Gp/UsE4yj3DN+x2Q7dfeJ2Yy5jqur2a6Vbab4Ud+TM=;
        b=M/sRFiL5J5xRm+UiB2+ganEt59TN05Y/R/nc8AMj09JIs/PLXUp48ASIQ4ohXsVwu3
         V+Tnl5q9r+snLxPUqXea9sOq1Ui0BYGWEPYQyD/1u5E5IUIp4E+QpORpppQ3t7dDAPM+
         xDHXEAYWZJDfpzqZaS8xxacv3ghh/92dIDj3ohOs8ou/lBq3mf2/uM8UbAy/1MuFgXzk
         BErSbvbITI8T8AUws6TzaEcxl7e8+qqkkiWUY5j10y/MqALcaEBesyghb48PPYPldZXx
         ubGg1UU/WqrTA8C5Fwmz0RMKVT//TJwWqSo8V3irXQdif9zhgOnB/2RWid/Zh4moP5Oq
         F3vw==
X-Forwarded-Encrypted: i=1; AHgh+RreZoTBWe+ACSE/79xtrZuOXH0+W5A06CzVSQiYsV4+WcEw0Ame9SrZ/cfSdqCacsbL0oB9@lists.linux.dev
X-Gm-Message-State: AOJu0YzTbQB8H45+3L8j+yd47L3QCLAtDtSCycC/4laKdIsSYOp7Efvg
	6FKLU0gzRkHZx09A8aQN/0gn1VmCxkrNwpVze0xGrdKA/Q2gE+Nlr+DU
X-Gm-Gg: AR+sD12bai5qPGWh5b0KmlSjiA9KScxkC7G3B0ou/iza3nvvEmr7B+lKRZPpCJFWFvo
	r9An8yErjzlDOfDjho+emyt7hpHBHHSaOMR2ErRfxChUqxL5R17ocI6UsWkEcBnXTDavwf3LSrQ
	iWMCuXHWAQrHMIGv+aCwjFvHpEvxMK1mZJCWafAhN5vF6eiikj2KoDrXxDR1n/NFqSwbTZOYdJB
	lm7AcnET2xSmckbki2IOx2RdKPC25j7o6IJ0r0FB4te0k+g9sbdFe16PnZKZM7WLDu2s68CQwXZ
	LSloGrRyLZXTNL/iIxat9MsaT5VDrVEjbTBYxso05dulgfj3X8EEl62rPC0xAmUy9xiQ2kY6p1u
	A9Q9+u+kH+pbnh6w7tLBBulqTmPjSP6zWmQS8P0eGSvL1U5tyltXJkeHVxXSRj9pi4/4uyQ5Ped
	EnFcHr0kV+eDVrif9Pufo7qPH4NTsoIzc/1Xod
X-Received: by 2002:a17:903:2385:b0:2c9:da58:17dd with SMTP id d9443c01a7336-2cfde868756mr57561375ad.34.1785113946275;
        Sun, 26 Jul 2026 17:59:06 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbda1sm25349585ad.53.2026.07.26.17.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:59:05 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Cen Zhang <zzzccc427@gmail.com>
Subject: [PATCH 0/4] ntfs: serialize attribute-list access
Date: Mon, 27 Jul 2026 09:58:42 +0900
Message-ID: <20260727-topic-attr-list-lock-v6-v1-0-664c5339d9b9@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785113395; l=3228; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=26F1oUpnmZKulFZqe63zZqSGeu2TzH9QLCZvdI3p6DE=; b=E0BP4dTuku/5RKJYvX6dRbYDnm5qmy35N+6yafSTu7rNLZRFfo9DVN/rQoYNbEcHf2n39BJvR PV9cRxXzhteAW+F8GwlHUlpL8GpsbAVgCalCc2M5tPhdBWpGGHfI1w+
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
Content-Transfer-Encoding: 8bit

ntfs_external_attr_find() walks base_ni->attr_list using raw
attr_list_entry pointers stored in ctx->al_entry.  Because other paths
can replace base_ni->attr_list and free the old buffer while a lookup
still holds one of those cursors, a concurrent attribute-list mutation
can turn a saved cursor into a stale or freed pointer.

Reported in:
  https://lore.kernel.org/all/20260702161710.2606853-1-zzzccc427@gmail.com/

This series fixes that hazard by replacing the raw ctx->al_entry
pointer with restartable, generation-checked locators, and by adding
locks that serialize attribute-list buffer replacement and on-disk
persistence so concurrent mutations cannot corrupt state or double-free
memory.

The four patches are:

  1. ntfs: replace raw ctx->al_entry with restartable attr-list locators
  2. ntfs: protect attribute-list buffer replacement with
     attr_list_persist_lock
  3. ntfs: protect attribute-list creation/teardown with
     attr_list_persist_lock
  4. ntfs: protect mapping-pairs attr-list updates with
     attr_list_persist_lock

What changes
------------

Instead of a raw struct attr_list_entry *, the search context now
carries three value-only locators:

  - al_cursor  -- where ntfs_external_attr_find() resumes enumeration;
                  invalidated on generation mismatch.
  - al_insert  -- insertion point captured on -ENOENT lookups.
  - al_exact   -- immutable identity snapshot (type, lowest_vcn,
                  mft_reference, instance, name length) used by writers
                  to re-locate the same ALE after a buffer replacement.

The inode gains an rw_semaphore, attr_list_lock, and a 64-bit
attr_list_gen counter.  The lock protects attr_list, attr_list_size,
and attr_list_gen; the counter is bumped on every buffer replacement
so a stale locator is detected before it is dereferenced.

Because ntfs_attrlist_update() can sleep and recurse back into
attribute lookups, attr_list_lock cannot be held across persistence.
A separate mutex, attr_list_persist_lock, serializes the whole
publish-buffer -> persist-to-disk -> rollback-on-failure transaction
for each mutator.

Lock ordering is:

    mrec_lock -> attr_list_persist_lock -> attr_list_lock

attr_list_lock is never held across anything that can take runlist.lock
or extent_lock.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
Hyunchul Lee (4):
      ntfs: replace raw ctx->al_entry with restartable attr-list locators
      ntfs: protect attribute-list buffer replacement with attr_list_persist_lock
      ntfs: protect attribute-list creation/teardown with attr_list_persist_lock
      ntfs: protect mapping-pairs attr-list updates with attr_list_persist_lock

 fs/ntfs/attrib.c   | 411 ++++++++++++++++++++++++++++++++++++++++++++---------
 fs/ntfs/attrib.h   |  46 +++++-
 fs/ntfs/attrlist.c | 139 ++++++++++++++----
 fs/ntfs/index.c    |   3 +-
 fs/ntfs/inode.c    |  69 +++++++--
 fs/ntfs/inode.h    |   9 ++
 6 files changed, 561 insertions(+), 116 deletions(-)
---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260727-topic-attr-list-lock-v6-f1a909e3c859

Best regards,
-- 
Hyunchul Lee <hyc.lee@gmail.com>

