Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D972222AA
	for <ntfs@lists.linux.dev>; Fri,  4 Sep 2026 09:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512499; cv=none; b=TN6kiCLiG4WPvduPJeqDZsz6bFML7g+t+CfKoxnRDmqpNxMgb4eDIN40BEACUPVKX5j8ORXIxT16JInNy64z/BgQ7ZparZ1k/Euk9ePY1hcDAas1Fm2kStUANtcXSZrI1AaA9ZgrwzBxtLW2IiKL4qoUA1ut4cqV22qAP+ASsSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512499; c=relaxed/simple;
	bh=9uBlqEjiAXyypijmEOGf0qaPPewJUOcsaqPql5duWsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oumzW8R00VO1JKUL1ciFPRDwyMtuWO3l7yQVZRDk6hmwHwdwua/7aOXI9OWSntRZ83jW1+crqC69e/Dv9thO3akbpSDE5JnfmTieo/REsmgGYJ6SWXQpjD0ApcDJeIUjrGytDvE3lUuKyzdj4xH6Eca7Ry+mRo3TxLRWsjWwvIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FAu47L+M; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FAu47L+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=jR
	n1xiWbbjvW1QMlGXZTnpr3hkMo6O3/2pu4o6mX07U=; b=FAu47L+M97h+jIwzTh
	3AgJrv8UYyEALapQvqomWmLOVLFHR61bWfWmK0tbn0Zv5hwhokmahliCml3USiJC
	01BQTvxygjOVMNEwG8cmMWenp2XNTRzTrrnlPT8ImWu94LkF00e12NmJyDeeilI7
	kIVmYbJvTGEZitao697FK0Svc=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAHU97ViJpqDNWCAg--.41284S3;
	Fri, 04 Sep 2026 17:01:13 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 1/5] ntfs: return -EINVAL from ntfs_collate_ntofs_ulongs() on bad length
Date: Fri,  4 Sep 2026 17:00:50 +0800
Message-ID: <20260904090054.3365538-2-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wAHU97ViJpqDNWCAg--.41284S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyfZFWkGFWruw4DtF1UWrg_yoW8JFW3pF
	9rCFn7Ga1kJr12yrs2yr43GayavwnrGr47t390gw1xX3sYqF1rtr1FqF1I9r4IvaykZw4r
	Xr10q3y3ZrykZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMWl9UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RqZZGqaiNqvVQAA3W

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_collate_ntofs_ulongs() returns -1 when the key lengths differ or are
not a multiple of 4. But -1 is also what cmp_int() returns for "collates
before", so the error is indistinguishable from an ordinary result.

ntfs_ie_lookup() acts on that difference: it maps -EINVAL to -ERANGE, but
treats -1 as a tree-descent hint and breaks out of the loop. A malformed
entry in $Reparse/$R or $ObjId/$O is therefore silently taken as a lookup
miss.

Return -EINVAL, as the sibling ntfs_collate_ntofs_ulong() already does.
Well-formed keys are unaffected; both indexes use key sizes that are
multiples of 4.

Fixes: 5218cd102aec ("ntfs: update misc operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/collate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/collate.c b/fs/ntfs/collate.c
index 77e34038902d..744fdfd7bf58 100644
--- a/fs/ntfs/collate.c
+++ b/fs/ntfs/collate.c
@@ -73,7 +73,7 @@ static int ntfs_collate_ntofs_ulongs(struct ntfs_volume *vol,
 
 	if (data1_len != data2_len || data1_len & 3) {
 		ntfs_error(vol->sb, "data1_len or data2_len not valid\n");
-		return -1;
+		return -EINVAL;
 	}
 
 	len = data1_len;
-- 
2.51.0

