Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485887;
	b=m3GrHRIBcXuS/tD8rccqb24K7V9lqtugI7PCnkZD+lmIJ/FjPXoCWKIGtWp/n2Bmax8b
	 +4luSSeDxug8PI8Ez+hW/wCIAsk7xDEzFWI9tF8F9WtDyPPv+SOHtesIYeKdXqk4E9zED
	 nnF3QBdvoTkd39jmH85wggumslO/vDltoF/x2/pB2fHQxAplgIX9kpL3X8g8wl3w36UlX
	 angg/tChSqAcD9Gkgi/sMvjGjgD+/ZmrJ1gKbXzzHQWoAEzfbZP5yZbhb3YyZiEZG1RBr
	 db3r5/QXnYeGGP+OHp0IN+vRIrKfnrnANmxc/+HU93TbM+KkeIIBI0ernQeWNzk/ZrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485887;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=n62yDuMFcQYwDHNQriXKGA7MRPC5g2osHHvCdHS4AIc=;
	b=HbyEFvca+RHAPCqSOWZ0qNQTydUWo24IEk7NYLMv5BCzwmOAlZv8HGDvYxRVupkj2VnN
	 2kZoyT+IYht9dWZ9wC7Z06gEt5nVFJAqur6FRuHyWvJN2QBBuCdCuBmW8k6wkC5Owxv+0
	 qp1XpFGOb61hja3TsttMF7dNbjiLdsr06F3dM8fpn7vBaynmjwV2nGsEqQn58VU8qtKV2
	 4s3t1k2GeN3SE3Lcxee7S15VPsir3SkgUdwiTOHJPV0M3IGBJmZhPwc3aPdYKmo2htGPD
	 p+JEH/IBeQiQ3C6pPuBrJ69pNKY9m8LKVIEmx3y2p70CBYkjLnXsOPipBbZMgs88M9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HnBjMEH4;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DF6606A31C
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2DF6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HnBjMEH4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=n6
	2yDuMFcQYwDHNQriXKGA7MRPC5g2osHHvCdHS4AIc=; b=HnBjMEH45PkrMAftVk
	Vu307rCPL1Yvvnb36DWT6YncxJ8+9kMKAYonRhsfG0QYNhyBTTZekKHI/fdyDN3U
	+Pq+o64BfsCAOOfoJlR9woTJypM6pgGvF3HA1J/qpw4u5MZiY2G+sFZsKeLV3gkY
	haKc2JcbU/4HrTT3U/PgKMdV4=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3XyPnKddq1latBA--.56704S9;
	Tue, 20 Oct 2026 16:44:31 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 07/31] ntfs: report logfile metadata and emptying errors
Date: Tue, 20 Oct 2026 16:43:57 +0800
Message-ID: <20261020084421.2196486-8-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3XyPnKddq1latBA--.56704S9
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xw4UKw15Ww4UWw47tw45trb_yoW3Cry7p3
	WrGrn8K390ka4fWrsFyFyDZa4ayw1fJa9Fqry3Jw1Iqw1qgr4ktFyUKF909Fy8Kr95G34U
	uF4YyrZrCFZxZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzMKAUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RAX4WrXKfBKvQAA3c

From: Dandan Wu <wudandan@kylinos.cn>

Logfile validation and emptying can detect corruption or I/O failures
without recording them. Report an unusable nonempty log after trying
alternate restart pages, keeping unsupported versions distinct from
corrupt restart metadata.

Report a missing required logfile, read failures, and write failures or
corrupt runlists when emptying it, including on remount. Retain the
existing read-only fallback.

Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
 fs/ntfs/logfile.c | 51 +++++++++++++++++++++++++++--------------------
 fs/ntfs/super.c   |  2 +-
 2 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/fs/ntfs/logfile.c b/fs/ntfs/logfile.c
index ce38ce87f8fc..1b70a5126845 100644
--- a/fs/ntfs/logfile.c
+++ b/fs/ntfs/logfile.c
@@ -17,14 +17,14 @@
  * @rp:		restart page header to check
  * @pos:	position in @vi at which the restart page header resides
  *
- * Check the restart page header @rp for consistency and return 'true' if it is
- * consistent and 'false' otherwise.
+ * Check the restart page header @rp for consistency. Return 0 on success,
+ * -EOPNOTSUPP for an unsupported version, or -EINVAL for corruption.
  *
  * This function only needs NTFS_BLOCK_SIZE bytes in @rp, i.e. it does not
  * require the full restart page.
  */
-static bool ntfs_check_restart_page_header(struct inode *vi,
-		struct restart_page_header *rp, s64 pos)
+static int ntfs_check_restart_page_header(struct inode *vi,
+					  struct restart_page_header *rp, s64 pos)
 {
 	u32 logfile_system_page_size, logfile_log_page_size;
 	u16 ra_ofs, usa_count, usa_ofs, usa_end = 0;
@@ -43,7 +43,7 @@ static bool ntfs_check_restart_page_header(struct inode *vi,
 			(logfile_system_page_size - 1) ||
 			!is_power_of_2(logfile_log_page_size)) {
 		ntfs_error(vi->i_sb, "LogFile uses unsupported page size.");
-		return false;
+		return -EINVAL;
 	}
 	/*
 	 * We must be either at !pos (1st restart page) or at pos = system page
@@ -51,7 +51,7 @@ static bool ntfs_check_restart_page_header(struct inode *vi,
 	 */
 	if (pos && pos != logfile_system_page_size) {
 		ntfs_error(vi->i_sb, "Found restart area in incorrect position in LogFile.");
-		return false;
+		return -EINVAL;
 	}
 	/* We only know how to handle version 1.1. */
 	if (le16_to_cpu(rp->major_ver) != 1 ||
@@ -60,7 +60,7 @@ static bool ntfs_check_restart_page_header(struct inode *vi,
 			"LogFile version %i.%i is not supported.  (This driver supports version 1.1 only.)",
 			(int)le16_to_cpu(rp->major_ver),
 			(int)le16_to_cpu(rp->minor_ver));
-		return false;
+		return -EOPNOTSUPP;
 	}
 	/*
 	 * If chkdsk has been run the restart page may not be protected by an
@@ -75,7 +75,7 @@ static bool ntfs_check_restart_page_header(struct inode *vi,
 	if (usa_count != le16_to_cpu(rp->usa_count)) {
 		ntfs_error(vi->i_sb,
 			"LogFile restart page specifies inconsistent update sequence array count.");
-		return false;
+		return -EINVAL;
 	}
 	/* Verify the position of the update sequence array. */
 	usa_ofs = le16_to_cpu(rp->usa_ofs);
@@ -84,7 +84,7 @@ static bool ntfs_check_restart_page_header(struct inode *vi,
 			usa_end > NTFS_BLOCK_SIZE - sizeof(u16)) {
 		ntfs_error(vi->i_sb,
 			"LogFile restart page specifies inconsistent update sequence array offset.");
-		return false;
+		return -EINVAL;
 	}
 skip_usa_checks:
 	/*
@@ -99,7 +99,7 @@ static bool ntfs_check_restart_page_header(struct inode *vi,
 			ra_ofs > logfile_system_page_size) {
 		ntfs_error(vi->i_sb,
 			"LogFile restart page specifies inconsistent restart area offset.");
-		return false;
+		return -EINVAL;
 	}
 	/*
 	 * Only restart pages modified by chkdsk are allowed to have chkdsk_lsn
@@ -108,10 +108,10 @@ static bool ntfs_check_restart_page_header(struct inode *vi,
 	if (!ntfs_is_chkd_record(rp->magic) && le64_to_cpu(rp->chkdsk_lsn)) {
 		ntfs_error(vi->i_sb,
 			"LogFile restart page is not modified by chkdsk but a chkdsk LSN is specified.");
-		return false;
+		return -EINVAL;
 	}
 	ntfs_debug("Done.");
-	return true;
+	return 0;
 }
 
 /*
@@ -315,6 +315,7 @@ static bool ntfs_check_log_client_array(struct inode *vi,
  *
  * The following error codes are defined:
  *	-EINVAL	- The restart page is inconsistent.
+ *	-EOPNOTSUPP - The logfile version is unsupported.
  *	-ENOMEM	- Not enough memory to load the restart page.
  *	-EIO	- Failed to reading from LogFile.
  */
@@ -328,10 +329,9 @@ static int ntfs_check_and_load_restart_page(struct inode *vi,
 
 	ntfs_debug("Entering.");
 	/* Check the restart page header for consistency. */
-	if (!ntfs_check_restart_page_header(vi, rp, pos)) {
-		/* Error output already done inside the function. */
-		return -EINVAL;
-	}
+	err = ntfs_check_restart_page_header(vi, rp, pos);
+	if (err)
+		return err;
 	/* Check the restart area for consistency. */
 	if (!ntfs_check_restart_area(vi, rp)) {
 		/* Error output already done inside the function. */
@@ -372,8 +372,6 @@ static int ntfs_check_and_load_restart_page(struct inode *vi,
 				ntfs_error(vi->i_sb, "Error mapping LogFile page (index %lu).",
 						idx);
 				err = PTR_ERR(folio);
-				if (err != -EIO && err != -ENOMEM)
-					err = -EIO;
 				goto err_out;
 			}
 			size = min_t(int, to_read, PAGE_SIZE);
@@ -461,7 +459,7 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 	struct restart_page_header *rstr1_ph = NULL;
 	struct restart_page_header *rstr2_ph = NULL;
 	int log_page_size, err;
-	bool logfile_is_empty = true;
+	bool logfile_is_empty = true, unsupported_version = false;
 	u8 log_page_bits;
 
 	ntfs_debug("Entering.");
@@ -495,6 +493,7 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 	 */
 	if (size < log_page_size * 2 || (size - log_page_size * 2) >>
 			log_page_bits < MinLogRecordPages) {
+		ntfs_report_file_metadata_error(log_vi, -EFSCORRUPTED);
 		ntfs_error(vol->sb, "LogFile is too small.");
 		return false;
 	}
@@ -516,6 +515,8 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 			}
 			folio = read_mapping_folio(mapping, idx, NULL);
 			if (IS_ERR(folio)) {
+				if (PTR_ERR(folio) == -EIO)
+					ntfs_report_file_metadata_error(log_vi, -EIO);
 				ntfs_error(vol->sb, "Error mapping LogFile page (index %lu).",
 						idx);
 				goto err_out;
@@ -574,7 +575,11 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 		 * not abort if the restart page was invalid as we might still
 		 * find a valid one further in the file.
 		 */
-		if (err != -EINVAL) {
+		if (err == -EOPNOTSUPP)
+			unsupported_version = true;
+		else if (err != -EINVAL) {
+			if (err == -EIO)
+				ntfs_report_file_metadata_error(log_vi, err);
 			kunmap_local(kbase);
 			folio_put(folio);
 			goto err_out;
@@ -594,6 +599,8 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 		return true;
 	}
 	if (!rstr1_ph) {
+		if (!unsupported_version)
+			ntfs_report_file_metadata_error(log_vi, -EFSCORRUPTED);
 		ntfs_error(vol->sb,
 			"Did not find any restart pages in LogFile and it was not empty.");
 		return false;
@@ -767,10 +774,10 @@ bool ntfs_empty_logfile(struct inode *log_vi)
 	ntfs_error(sb, "Failed to write buffer.  Unmount and run chkdsk.");
 	goto dirty_err;
 rl_err:
+	err = -EFSCORRUPTED;
 	ntfs_error(sb, "Runlist is corrupt.  Unmount and run chkdsk.");
 dirty_err:
-	NVolSetErrors(vol);
-	err = -EIO;
+	ntfs_report_file_metadata_error(log_vi, err);
 err:
 	kvfree(empty_buf);
 	kfree(ra);
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index f5c9cf368f8a..7c10a1b24b14 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -1357,7 +1357,7 @@ static int load_and_check_logfile(struct ntfs_volume *vol,
 	int err = 0;
 
 	ntfs_debug("Entering.");
-	tmp_ino = ntfs_iget(vol->sb, FILE_LogFile);
+	tmp_ino = ntfs_system_iget(vol, FILE_LogFile);
 	if (IS_ERR(tmp_ino)) {
 		if (!IS_ERR(tmp_ino))
 			iput(tmp_ino);
-- 
2.51.0

