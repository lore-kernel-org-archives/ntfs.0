Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74DC30C60F
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230120; cv=none; b=qfULgiw2/HphVbWHgrquRr2Rgxp/6kt78al22e2tUWpVe/Vvi6WD/ZmfCJW1Tq7Ch2qoviZowvh/hUik04FvEoU/L+PKZHfmzGkW5pHC/31bhGP2U5XXGrG+Q5w6Ro2WZ7t/+uTSUWN/yOgUknfJwSGquUwBvyDmHDcITDlEI1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230120; c=relaxed/simple;
	bh=ulNQkaVco2E1jwYMJEf0ThHUTWyfaireUSybxB3Pkec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SOyocQLYXVtmoYJSZAM+7sTZnXwchIiA9RFA1sR9g2R2HPEbnWwIgrotD0kr2me/Jjbi1vu2SiRiirxTqp3aLEY8sS7k5NNYBZJ4rZcKv5NBxJ2E+P/dS2CMbeZA+6PTtd4hqKz+DG8+nNM+Yb32tpbHbjscbFbD/WVv6oDMy1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9R41g6t; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9R41g6t"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso329587a91.2
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230118; x=1789834918; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NiPRrtVGSXpM7EIgnyhtzloXQ83EbN3mrHftMTDlezA=;
        b=H9R41g6tc6ZpumPOE0ZGXIcX9UGAf7UKe/sQRHxtaCnLZbd6m1S2ninBTEQVlXFqYK
         4msDG2Mo5RVUuE4x7R+trafCiWOoBmt4UTvvvuxgX5Y5/h27OIDO9kkUoThC5/ZlZKtt
         8vrt3nZRFs7wDBVRfrYbweFIhd5XR+b1wIY6kToKs9LtrLbkW+FZJDNif+3nFlPoYI6R
         cgkO72BSlji32TTFruRYtuCGcGGkRN8+pbiUDrr7OC4G4h1d4S3h9Kn3SkePwrBtIstg
         sgEoaZ9I8yy6R7b4x+/1NoBh2qu84in3ykOd+NQpSFCJQrIGcZWa8PVvJ+DjnE8MZHDz
         QuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230118; x=1789834918;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiPRrtVGSXpM7EIgnyhtzloXQ83EbN3mrHftMTDlezA=;
        b=AumIixtKDD0aA0mG9vPtjUgGHmToU3Ly3/1VKQCkRMcurU+auVZocO3JZQ+xsH+XUk
         itFN9P9WSakzKZ3so/BmIrSUozWtjnkfNVMKyRJ2+G3oHnM3U0a0wb6CTIDfhP+ncbL5
         bT8Fa/u38lD3Sv+E51qyyVziKHLE7k3wkXnqk0fAUf7MMIWMdGcbGY3OmibqYad3Eq+C
         G2d6IYP7d4WnD8YvWJ0cUxCtC2KQiwOkrNIOvy6/i3kI9Hsv/7i6kzq22EYC0Z5dm3Vv
         OfNMhaM4H2N555F/3idYcmnGq/0+I+oO3DcQf4c4oMwLvOt1HpzJK45hwPo19Rd8t335
         WqfQ==
X-Forwarded-Encrypted: i=1; AKwUvByfXAfX5n9ABZF0Ur9Qqg/2OZ+I9QTlV4Z5iIoKwLaRL94DuzLinLi1w87SGgomoRT4ZQfW@lists.linux.dev
X-Gm-Message-State: AFuF++klLep8cXoawvTeQ0bqvNp19rjIYaPKqtU4AP2AQgHe+5hWWDPd
	KIw31BJyyS604H25iG7QvRhaMMqFRZv8Obh+7P3mL3pGpaYi4Vi3nWjwwSCMtw==
X-Gm-Gg: AYBFou3pc9tTyxgotJI3ubRIoVbtVXTr+EpTOxbL+dIvEd84zk8P4wh/PU/5ok94fv1
	s7dmXEQ5iwJgMgMg2XG8u3eyqppUs22kzxlKwIrQFNmNDQ9nwV+pK2qJnnWCF93svOV7nq0R1WK
	7FRqiDtli8hTMF5AoU9JYZSxtDygcwqVx0YHBU/0Vkzanrp2gDdbdKU78J0ZFWudLH7AL2m9iwi
	wZbi/LNX4jTpXB0oLi/OmCNCFdoKUqOA8AdjjTaQyNwg8fLIY0LVgMss1uXn02o5eAivRe/R5S3
	UucJvvvXaLeLX7/XY2kzb5g+1bkhul07suuXdvjU7j4ZOeIAjT72fwwnXLiBSmvG1AV7MHPr7Nz
	Dw8WG7Awhs9Ac8p+7niXCGbbVyyHAly3xKrmuW01I4mGipguHKz6VNU5IhqJ1NJTAXHFsl/74qT
	4o1xrmDIGBcxQEpbXwdHNjgwBRpXC3bc5voo6/x9svH/vOYeCTPZCAnNalvj9HOv0fvl2tMGsih
	XzYS95E1SLV6pd77LJGeDXpuUpI99X3nQ==
X-Received: by 2002:a17:90b:1a92:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39dbc6f0686mr6402567a91.23.1789230118017;
        Sat, 12 Sep 2026 09:21:58 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b21sm10804999a91.13.2026.09.12.09.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 09:21:57 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2 04/10] ntfs: serialize raw MFT updates against folio writeback
Date: Sun, 13 Sep 2026 01:21:16 +0900
Message-ID: <20260913-topic-4kn-lkml-v2-4-2bc455e81635@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913-topic-4kn-lkml-v2-0-2bc455e81635@gmail.com>
References: <20260913-topic-4kn-lkml-v2-0-2bc455e81635@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789229949; l=1312; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=ulNQkaVco2E1jwYMJEf0ThHUTWyfaireUSybxB3Pkec=; b=9a5Pfj8dIWz0xrn3oq4peIZT2WlEEQK7nz7BsCFdLAJmOBqcOf1L9QYLgXT+PTIqhc73OrUp5 VRPDFcFwxHPBUb45qza3G6xZFmoQd3yiFJFWU4cS6KLzlq87q1wgVu3
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
index 1cd31c6582a9..3d32126f9155 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -1895,6 +1895,8 @@ static int ntfs_mft_record_format(const struct ntfs_volume *vol, const s64 mft_n
 		return PTR_ERR(folio);
 	}
 	folio_lock(folio);
+	if (folio_test_writeback(folio))
+		folio_wait_writeback(folio);
 	folio_clear_uptodate(folio);
 	m = (struct mft_record *)((u8 *)kmap_local_folio(folio, 0) + ofs);
 	err = ntfs_mft_record_layout(vol, mft_no, m);
@@ -2311,6 +2313,8 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
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

