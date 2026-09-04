Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9E1175A9D
	for <ntfs@lists.linux.dev>; Fri,  4 Sep 2026 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512494; cv=none; b=dw+PKNrQbfrWbEahfmWDftTmr8l0PiEAc99YgFa11y3j4iEq8YmvvbDeBqoz1qqiyJbGHTLw8n/uQg+kpA2NBZsHeXYFL3n2zfAR1L57/JV0tKTsRsL37uqH649I118Q+nJJf2zZx4EELbOuOzvZe15nEpZ2QbQk40h/NWtd74k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512494; c=relaxed/simple;
	bh=nFmFAlfMfvchNY8wxK6eXDlPjjlVlM5IsxUS5faaTzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UrQqGVaSvFR3xNslUOE3sOpNdJCt26H/xWo9cx6aDPA8yVXc+QJ8M1CyjmJIXRtbO52VcTpTaCm/wnl71y2oN05YJuxER3xP6Ic9rNbUlmBrcsLqWm/w0KlixxmSZuo5kKnKumT2YhWSJJ06SaLsb6HNVUyZ46kiMRlagbvLQX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=W3yrBs7f; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="W3yrBs7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=nu
	j0+1XQbhDECxrIopxhQRoG1J/egygz61nzFEiJBpk=; b=W3yrBs7fwzFqRNOgA1
	MEseH6I/LZrHsvJHG2cfBuMw5+m6thAUzwRu6V7xwTOi1+bWYQExAlR/6cfaw1Mc
	GflyyD7vIibK4VbVxmSoTmp9gvi2PYzM1GyZS06KQqx5iX84l2JhfRxL2tReRWUf
	18TmixH6Veid/+UM34OgwD9Zc=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAHU97ViJpqDNWCAg--.41284S5;
	Fri, 04 Sep 2026 17:01:20 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 3/5] ntfs: preserve the truncate error in ntfs_enlarge_attribute()
Date: Fri,  4 Sep 2026 17:00:52 +0800
Message-ID: <20260904090054.3365538-4-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260904090054.3365538-1-liubaolin12138@163.com>
References: <20260904090054.3365538-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHU97ViJpqDNWCAg--.41284S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFy3CF4rCF45CFW7XFWkZwb_yoW8XrW8pr
	ZrAry7Kw4Fv347Wr1v9a1qq3Wjvay3KrW5tFyq9w1xA3Zxtw1Dt34Fyw10gw4IkrW8X3yj
	qr48uay7uFy2vrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jW9a9UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QCbZmqaiOCwPQAA3B

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_enlarge_attribute() discards the error from ntfs_attr_truncate() and
returns -1, which reaches userspace as EPERM. The discarded codes are
meaningful: -ENOSPC when the attribute cannot grow, -EACCES when it is
encrypted, -EOPNOTSUPP when compressed, plus -EINVAL and -ENOMEM.

Most callers of ntfs_inode_attr_pwrite() compare the result against the
requested length and substitute -EIO, masking this. ntfs_ib_write() does
not; it returns the value verbatim, which propagates through
ntfs_index_add_filename() to __ntfs_create() and __ntfs_link(), so a full
volume reports EPERM instead of ENOSPC from create(), mkdir() and link().

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/inode.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 747a60ae27c9..9b2ff15da94c 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3618,9 +3618,10 @@ static inline int ntfs_enlarge_attribute(struct inode *vi, s64 pos, s64 count,
 		return -EOPNOTSUPP;
 
 	if (pos + count > ni->data_size) {
-		if (ntfs_attr_truncate(ni, pos + count)) {
+		ret = ntfs_attr_truncate(ni, pos + count);
+		if (ret) {
 			ntfs_debug("Failed to truncate attribute");
-			return -1;
+			return ret;
 		}
 
 		ntfs_attr_reinit_search_ctx(ctx);
-- 
2.51.0

