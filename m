Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584C2369D6E
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290390; cv=none; b=CBDb3irnJozwJ7yCxcr17viLvd5CkQt+CoO08FUGYdm08QVW8xjD3XJa48S8TguTW1/GT2Kxh1FI+7XwPw4+zBtl+RBMGM7lMTsUMFDpyRLhLRzUTpOUmGwp/m9ACUJdRI4nniPjljzAFEeI98u7xh2LrZJjn9YfGn4QP24Ou5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290390; c=relaxed/simple;
	bh=PBpTp0PsaWchJZZ16pDrvCCQvsD9rrqXyUFIJajPSFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T0Z5AR1MzSJe51/v8tP+5kql2CXzP5NgH4eyHPBNeSDbFyqCBSNoEPTzlirIi9kQcdEsb6v0BALtmx5jw9SEGrDkfkguIOLhquZ6oLiJmqbpIoyFe7aOUC+CCDiVvVAG88tSjIyhPxpqXSf4szjPO1btnutohx556nsTKs6pr6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BYC615oi; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BYC615oi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=jM
	UxUTOh7D6jKzuUn54ZoReOZbsAvOg31bl39zQnPd0=; b=BYC615oinchjKTUIVP
	FDc2tTUCsO6Zde5r5KDrV9135ME1bmb7FrTkVYK4IfqlVj/vHa7rScXPqsoQdOIK
	9Jkx86t5HcHbHcnPkZw6/LkJ3l6c9fU0wskSUFaapiyYwrvJhUzS2eWIIDVA3t7b
	ejT+DVIPLLy3oIo6csXYYMMRg=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnzHn44odqtfQKPQ--.8742S4;
	Fri, 21 Aug 2026 13:32:46 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 2/9] ntfs: fail EA update when reading $EA_INFORMATION fails
Date: Fri, 21 Aug 2026 13:32:31 +0800
Message-ID: <20260821053238.1281310-3-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wDnzHn44odqtfQKPQ--.8742S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFyUuFWDtFW8Gw48tFy7Wrg_yoW8AFy5pr
	yfGa4UKw43Jr12kF97CFWvqay5ZrZ7GrWUtryxKw1S9wnYqr1Utw4jya4kuFWfKryrGw1F
	qFs0g39xZ3WjgaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pNiihbUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwR50P2qH4v6VIgAA3S

From: Baolin Liu <liubaolin@kylinos.cn>

In ntfs_set_ea(), when the $EA_INFORMATION attribute exists but
reading it fails or returns an unexpected size, the function jumps
to the exit label with err still 0, so setxattr(2) reports success
without writing anything.

Worse, ea_info_qsize is still 0 at that point, so the exit path
calls NInoClearHasEA() on an inode that does have EAs on disk,
hiding all existing EAs until the inode is evicted.

Return -EIO in this case and leave the HasEA flag untouched on
failure.

Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/ea.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 59e5e86e38e3..10d5b192f07e 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -208,8 +208,10 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 	if (ntfs_attr_exist(ni, AT_EA_INFORMATION, AT_UNNAMED, 0)) {
 		p_ea_info = ntfs_attr_readall(ni, AT_EA_INFORMATION, NULL, 0,
 						&ea_info_size);
-		if (!p_ea_info || ea_info_size != sizeof(struct ea_information))
+		if (!p_ea_info || ea_info_size != sizeof(struct ea_information)) {
+			err = -EIO;
 			goto out;
+		}
 
 		ea_buf = ntfs_attr_readall(ni, AT_EA, NULL, 0, &all_ea_size);
 		if (!ea_buf) {
@@ -390,10 +392,12 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
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

