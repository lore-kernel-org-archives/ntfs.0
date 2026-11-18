Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992946;
	b=qxWAJzR5wgl42IGZEirXkVMHX9esxqNhXRVK6Qh1f+Pr2UCHzW+i8nE4u4CCuBUKAnqt
	 Z1K5nLwEqFzb8TZCQR1P84M6qevZrHmiW5gOsszUHIeI2cNNIPYV1A1VFcdJfM7UEMeGN
	 VDUdKZBcaljLlEtSycOHH1nlZQY7KGdn1SsDTsVtqVEPedGVc1NarMg73dFiqowLhC9fV
	 3pCel7UPpa8FxVibkVV4qEJy7sY/UnUijTbdpbYwXBLv1VbE9vcOL/+txPwK0MYtAmNeB
	 xx3kiYoGg7KlaOYqGv0ckVCQgpe1/OqLehqY+2XVkVfT0xsrI5EkchAENy5PRMJNQYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992946;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=dHtuWAtrj+xNhQpB4xrei+7wLFyasNoXtGo9DFiqG+M=;
	b=ci5BX9F1sled1/3fbvTl6iYwxY1+w/utoFfpTnF9TTRPN2r5zBkpUiL7iUCCDPnIgZY4
	 1zvISKPZnUWyKzUuBcYlLPd2HCgwxlPm8ll37xAYnKgWwrEPoiLutQgGfExxWeaLe4pHq
	 ug9xk+8t35eTvzcRQckysp2dkBTa/MGE9OSakzNBr503bgBjSPMPWHa8peMYLtjye+pA+
	 CqgrkUpKDKAhch1s1bH6dbXjqe8i4x+oob+AILDWKbiCxS+/EUYarUREjgeRkbBLqrioK
	 Mk840hFHQUTBuvAlLMVgMoc1AAb0bm6akuSTEYhJFtSq56YZkQBz8q14dKDdZ1Tkiuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=M39xBiBF;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F4B606A31C
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F4B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=M39xBiBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=dH
	tuWAtrj+xNhQpB4xrei+7wLFyasNoXtGo9DFiqG+M=; b=M39xBiBFBvDiq9w+HW
	JVbnIKVf9XUaZUWgzjr6Nj5jULx4g4sBEfIh7VjDCBK1WCUljxi5w8MIZfjRfMr1
	h3wDtWDXmWkSSa0LRrOIRRkdRinqcN7tKyBX+oZrHo5ER16m7iIYAB6pnZcRT6Sc
	0YVpVfuY3dN/b9xTPVGgQNJf0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3_+gOa_1qh6wGIA--.32884S2;
	Wed, 18 Nov 2026 17:08:31 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 08/37] ntfs: preserve buffered fallback writeback errors
Date: Wed, 18 Nov 2026 17:06:32 +0800
Message-Id: <20261118090701.1858849-9-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3_+gOa_1qh6wGIA--.32884S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWDCFW7CFWfGr4fWrWfZrb_yoWkKFc_Wr
	yvy3409r1UCF1kGw1xCFnYyFs5tw4FgFWfXryFkF98J34kJwn8urs5AFs5CFZrWayqgFyr
	Grs3u3y5XrnIkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUNBMtUUUUU==
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzQ-34Gr9aw8hOQAA3+

From: Xuewen Wang <wangxuewen@kylinos.cn>

The buffered fallback of a direct write waits for writeback before
invalidating the written pages. It replaces any writeback failure with EIO,
discarding more specific errors such as ENOMEM.

Return the error from filemap_write_and_wait_range() through the existing
cleanup path.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes in v6:
Extract buffered-fallback writeback errno propagation from v5 patch 23.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.
- No undefined references to ntfs_report_* or fserror_report_*.

 fs/ntfs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 55c48d174b28..b1c6a84bf955 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -805,7 +805,7 @@ static ssize_t ntfs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		ret2 = filemap_write_and_wait_range(iocb->ki_filp->f_mapping,
 				offset, end);
 		if (ret2) {
-			ret = -EIO;
+			ret = ret2;
 			goto out;
 		}
 		invalidate_mapping_pages(iocb->ki_filp->f_mapping,
-- 
2.51.0

