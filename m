Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605015;
	b=BLRx3WPQDxKPIHwXpcb11s9FbtjQ51b1dtBLSIJ27rki8RTAhtRUxFJTsyVHAoQIIyGS
	 8JDyi1/AH+Tp49Gckj/dtaAPd8vhpNjQASsCeOUIekxmQrOSj8Mfm5gbWSfwwF9mConZG
	 fLWKAgRT9MS3+zbzZvvDPwRqfNqkWD8NJYx3L2RCgTEPCOkHrHrATv1Iv4eI/589R4Uj4
	 KN9v5gpFax4WykI0Dh2oxSeKxLzti9N/fxV+/8byeBlHFnqde2Boc+9QGyUuu6nhq0YTT
	 thC0WAYjuJReAnmJADBzxpSrQzjGWwWI8tx+3ZOhPv1pK7TXcKXR3PnW0s+Y6uc0psA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605015;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=yiwz2hGdv4No/2PT3guCNXkbvRH8Cl0iVQfF+tPOnYQ=;
	b=vzQ5nT6l5Cf+JzDaLIylIRjM0yOCBRUJkaZ1sNnVAOLS7IHFqbdX8pOwIFTdLyQhJhxp
	 UINzzQ5OsIsu1fYlZVQZ0CEwfwoaf0n+ZT6Py0Eh9sDrt8W7SPYcyfp6gq4j7PVSHQ2xZ
	 4rDIuZZzxNqNkYRCmZudkU82Ejt9PrlMoD95F811jqf0Y3qcYY0+GkFgus47S6uZdSLEg
	 yV36SR4kby9edSI5APnkfPQTyWpoMhTIh0xEc3XiPq8zny0KK/CqEwez7Iw79/bPvuh9/
	 UCh5f4wVR0cTNPaRJnC19fcFXj+81ZMH8bGizqQG+QDlKEqwXjmGun8Z8+EaEBiGPrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aAi2kIRE;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B47606A327
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B47606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aAi2kIRE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=yi
	wz2hGdv4No/2PT3guCNXkbvRH8Cl0iVQfF+tPOnYQ=; b=aAi2kIRE7X9cRjWh6G
	gzdawXhtu/VxkhVvDYifK+WAp/mFxkD4n/4bpyU+4HTjdUz97md/VaisFh+gUuR/
	AHyoUri3SIKhZQI6a9khIKLC54LZWlwW53dUQJIXtmBFB8ZJi/YhppcyZrF9g3Py
	Pb1SrbyYrnSgUBrteBOsI+l+A=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3vy+HPehqF0lcEw--.2040S9;
	Mon, 02 Nov 2026 15:36:44 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v5 15/31] ntfs: report attribute conversion and mapping update failures
Date: Mon,  2 Nov 2026 15:35:16 +0800
Message-Id: <20261102073532.98873-16-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3vy+HPehqF0lcEw--.2040S9
X-Coremail-Antispam: 1Uf129KBjvAXoWfZw1xAw1xuFWDKr4DuF4Uurg_yoW8uF1xZo
	W3AF40kw1vywn8C3yjk3Z5JasxZa98C3y5JrW5ArsrAan2qw1DCw15Jw15Wayru3yFgrs0
	qr18tFs5AF4xAFy5n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOXo2UUUUU
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzgxHMGroPYxBggAA3F

From: Baolin Liu <liubaolin@kylinos.cn>

Attribute conversion and mapping updates can detect corruption or fail
to recover modified metadata without reporting it. Cover missing
required attributes, malformed mapping pairs and failed extent cleanup.

Preserve ENOMEM from runlist merges and report invalid merges as
EFSCORRUPTED. Report failed cluster release, mapping restoration and
record cleanup separately from the initiating error. Include failure to
restore the resident record after an unsuccessful conversion.

Report a failed attribute-list update after moving a record to make
room for sparse metadata, unless the list updater already reported it.
Have the locked list updater expose whether it issued a report, and
propagate that status through list-entry removal to avoid duplicate
persistence reports.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
Validation:
- Six cases cover resident-record restoration and independent
  cluster-release failures, preserving the initiating errno.
- Thirteen cases cover list persistence after moving a record for sparse
  metadata, including success and suppression of duplicate reports.
- Eight cases check the list updater's reporting-status output; twelve
  exercise record removal, list-entry removal and persistence together.
- All pass in extracted-source userspace harnesses with controlled
  dependencies under ASan/UBSan. These check reporting calls, not kernel
  FAN_FS_ERROR event delivery.

 fs/ntfs/attrib.c   | 157 ++++++++++++++++++++++++++++++++++-----------
 fs/ntfs/attrlist.c |  18 ++++--
 fs/ntfs/attrlist.h |   4 +-
 3 files changed, 137 insertions(+), 42 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 7a0af1e4c69d..56cf75e542d3 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -2060,6 +2060,7 @@ int ntfs_resident_attr_value_resize(struct mft_record *m, struct attr_record *a,
  */
 int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 {
+	int report_err = 0;
 	s64 new_size;
 	struct inode *vi = VFS_I(ni);
 	struct ntfs_volume *vol = ni->vol;
@@ -2113,8 +2114,10 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (unlikely(err)) {
-		if (err == -ENOENT)
-			err = -EIO;
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
+		}
 		goto err_out;
 	}
 	m = ctx->mrec;
@@ -2168,12 +2171,15 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 	mp_size = ntfs_get_size_for_mapping_pairs(vol, rl, 0, -1, -1);
 	if (unlikely(mp_size < 0)) {
 		err = mp_size;
+		if (err == -EFSCORRUPTED)
+			report_err = -EFSCORRUPTED;
 		ntfs_debug("Failed to get size for mapping pairs array, error code %i.\n", err);
 		goto rl_err_out;
 	}
 
 	if (NInoNonResident(ni) || a->non_resident) {
-		err = -EIO;
+		err = -EFSCORRUPTED;
+		report_err = -EFSCORRUPTED;
 		goto rl_err_out;
 	}
 
@@ -2247,6 +2253,8 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 	err = ntfs_mapping_pairs_build(vol, (u8 *)a + mp_ofs,
 			arec_size - mp_ofs, rl, 0, -1, NULL, NULL, NULL);
 	if (unlikely(err)) {
+		if (err == -EFSCORRUPTED)
+			report_err = -EFSCORRUPTED;
 		ntfs_error(vol->sb, "Failed to build mapping pairs, error code %i.",
 				err);
 		goto undo_err_out;
@@ -2316,6 +2324,7 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 	/* Resize the resident part of the attribute record. */
 	err2 = ntfs_attr_record_resize(m, a, arec_size);
 	if (unlikely(err2)) {
+		ntfs_report_file_metadata_error(vi, err2);
 		/*
 		 * This cannot happen (well if memory corruption is at work it
 		 * could happen in theory), but deal with it as well as we can.
@@ -2357,10 +2366,11 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 rl_err_out:
 	up_write(&ni->runlist.lock);
 	if (rl) {
-		if (ntfs_cluster_free_from_rl(vol, rl) < 0) {
+		err2 = ntfs_cluster_free_from_rl(vol, rl);
+		if (err2 < 0) {
 			ntfs_error(vol->sb,
 				"Failed to release allocated cluster(s) in error code path.  Run chkdsk to recover the lost cluster(s).");
-			NVolSetErrors(vol);
+			ntfs_report_file_metadata_error(vi, err2);
 		}
 		kvfree(rl);
 folio_err_out:
@@ -2376,6 +2386,8 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 
 	if (err == -EINVAL)
 		err = -EIO;
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(base_ni), report_err);
 	return err;
 }
 
@@ -2451,8 +2463,14 @@ int ntfs_attr_set_initialized_size(struct ntfs_inode *ni, loff_t new_size)
 
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			       CASE_SENSITIVE, 0, NULL, 0, ctx);
-	if (err)
+	if (err) {
+		if (err == -ENOENT && !ntfs_inode_is_named_stream(ni)) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+		}
 		goto out_ctx;
+	}
 
 	ctx->attr->data.non_resident.initialized_size = cpu_to_le64(new_size);
 	ni->initialized_size = new_size;
@@ -2819,9 +2837,12 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
 	 * delete $ATTRIBUTE_LIST itself.
 	 */
 	if (NInoAttrList(base_ni) && type != AT_ATTRIBUTE_LIST) {
-		err = ntfs_attrlist_entry_rm(ctx);
+		bool reported;
+
+		err = ntfs_attrlist_entry_rm(ctx, &reported);
 		if (err) {
-			report_err = err;
+			if (!reported)
+				report_err = err;
 			ntfs_debug("Couldn't delete record from $ATTRIBUTE_LIST.\n");
 			goto out;
 		}
@@ -3798,6 +3819,7 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
 		struct mft_record *m, struct ntfs_attr_search_ctx *ctx,
 		struct ntfs_inode *locked_ni, bool defer_attrlist)
 {
+	int report_err = 0;
 	int sparse, err = 0;
 	struct ntfs_inode *base_ni;
 	struct super_block *sb = ni->vol->sb;
@@ -3817,7 +3839,8 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
 
 	sparse = ntfs_rl_sparse(ni->runlist.rl);
 	if (sparse < 0) {
-		err = -EIO;
+		err = -EFSCORRUPTED;
+		report_err = -EFSCORRUPTED;
 		goto out;
 	}
 
@@ -3831,6 +3854,7 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
 		if ((le32_to_cpu(a->length) -
 		     le16_to_cpu(a->data.non_resident.mapping_pairs_offset) == 8) &&
 		    !(le32_to_cpu(m->bytes_allocated) - le32_to_cpu(m->bytes_in_use))) {
+			bool reported;
 
 			if (defer_attrlist)
 				return -ENOSPC;
@@ -3847,16 +3871,22 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
 				goto out;
 			}
 
-			err = ntfs_attrlist_update_locked(base_ni, locked_ni);
-			if (err)
+			err = ntfs_attrlist_update_locked(base_ni, locked_ni,
+							  &reported);
+			if (err) {
+				/* The moved record still has its old on-disk list entry. */
+				if (!reported)
+					report_err = err;
 				goto out;
+			}
 			err = -EAGAIN;
 			goto out;
 		}
 		if (!(le32_to_cpu(a->length) -
 		    le16_to_cpu(a->data.non_resident.mapping_pairs_offset))) {
-			err = -EIO;
+			err = -EFSCORRUPTED;
 			ntfs_error(sb, "Mapping pairs space is 0");
+			report_err = -EFSCORRUPTED;
 			goto out;
 		}
 
@@ -3900,7 +3930,8 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
 
 		new_compr_size = ntfs_rl_get_compressed_size(ni->vol, ni->runlist.rl);
 		if (new_compr_size < 0) {
-			err = new_compr_size;
+			report_err = -EFSCORRUPTED;
+			err = -EFSCORRUPTED;
 			goto out;
 		}
 
@@ -3919,6 +3950,8 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
 	if (ni->type == AT_DATA && ni->name == AT_UNNAMED)
 		NInoSetFileNameDirty(ni);
 out:
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(ni), report_err);
 	return err;
 }
 
@@ -3943,12 +3976,14 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 					    struct ntfs_inode *locked_ni,
 					    bool defer_attrlist)
 {
+	int report_err = 0;
 	struct ntfs_attr_search_ctx *ctx;
 	struct ntfs_inode *base_ni;
 	struct mft_record *m;
 	struct attr_record *a;
 	s64 stop_vcn;
 	int err = 0, mp_size, cur_max_mp_size, exp_max_mp_size;
+	int rollback_err;
 	bool finished_build;
 	bool first_updated = false;
 	struct super_block *sb;
@@ -4011,8 +4046,9 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 			 */
 			first_lcn = ntfs_rl_vcn_to_lcn(ni->runlist.rl, stop_vcn);
 			if (first_lcn == LCN_EINVAL) {
-				err = -EIO;
+				err = -EFSCORRUPTED;
 				ntfs_error(sb, "Bad runlist");
+				report_err = -EFSCORRUPTED;
 				goto put_err_out;
 			}
 			if (first_lcn == LCN_ENOENT ||
@@ -4063,6 +4099,8 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 				stop_vcn, -1, exp_max_mp_size);
 		if (mp_size <= 0) {
 			err = mp_size;
+			if (err == -EFSCORRUPTED)
+				report_err = -EFSCORRUPTED;
 			ntfs_error(sb, "%s: get MP size failed", __func__);
 			goto put_err_out;
 		}
@@ -4084,8 +4122,7 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 							cur_max_mp_size);
 				if (err)
 					return err;
-				err = ntfs_attrlist_update_locked(
-					base_ni, locked_ni);
+				err = ntfs_attrlist_update_locked(base_ni, locked_ni, NULL);
 				if (err)
 					return err;
 				goto retry;
@@ -4098,9 +4135,10 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 					goto put_err_out;
 				}
 				ntfs_attr_put_search_ctx(ctx);
-				if (ntfs_inode_add_attrlist(base_ni)) {
+				err = ntfs_inode_add_attrlist(base_ni);
+				if (err) {
 					ntfs_error(sb, "Can not add attrlist");
-					return -EIO;
+					return err;
 				}
 				goto retry;
 			}
@@ -4117,8 +4155,9 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 		if (((mp_size + 7) & ~7) != cur_max_mp_size) {
 			if (ntfs_attr_record_resize(m, a,
 					le16_to_cpu(a->data.non_resident.mapping_pairs_offset) +
-						mp_size)) {
+					mp_size)) {
 				err = -EIO;
+				report_err = err;
 				ntfs_error(sb, "Failed to resize attribute");
 				goto put_err_out;
 			}
@@ -4138,7 +4177,7 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 		if ((ctx->ntfs_ino->nr_extents == -1 || NInoAttrList(ctx->ntfs_ino)) &&
 		    ctx->attr->type != AT_ATTRIBUTE_LIST) {
 			ctx->al_entry->lowest_vcn = cpu_to_le64(stop_vcn);
-			err = ntfs_attrlist_update_locked(base_ni, locked_ni);
+			err = ntfs_attrlist_update_locked(base_ni, locked_ni, NULL);
 			if (err)
 				goto put_err_out;
 		}
@@ -4153,6 +4192,8 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 		if (!err)
 			finished_build = true;
 		if (!finished_build && err != -ENOSPC) {
+			if (err == -EFSCORRUPTED)
+				report_err = -EFSCORRUPTED;
 			ntfs_error(sb, "Failed to build mapping pairs");
 			goto put_err_out;
 		}
@@ -4186,6 +4227,10 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 				NInoSetFileNameDirty(ni);
 			mark_mft_record_dirty(ctx->ntfs_ino);
 		} else {
+			if (err == -ENOENT && !ntfs_inode_is_named_stream(ni)) {
+				err = -EFSCORRUPTED;
+				report_err = -EFSCORRUPTED;
+			}
 			ntfs_error(sb, "Failed to update sizes in base extent\n");
 			goto put_err_out;
 		}
@@ -4239,10 +4284,14 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 		m = map_mft_record(ext_ni);
 		if (IS_ERR(m)) {
 			ntfs_error(sb, "Could not map new MFT record");
-			if (ntfs_mft_record_free(ni->vol, ext_ni))
+			rollback_err = ntfs_mft_record_free(ni->vol, ext_ni);
+			if (rollback_err) {
 				ntfs_error(sb, "Could not free MFT record");
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								rollback_err);
+			}
 			ntfs_inode_close(ext_ni);
-			err = -ENOMEM;
+			err = PTR_ERR(m);
 			ext_ni = NULL;
 			goto put_err_out;
 		}
@@ -4264,6 +4313,8 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 			unmap_mft_record(ext_ni);
 			ntfs_inode_close(ext_ni);
 			err = mp_size;
+			if (err == -EFSCORRUPTED)
+				report_err = -EFSCORRUPTED;
 			ntfs_error(sb, "%s: get mp size failed", __func__);
 			goto put_err_out;
 		}
@@ -4276,8 +4327,12 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 		if (err < 0) {
 			ntfs_error(sb, "Could not add attribute extent");
 			unmap_mft_record(ext_ni);
-			if (ntfs_mft_record_free(ni->vol, ext_ni))
+			rollback_err = ntfs_mft_record_free(ni->vol, ext_ni);
+			if (rollback_err) {
 				ntfs_error(sb, "Could not free MFT record");
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								rollback_err);
+			}
 			ntfs_inode_close(ext_ni);
 			goto put_err_out;
 		}
@@ -4288,10 +4343,16 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 				mp_size, start_rl, stop_vcn, -1, &stop_vcn, &start_rl,
 				&de_cnt);
 		if (err < 0 && err != -ENOSPC) {
+			if (err == -EFSCORRUPTED)
+				report_err = -EFSCORRUPTED;
 			ntfs_error(sb, "Failed to build MP");
 			unmap_mft_record(ext_ni);
-			if (ntfs_mft_record_free(ni->vol, ext_ni))
+			rollback_err = ntfs_mft_record_free(ni->vol, ext_ni);
+			if (rollback_err) {
 				ntfs_error(sb, "Couldn't free MFT record");
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								rollback_err);
+			}
 			goto put_err_out;
 		}
 		a->data.non_resident.highest_vcn = cpu_to_le64(stop_vcn - 1);
@@ -4311,6 +4372,8 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 put_err_out:
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(base_ni), report_err);
 	return err;
 }
 
@@ -4402,7 +4465,8 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
 		 * already checked that attribute fits MFT record).
 		 */
 		ntfs_error(ctx->ntfs_ino->vol->sb, "BUG! Failed to resize attribute record. ");
-		return -EIO;
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
+		return -EFSCORRUPTED;
 	}
 
 	/* Convert the attribute record to describe a resident attribute. */
@@ -4430,6 +4494,7 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
 	 */
 	freed = ntfs_cluster_free(ni, 0, -1, ctx);
 	if (freed < 0) {
+		ntfs_report_file_metadata_error(VFS_I(ni), freed);
 		ntfs_error(sb, "Eeek! Failed to release allocated clusters");
 		ntfs_debug("Ignoring error and leaving behind wasted clusters.\n");
 	}
@@ -5402,6 +5467,7 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 		s64 *lcn_count, s64 max_clu_count, bool *balloc, bool update_mp,
 		bool skip_holes)
 {
+	int report_err = 0;
 	struct ntfs_inode *base_ni = ntfs_base_inode(ni);
 	struct ntfs_volume *vol = ni->vol;
 	struct ntfs_attr_search_ctx *ctx;
@@ -5410,7 +5476,7 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 	s64 vcn = vcn_start, lcn, clu_count;
 	s64 freed;
 	s64 lcn_seek_from = -1;
-	int err = 0;
+	int err = 0, err2;
 	size_t new_rl_count, old_rl_count;
 
 	err = ntfs_attr_map_whole_runlist(ni);
@@ -5426,6 +5492,10 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			CASE_SENSITIVE, vcn, NULL, 0, ctx);
 	if (err) {
+		if (err == -ENOENT && !ntfs_inode_is_named_stream(ni)) {
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
+		}
 		ntfs_error(vol->sb,
 			   "ntfs_attr_lookup failed, ntfs inode(mft_no : %llu) type : 0x%x, err : %d",
 			   ni->mft_no, ni->type, err);
@@ -5451,10 +5521,12 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 		}
 	} else {
 		WARN_ON(lcn == LCN_RL_NOT_MAPPED);
-		if (lcn == LCN_ENOENT)
+		if (lcn == LCN_ENOENT) {
 			err = -ENOENT;
-		else
-			err = -EIO;
+		} else {
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
+		}
 		goto out;
 	}
 
@@ -5506,10 +5578,11 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 			 old_rl_count * sizeof(*old_rl), GFP_NOFS);
 	if (!old_rl) {
 		err = -ENOMEM;
-		if (ntfs_cluster_free_from_rl(vol, rlc)) {
+		err2 = ntfs_cluster_free_from_rl(vol, rlc);
+		if (err2) {
 			ntfs_error(vol->sb,
 				   "Failed to free cluster allocation after runlist backup failure.");
-			NVolSetErrors(vol);
+			ntfs_report_file_metadata_error(VFS_I(ni), err2);
 		}
 		kvfree(rlc);
 		goto out;
@@ -5519,8 +5592,15 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 	if (IS_ERR(rl)) {
 		ntfs_error(vol->sb, "Failed to merge runlists");
 		err = PTR_ERR(rl);
-		if (ntfs_cluster_free_from_rl(vol, rlc))
+		if (err != -ENOMEM) {
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
+		}
+		err2 = ntfs_cluster_free_from_rl(vol, rlc);
+		if (err2) {
 			ntfs_error(vol->sb, "Failed to free hot clusters.");
+			ntfs_report_file_metadata_error(VFS_I(ni), err2);
+		}
 		kvfree(rlc);
 		goto out;
 	}
@@ -5543,7 +5623,10 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 			if (freed < 0 || freed != clu_count) {
 				ntfs_error(vol->sb,
 					   "Failed to free cluster allocation. Leaving inconsistent metadata.\n");
-				NVolSetErrors(vol);
+				err2 = freed < 0 ? freed : -EFSCORRUPTED;
+				ntfs_report_file_metadata_error(VFS_I(ni),
+								freed < 0 ?
+								(int)freed : -EFSCORRUPTED);
 				goto out;
 			}
 
@@ -5555,11 +5638,11 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 			ni->runlist.rl = old_rl;
 			ni->runlist.count = old_rl_count;
 			old_rl = NULL;
-			if (ntfs_attr_update_mapping_pairs_locked(
-					ni, 0, ni)) {
+			err2 = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
+			if (err2) {
 				ntfs_error(vol->sb,
 					   "Failed to restore mapping pairs after allocation rollback.\n");
-				NVolSetErrors(vol);
+				ntfs_report_file_metadata_error(VFS_I(ni), err2);
 			}
 		}
 	} else {
@@ -5574,6 +5657,8 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 out:
 	kvfree(old_rl);
 	ntfs_attr_put_search_ctx(ctx);
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(base_ni), report_err);
 	return err;
 }
 
diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
index de642af3bc30..a678356b5592 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -211,13 +211,16 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 }
 
 int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
-				struct ntfs_inode *locked_ni)
+				struct ntfs_inode *locked_ni, bool *reported)
 {
 	struct inode *attr_vi;
 	struct ntfs_inode *attr_ni;
 	s64 written;
 	int err, retry_err;
 
+	if (reported)
+		*reported = false;
+
 	/*
 	 * generic_shutdown_super() clears SB_ACTIVE before evicting cached
 	 * inodes. Do not look up the attribute-list inode after SB_ACTIVE has
@@ -234,6 +237,8 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
 			err = -EFSCORRUPTED;
 			ntfs_report_file_metadata_error(VFS_I(base_ni),
 							-EFSCORRUPTED);
+			if (reported)
+				*reported = true;
 		}
 		return err;
 	}
@@ -311,6 +316,8 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
 	if (written != base_ni->attr_list_size) {
 		err = written < 0 ? (int)written : -EIO;
 		ntfs_report_file_metadata_error(attr_vi, err);
+		if (reported)
+			*reported = true;
 		iput(attr_vi);
 		ntfs_error(base_ni->vol->sb,
 			   "Failed to write attribute list of inode %#llx",
@@ -325,7 +332,7 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
 
 int ntfs_attrlist_update(struct ntfs_inode *base_ni)
 {
-	return ntfs_attrlist_update_locked(base_ni, NULL);
+	return ntfs_attrlist_update_locked(base_ni, NULL, NULL);
 }
 
 /*
@@ -468,18 +475,21 @@ int ntfs_attrlist_entry_add(struct ntfs_inode *ni, struct attr_record *attr)
 /*
  * ntfs_attrlist_entry_rm - remove an attribute list attribute entry
  * @ctx:	attribute search context describing the attribute list entry
+ * @reported:	set if the list updater reports the failure
  *
  * Remove the attribute list entry @ctx->al_entry from the attribute list.
  *
  * Return 0 on success and -errno on error.
  */
-int ntfs_attrlist_entry_rm(struct ntfs_attr_search_ctx *ctx)
+int ntfs_attrlist_entry_rm(struct ntfs_attr_search_ctx *ctx, bool *reported)
 {
 	u8 *new_al;
 	int new_al_len;
 	struct ntfs_inode *base_ni;
 	struct attr_list_entry *ale;
 
+	*reported = false;
+
 	if (!ctx || !ctx->ntfs_ino || !ctx->al_entry) {
 		ntfs_debug("Invalid arguments.\n");
 		return -EINVAL;
@@ -517,5 +527,5 @@ int ntfs_attrlist_entry_rm(struct ntfs_attr_search_ctx *ctx)
 	base_ni->attr_list = new_al;
 	base_ni->attr_list_size = new_al_len;
 
-	return ntfs_attrlist_update(base_ni);
+	return ntfs_attrlist_update_locked(base_ni, NULL, reported);
 }
diff --git a/fs/ntfs/attrlist.h b/fs/ntfs/attrlist.h
index 10cc2cc8e208..aff3a3ef4dc3 100644
--- a/fs/ntfs/attrlist.h
+++ b/fs/ntfs/attrlist.h
@@ -14,9 +14,9 @@
 
 int ntfs_attrlist_need(struct ntfs_inode *ni);
 int ntfs_attrlist_entry_add(struct ntfs_inode *ni, struct attr_record *attr);
-int ntfs_attrlist_entry_rm(struct ntfs_attr_search_ctx *ctx);
+int ntfs_attrlist_entry_rm(struct ntfs_attr_search_ctx *ctx, bool *reported);
 int ntfs_attrlist_update(struct ntfs_inode *base_ni);
 int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
-				struct ntfs_inode *locked_ni);
+				struct ntfs_inode *locked_ni, bool *reported);
 
 #endif /* defined _NTFS_ATTRLIST_H */

