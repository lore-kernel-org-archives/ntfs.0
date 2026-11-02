Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604970;
	b=G1xav1fQhOeDN03P2RxMyIRqN7/HXZUz/U6qITSqBXwDTXnnRJgAusNkmY/4g2wM1kKz
	 eC72ZQfqTREy5K3QEfhokDcG7QdHlIihFkYQ7HWBaIMkfOn+GwTlZYDh/n7mB3kFfDU1d
	 A+4arYzLxyH4OnvnPPFUHBfM2UI+N+hlz6u5WpVEKYxKcoS4UysdL0pWcmOpMuTO1AHnP
	 8UBNW3ntrakZn+wPTjt/RlAlvmMj+TIFoyqsH3bEBdqjrFXHkskSUlxbs5NdA1cgH8egW
	 IK1ybSDHUHkC6JUXB5dfaWxp+hiyaZNYEH+0q3wVvAl3abbgqGTN4OZJhjQbFCpPzXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604970;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=dqF7j8kFueGuHqUkVLDDtn2T7+/sylP5oI/wUcYQ3WA=;
	b=jTk/YgO8PeUbKwjhJSLjCLIvkSldXXbvHSSvLSdwvlgu4Jg9RXa/Ku/brbs5kF6G8Sxr
	 SDtkPRoiBla+ajxql8u8TPgaG2Nt597kNtolvD+zSlK/JoXVdqni0Mf71jn+0Vqg2OAB6
	 fKTvNvlyNjqZMtAPaEcxOev9yEcGUyQ/v206q5lVCq8VxpZQkuC4lAJInEIQhSytcz4Fm
	 RSdSEEzwDUYOb0m5El8jsQWdzpjSQocsU3LuYgEbbE7X1bQKM8KYbC93YRk/SbrnXGl02
	 DRYw4UpVbdW7IvkMAZR2TXZ7a5ylMfqUVkIvTX79SrV/EZI4pM38q5KtvuH5P9qJdLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EutAB4gb;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0018F60A2602
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0018F60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EutAB4gb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=dq
	F7j8kFueGuHqUkVLDDtn2T7+/sylP5oI/wUcYQ3WA=; b=EutAB4gbA6hH8tRY3g
	csUjHZ7XEW5EthrOYueCNwYyju0fEbxFTSoSMHcaDOuhSigtsc8mdgh1zSjncFk1
	vqr6rHKfWkpXx3D5nK20BSFP96HvKk+K57KCQKO1QQqpfm6AxJjknBT5HB8ODMRn
	5m6j6IA7nj9OPSe5OFRsN3/Vc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3f5hGPehqi52fEw--.9836S8;
	Mon, 02 Nov 2026 15:35:38 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>
Subject: [PATCH v5 06/31] ntfs: report required system file and volume metadata errors
Date: Mon,  2 Nov 2026 15:35:07 +0800
Message-Id: <20261102073532.98873-7-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3f5hGPehqi52fEw--.9836S8
X-Coremail-Antispam: 1Uf129KBjvAXoWfJFy3Kw4fAw43WFWfKw47XFb_yoW8WF1Duo
	WSka10kws5Wr4fJr4Yy3Z3ZasrZan8Cws5CF4rKw4kua929w4qga1xCw13Xa4fGw1YgF1D
	Aryxt3Z5XFW8AF98n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOXdbUUUUU
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzgs2H2roPUs6+wAA3Z

From: Dandan Wu <wudandan@kylinos.cn>

Required system-file loading can obscure the original errno or fail
without recording corrupt metadata. Report missing system records,
invalid tables and allocation metadata, and a stale hiberfil.sys
reference. An absent hiberfil.sys remains valid.

Preserve errors from the AttrDef and UpCase loaders and other system-file
initialization paths, retaining the default-upcase fallback. Report a
missing AT_VOLUME_INFORMATION during volume-flag updates and preserve
the errno when synchronizing the volume dirty state.

Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
 fs/ntfs/super.c | 184 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 127 insertions(+), 57 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index eb0ebbc235a4..dff04972e9ec 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -535,8 +535,13 @@ static int ntfs_write_volume_flags(struct ntfs_volume *vol,
 
 	err = ntfs_attr_lookup(AT_VOLUME_INFORMATION, NULL, 0, 0, 0, NULL, 0,
 			ctx);
-	if (err)
+	if (err) {
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
+		}
 		goto put_unm_err_out;
+	}
 
 	vi = (struct volume_information *)((u8 *)ctx->attr +
 			le16_to_cpu(ctx->attr->data.resident.value_offset));
@@ -1441,6 +1446,10 @@ static int check_windows_hibernation_status(struct ntfs_volume *vol)
 	/* Get the inode. */
 	vi = ntfs_iget(vol->sb, MREF(mref));
 	if (IS_ERR(vi)) {
+		if (PTR_ERR(vi) == -ENOENT) {
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
+			vi = ERR_PTR(-EFSCORRUPTED);
+		}
 		if (!IS_ERR(vi))
 			iput(vi);
 		ntfs_error(vol->sb, "Failed to load hiberfil.sys.");
@@ -1486,9 +1495,9 @@ static int check_windows_hibernation_status(struct ntfs_volume *vol)
  * load_and_init_attrdef - load the attribute definitions table for a volume
  * @vol:	ntfs super block describing device whose attrdef to load
  *
- * Return 'true' on success or 'false' on error.
+ * Return 0 on success or -errno on error.
  */
-static bool load_and_init_attrdef(struct ntfs_volume *vol)
+static int load_and_init_attrdef(struct ntfs_volume *vol)
 {
 	loff_t i_size;
 	struct super_block *sb = vol->sb;
@@ -1497,20 +1506,32 @@ static bool load_and_init_attrdef(struct ntfs_volume *vol)
 	u8 *addr;
 	pgoff_t index, max_index;
 	unsigned int size;
+	int err;
 
 	ntfs_debug("Entering.");
 	/* Read attrdef table and setup vol->attrdef and vol->attrdef_size. */
-	ino = ntfs_iget(sb, FILE_AttrDef);
-	if (IS_ERR(ino))
+	ino = ntfs_system_iget(vol, FILE_AttrDef);
+	if (IS_ERR(ino)) {
+		err = PTR_ERR(ino);
 		goto failed;
+	}
 	NInoSetSparseDisabled(NTFS_I(ino));
 	/* FILE_AttrDef must hold at least one entry and fit inside 31 bits. */
 	i_size = i_size_read(ino);
-	if (i_size < (s64)sizeof(struct attr_def) || i_size > 0x7fffffff)
+	if (i_size < (s64)sizeof(struct attr_def)) {
+		err = -EFSCORRUPTED;
+		ntfs_report_metadata_error(vol, err);
 		goto iput_failed;
+	}
+	if (i_size > 0x7fffffff) {
+		err = -EFBIG;
+		goto iput_failed;
+	}
 	vol->attrdef = kvzalloc(i_size, GFP_NOFS);
-	if (!vol->attrdef)
+	if (!vol->attrdef) {
+		err = -ENOMEM;
 		goto iput_failed;
+	}
 	index = 0;
 	max_index = i_size >> PAGE_SHIFT;
 	size = PAGE_SIZE;
@@ -1518,8 +1539,10 @@ static bool load_and_init_attrdef(struct ntfs_volume *vol)
 		/* Read the attrdef table and copy it into the linear buffer. */
 read_partial_attrdef_page:
 		folio = read_mapping_folio(ino->i_mapping, index, NULL);
-		if (IS_ERR(folio))
+		if (IS_ERR(folio)) {
+			err = PTR_ERR(folio);
 			goto free_iput_failed;
+		}
 		addr = kmap_local_folio(folio, 0);
 		memcpy((u8 *)vol->attrdef + (index++ << PAGE_SHIFT),
 				addr, size);
@@ -1534,7 +1557,7 @@ static bool load_and_init_attrdef(struct ntfs_volume *vol)
 	vol->attrdef_size = i_size;
 	ntfs_debug("Read %llu bytes from $AttrDef.", i_size);
 	iput(ino);
-	return true;
+	return 0;
 free_iput_failed:
 	kvfree(vol->attrdef);
 	vol->attrdef = NULL;
@@ -1542,16 +1565,16 @@ static bool load_and_init_attrdef(struct ntfs_volume *vol)
 	iput(ino);
 failed:
 	ntfs_error(sb, "Failed to initialize attribute definition table.");
-	return false;
+	return err;
 }
 
 /*
  * load_and_init_upcase - load the upcase table for an ntfs volume
  * @vol:	ntfs super block describing device whose upcase to load
  *
- * Return 'true' on success or 'false' on error.
+ * Return 0 on success or -errno on error.
  */
-static bool load_and_init_upcase(struct ntfs_volume *vol)
+static int load_and_init_upcase(struct ntfs_volume *vol)
 {
 	loff_t i_size;
 	struct super_block *sb = vol->sb;
@@ -1560,23 +1583,31 @@ static bool load_and_init_upcase(struct ntfs_volume *vol)
 	u8 *addr;
 	pgoff_t index, max_index;
 	unsigned int size;
+	int err;
 
 	ntfs_debug("Entering.");
 	/* Read upcase table and setup vol->upcase and vol->upcase_len. */
-	ino = ntfs_iget(sb, FILE_UpCase);
-	if (IS_ERR(ino))
+	ino = ntfs_system_iget(vol, FILE_UpCase);
+	if (IS_ERR(ino)) {
+		err = PTR_ERR(ino);
 		goto upcase_failed;
+	}
 	/*
 	 * The upcase size must not be above 64k Unicode characters, must not
 	 * be zero and must be a multiple of sizeof(__le16).
 	 */
 	i_size = i_size_read(ino);
 	if (!i_size || i_size & (sizeof(__le16) - 1) ||
-			i_size > 64ULL * 1024 * sizeof(__le16))
+			i_size > 64ULL * 1024 * sizeof(__le16)) {
+		err = -EFSCORRUPTED;
+		ntfs_report_metadata_error(vol, err);
 		goto iput_upcase_failed;
+	}
 	vol->upcase = kvzalloc(i_size, GFP_NOFS);
-	if (!vol->upcase)
+	if (!vol->upcase) {
+		err = -ENOMEM;
 		goto iput_upcase_failed;
+	}
 	index = 0;
 	max_index = i_size >> PAGE_SHIFT;
 	size = PAGE_SIZE;
@@ -1584,8 +1615,10 @@ static bool load_and_init_upcase(struct ntfs_volume *vol)
 		/* Read the upcase table and copy it into the linear buffer. */
 read_partial_upcase_page:
 		folio = read_mapping_folio(ino->i_mapping, index, NULL);
-		if (IS_ERR(folio))
+		if (IS_ERR(folio)) {
+			err = PTR_ERR(folio);
 			goto iput_upcase_failed;
+		}
 		addr = kmap_local_folio(folio, 0);
 		memcpy((char *)vol->upcase + (index++ << PAGE_SHIFT),
 				addr, size);
@@ -1605,7 +1638,7 @@ static bool load_and_init_upcase(struct ntfs_volume *vol)
 	if (!default_upcase) {
 		ntfs_debug("Using volume specified $UpCase since default is not present.");
 		mutex_unlock(&ntfs_lock);
-		return true;
+		return 0;
 	}
 	if (default_upcase_len == vol->upcase_len &&
 	    !memcmp(vol->upcase, default_upcase,
@@ -1615,11 +1648,11 @@ static bool load_and_init_upcase(struct ntfs_volume *vol)
 		ntfs_nr_upcase_users++;
 		mutex_unlock(&ntfs_lock);
 		ntfs_debug("Volume specified $UpCase matches default. Using default.");
-		return true;
+		return 0;
 	}
 	mutex_unlock(&ntfs_lock);
 	ntfs_debug("Using volume specified $UpCase since it does not match the default.");
-	return true;
+	return 0;
 iput_upcase_failed:
 	iput(ino);
 	kvfree(vol->upcase);
@@ -1632,11 +1665,11 @@ static bool load_and_init_upcase(struct ntfs_volume *vol)
 		ntfs_nr_upcase_users++;
 		mutex_unlock(&ntfs_lock);
 		ntfs_error(sb, "Failed to load $UpCase from the volume. Using default.");
-		return true;
+		return 0;
 	}
 	mutex_unlock(&ntfs_lock);
 	ntfs_error(sb, "Failed to initialize upcase table.");
-	return false;
+	return err;
 }
 
 static int ntfs_validate_badclus(struct ntfs_volume *vol,
@@ -1647,7 +1680,7 @@ static int ntfs_validate_badclus(struct ntfs_volume *vol,
 	size_t i;
 
 	if (!rl)
-		return -EIO;
+		return -EFSCORRUPTED;
 
 	for (i = 0; i < runlist->count; i++) {
 		if (!rl[i].length) {
@@ -1655,22 +1688,22 @@ static int ntfs_validate_badclus(struct ntfs_volume *vol,
 			    rl[i].vcn != vol->nr_clusters ||
 			    rl[i].lcn != LCN_ENOENT ||
 			    next_vcn != vol->nr_clusters)
-				return -EIO;
+				return -EFSCORRUPTED;
 			*bad_clusters = bad;
 			return 0;
 		}
 		if (rl[i].vcn != next_vcn || rl[i].length < 0 ||
 		    rl[i].length > vol->nr_clusters - next_vcn)
-			return -EIO;
+			return -EFSCORRUPTED;
 		if (rl[i].lcn != LCN_HOLE) {
 			/* Each bad cluster is mapped to its own volume offset. */
 			if (rl[i].lcn != rl[i].vcn)
-				return -EIO;
+				return -EFSCORRUPTED;
 			bad += rl[i].length;
 		}
 		next_vcn += rl[i].length;
 	}
-	return -EIO;
+	return -EFSCORRUPTED;
 }
 
 /*
@@ -1681,6 +1714,7 @@ static int ntfs_validate_badclus(struct ntfs_volume *vol,
  */
 static int load_and_check_badclus(struct ntfs_volume *vol)
 {
+	int report_err = 0;
 	static __le16 bad_name[] = {
 		cpu_to_le16('$'), cpu_to_le16('B'),
 		cpu_to_le16('a'), cpu_to_le16('d'),
@@ -1693,23 +1727,29 @@ static int load_and_check_badclus(struct ntfs_volume *vol)
 	size_t i;
 	int err;
 
-	base_ino = ntfs_iget(sb, FILE_BadClus);
+	base_ino = ntfs_system_iget(vol, FILE_BadClus);
 	if (IS_ERR(base_ino))
 		return PTR_ERR(base_ino);
 	if (!S_ISREG(base_ino->i_mode)) {
-		err = -EIO;
+		err = -EFSCORRUPTED;
+		report_err = -EFSCORRUPTED;
 		goto iput_base;
 	}
 	bad_ino = ntfs_attr_iget(base_ino, AT_DATA, bad_name,
 				 ARRAY_SIZE(bad_name));
 	if (IS_ERR(bad_ino)) {
 		err = PTR_ERR(bad_ino);
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
+		}
 		goto iput_base;
 	}
 	ni = NTFS_I(bad_ino);
 	if (!NInoNonResident(ni) || NInoCompressed(ni) || NInoEncrypted(ni) ||
 	    ni->data_size != size || ni->allocated_size != size) {
-		err = -EIO;
+		err = -EFSCORRUPTED;
+		report_err = -EFSCORRUPTED;
 		goto iput_bad;
 	}
 
@@ -1718,8 +1758,10 @@ static int load_and_check_badclus(struct ntfs_volume *vol)
 	if (err)
 		goto unlock;
 	err = ntfs_validate_badclus(vol, &ni->runlist, &vol->bad_clusters);
-	if (err)
+	if (err) {
+		report_err = -EFSCORRUPTED;
 		goto unlock;
+	}
 	for (i = 0; i < ni->runlist.count - 1; i++) {
 		struct runlist_element *rl = &ni->runlist.rl[i];
 
@@ -1737,17 +1779,20 @@ static int load_and_check_badclus(struct ntfs_volume *vol)
 iput_base:
 	iput(base_ino);
 	if (err)
-		return err;
+		goto out;
 	if (free_bits) {
 		/* A read-only mount must not later remount RW without repair. */
-		if (sb_rdonly(sb))
-			return -EIO;
+		if (sb_rdonly(sb)) {
+			report_err = -EFSCORRUPTED;
+			err = -EFSCORRUPTED;
+			goto out;
+		}
 		err = filemap_write_and_wait(vol->lcnbmp_ino->i_mapping);
 		if (err)
-			return err;
+			goto out;
 		err = blkdev_issue_flush(sb->s_bdev);
 		if (err)
-			return err;
+			goto out;
 		ntfs_warning(sb,
 			     "Marked %lld bad clusters as used in $Bitmap.",
 			     free_bits);
@@ -1755,7 +1800,11 @@ static int load_and_check_badclus(struct ntfs_volume *vol)
 	if (vol->bad_clusters)
 		pr_info("volume contains %lld bad clusters, dev %s\n",
 			vol->bad_clusters, sb->s_id);
-	return 0;
+	err = 0;
+out:
+	if (report_err)
+		ntfs_report_metadata_error(vol, report_err);
+	return err;
 }
 
 /*
@@ -1777,6 +1826,7 @@ static struct lock_class_key
  */
 static int load_system_files(struct ntfs_volume *vol)
 {
+	int report_err = 0;
 	struct super_block *sb = vol->sb;
 	struct mft_record *m;
 	struct volume_information *vi;
@@ -1803,6 +1853,11 @@ static int load_system_files(struct ntfs_volume *vol)
 	/* Get mft bitmap attribute inode. */
 	vol->mftbmp_ino = ntfs_attr_iget(vol->mft_ino, AT_BITMAP, NULL, 0);
 	if (IS_ERR(vol->mftbmp_ino)) {
+		if (PTR_ERR(vol->mftbmp_ino) == -ENOENT) {
+			report_err = -EFSCORRUPTED;
+			vol->mftbmp_ino = ERR_PTR(-EFSCORRUPTED);
+		}
+		ret = PTR_ERR(vol->mftbmp_ino);
 		ntfs_error(sb, "Failed to load $MFT/$BITMAP attribute.");
 		goto iput_mirr_err_out;
 	}
@@ -1811,23 +1866,24 @@ static int load_system_files(struct ntfs_volume *vol)
 	lockdep_set_class(&NTFS_I(vol->mftbmp_ino)->mrec_lock,
 			   &mftbmp_mrec_lock_key);
 	/* Read upcase table and setup @vol->upcase and @vol->upcase_len. */
-	if (!load_and_init_upcase(vol))
+	ret = load_and_init_upcase(vol);
+	if (ret)
 		goto iput_mftbmp_err_out;
 	/*
 	 * Read attribute definitions table and setup @vol->attrdef and
 	 * @vol->attrdef_size.
 	 */
-	if (!load_and_init_attrdef(vol))
+	ret = load_and_init_attrdef(vol);
+	if (ret)
 		goto iput_upcase_err_out;
 	/*
 	 * Get the cluster allocation bitmap inode and verify the size, no
 	 * need for any locking at this stage as we are already running
 	 * exclusively as we are mount in progress task.
 	 */
-	vol->lcnbmp_ino = ntfs_iget(sb, FILE_Bitmap);
+	vol->lcnbmp_ino = ntfs_system_iget(vol, FILE_Bitmap);
 	if (IS_ERR(vol->lcnbmp_ino)) {
-		if (!IS_ERR(vol->lcnbmp_ino))
-			iput(vol->lcnbmp_ino);
+		ret = PTR_ERR(vol->lcnbmp_ino);
 		goto bitmap_failed;
 	}
 	lockdep_set_class(&NTFS_I(vol->lcnbmp_ino)->runlist.lock,
@@ -1837,6 +1893,8 @@ static int load_system_files(struct ntfs_volume *vol)
 
 	NInoSetSparseDisabled(NTFS_I(vol->lcnbmp_ino));
 	if ((vol->nr_clusters + 7) >> 3 > i_size_read(vol->lcnbmp_ino)) {
+		ret = -EFSCORRUPTED;
+		report_err = -EFSCORRUPTED;
 		iput(vol->lcnbmp_ino);
 bitmap_failed:
 		ntfs_error(sb, "Failed to load $Bitmap.");
@@ -1846,8 +1904,9 @@ static int load_system_files(struct ntfs_volume *vol)
 	 * Get the volume inode and setup our cache of the volume flags and
 	 * version.
 	 */
-	vol->vol_ino = ntfs_iget(sb, FILE_Volume);
+	vol->vol_ino = ntfs_system_iget(vol, FILE_Volume);
 	if (IS_ERR(vol->vol_ino)) {
+		ret = PTR_ERR(vol->vol_ino);
 		vol->vol_ino = NULL;
 volume_failed:
 		ntfs_error(sb, "Failed to load $Volume.");
@@ -1855,6 +1914,7 @@ static int load_system_files(struct ntfs_volume *vol)
 	}
 	m = map_mft_record(NTFS_I(vol->vol_ino));
 	if (IS_ERR(m)) {
+		ret = PTR_ERR(m);
 iput_volume_failed:
 		iput(vol->vol_ino);
 		vol->vol_ino = NULL;
@@ -1882,8 +1942,14 @@ static int load_system_files(struct ntfs_volume *vol)
 	}
 
 	ntfs_attr_reinit_search_ctx(ctx);
-	if (ntfs_attr_lookup(AT_VOLUME_INFORMATION, NULL, 0, 0, 0, NULL, 0,
-			ctx) || ctx->attr->non_resident || ctx->attr->flags) {
+	err = ntfs_attr_lookup(AT_VOLUME_INFORMATION, NULL, 0, 0, 0,
+			       NULL, 0, ctx);
+	if (err || ctx->attr->non_resident || ctx->attr->flags) {
+		ret = err;
+		if (!err || err == -ENOENT) {
+			ret = -EFSCORRUPTED;
+			report_err = ret;
+		}
 		ntfs_attr_put_search_ctx(ctx);
 get_ctx_vol_failed:
 		unmap_mft_record(NTFS_I(vol->vol_ino));
@@ -1947,10 +2013,9 @@ static int load_system_files(struct ntfs_volume *vol)
 
 	kvfree(rp);
 	/* Get the root directory inode so we can do path lookups. */
-	vol->root_ino = ntfs_iget(sb, FILE_root);
+	vol->root_ino = ntfs_system_iget(vol, FILE_root);
 	if (IS_ERR(vol->root_ino)) {
-		if (!IS_ERR(vol->root_ino))
-			iput(vol->root_ino);
+		ret = PTR_ERR(vol->root_ino);
 		ntfs_error(sb, "Failed to load root directory.");
 		goto iput_logfile_err_out;
 	}
@@ -2033,19 +2098,22 @@ static int load_system_files(struct ntfs_volume *vol)
 		return 0;
 	/* NTFS 3.0+ specific initialization. */
 	/* Get the security descriptors inode. */
-	vol->secure_ino = ntfs_iget(sb, FILE_Secure);
+	vol->secure_ino = ntfs_system_iget(vol, FILE_Secure);
 	if (IS_ERR(vol->secure_ino)) {
-		if (!IS_ERR(vol->secure_ino))
-			iput(vol->secure_ino);
+		ret = PTR_ERR(vol->secure_ino);
 		ntfs_error(sb, "Failed to load $Secure.");
 		goto iput_root_err_out;
 	}
 	/* Get the extended system files' directory inode. */
-	vol->extend_ino = ntfs_iget(sb, FILE_Extend);
+	vol->extend_ino = ntfs_system_iget(vol, FILE_Extend);
 	if (IS_ERR(vol->extend_ino) ||
 	    !S_ISDIR(vol->extend_ino->i_mode)) {
-		if (!IS_ERR(vol->extend_ino))
+		ret = IS_ERR(vol->extend_ino) ?
+			PTR_ERR(vol->extend_ino) : -EFSCORRUPTED;
+		if (!IS_ERR(vol->extend_ino)) {
+			report_err = -EFSCORRUPTED;
 			iput(vol->extend_ino);
+		}
 		ntfs_error(sb, "Failed to load $Extend.");
 		goto iput_sec_err_out;
 	}
@@ -2085,6 +2153,8 @@ static int load_system_files(struct ntfs_volume *vol)
 	iput(vol->mftbmp_ino);
 iput_mirr_err_out:
 	iput(vol->mftmirr_ino);
+	if (report_err)
+		ntfs_report_metadata_error(vol, report_err);
 	return ret;
 }
 
@@ -2339,10 +2409,10 @@ static int ntfs_sync_fs(struct super_block *sb, int wait)
 	 * seen no modification; with NVolErrors() set this can only set
 	 * the bit, never clear it.
 	 */
-	if (NVolErrors(vol) &&
-	    ntfs_sync_volume_dirty_state(vol)) {
-		ntfs_warning(sb, "Failed to sync dirty bit in volume information flags.  Run chkdsk.");
-		err = -EIO;
+	if (NVolErrors(vol)) {
+		err = ntfs_sync_volume_dirty_state(vol);
+		if (err)
+			ntfs_warning(sb, "Failed to sync dirty bit in volume information flags.  Run chkdsk.");
 	}
 	sync_inodes_sb(sb);
 	ret = sync_blockdev(sb->s_bdev);

