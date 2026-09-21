Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8801FF7C8
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 00:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950005; cv=none; b=SEebcRXZ5/JUmMa04yvIThnXSZwegJsPGm7HVT3yKBI1D5sheIgW2yXjaWevA9YSp8Szf0gwQENCqlu5sKOD2YRhalbFZC1qzbDO3c5N9y+BdONW4khsMAqUShvjuwCUVDIDtdCaPAlkW2+rmKXrcmaUYN2SHAs5x0IPtzcsHi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950005; c=relaxed/simple;
	bh=5dG3LUDubIP5KWGOUdjEsRerdQfNvDAM7ac/9vI4npY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SePZENpIZQQQcKzkyMY1DzrI5oJZxLdiL+RGZe30xjlbMV/CM/fcqnmrpElq53QLnDVUeVkETYBNOHBp+Xrbzys6dDZG0j1Gbi34Q9ahrUWe4Axw02s+MdLrsfHuDO1wkvsPmeaBdvWrhyuzI5GZLo+ZOVRRi9DZ5LeLwXcvj40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q11B7kgl; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q11B7kgl"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso3154251b3a.1
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 17:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950003; x=1790554803; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wNia1bb2Deqbqqk2Gxv/29b4jQM7gvtq+7R1n/F0OBw=;
        b=q11B7kglju1LO+lpHsW7ia1DY7fLM9uPyblKFLJmSSESnGbwzuCKy9H/XOdEGX8m7E
         M+VjU8tCrhlckVVSl1JYLtyxHx5pCialKns+D2ZX1Ea5F5t+Pun38/7xyQj7AL1llgiE
         TR6oaqeJKRCpJWLQT3faQiqHK+mhVS9QmAzAXcGpzXa5h7No4UNv2wFx+W0B7uzrkpZD
         1TV58PM6YY2RKxfv3421SMglcTSGxHpobO2zO6giAdUZOEzX7TsoKV6r9eO6tlmpujuL
         RynUGKSEFdDSn70hnyBv8STszFDRCwgrXJ7uGzCq+KZpLcBaubxU5fYwBkWTCC5+H7fT
         /Ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950003; x=1790554803;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNia1bb2Deqbqqk2Gxv/29b4jQM7gvtq+7R1n/F0OBw=;
        b=hEII1AUQydfTS/PjwwXRYqQ8lxQjBxHk4ClFrVaaFczNPLkl3XfvyUDjC9Shfd0jbR
         7JzFlFuZxuz2HEykqsjFTEeMShF2PksHQfEVq0H6FeMxBOyPrVjNeGtmTGfE9tLrAw14
         jeOgjqKjo8rjdXcVyCrNAlt+HzB8erUGfRGoqJyYZdWVzps/0/9NDNQ/bi+HIdye1Sxr
         8Z+3jEllsCZV0GX1mGmvaZ/nRiak0UOoRXDOH4sZJHLjYPpmm987X77Dh/cuXt85fB31
         BjFTtpa9bUGt1u1n+rE0OVbIhZaKOtJQcKXHTEfFRfjuiyotkuqqfWML61kLZEchzgZs
         RGBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzBse2KWmKuT119yxlTnobrUI4koFexKjgmHqPHNOv4UJg8GmTyc8bgnGT730j4GpvUDfk@lists.linux.dev
X-Gm-Message-State: AFuF++mgAQDmJ9j6+K/fhsZCJsYZ+y9uP5x5D0nRKzVavzGPshDZJMj7
	QiBQFwBH7sp1XcFKnpDpjFu5xrlhCEHcMGWoXNZrP6WZYQHJcxJb2/5lF8snug==
X-Gm-Gg: AYBFou1ReDKSlaP5KuNv6hfhzN8vHbqbmcSkrsDEvqJyqxYyr5vibMbAfU+9nE4mJjA
	xAIU52yagClz4MOXderTh8uNQJvEQp2pWzOnK9zbtVXsX5uxZeWqXSOJKsU3y3nOyfCGLl0Xo13
	GDmnQ72mP5V/zWpzmK0pGz/+nUKfeFqcXUOcLznaQev4PM4G5gPMTHqDphdDIFBnMYWpEEg/WYb
	FvIrCEpcqwWbyM/HB3rOcBBPo/TDChzHeXNMf4TkN2N6Knnewcz9eJxUXe8xJcWCwqp3n9cRWU+
	g78ANb3USf+adWiCLOk85HhpCp8YmAFmNlUAUqMyOhEpLjAsI/Bn/C1KNxid9ZVdpRg18hk99Em
	x48us+1vrCf2NGCVkcLZJ8LAym7NdV6DwEhrNywb3l21tT3FE8GiZRDk5Lh/OqYAz9VKx32L6oB
	aKXp5eZJ5wo+snEFOc391+tBDgsmvFWYpVjhZwoudQqVl/YdtpVjc7b1VxoEFugNz6Qz5nVpYo1
	cKs/Q==
X-Received: by 2002:a05:6a00:4198:b0:874:72b6:7da6 with SMTP id d2e1a72fcca58-87472b680b1mr11167062b3a.33.1789950003313;
        Sun, 20 Sep 2026 17:20:03 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2289557b3a.21.2026.09.20.17.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 17:20:02 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v5 01/10] ntfs: read MFT writeback bounds under size_lock
Date: Mon, 21 Sep 2026 09:19:40 +0900
Message-ID: <20260921-topic-4kn-lkml-v5-1-938afe402cd0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
References: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=5dG3LUDubIP5KWGOUdjEsRerdQfNvDAM7ac/9vI4npY=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsHfzxKfoGsJEhFwTLA7FonGsro34fPEiGRmaP
 wi9YEZ0OQ+JAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarB38wAKCRA08jD6945I
 09yHD/9ToJcdE5+OgTKp9M01EmzWidPayp1qt6E8HzWT/4ARlYZ5wX5gHmRvuq4SHPIPw8cKHKM
 P6KmE63weFPKcEV3X6XrlBr7klaPpo6felbKRRu//U4pMPOwJvHL4H8X4Dv2eoK5rzxPG6PsDPO
 tuK42NzYD9405wb12XRAsRDDiLDJLbCVDVBQl3bIhwzkYoum9bneToQ8TrREJCvfznCqjoriRds
 oBHYOndJg5jFLjvf1y++He/1J7yFyefc+O8p81rHQuBCiHdm9CA6914Aq9qZD56P2H0K5pJpTXW
 C+wGeWJzLokEg0+31WVSWLSHXd05wd6KN0IUT7cbGWBs6/GiKu0rjgrdOslHK20db392QBw+r+T
 tnE5jMkLgK2nkBoD6TwTeeVgr5yTAV+mwCotTqV4Ne4X1CGtGBSQZ4K0zdlSxWs++b9cIfQutth
 pueOCq/cWtfwQTx8hrnVU3RjUFZ3JYvc6ZcAqX21wCAWJNP1Rz9eGFokkYimmY630tWc62Vw93T
 uHyrjsHcxLJDauuD8lw5dhalxUUuGLJXl1ZeLW/6FrIArlSQLLB7qpX+OJdbnYohgaMtrKW+KQe
 pFTdyLY6ozb9wfKxAvggDV1MTfN6pW0U9YvLkaKxFmiNnSxlzeIwgUXJn47hbjBGV2XWs/VYAMK pNkJX/pE5U5GCOA==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Read the MFT inode size and allocated size under the size_lock critical
section before deriving the folio writeback limits. This prevents
writeback from combining an old allocation boundary with a concurrently
updated file size while the MFT is extended.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/mft.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 4b7449495375..c9ea11198aa6 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -2901,9 +2901,17 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 	struct ntfs_inode *tni;
 	s64 lcn;
 	s64 vcn = ntfs_pidx_to_cluster(vol, folio->index);
-	s64 end_vcn = ntfs_bytes_to_cluster(vol, ni->allocated_size);
+	s64 end_vcn;
 	unsigned int folio_sz;
-	loff_t i_size = i_size_read(vi);
+	loff_t i_size;
+	s64 allocated_size;
+	unsigned long flags;
+
+	read_lock_irqsave(&ni->size_lock, flags);
+	i_size = i_size_read(vi);
+	allocated_size = ni->allocated_size;
+	read_unlock_irqrestore(&ni->size_lock, flags);
+	end_vcn = ntfs_bytes_to_cluster(vol, allocated_size);
 
 	ntfs_debug("Entering for inode 0x%llx, attribute type 0x%x, folio index 0x%lx.",
 			ni->mft_no, ni->type, folio->index);

-- 
2.43.0

