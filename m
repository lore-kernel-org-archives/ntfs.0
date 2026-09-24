Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE34239D3FD
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 01:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214354; cv=none; b=UP3/shYglVC1EPDccUOgWjyS58ajOBXV3JjbI6phlo1faDY6FbViQmdjDhf8vrGIwM16UWJp8xbX7owozdctxcDvTKluyFnVTsgNmEwRFVESlTgZeReOynnRREO7bNz+SrMONUQuQTg8n3iuiQ1bjWIOQKhd4huoDuBvkJ5F2jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214354; c=relaxed/simple;
	bh=7r527Yk1UbVeRDnlPmYI5WSwV+ouVCPoTrgY70vXBCA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mHIzoGDXSIkUkZniV+OhQidKMtWOHaeLUaoZWG2GzOeEtqPvl8WXJmQxZ6hnZ9HWvEohFbkzppBLG3OFZ/UYD0UcA5cnKONHMJHMdCbAypaktgnzRFMHX0hxeMIWewiLAkBtTT8eO0y7vj+ek9yhsZOsSotfGNRcRQDsdIPuELM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a858c098b7b911f19a56ed5b684f684d-20260924
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
X-CID-O-INFO: VERSION:1.3.19,REQID:deba02b9-51a8-458f-aa44-757ca1b9bd22,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-INFO: VERSION:1.3.19,REQID:deba02b9-51a8-458f-aa44-757ca1b9bd22,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:e8b58cdf5c1363703c8e1bbed8f941a0,BulkI
	D:2609240942213WNWGTJX,BulkQuantity:1,SF:17|19|38|66|78|102|127|850|865|89
	8,TC:nil,Content:0|15|50|99,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a858c098b7b911f19a56ed5b684f684d-20260924
X-User: wangxuewen@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <wangxuewen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1663653424; Thu, 24 Sep 2026 09:45:44 +0800
From: Xuewen Wang <wangxuewen@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v1 0/4] ntfs: fix MFT bitmap extension allocation
Date: Thu, 24 Sep 2026 09:45:10 +0800
Message-Id: <20260924014514.1678828-1-wangxuewen@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes four bugs in the MFT bitmap extension path:

  - The adjacent-cluster candidate can be outside the volume. Check it
    before accessing $Bitmap and fall back to the regular allocator.
  - The allocator can return an adjacent cluster that merges with the
    existing run. Preserve that run when rolling back a failed extension.
  - Rollback can wait for the initial $Bitmap scan while holding a folio
    the scanner needs. Wait for the scan before starting the allocation.
  - Direct allocation changes $Bitmap without updating the cached free
    counts. Update both counts and honor per-page accounting and space
    reserved for delayed allocation. 

Xuewen Wang (4):
  ntfs: bound the adjacent cluster in MFT bitmap extension
  ntfs: fix rollback after MFT bitmap run coalescing
  ntfs: wait for the bitmap scan before MFT bitmap extension
  ntfs: account for direct MFT bitmap cluster allocation

 fs/ntfs/mft.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

-- 
2.25.1

