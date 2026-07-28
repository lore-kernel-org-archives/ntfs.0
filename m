Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0971041DDE2
	for <ntfs@lists.linux.dev>; Tue, 28 Jul 2026 23:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785281952; cv=none; b=rzcyMvZolbTrqfyK4QNAJWRsTP5i/sUyrDtLXpMDhSvc3rrl7CozAXuQ0xVOJkhq7J89RRbnZW55/tKy98bTw78Fxxz081kvVKdTbdnPbTDqs3b/Eo4YcbRscqbaY3zZ2YyaYUa1VjzdLlPG0tMVrQz7eclnSa0RcW+sTNX5iJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785281952; c=relaxed/simple;
	bh=sNWf8iBjosV0cXu2kA0N4QHydF0OyM3/rlPmIpS7y/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gvoXXlWJm50sCJpZO8tSstXcLv3O89uF6UvJTxy2y1o8QFwLAKJ0LSH8Y7YSlumZg8YQrLcFeies4boKWRT7eeB1CMGyZqm6XH5gBXMETCIfh5uwPbRLaGW0EP19LbTkXqWfHJtDuld9ZLoqpcnwg/4AoYUUaHl3jHyKM9hozOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5sP5Za4; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5sP5Za4"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so308965b3a.3
        for <ntfs@lists.linux.dev>; Tue, 28 Jul 2026 16:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785281948; x=1785886748; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6+ZpZqxWAFi8f5gAOZ2q3Q6RAdJzdouU2X3Ga3EgR4I=;
        b=C5sP5Za48nA/dJbGSvWGXkNaRE/LVYEuivbPVcf3qF3amw9gJaTMbB0Nca76CGTQ/6
         V9f6L2MGjsTXrZnF7cUfDB0AYgH7q29u7gvCKOLqnzKmeI2aKSBD+F8uFoAS5li6pOJe
         H72lMtR3d7+8nG7orMlP4QB5BSpx1Vs75kGItqr9IiHLbd8JiBQOYhEahelkWd4D94vB
         qUqP4lkWHemRBLbKUA8Pdq85HuOdxzsIN2fKnZ7Qyl/HRJrF90kEQBrFiGoJnUqmp5IY
         legsPcSPPqLBNG0xkt+cON1X9hUWZF4cajP3R3GiUNV1f+6oQHJE96xYghbMbfjyBxk4
         OSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785281948; x=1785886748;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+ZpZqxWAFi8f5gAOZ2q3Q6RAdJzdouU2X3Ga3EgR4I=;
        b=eFVLy1SVvJn8uf8ldDACyKfFqhleXpkTe+t4NLhPjtjPR1J0PlFJAdc/vFB1aCGxpQ
         HrLGxrMlAETL0T/FFnCLQsgpcWB8F6z8uUZWMLHgdqZgwZUc+0gOeOoKFjFsi4QhXAr7
         jXrQn+ypqMVFc2WCX5hD6GVnAbTcfnGRtXUT3PG8fcnVYy3iUfGwV8h/gq3fxCFzcrch
         dzAqwsYE+jjcfNu0h8u/OaauEwrPA1a99Df2fWAZExDvsFpxCKvXKVifGaQiXGab5b9T
         VhsLKo8t2ga1wwdyvOCfjtkDYiC7qRb87wMm2RxOZ30znec3qQUUUqsMTXrHFaOKFAIO
         pt0w==
X-Forwarded-Encrypted: i=1; AHgh+RoswZSCvRnoDI01OeY/PNPd3GGuozFn83Lf1AOzZv5uWvYv1UxZx5Gb6nlcxL7ejkiwyljy@lists.linux.dev
X-Gm-Message-State: AOJu0YxMbZNP+gM+uCUUoy5B3mxgDTTMC7fcjXFS4ZOAPMgljZT5G5NE
	og9eXWcJSSc0aT691bnMgg1c26x8SIH/G8g+HOrxzZ3tN8JXODdsP49+P9RPfg==
X-Gm-Gg: AR+sD11xLDUgz5ZLxww6guEiJnDrUXrv16KJJri2PUULEuIVaXI6VL6QBpqpBebCeNJ
	OPKyuEEHbxsKQdzWZpkPBVITmkkdJFFkcsjdpdI+yI+7r9rLJlTD9JvriwOJKob0xTiFKYNwOL7
	7wj1QYd4yvbErj5Q87LPEFbPXOkuVcUuwKGSJ2YymlY+S8ua6VPGaAxPAZ6pepw2Ze0H2wTYBRn
	XLHatVhtX/PpLG3gVh4CY5/Z0Od3PDDLba8mvlhMavjBU6ULBvixZ5yj8yN4Br/dW6c1GPyr6FK
	KDIGr492Cu7211HbeRq0N0j0KYenxnY0Mmk1Wf9ZyqCkaoqKe0uhpXjdVVLwnV06tP9UFR8ReW+
	RItSWUJrZIn4HScirqVPawS+JLAgdTspxL67sgTmBZ8vinfYyDdvUh5LfnNnP2/MRVNBTsOkjaJ
	2uGwqRKyTyCmgV4UOYiBbdVYrLz14lsVIp8bHaLw1MBoTH3wy0F++5MPtDLpTwqgesm6Obn8Dxv
	HjoyPHqcsKb06e+r/rGauQ=
X-Received: by 2002:a05:6a00:13a3:b0:848:2f74:1d66 with SMTP id d2e1a72fcca58-84e9330f06fmr4671630b3a.76.1785281947609;
        Tue, 28 Jul 2026 16:39:07 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0300ac2sm496896b3a.35.2026.07.28.16.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 16:39:07 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Cen Zhang <zzzccc427@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 3/4] ntfs: protect attribute-list creation/teardown with attr_list_persist_lock
Date: Wed, 29 Jul 2026 08:38:31 +0900
Message-ID: <20260729-topic-attr-list-lock-v6-v3-3-7f690b9b98ad@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729-topic-attr-list-lock-v6-v3-0-7f690b9b98ad@gmail.com>
References: <20260729-topic-attr-list-lock-v6-v3-0-7f690b9b98ad@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785281796; l=9392; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=sNWf8iBjosV0cXu2kA0N4QHydF0OyM3/rlPmIpS7y/A=; b=1LldeajD3eQZfhZHP79IqCHvBxjdxW4Fe2QuHY4GBtg3D93ggRQmZJ5Mq6yVEWlGt8yFHB1gx mUIJ9vjwfoOCJeRB3FUbW183tGWBDXBBX0r6+yTBkTztLB9AqkylujM
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
Content-Transfer-Encoding: 8bit

ntfs_attr_record_rm() and ntfs_inode_add_attrlist() update the
in-memory attribute list without any lock, so a concurrent reader can
observe an inconsistent trio. Teardown can also free a buffer that a
concurrent ntfs_attrlist_entry_add()/rm() transaction still owns while
it sleeps in ntfs_attrlist_update().

Protect both functions with attr_list_persist_lock for their whole
publish/persist or teardown sequence, and with attr_list_lock (write)
around the actual buffer pointer/size/gen updates.

Reported-by: Cen Zhang <zzzccc427@gmail.com>
Link: https://lore.kernel.org/all/20260702161710.2606853-1-zzzccc427@gmail.com/
Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org
Tested-by: Cen Zhang <zzzccc427@gmail.com>
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/attrib.c | 47 +++++++++++++++++++++++++++++++++++++++++------
 fs/ntfs/attrib.h |  2 +-
 fs/ntfs/inode.c  | 36 ++++++++++++++++++++++++++++++++++--
 fs/ntfs/namei.c  |  2 +-
 fs/ntfs/super.c  |  2 +-
 5 files changed, 78 insertions(+), 11 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index b99468dd0bba..b16c95d3ea97 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -2771,12 +2771,15 @@ static int ntfs_non_resident_attr_record_add(struct ntfs_inode *ni, __le32 type,
 
 /*
  * ntfs_attr_record_rm - remove attribute extent
- * @ctx:	search context describing the attribute which should be removed
+ * @ctx:		search context describing the attribute which should be removed
+ * @persist_locked:	true if the caller already holds
+ *			base_ni->attr_list_persist_lock for the in-flight
+ *			transaction this removal is part of
  *
  * If this function succeed, user should reinit search context if he/she wants
  * use it anymore.
  */
-int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
+int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx, bool persist_locked)
 {
 	struct ntfs_inode *base_ni, *ni;
 	__le32 type;
@@ -2816,10 +2819,33 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 
 	/* Post $ATTRIBUTE_LIST delete setup. */
 	if (type == AT_ATTRIBUTE_LIST) {
+		/*
+		 * attr_list_persist_lock serializes this in-memory attr_list
+		 * teardown against a concurrent ntfs_attrlist_entry_add()/rm()
+		 * transaction on the same inode.
+		 *
+		 * @persist_locked is true when we got here from
+		 * ntfs_attr_update_mapping_pairs() rebuilding the mapping
+		 * pairs of the $ATTRIBUTE_LIST attribute itself: that call
+		 * only happens underneath ntfs_attrlist_update(), which is
+		 * always invoked by ntfs_attrlist_entry_add()/rm() or
+		 * ntfs_inode_add_attrlist() while already holding this same
+		 * mutex. Taking it again here would deadlock the caller
+		 * against itself, so skip the (re-)acquisition in that case
+		 * and rely on the lock already held further up the stack.
+		 */
+		if (!persist_locked)
+			mutex_lock(&base_ni->attr_list_persist_lock);
+		down_write(&base_ni->attr_list_lock);
 		if (NInoAttrList(base_ni) && base_ni->attr_list)
 			kvfree(base_ni->attr_list);
 		base_ni->attr_list = NULL;
+		base_ni->attr_list_size = 0;
+		base_ni->attr_list_gen++;
 		NInoClearAttrList(base_ni);
+		up_write(&base_ni->attr_list_lock);
+		if (!persist_locked)
+			mutex_unlock(&base_ni->attr_list_persist_lock);
 	}
 
 	/* Free MFT record, if it doesn't contain attributes. */
@@ -2866,7 +2892,7 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 			kvfree(al_rl);
 		}
 		/* Remove attribute record itself. */
-		if (ntfs_attr_record_rm(ctx)) {
+		if (ntfs_attr_record_rm(ctx, false)) {
 			ntfs_debug("Couldn't remove attribute list. Succeed anyway.\n");
 			return 0;
 		}
@@ -4155,8 +4181,17 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 			if (le64_to_cpu(ctx->attr->data.non_resident.highest_vcn) !=
 					NTFS_VCN_DELETE_MARK)
 				continue;
-			/* Remove unused attribute record. */
-			err = ntfs_attr_record_rm(ctx);
+			/*
+			 * Remove unused attribute record. When @ni is the
+			 * $ATTRIBUTE_LIST attribute itself, we only get here
+			 * underneath ntfs_attrlist_update(), whose caller
+			 * (ntfs_attrlist_entry_add()/rm() or
+			 * ntfs_inode_add_attrlist()) already holds
+			 * base_ni->attr_list_persist_lock for this
+			 * transaction, so tell ntfs_attr_record_rm() not to
+			 * recurse into it.
+			 */
+			err = ntfs_attr_record_rm(ctx, ni->type == AT_ATTRIBUTE_LIST);
 			if (err) {
 				ntfs_error(sb, "Could not remove unused attr");
 				goto put_err_out;
@@ -5406,7 +5441,7 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 	}
 	while (!(err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 				CASE_SENSITIVE, 0, NULL, 0, ctx))) {
-		err = ntfs_attr_record_rm(ctx);
+		err = ntfs_attr_record_rm(ctx, false);
 		if (err) {
 			ntfs_error(sb,
 				"Failed to remove attribute extent. Leaving inconstant metadata.\n");
diff --git a/fs/ntfs/attrib.h b/fs/ntfs/attrib.h
index 2e5f87abd852..ec0c846febf1 100644
--- a/fs/ntfs/attrib.h
+++ b/fs/ntfs/attrib.h
@@ -161,7 +161,7 @@ int ntfs_attr_exist(struct ntfs_inode *ni, const __le32 type, __le16 *name,
 		u32 name_len);
 int ntfs_attr_remove(struct ntfs_inode *ni, const __le32 type, __le16 *name,
 		u32 name_len);
-int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx);
+int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx, bool persist_locked);
 int ntfs_attr_record_move_to(struct ntfs_attr_search_ctx *ctx, struct ntfs_inode *ni);
 int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
 		__le16 *name, u8 name_len, u8 *val, s64 size);
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index c568ddf851f4..3d69a8b68f21 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3049,6 +3049,7 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 	struct attr_list_entry *ale = NULL;
 	struct mft_record *ni_mrec;
 	u32 attr_al_len;
+	bool attrlist_locked = false;
 
 	if (!ni)
 		return -EINVAL;
@@ -3124,9 +3125,14 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 	}
 
 	/* Set in-memory attribute list. */
+	mutex_lock(&ni->attr_list_persist_lock);
+	attrlist_locked = true;
+	down_write(&ni->attr_list_lock);
 	ni->attr_list = al;
 	ni->attr_list_size = al_len;
+	ni->attr_list_gen++;
 	NInoSetAttrList(ni);
+	up_write(&ni->attr_list_lock);
 
 	attr_al_len = offsetof(struct attr_record, data.resident.reserved) + 1 +
 		((al_len + 7) & ~7);
@@ -3153,28 +3159,45 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 	if (err < 0)
 		goto remove_attrlist_record;
 
+	mutex_unlock(&ni->attr_list_persist_lock);
+	attrlist_locked = false;
 	ntfs_attr_put_search_ctx(ctx);
 	unmap_mft_record(ni);
 	return 0;
 
 remove_attrlist_record:
-	/* Prevent ntfs_attr_recorm_rm from freeing attribute list. */
+	down_write(&ni->attr_list_lock);
 	ni->attr_list = NULL;
+	ni->attr_list_gen++;
 	NInoClearAttrList(ni);
+	up_write(&ni->attr_list_lock);
+	mutex_unlock(&ni->attr_list_persist_lock);
+	attrlist_locked = false;
+
 	/* Remove $ATTRIBUTE_LIST record. */
 	ntfs_attr_reinit_search_ctx(ctx);
 	if (!ntfs_attr_lookup(AT_ATTRIBUTE_LIST, NULL, 0,
 				CASE_SENSITIVE, 0, NULL, 0, ctx)) {
-		if (ntfs_attr_record_rm(ctx))
+		if (ntfs_attr_record_rm(ctx, false))
 			ntfs_error(ni->vol->sb, "Rollback failed to remove attrlist");
 	} else {
 		ntfs_error(ni->vol->sb, "Rollback failed to find attrlist");
 	}
 
+	/*
+	 * Without this lock, a concurrent ntfs_attrlist_entry_add()/rm()
+	 * could replace or free @al out from under this loop.
+	 */
+	mutex_lock(&ni->attr_list_persist_lock);
+	attrlist_locked = true;
+
 	/* Setup back in-memory runlist. */
+	down_write(&ni->attr_list_lock);
 	ni->attr_list = al;
 	ni->attr_list_size = al_len;
+	ni->attr_list_gen++;
 	NInoSetAttrList(ni);
+	up_write(&ni->attr_list_lock);
 rollback:
 	/*
 	 * Scan attribute list for attributes that placed not in the base MFT
@@ -3201,10 +3224,19 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
 	}
 
 	/* Remove in-memory attribute list. */
+	down_write(&ni->attr_list_lock);
 	ni->attr_list = NULL;
 	ni->attr_list_size = 0;
+	ni->attr_list_gen++;
 	NInoClearAttrList(ni);
 	NInoClearAttrListDirty(ni);
+	up_write(&ni->attr_list_lock);
+
+	if (attrlist_locked) {
+		mutex_unlock(&ni->attr_list_persist_lock);
+		attrlist_locked = false;
+	}
+
 put_err_out:
 	ntfs_attr_put_search_ctx(ctx);
 err_out:
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 5ff25e9aaa32..9c85caa00a0c 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -941,7 +941,7 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 	if (err)
 		goto err_out;
 
-	err = ntfs_attr_record_rm(actx);
+	err = ntfs_attr_record_rm(actx, false);
 	if (err)
 		goto err_out;
 
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 8abe7bee4c0d..6d28c4c25a05 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -485,7 +485,7 @@ int ntfs_write_volume_label(struct ntfs_volume *vol, char *label)
 	ret = ntfs_attr_lookup(AT_VOLUME_NAME, NULL, 0, 0, 0, NULL, 0,
 			       ctx);
 	if (!ret)
-		ret = ntfs_attr_record_rm(ctx);
+		ret = ntfs_attr_record_rm(ctx, false);
 	else if (ret == -ENOENT)
 		ret = 0;
 	ntfs_attr_put_search_ctx(ctx);

-- 
2.43.0

