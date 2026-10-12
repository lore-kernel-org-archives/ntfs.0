Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B2637B407
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786054; cv=none; b=u7lQkv8/6j9k/naV+tH5OtekDUK72nVrcPIwKoqHU6ZnjgUWKzhmdzgol+MQdeIREFpvoYi6VC74t+Wk+KSx3OqMDA04PAMIef6itatvAaSuSK5rCBtW/zX9rLNDqgT3SiKV7g30YJqyhJBI5UH09j5o8f2gpA7fAHuyT3McH/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786054; c=relaxed/simple;
	bh=9piVnzzTpDGOUB/XgmmsQqOPCQ1xP7svRw2Qao/S/d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YquL/LobAqJTVxIn23qzNapPlFkoYHP6edg6BEZU01fpeaBoLNC2gXh6nbvGRddMknYDzFQK4w2w0oI9BwrWOhRh5WsDQY3ev+p3JTWkH20Uw9zaGV0nGvRwYxOz9JM8icw7Lj3fvaSkRIhui+vQli8Af52d6YJrqoXcwX7r+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hP+Wv/pA; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hP+Wv/pA"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-88aea027391so662397b3a.0
        for <ntfs@lists.linux.dev>; Sun, 11 Oct 2026 23:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791786053; x=1792390853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8f49ADw9ZxOCEdvn9SFzc+X11PWrPoWHnRCJMWofOQ=;
        b=hP+Wv/pAmMXqvGt3bj3B730/bGFuJXHlJLIqIuHFZh4Vqv1RoD/ICBtHwyb/r0ok0g
         /GoWApp3kv7oBw7aW5d3ZYOWN+nkVLQbuPvuO1+R4Bvvwq/begUqN0zM2r5WtLhLs/zh
         r45j/bQPc8r93uCDKw8MdO1JfojtVd6L0V4dAXZarvb45S3IZV8Wv0nLrVlpe55047QD
         aXqK8twqkmNeyX3Qa6UMA3NpdieUke5ZEGFLnK0SuS9qTwx/iHMMW44UDgabZaP7ETAQ
         4En+cVNDsifJ130M5bgp/ek04yxcFURAy+cf0jZ8iuRiJsZ2FvvaOQ6IKiKSBGHtyb0I
         YQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786053; x=1792390853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s8f49ADw9ZxOCEdvn9SFzc+X11PWrPoWHnRCJMWofOQ=;
        b=EI9La/0dOtU3Qjc2q4tJK0bYuQdQoel+ACtwvD9RzZj/CQnNle7p3aTLf36cYBEmed
         nYaU30xXx4hBDVGMiB6zdaXKYr0eZYAWa3IXZMHdiYHYPRzq63N7mO9pnIp74wwLQ+fI
         GKUyzAm6ppVbfybuWdmRAJZ89EbpzloftzxVp8gZeWThaLw75rA2H6tQVWAjd1oZ/wio
         YZUKBhofLF+98wdfa+bGEe/l2YvcuO5zel1zORLrFctI92Tv0E7n3oMxnSr3EB9PogFU
         PFh/qvjqHaTkZtkx4b6d3BEGSh9Oc2q+EPNN/78IKCxQ9rbVkNLPkXv4R1tThex528Ol
         GMHg==
X-Forwarded-Encrypted: i=1; AKwUvBypHjv18N9nByvZdgU5/WgUmNEZpN3CaS6xiR0u3rjDfRzc1DWL3KEwFKV6AiA+Isr+/+8H@lists.linux.dev
X-Gm-Message-State: AFq9FYK/bvCnLfW0Bz4ucianfkl1+ttdiTPy5TYmevaGdUV3ez498BAh
	J4O6oHdd8dbidyiW0DU1AK8sA1Zx/3WlKaMZEB2t3VvEZ8ZsjEYfQVEW
X-Gm-Gg: AYBFou0WJjI+iGSaAnWvo+yIL85gzkM3Z3jzQTz/FsxZgUUp7B9YMB5WhQJa2meGERB
	IqvcVo2ajwwdnYkTjTNwn1cBmJOAXpo8QCBtmeVlVXtse0XcI78FVeD3fTXy/vbK6bmGy7R9pEu
	keFUU6qmm0doN+XBJsAgMiPIBgjxpv5UJyplNHOJyziWljpdJ2QcNcbAZ2l6Mb8G1Teo4aVdJ8j
	tMYrj/pG3ez5jbPGVOCi4yas2KQEHN2FAkpNRBRBbbySfmThJBrjwcda7V5/UAr2xiQPScMyC2P
	Ar+3VYVD7p+zZWqjonHO/WY52QTTSDhDFDE3HBdruVNZWitdf+ES0aUJynfja9fh59PN0wtMK5V
	2nQgE9w2y4tus7hC4vJQuGGZMAtsZaBgGvceQZIUHzgxYIqr6Uq0lv90WZV8a1CV0AcVuvEzDaS
	RYvkhpw5DgZvhZdv1m6nFqzTCMEmg/HLmfFvEibwUVpaImEvK2jVC9gG/G+/y+9M2JorARtTuIy
	a09367GgpU=
X-Received: by 2002:a05:6a20:e293:b0:3dd:a009:3182 with SMTP id adf61e73a8af0-3e16be7214fmr7296993637.42.1791786052877;
        Sun, 11 Oct 2026 23:20:52 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d93c2c75sm3990091a12.0.2026.10.11.23.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:20:52 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH 2/2] ntfs: reject direct I/O reads of encrypted files
Date: Mon, 12 Oct 2026 14:20:40 +0800
Message-ID: <20261012062040.3826828-3-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
References: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_file_read_iter() refuses direct I/O for compressed and WOF
compressed attributes but lets encrypted ones reach iomap_dio_rw().
ntfs_read_iomap_begin_non_resident() has no NInoEncrypted() test, so it
reports IOMAP_MAPPED for the attribute's real clusters and the raw
on-disk ciphertext is copied to the caller.  Buffered reads are refused
by ntfs_read_folio(), but direct I/O never calls it.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Fixes: 9c87959601e8 ("ntfs: update file operations")
---
 fs/ntfs/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 007d1614b9ac6..eb8ed1959cd4c 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -460,8 +460,8 @@ static ssize_t ntfs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	if (NVolShutdown(NTFS_SB(sb)))
 		return -EIO;
 
-	if ((NInoCompressed(NTFS_I(vi)) || NInoWofCompressed(NTFS_I(vi))) &&
-	    iocb->ki_flags & IOCB_DIRECT)
+	if ((NInoCompressed(NTFS_I(vi)) || NInoWofCompressed(NTFS_I(vi)) ||
+	     NInoEncrypted(NTFS_I(vi))) && iocb->ki_flags & IOCB_DIRECT)
 		return -EOPNOTSUPP;
 
 	inode_lock_shared(vi);
-- 
2.43.0

