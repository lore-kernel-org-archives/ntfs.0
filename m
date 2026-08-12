Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B705F2989B5
	for <ntfs@lists.linux.dev>; Wed, 12 Aug 2026 01:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786497508; cv=none; b=B5hbuQbOlg5ep2v3wk9AVgiGDm0LuJHLvYBHTom9zpwhiIe4oO4wTQBU06Q8d8wjpWrT3zHdhnhjC0gV4HVvcI1JZ588YFuhIdLxy4c+TtnRUzEggUk4fwNTkGzrZFIyWsJIXXII3falZm2zdd1V/ytv7tuYgoCRDky8rQMFSN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786497508; c=relaxed/simple;
	bh=Wdhw1zwE9l/bQZd/vhd9EYGVpya6VNWz+Q4H1ySiSzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IFpBsg0EQTAhVhdcgEffbqaD8gyn+LBhmIH10UVxiFIns4vQr9Pmm0VEGNSPPs2ozCoMNrANM/oeKL50z0nZNYvEsx53q9VU8/ab7/3Yi6q+CNSeicROi1a7nSlZMhsq9fsOKi0MUs8xAnQYySwPnV/+xHbBs/Do1qHVMKYJv30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmW9ZNuv; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmW9ZNuv"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so506439a91.2
        for <ntfs@lists.linux.dev>; Tue, 11 Aug 2026 18:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786497506; x=1787102306; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oVlkLHR9DmFApbbVRsS9p6t+mJPU1ldTTCcNPVFXM0=;
        b=NmW9ZNuvIHg50aDNP9dD6ySoopUuZTIb7zyRqSBKTligLw0C7cc8NPwcEzK39vsR1X
         jZ4I+sBkp2m4+FmY+sh3gMLuK9jkl0FLrEDrfKCMfLPdn98EGwEGtvdH57rqg2TnEKcD
         dqjgrFSjRRx/QI4Q/TG0bpzzUOmxETNgvZri7U/F0P+1o7e4fMT/QRkKoD7CIo5zRSpF
         RQVBGry9W0BW+pgANWowiBT0GPsjy5TCDGEhBS4KirtQcCz3781N5klyuMOKacnSOxlz
         b5Z5EPNIG0XJ5+H9pT41XY5j95JDqxTWeE0QOZG/govtSnEKguGpQ5KN1347jvvl+yqO
         0Eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786497506; x=1787102306;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8oVlkLHR9DmFApbbVRsS9p6t+mJPU1ldTTCcNPVFXM0=;
        b=iRjr1iFlxtqFgs2mhF77XV52PQpExN4KRCR2oh1hYqnam4jVRbNCIp36BBbywI5iWB
         JWcEOIpTiAh14GUNnFvCIjDrex/lMdFWx0Zeihn/C81azMroZmdvrlZs9gTyYSvAQiKa
         S0aOP+1wpnOLKPgZaj4BGunPk/pSqZpKvz0vHDI9oMxjHk+FfJqLklYge6wCqbWxo8aD
         P9XwOLP8lyJ7aG36FeIH11lxfEshvYF+txxpsG1bnAAeh8F35HdVaMDFCCh4MKcQfWdk
         rsVl6YB1okGhvmgC6coAWGW4QnwLqTo2cNPJf6xgZ8l0k16XYFc9hOBjzM3JV7QuS2qZ
         uuSg==
X-Forwarded-Encrypted: i=1; AHgh+RqfZ8Whp9gv5CHL6KaPbZzlUSxkUI6mmL9lFL6FsBgeabv8igO8U7o6LuHSpfBWSYHce6Ow@lists.linux.dev
X-Gm-Message-State: AOJu0Yw22K+hJywQKmYQ10rDMrmbCMzC7Xy0h8LbVCmIfSYFWkmzkwzh
	IAx24ctbVXZrchIPXhP1e+W9LKkejbhjZU4CY8/21j/uXeOlsSoZaWjR
X-Gm-Gg: AR+sD11IR4JjKCMYUj7T8dNddb/2rh+C6kHApfE2so/njouksic3aAjF7iZUWNIE5+9
	CvR1NNv1nZ79msws9QTYMaORBGVxrfIub/asvlVdXJMxycU5s5lnOVLZpC+3XjcjLCDWUJfSCLR
	OMmArkuASdgmcnYZyonHNAoBjpoCUzMawje9FfMoMVMhbvDPJarpIAZX5aRE4e0Ef3MZrL5gQQ2
	xgPCvJPKNh8W0+UX2t23Vk2ufpS0wTRKJo0z+1vd7oviw+ZVNmQY6YffgULVLpOkIB3wmu46mVs
	tbzwSSppbkTDqeMolyhbQ07STt+9RDtjpNODCiAFoHJ4RimkNmpmrYnziUkFsyWZE4Mxx+GVyxe
	hZcz5NfF3IB0p48FAqRKfqc/oRWuKMoH8E9R3xgDcoElfZ+kVWrTjPHZXAf7NmXEqJiQZvoYbSq
	dg1UoqWJKcl8pFSiYluSlGEJh21319vA4ng1VUOD+knxNyi8oi7JE7CZkCs34nDYAXCL0=
X-Received: by 2002:a17:90b:3cc5:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-3930128b3a4mr1454692a91.8.1786497505954;
        Tue, 11 Aug 2026 18:18:25 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f8901c1bsm1549721a91.8.2026.08.11.18.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 18:18:25 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Cen Zhang <zzzccc427@gmail.com>,
	Copilot <223556219+Copilot@users.noreply.github.com>,
	stable@vger.kernel.org
Subject: [PATCH v7 0/4] ntfs: serialize attribute-list access
Date: Wed, 12 Aug 2026 10:18:08 +0900
Message-ID: <20260812-topic-attr-list-lock-v6-v7-0-2f35e0a38bfb@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
Content-Transfer-Encoding: 8bit

ntfs_external_attr_find() walks base_ni->attr_list using raw
attr_list_entry pointers stored in ctx->al_entry. Because other paths
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

The inode gains attr_list_lock, an rwsem that protects the live buffer,
its size and generation, and in-place ALE changes. Readers hold it
only while dereferencing the buffer; writers hold it while replacing the
buffer or changing an ALE, then increment the generation. Pointers into
the buffer never survive an unlock, and the rwsem is dropped before
persistence or an operation that can take runlist.lock or extent_lock.

attr_list_persist_lock is a non-recursive mutex that serializes a
mutation through persistence and rollback, including list creation and
teardown. ntfs_attrlist_update_locked() writes the live buffer without
attr_list_lock, so the caller holds this mutex from mutation through the
write. It also stabilizes the buffer while attaching extents. When both
locks are needed, take attr_list_persist_lock first. Creation owns the
mutex itself, so callers must create first and then restart; re-entrant
teardown uses persist_locked instead of recursively acquiring it.

---
* Changes in v7:
  * Patch 3: serialize non-$ATTRIBUTE_LIST removal with concurrent
    attribute-list creation.
  * Patch 3: initialize successful removal results and release
    attr_list_persist_lock on every early creation error.
* Changes in v6:
  * Patch 2: initialize new_al before an early error path can reach its
    cleanup, fixing an x86_64 allmodconfig Clang build warning.
* Changes in v5:
  * Patch 3: keep each in-place ALE update and its persist in one
    transaction. This fixes the Patch 2 review: a record move could
    update an ALE while persistence copied the same buffer.
  * Patch 3: serialize attribute-list creation, teardown, and extent
    attachment.
  * Patch 4: acquire the mutex unconditionally for mapping-pairs updates to
    close the attribute-list creation TOCTOU; drop it before creating a
    missing list and restart afterward to avoid self-deadlock.
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

Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>

---
Hyunchul Lee (4):
      ntfs: replace raw ctx->al_entry with restartable attr-list locators
      ntfs: protect attribute-list buffer replacement with attr_list_persist_lock
      ntfs: protect attribute-list creation/teardown with attr_list_persist_lock
      ntfs: protect mapping-pairs attr-list updates with attr_list_persist_lock

 fs/ntfs/attrib.c   | 568 ++++++++++++++++++++++++++++++++++++++++++++---------
 fs/ntfs/attrib.h   |  48 ++++-
 fs/ntfs/attrlist.c | 181 +++++++++++++----
 fs/ntfs/attrlist.h |   3 +-
 fs/ntfs/index.c    |  26 ++-
 fs/ntfs/inode.c    | 116 ++++++++---
 fs/ntfs/inode.h    |  10 +
 fs/ntfs/namei.c    |   2 +-
 fs/ntfs/super.c    |   2 +-
 9 files changed, 795 insertions(+), 161 deletions(-)
---
base-commit: 5c244a0e9ca95468f4c2087b2c9269825429a13f
change-id: 20260727-topic-attr-list-lock-v6-f1a909e3c859

Best regards,
-- 
Thanks,
Hyunchul

