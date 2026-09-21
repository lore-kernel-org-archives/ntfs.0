Received: from mail-pj2-f15.google.com (mail-pj2-f15.google.com [74.125.227.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41131376A10
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 06:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973091; cv=none; b=G2yJ0u3vL7he9OBWD94PNUl4vqT4DLnCnyqDCP7FkoUmtFw3dDuLyuRVvlMG7JmuXbO/w2RGMw4jUJe7qo+n9TqvWJR2UgJQXt+CFmQiGvU0ZG8fydKyb7+aUi+jjI1+5ypbUDrWu8l0veObpAVXV2YiDrDEOLec+d2iMx4YJeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973091; c=relaxed/simple;
	bh=6+Vzfg/GduIin7/5m4xn5OK2SnTb/0a4r/xA6hqLjQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e/cFnAMqXr0SQpHiuDOXBQ5Ckx0/RoHP3H7nIZ7zYftm4ga5hKF4ESKEbtdJojZ+0j2kl7E0eCxMEwiiVWvK8V2Y47fISX+t9V4dK72FllTpmLYS9ciQGMOXBzaV7lkh//P0k98673hifazdT351eUYvts5rU2riP+4DeMHn1vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sPY578de; arc=none smtp.client-ip=74.125.227.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sPY578de"
Received: by mail-pj2-f15.google.com with SMTP id d9443c01a7336-2d747f01363so21488055ad.2
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 23:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789973089; x=1790577889; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7VlunNSydF3cPMtcESICoNXHj0wiEgOPpzymHEy2drs=;
        b=sPY578deWX1h3VJQP64LbWb708kFoPBQbAPulmHzyO6oc+k0g1Bfs5zpuhpvi8DLBz
         F7EeKlx9XbF6k6j2uv8HAdtrlxe6uSzcb+GLkziaQVb55Y47edZFNplofzb4kNCPsgeR
         TLMrRyI2o31mXMt5scXjUKaLVaYFgHuq0wvp2XbtAmXKJa+kqu/SpVXQVbU8gb6U3308
         V+DNJjimGLaho6lTC8IFy5YmnlGT6L2ta4x17bynghrbRPzlLJHS8zwXM9RqaiYl2vGK
         qftvZibNq4I1uKNtdF0x5PLwHO6FSvp9Eh+H+ISkrB+WEAky5gWaoy3C0Ekg2qc7TcPH
         C+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973089; x=1790577889;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VlunNSydF3cPMtcESICoNXHj0wiEgOPpzymHEy2drs=;
        b=c8ASm8xZV5PuWwKx0myZWWXXvlYy8uXpOUayYDT/6zhAY9vk0TBH9dkuwXkRKIx8gb
         Jr1e6f5d2U/7Eix9pl1IA5WaQWvqDy0abWmCWkhzElS89lg669uH4RP50aLjBAIiLR2N
         9HUB2SLpzqBZbg+UxSabukMjYOMbIjKn5uvw3/VduVFzSBYN/1ps7Uab6fpbN7hlYaam
         WoNwZrGzEB7Bgs6jp+2xkNCRsx871xcYNkn2LbWo3hToMk39Jl7tPyq6flMr6xEV566I
         ePEomnTbIRPDvoRcI09CbnGwdCHI9iW/4YggieUaRMlbNWceBImXq4b0fUseI+9wtvK5
         EWkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCy2w22pGNba+SnFB5ceno2uzk/H2vRaWzMx5eec39DITE62kjxgkTTccZUvcgzk07xSut@lists.linux.dev
X-Gm-Message-State: AFuF++k4BnS0ChGXkYOM82lnotAZh9vXnJyVSTssAFsXHI2grLsd+HTp
	L4E43kcz3M+RVY/IV0/0omrd39WGqK02AB7VeOOjKyeUS0+mj/Dcq0+t
X-Gm-Gg: AYBFou2e0uisLGWsth38ZXPcXpURT+NNlUBvo8LcotBMRSnOV9wKo5vUR/8PMVFo1FO
	/hv63G3/c1YR79PVsbUtV7YOdWQrQW/BdFJjN3tIb92A+Ovz/+YCxP+0JGpeYNAJXjsMCLnTgNq
	Ld5ppjUnORQXtt8Oiin9CAZK4UrXwirT+wz7IyPtml6MYgMq9ixDSAgOvmEe/leQn4psbPUy/E5
	gBNevO1sASuy3yYpdBvne/wh2as433U+5yCOyZDsb/tVV/uwsKYd5n3Fwdz8gUgsufIb5jQkEy9
	9q3UtblSyK9GlWx/tMOICTgG/qDAu0ufJqRw3CR5jvc62seJFsuaf1htDkNEVNAAeH5BzsvC8s0
	oFl+RFithE89nbSONF1cc3vXYNUbLcOduCp3vle5pkaHv7WJ6YQ3jjUASt2fqYMQGo12jcdPJ7J
	z+361KP1f6PNlA/CHejleO24KjM5rZYjzniWofYY24bj1Jxu81tLV9vpToclr7ghpJweQ7nJ1R5
	5IU0A==
X-Received: by 2002:a17:902:ccca:b0:2dd:ad74:ac7e with SMTP id d9443c01a7336-2ddb1ba3a53mr152109525ad.25.1789973089413;
        Sun, 20 Sep 2026 23:44:49 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc180395fsm28097345ad.81.2026.09.20.23.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:44:47 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v6 08/10] ntfs: use sync flag for direct MFT writes
Date: Mon, 21 Sep 2026 15:44:10 +0900
Message-ID: <20260921-topic-4kn-lkml-v6-8-75069f590b22@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921-topic-4kn-lkml-v6-0-75069f590b22@gmail.com>
References: <20260921-topic-4kn-lkml-v6-0-75069f590b22@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4252; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=6+Vzfg/GduIin7/5m4xn5OK2SnTb/0a4r/xA6hqLjQM=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsNIMm4/CEAXnRRHNt7lr5WsqLm37keFF81WWl
 iikYeVEQZyJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarDSDAAKCRA08jD6945I
 09tcD/984mP1eEIdhBZe4k9r7TZyzWS+dqbdlsDMODI1VpxOY+34TUuW2EAMG0l5Xdbq/QS+a46
 c40l+AIaddwEH+RZnru8pW7qf/0cLNZH3D57HG6g30lRNDpESSj9zPvLLlXvqPR0jnufMErllzS
 fD182bmikOFDhZWIZYnLaB+WT4nbAoHVdasMb+foaW+sJesCgdhG7sXiCcdk7R/ZPE0C/lVreRF
 IwIV0lTycSWnJCQztAoqhrYgjyKa6VuN7XyNprnbUchhDDFkY9WskX2a6uguDKTvMuko+d5GkDG
 2qQg0QvE357Og6xOi18+cdAGr0znQ262pYVhSZQv0y5Z8bxCVeYcvdREDtI9iLGjKp0u10Lg/o1
 RSO348mmqkPKjHoLAt+U45hAz5FieMtFHxWXDBlPBex8OIqNcekAnyYUPLzsqvqF9HdaPzZuNks
 /o0LhmYkVmzfprpLKNrRL71NonVMieFIOt3nt/kKU91WXGxYsYT1i7Oshg5Y5vLWk8rJyE3Z2p+
 MAx9HbiqvF2X9iurnt7I32QXdzY/rtFS/YPNQxzONpkvlNAWHYEF18hzOBXEJwegtJSAw7nJT3W
 ib+VPqwOiooWyjmDhGD2kC0YaryP8gY16WJ4iGOEAnA0g55YYLziwIxsAhCpx9wuX6CFuMxKfAe lkb2U6gx6vBJJAg==
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

Fixes: 115380f9a2f9 ("ntfs: update mft operations")
Cc: stable@vger.kernel.org
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

