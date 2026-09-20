Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845D53BC673
	for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893132; cv=none; b=k3gaTGYGPA29MzPSAkVc4rI+mkuDXcoo/485UDM9k8kdh+MH4z4HKlgsli+b6sYkIh/ep+oWYEOjKXobL70z5rsUMtM8ttKFWBAANGRFXEaOJo0WctGpuCGvE3ks5k73ZTscDG8NNiu9tr5vQWMRuEgVOEAG7Q/JJwuRicjnQSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893132; c=relaxed/simple;
	bh=FNasp7qn5/aS/FD+KLe5fFnz3qQTxwRqsjG1qhfs2hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cEHiiBPzDpu8kPGMYiWgvmttvnZLiRvMjQ0JqvtlrRsozKtTgucgxN/Cv+yBofhgX/Gi4NDh72MgxvYlyeM1ACWEC2w/vgXj3fz54RSFk+LHrsY7wuKeGLDuin8p52d2JMaF7F3dEwzfHKxLoS1p0xq57zaIb5JqHDSHG1sEhls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OvWCcME1; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OvWCcME1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=j5
	HjGAHMTWSY12pij/fAtgg5ecT4GvjimQP4EK5oNPo=; b=OvWCcME1TQ/Maj0bwa
	B2QqmQUPk6G4FIZ2todkm6feDBCAgwPVr/vj5vAFlGbx6LHSmazau1tgogu2Vyzk
	0Npg6ao/2e3zNYdkqxn4CQvmDuY2449YIK/CvjQHLmlvqKTmymCrmYcx8h13eMjb
	mCdWeF35G73nnfs7UyID6qdjU=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgB3m07lma9qs7GbAQ--.54162S6;
	Sun, 20 Sep 2026 16:31:43 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 04/10] ntfs: preserve EA attribute lookup errors
Date: Sun, 20 Sep 2026 16:31:25 +0800
Message-ID: <20260920083131.1880061-5-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260920083131.1880061-1-liubaolin12138@163.com>
References: <20260920083131.1880061-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgB3m07lma9qs7GbAQ--.54162S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxuryxurWxtr4UXr13Aw18Krg_yoW5tw45pF
	yfGry3twsxX3ZxKFs2yw1DX3WYvas7GryUKr9rK3Z2kr1rt34Dtw15KF9Y9FyFyrWrJ340
	gF4UKay7Cr47Xr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URE__UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwQ8o8mqvme8L5QAA3J

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_attr_exist() treats lookup failures as absence. Using it while
updating EAs can select creation or removal paths after an allocation
or I/O failure.

Use an EA-local lookup helper that preserves errors from mapping the
MFT record, allocating the search context and looking up the attribute.
Check both EA attributes before modifying either and return EUCLEAN if
only one exists. Keep the known presence state for the final update.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/ea.c | 51 ++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 5c6facae4ed5..f5a112495fc9 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -181,6 +181,29 @@ static inline int ea_packed_size(const struct ea_attr *p_ea)
 	return 5 + p_ea->ea_name_length + le16_to_cpu(p_ea->ea_value_length);
 }
 
+/* Unlike ntfs_attr_exist(), preserve lookup errors. */
+static int ntfs_ea_attr_lookup(struct ntfs_inode *ni, __le32 type)
+{
+	struct ntfs_attr_search_ctx *ctx;
+	struct mft_record *mrec;
+	int err;
+
+	mrec = map_mft_record(ni);
+	if (IS_ERR(mrec))
+		return PTR_ERR(mrec);
+	ctx = ntfs_attr_get_search_ctx(ni, mrec);
+	if (!ctx) {
+		err = -ENOMEM;
+		goto out;
+	}
+	err = ntfs_attr_lookup(type, AT_UNNAMED, 0, CASE_SENSITIVE,
+			       0, NULL, 0, ctx);
+	ntfs_attr_put_search_ctx(ctx);
+out:
+	unmap_mft_record(ni);
+	return err;
+}
+
 /*
  * Set a new EA, and set EA_INFORMATION accordingly
  *
@@ -198,7 +221,8 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 {
 	struct ntfs_inode *ni = NTFS_I(inode);
 	struct ea_information *p_ea_info = NULL;
-	int ea_packed, err = 0;
+	int ea_packed, err = 0, ea_err;
+	bool has_ea;
 	struct ea_attr *p_ea;
 	u32 ea_info_qsize = 0;
 	char *ea_buf = NULL;
@@ -211,7 +235,16 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 	if (name_len > 255)
 		return -ENAMETOOLONG;
 
-	if (ntfs_attr_exist(ni, AT_EA_INFORMATION, AT_UNNAMED, 0)) {
+	err = ntfs_ea_attr_lookup(ni, AT_EA_INFORMATION);
+	if (err && err != -ENOENT)
+		return err;
+	ea_err = ntfs_ea_attr_lookup(ni, AT_EA);
+	if (ea_err && ea_err != -ENOENT)
+		return ea_err;
+	if (!err != !ea_err)
+		return -EUCLEAN;
+	has_ea = !err;
+	if (has_ea) {
 		p_ea_info = ntfs_attr_readall(ni, AT_EA_INFORMATION, NULL, 0,
 						&ea_info_size);
 		if (IS_ERR(p_ea_info)) {
@@ -230,15 +263,9 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 			ea_buf = NULL;
 			goto out;
 		}
-		if (!ea_buf) {
-			ea_info_qsize = 0;
-			kvfree(p_ea_info);
-			goto create_ea_info;
-		}
 
 		ea_info_qsize = le32_to_cpu(p_ea_info->ea_query_length);
 	} else {
-create_ea_info:
 		p_ea_info = kzalloc_obj(struct ea_information, GFP_NOFS);
 		if (!p_ea_info)
 			return -ENOMEM;
@@ -249,12 +276,6 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 		if (err)
 			goto out;
 
-		if (ntfs_attr_exist(ni, AT_EA, AT_UNNAMED, 0)) {
-			err = ntfs_attr_remove(ni, AT_EA, AT_UNNAMED, 0);
-			if (err)
-				goto out;
-		}
-
 		goto alloc_new_ea;
 	}
 
@@ -404,7 +425,7 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 	/*
 	 * no EA or EA_INFORMATION : add them
 	 */
-	if (!ntfs_attr_exist(ni, AT_EA, AT_UNNAMED, 0)) {
+	if (!has_ea) {
 		err = ntfs_attr_add(ni, AT_EA, AT_UNNAMED, 0, ea_buf,
 				ea_info_qsize + new_ea_size);
 		if (err)
-- 
2.51.0

