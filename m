Received: from mail-pz2-f18.google.com (mail-pz2-f18.google.com [74.125.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3768F49B218
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399326; cv=none; b=gxRsTp16rvWqUkU8UfAYU2/pfjunjyIFEqWRFbLtK5/kXfD2NsXV/x4ShiQTJD3Lm1KgqrpvanAo3Bo0w/oFbeu0irUKd70B+mKBoCMUqEOAcfoclPfa1zhU4uhSh2CfI96AKO2WmRU6yOKfyy+fbeONQbm3IIBap8SJV/6+BkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399326; c=relaxed/simple;
	bh=P7yc0nLbJCjA9ro5oLJ6i6IKL4Onq6Cmbq1Uct0/WKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u4qC84menVs7/UvrGmL+dwTHcl5KMXuO8PISZO3wXJnbhOtZpgRKVTj74Nf/jiGdW/dMV/WRKPKnRgDZtotV/vuuTXyOluSD4XWEG4o4dO8CvIMQhHi8sqiWIS+l7IC+2k993DI9x1mjd88lgeY8TdElma1KbmoMx4gu/aFlrGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4+pNaj6; arc=none smtp.client-ip=74.125.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4+pNaj6"
Received: by mail-pz2-f18.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso2139116a12.2
        for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 08:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399324; x=1790004124; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gv/dU8fg3byPLWi7cbWbkkSr2mxs9ztephTi7wvfr6g=;
        b=U4+pNaj6Y7iF4RHNWo8RVGwvsiBj3BQwkdzREaPWnwgubCE3k1Ro4wrP68tXvi5y4n
         bocjGSDxdw/xEzecU4ML0iqefWAAoTvdqQxi6LxJpB+jheU/AhBhyf9SrnpWhXFN6COr
         IExUHsRmJUeDBrc98AkZtRtc/m4A01jwDrgiZlytVZGhQOiiht21p7w7HLHaGXOoskRo
         fKulO/tnMix3MF/S4RCgHUYZwNH2FEUDMZWF5tY2ECuKUEVjVCntT6/1ofaXuFk/ILfa
         SHnYYUH0pzya5KMy8btvx1P/oJ6mOzvP5b7nldYSLhDcgAE4NFN5zrOGUo8rCWtkJrL2
         7WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399324; x=1790004124;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gv/dU8fg3byPLWi7cbWbkkSr2mxs9ztephTi7wvfr6g=;
        b=cz0YOU83jXoBVhiniUwuwYJ+xaBnTHnHavgy9k38zsJjgwhTWncsOsRM7B+ZXPgOAR
         NCfxeaWuL+GMpGMiTWzRHmez0WtQdbKb82aMYLXv2b0L8hNJy0pDZnfaa+V5qDg8LhR3
         dwT/9oGgK+fYsqdvvMRctEgB9WDb82Pu1ElR3BBN9vvX6NE1Mw0BUXu7m83D8GU4kva/
         LyEZTPF8QAwJObgieZjvows82LfY6RWeTSmsXA2RInWQbg87XgZQ2+c+PofMvrM/p3kk
         ooDB/fTS3sACEOx5jgggqxJeHvkS/51clhzfNB7PrpU3HJuqT2G6fXruZW1SGqX4dqmy
         HxPg==
X-Forwarded-Encrypted: i=1; AKwUvByb/2kVAgUKEZ7Txup7VopKvTONq56TQNA9niR32am+YdJ/j6Vmbmp1UdevWCKMxJ8Rw9oo@lists.linux.dev
X-Gm-Message-State: AFuF++nSabspJ/XziTIv7ai+fy+lmgaAI3IrujA69wFv4+Bq9E6KFqjt
	5v0xtPknkP2gjVtJ9b6FTJ/LvzjnBpENTB35/YHC004jKXlaxlZ4a2XWgRb2KQ==
X-Gm-Gg: AYBFou1EzWElolY2YKldTB3KtbR7wvBbmAyNnR0yKHPXlP3LNtmuTqvkqzSqq59ZRn9
	In6bGVsDZPRtvYcLRismibsm32hxzNrJHbCb9vL7z/yuq/xEbo8hqy/Vs35eA1VhVGGFVL2B6Md
	PwQD9Sa/2xMG35jV65b8zQjmYP/zvK/ATT0TT8vReQLb0kLUSg8srpK2mw9tkW5VW3g/PKRtz4/
	hE+9OMB+LPOfHcNBSkW+uwJAsFSj9sSO33NTzwGiAHH0QmWWV/x7Xv3fVu9Z7LVrUjAa+BQPqIh
	L/Rgoqnk5EDn7bn1cLX4IJRw09B/n7hB13Va+nurU+NsNftD785IeBQK9Wr2mQbO8RWn7n/d2YE
	uY+0rop7bnodxoJzRL5y6xEMUKQXfQP5Xa/TCM/wL+VLqJG7Ax+1NfGp1gmGI0W2LQ4wfZR9AEK
	ktCwp0n6aEAQjT/U0Ko2C3dfDZiL9Se8rJcOtRulgcxHqtmr12lm/x7XRjep6ghZeHEuwP1u03a
	qAQy1DAIHaKoPqs0qWClzaR
X-Received: by 2002:a17:90b:1dc6:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-39dec09cf6dmr6373864a91.18.1789399324253;
        Mon, 14 Sep 2026 08:22:04 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd6cd982sm31667a91.0.2026.09.14.08.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:22:03 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 04/10] ntfs: serialize raw MFT updates against folio writeback
Date: Tue, 15 Sep 2026 00:21:33 +0900
Message-ID: <20260915-topic-4kn-lkml-v3-4-447cfa17f780@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915-topic-4kn-lkml-v3-0-447cfa17f780@gmail.com>
References: <20260915-topic-4kn-lkml-v3-0-447cfa17f780@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789399242; l=1312; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=P7yc0nLbJCjA9ro5oLJ6i6IKL4Onq6Cmbq1Uct0/WKA=; b=bmU4AiF2wwy1QSvh3ibFrqzTLqLRRsvibMpk59AroaYUk4T7gJGeTKRF3FkprJ1CPEcftx4hN qMIdqI/DhGAC/2tKO/28KNM07HHzHFP/hq6iTiLijEqsoSKO/aqVfvg
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
Content-Transfer-Encoding: 8bit

Because MFT folio writeback can remain active until its asynchronous BIO
completes, raw MFT record formatting and allocation must not modify the
folio while it is still used as a BIO source.

Wait for existing folio writeback after taking the folio lock in both
raw MFT update paths.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/mft.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 955b1f9ab372..75945f89cd0c 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -2022,6 +2022,8 @@ static int ntfs_mft_record_format(const struct ntfs_volume *vol, const s64 mft_n
 		return PTR_ERR(folio);
 	}
 	folio_lock(folio);
+	if (folio_test_writeback(folio))
+		folio_wait_writeback(folio);
 	folio_clear_uptodate(folio);
 	m = (struct mft_record *)((u8 *)kmap_local_folio(folio, 0) + ofs);
 	err = ntfs_mft_record_layout(vol, mft_no, m);
@@ -2539,6 +2541,8 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
 		goto undo_mftbmp_alloc;
 	}
 	folio_lock(folio);
+	if (folio_test_writeback(folio))
+		folio_wait_writeback(folio);
 	folio_clear_uptodate(folio);
 	m = (struct mft_record *)((u8 *)kmap_local_folio(folio, 0) + ofs);
 	/* If we just formatted the mft record no need to do it again. */

-- 
2.43.0

