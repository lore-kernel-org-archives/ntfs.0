Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEC03A9630
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 09:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240492; cv=none; b=tqlJzyUApsQwk4LYNB5v7FoWpVkFKwI6G3/C7z5mOk8ZlkYDo0t9eI73WB1U3mQJy8hfQCbiQRaJinoMikcjzQu7hjLTjoHpgQpwU6eV8puQLclW1NeNzc71oVwSfY8nTDojCEwOeXWKdOetazD6yuUl1UIzWZAljve7238nlUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240492; c=relaxed/simple;
	bh=L5ZqUyzrf4+2nFL11gRp7aQvV9wnEqTL5bER3fteVEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=buOfbUYidJNuQgE1/Bz2BH/xsU7RA4uq8K81fS5btQhc9dCStybje/DAEuxYh7IRB45RPtiWSzPJzX79F5Y4wYlmIadoTcvJmXWqyPWeDO3+UoWfawT5IaHtw5ZMuth4fFXFzhl9xSmfp+P9G9PPwHYCoXSNHtcU0GdXeGMBqnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=P7Dc3lHh; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="P7Dc3lHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=qm
	i3FHcbWjT1HDcn/gcvvyRGjaouytMYXJtS2GuTjXA=; b=P7Dc3lHhehjERVQMWX
	dF3znFXcLEexbKPSOGwAKbxHQs00aXrJJyQ8Z+ZG7KU9/5Ha+prS9FwTFDr1bu6V
	QqjE6hfpba2lB1bRRWNnjy+Wftp/sFftUL57KzBriwUgH1+QHL3FiJNGWS9uirg2
	BqNF/GccW++jmZ1kYMacEMq9Q=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3H73Q5rRqL6EhAg--.34883S7;
	Thu, 24 Sep 2026 17:01:16 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v3 5/6] ntfs: report MFT writeback errors to fsnotify
Date: Thu, 24 Sep 2026 17:01:01 +0800
Message-ID: <20260924090102.2865942-6-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260924090102.2865942-1-liubaolin12138@163.com>
References: <20260924090102.2865942-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H73Q5rRqL6EhAg--.34883S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw1kJF4kKrWrJrWfAF4UXFb_yoW5Kw45pF
	Z8G3s3KrWDtr47Kwn7trW2v3Wa934xKa17CrykG3WI9wn8Kr1jqa10grWSgFWFkr93J3y8
	Ja1qkrZ8CF1UAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcrc-UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Ry4g2q05tz3VwAA3K

From: Baolin Liu <liubaolin@kylinos.cn>

MFT writeback failures need to reach filesystem health monitors as well
as the kernel log and mapping error state.

Report device errors from the existing parent BIO completion callback for
both synchronous and asynchronous writes, before ending folio writeback.
The generic fserror code queues notification work and takes its own inode
reference, so no additional NTFS completion work is needed.

Report mirror and preparation failures where they are detected, including
failures that occur before a BIO can be submitted. Keep these reports
together with completion reporting so errors retained in the write context
still mark the volume and notify userspace independently of device errors.
Preserve the retry handling for allocation failures in MFT write
preparation.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/mft.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index a1b1c080b256..6a202ffc513a 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -481,9 +481,11 @@ static void ntfs_mft_end_io(struct bio *bio)
 		err = blk_status_to_errno(bio->bi_status);
 	else
 		err = ctx->error;
+	/* Report device errors from both synchronous and asynchronous writes. */
+	if (bio->bi_status)
+		ntfs_report_file_metadata_error(ctx->mapping->host, err);
 	if (err) {
 		mapping_set_error(ctx->mapping, err);
-		NVolSetErrors(ctx->vol);
 		ntfs_error(ctx->vol->sb, "I/O error while writing MFT: %d",
 			   err);
 	}
@@ -544,22 +546,24 @@ static int ntfs_sync_mft_mirror_unit(struct ntfs_volume *vol,
 	u64 mirror_size;
 	unsigned int mirror_ofs;
 	u8 *src, *dst;
-	int err;
+	int err = -EIO;
 
 	if (unlikely(!vol->mftmirr_ino))
-		return -EIO;
+		goto out_report;
 
 	mirror_size = (u64)vol->mftmirr_size * vol->mft_record_size;
 	if (mirror_file_ofs >= mirror_size ||
 	    unit->len > mirror_size - mirror_file_ofs)
-		return -EIO;
+		goto out_report;
 	if (unit->folio_ofs + unit->len > folio_size(source))
-		return -EIO;
+		goto out_report;
 
 	mirror = read_mapping_folio(vol->mftmirr_ino->i_mapping,
 				    mirror_file_ofs >> PAGE_SHIFT, NULL);
-	if (IS_ERR(mirror))
-		return PTR_ERR(mirror);
+	if (IS_ERR(mirror)) {
+		err = PTR_ERR(mirror);
+		goto out_report;
+	}
 
 	folio_lock(mirror);
 	if (folio_test_writeback(mirror))
@@ -598,6 +602,9 @@ static int ntfs_sync_mft_mirror_unit(struct ntfs_volume *vol,
 out_unlock:
 	folio_unlock(mirror);
 	folio_put(mirror);
+out_report:
+	if (err)
+		ntfs_report_metadata_error(vol, err);
 	return err;
 }
 
@@ -815,8 +822,14 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 		mark_mft_record_dirty(ni);
 		if (!sync)
 			err = 0;
-	} else
-		NVolSetErrors(vol);
+	} else {
+		struct ntfs_inode *base_ni = ni;
+
+		if (ni->nr_extents < 0)
+			base_ni = ni->ext.base_ntfs_ino;
+		mapping_set_error(folio->mapping, err);
+		ntfs_report_file_metadata_error(VFS_I(base_ni), err);
+	}
 	return err;
 }
 
@@ -3188,7 +3201,7 @@ static void ntfs_mft_write_error(struct ntfs_volume *vol,
 				 struct address_space *mapping, int err)
 {
 	mapping_set_error(mapping, err);
-	NVolSetErrors(vol);
+	ntfs_report_file_metadata_error(mapping->host, err);
 	ntfs_error(vol->sb, "Error while writing MFT folio: %d", err);
 }
 
@@ -3346,6 +3359,7 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 						ctx->error = -EIO;
 					redirty = true;
 					err = -EIO;
+					ntfs_mft_write_error(vol, mapping, err);
 					break;
 				}
 			}
-- 
2.51.0

