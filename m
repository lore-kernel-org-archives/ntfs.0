Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2303378826
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 06:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973065; cv=none; b=HI5SRyMw1Y3WBQIciMskSFS0MMjfcehnGoXj6GNcMb2w8dEyUqk06Mv5lhunOatbZ6wWnSmozQJrUKcci4wx+3emzQaBUvHYAryrp5C1P4Q9lS8xo4eCBi3Ysy5zo7DFnk2arO6VjA3FXbG6YDjnQ4zzkvjFE1NAEEQ7X1fJ//g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973065; c=relaxed/simple;
	bh=8mfhCwgN92mmJ0vBvMUplMuJ/DMEexdgZzw/cyPaAdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A1KwWzM4h2aYSFotTKjnKsI5kUQ2nWgDSuLO7EP95wkT6CAyBeCFgMieR9NvzcB91qCkVpN7qrWwE57STW5SgQRhxdlBuZ8xdtPr0FWYxndFB9NfYd7ykAEACySE5I06Lt2wTdKyJWCSOhHFh4La7gR2bu5yX2WkoVa1PGu5bA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjUE1TYj; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjUE1TYj"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd53691be5so24067865ad.1
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 23:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789973063; x=1790577863; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7GMZa0Jr/F9+EvJIeisD0is6+4m6hZWY7dbyvFgCDU=;
        b=JjUE1TYjIrt/Q3AezTu7E1tSJyq35empAEeSaMZoV/LP1n9XHX3WcuM9O44AwxBotD
         1W87juRgURBVvWh/7G09eG1UMYaOdRGjxVa06TuCqEO4LhqUwzjnGqBQBwVgXXXhGW5Z
         OoyfW20br6jdXO33IIlVFAp0PK+q/6vGcpYTTxQ1E1OuHeKd+S9pAdxwfqRv4+KkAKaq
         Fa4UDm+KSoOZzjBLYwn2OGEW8dcvmgpNaxaHopBxYOBwgevkpuwfUCzwDNDLbHRvaoKt
         YvjasradzJU1A213E6+xmM0tvZUvnndZqcYMISgnz1hjVmJ0PkeVLkelZ5NadzG5uZjk
         wIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973063; x=1790577863;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f7GMZa0Jr/F9+EvJIeisD0is6+4m6hZWY7dbyvFgCDU=;
        b=CMt55eOnhh6GAZZlXcBwnznbmsNUfRI2olyWRJ6lKcdT1tV1I7IKaUv3ShsA4lbjsB
         5h+TGAu2K/gon75wCqaQ/fNCdd0fHf3EpTDVX03YMl7u6/HkksDx3P6dtouN7DWF/Emk
         tV4vBLScTI6Fzm6pmamgs/Rq+GSweanbugPF28Bn7Blwd1RWcqldAunXAKdnQsee/SGp
         Od73tTFpKLGZysQfbRwjN8q/N/EBG+ltoNtRyR/4I5gGVu4ii40WRQmRNffV60GgoFaD
         xWG/ud6ZOrDyTRx0Be0lee8EquyL3RUmYMIG9JnmqQ6x+D2L3zow4aTtbUSMcLxm6x6x
         R6EQ==
X-Forwarded-Encrypted: i=1; AKwUvBywgz/xsNQTzczbuU2mX4vomt4giYV1tsCmxYlV/HFf7AEeE/loOWWxrdMaWkN0KP4zmA4D@lists.linux.dev
X-Gm-Message-State: AFuF++lK7gfDu9DHjeMvgCf1sITGWdu3eF4UWo/PLQJKBoZ3kskh/qoT
	lftr2aW5wkTCKt7HdlQoWbz0/hPwF7FwFxTAbcx6YnLOU8tekNxvKLK+
X-Gm-Gg: AYBFou0GG3G+ajnPKYq8BO4kW1IMpcSeYH+TAkYqXc6qpvTtHco19h5NcYOGqlbc87H
	9z9nD7smMLRevA7YG7jyXuN6nE7h0+u1bNk0LUVuDCDR6jFWQMRqVr/ckYDEyufwhV64KqMKgeU
	wkMMDhUuBy95GmkijMt0KLyiXECYqrGv6825v+cXHmbjOjyq5SfhlLhulGWx01UBgKcilsYkyHs
	LR68QMgad8ZRWbetWJMq6Lc8Je/M/VBuhMt6q7UufZWqrdVkZvskton2YGxK/VF+r5sEYtopleB
	WeW/UPWgfPZQdq08Es5H68szaSbDYPxy9BsEMWQjaBeWUypz+TfREKDsceJVJLSZmQb2ukf9HFA
	KjZHneEHdd7zWyKVtHYQUh8bVsbJtl/YigBPElKMgdXIIBU4vUaE4pjwsBYfgZhKxxckp5+5ax9
	pEt8IloiTMTHBaK1h9bsFbZi7OeYe13qrEAdlM7dvPcayBsGqpX2cfl0ll7ouZgxAu1XKl+m0JX
	8ISpw63wZ1qQDINZQ==
X-Received: by 2002:a17:903:19e4:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2ddb1ba35aemr142636075ad.22.1789973062869;
        Sun, 20 Sep 2026 23:44:22 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc180395fsm28097345ad.81.2026.09.20.23.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:44:22 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v6 00/10] ntfs: support 4K-native devices with smaller MFT records
Date: Mon, 21 Sep 2026 15:44:02 +0900
Message-ID: <20260921-topic-4kn-lkml-v6-0-75069f590b22@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2469; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=8mfhCwgN92mmJ0vBvMUplMuJ/DMEexdgZzw/cyPaAdU=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsNIBuT3HGKoDGjnvITONYDR8j3dpdGTV9x7jd
 sgqcHXs2jGJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarDSAQAKCRA08jD6945I
 09OmD/4o3SjDs1FyppJefjyP/w0lwYA/rb8qN7QJK0IaAzMTV6JtKZNXXMoH1zujlsSdGEpN1c3
 wTORPwO9vRiWgtIApJGAmZquJ9gl5rtGwaoJWnQzKRPUBX4FUREQfX26EJGGS/7LLNuqHHoF+lz
 onwPd9B052wsm0PwL5rMsdBIJcssGuYr227xpa8IJofSF8ci/Ddex+wNbVYXw3VmajBkDhk2+Oo
 xYGrEez5kUxkY8J2cXuwvBRKSq5ia0546C6ZgBTWkuC2b0c+/hduyHjZjWyfCCY61Luoug67r3C
 zPjI0QgR7Ey0UljJnbcOwGhAHNj7FZEVQ/fVndRIu3+6/QwBWtGmOBDfj/05bQVno1Kq13nzD6l
 Vu/E2Sy0ZY8uSozgKwustLsJ8lNHbTPpBBUWpLQoGajXTgTNS81wv+O7bFPzzkXIqNSVCPO8s1J
 CKA326wiF7CFR+S+aMt96JrSZTAzzBOVig5nKoeY4K7yFh6Km01vPiQh743Y7VyG1OHnHkh/Q7K
 vjpbnBi5GE0/lDhmqSU3RuM1hi/uP32H3OnwsR8KtNuE+wN20IDZBQTW5O8zpZ4SzsunirnYkiG
 CvpiaC9g+R0nGbHWopk3hTifO/kRBf5ixawn2hV+E99AtQ5mKGHvM8NvmJWQr2Tiog1OFr32GUL W1lfgsJ5VUmRbug==
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
Changes in v6:
  * Add Fixes and Cc tags to all patches.
Changes in v5:
  * Rebased onto ntfs-next from
    git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git.
  * Patch 6: Adapt allocations to the kmalloc_objs().
Changes in v4:
  * Patch 6: fix for the 32-bit ARM __aeabi_uldivmod link failure
Changes in v3:
  * Rebased onto ntfs-next from
    git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git.
Changes in v2:
  * Fix compilation error in Patch 3.
  * Keep valid but unsupported MFT geometries read-only and reject
    read-write remounts.
  * Document the sync-dependent -ENOMEM return from write_mft_record().
  * Add Patch 9, which trigger page_mkwrite after native 4Kn partial-EOF
    size extensions.
  * Add Patch 10, which wait for attribute folio writeback before copying
    a new non-resident attribute.

To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev

---
Hyunchul Lee (10):
      ntfs: read MFT writeback bounds under size_lock
      ntfs: validate the MFT I/O geometry
      ntfs: write MFT mirror data in mapped I/O units
      ntfs: serialize raw MFT updates against folio writeback
      ntfs: track direct MFT writes until BIO completion
      ntfs: write MFT folios through mapped I/O units
      ntfs: write MFT records through containing I/O units
      ntfs: use sync flag for direct MFT writes
      ntfs: trigger page_mkwrite for native 4Kn size extension
      ntfs: wait for attribute folio writeback before update

 fs/ntfs/file.c   |  33 ++-
 fs/ntfs/inode.c  |   2 +
 fs/ntfs/mft.c    | 891 ++++++++++++++++++++++++++++++++++++-------------------
 fs/ntfs/mft.h    |  19 +-
 fs/ntfs/super.c  |  86 +++++-
 fs/ntfs/volume.h |   8 +
 6 files changed, 717 insertions(+), 322 deletions(-)
---
base-commit: 018344e6f5551c5b555e26bd77e3a9304ef122d0
change-id: 20260913-topic-4kn-lkml-8ccfb4922915

Best regards,
-- 
Thanks,
Hyunchul

