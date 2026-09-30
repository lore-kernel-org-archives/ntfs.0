Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC12F2F7EFE
	for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 03:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740123; cv=none; b=KyZxKsCf1M0ulslhoTZJCWyWZlXlC0D+Al5baCRod/B5YsMQ0/4j898syhDxLD1X9QA3XxihErVRm19xEDkk0EX23ZU0lUWNpZjbZealOo2+BgZ9Cnn947iirxtOZkHG4yNr8IrCcg3AyWSHgw1AUAot+F2AxODIMij7o1KLhaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740123; c=relaxed/simple;
	bh=H9+3s30juNb/giEz7ochd/E34EnHCmREpDdKjVmyt5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DwUHPTAid63/aEYqJtIjkx++WwkXcd5GDVvvm8f6LX5c4fTkQQF+6Y/dfyRTR7V391yYf1Nm3+X36t4htxVIhgYYLYyhqxE7NMG/92lKe5G4bSamnWh5G/yp2BKFYiDmyAyp+fyXEr5SDzQvO8SGpcXhtYpeiZWDcSTu9OT+mMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2lEIfP8; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2lEIfP8"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f0b25dso31505275ad.2
        for <ntfs@lists.linux.dev>; Tue, 29 Sep 2026 20:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790740121; x=1791344921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhfDMI89uIjDeVVfhi83eTXwgrgv3Y9LBAg7bCLRm98=;
        b=g2lEIfP8rlaMQ5mIzNipxk+uVjc8X9sRDrpAfiD1Qv+MaOh7i5D1oQxIQTKHrsnYlI
         yThSZznwUApjgan8CebEAE6zmJ+hZ0orEgECAHZLkzC5ix6xTMKghn8G2XvUrnASBDVV
         CsG1cp6mCjqgsJNA/rSdzTne/zfhI6o9mKJl9yIWXxioZ4lW+H5I50rd08j0yZZnw8Sp
         k7opfGVxsy7kvNdYZxEyVm4e5vdy2ib55pdH/PQeFFOYYqPvjaIM+n9EgK8ktoCSrIjV
         IZXHHWU8KhCes+r9Bu5Cq9ceSmus1Ater+8bqbJgMF0cqHnCFUxKrycSkzYJBjVAoRtF
         irZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790740121; x=1791344921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hhfDMI89uIjDeVVfhi83eTXwgrgv3Y9LBAg7bCLRm98=;
        b=pkeEOARMX5Y85CX65KOgoVw/9teaVsEE0OMEqJEi6WJjwxb8FUe9kefTJ/cH1ugZiw
         cxS8bH19qhzzfu9X+nalR+5BGXbbgy/xcq/CCiYMBUJV8GIKOORQ3c9rmmh5vXRS/JfP
         mEMJo6qpOE7rWhA354nR86YKQNpAg7MY4fX/qVO8eXqbv2MrWYQ0pec4lUipgc4Ys/I1
         QBe49BiM1r3gD6TTidAZP8JAgckhTXXwOtCmQcZEoeAOx9fvUetGAIq5vHcjrxF9E5f6
         JkQ2LYmSrUh6Vg8OmdXi1T+o2cheD2NkHP9qv89ybfX1A9IE0hdBR9aZmyyKr7RbAf+b
         8FGg==
X-Forwarded-Encrypted: i=1; AKwUvBxU8QZBDCY4JQil1GlXcjSNjhJvj7ecUCPSJxuUE816sTQfH8l775flsZfMzM2egGrBoIby@lists.linux.dev
X-Gm-Message-State: AFq9FYKjD/vsVvxtEFeFascNFFZnvIGWG8FIHNwVOL5yZC1LAn6yL2bC
	S4dG8Z9lo2MdDm9YUJ+ILKViVSSlkr8ajBhBvQ0IKnXnFIyV2/SdyRWQ
X-Gm-Gg: AYBFou2u1yv0ssbRHu+45OVKtXZkbZAx+zTBdWFxy0ivUw+l4o/rX7TNE+6uJQit56g
	tg8pYlFYK5JbYWzc0k9/JMwSO6M2n8OKKyEWPwIj8g0BBFdfw7hv9lmezqCoW5rGHzidQ6vq05k
	rotZ49ygPZXMNU1w8vHN8iYTDlJ3s+mQvJQMDIfUhZfqPtwvtMu1tFqpG/J1Ce7QzkdtkOhFEwF
	81hcQRbXfDePJXc5gT/pJPxeJpL3C9XdXmPk/ud4MHtrgPqN+bpD/KzDXWV9T1UvkqYTsxvJBvn
	TQnvSiDkDizc2J59EOPIdyCSe+VjsrCdpxpLq5J6ktNu1g+pzs2oWrr3um8+QgGQ5jN7Ziv6I7W
	kbEngb5QmKi3iS7k3cHENrxJSO/C5SQVRi3o2tm2RsfhmgmP7XnMaX5J/8vRgSgFC8aIZ4jODPk
	HTFoF/4a+qKyphI0/mPLdJgVPM8v+wgI/YwR6qnCMIz416hKR2iZM8nEz7kVTItYhZj9w5u1HcK
	xvK9aRBwDdyeAEGLcFgyNyuemB+7yf+VayQAL/5KXKKou0rWO/8nkqtSHjJSU2LKLzrjoNHFe6M
	hZHY8ch47zy5zTze619Fmr9vxpLJFIUG7geqFp88RP+HNUMICOGIcnHXLok=
X-Received: by 2002:a17:903:b4b:b0:2d6:ffa1:429b with SMTP id d9443c01a7336-2e2e4907f6amr1727745ad.7.1790740121227;
        Tue, 29 Sep 2026 20:48:41 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2dd86f3ddsm3760005ad.68.2026.09.29.20.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:48:40 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] ntfs: do not map an unmappable runlist fragment as a hole
Date: Wed, 30 Sep 2026 11:48:30 +0800
Message-ID: <7345400f8bb4bbb85c071151b6052129ecd0d3d4.1790684177.git.matthias.goergens@gmail.com>
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

When the extent mft record holding part of a file's runlist cannot be
read, ntfs_attr_vcn_to_rl() ignores the failed ntfs_map_runlist_nolock()
retry and returns with *lcn == LCN_RL_NOT_MAPPED.  The iomap read path
only rejects lcn < LCN_ENOENT, so it maps the range as a hole and read()
returns zeros with no error.  The first read already does this:
ntfs_attr_map_whole_runlist() keeps the fragments it could read,
readahead drops its error, and the next lookup finds the unmapped tail.

On a file whose runlist is split between its base record (vcn 0-214) and
one extent record (vcn 215-1499), breaking only the extent record's FILE
magic makes the kernel log "Failed to map extent mft record", yet read()
returns 1285 clusters of zeros for vcn 215-1499.  A damaged attribute
list entry, which makes the retry fail with -ENOENT, gives the same
zeros.

Return -ENOMEM if the retry ran out of memory and -EIO otherwise.  Both
callers already handle an ERR_PTR; other negative lcns, including
LCN_ENOENT, are returned as before, and so is LCN_RL_NOT_MAPPED at or
beyond allocated_size, where nothing is mapped: the runlist ends there
with LCN_RL_NOT_MAPPED when only the last extent is mapped, as after a
write into it, and with clusters smaller than a page every read of a
file's last folio looks up such vcns.

Reads of vcn 215-1499 now fail with -EIO.  An intact volume exercised
with buffered, mmap and O_DIRECT I/O, fallocate, truncate, sparse and
compressed files behaves as before.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/attrib.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 333b3371acb47..5f5a91265af5e 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -317,7 +317,7 @@ int ntfs_map_runlist(struct ntfs_inode *ni, s64 vcn)
 struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64 *lcn)
 {
 	struct runlist_element *rl = ni->runlist.rl;
-	int err;
+	int err = 0;
 	bool is_retry = false;
 
 	if (!rl) {
@@ -335,12 +335,32 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
 
 	if (*lcn <= LCN_RL_NOT_MAPPED && is_retry == false) {
 		is_retry = true;
-		if (!ntfs_map_runlist_nolock(ni, vcn, NULL)) {
+		err = ntfs_map_runlist_nolock(ni, vcn, NULL);
+		if (!err) {
 			rl = ni->runlist.rl;
 			goto remap_rl;
 		}
 	}
 
+	/*
+	 * The runlist fragment containing @vcn could not be mapped, e.g.
+	 * because the extent mft record holding it is corrupt.  Do not hand
+	 * LCN_RL_NOT_MAPPED back to callers, which would treat it as a hole.
+	 * At or beyond the allocated size nothing is mapped, and the runlist
+	 * ends there with LCN_RL_NOT_MAPPED if only a later extent has been
+	 * mapped, so return that end as it is.
+	 */
+	if (*lcn == LCN_RL_NOT_MAPPED) {
+		unsigned long flags;
+		s64 allocated_size;
+
+		read_lock_irqsave(&ni->size_lock, flags);
+		allocated_size = ni->allocated_size;
+		read_unlock_irqrestore(&ni->size_lock, flags);
+		if ((s64)ntfs_cluster_to_bytes(ni->vol, vcn) < allocated_size)
+			return ERR_PTR(err == -ENOMEM ? -ENOMEM : -EIO);
+	}
+
 	return rl;
 }
 
-- 
2.55.0

