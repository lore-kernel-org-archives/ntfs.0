Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612150;
	b=MlttJC+5mEPmGcAtPSYXjfHuF+zwHpF+jY6IOj02cQHym6KZoP1aCrJliXIfsFKe0wxy
	 oScA6BW4X0K28Xberagk841VAhaPhiYdQJosnlipgBp4eNxxRLRggheUtiP7pwA5cpUSj
	 D25tnSzWR36YYo1Y4vuwNmsxw6KsXdJI2ZN3glcafVuCgBYSgCDvrHMVmtJ2gk2r/gNLz
	 MLD3bcxnsyXIfa5MEhW7AQla7LsU1AwWKvU74jEbKoaXuU+YRwhfwSurO2NRX2xwpIl6r
	 ZoTMZIdHxE0fY1tT74y1cpbXNySJj5QUj7+ovWuVI+BIyNVGfSkMW2i5neHiXLbxrKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=nvbS9iFrs32HLnd2NRpzXjnfEXZME1jnaetqHlPZ2Dg=;
	b=cCZ1eNdtoY9d2NmggKIiye6jJ9rnoWT+LltvcdhkU3vUJhgV371tVeKL3c5IQ6BqhZK+
	 plTka7aeHWnUxnqBBRn/plUJ0iMPPBR0wJswL1fi/J3kofBM6mxNtiK1ECFPYMvElk4gx
	 rz5ye3m+2oWqdwjYpeAkqSIPwOSg6HnWz9S/ttTw/IOSQt/d1mrYjZ7bD3eGmQr00mICC
	 aLEPAyWn8S7k0N7MzTIoMekvfme5laoFCIZ4HEDwwwFQeW4TJkQcjZDbSlF2rxG/+KVXr
	 HD7uNvyG7HLv7u7cqo0aupaxw2mntHEwJ7/iq57G8Iz/n70xh8Gt+0i8Bws88uolU/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtYDTM7Z;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CC6606A326
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 09:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4CC6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtYDTM7Z
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a06210b29fso1053165b3a.1
        for <ntfs@lists.linux.dev>; Mon, 02 Nov 2026 01:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612149; x=1794216949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvbS9iFrs32HLnd2NRpzXjnfEXZME1jnaetqHlPZ2Dg=;
        b=jtYDTM7ZQhGqMlllndGus3HWp6m7HQzWeToOH3IukH8fVt2l3eIH63j7yA8jmg/WF4
         NzEG2RZuDosEnZDr5LTlBpfM7sgCx0Ynh06k9sUGKRtndjJcaa0M1wYBmGTLfaLwX1Ym
         VsxPRJHq127cvHqhEn6CcmiT7xqGik0IZ+VlSjyMvL4SI5CcpkvA2WGlsIrh2W7kzAEj
         uPCQixkN58qmdPhkfuDzahgOqD8gyfJ2RuUDYL4LZ+FbPkNYaVk1CSN61H7lVpzdmwKs
         DdIfXHHYvKtpYbe+CY7zHhF2YB7LipI0D9g8v3P5rdwxfyZVrQ9YJqROlSIZth8SMH7c
         Kg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612149; x=1794216949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvbS9iFrs32HLnd2NRpzXjnfEXZME1jnaetqHlPZ2Dg=;
        b=CerzcY4kgjV818dqmpMoJR861b4bDVXuS+eyB0RedazoB1BtShNxVBTKFHo8aFoVI4
         7N3G0OIAPfTcr30vb3ec0ltwvTINc+ZWhmBfG9AnFvzCFtpm/sc5xNbRGppJaaf15CMp
         7zfDg9Y2/3n6z6/Dp57JAJvjDV7hlxvUGcFh/SenNh9P4A0URnbOfIjjYhaZuPgMtmcS
         nwSFZIe/VlWqsc8ZhpZH0ZXtF0wgRbPMyPIh48z5zsCUG36Sm7gfgnrOdhWOC/qAR+r/
         mRSB+ksYCOdyWGtXKLqvZ1VGTrrUIWTyb7AObxVZAQjpO08yWlK4aWlra72Evu74wvBP
         nPxw==
X-Gm-Message-State: AFq9FYI8ZaDSxPSSgboXZ75SED5AjX4CooduKKlIer7qSd9Z8IXqMsyd
	IG8Bj/sK/E8za9qyGp+uge52AldB9gB/VEsoVVfKsUuL90hmi6T8mzPf
X-Gm-Gg: AYBFou2l5UQ6LiVVpvKWkSuzD6G8mzl0p32iexKKEol6SVLNyBFj29qQjp6NirCbL9e
	XzPH6qSPUgJ/+KZlYUIoA7XVxHnqDfswv8xnbGxwX/VEzWyIFU+rNaeH5apog4H4I1fxMBXW8pS
	oOBdpmRXFV2bJOCOMenX8pVFOY+mNehNtKjq9IUXBTP5cpubWUDAZNN7mEJmGVAutT3KD3VmmZE
	p5/13fOAucsGDh7ZGR1NfC8VD+hj2Wf436Sf2qLz0U6vRquU771uxKQN5tf5IOxhyzBDZ4YxG1F
	jytEwpT+DbGqux/s7jvNcrRDCHi6yZFiNjrjBq584MagPm3wM1rcuE8UMCzAip+OoMBx0kN7cRK
	KPQNPrSV1DrYcK0shxKA7OblwxgfRzlYhQpgccbyLGUecvyPJLjpoyU96VxjWPAnFb/Peno/i8J
	weXftFSH3xEbFkx71Qky4gbMHzC15AjjzaYujb+oghhTbRN2d3ekGf+H+Uw9dNcBLVnNL8zYSOx
	JJy5isz1q5nEQ21ewwzK7m+Rl6f1MA3Gn5NV73mP+xyb1pf/ooKPQ/erKwEXmvZ9h6fMKfasyXf
	Wa1NVQoGoqbm7sLRN2NJRF2o3rmXdjGfpod5ClINWEWGYqaPEDwoAnaZdad2eWRtnSM=
X-Received: by 2002:a05:6a20:d81a:b0:3e2:3392:53e7 with SMTP id adf61e73a8af0-3e92885cfb5mr9195393637.0.1793612149040;
        Mon, 02 Nov 2026 01:35:49 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963d6acsm1773626b3a.18.2026.11.02.01.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:35:48 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH] ntfs: don't allow compression on volumes with clusters larger than 4K
Date: Mon,  2 Nov 2026 17:35:43 +0800
Message-ID: <20261102093543.1199671-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

On a volume made with "mkntfs -c 8192", a user can set
FILE_ATTR_COMPRESSED on an empty file through system.ntfs_attrib.
Writing to the file and reading it back after dropping the page cache
then crashes:

  BUG: KASAN: slab-out-of-bounds in ntfs_read_compressed_block+0xa2c/0x2040
  Read of size 8192 at addr ffff88804355a000 by task dd/106

The read path only handles clusters up to 4K. It copies each cluster
out of a single page, and a compression block of 16 8K clusters does
not fit in the 64K ntfs_compression_buffer. Loading an inode already
rejects compressed data on such volumes.

Reject the flag change the same way.

Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 fs/ntfs/ea.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index fa5c5c625751..68397b2a4e43 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -721,6 +721,11 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni, __le32 fattr)
 		goto err_out;
 	}
 
+	if ((new_aflags & ATTR_IS_COMPRESSED) && ni->vol->cluster_size > 4096) {
+		err = -EOPNOTSUPP;
+		goto err_out;
+	}
+
 	if (!a->non_resident) {
 		if (!(new_aflags & (ATTR_IS_SPARSE | ATTR_IS_COMPRESSED))) {
 			err = 0;
-- 
2.43.0

