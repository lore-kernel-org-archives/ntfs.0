Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3D7217648
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 00:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950001; cv=none; b=CY+D39kTOZoiRBY4/Vwl55aRmv+IwTYWj+PzfUDmPCyW4SQWcSL1tu1QOHOdaxgR4SogYu+AMXd040rRR4poOAABP8kgdsVxCeJzCgtGkTgLOPEEjv4dF2/nGiZs7rCKGbUEpYOiSOT5jQ9b4mgzEBRDI1lcrF9lBic8M7SllgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950001; c=relaxed/simple;
	bh=KBecPoawmlIPptVv8nrC0SKq91iH+kWw3CR4iuoM80M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ijzVeQl+aUSpZXqNtPPS7SOGGymW4rvppDMCg8AHRYUjtm47Ej7FohEnqQmlbbbM4BuXgHTdYSeHb4GsHZb1aNZVxh/Ju5IkCqTpljzaktCQS4/Vd3Bq6L6eqb0aOJDn3FCUeaB7xv746tEwCZPAHBOWvNSHY9jDvOQHHZFgDek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmQcLpGm; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmQcLpGm"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8692a856865so2246708b3a.2
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 17:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789949999; x=1790554799; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3QZZrMErTwrDKtm5fWgyDyZppnDpZ+oPmQPZEhE2+PU=;
        b=ZmQcLpGmYV6zsGpVSR8swRKg8puT3/5eEMF3q9raUqL2HapPqG6FSFdApL20iaTw0V
         899KS+DpH+S6zJ0yM2YezmB+dAC1wrQV20RxPlvo9ggAdq07pDlJ6S8rQRmNIEUXhnX3
         L25SFxYATuxDOfd0/JIGgaQ0AcHVq33fokGhnqQ2o8r3cWd6hQZCI/snMpr2FhbCLJya
         V68S4FyooZU/Tv4lZKqw4rtBsnlpcRTsg7lX0pvXNkSwSJLKR8iIvItuQPeWSveKqlrW
         jPzZazC2WN8b+uJSp+KMxMFkJ53zlEPvQ+TjYlQ6aoedd9sGJMxDPBpwUH6k3Gcik3D1
         MHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789949999; x=1790554799;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3QZZrMErTwrDKtm5fWgyDyZppnDpZ+oPmQPZEhE2+PU=;
        b=K46hJq47+AoAQwdptTlQqrOAOL/PM5eR9YfN/60OmkGEJxFX9XAuKOuvKBU1UD0hOR
         ZB4zucNuZ6TnwPMZMElD/vV467stXuPW900bum5C1mM55gl8xhN3Fl12/S42tN29yKJf
         jxZkiht/QOgFndVn5qcemn4Or+L6W/FF3F7tlqQiwmEWgSu56GszJgdSqyOx8Mw4jVvn
         06NT9ef3vTdBj9sx/PDWvw3y7maFntYqq5vEDdkF+DHBHbtRctwRYN0l65GTNKDBTgL1
         w9FylyOTsFLZv9Kq+uOiO+J4Pyoxhhq3DmbUzqH0kCr7i/eLDiXEeCATQVYGC8+5N8ss
         0nQw==
X-Forwarded-Encrypted: i=1; AKwUvBxqUxnaL4JMiqUoRHw3jp1cI9CtUtDqrDhCcC595Ov9RO1LSMyYYfKZbXhBNd5SJZchufhX@lists.linux.dev
X-Gm-Message-State: AFuF++lE9WnbJPEgOaYcTYSQCu2TnjcaLFvNv3mbbds8bixplcL/+POY
	QBinDavOk1PfURAse7VDCCpr8UlQENSq4d1+nfGbIBQ2zGD9AgcsDSGj
X-Gm-Gg: AYBFou1Gam4JMtT5Jo1edpTUAVTU4tHMR+u536wTh1KKaKp8+0pwQJz8n7bu6ZNDb2V
	FdPqyBPoQXXQnQk1WG2uRDIAQkYxALBiz7iv7vqgPHEsBXxxlfSDv5MxCyEzQqDFnH0rwmulzIQ
	uqahZPyacysxm8b9cSgj9IqGInwaxsI/ybzPqg92NKVnRAJrYQgd9fl90hjzlkFFtbSwptR9o5+
	97icH6EiyeCwcVTLc3ETj/J6PM5A8zUw/VkbdjLnD6EYyO4JSZFFwpTtOVbcUA6xIgPn99zu2yW
	JglAqc+UT/cO9i9yjePzu9EtFMnwaT+hRPnoVHb5VEeo//QZjLHDDQM/zCcdfTdAnh8po61nudu
	QLmpxie2dcrkCdB54sQLgKhq9JscgQyLkepeIKlNOG7gxCS6IrTKSFUlo24PE9PlqX18amgnm1C
	RIG8H2AfPLM8tuPBS8aHsLxBREltYPfdv4WSEkm1Ds7zHzCE4Nc0auM3649dR+UB65ZwbzAzXIV
	eSNUg==
X-Received: by 2002:a05:6a00:228e:b0:873:f28e:3fa5 with SMTP id d2e1a72fcca58-874dc4eb84amr12086579b3a.12.1789949999257;
        Sun, 20 Sep 2026 17:19:59 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2289557b3a.21.2026.09.20.17.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 17:19:58 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v5 00/10] ntfs: support 4K-native devices with smaller MFT records
Date: Mon, 21 Sep 2026 09:19:39 +0900
Message-ID: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2410; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=KBecPoawmlIPptVv8nrC0SKq91iH+kWw3CR4iuoM80M=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsHfyLPU9r60fRUIhTbAbkaRpdTybjCqX086oM
 VyoBz4BGHyJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarB38gAKCRA08jD6945I
 000lD/4/9dG0I4y324K7bweqhEen+5uOVrCae1f/wmRbJ4gefZBCr2atrQqF0Xbp32vhnIxEKEu
 4Ii1ol/Hmxpm2I1vro2j7V/sxVO41mKNKQiaj4fWfXYVV2YRckye+UvWFHHurTA/htshjjGtR0P
 9DbXEkycIei0zO67tzupkY6jFwf/TiI44TXCjFnNTGL4eP2byWorHAo9mmMZcjRHugk6uhwRcfc
 aMYJOEwXHM4IdPwE110nENDLLpGzOl95r7cBM8hELzlb6cOGSDuEq2hZOdIkG4hnyhItc0p0RYW
 iFhlXXj/qWftkR9VolZq9B3/wHl+TgemeCFzysSHolBVx3ICvJnImQOGFBnLjD0Gn8LRCUu0mAd
 7sSJRa50flsBqDoMVFEjDE6zC24hMiKoD0q2+uKa5RNgxQF8okm47DelUvx8icc6ehc/Q6svYTr
 R0CNVOM2rNT5rmF0V59sXziZ/dp1UktoEtZvLPPmeKM3PDEoiDJ0HePwojnW5Zs3IXRdo2fy9r0
 PssFifVgU43Iv6QyqJjkFIMZcjFg5CK3Bvd8dVmAJbbODZLbLhcp/ZVxelZiwneG/ZBH7NAXliP
 yXCEjaFdbiYVehjwbw+aR7cVrUxHJEISwDyC2nZGHn0qhijx9Pq6xXU4YR/DCFpXLYOPWte+xlV oyOeGMxpD2MZzlQ==
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

