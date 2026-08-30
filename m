Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9260F3F1045
	for <ntfs@lists.linux.dev>; Sun, 30 Aug 2026 00:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788048955; cv=none; b=IFSbly+/LzrA58V1acYKoBxw7KDivrX1aIckJFPNWIZOR94RWhCNuNxagSEPEYqCuUGzpAEPSzupD71IglRK5QHpa/rA+0DJNse3Wav+hbTN0U2z3kpb8cv68nad1N+eEQCVhwCxwkuNUdWjuRSAaPrwTmEvN03lTB66zjTvlno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788048955; c=relaxed/simple;
	bh=GBkRZfhhhjMPhwvKL0XDc2B5qkJvnA6DudmV/I9oFqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K/dYSRQ4OFQrv9s42x4jQaZcXBt1gtqWB6dRDv313Yg0QCMcRGFIAmrsUrG1Lm9gT5LiycqpxkCvYJa9tMF27AnigDQIl1VsCSPv8+YwTcXsEmhjwB+DNKB0AOD6fMmMuC3itF7Wy9XgTWWx7SfCLZpxhMNiJekyiuk3nmv7qlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXmZoCAS; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXmZoCAS"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so16879625e9.3
        for <ntfs@lists.linux.dev>; Sat, 29 Aug 2026 17:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788048952; x=1788653752; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PK/sXxsciKxVrUSs99U8nxlxsFltkAdmaHPPtgu7OU=;
        b=YXmZoCASg4AgtmmMa9aZJhwDQ7vrz7xt04ti8R+UlNYmN8xtrC6c4dCHDICR1R6Dk1
         xILfP6WLyItiSwo57ECf6R2A2xLoYEfNAcBnYg5CUoTrlaWCMWSPpZ78s1zkbhvQ77KK
         3xxUVBxtYLs5c6PK2T5JEqG8IIkbDSn2v6ZjYhGurJPk2yWD+HWSJ64+72M/xi3q1wAE
         kFxwMlRf9VKw4+jikAvnR064pUaLm8TD0hEnvY5NmnCftMsYd0k+ykdomBw22Behxdv5
         CIyCQHrcQdPCAmvQmjmUq3WCgysbJ/fbqPxPvJCp6yGb38D/N011VXc5Z2xlmFYSxfc5
         66NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788048952; x=1788653752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PK/sXxsciKxVrUSs99U8nxlxsFltkAdmaHPPtgu7OU=;
        b=Pp85clgzt7WIOI33zWesoaLpb5l6sMOIr4wMnQNm4NO4UbMEZwjFgJmtfA8bHfHsZq
         XS7D3wLD/QsozoJuqWAZwbuVfFGhzukcWAsG5d7/y6iLCaX9DRduE5XCFvmtWLr424cb
         H5JFJCpoAaHPFu75kw0Tu3l9Hl7d/Wg+7BFAlgY9AaTHLE1a4NNXFVVygcYE3GXDS0n/
         Xvfxf3K9hWEdVbJNDz1LLo1YQliBYPDPKN6NX2+kjpm3P4ciNrA8mMRsJosL8hM5aLue
         d22gdpoLSWLNsINa6atNQ14CnaYGHARqEMLnzN5znArMj95PlAowkSrW1ZZxqc2etLaK
         TKVg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0CEJi+yK9Hg8+9Ngvn3jcrPgUkOixPeQtEYMm2KJGytUZqLQzxyP87P+KZYIDOoQ7QjdW@lists.linux.dev
X-Gm-Message-State: AFuF++k/UOYnEU83nPSkJ4DD0SGpKeZ5exKRNsLmBWveJJhNrwmFGCmv
	EDwMXbHwAIfixpA5BSmfmaxdLF8wJa8plCDJCs5I+HsDngkA6cn4UYM+
X-Gm-Gg: AR+sD12406w83+bv+B5SiVrKZL0zXYhyzvVqTMPwMviIiGuwsaL2RqAoS9E3q9PCyaz
	YPExYKuYybBbs4dkYDh08zccHpHMsCYxwG4Kin6ghV2YrZC1Uf9LpxwDAz61/b1/DpLCmdMupDR
	gCN9EIPwCnCbcv2MVYyKtp6Eo/Vvi+a5BHELQIRSNQZXDDWpePtm6MD2zIZVzvcEQ5xOxK1z6KA
	lfq04Xxqdj39tiyr9YzE8YohORrXZLm4PWj4bhGHEGjDwzRK9jwfoN3QVDT5lqPFfIfLeJvbpRu
	jfuKio3tgDeh90CiIAq5ZSccmeFE0Fo6YJTwjiGEOXtZGkkvFK72llIrVgnm8rPwnbxDpnxp2bq
	7kX80ae9yg0KeqGwpOQ6BvIe1MHc7BD2HGa3yM78yT7E3LA3f8b7om56h8cJkcdXMauCPxYI54O
	OiXIKDKR8p3s58ctZPfFenfIMQCwQ3EvKsKLydYvjxZ/rDzit7diAQP8E1yCrutNvwyC4pA+TV4
	aD3ZEsiydXbZ/sHETSuofJBVzy+jcgyNbi7tbN9jaold40CTNewObQp6jjoHlAve5ymqbWioQ==
X-Received: by 2002:a7b:c30a:0:b0:49b:8c63:dfdf with SMTP id 5b1f17b1804b1-49b91c5749fmr191750615e9.15.1788048951616;
        Sat, 29 Aug 2026 17:15:51 -0700 (PDT)
Received: from ideapad-amd-linux (host-79-43-65-53.retail.telecomitalia.it. [79.43.65.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc61cfsm269974105e9.6.2026.08.29.17.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:15:51 -0700 (PDT)
From: Jacopo Labardi <jacopolabardi@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs: fix FITRIM range alignment
Date: Sun, 30 Aug 2026 02:15:36 +0200
Message-ID: <20260830001536.30841-1-jacopolabardi@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_trim_fs() aligns the start of a free extent up to the device discard
granularity, but derives the discard length by aligning the original extent
length down. When the free extent start is not discard-aligned, adding that
length to the aligned start can extend the discard past the free extent and
into allocated clusters.

For example, with 4 KiB clusters and 32 KiB discard granularity, the free
extent [4 KiB, 36 KiB) becomes the discard range [32 KiB, 64 KiB), so
28 KiB beyond the free extent may be discarded.

Align the absolute end of the free extent down and derive the length from
the two aligned endpoints. Skip extents that contain no full discard unit.

Reproduced with a 4 KiB-cluster NTFS filesystem on scsi_debug configured
for 32 KiB discard granularity and read-zero-after-trim. Before this
change, FITRIM zeroed seven allocated 4 KiB clusters following an unaligned
32 KiB hole. With this change, the same data remains intact across FITRIM
and remount.

Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI Codex:GPT-5.6 Sol Max
Signed-off-by: Jacopo Labardi <jacopolabardi@gmail.com>
---
 fs/ntfs/bitmap.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/bitmap.c b/fs/ntfs/bitmap.c
index b1436b3151b98..1840b7d84c628 100644
--- a/fs/ntfs/bitmap.c
+++ b/fs/ntfs/bitmap.c
@@ -64,7 +64,7 @@ int ntfs_trim_fs(struct ntfs_volume *vol, struct fstrim_range *range)
 
 		end = start_buf;
 		while (end < end_buf) {
-			u64 aligned_start, aligned_count;
+			u64 aligned_start, aligned_end, aligned_count;
 			u64 start = find_next_zero_bit(bitmap, end_buf - start_buf,
 					end - start_buf) + start_buf;
 			if (start >= end_buf)
@@ -74,8 +74,10 @@ int ntfs_trim_fs(struct ntfs_volume *vol, struct fstrim_range *range)
 					start - start_buf) + start_buf;
 
 			aligned_start = ALIGN(ntfs_cluster_to_bytes(vol, start), dq);
-			aligned_count =
-				ALIGN_DOWN(ntfs_cluster_to_bytes(vol, end - start), dq);
+			aligned_end = ALIGN_DOWN(ntfs_cluster_to_bytes(vol, end), dq);
+			if (aligned_start >= aligned_end)
+				continue;
+			aligned_count = aligned_end - aligned_start;
 			if (aligned_count >= range->minlen) {
 				ret = blkdev_issue_discard(vol->sb->s_bdev, aligned_start >> 9,
 						aligned_count >> 9, GFP_NOFS);

base-commit: ac727d86fb84bdc9626ba9c756c26767459f3083
-- 
2.55.0

