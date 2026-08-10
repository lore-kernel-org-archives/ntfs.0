Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1794D357702
	for <ntfs@lists.linux.dev>; Mon, 10 Aug 2026 04:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786335792; cv=none; b=CWIHkocr1c1st58KBTRsas5Gpa9EnieMIhem0s8yUcGsfvSSCbc79nhyz9V1Xi4eOhtjFL9bFO8J0owp1adS/Xzi3GPib3EYEVdzsmtIOqOE5qkh0LxhqS/MKSXRIkpuyp+wAf8UcAPbwZ9f3TBv9GAdWnO8GUmqQn9DkbNYqrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786335792; c=relaxed/simple;
	bh=+dIAtgTl8zTgGmwmddPgYmLCh/rwaNskrVPR8D+FcL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BtiONNUlYUV667xU7xzn9/edI3w9AdVWTVIYKQwd2ntLLqStj6rYtapEGz4AxFnoVoJi8j/rQ3EWgsR8xnPnqWPUfJjuB66KrdkqYnhSwKgs4MIlxvoz4kvZ/uvjQ4mjahhs2f8BWfGIx3odhewGi/QBTotJg6jp8NG00c6rJgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEsmqX/c; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEsmqX/c"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cab973140bso21109645ad.3
        for <ntfs@lists.linux.dev>; Sun, 09 Aug 2026 21:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786335790; x=1786940590; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ydk2qA2ievpCRWUQNUyDGVlHRr+esfMkMWAoxsjxlKQ=;
        b=TEsmqX/c2q4EQyTZb41nUAO6pk4ZHw9giw0Cy2fCp5HxbJZUaSpR23GAxqtgoH0DMN
         HAyyWvEzouqxPZL+j5XScobGx7Pa7Cp98AKrfCR8AEYTBoiSF30CPupXALwlyo7rS3he
         fifeVFoLDXaj2dgcqL+OjkOblYSHN3OQ+lJaqNhKl0bVWh5lLh+BUiGwFk3TVDxTUvix
         QliOvl0usTb6U8zA13YINAvoqn23KEiZWR3A8487HJyNrmIjGV2M7xoRje8X2KvXjEnv
         mfsE6TSYM5NYMVDVIbC9VfnhCY8JyHQgxt5zVKeUJomaVwTUuwbKRCp1gxdFa/KjK/ad
         SNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786335790; x=1786940590;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ydk2qA2ievpCRWUQNUyDGVlHRr+esfMkMWAoxsjxlKQ=;
        b=D7yyh12OE9GUxKQJh8I5cii3WF4+6KIDnVs19JPR4+tqjt9KM2Mdyg3tYFcuGgFlvp
         plUZsBQ6N8HBKCOiktF3FFTLHLsiw6JIo3SMbMa7JjhF4DvAByXJP2gOWNvKcxy0YGHP
         q24qX2OSNcWdPfC5RbX8Kbr431X9MnkiKjUAtez87cPC5BsNU8J3AdLaUmDLofrGxZO2
         0RiE7zqif3xifAu4eEj2vEv4dt6X1WJbTrUTKhUbdQOcX5T199h6xLG2E+gJMGUKCtS6
         gyZU4AYpUYT2gIDmRSN0OzRl+SHCe2eKAaiz9ghIp27cW+vJ3Zzl3Rkeo55o3IPZoEp1
         LdDQ==
X-Forwarded-Encrypted: i=1; AHgh+RofZoRTohf579fpYFCjr0pTIkCrr/GDdO8IoK8OBuy2C6nqk6XozEJL/XBeeZu1wGI9eCB0@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3PSouY7YGaNCq7slBzjq1GjM9UuUhUfd2IYM23y0esXNCDOdQ
	iBPxBI8JDbNeyY0+gX1nhWodL+UU1YGX33gGHV9O4DVJ3yz0bgol6maa
X-Gm-Gg: AR+sD11z4393iUutCUXegbTFQSJzW1ZhGV5qBoAZDMKAcdjSqjGVqXM5LUoYD6T24Wa
	JKoc40F01OX8r2xjMc3Wk1wUJ3jEvsxLEb3sSL4202sg8zIsn9GzHfOHf6YeO9tognH3hHnf16e
	9tVGr1KZEEVeXWdg9Dov6ZhU++ezbekKQabRNKzh41fWvjBVNUYkSVlpSOceU/u9sBRGasM3N1G
	6xxnxTbM9/JqhTRsTCzUrXROqg6w0DUP6pODiPPPLoVwYbTb4lTP2nvZO7+nJqdy7SFAKpUuBEx
	MMRRZ5rWt8wl5CzwRY/xcV4IXtpAZk0FCQghIZ0nUL1nrHVUTLu3gqDg8tLcPjNdWpuRFrkw9FB
	6B48O+TFoGJbmOnlx30X1CaLZFj7ZbgyPXImBYnxGB20cIN7Zmt6deBNJerktYATGqh20/k4rvx
	WrVfsnqSZjn7yy74qUL+Y0tV/FkWGLvC/0EiYn4ahU+bvdTD6hdLVExaA9G9ZJwjT/dZs=
X-Received: by 2002:a17:902:d54c:b0:2c9:e69f:8b0f with SMTP id d9443c01a7336-2d2a8e91fb5mr218186545ad.17.1786335790149;
        Sun, 09 Aug 2026 21:23:10 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccac19esm28595905ad.9.2026.08.09.21.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:23:09 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Cen Zhang <zzzccc427@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 4/4] ntfs: protect mapping-pairs attr-list updates with attr_list_persist_lock
Date: Mon, 10 Aug 2026 13:22:05 +0900
Message-ID: <20260810-topic-attr-list-lock-v6-v5-4-93f823a6ba05@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810-topic-attr-list-lock-v6-v5-0-93f823a6ba05@gmail.com>
References: <20260810-topic-attr-list-lock-v6-v5-0-93f823a6ba05@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9978; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=+dIAtgTl8zTgGmwmddPgYmLCh/rwaNskrVPR8D+FcL0=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqeVEHg5QtSTDBvHot74VC5xos2yxGXrJ0qVFVW
 y14dy/qAQiJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCanlRBwAKCRA08jD6945I
 00E4D/9LVSjvmyus+W7TQVl+Qe3TsPUhDORIajZf4d9gd6OeasszcFrHso836R2yiEW1eHOhtqR
 H+5e8sNJaCpQ3UeA/aX4jaE3YM5NMO7cPZCtE7tJL0UPPvS2hMlFl3Sx7rk7e6Xc4v+GXE9eApp
 dgivYtmRegBY8N8KXL5RZQlfkql6bI4WmvT8F2Gq9kEZQBjSh7D7cdiexU2BAYT4ZgMsDSkA65y
 Ot1MjaU4idfJV01fjqNu9fBJFUcUhCwMwuzWzPyOA81BhTo1LcM7wvXSTbpkeEGW+84XwMRe0ES
 Y39gAcch/vxeVBCHJgN2DgQWgbe8QSaXuklVYtRzCu636mHfDZ1ITn9eZxtv46VsgfdaO1VZq7E
 zMs7bhMqRZ1CspMVAi6bNEH2CEETZL3qx+VzlTdkdVWeP9Q0TqLd38SQX5PBHrn+UuYzTRaLlhG
 rjBq0O967dXHOtIExK9cunQ8f9e1g/vpozExf+O0iHI9bpJaFStTVuA+Gm4k5Om67Q2/gjczXQ8
 hQrx8RemLBJwxKN06hTrW2o4oN9Y+oA1FFld+6J3mwWQlV0xqae51MtPNPsEWHDwZKxbLHvWkeC
 7Hy7G4vv+yfLp/AFR7qIFFVx6jFujhAM8JQ5igu47dfL649FX6BnNMwX2Lm/BEeYepg+v8puDnR swHqJUWXrXf9ukA==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

ntfs_attr_update_mapping_pairs() updates several ALEs while rebuilding
a fragmented attribute's mapping pairs and persists the attribute
list once after the loop. Each ALE update is covered by
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
 fs/ntfs/attrib.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++----
 fs/ntfs/inode.c  | 46 ++++++++++++++++++++++++++++++++++++++++----
 fs/ntfs/inode.h  |  1 +
 3 files changed, 97 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index f45f0289e3d3..2eac3493a43c 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -3718,6 +3718,7 @@ int ntfs_attr_record_move_away(struct ntfs_attr_search_ctx *ctx, int extra)
 		base_ni = ctx->base_ntfs_ino;
 	else
 		base_ni = ctx->ntfs_ino;
+	lockdep_assert_held(&base_ni->attr_list_persist_lock);
 
 	sb = ctx->ntfs_ino->vol->sb;
 	if (!NInoAttrList(base_ni)) {
@@ -3726,7 +3727,7 @@ int ntfs_attr_record_move_away(struct ntfs_attr_search_ctx *ctx, int extra)
 		return -EINVAL;
 	}
 
-	err = ntfs_inode_attach_all_extents(ctx->ntfs_ino);
+	err = ntfs_inode_attach_all_extents_locked(ctx->ntfs_ino);
 	if (err) {
 		ntfs_error(sb, "Couldn't attach extents, inode=%llu",
 			(unsigned long long)base_ni->mft_no);
@@ -3790,7 +3791,8 @@ int ntfs_attr_record_move_away(struct ntfs_attr_search_ctx *ctx, int extra)
  * update allocated and compressed size.
  */
 static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
-		struct mft_record *m, struct ntfs_attr_search_ctx *ctx)
+		struct mft_record *m, struct ntfs_attr_search_ctx *ctx,
+		bool *attrlist_locked)
 {
 	int sparse, err = 0;
 	struct ntfs_inode *base_ni;
@@ -3827,6 +3829,19 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
 		    !(le32_to_cpu(m->bytes_allocated) - le32_to_cpu(m->bytes_in_use))) {
 
 			if (!NInoAttrList(base_ni)) {
+				/*
+				 * ntfs_inode_add_attrlist() acquires
+				 * attr_list_persist_lock itself, so drop it
+				 * first if our caller took it for us. Nothing
+				 * is in flight that needs protecting: without
+				 * an attribute list no ALE has been touched
+				 * yet. The -EAGAIN below makes the caller
+				 * restart and re-acquire the lock.
+				 */
+				if (*attrlist_locked) {
+					mutex_unlock(&base_ni->attr_list_persist_lock);
+					*attrlist_locked = false;
+				}
 				err = ntfs_inode_add_attrlist(base_ni);
 				if (err)
 					goto out;
@@ -3953,7 +3968,7 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 	struct attr_record *a;
 	s64 stop_vcn;
 	int err = 0, mp_size, cur_max_mp_size, exp_max_mp_size;
-	bool finished_build, attrlist_changed = false;
+	bool finished_build, attrlist_changed = false, attrlist_locked = false;
 	bool first_updated = false;
 	struct super_block *sb;
 	struct runlist_element *start_rl;
@@ -3978,9 +3993,16 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 	else
 		base_ni = ni;
 
+	if (ni->type != AT_ATTRIBUTE_LIST) {
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
 
@@ -4051,9 +4073,13 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 			continue;
 		}
 
-		err = ntfs_attr_update_meta(a, ni, m, ctx);
+		err = ntfs_attr_update_meta(a, ni, m, ctx, &attrlist_locked);
 		if (err < 0) {
 			if (err == -EAGAIN) {
+				if (attrlist_locked) {
+					mutex_unlock(&base_ni->attr_list_persist_lock);
+					attrlist_locked = false;
+				}
 				ntfs_attr_put_search_ctx(ctx);
 				goto retry;
 			}
@@ -4090,6 +4116,10 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
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
@@ -4110,6 +4140,18 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 
 			/* Add attribute list if it isn't present, and retry. */
 			if (!NInoAttrList(base_ni)) {
+				/*
+				 * We hold attr_list_persist_lock even when the
+				 * inode has no attribute list yet, since one
+				 * can appear under us. ntfs_inode_add_attrlist()
+				 * takes the same lock, so drop it here; no ALE
+				 * has been touched, so there is no transaction
+				 * to break, and the retry re-acquires it.
+				 */
+				if (attrlist_locked) {
+					mutex_unlock(&base_ni->attr_list_persist_lock);
+					attrlist_locked = false;
+				}
 				ntfs_attr_put_search_ctx(ctx);
 				if (ntfs_inode_add_attrlist(base_ni)) {
 					ntfs_error(sb, "Can not add attrlist");
@@ -4226,6 +4268,12 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
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
@@ -4352,6 +4400,8 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 	return 0;
 
 put_err_out:
+	if (attrlist_locked)
+		mutex_unlock(&base_ni->attr_list_persist_lock);
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 	return err;
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index f62d72857558..a52762b4659f 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2921,6 +2921,7 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
 
 	if (!base_ni)
 		return NULL;
+	lockdep_assert_held(&base_ni->extent_lock);
 
 	sb = base_ni->vol->sb;
 	ntfs_debug("Opening extent inode %llu (base mft record %llu).\n",
@@ -2988,15 +2989,20 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
 }
 
 /*
- * ntfs_inode_attach_all_extents - attach all extents for target inode
+ * ntfs_inode_attach_all_extents_locked - attach all extents for target inode
  * @ni:		opened ntfs inode for which perform attach
  *
+ * Caller must hold the base inode's attr_list_persist_lock.  The attribute
+ * list buffer is replaced and freed by transactions serialized by this lock,
+ * so walking it without the lock can dereference a stale buffer.
+ *
  * Return 0 on success and error.
  */
-int ntfs_inode_attach_all_extents(struct ntfs_inode *ni)
+int ntfs_inode_attach_all_extents_locked(struct ntfs_inode *ni)
 {
 	struct attr_list_entry *ale;
 	u64 prev_attached = 0;
+	int err = 0;
 
 	if (!ni) {
 		ntfs_debug("Invalid arguments.\n");
@@ -3005,6 +3011,7 @@ int ntfs_inode_attach_all_extents(struct ntfs_inode *ni)
 
 	if (NInoAttr(ni))
 		ni = ni->ext.base_ntfs_ino;
+	lockdep_assert_held(&ni->attr_list_persist_lock);
 
 	ntfs_debug("Entering for inode 0x%llx.\n", ni->mft_no);
 
@@ -3018,19 +3025,50 @@ int ntfs_inode_attach_all_extents(struct ntfs_inode *ni)
 	}
 
 	/* Walk through attribute list and attach all extents. */
+	mutex_lock(&ni->extent_lock);
 	ale = (struct attr_list_entry *)ni->attr_list;
 	while ((u8 *)ale < ni->attr_list + ni->attr_list_size) {
 		if (ni->mft_no != MREF_LE(ale->mft_reference) &&
 				prev_attached != MREF_LE(ale->mft_reference)) {
 			if (!ntfs_extent_inode_open(ni, ale->mft_reference)) {
 				ntfs_debug("Couldn't attach extent inode.\n");
-				return -1;
+				err = -1;
+				break;
 			}
 			prev_attached = MREF_LE(ale->mft_reference);
 		}
 		ale = (struct attr_list_entry *)((u8 *)ale + le16_to_cpu(ale->length));
 	}
-	return 0;
+	mutex_unlock(&ni->extent_lock);
+	return err;
+}
+
+/*
+ * ntfs_inode_attach_all_extents - attach all extents for target inode
+ * @ni:		opened ntfs inode for which perform attach
+ *
+ * Return 0 on success and error.
+ */
+int ntfs_inode_attach_all_extents(struct ntfs_inode *ni)
+{
+	struct ntfs_inode *base_ni;
+	int err;
+
+	if (!ni) {
+		ntfs_debug("Invalid arguments.\n");
+		return -EINVAL;
+	}
+
+	if (NInoAttr(ni))
+		base_ni = ni->ext.base_ntfs_ino;
+	else
+		base_ni = ni;
+
+	mutex_lock(&base_ni->attr_list_persist_lock);
+	err = ntfs_inode_attach_all_extents_locked(base_ni);
+	mutex_unlock(&base_ni->attr_list_persist_lock);
+
+	return err;
 }
 
 /*
diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
index a6c5b15d648d..a02ef1e59044 100644
--- a/fs/ntfs/inode.h
+++ b/fs/ntfs/inode.h
@@ -346,6 +346,7 @@ int ntfs_getattr(struct mnt_idmap *idmap, const struct path *path,
 int ntfs_get_block_mft_record(struct ntfs_inode *mft_ni, struct ntfs_inode *ni);
 int __ntfs_write_inode(struct inode *vi, int sync);
 int ntfs_inode_attach_all_extents(struct ntfs_inode *ni);
+int ntfs_inode_attach_all_extents_locked(struct ntfs_inode *ni);
 int ntfs_inode_add_attrlist(struct ntfs_inode *ni);
 void ntfs_destroy_ext_inode(struct ntfs_inode *ni);
 int ntfs_inode_free_space(struct ntfs_inode *ni, int size);

-- 
2.43.0

