Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710713;
	b=KZlBEY3Dgf+Y99+RmBSqjpRyRIif5yMqeb4zNjRheS9TYMChxIU8NHfP9evhhG5sfEED
	 8Jj8oXAB41/ePVdx2aIN/GgvLOBDEf2++j/0axDEL9RQAoBiz00bM+lJWKv82rXTa4rSB
	 3swN8KXfxbMc3Jub/tzH3Q4G2D8NTusOu6BqC5DKAB8w84+1x3HA2afCs+hifNyAkQMyp
	 ooI+N0KrqwyYKu6UJnxOSnyg2umjJdxinZjSTCU7Xf5JobmWE6MBi5NqlJLe0o3QKhItS
	 FDdt37+Bkisj8OxVg53Dqj11gQQMrphJez2tbbckgvEPNfatrBuAOI/WthJXtLpkSrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JaTAxRtKeYbk84RLM3i2yEqwJv/D2pe6Nve7rFnRBXM=;
	b=18qvgRmR2/6Su9wlpgsMtYYUBrzxvyW4+kFKdZ5bfLsgRWO92kYw0Lm9rMlEIkUvCzpf
	 AftvzA259dSLSLSeyl2fSD3KVYz1zVa5KG5PIDOLcmBSNK4Tr12obV/539Ly+wR/n3mK0
	 6aY8XhDqt2gmOq3HWxnYKTX7AnIaTsSVSlm1mAgi1U4H9syqjvyqHuTid8o0znLY3DQFW
	 2tu0AET4JXBTyCyFHnNUs3h3kwaoIk9DKK2wY4YTCeDcaA9wob8qbCvS7K0W6xvg+zVvf
	 eG/ifpQq6L2e3gshmqzoBgBhq6gJ8NNjCJeNfdNcU7hbvOmeLtQZnECEcrhdEd+gwEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+nAWjCZ;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8615A60A2624
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 16:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8615A60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+nAWjCZ
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49465892f7bso5277256f8f.1
        for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 08:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795710712; x=1796315512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JaTAxRtKeYbk84RLM3i2yEqwJv/D2pe6Nve7rFnRBXM=;
        b=O+nAWjCZ470tyGd7DOFnANHdDB8tzSQsH7AfD1nbwJvHYLvDQNgaHQdlhNnJeHT96z
         AoMpSiWczUSS0f0iaiwnhx2QPji4nhrfMik0dJizjMyIK6SJcELNMOmgiznwuA+BJ3xP
         LdmwLI9uwZ19+2CFvmrExCk62DsoWLhpJrPCd54FPtiUR3zsKZcw9YxsS8nY4T0HZLsC
         qMSZC28zZlRVoktmaY06zkISh7uE40pB+SL3xqEEfb+emWZmiu3qJHiBCftiMD07IBR/
         TBBVNaa2IltcmokDKVnu9nIiNmtn5nxBQu62z9qGflU9MPS6VvJt/nANm3NWNSDFDXsD
         pcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710712; x=1796315512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JaTAxRtKeYbk84RLM3i2yEqwJv/D2pe6Nve7rFnRBXM=;
        b=oeRoDR2zs1Q4U51XBT9oHX6nSjgEgb4xcb7JQC4TpQIAHYtX4XVXMa7CjY9bDEPKLr
         R0OOF3XqHcbmDzdNhOGQ9ZldsortPsF/qSgDDg5hK7a9iTovW4j4KPJgaY6jul8sjA8j
         fHYUp/tqKQeOlikfOtMMc+CSLY8J8uZmKzUnh8W5yXfgAQYKK9dhi+OM8z+LTEc9UZTl
         g2StGR0tzKE3Y+ER5/YVZYtvCBgN2DeHyDQFwWWWuqFKabukNDkz+Pqaygk5Tc8opC/9
         TOEC99NuEyZMtUI6PF6jFtFqzOOdr9UKAHNzBrcz4LA46qY/J9cp7tGSMA+hfzvwJCG4
         rs0w==
X-Forwarded-Encrypted: i=1; AL+hErHYZoGAjxg8V34Kgs05zVmzjYGApicO5BWGanJN3C60xaitl+8REltnchl97iLRR/j20P4l@lists.linux.dev
X-Gm-Message-State: APuU4Z84n2ZDLyn7YBQC45iYSHCDDRk/Klkv3HDe01LUSoaCC4mPM941
	NGxqEhzZ5n8ftpRQ3KbKI0xNIhxvWiQOgby2Izvp/2xGgnVn7hsxZn/F
X-Gm-Gg: AZFdTZerwfNFY9idGW80n7I4WJkDsT3ME0+y4iMYwEn4duBichSELWdKukcg1ZPx9mr
	wkr8VAjzcCwPuIiCZPRRMpvLHgRZpW4WPADUenBvQ7aeqi5dP3Z0uz2TMCu3h/QqfDtgnMM4nak
	gTnrKUcOSUQVKLXA6l5jdQpujJe2zRWgo4LXXcgsJuG+UHRxIoc/JaPd+/3Uv6IHjULga8j0ugb
	Mv1t2ef4A4BsECBEgVqLX2eclxBtZV1ZmLNuTHCxVhcQDmSUiopmUfWXCVSW1y4aGNc3OHXKfYC
	bRW7teNCHTyyKVlWYH/kVVK6TDaD2AXEfmN2BwFmsN1xTKNNwhJGQxXkP17MiRSRRzBgWH0V39D
	I8zeU8Qm4L+6h5fNyJOgglELVaxWGkcJmGxkrCQcirZnSDUV0/mAlEM7Jwn4NBrNNZHHdmMT6AS
	6HIGOqp5mvVqux5/jg97LZ7oKJULygtqHWo8csNpcUAuZK/H1u5ELTY8/vtdJRz/1+Ls+c/F/+o
	2dlnMp8L6lIRpHCfZnQn33kr9nSy4/ZGhFrD4BIVqNew5KEaRWZNFNRA9z3L2/AKsFqRx0zZv+O
	k7WBYCseY6AhgP6RDPxXJp21
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr444061975e9.17.1795710711689;
        Thu, 26 Nov 2026 08:31:51 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm721964995e9.11.2026.11.26.08.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:31:51 -0800 (PST)
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
Subject: [PATCH v2 4/4] ntfs: switch to the new xflags fileattr API
Date: Thu, 26 Nov 2026 17:31:14 +0100
Message-ID: <20261126163114.403846-5-koray.fra@gmail.com>
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

Switch ntfs_fileattr_[gs]et() from the legacy FS_*_FL flags to the
modern xflags (FS_XFLAG_*) fileattr API with masks.

Introduce FS_XFLAG_COMPR and FS_XFLAG_ENCRYPT to be used in this API
upgrade.

Following the FS_XFLAG_VERITY example, put FS_XFLAG_ENCRYPT in
FS_XFLAG_RDONLY_MASK and in FS_XFLAG_COMMON, since it's read-only for
all filesystems.

Following the FS_XFLAG_CASEFOLD example, put FS_XFLAG_COMPR in
FS_XFLAG_RDONLY_MASK but not in FS_XFLAG_COMMON, since it's read-write
for some filesystems and read-only for others, to avoid breaking
existing filesystems.

Also update vfs fileattr_fill_* helpers to include these two flags as
well.

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.11
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/file_attr.c           |   8 +++
 fs/ntfs/file.c           | 109 +++++++++++++++++++++------------------
 include/linux/fileattr.h |   7 +--
 include/uapi/linux/fs.h  |   2 +
 4 files changed, 72 insertions(+), 54 deletions(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index 35bc2ded2ff8..3631353ec9c7 100644
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
index 50be49f4c913..34acf9333c41 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -155,31 +155,38 @@ int ntfs_file_release(struct inode *vi, struct file *filp)
  * @dentry: dentry to report the flags of
  * @fa: filled in with the flags of @dentry
  */
+#define NTFS_RO_XFLAGS (FS_XFLAG_COMPR | FS_XFLAG_ENCRYPT | \
+			FS_XFLAG_CASEFOLD)
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
 
@@ -207,11 +214,9 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 {
 	struct inode *vi = d_inode(dentry);
 	struct ntfs_inode *ni = NTFS_I(vi);
-	u32 allowed = FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL |
-		      FS_NOATIME_FL;
-	u32 readonly = 0;
-	u32 linuxflags = ni->linuxflags & ~NTFS_LINUXFLAGS_MASK;
-	unsigned int new_fl = 0;
+	u32 linuxflags = ni->linuxflags;
+	u32 rw_user_mask = fa->fsx_xflags_rw_mask;
+	unsigned int new_fl = 0, mask_fl = 0;
 	bool forced_immutable;
 	int err;
 
@@ -219,44 +224,46 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
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
-		return -EOPNOTSUPP;
-
-	forced_immutable = ntfs_is_forced_immutable(vi);
-	if (!(fa->flags & FS_IMMUTABLE_FL) && forced_immutable)
-		return -EPERM;
-
-	if (fa->flags & FS_IMMUTABLE_FL) {
-		new_fl |= S_IMMUTABLE;
-		/* Do not persist an immutable bit derived from the mount. */
-		if (!forced_immutable ||
-		    (ni->linuxflags & NTFS_LINUXFLAGS_IMMUTABLE))
-			linuxflags |= NTFS_LINUXFLAGS_IMMUTABLE;
+	if (rw_user_mask & FS_XFLAG_IMMUTABLE) {
+		forced_immutable = ntfs_is_forced_immutable(vi);
+		if (!(fa->fsx_xflags & FS_XFLAG_IMMUTABLE) && forced_immutable)
+			return -EPERM;
+
+		mask_fl |= S_IMMUTABLE;
+		if (fa->fsx_xflags & FS_XFLAG_IMMUTABLE) {
+			new_fl |= S_IMMUTABLE;
+			/* Do not persist an immutable bit derived from the mount. */
+			if (!forced_immutable ||
+			    (ni->linuxflags & NTFS_LINUXFLAGS_IMMUTABLE))
+				linuxflags |= NTFS_LINUXFLAGS_IMMUTABLE;
+		} else {
+			if (ni->linuxflags & NTFS_LINUXFLAGS_IMMUTABLE)
+				linuxflags &= ~NTFS_LINUXFLAGS_IMMUTABLE;
+		}
 	}
-	if (fa->flags & FS_APPEND_FL) {
-		new_fl |= S_APPEND;
-		linuxflags |= NTFS_LINUXFLAGS_APPEND;
+	if (rw_user_mask & FS_XFLAG_APPEND) {
+		mask_fl |= S_APPEND;
+		if (fa->fsx_xflags & FS_XFLAG_APPEND) {
+			new_fl |= S_APPEND;
+			linuxflags |= NTFS_LINUXFLAGS_APPEND;
+		} else {
+			linuxflags &= ~NTFS_LINUXFLAGS_APPEND;
+		}
+	}
+	if (rw_user_mask & FS_XFLAG_NODUMP) {
+		if (fa->fsx_xflags & FS_XFLAG_NODUMP)
+			linuxflags |= NTFS_LINUXFLAGS_NODUMP;
+		else
+			linuxflags &= ~NTFS_LINUXFLAGS_NODUMP;
 	}
-	if (fa->flags & FS_NODUMP_FL)
-		linuxflags |= NTFS_LINUXFLAGS_NODUMP;
-	if (fa->flags & FS_NOATIME_FL) {
-		new_fl |= S_NOATIME;
-		linuxflags |= NTFS_LINUXFLAGS_NOATIME;
+	if (rw_user_mask & FS_XFLAG_NOATIME) {
+		mask_fl |= S_NOATIME;
+		if (fa->fsx_xflags & FS_XFLAG_NOATIME) {
+			new_fl |= S_NOATIME;
+			linuxflags |= NTFS_LINUXFLAGS_NOATIME;
+		} else {
+			linuxflags &= ~NTFS_LINUXFLAGS_NOATIME;
+		}
 	}
 
 	mutex_lock(&ni->mrec_lock);
@@ -265,7 +272,7 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 	if (err)
 		return err;
 
-	inode_set_flags(vi, new_fl, S_IMMUTABLE | S_APPEND | S_NOATIME);
+	inode_set_flags(vi, new_fl, mask_fl);
 	inode_set_ctime_current(vi);
 	mark_inode_dirty(vi);
 	return 0;
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index 725efac15e76..b201333443ca 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -7,17 +7,18 @@
 #define FS_COMMON_FL \
 	(FS_SYNC_FL | FS_IMMUTABLE_FL | FS_APPEND_FL | \
 	 FS_NODUMP_FL |	FS_NOATIME_FL | FS_DAX_FL | \
-	 FS_PROJINHERIT_FL | FS_VERITY_FL)
+	 FS_PROJINHERIT_FL | FS_VERITY_FL | FS_ENCRYPT_FL)
 
 #define FS_XFLAG_COMMON \
 	(FS_XFLAG_SYNC | FS_XFLAG_IMMUTABLE | FS_XFLAG_APPEND | \
 	 FS_XFLAG_NODUMP | FS_XFLAG_NOATIME | FS_XFLAG_DAX | \
-	 FS_XFLAG_PROJINHERIT | FS_XFLAG_VERITY)
+	 FS_XFLAG_PROJINHERIT | FS_XFLAG_VERITY | FS_XFLAG_ENCRYPT)
 
 /* Read-only inode flags */
 #define FS_XFLAG_RDONLY_MASK \
 	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR | FS_XFLAG_VERITY | \
-	 FS_XFLAG_CASEFOLD | FS_XFLAG_CASENONPRESERVING)
+	 FS_XFLAG_CASEFOLD | FS_XFLAG_CASENONPRESERVING | FS_XFLAG_ENCRYPT | \
+	 FS_XFLAG_COMPR)
 
 /* Flags to indicate valid value of fsx_ fields */
 #define FS_XFLAG_VALUES_MASK \
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index 63d88ebe3420..8d78990eb95c 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -274,6 +274,8 @@ struct file_attr {
 #define FS_XFLAG_CASEFOLD	0x00040000	/* case-insensitive lookups */
 #define FS_XFLAG_CASENONPRESERVING 0x00080000	/* case not preserved */
 #define FS_XFLAG_PROJID		0x00100000	/* project ID */
+#define FS_XFLAG_COMPR		0x00200000	/* Compress file */
+#define FS_XFLAG_ENCRYPT	0x00400000	/* Encrypted file */
 
 #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
 
-- 
2.56.0

