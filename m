Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AD34A8A30
	for <ntfs@lists.linux.dev>; Tue,  8 Sep 2026 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860687; cv=none; b=lyiPWT6mKfstUyTzHqFBoTOUIp6LyVnqy5EFAV9NpNlTQ7uOMevTaOkm1/F/wx6MM9HVYC2Vor9tDU3Phc8yZwqIhQz+QfseswhDlr/lAyIoFG+oPwCNDWK6FDYhyNMvGdjc0HI2EAVVcnYGZN3Lnu9g6tQo/1xOsT2En9cE6fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860687; c=relaxed/simple;
	bh=QQvon28ftiR7r2cezL0EYqmKNCuEBL55QStF24HTPXk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kscfg5qmZHKwP/rO0xw3SBBr6iFU5k1LMUw88wNNb0LhsSzbtCtTFZqJwZ1V3arjKSZtXOQuGYLFPdnx2H1+0xgMIiM6x6/PXzOHhJHVdgl2X6Wwrr24bOdZtcHHZ0eepw92qUe9ljxXNGbrUv7Tqmjn1ZtGTNftoE1vREdukhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHvssHIR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHvssHIR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 410DE1F00A3D;
	Tue,  8 Sep 2026 09:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788860685;
	bh=u8f2UbtbabqxqroU7qFSGs/nld5m4x5HB2/c6AlIxuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jHvssHIRHGHDF7Xbctoa9IRYL6wOn9fHK/OE6w9DyTMlBmurHTIu6kei2onKUU7H6
	 5yG+SnvvH4cEgRobYERtABRntEsV/OgzZTRc7DcHpqNZYbgy/mNfRd24E2jBx+OQUN
	 CvU+dqlB3FPDX88i3fBGspiwrjqvHkSe9r7pscDnqbjn3el4RHBvdlvRqNZBGBoo3D
	 /6KpRIUHWQOQlLka9L40piluelo0oeZZDehHBdsYagPZSRFKSrrOolZX3RLeIKj//k
	 wjMTJ5vjHV/6946ZyAS2EPsV5/6LcYpSomeEBMcO3AY4K6kibwvvZUQPYGxbtGj5nH
	 Z3bon0T8psRVg==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH] ntfs: propagate folio errors
Date: Tue,  8 Sep 2026 18:44:13 +0900
Message-Id: <20260908094416.10534-5-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260908094416.10534-1-linkinjeon@kernel.org>
References: <20260908094416.10534-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return the error from __filemap_get_folio() instead of replacing it
with -ENOMEM.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index d1accde6d7c8..bb97cc6c6ba7 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3714,7 +3714,7 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(struct inode *vi,
 					FGP_CREAT | FGP_LOCK,
 					mapping_gfp_mask(mapping));
 			if (IS_ERR(folio)) {
-				ret = -ENOMEM;
+				ret = PTR_ERR(folio);
 				break;
 			}
 		} else {
-- 
2.25.1
