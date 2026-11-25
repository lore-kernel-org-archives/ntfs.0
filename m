Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592160;
	b=chDTKO1v9S8zmrrJejSsl1DANzcBFdqDdHjjY0vvd5pjqrdcb2QbesWr/1sOQEKtxr9D
	 y9WRRzT6r7d2DzPLXYfAasuyTLdzc90QGIrgoNGSAoTjajmD/6Lis0vh27AcVEu1DuUFT
	 c5dq92X8hjjsCDarwaTP8lQKooXI/D1/aBOxAhUPUo6wKWQ1FZ8+OcyNjJWNjsU3gWj7X
	 JpUq5JEJxu7t2jNPA7703zHIi/jDF8pMUS2v6ydggbMUpYPI3nPhucF4qdkqzVqKOAVTC
	 0x4YGujjSjrN/eV01eSqGnzvuqjNnrZMrU1XMmr2cbbPcQJtvm6jRJ66/onDL4riZjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592160;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ooQCjiNuSKUklkX004peqIPqDzycSwnydYDuvYVCuAI=;
	b=eOW7yJfIUbE4QtO0FeLnrVZrEvaFeh/xOp/VVrCTPKjaw8T63RW6uyOPNEKiiTVA7XJD
	 ne6ZIFTmzTJJVxOCoX8H4PHuMa8Z67wjmgMtqWw5mXk2vpODIEuU87I+/Eecm03CC70Y8
	 Z2fJWxmXECAAP+lfuHEyAxTuee+D0FpF1xUxRDWAc4fRq8tGieN9qEGlYWY+slL+DJPrQ
	 PVJCpESKuDLJqdGed+Z5ztF1LPl9zRMAEAkOBPpyMiCny4frW5pwmFDzex8OZIfZE6u8Y
	 iKkxG3hL6Tdk5/b0BhW0V3tz0IB/9ugT1V88ejZAl3mnEdgDSoxgqqJvN6fFnq2fn3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC54A606A327
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 07:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC54A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d7939ff8e8a211f19a56ed5b684f684d-20261125
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:97de29f5-0f75-4950-943c-6fd21584329a,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:966943b5b3afe7dfd8fa6fdc5fab1466,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d7939ff8e8a211f19a56ed5b684f684d-20261125
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2111283902; Wed, 25 Nov 2026 15:35:52 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH 1/6] ntfs: mark the record dirtied by a resident write at iomap begin
Date: Wed, 25 Nov 2026 15:35:42 +0800
Message-Id: <20261125073547.154150-2-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125073547.154150-1-zenghongling@kylinos.cn>
References: <20261125073547.154150-1-zenghongling@kylinos.cn>
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

A buffered write to a resident attribute is copied straight into the
mft record found by the search in ntfs_write_iomap_begin_resident().
With an attribute list that record can be an extent record, while
ntfs_write_iomap_end_resident() only marks the base inode dirty, so
the record holding the copied data is never written out and the write
is lost on a clean unmount.

Mark the record the lookup found at begin time, while the search
context still points at it.  This is safe against a concurrent
writeback of the record: extent records are only written out from the
write_inode path of the base inode, which takes the same mrec_lock
the write path holds until iomap_end.

Keep marking the base record in iomap_end.  The base record also
holds the standard information, which the write's timestamp update
modifies and which is likewise only written out when the record is
marked dirty.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 fs/ntfs/iomap.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ntfs/iomap.c b/fs/ntfs/iomap.c
index ce916707f69b..8933f432aa68 100644
--- a/fs/ntfs/iomap.c
+++ b/fs/ntfs/iomap.c
@@ -682,6 +682,15 @@ static int ntfs_write_iomap_begin_resident(struct inode *inode, loff_t offset,
 		goto out;
 	}
 
+	/*
+	 * The record holding a resident attribute can be an extent record.
+	 * Mark the record the lookup found dirty here, while the search
+	 * context still points at it.  The writeout of the record cannot
+	 * overtake the inline copy: it is serialized by the mrec_lock held
+	 * until iomap_end.
+	 */
+	mark_mft_record_dirty(ctx->ntfs_ino);
+
 	a = ctx->attr;
 	/* The total length of the attribute value. */
 	attr_len = le32_to_cpu(a->data.resident.value_length);
-- 
2.25.1

