Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E655E46F4A4
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 15:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399319; cv=none; b=Nk/RCeSlWGlcXDuQeT/ezHVeBLOj6/nJ7J9A7bzNOR46XpT8dn6P7Tooo1O/CvWKIArpagpKiVb2C8EnIHn2geYkgYLZ2Cb3mYU2D0sWAJYF8b7jyiPqQAYOmAm7LLbZTXl8+LuSDpCplWtevdhxKaBhhnrpA3zoggGbmKtRXrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399319; c=relaxed/simple;
	bh=lCYKiAZgOlE3Va/sxmA5SWy13jwbJZIuOec6uhkyZDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eeC5qN09m+mSAx9flmDfqpFB2nkJff7zAOp4KCTFmga2HBLAWstMcYraBw3N4x8GU8pZlwMppmssEwsrlvhMTs6ofNahbMokCcD/ywO+TFOFMyS6xZpueEVJnlRGD3WNRWNF2BPFff6fj0sbcHqlt3x93dnDV20up04aPKnHyOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebOOVb/R; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebOOVb/R"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so2128652a91.3
        for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 08:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399315; x=1790004115; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9iPUBr1vEs76jcJu2/McyeLNxlTtVcgj8O4lQVlwvOk=;
        b=ebOOVb/RzgtqyIoWTXl6zES/mgdHesLegFF9lbkMdcp3ic7D2OVHcZO+IwoT2R8c1q
         PDTMrJ3DDwImMkYdyb2s0ia/lyXBo9FSd2ROAywWc1zSC7LQfMStb6GZsToVEgHYMzeM
         Id4lSYeL0IRurKtEz9qdOrYC+DlpVWA+BMOI8zneWAj1gx5DceYT7KQTVLaHiNsr1GH7
         gjEsZdk9eBy/4/sBPbf+N/3Aq6mnOGbqfzoJVYMmjYUv/UmWtAb9pze55APPp6EidAd4
         8nPkckKtRgXSZ7WOB/TdHdYq1etJgqDIz2cj49IeWNecnr3QJ0nSUgpSSWKxsx3gm0pk
         g9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399315; x=1790004115;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9iPUBr1vEs76jcJu2/McyeLNxlTtVcgj8O4lQVlwvOk=;
        b=P1fffzue7zg7btoRIzZgtCxvEFXF46vWzecss9kcWw9TFyh7A/iBHRBz4UxKgszXRW
         3TcmEIYWZ9/zWkvLdFAg66CuRgoe5rQ/ypTrzKT+zpQT4I+2g+TaUQODtT9HwOItVFCI
         5RSa2n80Nas0rqJC6/RftJpZ5Mg/gSfsywt6pw5S7g2o27AVyM700JPqU1MB7617bxj6
         ExfsnElIlU5++yLP4pJmcSdgUXyJcEV8bpseDOqt1tSTqMECQ/T2t48VRaK3N/mH4Lm4
         Smf7LszcbtV2YwGGimXckMfG/cXo68iYW5iMpoJbtWpeNF68rO+wdmArHfIDdowFn4XW
         dGWw==
X-Forwarded-Encrypted: i=1; AKwUvBwQLUOARBT9bK4RmR4CLzTuh8Ps/pEvmOxJ9FJqsh+EJ3kW3hVQjP4th2vf8z96i0e/s0Vi@lists.linux.dev
X-Gm-Message-State: AFuF++mYyA3NUM+2hPJB/SDZP5sRWC1zCU5v+Bj+xLWrhvt514mqMAug
	oaZ96giHe0rqgl8Nh3McKLGT0PLKC31I3Kht4nL1IqIneFwCy/f92Y+e
X-Gm-Gg: AYBFou273ENg0w35WgdDwS6Ztym9jUcUQqR/r1WoQL6m8yDHYWQytgprTor3bNqLsbi
	ZUjIcCt3bLsmOvnz2NYdUg8LCI0Gjb9tVWi/iPhjl3/aa8837ioB9fq2DKNgzLNG9YZs5b2Tr4K
	lvrFLoxVZiLr91bnUw2OlQgs2bpY8CExY1YPNaM2d6qI8mFHoJaaCBKDUDeOwdDwqm0BS9i7JOc
	Pck+SVdt1o9kZ4KdEwxyoTgcOHG0b1k2S6KBF7ibie/F3/INTQZdLMqAdvRTppAYXmNsVTNi9r3
	kUAG4bmpyywgE4l/RVuJqw2IylUOtqAYE5eEcICifr93ip75hH7AUW4G7g2RO55rAOOi8eEIENr
	Ld+Xm2hRCTAXIP9ukO8Ps/TwoRzxUwhCyJ29iLJJ6pawnu8P/+k+/2BiDHgSC2CeEw5Y+rXBNG5
	r+xamVDTCj/aCUfGN6qGWkz9l2SCbs6i2KI39ctd9OuY2voWn9lmy1jTdHqG89sUJiuPwDOi1JN
	2uq7R3xIrlgA0oveMSoCjw=
X-Received: by 2002:a17:90b:3c08:b0:39d:f2a1:31 with SMTP id 98e67ed59e1d1-39df2a1043fmr4144827a91.17.1789399315455;
        Mon, 14 Sep 2026 08:21:55 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd6cd982sm31667a91.0.2026.09.14.08.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:21:54 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 01/10] ntfs: read MFT writeback bounds under size_lock
Date: Tue, 15 Sep 2026 00:21:30 +0900
Message-ID: <20260915-topic-4kn-lkml-v3-1-447cfa17f780@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789399242; l=1303; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=lCYKiAZgOlE3Va/sxmA5SWy13jwbJZIuOec6uhkyZDM=; b=ncOHNpKdBxGdUWf7oZdnOxgc5Rqb3pvOfQ2SXAIt7Cxh6pHEdwQg215l7DXOpSGmwy1g9KTlc UAZLJ7ulcEcBidnPqfrVY5vZ/HwKgV829pKlVw18LUSXQMZU43eYpCq
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
Content-Transfer-Encoding: 8bit

Read the MFT inode size and allocated size under the size_lock critical
section before deriving the folio writeback limits. This prevents
writeback from combining an old allocation boundary with a concurrently
updated file size while the MFT is extended.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/mft.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index a09496622c7a..19e042474df6 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -2899,9 +2899,17 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 	struct ntfs_inode *tni;
 	s64 lcn;
 	s64 vcn = ntfs_pidx_to_cluster(vol, folio->index);
-	s64 end_vcn = ntfs_bytes_to_cluster(vol, ni->allocated_size);
+	s64 end_vcn;
 	unsigned int folio_sz;
-	loff_t i_size = i_size_read(vi);
+	loff_t i_size;
+	s64 allocated_size;
+	unsigned long flags;
+
+	read_lock_irqsave(&ni->size_lock, flags);
+	i_size = i_size_read(vi);
+	allocated_size = ni->allocated_size;
+	read_unlock_irqrestore(&ni->size_lock, flags);
+	end_vcn = ntfs_bytes_to_cluster(vol, allocated_size);
 
 	ntfs_debug("Entering for inode 0x%llx, attribute type 0x%x, folio index 0x%lx.",
 			ni->mft_no, ni->type, folio->index);

-- 
2.43.0

