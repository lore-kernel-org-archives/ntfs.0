Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAAF4052A2
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290387; cv=none; b=sjMxHMeUuLeNNsEpJ6tPEIXqdTGTrQFLwKX9nHd0c0C9B1u8zOQaCvIJcKyCIBb6bQdFCuyYroaFt0ADfFAn5i/hPxTZVM2r2+3IPk6I3G92sOSsg4A3Lfhz0SFhp6R5OGjf2pDQEhs0TxQTNhmbcPXdOARTsowpIvS+PoAjp6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290387; c=relaxed/simple;
	bh=TkgKfvPT2nFMf1oHwvnqTONNrqBBnvQxQnK/3SqiONI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ck/4WSnnkSm6STjIkKuR0ak4hD7YUxT9PAQfoHB/3rSZY67BXnYmyDjpXmoZ4QzhitBukhn9muAYTjxNWd5OOg8dBbVzH9zX69KwXa5/DHm7e2CytpDKwOSD1j2ZkrX99ESgmRDIpu19vLy38RjBUm98CPchguj7Wz0Nmf3RP+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=InmD0Y+/; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="InmD0Y+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5w
	fuxiB09fZYFgvyQ9QV9gW1tQw1xmTBQgDduRhmWjg=; b=InmD0Y+/FVWBfCUCGS
	sScw6ZxsuLGMVu6HLShbU8rCbD4HidNjktVtUXEYWE1uth5niHBhWgTMwMz3O7A9
	XmtwAMtcT2lG+lQhc42SQetRHOvFeI3VmMhXQjWR2busB/b7PYiSAOxzjc2iz3BW
	kwr7DyGWqt+LyxzOeFrgkZFM4=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnzHn44odqtfQKPQ--.8742S2;
	Fri, 21 Aug 2026 13:32:42 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 0/9] ntfs: assorted error path fixes
Date: Fri, 21 Aug 2026 13:32:29 +0800
Message-ID: <20260821053238.1281310-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnzHn44odqtfQKPQ--.8742S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw1rWFy5Wr1ktw18trWDJwb_yoWkJFg_ua
	n7X34kG34DXF9xW3ZFqr1jgrZxKay09Fn5KFyrtF4kJrW5JF1DKr1DCrs8XFWkWrWxKw15
	Jr1rGa4SvrnF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRAwI63UUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwRtzPmqH4vuU0gAA3l

From: Baolin Liu <liubaolin@kylinos.cn>

This series fixes a number of problems on error paths in the ntfs
driver: errors that are swallowed or collapsed so operations report
success or a wrong errno (patches 1-6), a kmap_local leak (patch 7),
and free cluster miscounting on failed frees (patches 8-9).

Baolin Liu (9):
  ntfs: return DT_UNKNOWN on inode lookup failure in readdir
  ntfs: fail EA update when reading $EA_INFORMATION fails
  ntfs: propagate reparse index insertion failure
  ntfs: return -ERANGE for undersized xattr buffer
  ntfs: preserve error code in ntfs_resident_attr_record_add()
  ntfs: return real error from ntfs_non_resident_attr_record_add()
  ntfs: fix kmap_local leak in write_mft_record_nolock() error paths
  ntfs: only count successfully cleared runs when freeing clusters
  ntfs: skip free cluster decrement when rollback fails

 fs/ntfs/attrib.c   |  4 ++--
 fs/ntfs/ea.c       | 18 +++++++++++-------
 fs/ntfs/lcnalloc.c |  9 +++++----
 fs/ntfs/mft.c      |  4 +++-
 fs/ntfs/reparse.c  |  7 ++++---
 5 files changed, 25 insertions(+), 17 deletions(-)

-- 
2.51.0

