Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485948;
	b=ikBFyqxlJfT9iTIf9yvVyEcYLXEVMdu+sWnBZPf2BO77UdL7rVSRTuyUx+wZCXlZmoRJ
	 fK51FHBtuSMtahpHkt4OO/3BKr3OVcwxYRLUYPlMFJCesgtoCl1ATi68XhmvNbzhB0NAd
	 QkwhFU6GRV79UBWJJ9ztwgtYEF12WzHI+kWRQiWgpP3lb9NSjOhMw9vyBpLUHbHRTgLB7
	 1m2aIf6y5ZJyZRQ0wnzQhLza/b4/zvqcf2sArEVySS3XLPk0jfwmzeWCn7QlAE887aFg2
	 3CP7QoWvKd6l88hRSaur8w6mL7KECbYavF2qiELkY8W0aBXUinnPnFvYxyPErHzeRlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485948;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=XjIDvvhb6nX1krJ/shSnmRBIC/MZtCJhBxPs9ocJ//8=;
	b=UOW4gALBXFo+y7JhZRdNOnAGXL2xECr+Fc3QeL1yqZtYV5d3rq/zsbCmIcwFeJDPkU6m
	 jFcLqwV3L5KnLQUB4l3UfsV8Xj535h7Jql+Nw1N64+j49gtFCe6WrMxiYo6856RQhA3AH
	 p+hFWfIwnA6T87gI2qvQ0KDvqF1OIQxFEriwvRNHT49P+sEyRlp0C0wp8GCVlyIkN/mBb
	 Z8Yk2ixw6nnoOKOd1v8YE9G5w6TZCKAmeX8IOE7dTKUtR0nOnIeM8q7J7ghjfqPC4AkUD
	 Z52bx20c/JZ7L2btZ94FucUKVTu7FFE1aorDx7mUo1F/6b2jgTovhXjVlCZQdYg6+Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="dT/gKesc";
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879FF60A262C
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 879FF60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=dT/gKesc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Xj
	IDvvhb6nX1krJ/shSnmRBIC/MZtCJhBxPs9ocJ//8=; b=dT/gKescWSNa+zuVuk
	5+5zY0kDZTr5Z2Yf6ymdzIUKsj/8EA7gqZyHKciWA2Gb0SoigXy5QsM4bxKqfKoH
	0q7kq56VZdkn622wYBHrJU7Vnieecyfp2vE8z3MZDYpasRSjVmsVNXqvSgzt4pxT
	zsJu9SQmc+VhCyKDUAO+KKZpg=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3n0ksKtdq7UkHBg--.56105S9;
	Tue, 20 Oct 2026 16:45:39 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 15/31] ntfs: report attribute conversion and mapping update failures
Date: Tue, 20 Oct 2026 16:44:05 +0800
Message-ID: <20261020084421.2196486-16-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3n0ksKtdq7UkHBg--.56105S9
X-Coremail-Antispam: 1Uf129KBjvAXoWfJF4fCr1DuryfWw4Dtr18Krg_yoW8JFWxJo
	W3Aa1Fkw4vkw1Yk3yj9wn8tasxZanxC398JrWrArsrAF92qw4DG3WxJ3W3W3yru3yFgrn0
	qr1ktFs5AF4xAry5n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4iiSUUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hMn8WrXKjN91AAA3i

From: Baolin Liu <liubaolin@kylinos.cn>

Attribute conversion and mapping updates can detect corruption or fail
to recover modified metadata without reporting it. Cover missing
required attributes, malformed mapping pairs and failed extent cleanup.

Preserve ENOMEM from runlist merges and report invalid merges as
EFSCORRUPTED. Report failed cluster release, mapping restoration and
record cleanup separately from the initiating error.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/attrib.c | 136 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 107 insertions(+), 29 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 66845c78ab8d..73ccc438b319 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -2106,8 +2106,11 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (unlikely(err)) {
-		if (err == -ENOENT)
-			err = -EIO;
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+		}
 		goto err_out;
 	}
 	m = ctx->mrec;
@@ -2161,12 +2164,16 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 	mp_size = ntfs_get_size_for_mapping_pairs(vol, rl, 0, -1, -1);
 	if (unlikely(mp_size < 0)) {
 		err = mp_size;
+		if (err == -EFSCORRUPTED)
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
 		ntfs_debug("Failed to get size for mapping pairs array, error code %i.\n", err);
 		goto rl_err_out;
 	}
 
 	if (NInoNonResident(ni) || a->non_resident) {
-		err = -EIO;
+		err = -EFSCORRUPTED;
+		ntfs_report_file_metadata_error(VFS_I(base_ni), -EFSCORRUPTED);
 		goto rl_err_out;
 	}
 
@@ -2240,6 +2247,9 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 	err = ntfs_mapping_pairs_build(vol, (u8 *)a + mp_ofs,
 			arec_size - mp_ofs, rl, 0, -1, NULL, NULL, NULL);
 	if (unlikely(err)) {
+		if (err == -EFSCORRUPTED)
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
 		ntfs_error(vol->sb, "Failed to build mapping pairs, error code %i.",
 				err);
 		goto undo_err_out;
@@ -2350,10 +2360,11 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
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
@@ -2444,8 +2455,14 @@ int ntfs_attr_set_initialized_size(struct ntfs_inode *ni, loff_t new_size)
 
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
@@ -3800,7 +3817,8 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
 
 	sparse = ntfs_rl_sparse(ni->runlist.rl);
 	if (sparse < 0) {
-		err = -EIO;
+		err = -EFSCORRUPTED;
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
 		goto out;
 	}
 
@@ -3838,8 +3856,10 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
 		}
 		if (!(le32_to_cpu(a->length) -
 		    le16_to_cpu(a->data.non_resident.mapping_pairs_offset))) {
-			err = -EIO;
+			err = -EFSCORRUPTED;
 			ntfs_error(sb, "Mapping pairs space is 0");
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
 			goto out;
 		}
 
@@ -3883,7 +3903,9 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
 
 		new_compr_size = ntfs_rl_get_compressed_size(ni->vol, ni->runlist.rl);
 		if (new_compr_size < 0) {
-			err = new_compr_size;
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
+			err = -EFSCORRUPTED;
 			goto out;
 		}
 
@@ -3932,6 +3954,7 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 	struct attr_record *a;
 	s64 stop_vcn;
 	int err = 0, mp_size, cur_max_mp_size, exp_max_mp_size;
+	int rollback_err;
 	bool finished_build;
 	bool first_updated = false;
 	struct super_block *sb;
@@ -3994,8 +4017,10 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 			 */
 			first_lcn = ntfs_rl_vcn_to_lcn(ni->runlist.rl, stop_vcn);
 			if (first_lcn == LCN_EINVAL) {
-				err = -EIO;
+				err = -EFSCORRUPTED;
 				ntfs_error(sb, "Bad runlist");
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								-EFSCORRUPTED);
 				goto put_err_out;
 			}
 			if (first_lcn == LCN_ENOENT ||
@@ -4046,6 +4071,9 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 				stop_vcn, -1, exp_max_mp_size);
 		if (mp_size <= 0) {
 			err = mp_size;
+			if (err == -EFSCORRUPTED)
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								-EFSCORRUPTED);
 			ntfs_error(sb, "%s: get MP size failed", __func__);
 			goto put_err_out;
 		}
@@ -4081,9 +4109,10 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
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
@@ -4100,8 +4129,9 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 		if (((mp_size + 7) & ~7) != cur_max_mp_size) {
 			if (ntfs_attr_record_resize(m, a,
 					le16_to_cpu(a->data.non_resident.mapping_pairs_offset) +
-						mp_size)) {
+					mp_size)) {
 				err = -EIO;
+				ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 				ntfs_error(sb, "Failed to resize attribute");
 				goto put_err_out;
 			}
@@ -4136,6 +4166,9 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 		if (!err)
 			finished_build = true;
 		if (!finished_build && err != -ENOSPC) {
+			if (err == -EFSCORRUPTED)
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								-EFSCORRUPTED);
 			ntfs_error(sb, "Failed to build mapping pairs");
 			goto put_err_out;
 		}
@@ -4169,6 +4202,11 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 				NInoSetFileNameDirty(ni);
 			mark_mft_record_dirty(ctx->ntfs_ino);
 		} else {
+			if (err == -ENOENT && !ntfs_inode_is_named_stream(ni)) {
+				err = -EFSCORRUPTED;
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								-EFSCORRUPTED);
+			}
 			ntfs_error(sb, "Failed to update sizes in base extent\n");
 			goto put_err_out;
 		}
@@ -4222,10 +4260,14 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
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
@@ -4247,6 +4289,9 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 			unmap_mft_record(ext_ni);
 			ntfs_inode_close(ext_ni);
 			err = mp_size;
+			if (err == -EFSCORRUPTED)
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								-EFSCORRUPTED);
 			ntfs_error(sb, "%s: get mp size failed", __func__);
 			goto put_err_out;
 		}
@@ -4259,8 +4304,12 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
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
@@ -4271,10 +4320,17 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
 				mp_size, start_rl, stop_vcn, -1, &stop_vcn, &start_rl,
 				&de_cnt);
 		if (err < 0 && err != -ENOSPC) {
+			if (err == -EFSCORRUPTED)
+				ntfs_report_file_metadata_error(VFS_I(base_ni),
+								-EFSCORRUPTED);
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
@@ -4385,7 +4441,8 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
 		 * already checked that attribute fits MFT record).
 		 */
 		ntfs_error(ctx->ntfs_ino->vol->sb, "BUG! Failed to resize attribute record. ");
-		return -EIO;
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
+		return -EFSCORRUPTED;
 	}
 
 	/* Convert the attribute record to describe a resident attribute. */
@@ -4413,6 +4470,7 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
 	 */
 	freed = ntfs_cluster_free(ni, 0, -1, ctx);
 	if (freed < 0) {
+		ntfs_report_file_metadata_error(VFS_I(ni), freed);
 		ntfs_error(sb, "Eeek! Failed to release allocated clusters");
 		ntfs_debug("Ignoring error and leaving behind wasted clusters.\n");
 	}
@@ -5393,7 +5451,7 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 	s64 vcn = vcn_start, lcn, clu_count;
 	s64 freed;
 	s64 lcn_seek_from = -1;
-	int err = 0;
+	int err = 0, err2;
 	size_t new_rl_count, old_rl_count;
 
 	err = ntfs_attr_map_whole_runlist(ni);
@@ -5409,6 +5467,11 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			CASE_SENSITIVE, vcn, NULL, 0, ctx);
 	if (err) {
+		if (err == -ENOENT && !ntfs_inode_is_named_stream(ni)) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+		}
 		ntfs_error(vol->sb,
 			   "ntfs_attr_lookup failed, ntfs inode(mft_no : %llu) type : 0x%x, err : %d",
 			   ni->mft_no, ni->type, err);
@@ -5434,10 +5497,13 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
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
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+		}
 		goto out;
 	}
 
@@ -5489,10 +5555,11 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
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
@@ -5502,8 +5569,16 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
 	if (IS_ERR(rl)) {
 		ntfs_error(vol->sb, "Failed to merge runlists");
 		err = PTR_ERR(rl);
-		if (ntfs_cluster_free_from_rl(vol, rlc))
+		if (err != -ENOMEM) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
+		}
+		err2 = ntfs_cluster_free_from_rl(vol, rlc);
+		if (err2) {
 			ntfs_error(vol->sb, "Failed to free hot clusters.");
+			ntfs_report_file_metadata_error(VFS_I(ni), err2);
+		}
 		kvfree(rlc);
 		goto out;
 	}
@@ -5526,7 +5601,10 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
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
 
@@ -5538,11 +5616,11 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s64 vcn_start, s64 *lcn_start,
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
-- 
2.51.0

