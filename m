Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889B22BF3F3
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 03:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791775023; cv=none; b=JLZBRwe2L63YApWvkAgZzBbocfg0KDVjOTpIFErbRardYeo3cT2696KfON3xhrRhAcvxdRQmrxrEpXNXOT7/Cne68Y3FLvOITItRqybuDtya7ApL46A/6XKzZtIgZ3KlL49s9VJHYSjY5DGh2CUzgqkY4XwzuilXgY3pSYx3JsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791775023; c=relaxed/simple;
	bh=BxvRC1XuAyT62AchRs1OxMKiXBLarPUmU3h20ePQ6QU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GaNH2MBxIilaW0E7FEFHz6U15UYLqaH0QMRQ937Ab8QSo/dv47OjMOr14AWiHjxUku85d5hZu0/RMFUzbt7XvbaEdIzMNPbmINFnKvv4yHAyeB5I4SEAs09ntNxRK+qjdRlwBNLUEaT0HJ/WnYd21T1NRlHw2Q/thG8NcjIwMIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lU2lVvU2; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lU2lVvU2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8c028eefeso459445ad.0
        for <ntfs@lists.linux.dev>; Sun, 11 Oct 2026 20:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791775022; x=1792379822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KvT32PQO7yxL197/No+w7Ayr3zcIYifaH7M7l20t4kc=;
        b=lU2lVvU2AtA8HVp7FK0V6TYRd9iytp1sBzNm9N5UYgXN5u4I1WTjmnR+v/62mnPNJG
         EtEtpp+B5llwiIVyl7MVt/CQ0o5GxsujoVz47A097ubG/sFDW+rUg5GaZa/mkIkJ4x2q
         ygBfvRqZgUrKLQA6EnPHebCZPPn3kTEmseBRHCxCAKLls+5VIKzXGpK9FF0Sb+/Iuuis
         jhCTewU6Bkh8Pr/mjxCRyw4g4s+E9iKCVmAfopK2ZSQYIsBiFB+Qch8r9lUQ9DofFgCN
         //6bEEIOxKO76byOADHHsJm7VOmn6Ck7krRDVlfHf5Xo/Jc2MwPMiTX/HozTqA5TMQrm
         lL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791775022; x=1792379822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvT32PQO7yxL197/No+w7Ayr3zcIYifaH7M7l20t4kc=;
        b=ytlPf03R0InC3fPmX6oZLoz64WE5Vz3A58ssSL3SufOGkqA9+ZS09ZSatDht1YCuTg
         EemouOIKtI4BJtq3uAUcYSbN7nwDyOgugM/0lzP1urvlq4sFTedhKed5If73NT7mfyeO
         GAR63P+nEcoE91Q+5VYp+4H3wCPUVWl4LHEvQVdE1ChXZYBfRmUOgoIsvQviuMpy6gRX
         P0Q7GX5yDAJaq5Yxt6A+Q7//VwJ+hRbtK/8cUlwtlyGeAH5XThf1VxIFOI0vo/XIiuwe
         0BHi6sqcKE3oQDbb0VAN31j/wA3xYphPRyxdvm7cfewKDfL5hAtcfeg9b+d/bMskVxoj
         luhQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6BufXPA26zVHexrTYUTu4iD5vwhOISbxq38q6ijglixV6lE8Pu6OkKlmCYxrwmD5o5iEM@lists.linux.dev
X-Gm-Message-State: AFq9FYLRSOzwjrr9EOpYoS7TsK7OTTURlZVJp5L2rqW2EJAc2Djj5VnB
	FSRUKV9ZkwsLmdjh0Earbx++EKcOUCKYL79h/arcpwOgitm6WyKJDMD2
X-Gm-Gg: AYBFou1yZDUfbACfsEITKJ5Y900IxUzKJwuuLKFOb8Lp+sQo0nz18V5PAjBiPamL+5q
	gmf+IM6/+L9qatXce+uPnttYC+qUT4YVGxFyzG9rHDrPQ9YSyQ797w7XQS8xNyXPx/pVO2k8ZTw
	+m1x6p1Nta7o+EQnajmGhhccDRVZVhSE85td3wNgVZcZHSjUJ3IAow5kQ7ZcWeVhhprszrRcZYr
	0BDqH8WvcqKL+ZbkZnCfZK+a3tRYyTCQFeFUvzKYD8GDghk90q3BPcgsynm1RYgJpdkw38tY1Up
	2x8PlxVfjfC1yTKmOpDhq7TID7/xd887IuYUmwR2Adz9Wexpr/ooaumtSVfjHpnuiLso/nir6vB
	GXXXfnZV+OPFuSLtAe5FjBJyT71vQpukIbEL+qs6ynUjI2C2f+J0uFW7GN00q2gwCo5YtF0jQZk
	1BZEwHl92EuwxEPOanyLcWYAChFYtmmQvLDatUwEFywN3NJDvxbkgqIQkNFMHYOB+kY2DJcnO3E
	w==
X-Received: by 2002:a17:902:da4f:b0:2e5:da30:39c9 with SMTP id d9443c01a7336-2e84289f2c0mr106365545ad.2.1791775021791;
        Sun, 11 Oct 2026 20:17:01 -0700 (PDT)
Received: from ser8.. ([221.156.231.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b160csm37798575ad.37.2026.10.11.20.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 20:17:01 -0700 (PDT)
From: DaeMyung Kang <charsyam@gmail.com>
To: linkinjeon@kernel.org
Cc: hyc.lee@gmail.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	DaeMyung Kang <charsyam@gmail.com>
Subject: [PATCH] ntfs: compare streams_interface with mounted volume on remount
Date: Mon, 12 Oct 2026 12:16:56 +0900
Message-ID: <20261012031656.3858771-1-charsyam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During reconfiguration, fc->s_fs_info points to a newly allocated
ntfs_volume. It does not contain the mounted volume's stream setting.
Consequently, a windows mount rejects a remount with the same
streams_interface=windows setting, but accepts streams_interface=none
without changing the active pathname interface. This also breaks an
ordinary read-only remount when the existing windows setting is passed
again, for example from fstab.

Compare the requested setting with the mounted volume instead. Use its
superblock when reporting an unsupported setting change.

Fixes: 2de2cdd9cc08 ("ntfs: add pathname access for named streams")
Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
---
 fs/ntfs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 242fb19ced2b..711e90be9382 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -275,8 +275,8 @@ static int ntfs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 			result.uint_32 == STREAMS_INTERFACE_WINDOWS;
 
 		if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE &&
-		    NVolStreamsWindows(vol) != streams_windows) {
-			ntfs_error(vol->sb,
+		    NVolStreamsWindows(NTFS_SB(fc->root->d_sb)) != streams_windows) {
+			ntfs_error(fc->root->d_sb,
 				   "Cannot change streams_interface on remount.");
 			return -EINVAL;
 		}
-- 
2.43.0

