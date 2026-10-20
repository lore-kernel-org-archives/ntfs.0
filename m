Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485886;
	b=e4/TqK5tWCYe3EXkVvmTJs03uOW6dpMYhq9HdFZZy0uL/eMNUcD/JVyqtqrEo8XvikQe
	 xd2e4QZ8tsjw+P3lKujBMfGfHY3Qy8ORHtIl6ypC3GyE3Qem3629b/G4gf8YpjdkEP7ZE
	 FplthMtNGEjhTh0ua/nMa+BLL0jsowG2OVFheKsTrcfXqmBxAzpLLHzZDFW2qcqut/nZ+
	 59qyDzXbSJrhlgtn7IzGoTgyRImHsXONcRZPasbUpHVnS9VC8gTxO5BtfokogPz7vwuWA
	 3ad9bNtZOJlWjhv7hbnUZi3oFezRirkmZwZWoq7qyAZWYq9pfkFZMob826msXfJAaKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485886;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=75gnQpTeCgGrE/P0tzswC8L5hd5wdEmzu+xryb8rj9c=;
	b=4nOkmtCEeyD4ntTo8Kd/Ov5VwXJcGZlRM0RyYPOc3IrXI+PKCwufkZ60AN3U1EDYnjlI
	 fXLoRmyCAn9HyFYJETsUG/LiVFY9ae9yckZekoEYND+sx+lrmPkO9mh/92OdCo1pTNO9d
	 JrmRH8PMee5HUQKCe6ynH34vge40MDXnF0I3klKKqyOG3nFVA4WWRdOKCTmyqWKAnZFEg
	 7S0S0FBS7iErVl0ljuS6mVQ5S+EryXEo+SxjFii9Q6uRknkZz2zGIkAr5gVnQfrzptMUM
	 rIAGsyTX7YkoB7pOMVjBTrBH6pFHEaFRz/g0VU2/E4URAImYur6VEd0idtPc9o8BRUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=OM3HUs7T;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CB8606A31B
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58CB8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=OM3HUs7T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=75
	gnQpTeCgGrE/P0tzswC8L5hd5wdEmzu+xryb8rj9c=; b=OM3HUs7TlquksPWLtx
	SpupT/anaz97a1vgj17YJUTY2dySj2PxNNIEgY0bXGmO7J0X10ZLMW65ppVeJjBV
	Tu0wEAdFJvl+NeGnXtqSiBdYHJU+N8PqL+HDJNLHDpjB+LlfmaHNuE/4qiQXWrAS
	VwnoIvdP8vvB1scvWUnR23yfU=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3XyPnKddq1latBA--.56704S8;
	Tue, 20 Oct 2026 16:44:31 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 06/31] ntfs: report required system file and volume metadata errors
Date: Tue, 20 Oct 2026 16:43:56 +0800
Message-ID: <20261020084421.2196486-7-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3XyPnKddq1latBA--.56704S8
X-Coremail-Antispam: 1Uf129KBjvAXoWfJFy3KrWUAryfKr18Xr45GFg_yoW8XFyUCo
	WSkF40kw4kWr4fJr4Yy3Z3ZasrZa98Cws5GF4rKF4kCa92vw4qga1xCw13XayfGw1YgF4q
	vryxJFn5ZFW8AFyDn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4iiSUUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6g8W4GrXKe9uGwAA3d

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
 fs/ntfs/super.c | 167 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 114 insertions(+), 53 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index afee1b262a12..f5c9cf368f8a 100644
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
@@ -1433,6 +1438,10 @@ static int check_windows_hibernation_status(struct ntfs_volume *vol)
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
@@ -1478,9 +1487,9 @@ static int check_windows_hibernation_status(struct ntfs_volume *vol)
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
@@ -1489,20 +1498,32 @@ static bool load_and_init_attrdef(struct ntfs_volume *vol)
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
+		goto iput_failed;
+	}
+	if (i_size > 0x7fffffff) {
+		err = -EFBIG;
 		goto iput_failed;
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
@@ -1510,8 +1531,10 @@ static bool load_and_init_attrdef(struct ntfs_volume *vol)
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
@@ -1526,7 +1549,7 @@ static bool load_and_init_attrdef(struct ntfs_volume *vol)
 	vol->attrdef_size = i_size;
 	ntfs_debug("Read %llu bytes from $AttrDef.", i_size);
 	iput(ino);
-	return true;
+	return 0;
 free_iput_failed:
 	kvfree(vol->attrdef);
 	vol->attrdef = NULL;
@@ -1534,16 +1557,16 @@ static bool load_and_init_attrdef(struct ntfs_volume *vol)
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
@@ -1552,23 +1575,31 @@ static bool load_and_init_upcase(struct ntfs_volume *vol)
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
@@ -1576,8 +1607,10 @@ static bool load_and_init_upcase(struct ntfs_volume *vol)
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
@@ -1597,7 +1630,7 @@ static bool load_and_init_upcase(struct ntfs_volume *vol)
 	if (!default_upcase) {
 		ntfs_debug("Using volume specified $UpCase since default is not present.");
 		mutex_unlock(&ntfs_lock);
-		return true;
+		return 0;
 	}
 	if (default_upcase_len == vol->upcase_len &&
 	    !memcmp(vol->upcase, default_upcase,
@@ -1607,11 +1640,11 @@ static bool load_and_init_upcase(struct ntfs_volume *vol)
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
@@ -1624,11 +1657,11 @@ static bool load_and_init_upcase(struct ntfs_volume *vol)
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
@@ -1639,7 +1672,7 @@ static int ntfs_validate_badclus(struct ntfs_volume *vol,
 	size_t i;
 
 	if (!rl)
-		return -EIO;
+		return -EFSCORRUPTED;
 
 	for (i = 0; i < runlist->count; i++) {
 		if (!rl[i].length) {
@@ -1647,22 +1680,22 @@ static int ntfs_validate_badclus(struct ntfs_volume *vol,
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
@@ -1685,23 +1718,29 @@ static int load_and_check_badclus(struct ntfs_volume *vol)
 	size_t i;
 	int err;
 
-	base_ino = ntfs_iget(sb, FILE_BadClus);
+	base_ino = ntfs_system_iget(vol, FILE_BadClus);
 	if (IS_ERR(base_ino))
 		return PTR_ERR(base_ino);
 	if (!S_ISREG(base_ino->i_mode)) {
-		err = -EIO;
+		err = -EFSCORRUPTED;
+		ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 		goto iput_base;
 	}
 	bad_ino = ntfs_attr_iget(base_ino, AT_DATA, bad_name,
 				 ARRAY_SIZE(bad_name));
 	if (IS_ERR(bad_ino)) {
 		err = PTR_ERR(bad_ino);
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
+		}
 		goto iput_base;
 	}
 	ni = NTFS_I(bad_ino);
 	if (!NInoNonResident(ni) || NInoCompressed(ni) || NInoEncrypted(ni) ||
 	    ni->data_size != size || ni->allocated_size != size) {
-		err = -EIO;
+		err = -EFSCORRUPTED;
+		ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 		goto iput_bad;
 	}
 
@@ -1710,8 +1749,10 @@ static int load_and_check_badclus(struct ntfs_volume *vol)
 	if (err)
 		goto unlock;
 	err = ntfs_validate_badclus(vol, &ni->runlist, &vol->bad_clusters);
-	if (err)
+	if (err) {
+		ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 		goto unlock;
+	}
 	for (i = 0; i < ni->runlist.count - 1; i++) {
 		struct runlist_element *rl = &ni->runlist.rl[i];
 
@@ -1732,8 +1773,10 @@ static int load_and_check_badclus(struct ntfs_volume *vol)
 		return err;
 	if (free_bits) {
 		/* A read-only mount must not later remount RW without repair. */
-		if (sb_rdonly(sb))
-			return -EIO;
+		if (sb_rdonly(sb)) {
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
+			return -EFSCORRUPTED;
+		}
 		err = filemap_write_and_wait(vol->lcnbmp_ino->i_mapping);
 		if (err)
 			return err;
@@ -1795,6 +1838,11 @@ static int load_system_files(struct ntfs_volume *vol)
 	/* Get mft bitmap attribute inode. */
 	vol->mftbmp_ino = ntfs_attr_iget(vol->mft_ino, AT_BITMAP, NULL, 0);
 	if (IS_ERR(vol->mftbmp_ino)) {
+		if (PTR_ERR(vol->mftbmp_ino) == -ENOENT) {
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
+			vol->mftbmp_ino = ERR_PTR(-EFSCORRUPTED);
+		}
+		ret = PTR_ERR(vol->mftbmp_ino);
 		ntfs_error(sb, "Failed to load $MFT/$BITMAP attribute.");
 		goto iput_mirr_err_out;
 	}
@@ -1803,23 +1851,24 @@ static int load_system_files(struct ntfs_volume *vol)
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
@@ -1829,6 +1878,8 @@ static int load_system_files(struct ntfs_volume *vol)
 
 	NInoSetSparseDisabled(NTFS_I(vol->lcnbmp_ino));
 	if ((vol->nr_clusters + 7) >> 3 > i_size_read(vol->lcnbmp_ino)) {
+		ret = -EFSCORRUPTED;
+		ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 		iput(vol->lcnbmp_ino);
 bitmap_failed:
 		ntfs_error(sb, "Failed to load $Bitmap.");
@@ -1838,8 +1889,9 @@ static int load_system_files(struct ntfs_volume *vol)
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
@@ -1847,6 +1899,7 @@ static int load_system_files(struct ntfs_volume *vol)
 	}
 	m = map_mft_record(NTFS_I(vol->vol_ino));
 	if (IS_ERR(m)) {
+		ret = PTR_ERR(m);
 iput_volume_failed:
 		iput(vol->vol_ino);
 		vol->vol_ino = NULL;
@@ -1874,8 +1927,14 @@ static int load_system_files(struct ntfs_volume *vol)
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
+			ntfs_report_metadata_error(vol, ret);
+		}
 		ntfs_attr_put_search_ctx(ctx);
 get_ctx_vol_failed:
 		unmap_mft_record(NTFS_I(vol->vol_ino));
@@ -1939,10 +1998,9 @@ static int load_system_files(struct ntfs_volume *vol)
 
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
@@ -2025,19 +2083,22 @@ static int load_system_files(struct ntfs_volume *vol)
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
+			ntfs_report_metadata_error(vol, -EFSCORRUPTED);
 			iput(vol->extend_ino);
+		}
 		ntfs_error(sb, "Failed to load $Extend.");
 		goto iput_sec_err_out;
 	}
@@ -2331,10 +2392,10 @@ static int ntfs_sync_fs(struct super_block *sb, int wait)
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
-- 
2.51.0

