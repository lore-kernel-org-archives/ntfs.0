Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF9D3F7A9F
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984442; cv=none; b=TJ1NXECwKjy8C4uB+RaQ7bkyBu+RKNUZOmY8aB6URJ7jnlnAMeynPwhcJ4czDqnJxlN1xHhT9I1012GyJ+7zJc1ErlvulhruMqzWBNU3R90yRkVsgc3Fr9opcwBR9WUHaDxuziEP6uRGYkOLbXhV8Z79ObWtlZgKE3An3/bpVxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984442; c=relaxed/simple;
	bh=N9vVi4P1Mjs7grUglMREeLMqPYUK0Pes1zGaYGLoGOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SbUmhyecPRy5onfuqKSwatQIFtj+Uv8LwS3LnVI4E9fOtJ2KLk6EFCFujTl6bIwBDSFAlmCIKBu+1GpR+pdMLK4RX3oxIQf0ditGH41gpxVlvqRA2Q7UuTY0aGY9YGJlVI0T6fA+H+PKly8RotCghqtGJSpFacFBeefNTOnGxr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r8bvS0L4; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8bvS0L4"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f7so18519205ad.1
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 02:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789984440; x=1790589240; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jYjcuudhraEZFX+KTUDbhqjJTSMHJ82RNaYSBacJZ98=;
        b=r8bvS0L4Pgb9j8g1GwpoTuf9rFsCqW+kpSAdinIB4lKVdTpUSDK/CKiidKofQw3bwC
         1o3+VqK+gWMuO1moKQhB6fOuMy9XPjIVodg85CH18MmzLNc0GRIwksLIfFbWgE+MjV2s
         fN9dZe3oRFVkY1EbyRyKn6tlej3JU/o2GpErzNlru5J8i0jr6nKz0Fh3NKmbMWTxHZuD
         xp74uESgUdNFSx15hxdPefOX5I9fJv4PyPY0jJUTp4gkrHmay/4DVQ2YwXgFegt/WxIj
         cg8KJcF4YcnDoCmTXugB63WvMieVqIS5z2BMkDHQJkflGNmF2BmOhX1lCl2UrWssjFzh
         RTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984440; x=1790589240;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jYjcuudhraEZFX+KTUDbhqjJTSMHJ82RNaYSBacJZ98=;
        b=bezr08CpQjUvUpzfYi9lj5UGe6/uUh4Esrgjwv9vVR8xkUnXX6JkEcVQAzNQgi4f4P
         MgU9F3AR9rX9T0116XwnTpG2obH/W9+tPKGazOfv4ruFM78uXWnCJkfM8Q1LXPCJlMFR
         V28M+H2MReYQ6Pl0oX0811ctgplfnI6D3E/13SrBBW89uaSTptIsnZ8m0D0t5xUZZtsn
         0kvXgOTCoM4cmncOPMTymb22OtHX2vd25nFTlc/7aSfFH2iUwHCxw7Alp89QTYWnVUDd
         Zk1teidRSHtVkMoubpcWtU7cmAflQcd1a4pn6czfv8cEkhmX/vp7fmC1QzSGxi57mMOu
         yYNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKCm+h3XIxDZozVIFz6ZZUD/wscqJ5sggyf5eR9n/dwSVwLiSk9OIlpf+KQFgsvxOuELLe@lists.linux.dev
X-Gm-Message-State: AFuF++lzfibK+09l9E8l5qZDG6rbSo1dT+/Lj/a9bSxX0zgzY35V5uwU
	3I4YQMlN9nRwAQneoHYe+UWVTScF/V6Osa2F5ISx88JybMrC5/sW2KQU
X-Gm-Gg: AYBFou0N2i702813zRs2Bw3xX33yEN6BrltpnDLGRVl4gB6EiFG58QhDhwlvNzEXKNV
	IGiNKlgpb9ftHpg0zEINfm5KTGi9dxvc5Np4vYTCVzQihM5ekCsT8DljIWZy3KhHrfNKxTEC2Vt
	2pojgRiN4gNRSKeBCDRaaAHCwqjllQKEIRq37TehbiCkQiOenX84CSZML24Yz52g4b9CBRDzZEi
	XX5KgYOoKMyB9IruA7ELSPB8jAT293JoEXu7d2kT6/0+VjIMOuyoncHYDfQUHLgwHMuUfElZ47w
	iK9F/LwE3RjCs7sdEHfoH6X5yW1CVZzGCGN1mMjB+tIdvvJ+M3gwWuYiF1MjGpG0wYUt5F9grD6
	m1AZSPDaqbXwSoP2rWM2iQ/VA3pmLS7e3dAOr3Ms+CuvkG41uT9i83VSeR8+7NhhhGjiY6042re
	JmWM/4Cqxo+wMEJkBnjSCKxZ3TYNxqfJs1oRYM1WPVo2R0k8u+NHt0MV9HMrqpe+bSEFeZJDNBL
	UUdJEY+43v2OjMq7USAhdsthTfuZVPltg==
X-Received: by 2002:a17:903:b84:b0:2dd:c053:82fa with SMTP id d9443c01a7336-2ddc053843cmr91334195ad.49.1789984439993;
        Mon, 21 Sep 2026 02:53:59 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17baaebsm30505915ad.55.2026.09.21.02.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:53:59 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Baolin Liu <liubaolin@kylinos.cn>,
	=?UTF-8?q?Marek=20Weso=C5=82owski?= <marek@wesolowski.eu.org>
Subject: [PATCH v2] ntfs: require page-aligned full-page attribute writes
Date: Mon, 21 Sep 2026 18:53:33 +0900
Message-ID: <20260921095333.94659-2-hyc.lee@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921095333.94659-1-hyc.lee@gmail.com>
References: <20260921095333.94659-1-hyc.lee@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

__ntfs_inode_non_resident_attr_pwrite() treats count == PAGE_SIZE as
proof that the request covers the complete folio. it allocates the folio
without reading it and copies at offset zero. That proof is valid only
when pos is page aligned.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Cc: Marek Wesołowski <marek@wesolowski.eu.org>
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
Changes in v2:
  - Add Fixes tag.

 fs/ntfs/inode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index d5e526d3612a..0391e4945e1c 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3720,7 +3720,7 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(struct inode *vi,
 
 	index = pos >> PAGE_SHIFT;
 	while (count) {
-		if (count == PAGE_SIZE) {
+		if (count == PAGE_SIZE && !offset_in_page(pos)) {
 			folio = __filemap_get_folio(vi->i_mapping, index,
 					FGP_CREAT | FGP_LOCK,
 					mapping_gfp_mask(mapping));
@@ -3742,7 +3742,7 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(struct inode *vi,
 
 		folio_wait_writeback(folio);
 
-		if (count == PAGE_SIZE) {
+		if (count == PAGE_SIZE && !offset_in_page(pos)) {
 			offset = 0;
 			attr_len = count;
 		} else {
-- 
2.43.0

