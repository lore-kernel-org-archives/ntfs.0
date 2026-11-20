Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135901;
	b=Umo2imWrWQUX3w8OudpJHdm2gOn0JeUUJ6t76kaibquQlZMkkvs2iFYLQwIJMqlA5cKi
	 HCxQtXnw5OoUukh8zo/HzRXd39NlQyNTS3IBMgyizLHY+o294iC4b1vhy6GHT5r1e1NIp
	 JyGhEDNKKRYLIUGWekmm150PpRuZZfTzEkAgUvMk/aI6LT4/UCjHon1hWloXPBpjVgNUp
	 mwQhGZX0CxTlZssiOPnjtNlSBhaktFVnJVN/Wa+n0pXKM31HJdxI9X3SwwpG/pEbk9aaS
	 VKQdd+4Egbu4mn0S4w+WAoYJEf6EA10t7pO1BEoOk5fEx0HWwBs1zlh/o+0/8dhzGzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BFigufc+zilWayazywjXoE6nlbm/qHl9KZBtAWWkjrs=;
	b=vFiRWRrD8/5AWJ911A9j2DfeoILtVeTxw+F2b4uu4rTZWhUHYIKTp6gZi4c8k/NpGY3U
	 InY80Pgy5yejXHCP4iog04AsZy187O8PD/gtMkajqq0pvhV5wdNWfMr5SSosCE4dy8Tv3
	 qNtaloMAbkvawe9ibYiSHPr3uUaLP06xA1UdGqywvfCFm2+NhrSkab/2yPJjn324CU+Rm
	 TqNoXjMypEvEtfPai60XNX24Woyy9gJz/iwzk+RghTvnTpqcpnQOk1mY0vYGcI4d6C7eD
	 nkb6YleI57NhALZ7foBHFehHmX+fS0JsTplXO8X9kuNT8vPuzMkX58myjH0V3Fk+o1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qHCit75;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F37C606A320
	for <ntfs@lists.linux.dev>; Fri, 20 Nov 2026 00:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F37C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qHCit75
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso166091a12.2
        for <ntfs@lists.linux.dev>; Thu, 19 Nov 2026 16:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135901; x=1795740701; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BFigufc+zilWayazywjXoE6nlbm/qHl9KZBtAWWkjrs=;
        b=0qHCit75JbYHIesa2bLm0vAqXqXxwH2YZJKwApSkuJXunhNmVdNBfZzw2QnZw3NPrO
         3j05ah09WKcflHAui/RCOF9M/+uScqB08h3VhqWQ7eazunEnXUbaxvuIa37N3aiwkbuo
         iGGaSfnfxdWEzOh85jliXhLNF0EMxcT+tEqxc1qk4Ur0zOVZXNOna7snpl4RjfhS4jz5
         arItIU7YBgh8jKTU7oXbRPbP6L4o0EigkiYIgGxLfr9SJXNQJ5ovcmMfXXDlWox9lBHr
         qWSAWz1sVWOjWOl4JMhFZ/olNAFUVMsPWWf1d7yl1CrjUM7RBjiw0gWSIROF9WclF/JD
         LETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135901; x=1795740701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFigufc+zilWayazywjXoE6nlbm/qHl9KZBtAWWkjrs=;
        b=BOcM3UyFconHMm0KhqxwJyIARMIE+H2biA6ZZ+ffMpGsPkELuUmAwmQmDtkQ38qQVx
         Ye3XZTjjug21K4As7eiFc5mXsGDlYQnuq02eUDEKWxEvRCHs46Lh70fcmVrJkzwEHOS6
         j5dkMJ4QlfS9FUv9aMtP+4Boz6kYk9QjXY9rxTWjbhI59BRPz/YRFL4nk/bqxmYAlI8u
         Av0sfy6uMmG9P9t5AnajoB1wTMyZTmlqEfz7BBNnHeRw1InZh4KYeTP0YuzkCZtqSj3z
         U6XDhcpLg+6izC1+CmNqJu3AIELL87fY8vI3D29URaaxIP+v4RtwKh+JKrA3QWQA+B5u
         wAnw==
X-Forwarded-Encrypted: i=1; AL+hErGMM/LpRgVs9kjcAnmZ+7nV7W9AXde1wGD3w6NtlNignrCAVY2fywXNVMdoUWL7QuA1eas1@lists.linux.dev
X-Gm-Message-State: APuU4Z9Bv0VyIFTTeHTZ2Ic+LBzEJ0P+/LA433zWsPm7Qv/q3BwM1qqI
	q/KbkkqV4hrrjnKArfOlxwZfd8hmhBoVV5j8o5AT0chv+08UinL+qSAy
X-Gm-Gg: AZFdTZc0gGu7P8OQ+OjU0eTUOIdNgtCh6ss17WeG4+vDs0JdKmIrZw5vnio0uODf68O
	uZ+4Ltt+DDOhkfLmOQ0kRrWOqA2IlttFYxyID0u1tZ9P3l+rNNGS/nHVdKhLLhTOx/VHiI+VICG
	6Zhp0gv3aMuIXWBMkWNR+tHKTNJIDi6AsIQYQ7o4qi24v/c/iQZW1jNz3lkQUb7Y5B88PTnRz5a
	QdnAvtmlnJiNjE93cY5mLrSme3XPk5IEkXhQnMrDVP9a6E/RBW1NOFwBvbUYLq/rBzmvUArn5YC
	ZDF8Yk10fRJGHOVw70RRZk4y7gmiC8XQCqqp0PUzaqNgqAZT3XuV1Hi7FpuLcCBJI77gWh9pfMp
	XSg86FxtvjRaUTSGfdTmCS4FSlGoII2bI/SYfGQ+KlrfRK3l9d977LmeWMF+co3MFlwf+jQ76Cr
	KMHTKQd92annAO7kDEUSymTCL5DjlzebwBLcPdFY2yfOqO2x0geJuqcmoJE9vnlSfqg8p+xJygP
	3N4IVM7ZfHWX8RxelCUWYgE8LL6mru0nk24rz+X7j0FqF8UserkpreN/iBlMozhLAezLYGXtwPs
	USKm7seHZmTH+XjLOH1K/h0kxuND5/XyVAA=
X-Received: by 2002:a17:90b:4d10:b0:3ac:a1c7:20fd with SMTP id 98e67ed59e1d1-3b41c7ac351mr1169351a91.4.1795135900620;
        Thu, 19 Nov 2026 16:51:40 -0800 (PST)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe976csm427150a12.11.2026.11.19.16.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:51:38 -0800 (PST)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	Baolin Liu <liubaolin@kylinos.cn>,
	ntfs@lists.linux.dev
Subject: [PATCH] ntfs: use kzalloc_flex() for FILE_NAME attributes
Date: Fri, 20 Nov 2026 09:51:05 +0900
Message-ID: <20261120005105.2718500-1-hyc.lee@gmail.com>
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

Allocate the variable-length FILE_NAME attributes with kzalloc_flex()
and use struct_size() to calculate the attribute length.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/namei.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 67f1d7eecf2b..f3c6911a1bc1 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -672,8 +672,8 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	}
 
 	/* Create FILE_NAME attribute. */
-	fn_len = sizeof(struct file_name_attr) + name_len * sizeof(__le16);
-	fn = kzalloc(fn_len, GFP_NOFS);
+	fn_len = struct_size(fn, file_name, name_len);
+	fn = kzalloc_flex(*fn, file_name, name_len, GFP_NOFS);
 	if (!fn) {
 		err = -ENOMEM;
 		goto err_out;
@@ -1387,9 +1387,8 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 	}
 
 	/* Create FILE_NAME attribute. */
-	fn_len = sizeof(struct file_name_attr) + name_len * sizeof(__le16);
-
-	fn = kzalloc(fn_len, GFP_NOFS);
+	fn_len = struct_size(fn, file_name, name_len);
+	fn = kzalloc_flex(*fn, file_name, name_len, GFP_NOFS);
 	if (!fn) {
 		err = -ENOMEM;
 		goto err_out;
-- 
2.43.0

