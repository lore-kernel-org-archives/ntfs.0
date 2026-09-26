Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2BC364E84
	for <ntfs@lists.linux.dev>; Sat, 26 Sep 2026 07:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790407600; cv=none; b=ZU4E5x+YyMNgx15KzkPE3LGg7+yMTWYDAS2vZypP0VeslVg23CoYeTp7YcCu00is1QdT1YuvQ+J51ZKpBZoVbzBPM2nQgtFyhUvKH2+I9a8HKyGMVFluZkOjLg3e96hfggoq3d/VZOuWkvMLFRVH9SKF86+JIdjE9P66O5Ya/1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790407600; c=relaxed/simple;
	bh=0EtfCmZ0p2dUZdtvI6F9HDjnSU/gEbK33PB0ZK9PGdE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ub3rkSdIEKMeHxsUa4HKFgG8FAu2NrPK6lDwl6/88lX826DMRtSZ1rXdY5zRB8c8wSJOIO1+tjFhmhjkBmHf9LUUnEdrcLDugyeBa8sh8k3OgrXuAnkrBEY+oX8g6RqU/T+Yx1FJY/Fkgn/bFqBZ87X9gecR1D7N3y2jBPgsnFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Wzm7aQ/b; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Wzm7aQ/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=gH
	adxr7TyOC1tZSrKIdTJZQnpZqrbTw6TfKCTn5flFI=; b=Wzm7aQ/bZeqQ81vKDG
	9p2T7cuPZT+aDSuiFAlMHCFvtf+xqHgCMDLHWvhFvdJxHCTvvF27y2tENYu4BGsQ
	ZKEJXuNYHe2zWVXNsrH/d23jaK/+CylMCIqVaPq+1TCsuQV1clRm/IQc/NAdzscb
	iOre5PB+Jkovv7AcFzLnONWX0=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3v62dc7dqbEDbAw--.41165S4;
	Sat, 26 Sep 2026 15:26:26 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2 2/3] ntfs: drain in-flight DIO before buffered write fallback
Date: Sat, 26 Sep 2026 15:26:11 +0800
Message-Id: <20260926072612.3022680-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260926072612.3022680-1-yaojiale02@163.com>
References: <20260926072612.3022680-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v62dc7dqbEDbAw--.41165S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF4kGFy5AFykKF47tr1rXrb_yoW8KF4kpr
	ZI9Fy5Jr9rtrZ7Xrn7CF48W3WFkrZ5J3y3ZrWDXw17Cr15Gr4vga18tF1Yvr4rJF9xJrW2
	qw4v9rWkCryUZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRn2-8UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQKNx2q3c6L+XQAA3q

An asynchronous direct write can remain in flight after the inode lock is
released.  If another direct write falls back to buffered I/O while the
first write is still pending, iomap_file_buffered_write() can dirty pages
before the first write completes its post-I/O page cache invalidation.
The invalidation then finds dirty pages, reports a page cache invalidation
failure, and records -EIO in the mapping error sequence.  A later fsync()
therefore returns -EIO.

Commit 15cdefd0c0522f9d5e12d947fa04f4c11649b699 ("ext4: drain
in-flight DIO before buffered write fallback") fixed the same race in
ext4.  NTFS has an equivalent fallback after iomap_dio_rw() returns
-ENOTBLK or a short write, but does not drain other in-flight DIO before
dirtying the page cache.

Wait for in-flight DIO before calling iomap_file_buffered_write() in the
fallback path.  Since NTFS supports IOCB_NOWAIT, do not enter the blocking
fallback for such requests.  Return -EAGAIN if no bytes were written, or
preserve the positive short-write result if the direct write made partial
progress.

A reproducer using concurrent AIO direct writes and buffered fallback
triggered the following warning and made a subsequent fsync() return
-EIO:

  Page cache invalidation failure on direct I/O.  Possible data corruption
  due to collision with buffered I/O!

Fixes: 9c87959601e8 ("ntfs: update file operations")
Link: https://lore.kernel.org/r/20260629113827.4074335-3-libaokun@linux.alibaba.com
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 fs/ntfs/file.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 007d1614b9ac..8bbfa842889a 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -525,8 +525,21 @@ static ssize_t ntfs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		ssize_t written;
 		int ret2;
 
+		if (iocb->ki_flags & IOCB_NOWAIT) {
+			if (!ret)
+				ret = -EAGAIN;
+			goto out;
+		}
+
 		offset = iocb->ki_pos;
 		iocb->ki_flags &= ~IOCB_DIRECT;
+
+		/*
+		 * Prevent concurrent direct I/O and buffered I/O to the same file
+		 * range. Wait for in-flight DIO to finish before dirtying pages.
+		 */
+		inode_dio_wait(file_inode(iocb->ki_filp));
+
 		written = iomap_file_buffered_write(iocb, from,
 				&ntfs_write_iomap_ops, &ntfs_iomap_folio_ops,
 				NULL);
-- 
2.34.1

