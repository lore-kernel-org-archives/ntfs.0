Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1476134CCF
	for <ntfs@lists.linux.dev>; Mon, 27 Jul 2026 00:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785113970; cv=none; b=odMOnaC1Q+a63QOjalzwENdMhoyeF0AlHm77YlgMxXWWELgrfv69EvZskXu0q/2dmvRhz4S0D+VYlEt89/c0xgc718rQxYfOea1q8dmWgJD2gaOUXRyodd9MUrhvxpttJekkUBQ16i5Op8Ovqx6yqjYg0rZJ89wX/P6rS4ZyD1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785113970; c=relaxed/simple;
	bh=ZGHVp1mSGyqe9BoxALJu/NY4D3sj6A985PYkHYqWsfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E3vJ2vCvCTMWERg6zmBXMahQ0JNKLiTf3rTG3j9U7FvhQ6I147U964xNk+5iKIm1Djruw0IyObC558ucebsy1opWSF+iyXnmUtwBZU3ut7dBnvvlAZg261mkJsRPcaZNu9Pz4D8BaVSdTQ0FNdV4HTBr/csHLBlj+HAwRHIl748=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzmKY43v; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzmKY43v"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cedda2ce6fso17927165ad.1
        for <ntfs@lists.linux.dev>; Sun, 26 Jul 2026 17:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785113968; x=1785718768; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKEjU8KkhDFbBcb8grg6v58kirxJkRLS0QG5sDeDY34=;
        b=YzmKY43vnSW2py1Pwmx0yzN2/uBwtc+t6+AR/I0/bXgzoGu/oZ1etYn/IW1WN3vA86
         cb7jRbJMpZxoNplrtVySOU08+eSajHnxz6GQxMg4OBIMZY4CZlBuX7CuZsFU0ySngAQi
         ds/KCH2l7qynRIEzWhZ7mJ0hR7VrpHivqGq/v4XlZVIF3KeaYFcPMbvyOuCRh7R4o4D8
         HR93D6N7m0jIAfUY/FhRlOD0ClY038Xnkzzfx3J3JkrymXwc/NcaXlZGf1X+fsN+sRaa
         JtpfFkGHtzR76GOFFdWtNOpt+pESjD2WmzGHpAqVtZw4XCIrt79gJME30qFjpySK6jeT
         aaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785113968; x=1785718768;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKEjU8KkhDFbBcb8grg6v58kirxJkRLS0QG5sDeDY34=;
        b=V1qujTCT0lXDDTl1h4qh7Zz9dQ1nX5EoDdIzOQCji1GJ/iGUtexBJARB4rulyJ599+
         PGHjaB1QSJ958HQHZ/CmVhR91K/diZxdSQesfs8e4hcAkJ2UBccJeI4CEcHdNBIMkOee
         OmujF78fsV8DitrLzs3+BZlYsRwl9OEWmAzOBR6Hm3s8DVJh9A8I4g1op82C9kC1kPgb
         9qKnWR9nPGmkZVafIxFCTjuCmkeqxw8uInQobe+rv/c80qv46goAlUaXSHoBCPvKNxvg
         +yHHkS87MSP954oLq4G04jcI/rdCz6/0giwvGygOc1VzWxvhGf/gH0yDq9QLt7PH+RVU
         bGSA==
X-Forwarded-Encrypted: i=1; AHgh+RpUBL7P54ttciUyoSfPPN7vgV3XqTbKi0r0ra0AjEfy4s7uS8TTFIWvm7v9UR0zeL1geb3v@lists.linux.dev
X-Gm-Message-State: AOJu0YwO4kSBYJ7mYqlIOrgtoaGkE6kzBBQujZKsXpBJMOkjqt5/2uOw
	FAftcdV0sUpoJ9Ke+ICdtGSfwYx1ZyCNuSXtnq76ZYjWcpCL9i5pG5dJSCAL8w==
X-Gm-Gg: AR+sD11Ea9Z1ljfdjk0njGP+wHqg/58TdQD4te0JFVprtGQc3FLcAfZFqdWr1LFp+WK
	qunkye6G9a4/VWF/QfmX80czJW51RSQ2R+fMRi60rNPD6wk3oAlcDGskfxa/zUM44nwzDD7xl8y
	pSkIhYlDIHgHMt5R9PGWwyoalGADi5dH2aMWN0vn894POdbghgkMGejvKuIUc747II6UCVo7cOc
	Tt5kwjE9AE/j/sI1EAy0mPHVDr9VGWD2Z2DBZIew4TTMPpNU9UdqVV8YSmctWzfDEpbrWDsWUy4
	xPbnpnemznnBhc1My88KpUjbzO0ypMien4+zTpwvRBK6lWg7sI5BMOwgr2XCuq7w2pjgQ4/sUKg
	pptRjL/o5ntSbuXv08BE92EtONmfCey/yzo+FRkZ+QuNRW1ZyIZfK3UeKM2h+jsMJcFWnCqhIuV
	N8mQkxEe7/7dP3uPUoLqpc2QhJ3Q==
X-Received: by 2002:a17:903:1aa7:b0:2ca:c01e:8837 with SMTP id d9443c01a7336-2cfde8473e4mr59828955ad.24.1785113967995;
        Sun, 26 Jul 2026 17:59:27 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbda1sm25349585ad.53.2026.07.26.17.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:59:27 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Cen Zhang <zzzccc427@gmail.com>
Subject: [PATCH 2/4] ntfs: protect attribute-list buffer replacement with attr_list_persist_lock
Date: Mon, 27 Jul 2026 09:58:44 +0900
Message-ID: <20260727-topic-attr-list-lock-v6-v1-2-664c5339d9b9@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727-topic-attr-list-lock-v6-v1-0-664c5339d9b9@gmail.com>
References: <20260727-topic-attr-list-lock-v6-v1-0-664c5339d9b9@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785113395; l=10336; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=ZGHVp1mSGyqe9BoxALJu/NY4D3sj6A985PYkHYqWsfg=; b=VwNrLmjcPVnPFwsWVRiBAjFyukJpw/bobC46Gg6gc7gu/7sC2alTuwEWqaGcCNx6ip1xZvXHq cooTBdqbEwIBusGWXfgjNBYAwAMYSIzXkmCpEXXJ7Kz1iA7fe6wej0Z
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
Content-Transfer-Encoding: 8bit

ntfs_attrlist_entry_add() and ntfs_attrlist_entry_rm() replace the
in-memory attribute-list buffer and then persist it to disk.  The swap
is protected by attr_list_lock, but persisting can sleep and recurse,
so that lock cannot be held across it.

Add attr_list_persist_lock, a mutex that covers the entire
publish/swap/persist/rollback transaction for each caller.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/attrib.c   |   4 +-
 fs/ntfs/attrib.h   |   2 +
 fs/ntfs/attrlist.c | 128 ++++++++++++++++++++++++++++++++++++++++++-----------
 fs/ntfs/inode.c    |   1 +
 fs/ntfs/inode.h    |   3 ++
 5 files changed, 111 insertions(+), 27 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 891468f87479..378e655c7028 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -83,8 +83,8 @@ bool ntfs_attrlist_exact_key_eq(const struct attr_list_entry *ale,
 	return ale->name_length == key->name_len;
 }
 
-static struct attr_list_entry * ntfs_attrlist_find_exact_locked(struct ntfs_inode *base_ni,
-								struct ntfs_attrlist_exact *exact)
+struct attr_list_entry *ntfs_attrlist_find_exact_locked(struct ntfs_inode *base_ni,
+							struct ntfs_attrlist_exact *exact)
 {
 	struct attr_list_entry *ale;
 	u8 *al_end;
diff --git a/fs/ntfs/attrib.h b/fs/ntfs/attrib.h
index a39719f75d06..2e5f87abd852 100644
--- a/fs/ntfs/attrib.h
+++ b/fs/ntfs/attrib.h
@@ -129,6 +129,8 @@ void ntfs_attrlist_exact_key_from_ale(struct ntfs_attrlist_exact_key *key,
 				      const struct attr_list_entry *ale);
 bool ntfs_attrlist_exact_key_eq(const struct attr_list_entry *ale,
 				const struct ntfs_attrlist_exact_key *key);
+struct attr_list_entry *ntfs_attrlist_find_exact_locked(struct ntfs_inode *base_ni,
+							struct ntfs_attrlist_exact *exact);
 int ntfs_attr_size_bounds_check(const struct ntfs_volume *vol,
 		const __le32 type, const s64 size);
 int ntfs_attr_can_be_resident(const struct ntfs_volume *vol,
diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
index b8594037df40..fde4178ffb2f 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -122,12 +122,13 @@ int ntfs_attrlist_entry_add(struct ntfs_inode *ni, struct attr_record *attr)
 {
 	struct attr_list_entry *ale;
 	__le64 mref;
-	struct ntfs_attr_search_ctx *ctx;
+	struct ntfs_attr_search_ctx *ctx = NULL;
 	u8 *new_al;
 	int entry_len, entry_offset, err;
 	struct mft_record *ni_mrec;
 	u8 *old_al;
 	__le64 lowest_vcn;
+	bool found, rollback;
 
 	if (!ni || !attr) {
 		ntfs_debug("Invalid arguments.\n");
@@ -153,13 +154,16 @@ int ntfs_attrlist_entry_add(struct ntfs_inode *ni, struct attr_record *attr)
 		ntfs_debug("Attribute list isn't present.\n");
 		return -ENOENT;
 	}
+	mutex_lock(&ni->attr_list_persist_lock);
 
-	/* Determine size and allocate memory for new attribute list. */
+	/* Determine size of new attribute list entry. */
 	entry_len = (sizeof(struct attr_list_entry) + sizeof(__le16) *
 			attr->name_length + 7) & ~7;
-	new_al = kvzalloc(ni->attr_list_size + entry_len, GFP_NOFS);
-	if (!new_al)
-		return -ENOMEM;
+
+retry_lookup:
+	new_al = NULL;
+	found = false;
+	rollback = false;
 
 	/* Find place for the new entry. */
 	ctx = ntfs_attr_get_search_ctx(ni, NULL);
@@ -181,29 +185,54 @@ int ntfs_attrlist_entry_add(struct ntfs_inode *ni, struct attr_record *attr)
 			le16_to_cpu(attr->data.resident.value_offset)), (attr->non_resident) ?
 			0 : le32_to_cpu(attr->data.resident.value_length), ctx);
 	if (!err) {
+		found = true;
 		/* Found some extent, check it to be before new extent. */
 		if (ctx->al_exact.key.lowest_vcn == lowest_vcn) {
 			err = -EEXIST;
 			ntfs_debug("Such attribute already present in the attribute list.\n");
-			ntfs_attr_put_search_ctx(ctx);
 			goto err_out;
 		}
-		/* Add new entry after this extent. */
-		entry_offset = ctx->al_exact.off +
-			le16_to_cpu(((struct attr_list_entry *)(ni->attr_list +
-								ctx->al_exact.off))->length);
 	} else {
 		/* Check for real errors. */
 		if (err != -ENOENT) {
 			ntfs_debug("Attribute lookup failed.\n");
-			ntfs_attr_put_search_ctx(ctx);
 			goto err_out;
 		}
 		/* No previous extents found. */
+	}
+
+	down_write(&ni->attr_list_lock);
+	if (found) {
+		if (ctx->al_exact.gen != ni->attr_list_gen) {
+			up_write(&ni->attr_list_lock);
+			ntfs_attr_put_search_ctx(ctx);
+			ctx = NULL;
+			goto retry_lookup;
+		}
+		ale = ntfs_attrlist_find_exact_locked(ni, &ctx->al_exact);
+		if (!ale) {
+			up_write(&ni->attr_list_lock);
+			err = -EIO;
+			goto err_out;
+		}
+		entry_offset = (u8 *)ale - ni->attr_list + le16_to_cpu(ale->length);
+	} else {
+		if (!ctx->al_insert.valid ||
+		    ctx->al_insert.gen != ni->attr_list_gen) {
+			up_write(&ni->attr_list_lock);
+			ntfs_attr_put_search_ctx(ctx);
+			ctx = NULL;
+			goto retry_lookup;
+		}
 		entry_offset = ctx->al_insert.off;
 	}
-	/* Don't need it anymore, @ctx->al_entry points to @ni->attr_list. */
-	ntfs_attr_put_search_ctx(ctx);
+
+	new_al = kvzalloc(ni->attr_list_size + entry_len, GFP_NOFS);
+	if (!new_al) {
+		up_write(&ni->attr_list_lock);
+		err = -ENOMEM;
+		goto err_out;
+	}
 
 	/* Set pointer to new entry. */
 	ale = (struct attr_list_entry *)(new_al + entry_offset);
@@ -231,17 +260,34 @@ int ntfs_attrlist_entry_add(struct ntfs_inode *ni, struct attr_record *attr)
 	old_al = ni->attr_list;
 	ni->attr_list = new_al;
 	ni->attr_list_size = ni->attr_list_size + entry_len;
+	ni->attr_list_gen++;
+	up_write(&ni->attr_list_lock);
+	ntfs_attr_put_search_ctx(ctx);
+	ctx = NULL;
 
 	err = ntfs_attrlist_update(ni);
 	if (err) {
-		ni->attr_list = old_al;
-		ni->attr_list_size -= entry_len;
+		down_write(&ni->attr_list_lock);
+		if (ni->attr_list == new_al) {
+			ni->attr_list = old_al;
+			ni->attr_list_size -= entry_len;
+			ni->attr_list_gen++;
+			rollback = true;
+		}
+		up_write(&ni->attr_list_lock);
+		if (!rollback)
+			new_al = NULL;
 		goto err_out;
 	}
 	kvfree(old_al);
+	mutex_unlock(&ni->attr_list_persist_lock);
 	return 0;
 err_out:
-	kvfree(new_al);
+	if (ctx)
+		ntfs_attr_put_search_ctx(ctx);
+	if (new_al)
+		kvfree(new_al);
+	mutex_unlock(&ni->attr_list_persist_lock);
 	return err;
 }
 
@@ -255,10 +301,12 @@ int ntfs_attrlist_entry_add(struct ntfs_inode *ni, struct attr_record *attr)
  */
 int ntfs_attrlist_entry_rm(struct ntfs_attr_search_ctx *ctx)
 {
-	u8 *new_al;
-	int new_al_len;
+	u8 *new_al = NULL;
+	int err, new_al_len;
+	bool rollback;
 	struct ntfs_inode *base_ni;
 	struct attr_list_entry *ale;
+	u8 *old_al;
 
 	if (!ctx || !ctx->ntfs_ino || !ctx->al_exact.valid) {
 		ntfs_debug("Invalid arguments.\n");
@@ -269,9 +317,6 @@ int ntfs_attrlist_entry_rm(struct ntfs_attr_search_ctx *ctx)
 		base_ni = ctx->base_ntfs_ino;
 	else
 		base_ni = ctx->ntfs_ino;
-	if (ctx->al_exact.off >= base_ni->attr_list_size)
-		return -EIO;
-	ale = (struct attr_list_entry *)(base_ni->attr_list + ctx->al_exact.off);
 
 	ntfs_debug("Entering for inode 0x%llx, attr 0x%x, lowest_vcn %lld.\n",
 		   (long long)ctx->ntfs_ino->mft_no,
@@ -282,12 +327,24 @@ int ntfs_attrlist_entry_rm(struct ntfs_attr_search_ctx *ctx)
 		ntfs_debug("Attribute list isn't present.\n");
 		return -ENOENT;
 	}
+	mutex_lock(&base_ni->attr_list_persist_lock);
+
+	down_write(&base_ni->attr_list_lock);
+	ale = ntfs_attrlist_find_exact_locked(base_ni, &ctx->al_exact);
+	if (!ale) {
+		up_write(&base_ni->attr_list_lock);
+		err = -EIO;
+		goto out_unlock;
+	}
 
 	/* Allocate memory for new attribute list. */
 	new_al_len = base_ni->attr_list_size - le16_to_cpu(ale->length);
 	new_al = kvzalloc(new_al_len, GFP_NOFS);
-	if (!new_al)
-		return -ENOMEM;
+	if (!new_al) {
+		up_write(&base_ni->attr_list_lock);
+		err = -ENOMEM;
+		goto out_unlock;
+	}
 
 	/* Copy entries from old attribute list to new. */
 	memcpy(new_al, base_ni->attr_list, (u8 *)ale - base_ni->attr_list);
@@ -295,9 +352,30 @@ int ntfs_attrlist_entry_rm(struct ntfs_attr_search_ctx *ctx)
 				ale->length), new_al_len - ((u8 *)ale - base_ni->attr_list));
 
 	/* Set new runlist. */
-	kvfree(base_ni->attr_list);
+	old_al = base_ni->attr_list;
 	base_ni->attr_list = new_al;
 	base_ni->attr_list_size = new_al_len;
+	base_ni->attr_list_gen++;
+	up_write(&base_ni->attr_list_lock);
 
-	return ntfs_attrlist_update(base_ni);
+	err = ntfs_attrlist_update(base_ni);
+	if (err) {
+		rollback = false;
+		down_write(&base_ni->attr_list_lock);
+		if (base_ni->attr_list == new_al) {
+			base_ni->attr_list = old_al;
+			base_ni->attr_list_size += le16_to_cpu(ale->length);
+			base_ni->attr_list_gen++;
+			rollback = true;
+		}
+		up_write(&base_ni->attr_list_lock);
+		if (rollback)
+			kvfree(new_al);
+		goto out_unlock;
+	}
+	kvfree(old_al);
+	err = 0;
+out_unlock:
+	mutex_unlock(&base_ni->attr_list_persist_lock);
+	return err;
 }
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 72d8b6c9016b..c568ddf851f4 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -476,6 +476,7 @@ void __ntfs_init_inode(struct super_block *sb, struct ntfs_inode *ni)
 	ni->folio_ofs = 0;
 	ni->mrec = NULL;
 	init_rwsem(&ni->attr_list_lock);
+	mutex_init(&ni->attr_list_persist_lock);
 	ni->attr_list_gen = 0;
 	ni->attr_list_size = 0;
 	ni->attr_list = NULL;
diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
index a99c228184ce..ee7e5ec6ade4 100644
--- a/fs/ntfs/inode.h
+++ b/fs/ntfs/inode.h
@@ -69,6 +69,7 @@ enum ntfs_inode_mutex_lock_class {
  * functions). Setup during read_inode for all inodes with attribute
  * lists. Only valid if NI_AttrList is set in state.
  * @attr_list_lock: Protects in-memory attribute list state.
+ * @attr_list_persist_lock: Serializes attribute list replacement and persist.
  * @attr_list_gen: Generation of the in-memory attribute list state.
  * @attr_list_size: Length of attribute list value in bytes.
  * @attr_list: Attribute list value itself.
@@ -123,6 +124,8 @@ struct ntfs_inode {
 	s64 mft_lcn[2];
 	unsigned int mft_lcn_count;
 	struct rw_semaphore attr_list_lock;
+	/* Serializes attribute list replacement and persist. */
+	struct mutex attr_list_persist_lock;
 	u64 attr_list_gen;
 	u32 attr_list_size;
 	u8 *attr_list;

-- 
2.43.0

