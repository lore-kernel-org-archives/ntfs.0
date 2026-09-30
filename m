Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF0138AC8E
	for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 03:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740129; cv=none; b=l7MbzZjJlvW4qlyH9irJg3dWQ5eRsX1gTxlIVPinCJQ8KybqvSGDGRYycuxVUXb83Gkxmfo28AhAAIGxqKWq1562TU5j7MXJAgWGKL33hgo4VUAjtdoQrXC10VDojTGTE15G2QId+cL+psXctM2QdLYIWl6rbcdpE0LzQo1jbew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740129; c=relaxed/simple;
	bh=WXdTF+fD0vplsc5LrPoYyM1yVf0SW9QxvIhahUNLN3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JhIshUBcE/IVjkt66toW8cmhfjMMfJGWM9SMgwMOWVxN85MTVbvmC4wD3njlCdtbVgm8Za/faLIftkaIchOZAy7SPbkRYdtg55OcNG8NIghLXDBVuj8kybyjcv4cTZipk32Lk41zuB7Tx/WcL6orF2Bu6KyOS32pSb2iPRPyl5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmJ0J+yU; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmJ0J+yU"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f066d8so13012825ad.1
        for <ntfs@lists.linux.dev>; Tue, 29 Sep 2026 20:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790740127; x=1791344927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PidfjXTJ7qDzdF23Ml9LofOLfuSOGydzUGjn7AOh2F4=;
        b=bmJ0J+yUXj1cZD95DC4ndo/4odfEMJvZnN//5IxA9pqh3ZOZ7Dv+UNSJFxH9uGT2/W
         pVlnK9sMfu5sKOZUPZ32Xx674Ub7dJzmacdb/UVuZnkt9opKyNGGV6gPTsIuxip1/fyT
         vg1ijmm8uoXirT1CU0Jx23ysxR0V+UlzD5ntCjlMRc6jMggv44vu6H0YmLyXd0Iz03Tm
         j8ZIptpDXn2LVGSkyGU+/r1uS9/seYCuy0KvqMoGP0jqc31x/5TaQbG4cuqBjV1DvUrW
         dNWdsYt1e0iw+BJ+0F65woPo3cuP2lMZsKLLBbB8U3td7YJGsi3c+szcomXz/xIaQfNz
         pvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790740127; x=1791344927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PidfjXTJ7qDzdF23Ml9LofOLfuSOGydzUGjn7AOh2F4=;
        b=PLGpGR2MJNO0eSLFpF5LvL6S2LB04p/b2Fg1coUgl3Bxo0Eg3/dYeZHtNaoLJ3KRj9
         5U0rf/e6bPZB7q9MVwoL/1us1sg0/gqQUwS86Q7k3uBHcs0ByrhTB1hhY8/mUJV5IHVX
         21MPnfcnDVH6qwFTgXq8PqfTAxYCHE514Ft4xqbS03zCpE/etLhDNNqMtcrPTHbJVmfb
         uY3V7eHYIETfkCEvbQjixnCfx71jVfjyQMbrmRyzwEDW12knMDPUBWxfJgJQbr+rROP+
         IA95E633q8xngUEHLT0mkkye9u01/5tPBd5NKYf2Ym4cbn3o68knbLPB9u4JeIMTTcRx
         qCuA==
X-Forwarded-Encrypted: i=1; AKwUvBwCxYGLjAGwRz9CBEHnoCiOMnk8YvlsKV089V7bFs/S+x6Y3uj4+8WxVgT6+ZA9n9f2udaN@lists.linux.dev
X-Gm-Message-State: AFq9FYKjBSn4u4OEMIkxmdXLulXs0x2hEyzyoUtIQ7AV2ehHbOOBAnBI
	/pES+A3PxfR/dIiymAQhSSEh/BcICf/caM5u5zyzwrVMmQZ8IHquihlf
X-Gm-Gg: AYBFou1mn0l15JZ6bAzzYJ9whyYeW0mnxsyGEvz3P8no5C9XeAAuDt+alxNt2N/uiZG
	d/wIKaAJzDtliTUH3oxsBU+hSJ7PeFido1LGjzvnrM/8OI25cKd+z6XK1VdTiQ3sJFpyLWYvkDj
	UVm+fgV0j5vQTCyFofSXZ/b3OVriNOnCCuMyRHiVV8+oOvz6DjYbvIUvTagJlmcFsF5uMC7JrRU
	jYLoT59kCLbfISJI6nAhMvzs0L+NLWRm4J1pB7kpwA6tXKKFTR/F6QWgPsr88JGEXPY1trqq4Ve
	gycf+AkZweW4kSKiQm9y352/sRRWS/NRyaC3PC4c4a6ktazu/Fy7ly36LaCplV2WB7rxGt6I5tu
	ItvxtsH9ZkQZf8KN++yy78dyUq4ZJkaz4FjB3mq1OFZesUpKPbbkCegfOwprAP6JrnZ/WFOZ4Nz
	+mOu0kuK9yJ+4/fi2qIgA6DshCtABn4/b6mYWDK4kbTrgRgNokapzUCAelZ6LEbL5xw1DR26ppG
	PRkmK+c6/xpSdfuqyG6OuCzA8VAZceShkqp1TGndY4BdzF04n2liMFOYOsWlba5y/lUWxctMXxL
	cR/DNjrofVmZ40mxo4ZCkE4nS5KaQNB4BzeOyMpwTdhnJ6tVh9elEixASolkOsNxtCZbkKg=
X-Received: by 2002:a17:903:234a:b0:2dd:c100:2521 with SMTP id d9443c01a7336-2e2e4fffa88mr826145ad.42.1790740127130;
        Tue, 29 Sep 2026 20:48:47 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2dd86f3ddsm3760005ad.68.2026.09.29.20.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:48:46 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] ntfs: do not map a vcn as a hole when its runlist lookup failed
Date: Wed, 30 Sep 2026 11:48:33 +0800
Message-ID: <b03cc5e19dba738368567e61491c6e0c268d9b97.1790684177.git.matthias.goergens@gmail.com>
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

ntfs_attr_vcn_to_rl() retries ntfs_map_runlist_nolock() for any lcn up
to LCN_RL_NOT_MAPPED, which includes LCN_ENOENT, but turns a failed
retry into an error only for LCN_RL_NOT_MAPPED.  For LCN_ENOENT the
error is dropped and the read path maps the range as a hole.

An LCN_ENOENT below allocated_size comes from a base extent with a
highest_vcn of 0, which ntfs_mapping_pairs_decompress() takes to map the
whole attribute, so the runlist ends after its last mapping pair.  If
the pairs end early, the retry finds the same extent and fails with
-ENOENT.  On a crafted volume with 4 KiB clusters, a 64-cluster file
whose mapping pairs stop after 16 clusters reads 48 clusters of zeros,
with no error.

The same layout gets a crafted $MFT past the check from "ntfs: fail the
mount when $MFT needs its own extent records".  With 512-byte clusters
and $MFT's mapping pairs ending at vcn 4, an unpatched kernel hangs on
the folio lock reading records 0-3.  With the check alone, the -EIO is
dropped, records 2 and 3 read as zeros and the mount carries on until
check_mft_mirror() finds the zeroed record 2.

Fail the lookup whenever the retry leaves @vcn unmapped below
allocated_size, -ENOENT included.  At or beyond allocated_size the end
of the runlist is still returned as it is.

A failed expansion in ntfs_non_resident_attr_expand() or
ntfs_attrlist_repack() truncates the runlist under the runlist lock but
restores allocated_size only after dropping it.  A lookup in between
would now fail, so restore allocated_size before dropping the lock in
both, under size_lock, which ntfs_attr_vcn_to_rl() takes to read it.

The crafted file now fails from vcn 16 on with -EIO, and the crafted
volume fails to mount with the check's message.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/attrib.c   | 30 ++++++++++++++++++++----------
 fs/ntfs/attrlist.c |  8 ++++++--
 2 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 2e72cd816d04f..5439c12f92808 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -354,14 +354,16 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
 	}
 
 	/*
-	 * The runlist fragment containing @vcn could not be mapped, e.g.
-	 * because the extent mft record holding it is corrupt.  Do not hand
-	 * LCN_RL_NOT_MAPPED back to callers, which would treat it as a hole.
-	 * At or beyond the allocated size nothing is mapped, and the runlist
-	 * ends there with LCN_RL_NOT_MAPPED if only a later extent has been
-	 * mapped, so return that end as it is.
+	 * Neither the runlist nor the retry mapped @vcn, e.g. because the
+	 * extent mft record holding it is corrupt or because the mapping
+	 * pairs end too soon.  ntfs_map_runlist_nolock() reports the latter
+	 * as -ENOENT, as @vcn lies past the extent it found.  Below the
+	 * allocated size, callers would treat LCN_RL_NOT_MAPPED or LCN_ENOENT
+	 * as a hole, so fail instead.  At or beyond it nothing is mapped: the
+	 * runlist ends there with LCN_ENOENT, or with LCN_RL_NOT_MAPPED if
+	 * only a later extent has been mapped, so return that end as it is.
 	 */
-	if (*lcn == LCN_RL_NOT_MAPPED) {
+	if (*lcn <= LCN_RL_NOT_MAPPED) {
 		unsigned long flags;
 		s64 allocated_size;
 
@@ -4484,6 +4486,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	struct ntfs_inode *base_ni;
 	struct super_block *sb = ni->vol->sb;
 	size_t new_rl_count;
+	unsigned long flags;
 
 	ntfs_debug("Inode 0x%llx, attr 0x%x, new size %lld old size %lld\n",
 			(unsigned long long)ni->mft_no, ni->type,
@@ -4714,11 +4717,20 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	if (err2)
 		ntfs_debug("Leaking clusters");
 
-	/* Now, truncate the runlist itself. */
+	/*
+	 * Now, truncate the runlist itself.  Restore allocated_size before
+	 * dropping the lock: ntfs_attr_vcn_to_rl() fails a lookup below the
+	 * allocated size that falls past the end of the runlist.
+	 */
 	if (ni != locked_ni)
 		down_write(&ni->runlist.lock);
 	err2 = ntfs_rl_truncate_nolock(vol, &ni->runlist,
 			ntfs_bytes_to_cluster(vol, org_alloc_size));
+	if (!err2) {
+		write_lock_irqsave(&ni->size_lock, flags);
+		ni->allocated_size = org_alloc_size;
+		write_unlock_irqrestore(&ni->size_lock, flags);
+	}
 	if (ni != locked_ni)
 		up_write(&ni->runlist.lock);
 	if (err2) {
@@ -4730,8 +4742,6 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		ni->runlist.rl = NULL;
 		ntfs_error(sb, "Couldn't truncate runlist. Rollback failed");
 	} else {
-		/* Prepare to mapping pairs update. */
-		ni->allocated_size = org_alloc_size;
 		/* Restore mapping pairs. */
 		if (ni != locked_ni)
 			down_read(&ni->runlist.lock);
diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
index 1bbd2bc62c582..3660e7fd24b13 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -168,14 +168,18 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 	return 0;
 
 restore_old_runlist:
+	/*
+	 * Restore allocated_size before dropping the runlist lock:
+	 * ntfs_attr_vcn_to_rl() fails a lookup below the allocated size that
+	 * falls past the end of the runlist.
+	 */
 	down_write(&attr_ni->runlist.lock);
 	attr_ni->runlist.rl = old_rl;
 	attr_ni->runlist.count = old_rl_count;
-	up_write(&attr_ni->runlist.lock);
-
 	write_lock_irqsave(&attr_ni->size_lock, flags);
 	attr_ni->allocated_size = old_alloc_size;
 	write_unlock_irqrestore(&attr_ni->size_lock, flags);
+	up_write(&attr_ni->runlist.lock);
 
 	restore_err = ntfs_attr_update_mapping_pairs_locked(
 			attr_ni, 0, locked_ni);
-- 
2.55.0

