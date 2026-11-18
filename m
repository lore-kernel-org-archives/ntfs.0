Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992932;
	b=dokP++/dS3cud1ABjuMn58FHrNaX6bQKpnTRyk6MovveymgOsbq5iebbyZ/6cDKxAbos
	 iutHJ33SGl6arehsX0ffF808s7lZ0c7VyRMZnv5dyJ+lAroNaNv6mHzG746rOdd7PX6+o
	 Samj6BTVrvV+WR+oy8DRGPfMHzseCPIobhwIQoT6gIpgBBM8rWyBZw2UhBPKz/aU56awa
	 Q6UWDAYMJkJyGXLV2IgTnlkyq5gL+Z5ZTZ7hGHKQSwM88RpHAIbXgjKeaZ8AT5RUyFOd8
	 yjUGCQOeA0ds1Zm0dmZgvzB65y0Cd1pVoPxCtP2gfd1u7rOX2jATgEPpc8BVc6zRc3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992932;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=eLplVoUR151Z1rxiGrfmDOIgnEPAYp9Bob6L9S+wLKc=;
	b=1BWq63Hs1sI2mkNIL0JXYZAaPmhqWdGOnpfZU0//54pBYTX3lUEc5dMdqnOnR/zXIman
	 n9+rOG8f/PxpQPHY9csMm7Xu/qRo30t2Zvqody/4dVu6lgvtLFKAjDnChIHVNLe6nMQGT
	 Du5YJ6CpDgnoqAdD2XKM48hvIHFujudJD3vhePNy0uyDyDY4xrhZXtMwVudxxRbNlC10G
	 diKxcmYnfPzkkSFLN04x+WFPdyWJPhaANmtj3K7IqR6cKwrDUbS2BhWLR4x2k8zHBnllX
	 nYVoJyw4MTBcqLo2VyOfWxifw2hN7MzEwZ3KECoZoa5/XdPEjZJCnQnrvA/K8kML64A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GhSH6JDB;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8E2606A883
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E8E2606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GhSH6JDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=eL
	plVoUR151Z1rxiGrfmDOIgnEPAYp9Bob6L9S+wLKc=; b=GhSH6JDBYfKmTXHHXX
	BqC+NYO7+Se9cjAdVw8MrscIGNAJJn0nS/OU9xq5gzL5bSfJXUphfolMilNZAojE
	V9wE6L4cQQRJ383ZuAWPHSRWdl6mPP2mZbQyuq7/RZpKFWFwRGE10prnnT15zXkI
	LxGTld2kDdGzvkL2APm4hj4g0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3_+gOa_1qh6wGIA--.32884S9;
	Wed, 18 Nov 2026 17:08:35 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 15/37] ntfs: report iomap metadata corruption
Date: Wed, 18 Nov 2026 17:06:39 +0800
Message-Id: <20261118090701.1858849-16-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3_+gOa_1qh6wGIA--.32884S9
X-Coremail-Antispam: 1Uf129KBjvJXoWxtF1xAryxCr1fCF45tr1rtFb_yoW7Kr48pF
	y3KrZxKw1rXr97Wrn7t390vF1a93W8K3y7Wr1fJw4fZa1Yyw47tF10kF1YqF1SqrZ5A34q
	vFWjkrW7Cw4UZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTVb9UUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzRP44Wr9axMhpgAA3v

From: Dandan Wu <wudandan@kylinos.cn>

The iomap paths detect missing required attributes and invalid runs
without reporting them. Report these conditions as EFSCORRUPTED while
preserving allocation and underlying mapping errors.

Keep sparse holes, ordinary EOF and partial-I/O semantics distinct from
corruption. The preceding read_folio fix preserves synchronous errors.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
Changes in v6:
Keep the reporting changes here; buffered-read error propagation is
now a preceding patch. Adapt to the current iomap callback interface.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.

 fs/ntfs/iomap.c | 56 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/fs/ntfs/iomap.c b/fs/ntfs/iomap.c
index ce916707f69b..438837318522 100644
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
@@ -375,6 +381,7 @@ static int ntfs_zero_range(struct inode *inode, loff_t offset, loff_t length)
 static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_t offset,
 						      loff_t length, struct iomap *iomap)
 {
+	int report_err = 0;
 	struct ntfs_inode *ni = NTFS_I(inode);
 	struct ntfs_inode *mrec_ni = ntfs_inode_is_named_stream(ni) ?
 			ntfs_base_inode(ni) : ni;
@@ -397,7 +404,7 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 		err = ntfs_map_runlist(ni, vcn);
 		if (err) {
 			mutex_unlock(&mrec_ni->mrec_lock);
-			return -ENOENT;
+			goto out;
 		}
 		down_read(&ni->runlist.lock);
 		rl = ni->runlist.rl;
@@ -409,9 +416,18 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
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
 
@@ -430,19 +446,24 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
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
@@ -456,7 +477,7 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 				err = max_clu_count;
 				up_write(&ni->runlist.lock);
 				mutex_unlock(&mrec_ni->mrec_lock);
-				return err;
+				goto out;
 			}
 		}
 
@@ -485,11 +506,16 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
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
 				kfree(rlc);
-				return PTR_ERR(rl);
+				goto out;
 			}
 
 			ni->runlist.rl = rl;
@@ -544,7 +570,7 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 				err = 0;
 			if (err) {
 				ntfs_release_dirty_clusters(vol, max_clu_count);
-				return err;
+				goto out;
 			}
 		}
 	} else {
@@ -561,7 +587,11 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
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
@@ -677,8 +707,10 @@ static int ntfs_write_iomap_begin_resident(struct inode *inode, loff_t offset,
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

