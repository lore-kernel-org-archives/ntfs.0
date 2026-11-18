Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993012;
	b=ODS04XCB6Ut5ak9A45DmzjKfVFniD35HRoE1HsnE3717bPibT8MUZex1sFftQHKw7ck/
	 QXY98CkFDvp80vyDFQ1dArotDYFZh3yv67sM+Gj4gC0+8QEo1akM53+TTvODO6SgrSVs5
	 +k/6eR9At5n8at2aFmlRaafEDi02E5W6QoLF6KVQqNQhCo0x0imeS2yA82ycJouR++6yT
	 9g6nIJCI0DDI3pQbBWBiEsCGrZNm7I1ffFCFr4T08dtwnCDIHyYDBB1ZXz/vadND4Flyx
	 WpFadP4eiY98XlOzkCP08d2jdlRHkr/I+JLkGq2Xat1eGI+jCVbrM1FSl/cOxmza79Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993012;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=plcy8RWwpXjGwYGipuZP18M4aMoezofeUk8b1rEZbGs=;
	b=WKccyr5Z5tY3LUUgjpGCkM0ylSbQVEIViPfuKIV0NDAKOhDdGLzjZeCSaOpiLMY3flSU
	 bbHRPG7kt+NlsrM569E/ezjzXhFgcV7Q8RjTJKgWIwc2rUSZBow3GrRZnkNmFlk6SSfql
	 GCC/ykny5sexeVjlfOkkJjVbDBOw+CxW2+i7Od4LP2ZfWH7cUrbVNEDgnT1LjCT+xBeLM
	 TnDVlQ4YL3hwcDi0EN/+RtitdyT3qfAPZMUcKnqHFdyNlYdXbWIQaTqqXsYtyCtuxLgmF
	 uZe5aahZL69cFhphPt228szUZ2JeoicefmKMX7M951y4j7qruKl5um4j/1xIr2Zv6fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ZRO6ujS3;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93D3606A31C
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B93D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ZRO6ujS3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=pl
	cy8RWwpXjGwYGipuZP18M4aMoezofeUk8b1rEZbGs=; b=ZRO6ujS384o9pfneFg
	w2zMk1BK/CHhhNc2wAQ5x88TyHXwurBziBc7KbcmBGudh/M9q4dDlA0g6e+Lmabc
	ojLtR+F9Yn1WzZZQw8j6BOVJ7YaXJWM3Wdvg2KrW3glQnuHSNoA5dzHml+jTWPvH
	UgcdspgjtXhXys+yeHubVgiTw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3xC1Pa_1qPhPuGg--.62323S8;
	Wed, 18 Nov 2026 17:09:39 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 22/37] ntfs: report incomplete attribute range updates
Date: Wed, 18 Nov 2026 17:06:46 +0800
Message-Id: <20261118090701.1858849-23-wangxuewen_ky@163.com>
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
X-CM-TRANSID:PigvCgC3xC1Pa_1qPhPuGg--.62323S8
X-Coremail-Antispam: 1Uf129KBjvJXoW3KF48trW8GrWUtw1fJF4xWFg_yoWDKr1Upa
	4fG39xKw4rX3s7Wwn7tw4q9w1akw1Ig348GrW7GwnFvwsYyw1xtF1agF4qga1ftrWkGry5
	XrW2g3y3ZF47Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTVb9UUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC8BMJ8Wr9a1OV5AAA3F

From: Dandan Wu <wudandan@kylinos.cn>

Range insertion, collapse, hole punching and preallocation can fail
after changing runlists or allocation without reporting the unfinished
metadata update. Report mapping-update and cluster-release failures
against the affected file.

Use EFSCORRUPTED for missing required attributes and invalid runlist
state. Report context and lookup failures after a range update, including
ENOMEM, while keeping ordinary early allocation failures unreported.

After validating the requested range, treat EINVAL from the runlist
editing helpers as corruption and report it. Reject negative starts
and nonpositive lengths separately, preserving EINVAL for bad input
and ENOMEM for allocation failures.

Track whether insertion split or merged an existing run before its
runlist allocation failed. Report that unfinished update while leaving
ENOMEM before any mutation unreported; do not change rollback behavior.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
Changes in v6:
Rebase onto the updated ntfs-next; retain the v5 reporting behavior.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.

 fs/ntfs/attrib.c  | 84 +++++++++++++++++++++++++++++++++++++++--------
 fs/ntfs/runlist.c |  7 +++-
 fs/ntfs/runlist.h |  3 +-
 3 files changed, 79 insertions(+), 15 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index f74746a38433..eae88b45d05e 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -6077,9 +6077,12 @@ int ntfs_non_resident_attr_insert_range(struct ntfs_inode *ni, s64 start_vcn, s6
 	struct ntfs_attr_search_ctx *ctx;
 	int ret;
 	size_t new_rl_count;
+	bool modified;
 
 	if (ni->type != AT_DATA)
 		return -EOPNOTSUPP;
+	if (start_vcn < 0 || len <= 0)
+		return -EINVAL;
 	if (start_vcn > ntfs_bytes_to_cluster(vol, ni->allocated_size))
 		return -EINVAL;
 
@@ -6105,15 +6108,24 @@ int ntfs_non_resident_attr_insert_range(struct ntfs_inode *ni, s64 start_vcn, s6
 	if (!rl) {
 		up_write(&ni->runlist.lock);
 		kfree(hole_rl);
-		return -EIO;
+		ret = -EFSCORRUPTED;
+		goto report_error;
 	}
 
 	rl = ntfs_rl_insert_range(ni->runlist.rl, (int)ni->runlist.count,
-				  hole_rl, 1, &new_rl_count);
+				  hole_rl, 1, &new_rl_count, &modified);
 	if (IS_ERR(rl)) {
 		up_write(&ni->runlist.lock);
 		kfree(hole_rl);
-		return PTR_ERR(rl);
+		ret = PTR_ERR(rl);
+		/* Splitting or merging a run can precede allocation failure. */
+		if (modified)
+			goto report_error;
+		if (ret != -EINVAL)
+			return ret;
+		/* A valid range must be covered by the fully mapped runlist. */
+		ret = -EFSCORRUPTED;
+		goto report_error;
 	}
 	ni->runlist.rl =  rl;
 	ni->runlist.count = new_rl_count;
@@ -6125,19 +6137,20 @@ int ntfs_non_resident_attr_insert_range(struct ntfs_inode *ni, s64 start_vcn, s6
 	ret = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 	up_write(&ni->runlist.lock);
 	if (ret)
-		return ret;
+		goto report_error;
 
 	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
 	if (IS_ERR(ctx)) {
 		ret = PTR_ERR(ctx);
-		return ret;
+		ctx = NULL;
+		goto report_error;
 	}
 
 	ret = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			       CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (ret) {
 		ntfs_attr_put_search_ctx(ctx);
-		return ret;
+		goto report_error;
 	}
 
 	ctx->attr->data.non_resident.data_size = cpu_to_le64(ni->data_size);
@@ -6147,6 +6160,13 @@ int ntfs_non_resident_attr_insert_range(struct ntfs_inode *ni, s64 start_vcn, s6
 	mark_mft_record_dirty(ctx->ntfs_ino);
 	ntfs_attr_put_search_ctx(ctx);
 	return ret;
+
+report_error:
+	if (ret == -ENOENT)
+		ret = -EFSCORRUPTED;
+	/* Corruption or an unfinished update requires a report. */
+	ntfs_report_file_metadata_error(VFS_I(base_ni), ret);
+	return ret;
 }
 
 int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn, s64 len)
@@ -6162,6 +6182,8 @@ int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn,
 
 	if (ni->type != AT_DATA)
 		return -EOPNOTSUPP;
+	if (start_vcn < 0 || len <= 0)
+		return -EINVAL;
 
 	end_vcn = ntfs_bytes_to_cluster(vol, ni->allocated_size);
 	if (start_vcn >= end_vcn)
@@ -6180,14 +6202,20 @@ int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn,
 	rl = ntfs_rl_find_vcn_nolock(ni->runlist.rl, start_vcn);
 	if (!rl) {
 		up_write(&ni->runlist.lock);
-		return -EIO;
+		ret = -EFSCORRUPTED;
+		goto report_error;
 	}
 
 	rl = ntfs_rl_collapse_range(ni->runlist.rl, dst_cnt + 1,
 				    start_vcn, len, &punch_rl, &new_rl_cnt);
 	if (IS_ERR(rl)) {
 		up_write(&ni->runlist.lock);
-		return PTR_ERR(rl);
+		ret = PTR_ERR(rl);
+		if (ret != -EINVAL)
+			return ret;
+		/* A valid range must be covered by the fully mapped runlist. */
+		ret = -EFSCORRUPTED;
+		goto report_error;
 	}
 	ni->runlist.rl = rl;
 	ni->runlist.count = new_rl_cnt;
@@ -6241,8 +6269,14 @@ int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn,
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 out_rl:
+	if (ret == -ENOENT)
+		ret = -EFSCORRUPTED;
 	kvfree(punch_rl);
 	mark_mft_record_dirty(base_ni);
+
+report_error:
+	if (ret)
+		ntfs_report_file_metadata_error(VFS_I(base_ni), ret);
 	return ret;
 }
 
@@ -6258,6 +6292,8 @@ int ntfs_non_resident_attr_punch_hole(struct ntfs_inode *ni, s64 start_vcn, s64
 
 	if (ni->type != AT_DATA)
 		return -EOPNOTSUPP;
+	if (start_vcn < 0 || len <= 0)
+		return -EINVAL;
 
 	end_vcn = ntfs_bytes_to_cluster(vol, ni->allocated_size);
 	if (start_vcn >= end_vcn)
@@ -6276,14 +6312,20 @@ int ntfs_non_resident_attr_punch_hole(struct ntfs_inode *ni, s64 start_vcn, s64
 	rl = ntfs_rl_find_vcn_nolock(ni->runlist.rl, start_vcn);
 	if (!rl) {
 		up_write(&ni->runlist.lock);
-		return -EIO;
+		ret = -EFSCORRUPTED;
+		goto report_error;
 	}
 
 	rl = ntfs_rl_punch_hole(ni->runlist.rl, dst_cnt + 1,
 				start_vcn, len, &punch_rl, &new_rl_count);
 	if (IS_ERR(rl)) {
 		up_write(&ni->runlist.lock);
-		return PTR_ERR(rl);
+		ret = PTR_ERR(rl);
+		if (ret != -EINVAL)
+			return ret;
+		/* A valid range must be covered by the fully mapped runlist. */
+		ret = -EFSCORRUPTED;
+		goto report_error;
 	}
 	ni->runlist.rl = rl;
 	ni->runlist.count = new_rl_count;
@@ -6292,7 +6334,7 @@ int ntfs_non_resident_attr_punch_hole(struct ntfs_inode *ni, s64 start_vcn, s64
 	up_write(&ni->runlist.lock);
 	if (ret) {
 		kvfree(punch_rl);
-		return ret;
+		goto report_error;
 	}
 
 	ret = ntfs_cluster_free_from_rl(vol, punch_rl);
@@ -6301,11 +6343,16 @@ int ntfs_non_resident_attr_punch_hole(struct ntfs_inode *ni, s64 start_vcn, s64
 
 	kvfree(punch_rl);
 	mark_mft_record_dirty(base_ni);
+
+report_error:
+	if (ret)
+		ntfs_report_file_metadata_error(VFS_I(base_ni), ret);
 	return ret;
 }
 
 int ntfs_attr_fallocate(struct ntfs_inode *ni, loff_t start, loff_t byte_len, bool keep_size)
 {
+	int report_err = 0;
 	struct ntfs_inode *base_ni = ntfs_base_inode(ni);
 	struct ntfs_volume *vol = ni->vol;
 	struct mft_record *mrec;
@@ -6346,7 +6393,10 @@ int ntfs_attr_fallocate(struct ntfs_inode *ni, loff_t start, loff_t byte_len, bo
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (err) {
-		err = -EIO;
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
+		}
 		goto out_unmap;
 	}
 
@@ -6361,7 +6411,9 @@ int ntfs_attr_fallocate(struct ntfs_inode *ni, loff_t start, loff_t byte_len, bo
 					CASE_SENSITIVE, 0, NULL, 0,
 					ctx);
 			if (err) {
-				err = -EIO;
+				if (err == -ENOENT)
+					err = -EFSCORRUPTED;
+				report_err = err;
 				goto out_unmap;
 			}
 			ni->data_size = old_data_size;
@@ -6447,6 +6499,10 @@ int ntfs_attr_fallocate(struct ntfs_inode *ni, loff_t start, loff_t byte_len, bo
 			}
 		} else {
 			err = -EIO;
+			if (rl_lcn < LCN_HOLE) {
+				err = -EFSCORRUPTED;
+				report_err = err;
+			}
 			goto out;
 		}
 	}
@@ -6486,6 +6542,8 @@ int ntfs_attr_fallocate(struct ntfs_inode *ni, loff_t start, loff_t byte_len, bo
 	unmap_mft_record(base_ni);
 	mutex_unlock(&base_ni->mrec_lock);
 out:
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(base_ni), report_err);
 	return err >= 0 ? 0 : err;
 signal_out:
 	if (!err)
diff --git a/fs/ntfs/runlist.c b/fs/ntfs/runlist.c
index 606a30ab9fa7..088a9e03e79b 100644
--- a/fs/ntfs/runlist.c
+++ b/fs/ntfs/runlist.c
@@ -1790,13 +1790,15 @@ static inline bool ntfs_rle_contain(struct runlist_element *rle, s64 vcn)
 
 struct runlist_element *ntfs_rl_insert_range(struct runlist_element *dst_rl, int dst_cnt,
 				      struct runlist_element *src_rl, int src_cnt,
-				      size_t *new_rl_cnt)
+				      size_t *new_rl_cnt, bool *modified)
 {
 	struct runlist_element *i_rl, *new_rl, *src_rl_origin = src_rl;
 	struct runlist_element dst_rl_split;
 	s64 start_vcn;
 	int new_1st_cnt, new_2nd_cnt, new_3rd_cnt, new_cnt;
 
+	/* Tell the caller if an error leaves the original runlist changed. */
+	*modified = false;
 	if (!dst_rl || !src_rl || !new_rl_cnt)
 		return ERR_PTR(-EINVAL);
 	if (dst_cnt <= 0 || src_cnt <= 0)
@@ -1833,6 +1835,7 @@ struct runlist_element *ntfs_rl_insert_range(struct runlist_element *dst_rl, int
 		i_rl[0].vcn = start_vcn;
 		i_rl[0].length -= dst_rl_split.length;
 		i_rl[0].lcn += dst_rl_split.length;
+		*modified = true;
 	} else {
 		struct runlist_element *dst_rle, *src_rle;
 merge_src_rle:
@@ -1846,6 +1849,7 @@ struct runlist_element *ntfs_rl_insert_range(struct runlist_element *dst_rl, int
 		if (new_1st_cnt > 0 && ntfs_rle_lcn_contiguous(dst_rle, src_rle)) {
 			WARN_ON(dst_rle->vcn + dst_rle->length != src_rle->vcn);
 			dst_rle->length += src_rle->length;
+			*modified = true;
 			src_rl++;
 			src_cnt--;
 		} else {
@@ -1855,6 +1859,7 @@ struct runlist_element *ntfs_rl_insert_range(struct runlist_element *dst_rl, int
 
 			if (ntfs_rle_lcn_contiguous(dst_rle, src_rle)) {
 				dst_rle->length += src_rle->length;
+				*modified = true;
 				src_cnt--;
 			}
 		}
diff --git a/fs/ntfs/runlist.h b/fs/ntfs/runlist.h
index 85073f9fb6ec..14a2a626ba56 100644
--- a/fs/ntfs/runlist.h
+++ b/fs/ntfs/runlist.h
@@ -89,7 +89,8 @@ int ntfs_rl_truncate_nolock(const struct ntfs_volume *vol,
 int ntfs_rl_sparse(struct runlist_element *rl);
 s64 ntfs_rl_get_compressed_size(struct ntfs_volume *vol, struct runlist_element *rl);
 struct runlist_element *ntfs_rl_insert_range(struct runlist_element *dst_rl, int dst_cnt,
-		struct runlist_element *src_rl, int src_cnt, size_t *new_cnt);
+		struct runlist_element *src_rl, int src_cnt, size_t *new_cnt,
+		bool *modified);
 struct runlist_element *ntfs_rl_punch_hole(struct runlist_element *dst_rl, int dst_cnt,
 		s64 start_vcn, s64 len, struct runlist_element **punch_rl,
 		size_t *new_rl_cnt);
-- 
2.51.0

