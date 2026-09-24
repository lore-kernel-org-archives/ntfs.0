Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082843101A2
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 01:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214362; cv=none; b=E8XTghAFYr7SPbhxK4FiGRtYqDLC/uVtFXFlczAAeSMlLg+hK+YSPmVKHvOaZ2STkdce6d39hBZkpdJn6tfgdrwccPP428nRwok0LIOmnVV/m+VPyym1D0riP9HIzeJXrru1qpsKhq/vO7w7iXsvOtuemAP2e9fOK4VrTc8jTfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214362; c=relaxed/simple;
	bh=qAZ4/9+Tox0YpY0TsXe4o3Fh2mO+2N43EJOmI3rPFmI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OkeGFUGMZ6GyclgQeKY2RRSWKNOy5GQojumJEg+LfRiyFKMjRF8mmpOUuf30DHcewjfDT7jVvZ5pg3gz6aXXoaLaC6AMHtrwye9YyQE3baQUqJ9Pd/Q5XoO44sRVnXXhx2ahTHF8g3McUfGnScxEUHIervPPQ0s2GN0IhZqrlVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ad5b29b4b7b911f19a56ed5b684f684d-20260924
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
X-CID-O-INFO: VERSION:1.3.19,REQID:9cdb7bbf-42a3-4331-8af3-0d5407e45726,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-INFO: VERSION:1.3.19,REQID:9cdb7bbf-42a3-4331-8af3-0d5407e45726,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:a08f7343481c5f8f54eb5fae658f5ca5,BulkI
	D:260924094557KZ3KSU5J,BulkQuantity:0,SF:17|19|38|66|78|81|82|102|127|850|
	865|898,TC:nil,Content:0|15|50|99,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:
	nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,B
	RE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ad5b29b4b7b911f19a56ed5b684f684d-20260924
X-User: wangxuewen@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <wangxuewen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 927248115; Thu, 24 Sep 2026 09:45:53 +0800
From: Xuewen Wang <wangxuewen@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 2/4] ntfs: fix rollback after MFT bitmap run coalescing
Date: Thu, 24 Sep 2026 09:45:12 +0800
Message-Id: <20260924014514.1678828-3-wangxuewen@kylinos.cn>
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

After the direct allocation attempt drops lcnbmp_lock, a concurrent free
can let ntfs_cluster_alloc() return the adjacent cluster. The merged
runlist then extends the existing last run, but rollback assumes a new
run was added. A later metadata failure removes the old mapping and
frees its first cluster.

Record whether the allocated cluster is adjacent before merging the
runlists. On rollback, shorten a coalesced run by one cluster and free
only that cluster; remove the new run for a non-adjacent allocation.

Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 fs/ntfs/mft.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 88bac85d22bc..12666668a80e 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -1428,6 +1428,8 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 					"Failed to allocate a cluster for the mft bitmap.");
 			return PTR_ERR(rl2);
 		}
+		/* The adjacent cluster may have become available while unlocked. */
+		status.added_cluster = rl2->lcn == lcn;
 		rl = ntfs_runlists_merge(&mftbmp_ni->runlist, rl2, 0, &new_rl_count);
 		if (IS_ERR(rl)) {
 			up_write(&mftbmp_ni->runlist.lock);
@@ -1442,8 +1444,8 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
 		}
 		mftbmp_ni->runlist.rl = rl;
 		mftbmp_ni->runlist.count = new_rl_count;
-		status.added_run = 1;
-		ntfs_debug("Adding one run to mft bitmap.");
+		status.added_run = !status.added_cluster;
+		ntfs_debug("Allocated one cluster for mft bitmap.");
 		/* Find the last run in the new runlist. */
 		for (; rl[1].length; rl++)
 			;
-- 
2.25.1

