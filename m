Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710708;
	b=LZxe/MN3AFhKpyk3iN38UrRu4/lWM1cwdKx0+SaXDt1k1+E1+zKjbBQsbD0HNIfM69nW
	 GArEvZfj3xbmQ8MiNX8CMEyj3zRJaREMDp1HyLIuahymQYMA6K4WJn0VjXWhSz8QN1uHC
	 ePjdRm9mnaoD1vx/3kt7RN2RT4w9MWMaO5PeSw9r8cQqCIRMM1+IaH3LCzAO3jK560X25
	 I1t27lVmi7wpAdvIlZmsMd5BDbeWUx9R0F2gHdPYIjZaoSfnIHX8PA7lST6n6Ky179vIt
	 GsL/desB3F4JbM7OEKMmNdVWi/1MSe+b5JxTjH4ZubE51qotH16diecqM1rIu6W+ltQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mfpEhfbyhPi8fEOS+N1QHzNJFz4cU/NZgKWTwuKYJ+M=;
	b=Pj7nPAkNbSUL3A8ieU5xQOEx73UpCq8DWr9+ajHvLbfbn3awzpsjOMOWNwybq6tCfnX8
	 2Zs8XlHEDjT4vmasQemZlaOAPyEJQVdhtaJ1JgONNlQd+nusrp8kWdxLY00DIxY4946Ht
	 bYWQnR9oY9+VOMOtTTWdIJ8wXBsyN3qaEnKThoHMCFW4RM9AIeGIgeolK2ksrc16xt2Sh
	 gxPszqP79eC+4CiAvVXOkJ/fD25/eZL6tzC74cWaR7FS52r54Vy6VLJ7lVJAkr/KlwuJl
	 /F1mQV3CqvX2wCMuazlPPK8VA9ZJLR3cwTjJpEjpxyBvMoPeOZyB/haj1Zk45VI3r2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wK4CsHXG;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BC1606A31C
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 16:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34BC1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wK4CsHXG
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d05d51553so51219885e9.2
        for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 08:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795710707; x=1796315507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mfpEhfbyhPi8fEOS+N1QHzNJFz4cU/NZgKWTwuKYJ+M=;
        b=wK4CsHXGzH7VN9jIWoCv17a9YYIOuU5FBGDI3U0BLZ1tcrdwlmcNLFqGKS/vleXu4t
         1r9N/yHHBUi5X0XjnnozEb/r4vVXBWJURlRlROjKbkfML25OL5lTHVtaXrxlamP8yOQm
         C5SaEeOFMUTbDD5sZszlBLf2kncAwCswRnKFTpjZC3TvpBbwEeSXmsGUaAiJuViBzL5Z
         IGZuJ5XkhW75k47W8FuAZH7CyIeuA2T90e4KbiZJZMDZ/OacH1P/hKMDgXYCZzKllnkz
         3ESwfljNhD4sPDNcIw4Z6x1SMFM0r2LjWYSUASHaPpNBiSqcjMf4rUgb86lCIEcmtEw3
         MRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710707; x=1796315507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mfpEhfbyhPi8fEOS+N1QHzNJFz4cU/NZgKWTwuKYJ+M=;
        b=ZUV0x/NCYGKEH+OoEE0HGv+t6nCulY8IRFDvtWdB9bhia0KwZHN3Nh06S7Ykne/xsZ
         9ZLbdTgfKyfGvbIz60ZNxNqJYfy78mN+asB5WjvuZjHhUy/Q5Z7lX/v7k+RZZCngvHoG
         DUmvQHyfJ304QKk8Z2XtaNrcz6Gcl9Wp0xUqrBr+u6Q6o8zwtZFlb4cYU+8W2I91asaY
         Znub/zB2xvDbYG55iycUtIn3rfSOPKbbHXD2t1LxpZ0BL+WvrbwSbg+YGyBOQMwEEgA2
         Gr/fjNTG+QBOz+WCQ1iJoX34L6M+8kLbr+NIssy7y5b2j0WLGwCgEQsaoRC4XphJd+Ll
         ZQWg==
X-Forwarded-Encrypted: i=1; AL+hErFKgjHTw/+GnCH8WeWvgcuEuja5THsaJEuOCll/koGESm9qTAFpkrhve0rTMT2PD+7jyNzb@lists.linux.dev
X-Gm-Message-State: APuU4Z/dxaZPOq9LDHmSuPem8cDeiQfjIGdMUzhwwCsypmIvEEhuB8PH
	vOcea0Qeh7RIezVW0B2emXOS7U8c7BjM2nAmVm4eGLhLtR6Aj2opxqLe
X-Gm-Gg: AZFdTZcNUA8lhbkwHxALnUILz/j4sLqV5VlAg0NFyQR9U8/qqqZzXIWQ70zti/6uGEU
	ObjHyaTlZ/JxPhYg1vcYHseZJ0x0Sr6+usjg8IWqUaEoBeLWCTftmPyjJemLLGu44pmUyneeDIW
	oX+F9a//PdHezFMgOPI3qbMS5qG7cNp/l45zeVW14WAPHf7wuA+4yNryJmFJLptT3QfWMtr6ArO
	JAV4NkLqjOIjf0GSnJWTwgsGeRFLnN7DCxPzqqYOw14GXVFIZ5bqf4/LHEt5S36g9iTJUQ7VCjs
	2UiocpwTJtQg9pQAChblbGXvUfXPCfuLA+FC1S8axPNoYSsHfoJeo+UyZEcFuLfjfOzlpSc8jQG
	sXbdWSfK0fd/k98Mw7gW8zojrbZuVwz5XmKDqY1a9NrwKRJCBy9fxH2fFcpSXKD5JAhEkWIexKj
	Hp5COnqCEvQTMmdeeX2WIlC9qBEI2BksgTXIma16dJ2OGHs6NeGm8T47MHmQuw/YJxW2DZJZm0C
	he0f0lbyhypKwzQS5KYxsuTCgFL4P4tVybhjIrk5KAr/vABpy/+h+nvfle5DIdaEhsYLGwp2HbJ
	wVLsFQbffbGgQBP88tCAocnC
X-Received: by 2002:a05:600c:4e0c:b0:4bb:875b:f23f with SMTP id 5b1f17b1804b1-4bb88827f0bmr416764955e9.33.1795710706373;
        Thu, 26 Nov 2026 08:31:46 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm721964995e9.11.2026.11.26.08.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:31:45 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Aring <alex.aring@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lauri Gates <lauri.gates@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Dave Chinner <dgc@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	ntfs@lists.linux.dev,
	linux-nfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [PATCH v2 1/4] vfs: use goto out on error in vfs_fileattr_set()
Date: Thu, 26 Nov 2026 17:31:11 +0100
Message-ID: <20261126163114.403846-2-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126163114.403846-1-koray.fra@gmail.com>
References: <20261126163114.403846-1-koray.fra@gmail.com>
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

Switch from using if (!err) { ... } to the cleaner if (err) goto out;
in the main body of vfs_fileattr_set().

Signed-off-by: koraynilay <koray.fra@gmail.com>
Reviewed-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/file_attr.c | 45 +++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index 833e03810b24..40d6518f1d8e 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -285,30 +285,31 @@ int vfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 
 	inode_lock(inode);
 	err = vfs_fileattr_get(dentry, &old_ma);
-	if (!err) {
-		/* initialize missing bits from old_ma */
-		if (fa->flags_valid) {
-			fa->fsx_xflags |= old_ma.fsx_xflags & ~FS_XFLAG_COMMON;
-			fa->fsx_extsize = old_ma.fsx_extsize;
-			fa->fsx_nextents = old_ma.fsx_nextents;
-			fa->fsx_projid = old_ma.fsx_projid;
-			fa->fsx_cowextsize = old_ma.fsx_cowextsize;
-		} else {
-			fa->flags |= old_ma.flags & ~FS_COMMON_FL;
-		}
-
-		err = fileattr_set_prepare(inode, &old_ma, fa);
-		if (err)
-			goto out;
-		err = security_inode_file_setattr(dentry, fa);
-		if (err)
-			goto out;
-		err = inode->i_op->fileattr_set(idmap, dentry, fa);
-		if (err)
-			goto out;
-		fsnotify_xattr(dentry);
+	if (err)
+		goto out;
+
+	/* initialize missing bits from old_ma */
+	if (fa->flags_valid) {
+		fa->fsx_xflags |= old_ma.fsx_xflags & ~FS_XFLAG_COMMON;
+		fa->fsx_extsize = old_ma.fsx_extsize;
+		fa->fsx_nextents = old_ma.fsx_nextents;
+		fa->fsx_projid = old_ma.fsx_projid;
+		fa->fsx_cowextsize = old_ma.fsx_cowextsize;
+	} else {
+		fa->flags |= old_ma.flags & ~FS_COMMON_FL;
 	}
 
+	err = fileattr_set_prepare(inode, &old_ma, fa);
+	if (err)
+		goto out;
+	err = security_inode_file_setattr(dentry, fa);
+	if (err)
+		goto out;
+	err = inode->i_op->fileattr_set(idmap, dentry, fa);
+	if (err)
+		goto out;
+	fsnotify_xattr(dentry);
+
 out:
 	inode_unlock(inode);
 	return err;
-- 
2.56.0

