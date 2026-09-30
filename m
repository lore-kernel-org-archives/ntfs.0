Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE5A37755C
	for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 03:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739365; cv=none; b=kCxvkocLdXe4AZx+1DsuulCwcuwpnTIU83asxdMmWob9uWO4/I7hTY1/4XhiH5KdGdCmcssJDsTPLQxcHYi4qIbtHp7Nki0WKZyksFUi1XcqqUa/ZeBCIwA2KwtoxgNAep1c/RCRIx5w/S+Wzm3kikUOdbdbmUao/szrMh3B1Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739365; c=relaxed/simple;
	bh=mh9mhqu0ZQ4ExEhM/xNb5urFxToWZfUd4NS+sOdTViI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XS5QHXDm5WoHshC9PSdOyXVOqKMqqKO7Ws12GA8o9Emc7jt/7mJJZNS/3FGZlxieNN+7OotsCnf+/fq75B1fj+HaqYJgmX88C/LOVFuKKjEa0RZZoeoqDHKvpkHzesaO6EpGAdvDjZbgiHtG5L7ke7c5ShcwunxMj+QidaYDmk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InMCzVbW; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InMCzVbW"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7cadbe09cso761138a12.1
        for <ntfs@lists.linux.dev>; Tue, 29 Sep 2026 20:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790739363; x=1791344163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5BQMjxmVq6FxLbCtymk4LuxsnfyC3FQKLzprKTNA/Kw=;
        b=InMCzVbWRDHfLyuj4CzwLCU9Mc85dDjX32FoRE/uVKm8FkrGsDwBqyLorFA/wt5t6l
         5fV3w0NjAiOl53o+pCe68fSU3ASieagfOQM2jw2XHS4TEw6efLXGVr5hSRcyH07pqsTf
         inpwS6JCZkjrHZs+bVOXt9w5cPxOGsG70QZEiNfujqu9U7+Q91RzUy4j0cbRuKJng6mF
         IXW9Du1Ad8uosjDF3DvMrFY83vrho6IO79yuELkZjcArx4GgDaghKPdYIBsvVLGs3vl4
         N74/fPc2ka7L3HJG6Q6CxNwCDnbcgqTZzG+lfi0IvbvwSjFjyjIlwr8dDKDKZg5NTnKE
         kpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790739363; x=1791344163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5BQMjxmVq6FxLbCtymk4LuxsnfyC3FQKLzprKTNA/Kw=;
        b=e7eqoNhPrgg/GGnmi11CvtPP1Ei1mKYjKeIIAXySXdBvrwzERO7TlUiDi3SF0pGOr8
         ePCL1IQIxH6LaIGB2yEp1DS2jzEcJNLpbkO7k8pUfjgrJ21DVDXb/WmCcOrzrVy4F3oR
         LDgAg+mr9y2vU1o8ZWuoXv5BgTLjNca0+/aEyjNmfFROXdYxowfO3oBK7iw/2x/2DbuC
         oj/7/kpBrKCOFxoYCt7NpMVUSCOjIDinLWRdOtEMbmTggTNPuy/udgNukrFN1rCmbNm6
         osydIOGTfJDRtrF9ElP5T2NYROcHprTgGe6uiBvmI7OGMucdr3Va6MNBowbEwKt90WMa
         ffXw==
X-Gm-Message-State: AFq9FYJxJn5X2WxMRWZ9ipGjdZ4pbDGWVbaW58VYwxAuzF6EGYvYDHrO
	+dDscGKruXKBMizYwsr8T2C75r7dMS6fsKWSMFON2NC9RbxznmvjqbZA
X-Gm-Gg: AYBFou2u8ZSsNtNWPBChdMVmqMZNjtvbmJzDTZTJU+egUBGILdJhcTYkg8Gi+DpdbVa
	zUbc5kqOAU4kCBNOmol2JXPFteCimdeh04BReS4O5Zr9PXEUy5sEMp6eoSn4+b0/VJk4HzBnU4m
	fTRWw7lKfgdVfXLPkhG8gW0hES4Svbws2mwi1KShaFNBUwCMIrAB7yH0JnhNX2ABF8iel7rLcm8
	ttbf8VHGH+FHxvaOkKNR4xMVlO+v//RvaaMEzC7k9ad5GPQMU/TPM5Oo/xCmp5nXXgW6xa00KoZ
	l1LrCHXLWoMjxZTpUm1c/mKhjE1/iKiHatypryhKc0p42SFhYEhiqayzT92Y2PQY2lZpLtx4Upg
	3iP9GWhZQvaRv72+slOKVk25VLmppCv2k5aD+C2MKTifcdO0FmVoONahNSQXwJOQnR1PXFBqT7f
	RVZFC0otQUXXaSJO3JSGuckeI/qoHWy/ssvw9LufG8eOa/YZgx3T7RYpOt2OBSvSRaRrT5KbBCy
	2+ynecwVXipy3lcMrvUQ1e3TfvcLKPFTFSeExP81z8Ng5izna0+EfPpEJDnK62NmHfXhw/V/Xkd
	CoohBCRXLCOs/A/Ux8A3r3TwzVOGGILXMt3mbv5uwm7dmMh8pq32WJIEFk0=
X-Received: by 2002:a17:90b:4fc6:b0:3a0:8133:69a4 with SMTP id 98e67ed59e1d1-3a4d175e86cmr120507a91.26.1790739363226;
        Tue, 29 Sep 2026 20:36:03 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce16abc2sm669108a91.9.2026.09.29.20.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:36:02 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ntfs: do not use a stale runlist pointer when undoing $MFT extension
Date: Wed, 30 Sep 2026 11:35:56 +0800
Message-ID: <20260930033556.169300-3-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930033556.169300-1-matthias.goergens@gmail.com>
References: <20260930033556.169300-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When ntfs_mft_data_extend_allocation_nolock() fails after it has
rebuilt the mapping pairs of the last $MFT data extent, undo_alloc
truncates the runlist and then rebuilds the old mapping pairs from rl2,
a pointer into the runlist taken before the truncation.
ntfs_rl_truncate_nolock() can reallocate the runlist, and KASAN then
reports a use-after-free in ntfs_mapping_pairs_build().

Pass the start of the runlist instead, and hold the runlist lock for
reading while the mapping pairs are built from it.
ntfs_mapping_pairs_build() skips to the element containing the first
vcn by itself.

Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
Cc: stable@vger.kernel.org
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
v2: unchanged.

A forced lookup failure of the first $MFT data extent, on a volume
whose $MFT has several extents, gives the KASAN report before this
patch and nothing after it.

 fs/ntfs/mft.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 8edc65911aa2..f1b2c3b51fd4 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -2086,11 +2086,16 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	if (ctx) {
 		a = ctx->attr;
 		if (mp_rebuilt && !IS_ERR(ctx->mrec)) {
-			if (ntfs_mapping_pairs_build(vol, (u8 *)a + le16_to_cpu(
+			int err;
+
+			down_read(&mft_ni->runlist.lock);
+			err = ntfs_mapping_pairs_build(vol, (u8 *)a + le16_to_cpu(
 				a->data.non_resident.mapping_pairs_offset),
 				old_alen - le16_to_cpu(
 					a->data.non_resident.mapping_pairs_offset),
-				rl2, ll, -1, NULL, NULL, NULL)) {
+				mft_ni->runlist.rl, ll, -1, NULL, NULL, NULL);
+			up_read(&mft_ni->runlist.lock);
+			if (err) {
 				ntfs_error(vol->sb, "Failed to restore mapping pairs array.%s", es);
 				NVolSetErrors(vol);
 			}
-- 
2.55.0

