Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592164;
	b=pJnBIL0/FH166F01lIFdJCfjeymHB3GJHgDXeGbRnLtKvbJcbCkGmZakRiZsrUVm31IG
	 EsawlpE/Fn9ECrBsbtypcXatNYQL4IK0032J86G62GrReYLzoLryCcP9spdG0hpKPd1c6
	 L1d1kh16EHu6IbAfRU3zOBopQNF0cZJSVtLQMW83tg3FkTXSVTEvP1xBZ2lLAMhN0XMwE
	 yMfbIR1/epztxbktZUVdUmvxR4Q9WR0ELhqIsre+4aVLeVWwAbzqGcXobhXoeJ3Nf3Iro
	 bf+593rC1x652gQo1MtiWlj6ZiMLvsdXVtTenBZRrqrMP2JlWEmY7P2hyNjHf/EOeMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592164;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tfj4GvJdtTYJSQqhgrEf85s1RBnslvW7gjwTBisVCV4=;
	b=wRSLUhBUP0C9qRRiHk9S8kxPTrL4z20rQfCGRBW+0h5Td2zpSTh0tes1a0BzsjcrpgNL
	 5nO/0fcH1qhEhFlKZcQnoQoCeJ069Rzpj77XNrOm7uq88v9S7jcw6sG7BQGOuE8jzjZxB
	 xYRC42d6Ux3iqb2TJtxmm8w/Y+6I+bW7JST7PL6Ixnge4pQN4jAnzqy9a2UPPhOt+fzQG
	 uMGxOSnqRQBS6+rfRK6ERMCIS7/U5K/2eXtHaddhR7pk1G0myTQwNacIQ/4+KFz/4ABm9
	 PVh2Pywpuf/QOHGjmh++vbb18v7JX8q72cwpMhlFjZc9EcCEQAqz7Tuk60AhMemUEOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60764606A69B
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 07:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60764606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d9651f46e8a211f19a56ed5b684f684d-20261125
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:3556d7ee-cdbf-4dba-93f8-fdefd96fa2ae,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:27829536124c7f93d76526fa1f6eeea6,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d9651f46e8a211f19a56ed5b684f684d-20261125
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2084237513; Wed, 25 Nov 2026 15:35:55 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH 6/6] ntfs: read initialized_size under size_lock in the mmap prepare path
Date: Wed, 25 Nov 2026 15:35:47 +0800
Message-Id: <20261125073547.154150-7-zenghongling@kylinos.cn>
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

ntfs_file_mmap_prepare() reads ni->initialized_size without the
size lock when deciding whether a shared writable mapping needs
its initialized size extended before the faults start. The field
is published under size_lock, so the read is a data race on the
protocol the other readers follow: a stale low value causes a
redundant call that __ntfs_extend_initialized_size() re-checks
under the lock, and a stale high value skips the extension and
leaves it to the write faults.

Take the snapshot under size_lock like the other readers.

Fixes: 9c87959601e8 ("ntfs: update file operations")
Cc: stable@vger.kernel.org
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 fs/ntfs/file.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 70a86d6fee6b..1f08fe679a86 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -1044,14 +1044,20 @@ int ntfs_file_mmap_prepare(struct vm_area_desc *desc)
 
 	if (vma_desc_test_all(desc, VMA_SHARED_BIT, VMA_MAYWRITE_BIT)) {
 		struct inode *inode = file_inode(file);
+		struct ntfs_inode *ni = NTFS_I(inode);
 		loff_t from, to;
+		loff_t initialized_size;
+		unsigned long flags;
 		int err;
 
 		from = ((loff_t)desc->pgoff << PAGE_SHIFT);
 		to = min_t(loff_t, i_size_read(inode),
 			   from + desc->end - desc->start);
 
-		if (NTFS_I(inode)->initialized_size < to) {
+		read_lock_irqsave(&ni->size_lock, flags);
+		initialized_size = ni->initialized_size;
+		read_unlock_irqrestore(&ni->size_lock, flags);
+		if (initialized_size < to) {
 			err = ntfs_extend_initialized_size(inode, to, to);
 			if (err)
 				return err;
-- 
2.25.1

