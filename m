Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E92135C19D
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 02:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525448; cv=none; b=WXDcqsW6NJdSCOd1PgDtmtUXNHGPQnDT1BGXyEKb/oi9eDQeuAcXiilfzWzCmFdlK6FUYSK7aKi+npuKHqyq0PxHNr9DQYKxrxk9UioIf09kCYwOKsNz+H2/ufn2y23Zx2iBnWjaN62h8Ym0lphMybDurv1adzTY6JE26AA3O34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525448; c=relaxed/simple;
	bh=7zoJW784eKsxr5lz2aRiAZx1Z6yqMCJLUWUMD/FL/1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uPxnYK2pA33IvhLCACcTRe786QguVQN9UBGipghMk+tgeXVv1LzCwJEtOKUl1y9lddVGl0vLU4wgA/yHi82XCwOPy5fy9LiyXMf9G6oYzNZPXHjRl+xScFfH6cIrNNr5eKyGIO3KntqqWCWcj4b9at7gXTGZPrOxE5MZxBxi2do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Id0KTDIp; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Id0KTDIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5G
	dUovSWZnSC1UvWcVNe6LAbHS8B3cN9V13TflmWRhs=; b=Id0KTDIpaAJKNe1lYq
	08JKATE408CsApoP5eodXRYIec8MtRweQNP7CGcdfiOhSx/6RWFMsUAKaYkfs7OP
	HnXZ4OOd9UKQgARY6wkzNHieSTEntXie/TzPWV1qBu2t/22vliouhYeKHwlWYKVz
	ryD8SHsYMd/FzEiPOrqkqc9iM=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3J2qz_alqzNjjAw--.2073S2;
	Wed, 16 Sep 2026 10:23:50 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 0/5] ntfs: report filesystem errors through fsnotify
Date: Wed, 16 Sep 2026 10:23:40 +0800
Message-ID: <20260916022345.1151836-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3J2qz_alqzNjjAw--.2073S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw18uFWrKr4fJw47tr4ktFb_yoW8Cr4UpF
	93Awn3Kwn3try2qr9I93y2q3WF93s5G3yjqr17X347Gr18AF1UtFWrt3W8ZFyruryrWw1U
	Jw1UG39xCryjyrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnhL8UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RaxfGqp-bayMQAA35

From: Baolin Liu <liubaolin@kylinos.cn>

Report NTFS metadata and shutdown errors through the generic filesystem
error notification infrastructure. Use volume-level events when no
affected file is available and file-level events when an inode identifies
the failure.

Split the reporting by allocation, attribute, inode, MFT, and shutdown
domains. Propagate reporting state through attribute searches,
mapping-pairs updates, and MFT mappings so callers do not emit duplicate
events.

Changes since v1: 
- Restrict patch 1 to the volume helper and non-file allocation rollbacks.
- Introduce the file helper with attribute reporting in patch 2.
- Separate inode and MFT reporting into patches 3 and 4.
- Adapt MFT writeback reporting to the current asynchronous I/O path.
- Keep shutdown reporting independent in patch 5.

Testing:
- Built fs/ntfs with W=1 after each patch.
- Booted the patched kernel in QEMU and monitored FAN_FS_ERROR events on
  an NTFS volume with fanotify. Verified that volume metadata errors report
  EIO without a valid file handle, file metadata errors report EIO with a
  valid FID, and shutdown errors report ESHUTDOWN.

Baolin Liu (5):
  ntfs: report allocation metadata errors to fsnotify
  ntfs: report attribute errors to fsnotify
  ntfs: report inode metadata errors to fsnotify
  ntfs: report MFT errors to fsnotify
  ntfs: report shutdown errors to fsnotify

 fs/ntfs/attrib.c   |  88 +++++++++++-----
 fs/ntfs/attrib.h   |   6 ++
 fs/ntfs/attrlist.c |  16 +--
 fs/ntfs/bitmap.c   |   2 +-
 fs/ntfs/inode.c    |  62 +++++++----
 fs/ntfs/lcnalloc.c |   4 +-
 fs/ntfs/logfile.c  |   2 +-
 fs/ntfs/mft.c      | 252 ++++++++++++++++++++++++++++++---------------
 fs/ntfs/mft.h      |   6 ++
 fs/ntfs/super.c    |  27 ++++-
 fs/ntfs/volume.h   |   4 +
 11 files changed, 329 insertions(+), 140 deletions(-)

-- 
2.51.0

