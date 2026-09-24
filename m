Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C293ACA58
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 10:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247106; cv=none; b=GL7DlajliKmOpCoZG3LHptQdL6DvpqDzsmKAz9epLYTOjTdsRhcEBGji2BhQVygrKHB1WxBC7w0/RarcgAkMAw6D9b9ndwlLEQzTBqJv1KGiw2M5TYymnOCL+YpLpkJfliyZpJvB6GCiZQop1mKtjL3K8McFjCRVbv52+TN/VCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247106; c=relaxed/simple;
	bh=udv3pN6JGLOROzjpDV16RH4kQg/3UFq0mNydJmYnm4g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bcCfJvTsf90HJsM028nQan2IsJgzOUmUWSEVjG2aZGwbMm93noLQFvaNwzTCQQkCDhSyKSLsnvJK9/jzcauJfqsuGMxAc1ZqHn4jymryeYla4vnTgzqMnVdHz8UtDru7RalUY+WZmPS0IeQRSUPmglKwugUK0yIB0w8tqBbU99c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RprfY7uu; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RprfY7uu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Au
	27lUNj1GK7J3KD7BF4roguS87dAGZ5tWOs9x7uxlk=; b=RprfY7uu/1BbL0JIp6
	EyWNcW2QuC5oiiXAdPMDcg8C461e3zPAiepQhZJVN3ffUpP6sfKjCX0Pqhq3b+73
	MSY6ngAK4JrbwvdKPwTooyR9sraFqeAM7ZBXh3Wwwri5ku2Nv/9GlWzWgGaNAiCI
	v38OB2ZbFYE1aHipzheJ5SjPQ=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgBHFxixALVqNOv+Aw--.7356S4;
	Thu, 24 Sep 2026 18:51:33 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/3] ntfs: drain in-flight DIO before buffered write fallback
Date: Thu, 24 Sep 2026 18:51:24 +0800
Message-Id: <20260924105125.577714-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924105125.577714-1-yaojiale02@163.com>
References: <20260924105125.577714-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgBHFxixALVqNOv+Aw--.7356S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF4kGFy5AFykKF47tr1rXrb_yoW8Zw1Upr
	ZIkFy5Gr9rtr4xXwn7CF4rW3WFkrZ8X3y3ZrWkWw1kCrW8Gw4vga18tF1jvryrJFZrJr42
	qa109rWkZryUZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zircTPUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhU1b2q1ALV1pAAA36

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
fallback path.

A reproducer using concurrent AIO direct writes and buffered fallback
triggered the following warning and made a subsequent fsync() return
-EIO:

  Page cache invalidation failure on direct I/O.  Possible data corruption
  due to collision with buffered I/O!

Fixes: 9c87959601e8 ("ntfs: update file operations")
Link: https://lore.kernel.org/r/20260629113827.4074335-3-libaokun@linux.alibaba.com
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 fs/ntfs/file.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 007d1614b9ac..2fc2ffde3846 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -527,6 +527,13 @@ static ssize_t ntfs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 
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

