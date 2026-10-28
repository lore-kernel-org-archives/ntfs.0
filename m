Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174831;
	b=OT2qZEwkJZq+FvJz/2LXnvq4J90Ts5GUP9aHq8lw+ZC9QBPjAlZwtINrJW4PrYJdt6lN
	 b7YX7i6q+a+3VF2iG2updX+HG7a+0XDi5pGEGb4h8KsT27QbNjgbFFQ34j95aO7AHJHXb
	 NOFnTBwBkRyrcGj1CgK8bUBcxCFZXR7J59ivxrWAio5JBMjrdkRCEDs53OMMenlJVeYuY
	 yst2yRUew7RTmnZVY0UcaavhZJu6fphhNWRBko8lPKxG1aGLJ2cfW/Ekr6wjjZM8eM/IT
	 cQUhLGEWEaMJUJ6WMTtAJHta+GnILKrQU95ce0WVQSd2cXopOx666HZ42pIrHHZBsHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174831;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uN//U6fNaSCGxuuwZCqjExmTgMh6aYpdlR4p/jLbEeo=;
	b=uoHNK4iMmvU5AnPiFjOsLkmk89kAdWsOqXhIlUXCc4rmEtQ/GPIG4ylVgUpidnCUN7lF
	 vsn5va1VshWuJlRQY44wlcE6859o5ZpSkdPJ+suG8kqg3NUMPtvCZ93TZ7PRYoxlvfbUu
	 zK/dMaeYhot0OgfC3rQ07too5ZO6gJal1Y3mL88dE9N4+YcS6LCWxSQw4NrXVOhSSlKDI
	 bUg7gy/uGCZq8JwrqRA13viaC9c4JFzw4uQ95yBJ21jNS13xFNhhS6O7eBka6KrOLW9yw
	 /HfQtTcldCNnEDhXtfFp4VIkAZw6am6Wu++aDRHRT11UeY7K29avJZWOUvyemm6yw7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D05E606A329
	for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 08:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D05E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8d48e01ed2a611f19a56ed5b684f684d-20261028
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4e23c3a1-597a-4e39-8353-ce32cba52248,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:01797ad0175a58478b9f4426142abb31,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	2|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8d48e01ed2a611f19a56ed5b684f684d-20261028
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1853876311; Wed, 28 Oct 2026 16:07:00 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH 1/2] ntfs: keep the file size on a failed initialized-size extension
Date: Wed, 28 Oct 2026 16:06:55 +0800
Message-Id: <20261028080656.1027283-1-zenghongling@kylinos.cn>
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

ntfs_extend_initialized_size() only extends the initialized size and
never changes the data size, but on a failure it calls
truncate_setsize() with the old initialized size, which shrinks the
VFS size down to it and drops the page cache beyond that point.

None of the callers rolls the shrunk size back.  A buffered write
into a hole has nothing to roll back - the data size never changed -
so the file keeps the shrunk size even though the data size on disk
is intact.  The mmap and named stream callers return without any
rollback either.

The sizes did not change, so nothing needs the shrink.  Remove it.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 fs/ntfs/inode.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 206db4e99ef1..ac13e8776909 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2599,8 +2599,6 @@ int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
 	mutex_lock(&mrec_ni->mrec_lock);
 	err = ntfs_attr_set_initialized_size(ni, new_size);
 	mutex_unlock(&mrec_ni->mrec_lock);
-	if (err)
-		truncate_setsize(vi, old_init_size);
 out:
 	filemap_invalidate_unlock(vi->i_mapping);
 	return err;
-- 
2.25.1

