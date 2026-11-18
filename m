Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992926;
	b=26++PDOaftMPDXyVHkqwfH9oyZf/RLknjdfhwYdZGQKQvqwcyt1KyGBGV4i9kUXemN7T
	 HNotnd8Kt7HWaYrI8Tu30JTWRmzCAliM2YhhgYg4SBc8tdgwjS5ODkLHf8F0o45fCjtfQ
	 9AUQUDiZb9lIcbHu/TuspI3kn8Hstc5loCiiqt9Lvmh+tBbdXvdet2gIL1vEKEvXinpFX
	 XR5t/DnUs+zajPwe77TEG6lHypqHIwEDW6/+JnrcijS7e8eOfHKRHwX+lZXD4QY/r9VBh
	 9F7Gl0j4SGY/IIcpZutScJ6GbITrD01EmNYvcSx9QKdbUNznnrqGZRcXPu3OlSkW98A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992926;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=VZ/3jpv2p7LUO1IxNIOoEwMsoCHTUTllM8AI8iUBLg4=;
	b=TwyAxXmjVlvbUK2ZqV7158V4nwQiujF0xjz9RDdF6pzkEfDI0YdK7iA1gKoULjhWegAr
	 JwSVSZpSXeqOG3hhOqroGWhEVLYD67O3RrnS0FevBgC/M1nGszisvxRkLmWJHcqY5Ftkq
	 vu8VKwp1S7DhVR/Lz3p71rdPsezSJstp0IzjJcgJFCj1hPQfVYApyTTbFiMA2rGw+gqU5
	 s4lT+9RoMLx8M14t8ALkF+3WgOibh6zj2oKkzUCowzVwpZQNeLTO9fuZ6QvRAf1L23duo
	 +Lqvxa5jUGOl1adPTTA+UKDhKz+1zm1cnHTq/OIpNeI9fvBEg2lp/goH+0fWHvfK0AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iiR2bk2H;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876FA606A31C
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 876FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iiR2bk2H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=VZ
	/3jpv2p7LUO1IxNIOoEwMsoCHTUTllM8AI8iUBLg4=; b=iiR2bk2H3rIueqrzhr
	TqkVTS89KP/wO4bDR/qzIWhH9DvMxB8RtM7ACj2YxxBr6HDet+/aXmcRMlyrXCYD
	ZnjNTq/jhSGehAW+W/WExCaozA42JZ0cTuh4uAZmYpviqCF/bz5TtoRAh71NvZNE
	A7DdduANmi0aaYf+aazfN71JM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3_+gOa_1qh6wGIA--.32884S3;
	Wed, 18 Nov 2026 17:08:31 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 09/37] ntfs: serialize export parent reconstruction
Date: Wed, 18 Nov 2026 17:06:33 +0800
Message-Id: <20261118090701.1858849-10-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3_+gOa_1qh6wGIA--.32884S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr4DCrW5CF45Wr1rGr43trb_yoW5uFyDpF
	y3J39rKrs3AFWS9rnayF45Z34S934xGFWUWF1rG3WSywnYqrnFgF1ftF1jvr1FyrW8W3s0
	qr4jga47GFWUXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UsvtZUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzQ-34Gr9aw8hSQAA3O

From: Xuewen Wang <wangxuewen@kylinos.cn>

Exportfs calls ntfs_get_parent() without holding the child's inode lock.
FILE_NAME lookup and parent loading can therefore race with rename or
rmdir, despite the function's existing locking comment.

Hold the child's mrec_lock across the lookup and parent load. Release it
on every error path and before d_obtain_alias().

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes in v6:
Extract export-parent locking from v5 patch 24.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.
- No undefined references to ntfs_report_* or fserror_report_*.

 fs/ntfs/namei.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index d2d9fe732014..fb1946b9e7e3 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1690,7 +1690,8 @@ const struct inode_operations ntfs_dir_inode_ops = {
  * fs/exportfs/expfs.c::find_exported_dentry() which in turn is called from the
  * default ->decode_fh() which is export_decode_fh() in the same file.
  *
- * Note: ntfs_get_parent() is called with @d_inode(child_dent)->i_mutex down.
+ * Serialize the file name lookup and parent load against rename and rmdir
+ * with the child's mrec_lock; exportfs does not hold the child's inode lock.
  *
  * Return the dentry of the parent directory on success or the error code on
  * error (IS_ERR() is true).
@@ -1698,6 +1699,7 @@ const struct inode_operations ntfs_dir_inode_ops = {
 static struct dentry *ntfs_get_parent(struct dentry *child_dent)
 {
 	struct inode *vi = d_inode(child_dent);
+	struct inode *parent;
 	struct ntfs_inode *ni = NTFS_I(vi);
 	struct mft_record *mrec;
 	struct ntfs_attr_search_ctx *ctx;
@@ -1707,15 +1709,19 @@ static struct dentry *ntfs_get_parent(struct dentry *child_dent)
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
+		goto unlock_err;
 	}
 try_next:
 	err = ntfs_attr_lookup(AT_FILE_NAME, NULL, 0, CASE_SENSITIVE, 0, NULL,
@@ -1727,7 +1733,7 @@ static struct dentry *ntfs_get_parent(struct dentry *child_dent)
 			ntfs_error(vi->i_sb,
 				   "Inode 0x%llx does not have a file name attribute.  Run chkdsk.",
 				   ni->mft_no);
-		return ERR_PTR(err);
+		goto unlock_err;
 	}
 	attr = ctx->attr;
 	if (unlikely(attr->non_resident))
@@ -1743,7 +1749,14 @@ static struct dentry *ntfs_get_parent(struct dentry *child_dent)
 	ntfs_attr_put_search_ctx(ctx);
 	unmap_mft_record(ni);
 
-	return d_obtain_alias(ntfs_iget(vi->i_sb, parent_ino));
+	parent = ntfs_iget(vi->i_sb, parent_ino);
+	goto out;
+
+unlock_err:
+	parent = ERR_PTR(err);
+out:
+	mutex_unlock(&ni->mrec_lock);
+	return d_obtain_alias(parent);
 }
 
 static struct inode *ntfs_nfs_get_inode(struct super_block *sb,
-- 
2.51.0

