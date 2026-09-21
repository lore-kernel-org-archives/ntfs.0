Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A101C3769E9
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 06:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973078; cv=none; b=qlm6ejz0oe7U9baUuYYWZuZxZwLgQJ6jdPZO1Q8r4RkXCeiiVxTs7pJzpZouS89JBnaE5bCezVSUVxuvrpkj6yQPf9fvTBpGNw354FHTFPR3ROFyB6u/RaBa58ZHKXJgTMGobZd875nOY4FBxVR9tmKbDpuXGUPYKTzaq0ja+po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973078; c=relaxed/simple;
	bh=jscgbHvqjyoNHqjnSkE0m4yYPOUL+/A9YCefY2XgBrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BHhKc3NBl16oKXsH4uqbjXaoFnD2Nhg0s4uo6ku9jTo3jV9C9qPMcze9ESQsChABj5m93PaMejaKo3j67EqB9KrWEqmfgl2lJZUIdNWzfLHots5tuHn4IwtKkxDZpyGPwxfdJwRHv3DmWvXwcVt68VlkXPT5fgwqfMt21Y1wNkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpCGLcxA; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpCGLcxA"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334e72so23436105ad.1
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 23:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789973077; x=1790577877; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zfTM0oUzxE7gTPgFagRaige1GGRkque+5k6WrrBX+rQ=;
        b=JpCGLcxAghBy4S4a4GwOhGzPM6zK4ok//QhJ9HaNvqJ3UyIKlYg98SWm66xXXQa3ZD
         vPtuGyNcH7cv7f3+k99L/rMDVHjJezN36jXG40BlCb4H7A0BxeT+VBmkQXjpcg1xCfGk
         kY9Oi7wx3FjXhmg96iYW8oHiWImoMDD75zwwxDhUXQj6AuJZZeX4+cHk/rsfPzQo5wBy
         4+YKQYMjXE2ScIWssyQclT4V2vK4uCorMRU07INEdzA7kRq2XiGzpe+9c6T7veVKuzpg
         Ywp8BDRKVCdtsAvAtPAOH7bOw2Z9VPOQCKBXojexsdjkNtSHoBYnbJzFMawg+1QLcG9w
         CLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973077; x=1790577877;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zfTM0oUzxE7gTPgFagRaige1GGRkque+5k6WrrBX+rQ=;
        b=UpP3MZZ+0P7x0FKjxRiQCD6jl9MvnfSwdg3KHQ99El5HbSeyyAJUkmd+VctNuIyBJe
         ocTe+KfScoXYhfc67t9rezAxaEoWqWxGW8zw25mUITcBTOJpW5W7wH06laMqZQtnBNfa
         5Wn7bMrvAjvCjzTIWJvACUBPiW/TwU323imWkf8LDkcvf6DT2dPkBnM5xjVm42nyt3FN
         KqOQtTOv27S5sdD1PC23G4q4vpYTIGlLNLlRUtbqHUSUtgOVznBet+o0oAVH6sw3zHtD
         FqSEYBdjQa6P2hKt+sNixCzzpM5KztKmfqJ+n5pTI1lUJJwlYl7/BWF+Stn1Lm7rYZri
         KNsg==
X-Forwarded-Encrypted: i=1; AKwUvBwp+O6H+Yj3zTCuSNo9+ag5yejxXnnUBejWvLdR3qEWmp5DwyMVUAcm6UKF+c4izQAMVpiq@lists.linux.dev
X-Gm-Message-State: AFuF++mU9YCvK7TLTNoF9y6ORpMetJaCo1J1WElOSARxPIfNKI9ccdC9
	dczTDbMUwgj+Lot0eVILjpFBB1jx69yXKuqdqM3ovNkE5rXjwJTlc2gH
X-Gm-Gg: AYBFou3CSRpqBqMpyhuTSyuCE/NIe66knSAkMxudMcigQnlNrXyQ/xISObiHAjzOjOU
	eZzdXiGltFXCU5j6fkVB1taVyzK43WwZgzxiSYijRpX8FWcsy14T8hSbSln8CUpGyxddRUIcljn
	oj65M6XmcAIGf6u9H+XRaOIor2M1+L8sBIa9SdPU0WxopoVi4VOBqM7vncVZ/qY2bvSR492PGGs
	U5BsBLhOXO5Gzmh4uR2tSemuBnel6xXMdGv/tqtVvXaItrkUHkrgoalwlFKzJCre2+5DflWSEqt
	MtyUna9HbaKxi4Gz2YxgQTMSH6tMp/N5ohJKPHZLDho1wxSJXroQYid0rvUKm0Wvh9hmEbZBUjX
	Zy9PdP6tcXgr9mkKuUXtPgX6XQIkLIdV6bavTwAsiUOovlO7TxjuMkRcc/swya0dy2jAbfuiOPN
	BwtsFXSUZ5IfRFTYZl0S3icUEaHRqtGOgaU5mCPzZ6InqCK9DvhphkpEgb7/oA/zzJ/lrVFWmtS
	Qr4xA==
X-Received: by 2002:a17:903:2c0e:b0:2dd:c100:7cc3 with SMTP id d9443c01a7336-2ddc1007e21mr85426765ad.63.1789973076847;
        Sun, 20 Sep 2026 23:44:36 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc180395fsm28097345ad.81.2026.09.20.23.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:44:35 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v6 04/10] ntfs: serialize raw MFT updates against folio writeback
Date: Mon, 21 Sep 2026 15:44:06 +0900
Message-ID: <20260921-topic-4kn-lkml-v6-4-75069f590b22@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921-topic-4kn-lkml-v6-0-75069f590b22@gmail.com>
References: <20260921-topic-4kn-lkml-v6-0-75069f590b22@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393; i=hyc.lee@gmail.com; h=from:subject:message-id; bh=jscgbHvqjyoNHqjnSkE0m4yYPOUL+/A9YCefY2XgBrk=; b=kA0DAAoBNPIw+veOSNMByyZiAGqw0grIZGVVvm9Dki1MjRcd0asUseQ2nVPaFrWjSBcbRWGfX 4kCMwQAAQoAHRYhBNWFKcxTduNtbh5vYjTyMPr3jkjTBQJqsNIKAAoJEDTyMPr3jkjTjYAP/3xv ilnTtPDRZFlQhXdBjabGJK/vSGIRzL9Ga4KIkGbjDQDqXy1SyfGE6gA3Gk5+Ysi51FfKTTuHzGK T5ERRKVKhXfEqqt4/hUbH9sikgV8y4dIl0iD3GXKyy7u0nbQ2J5ts3xJ0/oyziuG5UqSKSzxcaX Zt8I+YjWPiNTR4TMbHiUeEL9QlxY8z/712htsf/DP59vQ9sy1XlITxjBwIAufCxbLTNtg35Yi1f hhnHxTEhGzxSCFL+D8t2VCkHT2f4A8tyTaEPAPcvST/w8goiakYRkFiBGHGPsQ+7SVwbw+u5KKA N4dMW3xJIrm3AmMZ/T2XpuNGdNufGbVNPfsCPfRqVli4LCsk+ENE1f4oZb1YwR94UnezRsE1jcR MMOEtPY8qRmf0ACe8NXH5bjwamTO5jSTmIfn5Ivc39L797UfsxFzEeQ/0HHRJQUFn8BYzTH2jWa VLcP0Ialyx1f3xHNuttzTVd2YwTvG9Gi0oVqBxbzSF5wwrGausdPkXSzuxf9iya7X1D0QkOk/AI lPd1KDrOpVmiJphENRZ+//jb0Nu7sqjuOYxXjiYNXDPuQRghfcoD7024GFBUA45ae9ul8/ESG0m N7GV85AGypEJ797tV+rE7G/wE1WGmGE+9175TLzjxeCxkKJ1kHrG8ZAgZQsYBp2TuriyZ6F/D3+ BrHlk
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Because MFT folio writeback can remain active until its asynchronous BIO
completes, raw MFT record formatting and allocation must not modify the
folio while it is still used as a BIO source.

Wait for existing folio writeback after taking the folio lock in both
raw MFT update paths.

Fixes: 115380f9a2f9 ("ntfs: update mft operations")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/mft.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index b102e0204eba..c7577c322454 100644
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

