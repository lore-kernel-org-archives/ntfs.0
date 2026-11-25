Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592160;
	b=kxUqapBUaQ5pnGzcU/NOLEAnUS03tD7x8L5xnZ12XRZhL6yq3eD23UnFMF/m/rMxURJC
	 PVL4XJjFXxv1sBw4LBEjodExhT3oGpIAH2OqCwM0GtK7toLjvT4D9eAuypywmySDCGVVQ
	 1o/3VFxspzkf3ZUKbm9duREBqOjMqzJCXjRLtn16BcTAEj4oVyMq64zjydgXDH22E1hgz
	 GTv/CM+ozHmmyaGnwfddHXCoV5rFQuwcmsRCu/GpbcmzC23y1aUnw7ytz2FnWZEtzgI8Y
	 jObD1ebqMB5cqn+rYvxtO8ppyKkc/u/+Wg+2wfhep8QNKKBomFchk4NC0nvHsPhT1Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592160;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sFFfZ8zh/AOPHsiqT+EtunKjQrq3wvAC10Hfwr2KHbk=;
	b=l/CzHuUH7VCDTcPqNcEOxu0azIT1LgGG10Akl4xGAAb7G/+MuGtXtmVuWdqrPpVzfOl2
	 GxXW29hyvASmFDoIY81UcZQNRUIMGlUx2QfxUnWouepT4C0s1HBEi+SHwj8kU4qERalTB
	 1Edu0SCGNEIkKHfcTwVsP75FDTh33lYHgDYaVEguvHOQO3MCa3vb8wMUONACvNrtAIObn
	 KyYj3c2u+VOB1Z/X8Xf6yER23vqMmF1CiTUJJ8VE5oHAr7LRpkbNDfe+XZecCARsP5iRC
	 tPuKcAk59j1e1mGKYsUqRg2CCIBzYt0XngUjO5arT9EVQ+joSEyTwk1IVWmkVtGa/Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D03606A321
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 07:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D03606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d7408890e8a211f19a56ed5b684f684d-20261125
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:82c56f9e-b88d-4b70-a21d-24b4b6f21e40,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:2d4f18720db5d709156c32c69748758f,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:-3,I
	P:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d7408890e8a211f19a56ed5b684f684d-20261125
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1275116871; Wed, 25 Nov 2026 15:35:51 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH 0/6] ntfs: synchronize the in-memory size handling
Date: Wed, 25 Nov 2026 15:35:41 +0800
Message-Id: <20261125073547.154150-1-zenghongling@kylinos.cn>
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

The in-memory size fields of an ntfs inode - data_size,
initialized_size, allocated_size and the compressed size - are
meant to be protected by size_lock, but the iomap readers and the
runtime writers reach them without the lock in several paths, and
the mmap write fault path extends initialized_size without the MFT
record lock every other caller of ntfs_attr_set_initialized_size()
holds.

The first two patches fix bugs found while auditing those paths: a
resident write whose data can land in an extent record that is
never marked dirty, and a failed write that leaves the attribute
extended. The remaining four close the races: the iomap paths
take a coherent snapshot of initialized_size, the writers publish
the sizes under size_lock, the fault path is serialized with the
MFT record lock, and the mmap prepare path reads initialized_size
under the size lock.

Compile-tested on x86_64.

Hongling Zeng (6):
  ntfs: mark the record dirtied by a resident write at iomap begin
  ntfs: roll back the size update when the attribute lookup fails
  ntfs: read initialized_size under size_lock in the iomap paths
  ntfs: update the in-memory sizes under the size lock
  ntfs: serialize the mmap write fault initialized size update
  ntfs: read initialized_size under size_lock in the mmap prepare path

 fs/ntfs/attrib.c | 49 ++++++++++++++++++++++++++---
 fs/ntfs/file.c   | 11 ++++++-
 fs/ntfs/inode.c  | 82 ++++++++++++++++++++++++++++++++++++++++++------
 fs/ntfs/iomap.c  | 74 ++++++++++++++++++++++++++++++++++---------
 4 files changed, 186 insertions(+), 30 deletions(-)

-- 
2.25.1

