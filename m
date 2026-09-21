Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46463D3B3
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 00:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950032; cv=none; b=C72wmZmociAgp7KqUy9Hgjpblc0ejlraSYbDDL/G0JgXkz7tcQma0k6owPXTqVnxkxtTz9VWxRkGgg1kMhvW79X2P8NlWdBElFIijz6ivT2hFiFBr201gMsExzIkdt66hVQaBMc+ycBZc8yiDKfdYlExk8N64jK1s19OY1VnQKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950032; c=relaxed/simple;
	bh=ykhN77uxVtcJlYvkS/hSNgBaznYyNLw9byRjoSBeVlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dPhwCm4GeO/Z1Ar7f/R3xmR6CUTs0/EboK8lYvBaFMyeDt7XDkAd208TkRuFtiaKKuTnOHVorX5GxB6yqkcNR/IBECALdqaG32BU6PBfWGj8FhipME7lHCrKskv7BoaGZ+M843e4NreRKz0E+W8eTHPVSxR54wF3KCFcqg/1ydw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sOYUHl3F; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sOYUHl3F"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85a4329731cso1819808b3a.3
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 17:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950030; x=1790554830; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K/LIFiQpHWyt1gAkt6+28BTGQw+fyG/MH7rGPuthdjc=;
        b=sOYUHl3FSbjr07i9Vysjg28vGe5voXKh4SiQ/t1Q275quH9hQiRnv+zZaZRwPXlTDK
         maWdneKQZYtI+zIVoONWivWk8MSrPdVoNZqnm7aVThyRvle+if+1ZJDQfVTZbYW35HmB
         ot+2kd0m1ayizPMy78w87+6+d8LkvC+w11tFu8EfA1fXWceMI3V4Uf6popBZYIoVwLTB
         efPqMf5WtsgtKpvs1cAx/iLpVRdV7F59TFkPLBgtOSQCNJIQhMZCKGA0FvZu+dfqxQ2G
         +2Iwg0tnSlAWWya/Bxs7rtHEH8oV2KsGH2cv2blUkBV236II1tjCRmocZiqu8giEN37L
         3SVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950030; x=1790554830;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/LIFiQpHWyt1gAkt6+28BTGQw+fyG/MH7rGPuthdjc=;
        b=GLXnnH0lHMqetrfLPSQCOd78Q6Cvsvz2Ii6UavNRRpHcxzKpuIdsKliZN7gpBFNcnB
         mDrTrJNSIUAkVfTaU0MTake1vjTWmLJUXT7fwittTtRMau9IHc1zNJMByI0Pl8WuOjkO
         4wXkjmmVBxc5jfsQ3ddNY0G/47N3FTktajbUInVe+13s6Gpy/KlAFBTnTR30MBN7cOsH
         HHOAXBs6xSw5V6uCWK8/FgxYw7lZiVAQ7NpKjC3z9s0+WZN2oZ9dJEY5Un4JNncdITHM
         ekPJWr2QuA9BDwHkAGIjlTCRexrPgDo/jI+VkU2WgB0cDASQs9yx0Kayk13c/msiVSx+
         w64Q==
X-Forwarded-Encrypted: i=1; AKwUvBzecUS0mF0ldzMu4uyiCLW2Ud71JJD0sJmzyA5rSMCxZSDJHsBBnkIBWRUNSc7n52yAFt+n@lists.linux.dev
X-Gm-Message-State: AFuF++mYVR7W2X13unOhbu1aHd39UMtXU2CDRJZxhCT6mZSC/YvFbEFW
	x4SodhbWUGn4HB5/ImDN3XA+DxihhH4BNFA/zP1D3ot2ROJVhxWP+kuUg9qdHg==
X-Gm-Gg: AYBFou3Z0A5viYbRLOOoSn4UeELi+dmbVB0VnjN5/ABKjkI5MWKmrJdVUEnho4/aRgK
	mHHn9Bp7STTnVQSF5aEzEYnGATt/XGn5PaCnsiEd6s36XyEeqaabYSpKnpOjtVN7yPr44hCYIlG
	f5k2V9nZh258UieLeCMNuqvR52BAd7ASoSEplame3wAJFzg7NBSK+7HCFgSe3tYWyt4/dKLdHZ4
	H6Fj+TZIUXDYXNVUc+oXV+VbuCk7IL8zkfjlFGZgLl1InvwoZGSHF/sjyJEjjsW1VqF559Xr6k9
	9jqpONNf+phZ+aYbf1prUB1YAnT9a1TGSB8SzK5HecbrlWn66/Nm/mBQ6sP2awBdVSDXCm7c3pc
	kGiYFZ1OmYcGGeVJdGQt24eEseW1VQ/p3UdftZmi1WhrMRUAyqxf4KwkBHBkSYlJ4RExKJZqxti
	xIlxk6blfhRCEpY+146e4YN5XEmuf4DXnqFkMZT3uzGKWeoQMPwMFfNC+DLelWeDR1eGFVEHKNy
	Q0LXg==
X-Received: by 2002:a05:6a00:3002:b0:871:2152:980a with SMTP id d2e1a72fcca58-874df800890mr12177695b3a.25.1789950029937;
        Sun, 20 Sep 2026 17:20:29 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2289557b3a.21.2026.09.20.17.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 17:20:28 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v5 08/10] ntfs: use sync flag for direct MFT writes
Date: Mon, 21 Sep 2026 09:19:47 +0900
Message-ID: <20260921-topic-4kn-lkml-v5-8-938afe402cd0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
References: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4171; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=ykhN77uxVtcJlYvkS/hSNgBaznYyNLw9byRjoSBeVlE=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsHf1AophYhD7Sbr8LkKeEIW3uTq4MT4trqJZh
 7cUSqM5Dl6JAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarB39QAKCRA08jD6945I
 01+gD/96GKoh0dESQPkVIVVBHsZuTyEYCnqt1JdJZ76Ghn62I/xxf+Ycd10aY9DYccEgYcubca0
 jU4BIQ5Cm05BpctyI/+aSaYHmCmaC9qIw82HsOyv2Xc9GZtwGdlJfVoDcgia4qWKmbn+XrPvhJj
 PbHBgOAjQhbrd4bqpHn2Y/+zWUu3/ulvJQEeILGVWrlHRPdgWM5b3cPKC8DoXzWN4T8d8ADXFun
 y3qWAwq/2Mo/t7I7CF5JbuGgOMl4Ool76Qt+Xz2D0ceZVnii5oCOpOz4SiAUvNol7PKIfQ7Byxp
 t/K/pPmQGV9kh4CxgaJXPv+mpssc+A3NkfS4z6953Huu1LrAiNXEt5CbS/Ieh0lHcZ+NXMuXjPG
 W4RqyismUzRhfoPsJkWXKeJLwDVNAJ6+MwOR4uM0PGZAHS7ncl7fmRotOmm19XGimx/IK2uKsVD
 GCO7FjyiffodvUirJj6F2Ctk9xvEEoCfdNAn5O3xOtAoOIq5Q7e5jV4jy9yzv0j3ntJq7I/WnCs
 aZXQ1ydjB6wvnfK4gx1BaRgCCRVZm5ERO+8bexT4+DvryhSZtzAY23G7aKdSb38vG7pJX4/v+Jl
 4+O1lqpVO1HuesipAhvzEVw5/GZTzNOfngo6z9Cy4N/US19S5dlsgq8eGVL1POfZQLD3sYVXO8X 5VnGoOjxp1AYloQ==
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
 fs/ntfs/mft.h | 14 ++++++++------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 77acc26a85d9..8bb8b4085c8b 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -671,9 +671,13 @@ static int ntfs_prepare_mft_record_io_units(struct ntfs_inode *ni,
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
@@ -693,8 +697,6 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 	WARN_ON(NInoAttr(ni));
 	WARN_ON(!folio_test_locked(folio));
 
-	if (vol->mft_io_unit_size > vol->mft_record_size)
-		sync = 1;
 	if (folio_test_writeback(folio))
 		folio_wait_writeback(folio);
 
@@ -804,7 +806,8 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 		ntfs_error(vol->sb,
 			"Not enough memory to write mft record. Redirtying so the write is retried later.");
 		mark_mft_record_dirty(ni);
-		err = 0;
+		if (!sync)
+			err = 0;
 	} else
 		NVolSetErrors(vol);
 	return err;
@@ -2959,7 +2962,7 @@ int ntfs_mft_record_free(struct ntfs_volume *vol, struct ntfs_inode *ni)
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

