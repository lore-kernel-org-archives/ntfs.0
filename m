Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1822331203
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230131; cv=none; b=ACHdZPCTenOYpKdJ+C/qmDUY7nOhqTLGRr85tSk+38CEPUaL5xk5ToDsYOe4hW3mU2eGvwtMf4vQ/Hmfy3/42WDyvN44lWb7tZTSl8616gUYJAJ2HvcL41jW9gWOCUpJnth21jmVHh52QYgT3JhA52EtZjNTUpGNgTngDj0dikg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230131; c=relaxed/simple;
	bh=y6fueK2rgY6a1jFxYC+mM05KyiIbveKm91v+L9vAAds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aci37lky1xHxUPRcJ6ul8brT9N2hhK19xo0S12k/zJt6QQXxW0LozYzbV059ngLqf+JH1C+9Oru74pS53nRAu2PN0aGtDWM8sFavfe9yPjZCOvrQzpG+uqIlBwuxMC533UyBTIwjR/G6SE0e4dVar3SssRYw/yl3+27a4l+9ZJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMBYItzp; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMBYItzp"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d942c7cc2fso18460685ad.3
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230129; x=1789834929; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ecwxVR2Qje7qYLLETNkSHQVeJzmol75L7ZpkvcHRwQ=;
        b=YMBYItzpNndAzJpN7gmmj02jmlXxUnYJk+qgnT2cYh6/n2NrSOyAPc2UYImTzcg7zb
         riUJ22ipwHBz3my/6kikcEjxVEgDDLieJUvmbxpF2BY8zEntvf0+WqkYLNu1j9A5IXEh
         YP4qDworAgddmwQ1AMrZZozYv9wLH6j5SeUBAGbhBTsTI5woYKIBlE9Er4dD2sreflRK
         uiRSt/Ov3sAQDT0k77mb5ONgTZBuKg9QT8jY6r1BvIn/FKHoecVc6Ijma6hqv30NBvGl
         gY/oYtzDtIm3vOauZwkfqWh5SKmibGOzCBUh2aOldEkPyQpKlyYHRkxYw1w6JJuV/+f6
         6bDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230129; x=1789834929;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ecwxVR2Qje7qYLLETNkSHQVeJzmol75L7ZpkvcHRwQ=;
        b=quDQyvNuZB6AYs3x906V4/UEYeFB8/JqG/IIdYCT2dK8C49OHGo7/KL87pTsBoArox
         3mpVCvbez6HpsVXtvwNYRNwoK5TQuUiml7F2cgSZjgknauKyXcVJa+slqptEpWJCmOBW
         UPFPahhVJzNqgDX4PLGA2DSaBLd2+AqrDlaLAbiVjpMprGd6A8587vysXQStmTnavgg3
         TmlWHLtLaDNDND+DQOeQEHvIYHF2i6BcYrLofjVaeqWfn6wn1KLoipu8PAId6+GU41uG
         K8JGOcEYIqVwyIXayn5p9MDPcWMfAXu5bfB91WGxCi0R792OJc2HGNDfdTPMRUls0rUn
         lJvA==
X-Forwarded-Encrypted: i=1; AKwUvBz2SSKNI+9l2fCWk48odP22MpWAXbs8BCwBQoU7IQ4ugxPiRNklZ8Vy8cZ/USHuqAvSUgm1@lists.linux.dev
X-Gm-Message-State: AFuF++ncdzPtFuKbJboczphHhGlB8Emlq/Kjf1dz8H++NDoHq5SGoxdQ
	AWz/mxnqUADuNMVVZo94iXajfpbAG9RuzYcrMJmWfYOH9dTakO9/zHr1
X-Gm-Gg: AYBFou1ZiEngT52qP+TB2Fz/9B+MX9OqNjCtfUv731pUhD2mU1V+Jsd1RmoY4a29xUq
	4TLRPLxQosMIgDCsTGZ2zxKU+8R5mxs8acApN74D0Fa36MxlFIPVtD1Nk9+Y73cxaXOP9d8ejoh
	BJc8Ct+Ro+nui2iJBWluW9ThsBawasaNbUfzMjztjwUQWtMG9WCr1Q6ESQ+5JHGUNLZh1DNcGT6
	+COOVFreUWOhZAZ5uUY4F0UhrJpe0RCcRFq4CPUlOsJr9YZry0W/Mtk1iMYntdbKyxWrOxK3416
	H7qzcZXi+mu3mcO9ouwaKXqaE8q0F6mQOMHA/cqtGkJ7jlqHReOnx5CkaZTLVKso7nal43sBH52
	x8mGTXYRvBZeV8HucHXJ4c09PzPUJYGIpR7jUFEpfiypTLjkLDXd+57993IhJIFdGsoGZbQ9l+c
	KQ2D8ms7KzukX8jDEedOqCpD/M8FRyotYmNrwGJpNDtM1zT8pOn96G/ttQXCINzK+91kLsAcFuF
	w3YpRJRBcfuW7G6XbkjZSs5VeSB4sbAkGE=
X-Received: by 2002:a17:90b:2f03:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39d9c21b37bmr16592687a91.18.1789230129076;
        Sat, 12 Sep 2026 09:22:09 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b21sm10804999a91.13.2026.09.12.09.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 09:22:08 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2 09/10] ntfs: trigger page_mkwrite for native 4Kn size extension
Date: Sun, 13 Sep 2026 01:21:21 +0900
Message-ID: <20260913-topic-4kn-lkml-v2-9-2bc455e81635@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913-topic-4kn-lkml-v2-0-2bc455e81635@gmail.com>
References: <20260913-topic-4kn-lkml-v2-0-2bc455e81635@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789229949; l=3412; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=y6fueK2rgY6a1jFxYC+mM05KyiIbveKm91v+L9vAAds=; b=mq1ipxzgbWlBP+gUDtDUX8mDXL2gOfO3MWQG/VB7g7DZaL3Egm7J3eoblMquQxbSpbskwlZfr PtNDM6s5RB0BJj7rl0T4I8xOXyf8xyYhq5qBirRlo1IXcavXyxK5qa6
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
Content-Transfer-Encoding: 8bit

On native 4Kn volumes, pagecache_isize_extended() can leave a writable
mapping for a partial old-EOF page. A subsequent shared mmap write can
then bypass ntfs_filemap_page_mkwrite(), leaving NTFS initialized_size at
the old EOF.

Invalidate the partial old-EOF page after size extension, independent of
the filesystem block size, so the next mmap write enters the NTFS
page_mkwrite path. Apply the same helper to zero-fill fallocate
extensions and compare the actual new size after the operation so
extensions overlapping the old EOF are handled as well.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/file.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 8164326b7812..e7e4f9888fa0 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -251,6 +251,22 @@ static int ntfs_file_fsync(struct file *filp, loff_t start, loff_t end,
 	return ret;
 }
 
+static void ntfs_pagecache_extend(struct inode *vi, loff_t from, loff_t to)
+{
+	pagecache_isize_extended(vi, from, to);
+
+	/*
+	 * NTFS initialized_size is byte-granular, so a partial old-EOF page
+	 * must stay write-protected until page_mkwrite() updates it. The
+	 * generic helper skips this when the block size is at least a page,
+	 * the extension ends before the rounded block boundary, or that
+	 * boundary is page-aligned.
+	 */
+	if (from < to && from & (PAGE_SIZE - 1))
+		unmap_mapping_range(vi->i_mapping, round_down(from, PAGE_SIZE),
+				    PAGE_SIZE, 0);
+}
+
 static int ntfs_setattr_size(struct inode *vi, struct iattr *attr)
 {
 	struct ntfs_inode *ni = NTFS_I(vi);
@@ -280,7 +296,7 @@ static int ntfs_setattr_size(struct inode *vi, struct iattr *attr)
 	if (attr->ia_size > old_size) {
 		truncate_pagecache(vi, old_size);
 		i_size_write(vi, attr->ia_size);
-		pagecache_isize_extended(vi, old_size, attr->ia_size);
+		ntfs_pagecache_extend(vi, old_size, attr->ia_size);
 	} else {
 		truncate_setsize(vi, attr->ia_size);
 	}
@@ -1130,7 +1146,7 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 	struct ntfs_inode *ni = NTFS_I(vi);
 	struct ntfs_volume *vol = ni->vol;
 	int err = 0;
-	loff_t old_size;
+	loff_t old_size, new_size;
 
 	if (mode & ~(NTFS_FALLOC_FL_SUPPORTED))
 		return -EOPNOTSUPP;
@@ -1158,13 +1174,12 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 			return err;
 	}
 
-	old_size = i_size_read(vi);
-
 	inode_lock(vi);
 	if (NInoCompressed(ni) || NInoEncrypted(ni) || NInoWofCompressed(ni)) {
 		inode_unlock(vi);
 		return -EOPNOTSUPP;
 	}
+	old_size = i_size_read(vi);
 
 	inode_dio_wait(vi);
 	/* Take invalidate_lock for all fallocate operations to prevent races */
@@ -1193,10 +1208,12 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 
 	err = file_modified(file);
 out:
-	if (!err && mode == 0 && NInoNonResident(ni) &&
-	    offset > old_size) {
-		truncate_pagecache(vi, old_size);
-		pagecache_isize_extended(vi, old_size, offset);
+	if (!err && mode == 0 && NInoNonResident(ni)) {
+		new_size = i_size_read(vi);
+		if (new_size > old_size) {
+			truncate_pagecache(vi, old_size);
+			ntfs_pagecache_extend(vi, old_size, new_size);
+		}
 	}
 
 	filemap_invalidate_unlock(vi->i_mapping);

-- 
2.43.0

