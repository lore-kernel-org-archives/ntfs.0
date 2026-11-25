Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592162;
	b=FUkxb1BMDeLZ08uxW7uW4Z6L3myuztwHWnkA+HSB5pfaIGrTkKUhTEDB9nb4ymB1Ne65
	 ZTgwKcKUBgexaG4SLylkg1iEq14n+0c5eIEnFEw7Ful96rAxosJCkUzkPfpig13fnUNuw
	 fEtd8CJrrKNabGW67Wmq7sX4Dw3S+z82sHTpXA7puVmlDywWzUAD+/0S7ID3YAJ9o/GVW
	 iacDwaNE1ZOueLGzMnsIGwfKrEy0c2o7iND70vno/+/JxKlbXabNV4jJnI4ggMbclhPzS
	 Ilqj9a5kpWLy4m97TxIw3qFGtZY7Tgg1qQSvgfdF2uhpQqDymFIiyZj507EIFeWT6Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592162;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0mlDU1n5tLLP6QcQlxU0T21vj4OOV6i66wd2mWNWnRU=;
	b=4+7HuT5JNm59WF6Bo6MdhmEbavxqlM+99Pzmk+WDtqFZEw2vi3AQjuVYCCh4lObgJ3CZ
	 XAN7/V1mAqiopeSiAiNxd6jPZZNmFet9Yesoj72tPoSH3hsZ0AIVwAXcK7dICyKNnd7UX
	 8d80w+6nmkDm+fwntvR87ArAo/To7f1JK6FtiHDyW6QUitKaKW5Lgd2gld1IqchBVGfaF
	 YM1n8vNPLFklVbV/HfmcGDP2cDKRWJaAcd/BGtdwTkXrvuY6tIZtv7HHngY/ZcxnoGAFG
	 PgPAwIMpSdYxGDE0fHlh9JXNhAC17lUA144pU+aH0cb0h8pIFZu7P/gtouwRn5HptEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949B6606A326
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 07:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 949B6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d8a7a182e8a211f19a56ed5b684f684d-20261125
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:f28fbba8-af71-474b-930b-389b4bccffca,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:4cc65254e07b054db04a885f0c1fdfc5,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|850|865|898,TC:nil,Content:0|15|50|9
	9,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d8a7a182e8a211f19a56ed5b684f684d-20261125
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1633123696; Wed, 25 Nov 2026 15:35:54 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH 4/6] ntfs: update the in-memory sizes under the size lock
Date: Wed, 25 Nov 2026 15:35:45 +0800
Message-Id: <20261125073547.154150-5-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125073547.154150-1-zenghongling@kylinos.cn>
References: <20261125073547.154150-1-zenghongling@kylinos.cn>
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

The runtime mutation paths update data_size, initialized_size and
allocated_size without size_lock, racing with the readers that use
the lock to obtain a coherent snapshot.

Protect the shrink and expand tails, make-resident and resident-resize
paths, insert/collapse range, KEEP_SIZE rollback, internal initialized
size updates, preallocation trimming, and the compressed size
recalculation. Group assignments that form one logical size-state
update into the same critical section where possible.

The inode load, creation, and eviction paths are unchanged because the
inode is not concurrently visible there. Existing inode and MFT locks
serialize writers; size_lock synchronizes publication of the resulting
state to readers.

All affected mutation paths are already serialized against one another by
the inode lock or the relevant MFT record lock; size_lock is added only to
synchronize publication to readers.

LOCKING PROTOCOL:
- size_lock protects: data_size, initialized_size, allocated_size,
  itype.compressed.size (allocated size for compressed files)
- itype.compressed.block_size, block_size_bits, block_clusters are NOT
  protected by size_lock (reader and writer access patterns confirmed)

Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 fs/ntfs/attrib.c | 48 +++++++++++++++++++++++++++++++++++++++++++-----
 fs/ntfs/file.c   |  3 +++
 fs/ntfs/inode.c  | 42 ++++++++++++++++++++++++++++++------------
 3 files changed, 76 insertions(+), 17 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 6ee6b6bcac1d..081ce3e829f2 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -2436,6 +2436,7 @@ int ntfs_attr_set_initialized_size(struct ntfs_inode *ni, loff_t new_size)
 	struct ntfs_attr_search_ctx *ctx;
 	struct ntfs_inode *base_ni = ntfs_base_inode(ni);
 	int err = 0;
+	unsigned long flags;
 
 	if (!NInoNonResident(ni))
 		return -EINVAL;
@@ -2450,7 +2451,9 @@ int ntfs_attr_set_initialized_size(struct ntfs_inode *ni, loff_t new_size)
 		goto out_ctx;
 
 	ctx->attr->data.non_resident.initialized_size = cpu_to_le64(new_size);
+	write_lock_irqsave(&ni->size_lock, flags);
 	ni->initialized_size = new_size;
+	write_unlock_irqrestore(&ni->size_lock, flags);
 	mark_mft_record_dirty(ctx->ntfs_ino);
 out_ctx:
 	ntfs_attr_put_search_ctx(ctx);
@@ -3729,6 +3732,7 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
 		struct ntfs_inode *locked_ni, bool defer_attrlist)
 {
 	int sparse, err = 0;
+	unsigned long flags;
 	struct ntfs_inode *base_ni;
 	struct super_block *sb = ni->vol->sb;
 
@@ -3834,7 +3838,9 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
 			goto out;
 		}
 
+		write_lock_irqsave(&ni->size_lock, flags);
 		ni->itype.compressed.size = new_compr_size;
+		write_unlock_irqrestore(&ni->size_lock, flags);
 		a->data.non_resident.compressed_size = cpu_to_le64(new_compr_size);
 	}
 
@@ -4271,6 +4277,7 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
 	struct attr_record *a = ctx->attr;
 	int name_ofs, val_ofs, err;
 	s64 arec_size, freed;
+	unsigned long flags;
 
 	ntfs_debug("Entering for inode 0x%llx, attr 0x%x.\n",
 			(unsigned long long)ni->mft_no, ni->type);
@@ -4376,8 +4383,10 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
 	ni->flags &= ~FILE_ATTR_SPARSE_FILE;
 	NInoClearEncrypted(ni);
 	ni->flags &= ~FILE_ATTR_ENCRYPTED;
+	write_lock_irqsave(&ni->size_lock, flags);
 	ni->initialized_size = ni->data_size;
 	ni->allocated_size = ni->itype.compressed.size = (ni->data_size + 7) & ~7;
+	write_unlock_irqrestore(&ni->size_lock, flags);
 	ni->itype.compressed.block_size = 0;
 	ni->itype.compressed.block_size_bits = ni->itype.compressed.block_clusters = 0;
 	return 0;
@@ -4401,6 +4410,8 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 	s64 first_free_vcn;
 	s64 nr_freed_clusters;
 	int err;
+	unsigned long flags;
+	bool update_initialized;
 	struct ntfs_inode *base_ni;
 	bool runlist_locked = locked_ni == ni;
 
@@ -4493,12 +4504,16 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 		}
 
 		/* Prepare to mapping pairs update. */
+		write_lock_irqsave(&ni->size_lock, flags);
 		ni->allocated_size = ntfs_cluster_to_bytes(vol, first_free_vcn);
+		write_unlock_irqrestore(&ni->size_lock, flags);
 
 		if (NInoSparse(ni) || NInoCompressed(ni)) {
 			if (nr_freed_clusters) {
+				write_lock_irqsave(&ni->size_lock, flags);
 				ni->itype.compressed.size -=
 					ntfs_cluster_to_bytes(vol, nr_freed_clusters);
+				write_unlock_irqrestore(&ni->size_lock, flags);
 				VFS_I(base_ni)->i_blocks = ni->itype.compressed.size >> 9;
 			}
 		} else
@@ -4531,12 +4546,15 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
 	}
 
 	/* Update data and initialized size. */
+	write_lock_irqsave(&ni->size_lock, flags);
 	ni->data_size = newsize;
-	ctx->attr->data.non_resident.data_size = cpu_to_le64(newsize);
-	if (newsize < ni->initialized_size) {
+	update_initialized = newsize < ni->initialized_size;
+	if (update_initialized)
 		ni->initialized_size = newsize;
+	write_unlock_irqrestore(&ni->size_lock, flags);
+	ctx->attr->data.non_resident.data_size = cpu_to_le64(newsize);
+	if (update_initialized)
 		ctx->attr->data.non_resident.initialized_size = cpu_to_le64(newsize);
-	}
 
 	/*
 	 * Drop any page-cache folios that now lie beyond the shrunk
@@ -4808,7 +4826,9 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		}
 
 		/* Prepare to mapping pairs update. */
+		write_lock_irqsave(&ni->size_lock, flags);
 		ni->allocated_size = ntfs_cluster_to_bytes(vol, first_free_vcn);
+		write_unlock_irqrestore(&ni->size_lock, flags);
 		if (ni->type == AT_ATTRIBUTE_LIST && !runlist_locked) {
 			/*
 			 * Making room for the list's mapping pairs can resize
@@ -4854,7 +4874,9 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	}
 
 	/* Update data size. */
+	write_lock_irqsave(&ni->size_lock, flags);
 	ni->data_size = newsize;
+	write_unlock_irqrestore(&ni->size_lock, flags);
 	ctx->attr->data.non_resident.data_size = cpu_to_le64(newsize);
 	/* Update data size in the index. */
 	if (ni->type == AT_DATA && ni->name == AT_UNNAMED)
@@ -4900,7 +4922,9 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 			ntfs_error(sb, "Failed to restore old mapping pairs");
 
 		if (NInoSparse(ni) || NInoCompressed(ni)) {
-			ni->itype.compressed.size =  org_compressed_size;
+			write_lock_irqsave(&ni->size_lock, flags);
+			ni->itype.compressed.size = org_compressed_size;
+			write_unlock_irqrestore(&ni->size_lock, flags);
 			VFS_I(base_ni)->i_blocks = ni->itype.compressed.size >> 9;
 		} else
 			VFS_I(base_ni)->i_blocks = ni->allocated_size >> 9;
@@ -4936,6 +4960,7 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 	struct ntfs_volume *vol = attr_ni->vol;
 	struct super_block *sb = vol->sb;
 	int err = -EIO;
+	unsigned long flags;
 	struct ntfs_inode *base_ni, *ext_ni = NULL;
 
 attr_resize_again:
@@ -4984,10 +5009,12 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 					newsize);
 		if (!err) {
 			/* Update attribute size everywhere. */
+			write_lock_irqsave(&attr_ni->size_lock, flags);
 			attr_ni->data_size = attr_ni->initialized_size = newsize;
 			attr_ni->allocated_size = (newsize + 7) & ~7;
 			if (NInoCompressed(attr_ni) || NInoSparse(attr_ni))
 				attr_ni->itype.compressed.size = attr_ni->allocated_size;
+			write_unlock_irqrestore(&attr_ni->size_lock, flags);
 			if (attr_ni->type == AT_DATA && attr_ni->name == AT_UNNAMED)
 				NInoSetFileNameDirty(attr_ni);
 			goto resize_done;
@@ -5789,6 +5816,7 @@ int ntfs_non_resident_attr_insert_range(struct ntfs_inode *ni, s64 start_vcn, s6
 	struct ntfs_attr_search_ctx *ctx;
 	int ret;
 	size_t new_rl_count;
+	unsigned long flags;
 
 	if (ni->type != AT_DATA)
 		return -EOPNOTSUPP;
@@ -5830,10 +5858,12 @@ int ntfs_non_resident_attr_insert_range(struct ntfs_inode *ni, s64 start_vcn, s6
 	ni->runlist.rl =  rl;
 	ni->runlist.count = new_rl_count;
 
+	write_lock_irqsave(&ni->size_lock, flags);
 	ni->allocated_size += ntfs_cluster_to_bytes(vol, len);
 	ni->data_size += ntfs_cluster_to_bytes(vol, len);
 	if (ntfs_cluster_to_bytes(vol, start_vcn) < ni->initialized_size)
 		ni->initialized_size += ntfs_cluster_to_bytes(vol, len);
+	write_unlock_irqrestore(&ni->size_lock, flags);
 	ret = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 	up_write(&ni->runlist.lock);
 	if (ret)
@@ -5871,6 +5901,8 @@ int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn,
 	int dst_cnt;
 	int ret;
 	size_t new_rl_cnt;
+	unsigned long flags;
+	s64 allocated_size;
 
 	if (ni->type != AT_DATA)
 		return -EOPNOTSUPP;
@@ -5904,6 +5936,7 @@ int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn,
 	ni->runlist.rl = rl;
 	ni->runlist.count = new_rl_cnt;
 
+	write_lock_irqsave(&ni->size_lock, flags);
 	ni->allocated_size -= ntfs_cluster_to_bytes(vol, len);
 	if (ni->data_size > ntfs_cluster_to_bytes(vol, start_vcn)) {
 		if (ni->data_size > ntfs_cluster_to_bytes(vol, (start_vcn + len)))
@@ -5918,8 +5951,10 @@ int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn,
 		else
 			ni->initialized_size = ntfs_cluster_to_bytes(vol, start_vcn);
 	}
+	allocated_size = ni->allocated_size;
+	write_unlock_irqrestore(&ni->size_lock, flags);
 
-	if (ni->allocated_size > 0) {
+	if (allocated_size > 0) {
 		ret = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 		if (ret) {
 			up_write(&ni->runlist.lock);
@@ -6029,6 +6064,7 @@ int ntfs_attr_fallocate(struct ntfs_inode *ni, loff_t start, loff_t byte_len, bo
 	int err = 0;
 	struct runlist_element *rl;
 	bool balloc;
+	unsigned long flags;
 
 	if (ni->type != AT_DATA)
 		return -EINVAL;
@@ -6076,7 +6112,9 @@ int ntfs_attr_fallocate(struct ntfs_inode *ni, loff_t start, loff_t byte_len, bo
 				err = -EIO;
 				goto out_unmap;
 			}
+			write_lock_irqsave(&ni->size_lock, flags);
 			ni->data_size = old_data_size;
+			write_unlock_irqrestore(&ni->size_lock, flags);
 			i_size_write(VFS_I(ni), old_data_size);
 			if (NInoNonResident(ni))
 				ctx->attr->data.non_resident.data_size =
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 7d93a520566e..70a86d6fee6b 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -93,6 +93,7 @@ static int ntfs_trim_prealloc(struct inode *vi)
 	s64 vcn_ds, vcn_tr;
 	ssize_t rc;
 	int err = 0;
+	unsigned long flags;
 
 	inode_lock(vi);
 	mutex_lock(&mrec_ni->mrec_lock);
@@ -119,7 +120,9 @@ static int ntfs_trim_prealloc(struct inode *vi)
 			ni->runlist.rl = NULL;
 			ntfs_error(vol->sb, "Preallocated block rollback failed");
 		} else {
+			write_lock_irqsave(&ni->size_lock, flags);
 			ni->allocated_size = ntfs_cluster_to_bytes(vol, vcn_tr);
+			write_unlock_irqrestore(&ni->size_lock, flags);
 			err = ntfs_attr_update_mapping_pairs_locked(
 					ni, 0, ni);
 			if (err)
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 7d7bb741455e..0d97633b3e4b 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3844,18 +3844,22 @@ static inline int ntfs_enlarge_attribute(struct inode *vi, s64 pos, s64 count,
 	struct super_block *sb = vi->i_sb;
 	unsigned long flags;
 	s64 old_data_size;
+	s64 new_initialized_size = pos + count;
+	s64 initialized_size;
+	s64 data_size;
 	int ret;
 
 	/*
-	 * Snapshot the old data_size under size_lock: it is the rollback
-	 * target, the other sizes are updated by ntfs_attr_truncate()
-	 * itself
+	 * Snapshot the old sizes under size_lock: data_size is the
+	 * rollback target, initialized_size is compared below, the other
+	 * sizes are updated by ntfs_attr_truncate() itself
 	 */
 	read_lock_irqsave(&ni->size_lock, flags);
 	old_data_size = ni->data_size;
+	initialized_size = ni->initialized_size;
 	read_unlock_irqrestore(&ni->size_lock, flags);
 
-	if (pos + count <= ni->initialized_size)
+	if (new_initialized_size <= initialized_size)
 		return 0;
 
 	if (NInoEncrypted(ni) && NInoNonResident(ni))
@@ -3864,7 +3868,7 @@ static inline int ntfs_enlarge_attribute(struct inode *vi, s64 pos, s64 count,
 	if (NInoCompressed(ni))
 		return -EOPNOTSUPP;
 
-	if (pos + count > old_data_size) {
+	if (new_initialized_size > old_data_size) {
 		ret = ntfs_attr_truncate(ni, pos + count);
 		if (ret) {
 			ntfs_debug("Failed to truncate attribute");
@@ -3914,25 +3918,39 @@ static inline int ntfs_enlarge_attribute(struct inode *vi, s64 pos, s64 count,
 		}
 	}
 
+	/* ntfs_attr_truncate() may have updated data_size, re-read it */
+	read_lock_irqsave(&ni->size_lock, flags);
+	data_size = ni->data_size;
+	read_unlock_irqrestore(&ni->size_lock, flags);
+
 	if (!NInoNonResident(ni)) {
-		if (likely(i_size_read(vi) < ni->data_size))
-			i_size_write(vi, ni->data_size);
+		if (likely(i_size_read(vi) < data_size))
+			i_size_write(vi, data_size);
 		return 0;
 	}
 
 	/* Named streams initialize gaps after dropping the MFT record lock. */
 	if (ntfs_inode_is_named_stream(ni)) {
-		if (i_size_read(vi) < ni->data_size)
-			i_size_write(vi, ni->data_size);
+		if (i_size_read(vi) < data_size)
+			i_size_write(vi, data_size);
 		return 0;
 	}
 
-	if (pos + count > ni->initialized_size) {
+	/* Re-read to avoid race after possible truncate */
+	read_lock_irqsave(&ni->size_lock, flags);
+	initialized_size = ni->initialized_size;
+	read_unlock_irqrestore(&ni->size_lock, flags);
+
+	if (new_initialized_size > initialized_size) {
 		ctx->attr->data.non_resident.initialized_size = cpu_to_le64(pos + count);
 		mark_mft_record_dirty(ctx->ntfs_ino);
+
+		write_lock_irqsave(&ni->size_lock, flags);
 		ni->initialized_size = pos + count;
-		if (i_size_read(vi) < ni->initialized_size)
-			i_size_write(vi, ni->initialized_size);
+		write_unlock_irqrestore(&ni->size_lock, flags);
+
+		if (i_size_read(vi) < new_initialized_size)
+			i_size_write(vi, new_initialized_size);
 	}
 	return 0;
 }
-- 
2.25.1

