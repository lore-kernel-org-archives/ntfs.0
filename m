Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660191;
	b=G+OULeDuqEy1hdYu9DXUmqM8omZErlF6VRnKRsKPoP3LkIVDYoqagzwvDn2AcyqunYJK
	 viJrnng5qMugws45zVgW9F/aWkza3QowZ7cAtIF0SIVr8gH/Tc12h1VzWZyt0PzKptdzZ
	 hGd4gjTOxzWaqGebhD9wwaSWdhlEa9YaCQ/+HcM+qBNkODyFn0iprUj2eRsdsS13s1vZC
	 12RdCy9y26QaMgvo0sXiR/8g4tNqAm+VVhfo6PaP3vUUGh8zLGwecFt/R+NPVcfZIh5QA
	 QFjdHByQn2ZB6mNyMEAwuh3YnagHd5rNyHybenQnLNtqchP0aogeFZp7de4GFwRrlKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dvZSaLSCqunOeHMJQj1HFlN0JXSyUeBnPBVWFrYb5cw=;
	b=kvDZTm1FVmRcqcEUBOULH3XSUvSlSbCDSsBWJDZOnrghCscogwauJ/cLpVKareTqpw3D
	 b2IwRyaTzDTTI557tq2ClApyUCljSJs+HWjSxG0qHqw/iPvuZqQFDjzb5Fft2tRdZ0CaN
	 qmZ/1FyIiNsgiUZNMOe31wtsqRj0pGJwDYCB2s5NzIWhhDO+xQh858jeJAIHpUQfXXm6R
	 Vx+ZXWnMmCvlHu004kX1B72J8dOxSD+g+VrC95G+lTWymdpFhor3wbFuueBAHbrt0hxWS
	 BRg/uvRUjMeAHfbkHEixGh3jtboAV1ksCbLd2R+8AglBhFVc4asUuPbquIC0X/LAiGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ydjUS60O;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C31F606A31E
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 02:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C31F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ydjUS60O
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0458cc9easo52656065ad.3
        for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 18:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660191; x=1796264991; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dvZSaLSCqunOeHMJQj1HFlN0JXSyUeBnPBVWFrYb5cw=;
        b=ydjUS60OGN/ngnbD1/CsBYHbQupm20NhA3vvtUWfmulNKR7Bb5jTBMX+ZxoNbP8Cft
         jY+XKCpP/dLJCNtsCZIegbdQ3giG6RipHpu8fU81DR/tSRHC38UnO55DPgzlFvAYXJqQ
         1EtSAOGTFH+LNiLd2hgDyQkw4oEZGSOeH6buFdmDCsKpUMZxx4edHQHlD/2o3IPF+UpC
         da4cUwfXGA7ZBU7+ckNVQehreyT1gdhH7kyFfNVHhF5N0TmaWQNY4B9kizjdP5HarjM6
         qD2ueqJJ7VFujJ0mWBVjlk4QxABotgSExKEpCg8mVRg4OGv9RS+97oo7GJBqTCRUv6er
         TIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660191; x=1796264991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dvZSaLSCqunOeHMJQj1HFlN0JXSyUeBnPBVWFrYb5cw=;
        b=r4NACgso8rEcAw4v8MvZ/rToTP+nVDxKyNkHImjrwrOLPCOMBHSjYvnWAq+X//FIR4
         m1P3jTxrx9BA1xPmdGD/rebhZpk6RMjq2/c9oMGPcYYztJwI9IQ2CnvD3QK59WEPGhWG
         Q8QtCabzAqO1IwZHLUvK+4uUD8B0zfyC0u/0yV8LLVcMzqgYngPNunbVe1Zd3Hh+jWRf
         ALtHhrCTwMbyIQmYOP5YDWBrluY4bvKzBxILVR+r6UWBoaGLaZcU5PHWXeuSA04XJ0s/
         n3Yt+MsVt/BDCcY/hLLUm2aJpTuo2INUezlw0aNXEpml0Qcp6Zzcn0ZZm1E4XyXz15YO
         ATAw==
X-Forwarded-Encrypted: i=1; AL+hErFnTonGeVMvE4vIp4xdXBz1maVwTQRqNLe5PejC6ri8pHU8nIYm2e1+yeaDFOjQCPmbqMsy@lists.linux.dev
X-Gm-Message-State: APuU4Z+H4jAPOnZ85Mnp1+A5zuidv6y0hVV6CshGbjzyEL5l1DxvUpfY
	ljd9bsHADvEgjrkQZOC9ff8J/97WdZZ1kMdEPMIad9fNmvzHAvDdH0i4+zelwBep
X-Gm-Gg: AZFdTZfLkzHY7Xzx7NE3AuIrhGdfNF6FSiRLAvU0iww3F/hoiMR1XTdrqVn4yA2xIoN
	jpK1NXRdRSkE74IiFMSY9mZIH6f1wANsh4142UXmv9m53TmURKxHGLH/mseYQFLtpUTdm0q2rSS
	NSx57/3COUfoEOFCzDYVijP4MGbnFpg5nN+v6Dqqw6svtLriI8Y9VCf6yKswDwrRUzPZ7KhTCuc
	atb3qZTZrK6Iv4RaFompUaCrhZ8iqI3j0ncuVkGk+Jm1D3EgGo7x3fonbJqBSaRdBSRHFuWSokL
	q3t+MaqFHkayIfoJ7w28+DvqBdx6Rmu+yoTTi50I3sOc3oiptd5mBztHAJCFd3js9Impg14FXug
	3Wt99tpj0AlhafgRBq9KBM9wwZt6dhvANqu7+WmhrZmeLhRNBEQsMo8QUJanV3Euy45+7WD6YNY
	JDT2/H1C6kOpKD9iscFFVHdbID7tJUN9CCRlpDH7pzKzCusnFP5NQ8sxaa+58UQLCvdM+KnCGTL
	b0/uqPBKKHb+YkL1WA31RIfzKMWtnXBZzZzKVsAROOHUiqLwVMayrzQ6cRitQXeXgendHcQQ6QO
	6Fyp/+FNbGovA4X3bncZ2aN7GObvlWUjWeI=
X-Received: by 2002:a17:90b:50:b0:3b0:9e2c:9b5f with SMTP id 98e67ed59e1d1-3b41c7b6044mr19281858a91.2.1795660190605;
        Wed, 25 Nov 2026 18:29:50 -0800 (PST)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm14431899a91.10.2026.11.25.18.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:29:49 -0800 (PST)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	Baolin Liu <liubaolin@kylinos.cn>,
	ntfs@lists.linux.dev,
	Sazpaimon <sazpaimon@cultnet.net>
Subject: [PATCH] ntfs: fix false directory corruption on case-insensitive lookup of POSIX names
Date: Thu, 26 Nov 2026 11:29:39 +0900
Message-ID: <20261126022939.1227362-1-hyc.lee@gmail.com>
X-Mailer: git-send-email 2.43.0
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

On a case-insensitive mount, a directory index may legitimately contain
two POSIX-namespace names that differ only by letter case. During
a lookup, ntfs_lookup_inode_by_name() treated any second case-insensitive
match as directory corruption, failed the lookup with EIO.

Keep the first case-insensitive candidate and continue the collation and
B+tree traversal so an exact match is still found.

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Reported-by: Sazpaimon <sazpaimon@cultnet.net>
Link: https://github.com/namjaejeon/linux-ntfs/issues/99
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/dir.c   | 103 +++++++++++++++++++++++++-----------------------
 fs/ntfs/super.c |   4 ++
 2 files changed, 57 insertions(+), 50 deletions(-)

diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index a93f3566603b..2ff90852bccc 100644
--- a/fs/ntfs/dir.c
+++ b/fs/ntfs/dir.c
@@ -54,8 +54,8 @@ static inline u64 ntfs_check_mref(u64 mref)
  *
  * Note, we look for a case sensitive match first but we also look for a case
  * insensitive match at the same time. If we find a case insensitive match, we
- * save that for the case that we don't find an exact match, where we return
- * the case insensitive match and setup @res (which we allocate!) with the mft
+ * save the first match on the search path in case we don't find an exact
+ * match, where we return it and setup @res (which we allocate!) with the mft
  * reference, the file name type, length and with a copy of the little endian
  * Unicode file name itself. If we match a file name which is in the DOS name
  * space, we only return the mft reference and file name type in @res.
@@ -91,6 +91,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 	struct folio *folio;
 	u8 *kaddr = NULL;
 	struct ntfs_name *name = NULL;
+	bool seen_nonposix = false;
 
 	/* Get hold of the mft record for the directory. */
 	m = map_mft_record(dir_ni);
@@ -191,13 +192,11 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		}
 		/*
 		 * For a case insensitive mount, we also perform a case
-		 * insensitive comparison (provided the file name is not in the
-		 * POSIX namespace). If the comparison matches, and the name is
-		 * in the WIN32 namespace, we cache the filename in *res so
-		 * that the caller, ntfs_lookup(), can work on it. If the
-		 * comparison matches, and the name is in the DOS namespace, we
-		 * only cache the mft reference and the file name type (we set
-		 * the name length to zero for simplicity).
+		 * insensitive comparison. DOS names are matched this way even
+		 * on a case sensitive mount. If the comparison matches and no
+		 * candidate is cached, we cache the filename in *res for
+		 * ntfs_lookup(). For a DOS name, we only cache the mft reference
+		 * and the file name type (we set the name length to zero).
 		 */
 		if ((!NVolCaseSensitive(vol) ||
 		     ie->key.file_name.file_name_type == FILE_NAME_DOS) &&
@@ -210,29 +209,32 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 			u8 type = ie->key.file_name.file_name_type;
 			u8 len = ie->key.file_name.file_name_length;
 
-			/* Only one case insensitive matching name allowed. */
-			if (name) {
+			/* Only one imperfect non-POSIX match is allowed. */
+			if (type != FILE_NAME_POSIX && seen_nonposix) {
 				ntfs_error(sb,
 					"Found already allocated name in phase 1. Please run chkdsk");
 				goto dir_err_out;
 			}
-
-			if (type != FILE_NAME_DOS)
-				name_size += len * sizeof(__le16);
-			name = kmalloc(name_size, GFP_NOFS);
+			if (type != FILE_NAME_POSIX)
+				seen_nonposix = true;
 			if (!name) {
-				err = -ENOMEM;
-				goto err_out;
+				if (type != FILE_NAME_DOS)
+					name_size += len * sizeof(__le16);
+				name = kmalloc(name_size, GFP_NOFS);
+				if (!name) {
+					err = -ENOMEM;
+					goto err_out;
+				}
+				name->mref = le64_to_cpu(ie->data.dir.indexed_file);
+				name->type = type;
+				if (type != FILE_NAME_DOS) {
+					name->len = len;
+					memcpy(name->name, ie->key.file_name.file_name,
+							len * sizeof(__le16));
+				} else
+					name->len = 0;
+				*res = name;
 			}
-			name->mref = le64_to_cpu(ie->data.dir.indexed_file);
-			name->type = type;
-			if (type != FILE_NAME_DOS) {
-				name->len = len;
-				memcpy(name->name, ie->key.file_name.file_name,
-						len * sizeof(__le16));
-			} else
-				name->len = 0;
-			*res = name;
 		}
 		/*
 		 * Not a perfect match, need to do full blown collation so we
@@ -447,13 +449,11 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		}
 		/*
 		 * For a case insensitive mount, we also perform a case
-		 * insensitive comparison (provided the file name is not in the
-		 * POSIX namespace). If the comparison matches, and the name is
-		 * in the WIN32 namespace, we cache the filename in *res so
-		 * that the caller, ntfs_lookup(), can work on it. If the
-		 * comparison matches, and the name is in the DOS namespace, we
-		 * only cache the mft reference and the file name type (we set
-		 * the name length to zero for simplicity).
+		 * insensitive comparison. DOS names are matched this way even
+		 * on a case sensitive mount. If the comparison matches and no
+		 * candidate is cached, we cache the filename in *res for
+		 * ntfs_lookup(). For a DOS name, we only cache the mft reference
+		 * and the file name type (we set the name length to zero).
 		 */
 		if ((!NVolCaseSensitive(vol) ||
 		     ie->key.file_name.file_name_type == FILE_NAME_DOS) &&
@@ -466,30 +466,33 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 			u8 type = ie->key.file_name.file_name_type;
 			u8 len = ie->key.file_name.file_name_length;
 
-			/* Only one case insensitive matching name allowed. */
-			if (name) {
+			/* Only one imperfect non-POSIX match is allowed. */
+			if (type != FILE_NAME_POSIX && seen_nonposix) {
 				ntfs_error(sb,
 					"Found already allocated name in phase 2. Please run chkdsk");
 				kfree(kaddr);
 				goto dir_err_out;
 			}
-
-			if (type != FILE_NAME_DOS)
-				name_size += len * sizeof(__le16);
-			name = kmalloc(name_size, GFP_NOFS);
+			if (type != FILE_NAME_POSIX)
+				seen_nonposix = true;
 			if (!name) {
-				err = -ENOMEM;
-				goto unm_err_out;
+				if (type != FILE_NAME_DOS)
+					name_size += len * sizeof(__le16);
+				name = kmalloc(name_size, GFP_NOFS);
+				if (!name) {
+					err = -ENOMEM;
+					goto unm_err_out;
+				}
+				name->mref = le64_to_cpu(ie->data.dir.indexed_file);
+				name->type = type;
+				if (type != FILE_NAME_DOS) {
+					name->len = len;
+					memcpy(name->name, ie->key.file_name.file_name,
+							len * sizeof(__le16));
+				} else
+					name->len = 0;
+				*res = name;
 			}
-			name->mref = le64_to_cpu(ie->data.dir.indexed_file);
-			name->type = type;
-			if (type != FILE_NAME_DOS) {
-				name->len = len;
-				memcpy(name->name, ie->key.file_name.file_name,
-						len * sizeof(__le16));
-			} else
-				name->len = 0;
-			*res = name;
 		}
 		/*
 		 * Not a perfect match, need to do full blown collation so we
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 39ff56cecf62..a87b47adb28d 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -1380,6 +1380,10 @@ static int check_windows_hibernation_status(struct ntfs_volume *vol)
 	mref = ntfs_lookup_inode_by_name(NTFS_I(vol->root_ino), hiberfil, 12,
 			&name);
 	inode_unlock(vol->root_ino);
+	if (!IS_ERR_MREF(mref) && name) {
+		kfree(name);
+		return 0;
+	}
 	kfree(name);
 	if (IS_ERR_MREF(mref)) {
 		ret = MREF_ERR(mref);
-- 
2.43.0

