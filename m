Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992926;
	b=0qdNYd2gY64iQ43hMfE13zpONoiNa6DCOiD/cr2kfGcssmoMHaoYOz0sl/qhTRH1SPah
	 ryZ0Gt3Npu47K56dago3WP6TyAdvoLRkfoYl5OjDPxMzhbn0sYfIrE1yaD1EQXKbe5EA4
	 l8i49uHfJ/u5JYEqzjvysKYYjYVhEhyJvI1jbrn8lAMRsk1+4Mx6fq2U6M8Bz2nPiLnXV
	 dpO7Yv3raO4QbvIO/tTdopygthHMOnw+N4kU0Aopul+WrLNkQt8qqbr3pxN3Ka0cqrelZ
	 f53+HwQq0WEd6ruhBl4rQCyyi1riB+9AL9M+xGDo9d1MBfGcz8tHHut9rZ1kn3eWR+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992926;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=xQGOsErGOZXq9+WXIxXt/LMa5Ic2cv6DVsqe8EAXFnA=;
	b=sDpXQs6zWt+QXJyFrZEONEvozRkIvGqnqcwkSWSwraOH+Bv+8NWfuwvlmW1BLhNtgFpk
	 j6aUOY57eHUa7j1nki1k327BqMFWFSkip8eFfr1qzPf4T9Adavf4NP+skBPYbh1MJslZZ
	 VtsPUWo9CQs1NOhBjqcjv7TswTKvsFIS/uIZAEnT26TeWgRo7TOBUwyCxqwdTt+78rqAY
	 bltsijNiJeVAG/KoZ27iF7V4ENDVy7rzHLeq8Dx4yksjv1S79k/hCFPx/5gaQwUfGZ8hl
	 FMeBd0o8GpRQVhsxygon1QBHSY4MvuCXU67wRnqpw2NM7+J/XtMGWiVJM3jKh7Hj4vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lkc8tJW7;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED30F606A888
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED30F606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lkc8tJW7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=xQ
	GOsErGOZXq9+WXIxXt/LMa5Ic2cv6DVsqe8EAXFnA=; b=lkc8tJW7/qUtvvlfHD
	VF7kM+mNlils5ctbxP4ZdskwWx4EUfewzzjp/1vxiy2O1NvdNTBs+wySW8a9KrCx
	xAMpolRPhrQnath7fNOs0/1IOglHwrjlQnYo+vqX9AsovLU3eOUNufol0WcnT77H
	YkJXM/8iiHKhQJQCyi3UM7Bhs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3_+gOa_1qh6wGIA--.32884S4;
	Wed, 18 Nov 2026 17:08:32 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 10/37] ntfs: add filesystem metadata error reporting helpers
Date: Wed, 18 Nov 2026 17:06:34 +0800
Message-Id: <20261118090701.1858849-11-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118090701.1858849-1-wangxuewen_ky@163.com>
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_+gOa_1qh6wGIA--.32884S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw1fXw4Utw4xXF1UtrW7CFg_yoWrCr4rpF
	97Awn3Kw4DJFy2grs2kr42vw1SkF92gw4Utr1UXw1xZ3W8tw18tF4vy3WF9F1SgFWrW34j
	qr1j939rur4UZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UK-eOUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzhD44Wr9axD5tgAA3k

From: Baolin Liu <liubaolin@kylinos.cn>

Add file and volume helpers to report metadata errors through the generic
deferred fsnotify infrastructure while retaining the volume error bit.
Pass the caller's errno unchanged.

Move ntfs_inode_base() to inode.h and use it to identify the base file for
attribute and extent inodes. Fall back to a volume report for I_FREEING
or I_WILL_FREE, when retaining the inode for deferred reporting is unsafe.
When SB_ACTIVE is clear, record only the volume error state.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
Changes in v6:
Introduce the reporting helpers after the standalone fixes.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.

 fs/ntfs/inode.c  |  7 -------
 fs/ntfs/inode.h  |  8 ++++++++
 fs/ntfs/super.c  | 29 +++++++++++++++++++++++++++++
 fs/ntfs/volume.h |  3 +++
 4 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index a892540146b8..7ebdbffcd75b 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3571,13 +3571,6 @@ void ntfs_destroy_ext_inode(struct ntfs_inode *ni)
 	kmem_cache_free(ntfs_inode_cache, ni);
 }
 
-static struct ntfs_inode *ntfs_inode_base(struct ntfs_inode *ni)
-{
-	if (ni->nr_extents == -1)
-		return ni->ext.base_ntfs_ino;
-	return ni;
-}
-
 static int ntfs_attr_position(__le32 type, struct ntfs_attr_search_ctx *ctx)
 {
 	int err;
diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
index 7ea52c59c04b..3fcf5b761eab 100644
--- a/fs/ntfs/inode.h
+++ b/fs/ntfs/inode.h
@@ -298,6 +298,14 @@ static inline bool ntfs_inode_is_named_stream(struct ntfs_inode *ni)
 	return NInoAttr(ni) && ni->type == AT_DATA && ni->name_len;
 }
 
+/* Extent and attached attribute inodes refer to their base MFT inode. */
+static inline struct ntfs_inode *ntfs_inode_base(struct ntfs_inode *ni)
+{
+	if (ni->nr_extents == -1)
+		return ni->ext.base_ntfs_ino;
+	return ni;
+}
+
 /* Return the base MFT inode for an attribute inode, or @ni itself. */
 static inline struct ntfs_inode *ntfs_base_inode(struct ntfs_inode *ni)
 {
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 79c2e1c4a2ed..773e5208bdbf 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -14,6 +14,7 @@
 #include <linux/sched/mm.h>
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
+#include <linux/fserror.h>
 
 #include "sysctl.h"
 #include "logfile.h"
@@ -426,6 +427,34 @@ const struct option_t on_errors_arr[] = {
 	{ 0,			NULL }
 };
 
+/*
+ * Report confirmed metadata corruption as -EFSCORRUPTED, matching the errno
+ * returned to the caller. Preserve the errno of I/O and recovery failures
+ * so listeners can distinguish their causes.
+ */
+void ntfs_report_metadata_error(struct ntfs_volume *vol, int error)
+{
+	NVolSetErrors(vol);
+	if (vol->sb->s_flags & SB_ACTIVE)
+		fserror_report_metadata(vol->sb, error, GFP_ATOMIC);
+}
+
+void ntfs_report_file_metadata_error(struct inode *inode, int error)
+{
+	struct ntfs_inode *ni = NTFS_I(inode);
+
+	/* Attribute inodes share the file handle of their base inode. */
+	inode = VFS_I(ntfs_inode_base(ni));
+	/* Eviction cannot retain an inode reference for the deferred report. */
+	if (inode_state_read_once(inode) & (I_FREEING | I_WILL_FREE)) {
+		ntfs_report_metadata_error(NTFS_SB(inode->i_sb), error);
+		return;
+	}
+	NVolSetErrors(NTFS_SB(inode->i_sb));
+	if (inode->i_sb->s_flags & SB_ACTIVE)
+		fserror_report_file_metadata(inode, error, GFP_ATOMIC);
+}
+
 void ntfs_handle_error(struct super_block *sb)
 {
 	struct ntfs_volume *vol = NTFS_SB(sb);
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index ed5c0ccb9cd9..27f58beb4b2d 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -262,6 +262,9 @@ DEFINE_NVOL_BIT_OPS(SymlinkNative)
 DEFINE_NVOL_BIT_OPS(MftBootstrap)
 DEFINE_NVOL_BIT_OPS(StreamsWindows)
 
+void ntfs_report_metadata_error(struct ntfs_volume *vol, int error);
+void ntfs_report_file_metadata_error(struct inode *inode, int error);
+
 static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 nr)
 {
 	if (!NVolFreeClusterKnown(vol))
-- 
2.51.0

