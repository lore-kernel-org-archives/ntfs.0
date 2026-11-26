Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710711;
	b=4Zy8DWq/y8Xkj2m1nmv6pkzdYT+4mn5tvghECiZLBUYCwaKid1FA8GDkXbTdwS6PeSTi
	 2XSJiqCcOIwsUz9cVLUrPCzb/8cFmPY04aAWOD9OnXnZ6VhXg1pG3iZTAidk+SciL1K2j
	 ZaXWN7lWmeQusGhWd1Xr0qvAAinlbjxH9CtcmmRvcIZPgBH2xOmRl9vzqyB+2Nmd9FRnV
	 buGyeTFTX14nnfFEpw121ykqLfFAenFufZfWKF+8rT79DrVQXQwcRGZZ995DMscXgV6Nb
	 44uror2CTFTvncHMt3ooMinB0/JDiQvrbfpeuo1CM2QbSC/YzPHdDtbVJtxNnGR7Igw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6DGKGHZD1sWqO2WRSY4U0udOhpGKQXiV3WJqb4Fx1ZI=;
	b=uJDrTHUU6074Cah/pZvxNAh2jFIyzFtjbql6Cez4feOnSzprQVe0l8vYKwNiWVGoR7Ok
	 6ymKAXMJfzMk0xOoVsU8sbTkIEPQig0FjTYiAEI+p1Y2cd0pmCg8WEX1AZd7MlxJcL1to
	 lm7OSHw56ky63mOuam5o6W2oKZvdaj6pEuwVZ0YoAQ0Ih4NLos00lao94jGt0u4NVmRui
	 2DUoYU4LnSlo2Xto0WOoxegKMcrUmZYG825pg4JIPskbwKPAvgDjWScDGz06Q4Jzh1Hjd
	 iRi8k5ThuWQcvxLHDIMwKnI5xUHwkXex6q1m15xTNhXem3Zfw+ougEY5pKZfScJQ6dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QPECzVYF;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6CE606A6A8
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 16:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E6CE606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QPECzVYF
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so61873985e9.0
        for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 08:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795710708; x=1796315508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DGKGHZD1sWqO2WRSY4U0udOhpGKQXiV3WJqb4Fx1ZI=;
        b=QPECzVYFV7qXfs6Bn/et9VVldI3KFPkmjyku/eqt0CS3GKYdu+g0KngiYEsKf9Va8l
         SRVns/+uiB4Zi1SsTZSLOLLwdCAk5ZezVmAxpYgTpC4JVy+9CdZmJMNt2YWvozmSpQa/
         LzirHUM2qvWe16C7udM0bhUf3fOKrH8q3T8+wwoU/GX05J8WZfbvWDGpWHkLhLnBvkSo
         HyO6/frDY7r48k7NjW+h6po6y5P/rWBMbA/rY4tkWfo8GiBFdW9r/O/EqX2/KV+wrC3Q
         0jl/zHaIRBn6fRCK96G3PxsgXn+9JqKtFPthGw4oeKyf6CWaXO143sXJOPXJ0l3ioC0z
         vg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710708; x=1796315508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DGKGHZD1sWqO2WRSY4U0udOhpGKQXiV3WJqb4Fx1ZI=;
        b=waivGqz4S4McyMudPYdLBB5DORkqHkBFNZRaGK6gxpbooCeV383irt1IhcYRqYzRPm
         tCiOl24OpS/aW+ZvZReke8AsNTUPry5OKmwRBrLGr+AECHOYLgt11DewVJHrsK3X5CWO
         dzVK2CYkvFC7ZjEFR8m97p8HO/3dBrZIwTmoEcfuHoOI83DYXLCVn7cVImx8RPmyyZVi
         OMvtdINkKt7nCEt1428l0rFU44WxOhYrmNQrCL44dOOrSXwt3FyTvtSX/bhfXiw5iUX5
         ZcCMFBu3eEXUVY/UsJGVfxyqujWWHvvef056Tpvb2Dp6nnc3TQYf3c/oyZJ6AaS+73nv
         k0SA==
X-Forwarded-Encrypted: i=1; AL+hErH1+sPFC1SpqpnWqZ24/XJHK5nUlOzdtWgreCjSqJd8JGsauIN26FNyDsSKPtMYAoeAWJNv@lists.linux.dev
X-Gm-Message-State: APuU4Z+Hx+VYEgWEtdbtxU9D17A5PJ+kXvznmwFsYHHgbch08qwahRfW
	N/1wvTCDXtg9Qo9XiZ6mj/VYkO2yp7vgEAYtAGUAGJFAtqqaYTm+O02A
X-Gm-Gg: AZFdTZf6pbTxHC364cvuXpX6zsom+9aq6y7/I0zcYMLjOMed5tikiLRDHYdZndcR/y9
	tMSCgu40JM8EptHWsD/Echt5YlceTQv9P1q+s4EZ9IlrJqxSg47Ll8YrS0c3xr17+iE8ixA1exI
	TVTOzZRJD5udVrmFqgkmu+PXkWl/PLfkSLgQhimWWPWbme6TlnBpMxPpemXZ2deuZtTEtTiO4BE
	CqEPouEGRbMPlYYDLg6r9m9QUhuZwASnRoT4ealWaZLgriUi51CILaoEtUx6dP45oRD2Lf4W+Hl
	1rcNzi6ZVIJrgj+FdEK1cRed6UT3hA3TURx9jJ4iPWhM+P7h90rpusGWm5WOaNp3CL2qR01aMWW
	nDNt3rv8Vrra67f8oj7d39SMV89Nxuhmd5r5pe22PgaBQDPREInHUOl3eJDxonlPxohCYGKaR58
	Hp723YcsvxOeSnBLBI7fjNMWjqf09wtKYmB5POPoWsusdgE/NWeKOKxy7hukPilJD+HJMAYuSxZ
	aAQukDIPsWY4eWA5RYrzXP+X9lJ+/V1mWsPhg6ukdeKoiYAmGx34GhGI5ZiZ0TMC9h3thGDmxsw
	d4kqGlssEgR+K/xDh6GsMDw1
X-Received: by 2002:a05:600c:3b83:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb88822242mr502582645e9.28.1795710708243;
        Thu, 26 Nov 2026 08:31:48 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm721964995e9.11.2026.11.26.08.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:31:47 -0800 (PST)
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
Subject: [PATCH v2 2/4] fscrypt: update fscrypt_prepare_setflags() to use xflags
Date: Thu, 26 Nov 2026 17:31:12 +0100
Message-ID: <20261126163114.403846-3-koray.fra@gmail.com>
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

Update fscrypt_prepare_setflags() to use FS_XFLAG_* xflags instead of
legacy FS_*_FL flags.

Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/crypto/hooks.c       | 10 +++++-----
 fs/file_attr.c          |  2 +-
 include/linux/fscrypt.h |  6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 149498bdab94..52d6a33fc9e9 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -182,10 +182,10 @@ int __fscrypt_prepare_setattr(struct dentry *dentry, struct iattr *attr)
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
 
 /**
- * fscrypt_prepare_setflags() - prepare to change flags with FS_IOC_SETFLAGS
+ * fscrypt_prepare_setflags() - prepare to change xflags
  * @inode: the inode on which flags are being changed
- * @oldflags: the old flags
- * @flags: the new flags
+ * @oldxflags: the old xflags
+ * @xflags: the new xflags
  *
  * The caller should be holding i_rwsem for write.
  *
@@ -193,7 +193,7 @@ EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
  *	   another error occurs.
  */
 int fscrypt_prepare_setflags(struct inode *inode,
-			     unsigned int oldflags, unsigned int flags)
+			     unsigned int oldxflags, unsigned int xflags)
 {
 	struct fscrypt_inode_info *ci;
 	struct fscrypt_master_key *mk;
@@ -204,7 +204,7 @@ int fscrypt_prepare_setflags(struct inode *inode,
 	 * derive the secret key needed for the dirhash.  This is only possible
 	 * if the directory uses a v2 encryption policy.
 	 */
-	if (IS_ENCRYPTED(inode) && (flags & ~oldflags & FS_CASEFOLD_FL)) {
+	if (IS_ENCRYPTED(inode) && (xflags & ~oldxflags & FS_XFLAG_CASEFOLD)) {
 		err = fscrypt_require_key(inode);
 		if (err)
 			return err;
diff --git a/fs/file_attr.c b/fs/file_attr.c
index 40d6518f1d8e..1687891c526c 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -195,7 +195,7 @@ static int fileattr_set_prepare(struct inode *inode,
 	    !capable(CAP_LINUX_IMMUTABLE))
 		return -EPERM;
 
-	err = fscrypt_prepare_setflags(inode, old_ma->flags, fa->flags);
+	err = fscrypt_prepare_setflags(inode, old_ma->fsx_xflags, fa->fsx_xflags);
 	if (err)
 		return err;
 
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 28f2108e29f3..68d0983385d0 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -461,7 +461,7 @@ int fscrypt_prepare_lookup_partial(struct inode *dir, struct dentry *dentry);
 int __fscrypt_prepare_readdir(struct inode *dir);
 int __fscrypt_prepare_setattr(struct dentry *dentry, struct iattr *attr);
 int fscrypt_prepare_setflags(struct inode *inode,
-			     unsigned int oldflags, unsigned int flags);
+			     unsigned int oldxflags, unsigned int xflags);
 int fscrypt_prepare_symlink(struct inode *dir, const char *target,
 			    unsigned int len, unsigned int max_len,
 			    struct fscrypt_str *disk_link);
@@ -784,8 +784,8 @@ static inline int __fscrypt_prepare_setattr(struct dentry *dentry,
 }
 
 static inline int fscrypt_prepare_setflags(struct inode *inode,
-					   unsigned int oldflags,
-					   unsigned int flags)
+					   unsigned int oldxflags,
+					   unsigned int xflags)
 {
 	return 0;
 }
-- 
2.56.0

