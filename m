Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4922DDF6C
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 01:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520650; cv=none; b=Edxg61X6AnmV399fW5K6B8+J+XM5KDYnOgsRE+BeitxpABZ+qZkRKD1y0LW/fGwwtaskt+OrMHp0Gcwb+b02RIJelebslIZEvRc6M65yFd5pYQQgS4sWKx1oL4unC9ufhv7T2sAiHfYVJpZscMa9yegqifZhqTPeEPsRnyYyI6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520650; c=relaxed/simple;
	bh=UkXwDzkT/wQG7OMUrFXV3fZm2SjRZv67S0OHydtLSgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PtqDSp3Ob+l41njXuLLXTaflRB3j+UunWDQqbchoRLseLSaRL7ygrs9nxhL3fwnrblrQ78+asXI1skmBMBN2CwBW+EFkMtFoxOmItj2Esr3a1YzSoi4H+sU7no853f0x/KPlsyQp54O/lJ6zALPdvig4MXnFCm+b2/AyJSOpl/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4pfKwSo; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4pfKwSo"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f6so2576665ad.0
        for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 18:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520648; x=1790125448; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eFRZ+VcH3lNsAENm0BrQXOR44hjjlhknow9YekmfEOk=;
        b=R4pfKwSoppLbkKnBEypwB/ThUy4o4QwCL6Q/Rn3Hk3axOyMvSOilyfEfZtGQrbSWLr
         TJ9bp0h6jJg9mG3tC7D+XSzjWSnl/RwuZ642TwoGCSXxn9rj7MT9yMsxrdLSvj0ejQJG
         0wiVMhRkXF26vJsLvMtSkCMRvywPg2t2gclfgV3IxfiuwijUZsKc6KEEZo37Tjn8dEuf
         ufcj+3JK99iB8I4ClgL3PFLFOU/4J5r/n/vIjg58m8zP3pkJWSCxuyWzpQrbWNB1eIQu
         NH8Iv/Pdgiel7iREMQW2AV0/gRCTNNZyXnNXoHdeXX4Z40O+WkM0OqXNhYk3xUoq5l+n
         I5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520648; x=1790125448;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFRZ+VcH3lNsAENm0BrQXOR44hjjlhknow9YekmfEOk=;
        b=x1KFQ3vCZqAbzW+Fz5nN5SErpO5zu/6TbYG3D67MH5N/C5XfWnbqezr7Pw1Z6xYS+H
         +DqreRHBoOp6BxQ4DLiNIV0zaUEQ/pIdgJPk44li8Oj9TC1Hibkj0eM335JXxzbw/zp7
         jYRsmsicKvaQpaX7uAoosUcO40yTQSinopEt6a9NP2Ihal+Meokqfp/Q7NroVdoZh/Mf
         rc2m1T2KT8QJnEpn2PU+BxsyJR7ObzCcn0a6kUk1ZG3bLBi/jc2eFTC2r7hqWsAsvhwt
         EPX0WbFUHTVIDG3dEUacHCsqsEXT1tzY+qvbp5ZFJlA9SitR7QY6WavZhpT+/5yJZiDv
         L33g==
X-Forwarded-Encrypted: i=1; AKwUvBx+76425A8Anw5TyDAbQ8KnjYpR8ssVQinf/x9irFlmpVqFndNF/CseVtl7xl16GQz0CH3L@lists.linux.dev
X-Gm-Message-State: AFuF++nk09htnY/lnGTSy5jJUWkJwSKgwCjL4Pw1+qIkbX8KbszAxD4A
	E65gIaIVhMuB63jJ1sXsJ+RCW2ryuwFTC1qQPPICZuO6YMyUXhjJUoAOY1RLrg==
X-Gm-Gg: AYBFou1zvzk8aRTR12z/1vTyNZSAtb+gu1tUw760N/bnRg2WNzZjXh3B448uz9LUy+d
	eB2MqtH0T0/IA2rh+x9tGzyUkF/YasQmiiBuVE46t1pR/YRlsNn+4zEhZqSWoC3CTZrwVN3TfBF
	Dmi4YjsJiCyy4LWM85QPj6/AbBHyY3xMZQpfc8mVTBcZfp7YEI1VMb2gy898MndFS2p2oiCWM3s
	7Ez6wnzx9boU7GoV9/4r+pG/44iS+CAxZ3kPBZWVVud4dk4dkbihHnQyvVywYQC4jd0qDyPRqGr
	7mnRR7N6vsg9JnFBEFCJyOtfN3Y+yGvaMt+tPKM5TPGN18LKjT2cGc/vdMxcTyOTwbQlpAw4UAV
	UPCBy9t694BdTmHaUie/ciBriTNYjQf/lQWZuI1281jzPeLyQCugN80L5sK9mY1wA0UKP1jOJeO
	qPiJ28cseT9+RRLU2TCRx/Xy4geGgr3ulGNMP1JVbk+kz8AnpnGtBM4ECyUVYSii+pT1kMA46VC
	1D5UBM=
X-Received: by 2002:a17:903:22c2:b0:2d9:3083:a3ac with SMTP id d9443c01a7336-2dd8e52c3aamr10362805ad.15.1789520648525;
        Tue, 15 Sep 2026 18:04:08 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fff3sm2880995ad.8.2026.09.15.18.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:04:07 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 08/10] ntfs: use sync flag for direct MFT writes
Date: Wed, 16 Sep 2026 10:03:20 +0900
Message-ID: <20260916-topic-4kn-lkml-v4-8-4f8a574ba3fb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
References: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4171; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=UkXwDzkT/wQG7OMUrFXV3fZm2SjRZv67S0OHydtLSgY=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqqeq3S+sZpgclLuWKRgpRec8HFFjbtptkz020p
 e8vUui4186JAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqnqtwAKCRA08jD6945I
 0xSZD/4kz6MaZKSRR5o1A9m0RvuqdVcwtzZDfaUr6EDuCc6RegUjAi1uX7u6/yaj8A4W1LBXLcu
 G89gCyDJA98jvraHcrYBJl8z+X3ktEOAYwrUrDCdiFAJ27sRdHBcJJkiN7wp6D98G3edybQUTEy
 A/AUZQ1HBu1JDOqKjHFZ0niCKx6x6Tyoz5m6HficT4cKwewyoiRgit43B+7J+eOR7BsXbt46uRs
 K1gUo1AVfc/KGax4uWd4KGwKJdIjkaY6IEb83yaWXJq0OxfICnqSt1SkVvQJfisHESnhnbf75fQ
 FDigOyGcWSlVxhNHmzhka5uckomxxEW9bo38f4DYTi2e+xAQ1g0dPfQAOAWJMjqzUEc5DuLpUhf
 5yFh7LY2ZnzAMxIOqYPHyjvaeU9znqcAFlTSW8784vNroRKo3cZY4mODCR2MbQ9vSOuYC2Oe4IK
 QPOWQ8DGl1CWsnTnIQ00SqCRVPHVIYXt/Ksm3OfHJfvZsHm3rNiqRtW2f7ZA+GVGEia4Pql0lJC
 Gm4lcuFWm+geekKLvPV9vJ/1Hc8N1PAGD3n8EmvgDP/bbA1Nemgd5qVmDYkzalraD3LL7tddeQ+
 7VNWF7NgskZ5ZdVxPucW72LQyFw1Svqa1tgRQfWWUzkTgdDSb+2f7FvxxslA8wWP4Umnf+sPRxl 4CfGIt5kDgx2tDw==
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
index 6379c7b39bff..1e606f65a342 100644
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

