Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DBA17A2E8
	for <ntfs@lists.linux.dev>; Tue, 28 Jul 2026 00:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198686; cv=none; b=Q1/zuNbLCLIR4ORR9PhLuifaz2GIeEDBoZcB+pRzCNDKBJhrdKOpm2tPWr2AQuBBucLH8LrgEQneVC9TvkBxM74VLP1NkSkUhJVsdity6Y8c8jp3VHys4quOpISnvOnwb67bGLrb1kHyfSJaC9fnN83LiK1EVq2OerSFq7f4gmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198686; c=relaxed/simple;
	bh=GgTU21qN++8DM2K21UhUVj8HwU4X7FIJo6RBILPuIIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=amHTt+Dhgz1cQSS2BAk9w8FxohDvw6imIwhYjBh9Jtv/AqRowemRQomwHiEz1MXYVP+tSmDmadBne7jQ0RIkZIj63w2goMzPYecNh13lDlsymITGpIFbJ+in5mrm04jP/CaCODjIBQh66oi1hqSLmvtrTpzJKixw2gyykUmOgTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p4/ZVVF1; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4/ZVVF1"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84861fc51f5so2571782b3a.1
        for <ntfs@lists.linux.dev>; Mon, 27 Jul 2026 17:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785198684; x=1785803484; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8vktFk+O2srUQXaV6c5+4o7E3AyQIIhp5JyQmL1l6U=;
        b=p4/ZVVF1Q0h0r+CE1fs1wZ1yuOS5NIiOXiJ5c5kGYoZa/5w4exg2EeceCrMyDZTiFF
         dO5X7evQvJaDhJvyakAAeRh9RrCdvGGpTrKOY/GmS9qQEP9xaE9p9EBXIqK83jrSeCgP
         0XwtOuiEUMHjzDnEN9FKNusf6GC/Ob66UomJP/OHjt2XnGE1FWyg+USbiU5uCF5O87kT
         XTIP5kBQYDAU5BdDCkhrrLuO+3cOnpt+2sLt9VZfqV5ooXCy/NQeqg7LTnZ4vEodt3OI
         jwzFX34sK56fmLOD/6Sl8yslWJ5DWy9/AprVBaH/sbaz2mZCTNpelEO97g+dZkbKoWC7
         0FuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785198684; x=1785803484;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G8vktFk+O2srUQXaV6c5+4o7E3AyQIIhp5JyQmL1l6U=;
        b=H0hOlL7lWMiU9U9PZZlF8d9bRc2hiHB7tQRNXr4+6vc+KEvn0gJLv/itUhIIfHFG8/
         e+HAWxskCkOPC2aMPMqL9jaW/MRiOH47FQ1mNJksB3FANRVZXqmPbCuieRoYiAn5EYsn
         2/v2FyXCeczZAaDFM4F0D2Ekmb5cQSR9ILroNLROkfOpFiGS10DlwngqdTxQgCGWnera
         En5sP4O3SbfeECYmp3NE3Hkh74mXA+Mci+yxs4UrFkvgbO2RduIPMmOU/RuDHPhAAQkF
         6f32hUr4McnNnHM04ZagtYlFbUg62TlE0/qms7KLuJbIwDFCJLQSjL15+69WSxI3pxMS
         15Gw==
X-Forwarded-Encrypted: i=1; AHgh+RqpM4dYRSELn/axbW28845HVHiWnd5zBP3ONK6nO6527QHbUY+v2X+zAUOaRy2+HR0qYn9D@lists.linux.dev
X-Gm-Message-State: AOJu0YyAuDFBOcyrrjD0dpLZPTQPKo1QHZrWCyakLJwZwLYpUej83bes
	d45m06iIYrCGGx/W6M6yD8BPJvi3FR4WSCQy2JPq8a3XTbp/XKi6ad90
X-Gm-Gg: AR+sD116b0Kj7vERWn5pZ4wpeOvHZGAlxEzd0qNMlmmt0QxBEuXLQ8w9haYxf2jBZGw
	OOd89GwJ6aCHm/lkdc0oQ23HaEDO1CkhuMcopUWJ8a/kpERHaDLx25st8E9jlXpo/DuGFR1kzYu
	IMGw7xk4YhIKuGygeFChioR8kFgZBK1PgSSPHg6kuPVXbjOixvlOwAEz/H/4SLEkmoB6q6rS15s
	uMrhdu6K7kkZ1sSq7Ppr4jKjHJQxOqS7aeS/N2pnM5M49sfnOJBTtHmeOaWD0uEd1SVH8IW+giJ
	+Md6Erw3tGi+JzPULebrfTcRkpZokfjLytk0sumibgoWG0rfUhlSx/DzqYvvkwzULoSVIY2+E1q
	BaLyHT3y6tGXE9GBnIC87XsZPfnne2ro/pNktCCsBVeROLqZvqqLJNcjQSLdFq07A+fsa8Oe9im
	RkfuFChwZ13gvGOhGiYm6OUn5GRfLVGvH6iae3+hvNkPzGh/KryIXnCFk8X0GbO1TmXlGWd/RZD
	0XWGrp2KrxP
X-Received: by 2002:a05:6a00:1d26:b0:848:40d0:1a57 with SMTP id d2e1a72fcca58-84e9339e9d2mr119949b3a.71.1785198684254;
        Mon, 27 Jul 2026 17:31:24 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5327f54esm3571094b3a.20.2026.07.27.17.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:31:23 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Cen Zhang <zzzccc427@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 0/4] ntfs: serialize attribute-list access
Date: Tue, 28 Jul 2026 09:30:47 +0900
Message-ID: <20260728-topic-attr-list-lock-v6-v2-0-270ad764d0a4@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785198351; l=3264; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=GgTU21qN++8DM2K21UhUVj8HwU4X7FIJo6RBILPuIIk=; b=js23YXmN2PJoaXyVCIMgYk2riY0CiCb9c32EYr9ATppoZK6HE+z6Ae3SvVeDADC6mau0K2SWb EB0KIszfbIOBByTQhmWmwL/xVhWmcPCoVYI037xSWdbwZJZ22O+/nPd
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
* Changes in v2:
  * add Fixes tags
  * add Reported-by and Tested-by tags

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

