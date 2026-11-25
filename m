Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592162;
	b=EAv4kDgsWDRVKak7drTIabaCeEeTZc0SiNrAk8qU8UJ8RgakGHmoDuvurVHE45DPNjdO
	 ayJ9+O0kMKWQO1xwi8pS3srYOC3rgX6BFT1kN/jk2qSHBluM2p8jTNFDTwCsuTGUM0w8+
	 03Q6Ov+wOv2xKtVlgI5DQbSpUMAgT2HbeNTeg6OL6qNZad+zA9pCkVi0SpB512AjI23F8
	 fuscBH5rOv2U2Tf8Qyn2GXMMSv2qlukDI5kqE9AHce/pogQPOOGZMnqNa4j6pOjcuY8ZH
	 bqkQky/jNxQkZSxEieLTuj6UJNALWBcObK2yp+lXRXW/kh/jZ8gP+qmd0oTipozMoEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592162;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pnBC1ohBhFqnn61EsxpK913kVpLGLBaUvOubF7Iy0/Q=;
	b=Ivz4BzYFbLkIkbFNfh7P/h0p98hS319rRYA7WO1Gq2EY8tx9OhKMYsWTgodXxb+bIRFY
	 o7Oc+DK4wImZo4c3sLhLh2em1jE9Qkb4dzZ2YkJ3g2dlc4Hl/wQvA6/kAdCpnwztvaZeF
	 Qe0Q0SzG1/4F3Z+1+rWEyvp3n5DI5YMpWilikaPc8kMSoiQrJGuu0EcS16I1BGTX6Ro9Q
	 Cxdh9frsTMCfPcldum6CGy5u3AvnLKQj/dpx6CwAIkznsD/X5hjmUetwiY/yrLXK8YSeB
	 tuQbg2c6FsgY5+Ini2DzT5RTBH5Sha6iR0KkNEIphluMGV98J3h3JQzF6FDWaZG74kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933AF606A335
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 07:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 933AF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d90b560ae8a211f19a56ed5b684f684d-20261125
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:cefdf36f-81b9-46c3-829e-0c18c6ff040e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:8c4455f7485ffddea7273dc41b000047,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|850|865|898,TC:nil,Content:0|15|50|9
	9,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d90b560ae8a211f19a56ed5b684f684d-20261125
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 7419267; Wed, 25 Nov 2026 15:35:54 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH 5/6] ntfs: serialize the mmap write fault initialized size update
Date: Wed, 25 Nov 2026 15:35:46 +0800
Message-Id: <20261125073547.154150-6-zenghongling@kylinos.cn>
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

The mmap write fault path checks whether the faulting range extends
past ni->initialized_size with an unlocked read and then calls
ntfs_attr_set_initialized_size(), which rewrites the field and the
MFT record with its argument unconditionally. The call is made
without the MFT record lock that every other caller of the function
holds, and a buffered write or a second fault extending the
initialized size between the read and the rewrite can make the
rewrite shrink the field again, which exposes initialized data as
uninitialized.

Hold the MFT record lock across the check and the update and read
initialized_size under size_lock inside the critical section, so the
decision is made on the value that is current for the record and the
field can no longer regress through the fault path.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 fs/ntfs/attrib.c |  1 +
 fs/ntfs/iomap.c  | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 081ce3e829f2..56df3049a386 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -2431,6 +2431,7 @@ int ntfs_attr_set(struct ntfs_inode *ni, s64 ofs, s64 cnt, const u8 val)
 	return ret;
 }
 
+/* The caller must hold the base inode's mft record lock. */
 int ntfs_attr_set_initialized_size(struct ntfs_inode *ni, loff_t new_size)
 {
 	struct ntfs_attr_search_ctx *ctx;
diff --git a/fs/ntfs/iomap.c b/fs/ntfs/iomap.c
index afc4494822e1..39772e9e5f32 100644
--- a/fs/ntfs/iomap.c
+++ b/fs/ntfs/iomap.c
@@ -676,10 +676,17 @@ static int ntfs_write_da_iomap_begin_non_resident(struct inode *inode,
 			return err;
 	}
 
-	if (ntfs_iomap_flags & NTFS_IOMAP_FLAGS_MKWRITE &&
-	    iomap->offset + iomap->length > ni->initialized_size) {
-		err = ntfs_attr_set_initialized_size(ni,
-				iomap->offset + iomap->length);
+	if (ntfs_iomap_flags & NTFS_IOMAP_FLAGS_MKWRITE) {
+		loff_t initialized_size;
+
+		mutex_lock(&mrec_ni->mrec_lock);
+		read_lock_irqsave(&ni->size_lock, irqflags);
+		initialized_size = ni->initialized_size;
+		read_unlock_irqrestore(&ni->size_lock, irqflags);
+		if (iomap->offset + iomap->length > initialized_size)
+			err = ntfs_attr_set_initialized_size(ni,
+					iomap->offset + iomap->length);
+		mutex_unlock(&mrec_ni->mrec_lock);
 	}
 
 	return err;
-- 
2.25.1

