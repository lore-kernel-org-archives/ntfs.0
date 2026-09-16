Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A71B36920C
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 02:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525449; cv=none; b=cByy0ruIfjHbZhKpcloY5XGcYwSgIqBm2+M+VsBWuVCf6SQ6TQ65QMp9EGPunYtw2SsGHeg7KzfT5EzU4T4EybDm59GLPNPeBXCaTzKINm569I+Gc6ABARQmkAUyFPMfD2L/NhVtbKiDFmRfSt2lUFJM8NKZMZkif53W4WYF5nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525449; c=relaxed/simple;
	bh=MahDzO3XrpdT4JVoi+SEwYDFX96eHbBV/wSiFd1wNR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhtRmG/FRIr4C5ZGTdzQmcR8pje1wHZSHyoUiCsSpPnt4vF8qecdHXnDpYA3gp/UYdViYLn/+uuArfDp2K57N1nFvJw76asnxqVyZD4P4akyJdy70AQ7ZUQHoY0f8pqQgQRf9BKITT8CTaBuSzF5LbUNp6nk2msk7/gM9gp55oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SP2bNWzk; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SP2bNWzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Pv
	JXkmL/eDH7C2G2BbRaRWTQ6BWaIk48qbQ3GmlCIQg=; b=SP2bNWzkOFpTpiLkIl
	M9/Jl0wEkuEiDgHapW5rp3RUsZvileKW/u+HRf9QYctZkSYU8mwZusY/TwFVxdTD
	Ons/mbx7k+pDR8UTA5EVDk+VlsH8HB9ib0hiRF+/OrZIT1/DyH1XXt8CvyY0qDjG
	BZL25oAAks+oM5oEwDeFG/Bkg=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3J2qz_alqzNjjAw--.2073S5;
	Wed, 16 Sep 2026 10:23:56 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 3/5] ntfs: report inode metadata errors to fsnotify
Date: Wed, 16 Sep 2026 10:23:43 +0800
Message-ID: <20260916022345.1151836-4-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260916022345.1151836-1-liubaolin12138@163.com>
References: <20260916022345.1151836-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3J2qz_alqzNjjAw--.2073S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3Ar4DZryfGF4DGrWfAF4kXrb_yoWfXw4DpF
	9rG3sxK39FqF9FgFn2yrWavw13K348KrW2vryfWw1xWw1Yqwn5tF10qF1S9F1Fkr95W3yY
	qr4UCrWDCF47J3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jWHqcUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwRyzfmqp-by9jgAA3h

From: Baolin Liu <liubaolin@kylinos.cn>

Report inode initialization, writeback, and LogFile failures against
the affected VFS inode while retaining existing allocation and signal
handling. Consume attribute reporting state so callers do not emit a
second FAN_FS_ERROR event for the same failure.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/inode.c   | 52 ++++++++++++++++++++++++++++++++++-------------
 fs/ntfs/logfile.c |  2 +-
 2 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index d5e526d3612a..13f353905fb3 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -689,7 +689,7 @@ static int ntfs_read_locked_inode(struct inode *vi)
 	unsigned int name_len = 4, flags = 0;
 	int extend_sys = 0;
 	dev_t dev = 0;
-	bool has_lxmod = false;
+	bool error_reported = false, has_lxmod = false;
 	bool vol_err = true;
 
 	ntfs_debug("Entering for i_ino 0x%llx.", ni->mft_no);
@@ -761,6 +761,7 @@ static int ntfs_read_locked_inode(struct inode *vi)
 	err = ntfs_attr_lookup(AT_STANDARD_INFORMATION, NULL, 0, 0, 0, NULL, 0,
 			ctx);
 	if (unlikely(err)) {
+		error_reported = ctx->error_reported;
 		if (err == -ENOENT)
 			ntfs_error(vi->i_sb, "$STANDARD_INFORMATION attribute is missing.");
 		goto unm_err_out;
@@ -801,6 +802,7 @@ static int ntfs_read_locked_inode(struct inode *vi)
 	err = ntfs_attr_lookup(AT_ATTRIBUTE_LIST, NULL, 0, 0, 0, NULL, 0, ctx);
 	if (err) {
 		if (unlikely(err != -ENOENT)) {
+			error_reported = ctx->error_reported;
 			ntfs_error(vi->i_sb, "Failed to lookup attribute list attribute.");
 			goto unm_err_out;
 		}
@@ -923,6 +925,7 @@ static int ntfs_read_locked_inode(struct inode *vi)
 		err = ntfs_attr_lookup(AT_INDEX_ROOT, name, name_len, CASE_SENSITIVE,
 				0, NULL, 0, ctx);
 		if (unlikely(err)) {
+			error_reported = ctx->error_reported;
 			if (err == -ENOENT)
 				ntfs_error(vi->i_sb, "$INDEX_ROOT attribute is missing.");
 			goto unm_err_out;
@@ -1056,6 +1059,7 @@ static int ntfs_read_locked_inode(struct inode *vi)
 			vi->i_size = ni->initialized_size =
 					ni->allocated_size = 0;
 			if (err != -ENOENT) {
+				error_reported = ctx->error_reported;
 				ntfs_error(vi->i_sb, "Failed to lookup $DATA attribute.");
 				goto unm_err_out;
 			}
@@ -1091,6 +1095,7 @@ static int ntfs_read_locked_inode(struct inode *vi)
 			}
 
 			err = extend_sys;
+			error_reported = ctx->error_reported;
 			ntfs_error(vi->i_sb, "$DATA attribute is missing, err : %d", err);
 			goto unm_err_out;
 		}
@@ -1247,12 +1252,12 @@ static int ntfs_read_locked_inode(struct inode *vi)
 	if (m)
 		unmap_mft_record(ni);
 err_out:
-	if (err != -EOPNOTSUPP && err != -ENOMEM &&
+	if (!error_reported && err != -EOPNOTSUPP && err != -ENOMEM &&
 	    err != -EINTR && err != -ERESTARTSYS && vol_err == true) {
 		ntfs_error(vol->sb,
 			"Failed with error code %i.  Marking corrupt inode 0x%llx as bad.  Run chkdsk.",
 			err, ni->mft_no);
-		NVolSetErrors(vol);
+		ntfs_report_file_metadata_error(vi, err);
 	}
 	return err;
 }
@@ -1286,6 +1291,7 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
 	struct attr_record *a;
 	struct ntfs_attr_search_ctx *ctx;
 	int err = 0;
+	bool error_reported = false;
 
 	ntfs_debug("Entering for i_ino 0x%llx.", ni->mft_no);
 
@@ -1316,8 +1322,10 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
 	/* Find the attribute. */
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
-	if (unlikely(err))
+	if (unlikely(err)) {
+		error_reported = ctx->error_reported;
 		goto unm_err_out;
+	}
 	a = ctx->attr;
 	if (a->flags & (ATTR_COMPRESSION_MASK | ATTR_IS_SPARSE)) {
 		if (a->flags & ATTR_COMPRESSION_MASK) {
@@ -1479,9 +1487,9 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
 			"Failed with error code %i while reading attribute inode (mft_no 0x%llx, type 0x%x, name_len %i).  Marking corrupt inode and base inode 0x%llx as bad.  Run chkdsk.",
 			err, ni->mft_no, ni->type, ni->name_len,
 			base_ni->mft_no);
-	if (err != -ENOENT && err != -ENOMEM &&
+	if (!error_reported && err != -ENOENT && err != -ENOMEM &&
 	    err != -EINTR && err != -ERESTARTSYS)
-		NVolSetErrors(vol);
+		ntfs_report_file_metadata_error(base_vi, err);
 	return err;
 }
 
@@ -1528,6 +1536,7 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 	struct ntfs_attr_search_ctx *ctx;
 	struct index_root *ir;
 	int err = 0;
+	bool error_reported = false;
 
 	ntfs_debug("Entering for i_ino 0x%llx.", ni->mft_no);
 	lockdep_assert_held(&base_ni->mrec_lock);
@@ -1558,6 +1567,7 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 	err = ntfs_attr_lookup(AT_INDEX_ROOT, ni->name, ni->name_len,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (unlikely(err)) {
+		error_reported = ctx->error_reported;
 		if (err == -ENOENT)
 			ntfs_error(vi->i_sb, "$INDEX_ROOT attribute is missing.");
 		goto unm_err_out;
@@ -1630,8 +1640,10 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 			m = NULL;
 			ctx = NULL;
 			goto skip_large_index_stuff;
-		} else
+		} else {
+			error_reported = ctx->error_reported;
 			ntfs_error(vi->i_sb, "Failed to lookup $INDEX_ALLOCATION attribute.");
+		}
 		goto unm_err_out;
 	}
 	NInoSetIndexAllocPresent(ni);
@@ -1685,6 +1697,9 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 	bvi = ntfs_attr_iget(base_vi, AT_BITMAP, ni->name, ni->name_len);
 	if (IS_ERR(bvi)) {
 		err = PTR_ERR(bvi);
+		error_reported = err != -ENOENT && err != -ENOMEM &&
+				 err != -EOPNOTSUPP && err != -EINTR &&
+				 err != -ERESTARTSYS;
 		if (err != -EINTR && err != -ERESTARTSYS)
 			ntfs_error(vi->i_sb, "Failed to get bitmap attribute.");
 		goto unm_err_out;
@@ -1734,9 +1749,9 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 		ntfs_error(vi->i_sb,
 			"Failed with error code %i while reading index inode (mft_no 0x%llx, name_len %i.",
 			err, ni->mft_no, ni->name_len);
-	if (err != -EOPNOTSUPP && err != -ENOMEM &&
+	if (!error_reported && err != -EOPNOTSUPP && err != -ENOMEM &&
 	    err != -EINTR && err != -ERESTARTSYS)
-		NVolSetErrors(vol);
+		ntfs_report_file_metadata_error(base_vi, err);
 	return err;
 }
 
@@ -2479,7 +2494,9 @@ int ntfs_truncate_vfs(struct inode *vi, loff_t new_size, loff_t i_size)
  *
  * Return 0 on success or -errno on error.
  */
-static int ntfs_inode_sync_standard_information(struct inode *vi, struct mft_record *m)
+static int ntfs_inode_sync_standard_information(struct inode *vi,
+						struct mft_record *m,
+						bool *error_reported)
 {
 	struct ntfs_inode *ni = NTFS_I(vi);
 	struct ntfs_attr_search_ctx *ctx;
@@ -2495,6 +2512,8 @@ static int ntfs_inode_sync_standard_information(struct inode *vi, struct mft_rec
 	err = ntfs_attr_lookup(AT_STANDARD_INFORMATION, NULL, 0,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (unlikely(err)) {
+		if (ctx->error_reported)
+			*error_reported = true;
 		ntfs_attr_put_search_ctx(ctx);
 		return err;
 	}
@@ -2749,7 +2768,7 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 	struct ntfs_inode *mft_ni = NTFS_I(ni->vol->mft_ino);
 	struct mft_record *m;
 	int err = 0;
-	bool need_iput = false;
+	bool error_reported = false, need_iput = false;
 
 	ntfs_debug("Entering for %sinode 0x%llx.", NInoAttr(ni) ? "attr " : "",
 			ni->mft_no);
@@ -2783,13 +2802,14 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 
 	if (NInoNonResident(ni) && NInoRunlistDirty(ni)) {
 		down_write(&ni->runlist.lock);
-		err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
+		err = ntfs_attr_update_mapping_pairs_locked_reported(ni, 0, ni,
+								     &error_reported);
 		if (!err)
 			NInoClearRunlistDirty(ni);
 		up_write(&ni->runlist.lock);
 	}
 
-	err = ntfs_inode_sync_standard_information(vi, m);
+	err = ntfs_inode_sync_standard_information(vi, m, &error_reported);
 	if (err)
 		goto unm_err_out;
 
@@ -2889,7 +2909,11 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 		mark_inode_dirty(vi);
 	else {
 		ntfs_error(vi->i_sb, "Failed (error %i):  Run chkdsk.", -err);
-		NVolSetErrors(ni->vol);
+		if (!error_reported && err != -EINTR &&
+		    err != -ERESTARTSYS)
+			ntfs_report_file_metadata_error(vi, err);
+		else
+			NVolSetErrors(ni->vol);
 	}
 	if (need_iput)
 		iput(vi);
diff --git a/fs/ntfs/logfile.c b/fs/ntfs/logfile.c
index 024ddee42dc8..9be0506fd5c0 100644
--- a/fs/ntfs/logfile.c
+++ b/fs/ntfs/logfile.c
@@ -768,7 +768,7 @@ bool ntfs_empty_logfile(struct inode *log_vi)
 rl_err:
 	ntfs_error(sb, "Runlist is corrupt.  Unmount and run chkdsk.");
 dirty_err:
-	NVolSetErrors(vol);
+	ntfs_report_file_metadata_error(log_vi, -EIO);
 	err = -EIO;
 err:
 	kvfree(empty_buf);
-- 
2.51.0

