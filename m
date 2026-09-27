Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E3C378D8E
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 10:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506632; cv=none; b=tMgMUlS7RsxS8kJ0VhMfXbBqRvIVpGHAtyIqHDJ82C38giAcvAtK63wEiHuh2QBwTmVo0hiKixk2QR5j1ehaapQn4bX9IvnltFC0bnuDykbPpy5ogzMURCIO3tlOcn7j8nNBRpkJvzIpKxkUx6l1D447s4kFQCsgxooVKh7D17E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506632; c=relaxed/simple;
	bh=SPjFaC6/RkWLmnwuGm8C3v7Hw0AwEyc/tT1MEMTXidA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gkLXRL7HudA2qXBqzrtQI7QukjH8GdSKlRHmJuwWTuPKzlCd9c2RN7WOqt/AJ6KzRoA6DR0JQIhG1RpdpOGVmfu4A7syYCaFiHrIMpDydjgPk6/UluWn5GLh21c1lAvkYspCuCCYaWjL9/i4RoAqXUGLddqlygVfXH15ysZGgYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdnoEus2; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdnoEus2"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2d747ec6185so8393955ad.0
        for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 03:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506630; x=1791111430; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d+R/aN0NQXpZlislYam6PzD5CESdwdMKZwsMqtHvKmk=;
        b=WdnoEus2xX3Ns1BzJ9m797i8jzIB1KellGVvKPI/K5ThMyTbm/rpk7HvirBmSzQWZv
         Oq+5lW7BYc+RIYswo1DmaFXilROzSi2iLTV5UOlaTyhfC7vrzexBynPnevfYPsOYd/vi
         eC/Jrj8ubyDDikpTS3bGjVhHfOJO3puQ4No2GbU/89C1eX5dKCgcBETvpUyRZ6AaNScR
         dmOipEH34vXaBN2EOv1guAj1ftwIL6L4XjfFGMTFLBkrB6mlbfE1KflUgxm23K8IojOf
         fJKX01wGEhu7YyHCg8xfcbg1eNWPP/PFBD95WWhMY+16F1IMpFfjgNDWbyOe7+FsqaDw
         uaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506630; x=1791111430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+R/aN0NQXpZlislYam6PzD5CESdwdMKZwsMqtHvKmk=;
        b=nqWmG/bf5UGS/DvcSQYo6GQyTg43FOeV+ibTuzFocCdFgwl7Y8700erS4BXGZ0wwf2
         VWEh9sqNFcTa8pIG7iehvcsDm7Obopcz2pFXS+8gHjPUNS/AP332mlJ1i5wqXE0jtBKS
         zhWIfPowfjnlyxPEtbYawGU8TJ1nEvanoXj7Tl0EKWGRcca5aoBWQWFvpcEMb7QOHNCl
         CjsjunKcoxfwspDSlPLsE4OnrSi9FQ4i3Q2t4rjsFqthD7Q0XQhaH/NaNC7yanEyCPmO
         0pNIJvboWQCNK2mBgOIRGyeAThoX+yESR77Xbk6CZiAtJUmVWBlmUXXa3s1VjARbYcy3
         SfKA==
X-Gm-Message-State: AFq9FYITuh+9xHBlmeOR80Mm4A488WJWfuLx1QjOSN7+cdllWFOLyvDy
	tKXjPTi7owvbfZusj6apCsHdAd0y/w31gbVHxlJCDy8X6oYjJVsLJ2wA
X-Gm-Gg: AYBFou1b0VGeLxQ3GZ+IRb9bAN+l7fxNAh0yiKfPvdT1U8FaxQc7YaJwQamY09712GX
	yNdcxZQkhlVTbEjrg4dZgDBE8lNvc1hu+1075K+o6tXSt4DRoaUy+fLwwe+UvM+WRLGilppBue2
	8m2IXeKLVPFq+u4TS9tWxSs/Kv+jQru0eDd0qj4ZXKkFaVSiAoGRfXTW+7z9FHIjJCqiBYDm4Xh
	iEVoOV8zJciWZsyKWzJyUBormdZuJQSYOQnpRVAwJ0MiDTkNXvb8fJovjT5cFVvqCRFLXevgiS0
	o0eCHQKI35ohDGBRGdbkVieZxlJR1G9j47oPBhHKOEcfRlkB74zgrzzwmqwgvD+v3iJ5ChwUxUp
	f31Or8Wqy51fapdy4yIZX0JMWFZj1lQqZiSKQiAkQiPmY+CeSzbeGb/HD2lM7HpOGxyb2frHWM/
	jVRDyDHiJa39uAe52lK5V5nOIAAKY30hU4bFUtEICM5Nvfs0NmEEYBSnTO47SNFpvZmIInH+awC
	BcAKmiy2rBDiQ9zGYm0Gpo15B+Lg/XNAz83MmtTiQPKX9xmdNi/xaIE6XDt1giqS9T18iIuTc7D
	7mQIE1krAKpPNhEkWIXi+eQQcKBv8e0M7JMwktWEzoKsBp+dMJh66oqPMNU=
X-Received: by 2002:a17:903:a90:b0:2db:331b:e187 with SMTP id d9443c01a7336-2df7dd748a5mr79579255ad.8.1790506630003;
        Sun, 27 Sep 2026 03:57:10 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91442ef4sm28521145ad.55.2026.09.27.03.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:57:09 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ntfs: fix the undo path of $MFT data extension
Date: Sun, 27 Sep 2026 18:57:04 +0800
Message-ID: <20260927105706.3111333-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fix two bugs in the undo path of
ntfs_mft_data_extend_allocation_nolock().  Patch 1 makes the $MFT
runlist locking there consistent: a map_mft_record() failure leaks the
lock, a lookup failure in restore_undo_alloc releases it without holding
it, and the clusters are freed and the runlist truncated without it.
Patch 2 fixes a use-after-free of a pointer into the runlist across the
truncation.

Both paths only run when something fails while $MFT grows, so I tested
them in QEMU by forcing each failure once with a debug patch.  The
debug patch, the test scripts and the images are at
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-27-ntfs-mft-extend-undo

Thanks,
Matthias

Matthias Goergens (2):
  ntfs: balance the $MFT runlist lock in data extension error paths
  ntfs: do not use a stale runlist pointer when undoing $MFT extension

 fs/ntfs/mft.c | 63 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 10 deletions(-)


base-commit: 259abb551e2944998cad4214c201954ab1ac5c8d
-- 
2.55.0

