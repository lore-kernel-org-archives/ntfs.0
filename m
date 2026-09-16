Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86693DF6C
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 01:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520657; cv=none; b=DbNoISdbRrL1SzlNjnoYmaNMwQFaMMkuUrr+HIXZOtpmfidPA1StF1/23NJCHoOHspGz57QQl6otjrDD4NonCJRfMlUttYE08O/XneV7dczKV2EMYwe+2poisnCSN5ClCdALqf3jEsQ0SpWhp8aKvzRj7UGFw+N+T5KXvnmZMqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520657; c=relaxed/simple;
	bh=Y8aqOvxwysux/OqY+n9Oq5AbefWnqKe5itlF4eAnDrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rjjsPY2ivKmo4Sn76ncGcZMP4Zfo3MW5Z3FnTV5vkRM1s9VJksD6I8viZ+zGLIPuR6BqXvL/RJ+DHCyRLv6VlpM381iGlxI4DwOf2/RaaCtFUNaKdncuRxtTXx5XeNDBhWT0pcSnJ0KQ6VAOoFIXz19CzuRZoWuD5j1HuHPjpfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDVTBS1R; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDVTBS1R"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91a931f66so2684245ad.0
        for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 18:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520656; x=1790125456; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i4Owxq5xFlksuYFwwNYWHIP/gBOk1flMgdq5mmTd6bc=;
        b=RDVTBS1R936EB0nGXRygqvhCaPRsLEmtkX6uw4g+In/PoiS8HCvtf2Uw1bpxqofWwN
         pPCkgdMjxLHQ0mZpP80UM0Fvm0VxRtHgxEbAq9sSqHTwP9YQiHoEb3ZdLD3XkgXYezxy
         LIf6qdF9z0rmyHV/hSFUNqrrxFXZuFlkKFDBbdA50A9AWyXs2vp/imJk7j5BIokiCXPa
         2bXh38E9Nj/ZhMjMV7fK8QP1N5gTT/RwIevhEMakMa/4+Iz7IxmdOZ/6hmSFooJ+s8CN
         ouSOyKJineGIidd6YKYGMFvsjfwRMMvF/cLz2cH6sLsK84ZnaY3b6alFsb0OnoB0axx8
         MsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520656; x=1790125456;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4Owxq5xFlksuYFwwNYWHIP/gBOk1flMgdq5mmTd6bc=;
        b=tzgSaLbiCoMzQng+HdNRUIdMaQjptmgMuAHQYaraib4tQzfwHHlT+oyDvYfTlJcVbj
         XXhu0+qkeEYv6lDd8yZMGWri8azGyKdQTQRDHOfy66ImBMVYMMX3KymVDOdjW7RLVaaW
         blJOisGNp1SKS09J7ji6Gy6H8i31ZhpM5Q6+dKRCf8btbAgtjVdXrU4u3V1OJbZBiga4
         g0q8NyKvHKZ5kfX79JIyEnxDNo5xlUlWHhsUV6eFy8TDufSgkMdGum617D3kFTJ59UWH
         eSR8yY7mI3NxfRUMr0MSiaun4flTaAXJcIfAJdzWq8Sy7SJ24ZxC0/WZQQvefhAVjSe6
         1/kw==
X-Forwarded-Encrypted: i=1; AKwUvByRjgsiMI2AzLofB0FDkpg2p+SPS7jJYlsF1Vrc7e7Pmr2Rbmy6J4f+jVeN3lelnv97bYLT@lists.linux.dev
X-Gm-Message-State: AFuF++kdmGo9aKKenWQle+xivoD1RsvvgyK9Vc7aYsJckXk1hkSuNwD0
	LqjGhKKixnAeDzPd3WfUW3oojgh5uG260c004xNu5g/mYWVrdE5Ywgv+
X-Gm-Gg: AYBFou22eJqQILxKgWK9dkXQAjc+jNS1+quZodI7PGz8W4kWA9pib81ve7W1mJ1XG7u
	V/uqDOx6+SMXGFnNq5rwJ13oFV2phMOKZFf7TU3nH21oudovEdlgB04DNX6FGCa+Tvwl1paifmX
	HNXLR14C3bsPDWm9B6nmQB2Prhbzvlm5RHp9a5ukLs2f1WzfxIEPnTUoCzRwRucIm109bYCVVnp
	9YIQjn2RXfTYJA6PLimaQfP1Xxz2EO/GZJKzTLXuBfHVVt1azRWtXyCpLP7fWnPs4XB1cDc1Uon
	GsUqqmA4PARAyRb0krep/NZbmOu0qEo5/+AYRw44VGoiU2ta1aYb0JkLHS51Y/RHzIwhXuMXMjd
	1FEWEzn+Kt4mRI16KkNe+AakA8gGHXRz/Ik4lV7uPu42REyhvfId9Nqy4BlfLBfxFotiSNL01lI
	1/jM6WQu22IdEuC6Gkca0KZajnlPQtsLTaW4D9BbNttJCYKJleX1UnWOnfFXP/HsBPqyaNzA57/
	eRujg==
X-Received: by 2002:a17:903:3810:b0:2d5:3f5f:e645 with SMTP id d9443c01a7336-2dd8e40c251mr12133505ad.12.1789520655841;
        Tue, 15 Sep 2026 18:04:15 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fff3sm2880995ad.8.2026.09.15.18.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:04:13 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 10/10] ntfs: wait for attribute folio writeback before update
Date: Wed, 16 Sep 2026 10:03:22 +0900
Message-ID: <20260916-topic-4kn-lkml-v4-10-4f8a574ba3fb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
References: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=805; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=Y8aqOvxwysux/OqY+n9Oq5AbefWnqKe5itlF4eAnDrY=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqqeq49ZgPb3cwyoscqf8j8twLY7KdjBmXY6nRC
 +a8t+YQktWJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqnquAAKCRA08jD6945I
 06bzEADC+eIIknLEAp2VJDQ/tHKGXod9ZrU5nRty2BARRV/uX2wiyrBciq/T6IWbwwi5L75kS6x
 Sdmd1C9gA0CzvF3nVAVqsHniLhNXkROygdcKWk1rcJjv/hRTuUffWFOUNlhcppINKU+WcFGa1fp
 CXo2HXpqAmaoTuQWYnI7w8tapWc/a+EugNAikFRvSaN+GImwmbo/9jm2BetVIoL3pyPxyNkg9bK
 PrZYB5kg+qnKMDPSuFvefNCttWJsy6TWSI0m46zJWugyWvvQaR9yBj0nMDNYqUo4bgwoPzhDEd5
 P8brEGh9b3MFoacAPI+UehbT9Wcj3bK7WEaJaKRj4jrTkdI73R5yVvYuFcOC6D7gWLZJehhrzbj
 pj2Yg8d+CmigVPj67WWyidu3ixypY3PnGsbDfHjBfLqVGcm1wTiSOc8iaYwdsqzWeuy5R8oowqe
 pR+UcT0xZaGqe+Zmfr57mdHO/DxsV+fYKaPrqD9CC5w1gimsLAB6vb+Tla970DvbZgfZisXh8hO
 RrVb5mkKb4E8oxuywI/IHnbii90JneK56hRoXxpzQnHSQG6QSyTC6Fcq+vzIMgosetgsBkA5qr0
 defeP5ARgdeVgdt2qZhi7icex2zu3gXS757XlutMBgUcb7viNlIQdgLq4rxOYJNmTZaKGhgFPYn fpDVGAN8U0ku2EA==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

ntfs_inode_attr_pwrite() locks an attribute folio before copying a new
attribute image into it, but taking the folio lock does not wait for an
already-running writeback BIO to complete. The writeback path can unlock
the folio while PG_writeback remains set and the BIO still references the
folio memory.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 4375ad477809..d5e526d3612a 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3740,6 +3740,8 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(struct inode *vi,
 			folio_lock(folio);
 		}
 
+		folio_wait_writeback(folio);
+
 		if (count == PAGE_SIZE) {
 			offset = 0;
 			attr_len = count;

-- 
2.43.0

