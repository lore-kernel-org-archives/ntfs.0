Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604950;
	b=qxeZKKtoHt1+P7yP4uG6i+4sgjmt/Td2cZKKP0M/ZsmAGmP+MrtCgR5xMsdwtIjCChH+
	 ZBDnTijugklOwCf8JXlXPJbMzhKaloZ3VEKTorNcGr/M+rIBpjBqzpvfI0n/0D+8pH2Wi
	 VuADcmq/qM9T8jfOVQ8cmZaxkJI2dJa98W/Tai+fpdtMwIWU1sqgP4mdm+hHopYOrXrBd
	 9ZrSx3cD0q2gIA/+7ZgETehcdNV1/h3s92ZfdCcfpRuBZHJ4mKF4kolEdG4Fr741Ici2n
	 mv6AydkQmfniigS2Va2jbJESXwZTmfFe01XbhgxpiUjVKoBm/iHEd1X8XCpYLh9hxyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604950;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=51GJfDoCzuReIlNFPJ+C9lrZC55gMznOOZPXIJc4KUY=;
	b=0f6cxlYfPitNkgM3M2XDRMwa0YImPLVfx6FuAhVT0klBf48JrbvBcBvHVXCfU2kyMDgT
	 +PcW/dT7Ydk8XVMZBSvbdtqbjVx8lTdSZvxX6aKPWk2GYWQEC3zlgK9zaxiqFE4Bf2enX
	 lD5zS9KzxWPjktCQmZIs5QHbTUqdSvXL4CB96IPENb/emTZQg5hqfhUurw2zbRdol8b1M
	 00PRiyHqDv5T3uQChacRHmO3vJ3D8FYRtieLCzTT3bvFmblqmoWtTaAG3uIQuZV/Pezjj
	 0mUiA3s7JP4EsImV48ohcyB2nPqCVC3VMi1Lo3PR+3CODdq68qi5BmUfwB8H7OIX4Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="cBQhD/39";
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFDE606A324
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFFDE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cBQhD/39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=51
	GJfDoCzuReIlNFPJ+C9lrZC55gMznOOZPXIJc4KUY=; b=cBQhD/39HqoOgLNuNG
	QHTlfzNwBsYtueB9Xl++IWr5ObipRbbM8iuR+yHSP8WavlWJGZDEb6ETjQXY/wno
	W1Ya8GBMzSl0oJ+uF25fN/7K3cVsWT8K0nN29ldHIMzdMz8lVjqRrTBufgpk0vHj
	7ZkgNFKet12IYWkmg30dW0SMs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3f5hGPehqi52fEw--.9836S4;
	Mon, 02 Nov 2026 15:35:36 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v5 02/31] ntfs: preserve cluster-free counts in attribute cleanup
Date: Mon,  2 Nov 2026 15:35:03 +0800
Message-Id: <20261102073532.98873-3-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102073532.98873-1-wangxuewen_ky@163.com>
References: <20261102073532.98873-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3f5hGPehqi52fEw--.9836S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxuryxtr4kWw1UZFW3Cr4rXwb_yoWrWrW8pa
	yxCr1fK3y7X3srWrs7Kw1DZa4Sgay0gFyjgryDJw1Sy3Z0qw1xtFy2yrW8uF4fKrWUGwn5
	Xr4jk3y7ua1DX37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j89N3UUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzQg2H2roPUj5vQAA3f

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
 fs/ntfs/attrib.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index fce7144d7bef..0be410973176 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -4164,7 +4164,7 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
 	struct super_block *sb = vol->sb;
 	struct attr_record *a = ctx->attr;
 	int name_ofs, val_ofs, err;
-	s64 arec_size;
+	s64 arec_size, freed;
 
 	ntfs_debug("Entering for inode 0x%llx, attr 0x%x.\n",
 			(unsigned long long)ni->mft_no, ni->type);
@@ -4252,8 +4252,8 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
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
@@ -4496,6 +4496,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	struct ntfs_attr_search_ctx *ctx = NULL;
 	struct runlist_element *rl, *rln;
 	s64 org_alloc_size, org_compressed_size;
+	s64 freed;
 	int err, err2;
 	struct ntfs_inode *base_ni;
 	struct super_block *sb = ni->vol->sb;
@@ -4760,9 +4761,9 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
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
@@ -5229,6 +5230,7 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 	struct runlist_element *rl, *rlc;
 	struct runlist_element *old_rl = NULL;
 	s64 vcn = vcn_start, lcn, clu_count;
+	s64 freed;
 	s64 lcn_seek_from = -1;
 	int err = 0;
 	size_t new_rl_count, old_rl_count;
@@ -5359,10 +5361,8 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
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
@@ -5410,6 +5410,7 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 {
 	struct ntfs_attr_search_ctx *ctx;
 	int err = 0, ret = 0;
+	s64 freed = 0;
 	struct ntfs_inode *base_ni;
 	struct super_block *sb = ni->vol->sb;
 
@@ -5431,10 +5432,12 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
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
 

