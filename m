Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A5336F419
	for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 03:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740125; cv=none; b=nXQockqysHaT7jocZqkb03RCEV2VJhuus2uLVaWFJ1FO2011BXn1Ln1dKq6U4UcQwrkuDprQLotLzsqWSkeVwx3LN9eyQ85PJEiY5PpPfB7ViO+6rF0eBsdSpn1to9oZA4pfq1IelSDeeGIWWOCfuz+lSmSkHjbag5X6W2wGKJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740125; c=relaxed/simple;
	bh=6xXPxNSmsFKV2TVA93HTty6D+P8jZ+V6clCDU9AmmVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uel1JJb7PZ2rgkNdw6Cc8H9PhQZnE81gkDtDqzNxXzOHkwhYTLQqlzbCtTyHj1xIL4dev6peHEloqGZdLvn8ZMqxPBZB6DWxdNhwMfgIaoYeZ/Ln6JLXGBdtgWp8ja4/nULs2FG5iHuOdD6FlfCQNxIZdCbHgwEsiTvawUIB8bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pBECDYCF; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pBECDYCF"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2dfaf76605dso14169445ad.0
        for <ntfs@lists.linux.dev>; Tue, 29 Sep 2026 20:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790740123; x=1791344923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFhbuoDvUhhT0NM7dVUo0Ay1NU3i0WuHFz8vsUDnISE=;
        b=pBECDYCFDzeQZs/81HnGglIlYoccOoR6WrwRyozbOnGvQ9Fw89dVGOJ1DU4i/l7XLO
         VLATfL9HvsXRzmpqMzadYLr302plyNAFwz+WQ3XR1/2WV5UKGzCs+vXJV2hcmO/d255L
         EVqFB6gz1OIIpM2UCLiSfmDOHwDgEfxeXv/w0hhFA9pdTF4YtFNk+XhZAK5tJ99Y7ITq
         JFLEiJbb/oSZ8sSoIYC2QZzW+Ps7sT74ZtilGF/SI6B152Bxx0WQ/39NWq5N3holuALp
         UoQJxoHKWNhJ9cJyjaa6ESKht5xsG16MNwzFSyxpHVpetMEz1vNke/TVHRx7icUzdzHD
         wdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790740123; x=1791344923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFhbuoDvUhhT0NM7dVUo0Ay1NU3i0WuHFz8vsUDnISE=;
        b=WOzq3r3iUp4pDTA0g+ytzsQ6fNNEJqcf3nT5ZO0Yrn1F9zJqFESHD7mKcXZOfPeq/i
         z5QAiF5He6SC4XUOJBQsSJDXP5ZGmtpHrIsesv8KG9LEKzcDu9N44L6IWWDiSFeOnsUA
         7iTUwdyuWlyjH1ZLSzk1680I697g4X3KnkMVgM8OLKKx0Bx101/VP8d9D+myiY54KPx/
         vISS7meHeMBKdYad8+PIcDPzUomyTqniTYSc8gOkd8sRlST1OBwkggYwWopZx44Vtut7
         Ebb1KUSPGF+deaQVrrvll5I+Pzp6Pd4etBHXJXvwd1mm4JSBdu0UdHX5CGWNpz+bwg5s
         66yQ==
X-Forwarded-Encrypted: i=1; AKwUvBycjaZTOMX5OPZJzBYBPQ68PPf/7+8JUlTnrdU91mLaJ3sQNifFazqM8hQPHlkxOcmtfMFI@lists.linux.dev
X-Gm-Message-State: AFq9FYIc++0VypsJi+Rvax1JI/4t72CSBG2Vt9jFRXYEfRBN3tpv45OS
	OisLxz2+VoHylvMbibxX0lhE6DLslVfwB6hJNMoTnLmTgFbpq9wGKiBh
X-Gm-Gg: AYBFou0CuAtMUC5x7rTCgdw7Vp/WKIBUumhJnPWAEHsriQxZt41pT66f6VYhUx+CXK7
	Zb3r5wlveTj1p9qz23OF1/FTp8IUtZoQE1++O0Mms9iaPl2AhpVGxiivrvbvIyEne2OdMAtqVS7
	rR4qONBG8oE8vHssojYs06J2Q24bQsCD37DW0BT4/glOhc04Y2cEKHVlexKMSmZfEpdJnfd+EyS
	mLoKCQ1ZjvhbLaJgBFx4PyjrnKV3l+gpy1lZQEll1+v25VWrJeaFSZdPURUAv5THWtYztjUoY3P
	gd/EkV3Wxq6+ZSWM1CNtA3KNGNlSaFeBJxkSiESHOPsYRTe80e8CdfYWHliLG+on1G0AzWyuZfC
	fUpYLhiiCBgqgxh0kTLDDtE0MCCDpSwquDe2kqjFLLP9/4cjrocxG3iPRRfQZDcfHgy/yWEcCMO
	QDDpbaFMzKV/Q6YYg7jF7UzAK6GyCaRjE5JkRGum8Rgsntz5xDZC1L0/ShUVNTtx8NIJ3m7yQP6
	YpkNFU/fCv2FCwFS6eE8/HFdxX84UrQ7S/Atqbu42/7R2NefLas236oOD7XHg9ZnQTl/L/TYurR
	bV0FSWbNRLIoIfGIrNZu+Y7cxN50UH16BOr5z5nVHEDHUOaEgg3qyLmQgtU=
X-Received: by 2002:a17:903:94d:b0:2e2:c69a:bd7b with SMTP id d9443c01a7336-2e2e4b5a1aemr1470685ad.13.1790740123163;
        Tue, 29 Sep 2026 20:48:43 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2dd86f3ddsm3760005ad.68.2026.09.29.20.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:48:42 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] ntfs: do not turn an unmappable runlist fragment into delalloc on write
Date: Wed, 30 Sep 2026 11:48:31 +0800
Message-ID: <1360d1ada75cddf19f05e0bab437f4f216fc30f7.1790684177.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790684177.git.matthias.goergens@gmail.com>
References: <cover.1790684177.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_write_simple_iomap_begin_non_resident() has the same unchecked
retry.  LCN_RL_NOT_MAPPED passes its "lcn <= LCN_HOLE" test, so a
buffered write into a range whose extent record cannot be read is
merged into the runlist as LCN_DELALLOC over clusters that are already
allocated on disk, and write() succeeds.  If the record stays
unreadable, writeback fails too and the data never reaches the disk;
the error only shows up at a later fsync() or a synchronous write.

On the volume from the previous patch, after a read of the file, an
8 KiB pwrite() at vcn 1000 returns 8192, fsync() returns -EIO, and
after remount the range is unchanged.

Fail the lookup here too, with -ENOMEM or -EIO.  That pwrite() now
fails with -EIO.  Writes whose range can be mapped are unaffected.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/iomap.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/iomap.c b/fs/ntfs/iomap.c
index c812d7f19b360..b4475963e57a7 100644
--- a/fs/ntfs/iomap.c
+++ b/fs/ntfs/iomap.c
@@ -394,7 +394,7 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 	loff_t vcn_ofs, rl_length;
 	struct runlist_element *rl, *rlc;
 	bool is_retry = false;
-	int err = 0;
+	int err = 0, map_err = 0;
 	s64 vcn, lcn;
 	s64 max_clu_count =
 		ntfs_bytes_to_cluster(vol, round_up(length, vol->cluster_size));
@@ -429,12 +429,24 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 
 	if (lcn <= LCN_RL_NOT_MAPPED && is_retry == false) {
 		is_retry = true;
-		if (!ntfs_map_runlist_nolock(ni, vcn, NULL)) {
+		map_err = ntfs_map_runlist_nolock(ni, vcn, NULL);
+		if (!map_err) {
 			rl = ni->runlist.rl;
 			goto remap_rl;
 		}
 	}
 
+	/*
+	 * As in ntfs_attr_vcn_to_rl(): a runlist fragment that could not be
+	 * mapped is not a hole.  Treating it as one would put a delalloc
+	 * extent over clusters that are allocated on disk but unknown to us.
+	 */
+	if (lcn == LCN_RL_NOT_MAPPED) {
+		up_write(&ni->runlist.lock);
+		mutex_unlock(&ni->mrec_lock);
+		return map_err == -ENOMEM ? -ENOMEM : -EIO;
+	}
+
 	max_clu_count = min(max_clu_count, rl->length - (vcn - rl->vcn));
 	if (max_clu_count == 0) {
 		ntfs_error(inode->i_sb,
-- 
2.55.0

