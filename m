Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B61366553
	for <ntfs@lists.linux.dev>; Fri,  4 Sep 2026 09:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512495; cv=none; b=G9QTw+Vyu4Za8VncWDLNsnf7Qjpj03FB3SPdpI7mgnWBsti0Trkp2G6pdbzNFInx1HsjaehOmAHQ/n2m7hIi47j6yuxlDvp9M6nTMkcrc05YCFpb/fVusevpjym48pYwe3xqbhAP3NIwQN2OdrDqd88NmaCn07gl6GHB5Yzq0DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512495; c=relaxed/simple;
	bh=ZBNlgBctMhChDAE7o/5kMOQwK6g5AZoQLqncJ0hGTbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CwXOSbFgtioqzXNMM/yHLSddTHlE8OQVMcQKhv6nL+vvmH8RPOD78YCsbX0Tz45nbGK7w0ttdWQm4ky7Ac2GleCkMDWobzTrrNMp82QWqKqtpsGy9v/w15lu5q0C37VtnH/gngD29zgcPkmhzoklXupN2f9HDghc5VBHXi61F9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JfYLFhWT; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JfYLFhWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=na
	ms8Fs7eVl6yuVlTVHApCwYJyqrJBhy/Ngo/qTmZsI=; b=JfYLFhWTbqZCTl2Ffa
	SoyJ9DPgTkH/GuMr3jdhoUBR1rx2JjbvgCBHO/tdLZkx8q5WAyHw9MS1kiIjDyx6
	ZvWBkgZOsq1Kc0MzIcZ6mcjlm1Gq3c0q5LgUtVeiimk6nktk0kuVMKFXMSNkwZPZ
	DL2ZpQtQpZgZ+IljwcxyJEQ3s=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAHU97ViJpqDNWCAg--.41284S4;
	Fri, 04 Sep 2026 17:01:17 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 2/5] ntfs: fix error handling in ntfs_extent_inode_open and propagate errors
Date: Fri,  4 Sep 2026 17:00:51 +0800
Message-ID: <20260904090054.3365538-3-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wAHU97ViJpqDNWCAg--.41284S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxuryfKF45ZrWDur4rCFy3urg_yoWrGFykpF
	sruw1xtw47Jry7KrWvyr4q9FyakF4xKrW7Gr1Dtwn7Aas8t340vF1Utr109F1SyrZ5t34S
	vr4jka17ua47ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jyxRhUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6h2aZWqaiN051QAA3B

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_extent_inode_open() has two issues:

1. When map_mft_record() fails, it returns the non-NULL 'ni' pointer
   instead of an error, causing the caller to treat the failure as success.

2. It returns NULL for all errors, losing information about what actually
   went wrong (-EIO, -ENOMEM, -EINVAL, etc.).

Fix both by converting the function to return ERR_PTR() on error, and
update the single caller (ntfs_inode_attach_all_extents) to check with
IS_ERR() and propagate the actual error code with PTR_ERR().

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/inode.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 5aedc045f65a..xxxxxxxxxxxx 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2904,8 +2904,7 @@ static inline void ntfs_init_big_inode(struct inode *vi)
  * abort if deprotection or checks fail.
  *
  * Finally attach the ntfs inode to its base inode @base_ni and return a
- * pointer to the ntfs_inode structure on success or NULL on error, with errno
- * set to the error code.
+ * pointer to the ntfs_inode structure on success or ERR_PTR() on error.
  *
  * Note, extent inodes are never closed directly. They are automatically
  * disposed off by the closing of the base inode.
@@ -2921,7 +2920,7 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
 	struct super_block *sb;

 	if (!base_ni)
-		return NULL;
+		return ERR_PTR(-EINVAL);

 	sb = base_ni->vol->sb;
 	ntfs_debug("Opening extent inode %llu (base mft record %llu).\n",
@@ -2940,7 +2939,7 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
 			if (IS_ERR(ni_mrec)) {
 				ntfs_error(sb, "failed to map mft record for %llu",
 						ni->mft_no);
-				goto out;
+				return ERR_PTR(PTR_ERR(ni_mrec));
 			}
 			/* Verify the sequence number if given. */
 			seq_no = MSEQNO_LE(mref);
@@ -2949,7 +2948,7 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
 				ntfs_error(sb, "Found stale extent mft reference mft=%llu",
 						ni->mft_no);
 				unmap_mft_record(ni);
-				goto out;
+				return ERR_PTR(-EINVAL);
 			}
 			unmap_mft_record(ni);
 			goto out;
@@ -2958,7 +2957,7 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
 	/* Wasn't there, we need to load the extent inode. */
 	ni = ntfs_new_extent_inode(base_ni->vol->sb, mft_no);
 	if (!ni)
-		goto out;
+		return ERR_PTR(-ENOMEM);

 	ni->seq_no = (u16)MSEQNO_LE(mref);
 	ni->nr_extents = -1;
@@ -2968,8 +2967,10 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
 		i = (base_ni->nr_extents + 4) * sizeof(struct ntfs_inode *);

 		extent_nis = kvzalloc(i, GFP_NOFS);
-		if (!extent_nis)
+		if (!extent_nis) {
+			ni = ERR_PTR(-ENOMEM);
 			goto err_out;
+		}
 		if (base_ni->nr_extents) {
 			memcpy(extent_nis, base_ni->ext.extent_ntfs_inos,
 					i - 4 * sizeof(struct ntfs_inode *));
@@ -2984,7 +2985,6 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
 	return ni;
 err_out:
 	ntfs_destroy_ext_inode(ni);
-	ni = NULL;
 	goto out;
 }

@@ -3025,9 +3025,12 @@ int ntfs_inode_attach_all_extents(struct ntfs_inode *ni)
 	while ((u8 *)ale < ni->attr_list + ni->attr_list_size) {
 		if (ni->mft_no != MREF_LE(ale->mft_reference) &&
 				prev_attached != MREF_LE(ale->mft_reference)) {
-			if (!ntfs_extent_inode_open(ni, ale->mft_reference)) {
+			struct ntfs_inode *ext_ni;
+
+			ext_ni = ntfs_extent_inode_open(ni, ale->mft_reference);
+			if (IS_ERR(ext_ni)) {
 				ntfs_debug("Couldn't attach extent inode.\n");
-				return -1;
+				return PTR_ERR(ext_ni);
 			}
 			prev_attached = MREF_LE(ale->mft_reference);
 		}
--
2.51.0

