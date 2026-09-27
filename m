Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865A1256C87
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 05:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485721; cv=none; b=naFLrwom143FzYEl6W4Rmb2yXBhZRTOT9CgVNIuY+ICFqCI1EbWEsFzPeiSChlvDQhTT8ePCeu4aJaQDkCsTQn6tNkNlLF0LDJ1CI5N+tsV4PtfQMfQj6QM2UDAXevEpH8DGAts88aRvHtsNM6BceE44kNzLEnamh56AvJJDoak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485721; c=relaxed/simple;
	bh=RSKYSQGknATRmanyeSKC/NneJ+yhqYyXKCHd4eWGsSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZsetabxxlCVOcpmkwYj5ec95gewBFChI3xxJ1gQeRpKScY1Un/1hm84NgvsJIw/y8Ty7ECNpxn2qKp5ftl5arOglq1tdnRc7egNcESQulVqVw2v36mtCmViNB2LyzC1GU/y+sdtYZWt1LHGu/oSVuWynY0WN3fQqSCnmFuHAtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8vXuebD; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8vXuebD"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so16095905ad.3
        for <ntfs@lists.linux.dev>; Sat, 26 Sep 2026 22:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790485719; x=1791090519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aI8Z07ulle1p09D0h3AAhP5cTbAm7LaS+3eeebF14pU=;
        b=n8vXuebD+pDdzmgTwc58lMHDbqskUPLu6WahQMt60TDurE/fcx3A1o0ajr/kStY5Mf
         Toi+02/Sh9Dna2jgQVMgdroL2fcQsr4AK6rxt+VWLCHp51djJrF8oa9HdIQfe7YewhVJ
         qgjpOlYmmSnE/3h6sqYTGYuYqzMxVJE7XEsozysQxA0oAZrK6aHx/RQLeW2RLE83lWf0
         Tx2zRrBwGh3kHJHy+f2jQPHzr8OkTfu0v1NNDPzSSKQLMqyUiJllskYJB2dzHBIqqpjC
         aGzM4wkPyJAaxFpKoM0Baakqg9Or9vfjeCmj8105IE/A/Gr5iF1pK8vxICGtuYA3VyhK
         fzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790485719; x=1791090519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aI8Z07ulle1p09D0h3AAhP5cTbAm7LaS+3eeebF14pU=;
        b=TywWAWK+4KgpPbMY3+PGTnT2PQ3ump3mRE1hBUvxXvTQbnAha3er+HLM9YtzUx4glM
         +gsJNmrhMpoNf97MTaycmDKam6J7yJaE+J/Ydp4i3EKn2mo9WXLwgnJ9Nzy/PkToTYhT
         fKuDf57KzPb6fV9ki5nxB88KVKb2G7dmYbx0EGWDt3XRYqs1gyt1gXlsWDxBbktGvR8z
         NuA88rScHRWM5Pkhf8b+2Xj03LbBoyxzJauIh6yOk0/oWYrsp2UvGHBMVq/psK6CcwlQ
         PaHByRyr9kKMRUaJlxCU68z7IK/R20kzCjVHimLYnyhYtQFoZYAQs/5455679vS36s7e
         XA/Q==
X-Gm-Message-State: AFq9FYK2q4VuqfI/pVPZHBjroF/JK190kNd0yMbQFmakzuBsOIeM91iJ
	m9UBiQEKC4VFgcswJogstS4vtLlrSCrnsVoLLSG6fLmHkWlvShwzrY2IMWzmXPvNltmKMA==
X-Gm-Gg: AYBFou3S01MVUz+3bb74eKylyOcI5nzDjNiS1gfpnMEIjA4IiHtMYmo6mzVN6UKWFqg
	dSYuxyYFO8wOOyngK3syVbM9C31l9r5oOwdy4QUcOmyTzeMJhEBq08dUzIKlwrCD8CcbyKtNpZs
	4XW7Ij+rSBYbfigsYxGC4mxeImU1pQxPvH6qCXKaAymHidIw09ndPGHtIDg8zdY72nVCFCZ7UMg
	oMKg/H/jQNhOJzYwi779j2iYQCxn9S+Sg8NuWUi9NOIKnoA9BAc2i1Ryr7hrhd+fzpH1lAWq1YP
	J9i7dA4OFHZ+oD39A+Jk312t6/hFSa9hno7Np3LaZ0uJYTHPSPcGWHS2a2f/LFW8O1dyhzGtvkI
	/4kGqozehqhH7iZiGYmzRL5T846oAtjjNE+6yDLQap86rw4rpZcmaUJs5n1cirQBlXvDw2Y7WXB
	Q9R7sFv7HhLdnXXdp0Ua05iHQ6ckIGmQIlFXVo9JD//C89e2QmH/rPykyJzMKDusTDl/ddZThSs
	hzb4tQ6S6eC1EHBS0YuRtBXuQ4YuqK6g0/Ztg4SXC4SXdVwkikJ7Wr8SBn2exHMuAIWi0NHXzPA
	fVEmKEVeKv1USqhJtHhYooZLxnS465cXvJ5E1U7U/EJqHAslfv4S3PmtnUw=
X-Received: by 2002:a17:902:c408:b0:2dd:c100:a5e5 with SMTP id d9443c01a7336-2df7dd8bb7cmr80809475ad.57.1790485718739;
        Sat, 26 Sep 2026 22:08:38 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm26615495ad.45.2026.09.26.22.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:08:38 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] ntfs: do not map a vcn as a hole when its runlist lookup failed
Date: Sun, 27 Sep 2026 13:08:23 +0800
Message-ID: <20260927050831.2739166-4-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790417653.git.matthias.goergens@gmail.com>
References: <arMoap0ZgeORuktT@hyunchul-PC02> <cover.1790417653.git.matthias.goergens@gmail.com>
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

Fail the lookup whenever the retry leaves @vcn unmapped, -ENOENT
included.  At or beyond allocated_size nothing is mapped, so do not
retry there: the runlist ends with LCN_ENOENT, or with LCN_RL_NOT_MAPPED
when only the last extent is mapped, as after a write into it, and with
clusters smaller than a page every read of a file's last folio looks up
such vcns.

A failed expansion in ntfs_non_resident_attr_expand() or
ntfs_attrlist_repack() truncates the runlist under the runlist lock but
restores allocated_size only after dropping it.  A lookup in between
would now fail, so restore allocated_size under the lock in both.

The crafted file now fails from vcn 16 on with -EIO, and the crafted
volume fails to mount with the check's message.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/attrib.c   | 38 +++++++++++++++++++++++++++++++-------
 fs/ntfs/attrlist.c |  8 ++++++--
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index eab4d8d32132f..30d3d2eb5ef3c 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -344,6 +344,23 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
 		rl++;
 	*lcn = ntfs_rl_vcn_to_lcn(rl, vcn);
 
+	/*
+	 * Nothing is mapped at or beyond the allocated size: the runlist ends
+	 * there with LCN_ENOENT, or with LCN_RL_NOT_MAPPED if only a later
+	 * extent has been mapped.  Return that end as it is.  Below the
+	 * allocated size, an unmapped vcn is worth a retry.
+	 */
+	if (*lcn <= LCN_RL_NOT_MAPPED && !is_retry) {
+		unsigned long flags;
+		s64 allocated_vcn;
+
+		read_lock_irqsave(&ni->size_lock, flags);
+		allocated_vcn = ntfs_bytes_to_cluster(ni->vol, ni->allocated_size);
+		read_unlock_irqrestore(&ni->size_lock, flags);
+		if (vcn >= allocated_vcn)
+			return rl;
+	}
+
 	if (*lcn <= LCN_RL_NOT_MAPPED && is_retry == false) {
 		is_retry = true;
 		err = ntfs_map_runlist_nolock(ni, vcn, NULL);
@@ -354,11 +371,14 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
 	}
 
 	/*
-	 * The runlist fragment containing @vcn could not be mapped, e.g.
-	 * because the extent mft record holding it is corrupt.  Do not hand
-	 * LCN_RL_NOT_MAPPED back to callers, which would treat it as a hole.
+	 * Neither the runlist nor the retry mapped @vcn, which lies below the
+	 * allocated size, e.g. because the extent mft record holding it is
+	 * corrupt or because the mapping pairs end too soon.
+	 * ntfs_map_runlist_nolock() reports the latter as -ENOENT, as @vcn
+	 * lies past the extent it found.  Callers would treat
+	 * LCN_RL_NOT_MAPPED or LCN_ENOENT here as a hole, so fail instead.
 	 */
-	if (*lcn == LCN_RL_NOT_MAPPED)
+	if (*lcn <= LCN_RL_NOT_MAPPED)
 		return ERR_PTR(err == -ENOMEM ? -ENOMEM : -EIO);
 
 	return rl;
@@ -4703,11 +4723,17 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
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
+	if (!err2)
+		ni->allocated_size = org_alloc_size;
 	if (ni != locked_ni)
 		up_write(&ni->runlist.lock);
 	if (err2) {
@@ -4719,8 +4745,6 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
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

