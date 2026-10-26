Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979778;
	b=bNYb2hRovocRQXTjCTIpFOiTRYFk/MeC9qbE+XdRizf72LUgEhJbzAkl8+kQxfP9ebCL
	 p6fBYLO6syWP3iisai/HYIcmqvZIZQw77z3EWRG/n+I45nfM8gYpq+M+ZJoy6aR/ZScO/
	 zvB79I36YMlRNvaUyioov1B7ZnGzQAe9E/izDelnmWfl8FPncfNVDuHm4fajgJv07Mi7j
	 E4xbCEEKZ6/pFLlCMAf81a3rHUvtlfhRpJqlLyzSLQpex4We9hQYkCIwjz9Rf+7b6fwTp
	 x13MTWwACVJSLr5oIQkmta1Sinban0fWFY8b+azDbvdTN/8AYzeHU4yqv77sqhFkx8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2zkx3GxJ07XxsBtFlQsE6mExven9HQFX53pHIZRuedQ=;
	b=1ZNT3jynUWTgLKvMvB0u9uRC8y6Ehf10WlwFSnQt9KRs9KHkpBIzi2IxSH7mOi9EIoG8
	 hukA8mOlcPSF6Er0/suqc9GYyzJFzQXreN2l9JSAeXkgvZL56VrvFD7CqzTSL0RqF5r62
	 f1Y/MnCplCK8Awz6N2nrkd66CBfxQNAyi0/n9IkvBmWeJIUB/gQD/7JnLunHtZZfLuTr3
	 v65m6m3xaZSHttwWvvaADcFXKzoMz4nEWhsmGlcx6wqMfSL/6m6W8rF6xewas9AcTuTGF
	 VJq5zqjC0KV1jEODaMshN6Dj5c0CQPHSeAyTuteOH4qaxo+vQlcRo1lBF15cKftQP6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U4ENNpaw;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A92606A31B
	for <ntfs@lists.linux.dev>; Mon, 26 Oct 2026 01:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A92606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U4ENNpaw
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so2023311a91.0
        for <ntfs@lists.linux.dev>; Sun, 25 Oct 2026 18:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792979778; x=1793584578; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zkx3GxJ07XxsBtFlQsE6mExven9HQFX53pHIZRuedQ=;
        b=U4ENNpawW2uzHxGdtvInWL4D8j5IZOH/2sUG7vp94cJRrv7AEBzAOn9Ricb8VMEV1P
         qZpwpok0EHXaUeog7iZhw3IVzvsXCuMmOTJM3glHXrclTVH4HEAmtXWzU6uAXw/PTTJR
         Y0rBl0aXWTLZvumVflC6CLp0z9c7CbY733k3MgZQx+/Ic4XVGk3qG0m9vZoIWeTWGIqR
         Smh7tWABx8s+W3yZCX7R47frKKpB3aKy/ucVnfRRSZ1jkxpfq/rPdtclKtkMCC24nxzT
         auah+70wc9urK0bitPF3OeABdTCHHnIUQ3AmLvlK5e4j9GYBhyKmRoLBf6FYB/pbmK6q
         QQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979778; x=1793584578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2zkx3GxJ07XxsBtFlQsE6mExven9HQFX53pHIZRuedQ=;
        b=Hv+UMFweN6n7wTqkVBFvwZT69rVPr/rDc5LlsVCyDmZe9Ae84Ored3/9P3ZTsi0gxN
         q0NxdL/8Q9TvrhiWwEcvMdRc9BDSvbH0cJTy9xzkehvfKwWfVtnX7vytNgisUT9QKHFy
         WgtSVyuhbNPwGMjIpMH8PZxYIxxwr+Qgn/yxWdpWXViQleH1MNseuCyIGm4lnssT2NMU
         VOYcPXobYm1gfqp3sQR6lmkZuaK9wAaFR9HY5WaDtDw1xgJEmx1xYnWwzIyuRUs/xnpb
         MfmAgA8eGzWWLCFmSzzy7zVf3JEpSvKt3PLTSRkS0loVB5mV0GocWctl806bNu4N5RRU
         iMGw==
X-Forwarded-Encrypted: i=1; AKwUvBw8uBDi281GH3RHq9S6bglPTbQg6RS/c/8DffvQ5wXRhi8L4clxpGnJg3UN57tReUjpRTKN@lists.linux.dev
X-Gm-Message-State: AFq9FYL0PAuwuoQkjwMxrRjN/QSaHYCa7Vds7Z8jWvEA2VuHnfzO+vWb
	bcRCMZjFV9bMGPG5RdWatDmW1vZJo8PvMX/pmbePunvD8hhWqtrl58T0
X-Gm-Gg: AYBFou0IUfIXMfNdtrkaYkhauDV2u/Kze9gr74OJDW24lUmxRIlGQZH+OAFOQE29TSQ
	KAYKdhnKhPTgK3iqi0QcdS0uhMY38SdcgSFBTGka1EpfILGxM4X2v36FkqGfCmstQgIHLBcHLEd
	Poq1kltV9/uIeL4CRBmqXWoZoeif/mz8GyQtD4/IHYUHDVVvBJu2nStt8SUS2jhhwljQ5XEpZVt
	+gMeEUNxQWrRJSZq69G6pJQAspb3VUF2ApBGUphcqS5UodMWN1DIYntryl71OZnzcGbBgt0IMy+
	aY8XMxb/ldDE3SGo/Q33qhmz+E3AlacNHc75KwabKu2xz//LwUHuNo7yfSJ4ZG5LNRbQKzjvQRi
	9NtP1jcPqnNwpXQeNhitaWYFuSkl429WoROyOkW7cX9DzaWo1Ls8SyEIr966P/N1oU/moIU52Ff
	iAPuShlFlFqoAoG+bls0olt1kIRaaNBAuD/aFJB5COxjaCZUrdZn6zY6DPQmK/b7EulW578spwE
	qXhOvqVm/4t//CbIskwJwxGc6H+wdRF2m7CPsCpM6YqO7OPCXCeHRT9L7XwyA==
X-Received: by 2002:a17:90b:58e8:b0:3ac:3e42:60a2 with SMTP id 98e67ed59e1d1-3adead5ca8emr4626405a91.33.1792979777581;
        Sun, 25 Oct 2026 18:56:17 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeb8240b5sm5115612a91.0.2026.10.25.18.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:56:16 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	hyc.lee@gmail.com,
	linkinjeon@kernel.org,
	liubaolin@kylinos.cn,
	zenghongling@kylinos.cn,
	ntfs@lists.linux.dev
Subject: [PATCH 7.2.y 1/2] ntfs: fix race between fallocate and mmap reads
Date: Mon, 26 Oct 2026 10:55:32 +0900
Message-ID: <20261026015533.1124816-1-hyc.lee@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026102240-impending-elusive-74a7@gregkh>
References: <2026102240-impending-elusive-74a7@gregkh>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ Upstream commit 67aded1da114dc44808315f249bd9e7e440f799d ]

The fallocate implementation only takes invalidate_lock for punch hole,
collapse range, and insert range operations. For standard allocation modes
(mode == 0, FALLOC_FL_KEEP_SIZE), the lock is not held.

During ntfs_attr_fallocate(), new clusters are mapped to the runlist via
ntfs_attr_map_cluster() before being zeroed by ntfs_dio_zero_range(). This
creates a window where concurrent mmap page faults can read uninitialized
disk data.

Since mmap uses filemap_fault() which takes invalidate_lock in shared mode,
it can fault in pages during this window and expose old disk contents to
userspace. This is an information leak and data integrity issue.

Fix by taking invalidate_lock for all fallocate operations, not just for
punch/collapse/insert modes. This prevents concurrent page faults from
accessing unzeroed clusters during the allocation window.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
Stable-dep-of: 0fecc393f206 ("ntfs: take invalidate_lock in ntfs_filemap_page_mkwrite")
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/file.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index fb8e52574397..317bb249150f 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -1061,7 +1061,6 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 	struct ntfs_volume *vol = ni->vol;
 	int err = 0;
 	loff_t old_size;
-	bool map_locked = false;
 
 	if (mode & ~(NTFS_FALLOC_FL_SUPPORTED))
 		return -EOPNOTSUPP;
@@ -1090,16 +1089,12 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 
 	inode_lock(vi);
 	if (NInoCompressed(ni) || NInoEncrypted(ni)) {
-		err = -EOPNOTSUPP;
-		goto out;
+		inode_unlock(vi);
+		return -EOPNOTSUPP;
 	}
 
 	inode_dio_wait(vi);
-	if (mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_COLLAPSE_RANGE |
-		    FALLOC_FL_INSERT_RANGE)) {
-		filemap_invalidate_lock(vi->i_mapping);
-		map_locked = true;
-	}
+	filemap_invalidate_lock(vi->i_mapping);
 
 	switch (mode & FALLOC_FL_MODE_MASK) {
 	case FALLOC_FL_ALLOCATE_RANGE:
@@ -1124,8 +1119,7 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 
 	err = file_modified(file);
 out:
-	if (map_locked)
-		filemap_invalidate_unlock(vi->i_mapping);
+	filemap_invalidate_unlock(vi->i_mapping);
 	if (!err) {
 		if (mode == 0 && NInoNonResident(ni) &&
 		    offset > old_size) {
-- 
2.43.0

