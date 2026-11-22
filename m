Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795306161;
	b=uBvWobiJG20X8UZhfH+y9TBMBNJYqm8LJ2pUfgMmNNvpkILPJwAvvFQBkhFhQIM6x3f/
	 OL7XMLAq29YrP9M/pZCWDnnGFdH+WHR8uZ5/PlJxgYJOsytozRa3l4ppgk7hTvfLVukIN
	 9C5uA/knWYfSGU9kosmtJDO5DEqPeAfH6LZQjP5GQMiyrMk6ZLh9+nnDl3plhAarn5Dju
	 dOg1ZYlez3AYA8WOloh7IU2bTIVyjJaGJ6gzN2uKRi/oYpn8Wfh9MstW0M5cmK572n3F/
	 2Omhf2J9GAF/J8r9Nx5Triii0VREEYTreWfhZJa3xkjZ9EznifDu71OJIeP8tB9zLLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795306161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4xZytGWv8+w9GAco63iTykOZG4XUcvcZgoLypgA0ThI=;
	b=gxabKsddsfkja4k6t1PLRhaHumLHoS1xD1X6SGmYPsI4hlftZB0EmSfWLgpFyFz/EsAS
	 qFtFLNZHwS4tRYRK+YccaM9kHxMJH4tYvfxuLZQGU4lwV2wXsPuF8PYG4FIvZP/eeD/1k
	 czxtduYCDn7sg5yyuZMpq9OJatg1Isf8TpDyBqD+Td6C5XQFPQsyahIhrFHIoCkM/nPTk
	 c5Rnjg0wFmtgwnJNUpADiXUssL0kDE3oRpTWFeA6NImeFv4GGH4Uhp9rI7nyChKybgmiF
	 19ecZz25ehCnOnxeFsEhQUfPJSEtCytT9C1CDgpW2jW5oMICzpgydjiMVCBuletoo3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I1qGn4ov;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248D6606A33C
	for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 00:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 248D6606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I1qGn4ov
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso20254995e9.3
        for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 16:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795306159; x=1795910959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xZytGWv8+w9GAco63iTykOZG4XUcvcZgoLypgA0ThI=;
        b=I1qGn4ovMb/RxrEiKJHhV9E548RYaR8e6ycdfTAsJGESUUANkb5BxPjqLHxdnCOuxr
         Ny7EO3c7R9vyEFZX3cVbL4t5GyM1dTpkCTH9vB+zMKJNv0cvSg5qfQqiHTfQ7NNr705U
         JvP/H2yNaxZalgoQsuDbm8gKb8spIT7K4b63xTsE/oPyELytWyvdH/6xKRZt98D26HtZ
         yESXm/Rmxg4JTfqY3chJUWUyHPlnPFUvZqZBlZBe71WY3Nkz4E7IjifzYZIZEtXsF5rK
         5A3+/qdkvhc+5S71Ptxxycgge/PxPWVJPT9oZ01Sjb/rYOwD5p/NFxyBHP+Zt4BCxNss
         U9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795306159; x=1795910959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4xZytGWv8+w9GAco63iTykOZG4XUcvcZgoLypgA0ThI=;
        b=pzpYBPpOm25XhWfrFKzBCjzV2huggTKQGXC/vIXqizDetAWmsP6QUbZcoftl7tMi+1
         EUsvi4rbdVdlGE8jN7gym858z/joAGGb9ne4siilAYTQOrnObN6HcFRHxTLoCcMiIvDI
         plvxTWrlFHf/Ma9iGx0DIod+atDjugHLiuT7E9/dpYiR+2YQl7dDrkO3bRyMuq5U2tAy
         mSRwIMFSN8rwjJUk3ugIJ40aaTXVEA4powWZdiAPWq1MgAYbed3TDmWobnWMCRxwF6ZO
         QD5/8Kl3bQoFYYnal+LZMdkXK6OxWD8PGIWlq3m0b2z+9GDjuiXSlDDdVsanTk7LNjXq
         8Juw==
X-Forwarded-Encrypted: i=1; AL+hErGnwgKHvCbVUMM4sKcF6xdtoM21SAkI24n2Yt5Mrol3nVE3qGzhF2MbdjrJ6Bv7ISOEEQtO@lists.linux.dev
X-Gm-Message-State: APuU4Z+sJosYfSUcdL302+Wpy8pn6YwUn8oaAsBFHYE6VN2Ojgnbb4O0
	0hU/3zK9e+JyEjIwaQKwt8iCuzX2Lnp59GuXlaHruWdObnbF0rW90GIy
X-Gm-Gg: AZFdTZdOslXSIhvdR8VLL3yb03yN1cvPUR5M4vlx5SxIcNE7ycjwYZ34l9d1KRpar/P
	dYC0BAL8lxYoj0oYv0vX2O8E68oPF8Y1SEbilbhTLjUFoceZGfcPkjlrRysVB2S4kUyluikuUpC
	PHREngaR4R4/ZsPuvE1zZ2FqMVBEmWDdWoo00C9j57+o/IURvOMqn9m8A6ws4LbsUBPcWr6dSFX
	gkmem8o5Pxke4pBjGe5PRQn7kBKHv315YJxGeyanBa1WE25BXS6aNRnmA3G6ixi0PfjpCrg0crs
	dwu5CshH+ljdMKrJb6wx/yQSlH4hg2aJ1EiNImO3gKh4XetqY3pMWiaELRgYZvjJtS/njI6Z/ob
	mgw8LrcVo0fAjhGcwzv4Hj0gW7iwUu/t9SsAyXtBgxmzl59KOq1iqE1p2794wm5V7eow2Vjl9sl
	t6n6dcsRlz+3chZPWuVf/HaEAKuRZ0lEJdbRHC5znGHvap5qL8qSRje/8a920fPJWA+bqA2OXKG
	gwkClZONIyoeJa6gOmmP7098Inyj+V2DRBAWI13eDi4XJZetCvld63pzabgF0usEqXKNWF7/x80
	bI1ZQiHR7qSDTsk+4hHrDG8i
X-Received: by 2002:a05:600c:8210:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4bb887865b5mr159815355e9.0.1795306159378;
        Sat, 21 Nov 2026 16:09:19 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm13461872f8f.0.2026.11.21.16.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 16:09:18 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
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
Subject: [PATCH 3/3] ntfs: switch to the new xflags fileattr API
Date: Sun, 22 Nov 2026 01:08:56 +0100
Message-ID: <20261122000856.536902-4-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261122000856.536902-1-koray.fra@gmail.com>
References: <20261122000856.536902-1-koray.fra@gmail.com>
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

Switch ntfs_fileattr_[gs]et() from the legacy FS_*_FL flags to the
modern xflags (FS_XFLAG_*) fileattr API with masks.

Introduce FS_XFLAG_COMPR and FS_XFLAG_ENCRYPT and add them to
FS_XFLAG_COMMON (and add FS_COMPR_FL and FS_ENCRYPT_FL to FS_COMMON_FL)
to be used in this API switch.

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.11
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/file_attr.c           |  8 +++++
 fs/ntfs/file.c           | 63 +++++++++++++++++++---------------------
 include/linux/fileattr.h |  6 ++--
 include/uapi/linux/fs.h  |  2 ++
 4 files changed, 44 insertions(+), 35 deletions(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index 0e16c23368b2..815b8ba50e1f 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -39,6 +39,10 @@ void fileattr_fill_xflags(struct file_kattr *fa, u32 xflags)
 		fa->flags |= FS_VERITY_FL;
 	if (fa->fsx_xflags & FS_XFLAG_CASEFOLD)
 		fa->flags |= FS_CASEFOLD_FL;
+	if (fa->fsx_xflags & FS_XFLAG_COMPR)
+		fa->flags |= FS_COMPR_FL;
+	if (fa->fsx_xflags & FS_XFLAG_ENCRYPT)
+		fa->flags |= FS_ENCRYPT_FL;
 }
 EXPORT_SYMBOL(fileattr_fill_xflags);
 
@@ -71,6 +75,10 @@ void fileattr_fill_flags(struct file_kattr *fa, u32 flags)
 		fa->fsx_xflags |= FS_XFLAG_VERITY;
 	if (fa->flags & FS_CASEFOLD_FL)
 		fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
+	if (fa->flags & FS_COMPR_FL)
+		fa->fsx_xflags |= FS_XFLAG_COMPR;
+	if (fa->flags & FS_ENCRYPT_FL)
+		fa->fsx_xflags |= FS_XFLAG_ENCRYPT;
 }
 EXPORT_SYMBOL(fileattr_fill_flags);
 
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 50be49f4c913..fde6fb2fe39c 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -155,31 +155,37 @@ int ntfs_file_release(struct inode *vi, struct file *filp)
  * @dentry: dentry to report the flags of
  * @fa: filled in with the flags of @dentry
  */
+#define NTFS_RO_XFLAGS (FS_XFLAG_COMPR | FS_XFLAG_ENCRYPT | FS_XFLAG_CASEFOLD)
+#define NTFS_RW_XFLAGS (FS_XFLAG_IMMUTABLE | FS_XFLAG_APPEND | \
+			FS_XFLAG_NOATIME | FS_XFLAG_NODUMP)
 int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 {
 	struct inode *vi = d_inode(dentry);
 	struct ntfs_inode *ni = NTFS_I(vi);
-	u32 flags = 0;
+	u32 xflags = 0;
 
 	if (NVolShutdown(ni->vol))
 		return -EIO;
 
 	if (NInoCompressed(ni) || NInoWofCompressed(ni))
-		flags |= FS_COMPR_FL;
+		xflags |= FS_XFLAG_COMPR;
 	if (NInoEncrypted(ni))
-		flags |= FS_ENCRYPT_FL;
+		xflags |= FS_XFLAG_ENCRYPT;
 	if (vi->i_flags & S_IMMUTABLE)
-		flags |= FS_IMMUTABLE_FL;
+		xflags |= FS_XFLAG_IMMUTABLE;
 	if (vi->i_flags & S_APPEND)
-		flags |= FS_APPEND_FL;
+		xflags |= FS_XFLAG_APPEND;
 	if (vi->i_flags & S_NOATIME)
-		flags |= FS_NOATIME_FL;
+		xflags |= FS_XFLAG_NOATIME;
 	if (ni->linuxflags & NTFS_LINUXFLAGS_NODUMP)
-		flags |= FS_NODUMP_FL;
+		xflags |= FS_XFLAG_NODUMP;
 	if (!NVolCaseSensitive(ni->vol))
-		flags |= FS_CASEFOLD_FL;
+		xflags |= FS_XFLAG_CASEFOLD;
 
-	fileattr_fill_flags(fa, flags);
+	fileattr_fill_xflags(fa, xflags);
+	fa->fsx_xflags_ro_mask = NTFS_RO_XFLAGS;
+	fa->fsx_xflags_rw_mask = NTFS_RW_XFLAGS;
+	fa->has_masks = true;
 	return 0;
 }
 
@@ -207,9 +213,6 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 {
 	struct inode *vi = d_inode(dentry);
 	struct ntfs_inode *ni = NTFS_I(vi);
-	u32 allowed = FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL |
-		      FS_NOATIME_FL;
-	u32 readonly = 0;
 	u32 linuxflags = ni->linuxflags & ~NTFS_LINUXFLAGS_MASK;
 	unsigned int new_fl = 0;
 	bool forced_immutable;
@@ -219,42 +222,36 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 	if (err)
 		return err;
 
-	if (fileattr_has_fsx(fa))
-		return -EOPNOTSUPP;
-
-	/* chattr passes the unchanged read-only flags back to us too. */
-	if (NInoCompressed(ni) || NInoWofCompressed(ni))
-		readonly |= FS_COMPR_FL;
-	if (NInoEncrypted(ni))
-		readonly |= FS_ENCRYPT_FL;
-	if ((fa->flags ^ readonly) & (FS_COMPR_FL | FS_ENCRYPT_FL))
-		return -EOPNOTSUPP;
-	allowed |= readonly;
-
-	/* Case folding is a read-only, mount-wide property. */
-	if (!NVolCaseSensitive(ni->vol))
-		allowed |= FS_CASEFOLD_FL;
-	if (fa->flags & ~allowed)
+	/*
+	 * When userspace uses file_[gs]etattr(), VFS already checks and fails
+	 * with -EOPNOTSUPP if rw_mask & ro_mask != 0 and rw_mask & ~allowed,
+	 * but for FS_IOC_SETFLAGS and FS_IOC_FSSETXATTR VFS can't check for
+	 * allowed flags as these ioctls don't support fsx_xflags_{rw,ro}_mask,
+	 * so we need to check for unsupported flags anyway.
+	 */
+	if (!fa->has_masks &&
+	    ((fa->fsx_xflags & ~NTFS_RW_XFLAGS) ||
+	     fa->fsx_extsize || fa->fsx_projid || fa->fsx_cowextsize))
 		return -EOPNOTSUPP;
 
 	forced_immutable = ntfs_is_forced_immutable(vi);
-	if (!(fa->flags & FS_IMMUTABLE_FL) && forced_immutable)
+	if (!(fa->fsx_xflags & FS_XFLAG_IMMUTABLE) && forced_immutable)
 		return -EPERM;
 
-	if (fa->flags & FS_IMMUTABLE_FL) {
+	if (fa->fsx_xflags & FS_XFLAG_IMMUTABLE) {
 		new_fl |= S_IMMUTABLE;
 		/* Do not persist an immutable bit derived from the mount. */
 		if (!forced_immutable ||
 		    (ni->linuxflags & NTFS_LINUXFLAGS_IMMUTABLE))
 			linuxflags |= NTFS_LINUXFLAGS_IMMUTABLE;
 	}
-	if (fa->flags & FS_APPEND_FL) {
+	if (fa->fsx_xflags & FS_XFLAG_APPEND) {
 		new_fl |= S_APPEND;
 		linuxflags |= NTFS_LINUXFLAGS_APPEND;
 	}
-	if (fa->flags & FS_NODUMP_FL)
+	if (fa->fsx_xflags & FS_XFLAG_NODUMP)
 		linuxflags |= NTFS_LINUXFLAGS_NODUMP;
-	if (fa->flags & FS_NOATIME_FL) {
+	if (fa->fsx_xflags & FS_XFLAG_NOATIME) {
 		new_fl |= S_NOATIME;
 		linuxflags |= NTFS_LINUXFLAGS_NOATIME;
 	}
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index 4faa40febf11..219e7c8eb601 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -7,12 +7,14 @@
 #define FS_COMMON_FL \
 	(FS_SYNC_FL | FS_IMMUTABLE_FL | FS_APPEND_FL | \
 	 FS_NODUMP_FL |	FS_NOATIME_FL | FS_DAX_FL | \
-	 FS_PROJINHERIT_FL | FS_VERITY_FL)
+	 FS_PROJINHERIT_FL | FS_VERITY_FL | FS_COMPR_FL | \
+	 FS_ENCRYPT_FL)
 
 #define FS_XFLAG_COMMON \
 	(FS_XFLAG_SYNC | FS_XFLAG_IMMUTABLE | FS_XFLAG_APPEND | \
 	 FS_XFLAG_NODUMP | FS_XFLAG_NOATIME | FS_XFLAG_DAX | \
-	 FS_XFLAG_PROJINHERIT | FS_XFLAG_VERITY)
+	 FS_XFLAG_PROJINHERIT | FS_XFLAG_VERITY | FS_XFLAG_COMPR | \
+	 FS_XFLAG_ENCRYPT)
 
 /* Read-only inode flags */
 #define FS_XFLAG_RDONLY_MASK \
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index e40806b3a69c..09fc7e066485 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -275,6 +275,8 @@ struct file_attr {
 #define FS_XFLAG_CASENONPRESERVING 0x00080000	/* case not preserved */
 
 #define FS_XFLAG_PROJID		0x00100000	/* project ID */
+#define FS_XFLAG_COMPR		0x00200000	/* Compress file */
+#define FS_XFLAG_ENCRYPT	0x00400000	/* Encrypted file */
 #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
 
 /* the read-only stuff doesn't really belong here, but any other place is
-- 
2.56.0

