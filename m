Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39C825C818
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 04:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261581; cv=none; b=W3ozWfv+SWpxXnMKxOaKzARkHHk8+qlULO0Re7tsHQCsNSPI1AfVO0K6qnRkzLy7rS3vd42idu8YZyB+gEN+W1u0M9LidF1T2cJPKOK5CC6fvRqjGFr0q9DtPL47gG5fJPmbx8VRRLZGDCowzB11T7bEdggKKFZaffmV8XWYx64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261581; c=relaxed/simple;
	bh=5JD7+ZPhDwA00jru4odz0jKm6WnDEO3jxLkH4Krzsik=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DQZMJhcxBxEE9uGltFYffVfBYszxFs0EvuE4SXebB9wa40UN3hd8uwdexRdEUhwYIIOBLuPvck5tTNXeCgEoFyD1f9dMqfnp7Oxkvyj+wbmJFUEs0C5iR/WTINwR342QXRaHmYM551L/u5i3NDRq3YKlUaoCo4Nr6cexA0COxpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5MgBwHa; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5MgBwHa"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so1898855e9.1
        for <ntfs@lists.linux.dev>; Mon, 05 Oct 2026 21:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261578; x=1791866378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMg3LguqBid646gbp/lD4TVtZRPBVzY1g5dVVWP8Yvw=;
        b=l5MgBwHa21EQik6Kp+1o5WDGz5Oa5kslt3qXs/bDpxbkDy2NH+e/FgC7ZTzRdlOT3q
         nF3jXx/a2RORksvz3F4cRJ5UAPJObTVUEykau47JQmspCQ2Y50HmEeHNZCyqx5n5PP6W
         vp/u0bLWj8ulp3IVdAcyxvpMdT4eiiFkKMWvVX3k/jxFmWVcLKC0Zic20OQlr3gmOTQH
         tCKjnbzvRW6nysqmAOGr3hZhopDM94bBU9eQnnfsQuMxRDu1IMiKraYGEngxfxlnVkij
         7OMfs0mJYPCuxOQ9qV672JjRfJ6UR+Mcstp/4g7oNG8go93kr40gT0kxuzzDRZwp4jX/
         Ae3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261578; x=1791866378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMg3LguqBid646gbp/lD4TVtZRPBVzY1g5dVVWP8Yvw=;
        b=zjBtNXPxSzjzgp5rQPtUHKoNIz/MUtg2qScrXfoeAOkkEp+VhznMXA5Bt5QooksF48
         qsBbFNiel11ITwJQGK32LNBw+CSOdgtw0Tvx2UOdorgEC+CNgsb/RL6QAiZyT3PzC169
         j7ai7fb0tdz/Bro1bPHMyvn4QwVIlHaOhM4DSCtcByNqv+Z1WyrpWJhzcFT++LsZ0VX6
         XkV29lWQNBx9XZLJeTem9BJ7mFHHwsJN1+ouCkh+i2dTqs3QssJQLvR7V2owiTednk6E
         NuTILsYZ1hQoBlXnxWjPkUWcAIofEmgqz3vH/TWACJSFyFaWols3M+swO/RcRu0DWw0I
         AmUQ==
X-Forwarded-Encrypted: i=1; AKwUvBynBYsc2npjEddF0gmZUytKU++IfherzyJHjd5u3QjG/BH0Kcv1WAnNnXoLuHW5FHBOT+FH@lists.linux.dev
X-Gm-Message-State: AFuF++lnUKhrY2ajStH4Qj8N6c/yNEK6PtBHPxdX3DgKXKk4jK7xbcWj
	8P5BBhfsne50YZWsfVNgWNZXQ2iJ5THSc7BdoEzhSJ67xh6+vp1lvumc
X-Gm-Gg: AYBFou2eaT+Tv7tRiRxZZflXMD+LZh0waq6Klu1itURFEEI73gvjdlmo2Yd0KWYWI8v
	H9U7V90R0BukcMowVpbCtvl25yS4Avu2T6+K/kIPn7dygxQNYsZsy04EnwJn31Yo7w4sPtJxnfQ
	2l6Mrv6kRsJ9sVEdvOwRSAAEOD0rZuL8/v0sA3o4goJu0NAE9Yzk6WVFqzJfemvGhHajdgjckgt
	kbTJoyClLG26jwRXmLNjOM/aQpjQ925ZK+6w/jI1PEGuw9h2zUagzRgsSfup/DIVmM3fGvTGcu6
	9wU0tjZSiD3r0baFDvgtHvUXP+ZfnWLi9ljr8r9EZqKLmzCMcN+ehRddvO8ZnlGy8FyFIQ9QLBB
	DTZF8EirF03b1s1SS6LHwGMEylWTXlMoomYjsxye+YR0pYUcqwjxdDokYPAHc1rb/JTDcqoa06A
	WEySXC2xE0t5YagD3XwDRUEAsGQ2W9AplnEUuTe3Si6WP9yQoWvIsQeyDDgMvVHOzbTz3qE5M9D
	wJf9LdOrL46KrFNx3hCf37dv6S+S0AmE16e9/+SlP66VYPXyQu/9MqsH+18WgEnAcrWimyVCmZw
	oTM1PhqmiHFlmkwdBf7KSDuA5TYwP7qwbFE=
X-Received: by 2002:a05:600c:848d:b0:4a1:71e5:9420 with SMTP id 5b1f17b1804b1-4a17b53c11emr3202545e9.13.1791261577688;
        Mon, 05 Oct 2026 21:39:37 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-040-097.95.117.pool.telefonica.de. [95.117.40.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db8c6dsm62744995e9.14.2026.10.05.21.39.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 21:39:37 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ntfs: fix two kmap_local bugs on 32-bit kernels
Date: Tue,  6 Oct 2026 06:38:07 +0200
Message-Id: <20261006043810.5393-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two kmap_local bugs in the mount path of fs/ntfs. Both only show on
32-bit kernels with HIGHMEM, where kmap_local_folio() hands out fixmap
slots from a per task stack of 16 entries. multi_v7_defconfig enables
both NTFS_FS and HIGHMEM, so the stock 32-bit ARM configuration is
affected.

Patch 1: check_mft_mirror() unmaps pointers that were advanced past the
end of the page. On 32-bit ARM this clears the wrong fixmap entry and
the mount dies with a BUG a few calls later. syzkaller found it on a
multi_v7_defconfig kernel. A fresh mkntfs volume reproduces it on the
first mount.

Patch 2: ntfs_check_logfile() maps the same page once per loop
iteration and unmaps it once, so a mount leaves three entries on the
stack of the mounting task. After one mount the CPU it ran on can no
longer be taken offline. A process that mounts ntfs volumes five times
hits the BUG_ON() in kmap_local_idx_push(). x86-32 also warns when
mount(2) returns.

The two fixes are independent of each other. Patch 2 was tested on top
of patch 1. Both were tested on 32-bit ARM and x86-32 in QEMU. Details
are below the --- line of each patch.

Karl Mehltretter (2):
  ntfs: fix kunmap_local() of advanced pointers in check_mft_mirror()
  ntfs: fix kmap_local leak in ntfs_check_logfile()

 fs/ntfs/logfile.c | 11 ++++++-----
 fs/ntfs/super.c   | 20 +++++++++++---------
 2 files changed, 17 insertions(+), 14 deletions(-)


base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.53.0

