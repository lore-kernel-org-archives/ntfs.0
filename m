Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9066360EC9
	for <ntfs@lists.linux.dev>; Fri,  2 Oct 2026 04:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915710; cv=none; b=I01wLeP9lzq7ENBh3FpIFuvMMHSiuBaMP4E9cbmUEmUtCr5j1rFpVhSM7euUltX4aSMeU/11Dc5vaft0xN/cWVPRTHjrXyYwzmC71q2cOVFVBx2wTC1gEElOrPyafKoj0mFeOn46zAYcZ4Y8AoBd6jp2vnURnKln9ZnI0kZLyNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915710; c=relaxed/simple;
	bh=FhlGtBDBqbooWe0RmMGrO55RxhWrm/DLJJot976bih0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYNTyKwQkxo5lr2bpP6BugkgJH2894Z/BthaKL70IRTL6Ge/niF68JtsAubC0+zY33PZtG6wDV56Ed0eW7amUehICDIXAtweMNWknUOKS1UVt6nXTHrwVakZCvZi49DWgILvx/AsAszRSELkCq1P/k+NvPjRSby7ggcXkzfhshY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSjJ0w8L; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSjJ0w8L"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7c4c92477so2586378a12.0
        for <ntfs@lists.linux.dev>; Thu, 01 Oct 2026 21:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915708; x=1791520508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGeFVvTCbU7hVv1m7NMiEfFFIPcZ+D554WZng02l/dY=;
        b=XSjJ0w8L0J86234FIpBuObjgdWRtzsLn7wJFOJxJmZnpxg9fvpVRTFIEKTbmLGIzVF
         v0l7Tstx/4nrzOeomVOAsDKCK8WPeFWk44Ux3lBSDJ0JBNE+mI2yHb/VJ8wM/RgM/C2f
         uHZ/jQhfODDKzmxbw8YG3xoD2WYdhtDTuetkFhb6oMVnC8VoE1GzPrywGyhbkzF/Zms3
         OuLr16QY6mHvATnwtZxjL491mSOD3AinQ5b5Sgv5Wa50ouGwHH5yUi50hkOVXTgcdGGK
         JIBVn1GiCEjP0JpcWutueornp3BO9HDvSPrSbZFPr7Xg3qbLRbc31lv19bdPZmID4Mi8
         JEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915708; x=1791520508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGeFVvTCbU7hVv1m7NMiEfFFIPcZ+D554WZng02l/dY=;
        b=w+3I1XwX6uAaDpcVUHZ+ZPBnkHUUuvG/L+XxKJx+Kl0jenrWSDOuwqJpNJw8FXSIJE
         C1n4gjHPrOBa9a8ocVH+5zwER5z54poEOa9wSSmTZfGXANWCPei8PYE1MnWrWyh0JXdX
         Ug+0dUthQJOwGdpL8kFkZK5h5dYweh1MeEFKrMU4DD3/jLqqPElz3stzzHckZ2CXl2kg
         qzbbEwVBH5hkzBl/V6UOsAE6+WP2H0nKsJwppnddgQeXu24DOmhUP92MiP7pP8gKmUF3
         StOs39h1mTUxnlQytlL/DH9bLgvT63xRVqbWhgXIm3HIRq8Afx+Z9D3LxBUTW32nfMjs
         we1A==
X-Forwarded-Encrypted: i=1; AKwUvBwPejJbP4cVk6z7MjuZvBXllWki/xvs+Ofx5uJdKD4dRldtl39NdMwsuoRjS0/fKzoQ3aV6@lists.linux.dev
X-Gm-Message-State: AFuF++n34FVJDvQjoPAOW9Ci0OQz4lV0Mj77lOmGpyGCJ6b1dzuHGVwC
	AmAiYRLofJUfsg44WaAQN/fdQ3KOVQkim2rP7Kgk7QxC5ZEE0nfh5Rfs
X-Gm-Gg: AYBFou3uQRblx5l84kffPR1lTbdxdwf7aw7Uwth0eAPgvdwCoYCT5BBT2pdLVr1phdM
	sVfAnWwIsZ7Xi9J3vaFZhEdUArKC3TJdmbIx28rfn08N4HNvxV2fWxZSZ6mnf962iUIiDKNS/tE
	NrpUGDJpXpqHaGdN6dZ43+LRKoX0/u2LRkD5KmKrYW1g1vm2mEvMfQ5Qv1Q06Laj+0HMIJOU2Uy
	p2rnHu0Wg3fSZMQkkC6L91l1lw2rI5FPZ2PxfNf2vMsSyjEgXS+1qIAbgUtUI5vCqlK5I/4V8RL
	R5EVjgZwakwDAnGZrQqMwrtBpMmY8hOSB8igwGUxMmcNscXh/NO9tHVJpypvIzUIlYsy2Hy8QqF
	lXnqcfxrg+EdZNBG663/iHCqsfIagU2LTIN4C2Iu8+yH9AeKp9wrDRVbn/Bvru+06nbD9G+aRnp
	BWSCS3hoHwBafc2kK6yuHnMUXMdJUpYKS7oBkZJytk4fc2HFIVdmyDBxGatRATE0Rzl6xFG7uFv
	lj2QE8m5JGEQgQEaVi1wrk/qxmuUZD3SIHY9G6Pr+peIcWm3hWos06Md/7S2ENSBQ0jOgN4E31+
	dHpihkpmwi3lLRhcupUtuYJ6Ddy8X9SyB6FVafz40s9xgPB3+N9xPaNnxas=
X-Received: by 2002:a05:6a20:938b:b0:3dd:a196:53a8 with SMTP id adf61e73a8af0-3e0bd237011mr1615488637.74.1790915708114;
        Thu, 01 Oct 2026 21:35:08 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7370db1sm436432a12.17.2026.10.01.21.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:35:06 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] ntfs: do not use a stale runlist pointer when undoing $MFT extension
Date: Fri,  2 Oct 2026 12:34:57 +0800
Message-ID: <20261002043459.1695429-2-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261002043459.1695429-1-matthias.goergens@gmail.com>
References: <20261002043459.1695429-1-matthias.goergens@gmail.com>
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
v3: unchanged, but now first, as it does not depend on the other two
patches and can be applied on its own.

A forced lookup failure of the first $MFT data extent, on a volume
whose $MFT has several extents, gives the KASAN report before this
patch and nothing after it.

 fs/ntfs/mft.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index e01e367a588d..c2339acc6319 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -2043,11 +2043,16 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
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
2.56.0

