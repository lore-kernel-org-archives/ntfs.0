Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82793A6412
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 01:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214364; cv=none; b=QSUyIai+dJmSNAoM+k6fcH4N6GrzBhAYt3EUT6jolmXKZSb9rTo6l0XN9albWGu3xTaFjlGK5O0slGSCjYGciX4uCbizv+U/AVGC7wZGFjkwZEqMC1htH1ACvmzHKkNUQklZOk5xBPnz0uSKQmPp3grSMTwU+ve7SWUM6435C5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214364; c=relaxed/simple;
	bh=NlzbwuWqoBofbCF25WPMDEBWH+DmLB9TroDEhB95QU4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WaMIO5PbivWP+qDJxu3MhsgrkSfJOfpTcfqMcBOj3cpCaeO24l7EM0xeaMZ901WCcnLAatTuIuYgzPw32YB/BJt1uz8t/eV7bynYpZ7iZPCAqV73hRfb+NpYMlMAA4C6zX+JR1RPYnjruZl+2jyerLNApvatCp7BjOndd9pZiR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: aec3a056b7b911f19a56ed5b684f684d-20260924
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
X-CID-O-INFO: VERSION:1.3.19,REQID:2d3a67bd-64ee-4467-8d8f-cc6ca95007c5,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-INFO: VERSION:1.3.19,REQID:2d3a67bd-64ee-4467-8d8f-cc6ca95007c5,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:2e19eaed52b24fbbd406f6a668586cba,BulkI
	D:2609240946005FWDQJVK,BulkQuantity:0,SF:17|19|38|66|78|81|82|102|127|850|
	865|898,TC:nil,Content:0|15|50|99,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:
	nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,B
	RE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aec3a056b7b911f19a56ed5b684f684d-20260924
X-User: wangxuewen@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <wangxuewen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1269013409; Thu, 24 Sep 2026 09:45:55 +0800
From: Xuewen Wang <wangxuewen@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 3/4] ntfs: wait for the bitmap scan before MFT bitmap extension
Date: Thu, 24 Sep 2026 09:45:13 +0800
Message-Id: <20260924014514.1678828-4-wangxuewen@kylinos.cn>
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

If MFT bitmap extension fails before the initial $Bitmap scan completes,
rollback calls ntfs_bitmap_clear_bit(), which holds a folio lock while
ntfs_set_lcn_empty_bits() waits for the scan. The scanner deadlocks if it
still needs that folio.

Wait for the initial scan before taking the runlist or bitmap folio locks
and attempting allocation.

Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 fs/ntfs/mft.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 12666668a80e..489a5935202c 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -1352,6 +1352,10 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 	size_t new_rl_count;
 
 	ntfs_debug("Extending mft bitmap allocation.");
+	/* The initial bitmap scan must finish before we lock or change a folio. */
+	if (!NVolFreeClusterKnown(vol))
+		wait_event(vol->free_waitq, NVolFreeClusterKnown(vol));
+
 	mft_ni = NTFS_I(vol->mft_ino);
 	mftbmp_ni = NTFS_I(vol->mftbmp_ino);
 	/*
-- 
2.25.1

