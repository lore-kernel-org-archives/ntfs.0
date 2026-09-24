Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5F53A1691
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 01:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214362; cv=none; b=KTX0EEW3/5ckMUGoZUG9ITkEov93xA89z3cKtqiJGqy80XR6kWtqySfCqHy4GhLcWhb4EBMTXYubzoJI4K0h8V/uY6w8IFPTY15mSfJuRGWE3hsGd1Q4Yl9zoxuU7fVUP70DxkDZDsL810tIcORFmm+qAlnKLEDdS/XAvTf8D9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214362; c=relaxed/simple;
	bh=dxy399WUjBoRMIH8cJhYZYgATLxdcgUdisCMgfangPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ecsyHqK9HkPEtryMugR/eQEwFFvA/SjgFOD3uQqXyBs07ePqFIlGcqyBikTWy0VFwsQEb8+DzUpDGL8qDqXLkTS/QvNVG99JgNHEMxWdk6ao065fZROVswfQiiKmBelyn3dUjyd0UfznR30U+VihhYTyMRU7ixwhUpu2UsnSp4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ab34e3b4b7b911f19a56ed5b684f684d-20260924
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:11d9a4eb-7260-4c2a-9369-c0a7919a8468,IP:20,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:45
X-CID-INFO: VERSION:1.3.19,REQID:11d9a4eb-7260-4c2a-9369-c0a7919a8468,IP:20,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:45
X-CID-META: VersionHash:7db8b62,CLOUDID:e9f6c5b322c338abeb9d4d80d0611d3f,BulkI
	D:260924094224I221WTT7,BulkQuantity:1,SF:17|19|38|66|78|81|82|102|127|850|
	865|898,TC:nil,Content:0|15|50|99,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:4
	0,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
	:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab34e3b4b7b911f19a56ed5b684f684d-20260924
X-User: wangxuewen@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <wangxuewen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 520938948; Thu, 24 Sep 2026 09:45:49 +0800
From: Xuewen Wang <wangxuewen@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 1/4] ntfs: bound the adjacent cluster in MFT bitmap extension
Date: Thu, 24 Sep 2026 09:45:11 +0800
Message-Id: <20260924014514.1678828-2-wangxuewen@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260924014514.1678828-1-wangxuewen@kylinos.cn>
References: <20260924014514.1678828-1-wangxuewen@kylinos.cn>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the last MFT bitmap run reaches the volume boundary, the direct
allocation path tests the bit for nr_clusters, an invalid LCN. A clear
bit allows an out-of-volume allocation; a bitmap read failure aborts
extension even if valid clusters remain available.

Check the candidate LCN before accessing $Bitmap and fall back to
ntfs_cluster_alloc() with no locality hint when it is outside the volume.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 fs/ntfs/mft.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 8bb8b4085c8b..88bac85d22bc 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -1377,6 +1377,11 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 	lcn = rl->lcn + rl->length;
 	ntfs_debug("Last lcn of mft bitmap attribute is 0x%llx.",
 			(long long)lcn);
+	/* There is no adjacent cluster if the last run ends at the volume end. */
+	if (lcn >= vol->nr_clusters) {
+		lcn = -1;
+		goto alloc_cluster;
+	}
 	/*
 	 * Attempt to get the cluster following the last allocated cluster by
 	 * hand as it may be in the MFT zone so the allocator would not give it
@@ -1413,6 +1418,7 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 		kunmap_local(b);
 		folio_put(folio);
 		up_write(&vol->lcnbmp_lock);
+alloc_cluster:
 		/* Allocate a cluster from the DATA_ZONE. */
 		rl2 = ntfs_cluster_alloc(vol, rl[1].vcn, 1, lcn, DATA_ZONE,
 				true, false, false);
-- 
2.25.1

