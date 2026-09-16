Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0177DF6C
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 01:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520652; cv=none; b=Bu+6oTDZHSnHf45D+3kcQAsEEmSWw7du0zs8KZ/SPK1g9e7X68LCeM0N6+mATnMWcUugNcnoAh7SeUwml03qPRMBhj4d9n0T/A2cITEA4uZ4aBoc2XC6eTFiCdXwV1HaCrYfipuTE12/FfA/CaDUrnH4RNUCNt6TW3/iaggUaTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520652; c=relaxed/simple;
	bh=mB/EBMg6kiq6v7Dg0fmBPd6Z46drhNpsR5NhnwsFCTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rb0eIm9bfMqTl4RbDKVKVIKslOPxHvVybcWLQctSI0uyFoG7WRVxcqk4g77V6pi/8+HmGsYyufOgul0XxRDr5H2/4S7Jj/jOMJgG4x9lXCzL9+GOdWq6+XhU+ia7xB8x0iRbgenVDffz6dVLdo2JWr9WthzPXM51mriyfZiNj3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5siOMaF; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5siOMaF"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba91so252913a91.1
        for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 18:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520651; x=1790125451; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mblwnipFVZSuGuasA1Nq2GJAf9Ibd6m6JONC1FfkUxc=;
        b=M5siOMaFK/8keupSWnLe+GOOVQ0w6cpHmcR+5jfeEJmGrIOi2XQIf1Yyfau7TMDg/K
         2NUgAsHCzySmVuxgpMAyWk2u3gsQrEjcb9d6OtwCsjZ4B30614zSai2W3rN79ZAahBVY
         xqCUTonaOuTx8xVtiSF8r9FoY3Fek3EtgU8WCNfjehtrSnOOCa8DyLcj1przmmOZH8kc
         9cmSbkk0nEN2AS832vJxHsJTBNyiEUmDvvWyWKpn/3PzvouGMMJSSBwrEhGfhUKym4lb
         UlFdpYD6mpTk0+kyVo43xEAcuvp2f5v8/ty16rwS43M+UM4nKLCzFL3bNOEy7tUYRErb
         GqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520651; x=1790125451;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mblwnipFVZSuGuasA1Nq2GJAf9Ibd6m6JONC1FfkUxc=;
        b=dlHcQT137e+gIp5tTrxXhbgd78t3bThsPYg69ngphjenfIdf+9HkUD3+9YTiMARKM5
         SqHdneKfrD07InDEngIAbRBoLB4hNnVeEOo6hv55WT+7l0pCjx3SHWukU1ACEHis7R+E
         jbhsiInW76zz2MKIs2EbqFDUZZfM+OcBRna1OHkF+sKqFGOEio2IAQgredzoWOji6uRu
         AVgLr/CF6hJTH5i/UNDWpDDVG8QJTCrXdes9O3BR/Hw0atE75DpoXen4BQPr9cYcDzZl
         5CYtFzE0ewgBfxEm9/vi8PAJSWAV54q5Kgdxnu7rEY5mOO+h1lK+9OsfB7hxYGh7PO49
         /ZFQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+IRsjMAfcosmBFaZ1ZYNBawU7iGIMnfUj1zTmHFx5/siOEHTFjC/N8jpqj8LaDyNgKdjm@lists.linux.dev
X-Gm-Message-State: AFuF++kkO+d1xnUeVa5ErK8z+uc4Skkq1PMcTp0KoeUWgUoj2gIz63uA
	pcU2fWNBcVw9pw3Nm1lPnhPXRjuge6nVi/4inBNjBLAD00OtrFVMtm/G
X-Gm-Gg: AYBFou0bxbrBkyKfQFRMlUPIvfysPTg0zLr0zwlgjjoLh2zPuF3e9vIduukHo+wN2FC
	kL0CQKjKr33HKM99nlSijklv7ISOw8w049Ro+/ro1zp5oRWVc29xnHaVBeAZmePONiBkVvYhst8
	zJn9zjNiY3OGyk493H0GK0vaRhQbPhGs9H1v4gg1XlEJVbs0VbWMBJ2fHXms54P5CC1lCMVV3Gn
	PzXkuYsfqK/Q+NEHTbWAThr7d5AiuY6/W36hJSbov/P86gkCpcirL7z0SyL/UcGbT/2r4zP8Lc2
	GtvTphjoHlvMVgg2ruH9BsFqohrV6+75kK/1jHkHhChHKX+Qyx1JueuYivQLHTB2SNFb9HUg2wV
	r3zGs8tqcQBVfm0lfCaRlqus21pxIw9ZrxyXFLjnjYSxQSIU0VTniYEd8diNY7w7QwXoxyPiOnE
	42vZx/FgPa0Mdr2d3Sa/btzGv5u+5uf0oc3W0PMZBlSjAonVQe59O6r1KNyhmLt6s+j2V4NEBfb
	W4YiA==
X-Received: by 2002:a17:90b:2645:b0:398:9be9:ab92 with SMTP id 98e67ed59e1d1-39e1e5777famr1481664a91.23.1789520650979;
        Tue, 15 Sep 2026 18:04:10 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fff3sm2880995ad.8.2026.09.15.18.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:04:10 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 09/10] ntfs: trigger page_mkwrite for native 4Kn size extension
Date: Wed, 16 Sep 2026 10:03:21 +0900
Message-ID: <20260916-topic-4kn-lkml-v4-9-4f8a574ba3fb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
References: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3412; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=mB/EBMg6kiq6v7Dg0fmBPd6Z46drhNpsR5NhnwsFCTM=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqqeq3rflMt/AGPzBZZupap8tpn9RZzCW3F1SK3
 5mrua8IKBKJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqnqtwAKCRA08jD6945I
 087ZD/9Gu1LcAZtq0ZVIWifTddPnmqU+lP7ZZtBuXYBr1FtZYmVTteuC93xzmSVExJkPqpcbyce
 OJJgPrb9a3bq6TXrFj2HLpbdzjK6iLctcprwf37l+uQrITSLR6IZm3Dy5WmqNEApweMypY6f+2H
 43kLaph9dINnaiYXMuQnjsmNlvCVkHIHVGi33kgdMeXO7VMKpH/ZCzm2I0MHhUydS2xker6RB1j
 hvdFw5fnEWxvZmRKpHYuqboH01HxVfyes9I5tjUzxhAJ6ESxYSVgbjwupPpaGQ8sJKie2hy/Luo
 yz5wNYXeJMI/cQEzLMWk3G6R0+PXaono7xPlvu+AdaZRDbxcSOxy6le++9GgkPBrOUgq2XOvPJq
 JsT4br56ekxDskEREYXtuiGcZ4BhBeZrlQGaRNVTlH8koVNl421dON2TMDNl6FXeoPxgU0eAB5U
 KhBJ8CfKG1lZTAgtwQpckkjT/uotHXzHLvwULcF7TxZ8UbMxJ1P9Q4+ARFbcJGb3U764GvAp6gc
 cZhDIw7oGLxSovwJGP0N2h9iZzSxLgbiq9C2pogFko2DfD5UDVE+ssZlcTrjyv30e+0LBps0wpa
 zznFXXubrH+WYpNNOZkSgyf1cREgOM0pVnGLI4657hIPhq83Ut7Iw0iHqMOAZ9yGsdqIwcGT8Mx 8JWu8bAfZD/Uw9Q==
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

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/file.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 007d1614b9ac..7c7cbd16e944 100644
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
@@ -1131,7 +1147,7 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 	struct ntfs_inode *ni = NTFS_I(vi);
 	struct ntfs_volume *vol = ni->vol;
 	int err = 0;
-	loff_t old_size;
+	loff_t old_size, new_size;
 
 	if (mode & ~(NTFS_FALLOC_FL_SUPPORTED))
 		return -EOPNOTSUPP;
@@ -1159,13 +1175,12 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 			return err;
 	}
 
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
@@ -1194,10 +1209,12 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 
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

