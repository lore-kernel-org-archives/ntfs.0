Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485964;
	b=hdqC95hnJMSsSvD7Bje83i2U5sLGHA2nfYSj4aAeD5Ysnl7PPMWhEuDa7Q9L4a4Stplb
	 HygdVdZpyFjouaLj1NjCXnlijZTrTQUdQzUrXlLzIg+uMvFIPXUvcRKG7mrROeWmADuM1
	 vO9FiQz07f3mMPP0c8M+h7PdtZKI9hyi/muJSzzLP6Dt9AjNe8y5G2zE3Few6xoAKfaSO
	 qevt7wXeZ/IX6p3jKrbE46MQT2e7/VzqPQmwUfp+Ad9ye0aBzWskv1Aytb+coI2t53Ejk
	 R5XKa+WZxz1hqWTAimNpEBeTpneB4n7+oHyKTXAt5PfTBVswCNR3jNyCmnXPEptBHmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485964;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=jLZNqZ797ffi18BTv1o+2kbw3qIa8d3zQHXnbXOJ2Fs=;
	b=NHP76Rh03QlK4vBhvscrFXGE+twrQcKZlVQqErm694J34inanEIdhS6LLM5v6fkDdRSL
	 sFp0colcVEvcJVKN+hOi93LwUis8dHi5Am1alksLmwLsYZUGknf+uDcGR+qtRa8E0jfn1
	 yvQGp+IPZuk2ORBsp3TZDHdThM8yYgokBGYmSb2zhLoSCYLlgY8Rm7toHSNbj1P/zuSOE
	 6lKeSpSjWElJTMRb1hf7BGujtycXXu68sljZnxFvRTamBefE+TeaTxgJb/alyYqAimw2w
	 ySGpYtJEloFJ0tHREYRj5NI5YIDAsMNVej/km0drHuwl+XENnxsBvjUaF446OSGr/AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="IQKsM/5w";
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD56606A319
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBD56606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=IQKsM/5w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=jL
	ZNqZ797ffi18BTv1o+2kbw3qIa8d3zQHXnbXOJ2Fs=; b=IQKsM/5wy491VtvhGb
	0U6X07ntJNM0uEz+ZhGx4MqG8qwL6LOKOMC244KCzUd7CmvQPbJCp8Z4FTVnNeSB
	xZtfHSocT+x5zLh9QuHkidPdwxU2JLa/wjLr8xY9U3Gg+B9zWJx4mziBztLmDTWC
	7VTIVRlUoVbTJbh88FAnsH9/M=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3n0ksKtdq7UkHBg--.56105S3;
	Tue, 20 Oct 2026 16:45:34 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 09/31] ntfs: report iomap corruption and preserve buffered read errors
Date: Tue, 20 Oct 2026 16:43:59 +0800
Message-ID: <20261020084421.2196486-10-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3n0ksKtdq7UkHBg--.56105S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxtF1xXF48Wr17AF1fKryrXrb_yoWxJrWDpF
	9Ikr9xKr4rXr9rWrn3tFZ8Zw1F9w18K34UXryxGwn7Zan0yw47K3W0kF4Y9FySqr95Jw1q
	qrWUKrW7ua1UZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFq2_UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Q4m8GrXKi5ZFAAA3F

From: Dandan Wu <wudandan@kylinos.cn>

The iomap paths detect missing required attributes and invalid runs
without reporting them. Report these conditions as EFSCORRUPTED while
preserving allocation and underlying mapping errors.

Capture synchronous iomap errors in read_folio so buffered reads retain
their errno instead of turning corruption and allocation failures into
EIO. Keep the existing partial-read behavior.

Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
 fs/ntfs/aops.c  | 22 ++++++++++++++++++++--
 fs/ntfs/iomap.c | 43 ++++++++++++++++++++++++++++++++++---------
 2 files changed, 54 insertions(+), 11 deletions(-)

diff --git a/fs/ntfs/aops.c b/fs/ntfs/aops.c
index 7884737657d5..474e99aa123d 100644
--- a/fs/ntfs/aops.c
+++ b/fs/ntfs/aops.c
@@ -48,6 +48,22 @@ static const struct iomap_read_ops ntfs_iomap_bio_read_ops = {
 	.submit_read		= ntfs_iomap_bio_submit_read,
 };
 
+static int ntfs_read_folio_iomap_next(const struct iomap_iter *iter,
+				      struct iomap *iomap, struct iomap *srcmap)
+{
+	int *error = iter->private;
+	int ret;
+
+	ret = ntfs_read_iomap_ops.iomap_next(iter, iomap, srcmap);
+	if (ret < 0)
+		*error = ret;
+	return ret;
+}
+
+static const struct iomap_ops ntfs_read_folio_iomap_ops = {
+	.iomap_next = ntfs_read_folio_iomap_next,
+};
+
 /*
  * ntfs_read_folio - Read data for a folio from the device
  * @file:	open file to which the folio @folio belongs or NULL
@@ -72,6 +88,7 @@ static int ntfs_read_folio(struct file *file, struct folio *folio)
 		.cur_folio = folio,
 		.ops = &ntfs_iomap_bio_read_ops,
 	};
+	int err = 0;
 
 	/*
 	 * Only $DATA attributes can be encrypted and only unnamed $DATA
@@ -103,8 +120,9 @@ static int ntfs_read_folio(struct file *file, struct folio *folio)
 			return ntfs_read_compressed_block(folio);
 	}
 
-	iomap_read_folio(&ntfs_read_iomap_ops, &ctx, NULL);
-	return 0;
+	/* iomap_read_folio() otherwise discards synchronous mapping errors. */
+	iomap_read_folio(&ntfs_read_folio_iomap_ops, &ctx, &err);
+	return err;
 }
 
 /*
diff --git a/fs/ntfs/iomap.c b/fs/ntfs/iomap.c
index c248c61854cc..e0ac03dd5138 100644
--- a/fs/ntfs/iomap.c
+++ b/fs/ntfs/iomap.c
@@ -76,8 +76,13 @@ static int ntfs_read_iomap_begin_resident(struct inode *inode, loff_t offset, lo
 
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
-	if (unlikely(err))
+	if (unlikely(err)) {
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(inode, -EFSCORRUPTED);
+		}
 		goto out;
+	}
 
 	attr_len = le32_to_cpu(ctx->attr->data.resident.value_length);
 	if (unlikely(attr_len > ni->initialized_size))
@@ -215,11 +220,12 @@ static int ntfs_read_iomap_begin_non_resident(struct inode *inode, loff_t offset
 	rl_length = ntfs_cluster_to_bytes(vol, rl->length - (vcn - rl->vcn));
 
 	if (rl_length == 0 && rl->lcn > LCN_DELALLOC) {
+		ntfs_report_file_metadata_error(inode, -EFSCORRUPTED);
 		ntfs_error(inode->i_sb,
 				"runlist(vcn : %lld, length : %lld, lcn : %lld) is corrupted\n",
 				rl->vcn, rl->length, rl->lcn);
 		up_write(&ni->runlist.lock);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	if (rl_length && length > rl_length - vcn_ofs)
@@ -418,7 +424,7 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 		err = ntfs_map_runlist(ni, vcn);
 		if (err) {
 			mutex_unlock(&mrec_ni->mrec_lock);
-			return -ENOENT;
+			return err;
 		}
 		down_read(&ni->runlist.lock);
 		rl = ni->runlist.rl;
@@ -430,9 +436,17 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 	/* Seek to element containing target vcn. */
 	rl = __ntfs_attr_find_vcn_nolock(&ni->runlist, vcn);
 	if (IS_ERR(rl)) {
+		unsigned long irqflags;
+		s64 allocated_size;
+
+		read_lock_irqsave(&ni->size_lock, irqflags);
+		allocated_size = ni->allocated_size;
+		read_unlock_irqrestore(&ni->size_lock, irqflags);
+		if (offset < allocated_size)
+			ntfs_report_file_metadata_error(inode, -EFSCORRUPTED);
 		up_write(&ni->runlist.lock);
 		mutex_unlock(&mrec_ni->mrec_lock);
-		return -EIO;
+		return offset < allocated_size ? -EFSCORRUPTED : -EIO;
 	}
 	lcn = ntfs_rl_vcn_to_lcn(rl, vcn);
 
@@ -451,19 +465,22 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 	 * extent over clusters that are allocated on disk but unknown to us.
 	 */
 	if (lcn == LCN_RL_NOT_MAPPED) {
+		if (!map_err || map_err == -ENOENT)
+			ntfs_report_file_metadata_error(inode, -EFSCORRUPTED);
 		up_write(&ni->runlist.lock);
 		mutex_unlock(&mrec_ni->mrec_lock);
-		return map_err == -ENOMEM ? -ENOMEM : -EIO;
+		return !map_err || map_err == -ENOENT ? -EFSCORRUPTED : map_err;
 	}
 
 	max_clu_count = min(max_clu_count, rl->length - (vcn - rl->vcn));
 	if (max_clu_count == 0) {
+		ntfs_report_file_metadata_error(inode, -EFSCORRUPTED);
 		ntfs_error(inode->i_sb,
 				"runlist(vcn : %lld, length : %lld) is corrupted\n",
 				rl->vcn, rl->length);
 		up_write(&ni->runlist.lock);
 		mutex_unlock(&mrec_ni->mrec_lock);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	iomap->bdev = inode->i_sb->s_bdev;
@@ -506,11 +523,17 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 			rl = ntfs_runlists_merge(&ni->runlist, rlc, 0,
 					&new_rl_count);
 			if (IS_ERR(rl)) {
+				err = PTR_ERR(rl);
+				if (err != -ENOMEM) {
+					err = -EFSCORRUPTED;
+					ntfs_report_file_metadata_error(inode,
+									err);
+				}
 				ntfs_error(vol->sb, "Failed to merge runlists");
 				up_write(&ni->runlist.lock);
 				mutex_unlock(&mrec_ni->mrec_lock);
 				kvfree(rlc);
-				return PTR_ERR(rl);
+				return err;
 			}
 
 			ni->runlist.rl = rl;
@@ -698,8 +721,10 @@ static int ntfs_write_iomap_begin_resident(struct inode *inode, loff_t offset,
 	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
 			CASE_SENSITIVE, 0, NULL, 0, ctx);
 	if (err) {
-		if (err == -ENOENT)
-			err = -EIO;
+		if (err == -ENOENT) {
+			err = -EFSCORRUPTED;
+			ntfs_report_file_metadata_error(inode, -EFSCORRUPTED);
+		}
 		goto out;
 	}
 
-- 
2.51.0

