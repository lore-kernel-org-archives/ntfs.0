Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7752E37475D
	for <ntfs@lists.linux.dev>; Mon, 28 Sep 2026 08:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585694; cv=none; b=IF/GxfC2jafQVqc7aylCakhs4uG1dlw//oeq/0rEqxlmJ4H+juAecxZZBTLeB4i8w6j02v7gwDE5MbSzSExL3CEJ3ESTgUJ5VPa5NsHa6ki6WtBVuUzT39hAUP0xJlVKlcUUevl8P4+R+4JOm0Ok1W3FJdGaw6UBFTLX95kb20o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585694; c=relaxed/simple;
	bh=sqWWb+KrOed5w2rVpp9l70Fk+QFdBHj91H1186lPvGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u6wZf6s6mANHBIoJLzV9I62RhsjEbJT8XW8wP+C0YVtLghStlG22yvF7trlxN9GfS8NyIDkQ8XYzOGO+ln+AnFHBVe63L9XZmYyxqS2d5N1eleTlf9SIWgloucuNwIu4YLHTdLgdODNEmg7LFtxsziopfutykVrAHn7LHj8sKuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Bpn69TJW; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Bpn69TJW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=QQ
	67WtE24na388y85ditoe0V9ALxaizzu0oal6aJ/IQ=; b=Bpn69TJWAwGhCDc9ka
	v5qENsFmCjWZ3LtVn2e7qNKC9rO3uxxMI2jq8CLEinrZFiSc9umL2mSR4OFrrLOB
	YqjC+nnOECH4U4CZih9xbYhyOl0DrsMRpif/AIJy8Pv6tvSmpEaqEBg42sT8+Ibg
	kyurz3bYHgjZ7nJXutfuFVih8=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3t582K7pqm5HnBA--.52401S4;
	Mon, 28 Sep 2026 16:54:18 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v3 2/3] ntfs: drain in-flight DIO before buffered write fallback
Date: Mon, 28 Sep 2026 16:54:11 +0800
Message-Id: <20260928085412.2221055-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928085412.2221055-1-yaojiale02@163.com>
References: <20260928085412.2221055-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3t582K7pqm5HnBA--.52401S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF4kGFy5AFykKF47tr1rXrb_yoW5Jr15pr
	ZI9Fy5Jr9rtrZ7Xrn7CF48W3WF9rZ5J3y3ZrWDXw17Cr15Gr4vga18tF1Yvr4rJF9xJrW2
	qa1v9rykCryUZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi6nQUUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BoiXGq6Kzom7AAA3f

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
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
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

