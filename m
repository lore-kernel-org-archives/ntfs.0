Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E75F373BF6
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 06:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786048; cv=none; b=Sdxltg0z/9cHU2N7g3DWNQs+YLDV8j+nO/yYtI1d/7RHwMAcIlXIZl4MiHqT0r7HCEl73vOXtuYQdTV1W1BHp7RsfTB73zVRyriC4UXNKARYc15LKkDbhSlm2OSLqczcC97thy5t4KDfstbmjSVO6keznvvGLXMlBUsd22PZLM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786048; c=relaxed/simple;
	bh=KjaORzNmIC0hbf9pMq5xRub4erK67RsKQRLJdDK1qSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T9p0Tc+3c1yxkxc4DYVMJvOYY0qC5vJ7PrBcwrB3gL7fXyO4Ee5BLDmmCpwh4HO5z2QOM7tv5rlaeMeNdqa70zAZIgAwjgqLHPIs4YSvA58+/7G/Hb6stEpAAAHl6Kax3e+ca3UJMKX7F290gYV8/nlqIwHmvdCdPtaRbg7n5pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hn5nZB8Y; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hn5nZB8Y"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso389513a12.2
        for <ntfs@lists.linux.dev>; Sun, 11 Oct 2026 23:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791786047; x=1792390847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilUEX6P5SXdjM30xs4/YiTd6UosFP69OH0rOy8mkCZ0=;
        b=hn5nZB8YOZwJmnzVpfM81H8cbe4l/KvrNgjk5CDFrmvXGX0VqqoaQ4+mA7Zo8M2qfa
         FsQ9UXXId8ZJYEI4CoZj6hfJ74KTkObsHUhz6nudLtBHTdxyGXDnwOdwGSvNRGSIjoCw
         LdFnv1lEZqXdaQd3tfCdO0AoyX65EqwlMkF+FQhVgUs6ypmFfy4MNcCMkWGbTzNRkNoQ
         WVCnMAB+xBIKtGhGgsZJQtLRwRXUrlpOZxp/jAScSQl9Bsqm6F14sgqyATtkNby/NQBq
         DKsct38abJAkV/avTx3fyubVghiSInQIoFrO/i7I+7jaxd305vfPQzM5GzSbd5U4zlLe
         SnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786047; x=1792390847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilUEX6P5SXdjM30xs4/YiTd6UosFP69OH0rOy8mkCZ0=;
        b=s7xvaqIzgfgVmB4tZ8iNKab/OZfc98asPJ7FmXUcqlnNbHXpwP6cW8NjhkFA6yCRL5
         OdnIdCp/YJjv7hltGdzkWemrqjuyTsDic1ejKYOyrTxrWlNFD5NF7pxbuwPxTS8U5mRg
         73ykqBm6GFHp7W44fhfOb1yPFqhUdapXtpy46ItLPaO6+3R8tXrWnnPzCzP02Peb1faF
         084Z/XGcJRZUTXvhSRWxN9UBuKjBPZqB/xxQEmW0FRFlOYpue+TL0/IZlZCkhIUb0+/v
         Ip19rdgAeEB8vADy3MNVYaqv43gkiQCojRgf23hIJK57ZpadW97Tks40rc3NzgNgScPY
         eoIg==
X-Forwarded-Encrypted: i=1; AKwUvByBsEfOKIfSWX6HSjxpUy5e6xK8KgE8KmyW/HiI/u/T80N0/FmvZdIkM284IEeFr0/uSnGF@lists.linux.dev
X-Gm-Message-State: AFq9FYIwjrXGbw/+be1Ed9BZLPr0wdYFwuaFLHRxe5hAD7qFzVqpHeTD
	3hTlpNFBc2E9ud3U3n9IYievr2LRqDsLR8cyogkPULC/Sgq3jaWZVDuD
X-Gm-Gg: AYBFou3PmAAJR2zQo7bpdzpgV1DhB+Vxrs0vVV6/ArUgCdr3mKpryknbf2rSvS5Oq4e
	l7Evt/Cce9Ses5Waz7CweYp+o/1BvsBcpr8WFE0GD2p4Tf3UArChu6efodG/dlyB8fO8B8radbp
	G3ZbvwlzmOLB2sFXoUZdhWXnNQKUOd8oiNcpayOkYJ/o0BgG5vKBYRwdmrmEWvzs3lj32YNc3QL
	zjEnKAQD0mxmvdDtZSYAMZTc+FKHa3I17z844HbVWUDIxEa3ko1oGyFCyai8HfPbfR431OQvbDa
	GeXCWjnHrVgIExotn6+Cdg4Qq9scHC5OvufFqCKE4ppYiLQHCPJ9675/XW655ajdEXdCV6AnAS5
	0UKSHccQAOrTPirUK6Z/pw6NaiIYQMkhFn1zdq+ExRq1+WHscASEcFJ+dh72akUbjjWyQ/qGiB9
	24IBrEr7svVtnvQt488ID/FFQJ8sCOJYuR6/5F4eqLO5eiK3PDXuWRH6juHn/yEaql/DauyJXml
	01+91LLq5Y=
X-Received: by 2002:a17:90b:1e47:b0:3a4:ee64:b82c with SMTP id 98e67ed59e1d1-3ab3b06bb4bmr6635992a91.66.1791786046779;
        Sun, 11 Oct 2026 23:20:46 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d93c2c75sm3990091a12.0.2026.10.11.23.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:20:46 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH 0/2] ntfs: enforce the encrypted-file policy on the read paths
Date: Mon, 12 Oct 2026 14:20:38 +0800
Message-ID: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

EFS-encrypted attributes are refused with -EOPNOTSUPP in exactly one
place, ntfs_read_folio(), because decryption is not implemented.  Two
read paths get there without passing that test and return the raw
on-disk ciphertext instead, so the same read returns either ciphertext
or -EOPNOTSUPP depending on which path serves it.

Patch 1 is readahead, which marks the folios uptodate so ->read_folio
is never called.  read(), mmap(), splice() and fadvise() all populate
the page cache this way, so one test closes all four.

Patch 2 is direct I/O, which bypasses the page cache entirely and has
no such backstop.

Both commits are in v7.1.  I have not added Cc: stable; returning
ciphertext rather than an error is a correctness bug but not a
privilege boundary crossing, so that call is better made by the
maintainers.

Found by reading the code.  I have no EFS-encrypted NTFS volume, so
there is no reproducer; the paths were traced in the source.

Zhan Xusheng (2):
  ntfs: do not read ahead encrypted files
  ntfs: reject direct I/O reads of encrypted files

 fs/ntfs/aops.c | 7 ++++---
 fs/ntfs/file.c | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)


base-commit: d6d3455d8751854e0d1820f14184682e23ac4475
-- 
2.43.0

