Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C19376A19
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 06:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973094; cv=none; b=JB0jTyOouuCL2ei2Xmi+k2PKPjzjAdo0sb6ejKtXr/tZFsTh1MhFjhjyk7APXfMhmJSOk9lj7t+kBlfQPHFWnCprjCJLFZIxBYKClqfhsNPk8IXxn0p0d8cWoAYV94FnowOc5hLxKJozLf/zhsGJUE01EqNjQsGap25lPOvjlhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973094; c=relaxed/simple;
	bh=XSFkE8mVMpsGAbHslX853y+B//61MCpL5id2RmrrSJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eGaR8sdXOHqpAvseBVX98wW8vGk4Yuso9BlWVExR/oIijsppOHUXsCa5PFEYOK4sKYK0HcykpydPIye/qoTDk0Zz/SvWdDzgd6BD7XazIp2QJsv32gFu0EVSKWmM8nvpMIv3UdzdB5kPUCXai5buTO4Tfmm3BfSeYW7aiXLa/aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xr5IK40K; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xr5IK40K"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f05ffcso19580925ad.0
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 23:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789973092; x=1790577892; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TQGYbXqTzHr6KkUOA7rF3/5Lk+/QMh068xsZKavW1ho=;
        b=Xr5IK40KJcrI57YNkv+2fcO4VhaiUli5tVW0TwIwNE5xGbZyKtWjjbrZgRyxR66m+Z
         wEBnNCY/Ub3jWhRJ8XKF2eV13VyvLjXbxdymSDln+TYOLy6xe7Y4+lJqe62ayByuv/l8
         6OIdwQ05lGWql1yTvSHxiTOk/+h78jakZytuUi01aMa0ZCPFoHV2Tk9n1qCtKpG3TPjV
         KdNpAM1eFKEGqTQIgqaO9VWnoaaHkaDiqM9SwisDh2RXhQTeJA0sKdyJR00JKOPGfZ9C
         /O3XMS5o5yVYpTqFVXHc54PtZKzdPX6o/fjrR72Ivy/63IhHbcxA5Wr8TUBezVJRay1d
         4hWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973092; x=1790577892;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQGYbXqTzHr6KkUOA7rF3/5Lk+/QMh068xsZKavW1ho=;
        b=SNru4ay0lQ8H2ObqvtInc+Auf3wlPNBHlBQQCjsI1ajmhUUP9s+yr8BZ86HrUau18s
         AB4UVKe6LGJThDoQbtuVGbWeGSZWz9/gRwqh0p1BkexQ9SW2f84M91JNFnsWKbfG1LeT
         sm8nEofG9GH61ciQTDSW9BGbDwXpqChTPl5HWksd7nYVqR3+DZ2/cg5RMrO4kTjFMgWC
         bDtwzmfH+cMvj/mOwjGPSL2azXVVNfi3D8mC9N8ImY4BTbMk6LLxvddmMNuskdMYZ3aV
         a7XQ0IlYT398ONgByw+fyRqEd2Kg5QFEXddK39BwEKo6vxDNlB4ITmx6/aFZFdAwm5r4
         RI7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTcrVUPOa/IRz8bMUTqQ8bzSmTaf01kynvAcLRb22a8IdUJt0KPVGwNcHVJWpA9x6l+Kgy@lists.linux.dev
X-Gm-Message-State: AFuF++lKDZZ2s3FD2NvRLg9a5IRKCiGq7OQboWyvZi2iY49ZFxyl6u+B
	boMqZZjyPacJO1yEKvk6Li+mhtza1W8dtIXd1kDMOsx6L6UHl0KCqfq3P2yrsw==
X-Gm-Gg: AYBFou3tqk2XyWuTDVyvTZCEcNKTNlfO5d2CGOL2OWpBw0AAoWJsXZb6sh288Fbcgub
	lkzCg/PmfmRYsbEw1NzftOzQc7KiHlKDyUJO0L6vwjrRHpXmAPyLCWq9prYwEwco+DmjNyCWmW4
	nKNu51NcfgLyzQXiCD6CnOvDvptDANJALjPcn2EsK70EZWqVPnhJNMuGkvGeSFuf7M49wNib0fq
	5chnSAazqS86Z/MBCezlQZInrH1NzGG1G4Le+9GxWGKB9Kd3IW8/9+EgnSeN7ve81iwxhAgDRWT
	OSrAuLOW1+bXuV6IAIN+hgTbMCrJDijZ8uCwvI2XVOl/cO5WW3qtKrkw29WUjWyZXJdSoxtXJ1p
	xk43aj3P6oKfBSfp1XFOTaTQpUtcORAhmKJ+NJUDSSSLQ/vSZFteFrgf4vxhqJroLDFcc0ipTJB
	mk5uAngINpykvTmnqiSjhjSerrpHUBHZcS2YvbTf02EmdyvuolDN+NAdqh62NJXt4VZxvkchAZ1
	3e8kd9xmJaZBtnF
X-Received: by 2002:a17:902:fc45:b0:2dd:c100:80b1 with SMTP id d9443c01a7336-2ddc100811dmr93111495ad.44.1789973091889;
        Sun, 20 Sep 2026 23:44:51 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc180395fsm28097345ad.81.2026.09.20.23.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:44:51 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v6 09/10] ntfs: trigger page_mkwrite for native 4Kn size extension
Date: Mon, 21 Sep 2026 15:44:11 +0900
Message-ID: <20260921-topic-4kn-lkml-v6-9-75069f590b22@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921-topic-4kn-lkml-v6-0-75069f590b22@gmail.com>
References: <20260921-topic-4kn-lkml-v6-0-75069f590b22@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3499; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=XSFkE8mVMpsGAbHslX853y+B//61MCpL5id2RmrrSJc=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsNIMwuec8xw3spo0jaTO4iltcVmp/VcV6QiVv
 ExBZc/DB6uJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarDSDAAKCRA08jD6945I
 04ZxD/4pFo9e+gguZPNc29P3TMxImjS2F6ENWlpS8r0R30DgyGvuuBnH1CPh6JUlZNDoLqDBqmH
 ABzJfqVcHxLGeX0xCbvLw+x1707rTFhJqpXyHM9g4GtbCivPGWTeXzW99IIly2eun/HRV1z15Qi
 q2smKLp1lxpZAdJq8Pz1hRVPYq/RK4FUIL+A7M4Q1zgOLYxJeRxccvD+B0kPGPLZwgq/B5fbGY3
 3GKzOk3a3aChw/9Wr5IATNAt5ZJHcbk3QcVNXkxJO251Iq96WPHT/Ux/NrimI2clR7MH33PK/4r
 /NXwmoh/t6JmesuxoUBA/wfrjLZk6AbqXSQY6okueHJrDhxP5XBpBeIKjlaBE4Daw+/UyUsCIwB
 B9ezVS0EAt/gUtRE2T7d6D7++OxD/S1ybDuI4Ho9QZNMJmXC2SXdxwgZ0hSg4Q1IXlEMxfV5Thc
 OxRkBROr52YLmxcexlBabXQopoC7EAiche9EBukb9D/fv2AMfmCv4flEqvw7lZW8Rc706fjXr/w
 OxHm/F2UyJwAOic4fH0BRQmLhZ5BlOIG805i7oXOtyG64LAyLWFX6cth8NoG/b41x5v69jN7z3z
 ZrSH/ctQ49+58DrLhxBHBw+XJXWFE1PxvCkSNBUqTJ/P/xZeIYxv7M0AgSvM0lKHnKTmWygugQq KDdJE+UnMlp86xA==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

On native 4Kn volumes, pagecache_isize_extended() can leave a writable
mapping for a partial old-EOF page. A subsequent shared mmap write can
then bypass ntfs_filemap_page_mkwrite(), leaving NTFS initialized_size at
the old EOF.

Invalidate the partial old-EOF page after size extension, independent of
the filesystem block size, so the next mmap write enters the NTFS
page_mkwrite path. Apply the same helper to zero-fill fallocate
extensions and compare the actual new size after the operation so
extensions overlapping the old EOF are handled as well.

Fixes: 115380f9a2f9 ("ntfs: update mft operations")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/file.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 99a2c7a5cf81..e290616be07d 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -252,6 +252,22 @@ static int ntfs_file_fsync(struct file *filp, loff_t start, loff_t end,
 	return ret;
 }
 
+static void ntfs_pagecache_extend(struct inode *vi, loff_t from, loff_t to)
+{
+	pagecache_isize_extended(vi, from, to);
+
+	/*
+	 * NTFS initialized_size is byte-granular, so a partial old-EOF page
+	 * must stay write-protected until page_mkwrite() updates it. The
+	 * generic helper skips this when the block size is at least a page,
+	 * the extension ends before the rounded block boundary, or that
+	 * boundary is page-aligned.
+	 */
+	if (from < to && from & (PAGE_SIZE - 1))
+		unmap_mapping_range(vi->i_mapping, round_down(from, PAGE_SIZE),
+				    PAGE_SIZE, 0);
+}
+
 static int ntfs_setattr_size(struct inode *vi, struct iattr *attr)
 {
 	struct ntfs_inode *ni = NTFS_I(vi);
@@ -281,7 +297,7 @@ static int ntfs_setattr_size(struct inode *vi, struct iattr *attr)
 	if (attr->ia_size > old_size) {
 		truncate_pagecache(vi, old_size);
 		i_size_write(vi, attr->ia_size);
-		pagecache_isize_extended(vi, old_size, attr->ia_size);
+		ntfs_pagecache_extend(vi, old_size, attr->ia_size);
 	} else {
 		truncate_setsize(vi, attr->ia_size);
 	}
@@ -1136,7 +1152,7 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 	struct ntfs_inode *ni = NTFS_I(vi);
 	struct ntfs_volume *vol = ni->vol;
 	int err = 0;
-	loff_t old_size;
+	loff_t old_size, new_size;
 
 	if (mode & ~(NTFS_FALLOC_FL_SUPPORTED))
 		return -EOPNOTSUPP;
@@ -1162,13 +1178,12 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 	if (err)
 		return err;
 
-	old_size = i_size_read(vi);
-
 	inode_lock(vi);
 	if (NInoCompressed(ni) || NInoEncrypted(ni) || NInoWofCompressed(ni)) {
 		inode_unlock(vi);
 		return -EOPNOTSUPP;
 	}
+	old_size = i_size_read(vi);
 
 	inode_dio_wait(vi);
 	/* Take invalidate_lock for all fallocate operations to prevent races */
@@ -1197,10 +1212,12 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 
 	err = file_modified(file);
 out:
-	if (!err && mode == 0 && NInoNonResident(ni) &&
-	    offset > old_size) {
-		truncate_pagecache(vi, old_size);
-		pagecache_isize_extended(vi, old_size, offset);
+	if (!err && mode == 0 && NInoNonResident(ni)) {
+		new_size = i_size_read(vi);
+		if (new_size > old_size) {
+			truncate_pagecache(vi, old_size);
+			ntfs_pagecache_extend(vi, old_size, new_size);
+		}
 	}
 
 	filemap_invalidate_unlock(vi->i_mapping);

-- 
2.43.0

