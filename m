Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B3737C103
	for <ntfs@lists.linux.dev>; Thu, 30 Jul 2026 04:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785387436; cv=none; b=CEBUuwwUcQYkEW1JGwg82lstR+yyzvQowh6B5MGbfIVRGZ11PAn962jIgnatpFkph4ByyLI86rTdRrMTsS6NFMUP555ctKbYvM6qjXVQ2I6VLbDH1S97YL6HyUSaJPfFVUSGUKtvC+dsay9PyjxefWk/2FPYbqjWACiYxcj3DPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785387436; c=relaxed/simple;
	bh=9XBvHat/s3s0SOpTqfMbJVgrtlZ8oOBTRDq9UDYzGcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AombPtcqbcwCtTmRUJ4xKzdZEUtPX9DCsehJXPa2acUmHhrfxKHxDAKHKOXoAtRaDkYQYUWmy87CwhNCByyOBjcOP8+vopQnE09L2O6Yqo8FZDra7O17EGmB796db5C+oEAsuPzf6sE+B9GtRGgH+Gs6QGMQmwahwROZQjPgQhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZgcQ6yt; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZgcQ6yt"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso16712955ad.3
        for <ntfs@lists.linux.dev>; Wed, 29 Jul 2026 21:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785387434; x=1785992234; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qURMdIA34CKyjqLkDIq3HnEzln8S+2wLoVCqh/odCh4=;
        b=YZgcQ6ytcArw8oTlFr4HPuTK1j2LQ5K/+XHk4hQ4wLdA0O7ATQlgWUpUhGB8xddSFp
         qyytceeJIAIG/fdjzBtG9LDtIn0CCnRQ0aYiPmekDy92LLWAeJcLJlSpoDJPDk24Zpig
         qNrG7+1gD3K8DNQOxWKInIEWHFgOx/moVI5fXMvFEJRmQ0p1ozKuxJ50GTvjboeVtqvk
         ALa51jlC9zJayoAkMfnJEmTmuc1QiykuC0xEOEGRgQBwDktA1x6daOHr6tkZkewyu2xh
         Jn98jv+mm2+m+yhn0NwxN+JF8eKYdHvJqoj9tnVq/DIttPkOl8UgbhkAsdCMNJfWWZ0s
         1m1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387434; x=1785992234;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qURMdIA34CKyjqLkDIq3HnEzln8S+2wLoVCqh/odCh4=;
        b=PGAV4ocWXwABD8ro474V3l7R1wkAoJ475ZGKWGEm+bIQucYOwMIfHONelUeswz/iVN
         ezJSY6C+UVwK9+8sc2S8dAOkdM0O1HbA1ZBtxFMPMQEqb5jvOL6Bog+i6FuWzndaQOxL
         +Kyn9lvwwf8go1Y1XnUaE70+Svlj8V0owKB72UgKA6GcZshDvpJmwDoJSu2K37XWCgE0
         iSIPkNVAaElE8EXEIhlsWrcatIBbpBQ5xFj0PzLRmvWhvdvWzrkbnPOx18VzKe/chSLe
         cQUpKmXpkFOFHwBCANGkWqaZQ3GYBcJMqqpNPxhS937bHvjsTdQ8xWW+QPZEMjNff1yx
         2UDw==
X-Forwarded-Encrypted: i=1; AHgh+Rob7L9KBLJ/MrilnzcTyVFll6w6oPMQjVNGhkVM4RZgGpOcQs8kr1mYXMaTRks4e2UVq82x@lists.linux.dev
X-Gm-Message-State: AOJu0YzuRF8R4LUSBF+FIA+FAMWTJMP44Mny5yRxOiPyJyGYSTcX3E54
	XzTlC0ddTvUW2+WQzvP1OLX+Bmng9IYhkN37W7jS+fAElE8xQKMoBA/j
X-Gm-Gg: AR+sD13iUTCxYDFFoSmaH0sICp2KRBu/PQYREgxyLlUb3WsrfJVgkdUv46PROZVl6fL
	uV0u88vHDqwu0yNcPk/EoQdzQe4YPJ5SDHm6sjZCTZsN74ca6VzpkJLGy26PZITkuQsF7BDLkd8
	V+fcG7mIAjs4ubVhnjZaRt1tAP9Cr/tFMMlPEqLnstwERLrQkki1VrdNoJyWxq+o59eMMlyZn/A
	h6ThbAP0WJV7W+85i85u2L9gttOXOjrB80y+3l8hRo0XLsUzb3olxbFiKAZVrPVRKfIZGyGUtXt
	+0yBev5bu21Z2IibKe1ygmvhy5Nf1DTp0qqi2GT0yELIoocZzK5C+07IRaWeL4z4Kp/7oI4gWZV
	Vzd1Gwj/aYucVMVrsbrrxaDHyOLUvfamjyVdT3HLU3mIxtIMUXNU3irbM36+UwjnG8aK5ScK+jK
	DsPvKGCcwflKI+cRUYEqcmS4JPyzrWB5Me7TvEX2S3oczCosZYHfqwynsr+/mU4Sk8g3P+q4B0b
	rIa2gO2pAOCZy8cwL/lOPE=
X-Received: by 2002:a17:902:fd87:b0:2ca:b48f:3395 with SMTP id d9443c01a7336-2d035cd397bmr12520485ad.34.1785387434139;
        Wed, 29 Jul 2026 21:57:14 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a46969sm19875325ad.25.2026.07.29.21.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 21:57:13 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Cen Zhang <zzzccc427@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 4/4] ntfs: protect mapping-pairs attr-list updates with attr_list_persist_lock
Date: Thu, 30 Jul 2026 13:56:15 +0900
Message-ID: <20260730-topic-attr-list-lock-v6-v4-4-80d5fe0a6951@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730-topic-attr-list-lock-v6-v4-0-80d5fe0a6951@gmail.com>
References: <20260730-topic-attr-list-lock-v6-v4-0-80d5fe0a6951@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785387323; l=4387; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=9XBvHat/s3s0SOpTqfMbJVgrtlZ8oOBTRDq9UDYzGcA=; b=EzODELIuVIGWadJaRrv4M8qaxLG5TxiKBZRkmKgGUHTNZLNlBHEob8l11zUQmRI7xOGJUXOp1 AYWT8oBlMwdDXtnK2GrK7i+tEWQAae5V4Ii50dZ6LXnNMmT7mQ3FVSa
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
Content-Transfer-Encoding: 8bit

ntfs_attr_update_mapping_pairs() updates several ALEs while rebuilding
a fragmented attribute's mapping pairs and persists the attribute
list once after the loop.  Each ALE update is covered by
attr_list_lock, but the overall publish/persist sequence is not
serialized against concurrent ntfs_attrlist_entry_add()/rm() on the
same base inode.

Acquire attr_list_persist_lock once after resolving base_ni whenever
the call can touch the attribute list, and hold it across every ALE
update and the deferred ntfs_attrlist_update() call.

Reported-by: Cen Zhang <zzzccc427@gmail.com>
Link: https://lore.kernel.org/all/20260702161710.2606853-1-zzzccc427@gmail.com/
Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org
Tested-by: Cen Zhang <zzzccc427@gmail.com>
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/attrib.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 0fdcf6757d02..0ef3b6d61b2f 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -3905,7 +3905,7 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 	struct attr_record *a;
 	s64 stop_vcn;
 	int err = 0, mp_size, cur_max_mp_size, exp_max_mp_size;
-	bool finished_build, attrlist_changed = false;
+	bool finished_build, attrlist_changed = false, attrlist_locked = false;
 	bool first_updated = false;
 	struct super_block *sb;
 	struct runlist_element *start_rl;
@@ -3930,9 +3930,16 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 	else
 		base_ni = ni;
 
+	if (NInoAttrList(base_ni) && ni->type != AT_ATTRIBUTE_LIST) {
+		mutex_lock(&base_ni->attr_list_persist_lock);
+		attrlist_locked = true;
+	}
+
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
 	if (!ctx) {
 		ntfs_error(sb, "%s: Failed to get search context", __func__);
+		if (attrlist_locked)
+			mutex_unlock(&base_ni->attr_list_persist_lock);
 		return -ENOMEM;
 	}
 
@@ -4006,6 +4013,10 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 		err = ntfs_attr_update_meta(a, ni, m, ctx);
 		if (err < 0) {
 			if (err == -EAGAIN) {
+				if (attrlist_locked) {
+					mutex_unlock(&base_ni->attr_list_persist_lock);
+					attrlist_locked = false;
+				}
 				ntfs_attr_put_search_ctx(ctx);
 				goto retry;
 			}
@@ -4042,19 +4053,34 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 			 * attributes and try again.
 			 */
 			if (ni->type == AT_ATTRIBUTE_LIST) {
+				if (WARN_ON_ONCE(attrlist_locked)) {
+					mutex_unlock(&base_ni->attr_list_persist_lock);
+					attrlist_locked = false;
+				}
 				ntfs_attr_put_search_ctx(ctx);
 				if (ntfs_inode_free_space(base_ni, mp_size -
 							cur_max_mp_size)) {
 					ntfs_debug("Attribute list is too big. Defragment the volume\n");
 					return -ENOSPC;
 				}
-				if (ntfs_attrlist_update(base_ni))
+				/*
+				 * This call is only ever reached while
+				 * rebuilding the $ATTRIBUTE_LIST attribute's
+				 * own mapping pairs, which happens underneath
+				 * ntfs_attrlist_update_locked() while holding
+				 * persist lock.
+				 */
+				if (ntfs_attrlist_update_locked(base_ni))
 					return -EIO;
 				goto retry;
 			}
 
 			/* Add attribute list if it isn't present, and retry. */
 			if (!NInoAttrList(base_ni)) {
+				if (WARN_ON_ONCE(attrlist_locked)) {
+					mutex_unlock(&base_ni->attr_list_persist_lock);
+					attrlist_locked = false;
+				}
 				ntfs_attr_put_search_ctx(ctx);
 				if (ntfs_inode_add_attrlist(base_ni)) {
 					ntfs_error(sb, "Can not add attrlist");
@@ -4171,6 +4197,12 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 		if (err)
 			goto put_err_out;
 	}
+	if (attrlist_locked) {
+		mutex_unlock(&base_ni->attr_list_persist_lock);
+		attrlist_locked = false;
+	}
+	if (attrlist_changed && err)
+		goto put_err_out;
 
 	/* Deallocate not used attribute extents and return with success. */
 	if (finished_build) {
@@ -4298,6 +4330,8 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 	return 0;
 
 put_err_out:
+	if (attrlist_locked)
+		mutex_unlock(&base_ni->attr_list_persist_lock);
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 	return err;

-- 
2.43.0

