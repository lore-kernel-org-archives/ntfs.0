Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992863;
	b=yhGYjoK5PU4F5hdKrYunmQVgvylpEsQZ6Fa/ST6qjPKQBLQ0qJHrKyPcpjxQdiPBmd0M
	 SWsochG8nx7if+m1AZ/qfSFIyUeb5nv9sV3EviGzLJUtu3STNOaabISKN62sb3kIHSr39
	 oJuSp8YCd4AOztordQP8fI9uzxlhXHe4tyqZEsudgi3CJHo0amj5Ik4icwD6JoKMchMpl
	 JpLutVwc2Obw+QHGZDmbnTFs9RnSZ2FqNYa0CmULPFhoAehSUECxaWIQuLnJm2xbiApLR
	 I7z6nJfYm5NUozUaxn9GourX6x2yXPEjMvdVcXbVlCUAMdg95aHFECb8WLA1P4dInow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992863;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=MFoFqOsxsF0mMxP5c38fD1pVJRD+Yn/OA3ZdUReG7Uk=;
	b=ShFDJSDPCoyMvh/9g4EX9TtHOZnJhQhuxa50nMTA0z5jMpXhozR2z9FcHUw40S1+XLNB
	 iXA7n7/VtCvOV5eu8lpv50dGTiRJWEaerttZY5xDGLsfh+JR4JZTPaVhY9yMqbYhEKKCr
	 EdPKv7VIXo7twU0AoTFnS2ZwiEvgNJCwAGkQNCSd8MbWy4KLTSx3EgaAKSlN24/Wo49iL
	 gQ4JixFj36HtLoTZ+SMB2o8Sgq3kd5dAYu8U7/vT7i4sDyFr4LcWC5vjgctgQNf5uN0bT
	 EkScpeHXrckvl1/0MQx3365Kp9+vsT0Ynt3ZjS91TUjBb5G5tzmJxlaqT01X15X7+7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=oYnK8x0H;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0206A606A32F
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0206A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=oYnK8x0H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=MF
	oFqOsxsF0mMxP5c38fD1pVJRD+Yn/OA3ZdUReG7Uk=; b=oYnK8x0HS/O49Ya6h7
	9jCXvpn2PVLsorH1AZ1W23J1Ad0Abhb24T//6Gadpe8SObT1KMF8tNTLT2SYsxuV
	IklMBao+3kvFJKGmqR36u/H7WWPzvZdBYzbc5THH/BN+PpAo4vHMGaBMHMwgAoGm
	8jRl99mKuqmABZZXUOqIE0eT8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDn7yTNav1qnmzWIQ--.7895S3;
	Wed, 18 Nov 2026 17:07:26 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 01/37] ntfs: propagate mapping-pairs update errors from inode writeback
Date: Wed, 18 Nov 2026 17:06:25 +0800
Message-Id: <20261118090701.1858849-2-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118090701.1858849-1-wangxuewen_ky@163.com>
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wDn7yTNav1qnmzWIQ--.7895S3
X-Coremail-Antispam: 1Uf129KBjvJXoWrZFW3Aw4ruF48GFW3uF15Arb_yoW8Jry5p3
	9xCryDK3yDJFyDKrs2kF4agF1I9a4kK3yUJF1UKw12qwn8KF1vqFWFya18Xr1kCrZ7ta4a
	qF1UuwsruryUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFAp8UUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC8A7n0Gr9as6IcwAA3B

From: Xuewen Wang <wangxuewen@kylinos.cn>

__ntfs_write_inode() overwrites a failed mapping-pairs update with the
result of syncing standard information. fsync() can then report success
while the mapping pairs remain dirty.

Check the update result after releasing the runlist lock and take the
existing error path. Preserve the errno and retry handling for ENOMEM.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes in v6:
Keep the existing standalone writeback fix ahead of reporting helpers.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.
- No undefined references to ntfs_report_* or fserror_report_*.

 fs/ntfs/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 6a9f488e2775..ba1f78fc8c66 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2974,6 +2974,8 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 		if (!err)
 			NInoClearRunlistDirty(ni);
 		up_write(&ni->runlist.lock);
+		if (err)
+			goto unm_err_out;
 	}
 
 	err = ntfs_inode_sync_standard_information(vi, m);
-- 
2.51.0

