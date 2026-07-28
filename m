Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF3217A2E8
	for <ntfs@lists.linux.dev>; Tue, 28 Jul 2026 00:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198710; cv=none; b=nJFnBTt/QjWTtCyjyR6Kc00Wbk6mITQvo1EdogAI5CQRLu709cafuGWE+cw2c8qYeoUnZiY9w/9XdBmjn1lq44w9s4wVPc3CJWx62A8pvCmZwemQ/Op5syeuSeO7k14s7Zf4/R3U6N4m2XsV/IM9UakbHKC0CCBPhJ+Smy71yQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198710; c=relaxed/simple;
	bh=+Q+1BeRkhfsZhiSz5zUSW238r3gbT6Xcsv4QSHp9nSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FNsBgD6TfpID81Pl2bXQo5rFgLXNaVel+5KzKFIqz9EoBuh4gWTlWeuWOqnuJ3xKNqetjn7pF1IWUxWwwgBTBJY1+g8IR7NtZpEgj5JA2Mu0zJh4IaCcuVK5snfLC/WMorbKAYCn5ANdpivQhGgIKklEOah3ObTXQSD/fdh+MFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b220nI2i; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b220nI2i"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84e0688b859so2006897b3a.0
        for <ntfs@lists.linux.dev>; Mon, 27 Jul 2026 17:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785198708; x=1785803508; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xFNTOxT4ezFw/LVbKZk4FyM5znd+D7rQoQl5m1eBEgI=;
        b=b220nI2i52JnemQZCV/FPT4HyD7b9jhhV/7uxMVWbiekRei/7/2erdPM96ZEX1ZQgB
         ACOSqPQJPKOJQ+kRN3StGRBiSk5lzjn2daPvKgt00uY0K9gaef1OrVHv24taBBo75g4m
         dVwZIXu4A/1/i0+4MNyNeSOG5DKwUBI+8XDfyMDAOZrxUJIviJ2u5vrZWmpLiKuNO+Sb
         JEdnIGGhDIblWqX29KVvGE3jBR44mhFNlcJ16o0NfOJhenTDwdFCddkQKr6r+wQuy4V+
         w4AGJE7dS+rtdvKKZNzzjCQBEqWiVMXTGJ5uYIaIh6WWflMkeuuakOHDD96/NS6A9aeV
         orSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785198708; x=1785803508;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFNTOxT4ezFw/LVbKZk4FyM5znd+D7rQoQl5m1eBEgI=;
        b=IiJLw0PE4294EFJQFIbUccABbkXpaC50oI2dKRj9aENkzDD2ywjkrdBapiC4HTkMkI
         bTK7lzNwYgihVS1Z/0aCr+K6P0QdmMduVkkCnrAWGtKzXw4iC7FGbIlI8icUblxIViWi
         olOD+4ryGMfuk2ZydA0iC3I3ee8JThp0hSOXgYCYeOdHCe493Mer4Ha7VClk8UyPyxqA
         8REA7JD6ZgL5bejFdr7xzXsX2AAArG8wfltox/wzSTwCO7IJhbDJ5WFskF+fDvMh1Lsx
         OWsX0VcXkSXYsP0BKcLxEqTtsjvR0FVUCzD9DkjIkKdOiC0PGFUYU3t+29eqD+NGTwz4
         A0zA==
X-Forwarded-Encrypted: i=1; AHgh+Roa7pJCGNIwbPlBzNiBA8/UFbTbQTqvtA+UKCC+a841pThWQ2XR1aPEqNqMSE76CFa4QQ/1@lists.linux.dev
X-Gm-Message-State: AOJu0Yy96uCk3/f8aVMW9ZYo3FCrdSOKB2QYRUQwXC0hjjwT3PBGuTbh
	9CKxNTQwSBvFWBK56MNT3X3zJssCgjrKj7uQ3kHbuCrotetd3blKJqXa
X-Gm-Gg: AR+sD110/81/2LJbxBrXDm5L9LqkjOsV/eIGt/m4wtKFCj8pmKdTSByEFLpoXgz1dGo
	CDRK9fuH9SpeFOcO60rgZ13+/zfip7n7Rj8LMFL0xXLjeSBknU0cbyBX2PRORLuSxji5D1ZHo3v
	CGGIdpyOrnJSUHf6Q9t+fFYK0sHk6AsmrB9CxwZagSVfr6iMeQD83q1fqSTqW6FHYutbz6GdvZe
	1IsV8jHIsdM8tIBHB6gj5FJnABIvAKmijV9/UB9u555ZwX/j3HPOvVptKwqFcLqJYraRD+YOVQ8
	cA/obk4dQy7mVwKxv5vUrKsNJ5CdilA0xc+yQd0AP5LMQVmwjxN4HyI8YNSGOXaSRRjyqBUOmgr
	1mR3e2lVHeidM8xJxoZRk8hul0/jPvLDBscX0BJO3waCA+0j5VzYqlTsJkfL6hR7tHQd9qPIDLi
	PUZ7HjKWcFzor0wnYZuED5vAn3jw==
X-Received: by 2002:a05:6a00:1795:b0:847:8e98:9a4b with SMTP id d2e1a72fcca58-84e9325bb83mr149422b3a.34.1785198708015;
        Mon, 27 Jul 2026 17:31:48 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5327f54esm3571094b3a.20.2026.07.27.17.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:31:47 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Cen Zhang <zzzccc427@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] ntfs: protect mapping-pairs attr-list updates with attr_list_persist_lock
Date: Tue, 28 Jul 2026 09:30:51 +0900
Message-ID: <20260728-topic-attr-list-lock-v6-v2-4-270ad764d0a4@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728-topic-attr-list-lock-v6-v2-0-270ad764d0a4@gmail.com>
References: <20260728-topic-attr-list-lock-v6-v2-0-270ad764d0a4@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785198351; l=4062; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=+Q+1BeRkhfsZhiSz5zUSW238r3gbT6Xcsv4QSHp9nSU=; b=8gbBGELXTWuBwuQVY0jcFDa9O4wW56K03MXKtyZCyssX/gbfshdol4G+DHJKhMAS7rVNlvFbd O16pXv6/DGWBpPqp3jFHrnyDBkkGnbPRnrp0Kk5wUw43e3Lqhqs/xcl
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
 fs/ntfs/attrib.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 00ff223d9c21..85736af66bb1 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -3887,7 +3887,7 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 	struct attr_record *a;
 	s64 stop_vcn;
 	int err = 0, mp_size, cur_max_mp_size, exp_max_mp_size;
-	bool finished_build, attrlist_changed = false;
+	bool finished_build, attrlist_changed = false, attrlist_locked = false;
 	bool first_updated = false;
 	struct super_block *sb;
 	struct runlist_element *start_rl;
@@ -3912,9 +3912,16 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
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
 
@@ -3989,6 +3996,10 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
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
@@ -4025,6 +4036,10 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
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
@@ -4038,6 +4053,10 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 
 			/* Add attribute list if it isn't present, and retry. */
 			if (!NInoAttrList(base_ni)) {
+				if (WARN_ON_ONCE(attrlist_locked)) {
+					mutex_unlock(&base_ni->attr_list_persist_lock);
+					attrlist_locked = false;
+				}
 				ntfs_attr_put_search_ctx(ctx);
 				if (ntfs_inode_add_attrlist(base_ni)) {
 					ntfs_error(sb, "Can not add attrlist");
@@ -4151,9 +4170,13 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 
 	if (attrlist_changed) {
 		err = ntfs_attrlist_update(base_ni);
-		if (err)
-			goto put_err_out;
 	}
+	if (attrlist_locked) {
+		mutex_unlock(&base_ni->attr_list_persist_lock);
+		attrlist_locked = false;
+	}
+	if (attrlist_changed && err)
+		goto put_err_out;
 
 	/* Deallocate not used attribute extents and return with success. */
 	if (finished_build) {
@@ -4272,6 +4295,8 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 	return 0;
 
 put_err_out:
+	if (attrlist_locked)
+		mutex_unlock(&base_ni->attr_list_persist_lock);
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 	return err;

-- 
2.43.0

