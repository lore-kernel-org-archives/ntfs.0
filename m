Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5823537D2
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288516; cv=none; b=aDyvNSVNBXVAoWfWh1SBJDYg2kGMORO0dOHwyN4POzNBUPfsLG9i2P8uvJNUot8XxHG9xvMVtN0O176Rk3XhQxrqVu93vs9Vq0xu3pwsw4gS1Gs5NlgOvooUnITzdK9WFYp0FkL6NFiWEzxVtIZV9USa9UY6A98+l0t8UBsr1l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288516; c=relaxed/simple;
	bh=bS6diHPNKgh8Zt8igaGFmr3OirGO10kbQJ9u7nZBMJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s7P66eFoFeBl/Qc7yDcc8D6Kvnb/gVMDGc3gwlv54AOmyEHiJLfeErgf1e642ZvZS6nUfQof54uUQEHzMMDGkCsNqreOZjKpPSV+t1lNh6wV2VIryZmegEHgTtJdxUpB0vSjqU1Z91PKP7jH0wKvHIz2Jbz7jaRZirAa3mcSWcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9+yxShm; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9+yxShm"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso509883a12.1
        for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 22:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787288514; x=1787893314; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcLnofB4Fum5QISpRWKXzXpDWTs53sdPvh6GfbQEsWE=;
        b=O9+yxShm/Guzj1RcCU9Ao94ryhs2t5zBcMJCJzFdT4SD5cPzvsvkKoE5FE/q5P7Rca
         xHMsm/jvMxkHS3kqwjX4jbB404XRTbY7bKe/OOc/JJPH2+OyzSj1VgrhTTDf8UBhknWF
         N9Ifs/u15vt9Tc2DLeFCW/tS7v+Wg4e/jx+Y7mu2uorjpxyRmmMYr7XeGl3NtGIcLE4A
         wd6rPiLTeDGBvWiNbnYziaGp7h5tU22CdiNZt8mjK021IdzGmRHDoKjLJOsmRyqWlltl
         3J7Z/Wc9QRCmoT6Ae3laU/oMHz4Rv3Oa/msh22EkIHbttIHTG+Xg6H6JWBh0N7/kvmZD
         LdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288514; x=1787893314;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcLnofB4Fum5QISpRWKXzXpDWTs53sdPvh6GfbQEsWE=;
        b=JRZcV39yAeiYtkeGZj3UeAl0CwUbpZyuyy/VLZ/juUuZlS0eGkq97XT5mFMyHHZjbR
         y/71Qjz92sniiIZBz6RmxfCA+pAQerzYg6ukKBlXfIN5lzMrYs/L3tkX5E7r7z7kjD4f
         5IC8MJZ6dP1BE1Nr7khQhg4sXOKjNaV3gno71rpQTEG6Sx6mDLTG75ZQagCSgzFd0/B/
         bFsW1nEwynJXst1CFJwvWu7AFxV1CPPTwlXxSjUx198/8FSAat7d7OBUy4bkOmlSGRuC
         V0WkdqIZmo3KJa5xAkT4Ye9tngNm2OIp/20FfeEw9vcenwsyM9BALve/kdWwT6fLjV1/
         aJEA==
X-Forwarded-Encrypted: i=1; AHgh+RpC6/z+lDpAZtCwB5I1WmpCUA/E3DeXUKM5O3K6UEuXHMJMCnm1smM6/FzPmI2cllNtnTYj@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb+69VFIrfi9A8PQPXN59b6teW7D9H9Il5uOhx6Z+Q44294Czt
	ZY9sh/Yxtw12WWBlFLzgrrEiv+RlBX4D3LhEn98ec7AgwYk0uueLTRsA
X-Gm-Gg: AR+sD11dsPe6q6V7NymH0Ki4TTDRr6VVkIskb8b6VQ6LSUYHsyDJz+JR7vB5gCPFR7w
	2rjgRU37NnvxgxAx/tNYBSF1gy/xDxec7XdatIWaLi7Ow4vT4meNEJasxxyGmfuijbNsc3/wzDk
	rSjgDOmjqmyPvtnuVylVnWDLjk1HIBQD/AHqBdlWWmV1tTUg7zVGZHDCa3d15jj0hvw7JIs9IDa
	qGV3I4F0lFiiNxewQsHaQqM+3JdGlvE+ggWzJ2dVSBDCp4d3Qvl771jkO5ysJKOGmZX0G1YBqTc
	mx0rBJRPEtE8l6H1JU7y67bw/Pdb5YByh9Ws2WpnYy7gTUKQj6Y8oY37gKSWq8hhHKx6G6qbR7H
	Tq9pEEaoopQHYC6pr5eLV8JusTbv1mlYddZmc3M/UdAjLa+OmgQj9EOK5iELqtaSS4srgtaWptW
	UFc76LErCQ0m1A5IxmTqk0WHjsgq6nMCl64I97oXx0Qu5Nx552yTVXwT+9YK9wMUHXSBc=
X-Received: by 2002:a05:6a21:7482:b0:3c3:b57b:6291 with SMTP id adf61e73a8af0-3cd301b5175mr7595894637.18.1787288513726;
        Thu, 20 Aug 2026 22:01:53 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a19sm2319545b3a.43.2026.08.20.22.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:01:53 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 04/10] ntfs: return errors from ntfs_attr_readall
Date: Fri, 21 Aug 2026 14:00:53 +0900
Message-ID: <20260821-topic-wof-v2-v4-4-7a6fa10743b8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821-topic-wof-v2-v4-0-7a6fa10743b8@gmail.com>
References: <20260821-topic-wof-v2-v4-0-7a6fa10743b8@gmail.com>
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
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqh9tNKwY/Mz7vtzYcpYfdqVHhzXqwjCtAU6qIc
 GHFJY07M+iJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaofbTQAKCRA08jD6945I
 07HWD/9oTjgiPu64M2XZ6nXQl5kTaCuhNzr+Bd7P1XmJC4SDKxZFALgHeU+K4ZDFXkCKuQKXsC0
 hFsFl8UMocaYiBT9mWwuVpwI+gh6efvdnJpXrzoEwJBD1V7jLRRjX8EfszCtVSU75vkuyvG5iC9
 abi7Jy1Seqtm2NR5Jylt5CGW81xbAbDjEEy8AJBcBAA7fnZaiyusFaPA4ZZPPjB54psiO0NMTuS
 /fykCAvFDt2QjN+zosjjXlryok2GbsxRdG8m/a+cqEGNo/BtzPCpbvZzgFt0ltrWFFsR0yu0YrS
 YtsZS1lj1MgdQc7J9Z7a03VwSjNAhIac93l6CFtXDK5a0ZY12xS/o5rIB5EPOeigE9GP7Os0rLZ
 YAI0U2A3QQMX2VUl5e4ykAj/ZPmhGRIyFO7DcxU2l5G4OXyUmmJlI44CVqNxF60HI5vGDsV1hO9
 m8iX9KGRG6GnADYIk6H+kn0AoavacOaY0BihRswooVlZ01kKdgGEnyZ6sdpaLTMRqRqBKKGKBNH
 UOlTKAvLGr+Cugr2d4Dyo62F8LDw8yFODeO6bIgr6K7H3HxMxRvWXJDgAuSSsG67wg6ufPuJKcw
 NVbqx/qB2Z+vEy6eAgqAEK8IEOw2xFNY4adKWT+ezLBr6oej0b4mPw7bP+U3xkyDnJ6X1FxRBsO OpFT7baDanHYjqQ==
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

