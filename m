Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473A2421A08
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 09:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240495; cv=none; b=PaU0hNqOTsDLxOlu1p7jrLH0vmQUSePe9Mz5RYSRV+nQNwYUv/1JCCxCNI/XJvYFrJOFAZyMRyUdqv7ezeT8SMuWcS2D7FXIY/EXIkPv+ErT2SgRCRSuDua8caThExyEgVqni6AZjtnmFIb5FsMHqPzyZ5SxH6FNN2bSapP+NCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240495; c=relaxed/simple;
	bh=UsaM0+IpzQRGVwhC5b7VpLDQLsiTaLSIbHXPKHHojnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vc1xehdV9ohoNJAKmOK01+l2R4gc+VsEGsL0p3lRQgccBrkqYZUYWu0i29hszn6BkXztkFqGospEkrq11jB+G4yArzjBZR4GgUl7U5HbZNLnWGPFowDIAupdSM5b6xZB1gXEQhUDLWXSyR5RqTDk05t079Yt+HYQyvjlWegnSjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=j0hP4yPR; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="j0hP4yPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=FM
	Y/bov/Kiu7NY6r1RpOwu8u7WPqC8knEEbC+hnouzc=; b=j0hP4yPRRGy9IdVXAc
	E8mNai7SWcuhEXV6kf8XsRhZj/HpuoVUyHwFoEbtFX5dlggTJ7l+2UnTdTfGf9nM
	shD3ZscqtmHy+g+oBpWYfO7Z7b9Eh72TJUFZ9GNsH1jPMLIh3EV69FBtGkQ5mgAz
	UhavuuSo/HuOMLW5E7H53E+tI=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3H73Q5rRqL6EhAg--.34883S3;
	Thu, 24 Sep 2026 17:01:09 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v3 1/6] ntfs: report allocation metadata errors to fsnotify
Date: Thu, 24 Sep 2026 17:00:57 +0800
Message-ID: <20260924090102.2865942-2-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3H73Q5rRqL6EhAg--.34883S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFWxJFyDGw15Xry5AF13Jwb_yoW5GF1UpF
	97Awnakrs7t3WjqrsF93ySyw4S9a4kGw4UtryUXw1fXrn7Kr1DXF4kK3WF9FnY9FWUZr1U
	X3Wjg3y3urWDZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7nYrUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RW2gWq05tX2PAAA3s

From: Baolin Liu <liubaolin@kylinos.cn>

Cluster allocation and free rollbacks can leave volume metadata
inconsistent without notifying filesystem health monitors.

Add a volume-level helper that records the error and reports it through
fsnotify after mount activation. Report each failed rollback where it
is detected and leave event merging to fanotify.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/lcnalloc.c | 4 ++--
 fs/ntfs/super.c    | 8 ++++++++
 fs/ntfs/volume.h   | 2 ++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/lcnalloc.c b/fs/ntfs/lcnalloc.c
index 0d6cd08ee2e7..347f9e152588 100644
--- a/fs/ntfs/lcnalloc.c
+++ b/fs/ntfs/lcnalloc.c
@@ -763,7 +763,7 @@ switch_to_data1_zone:		search_zone = 2;
 			ntfs_error(vol->sb,
 				"Failed to rollback (error %i). Leaving inconsistent metadata! Unmount and run chkdsk.",
 				err2);
-			NVolSetErrors(vol);
+			ntfs_report_metadata_error(vol, err2);
 		}
 		/* Free the runlist. */
 		kvfree(rl);
@@ -1044,7 +1044,7 @@ s64 __ntfs_cluster_free(struct ntfs_inode *ni, const s64 start_vcn, s64 count,
 		ntfs_error(vol->sb,
 			"Failed to rollback (error %i).  Leaving inconsistent metadata!  Unmount and run chkdsk.",
 			(int)delta);
-		NVolSetErrors(vol);
+		ntfs_report_metadata_error(vol, delta);
 	} else {
 		ntfs_dec_free_clusters(vol, delta);
 	}
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 716ba775f1f3..827313df0e28 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -14,6 +14,7 @@
 #include <linux/sched/mm.h>
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
+#include <linux/fserror.h>
 
 #include "sysctl.h"
 #include "logfile.h"
@@ -394,6 +395,13 @@ const struct option_t on_errors_arr[] = {
 	{ 0,			NULL }
 };
 
+void ntfs_report_metadata_error(struct ntfs_volume *vol, int error)
+{
+	NVolSetErrors(vol);
+	if (vol->sb->s_flags & SB_ACTIVE)
+		fserror_report_metadata(vol->sb, error, GFP_ATOMIC);
+}
+
 void ntfs_handle_error(struct super_block *sb)
 {
 	struct ntfs_volume *vol = NTFS_SB(sb);
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index fdb57279de84..5bcd0dd2a19d 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -254,6 +254,8 @@ DEFINE_NVOL_BIT_OPS(DisableSparse)
 DEFINE_NVOL_BIT_OPS(NativeSymlinkRel)
 DEFINE_NVOL_BIT_OPS(SymlinkNative)
 
+void ntfs_report_metadata_error(struct ntfs_volume *vol, int error);
+
 static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 nr)
 {
 	if (!NVolFreeClusterKnown(vol))
-- 
2.51.0

