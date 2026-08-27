Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD263644BE
	for <ntfs@lists.linux.dev>; Thu, 27 Aug 2026 06:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787813041; cv=none; b=Kyw6QDvfqgUNIvZ5albSGFHWIadTv2GnEfHBKr7qImnKfEk9F3r6aOtrhRcCbN4zPVQL4vzJveUtFMJAM+LIoo+26K6s0qyMVbXOGWTP1eYGhORnyXBiQ9c2N11WB6r6TS1K6k4XTDW24wTySg9Jn2dlDKFBAkHUawd8oDdkYGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787813041; c=relaxed/simple;
	bh=HywmGVnxKlAHZInwgVBJgLVgCYVuOmXDCv+c+JgZ0JM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NuV/i3dy6ZB9Q9hHFVQK2M+8CzJZ1FzkVxjTbciD7SAMKH5pnRfSe8xqP8Xk5HmNp68iWv8y3dSdi6iVpn4cMUjK3hfhjuE12hSlbc86vOHvjl3jYqf1FhErVxgRDBZZQmfvVTNZI77fJTzZucQZ/JfIL+HHVxZInIcNJZi6c/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qV+WljVh; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qV+WljVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=zk
	Al6G439mZlrQuDeRjXw0tGtyICJx0hovFj4l5wQOc=; b=qV+WljVhxpqYMO6Nbv
	4MrX1Swa5SPBwNhqYcU15JzHa7Fe4ml92SAo7k9BHHJ6PF7qmKWnDC1NMyxqSriH
	niLFCLg4nuHmnwebjD5Ni5UOrqdc3ZwcDPg9VcemQ6UiDD3EmFUth49Flb7TzMEw
	bJfsOjLLPjaOvu80Eejr1JTRU=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3nwSY3I9qUB_9NA--.52121S2;
	Thu, 27 Aug 2026 14:43:37 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2] ntfs: leave HasEA flag untouched on setxattr failure
Date: Thu, 27 Aug 2026 14:43:17 +0800
Message-ID: <20260827064317.2252884-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgD3nwSY3I9qUB_9NA--.52121S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFy5Cr43Aw1fGFy3WFykXwb_yoW8Xry8pr
	93GF1UKw4jqr17CFykK3yqqa97Z3y7Jw40yry7Kw1Skw4Fqr4Yyw40k3W8W3yfKryfJa15
	KF15ua9IyF10vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jeBT5UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RnbpmqP3JkAPgAA3T

From: Baolin Liu <liubaolin@kylinos.cn>

In ntfs_set_ea(), the exit path unconditionally updates the HasEA
flag based on ea_info_qsize. When an error occurs before
ea_info_qsize is updated, NInoClearHasEA() hides existing on-disk
EAs until the inode is evicted.

Only update the flag on success.

Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
v1 was posted as "[PATCH v1 2/9] ntfs: fail EA update when reading
$EA_INFORMATION fails" in the "ntfs: assorted error path fixes" series.

Changes in v2:
 - Rebased on ntfs-next.
 - Dropped the -EIO return for a failed $EA_INFORMATION read, which is
   already handled on ntfs-next by 56cc42a7b387 ("ntfs: return errors
   from ntfs_attr_readall"). Only the HasEA flag part remains.
 - Updated the subject to match the remaining change.

 fs/ntfs/ea.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 9f0222c172d9..33ef4f4b439c 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -404,10 +404,12 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 		*packed_ea_size = p_ea_info->ea_length;
 	mark_mft_record_dirty(ni);
 out:
-	if (ea_info_qsize > 0)
-		NInoSetHasEA(ni);
-	else
-		NInoClearHasEA(ni);
+	if (!err) {
+		if (ea_info_qsize > 0)
+			NInoSetHasEA(ni);
+		else
+			NInoClearHasEA(ni);
+	}
 
 	kvfree(ea_buf);
 	kvfree(old_ea_buf);
-- 
2.51.0

