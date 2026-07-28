Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A903D3D76
	for <ntfs@lists.linux.dev>; Tue, 28 Jul 2026 23:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785281956; cv=none; b=oc8a/M27Lzjb1ybRmcYm/6+0m74+gCRCA4eWZbXKIN7bt0FVO9zT1yFVDOiLF8T9prfbCz4eehODttB3cLtA1WvvkWKoFarHFdKXXkN7Bb4eRMwPwdOadZhvNC0Q1y75Gir44fEZPBrHhR0IGYmcD+mQeKqCZ0gDxb3aNFwF8Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785281956; c=relaxed/simple;
	bh=XRMpXRtKkfalPxhM0CiA4AYDEJlnQMcfsUXjBD6mybI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XGU3y0XItDtJPyv/tQWsxlu30Mj0WH6Bh/IZb2iQVdiCU2WGX+w4rQPuf14hTjEGgpIiR104AHSWp0EucFF4M7XvQDNirCy/rSejLuzRubHqEfKNzZyKM6S18sf6oh0eaw3xryUo/dUuvP76IyTexcUvr7r5bZv/rXYuRV+sXFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXLmoyom; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXLmoyom"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84867f07d63so434742b3a.2
        for <ntfs@lists.linux.dev>; Tue, 28 Jul 2026 16:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785281952; x=1785886752; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oA2Ply5Hwex1+JOwakFGMwJlbHNQEJQT8Ns3mOL3v74=;
        b=lXLmoyomQkBxez3fVttOS5CYiNVw+e41cia7r7dF2shCsIRHS3WlBDdRUj92d+Ei7r
         uQEFhTcnsofYRbmQ4cl1r5P5dxv9n8BLNX6HyfXNuvzZq22IkbPEf+ZMhrvMWdv5wlVz
         8+icPXNlhOwiF+RsfytM8DWloo29SM4ccGkPNjV6CIh0G5YcqSdEByHkMcd3XVN82b7z
         PghVevK932U/qcnd6RxnXWRDvjV1kUzg5JZ8GXfRfhKrbvxuA1t2uZ7fPTOwjrruiiDg
         MteetAkgm0cD/58aPLoVEz7pmV8VIBGBbTdiDHF9t5sjG/9FJJsVwzpCLeyPAS/Mdtih
         +RAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785281952; x=1785886752;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oA2Ply5Hwex1+JOwakFGMwJlbHNQEJQT8Ns3mOL3v74=;
        b=YReA628cG7sd5J4ksRlWv69RFgEKNL1jtEuCNbv2H0ymEIe/9wQwIoePumBTL2dfwK
         fPyfsdaIDvNn8IUIEMZOGiXC+cH49iscX4pVq21bInErZQmJhxfQX2BRpaxQemIknNVj
         VnJzRcICHkV2g9DcvMe/6repX82kocuvYl/97Byvk9ZCtJQkK0oUUHPiAX/VuToRxfTv
         GEYZXSWvejWEYdWDChlieBQElSj+a+Si+nA2FQEzeSS7fUHOby1jrdrCWDYlulP7dp52
         jNgpJ2MRuLhPee6NjTOwCN/XWYBlbucr09oTHA8v1LV9RFWp8JZrI8G7fs4mFtBUPyaI
         gzPg==
X-Forwarded-Encrypted: i=1; AHgh+RquH+5lF6BK+NEi5jLsqad8zYEqjb/kobXYF2AsHuLh6+CN6H+VP05v5XkWSvxcs8Jku0dn@lists.linux.dev
X-Gm-Message-State: AOJu0YzoorvPGZHBO0jGz646d60myrKIYTlg4gctU4lz/O+5rOkmb1l1
	7XutId8+NzHyk2u4ci7TB7DxFonfticHsU0CoGZaHFqSdy9ZyB8XQUoo
X-Gm-Gg: AR+sD11HLLWFPokZtWXRrokzkRXrrzYd9UwoqPiQDh6DRnCcakeSop0CQ1oWpacmOnO
	7oMVZaGcfGIDaZiLVp+Go1XB1ge+nfJMOJhwl/hIk6TMw2Z/SI3J+I2JEcVOUFRkhpBG7qhc+S/
	tZ8fdsFZTTSA976+Rf9WjtaonMPk2tHaNmuYnMVf9oNtHq4fh08AG/r1Qg3zxIf9dm6fmdzPDm+
	m8RQAG+23ooUq+C7hTVG1m2t9Ey7duCAR0NFVJ6jsiOx1b1xCEMNFKmFF11UHlgZ1HM0EH+rLrX
	LgAhynTb37Pck2Vx9vZEgKNQYNTDDX5ZChSZpn0BWHOXb4CjBCWjNcdzNlbfY1kxKGUZvzRUCpf
	L/Y5XgYYFfFUUa1K0lZweYFYymZw21fHK7iArr+skPpC6aAv91mMkPBSyS18rlw1Foh33LYBqNQ
	nfGlsqYmffDs2Nw1dgG+uaG5Z5pUsTlPWscNwXjhJgVoEc0ir+A7plmX+IDdBcU/E1TTCqvgDUZ
	+4Sjf5EU0CU
X-Received: by 2002:a05:6a00:2998:b0:838:127d:a167 with SMTP id d2e1a72fcca58-84e9329d68emr4322396b3a.16.1785281951869;
        Tue, 28 Jul 2026 16:39:11 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0300ac2sm496896b3a.35.2026.07.28.16.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 16:39:11 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Cen Zhang <zzzccc427@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 4/4] ntfs: protect mapping-pairs attr-list updates with attr_list_persist_lock
Date: Wed, 29 Jul 2026 08:38:32 +0900
Message-ID: <20260729-topic-attr-list-lock-v6-v3-4-7f690b9b98ad@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785281796; l=4062; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=XRMpXRtKkfalPxhM0CiA4AYDEJlnQMcfsUXjBD6mybI=; b=a6Uq7Wi7bm89XWAvdzUvgyqAhumzOnpJsQNWH/axTq3iqfCCwz0QentGIcVa9zv9o3ljWznrX m5D98vJgq29B6OO/5GuPFzqxil6QJeljySwugzMCpGe7BV4qI2Jx/kV
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
index b16c95d3ea97..e85dbe3978ca 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -3902,7 +3902,7 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 	struct attr_record *a;
 	s64 stop_vcn;
 	int err = 0, mp_size, cur_max_mp_size, exp_max_mp_size;
-	bool finished_build, attrlist_changed = false;
+	bool finished_build, attrlist_changed = false, attrlist_locked = false;
 	bool first_updated = false;
 	struct super_block *sb;
 	struct runlist_element *start_rl;
@@ -3927,9 +3927,16 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
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
 
@@ -4003,6 +4010,10 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
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
@@ -4039,6 +4050,10 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
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
@@ -4052,6 +4067,10 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 
 			/* Add attribute list if it isn't present, and retry. */
 			if (!NInoAttrList(base_ni)) {
+				if (WARN_ON_ONCE(attrlist_locked)) {
+					mutex_unlock(&base_ni->attr_list_persist_lock);
+					attrlist_locked = false;
+				}
 				ntfs_attr_put_search_ctx(ctx);
 				if (ntfs_inode_add_attrlist(base_ni)) {
 					ntfs_error(sb, "Can not add attrlist");
@@ -4165,9 +4184,13 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 
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
@@ -4295,6 +4318,8 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 	return 0;
 
 put_err_out:
+	if (attrlist_locked)
+		mutex_unlock(&base_ni->attr_list_persist_lock);
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 	return err;

-- 
2.43.0

