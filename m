Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA0A3A254C
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 01:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214367; cv=none; b=HmVpT7LlRjZUhrrNk9mz9pSRw+2OYDj6fUr+cQvtWmt8NCfes5nIaeV5FntdKGDyd99vpwTlio1NTMV3IEWp/uozXlb1z2ZfmOd8UEERJs3p2Jek9cycSl34bDyofO13JGAB6eWbcUHXnO5OBfoePd4bhEJcVOCEPyHZFrb8+Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214367; c=relaxed/simple;
	bh=o6Xsq5PXmfsVjo59cvMQE85Pyf3MO+LSaNm6LSwjOaY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VKptN7ljRB6Dpjq+w51oH5therjMCpl6XHLydxG9xhDASvVxploBDsoY47UCfvUn8odKWr5ZUKJrGzz+DXuE3AVznSbjj4PHuIQ4JkRLTht40w9peZKoSj3ugD/AuOwJAlR8xXPKIrQc9TbhGS5wg6n4/Z6s0ygGy+60EgYu3D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b0ff8d44b7b911f19a56ed5b684f684d-20260924
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
X-CID-O-INFO: VERSION:1.3.19,REQID:8a75d225-a362-4866-9324-879bb8d8882a,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-INFO: VERSION:1.3.19,REQID:8a75d225-a362-4866-9324-879bb8d8882a,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:52f49434290bd4dd8d18e6b1f36f1e36,BulkI
	D:2609240946036NTKH88E,BulkQuantity:0,SF:17|19|38|66|78|81|82|102|127|136|
	850|865|898,TC:nil,Content:0|15|50|99,EDM:-3|-100,IP:-2,URL:0,File:nil,RT:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:
	0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b0ff8d44b7b911f19a56ed5b684f684d-20260924
X-User: wangxuewen@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <wangxuewen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 487114032; Thu, 24 Sep 2026 09:45:59 +0800
From: Xuewen Wang <wangxuewen@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 4/4] ntfs: account for direct MFT bitmap cluster allocation
Date: Thu, 24 Sep 2026 09:45:14 +0800
Message-Id: <20260924014514.1678828-5-wangxuewen@kylinos.cn>
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

The MFT bitmap extension fast path sets $Bitmap directly, bypassing
ntfs_cluster_alloc() and its free_clusters and lcn_empty_bits_per_page
updates. Successful extensions overreport free space, and rollback adds
back counts that were never deducted.

Update both counts under lcnbmp_lock and the bitmap folio lock. Require
a nonzero page count and space remaining after delayed-allocation
reservations; otherwise use the regular allocator. The page check also
prevents underflow when the initial scan recorded zero after a read error.

Fixes: 6251f0b0de7d ("ntfs: update super block operations")
Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 fs/ntfs/mft.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 489a5935202c..e01e367a588d 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -1404,10 +1404,18 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 	folio_lock(folio);
 	b = (u8 *)kmap_local_folio(folio, 0) + (ll & ~PAGE_MASK);
 	tb = 1 << (lcn & 7ull);
-	if (*b != 0xff && !(*b & tb)) {
+	/*
+	 * A page skipped by the initial scan has no free bits recorded.
+	 * Honor that and the space reserved for delayed allocation.
+	 */
+	if (*b != 0xff && !(*b & tb) &&
+	    vol->lcn_empty_bits_per_page[ll >> PAGE_SHIFT] &&
+	    ntfs_available_clusters_count(vol, 1) > 0) {
 		/* Next cluster is free, allocate it. */
 		*b |= tb;
 		folio_mark_dirty(folio);
+		ntfs_dec_free_clusters(vol, 1);
+		ntfs_set_lcn_empty_bits(vol, ll >> PAGE_SHIFT, 1, 1);
 		folio_unlock(folio);
 		kunmap_local(b);
 		folio_put(folio);
-- 
2.25.1

