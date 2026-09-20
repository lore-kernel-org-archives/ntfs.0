Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A163D9556
	for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 06:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789885940; cv=none; b=bQBkQBKlaYM6IxgrfwLh31NOYUmXwD5651LREr8NsEXhWlFmIR4bEBLJR53+cRz3iChMsO8hHQ00BCqxGvxrocRUDEr9N0mB9tbqSRN+AR243Yzek6gok/V0xMW6ZxBDnoixpw7qWSIW1qNTRWW0q9S6lAbRWFvxYkO4X+M1Xe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789885940; c=relaxed/simple;
	bh=pAERUW8myD8CNy2U4OteOdJ/vkvuBTpnim9iNvmMlf0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bDsPTzjGV72+GuSFf8dJ5S3zQd7KrjEXO2jrcoSX2XzPaspHdHvK0BCv8NoHAPZdc/zzD01HoBa7EAKSV1EvqnnAXWrZBBaHJJGydhKKEvnc1KKkVjCp00K5LaTWivm8XYBa9HRMCGjE1GrKoQcUA56Q90ImDfu8rokXNa+XXBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 014e4150b4bd11f19a56ed5b684f684d-20260920
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
X-CID-O-INFO: VERSION:1.3.19,REQID:b3c004ea-2d5d-4cd1-bb14-abe007292fed,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:b3c004ea-2d5d-4cd1-bb14-abe007292fed,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:a97caa48f5a694a96ff053bb118d16ee,BulkI
	D:260920143212CE1VE3T0,BulkQuantity:0,SF:17|19|38|66|78|102|127|850|865|89
	8,TC:nil,Content:0|15|50|99|100|102|158,EDM:-3,IP:-2,URL:0,File:nil,RT:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,B
	RR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 014e4150b4bd11f19a56ed5b684f684d-20260920
X-User: wangxuewen@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <wangxuewen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1462341643; Sun, 20 Sep 2026 14:32:08 +0800
From: Xuewen Wang <wangxuewen@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1] ntfs: preserve the 64-bit FITRIM minimum length
Date: Sun, 20 Sep 2026 14:31:53 +0800
Message-Id: <20260920063153.376958-1-wangxuewen@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The minlen member of struct fstrim_range is a 64-bit byte count, but
ntfs_ioctl_fitrim() uses max_t(u32, ...) to compare it with the device's
discard granularity. This truncates the requested minimum length before
passing it to ntfs_trim_fs().

For example, a minimum length of 4 GiB is reduced to the discard
granularity, allowing smaller free extents to be discarded. The truncated
minimum length is also copied back to userspace.

Use max_t(u64, ...) to preserve the requested minimum length. The bitmap
scan already compares the aligned extent length against range->minlen
using 64-bit values.

Fixes: 9c87959601e8 ("ntfs: update file operations")
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 8164326b7812..e315fed4d13b 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -866,7 +866,7 @@ static int ntfs_ioctl_fitrim(struct ntfs_volume *vol, unsigned long arg)
 	if (range.len < vol->cluster_size)
 		return -EINVAL;
 
-	range.minlen = max_t(u32, range.minlen, bdev_discard_granularity(dev));
+	range.minlen = max_t(u64, range.minlen, bdev_discard_granularity(dev));
 
 	err = ntfs_trim_fs(vol, &range);
 	if (err < 0)
-- 
2.25.1

