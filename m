Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30083134CCF
	for <ntfs@lists.linux.dev>; Mon, 27 Jul 2026 00:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785113974; cv=none; b=ftMDbvRO+YGxUCSkUYUC1cKXlL2W9fuJP1VpKJAcChPCbpvDrB417hkD3BvyOM9xE+pjX4RjElx/AyjV60/nXivhvwowqatRsruys6W2QjVZKAEKfW/Cq+ypZwKlwgo2GDo7KvqkD4z5iK7UwYiV9EovQT2HAJoviHRiAbxW6PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785113974; c=relaxed/simple;
	bh=MCktNtyS6c53G1hgq5VFXSoSVoar44tzlcaAFRX3lSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cuwyRtrIlYWHtUYZO0zmraf77qTsYJlHgZ4mF43K/upa+Z+66WucF4W0vuWTCJ/gMdcmM8g4f5v10CeaXiWillZG+rygXHX+lRvoBWkUNAWYZkNb+Xi960/fnfUlNZExOfoONV9O7yHssGP2hT7QVJGJwB+3hlEOup0qR9Swxqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFBGL9TF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFBGL9TF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caed617615so21386185ad.3
        for <ntfs@lists.linux.dev>; Sun, 26 Jul 2026 17:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785113972; x=1785718772; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+mh4WSJfe3vZOQk6X6XBNVztVuJbLMleS1eIF4fMMGA=;
        b=LFBGL9TF5oZTiBTtCIugqQSbEb87XRm8NKnAqrV/LdoM0KVbCw+WoH7i6BiCUaZhwZ
         4vvoWBpC3mAe4tpe9x0WiL45PCsOnTxMB00EGIPyktXTISNB2oP9FIBCupojF/5vx1n1
         u8nKvEy+LpTb7qPo8RrkbrHXmCVpLt4iecGwe+/OBuDWMsPjg3vWF4zhoIYMGQPrUu8V
         VDABx+hf7jKhUTZyeQcN9SfwltLlpqNvfFvN6/9184CjYX7BAy5RkrJD8TxRAeOKZq6d
         pu+hDAuM83ZXaACRyCxXN17UwRYsDs7fJZdUEi/f68w6Aw26PJzMC35SiEwapXAUJo6O
         XTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785113972; x=1785718772;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mh4WSJfe3vZOQk6X6XBNVztVuJbLMleS1eIF4fMMGA=;
        b=MaLWX40VnQl38w/yfkXJORYZ2c8Ufquy2iSWXzb44x3N2Js9X0Qnt6sJfZVfCeiymG
         wKGNmMOyZ+cLgnvAVr3p/QbSKlAfJtNI9ffqPUzCc17dterUXOD6CECflwD8rprkcc5f
         XWtJn/C3Yq/8TjO+g13vr8CTi+beHhKyrgxVwqLxLyJ3hmeN2jQ0ZAHkvl2rzjTBUBP2
         aGG6ELAQn/VQFOZGUw3MwhnQ2HXo59QXVzKiDHNFHrFq0L92niQPxMVGOcVR10fi+lo+
         RBXtRbptLZJF3EV7aHeco/ECixcr5kQ2R2hB9Bpp6JASdmg9LMbscXQFtvr5JH3BvcRF
         GhNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPAmFyujXW5BWdXdADyFS+qzJ9qV9zSTQPZqM87/dkYU3Z/QVPgaJbTk1NxI+yx2yFI0bD@lists.linux.dev
X-Gm-Message-State: AOJu0YwtWE+qddrzXwr+xdH1r80wEqjmgVP18E3iDDIf3wfonyGTrBXL
	T56ljlZMxRG/EZTt+k/bIl8bj+LvMMefYonvKIeuZzqmP5n8jk7pX5XV
X-Gm-Gg: AR+sD11y6JvkRXvOn+lgPY13rAtCbu5v0vUNfuIA0AyagJ5YRegBhLuYNA2FvCan7Xo
	REkHRBz/ROCC0BOp7LZTVnK4AiVHisp8AQUpjw3iFb+R4cxSrBen9tUuQS2Vm83DzTcg+Z+vBsr
	VMveTZezT7n6qZiP3CL8RMtumPJB4B3kWDGcadem2vzcvAfuZeggjzenQ1V1aKDhpuCbMOTWlG5
	CSJxk901t4CcTCumZxZZEM8TkBE+wZ40yNGvVJcv/5u3N/UiEBGyDTeawHvb3WKFBRBlOOOkz1+
	dg0vXg7BfWzF/a0QUR8fyOlqdssnYjXgV2Dq9Xfk6hRLXDd11Bp13csJVD06KfRoJviwnB2/9tS
	QZceot34/q7KPEDbHGC9P4Szw34DkIxHDa+Goa2EXxaZJKRK4dzLZO4vjaq7xeIrdEpZKgLaaeW
	MnBfHpAegf9Twf6DEq+t7AG8pNsg==
X-Received: by 2002:a17:903:1a6f:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2cfde78d067mr58635015ad.6.1785113972370;
        Sun, 26 Jul 2026 17:59:32 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbda1sm25349585ad.53.2026.07.26.17.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:59:31 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Cen Zhang <zzzccc427@gmail.com>
Subject: [PATCH 3/4] ntfs: protect attribute-list creation/teardown with attr_list_persist_lock
Date: Mon, 27 Jul 2026 09:58:45 +0900
Message-ID: <20260727-topic-attr-list-lock-v6-v1-3-664c5339d9b9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785113395; l=4409; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=MCktNtyS6c53G1hgq5VFXSoSVoar44tzlcaAFRX3lSI=; b=L810AXfOhdLzZmWi46PaptrHGdgpf6sQyQvcasJxNrRtKQdbbjdZHi2QkPuv0fP8emH0iIagy 2ctyFD7ZjcZByx67S8ImzJrs1gtZPXUfRAgB5SJ4vCZrHpZgVt3YmmJ
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

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/attrib.c | 11 +++++++++++
 fs/ntfs/inode.c  | 34 +++++++++++++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 378e655c7028..00ff223d9c21 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -2816,10 +2816,21 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 
 	/* Post $ATTRIBUTE_LIST delete setup. */
 	if (type == AT_ATTRIBUTE_LIST) {
+		/*
+		 * attr_list_persist_lock serializes this in-memory attr_list
+		 * teardown against a concurrent ntfs_attrlist_entry_add()/rm()
+		 * transaction on the same inode.
+		 */
+		mutex_lock(&base_ni->attr_list_persist_lock);
+		down_write(&base_ni->attr_list_lock);
 		if (NInoAttrList(base_ni) && base_ni->attr_list)
 			kvfree(base_ni->attr_list);
 		base_ni->attr_list = NULL;
+		base_ni->attr_list_size = 0;
+		base_ni->attr_list_gen++;
 		NInoClearAttrList(base_ni);
+		up_write(&base_ni->attr_list_lock);
+		mutex_unlock(&base_ni->attr_list_persist_lock);
 	}
 
 	/* Free MFT record, if it doesn't contain attributes. */
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index c568ddf851f4..4ac63bbd47a6 100644
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
@@ -3153,14 +3159,21 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
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
@@ -3171,10 +3184,20 @@ int ntfs_inode_add_attrlist(struct ntfs_inode *ni)
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

-- 
2.43.0

