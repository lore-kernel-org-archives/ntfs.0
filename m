Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19843C1F3A
	for <ntfs@lists.linux.dev>; Thu, 10 Sep 2026 09:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033604; cv=none; b=J0Bpppk5iOHr/YUAu4YYVn59qvAyMuCTMnq/EQA791jXzrmNRxlNWBdPf83XwjVqOMCaWxJN631PXvA9/K1aowkOIX5FcsnGIeJ4ToHe56fpNgv6A4LjYHdV6o9+v1PhNDiSBj6gCF0v4LO9VJvRT80J/gfa/JAIk089Kd/71GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033604; c=relaxed/simple;
	bh=lCYKiAZgOlE3Va/sxmA5SWy13jwbJZIuOec6uhkyZDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y8Gc2emrl3jFdTnLPx1/PKtiL9OAbd2RAnaZBIgeSd7cTV56pxex9CtnYt9582cEi76b545f/oC/KykQvPGTXfyZipbZFuoSUr1hbIX7kBo3el4XquJTkHkmU1tcZXAMRiBoCERUQ3igzZYWv9cejcrerKEsLT+k8I3mxky3Iss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffYj80Mx; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffYj80Mx"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca06b03so12758185ad.0
        for <ntfs@lists.linux.dev>; Thu, 10 Sep 2026 02:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789033597; x=1789638397; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9iPUBr1vEs76jcJu2/McyeLNxlTtVcgj8O4lQVlwvOk=;
        b=ffYj80MxlNzu8I6+ExFa0L92T1ZAYVNfXiDmPA0y4D3Q3Sx6BLOFMZ9BiU8PvPH+AN
         ZzsKgmQWN6IB6RglqRDk5MY9qhC1bGKw5iU46eJs8EmR84GLcWOT+v2cKGp9RhKMoDby
         ygFhhsW6pwslrQoeb2t0QNmMPuP95Ut5tTX8SZFPqGOjiQ2w9F50PPiF+Gfgu2ada8Ei
         GfqsR5yzcuF55v0/TMLOLNEDOKFLwOvgGn4jmbySlaAsOO6Lw2oIpC5jaTKPaB6xmtY4
         pEursGb1DpFHRsKAQ5IsjWASxssQdJyxbvRguYknfdxNdQbruuSUJ+F8z8vcerQ9kOMc
         jJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033597; x=1789638397;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9iPUBr1vEs76jcJu2/McyeLNxlTtVcgj8O4lQVlwvOk=;
        b=PwqDCPC/JyNO1DVBgSc9oYRYsCeiEuYbZXbStYfDpEuBUbLCym+FfhYv7RyumanQBZ
         jCQTx8XOSIXUXglGWKcyAEz5yIRmtdC6Hdh1jyHYKTMiljb2V1vZZNp6q2xsZKkihcYK
         KQB05FrSoH8873Em1vsrZjDeAxL6XRjieUyGlMu0fr/ApeJehwObFkkqfhjAQNV1KU+M
         9luQulJVOjQzRldJr9cRLGyr7m7anw4HH0sFlhuQSgzqE7uWSAr7jV3fQ/F7ZEDql6DR
         Ns1Fw76E8a4+yxAIH4aZ1sgF9uktIRTY3DjNpzsAa/JykVQbhL++mPAx6oymClpDxxOD
         dddA==
X-Forwarded-Encrypted: i=1; AKwUvBxTfYoyAFitmMOs4DHrTg71gMC52pQpT3qu7tz2hB2hz+VRmQuNJJIZKfcCxmvJT4JaIBh7@lists.linux.dev
X-Gm-Message-State: AFuF++mlO7yPMkkH4vxEB9JNyxjFNc5TiTBjyM/+Amzg1LqtkZO7dfbD
	LghjNPasa72KlMRtmk2buPtjY9+xGOCHOwSc99bOJuVhifZdlOu2tpG3
X-Gm-Gg: AYBFou34ReZ3uh/iCENgt+W+YfPvLQ/S4gqq5JqcCtSLmhrdyoKaKXmLyWvF0wwlffC
	rEdkla/zF55RheIcrG4bW0AKw13Euoxg0LtXPG+BeXefiZyi0i0xuFcPruc1rcQxjqNkInmuQ1H
	WLaa0Ba0+t4VdmojE9Ud4z/s/OUdQbt91S7kgzG0BRTV0Z3j9bpXLYIs70mrpjp0kOXxzDkIcF1
	SYl1QchVgx4wQtjwz2X0iYoGQZjdOJBVVV8AaGBksr+5JTjQ8Z+Tn+GR9vtkY4R1LlwGAC9anHD
	mcLEK0L/eP8cZ2CgCfUOWiQ4IecqHHEERoSALN8UhDnHSr4gwuzSVljOCWPE3aq0LhHWkS0HDRC
	XEUSZXAkkLFteYN3krmjlSetwM6Mk+NVUtifAVDaehu9dBgVf3x23oLVulxt8ZFHdPxjkcnwRvv
	oHl0eDeYWqOeoMGAEmUXx/33+Ud0uyKTb7XRwtIKWU8ckx49Z9t/ccmJwKRagV24ff6AeXLgjcd
	gEwRB8=
X-Received: by 2002:a17:903:4b0d:b0:2db:3d84:efff with SMTP id d9443c01a7336-2dd0e8c15ccmr40842635ad.2.1789033596763;
        Thu, 10 Sep 2026 02:46:36 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14841054sm86827285ad.3.2026.09.10.02.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:46:36 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 1/8] ntfs: read MFT writeback bounds under size_lock
Date: Thu, 10 Sep 2026 18:46:03 +0900
Message-ID: <20260910-fix-4kn-lkml-series-v2-v1-1-f10a09fc0176@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=lCYKiAZgOlE3Va/sxmA5SWy13jwbJZIuOec6uhkyZDM=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqonw6CKcfL0YJgGSHX/Uk8B4a62OJgcFNN+gLq
 BhIei4dJxGJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqJ8OgAKCRA08jD6945I
 04ylD/4uPtgYV+qMz+gJK0VpckTbNFOuGQiTFqrqvYZ5/7fl1QbCKPbLhIBoUyJr1obWq61qOo7
 tUHjd5PEOF7PHClZIrpcPnPljweLWD5u5zhUrGokqerhfgmBOsrEpCQmtaiN5vU87F2XJEgqLz3
 EuMAPhxUfnWbi/zM4QiyhFIv7RRbZwekdDqyJoDm+krTBO05BIiHJuNcnrFc3g+CHvvDDJB5PWm
 r5reL2rK883XV1Gr/k+j5bHsYDNv6Twy/A9QQXYyA923Y/JAYIjPQWeH15LE865YehAQlhrDTWU
 FQvbn4mDPCc1sfcu17uHnqDc9DNydUvY5A30hY4GDEZc3lK9dCUANKnwvpJGx2bEnikJRPL6VHB
 Zh+F00FJfBQAjDF2MxhueyNfkGShD30LQMNQ4LqrcxcSuuF+8/t0xrjKtIVm5Ex60LGChECOUcy
 SDMv+L7ONSyFL6Gg3rYTbfh55Kv+YMGE3ZEdZvTRK8FqMJvP2H8eMClz44fk1m81MOTVNmMo3AW
 2pjjsI8dohCgAyGaqhPG9IbEc4EpImnMyaIqHKz8f+Jod6mKwfMm4aKz9OvtRyPD09Hd0/WIAnN
 9n+zlXAFNj3pLqtZA6JCvSqRljg0dKVfwnecSAWYCjJ2ZLeMmzLuLoydhvmHePy57NCR0FfNC92 sZVQzWNRw3g93LA==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
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

