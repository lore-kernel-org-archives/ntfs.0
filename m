Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176998;
	b=K4Cduwyjx9tp1lVyEgcQhp4q/8THexFK5JYe/cbKg8jvbyhK+ByQY1K7tV0q60z4aDBk
	 vS/WlnOIdyrbxrvWjVpwNeV1TZKEvow+39Q3V2S0vo/Pj7W12d3R8ikX26loBW0ULZDaz
	 Tj/lPQe67ggFoxQbcAlgdO0KxMdHb9iTeRbg2k3ayCe71tWaCWL3YEf0sGodDgDzP7G03
	 cj1tJHhicgAml34HtxTSFHo6Y5KLdPJdl2LgctRNM+FZqfyi1p12AYcnyP8JUBob2vD+m
	 iIs8iPYIQNyWlB33wyTjI2/emNgiga14YAlmRPXZH/7nnqukS4KYyfZYtztQnKn0xlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vpuUjL+2SCOJB/vW0VWqG7Llh8O+QOa/7m86/8RjPTk=;
	b=wII73J2JxWjT4jRRuGQl5qg7TKHkI1159z6MVSKvfcHM8q+eZYY6V52vw0HQyXFK6zba
	 H1EMtv2P5IIfDFRB5nzShgyIQgH8wwuXOEWHvK7tWdH1g3+PbTVFYuYq/K3rtgpQfYM9X
	 SFrHS8n5yGuCrSzQ7JpWbIK99A/mfj9XbUWcgFky9Vvobe1tuucXt1q5ybqBJHppPAGKa
	 DfJ/GmZG4W69HivkZCh5xEvIAqrnk8G4tzyxDl8xDHBPxADSJsK2dnpGjHh1TS911Z2iP
	 0fa5UpxlO7dqtp15yzNOcjqKxNjZu0Yt5deKXkrj+RVCQxX1X/b9n51PZ4FoVweL1og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGBu3iSZ;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A765B606A31A
	for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 08:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A765B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGBu3iSZ
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso353736a12.3
        for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793176997; x=1793781797; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vpuUjL+2SCOJB/vW0VWqG7Llh8O+QOa/7m86/8RjPTk=;
        b=kGBu3iSZyioL8QRMEGSjW+YLNKeF7YVujgx08wl0M0f8HdP7LpaerzSvCW3PmnG/XS
         AWPBq2oEUz9L2/WSEHaB3fXLQ7xHdx6SbFGgumzhsn6pd7X5y4obE6gWtpdri/wfyPCe
         k5q2XLt4wtJv82ZXZygFiQMbsaB5Obf4lQRXnh3xgyg0za3dScc7MJbop501Tcr4xfPN
         46nUQoGKZLsvSZ1Ok1gPxIjiq2kG1OcVQSwFDCfetuGFd+PX5Oxy3dK9UGs+paAAkBpE
         zTE9JdO+g/rMVHGDiRIGGmVgaHbmxhaiA4XEgmqQRP/QLAg/jObFJbfJJJlczlJQGadF
         fleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793176997; x=1793781797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vpuUjL+2SCOJB/vW0VWqG7Llh8O+QOa/7m86/8RjPTk=;
        b=Jl0l17LCcv8xwVZaUcTNC99059NwFiCivXbMFLgFSVJ2bTcF2+TrN3Yzwpu1Ymv68u
         HQzdPeJ8WdpzLLQu9eWBSRFvfhzUgFxp4L824eYztVWahptZSnubAZ4AP9tUygrpDbcG
         icdHs+kuDAPUaZjBCERINJDujlFNi7J0ZvMSLHj+F8ULC3Pe1Shg8WnOlAiYEkVqKhCz
         j/Fes5q8JYSuRVmUoXpTZH7DAiyrZ/EF9ptuESMn0RmQim/jkojEEi/DkeH69aolCG36
         WRo7WOmjkoZvnJfT4gRfse1/AMk4jVAqvhkkZ1fV0CSh3Ejhq2gG7ZRRyWnnzKN22jwv
         Bv8A==
X-Forwarded-Encrypted: i=1; AKwUvBwzm7EjjpZY0VCLXH6LZD/el4AaNEYq2NOvjwQgpDXHf8eyu4DxTsWch7AAAYzK1VaNGZhT@lists.linux.dev
X-Gm-Message-State: AFq9FYLnjxs0a6n6bQlxvYotYVQGFAUVoH/sQJ212cumUyIPJY3+huEz
	9xDDoOf2FwpRv1sHGTvqlN0PZBU2hKpfA4f+vsgwurR4oP1erS1fIB69qE4ruzZH
X-Gm-Gg: AYBFou1JajC1dUAqK2L9cMU9/sigD7E5gztxGdhbLmTgl0eUA7QBQBR7Y8UssUKtYsU
	UcfTiRUccGX7Vz/zlqVA9o1Mn4ufRbM9OAeWs5KxPsk9ommeYn0scgF+5x2RGICP3kb9nXqy/Cd
	sZvKEMdooatEwaHmPKGtbXWxPM1i7+qwzgde0fUVlsPZUfj/0IgLRiIZ24TaM5lHb3zE7BcWH4Z
	fYxfYYYN6MwTgXQ6VLniRQguKGPR8eyFpRK3SqS0qdW6KIcMPnFyPOgMbFTQ/Msgar0LChAEnP3
	2dsJ8o0heM/2vMvXeS2XSx+FGy32rPTdEKD6yUihl134eAYGDBPbshZ3ThbQ8B2Nct6CZe4aQWH
	r6hDrXtF5NH8qC/f+F2Up4faHF+Zn8jqFBry1n1xpWUjLYMoNC83PKoDWLPcEcWWR7TlO7As+8u
	31C2pQQ1vK7VvfUEGuhLepIrROiUrEr9VA6p3GL3skhvd/VaD+8ta5jkLeDPZBfWkwOAm+81VOG
	seiaJxnxtsS+ruqlrzNYwrKTjvF+lvQ4PA03+IwMofw8/nyH4+yB7QgroY3CUUbU4DMibFQhoSw
	oBOmA3W0XmtyL80YlKyT0z3NqVjFpfJSdjA=
X-Received: by 2002:a17:90b:2e83:b0:3ac:9706:772c with SMTP id 98e67ed59e1d1-3ae582c2817mr1296467a91.60.1793176996714;
        Wed, 28 Oct 2026 01:43:16 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cc9b25a3sm3756367a12.2.2026.10.28.01.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:43:16 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 2/3] ntfs: initialize VCN when inserting index entries
Date: Wed, 28 Oct 2026 17:42:47 +0900
Message-ID: <20261028084248.2149976-2-hyc.lee@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028084248.2149976-1-hyc.lee@gmail.com>
References: <20261028084248.2149976-1-hyc.lee@gmail.com>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a leaf index entry is promoted during a split,
ntfs_ih_insert() extends a copied entry with the NODE VCN field.
Initialize that field before copying the new entry into the parent
index. The promoted entry must reference the old child VCN, while
the existing parent entry is updated to reference the newly allocated
right child.

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/index.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index e6ba1a08741b..322cb371dbb3 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -1584,9 +1584,9 @@ static int ntfs_ih_insert(struct index_header *ih, struct index_entry *orig_ie,
 	ie_node = ntfs_ie_get_by_pos(ih, pos);
 	old_vcn = ntfs_ie_get_vcn(ie_node);
 	ntfs_ie_set_vcn(ie_node, new_vcn);
+	ntfs_ie_set_vcn(ie, old_vcn);
 
 	ntfs_ie_insert(ih, ie, ie_node);
-	ntfs_ie_set_vcn(ie_node, old_vcn);
 out:
 	kfree(ie);
 	return ret;
-- 
2.43.0

