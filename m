Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604954;
	b=0Y0NUidTsP0mU80XusnrH31EdZiKXPyLa45rI/fgmmV0aR4cDXYikhPz8R1EMNSxCWOM
	 mXn8ap8T7OHXr2Q73vX4VPoc6CnNS1cbkoMeHRlp1Q7T28ULaLOjGDzkOJ0r3EMGL1jIp
	 SYNMcwEZTovngjfFoM9ACW0LeH2XL/B58/Nx0j7pKUVIb7lqG7TvHy3d4FymTDOvaMk3f
	 SlmWI0skXEIAi1ajfv92NpltoJLE69dIj+Wq6c4AyjXReG3pqn3repY9pGh4kqiOW/Qiq
	 dHhtSFUh2P1Xus42U+SjNhOIvuRzdtLhWwLw+cHvyoEHG3goBw4Vw6sE3mS4Q/W7dew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604954;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=NrzFMR6c/NGZlPH/B3paujw52xVEVODZAgp2JTk/36k=;
	b=HW4KfY9tcE8FTR3S7EQe65bdcHrAWmvdnTGilNzJXcVeyDAXgO5Amm3P4VLrqeYaPJXG
	 zBXXJBB9l4f/I7+tHht3qSa/LtrOQSTpeFYREWAZzgSUgGDMara1y3DQQbCZAZiCmrJ6R
	 xbvJiFEaeNB3bwt98gYKXZOTpf2Nbl11zFcHfdPl9LX41dACRKRe7/dod46wN76unqWz2
	 Q9rAt8tOk/8wvXMblpnixt2TA2jokQMecIf/UZPNvCGshzru37Di8CQY3V8cmdGjKRavp
	 +37mPG8MspKyxn6J5IvACYW3m2sr5YhDdD1VWXzLxdzV7PjZptA/4PWgJk8BfNOLBVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UlI7t+ew;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DC7606A32C
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23DC7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UlI7t+ew
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Nr
	zFMR6c/NGZlPH/B3paujw52xVEVODZAgp2JTk/36k=; b=UlI7t+ew7k5jsDKCag
	pHjcvmb+bWsaiK3xkCr/SS4PgPsP+E0NTU3lFTfSXWG6PeAJxlUovgRp0x4x4rSs
	SkT4N1ztWTm5b8MFCg0bQamlhsTFh1ivNkkMfJmAYnDqPq3fADF2P+T7aKycqz4E
	d8Zk3ZbXhbf+LVF3m0053MXEo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3f5hGPehqi52fEw--.9836S9;
	Mon, 02 Nov 2026 15:35:39 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>
Subject: [PATCH v5 07/31] ntfs: report logfile metadata and emptying errors
Date: Mon,  2 Nov 2026 15:35:08 +0800
Message-Id: <20261102073532.98873-8-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3f5hGPehqi52fEw--.9836S9
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xw4UKw15Ww4UWw47tw45trb_yoWfJr15p3
	WrGrn8K39Yka4fWrsFyFyDZ3Wayw1fta9Fqry3Jw1Iqwnagr4ktFy5KF909Fyrtr95G34U
	uF4YyrZrCFsxZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UHOJ5UUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzgs2H2roPUs7DwAA3s

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
 fs/ntfs/logfile.c | 58 +++++++++++++++++++++++++++--------------------
 fs/ntfs/super.c   |  2 +-
 2 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/fs/ntfs/logfile.c b/fs/ntfs/logfile.c
index 2f27ae7a3927..0b60c6b0479d 100644
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
 	u32 ra_ofs, usa_count, usa_ofs, usa_end = 0;
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
@@ -452,6 +450,7 @@ static int ntfs_check_and_load_restart_page(struct inode *vi,
  */
 bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 {
+	int report_err = 0;
 	s64 size, pos;
 	s64 rstr1_lsn, rstr2_lsn;
 	struct ntfs_volume *vol = NTFS_SB(log_vi->i_sb);
@@ -461,7 +460,7 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 	struct restart_page_header *rstr1_ph = NULL;
 	struct restart_page_header *rstr2_ph = NULL;
 	int log_page_size, err;
-	bool logfile_is_empty = true;
+	bool logfile_is_empty = true, unsupported_version = false;
 	u8 log_page_bits;
 
 	ntfs_debug("Entering.");
@@ -495,8 +494,9 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 	 */
 	if (size < log_page_size * 2 || (size - log_page_size * 2) >>
 			log_page_bits < MinLogRecordPages) {
+		report_err = -EFSCORRUPTED;
 		ntfs_error(vol->sb, "LogFile is too small.");
-		return false;
+		goto err_out;
 	}
 	/*
 	 * Read through the file looking for a restart page.  Since the restart
@@ -516,6 +516,8 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 			}
 			folio = read_mapping_folio(mapping, idx, NULL);
 			if (IS_ERR(folio)) {
+				if (PTR_ERR(folio) == -EIO)
+					report_err = -EIO;
 				ntfs_error(vol->sb, "Error mapping LogFile page (index %lu).",
 						idx);
 				goto err_out;
@@ -574,7 +576,11 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 		 * not abort if the restart page was invalid as we might still
 		 * find a valid one further in the file.
 		 */
-		if (err != -EINVAL) {
+		if (err == -EOPNOTSUPP)
+			unsupported_version = true;
+		else if (err != -EINVAL) {
+			if (err == -EIO)
+				report_err = err;
 			kunmap_local(kbase);
 			folio_put(folio);
 			goto err_out;
@@ -594,9 +600,11 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 		return true;
 	}
 	if (!rstr1_ph) {
+		if (!unsupported_version)
+			report_err = -EFSCORRUPTED;
 		ntfs_error(vol->sb,
 			"Did not find any restart pages in LogFile and it was not empty.");
-		return false;
+		goto err_out;
 	}
 	/* If both restart pages were found, use the more recent one. */
 	if (rstr2_ph) {
@@ -624,6 +632,8 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 	return true;
 err_out:
 	kvfree(rstr1_ph);
+	if (report_err)
+		ntfs_report_file_metadata_error(log_vi, report_err);
 	return false;
 }
 
@@ -767,10 +777,10 @@ bool ntfs_empty_logfile(struct inode *log_vi)
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
index dff04972e9ec..481d528884ad 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -1365,7 +1365,7 @@ static int load_and_check_logfile(struct ntfs_volume *vol,
 	int err = 0;
 
 	ntfs_debug("Entering.");
-	tmp_ino = ntfs_iget(vol->sb, FILE_LogFile);
+	tmp_ino = ntfs_system_iget(vol, FILE_LogFile);
 	if (IS_ERR(tmp_ino)) {
 		if (!IS_ERR(tmp_ino))
 			iput(tmp_ino);

