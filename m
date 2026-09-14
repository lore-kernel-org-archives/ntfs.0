Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798CF469856
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 15:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399343; cv=none; b=Ju1oeup3lF/AHRoeYeOAX0gfROcp26meKccWdr/LrxFLkvd/CZf6wrblg+UV7bdBbVcK8TrdCXWAlQ4XfvXBTchguIc97kYobG6jvQ30TJ8IvamJWusoO6xp3mXkXIiSu9gDFj3j9YjzHky00mhCuYbEQetTW8u5q/yd6xjW7vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399343; c=relaxed/simple;
	bh=Y8aqOvxwysux/OqY+n9Oq5AbefWnqKe5itlF4eAnDrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mLp1lT6pSjtszrJ9oD1YTjnwChbX6/PdozpS9AwFwAVAndFO662T4HK+1VEHyy4TpxWu5RHRtyeufSKm7fPSezJhPti3IaEjpxtSXc2gK8E3GQS2kyHQtmzG04/UWgj2VhozBG8p9KIGibWkBfNS7O6BLJFPiuIDc2fGt3CqANQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnxTyQ2p; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnxTyQ2p"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so1623952a91.2
        for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 08:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399342; x=1790004142; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i4Owxq5xFlksuYFwwNYWHIP/gBOk1flMgdq5mmTd6bc=;
        b=qnxTyQ2pEKRTIMNMPqy/ipzvu3QiyUN1oilFGAXOHRQebwgP0NQ6Jt95FMUKDA6BhQ
         F9VaQDd2PJl/s2GkAO2vIQuqMB+D9b6MUhlFbPxcUrgC4vCTJLPGJ9/CJ+bOf+JFexln
         rRHVdWihTbYnhxz+d573yPjHwcAHLElPNJIzdRDWJdXJE0PuMIZ3CbjdTJI3ojJ21eVt
         bh2akLe7lAKmDYQnb6AWg5WWvM8Hm0w8ImvobG7TRtTXNSSxEi1ctj/OqUdDe9x5CbXM
         8aCCnQ0UVs/CN8+mfAD1H7/+7o8NpzAIgvmdqtuJ+eiEEfNdhhxaWmtD9Cf2xajuGyFB
         BNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399342; x=1790004142;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4Owxq5xFlksuYFwwNYWHIP/gBOk1flMgdq5mmTd6bc=;
        b=A/eiC8DjsUVYeeAg6AOGgW9OOaqCEKvv3XQlznP6qSvRrrfiHWnl70Emm7sx3oZfuS
         AEA8l6jV0MZdJprYYhr7awteAQ0YnIkOgQtHQcNi8ZVI+gbAfGVVHrpRzG2VJvqno4YK
         xyxP2DDoPfUsvWIEWej/qNLna24YONNean4BdeBOEMwVAcA5ZsuZCcne8vNyyQtK8fOH
         z6qwYUtVQXPm8318YDiHUGtJL1JKXSP/A/P8GkKH23CQLJ7FB4rXsdsrFPVA+cT9a3gb
         uWyWpbh4KcEObyCcQz9QGy4WMhpcSlVSfrJhRQ1mpKFJ/RjFdDD7TjpOx0XflPTmKU4G
         JnHg==
X-Forwarded-Encrypted: i=1; AKwUvBzRaDfLCj6LX7I0Eg33DL9VINi7nQ47bD2ovOJFCtZ1V5N7mvsqumqM7fYM647Zwm5bew0h@lists.linux.dev
X-Gm-Message-State: AFuF++kTxAllOa6JDu5bYkpxTT+zFExKy83fPjudDnEqzlSej10QNQZn
	/yY9ZFdjQAFtSEWF9ZwPO8xvGiG3byQ84lK9n9LLo/rfQZdvSVOLRMdO
X-Gm-Gg: AYBFou2gsPFTVHclboAcVB4AiF4MtFEP8sfkC37yEQQonPXiY0m3vwc4682viQMXQ0T
	4oLw2kaCW16cNIOMH1I7/CYvJqbp0S7/RCgaf5WqjlNls29A/FP6gsBE8CuGZRV4L3Arwck15WT
	PcXNuJ8I3PccaxduxSEFeSF9H09+Vjb6YdFGzrN5z0xKhs6aqlSeGrui94/SQGTP1j8fEItPMV+
	Fuy1/DCu6JvVu9YIS6IOpI3/XWd5PflkAH0tquM6jE/mzURgctcXniHnBa3uKBEkuZzgLG8firf
	43Sh2qKUUZbmR1rz0+KQp4YrslPFUjkTxkg3Ubo49nOZdRM/ZkENrG3G7h2eDVceFYP2hNfHHrx
	OOEnO4X9NHIO3gj+nItXpeztLCAwJ9WsnAUoiUSQAxfVfrluu2WaYS0KdiizJwBGz5fwxAsIv2E
	8cq6hhcZUj9dmdyj1MCpQ9S/coxqDGXTbu167XTlALMbZP8KDsvV0qywrByPK9m1LUCH15Z0K29
	4rDujhzlw1gAC+ARf1Qz3c=
X-Received: by 2002:a17:90b:384f:b0:39d:f770:774 with SMTP id 98e67ed59e1d1-39df77007e9mr2541338a91.20.1789399341650;
        Mon, 14 Sep 2026 08:22:21 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd6cd982sm31667a91.0.2026.09.14.08.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:22:20 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 10/10] ntfs: wait for attribute folio writeback before update
Date: Tue, 15 Sep 2026 00:21:39 +0900
Message-ID: <20260915-topic-4kn-lkml-v3-10-447cfa17f780@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789399242; l=805; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=Y8aqOvxwysux/OqY+n9Oq5AbefWnqKe5itlF4eAnDrY=; b=dlr9jX3GgfjJkl91oja0ER5uhSZoRF3RxBsSY++xdsA+4D1AR2Vpz/drI4LT+6rhfRtz7YlHf lePFQYN9sNzBhTGIh9xxboONl6D2JwC9t/19CWPPmlkQg4G6ymUo9Eu
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
Content-Transfer-Encoding: 8bit

ntfs_inode_attr_pwrite() locks an attribute folio before copying a new
attribute image into it, but taking the folio lock does not wait for an
already-running writeback BIO to complete. The writeback path can unlock
the folio while PG_writeback remains set and the BIO still references the
folio memory.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 4375ad477809..d5e526d3612a 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3740,6 +3740,8 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(struct inode *vi,
 			folio_lock(folio);
 		}
 
+		folio_wait_writeback(folio);
+
 		if (count == PAGE_SIZE) {
 			offset = 0;
 			attr_len = count;

-- 
2.43.0

