Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486010;
	b=RNjtbWk6HIJpYBCzb12HdmuFv2wquv9AnNfW3cL4UDlcpVtZN6XyLyu+tc7iK/hwRQeu
	 9dx8N+eP7chkEtVkRSCgR/V2MHWVWHOWxGbetngrBlILyo094KNKcEweV2MKSmyQxxjwF
	 WNAemI66HArwnirwCOE9crOlcSnEdRh0oqBvxURkRLany1MQZSuODYfODK85vwn2zHk+o
	 jAxk6QKq+Jxjif6Uy2X52xXfv8cRx0F3vTPU8wyz623CeAduY25xZ3o5cb9+P0bCG01My
	 OCuMFu3ZBkq0py8VFxemrsEArvE2ZxeWnZ+bnErCFSDOwesDwwrT5KQl67iICJYLwDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486010;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=W9KdM7IHEr0QhHyTSjRzpnRZb3/KbEg3xGD5ExfYmE4=;
	b=Yet20nUZxNQCI3fHvkPvRCXdkuqgzQU+jtDVoC56nPycdNxFB55yEPfrUult/LPojpov
	 2H/1VIMLjEsKZZooSkibysaBLidDnRvWEIPnn2rbdTHbddOgsRtc7EO0DFeJBtJzGM5SR
	 IgoRfJvfK0raDLC4AjtrOlE9uDqbjhQzDtF6bw+AGhKKfTNbUAISdkIdEhRkgh1VNb1QC
	 pb28O/zm3JoWCb2ALJtf3XnKkBocQ7qs8MpDfOsi+ehFku3iE3cCTODLLlkNtOJdGus3m
	 xuOiWAA4m+vv+wfvFfLEtRB+00qXFJ4fIOUYVzq40Nk2AzldyAnb+weMnZOdXIQC7AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BQeBUu8A;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706B9606A319
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 706B9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BQeBUu8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=W9
	KdM7IHEr0QhHyTSjRzpnRZb3/KbEg3xGD5ExfYmE4=; b=BQeBUu8ASg1xnM2jAQ
	T+hbwRFfghfncjsAAUVxfQ/8qR6ffTDvDoESS0GX2mpFBNJ7tMs4uauCa3Xhe0Os
	7ANjro+YXLZx++UF8qDC4bbk5WISDU3rgbsch917SH1FEJpcDb3T4eyv9tNu46qI
	oGLgzuHM1xG0qmkzOuCpN42Pw=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3X_tvKtdqGocHBg--.23211S3;
	Tue, 20 Oct 2026 16:46:41 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 17/31] ntfs: report incomplete attribute range updates
Date: Tue, 20 Oct 2026 16:44:07 +0800
Message-ID: <20261020084421.2196486-18-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3X_tvKtdqGocHBg--.23211S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3Ar4xZrW5XrW3Gr48uw17KFg_yoW7Wr48pF
	9xJrZ3K3sxX397WrnFyFZ8Zw1a934Ig34UWrW7G3ZrAan0yw1Ikr45tF4vgrZaqrWkJry5
	XayDW3y7ur47ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFYLkUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hE3AmrXKnGLZQAA3G

From: Dandan Wu <wudandan@kylinos.cn>

Range insertion, collapse, hole punching and preallocation can fail
after changing runlists or allocation without reporting the unfinished
metadata update. Report mapping-update and cluster-release failures
against the affected file.

Use EFSCORRUPTED for missing required attributes and invalid runlist
state. Report context and lookup failures after a range update, including
ENOMEM, while keeping ordinary early allocation failures unreported.

Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
 fs/ntfs/attrib.c | 47 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 62985be67a09..910c69da9e24 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -5952,9 +5952,10 @@ int ntfs_non_resident_attr_insert_range(struct ntfs_inode *ni, s64 start_vcn, s6
 
 	rl = ntfs_rl_find_vcn_nolock(ni->runlist.rl, start_vcn);
 	if (!rl) {
+		ntfs_report_file_metadata_error(VFS_I(base_ni), -EFSCORRUPTED);
 		up_write(&ni->runlist.lock);
 		kfree(hole_rl);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	rl = ntfs_rl_insert_range(ni->runlist.rl, (int)ni->runlist.count,
@@ -5974,19 +5975,20 @@ int ntfs_non_resident_attr_insert_range(struct ntfs_inode *ni, s64 start_vcn, s6
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
@@ -5996,6 +5998,13 @@ int ntfs_non_resident_attr_insert_range(struct ntfs_inode *ni, s64 start_vcn, s6
 	mark_mft_record_dirty(ctx->ntfs_ino);
 	ntfs_attr_put_search_ctx(ctx);
 	return ret;
+
+report_error:
+	if (ret == -ENOENT)
+		ret = -EFSCORRUPTED;
+	/* The runlist and sizes have already changed without rollback. */
+	ntfs_report_file_metadata_error(VFS_I(base_ni), ret);
+	return ret;
 }
 
 int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn, s64 len)
@@ -6028,8 +6037,9 @@ int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn,
 		dst_cnt++;
 	rl = ntfs_rl_find_vcn_nolock(ni->runlist.rl, start_vcn);
 	if (!rl) {
+		ntfs_report_file_metadata_error(VFS_I(base_ni), -EFSCORRUPTED);
 		up_write(&ni->runlist.lock);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	rl = ntfs_rl_collapse_range(ni->runlist.rl, dst_cnt + 1,
@@ -6090,6 +6100,11 @@ int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn,
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 out_rl:
+	if (ret == -ENOENT)
+		ret = -EFSCORRUPTED;
+	/* The range was removed from the runlist and cannot be restored. */
+	if (ret)
+		ntfs_report_file_metadata_error(VFS_I(base_ni), ret);
 	kvfree(punch_rl);
 	mark_mft_record_dirty(base_ni);
 	return ret;
@@ -6124,8 +6139,9 @@ int ntfs_non_resident_attr_punch_hole(struct ntfs_inode *ni, s64 start_vcn, s64
 		dst_cnt++;
 	rl = ntfs_rl_find_vcn_nolock(ni->runlist.rl, start_vcn);
 	if (!rl) {
+		ntfs_report_file_metadata_error(VFS_I(base_ni), -EFSCORRUPTED);
 		up_write(&ni->runlist.lock);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	rl = ntfs_rl_punch_hole(ni->runlist.rl, dst_cnt + 1,
@@ -6140,13 +6156,16 @@ int ntfs_non_resident_attr_punch_hole(struct ntfs_inode *ni, s64 start_vcn, s64
 	ret = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 	up_write(&ni->runlist.lock);
 	if (ret) {
+		ntfs_report_file_metadata_error(VFS_I(base_ni), ret);
 		kvfree(punch_rl);
 		return ret;
 	}
 
 	ret = ntfs_cluster_free_from_rl(vol, punch_rl);
-	if (ret)
+	if (ret) {
+		ntfs_report_file_metadata_error(VFS_I(base_ni), ret);
 		ntfs_error(vol->sb, "Freeing of clusters failed");
+	}
 
 	kvfree(punch_rl);
 	mark_mft_record_dirty(base_ni);
@@ -6195,7 +6214,11 @@ int ntfs_attr_fallocate(struct ntfs_inode *ni, loff_t start, loff_t byte_len, bo
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (err) {
-		err = -EIO;
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(VFS_I(base_ni),
+							-EFSCORRUPTED);
+		}
 		goto out_unmap;
 	}
 
@@ -6210,7 +6233,9 @@ int ntfs_attr_fallocate(struct ntfs_inode *ni, loff_t start, loff_t byte_len, bo
 					CASE_SENSITIVE, 0, NULL, 0,
 					ctx);
 			if (err) {
-				err = -EIO;
+				if (err == -ENOENT)
+					err = -EFSCORRUPTED;
+				ntfs_report_file_metadata_error(VFS_I(base_ni), err);
 				goto out_unmap;
 			}
 			ni->data_size = old_data_size;
@@ -6296,6 +6321,10 @@ int ntfs_attr_fallocate(struct ntfs_inode *ni, loff_t start, loff_t byte_len, bo
 			}
 		} else {
 			err = -EIO;
+			if (rl_lcn < LCN_HOLE) {
+				err = -EFSCORRUPTED;
+				ntfs_report_file_metadata_error(VFS_I(base_ni), err);
+			}
 			goto out;
 		}
 	}
-- 
2.51.0

