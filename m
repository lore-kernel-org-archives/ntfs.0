Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166434;
	b=pUkkIJBP/fHCXf4txDT+ZJAyxJZEuL1cJpqsMgmj/mNao0i4z0BakePvgb+mCYGgSg0J
	 TaTtLdzUcb7meN8vNSm1wyp3+QmdjfqKAYYMb00FkgP9Vd6h2zPpVW6SeialmN3FbWbG7
	 nHSgcnmYGdsIi7wSbGzQUVMOde4NwInMMKCU1MxzAPwf02i3rd6Qjj4Z2D83UbDfe+Z1P
	 FLk2FGiokSs3UEhR90XaLCwgWwHnFTuoUMifAK/ZcikAyHz15ZYLsNZBTOPsAZZkWBHoB
	 xuqEb5mkYNKj4dGSy8ZaNClZ2bJP0QhVM2y8uwkUXp3J2YRNnOAlullwlI0fMCmnzHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166434;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=jykj+J5j3I6ZYh1fHmFdTIcd47f0fiZsu2R7FO70BkY=;
	b=yZnoyqsgZJPJoF+Nrp/QSn3hzppX5/+hFxYRx1Hwb3Qasfib7xUPM3BTdEIsFjQ5nxlC
	 tnPSbM2KxPcSDc3xM0b3gaPfLF/ZTOiyAAxFzXyhnHhP66f9AAmmR0HLApZos6oCswzle
	 O0pMgnTa0COE5nc8FcrzinRTguzJEjHKIO/XEdLqjcNrJiiZxMYT3/N0W/yskC4rWxsHK
	 5n40ewviNmcBUp0H74SvdVMTCYo+7rimapXiO1l5l7KCSsN87uJWPH8QcWmEEZHiSZcfI
	 reHrRtWVtA/zRoJonfoD2hxnw8SreErDpkoaqM6ECFIOgn+G0RSPrbRYNoRp7Z0xAvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=g3WyxYE4;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE6260A2604
	for <ntfs@lists.linux.dev>; Fri, 20 Nov 2026 09:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCE6260A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=g3WyxYE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=jy
	kj+J5j3I6ZYh1fHmFdTIcd47f0fiZsu2R7FO70BkY=; b=g3WyxYE43PT3cWDtQ1
	ybOO+n0qL0j5wqKFMi0i+iSUaoNAcv92Pmjk5E9SshFh4G27kqceARpgyGNCbWy8
	MqN9vLgu7Zh2qprgPpiPXOIXEaC69AqMisKMgWUtrwtuKwBS45IwaNSYJJX37PgO
	YH11r9raKA8d4fVQ08k1XVYAU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDnTz_QEABrJQCZHA--.47213S2;
	Fri, 20 Nov 2026 17:20:18 +0800 (CST)
From: Dandan Wu <dand_wu@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>
Subject: [PATCH v1] ntfs: use kvfree when ascending an index tree
Date: Fri, 20 Nov 2026 17:20:15 +0800
Message-Id: <20261120092015.2469284-1-dand_wu@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:PigvCgDnTz_QEABrJQCZHA--.47213S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyfXFy8trWrXF4kuw13XFb_yoWDArb_Xa
	1xXrWkur15JF17C3Z8C34kJryfKrs5Gr97Kr97KF9Iqay5Jw4vv39rtrs5ZFs7WrW2qFn8
	Cr9xKryIkr1fKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRKOzsJUUUUU==
X-CM-SenderInfo: xgdqvslzx6il2tof0z/xtbC6RITqmsAENLS7AAA3V

From: Dandan Wu <wudandan@kylinos.cn>

ntfs_index_walk_down() allocates the index block with kvzalloc(), which
may return vmalloc memory. When traversal ascends back to the root,
ntfs_index_walk_up() passes that block to kfree(), which cannot free a
vmalloc allocation.

Use kvfree(), as the index context cleanup already does, to handle both
allocation types.

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
 fs/ntfs/index.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index b4462f760e3b..d565accb05d5 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -2274,7 +2274,7 @@ static struct index_entry *ntfs_index_walk_up(struct index_entry *ie,
 		ictx->pindex--;
 		if (!ictx->pindex) {
 			/* we have reached the root */
-			kfree(ictx->ib);
+			kvfree(ictx->ib);
 			ictx->ib = NULL;
 			ictx->is_in_root = true;
 			/* a new search context is to be allocated */
-- 
2.25.1

