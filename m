Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A3619067C
	for <ntfs@lists.linux.dev>; Thu, 10 Sep 2026 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033612; cv=none; b=T/a+0Ref5+CPUqCQ4qVqLgr7L5+8s54AmJxaLLg/uZlk579fMXVJ/pfJiPXQKebvfgjW+rl0IPoh7k3s7QNtWmEcspkdUeXTxFy0cXv30dzwRlfQCl776/TIVSz9FfxNJARyLwy9Qlih0P0Nm8SVehOwEu6uzZVMavZpVneyLCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033612; c=relaxed/simple;
	bh=U6oqlrnrIwf6Xxbf7zJUNmQBUagP7SND0roI6HVnsp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MVEm2MAiNEaZ0qRt3lhr4Tdc0FrlGYhS0uNi9s4PQf1aNFFk8cZWjEi2QM7WEKI8Cwpb9Yu7SG2aczxLF5i5mPTH7wzmJWk2hoAz+u3ZrlC9wckVUnRz25M/6n/ZGLM5xKGJPz4SdKMsCU0aAhzp1h4RhyzH3tDnfqDIqyP8e4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DC2a/xmW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DC2a/xmW"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so53292385ad.1
        for <ntfs@lists.linux.dev>; Thu, 10 Sep 2026 02:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789033604; x=1789638404; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G2mGv2NK+OawDCQnURUVbingQzXqFfplnq4er+8nY0g=;
        b=DC2a/xmWuc8Crri/9Zcut4bWsNvJyOLVrWwJbNmJoPWRljYFOPVHbH6oixBHgiPXhW
         n57/AjvyWYjzuI1E/HGvCBQY2bYD+vwyIZr5dfMTfw3H3b4p74frcEyNTV0cN0tnWAYk
         z6XTqc9sjFRNBUUVvTRd/UNNDzQ+1ejx84soh7EwzGw5rJmQVvAewm7HwuQgIbqz5FGF
         Uqa3GNMfdyn4WHVnmdYCk+jpf0tzNHzuKtsfAX1ByjdpnRh6aBmGRdiK+EvjDXPls2He
         OoB4VT8Q+Q9fOJe5FIEtt22EhBgVdnyTNwh35UB/qcEQ6aGLXzmIxw8hmamqtb7oD8ek
         pvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033604; x=1789638404;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2mGv2NK+OawDCQnURUVbingQzXqFfplnq4er+8nY0g=;
        b=bboGk2JVWWyhJmIG+04MZcT/HzcYCGc2CRiNDsdZUAZ4jKSoVuCe4dzaVE3L3Kb72I
         UrhKQcj9XZ+yk2Gf9t+fWdQShC+RAIVv9bIdjW9wlYOW9YiEFgGXxge2/Jxp10NEfmrC
         qeJbDuYcLg+wLIkfTY6m1L9b5KVKcJN2xebbD9TRUXi933gpZBXT2uJgsOD761/53RTo
         gd3DrKKPpJU4cC2nZVCDWQ0OHdJ8/4DVIaR6o4rH6isBovkJb4uCITHuJEip68nXIF8C
         KYcu7H94O43Li68qQA2xSV3THYAl7/RWmMcLpgon3mwRijUIdorWl6VKWVvuqH5tkLQA
         WfEw==
X-Forwarded-Encrypted: i=1; AKwUvBxq5TCuwLKX8xm2jSrjIFcT852FsLGNcHgiXSKZxzexr23lk9KUsbtOhp6lokfJQ2US89OW@lists.linux.dev
X-Gm-Message-State: AFuF++lYXespKdGHz65f8llXHuILdJR4SEy1zgS9RgF4nR4q9umJIfD+
	tszvWWxdci0QJwkhl024YWjoETGznzWYyuruj9blUTcc+TNZvu6wNVbF
X-Gm-Gg: AYBFou2OvL4M6pdYfA21RiwbCLKEsdaI002j6IoMYubGzeZAqSnaErI5KOMv/wiBpd7
	YloG+DMMl/JIJs1EEH7Y8Gg9wntysnjT0kTl30glk8xRge4xilQSsLz7+EfdjXpHxcgdggbHPyc
	0a0pw1hit3AEyHzqj8bnOJx6841gvZpLOuPmc0AV2onIvNWjnt3QlSJvny1gD6qu49+gDDABnM+
	ygpLo4k/BHs5LSZEyX/S+mpsIArGjAuKEolpc/vaHbfx2FpJs+emB22rM32WNv+sdueFGSB1Mrl
	QQV5+UIufkasRXpB+ol2Jcxpz4/CJ74AIDsuPUVEuxdul41GEWKSYzBVWhPXs8jGm0BrIcgzHLN
	zXBi/WNHoiAVwMG0kpDfaLC9+CXLsM92SKluUaaWfFybhWH3825ILjm/SkXWNvTM4YdHCQtcvp3
	YJX6SWxu44xRDda7piZUgIMC7tGwLv4Q5ubJ7P1bCENGV47TlvmBxC7rkT3aUOi7YB0+X7o0C+1
	03t5AcDxBCWRGeU
X-Received: by 2002:a17:903:22d0:b0:2d8:d4ce:7e40 with SMTP id d9443c01a7336-2db12674f20mr563575145ad.21.1789033603876;
        Thu, 10 Sep 2026 02:46:43 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14841054sm86827285ad.3.2026.09.10.02.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:46:43 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 4/8] ntfs: serialize raw MFT updates against folio writeback
Date: Thu, 10 Sep 2026 18:46:06 +0900
Message-ID: <20260910-fix-4kn-lkml-series-v2-v1-4-f10a09fc0176@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910-fix-4kn-lkml-series-v2-v1-0-f10a09fc0176@gmail.com>
References: <20260910-fix-4kn-lkml-series-v2-v1-0-f10a09fc0176@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=U6oqlrnrIwf6Xxbf7zJUNmQBUagP7SND0roI6HVnsp0=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqonw7LuyYHRdjY70bxS5suPkB4oq6eZvofT8bj
 Xk/Pem2pKyJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqJ8OwAKCRA08jD6945I
 0zEfD/0dlKmK6zrJJ8ZD3tM13r3XulYdmDkfNzAHRiKzPIMiUccD8XkgoHLKWFsFTEL+q2q27mj
 QCAe1Ke6vV57aJfIOxCb4XfnrrJ/nxa9Kjuw4eA4ElDQbMBfwmeIjRto5mmOADP7fe9y4wzR7Hz
 LVHpI35YncE8Kdz6PUxoSD5TrSUzpXzzg3RT9lvl2dKEKT7DsfXaHysNIrUXnpM5sr09oH1V4ip
 xMG/ZlyCYVJbS62a8tVZkSgI4BfNvDO/2Ta3CBDX+4zzuDo0VVh0b7FaILdjis/fYgj3K4r/1Xn
 1uYAcSFr0hB+EesjJ36I18hNrIqaoPKYXAzoQTUwSdGuozpLZ7aNsa3zKgnD479pRQOxCvys2Ao
 ODJbhOIQUERnBlUvcsOswUSDTlX3Wp2ee8qqb2sxvu8kVNXK4wDHYW7zTWV2ZLFiQ/PWAlK1I0x
 V0WChRhJmkOoRGbx4EpoKsJatJJJ538e2lvotsWGvZjm6AoQKKKG4yF9wIhZQNJmRssC2brDG0V
 4YjE4GHCRmGe58cakr10UZI3NJylrxsvCbV70kYh2cfSBoaDoHm4jFiot0D2J3pioHGHULNVpg2
 LaA5m4sFciOOe/OXmNqr6jV+ZDfZwLyscY0I+cn7bhpBEMqfo8ykdHKnxNfTIQotXkNCdjOfhHg lojgqI6RWaoNbTQ==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
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
index 565599d58703..3d8e087816be 100644
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

