Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992862;
	b=VY9puj5Famz29bcwgR4rttP1x/mwVYV2d0JQDk5pMogy44B5dt/SuHaKMfPtqK9V5NQ1
	 pCtmA7cSFODfyIkqCfqJECJCS+6N6Lv19ttN4WuPf1H7+F5ywN0NcU67YWZwX/swtkLpv
	 05m7B6thRaH/x/RncVmDnGFkiuH2ABm5Uk0ZLic9Hx+VMB4LJ4NC2xQnzGOIn97ifw6vT
	 FQxUDGWvzPkoeol2+IRvX4ISFJSb2RjqzK5lt/KjXXnEMSb4Dw8l58T132GQrJlqw5j2z
	 uPsNHWEJN1XslbNW0ru8T81HhHXk01kD8WIAVfc/iWAsx8wpCJlrGqGUovU7LSDnbXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992862;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=yPTYnjS9dfOlVPsaqtPNbHzv4R+Dc3E0RGRzxTOWvsw=;
	b=Y9uPr3UtWwc596zFvOWUClkpzTH99+qSM15Z9Zwdd8Kvj0RkBq89t/QSXqAnq2kl+0bq
	 RmJpe+dCgzRNtSCSGzhvJoitlBZ+J96RMxg7vGx6XDutgwDXupkJu5HWnVW0tV3pnSiRw
	 OFG60DcWbx2dd9NBs3ubp+F6u7fghcey54tYpls7Ds4AZSNiGUqZqQEaNCKnV511oYwS6
	 j7Ep3p8lUdQxD46a0EArwXUox4O5qY/BecKiZ1yclWmPmB3i+hb6tHt36o0u5W094Kqp+
	 fqk4Xm2KXJtI2Wo1mh2Oa3z24A2qbOKP7srEhnqCblSQ1dzob0MArrY94kHw196LiAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MqunJeh2;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52037606A334
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52037606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MqunJeh2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=yP
	TYnjS9dfOlVPsaqtPNbHzv4R+Dc3E0RGRzxTOWvsw=; b=MqunJeh2m1aGBcvOzK
	y9AyuHMAQQH9ZcYmWLMA/4vU9DVXv4Z0WvmCpvavZIkBwRJouDwLZYeFpaV0k11j
	400JpUTtsTR3MiyHlJEenmjS6ZKies9hzoUF2RcTZtAbTYpoY2xayoBqFNw7VAa7
	qb4wyfwC7ABFtooKrkdiQZV7A=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDn7yTNav1qnmzWIQ--.7895S4;
	Wed, 18 Nov 2026 17:07:26 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 02/37] ntfs: preserve cluster-free counts in attribute cleanup
Date: Wed, 18 Nov 2026 17:06:26 +0800
Message-Id: <20261118090701.1858849-3-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118090701.1858849-1-wangxuewen_ky@163.com>
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wDn7yTNav1qnmzWIQ--.7895S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxuryxtr4kWw1UuF13urW7Jwb_yoWrCrykpa
	yxCrn3K3y7XF9rWws7tw1DZa4Sgw40gryjgryDJw1ay3Z0qw1xtas8trW8ur1fKrWUGwn5
	Xr4UK3y7u3WUX37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UJ9NxUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzg-n0Gr9as-y5wAA3R

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_cluster_free() returns a signed 64-bit cluster count on success,
not an integer status. Several attribute cleanup paths truncate that
count or treat a positive count as an error. ntfs_attr_rm() can even
return the count to callers that expect zero on success.

Store the result in s64 variables, test negative results for failure,
and compare the full count when validating an allocation rollback.
Return zero from ntfs_attr_rm() after successful removal. This keeps
successful deallocation from being misclassified by later reporting.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
Changes in v6:
Keep the existing cluster-count fix ahead of reporting helpers.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.
- No undefined references to ntfs_report_* or fserror_report_*.

 fs/ntfs/attrib.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 9266a3ea3b0f..72e0c94c878e 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -4194,7 +4194,7 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
 	struct super_block *sb = vol->sb;
 	struct attr_record *a = ctx->attr;
 	int name_ofs, val_ofs, err;
-	s64 arec_size;
+	s64 arec_size, freed;
 
 	ntfs_debug("Entering for inode 0x%llx, attr 0x%x.\n",
 			(unsigned long long)ni->mft_no, ni->type);
@@ -4282,8 +4282,8 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
 	 * the whole run list and thus it doesn't matter that the attribute
 	 * record is in a transiently corrupted state at this moment in time.
 	 */
-	err = ntfs_cluster_free(ni, 0, -1, ctx);
-	if (err) {
+	freed = ntfs_cluster_free(ni, 0, -1, ctx);
+	if (freed < 0) {
 		ntfs_error(sb, "Eeek! Failed to release allocated clusters");
 		ntfs_debug("Ignoring error and leaving behind wasted clusters.\n");
 	}
@@ -4526,6 +4526,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	struct ntfs_attr_search_ctx *ctx = NULL;
 	struct runlist_element *rl, *rln;
 	s64 org_alloc_size, org_compressed_size;
+	s64 freed;
 	int err, err2;
 	struct ntfs_inode *base_ni;
 	struct super_block *sb = ni->vol->sb;
@@ -4790,9 +4791,9 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		down_write(&ni->runlist.lock);
 rollback_locked:
 	/* Free allocated clusters. */
-	err2 = ntfs_cluster_free(ni, ntfs_bytes_to_cluster(vol, org_alloc_size),
-				-1, ctx);
-	if (err2)
+	freed = ntfs_cluster_free(ni, ntfs_bytes_to_cluster(vol, org_alloc_size),
+				  -1, ctx);
+	if (freed < 0)
 		ntfs_debug("Leaking clusters");
 
 	/*
@@ -5323,6 +5324,7 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 	struct runlist_element *rl, *rlc;
 	struct runlist_element *old_rl = NULL;
 	s64 vcn = vcn_start, lcn, clu_count;
+	s64 freed;
 	s64 lcn_seek_from = -1;
 	int err = 0;
 	size_t new_rl_count, old_rl_count;
@@ -5453,10 +5455,8 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 		ntfs_attr_reinit_search_ctx(ctx);
 		err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 		if (err) {
-			int err2;
-
-			err2 = ntfs_cluster_free(ni, vcn, clu_count, ctx);
-			if (err2 < 0 || err2 != clu_count) {
+			freed = ntfs_cluster_free(ni, vcn, clu_count, ctx);
+			if (freed < 0 || freed != clu_count) {
 				ntfs_error(vol->sb,
 					   "Failed to free cluster allocation. Leaving inconsistent metadata.\n");
 				NVolSetErrors(vol);
@@ -5504,6 +5504,7 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 {
 	struct ntfs_attr_search_ctx *ctx;
 	int err = 0, ret = 0;
+	s64 freed = 0;
 	struct ntfs_inode *base_ni;
 	struct super_block *sb = ni->vol->sb;
 
@@ -5525,10 +5526,12 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 			return -ENOMEM;
 		}
 
-		ret = ntfs_cluster_free(ni, 0, -1, ctx);
-		if (ret < 0)
+		freed = ntfs_cluster_free(ni, 0, -1, ctx);
+		if (freed < 0) {
+			ret = freed;
 			ntfs_error(sb,
 				"Failed to free cluster allocation. Leaving inconstant metadata.\n");
+		}
 		ntfs_attr_put_search_ctx(ctx);
 	}
 
-- 
2.51.0

