Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BCF32B125
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230113; cv=none; b=Mtbd5XHULa8NYxspPjF/dNnG2bDSjGQDvfgKRbyGzD1W5Pdes6CE+Ih4AUltNP1sGrcp8hEdVQfPkFW02MsCXq6B/0UVDObCQIdobDLcdI7B7zFi08D0QZltY0VcfoB5XeGblva8wSIF+B+9EN1MwOEdSaGsbXc05/mjT/x/XQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230113; c=relaxed/simple;
	bh=gbwWVxFM9dLg+kc0s/k3CLBKN7veqwgTZB5VyOcyWBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZqWS62tGRABASuP7rGF4quyVy6CwIscnlcQWYftoZV+xTH4dVqCXP5d6Aqhxw9iEPaCalhG3W24RVKdw1sZVXXSBJIszJfS0VAIS5gkeW6mmCkAsVisYReCdtizt4rosM+JEFG5h7Sj+xK4/rj9I6rJ7G0VRaMCwKg/aXc8UJFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UK5ZDRK1; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UK5ZDRK1"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so9310465ad.2
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230111; x=1789834911; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bg/mlUCZeDbPLBYVgu4awmwxtO5SPkQwJeP6+A9yfQQ=;
        b=UK5ZDRK1kBcew3cnGQVzq6WrFvMm2PaDSx+iFnePyiDa+YCmel3d1VCb6ljuLHnj+U
         LtgGWGVksH03y1LkchhBPORh7o+HsON3wkbFx78oyIo0HGFEW9n7w5wk+KAfigt4E1XO
         SBx4yON9u4PLkdTmcdvHrtPfJhH/f983W0357snKG9ZHzE3f4gVKHDl+7LWdDkoXw7QZ
         tk/S1GUiLn76kw6hmgKc8W0smBxYRMnFn6fCIIoY5+lj9pr+fdqWg1SMwRmITy3t1Vp7
         O24nr+MHMfI0R3fWHb5kgYDGru86dKJ3Weg/sZsRs2ym0hW80Fc0eqN5Rgj7zBFGm/JI
         5Hcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230111; x=1789834911;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bg/mlUCZeDbPLBYVgu4awmwxtO5SPkQwJeP6+A9yfQQ=;
        b=IvBqkuBVByvQucFq3/6QBB9CdoPH/9weECQe+7thU4VI+i95X/rL6XbfNgQ/Dm3dx4
         RU0JtN03JAP0vsLSDIUvhqFc3X3LpaUM9HdPp+Oh1K9uzNR5Ydv4lhfQ5pUrRUf1/d5M
         atgjSRoHNx6kTOQ7nKseatWbBUTZo392GobqG1Aqp5B4a+hOriReNtq78azz42ekehpz
         h8dTCzvHWyKFGYWKfA9ulqvMxrnvvoXep/D6sq//s5s1lGWreOwiF13tk3nAFEo8biQ0
         iQ2LzWj5g0/FwkDjkJkwL/j/uHv1Xd1WJ8YaNsJkSYTPY8boqz1308saP1OGeUcvVsnR
         5y2g==
X-Forwarded-Encrypted: i=1; AKwUvBxGattKPxbl5k6Lt5/0BYk+Pvm3foZQm9nvlwvaYJCelfValHld32gr1sLiALI+8qr3v90C@lists.linux.dev
X-Gm-Message-State: AFuF++mxxokS3zZe9hCbT402BnYhsu8kD1Xd5eOKY6JwY3DvxE03WaGG
	aMqBcgxiAPN4WJZTSKM0RVo6c/eAOK8QUj9B80uK7e6mZQCWgirpfJTL
X-Gm-Gg: AYBFou2WCgg17XOYZnmTJ3m8479AA51hvPR9vKocdq1wYPdWv0EWsWgz4RyAbQRES24
	csT4t70sKdSuZriQXUzET6Mk2LexQSShSDjUDTozA4O+CSvw23017aNpOkokSw5XOOG+UsrY21s
	r5RlmGO8CLiFSOFwWMXZ8Bof+JzOczyc5qcMFAMkVL0WDoc9LYchOOP5uRyDBIZ1btiOzwF0iU8
	MrhKGTQyo8g3P6MZjWkbDwyBG6zqzU/eNBGc+W8meMcHGGrL1McrE4F4bQFTSfmr5fg4E8xd4lo
	pHSOZl4UppGsYCq4Zn/WGq5sAhKLADyqGHafEDwmTA7NJqp4R2OcgBxRs6y45r9nusFsykX/2wD
	M+RFMa3BpVRndt+AeWNsEHhturzsNTGdDWRhmE9CL/EEh0b9kfEgi8Az/iKVe/ThPso/ovSfMHW
	VlluaqFpP8yTSpzOAtrvc0jyCiAVKEdwIZaRNP55hADmetAq6hmZZhU03xQicbUA0q7NrLuSAjz
	U/jaB5E2A5n2HJs4aQP3Mw=
X-Received: by 2002:a17:90a:d50:b0:39d:ba54:d0e0 with SMTP id 98e67ed59e1d1-39dba54e895mr5100066a91.21.1789230111293;
        Sat, 12 Sep 2026 09:21:51 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b21sm10804999a91.13.2026.09.12.09.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 09:21:50 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2 01/10] ntfs: read MFT writeback bounds under size_lock
Date: Sun, 13 Sep 2026 01:21:13 +0900
Message-ID: <20260913-topic-4kn-lkml-v2-1-2bc455e81635@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789229949; l=1303; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=gbwWVxFM9dLg+kc0s/k3CLBKN7veqwgTZB5VyOcyWBE=; b=nhpWO0msTThkMhNdKsCAj1dn0m2frBwbQ61Q6ygn1n5BxrBpOk8V7O5Au52EeO0G/dDnNDoS2 KmqEyzrD9KICHtE90haFkTw0Ah8WraEwAditRWnD8701ohSjDWcv5W1
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
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
index 7e58c99f1728..09fc378eded7 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -2646,9 +2646,17 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
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

