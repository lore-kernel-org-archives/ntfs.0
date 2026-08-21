Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B208C403B10
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290387; cv=none; b=W9vq4m7KybbxCcHJojNTjw8d4vx7D1UdhGhTiyH9QmGmh2bTlrAt6kWxMri8pOhq9Ax359yD0OZZRb4wFOA2wxGUhHkSqeEV7bEZ6KHcu+Uk56ClNPQufIkimKijb4WEp2lyZbeJTQbSgMhYHljXTstSRUkHNNSQt5BDNJmcLfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290387; c=relaxed/simple;
	bh=rG9/5whMLFzxlYA0WBDa8QbuRpAiX1b6RqvS6zZKCq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXkQmQDLFhFItBNewd39X0x3c4ueDTNe9iuSK+izM2UeGwURVf+/ClkFZCSRqzx6XOafN9e2CgD7gDoYIjD7dSuiVwB/wygAz8opiC1ZmzQy4fg3ie5M9WRE31INJE7fG04TWop7tym5x5eKGPb8vXtTR73ZYBmrbsEHja4ksSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qK98Bvq/; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qK98Bvq/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=4j
	UovKIvcXbStcAehtc2/3r4Y3/x+PfHFNP/t6niMHo=; b=qK98Bvq/zx3Sldt96s
	rR0Scl0/NHmh7u7JDdtSf1usAlu9mFeZpKRuWUbSd4M207vZRTCiVIYHj31hbxCI
	1LrVbTcSuP8p1t8LY1ELhubMn2Cp0Ts/XeMT6BV8cq72XHHZaT+YpYWwWx0Y13SM
	KSg6jBVRPjWq+b/t3MC3azrmA=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnzHn44odqtfQKPQ--.8742S5;
	Fri, 21 Aug 2026 13:32:48 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 3/9] ntfs: propagate reparse index insertion failure
Date: Fri, 21 Aug 2026 13:32:32 +0800
Message-ID: <20260821053238.1281310-4-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260821053238.1281310-1-liubaolin12138@163.com>
References: <20260821053238.1281310-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnzHn44odqtfQKPQ--.8742S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW7KryxJr1UJr1UCw13XFb_yoW8JF47pr
	Zxua1rKayxJr10ka1vyF4DZr10kw17G3yUta4rZ3WfK3WFqr1kt3yrKFsYgryrCa48JFWU
	Xr1rKr43ZF4DA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRG9aPUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwgB1QGqH4wCi9QAA3u

From: Baolin Liu <liubaolin@kylinos.cn>

update_reparse_data() ignores the return value of
set_reparse_index(). When index insertion fails, the code removes
the just-written reparse data as cleanup but still returns 0, so
symlink(2) (and WSL special file creation) reports success while
no reparse data exists on disk. When there was no previous reparse
data (oldsize == 0), the failure was likewise silently ignored.

Propagate the error to the caller.

Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/reparse.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/reparse.c b/fs/ntfs/reparse.c
index a8e413c61353..905ee08422d4 100644
--- a/fs/ntfs/reparse.c
+++ b/fs/ntfs/reparse.c
@@ -618,8 +618,9 @@ static int update_reparse_data(struct ntfs_inode *ni, struct ntfs_index_context
 		goto put_rp_inode;
 	}
 
-	if (set_reparse_index(ni, xr, ((const struct reparse_point *)value)->reparse_tag) &&
-	    oldsize > 0) {
+	err = set_reparse_index(ni, xr,
+				((const struct reparse_point *)value)->reparse_tag);
+	if (err && oldsize > 0) {
 		/*
 		 * If cannot index, try to remove the reparse
 		 * data and log the error. There will be an
-- 
2.51.0

