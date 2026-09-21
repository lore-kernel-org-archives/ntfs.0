Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E9013B58C
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 00:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950036; cv=none; b=vDXsLFVPYaJAH8MC2WMyUWKgWUKQOFwYRpEfxJ5gqj8HafxFOmWGupDVkxr5Wiik3QfQZ20GKTo8ym1JOfGwQXa91gAvCKq0raOqAXm40aSpz23y9+wl0y4P9Xv7WyWVcS15tUUCUWXhcSrVz+deW7ewg1KqGPrdMXgsa8z8wRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950036; c=relaxed/simple;
	bh=GxCp8Hb1OknEKrDKD50qmwarSlfY9J+K//sgOJXYiI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GhJkKcXnugTRcAWeEf4BtKFQFo9uYHZjJ/bDoF8qpEMY1gpyGUqWYQ/6bx0KSGJXBTt4LrxHu2M1tYPgKWGlJJgFt2qHfFPrTiOZkSSq4+TZNdMavhX7lVDs2zl6xn+PkDaoXa0PsultjUwEm4tXx7kzom9RNZ3dw8i7X1ipQWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIidZ5Dl; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIidZ5Dl"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so2354252b3a.0
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 17:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950034; x=1790554834; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RdY9UmkpXTdTnkOTByQ1fL/5ulyTjRuNDfa8A8mOefU=;
        b=YIidZ5DlwacPxLD7LhR9Nunl3uEL3rpBxzvzWtixmVTCCCDZ0fgf0pk2q7R/3tLDp3
         41RDQ+k/QdUMh3L5L9C/BfGollccS2u0LgDAsUyVkyEKrqcBsVCPMJl6jj4YB4TQy87z
         +Sqc23JTvk0/RMHXvIoWC/R8ZPhJ4a8SqIbEPsdc/GimkJ4ymRFFAiLn/DpCSxU7LVYe
         mVmEdQdtkwQdhGiCMxMq/FKD4Fb3JsU7DG9EeQQkLGCmZ1HU7lKbtXurvKChqQTv3MHh
         nd6TpRL54T5MLI830ynC1tnQ2+Cg/JcbwzhhH5R+O9iv7AXOUTQDhu/lh5IsmSxox20a
         TdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950034; x=1790554834;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdY9UmkpXTdTnkOTByQ1fL/5ulyTjRuNDfa8A8mOefU=;
        b=tcP9105ndvCdKx56L8bYZoD/5qs6heuVjYLfbaZtmqzMsblxS3rGruP36rDdZtzsAJ
         DDeKD+0rm2etkwFT4kWyW+T3ZyY4Nz8q02++mI6E2xVJOcpPXF8Lbp4ZrZuJTDxFZfPt
         3bHkERTp+54EBAG9IFJ2hnxUpsKA0DAGD7zdN49zM9tuJB4MK1vGQFFxJ0yCwYCRiU6O
         VGoFPJ2Qk/izjeDr31K+DETtB1n2wVSuFNkskBB5IJ9C99dxN3CepbDKESsCS93lol6u
         EgEcVrc7S4dICcTmJwItEsOabJNvQfN1hB/TktHXj7sZ0z6fJbUcpzHgWBY1WElgPtXp
         vZ0w==
X-Forwarded-Encrypted: i=1; AKwUvBzcDAqV52hFek+FcNust8Cc/ykfcYT3awHJ6Z8SD7CwBytoyf2mswm+Ad9lVVrSq3etSxqQ@lists.linux.dev
X-Gm-Message-State: AFuF++mThi/pS5D7iYkTpfeRYLuU64Jl30K5FtkZFz2gnyac6QcTXpPa
	3piIqrkvuMrKE5Q49LHIR2UB+nrTPj9FuTRXyQ1Ukk90Oorf+BXcSnWm
X-Gm-Gg: AYBFou2ALgiLN62O+xzLEYMCyVWYY/dxzKh2N4ziXEySC8FekxzMYKad6zu/kvGdDBW
	Cp7X7yO8XOYb2lCxajv/an/yR3aiEUjjkFWvFflFw4XZLIfo604240lcOzasKPKh4lQqP3NsTVx
	E+/L3yDiu88/YWWJLTQIzZogBGp62fp4/glnBIzOirJwMJ/aeZqK2+1+KBMUaTg++iQ7EuiFkH7
	vfBICulbWt6j6DEdA2UZptgAdPRpghKC/yIJXd6k/YFezlgOge41z40ZzpYqHI1K1oS2MCM/Tdd
	5O4XgRV9joov2cAOys4htUYCICQSy59t2dhYsqDmI3/BlVk85xWEpWe5wqylVaGyoKGEfRzzM0H
	Pv1QfLIWmV9q/KVOa7GMrJF3pTiFqPSGpgTA8iD96v4rkqGtYO2O5pvxVo/buPUd+331fbgpewA
	EZgEaSCEJpyecD3rXF0Sb9APcU/G0LgAO5jz70DxrDfWSYYUbjPwhpzIWf8ItTSBkkt6gRIZY+U
	p3Low==
X-Received: by 2002:a05:6a00:4acb:b0:86b:b06a:d3ad with SMTP id d2e1a72fcca58-874de006208mr11505513b3a.23.1789950034150;
        Sun, 20 Sep 2026 17:20:34 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2289557b3a.21.2026.09.20.17.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 17:20:31 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v5 09/10] ntfs: trigger page_mkwrite for native 4Kn size extension
Date: Mon, 21 Sep 2026 09:19:48 +0900
Message-ID: <20260921-topic-4kn-lkml-v5-9-938afe402cd0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
References: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3418; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=GxCp8Hb1OknEKrDKD50qmwarSlfY9J+K//sgOJXYiI0=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsHf15o/9xDLB2a9fDzNrvwNzT0oXmUdiSIAvL
 3tEZ5JcZW2JAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarB39QAKCRA08jD6945I
 0+xCEAC5dH57YYDqE4jKOKENqe7m6BemJQK37C25pJyH086+G8qSoSj53lKCHjj7K8SU2m9n1QX
 QN6RJqq+TtIJROZOgnlQZBInfmRJxlLlymb8AGS7dqXa7SscuEy35QKHgYPbo/6cKdbtqAguYEj
 hSxGa1h+aqKkF9myYtUC2OxCLgcp/wJIUMc7siV/aXLMYgl4qc7VI3+9oBksf+bZiTh93JjCbct
 Oy7qskuv1aJoKJMcRThNML88Z5Kx5j1m3WctZwdVwLUU/4s2K29N/3NNKz7WTBcD9U/962d6AsS
 G5QF5Bc8b3V3z0Ot0XUxHxDdvooLosZmOBzuZV4TRUe/cS7k+Er7/yfKcKc22qvtitXs/mNe7yT
 zUK4FrN3l3oucL9ON8S2Sn4nExjKIJKMhLmGbilGm/AxFRSbakffhrBsIC7ASs4XCISEDVHNJFm
 0ZUWvjm+5QMqGQhtuL7XpPmi4memxLa+pYOUdhcZW1zjVzgJnj32Fkd8Plw4ruXr4u9zEjvCfWM
 sPPQWyzf+VcdDvBnIGl5zCKl5H2YzoWNNTGYd6do8OwoHE8/FPlALZoslYRfa3yMk/PgK32S8xt
 lPOjaeF8wJ1uh+gWknjEc9mIh6NjIaiiSbd3icVuZfjdc/JZYKJISxPXFdD5mkhq/ZW+cm0ByuM /KvqtJ/WonC7lZg==
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

