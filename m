Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277BD4279FE
	for <ntfs@lists.linux.dev>; Mon, 28 Sep 2026 07:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580306; cv=none; b=DMP5lAlpcgCiQBhWZ9oUYhCCbNllhqLv40oortLNGrBj+sJKik7c6V3xu17yg5vI8o4hFI7GnKPOrKqT5PGms7KX+X23meRIFamJE5zElFD1FFBouxGj4+K9mpaQWAWXbPXykYcX8eII4H4qXnP1lp6ljfqLkeMmPpTCJWL1A0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580306; c=relaxed/simple;
	bh=CHEI9eA3y1nfmYsMB6hM4e7AUGRzbtur61BTFOSezdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=doP7RMQAWLPNYCqPQeaKHB7K156UjR9tsPe8e9rmuf4SS9olROp8RvTlxmwaX5KUCHrG+YQiV3gU2IGAsvaKXknHgdMap7QvVqJATGPo2al3nzzEcJUobUNlg5hrlMpFzLVDAMiwZ4iWyabcxFA0TAtfBrzX/WSQGrQbVTLuCJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPj1I623; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPj1I623"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ee1f38so11385495ad.2
        for <ntfs@lists.linux.dev>; Mon, 28 Sep 2026 00:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790580304; x=1791185104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4Bnj9vZ+1BX/gJs24VR5VhnoufaKlJSpCUTdPmSGcw=;
        b=kPj1I623hEJ7AZSBwmLE8UR0LyMDnC+ly/0WP1gOUWlFBlbFQRK4xDQq4UCtsTLB6U
         L47m0kOu1MzfzVBMUy++rSx2ff6kPTNPJ67nrPMgTbbUMlNHu+QZ2DzWQMPtmjofT64a
         xl/Z3m/YzUS0yolRJV6dbGhk6X9LojiRr9w07fL9A9L/HoZpBo4dSC48mo12AwYsr7fS
         BLk48YF/+/V04idacD/tEkNDPuFvWibExGCwRhl3/WWy0KIdhrRocv9bf8qvT773i0lm
         skqLe5jywT/rzv+zvsmbKjjwL/y7XVaRpyl15ieOaXqRq70w1YwAYnsKcO1aZJKHwM4q
         vylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790580304; x=1791185104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4Bnj9vZ+1BX/gJs24VR5VhnoufaKlJSpCUTdPmSGcw=;
        b=iXb56oHFVBargilKc9K9bVWIa6Fp3ze84448GjCOkND0JCYPfpw1T0/JHYA+DAKn33
         AsKKUFMCadW1eLMi6PEcoo9fohaLkuOwM0ClJrY2unKCNoh6l8AfP16RZEA39CqcXivH
         FTepLI8CT7B3qj8iNPYtlSmGV+M7fkOam/Aty9OsujQSxNX6izHwmLa+HnPty38SjeJp
         3t6512ukd0eXVtkzUMu9fBsJE1WCR6qcZzjUH//ZkWF9t5ezxF7gvWjh7KgGY/vhFT3F
         SuSS0W+4VjVEHa2ZB5J+l+A+n4a3NOL667uzIa34F1D9PAtvKKppal7T5qqwhkXqUkP1
         h1HA==
X-Forwarded-Encrypted: i=1; AKwUvBw9HpAtI6J8nzoqNKPiMYWPgdfIioEG39gRZ/gJpOjnIk/b6yRXL27aOK3mdaDkbsz79D2t@lists.linux.dev
X-Gm-Message-State: AFq9FYKVpH54MpXmxFoufcnArC8FeOSbClTF6P4m1hG76zmtuVmzUqnC
	4K1mhUIvaKZR9PzB0YOH5H/kllAUSulAgAaFdiftZuBmX6T9pwmRoouS
X-Gm-Gg: AYBFou3KM8IQcCsUq97D7fVem+kV+OHXx2kRVcMOe4/iwdNPhzkju6Hgo5s8y2xhudI
	HEgV5pM5YEHTowPXazYEq7fQjWrTqXmWXLd8u9IUWOSfAHtJ/VwM4aQT4mCUwjShgxc7QV29cE/
	IZ0d075Z/xzMVrRYimH+dWKBHbCjfFykGqA9cusqJPPsI8YaETG5WmMgRRADR1n/aM6YV5wryMj
	nISVwxZ2JRj0QFcGmKQxzbLrOqp+nyEguchY1MevrWWfaEWdl1sg/cWc60fVqKu35sVXUsjN6sl
	Nn0YKDmHmXawwxQeCENxhuqJqKZkhtahmi380WJwddTxh+CR2kkPnKNa/lWAArZplByFBD+4cTS
	f0Y2cLbBWf6gxPxfKEIEz+AY4b8fUHjvmOLnNa0Z8snzQUNuPewnCg9mcLsg+OJo/lRH6oQd2jM
	lpkFJuyTWn4IQyl3eSGUeR+ZtWOWL8P1IMkZnYlUDnlxaHjij65Jm+RSHKSGRfEhzC3PVdDpTx1
	DoV
X-Received: by 2002:a17:903:184c:b0:2df:3b0c:a6a5 with SMTP id d9443c01a7336-2df7da5d1bemr109938845ad.9.1790580304047;
        Mon, 28 Sep 2026 00:25:04 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7b805182csm475880a12.2.2026.09.28.00.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:25:03 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH] ntfs: avoid misclassifying directory reparse points
Date: Mon, 28 Sep 2026 16:24:51 +0900
Message-ID: <20260928072451.1776484-1-hyc.lee@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Windows directory symlinks and junctions can carry
FILE_ATTR_DUP_FILE_NAME_INDEX_PRESENT in their entry while the reparse
flag is stored only in. The old directory enumeration path treated such
entries as DT_DIR, allowing no-follow userspace scanners to recurse
through symlink targets.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/dir.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index c2b48bc696bf..b95173f068cb 100644
--- a/fs/ntfs/dir.c
+++ b/fs/ntfs/dir.c
@@ -635,11 +635,11 @@ static inline int ntfs_filldir(struct ntfs_volume *vol,
 	}
 
 	mref = MREF_LE(ie->data.dir.indexed_file);
-	if (ie->key.file_name.file_attributes &
+	if (ie->key.file_name.file_attributes & FILE_ATTR_REPARSE_POINT)
+		dt_type = ntfs_reparse_tag_dt_types(vol, mref);
+	else if (ie->key.file_name.file_attributes &
 			FILE_ATTR_DUP_FILE_NAME_INDEX_PRESENT)
 		dt_type = DT_DIR;
-	else if (ie->key.file_name.file_attributes & FILE_ATTR_REPARSE_POINT)
-		dt_type = ntfs_reparse_tag_dt_types(vol, mref);
 	else
 		dt_type = DT_REG;
 
-- 
2.43.0

