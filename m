Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D143E1D11
	for <ntfs@lists.linux.dev>; Sat,  3 Oct 2026 09:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791019859; cv=none; b=U1bcEXJvHwDxMCDQh2PC7rRCY8RxO/cparqxkXIUeelNIrmuh7kx5tvkzslVLb+kDiji338PSZTMXgJQasGbzz6+ooBkWUq1hIhYCfBIkSbgqIDi7b0/5RvMxjIzpGeMQAk4+pf5XFZ2ixusCXVeO7ZpjSPPkSakEn5iWISOaIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791019859; c=relaxed/simple;
	bh=sqWWb+KrOed5w2rVpp9l70Fk+QFdBHj91H1186lPvGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hW47x0JSpe7lfmeVdd6JtlgOkFRnl+L42ayjR2P8LdD4xJMrqqDQoYKJLVJRb3FIoyHA0CS1Am3aYy76LUccDR9fJjOLwIl3ynyIInRoJL6mgXAU9TrPaAooL8FsvZZJ6oeLoz3zrB2QVGMVR+KdSDtOqmo1LvBhxrMg9+fhDkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZwnIcAQ5; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZwnIcAQ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=QQ
	67WtE24na388y85ditoe0V9ALxaizzu0oal6aJ/IQ=; b=ZwnIcAQ54ohVrl0slU
	fCZ0s5KsuDDMyPOg/9smtJsh0HyPN4Cv6d0/IeWzx+P8P48EJtCsUz/4EGd/bQR7
	9z8ZNMBO77Mh0AkxN3ekGRLblsUrdL3Xby61bbtya/kJJiBnhh+vzi3yKjchihPR
	3tyU5ZedaEjoO1YSnKxYaYu74=
Received: from pc.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBnTqs9y8BqZLmrCg--.23213S4;
	Sat, 03 Oct 2026 17:30:43 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 2/3] ntfs: drain in-flight DIO before buffered write fallback
Date: Sat,  3 Oct 2026 17:30:34 +0800
Message-Id: <20261003093035.532916-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261003093035.532916-1-yaojiale02@163.com>
References: <20261003093035.532916-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgBnTqs9y8BqZLmrCg--.23213S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF4kGFy5AFykKF47tr1rXrb_yoW5Jr15pr
	ZI9Fy5Jr9rtrZ7Xrn7CF48W3WF9rZ5J3y3ZrWDXw17Cr15Gr4vga18tF1Yvr4rJF9xJrW2
	qa1v9rykCryUZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi4v3OUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8ATOCWrAy0Q7XQAA3w

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

