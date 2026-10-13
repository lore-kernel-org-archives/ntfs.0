Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACB23C4B93
	for <ntfs@lists.linux.dev>; Tue, 13 Oct 2026 14:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903544; cv=none; b=SZJkcVdYBSKgnOdhkO5t08466I2voeYqVAOw4hSqYnS1fPN0er9m/iMg6vqbhzZA2tW/wN1vGOPPwbyXccVc+XYFBKjCuyRsGr6t1N4s/hQu3f0WoZ4KfW2S/4MfFraHaxxK3ezN2qHkPMcl9mnsKaZJyBEzzzx28Nf48iIlIwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903544; c=relaxed/simple;
	bh=A62Md/Uyi/42qVimXLqVhcnX90wP83924gg05eeVTvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KWaVYy/bzyOnBqEVeqp2T6tBzFTZ6s1vhwGLZe9hxEymK0vm4GCvnyuC+NXeyun+r+hcNv9I5Wuje9sBEUXArqDyb4FPowB0T+nZ0HwR9W7UiZEjdF0CjC5DuTki5HzJm3Erm5dKUzxRMm6zxu9/z0NpaVJSItxQLTqNYbwaQOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvoddbRW; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvoddbRW"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-88d8bef6850so159809b3a.2
        for <ntfs@lists.linux.dev>; Tue, 13 Oct 2026 07:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791903543; x=1792508343; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzNvwx+hTE/Sy4DERDQI0AUbkPSf6A0fBJaHS6Z80VE=;
        b=BvoddbRWGx3E+A0a3gSg9olfd10aM8J2nJHXuwTFnT38LvnAV8rdu7trPYdHHQWGrm
         RIQh+kdYg3a4guUycr38j9LIWg/nfU8I/UAGqUIrsbA+Ef52SmWWA0FhcuvQc5ACB3Gi
         q/y45GZXsklMPqQZQnwNbd24OWXe9xmgcWm7c6bTCY0/9VxZpDV2Paf9/xX2CTzIVEG4
         cEZ8fvg7Xu7yWNp0xSqn6daUzDD+dan+IHZ9W9dNGebnhEE+frPQAlwaZUrLZqJUFgBv
         5YRUpFu4cFNB567Y/bcYAtNEwl3tKVa5YX5GElqEX5XIv8vnCiCpS0MjCi0gr9m+UIT9
         +cnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903543; x=1792508343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YzNvwx+hTE/Sy4DERDQI0AUbkPSf6A0fBJaHS6Z80VE=;
        b=yu9kwimeuMgndg1AgMgeWnGhpIgNhpLXsDQNPRhIJIu/izOWb9pPSjRKzv3Ug10atG
         lfpP36jfcH0To22Pl7FGWbh2sA7/fs2PluaUBNnfq5ExkH90e+70v12iDwQ0+FT/b5Wt
         IsNQDq1YquUTiKk5HWhMc5r87zJGUrdVTlb26wLWqwI+njEW+6hzoQneFLXiZYHlwgwi
         kU4W/Zn/WqPVoe13USUft4lRGQ27ZI6BW5gd0jXk2EafhgVgBe9H0Q+ZR5l0WN6f2RJU
         GKtw186vdtdXo15FN45vm3R7JOwk4HuRzUdsi1eAAKA23fqs+HQBLwJUfCh1oBFhdTYU
         nleQ==
X-Gm-Message-State: AFq9FYIjhkOFQ+Pwe62GpETw4Ju0q0KKmEmEFgFsqia1MNmi9ix2lH7P
	YldEjtRMQ2MBBmrSXaH1NTK4oWuuMAd5zchxvPL9l+kjJA6fdxOlIXZs6FmYitT+
X-Gm-Gg: AYBFou3FQq0mEzpkUu5cDEEwQXIsPXfDV4XuU6MlOV7hdyng7M5Cam8fEFr12TKfTRQ
	dVseJjVRtY+LT1RPomruvIjK1DUYaeC7x022cKxy8fCtxj6bCxRSuv60QccSnyTmcPS4HZi/GYU
	GosRB0UZVnAVsHgyaVE3VYJTtVskNAfMhoBDEM+e7IEmWaSr+I1+lZV0USEvPmk/EESmLezC+n9
	+BQopIO2kQRmPYmGmB5pnrKzGvomtGFhoFtiLOig9b3YDSNwcTCsMFTpMQjkFO58vspLu1+NIr3
	DztgQ3Y1z0KQAx4OwKfvUr9Uiva/abypDxkKFkCRinTGCix5y5v2nxlyR6HVw46XRUL9cTMQqjT
	7l57NqhAUkaQtGYt2tNPP9Oo0oCAtNVjaWNH9bL8aNwu/iUME1PoSZdcngKzgaPF6VZEIoB9fTG
	D3Is/vSYjPAMaUWVvocsidGnhAictEHva1Ox7u9HfoKvC92exWPCDPsBh/DhMnLrM=
X-Received: by 2002:a05:6a00:4889:b0:89a:ee91:e894 with SMTP id d2e1a72fcca58-89aeeb074bamr5887952b3a.0.1791903542669;
        Tue, 13 Oct 2026 07:59:02 -0700 (PDT)
Received: from ser8.. ([221.156.231.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89a0724a045sm2987330b3a.45.2026.10.13.07.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:59:02 -0700 (PDT)
From: DaeMyung Kang <charsyam@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	DaeMyung Kang <charsyam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] ntfs: flush the block device when syncing a directory
Date: Tue, 13 Oct 2026 23:58:46 +0900
Message-ID: <20261013145846.56415-3-charsyam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013145846.56415-1-charsyam@gmail.com>
References: <20261013145846.56415-1-charsyam@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_dir_fsync() writes directory metadata and calls sync_blockdev(),
but does not flush the block device write cache. A successful fsync()
can therefore leave the directory's metadata in a volatile device cache.

Issue a cache flush after successful writeback and return any flush error.
This matches the regular-file fsync and syncfs paths.

With QEMU blkdebug injecting -EIO for flush_to_disk, fsync() on an NTFS
directory returned 0 before this change while syncfs() returned -EIO.
After this change, both return -EIO. A kretprobe confirmed the flush
error in the directory fsync path.

Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
Cc: stable@vger.kernel.org
Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
---
 fs/ntfs/dir.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index 5a0e21e7c283..fce10baa2b93 100644
--- a/fs/ntfs/dir.c
+++ b/fs/ntfs/dir.c
@@ -1192,6 +1192,8 @@ static int ntfs_dir_fsync(struct file *filp, loff_t start, loff_t end,
 	err = sync_blockdev(vi->i_sb->s_bdev);
 	if (unlikely(err && !ret))
 		ret = err;
+	if (!ret)
+		ret = blkdev_issue_flush(vi->i_sb->s_bdev);
 	if (likely(!ret))
 		ntfs_debug("Done.");
 	else
-- 
2.43.0

