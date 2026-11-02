Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605013;
	b=1AXFKMewwc4yFx9r6eu7BgTnRQeXsYTHi9pj2wIazP2l6X6ze18vDvrc0xv12FBMdtXK
	 +CFGELW4zCdASUBDlHdr4jVGwhaBvV5dF8qEDgmM1hLJwzBFGEXz2S1oaeWzMIhIHJVZF
	 YRVO8k0Vj0tZiXeAuHZCif3/OEFgqYGgVPWZyrPkZksd93rTEeBVovZJ0x9l+FvOY+U1D
	 AunLj7UaVMzqFKc44AzCeBqArypYRmiuE88ZDgZeNB8EDNulNm+LzhLzpoIqbtOhrSAOj
	 8BGKEbZtwsvswOMl66/0wdlTG4QE4+4HGkIJnYQYxN8lUyI5b/FHtxT4QpA6MWWFuRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605013;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=qXCDcV5YTYznZjJgYEWmOkBrYX941kDPyu3kfZQhKuc=;
	b=PxTj6x0KgS7BZxiWiK3nuqmmOhEiDRv1wQVZcdSgzXf7bOtMD4rw2TfCG5TIu0FNopig
	 sLzC2XkNmyNFdiKXKqOWp4BMjd5abAuND+/IvxVHTeVFfTLY2dJA3fA+C2CYn72kcjCTd
	 oyXXk10WrHV1QMCGB1DdmnG2JLlNOiuFJemqGNI7dP9pQOEaERKzLkplw8hI+9DkR+qh2
	 b9M7wmCry+sgs97hN5Ar9nQbErovab19517ztvQsLplEnlWnSYN96w0vHlpEih0SIaZAz
	 pBAWu2foWl4LVAAIb7UoG17qSruHaj+BJzcUn60I5+lr5rHHqCfJBQz4aeAF1wx/CVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BybH3ag6;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5174606A326
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5174606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BybH3ag6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=qX
	CDcV5YTYznZjJgYEWmOkBrYX941kDPyu3kfZQhKuc=; b=BybH3ag6oePUI2nMot
	ENzJxuOgSgLYp6LKgwSxpG+lG2ra4CDn6ssc6P8aK8ypYOQ5GHB5YQXj5NBlByZR
	aOVsbK/7mH6isBzlv+Ia64JIhmtMIG3pqdBYaPr1brcQGT9sWRsm+OCQINvhURHF
	AamyLZwMJ8hrAnC2+1TtB7c4Y=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3vy+HPehqF0lcEw--.2040S3;
	Mon, 02 Nov 2026 15:36:40 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>
Subject: [PATCH v5 09/31] ntfs: report iomap corruption and preserve buffered read errors
Date: Mon,  2 Nov 2026 15:35:10 +0800
Message-Id: <20261102073532.98873-10-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3vy+HPehqF0lcEw--.2040S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxtF1xXF48Wr1fGr4xKrWfXwb_yoWxtw4UpF
	9IkrZxKw4rXr97Wrn3tFZ8Zr1F9w10g34UWryfGw1fZa1Yyw47KF18KF1YvF1SqrZ5Aw1j
	qFWjkrWUWw4UZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U9VyxUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzglGL2roPYlBPAAA3l

From: Dandan Wu <wudandan@kylinos.cn>

The iomap paths detect missing required attributes and invalid runs
without reporting them. Report these conditions as EFSCORRUPTED while
preserving allocation and underlying mapping errors.

Capture synchronous iomap errors in read_folio so buffered reads retain
their errno instead of turning corruption and allocation failures into
EIO. Keep the existing partial-read behavior.

Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
 fs/ntfs/aops.c  | 22 +++++++++++++++++--
 fs/ntfs/iomap.c | 56 ++++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 64 insertions(+), 14 deletions(-)

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
index 17ffb59a8cf0..dcb8ca66e289 100644
--- a/fs/ntfs/iomap.c
+++ b/fs/ntfs/iomap.c
@@ -102,8 +102,13 @@ static int ntfs_read_iomap_begin_resident(struct inode *inode, loff_t offset, lo
 
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
@@ -241,11 +246,12 @@ static int ntfs_read_iomap_begin_non_resident(struct inode *inode, loff_t offset
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
@@ -387,6 +393,7 @@ static int ntfs_zero_range(struct inode *inode, loff_t offset, loff_t length)
 static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_t offset,
 						      loff_t length, struct iomap *iomap)
 {
+	int report_err = 0;
 	struct ntfs_inode *ni = NTFS_I(inode);
 	struct ntfs_inode *mrec_ni = ntfs_inode_is_named_stream(ni) ?
 			ntfs_base_inode(ni) : ni;
@@ -409,7 +416,7 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 		err = ntfs_map_runlist(ni, vcn);
 		if (err) {
 			mutex_unlock(&mrec_ni->mrec_lock);
-			return -ENOENT;
+			goto out;
 		}
 		down_read(&ni->runlist.lock);
 		rl = ni->runlist.rl;
@@ -421,9 +428,18 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
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
+			report_err = -EFSCORRUPTED;
 		up_write(&ni->runlist.lock);
 		mutex_unlock(&mrec_ni->mrec_lock);
-		return -EIO;
+		err = offset < allocated_size ? -EFSCORRUPTED : -EIO;
+		goto out;
 	}
 	lcn = ntfs_rl_vcn_to_lcn(rl, vcn);
 
@@ -442,19 +458,24 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 	 * extent over clusters that are allocated on disk but unknown to us.
 	 */
 	if (lcn == LCN_RL_NOT_MAPPED) {
+		if (!map_err || map_err == -ENOENT)
+			report_err = -EFSCORRUPTED;
 		up_write(&ni->runlist.lock);
 		mutex_unlock(&mrec_ni->mrec_lock);
-		return map_err == -ENOMEM ? -ENOMEM : -EIO;
+		err = !map_err || map_err == -ENOENT ? -EFSCORRUPTED : map_err;
+		goto out;
 	}
 
 	max_clu_count = min(max_clu_count, rl->length - (vcn - rl->vcn));
 	if (max_clu_count == 0) {
+		report_err = -EFSCORRUPTED;
 		ntfs_error(inode->i_sb,
 				"runlist(vcn : %lld, length : %lld) is corrupted\n",
 				rl->vcn, rl->length);
 		up_write(&ni->runlist.lock);
 		mutex_unlock(&mrec_ni->mrec_lock);
-		return -EIO;
+		err = -EFSCORRUPTED;
+		goto out;
 	}
 
 	iomap->bdev = inode->i_sb->s_bdev;
@@ -468,7 +489,7 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 				err = max_clu_count;
 				up_write(&ni->runlist.lock);
 				mutex_unlock(&mrec_ni->mrec_lock);
-				return err;
+				goto out;
 			}
 		}
 
@@ -497,11 +518,16 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 			rl = ntfs_runlists_merge(&ni->runlist, rlc, 0,
 					&new_rl_count);
 			if (IS_ERR(rl)) {
+				err = PTR_ERR(rl);
+				if (err != -ENOMEM) {
+					err = -EFSCORRUPTED;
+					report_err = err;
+				}
 				ntfs_error(vol->sb, "Failed to merge runlists");
 				up_write(&ni->runlist.lock);
 				mutex_unlock(&mrec_ni->mrec_lock);
 				kvfree(rlc);
-				return PTR_ERR(rl);
+				goto out;
 			}
 
 			ni->runlist.rl = rl;
@@ -556,7 +582,7 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 				err = 0;
 			if (err) {
 				ntfs_release_dirty_clusters(vol, max_clu_count);
-				return err;
+				goto out;
 			}
 		}
 	} else {
@@ -573,7 +599,11 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 			iomap->length = length;
 	}
 
-	return 0;
+	err = 0;
+out:
+	if (report_err)
+		ntfs_report_file_metadata_error(inode, report_err);
+	return err;
 }
 
 #define NTFS_IOMAP_FLAGS_BEGIN		BIT(1)
@@ -689,8 +719,10 @@ static int ntfs_write_iomap_begin_resident(struct inode *inode, loff_t offset,
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
 

