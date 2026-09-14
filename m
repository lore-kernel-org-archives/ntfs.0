Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6750492525
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 15:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399339; cv=none; b=Q7hwvsGe9MpDVqXW8jK+fjNIMGKJ8gHOwuyhBZ9JZtdgImDikxkewrVaNgq4Yf0JpX5N29xMm2wlheksgKU90SGGYLaNqEZrqPp0Y13dJJs6zhFgdc2afEmXRIu9A8bV8jPoFLRLOFU3gnd9ewgmRw7wCW5Qwpbrap8qMrGk2dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399339; c=relaxed/simple;
	bh=o92tqS4mko0jF9HcedzAh7fXKWcscGVql+i5mfsUPAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kzk6sZJCdYxj1Nv0qNjSaehnWLp/XsGm9wKjHfVqFJwNFpiFU/mmFs0FXHMSHX7/YxWiJvwKh19gn2S5JCi1rPKicaxqwogo/WNhjW+5IjIBvP8UFMnctJwmBhVTQJyrMGXONu/r/xSYn9X5cEYESdXVdhhR2RrRdqLs71dRbsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+UqdR+r; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+UqdR+r"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4d03f95dfso1965701a12.2
        for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 08:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399337; x=1790004137; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yE7miFzl5G9cW8ZjD3bCIcAAuf/FxDYpg/rR4bJiBQQ=;
        b=X+UqdR+rx7fOVef9iq9w01l+DiijbnOp3Pb8/fTsBNc+wEGx9l/CfJqtf5bbZEhOKl
         wpAcoL6Q3MpZh55FmFurB84XOvqv0T/qlLa6CR8VamjwiMN67xvYcwBDE+R9+Fsfc0PA
         GORfFp89o3Qw3MCq2CIKbRXo8as201Wi+Wr/XscufntpXvEzimqTKOwLZ9chuy6XV+3u
         Z5KToFIByPFaPUaC9FrF/u4vcv7zZWzdsqdsMUoTVyKZZZrTVE1BfkqjTHZ05IzBMxsM
         epsm/uSB5Lofi+3VO5epkfsoi6Wh19fUaMmDPQlyXmVmoP77/3TrxzDSQk/0+I5jK80O
         s2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399337; x=1790004137;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yE7miFzl5G9cW8ZjD3bCIcAAuf/FxDYpg/rR4bJiBQQ=;
        b=NjjcY/jInBsRQF+tHgo1SM04BKmKFH/+ZJ/QGSoJ0bEuyySJspjLnUKDhWYZ/apfrC
         XnpNoC63exgJy01CVdjrTMz6sQ7DB0Mdk6HJ+2bP81JaaTdTD5rIrHOD2CPkuVRT9bdW
         ipdEvZ6/flLnUD69BXS9rR2lJwh2uhen+MMTSwP4V3Drg6CZgu7MadmYnn3yBFMNLkG+
         PQUdX1oOxZ5cZDZTxsvRG1wKFY0QZqdaUEDNB0aG61YEZTdrryiXPEHHRCHhFwfArzrh
         G5Lvdflf257VmgOKaqQLmXKhP+T27A2W+Po1D33xV7Rlcku0gojBqgh04h7EyC3SXOuB
         Pm5Q==
X-Forwarded-Encrypted: i=1; AKwUvBylGZ6PfCNYGroHrUYkGW/LDOoOysE+PPi0I8CIAI2UZYtbkHhyJXN7R58Rwh1Ggplh+WoI@lists.linux.dev
X-Gm-Message-State: AFuF++mql3+eFHDX1n39QQxYgQaNGfQoaoLmS2lsgAa5KxK2IWHqKOdc
	2goD+FIoJWb8ZA3Vt5d29vaRRz0DtC4Wi4kqws01qDm4Y9+54QWjxKE5hYynjA==
X-Gm-Gg: AYBFou1r9q+7JKUaRVfiux/PdHh0D5Yj0gQgrGu0BGY4QOGy/Px7dkFWb8+skTnQ4UU
	Wbg57HrimxGUmOg87PtYWHNWioBlWvo4V7v1WuPFC25pqwOoK7wOpFS6My0vsugWYgw31IMJffx
	LDOYKzxt2uaftkWvOrgg7DhhI87QIN6Kpc8zIhr7hicNFAdDdGUiiWEsSeGbF7xpdKFNshZLWG2
	K+sTo/dUKFpOci5vmM0z7dlNMEI61ce1jUHOZDRbisBJG+3h3ts5eTgxyokCfpnadLq4+S8Wv2w
	ffLEnJP1CNBJmQdFCQXo19lbYIM0lbB3SUAsH34hWN/ASPYunprxDUQDDEq+dRStOcBHaF8B8Iy
	82nuf48B1kcrc7ay+jZorscFcGNW038r/5U+jEsQ2XgYf5w9D4UdqEPPYt6zCLyJU+w9AF6Q/0S
	mYEyYYHxAlZfVQ+DDiRAACvOKbZ4TjOzKCOEtRwxZF0UQdb8vzltlsjgrIXSLPI17G6TegXP5zs
	3cHo7H7w2Cip2K32HhEHPU=
X-Received: by 2002:a17:90b:510f:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39dec08deacmr6280888a91.14.1789399336794;
        Mon, 14 Sep 2026 08:22:16 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd6cd982sm31667a91.0.2026.09.14.08.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:22:15 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 08/10] ntfs: use sync flag for direct MFT writes
Date: Tue, 15 Sep 2026 00:21:37 +0900
Message-ID: <20260915-topic-4kn-lkml-v3-8-447cfa17f780@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915-topic-4kn-lkml-v3-0-447cfa17f780@gmail.com>
References: <20260915-topic-4kn-lkml-v3-0-447cfa17f780@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789399242; l=4171; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=o92tqS4mko0jF9HcedzAh7fXKWcscGVql+i5mfsUPAk=; b=Zgu4/0TznGf6BbHlMgmWCis3zKHey23HvDsZLWbKmEFnzf5UQxEKWq9znbb0bzZ9DpX+67HOT oPz4gs5VrusDneZKHyzOw11GVpV4RSadJT28b/dcUdwSYd8W7JherUr
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
Content-Transfer-Encoding: 8bit

Use the supplied sync flag for direct MFT writes instead of forcing
containing-unit writes to complete synchronously.

Pass sync=1 from ntfs_mft_record_free() so the MFT bitmap entry is not
released until the record write completes. Other direct-write callers keep
the completion mode requested by their caller.

The folio lock serializes write preparation, and PG_writeback keeps the
whole unit stable until all chained BIOs complete, so asynchronous
containing-unit writes remain safe.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/mft.c | 17 ++++++++++-------
 fs/ntfs/mft.h | 14 ++++++++------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 667f8dcd9f57..c565bec49c7d 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -670,9 +670,13 @@ static int ntfs_prepare_mft_record_io_units(struct ntfs_inode *ni,
  *
  * We only write the mft record if the ntfs inode @ni is dirty.
  *
- * On success, clean the mft record and return 0.
- * On error (specifically ENOMEM), we redirty the record so it can be retried.
- * For other errors, we mark the volume with errors.
+ * On success, clean the mft record and return 0.  On ENOMEM, redirty the
+ * record so it can be retried.  Asynchronous callers return success after
+ * redirtying while synchronous callers receive the error.  For other errors,
+ * mark the volume with errors.
+ *
+ * If @sync is false, PG_writeback keeps the folio stable and serializes later
+ * writers until the I/O completes.
  */
 int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int sync)
 {
@@ -692,8 +696,6 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 	WARN_ON(NInoAttr(ni));
 	WARN_ON(!folio_test_locked(folio));
 
-	if (vol->mft_io_unit_size > vol->mft_record_size)
-		sync = 1;
 	if (folio_test_writeback(folio))
 		folio_wait_writeback(folio);
 
@@ -803,7 +805,8 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 		ntfs_error(vol->sb,
 			"Not enough memory to write mft record. Redirtying so the write is retried later.");
 		mark_mft_record_dirty(ni);
-		err = 0;
+		if (!sync)
+			err = 0;
 	} else
 		NVolSetErrors(vol);
 	return err;
@@ -2958,7 +2961,7 @@ int ntfs_mft_record_free(struct ntfs_volume *vol, struct ntfs_inode *ni)
 	 * record to be freed is guaranteed to do it already.
 	 */
 	NInoSetDirty(ni);
-	err = write_mft_record(ni, ni_mrec, 0);
+	err = write_mft_record(ni, ni_mrec, 1);
 	if (err)
 		goto sync_rollback;
 
diff --git a/fs/ntfs/mft.h b/fs/ntfs/mft.h
index 28a79bf4c1c6..d2a31205e08c 100644
--- a/fs/ntfs/mft.h
+++ b/fs/ntfs/mft.h
@@ -53,17 +53,19 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
  * @sync:	if true, wait for i/o completion
  *
  * This is just a wrapper for write_mft_record_nolock() (see mft.c), which
- * locks the folio for the duration of the write.  The folio lock prevents
- * races between writing the mft record via the dirty inode code paths and via
- * page cache writeback or between neighbouring mft records residing in the
- * same folio.
+ * locks the folio while preparing the write.  write_mft_record_nolock() waits
+ * for prior folio writeback before modifying the folio and keeps PG_writeback
+ * set until the submitted I/O completes.  Together these serialize dirty
+ * inode writes, page cache writeback, and neighbouring mft record writes in
+ * the same folio.
  *
  * Locking the page also serializes us against ->read_folio() if the page is not
  * uptodate.
  *
  * On success, clean the mft record and return 0.  On allocation failure,
- * redirty the record for retry and return 0.  On other errors, return -errno
- * and mark the volume with errors.
+ * redirty the record for retry.  Asynchronous callers return 0 after
+ * redirtying, while synchronous callers receive -ENOMEM.  On other errors,
+ * return -errno and mark the volume with errors.
  */
 static inline int write_mft_record(struct ntfs_inode *ni, struct mft_record *m, int sync)
 {

-- 
2.43.0

