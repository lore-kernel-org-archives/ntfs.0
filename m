Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B7B2BE65B
	for <ntfs@lists.linux.dev>; Mon, 10 Aug 2026 05:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786339201; cv=none; b=ujwoxNy33wlKfBEaFyep5NSeeQnlxg/VprA2r8THEU/3dt7QmeaXmek1qA3T/eJJYb72UUg28vaTwsYDHT+v9Vb0V8eSb1PdSIhoj/LrdoOJ1oHWIMx3luxBoN4SeSeTriNvKzK2/H2iQT0Wq5nAXPdHW0IsVe20rsOotLsT40Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786339201; c=relaxed/simple;
	bh=kZEXJaw30AewGzSMg2H3NLgJgJBC5Qvz9diP+1NXcRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ai3CRhRRgoBhZ4tkcpSTiwTZG52RYa1IC+bQifX0JFtA41mPhMbpayQavwq9jGCjoqkV5HnXKkYfduvGjqFt28ffl8chGbbjx5erImspuTxPxRJw4lziLivx4N5LHUhM/7g3lJhuH/lPmefMXKThxIlDXExjG80iI+8cvkWXbno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bi2XkjWN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bi2XkjWN"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso11614255ad.3
        for <ntfs@lists.linux.dev>; Sun, 09 Aug 2026 22:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339200; x=1786944000; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWbUjUsCeO7z+PBaYiZsUP8fiRq2bBzVvFTdGBMKdAc=;
        b=Bi2XkjWN3dELueh97Y5AqVfO57KVS+76G6+XXAI//CNJ5fcHh+/Op/JgCJNc9i8pZW
         Rpb38LXGp4aTQVC1ncX25Q1ib1/rr2AcWc7qU+rHkG8gci6s/SMDHTGRiZtEQ9kJ2qF3
         Rl8to/iPUfZYkCG8bB61Rx5uA75xwsIw2huDIMkDBQQsb7OMMpVSo43Hfwpfst5N6BpI
         Dz9qbGy48INBjYuae6/X1eYX/ubRrHhvKvWeduaMJR3VlINvK+s4vo6ViQylxONP3Efd
         rP36lC0UCQ1cuoJplpjz2XcaVuJ8ytYunJB9x+tyXNJCoCxOvdu5/hNe+8naVvpT59p6
         FdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339200; x=1786944000;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PWbUjUsCeO7z+PBaYiZsUP8fiRq2bBzVvFTdGBMKdAc=;
        b=DDoa2QniHjGnys1+jnlZGsnUtKWyQY8JEZScOgDbSYAtWqPBLF03cenOBlA2efAmkI
         eqBap66hYD461zvaf8gNo30ym85SlZquvt8nLS7PKUe1qb/Jd01Ip9ypJB8m0ptI7RlR
         CRBPJLyupfQSTud61nVhFYJuS3gQOd0vylIo4ve3ndxCDfTzuVutU0jYONCS8SQf9WS6
         o/VNjpenCVPg2Hs/24tu9g7One0LYBiIT0oAkRIJVlopJIIAk08QXLj+Kh85wqLsc9fU
         wNfFjA0CE6XDTjwRe8YgTYLOifxEXDYacI8ScCL7unU4QTWv/1v56d0DRwjVoWsnF1fg
         w7qg==
X-Forwarded-Encrypted: i=1; AHgh+RrxZK2nkoP3c9i7ZjIkluboyIvMoWKf91hLLBy+RR2KqKbbWjh6c/eablIrUNaQzIU4kyCD@lists.linux.dev
X-Gm-Message-State: AOJu0YwEUpXnIYFmjtyE8wa4hhZ7XUVYJIPixYug13rSEWJqwj1rrB/8
	0yWJZmSoQmydWeFoW0zl03wpi4hSk3XDSGKXliWkiFygbPScXkUquXkW
X-Gm-Gg: AR+sD12HCZNqA4iRNj/4f3kM54e0JJ1uyic1vGY0LBVtg3ExDVe6lEOQO90cGR82RHM
	rlb5EMjIJbdjUcVSJP7H4QPOfuL0KT71NGaWtqqYctLpN2HHLevRxj1YgYtQX5Jd6Mv/dnuS9pK
	5pRJgDJfy2bIctJChAEDr/lyo1fQHgZO8Ti6qFdSl7s7qoW9mkT2niUfEg2sL22lmIlRmDg7wmm
	Ae5GUmbf/490gopuJ83U/HXIOJ1fXsKzEG3YrKjz6gUyivDCRGbyp1Uu/0nSDtkW3pHB0DYTXBc
	BYMXBHwdO4SZDWRYyGDiYBDm687vOkO3utm34IshaSJROTtqArR6uqhyXPRlov4n6/lme0loCUf
	nOS/ttz6o/vCri8X5eDoylG/+PsL0vZDEAesVJ5qogyv7H15m+1+Cl7pmayqK9B0kT0BoKhhFXU
	6NXgMkPtHiZ52+IRkXUlThll9siVq2Vp/TY5pD1HjByTkfHfDOvInDbHdwOHBOg5vLXHI=
X-Received: by 2002:a17:902:ebc2:b0:2cc:d69a:354a with SMTP id d9443c01a7336-2d2a8eb76e2mr235553535ad.22.1786339199686;
        Sun, 09 Aug 2026 22:19:59 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccac191sm28749235ad.15.2026.08.09.22.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:19:59 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Cen Zhang <zzzccc427@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v6 0/4] ntfs: serialize attribute-list access
Date: Mon, 10 Aug 2026 14:19:37 +0900
Message-ID: <20260810-topic-attr-list-lock-v6-v6-0-e3fb8c4494d3@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4868; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=JmGJ3S97E1dqx9NlJlG+CkY5BZKoBhK+G4G+Qez1nt4=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqeV3UyZCKHrcuRKnY3CzUiYNwAuAuRggR7Xtvp
 c/w8S3ilyiJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCanld1AAKCRA08jD6945I
 0ynwD/9mTkUM0S2SvOhAOgmHnTI0Xdc44Iwmi1oO2Rm3YsNu6UXKtz4azyslT5hyeMgLs8M/znz
 CRv+DvbUPFenLYjzm9PhpS70WwK5kMqtbxPEpMopPgWxmu/AIwqfkrPjc5oDJj5gYfgMU/W4Y69
 +da8RZZY0XMYwfFAEFlZpsWj/zH8LE9hZg4SJdf2YE/VdZXl0Q6uF5ZdfmCEOb49e8kDyBB04FW
 yiqTgjdzGZDLjlXj7W0iZxfJXCfLQ4HraSEKEPbxBbVBUQqOkSucjw/9gaF7fVT6KTzbpTdCi/E
 e6W1cIHfYtpDm4qXplCTGJnUWjXf9l9vlD1kjEwXOEXau2GBiYFZ8e1jg3qzgn0GB8a0vrbf+X+
 BiSoZubKWqzpSTJUYN1TzBCGIulp7BJ84kKZz/AChYqkzPSA8gsoRychDSsHvtO81Fyn2qrbPxb
 bAYj3lgKoMpLKcFYy+OFnkxoO4QsKjJ5WIAnA1O3mmaGfs5EnlmEx7LdHganACWccbEm2cuUocl
 bQurXCJSLq1qEjIltk3vfC8VLPhEnukXq0BPxnvMABOvLfIILOGnSVVoCT1rdHEHniF5gzjC/aF
 jC6ccRNZrFy1B941jzZzuECZZ/kGQ714M7sNEAdTL8f6pIUxVp/X/q+NZ3w471wwAJXyZsBLiKp
 OH16iCjpFX18g6A==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp;
 fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: quoted-printable

ntfs_external_attr_find() walks base_ni->attr_list using raw=0D
attr_list_entry pointers stored in ctx->al_entry. Because other paths=0D
can replace base_ni->attr_list and free the old buffer while a lookup=0D
still holds one of those cursors, a concurrent attribute-list mutation=0D
can turn a saved cursor into a stale or freed pointer.=0D
=0D
Reported in:=0D
  https://lore.kernel.org/all/20260702161710.2606853-1-zzzccc427@gmail.com/=
=0D
=0D
This series fixes that hazard by replacing the raw ctx->al_entry=0D
pointer with restartable, generation-checked locators, and by adding=0D
locks that serialize attribute-list buffer replacement and on-disk=0D
persistence so concurrent mutations cannot corrupt state or double-free=0D
memory.=0D
=0D
The four patches are:=0D
=0D
  1. ntfs: replace raw ctx->al_entry with restartable attr-list locators=0D
  2. ntfs: protect attribute-list buffer replacement with=0D
     attr_list_persist_lock=0D
  3. ntfs: protect attribute-list creation/teardown with=0D
     attr_list_persist_lock=0D
  4. ntfs: protect mapping-pairs attr-list updates with=0D
     attr_list_persist_lock=0D
=0D
What changes=0D
------------=0D
=0D
Instead of a raw struct attr_list_entry *, the search context now=0D
carries three value-only locators:=0D
=0D
  - al_cursor  -- where ntfs_external_attr_find() resumes enumeration;=0D
                  invalidated on generation mismatch.=0D
  - al_insert  -- insertion point captured on -ENOENT lookups.=0D
  - al_exact   -- immutable identity snapshot (type, lowest_vcn,=0D
                  mft_reference, instance, name length) used by writers=0D
                  to re-locate the same ALE after a buffer replacement.=0D
=0D
The inode gains attr_list_lock, an rwsem that protects the live buffer,=0D
its size and generation, and in-place ALE changes. Readers hold it=0D
only while dereferencing the buffer; writers hold it while replacing the=0D
buffer or changing an ALE, then increment the generation. Pointers into=0D
the buffer never survive an unlock, and the rwsem is dropped before=0D
persistence or an operation that can take runlist.lock or extent_lock.=0D
=0D
attr_list_persist_lock is a non-recursive mutex that serializes a=0D
mutation through persistence and rollback, including list creation and=0D
teardown. ntfs_attrlist_update_locked() writes the live buffer without=0D
attr_list_lock, so the caller holds this mutex from mutation through the=0D
write. It also stabilizes the buffer while attaching extents. When both=0D
locks are needed, take attr_list_persist_lock first. Creation owns the=0D
mutex itself, so callers must create first and then restart; re-entrant=0D
teardown uses persist_locked instead of recursively acquiring it.=0D
=0D
---=0D
* Changes in v6:=0D
  * Patch 2: initialize new_al before an early error path can reach its=0D
    cleanup, fixing an x86_64 allmodconfig Clang build warning.=0D
* Changes in v5:=0D
  * Patch 3: keep each in-place ALE update and its persist in one=0D
    transaction. This fixes the Patch 2 review: a record move could=0D
    update an ALE while persistence copied the same buffer.=0D
  * Patch 3: serialize attribute-list creation, teardown, and extent=0D
    attachment.=0D
  * Patch 4: acquire the mutex unconditionally for mapping-pairs updates to=
=0D
    close the attribute-list creation TOCTOU; drop it before creating a=0D
    missing list and restart afterward to avoid self-deadlock.=0D
* Changes in v4:=0D
  * Patch 1: fix attr-list lock/unlock and uninitialized locator on=0D
    the AT_END path=0D
  * Patch 2: hold attr_list_persist_lock around all=0D
    ntfs_attrlist_update() callers and recheck the attribute-list=0D
    state after locking=0D
  * Patch 4: avoid self-deadlock rebuilding $ATTRIBUTE_LIST's own=0D
    mapping pairs=0D
* Changes in v3:=0D
  * Patch 1: fix $ATTRIBUTE_LIST extent double-delivery during=0D
    mapping-pairs rebuild (xfstests generic/040)=0D
  * Patch 3: fix self-deadlock on attr_list_persist_lock during=0D
    attr-list rebuild (xfstests generic/040)=0D
* Changes in v2:=0D
  * add Fixes tags=0D
  * add Reported-by and Tested-by tags=0D
=0D
---=0D
Hyunchul Lee (4):=0D
      ntfs: replace raw ctx->al_entry with restartable attr-list locators=0D
      ntfs: protect attribute-list buffer replacement with attr_list_persis=
t_lock=0D
      ntfs: protect attribute-list creation/teardown with attr_list_persist=
_lock=0D
      ntfs: protect mapping-pairs attr-list updates with attr_list_persist_=
lock=0D
=0D
 fs/ntfs/attrib.c   | 567 ++++++++++++++++++++++++++++++++++++++++++++-----=
----=0D
 fs/ntfs/attrib.h   |  48 ++++-=0D
 fs/ntfs/attrlist.c | 181 +++++++++++++----=0D
 fs/ntfs/attrlist.h |   3 +-=0D
 fs/ntfs/index.c    |  26 ++-=0D
 fs/ntfs/inode.c    | 110 +++++++++--=0D
 fs/ntfs/inode.h    |  10 +=0D
 fs/ntfs/namei.c    |   2 +-=0D
 fs/ntfs/super.c    |   2 +-=0D
 9 files changed, 793 insertions(+), 156 deletions(-)=0D
---=0D
base-commit: 5c244a0e9ca95468f4c2087b2c9269825429a13f=0D
change-id: 20260727-topic-attr-list-lock-v6-f1a909e3c859=0D
=0D
Best regards,=0D
-- =0D
Thanks,=0D
Hyunchul=0D
=0D
