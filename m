Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAE93AAF45
	for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 05:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787204981; cv=none; b=sdAA83kwSP6ubiQRWPw+96ny17laHsxkBWdECkBpCXnQRLH8MCUo6QZe+e6Fy8EGxLH31T/ymjfk6NVA6iNDUHeRI2WhN1AhTpNBQzV7A5Ow5lJTuCkMmjwgP3xW1gm17QDVgPv2BSf6/AJip2l8GJ04FutQCpqMxolxLnySze8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787204981; c=relaxed/simple;
	bh=bS6diHPNKgh8Zt8igaGFmr3OirGO10kbQJ9u7nZBMJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hewEGvreDoYEaJo1M7u6TVssIRU/6nSw7EHbB0jn1UmQA/s9Ut0l9BvCkUAJNRJtjUaHckC7yAOF1wptM9IzqVFUBi2+qJbdEg21mhyrnNUHp0FUmBLgSEzv1cXV09h3aEGl3QjoPc7N/O9ND4hHca14aG9i8U5uhOaVWxMgX10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHY8z0ak; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHY8z0ak"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3900e39d935so1880865a91.0
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 22:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787204980; x=1787809780; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcLnofB4Fum5QISpRWKXzXpDWTs53sdPvh6GfbQEsWE=;
        b=PHY8z0akUzwih/0c9sB6l2RjrQGThajiJsv4EGAohhCkM38TJmfDpdqlhAi67R5oFT
         Hyix+rxewG0nyHEmRNDZXc8oSpvXkg7v0UvsineHTR73blEYmpJd8L9+f797JceTJNkb
         jjQsqhnYk0RDMaGO5nXypQaZPcCdBMKyffTdlf1u8/Mwn/EmwZt4MeF3n8p4A7IjyVs6
         l25PtAca02CPnxV5q5mb0Qj7xcc6Kcei1Jz2LE5skR1u/gjGFYhWD3GJIKb2uyt4tYzp
         dVbau63q6Vu/2FU6MOeaH54tqns1zqpu3tkbbsbA2R2FVjduG8AbNxmpZ53MJc8rfOr2
         ND9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204980; x=1787809780;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcLnofB4Fum5QISpRWKXzXpDWTs53sdPvh6GfbQEsWE=;
        b=bSWd9XzoZbb1cDkioSV7LLEBfkNsb1xJLMtS7/zXkadcmRgPx5mmPDVLXMX7a8sUkC
         Rls8FIRBEY9pDSemUzUlu70gF1taG8xddFDcDG6x75ZyS9XQyrC4n6WmekGDBbAftWAg
         DB0gSlBJQBeIJDo5apO3WdiAA9lHumoLr18xRWbk1TOD9OwY6i48Tqao6XMwfkHfC1Ba
         RL5B7Srktg33UUIRv10BqoUJLgWZXsErsKPKX9zruDY0v7tcVz94/oKxmy0q+i/HYRaP
         6MWcQ8lbzYGu1qL2xZXhHjOJ+nfvstexfAzGsyR6Ypz7W3aS+RSRgczZ+talJVmdF/fY
         lnUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqY3VoaaZuU9ElncZH6muXdPyELJiH2ytYiiNnlDrOefkWluy5RYRu0ulGbi4dbbeGXrh0@lists.linux.dev
X-Gm-Message-State: AFuF++n4KVboYK0b71zMYCYfkEOuqaWJmGC2UjOxqDTXt2mvdfVrZMVx
	GKX2w+f1qXccZG2A35EYkFcI5qfryxez72snT5lEPan8usKt91x0zyHe
X-Gm-Gg: AR+sD1035Q8YehJ1H89n09zobUpuUIla32+dcWAd4H6kMkxN9SgBf5nlfpipuYbfz9G
	CJRcada/CV+8IlFpOleCefzJR0zLdXsKCvaq1diSgxycmLPgiJhltWz0+TFbAgCKmI+BXGAVjIc
	wJk2Z9/b0h4XjvRO8wt7rMuQYwjrBUwNz1fPSDIsSYcrtGpQxFFiDOqn66pYEWdNIellZjjxXuj
	jBXNLqh0RoaG8zsKqCYYqSfefNWIZvMpGo5LfpPtskGI2gZUra/Igq+e6XfW7y/YoWYHBSugsV9
	NxPSdXwkG3SyrNplbg5GEGJIh6ukTBwyVpTLDXi5F+8gR47B46e6ZMJraNjst0Yr0bdHN3FXMgC
	oWx9kxq9KSy366ziTbBrDsY51fi1vah4++wfRtAewBVTBjbNAZPvXizXKs1FvJhkTeMRGtCBKkM
	MLh0P65m0wlijjqGVxjVTtWWT52Vt8vL1LgP14NCh+kiyVrB4Im5KUlZiUfSsgLcAtlW0=
X-Received: by 2002:a17:90b:2c8f:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-39580f119d1mr18965419a91.8.1787204979748;
        Wed, 19 Aug 2026 22:49:39 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395b66bccf5sm106766a91.2.2026.08.19.22.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:49:38 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 4/9] ntfs: return errors from ntfs_attr_readall
Date: Thu, 20 Aug 2026 14:48:17 +0900
Message-ID: <20260820-topic-wof-v2-v3-4-ef6149b4541e@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820-topic-wof-v2-v3-0-ef6149b4541e@gmail.com>
References: <20260820-topic-wof-v2-v3-0-ef6149b4541e@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5878; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=bS6diHPNKgh8Zt8igaGFmr3OirGO10kbQJ9u7nZBMJc=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhpUMCcj206sI4J8xJNT2Xq31HV2GMwazppRLt
 1xnuOnzv/iJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoaVDAAKCRA08jD6945I
 0wfsD/9GS2/f4we9Wd/YxgwpaI0EIXXbBD4uO4B0XKZrDuO6dj4N8jvRhHaMKaSUaSXS/GY1VN0
 kY9PC0SHdT5EPRwZUnyO70cmGpH/tZRe/KRSQctKuc7gHofeTloI48flg5CREB24VTHoXAUfgF7
 m5k2pWwZB8b0FDBSZRodasOzhdv2H3PZC4Yt3yqJDq59HJOfetzhXq6xKbDuesJxOkGGwMUdthn
 hrc5itnStFBNwHZB3H3oHOw49h4lG7luXKajo26DNKgyoMZdfAU+4LIw/kpvUngGjLBWV875aTf
 v2LA6NUuRcnJXK+aa2C8AnNEo6piW3cFVx/FvCWOvlL0nklrUXq9+d9eLy+qKtCcQHP4HCbFetG
 WZ8gNRV9BD2R8F4CI/wIQCw0X4zPpxsR4zgHX7ifNxQloVsWHa6fRC1f1ggm6fhwlBgaOkzhDkz
 76sqFx0P5lexS5dlXM+A27iiiw1PgZ30XY8HiV5FAh1veZC+pw29ezbqq7bUa6rKe24m9MTD+wc
 jXwr6GRuHVhj2A0hxszF90beBFzIMsK7tF07mDsmef8M/et2N1kHI/BrDOOOKWTj9bnjOV1+TOc
 uaG1PfXkpVXKFR5JWu6q4xVMdVcPBVp88dlQGTMGk9+u1l9YZr8R4z9/GvNaPA8lE2lh5e9VebV O/N0j0DeFFA7vmA==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

ntfs_attr_readall() currently loses the failure reason for attribute
lookup, allocation, and read failures by returning NULL. Return ERR_PTR()
with the original error instead.

The reparse parser can then propagate allocation and I/O errors without
treating them as filesystem corruption.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/attrib.c  |  8 +++++++-
 fs/ntfs/ea.c      | 38 +++++++++++++++++++++++++++++++-------
 fs/ntfs/index.c   |  4 ++--
 fs/ntfs/reparse.c |  4 ++++
 4 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 990c3937a551..d9e844c481d8 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -5296,6 +5296,7 @@ int ntfs_attr_remove(struct ntfs_inode *ni, const __le32 type, __le16 *name,
  * On success a buffer is allocated with the content of the attribute
  * and which needs to be freed when it's not needed anymore. If the
  * @data_size parameter is non-NULL then the data size is set there.
+ * On error, an ERR_PTR() containing the negative error code is returned.
  */
 void *ntfs_attr_readall(struct ntfs_inode *ni, const __le32 type,
 		__le16 *name, u32 name_len, s64 *data_size)
@@ -5310,6 +5311,7 @@ void *ntfs_attr_readall(struct ntfs_inode *ni, const __le32 type,
 
 	bmp_vi = ntfs_attr_iget(VFS_I(ni), type, name, name_len);
 	if (IS_ERR(bmp_vi)) {
+		ret = ERR_PTR(PTR_ERR(bmp_vi));
 		ntfs_debug("ntfs_attr_iget failed");
 		goto err_exit;
 	}
@@ -5319,17 +5321,21 @@ void *ntfs_attr_readall(struct ntfs_inode *ni, const __le32 type,
 		(bmp_ni->type != AT_BITMAP ||
 		bmp_ni->data_size > ((ni->vol->nr_clusters + 7) >> 3))) {
 		ntfs_error(sb, "Invalid attribute data size");
+		ret = ERR_PTR(-EIO);
 		goto out;
 	}
 
 	data = kvmalloc(bmp_ni->data_size, GFP_NOFS);
-	if (!data)
+	if (!data) {
+		ret = ERR_PTR(-ENOMEM);
 		goto out;
+	}
 
 	size = ntfs_inode_attr_pread(VFS_I(bmp_ni), 0, bmp_ni->data_size,
 			(u8 *)data);
 	if (size != bmp_ni->data_size) {
 		ntfs_error(sb, "ntfs_attr_pread failed");
+		ret = size < 0 ? ERR_PTR((int)size) : ERR_PTR(-EIO);
 		kvfree(data);
 		goto out;
 	}
diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index fc6cec7ce130..c8a3d9f07dc4 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -122,17 +122,19 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
 
 	p_ea_info = ntfs_attr_readall(ni, AT_EA_INFORMATION, NULL, 0,
 			&ea_info_size);
-	if (!p_ea_info || ea_info_size != sizeof(struct ea_information)) {
+	if (IS_ERR(p_ea_info))
+		return PTR_ERR(p_ea_info);
+	if (ea_info_size != sizeof(struct ea_information)) {
 		kvfree(p_ea_info);
-		return -ENODATA;
+		return -EIO;
 	}
 
 	ea_info_qlen = le32_to_cpu(p_ea_info->ea_query_length);
 	kvfree(p_ea_info);
 
 	ea_buf = ntfs_attr_readall(ni, AT_EA, NULL, 0, &all_ea_size);
-	if (!ea_buf)
-		return -ENODATA;
+	if (IS_ERR(ea_buf))
+		return PTR_ERR(ea_buf);
 
 	if (ea_info_qlen > all_ea_size) {
 		err = -EIO;
@@ -208,10 +210,22 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 	if (ntfs_attr_exist(ni, AT_EA_INFORMATION, AT_UNNAMED, 0)) {
 		p_ea_info = ntfs_attr_readall(ni, AT_EA_INFORMATION, NULL, 0,
 						&ea_info_size);
-		if (!p_ea_info || ea_info_size != sizeof(struct ea_information))
+		if (IS_ERR(p_ea_info)) {
+			err = PTR_ERR(p_ea_info);
+			p_ea_info = NULL;
 			goto out;
+		}
+		if (ea_info_size != sizeof(struct ea_information)) {
+			err = -EIO;
+			goto out;
+		}
 
 		ea_buf = ntfs_attr_readall(ni, AT_EA, NULL, 0, &all_ea_size);
+		if (IS_ERR(ea_buf)) {
+			err = PTR_ERR(ea_buf);
+			ea_buf = NULL;
+			goto out;
+		}
 		if (!ea_buf) {
 			ea_info_qsize = 0;
 			kvfree(p_ea_info);
@@ -514,14 +528,24 @@ ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	mutex_lock(&NTFS_I(inode)->mrec_lock);
 	ea_info = ntfs_attr_readall(ni, AT_EA_INFORMATION, NULL, 0,
 			&ea_info_size);
-	if (!ea_info || ea_info_size != sizeof(struct ea_information))
+	if (IS_ERR(ea_info)) {
+		err = PTR_ERR(ea_info);
+		ea_info = NULL;
 		goto out;
+	}
+	if (ea_info_size != sizeof(struct ea_information)) {
+		err = -EIO;
+		goto out;
+	}
 
 	ea_info_qsize = le32_to_cpu(ea_info->ea_query_length);
 
 	ea_buf = ntfs_attr_readall(ni, AT_EA, NULL, 0, &ea_buf_size);
-	if (!ea_buf)
+	if (IS_ERR(ea_buf)) {
+		err = PTR_ERR(ea_buf);
+		ea_buf = NULL;
 		goto out;
+	}
 
 	if (ea_info_qsize > ea_buf_size || ea_info_qsize == 0)
 		goto out;
diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 8c8eb13859ab..46a8b19c0723 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -1108,8 +1108,8 @@ static s64 ntfs_ibm_get_free(struct ntfs_index_context *icx)
 
 	bm = ntfs_attr_readall(icx->idx_ni, AT_BITMAP,  icx->name, icx->name_len,
 			&size);
-	if (!bm)
-		return -EIO;
+	if (IS_ERR(bm))
+		return PTR_ERR(bm);
 
 	for (byte = 0; byte < size; byte++) {
 		if (bm[byte] == 255)
diff --git a/fs/ntfs/reparse.c b/fs/ntfs/reparse.c
index 0d3988992119..b8d601f5500f 100644
--- a/fs/ntfs/reparse.c
+++ b/fs/ntfs/reparse.c
@@ -256,6 +256,8 @@ unsigned int ntfs_make_symlink(struct ntfs_inode *ni)
 
 	reparse_attr = ntfs_attr_readall(ni, AT_REPARSE_POINT, NULL, 0,
 					 &attr_size);
+	if (IS_ERR(reparse_attr))
+		reparse_attr = NULL;
 	if (reparse_attr &&
 	    valid_reparse_data(ni, reparse_attr, attr_size)) {
 		err = -EINVAL;
@@ -335,6 +337,8 @@ unsigned int ntfs_reparse_tag_dt_types(struct ntfs_volume *vol, unsigned long mr
 
 	reparse_attr = (struct reparse_point *)ntfs_attr_readall(NTFS_I(vi),
 			AT_REPARSE_POINT, NULL, 0, &attr_size);
+	if (IS_ERR(reparse_attr))
+		reparse_attr = NULL;
 
 	if (reparse_attr && attr_size >= sizeof(*reparse_attr)) {
 		switch (reparse_attr->reparse_tag) {

-- 
2.43.0

