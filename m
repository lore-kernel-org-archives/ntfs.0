Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFE94746B3;
	Thu, 24 Sep 2026 11:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247970; cv=none; b=MWER03FlS49jwnpQaAJR7pQKwQIRIO7qfXj8UMDBwlb1vyldmS+zVdwdwF6MQVkAGwlrw8MT35kPq/Sq8n/d76YSN8RJ9wbeS0JXsF48QTAF1mzCABR4663RsdmYGa/GJqeMQqb2d+Mm8Gq2Y2YzldnitK7BepDkuKrAH2ueJUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247970; c=relaxed/simple;
	bh=5gW3H/1yVOxL00jh4JY44hYMcfiOVXML9SuZIS61MNk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hrH2cAGvPJOWIGO+8WiFPs5eTRzhFciWZUbhuqFEcudXUy6yATQk1Cg8c1VbOR/RJqrJVqHo/3QOWjW0YVqUMTqbQM9H9VLhsEtJbbUo+qctf14ud06quMYJGJbyaySZ9SaBJmTszhdCizoCVHnRzdUANmX60yMVYI1f9DLAeHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FA5Gz0CO; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FA5Gz0CO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=2C
	SflERWiIEUtHIYwYt7AZ8Vjsf1CeCsPdvuomIllHU=; b=FA5Gz0COAgBSrDFqeE
	mx557yHlDT1xWLSeptLBqgN/xZFdKtdpGk1RluFFHFZsKcEWzyzz+iGxblajghdN
	WUw994pKSmYfNsrPNc9J6l/ObxUS6snYHSY5R1I9rTq4kWavMgI5XhHtoU4N4XUM
	VuetSygpUmpbKzp2FAVBfQYI8=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3N3wNBLVqE0AmAg--.64280S3;
	Thu, 24 Sep 2026 19:05:52 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Jan Kara <jack@suse.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	ntfs@lists.linux.dev
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 1/3] ext2: drain in-flight DIO before buffered write fallback
Date: Thu, 24 Sep 2026 19:05:42 +0800
Message-Id: <20260924110544.601390-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924110544.601390-1-yaojiale02@163.com>
References: <20260924110544.601390-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3N3wNBLVqE0AmAg--.64280S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFyUuryxtFyDXr47tF1DJrb_yoW8Zrykpr
	Z093W5JryqyrZ7Wwn7Wa18ur1fK398ArW3XrWvv3WDCry5Gws0gF4ktr1jvF1fGFsrJw4Y
	qan29r97u3W0yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pMOJYwUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRENR2q1BBFIDgAA3a

An asynchronous direct write can remain in flight after the inode lock is
released.  If another direct write falls back to buffered I/O while the
first write is still pending, generic_perform_write() can dirty pages
before the first write completes its post-I/O page cache invalidation.
The invalidation then finds dirty pages, reports a page cache invalidation
failure, and records -EIO in the mapping error sequence.  A later fsync()
therefore returns -EIO.

Commit 15cdefd0c0522f9d5e12d947fa04f4c11649b699 ("ext4: drain
in-flight DIO before buffered write fallback") fixed the same race in
ext4.  Ext2 has an equivalent fallback after iomap_dio_rw() returns
-ENOTBLK or a short write, but does not drain other in-flight DIO before
dirtying the page cache.

Wait for in-flight DIO before calling generic_perform_write() in the
fallback path.

A reproducer using concurrent AIO direct writes and buffered fallback
triggered the following warning and made a subsequent fsync() return
-EIO:

  Page cache invalidation failure on direct I/O.  Possible data corruption
  due to collision with buffered I/O!

Fixes: fb5de4358e1a ("ext2: Move direct-io to use iomap")
Link: https://lore.kernel.org/r/20260629113827.4074335-3-libaokun@linux.alibaba.com
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 fs/ext2/file.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ext2/file.c b/fs/ext2/file.c
index b9020df7d89e..67fe423c3828 100644
--- a/fs/ext2/file.c
+++ b/fs/ext2/file.c
@@ -135,6 +135,13 @@ static ssize_t ext2_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		int ret2;
 
 		iocb->ki_flags &= ~IOCB_DIRECT;
+
+		/*
+		 * Prevent concurrent direct I/O and buffered I/O to the same file
+		 * range. Wait for in-flight DIO to finish before dirtying pages.
+		 */
+		inode_dio_wait(inode);
+
 		pos = iocb->ki_pos;
 		status = generic_perform_write(iocb, from);
 		if (unlikely(status < 0)) {
-- 
2.34.1

