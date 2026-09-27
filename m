Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A273822B5
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506639; cv=none; b=OPh6y0BISbPj8wCu60E8RBuFPcuhnmxHoJ8zaIotNP++Af+TUc+Y/94HlcOqj3dyZVbdzjLWKGzKzyXaCIyG7/Q16NOpAr0aJ/qCwJ9rUDBEPf54UdjePXT97pLsQ4Sh/stbAjMJmTcQ5QFcYhmMgp3v+BJ/KZuxVbvzUEDYPTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506639; c=relaxed/simple;
	bh=TMXpwMrgBc0WthLXYnkP/QxmhL5jxeiWxjSvV6naBUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCWCWdB0iAYPgKtrlXoFmchQ000GUoNPgjdsGxqT0gK458Hst78xiPpqjeIMy4NAyVa4RlKjtZQxfrArX2ExPbd2H+9nOQs5q3q+1w4AlIQa23I2sKds5y1hEIOOu1CdDBUYO4OXMjs8fXkbHCHaXNaZhOmC73EXakTkkaD371E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKfRYjJM; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKfRYjJM"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0135fso14114365ad.0
        for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 03:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506634; x=1791111434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSjyGs9dHuPWxLkKlfnkoqKEvH9ZWWVKxeYf0xIQxxU=;
        b=mKfRYjJM5Z9SPYfTf8tNZZ5vJ9L8CT8o3TbpA6NN0PmxOaywDhHYtz32AujY5sxXG6
         WYITSAiZ/fPOnundBBt2FUWdDIJ8eWNDbnnXT2iuPtjt7HgYmbF4RudGZ8ZI3eAJMvV1
         Hp25FxWSnbjdTateSmpdOW7T5Jl/dTH6gArg87OuO1CgLrRYzuBSVb7r2JDiTflendPo
         Vg8VBLvLPnnIFZp1K9ybwiuHscSzRxSqwHwE2svdoN+0ltIR6QMjSQKxjnFkm9WQ9Xf+
         9VYpDwi/IaCe7cAFikLX+IC3OL8pir+9QzNYYJxMnmD8Pw4Vf1fnafdb5Gq4DmgoV1ZV
         YwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506634; x=1791111434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSjyGs9dHuPWxLkKlfnkoqKEvH9ZWWVKxeYf0xIQxxU=;
        b=Ebr8jZN9A4Ml4HrxzvpLrOTzY5iJuo/1WeIu1LrzuXBO2X7MZOfvrmf0CFmqhfWzSW
         ycOxKIRfteNRrTk9pqaeEfu1xxuSr8+VFntpPLguxgmWcpv5xP9IaZ74a7yfGcHLunG/
         Yxac7vNqpeEJ4V1vLDmPiUGQV1V8+NdORAitiTS71LDl2JLPcwRgjzZz8u91ROB62ROu
         msQOG4nsB4NjLitB2nRybSQaPLO9D2WQoAj4p0/4y4expvAfXk/26w5arBQ4hOxfpjXn
         xU6efeZbPH5m+0LqbX7apvmLyAO3QzqxcZ4tESP7qNZfa9Z2jy1JEXu+PYgCEtjA5bOL
         Y9mw==
X-Gm-Message-State: AFq9FYJxib4rstZvOU25Q8dgJP1NlfS72MS3SJI8fRgoaU8U5MaB0KNc
	uV/d/AYpY6Rv3pNeYVgJiEjFMDvFnxF+qgoBu3D24f6LIJpBU6qBBHOrN7EFBWyslQ//kg==
X-Gm-Gg: AYBFou2Co7PsOZud8cloCmEVFJH5JC/7JxY2upR2diBl5UzkxAbCzdbeCN+HtJ2UA6l
	0KfSyFFEIAfzCJyRMKDBMVSoRY+JADDUFrKtPkREVObU5ZRweZZp5NaXIsV1UNS4O5Mnth0FuXx
	z1i4+eIZ1Smb4zlw6FcWZMYXqZ7rJsSo8IOkER0xwhywIsmt/5zK5K/02nAG7hxMda022b3izS6
	D6iQZP756qtw9zJZaL7MbkX4Obv7I/0gEWDK+jaW5Zy3gyiDBKdm0Ip+t9s1NVhArk7a4T3Xieb
	nUsSaDVwjdTFJ6yslJUVnq7cBa7OsAJF6ukPJKHLcsmLQP/GYSCXPlmXiU4CnmLANntHd8gx1bg
	LemdrBvdWqJ62GLGGgA1aIVBjyowF9sKs+N1M7aQlgpIVrAkme3ueOwV1q6NgRR5JLPSmBKy8Lz
	Cxb77VubAnsDHXAHzILLrCEB9Mf8PyBz65FoVeo/0si/zfPGB+KpyPQwI7ClpvkFrSORZ3CWuyN
	6o/oHfbY+p3S6/gTgPtufjU/UVUdu7B5f5ib/evXP7eUFHPhDly9mSKYQhE+efvtVjZG18w/6YD
	3Wyvq3Buiu0oC6hCeYho4NIlmbJ5PjeW6knr4zJUlDCYasCbtXX0ueKgogc=
X-Received: by 2002:a17:903:4684:b0:2dd:ad74:ac81 with SMTP id d9443c01a7336-2df94b948b3mr51119405ad.28.1790506634463;
        Sun, 27 Sep 2026 03:57:14 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91442ef4sm28521145ad.55.2026.09.27.03.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:57:13 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ntfs: do not use a stale runlist pointer when undoing $MFT extension
Date: Sun, 27 Sep 2026 18:57:06 +0800
Message-ID: <20260927105706.3111333-3-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927105706.3111333-1-matthias.goergens@gmail.com>
References: <20260927105706.3111333-1-matthias.goergens@gmail.com>
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
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
A forced lookup failure of the first $MFT data extent, on a volume
whose $MFT has several extents, gives the KASAN report before this
patch and nothing after it.

 fs/ntfs/mft.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 58676042444b6..5831ea7600315 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -2081,11 +2081,16 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
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

