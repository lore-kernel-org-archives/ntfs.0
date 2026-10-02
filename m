Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F4635BDAA
	for <ntfs@lists.linux.dev>; Fri,  2 Oct 2026 04:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915713; cv=none; b=SVbRWPTKnbBPCXuz9iCIoKOV0YpslAn1hPUwmvMjID73eY5pkoCYkYsxHcklHnkdl2J9fh09ARSJXPpoa5Cq3T1PL5MF+jQKihrnarOxeuZYwH7lSyZM/Lt7hvCuf1YcHvrNe2B0qcmjsagsNTuVexG+fVS/7BtvlDhv2q6IvOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915713; c=relaxed/simple;
	bh=WlPCRWwkcwjEqNOHd0YbQEWRzqgfDbuB44g9qpmhju0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltGFqFPFGAQTfP9hFBpZ9brLqkiZqJJGnfyFOWgbIsaZQi0OeS83wsLMuXxDKQpglz14Kk/SXYmI3PZMa73V8VzP4CcLVCZU7i/eeQ/fX2XyTNXCqyOeNSQx2BFeobN+yrrUZvTfj5NZYkLS0TXhl+dyZmdiw6hGnvRG9Itz7AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkEhK+0w; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkEhK+0w"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d31bda43so4752152a91.1
        for <ntfs@lists.linux.dev>; Thu, 01 Oct 2026 21:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915711; x=1791520511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QC4s4f2EoD1bjgIyhN8MKrzd5sNVc2JZ8IkaO7wUKM0=;
        b=gkEhK+0wLcSXBaQRfzSzy3pOADPsYK6V4o2BqC+Z8dr865tR/41wvQMaiye/bhSbfW
         qTllg4opb3gudZjhA1/A6Q/lG893kE0McjTnKYVXEEQgewd1cONiwLUPnrpG+P705ypV
         dYrguEgzwgtSnAI98LtqA+Xg5/lffW2jK4QjDTNkEWT5xE1y7b6Z62JpbhxNNsr/CGhR
         lCHMIJSu3fMI5G48ZDH1mpSHZahqfovcUCF9F3Hwx49lH7AVj/1PLrPExoQSTC5bF3KH
         vQV3fwXgaGhgb0nimKgWoq69VL4N25iuDHfwpPlOYBuqIEfnNXS/P3lxj9ZQBFJ8XKx3
         xY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915711; x=1791520511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QC4s4f2EoD1bjgIyhN8MKrzd5sNVc2JZ8IkaO7wUKM0=;
        b=tkLvovWCOGRlzTXi1pX5Hod2B1WMqodOdrPXDaJeeTQIG+5Dn824QX771Bm4s0CLnz
         U1KFG/JAeAW7piUasAPOQp7MmLN81ZTSIWApsA83BBjAke1Vkbx1g4O0aD9oAkG7VnVG
         HDAOHF0+nBELq4y4+ukPTghB36orgoZNlboQq1YY0QLnmpBQUa3som2d68wsJAfR/LjI
         ZdeoZeQnNeHTfDE5Q/veXIaFY3p3Ul0O+Fb//3HssnEgr6myJlXc5QzOtvVe7Ql/xk2x
         zaWyz1qEqck0zcH4LjvNGkkQTzaZRhfJOqYzxYlDB11NccRQGQiz8SJUyryAi5d7GPTq
         ocTg==
X-Forwarded-Encrypted: i=1; AKwUvBwdbyb9dad3IfCORaiNy0J2xylyz0XATRnm7KEgceR1HoFjrLXxSRQld1UFkCWoWukX2EwG@lists.linux.dev
X-Gm-Message-State: AFq9FYKzsNIWTgbiYImaJOElrI4QAo1tObcp5++KtFRW9y6BCOWP6/Ii
	VnLEn/HvSPZGwU/uPBPK1PthdZAGTdN8a0EFgV+Af6njrzr1NMmeHowx
X-Gm-Gg: AYBFou3qOjnBpZBLf8GpNjxZQ2ugEfqoPoM/G++Vce43GAJK9fEACeR78Br1SxoWbj9
	iUerazzpXJ8MXHu9XvY6kmiJ6Fk4jT6IoTWGTha7TVYz78JXB62n9mepHbkWXvoFLraXPBGHg2w
	Z5nKtzgzDrb4EfJIRxjWRtI3RjaeuBZDbZKCeLrxtOVuwOBbB3XHJ92h6AzJgo/JavHaEF8DLfi
	OG+Jojytu2BlSj+fjITyzysQciASx2GKlTX6NsvaP+UlolTMSqFA4KyDYxgXyxUpFLwX2NNS965
	fqaMvIeTqpeKB2T3mQ/W5ZQYi4v08Ls8HwxLffuz1UZF1G2r0Zq7Qt6W+kR1vlxxJL7wddaKe0d
	cDcII7DeHQTyK5yj+aCInup+oR53y1dHZrfNsmBiNuu+uHBPT3T+oBF45r5NWgLF10yUVUEZa/J
	MkpO2aVPL3pq1U/0jBaFGKPy36bY0lUHXSZmdJrHKvxAtJDh2L5zASCQul3xjIbO3JCs1yrYLTm
	3ep/ggnj0rUdxbAMSIDqcNV4ZSFG4318SyNFt9ndYt9skgb+AGvjNXbP58xRBHgtQqxyg2fAjlu
	/CNMybOr7zwhY4lzbVfwwJpt38MF75dpnM+FYBy6lrEZ3Ab+3SGxQcZVugM=
X-Received: by 2002:a17:90b:2f90:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3a6ce856c2bmr1168160a91.54.1790915710272;
        Thu, 01 Oct 2026 21:35:10 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7370db1sm436432a12.17.2026.10.01.21.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:35:09 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] ntfs: add a runlist merge that leaves the source runlist to the caller
Date: Fri,  2 Oct 2026 12:34:58 +0800
Message-ID: <20261002043459.1695429-3-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261002043459.1695429-1-matthias.goergens@gmail.com>
References: <20261002043459.1695429-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_runlists_merge() frees the source runlist once its runs are in the
destination.  A caller that may have to undo the merge then has to work
out its runs again from the merged runlist, where the first and the
last of them may have been coalesced with neighbouring runs.

Add ntfs_runlists_merge_keep_src(), which neither modifies nor frees
the source runlist.  For that, ntfs_rl_append() and ntfs_rl_replace()
now merge the right-hand end into the copied run in the destination
instead of into the last source run before copying it, and the merge
helpers take the source as const, so the compiler checks that none of
them writes to it.  The merged runlist is the same as before.

For every caller, a source runlist without any mapped run, which the
merge already warns about, now fails with -EINVAL instead of carrying
on with nothing to insert: with no run copied, the right-hand merge
into the destination would index before the insertion point.

The next patch uses ntfs_runlists_merge_keep_src() to free exactly the
clusters it allocated when it has to undo an $MFT data extension.

Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
Cc: stable@vger.kernel.org # needed by the next patch
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
v3: new, for patch 3 (Hyunchul Lee).

I compared the merge code before and after this patch in userspace, on
three million random valid runlists covering all four merge helpers
and the right-hand merges in append and replace: the merged runlists
are identical, and ntfs_runlists_merge_keep_src() leaves the source as
it was.  The harness, with the seed, is in the reproducer linked from
the cover letter.

 fs/ntfs/runlist.c | 98 ++++++++++++++++++++++++++++++++++++++---------
 fs/ntfs/runlist.h |  3 ++
 2 files changed, 82 insertions(+), 19 deletions(-)

diff --git a/fs/ntfs/runlist.c b/fs/ntfs/runlist.c
index f13d28c15887..76ba6ab72b8a 100644
--- a/fs/ntfs/runlist.c
+++ b/fs/ntfs/runlist.c
@@ -47,7 +47,7 @@ static inline void ntfs_rl_mm(struct runlist_element *base, int dst, int src, in
  * @srcbase.
  */
 static inline void ntfs_rl_mc(struct runlist_element *dstbase, int dst,
-		struct runlist_element *srcbase, int src, int size)
+		const struct runlist_element *srcbase, int src, int size)
 {
 	if (likely(size > 0))
 		memcpy(dstbase + dst, srcbase + src, size * sizeof(*dstbase));
@@ -152,8 +152,8 @@ static inline struct runlist_element *ntfs_rl_realloc_nofail(struct runlist_elem
  * Return: true   Success, the runlists can be merged.
  *	   false  Failure, the runlists cannot be merged.
  */
-static inline bool ntfs_are_rl_mergeable(struct runlist_element *dst,
-		struct runlist_element *src)
+static inline bool ntfs_are_rl_mergeable(const struct runlist_element *dst,
+		const struct runlist_element *src)
 {
 	/* We can merge unmapped regions even if they are misaligned. */
 	if ((dst->lcn == LCN_RL_NOT_MAPPED) && (src->lcn == LCN_RL_NOT_MAPPED))
@@ -186,7 +186,8 @@ static inline bool ntfs_are_rl_mergeable(struct runlist_element *dst,
  *
  * It is up to the caller to serialize access to the runlists @dst and @src.
  */
-static inline void __ntfs_rl_merge(struct runlist_element *dst, struct runlist_element *src)
+static inline void __ntfs_rl_merge(struct runlist_element *dst,
+		const struct runlist_element *src)
 {
 	dst->length += src->length;
 }
@@ -214,10 +215,11 @@ static inline void __ntfs_rl_merge(struct runlist_element *dst, struct runlist_e
  * On error, return -errno. Both runlists are left unmodified.
  */
 static inline struct runlist_element *ntfs_rl_append(struct runlist_element *dst,
-		int dsize, struct runlist_element *src, int ssize, int loc,
+		int dsize, const struct runlist_element *src, int ssize, int loc,
 		size_t *new_size)
 {
 	bool right = false;	/* Right end of @src needs merging. */
+	s64 right_length = 0;	/* Length of the run merged at the right. */
 	int marker;		/* End of the inserted runs. */
 
 	/* First, check if the right hand end needs merging. */
@@ -235,9 +237,9 @@ static inline struct runlist_element *ntfs_rl_append(struct runlist_element *dst
 	 * original runlists.
 	 */
 
-	/* First, merge the right hand end, if necessary. */
+	/* Remember the run that the right hand end absorbs, if any. */
 	if (right)
-		__ntfs_rl_merge(src + ssize - 1, dst + loc + 1);
+		right_length = dst[loc + 1].length;
 
 	/* First run after the @src runs that have been inserted. */
 	marker = loc + ssize + 1;
@@ -246,6 +248,9 @@ static inline struct runlist_element *ntfs_rl_append(struct runlist_element *dst
 	ntfs_rl_mm(dst, marker, loc + 1 + right, dsize - (loc + 1 + right));
 	ntfs_rl_mc(dst, loc + 1, src, 0, ssize);
 
+	/* Merge the right hand end into the copy, leaving @src intact. */
+	dst[marker - 1].length += right_length;
+
 	/* Adjust the size of the preceding hole. */
 	dst[loc].length = dst[loc + 1].vcn - dst[loc].vcn;
 
@@ -279,7 +284,7 @@ static inline struct runlist_element *ntfs_rl_append(struct runlist_element *dst
  * On error, return -errno. Both runlists are left unmodified.
  */
 static inline struct runlist_element *ntfs_rl_insert(struct runlist_element *dst,
-		int dsize, struct runlist_element *src, int ssize, int loc,
+		int dsize, const struct runlist_element *src, int ssize, int loc,
 		size_t *new_size)
 {
 	bool left = false;	/* Left end of @src needs merging. */
@@ -374,12 +379,13 @@ static inline struct runlist_element *ntfs_rl_insert(struct runlist_element *dst
  * On error, return -errno. Both runlists are left unmodified.
  */
 static inline struct runlist_element *ntfs_rl_replace(struct runlist_element *dst,
-		int dsize, struct runlist_element *src, int ssize, int loc,
+		int dsize, const struct runlist_element *src, int ssize, int loc,
 		size_t *new_size)
 {
 	int delta;
 	bool left = false;	/* Left end of @src needs merging. */
 	bool right = false;	/* Right end of @src needs merging. */
+	s64 right_length = 0;	/* Length of the run merged at the right. */
 	int tail;		/* Start of tail of @dst. */
 	int marker;		/* End of the inserted runs. */
 
@@ -405,9 +411,12 @@ static inline struct runlist_element *ntfs_rl_replace(struct runlist_element *ds
 	 * original runlists.
 	 */
 
-	/* First, merge the left and right ends, if necessary. */
+	/*
+	 * Remember the run that the right hand end absorbs, if any, then
+	 * merge the left hand end.
+	 */
 	if (right)
-		__ntfs_rl_merge(src + ssize - 1, dst + loc + 1);
+		right_length = dst[loc + 1].length;
 	if (left)
 		__ntfs_rl_merge(dst + loc - 1, src);
 	/*
@@ -432,6 +441,13 @@ static inline struct runlist_element *ntfs_rl_replace(struct runlist_element *ds
 	ntfs_rl_mm(dst, marker, tail, dsize - tail);
 	ntfs_rl_mc(dst, loc, src, left, ssize - left);
 
+	/*
+	 * Merge the right hand end into the last run of @src, now in @dst at
+	 * @marker - 1 (or into @dst[@loc - 1] if that absorbed all of @src),
+	 * leaving @src intact.
+	 */
+	dst[marker - 1].length += right_length;
+
 	/* We may have changed the length of the file, so fix the end marker. */
 	if (dsize - tail > 0 && dst[marker].lcn == LCN_ENOENT)
 		dst[marker].vcn = dst[marker - 1].vcn + dst[marker - 1].length;
@@ -461,7 +477,7 @@ static inline struct runlist_element *ntfs_rl_replace(struct runlist_element *ds
  * On error, return -errno. Both runlists are left unmodified.
  */
 static inline struct runlist_element *ntfs_rl_split(struct runlist_element *dst, int dsize,
-		struct runlist_element *src, int ssize, int loc,
+		const struct runlist_element *src, int ssize, int loc,
 		size_t *new_size)
 {
 	/* Space required: @dst size + @src size + one new hole. */
@@ -488,11 +504,12 @@ static inline struct runlist_element *ntfs_rl_split(struct runlist_element *dst,
 }
 
 /*
- * ntfs_runlists_merge - merge two runlists into one
+ * __ntfs_runlists_merge - merge two runlists into one
  * @d_runlist: destination runlist structure to merge into
  * @srl: source runlist to merge from
  * @s_rl_count: number of elements in @srl (0 to auto-detect)
  * @new_rl_count: on success, set to the new combined runlist size
+ * @keep_srl: leave @srl to the caller instead of deallocating it
  *
  * First we sanity check the two runlists @srl and @drl to make sure that they
  * are sensible and can be merged. The runlist @srl must be either after the
@@ -515,13 +532,14 @@ static inline struct runlist_element *ntfs_rl_split(struct runlist_element *dst,
  * On success, return a pointer to the new, combined, runlist. Note, both
  * runlists @drl and @srl are deallocated before returning so you cannot use
  * the pointers for anything any more. (Strictly speaking the returned runlist
- * may be the same as @dst but this is irrelevant.)
+ * may be the same as @dst but this is irrelevant.)  If @keep_srl is true,
+ * @srl is neither modified nor deallocated, and @drl must not be NULL.
  *
  * On error, return -errno. Both runlists are left unmodified.
  */
-struct runlist_element *ntfs_runlists_merge(struct runlist *d_runlist,
-				     struct runlist_element *srl, size_t s_rl_count,
-				     size_t *new_rl_count)
+static struct runlist_element *__ntfs_runlists_merge(struct runlist *d_runlist,
+		struct runlist_element *srl, size_t s_rl_count,
+		size_t *new_rl_count, bool keep_srl)
 {
 	int di, si;		/* Current index into @[ds]rl. */
 	int sstart;		/* First index with lcn > LCN_RL_NOT_MAPPED. */
@@ -553,6 +571,8 @@ struct runlist_element *ntfs_runlists_merge(struct runlist *d_runlist,
 
 	/* Check for the case where the first mapping is being done now. */
 	if (unlikely(!drl)) {
+		if (WARN_ON(keep_srl))
+			return ERR_PTR(-EINVAL);
 		drl = srl;
 		/* Complete the source runlist if necessary. */
 		if (unlikely(drl[0].vcn)) {
@@ -582,7 +602,8 @@ struct runlist_element *ntfs_runlists_merge(struct runlist *d_runlist,
 		si++;
 
 	/* Can't have an entirely unmapped source runlist. */
-	WARN_ON(!srl[si].length);
+	if (WARN_ON(!srl[si].length))
+		return ERR_PTR(-EINVAL);
 
 	/* Record the starting points. */
 	sstart = si;
@@ -652,7 +673,8 @@ struct runlist_element *ntfs_runlists_merge(struct runlist *d_runlist,
 		ntfs_error(NULL, "Merge failed.");
 		return drl;
 	}
-	kvfree(srl);
+	if (!keep_srl)
+		kvfree(srl);
 	if (marker) {
 		ntfs_debug("Triggering marker code.");
 		for (ds = dend; drl[ds].length; ds++)
@@ -713,6 +735,44 @@ struct runlist_element *ntfs_runlists_merge(struct runlist *d_runlist,
 	return drl;
 }
 
+/*
+ * ntfs_runlists_merge - merge two runlists into one
+ * @d_runlist: destination runlist structure to merge into
+ * @srl: source runlist to merge from, deallocated on success
+ * @s_rl_count: number of elements in @srl (0 to auto-detect)
+ * @new_rl_count: on success, set to the new combined runlist size
+ *
+ * See __ntfs_runlists_merge().
+ */
+struct runlist_element *ntfs_runlists_merge(struct runlist *d_runlist,
+		struct runlist_element *srl, size_t s_rl_count,
+		size_t *new_rl_count)
+{
+	return __ntfs_runlists_merge(d_runlist, srl, s_rl_count, new_rl_count,
+			false);
+}
+
+/*
+ * ntfs_runlists_merge_keep_src - merge two runlists, keeping the source
+ * @d_runlist: destination runlist structure to merge into, not empty
+ * @srl: source runlist to merge from
+ * @s_rl_count: number of elements in @srl (0 to auto-detect)
+ * @new_rl_count: on success, set to the new combined runlist size
+ *
+ * Like ntfs_runlists_merge(), but @srl is neither modified nor deallocated,
+ * on success or on error, and remains the caller's to kvfree().  Even when
+ * runs of @srl are coalesced with runs of @d_runlist, @srl keeps describing
+ * exactly its own runs, e.g. the clusters a caller has to free to undo the
+ * merge.
+ */
+struct runlist_element *ntfs_runlists_merge_keep_src(struct runlist *d_runlist,
+		struct runlist_element *srl, size_t s_rl_count,
+		size_t *new_rl_count)
+{
+	return __ntfs_runlists_merge(d_runlist, srl, s_rl_count, new_rl_count,
+			true);
+}
+
 /*
  * ntfs_mapping_pairs_decompress - convert mapping pairs array to runlist
  * @vol: ntfs volume
diff --git a/fs/ntfs/runlist.h b/fs/ntfs/runlist.h
index cc92e09fbf68..0d4c32b1a338 100644
--- a/fs/ntfs/runlist.h
+++ b/fs/ntfs/runlist.h
@@ -68,6 +68,9 @@ enum {
 struct runlist_element *ntfs_runlists_merge(struct runlist *d_runlist,
 		struct runlist_element *srl, size_t s_rl_count,
 		size_t *new_rl_count);
+struct runlist_element *ntfs_runlists_merge_keep_src(struct runlist *d_runlist,
+		struct runlist_element *srl, size_t s_rl_count,
+		size_t *new_rl_count);
 struct runlist_element *ntfs_mapping_pairs_decompress(const struct ntfs_volume *vol,
 		const struct attr_record *attr, struct runlist *old_runlist,
 		size_t *new_rl_count);
-- 
2.56.0

