Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605144;
	b=z3eJ/2D/fdENveKDaVq4LcdfJd7Sqnql7s6Rc98crG5iPDWTICme3b/5sdr59Se27POY
	 N+7imN+Knvd62HvFROhNcB7CIb/vCETq+jOYhIQerw/jelKW4/X9OzklniXdcqoIcEyGC
	 fG57qRLThLXa7LJFHlaOJhuc6eljdTmZu7E1tJRvSWGVkAW6YUE7VQqXMhU0W7lcmP1o2
	 3aZH8e0MNLX0oDXcA3G3A+YFJtsWKjK6WYfT/Gwh+3R5FzzU5iFwuEjrZJxdmaPAVn9mV
	 ZslodcolRnCdAfDeF6UVqV3mMosOsCDO88oPcYR64hvRr9vauEVQCNy8ll5SYmNtIvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605144;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Via2I54afS2+dTm2WApc/qdn6339E6C54jWSa2r2L5Y=;
	b=rDIBHGuSj52VJ2/Ki7ri6Mmtw4Nba43NHdie0mtBsx4ZDseGhx/TsQya9jPs0RAD9KQ3
	 beO6HGcLA+4bGMKG1ottowtCapTT7UhL1Dg3/wbsvncTc1yuJNWbvr9wnEI55RpFOT8vg
	 mnH/OZ8ZD8LA9rmYmNYqGqFgiwPENJGKvKobp9O50gw9LZIg5CvG4MFzjNVrIW+aG/0ZX
	 ITs6kIqN141f0uG+jH6HYc9gGb1hYzyL4QyIwbiwmbDVyGolFG00rVN7eIPgTLKVTL5YT
	 sFdhXYM7peoOYdG//jg2bVLkouojh2L8D05WML0DWQ3l7D3rskGX/wJNlPcC9RB5IWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=e4m4ewFI;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB6A606A338
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB6A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=e4m4ewFI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Vi
	a2I54afS2+dTm2WApc/qdn6339E6C54jWSa2r2L5Y=; b=e4m4ewFIvi1hIqxt1O
	O7X0AEdawS8y4XO6zgV0mRV0XMYOLW7GvCymOB63/EbSDJfGcNIhWb8Vj1phrRu5
	kwNZY6t9/12uOdscB8QGZYN+CpbcdFX8Qih+VX1VVXRBsVqdSV76ZW0i3VTgMXwr
	mRljeEkzlgpEU/n9EpIqRAfIg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3nygJPuhqucJHEg--.56690S7;
	Mon, 02 Nov 2026 15:38:52 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v5 29/31] ntfs: report named stream metadata and recovery errors
Date: Mon,  2 Nov 2026 15:35:30 +0800
Message-Id: <20261102073532.98873-30-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102073532.98873-1-wangxuewen_ky@163.com>
References: <20261102073532.98873-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3nygJPuhqucJHEg--.56690S7
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xw13WryDuw1UCrWUArW7CFg_yoW7Kw13pF
	Z7Cws3K3s3tFyxKwn7tanYv34fKF1kKw47Kr4UX3W7ArsYqr15tF4jkrn29FWrtryrWanI
	qF45twsxur17ZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UWMKNUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC7wxnUGroPgxc4wAA3b

From: Xuewen Wang <wangxuewen@kylinos.cn>

Report missing or stale MFT references after a successful base-name
lookup as EFSCORRUPTED only when the caller holds the directory i_rwsem.
Pass that locking state through the helper and its callers. Unlocked
revalidation can race with unlink or record reuse and must not report
those races as corruption.

Also report missing required stream attributes and cleanup failures.
For rollback failures that trigger shutdown, report the cleanup errno
and retain the EIO operation result. Preserve the existing ENOMEM and
interruption exceptions, and keep ordinary missing streams silent.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 fs/ntfs/named_stream.c | 41 ++++++++++++++++++++++++++++++++---------
 fs/ntfs/stream.h       |  2 +-
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs/named_stream.c b/fs/ntfs/named_stream.c
index bf5fae52331e..788a581d854b 100644
--- a/fs/ntfs/named_stream.c
+++ b/fs/ntfs/named_stream.c
@@ -252,6 +252,7 @@ int ntfs_stream_path_check(struct ntfs_volume *vol,
  * @dir_ino: directory containing the base file or directory
  * @uname: UTF-16LE base name
  * @uname_len: Length of @uname in UTF-16 code units
+ * @dir_locked: caller holds the directory i_rwsem against namespace changes
  *
  * Resolve the directory entry and verify its MFT reference before returning
  * the inode.
@@ -259,8 +260,9 @@ int ntfs_stream_path_check(struct ntfs_volume *vol,
  * Return: Referenced inode on success, or ERR_PTR() on failure.
  */
 struct inode *ntfs_stream_lookup_inode_by_name(struct inode *dir_ino,
-		__le16 *uname, int uname_len)
+		__le16 *uname, int uname_len, bool dir_locked)
 {
+	int report_err = 0;
 	struct ntfs_volume *vol = NTFS_SB(dir_ino->i_sb);
 	struct ntfs_name *name = NULL;
 	struct inode *inode;
@@ -276,13 +278,24 @@ struct inode *ntfs_stream_lookup_inode_by_name(struct inode *dir_ino,
 		return ERR_PTR(MREF_ERR(mref));
 
 	inode = ntfs_iget(vol->sb, MREF(mref));
-	if (IS_ERR(inode))
-		return inode;
+	if (IS_ERR(inode)) {
+		if (dir_locked && PTR_ERR(inode) == -ENOENT) {
+			report_err = -EFSCORRUPTED;
+			inode = ERR_PTR(-EFSCORRUPTED);
+		}
+		goto out;
+	}
 	if (MSEQNO(mref) != NTFS_I(inode)->seq_no &&
 	    MREF(mref) != FILE_MFT) {
+		/* Unlocked dentry revalidation can race with unlink and reuse. */
+		if (dir_locked)
+			report_err = -EFSCORRUPTED;
 		iput(inode);
-		return ERR_PTR(-EIO);
+		inode = ERR_PTR(dir_locked ? -EFSCORRUPTED : -EIO);
 	}
+out:
+	if (report_err)
+		ntfs_report_file_metadata_error(dir_ino, report_err);
 	return inode;
 }
 
@@ -333,7 +346,7 @@ static int ntfs_stream_d_revalidate(struct inode *dir,
 			ni->vol->upcase_len))
 		goto out;
 
-	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len);
+	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len, false);
 	if (IS_ERR(base_vi))
 		goto out;
 	if (NTFS_I(base_vi) != ni->ext.base_ntfs_ino) {
@@ -441,7 +454,7 @@ struct dentry *ntfs_lookup_stream(struct inode *dir_ino,
 	}
 
 	base_vi = ntfs_stream_lookup_inode_by_name(dir_ino, base_uname,
-			base_len);
+			base_len, true);
 	kmem_cache_free(ntfs_name_cache, base_uname);
 	if (IS_ERR(base_vi)) {
 		err = PTR_ERR(base_vi);
@@ -564,7 +577,7 @@ struct inode *ntfs_create_named_stream(const struct mnt_idmap *idmap,
 	bool stream_created = false;
 	int err, rollback_err;
 
-	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len);
+	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len, true);
 	if (IS_ERR(base_vi))
 		return base_vi;
 	if (!S_ISREG(base_vi->i_mode) && !S_ISDIR(base_vi->i_mode)) {
@@ -635,6 +648,10 @@ struct inode *ntfs_create_named_stream(const struct mnt_idmap *idmap,
 	else
 		err = PTR_ERR(stream_vi);
 	if (err) {
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(base_vi, -EFSCORRUPTED);
+		}
 		if (stream_created) {
 			rollback_err = ntfs_attr_remove(base_ni, AT_DATA,
 					stream_name, stream_len, &rollback_vi);
@@ -646,7 +663,8 @@ struct inode *ntfs_create_named_stream(const struct mnt_idmap *idmap,
 				    rollback_err == -ERESTARTSYS) {
 					err = rollback_err;
 				} else {
-					NVolSetErrors(base_ni->vol);
+					ntfs_report_file_metadata_error(base_vi,
+									rollback_err);
 					NVolSetShutdown(base_ni->vol);
 					err = -EIO;
 				}
@@ -698,7 +716,7 @@ int ntfs_unlink_named_stream(struct inode *dir, struct dentry *dentry)
 	if (!path_result)
 		return -EINVAL;
 
-	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len);
+	base_vi = ntfs_stream_lookup_inode_by_name(dir, base_name, base_len, true);
 	if (IS_ERR(base_vi)) {
 		err = PTR_ERR(base_vi);
 		goto out_free;
@@ -1044,6 +1062,7 @@ static int ntfs_stream_finish_remove(struct inode *attr_vi)
 		remove_inode_hash(attr_vi);
 	} else {
 		NInoSetBeingDeleted(attr_ni);
+		ntfs_report_file_metadata_error(VFS_I(ni), err);
 		remove_inode_hash(attr_vi);
 	}
 
@@ -1279,6 +1298,10 @@ static int ntfs_stream_ioctl_get_inode(struct inode *base_vi, __le16 *sname,
 	attr_vi = ntfs_attr_iget(base_vi, AT_DATA, sname, sname_len);
 	if (IS_ERR(attr_vi)) {
 		err = PTR_ERR(attr_vi);
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(base_vi, -EFSCORRUPTED);
+		}
 		attr_vi = NULL;
 		goto out_unlock;
 	}
diff --git a/fs/ntfs/stream.h b/fs/ntfs/stream.h
index 76b6c9cca5cc..701283143a39 100644
--- a/fs/ntfs/stream.h
+++ b/fs/ntfs/stream.h
@@ -29,7 +29,7 @@ int ntfs_stream_path_names(struct ntfs_volume *vol,
 		__le16 **stream_name, int *stream_len);
 
 struct inode *ntfs_stream_lookup_inode_by_name(struct inode *dir,
-		__le16 *name, int name_len);
+		__le16 *name, int name_len, bool dir_locked);
 struct dentry *ntfs_lookup_stream(struct inode *dir, struct dentry *dentry,
 		const struct ntfs_stream_path *path);
 struct inode *ntfs_create_named_stream(const struct mnt_idmap *idmap,

