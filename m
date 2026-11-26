Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795736347;
	b=ZyXd+QRlK3SPB8Oc3eJY35B1gF9WPLbaOAtUMnkHDuwSGB/8qAqXzS+twZyQTGcKJlW+
	 ofHt51iNWj9tWDMpS05p1n9wWX2bbLc40N97Z2yVPOToIlh7ZqGiwBqu+WvhTheQGNoYi
	 R+223A/9d3RFtOmap67hbqciY+q5nNRgN+DVGRD/XLhLvHiUiNFbqgYoUgmAA7m3224qS
	 o0/knuzN9TbzWa+djxAFOPK1ghfdTSqKWGqPIN32DDayHDqnoVykiyaBCOlTwjzqIsHlM
	 qwPUolFI1ZAWWYLrwIdOQUNlXbWZrgf8KqJhQ1SSF0sWcbHRIhHVH9dF77kkfh584uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795736347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jSYuqVK/hArnn4Mmrwqh7dDMIjMw4TzNK86GONldDfw=;
	b=hFis1cyvluuBLazKEw4ADMQiLjta/IPpWsQU1N8Sm/0zkCOsVerLGzdP2P5aHL1wTBay
	 1mt+WD00ltgKmgqrUF8FRRRqRRE1VcRb+J+XInv5/EJGumCtdkV1bzmXqboJDvVapgucQ
	 bPXRQQXdeR52bs6Sjt3MaDkyQ3uCAELUrwcG4LDVc686HOwC7WhAlMmvn/YC9+/SL4jIp
	 B+Cvh0xnQv6V9mZt9jae7E19VnsYwABTePJIMEdAaOc6Qea4a9ByJaVWHaUYe48KE/b8+
	 EkDE4bWkPcM1Xyjt8bBUOlP5xyCATIDD6nQQr8VlfSY4BshA/FhnTn6trYLeg3gdjLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b05T5cJz;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28EA606A31C
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 23:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F28EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b05T5cJz
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so4725137b3a.0
        for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 15:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795736346; x=1796341146; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jSYuqVK/hArnn4Mmrwqh7dDMIjMw4TzNK86GONldDfw=;
        b=b05T5cJzGpHAUxWuhgrcEOb+0n4TuMRCRqpNbFL4X7FuF+1nuGZerRzbljUKPSsVOe
         MknDOZDrdhwJZMSQpDTpYfvrBXAecXGviN5tixl3HcQLtHKwzKl/3HxINux7HA1RN19g
         9rj1XOxVO0C9BTJN8V1vL+YhZ4RRjGjAFyFsYIJwrrzXgJX7F3tI2+Gdce9SK+pPGeSr
         Zx3Vr10F1NnQrj9kpvJ6iBE4H+VmSjg1num8Yq8bx/6Z/MbOHhzrvL584Km6o9F6TAZg
         phA+jiZfGwUdNR10WW6QVTVPfPiphwUuS0s2+soyNPps5+KKhf3f54qA+zsa5+Y7VdQB
         LqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795736346; x=1796341146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSYuqVK/hArnn4Mmrwqh7dDMIjMw4TzNK86GONldDfw=;
        b=hqRuYzIWc+INzJs0xSWwFYgxhcsEGiWWk2ehsQTpONaj+dZwyiFY+XcN9lMvsR7ZUY
         z6CArJwb1X+fLfE/RFVZiwiVosZivzykJuu7Sc5hbT0hd55i8oDGaOvFihM625k+JQN3
         113D1t4u6J9HlCb/cjmMkcRZb6HbHrNQ+qQqQI4RlLEXnARS271gMj5LieMpiqAKplef
         rZ7D/hzgv2PWRXS606mLkklcZ1u30l5Ip2gauLEDwOEnuPT8wQcE2qi5ZF5rRWArN/nR
         hhVvyAWWfdLyTw+T0Ngmn+nu7xcrLCCW4oP/Q9Ld6taB1ZmiAZLeV4RubbrtYDh5kj/c
         c+pQ==
X-Forwarded-Encrypted: i=1; AL+hErHfZh1jJLtL6GosroTqtwzgD0TEltHgtDGQMM9g5blTzznJ/HFax9Fn+TjkarqZdO6Dc6C2@lists.linux.dev
X-Gm-Message-State: APuU4Z+t1e8wi6ZrxpmQ1KTIHgSp5h3EexyQYVCF8va8f6NYJDaUVrJ6
	bpoCnOT/Q9pyzjVPPO732zkE1ccZI7dEEEJikAxEWYy7hbqMwjFGKb/J
X-Gm-Gg: AZFdTZdEyVAfF+5/yfSK4CJkw25C8NRMP8vSdqzKHLfstn78EjEWPV0OY104MSkjlVS
	nfDV6qtFftC+R3tVK0JKblg56yL7Qw0lQOvYHVwoz6DQ6KU9MZJJ1tlu+uNqTsNUVTRl4hN2DAm
	wP0CfEStpXu2nBXjM5dEEIcssnRt213M7NtbQpyDMYJdLH6ToYS499NArnjuR/oIUbDbf8q6ay9
	KrVxYXpTLOAnGEJonQ8h0Oph5ju+WxEyKaUTlqKBgsomfqrHKoU/Ls1Xm07enYSOR+xYkpahyLn
	KAhEzwcrN7Z8OvdHUxcEXL+V7NDcnHcA9z8uBKtEkd+bMYaIQ1Glu4s43/YKKrk11PJ/jzKoHZl
	5pcy8P4HH/dvsKaJx8mISUPtKyXdvnHKIHjbHE0yml8M4xaHdUfwknnEx0LLJHssrCJJGiHHEtv
	2mCnrhPfp+hJ/XcXWd1DYNjnQJqBGN2NIH4KAJmmyeRpQE1lQMKS1EseqT//9+xl7Odpsm2ZqU7
	a5KyNENaxtt69JJO7cN95K/TKb90X+D1d9YxxbFZrWzKIAPpwjVhIlmLzweoCLKOTtnYQbGljAP
	lwMKRG+kKXSbDx2OZ1uX378TOI4rfxhVhgrm
X-Received: by 2002:a05:6a00:1382:b0:882:7bed:3b3b with SMTP id d2e1a72fcca58-8c87c481e1cmr20352197b3a.36.1795736346045;
        Thu, 26 Nov 2026 15:39:06 -0800 (PST)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cb6640429fsm8490917b3a.38.2026.11.26.15.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:39:05 -0800 (PST)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	Baolin Liu <liubaolin@kylinos.cn>,
	ntfs@lists.linux.dev,
	Sazpaimon <sazpaimon@cultnet.net>
Subject: [PATCH v2] ntfs: fix false directory corruption on case-insensitive lookup of POSIX names
Date: Fri, 27 Nov 2026 08:38:46 +0900
Message-ID: <20261126233846.540372-1-hyc.lee@gmail.com>
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
Changes in v2:
 - Remove the early return from the hibernation check.

 fs/ntfs/dir.c | 103 ++++++++++++++++++++++++++------------------------
 1 file changed, 53 insertions(+), 50 deletions(-)

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
-- 
2.43.0

