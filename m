Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BB748C40F
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399187; cv=none; b=tUiI3t6VDP7idvvJBX/9HXx2uunZbDxso6Z8Q+/BjGfOjT3y/oga5PfQl4RuqIC3D4wMmPJB0+2q+bcEHZUWmXSWFutTUszBdo+HnI3ugbmiAprSUakA2SZVvT5tcDaAgOt81wpQs+RgE7BzadXxC/64zQ+B4zfmVOMS06yvEHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399187; c=relaxed/simple;
	bh=ON1zzSAwVLL/CJCBbG2cK9yPEoJTcqpY3pneL+WMeSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RHxUNDrkX/WPskekdbmbrBpw4MOEtAUULBuvyE9z297Lwmda3Jn12urJ8BJGG3jzv5/XjccmAg4MlREcRb3pt9TVNj1HDmq8BjKKZuu6wLQpDqqyyP6/lppLmI0mFrebn+aJoyl8t6lkHjh81WHFQ+iV2aSy/CI6BM7gYjFhKsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSbrwOVE; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSbrwOVE"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso1469679a12.3
        for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 08:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399185; x=1790003985; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zAvKl3R/TD1fo4hXl5QLJqtbu+8VKSzNsDSgrmUCk1I=;
        b=mSbrwOVEvKZTPcihosvpPyRl1Zb59TbgxUOwf4vRgmcK86NYIGbd7ph5BvdVWtCdoO
         fas9XhmDjy5IQ56qw2jM6ktD9HydkkLyZw9BtKA4SssiKe/m2A6bTcLYoY5FO8Xilp78
         M2+RvwX7lp7k65TlVP0Wr7oLVmrgxkFO+d2ANmMaBDYuhVU7FQFQ6o3qfID2sn8DwnKn
         eDHBO7CDf23e6lD+Vz8sp2WGnto5+P92ZwHwvuTsq4dbigsZDkcB/15tgED6y1QDKI+6
         q21FXC9KCUUA6JDi895Aj8NqmO06Dlr3pepWmvz0N7MiBY8o4/SPNdqRahSO4/tBXnKO
         lZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399185; x=1790003985;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zAvKl3R/TD1fo4hXl5QLJqtbu+8VKSzNsDSgrmUCk1I=;
        b=c4Bsn+AKnho2u4cHNiIq3PFhp+dnV3bsqzyvSdZnOTI3ecAaCjn+Jff/vX0i/PEGn9
         YQhkYlb8sZ+KnpJUTB0YH7Rw+ch/8mao0EkLQN6bcb8UpYW0lPpwNzaQ6xNgfNMpzI5A
         w8jqXmVa9s3iZ/k1tzI0qR2jJeDoKBH15bU3SF/eDWFZDXVUlZ3j+ZdeuBgAsPdG9puH
         TZEK/gZpF3PkCmsj/B10gEqJ4A7zxcB8SJ1GrH79YJJXL0dBFGyDsYh7u6nkk1W+k0tp
         /xi0wIEe1tUEZ8t35cQmo2cSVWQwjb6FinZsmAhMIkvMhlUK3445/HIRCliHmyTc7AdP
         hxZg==
X-Forwarded-Encrypted: i=1; AKwUvByRVQ9aDWBVyUKLq4gQVPIXJyVmzfYgqZ/mWGEnrpnbFp4HRyH7RndhrLlbEDbaHT5+kc+L@lists.linux.dev
X-Gm-Message-State: AFuF++m70zbbb4VZ0onIS3ZeMPk6PyliztnPrHHg6CjzsTuFTWw9nCn/
	kdvTRu5nqGTRSjx2iD9lOGUtw/ypT8J8CHfnYeO/SIjUXHK8b0dJuGb/
X-Gm-Gg: AYBFou3fCM83T/7lK4FCaTmOgsufcbjl2mnKXBrpIOH7529/ef8Bn0mbteBCUD/fz+L
	8WFcbWGJqEClp7+hm/BdVmcoFwy7K1JGpA27zTRdBjS78DtCV5NXf9JTukVc+12q7gRPl0D3pkS
	D4GOK6YVFm1jkF0OU68RBWYAFxyb7v0pRzZ39vDWekULC06dSp8dmfLo5qhF0+o5oYW/BGC8d9X
	4GhsfkK09cZXr7URcoZ0h+2S/W+VwZDihBETHEAGpCVbAFsPYLvJrFy9As5NBfgs0YwodOiasoM
	hNFDQ2h0cGFoQ0QHINChHuGlSwHZ3/8/EBFVIJPdsajdaL1/jwl/eD3LoSUByZEA/iACR4fYm1A
	GSPYgJb9eFFXfMU9sWo+zWozYqZgK3hwrDPkW4ywkLp3oWrSQ+bmbxVN0aoUnhv2VIoIkFx7ok7
	E07QzRdKqazbkz40zDmia7q41hwUDauSxw845uIXx06XNwRf84D8JIjWauqq6gu3frP56DyBxcj
	cr/4jWhWMOO8hCo+SupOto=
X-Received: by 2002:a05:6a20:43ac:b0:3d3:b02a:7252 with SMTP id adf61e73a8af0-3db4076d90emr6909685637.28.1789399184660;
        Mon, 14 Sep 2026 08:19:44 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c652ab0dsm5188053a12.6.2026.09.14.08.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:19:43 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] ntfs: avoid truncate and writeback deadlock
Date: Tue, 15 Sep 2026 00:19:15 +0900
Message-ID: <20260915-up-generic650-v1-1-d98825ead540@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789398900; l=3361; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=ON1zzSAwVLL/CJCBbG2cK9yPEoJTcqpY3pneL+WMeSk=; b=KMIzYDCrcPBZfspa3APiygGQIHwfKYFPNprb0xhRhGGGKw65ugZhWETcgPHK5HmBP0ti7UW0g Gfdo5zd4ZTpC3346aw/9gSvCsTsIGm0setf6a8qKepRRbiE9J97utO8
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
Content-Transfer-Encoding: 8bit

ntfs_non_resident_attr_shrink() drops page-cache folios after freeing
clusters and truncating the runlist. The VFS truncate path calls it with
mrec_lock held. A folio writeback can need the same lock to resolve its
iomap mapping, so truncate can wait for writeback while writeback waits
for mrec_lock.

A hung-task call stack:

    truncate: mrec_lock -> truncate_inode_pages() -> folio lock/writeback

    writeback: folio lock/writeback -> ntfs_write_iomap_begin() ->
               mrec_lock

ntfs_setattr_size() already calls truncate_setsize() before
ntfs_truncate_vfs() acquires mrec_lock. Reuse that page-cache truncation
in the VFS path and skip the duplicate truncation under mrec_lock. Keep
the cleanup for internal attribute callers, which do not call
truncate_setsize(). This avoids synchronously flushing the whole
discarded tail while preserving page-cache correctness.

Fixes: 4e646ecd4475 ("ntfs: drop stale page-cache when shrinking a non-resident attr")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/attrib.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index c7c09a751c6a..b01cbc9eea4a 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -4234,12 +4234,14 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
  * ntfs_non_resident_attr_shrink - shrink a non-resident, open ntfs attribute
  * @ni:		non-resident ntfs attribute to shrink
  * @newsize:	new size (in bytes) to which to shrink the attribute
+ * @pagecache_truncated: page cache was already truncated to @newsize
  *
  * Reduce the size of a non-resident, open ntfs attribute @na to @newsize bytes.
  */
 static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 					 const s64 newsize,
-					struct ntfs_inode *locked_ni)
+					struct ntfs_inode *locked_ni,
+					bool pagecache_truncated)
 {
 	struct ntfs_volume *vol;
 	struct ntfs_attr_search_ctx *ctx;
@@ -4389,7 +4391,8 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 	 * later writeback map a vcn past the new allocation, which fails with
 	 * -ENOENT and loses the write.
 	 */
-	truncate_inode_pages(VFS_I(ni)->i_mapping, newsize);
+	if (!pagecache_truncated)
+		truncate_inode_pages(VFS_I(ni)->i_mapping, newsize);
 
 	/* Update data size in the index. */
 	if (ni->type == AT_DATA && ni->name == AT_UNNAMED)
@@ -4991,7 +4994,7 @@ int __ntfs_attr_truncate_vfs(struct ntfs_inode *ni, const s64 newsize,
 			up_write(&ni->runlist.lock);
 		} else
 			err = ntfs_non_resident_attr_shrink(
-					ni, newsize, NULL);
+					ni, newsize, NULL, true);
 	} else
 		err = ntfs_resident_attr_resize(ni, newsize, 0,
 						NVolDisableSparse(ni->vol) ?
@@ -5104,7 +5107,7 @@ int ntfs_attr_truncate_i_locked(struct ntfs_inode *ni, const s64 newsize,
 					ni, newsize, 0, holes, locked_ni);
 		else
 			err = ntfs_non_resident_attr_shrink(
-					ni, newsize, locked_ni);
+					ni, newsize, locked_ni, false);
 	} else
 		err = ntfs_resident_attr_resize(ni, newsize, 0, holes);
 	ntfs_debug("Return status %d\n", err);

---
base-commit: 8809c3f29555f9d1e66fe015080a8d4979d91eaa
change-id: 20260915-up-generic650-ad14be567dc3

Best regards,
-- 
Hyunchul Lee <hyc.lee@gmail.com>

