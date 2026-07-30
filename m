Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5BB37C103
	for <ntfs@lists.linux.dev>; Thu, 30 Jul 2026 04:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785387399; cv=none; b=IAGeDIUXFM/dwmS5okpuqbFl+gSJR6ZUL+wGrzDz7jyd9nHXAFak+/UJOV/c/vh6ISFw4F6ggnNoRRLKUGtt2G6RLWP4LpdRhzTjswQdCrnk7BpxSfW50z3LqTAAh8GEjfCRToZa048t4ZdR7qvR5e5kppab8x7UO29rMqI7XoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785387399; c=relaxed/simple;
	bh=yX5PtH2UawY/1gFAeYes7DcwALsqUnRXEsWOxC2Pu4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=awN2XP8qncCvLvB8WBSE+bvHa8GcwWR6V4YLbyCqeQleJtBAWg+UgjCwUkY0xrhUFVnxf+5G6MDC+xC4FF3Rp5OTuvCWf8sLUHcFB/b+eTMcqw3YUr0C3JA883bi22clj8rWnSrOFHkMzpnIXSrTD9IAEJSyHOjtn4A/ZXfV9qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqIDhoNa; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqIDhoNa"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cee9b74ee1so14034315ad.3
        for <ntfs@lists.linux.dev>; Wed, 29 Jul 2026 21:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785387397; x=1785992197; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5+4H6ku/KH2GD/roI9o+eFEb2VQbXfpl2sQKxFQu6M=;
        b=PqIDhoNaE14Y/mwOuEnIV5Rs+QNriCYGgifvNPBBUVYRtdXDG3puyUEu/+CQpwss4h
         l7wxLp8l8qKRpDv7CqpUQMDdvJZ0oy249aRDgzOYPjkmaXrFnFj76PQtt5yJ1TdreAEs
         cRte1ICBs9cTIAwXmND3lVZPWw936Tq2OieuSOVB7Dhk0iIJRNvWYKI/03bHWpd0/asQ
         cA+aJ+K5iAzHGIFBbku5tK0JiXsKu8z6VG+JnQRrhLVanc0eu3Asr08W2tnfP93LEU5o
         Sk30GcmBjWnealHjF04KOfQCWdZF2/wJObFURXnCTRcjxOAoseScKjaKsD/b+WlPjj/X
         hg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387397; x=1785992197;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z5+4H6ku/KH2GD/roI9o+eFEb2VQbXfpl2sQKxFQu6M=;
        b=bQI5qcEkSB8sNuEwmhoPLMkNj/ziZATnlALjqIiwsh9CqKPLYMJJfDGYh8ff0BCXVh
         r5DZuTnTg88o5QGqtlK3y2K4ueNqMIT7n3I9ilyRkajY5Ud3cY+y4LMwYIpBIU6q2nlK
         TXGT9w57qKsZS0sl64IWlg0YBgteqae1For+M2RqE3Ik9WqWlD4S0NN/PK60r8yhL7po
         dQEk310H0t3qJ6nsbO7zQc+e5o/ygZ+C4E/j6Zg7JKTfH9Mw1Nyp8gGLqO1lQ847VX4i
         uCZsNDxlFnDP4Eiz4B66/vvbXkQV6LFLXMrS3d9qXx8/rpIgAkxHrYI0AJfpm21HNlSH
         UEiA==
X-Forwarded-Encrypted: i=1; AHgh+RokphZJyyKH/WZ4J8XO9sFcbSNdcM0dRxFOaBpGbIiidhfikpoMYl7mPmwCEwjalZ3PU7/L@lists.linux.dev
X-Gm-Message-State: AOJu0YyepmmGVBxRJ9f+Rs/B95Itv8fDf4vuocjo/JcDyMa0tK3VxAYT
	Uuo0LoIg0ejJa9hSRm7PQ/zr3t3xb2JVBkG0r4mgFucm9SeFaDEElvve
X-Gm-Gg: AR+sD12tdPNO91/Y5rHG8nxsO0Z6YcuGRR10szdd1DeZMalp3ecvWiOxZrWifd8/AtC
	KKygH23xjAWgc5VKQEawoSEfscxCtc23YXwKITaHhnwD3dh3rMh3KHEpSswVhjS3WD+97Chz0ii
	U6nEVDZ36FJP7Q8xmB5WmnufyHBeXkWrRk8kQnaEKTCSdOiul0FeLpq5v4+pGg9G/Qhy5UtnkBy
	ZoHRSEdZDwG3qSNnxtFjVnLNERbfvM/ID0//6v8/HGAZA8zRSoQYveHsZ8ykD1w2FU4D/O8GrAt
	FZj9WS811ZfvIQ3w6Rd5B2lW7LD+iiufmfJzNneAb6d+pIWJmkyFXAAtD32xYnN7MmWyi9Dl7N0
	7af56DTpSuBzjM62BvsXXvnjA0Pbi2bme4J//yuVmeUoXytO7csVP69Ye4tWO0OaPtdv65p/flL
	QhLXRzHr2iR0ee6sC6lOKJ9xUwAq/z8uuAX71FjkWJOEtKcq2ln/WJbi6KTcJPTnkfwNQqxxOvh
	OZsHTmRK8dO
X-Received: by 2002:a17:902:f54e:b0:2cf:9f0b:b560 with SMTP id d9443c01a7336-2d035ccca4bmr12477335ad.29.1785387396552;
        Wed, 29 Jul 2026 21:56:36 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a46969sm19875325ad.25.2026.07.29.21.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 21:56:35 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Cen Zhang <zzzccc427@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 0/4] ntfs: serialize attribute-list access
Date: Thu, 30 Jul 2026 13:56:11 +0900
Message-ID: <20260730-topic-attr-list-lock-v6-v4-0-80d5fe0a6951@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785387323; l=3936; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=yX5PtH2UawY/1gFAeYes7DcwALsqUnRXEsWOxC2Pu4g=; b=kfF0Sz3M6AieBmg0Fg9eoO0JGRneX3w0tk5A6KW25WUPpoZD8snQA/yjsP/5wWPOqLs074pcC 0Ey9tdINThGAP0qCrDOxk2Uz7iZe4kwtu6tygyNie3gXYEK3S/4DvqR
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

---
* Changes in v4:
  * Patch 1: fix attr-list lock/unlock and uninitialized locator on
    the AT_END path
  * Patch 2: hold attr_list_persist_lock around all
    ntfs_attrlist_update() callers and recheck the attribute-list
    state after locking
  * Patch 4: avoid self-deadlock rebuilding $ATTRIBUTE_LIST's own
    mapping pairs
* Changes in v3:
  * Patch 1: fix $ATTRIBUTE_LIST extent double-delivery during
    mapping-pairs rebuild (xfstests generic/040)
  * Patch 3: fix self-deadlock on attr_list_persist_lock during
    attr-list rebuild (xfstests generic/040)
* Changes in v2:
  * add Fixes tags
  * add Reported-by and Tested-by tags

---
Hyunchul Lee (4):
      ntfs: replace raw ctx->al_entry with restartable attr-list locators
      ntfs: protect attribute-list buffer replacement with attr_list_persist_lock
      ntfs: protect attribute-list creation/teardown with attr_list_persist_lock
      ntfs: protect mapping-pairs attr-list updates with attr_list_persist_lock

 fs/ntfs/attrib.c   | 472 ++++++++++++++++++++++++++++++++++++++++++++---------
 fs/ntfs/attrib.h   |  48 +++++-
 fs/ntfs/attrlist.c | 181 ++++++++++++++++----
 fs/ntfs/attrlist.h |   1 +
 fs/ntfs/index.c    |   3 +-
 fs/ntfs/inode.c    |  73 +++++++--
 fs/ntfs/inode.h    |   9 +
 fs/ntfs/namei.c    |   2 +-
 fs/ntfs/super.c    |   2 +-
 9 files changed, 659 insertions(+), 132 deletions(-)
---
base-commit: 985e0ded13bc51da8d5eba3a3bad1cb3ffb4870f
change-id: 20260727-topic-attr-list-lock-v6-f1a909e3c859

Best regards,
-- 
Hyunchul Lee <hyc.lee@gmail.com>

