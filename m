Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490870;
	b=iCvMgV/y4OzDVQ7QjcuVrO3G0xceAc/3+F5NxK+HA2BnWj56KQyPs5YEsNxsftMI0Sbu
	 EnYoSMmxFeezep451NiVSJEEfOsS7cD5jSzVyuIsGzfnGuA1HuREOgGfwhEvWjng6wZnr
	 UL38G7ZWLYyx4/px0ad3z/XMxscE75wnILmSh2GfGScuSkyjs5oN6Lx6t+vLdGSwoP/fu
	 AqJ0alxEC4cC12a4m8TL7xgz3N/tSHaqLsJBvOb7tQ3oIp+/n06A5/DX/+XeqgDoy4N13
	 5+YGGlrIRO/O/LpfGMcjiMp1ZfgEKrGzdjURkSWLcU+jDRqiU3/M7tGN62tSD/ED+Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490870;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=Cj/sN5gWLFL8+X6KNAdHeNr0leCmTaxFBgtc+cpBvcY=;
	b=t3SCKugyQgMyM9hFU153ECFQZp8EeB8gu/oECWpzGa3lN6jqNc622dmTFg5NHo23azs0
	 m9yrgCH/msD3BhzL+fMb1rHtEO4qI2gwxHOpzV+rYWHgK2SpyTp8iA+dpZEeEWH9oRI6s
	 dKhxJ6oncyqN4RZjavLHl25f+IjSuFKZHg4ZB4OHVSQuh0GuJOAvkf5nxjwTe2fsI1GvD
	 XBxYU9vw82zYPOPfm/TpR7I0LzyjFN8z9QBYkI07EUDeFCe+qK2OyVLnRTbrgh2tUCrq3
	 cytR6NKt/HEpbucTg2rDZyM7a7pfsPg8dz7MtCYp6vY4G8N1rcOZXJJKaIgAVqVgj8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mzwr5Gz5;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8118C606A327
	for <ntfs@lists.linux.dev>; Thu, 12 Nov 2026 13:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8118C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mzwr5Gz5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Cj
	/sN5gWLFL8+X6KNAdHeNr0leCmTaxFBgtc+cpBvcY=; b=mzwr5Gz5+JBSmLX3b1
	kN4FToqqRmTA35yNd1GsjRnqH/yn+yrJiCOukawsS3gWQRcytZlQsL2zXyodlsWG
	O6sPc3nmYvCwSkOloxkBBpxuZkzLRSf6x5L2S4/E//YD4pkonTn0TREEQr3ZFudi
	2DT54hCZk+lGN5w1GrVpQrA2U=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBHhIzjwfVq2wIkFg--.38929S2;
	Thu, 12 Nov 2026 21:40:53 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	ntfs@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1] MAINTAINERS: add Baolin Liu as an NTFS reviewer
Date: Thu, 12 Nov 2026 21:40:40 +0800
Message-ID: <20261112134041.4133634-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
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
X-CM-TRANSID:PygvCgBHhIzjwfVq2wIkFg--.38929S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr15AFyDAF13Cw15urWxWFg_yoW3Grc_Wa
	1fAw4I9Fn8Jr13A395Cr9F9F4Yvw4IgryYyas8K393A390y3Z8t390yFsYkw1kuFykKFZ8
	Za13XFs5JF4xWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbgdb7UUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gXBjGr1weXnbAAA3S

From: Baolin Liu <liubaolin@kylinos.cn>

Following Namjae's invitation, add myself as an NTFS reviewer to help
with patch review.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05aa377ca912..ad9e52282569 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20036,6 +20036,8 @@ F:	drivers/ntb/hw/intel/
 NTFS FILESYSTEM
 M:	Namjae Jeon <linkinjeon@kernel.org>
 M:	Hyunchul Lee <hyc.lee@gmail.com>
+R:	Baolin Liu <liubaolin12138@163.com>
+R:	Baolin Liu <liubaolin@kylinos.cn>
 L:	ntfs@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git
-- 
2.51.0

