Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485884;
	b=1xoemAiH+E32+w7A46Qph8nX3iPNTbHCmLMiKTtiHhBlnnmH+w0hi4y1wl2hgUkNZnW2
	 Gd6IYF5xBhQUM5TpNwy2eSwTcuw0VhktRE6iLkt6wzSXgvIj0oVF0OLuUyxXrol+ppAMr
	 K7E5yyZ7mjzA9g31cDv/qOuC52kI7Sl5J9NkZymMsnsBiOlbmtwMGoRyYGpBlQmN++FzJ
	 mDX+OPWAARL9KWBEQsA8W6GfTWrw9esxFEx6dy6rzspYUkCSiCdU9/1Tahyp14mXNOcWY
	 MRMldI6TAnV1TcLJ3nfmRqiu3uSjDHHtdeDYnAPA5LBw/JdZ8i3qiLRu+qCB4eKWM+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485884;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=1FV927e++ZwPma2sscnHEyJ9bGLQYMZ39H1t/XcQGMw=;
	b=0IS2oLsWr9LJkAmG20+cEyEmgMMOOQjtqHjfyIvWxlv1Bo6Ge8ilcROL4J661rol96LF
	 c9/AE9eV70FNJWh91BJYJfm+t7MLBQkXHQoy/2Y5rcA2jW7uP/xU2Xa8Ew6QMcmyihCnK
	 ko0K6F5lhUoxliKsh1eJlVXsVkVVTlkieInI1eRJDA/TEUkBGOGlcq4u1iWh5Hw7GQm1L
	 rSm4VGkvqv1ISKsT7nssIvQIFsahtGAo+HY0fR1u2lS1BB9kn4Q9ej27tnVrJJ8f7pjWb
	 uJrhM2zDw+rrhnz5nHGyMzQVsTjaVqJX2pyjqtjvivHLyD0ufr5vMLrLgALghI8R+kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KdB++2Dw;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B737E606A31B
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B737E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KdB++2Dw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=1F
	V927e++ZwPma2sscnHEyJ9bGLQYMZ39H1t/XcQGMw=; b=KdB++2DwvxsJM37Vx0
	2VEFuaQMzE6anh5ISi8QIvU9QJIY6aQkOOe3RpxRZ8JDrAcBH9sDvuEsER+fcdMw
	6YdOzLZB4aWOZXgBkrgEGsMisgH+uP+h/MXZgD0/motFamAWbuvpvFC4GyXahTIz
	J9a3wRFUmVXK1iuG5hS7/gnms=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3XyPnKddq1latBA--.56704S5;
	Tue, 20 Oct 2026 16:44:28 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 03/31] ntfs: add filesystem metadata error reporting helpers
Date: Tue, 20 Oct 2026 16:43:53 +0800
Message-ID: <20261020084421.2196486-4-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261020084421.2196486-1-liubaolin12138@163.com>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3XyPnKddq1latBA--.56704S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw1fXw4Utw4xXF1UtrW7CFg_yoWrWw15pF
	97Awn3Kw4DJFy2grs2kr42vw1Skas2gw4Utr1UXw1xZ3Wktw18tF4vyF1F9F1fKFWrX3yj
	qr1j93y7ur4UZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jHlksUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QwW4GrXKexJ7wAA3N

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
 fs/ntfs/inode.c  |  7 -------
 fs/ntfs/inode.h  |  8 ++++++++
 fs/ntfs/super.c  | 29 +++++++++++++++++++++++++++++
 fs/ntfs/volume.h |  3 +++
 4 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 52e22022b4e7..c8560dd47d44 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3532,13 +3532,6 @@ void ntfs_destroy_ext_inode(struct ntfs_inode *ni)
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
index cf447fb51725..952398753ed1 100644
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
index 71f0aea46bf8..df09c277ee54 100644
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

