Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AF1490C17
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399341; cv=none; b=Xtj2CMRnexW27OUHonQSCl14GS87BCVpG0aiuLIOmCtaDtRb0kRS/ALs24zt5DMkQwEIurFpaHaYiXFZ0eXOjQnn8S4fYjuKNSmhGnVMvxG0SnPlm/Op5VA/Si1F/3Jy08AmymNXiYGOcWHBaZ9CfP1mpcs8+UkjLLKTdaiY778=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399341; c=relaxed/simple;
	bh=mB/EBMg6kiq6v7Dg0fmBPd6Z46drhNpsR5NhnwsFCTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OBbvPvBNWL+FuNmgv/lcDarwW53oKSqrAqJHKw86ZLbf0NOhKQenw4JNnaWwWxSUNgM5H0ev0StDpT7tTSuO3VWH0aD8K7GgzdvNqUyXItI2ekdrIscMFsyKHwgAKOlLVgts7pQJnJHXzPDqsl/y5QmHIqMsv6sYSoWu7eLEqCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgWggNKg; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgWggNKg"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbee846deecso4567245a12.1
        for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399339; x=1790004139; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mblwnipFVZSuGuasA1Nq2GJAf9Ibd6m6JONC1FfkUxc=;
        b=HgWggNKgHjxAhqrUPhPS/j7WVnzjlA7C4ovHW62tRmnOOEHl6lsd9gUoMsYK4iA+DS
         PZTlbpf/69FAYcqn4sH9piwYSWWD9Yfy2I5gO5rZhZrCCFicVcnv7mfHpHgesn27N2uM
         dSvn+QqbSut6PSmUEzrgEJl+BJ9Q2oapNbSz1bL88Td+Ko/09IzfYJccxQQQNwQRuIeG
         aFKPmYzhw23S7BPXMQYN1Uf86HSVKE7R+Yg6O+2b0RjfLEy+klmtLwTGWFhm6t1wOTa2
         EmWGcXUFSEy/EVmJNDbXoloS2HKdsPC7XgLpqQezXSI94N4BQbl8paPyUKXLAbxLif+F
         Obmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399339; x=1790004139;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mblwnipFVZSuGuasA1Nq2GJAf9Ibd6m6JONC1FfkUxc=;
        b=CeuLSgVEZO69EaJyL/sgTKUf5xV6waACHa3WV7/ftiNLMsMdakvUtJ3k4Gq/XdezGa
         8m7D0bxmHpxxDOW3GBHMQ83X7Rt7g1L+GV2OQF8WesJFnOdRJJmqxlcQK993BoKjXyn5
         Fob08OXmXNf5ItEy9kgrH2U+dXi1NkVnVL4kDfF0EKzXu4mQzSSsoVuVNyaAtSC5sUVE
         65UARvkwzK7wZge9d/UoAW8UOTA9NLWaxQU3Cf76UHN4Iw+gqz7cycR3TJCyIRjX/tcq
         CnyW4Az80/NLXrPMIDXtuKacGIiybpal0EGRJ2J/l2OQvhjfA21Nrezs8duJAg/25d9g
         zInw==
X-Forwarded-Encrypted: i=1; AKwUvBxh0uOhuouhGBv1TSlXT4jOOPW2uFVsZfCr9mf5vNI4E9J0LD6RjzSUkBdBMidWFi2H8KkL@lists.linux.dev
X-Gm-Message-State: AFuF++m6V/ZLj4ovYuFj/7j+jA0YKPdT8ICsn49k6N377dwMrKlkXHnQ
	RlvvCmGKeh/zypUAlvuLgW2fGqG6LzSZi2xoO9AUr92JBwqnKo7lEtNIPUjM3g==
X-Gm-Gg: AYBFou1kkM11QxibwxEJmbSd5N7VkirTKpfHW9Y0UlKET65MFzIb/exT8OrcWnP8Ztl
	2yPaGCn796SGg8xmJhkDB0NZvDhZNvIjc9jDJ8X4IAR81/2mAMnn1XrndDpTCNW6rdMc9Sv5oh9
	sBmhl5ss5VvNwd9ZzHYXHXgF+c5jIAumapTEtIjxMSxfN0+iwYEDbbZo/MwWzmAVhB0kbo2Q/pD
	BlFyvpD2DHHsYeiPQtQaYfK2tqSfxmzG14jW7T6afu9qIqnagI3pKaCvudqkQ9dUp411cUFhEKz
	KFZBY6KwuoQ9pFHH1K5T/JTnEcfsQbw6lhhyWpGkSBtBFPsS6MdigbTV1nHrIjW8JeNav7uwp/y
	oqBw9vF8NJoXKD8+75V+/SZ/WUYbpiXEE7pO0C3ScW84x/YJJSPKnm4mMtyo777HDKvzgp+1xUl
	YTPiscJRRNbRSaMjtxda2d8n+2sX/J73EQ91JWzbs9u9hjIJHDgcgbFpVR5eCjT/PiTdnGxVhLx
	ukZTXpxnPP+qQsfvwANJ88=
X-Received: by 2002:a17:90b:498c:b0:39d:f114:8f7d with SMTP id 98e67ed59e1d1-39df1148fcemr3984319a91.3.1789399339077;
        Mon, 14 Sep 2026 08:22:19 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd6cd982sm31667a91.0.2026.09.14.08.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:22:18 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 09/10] ntfs: trigger page_mkwrite for native 4Kn size extension
Date: Tue, 15 Sep 2026 00:21:38 +0900
Message-ID: <20260915-topic-4kn-lkml-v3-9-447cfa17f780@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915-topic-4kn-lkml-v3-0-447cfa17f780@gmail.com>
References: <20260915-topic-4kn-lkml-v3-0-447cfa17f780@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789399242; l=3412; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=mB/EBMg6kiq6v7Dg0fmBPd6Z46drhNpsR5NhnwsFCTM=; b=ZudbND0xDjk8SorWmPq6s7CxLAertUrVz/puBYzTr1miqyukvLN4SpByKZBj/hDbYgkJsCKb4 0cGK+68k3NwAdmFKtpmLPSil+mqe52lPtrS8NagMmYv8slQRqc9gEHm
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
index 007d1614b9ac..7c7cbd16e944 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -252,6 +252,22 @@ static int ntfs_file_fsync(struct file *filp, loff_t start, loff_t end,
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
@@ -281,7 +297,7 @@ static int ntfs_setattr_size(struct inode *vi, struct iattr *attr)
 	if (attr->ia_size > old_size) {
 		truncate_pagecache(vi, old_size);
 		i_size_write(vi, attr->ia_size);
-		pagecache_isize_extended(vi, old_size, attr->ia_size);
+		ntfs_pagecache_extend(vi, old_size, attr->ia_size);
 	} else {
 		truncate_setsize(vi, attr->ia_size);
 	}
@@ -1131,7 +1147,7 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 	struct ntfs_inode *ni = NTFS_I(vi);
 	struct ntfs_volume *vol = ni->vol;
 	int err = 0;
-	loff_t old_size;
+	loff_t old_size, new_size;
 
 	if (mode & ~(NTFS_FALLOC_FL_SUPPORTED))
 		return -EOPNOTSUPP;
@@ -1159,13 +1175,12 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
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
@@ -1194,10 +1209,12 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 
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

