Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C81A38DC72
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230128; cv=none; b=X/GN1cQqrGis8m4CMc+LOMHvitmfyB8YPVfZZkE8TuZnHfJvTcmJqAZa+CazDdmFZx+B84DLVgP1B+6AuiRXivy5CceLVi0FAGftFOvaVm4Dh2I+tOK+qfq1EfpASg5bHx5ey+WYaN14MBjdX2TKUIwMJXokXAQ4MTA/SOroL0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230128; c=relaxed/simple;
	bh=94XheV0dwW46YQfAE9ZQ5l5ZfUx/69JvNtSom3ocRj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nUt5Ji4ZfzUHXUL+UpoKD59ZgTIRWHpG2aw785VdCrWhzyadB/s4Egp13hXtZtqdtj9GEspstJQNBhpFqoDQoXHu7dgTzMdBB2WKec7rXuHA1+3rmsKsWXLvyCcHQ8HyYkgv2GzQravFZAY4g0TJvGgQUpL0WgZoI8xEme941gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OI/HEQU2; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI/HEQU2"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so410067a12.0
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230127; x=1789834927; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WcIb+dPw5q11ctHBN9cCSlyM1bEHafEkVD9mxe2hjK0=;
        b=OI/HEQU2N7jKfkeleE1cYYI54GG2f02hDo5nGY8g+AmtzY6E0DXWCpOIXsjtiYIYWk
         2q+VVrcmbzA9D3oFRVYSvlLYjxcClswxoQzK6wbxiHqKKZmSHEv6OOmmMFOXsrboBhP/
         BZQlqMStKTEpl5RmWQFmircwB4afzhNy4GXkHrhspoP3D8AcpmRJQ+5EKNksS7KzkUUv
         zoJQMZxZCv7crkb4T3Uvt1adF0TzCipD9zxGF5A88YYmRN9I6kfASVxYtbnnMNnqS34T
         7Zb8bNir7xkTKpH0xVgx7rjNFTxK9jddCcBLa7yMS49K3jIkGhAf4+zoJ1D7OtLJwmCP
         kx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230127; x=1789834927;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WcIb+dPw5q11ctHBN9cCSlyM1bEHafEkVD9mxe2hjK0=;
        b=HYcxaRhHcIEyF3ejH4wAZQsM32pcwvWLPmpGdQ+jX7A13Lns+Ocv9WZPlNvWEDLj0/
         qrnhGXJykcDhkbFQ1Mhf5UEgsg+BysuRAmx2RJ/twndlUKmdxWbACRTBPlQ3Im/SRVgk
         pB1r07geRBKItETWzt2hrJow1WTTIcsgtyVgWeGiuJ3ZVr8ctZHONKPgybQDeDHgeJvB
         IOVW0xU1vVEfgVsdLPDMB905sRUYf04SIrdB9n6VmhQBDA73U5WNV+VXcOAPBMxCsiIT
         06xwxHygUGS0NhBwyumraz83m6cBjkD9HfRCEbRwKnw60ppI93nyb6KFYk8NORBzIr4C
         FNpw==
X-Forwarded-Encrypted: i=1; AKwUvBxawDyNZgm5ofp0Geb4lwHsQJ3Z0X6kCgjnSVbg86f7O/cRzTntTtgV5zWCoPBHFD/tIIbi@lists.linux.dev
X-Gm-Message-State: AFuF++k+uhDal+SYdsTGsqqBU6Yqp65luujEUcjT/18XkxIcT3a6WBAK
	vH0r9pO5XSA4hyq4PN8Q/GNEihh62L/v1RQ42y/NUcliyQlQebUeoTBl
X-Gm-Gg: AYBFou3qbrRd+JA8prBvbub/1Xu9BaJJTbPkpzCX34bxboQ7/a08A5ZA54LkuosNbUM
	r/HRroQmkvtVVlntIDNuGLoouM9NG59YVlR6K9DNoUKyAyq/WIZNWJpP8I0tl2ISDoQ93Zf0yEN
	d7fHCmAZ1c42G/fkgVcCIdtryB95jNmqmXJ1yjNGHtpU/GmKOCR8IS0AZUaJ8ZZS72jXySebaXr
	gdYWFF5qlO/R08jaKl5JXDMrjt7M430eSxxh7VguCl3JLz8JZZq3VUmgijlLZMv/7kll2Kirhlo
	/Kh49eH+l1JRkH+xIkUQgHzZc55SGcqbFvQq6OPsKCG7ajv/dSmL49x+LiAMdHEhHM6fxwUSZso
	JXlgzibub/kWgg+yI2F8vWqEMNWkZ7kqTmwMZzQP/dTw5P595xziK+tyvl+O6QLNEuxoDlvDwGz
	to4y/IKofEgAWaG1xCltNnw9lsk79s9YUSpmaYf7DDUvBwVfFVUqyZmIauG2Ooea2LmMBvZB4FG
	XrKL/krKSogBCW8IAXjp/8=
X-Received: by 2002:a17:90b:1f87:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-39dbc6a0847mr6366281a91.13.1789230126835;
        Sat, 12 Sep 2026 09:22:06 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b21sm10804999a91.13.2026.09.12.09.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 09:22:06 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2 08/10] ntfs: use sync flag for direct MFT writes
Date: Sun, 13 Sep 2026 01:21:20 +0900
Message-ID: <20260913-topic-4kn-lkml-v2-8-2bc455e81635@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913-topic-4kn-lkml-v2-0-2bc455e81635@gmail.com>
References: <20260913-topic-4kn-lkml-v2-0-2bc455e81635@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789229949; l=4171; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=94XheV0dwW46YQfAE9ZQ5l5ZfUx/69JvNtSom3ocRj8=; b=/QK631Uhb34wbFnlBYg7tPFnhgviQR4GMSM4iqEcKY5VtEZmPEr8BjWWt9v098QRqXypdn93v kjVjzBMEGF8BfqKpRuXdsDABGLYpEguT5eIKUyVqLHY9vJIyD4+arpQ
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
index 9b9ad78575db..fbfeec87d3bc 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -669,9 +669,13 @@ static int ntfs_prepare_mft_record_io_units(struct ntfs_inode *ni,
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
@@ -691,8 +695,6 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 	WARN_ON(NInoAttr(ni));
 	WARN_ON(!folio_test_locked(folio));
 
-	if (vol->mft_io_unit_size > vol->mft_record_size)
-		sync = 1;
 	if (folio_test_writeback(folio))
 		folio_wait_writeback(folio);
 
@@ -802,7 +804,8 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 		ntfs_error(vol->sb,
 			"Not enough memory to write mft record. Redirtying so the write is retried later.");
 		mark_mft_record_dirty(ni);
-		err = 0;
+		if (!sync)
+			err = 0;
 	} else
 		NVolSetErrors(vol);
 	return err;
@@ -2706,7 +2709,7 @@ int ntfs_mft_record_free(struct ntfs_volume *vol, struct ntfs_inode *ni)
 	 * record to be freed is guaranteed to do it already.
 	 */
 	NInoSetDirty(ni);
-	err = write_mft_record(ni, ni_mrec, 0);
+	err = write_mft_record(ni, ni_mrec, 1);
 	if (err)
 		goto sync_rollback;
 
diff --git a/fs/ntfs/mft.h b/fs/ntfs/mft.h
index 5a03e2775627..18699faa9b6e 100644
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

