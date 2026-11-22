Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795306156;
	b=pHi4VDh8rLJ9QqFZOnMId+AoNFnDet95cbth7HTpJiKcdZYFjAn9rEXNZkV5nT5x+Qso
	 lc/2VJ8BZ5FBidCzwYuzR7RrdhtluymKNSZsG92vDuKt56O+99C3Bz5Wn0OvE0dHn6QYC
	 RpNynKiNCnbqdb2UDlHCQ7HF9o2OHH14OuZe1iqZ6Xc9ksQGeeSi1RHoafrr+BqWbUOm0
	 10zf5WifyTV7v1U+UlrQ/x9JUnVB5ArBSxM7aFWZNcs1BWtajF0/F39I/HbZ5hNCZkpLB
	 4O91QaDEns0xnErB4AqE/zT4HI0qF7hjXg88RVzXXtcxMyY9WpCc8IY5lHL1qwWvWFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795306156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I3/a3+7dsQvjvECUWVZ/SwOHlfbc32z4n2+Zae+M7DI=;
	b=PmojRjSDpXxaEQzRmmlNnWs8SfX1AMt3T8buhSGIQBz/KtdT0V8GiCLvr/4txeubWWS2
	 kWAagr+0FFn4rtxImGPrZ2t2T0x1QTjjWE7IzVfh4rued93QFL+I37y2BpsTBmE67WV+y
	 cbM+/pBNPk1m2Z1kIGYmBD8r1/i+wi8Ex1GAMjtLBfnhW93xbTHYTWTJps9tdYq4tcT/Y
	 paSHBigx0EKgOQ2Lb7r8O1e8AxZ+cfFwnd6SPLH8EIJR7LcI7WgWXu0CebXlTHNAMqz4N
	 qa2hLMMHYIwBFftsvBv8Xnu3V6BK5kTHZqXXFKX5yCPLQ2Bcu8KV0eZJUZGxZmO4qVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OxARvHgT;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F2F606A68D
	for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 00:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56F2F606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OxARvHgT
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so1360609f8f.0
        for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 16:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795306155; x=1795910955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I3/a3+7dsQvjvECUWVZ/SwOHlfbc32z4n2+Zae+M7DI=;
        b=OxARvHgTCZoPSEFBuw7mLy3X6w6GCPT/66fET++ABvFFaSkcuoYljClBZ7dLcNB7An
         8043evA0C/+NaqGFnEKtk4FE46PHzVHNZkvDA757+QIe8e5OfBywambs+c+lcwF3b4Q+
         eGEHGdfZEVluJ79KQ8HOU0q0GL1PaW++DXRLoGPZ9lpH1Z5pbmpWJZR46iFGah1TjQMN
         64liJlaX2axnf6E49Ql2/l4g1DT2apAB61V2lPBsLETb8pxk5/2dX9HlhcoIVGjy9nlH
         uDeeodWil4uGZcQBi6d9CyRmw0A3I1gdt4u26ACGtnRwNIBJepwOpA6o0aqDRQ9ZoLz8
         rthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795306155; x=1795910955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I3/a3+7dsQvjvECUWVZ/SwOHlfbc32z4n2+Zae+M7DI=;
        b=xzKAk43C+AYmO4p6LcKqk5Spw9ipr9lIJleDeyRXkM8wEsVo6eP/ksA0F9chtQ2WK5
         Gcbvh4tim18C9Mqwa/88V/gwxRPm63Yo8x58yFZvfWgyq0OY5eAMZNwXBNeF9Nx940ZP
         Yo7FYw/6KQVcQydorFmz9MGHlIeaIn8eZy2QOxrlPNeVEc1+qKUWEUA9PIqJCunKklXb
         58HTSFjQeXpM514gOp/28sOvM4XfguUa34qpCAyMK4lJFiuHt3nWNQNk6/l18sHe78bp
         brlBqn0c/qUdQX4UH4idV1b0TRg4G2nG7tGZ1G82xIdUWZlH2IRIMma9FZ97JSRkWeXb
         c7OA==
X-Forwarded-Encrypted: i=1; AL+hErG7s38XKsBYIIW/viAJNMFa6anvCby6cKyx+LPKFcYyHrOdrw8FZJlcdAyavVBKGngJB5n+@lists.linux.dev
X-Gm-Message-State: APuU4Z/RfC7NKZEFfu1nx5FyoF9nE6nLGwvTqFNiRNQ+U7as3rvbNlfu
	B/VDxloHCjuV4erA0EV+cx3ltK5+KQmZ29jk9YLH9aZB6It/SsfsPOST
X-Gm-Gg: AZFdTZfAw8W1R/QtTPjjBk7KeuHgTvc5mQn88pzx/2KzPBTjrArf7QKawnaSey0CdWs
	Tzuy2YXiX+a9GXB5254v/lFJqTEgMc5pLDaqRn++YuxgGf74Re2ytJlB3Nr0JC78RlMCTFXuWk3
	ErIKuR0w5MoVtk4biRpTYuUP4NEQsBWMoi9JDX/2ulNqrswkF4ZdeDEh+4NHZN5f/ExQ9Z5/brE
	sx0JTemZ5zjkV9trjxKuqfc0wp7Hd66f8jXZxPWShEWt5XkquyJnbUXUcIaFIar79x8mxgoPlNL
	BZHrQR/hUrgWMu+0WtY7l4twa9P6t8Q77F9kKYzQ6PFZ3ZJjjg1Hw+pKD3fiWI9Phyo7mg6EDjB
	Sm8H7E4zwjp8N0FtQt8hmDDqvYbpVrNLlg2COcuzLhBcQseX/0039NhKH7FHD92sM2GVmp24Dm3
	EkXP3Y1brgK8lod+qBfmsMDWIgnC+lArjnGZjNL2Ldu1c4q90H3c+7+We5HWAwIrLpsaAzmBhlR
	kJLFqw6L6mixueWLUHJTpYeD/l53EPNul9CZC0ghY80+iSAOMiLjp+vbDUZEPx6mdh5hrYlA/WR
	E/ViT5l+rOlXaaQj/FzCLQRxzOyH0WN07EKneNwglNqkeg==
X-Received: by 2002:a5d:5f4c:0:b0:48e:5d33:da5c with SMTP id ffacd0b85a97d-4abad5aca65mr14743143f8f.1.1795306154599;
        Sat, 21 Nov 2026 16:09:14 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm13461872f8f.0.2026.11.21.16.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 16:09:13 -0800 (PST)
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
Subject: [PATCH 1/3] vfs: use goto out on error in vfs_fileattr_set()
Date: Sun, 22 Nov 2026 01:08:54 +0100
Message-ID: <20261122000856.536902-2-koray.fra@gmail.com>
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

Switch from using if (!err) { ... } to the cleaner if (err) goto out;
in the main body of vfs_fileattr_set().

Signed-off-by: koraynilay <koray.fra@gmail.com>
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

