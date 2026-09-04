Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4652D396572
	for <ntfs@lists.linux.dev>; Fri,  4 Sep 2026 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512498; cv=none; b=PyaHr6WTe0C660Y1x20zsf8lIS76s5u3tIOEXDT12TEsOIKY9MMwntaTK41E7Fmjos6tvK7N6TzNLchCaanvr76xXSipu0mTUjo6oKGTLAMBm6aUy//BYWfjcB3DWDukSUvBr1b82OxX2Aus53hdRf3UxV65odWFwJ/mGR6Dlbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512498; c=relaxed/simple;
	bh=XvmavsoJmOgyfPZTxe5J2j71CO/TgRB5fQg2I13JxsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdT729Od9sF7v5NYSB8NvjGO+3B+udgrD61cU9uuG8QPWGtB6WrcFjfOHbzCmQhIj8FDoy6fBrFM1wX/T5kOwSjNAjQItVfdmomwFfSqB8qdGuEAJnFZ8n8n2hWL50sdTHQAlHdDzlFcxfMBpmlHGfQ70M2h07XzzzgiDOfm2ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ercQMa44; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ercQMa44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ot
	RPBiSqb37i9cnfixkQcyeOL3goWcSLLuXbif4W6OU=; b=ercQMa44OW5iXdQj2H
	0hvhZ7qmvJZrbl0W+UxqM1v1+9XLRXY/AQPXFvtdozLnZf4QhzAGGyagc8hzG+oJ
	B8I+Mv/phAx24CRvbQjpTCNVTKBGMVeqCG9RBtF8wMCe0KiOcuNzgTfQY/nuLx9N
	uCPv6dQEcOnNqr200TOIJ+iWE=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAHU97ViJpqDNWCAg--.41284S6;
	Fri, 04 Sep 2026 17:01:24 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 4/5] ntfs: propagate the map_mft_record() error in ntfs_attrlist_entry_add()
Date: Fri,  4 Sep 2026 17:00:53 +0800
Message-ID: <20260904090054.3365538-5-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wAHU97ViJpqDNWCAg--.41284S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7GFy3tr45uF48ZF48AF4DCFg_yoW8Jr4Upa
	sxAwnrK3WfZr47trs2kay8Aa4v9FWDW3yjvr90934Ivw1rtw40ga4YgFyIqr1FkFW8Jw45
	Zr4DWrW3JFW3u3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjD73UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwQWcZ2qaiOX90gAA3N

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_attrlist_entry_add() replaces the map_mft_record() error with -EIO,
so an -ENOMEM allocation failure is reported as an I/O error. Both
callers pass the value on to ntfs_attr_add(), which no longer collapses
it since commit 8efe00b098b5 ("ntfs: preserve error code in
ntfs_resident_attr_record_add()").

Return PTR_ERR(ni_mrec) instead. Also fix the debug message.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/attrlist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
index be3086d34338..a1c00e426e80 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -139,8 +139,8 @@ int ntfs_attrlist_entry_add(struct ntfs_inode *ni, struct attr_record *attr)
 
 	ni_mrec = map_mft_record(ni);
 	if (IS_ERR(ni_mrec)) {
-		ntfs_debug("Invalid arguments.\n");
-		return -EIO;
+		ntfs_debug("Failed to map mft record.\n");
+		return PTR_ERR(ni_mrec);
 	}
 
 	mref = MK_LE_MREF(ni->mft_no, le16_to_cpu(ni_mrec->sequence_number));
-- 
2.51.0

