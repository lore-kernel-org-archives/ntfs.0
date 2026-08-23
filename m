Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D89537E5DD
	for <ntfs@lists.linux.dev>; Sun, 23 Aug 2026 17:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787507160; cv=none; b=apr1KDk9sg99fLSdAdoezakNEDB4mnLf4oLU83YsSromRwcB9Mh3IXCh3KOqH5NKGvi5GjZthhO6IT9svuCo1GETO5EvCGoQWSbkZsttNl/DGaYAkNFcZ3U4BaXhVrkBQUffMpn32n7/b9wQFuW0OGRMVPrHLjPm4fvNePBQIVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787507160; c=relaxed/simple;
	bh=CFpVY/DuqWTvXRc0p5OeDTR1CT91WanPPf4asRW2wHQ=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=eyVMsaIEIsOPyLv5MSixzUmlcfLIYSblKR0z5rDnSl46Sjps+MJD9EhHWvAdvMsM6cFUetMPeOWOY+XM12af2M387bubUAQdLj6K6tL/4fsjcD0l2TQ8RLsnx5kQA7frHSTo4/v7c4lQJCaDtTA4dssU4mh33DWRyIQ9MJHEUiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLR43YBF; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLR43YBF"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c998fd549a8so2022620a12.2
        for <ntfs@lists.linux.dev>; Sun, 23 Aug 2026 10:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787507156; x=1788111956; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:subject:cc:to:from
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tc7zVEq3TX2D4Zx5mQTGVnBlcFdChQX5tNfVNH60DjQ=;
        b=OLR43YBF1LfZZJo7GkcsSk6JpIklnYZ/dg6ImATomPevBfDUroSnfZUG86U0suoxen
         AzSe6ygWxaewBg5S5fidcdCjHqSEM1oq7BZ9RYWodO6EVtzMyPxMvtRZh71YMEFsS++g
         u+O+OD4p2qQTmu1WX7QzH1bxfXPsLGi7JbFlZnHGmdDxWAalg45uDNDv5XZc09VhiLqE
         wy5FZ6jYuuso9c6tM5onP8XNkRifWEUiiay3mak3Qpzt1Om6HzRAoTY4jHOVB5isu0Hm
         wRQ31FCJUzRmomRVhBHG8KqhmKB4ULUP9jPIMlOnj2/g0D9ZVJ4Ucmd3RxonpezXT/AY
         oJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787507156; x=1788111956;
        h=content-disposition:content-type:mime-version:subject:cc:to:from
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tc7zVEq3TX2D4Zx5mQTGVnBlcFdChQX5tNfVNH60DjQ=;
        b=OXB4SyBUBzkRd6846bsp1wB0JGqfCbqBdlP7OsY9lwVMED/MB0GC1ilTdd92sSuebY
         jxXU7hnDdJ1xjivwI022Om4PLKouXJP0CxXlwurfeV4PsrnfBT+F+8SWbP1rPCPD6qyg
         ewrpKkGiO1jF8wtyJsKtI5fT/tBNJYsW77pkdw8AA0YWVT1Smk3tbZcaDusoNfWl/bm2
         lueRL59SLm9VhY5LE1AsXGWIso3ik0/qAPlQowlO+fAeC0tAeNh4G1/FgK5S765BLVcp
         UsBeWaEDLC9Keu+P/1E4Xi6nK6ME2aL6OxPzpLer7GlTBAurH8BDQQIUJ6wehTeMXtX1
         mPFQ==
X-Gm-Message-State: AFuF++lxQSsuRgxi2bcZAAM0m2L9vjmWPUfDxZ98PK96IvS9oGS7A0jB
	qnUCF2Aq7DdrI4OthBwQdd7s+Bhqr1Y8gk1MOFIL4qP7PinsxySJ0GvE
X-Gm-Gg: AR+sD106BJ01OVz9waMfipaTAoG0TgaZNFTsrQ5fYX59WqU122tyJwSyV7BGkzR7XlI
	80pxcoE32J3Vb5NtL+G8HkpDVYF1lK7R0b6+gJ95BOVTXVVZUu4ke5vd9og0IZfddWLBxsIgLU+
	dnMRQv0UQIwAckE30X4WaxXaCQ1OaY7S/wIJXU4Y6wJldcW48CnScm0a5cLALZNiXZsGvAM/WFb
	aJmoLUnZZN1QIDzj0Y9YpNlGtTxpsY6rBYxb0i+SnL0hXvcgVW1E3JqPjFzs/Z1Aaf7RfJglXxB
	n5hVgn5/ZN8lswaY79Bj+iYGaWUCkDJMzE72TSe0j8QfcRda5/knu3FkqlRPL+hvFyM9ah6gDyj
	uPdOZTLrm8VeKLrpQUIUtsplfm7e/RLJa3+q4ZrAs/3vnyTwfRsacIFAC4DiIh9TyGGGMtYqg5H
	l9/+N9UdVja0l3Yk37gDvy1h6xFE9LoT1VA1V2pYJxp12jzUUWTvBBCztB/yExknfTivrkux5iZ
	/c4fpJwVa8VrWjYKS1vj5855VD5g9oNX/TDR0CJZOUEmOoAPpWAe+8L
X-Received: by 2002:a05:6a20:9149:b0:3c6:61b9:917c with SMTP id adf61e73a8af0-3cd4bb97247mr22516717637.11.1787507156011;
        Sun, 23 Aug 2026 10:45:56 -0700 (PDT)
Received: from localhost (75-172-9-230.tukw.qwest.net. [75.172.9.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f909c6c9sm20991252eec.6.2026.08.23.10.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 10:45:55 -0700 (PDT)
Message-ID: <6a8b31d3.6dfd78af.244576.33c7@mx.google.com>
X-Google-Original-Message-ID: <aosxzGx0Dp2nRJec@DESKTOP-HH660AU.>
Date: Sun, 23 Aug 2026 10:45:48 -0700
From: Dennis Tighe <dennis.tighe@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs: mount read-only when mft records are smaller than the
 device block
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

An mft record is written with a single bio of exactly mft_record_size
bytes. bio_unaligned() rejects a bio whose size is not a multiple of the
device's logical block size, so on a volume whose mft records are smaller
than that block no mft record can be written at all.

On 512n and 512e drives this is a non-issue; however, on 4Kn drives when
the mft record (1k) is smaller than the logical block size (4k) mft
writes begin to fail. At the same time, other writes that use all 4k
will succeed leading to a corruption situation.

This is a stopgap change that mounts as read-only. The longer term fix is
to perform 4k writes on 4Kn devices when writing the mft; however, that's
more involved.

Assisted-by: claude:claude-opus-5
Signed-off-by: Dennis Tighe <dennis.tighe@gmail.com>
---
From my testing:

Before this patch, on a volume with 20 files already on it:

  ro mount rc=0
  files visible: 20  <- reads are fine
  rw mount rc=0
  files created: 48  <- every creation reported success
  umount rc=0
  5 I/O errors logged

  next mount:
  ntfs_mft_record_check(): Record 64 has no FILE magic (0x0)
  map_mft_record(): Failed with error code 5.
  ntfs_lookup(): Found stale reference to inode 0x40 ... returning -EIO

  files: 0

The volume would still mount at the end, but the directory read as empty.
Looking at the disk, the mft had not been updated but 4 INDX blocks in the
root directory had been written. This occurred since the mft writes from
the original mount were failing while other data writes were succeeding.

With this patch, same volume and device on my test script:

  ntfs: (device vda): ntfs_fill_super(): mft record size (1024) is smaller
  than the device logical block size (4096).  Mft records cannot be
  written.  Mounting read-only.
  mount rc=0
  /dev/vda on /mnt/t type ntfs (ro,relatime,...)

Reproducing can be done without 4Kn hardware. I used a 4k image and qemu's
virtio-blk with logical_block_size=4096.

I noted this in the commit message, but this is very much a stopgap
measure to prevent corruption before full 4Kn support is added. It
seemed safer to me to fallback to read only for now and determine the
right path forward later. I believe there are a few options there that
are worth some discussion. 

 fs/ntfs/super.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 30481e5d5dd4..ed587bc5e477 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -2298,6 +2298,22 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		ntfs_debug("Changed device block size to %i bytes (block size bits %i) to match volume sector size.",
 				blocksize, sb->s_blocksize_bits);
 	}
+
+	/*
+	 * If the device's logical block size is larger than the mft record (1k)
+	 * writes to it will currently fail. Reads are unaffected, so we can still
+	 * mount the volume as read-only.
+	 */
+	if (vol->mft_record_size < bdev_logical_block_size(sb->s_bdev)) {
+		if (!sb_rdonly(sb)) {
+			ntfs_error(sb,
+				   "mft record size (%i) is smaller than the device logical block size (%u).  Mft records cannot be written.  Mounting read-only.",
+				   vol->mft_record_size,
+				   bdev_logical_block_size(sb->s_bdev));
+			sb->s_flags |= SB_RDONLY;
+		}
+	}
+
 	/* Initialize the cluster and mft allocators. */
 	ntfs_setup_allocators(vol);
 	/* Setup remaining fields in the super block. */
-- 
2.43.0

