Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387AE33B975
	for <ntfs@lists.linux.dev>; Thu, 10 Sep 2026 09:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033621; cv=none; b=cwY/dnCGQuFGoX0RHsjTEG6iAILT3kBujuxzGGgZNgjeLsvXpnyLN/l059Lo6ncYY/hcTE93YjQt1KiJBodPmznBAH+kcmJsL45ZdkAcruRkOUPIF+qV1XaIs69hMk5vNimQRkDa7QWD2+qAEfCLQDRs5A7T5xM6fDl2IHgGpLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033621; c=relaxed/simple;
	bh=xQlpAEWADuAEsz2ZdcoGLWQovR/ADhO+8SPpa1+LJyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PRsH+0d8tNsshsNdU+33bpcAv2pk4zW6+Bgef71iLBMCm5Xl01zI8yncqAoCI63YhcfNk4upFf/G6vvEsFxvn+fX1SOfHYdRsDoHgCfpeZBMQG/JHicQrPQYDYdYcgKuVq+sMq4LJQyRAuseq0YNrV0J5LIkevycTOy/2P5Ed18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1uZb+RM; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1uZb+RM"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2dd020a2e44so14981765ad.1
        for <ntfs@lists.linux.dev>; Thu, 10 Sep 2026 02:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789033614; x=1789638414; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3fZ+s8FATLTNH7YPzj7wB/P7btZHb5t7ZRH1gWaT3o=;
        b=R1uZb+RMlAsJFquTBTRZ0CKayymab4wYZvPqg0KvjsI50Yt8MgEVKyMVeS+UZKDqpp
         oVxNlYOwXBpvfFs87xBN+qhW+0zF6IW9QGBi9q7NsoJRlORpYxi5hmvtul1zJxa/n4JQ
         bt4fEDNlF2xXaVR8p2tyQKdSPkNaa9XcK5cFcfrnJhWJG6UUz7X5PHMOyfH8SwJMtfHk
         dAZlzUzyNeXcIC+D/hNiYBvyOEYsbt18fubq6JU/R+yRFBH7qSddyPgCqOPtCsqZG50T
         dwd/BcJGC0FWBeslM2rw249iccwuFlBEr4IW6BpUCcXG0QW3zSupAB8e/ODKgR3hU5aA
         FKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033614; x=1789638414;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3fZ+s8FATLTNH7YPzj7wB/P7btZHb5t7ZRH1gWaT3o=;
        b=G+agrHgmfe6xKI5JrLrpH/xbpOiRm8N0D1iWwXnGs2LeYhv/FU8yy3JzLVqF5xWwtE
         z1HlqPm2LXzgxL6fJZ2c5AGxSzZvkmNmbFcNQTj7k5CJgeKsKVLRkJfB4ZBgwcqv4Msr
         QgMl47ctl3NfPkSnwddWteoi8S0usR2nC4p/lGQpC05o8RU0o5OyISTC7hKEcZB/nYDY
         A/xXuN8ThFmNzsSakUePQKWxwGRFUenrhh2e3qzMcsL+p0bhv1VddbTvLfmd39fsKjx3
         8ooz0IjyT8MQuyxb3i9Yyr/2Y2LVN20MbDxe6C0oGrEat4lkrckrw2oraS+godZJLIhK
         0HZw==
X-Forwarded-Encrypted: i=1; AKwUvByB1bUypgcSsnv3pagkOhIN1h/gSnwzHRNazVp+dIPzmiXSblM1T+OU38YcHbuNBpB/3w1P@lists.linux.dev
X-Gm-Message-State: AFuF++kf0sKhUCIW62YVaE6KsPlzlN/gsOYJL+Ztcl0fm7q4QSxoEUKB
	Xw3mp8G7kEGOF6QqLf4gvJ6gbijqkJsuLKpB44GSNL+0Qkt0JndTtGNU
X-Gm-Gg: AYBFou1TOQjrmwzolWEr4FZCrwrBIm9WIIYcc3AdMk5gPRDDQkqf1eko96qTVFYwGIR
	GqC/Qt8eR0du1dWWlP8Kx4dDI/JaoC8mkKVKtq840rUzadGVwYNJ3AEH6fG1+gackehtvWKm5V8
	PYfPtgP2ViiI7UWsngGs1xZnaLwyAb6FOiHWpxaAieq085rjqNX2XUzI/+T9jGQydwAgwrAz+sJ
	NDqBIiq7VCbPREd58IJEzd+uy9jimeU8JdS6b1YzWD2OwGQJsQW+zscJHOE490ZRvgMsiAqPOyo
	BJTOYrQap4Beh5dYWWcnfUPwIrXCvC2R62lDwFJEPC+jTBH5fYZ8GiYJ8Y8OTIMHHQ9Gju9pm+z
	927xP/JPiHnWVr2lqM2v+i3S7SRpTZZw9lbz4HuSLWB4zj+IiMZjdk0LuuxIMzbbYc80V5njNDO
	4V3EIazs65spAxwxybKSYVy7GIYB+bLn+KShIVJzRzEwISCsGClYdQ3J7ts7UjJPCsbKksHrnHd
	I6TFQ==
X-Received: by 2002:a17:902:e804:b0:2d6:ff5f:eeda with SMTP id d9443c01a7336-2db1256cfa1mr582576405ad.6.1789033613752;
        Thu, 10 Sep 2026 02:46:53 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14841054sm86827285ad.3.2026.09.10.02.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:46:53 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 8/8] ntfs: use sync flag for direct MFT writes
Date: Thu, 10 Sep 2026 18:46:10 +0900
Message-ID: <20260910-fix-4kn-lkml-series-v2-v1-8-f10a09fc0176@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910-fix-4kn-lkml-series-v2-v1-0-f10a09fc0176@gmail.com>
References: <20260910-fix-4kn-lkml-series-v2-v1-0-f10a09fc0176@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3663; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=xQlpAEWADuAEsz2ZdcoGLWQovR/ADhO+8SPpa1+LJyQ=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqonw8Rjg8lWETmwSDtcGmBSuCJjPFEOa+D8AVq
 pFLH5/aoD+JAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqJ8PAAKCRA08jD6945I
 01uJEADKN2nBpk+AA56hpcW6ZYbKs2uWadW3x7EjC8kFogJY7sXmhJoSjE9NBLtzTvGvxk+tooq
 mWpCDo2SbuMWaaqFieG9YV4+UuUJuySSqTalnhxVQOhDWgQQXDHXYw4wihGT0FWxPL7lVrftGlV
 +D5clHpmDSCxav6uA0zRHWqEyXDwlSh0r8f1DQ/ABVqHJDqB6q4rYfQcHrVtd8f/X8NynRqPDI5
 wtF3DYlea233QuSdOZNxhwDpw2BrdFaqspjVkpT8eFmdKEFVZ2kdaJ7bhDaJJmLYB1DZnakCJi6
 lCZxAO7R+76DROzAaIxXta5rk4v33s4VsEYx4TsZOdW6OjmD5jt4KdfYORh6SAwecz/zOzPy7Kp
 zMsFEDODY/fdo+iui2oK20vvP74qo/91kog5DHsV3JGBnBOJ8rwLz5syctqdpHKRk27maQvqL3n
 tOnOTwm9KsCCM4xiIzTSSC8HRZzAdqtRlNxutaDtBdmo7+PJyVX09C1aQZnL9AlnWTOatxo68Vq
 SXs0Wv0dAL1NjaPS7rQTVGq53leDvmg+s5aX9U1th93rgSmS3Qd57yT6qlIWJjOOctUftZhGgJE
 c0kaioI6+e3o5aStJ3wIcXkQLy23N3OdbQxVlUnapE3V8+vqMLQvMFQmAScpdIAxsYYn7qXw81h Ci2o+CzORAeY0Kg==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
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
 fs/ntfs/mft.h |  9 +++++----
 2 files changed, 15 insertions(+), 11 deletions(-)

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
index 28a79bf4c1c6..ab5b3824d3fc 100644
--- a/fs/ntfs/mft.h
+++ b/fs/ntfs/mft.h
@@ -53,10 +53,11 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
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

-- 
2.43.0

