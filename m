Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486079;
	b=qjM/26gG32XSsvEFqVU1jbsIatG3X2Q7v81mWxc/gmieLnRfPVsQI7xQdGdH1Q4kjvZm
	 K6Qgdk5DNq5/haOR0YSx/z/wBwF8954zClehJChXc99cnHrJ6y5xI6jAf9LY5V/AIS6uJ
	 2Hpg1tv641lbX8KVD7mI2kUrbOXO0uAXb27SAoegBUlccAGSEKkktmC3UXLOdE8kiGDVw
	 a4AHlxbSoPSmZARCaJqbHnM/9RKRT/lmHsxK1/wcTgEyu6P25OtHaGxRSZ66PHe7/j9cZ
	 QPUXCu0WpRdAc7/GVHRTnNHhje2Zes9ptg8wHo2eJO+tzetjETMXsOveHaXPpsBo9Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486079;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=pCYVLnKlwWFu2dTmmG/DqjRyyF+oOB7q7tn5CcP2eok=;
	b=HNRdTsL1N75CPJcwrP2M3+ui2YjA5EeN5XJBtXh3Z2m/iArZgunHmyM5g2eyc9/+juRI
	 cIK/HxVqP5iiGlLji/Jp2h7ok/+KWSzS527yu/QwMUlkPb2S8RmtMqnBuYk7vyFdpy9qI
	 Wg88k4d0Cy0dUG4h+LvIYI7lGHg6Fmp+pO5SASTcv1+xupXQVqLm5AdAP5WdqOX+HUj2s
	 T+IL62GakEpgUfR514FGxl8l0Fgy0d0c3eAqoDo67xr480v5SnLqpD/jdNqKD4CQOG824
	 6rXoFVYJjFFlQOVWT0aaU0y5cmDMjS97tYA6Nk1CCawLW4dRogp8XtBoRLObsexQtfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iveJbtMX;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFED3606A33C
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFED3606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iveJbtMX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pC
	YVLnKlwWFu2dTmmG/DqjRyyF+oOB7q7tn5CcP2eok=; b=iveJbtMXDThrqSv6tt
	xQiw5qnkwq9X8stE1rAnTulT2joknZgoJpQsUtUO67ksQBTjKAPuG1qhOgI5DHcG
	l1JhthOJe63RqX3kLfMKkyESuNM35ncHCZv6lW60aEhoOMBG2vpx1ZYKGrMTJy1r
	AgL8W70hvS9DEvQviCU2xXiXw=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3t62yKtdqN_ayBQ--.9980S2;
	Tue, 20 Oct 2026 16:47:47 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 24/31] ntfs: serialize and report export parent reconstruction errors
Date: Tue, 20 Oct 2026 16:44:14 +0800
Message-ID: <20261020084421.2196486-25-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3t62yKtdqN_ayBQ--.9980S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr4DCw15XF1DAF18Wr4xtFb_yoWrZF4xpF
	y3J3sxtrZ8JFyfurnayay5Z34Sk34fGrWUWrn3K3WSyw4qqrn29F1ftFyj9r1FkrWrJ34Y
	qw4jga43C3yUXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j1uWLUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RRIE2rXKrR19QAA3F

From: Xuewen Wang <wangxuewen@kylinos.cn>

Exportfs calls ntfs_get_parent() without the child inode lock. Hold the
child's mrec_lock across FILE_NAME lookup and parent loading to stabilize
corruption checks against rename and rmdir.

Report an unused parent as EFSCORRUPTED only for a linked, non-deleting
child. Report missing required or malformed FILE_NAME attributes, while
continuing past malformed candidates as before. Release the lock before
d_obtain_alias().

Preserve ordinary stale-handle behavior. NTFS returns EFSCORRUPTED for a
confirmed corrupt parent reference; generic open_by_handle_at() decoding
still converts that error to ESTALE.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 fs/ntfs/namei.c | 43 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 47e52270e8ee..a64ab7881052 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1730,7 +1730,8 @@ const struct inode_operations ntfs_dir_inode_ops = {
  * fs/exportfs/expfs.c::find_exported_dentry() which in turn is called from the
  * default ->decode_fh() which is export_decode_fh() in the same file.
  *
- * Note: ntfs_get_parent() is called with @d_inode(child_dent)->i_mutex down.
+ * Serialize the file name lookup and parent load against rename and rmdir
+ * with the child's mrec_lock; exportfs does not hold the child's inode lock.
  *
  * Return the dentry of the parent directory on success or the error code on
  * error (IS_ERR() is true).
@@ -1738,6 +1739,7 @@ const struct inode_operations ntfs_dir_inode_ops = {
 static struct dentry *ntfs_get_parent(struct dentry *child_dent)
 {
 	struct inode *vi = d_inode(child_dent);
+	struct inode *parent;
 	struct ntfs_inode *ni = NTFS_I(vi);
 	struct mft_record *mrec;
 	struct ntfs_attr_search_ctx *ctx;
@@ -1747,15 +1749,20 @@ static struct dentry *ntfs_get_parent(struct dentry *child_dent)
 	int err;
 
 	ntfs_debug("Entering for inode 0x%llx.", ni->mft_no);
+	mutex_lock(&ni->mrec_lock);
 	/* Get the mft record of the inode belonging to the child dentry. */
 	mrec = map_mft_record(ni);
-	if (IS_ERR(mrec))
-		return ERR_CAST(mrec);
+	if (IS_ERR(mrec)) {
+		err = PTR_ERR(mrec);
+		goto unlock_err;
+	}
 	/* Find the first file name attribute in the mft record. */
 	ctx = ntfs_attr_get_search_ctx(ni, mrec);
 	if (IS_ERR(ctx)) {
 		unmap_mft_record(ni);
-		return ERR_PTR(PTR_ERR(ctx));
+		err = PTR_ERR(ctx);
+		ctx = NULL;
+		goto unlock_err;
 	}
 try_next:
 	err = ntfs_attr_lookup(AT_FILE_NAME, NULL, 0, CASE_SENSITIVE, 0, NULL,
@@ -1763,27 +1770,45 @@ static struct dentry *ntfs_get_parent(struct dentry *child_dent)
 	if (unlikely(err)) {
 		ntfs_attr_put_search_ctx(ctx);
 		unmap_mft_record(ni);
-		if (err == -ENOENT)
+		if (err == -ENOENT && vi->i_nlink) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(vi, -EFSCORRUPTED);
 			ntfs_error(vi->i_sb,
 				   "Inode 0x%llx does not have a file name attribute.  Run chkdsk.",
 				   ni->mft_no);
-		return ERR_PTR(err);
+		}
+		goto unlock_err;
 	}
 	attr = ctx->attr;
-	if (unlikely(attr->non_resident))
+	if (unlikely(attr->non_resident)) {
+		ntfs_report_file_metadata_error(vi, -EFSCORRUPTED);
 		goto try_next;
+	}
 	fn = (struct file_name_attr *)((u8 *)attr +
 			le16_to_cpu(attr->data.resident.value_offset));
 	if (unlikely((u8 *)fn + le32_to_cpu(attr->data.resident.value_length) >
-	    (u8 *)attr + le32_to_cpu(attr->length)))
+	    (u8 *)attr + le32_to_cpu(attr->length))) {
+		ntfs_report_file_metadata_error(vi, -EFSCORRUPTED);
 		goto try_next;
+	}
 	/* Get the inode number of the parent directory. */
 	parent_ino = MREF_LE(fn->parent_directory);
 	/* Release the search context and the mft record of the child. */
 	ntfs_attr_put_search_ctx(ctx);
 	unmap_mft_record(ni);
 
-	return d_obtain_alias(ntfs_iget(vi->i_sb, parent_ino));
+	parent = ntfs_iget(vi->i_sb, parent_ino);
+	if (IS_ERR(parent) && PTR_ERR(parent) == -ENOENT &&
+	    vi->i_nlink && !NInoBeingDeleted(ni)) {
+		ntfs_report_file_metadata_error(vi, -EFSCORRUPTED);
+		parent = ERR_PTR(-EFSCORRUPTED);
+	}
+	mutex_unlock(&ni->mrec_lock);
+	return d_obtain_alias(parent);
+
+unlock_err:
+	mutex_unlock(&ni->mrec_lock);
+	return ERR_PTR(err);
 }
 
 static struct inode *ntfs_nfs_get_inode(struct super_block *sb,
-- 
2.51.0

