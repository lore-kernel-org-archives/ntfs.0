Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8185134CCF
	for <ntfs@lists.linux.dev>; Mon, 27 Jul 2026 00:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785113980; cv=none; b=cuAfNenYK6kmeMCtrkX1S2E3BhzHPOhaMNTbHhWxP/CZUHYtyW9EEpkLepg5KB3ifObb09/jaNEXF9flpUFvfatN5/gnn0O8Jm7r/cH/OAUQVtaEaY9tLdA9uSJutv2LGSFxWYrB3BGPxbmTYEWawZGSmjFG+6cLIImEA6UKsIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785113980; c=relaxed/simple;
	bh=QgQFZEq4yEmJJSuGoIBWi4UvS89vLhbeOoL4Sl+FlIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XFcblFolurX/r3sPcvXy0ucjLtfFzVC8d4+RuEEMbYUca5KchWmWxS3tcgqQPxf4etiW3UhzmwbrM1B0PNy8aAHuiP1v3SZH62z06wxPM2bgNvWOaq3FixKRYqeUJqP/yTNgLTJHwrxET2T1gPkPWx67nuTqvNLlKxl9QX3dy/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYYLhFcQ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYYLhFcQ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cfff5f88dbso919485ad.3
        for <ntfs@lists.linux.dev>; Sun, 26 Jul 2026 17:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785113978; x=1785718778; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vHmzUcWeMDx0EeWShSELad/lrav8LT4pvUEZoZxAPsA=;
        b=iYYLhFcQUX5TpRvvo2NqmcRe2xqUsCDwfuqKVlW3bWfyHIF7+PwXIEoikrPgbKHoZT
         wF3aXXs53U/aCDn7d8gokBIzuP6jIqlb/wM9O73XZqfE8X4dHM3yG5W8nYCA2GCVcovG
         6wMm76SzFsLvIRsfjmxUny9VPLGw1pht0OaT2EEDga22vuW+geJ/uxmWDREMYztTZanY
         RRr6nwKfSRg0DP0kulTzxSycQ8ceuOyewyzIG2nTPLpqBsX1y9b/JnBpuYvI0xcHAC4M
         v7hhHF3zHurPNVMjnWFIJ5qF97YoA3O7U1o3eie71upg2jQ9IxmsrVug0K/lzbtQacXo
         Z4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785113978; x=1785718778;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHmzUcWeMDx0EeWShSELad/lrav8LT4pvUEZoZxAPsA=;
        b=Ng/7aeQjCUT+TZd19epCBj6u+vfm9YEwILSPpCgAFBhhAVfXcNgmzvwX2U2sTcNo9/
         omtk/ijk8XhyerHtZJK8i82DcaKhYZk9haBiam4FuleS8HfxdyiSsClu9xCby+RLewD0
         wc7JtPcqHdjaTN3DKBcCeuRaZyKE/TqFocaTbYpCAODByp2Zr6vATuasDCYE0bMZsT9m
         VEVQ0HjitBTLZfKqX1m3KnVzSsK2tweRUALkZcwMOCEqxisPC+X6GC/82Gz2uqB3ybXQ
         dI5zZhuZ2owBn3BO/n6fHAe3JinZxuKejYONVz6z/KUUSjItruxf3dlKfVMfZhEL63R0
         CLrw==
X-Forwarded-Encrypted: i=1; AHgh+RrhT+grhlNS4AE/rOFb/hOjzoXMieppWzpi2xz3YL1MdP9IQWrhR+n6pSDid/nYmybqTBaE@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc4EnBRv8cCpA8EXJKvAIAyyWa3Y8nZAUkrYNRCs3MUXTEr3bK
	1/SUubKAvN1H0xjniMEDs1LgMkMy76ch4/WZmFtk7quS50NeI7D1QZRj
X-Gm-Gg: AR+sD13zZdyjFoQKOKRju7CpRbDgE2j3riaZP/TKnDGm9nJrfc2qzkc1aq9HoDsamW4
	zxJUgBtb7olZNKRVimu6YLh1wMI9HRn6RpIxpQgmOViYhv4HBYc99eLjB+zzuaTy4sbp1qecyv+
	WhzxsKgPP0+p/YCJKkQGEQvqPOKVeYrM6sVOjU11xd5nkIl+CW/vbJ2MW94f5ubC3/LJE2p77OT
	iD0H6Q4mJDZQHS2ZbshNLq3eymvhBM5nqya4Vh268RfEkQl5MO4fpuSCsI5hnvPU07vUnYyGGcn
	Bkz0QgpSa84zZfVqAHCv48Q4NX5acmLNDpkUxRjgn8w/0V5J3G1/Mzd8YZUQ+g0ppYOiCx10w1h
	ApxG+63rBYZXwXOe9HxES5ep9znBpv2klDZNYm/ervDWRJLv6gr9uDRBQrzuUVAl0jgsvICya/F
	8+TPFUVni0VgP6j1F5Qme/JOygVA==
X-Received: by 2002:a17:902:ec92:b0:2c9:ff29:3f73 with SMTP id d9443c01a7336-2cfde82559cmr59945675ad.28.1785113978250;
        Sun, 26 Jul 2026 17:59:38 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbda1sm25349585ad.53.2026.07.26.17.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:59:37 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Cen Zhang <zzzccc427@gmail.com>
Subject: [PATCH 4/4] ntfs: protect mapping-pairs attr-list updates with attr_list_persist_lock
Date: Mon, 27 Jul 2026 09:58:46 +0900
Message-ID: <20260727-topic-attr-list-lock-v6-v1-4-664c5339d9b9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785113395; l=3807; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=QgQFZEq4yEmJJSuGoIBWi4UvS89vLhbeOoL4Sl+FlIk=; b=V1dZOiW82tTrbDaJiUfA7Kk8nSd/FBNodAo5zaR+bpw0W6OWLSTTHMwsZUStbrgNg8/aR9Gnt 9JTr0Y1Ur1BB5EdPT8kaYsqfVjRqzsWRqfpCgFU4yJ89mJ+SKSW8Nqg
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

