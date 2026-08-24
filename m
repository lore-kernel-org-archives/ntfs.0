Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3223793CA
	for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 05:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548127; cv=none; b=V4QJbdBW9/JG0RNw9TAh29784WHU6wT8LnoHPaFwDDDXfIp9JoE6e7uQDTZ4Y3UGcyOMKuILEGEWT4rTKs5WU+dXbVlrR7gVLGN2xZxYoPALHIaQIwLDFLAUn73OGlulK+epcvRzutgQ0Xxgkg6Z7Dzqcx7jiAT2Cfp9+xtT8Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548127; c=relaxed/simple;
	bh=5ddXkY1p1Huql97Y09zRJYg3yqWcJ63/XKnMViTbDKg=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=r4Ebso6P2mVIUmXWJVK/gQ5f78RJ7Bznm6m9mjpYhr24oZhns1W8LaPIByDPxnR7ICdUvmUig7uH/+frBeI3aOpsbFdU/uXUqiz4WTxoBHJWX9hQ8DOcVcdLx2OUd8k/LCNTg/5AnRmSKbqneetEM814318ChtvNTgIPLkcYA0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emAL5jSj; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emAL5jSj"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84faf87d19dso3006455b3a.3
        for <ntfs@lists.linux.dev>; Sun, 23 Aug 2026 22:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787548125; x=1788152925; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:subject:cc:to:from
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrFzfkuWgCIrnYEkQM7tNXClDbOIOCxxgl2oHl1c0Go=;
        b=emAL5jSjaiwNSzjbkFDfadKqtKvvQ6lGgeXsuz8znzTjQQ3N4EXV72RLzVqujkyDup
         WUkxsT7CSYJjipU9fZNSWLIHIGjphSzz+m9OelUmxjh45zxVW3aDqlHRTxdOICnBwsta
         W29OJ62MVvZY3jhWmmC6QiXegM4eq+pnj/Na8KWdZ9kA1ukXA5lA7vS5bWHzof+d0EQ8
         WOj+wxHzArG4xDZSYOTzCMAZBHLpiBVkqsEGIkwIQM2EZNzoQRTBnxktUO4kvEPyAICU
         VVjQfo1Og4buMUk5PsY+7FgqHE9CXacEUhoWnDMPfT+q4egBSgOCmtVWxmjDb+iCyViW
         Z6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787548125; x=1788152925;
        h=content-disposition:content-type:mime-version:subject:cc:to:from
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrFzfkuWgCIrnYEkQM7tNXClDbOIOCxxgl2oHl1c0Go=;
        b=Q4RKHrah5j+GS8l9RG8jPRy1C9Qlm1lqK9/jVyrD+LA8HeyfcFuamJZd9RHucBV8d5
         UNtH6xQ8HgZjBQJR4rkrtJzeAgcoxoHtjEEL3GuzdO4Ym9pTUT1pTm6281JgI2PMJrPv
         kij4zAb+ZENYnQeBraTMPkm6M7I1B/zpzylOXOjCn5XuwXcSnxrnoveQossiuh5greBm
         HlNdV3dQ5kHXhLEv9nLB3D0b/ARTGSMZy00F9InfS1JKilg7at0gW6WggDvd6o0h0Xa2
         13QI03Y1Q1axD7HOFDvCM3+cjiMUp6becOw7/12uIiO0z1tU3k9jW0i4yR/C5VGmpbJc
         o+XA==
X-Gm-Message-State: AFuF++mQ1t+NnzTCPGfSmJ38n0q7AadqjBWh7iiQPl03ytta/xrOD2Di
	2+k2ZkII84tpr7UGnfj9Q9EjPQYsFudS2UgrOwi7mwLz/BpzLvUcedNL
X-Gm-Gg: AR+sD10hphbqVJ9yFvb9OIPqXBNs6zOTOqtWU/E+gvyDKD4uFME7ywarsBKSjPIioh0
	H8dXLffs/VKx7q8C7VhLfrj/GS2Wv/QARifqcsoynEzXvfZ+amdIxBK0W09NaWRYiUtFxZkp3LN
	1Xa5d01O0ONuSqFgvey/6kt5wTfM1YqRVh3ARADg7HHD506z+mgyFuYoFuN0heixL/4KZjlezJP
	iZsW8AeXCUBk7Q8coHfqRffaJD/+OI09Z4RwQ6ZFVOqZl16ZuqybXRiJrt3XCYH8qXNqlJJj3vS
	nbBC9uOUEALX0qqxQ/7RcAgCWIFEJGSwnMYKgaeER/fPVALDEiOYZ6JpvovftkcZ1e8oT3qzgKh
	uxQmoEkij/P7w+gvWQl4XJVgWPWbm1iAJp0taMdO45heQVDqhB4XFGmVKZ2W9bd8Rg3zWWfcKEc
	WhYtuENRiCPZoSdlssVJrplOQ8U9SEdIdBgjXg5grKdODNLyXxalaGYOUrRo/LkR5tOpDd7v44V
	SloKRthtPDDQRk45PVvNLRPzMMpoK9Ocq+1igi29dbK/A==
X-Received: by 2002:a05:6a20:4320:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3cd4ba0a414mr26163686637.6.1787548125269;
        Sun, 23 Aug 2026 22:08:45 -0700 (PDT)
Received: from localhost (75-172-9-230.tukw.qwest.net. [75.172.9.230])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e60abbsm674053a12.23.2026.08.23.22.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 22:08:44 -0700 (PDT)
Message-ID: <6a8bd1dc.009b1f07.b9616.7896@mx.google.com>
X-Google-Original-Message-ID: <aovR2GU9d3pmRWA_@DESKTOP-HH660AU.>
Date: Sun, 23 Aug 2026 22:08:40 -0700
From: Dennis Tighe <dennis.tighe@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs: do not mark the volume clean in sync_fs when errors
 were recorded
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

ntfs_put_super() and the remount-read-only path both clear the dirty bit
only when NVolErrors(vol) is false. ntfs_sync_fs() clears it
unconditionally, so any sync() on a volume that recorded an error marks
that volume clean. A volume without this set is then seen as not needing 
recovery and it does not run one, so whatever went wrong is never repaired.

This change skips resetting the dirty bit when there are volume errors.

Reproduced on a volume whose $MFTMirr does not match $MFT, which sets the
error flag while leaving the mount read-write: after a write and a sync,
the on-disk volume flags read 0x0000 with this driver and 0x0001 with the
guard in place.

Fixes: 6251f0b0de7d ("ntfs: update super block operations")
Assisted-by: claude:claude-opus-5
Signed-off-by: Dennis Tighe <dennis.tighe@gmail.com>
---
 fs/ntfs/super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 30481e5d5dd4..a4dc64fb89ed 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -1862,7 +1862,8 @@ static int ntfs_sync_fs(struct super_block *sb, int wait)
 		return 0;
 
 	/* If there are some dirty buffers in the bdev inode */
-	if (ntfs_clear_volume_flags(vol, VOLUME_IS_DIRTY)) {
+	if (!NVolErrors(vol) &&
+	    ntfs_clear_volume_flags(vol, VOLUME_IS_DIRTY)) {
 		ntfs_warning(sb, "Failed to clear dirty bit in volume information flags.  Run chkdsk.");
 		err = -EIO;
 	}
-- 
2.43.0

