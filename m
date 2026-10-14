Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3FA1A6829
	for <ntfs@lists.linux.dev>; Wed, 14 Oct 2026 01:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791940732; cv=none; b=QaAFmo0BRr9fWDkwpGQ7XmTEli8p0mqGned/AxS5eWWwiJ0S1iMfCcCz7qxW2sk8dztmJPSWpaHJohsC+J7KvG23Z14D240+PedjbWWCg57PMRpfPinfecxXu+800D0exJ+ufWRDm8XZBnnCpAdm9kdhugdj3Z6RfMzeFjcdkX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791940732; c=relaxed/simple;
	bh=AMl2aWuauYzcDFthFpyeaYA3wlVJBMbQKbHj0jXbfJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RU1R9JUZMQ85Vt6a72Vi8EuADZgqGIuFGqKGc0gzDgKxGA8SOSWJJ0ubrrYJhcqKidRob/VRDitn/7siG7Z5dU92fnUWgzNLznLA8s/SOWEnuKyeUqsOTK1TjpzxxMkKT0N4rszIgfEuMvnkyAldiNZnacb+oUQoYuwjB1K3Pi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2fef8074c76d11f19a56ed5b684f684d-20261014
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, CIE_UNKNOWN
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a5738390-a88d-486e-82bb-c653abb40bff,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:a5738390-a88d-486e-82bb-c653abb40bff,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:2626081ce28e968e1183f334528d0287,BulkI
	D:261014091842K86BXRZZ,BulkQuantity:0,SF:17|19|38|66|78|102|127|136|850|86
	5|898,TC:nil,Content:0|15|50|99,EDM:-3|-100,IP:-2,URL:0,File:nil,RT:nil,Bu
	lk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:
	0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2fef8074c76d11f19a56ed5b684f684d-20261014
X-User: wangxuewen@kylinos.cn
Received: from localhost.localdomain [(223.104.40.190)] by mailgw.kylinos.cn
	(envelope-from <wangxuewen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1274830366; Wed, 14 Oct 2026 09:18:39 +0800
From: Xuewen Wang <wangxuewen@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v1] ntfs: report birth time for symbolic links
Date: Wed, 14 Oct 2026 09:18:24 +0800
Message-Id: <20261014011824.493241-1-wangxuewen@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NTFS already loads the creation time into i_crtime and reports it through
ntfs_getattr(). However, the symbolic-link inode operations omit getattr,
so statx() with AT_SYMLINK_NOFOLLOW falls back to generic_fillattr() and
does not return STATX_BTIME for the link itself.

Use ntfs_getattr() for symbolic links to expose their stored creation time.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Tested in QEMU with WSL and native symlinks, including dangling links and
links to directories. Birth times survive inode cache eviction, remounts
and a fresh boot. Queries that follow a link still report the target's
creation time.

 fs/ntfs/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 58afd310d57b..58aad7f5c6c5 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -1556,6 +1556,7 @@ const struct inode_operations ntfs_file_inode_ops = {
 const struct inode_operations ntfs_symlink_inode_operations = {
 	.get_link	= ntfs_get_link,
 	.setattr	= ntfs_setattr,
+	.getattr	= ntfs_getattr,
 	.listxattr	= ntfs_listxattr,
 	.fileattr_get	= ntfs_fileattr_get,
 	.fileattr_set	= ntfs_fileattr_set,
-- 
2.25.1

