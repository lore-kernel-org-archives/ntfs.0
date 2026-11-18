Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993054;
	b=IOPz7oWM8iH2tCvEktpozubynVp7G2onvygQkITcpJyKWiFM3DPKJwNkwAiI44sAaKz/
	 o7olNfDKI3T/PbFSHtO8+vG51K2ScmIULpOreBXfROKYm1vvwtBuDaJrmdCSRj2pClB95
	 1sbwLp+xJqltoZKjISsEt+/94FJSszquLIQPjPm3OlZwUf8eeDoojADXst3ohAhIIbn21
	 eTJZY5jbPf83wG4o7RX28uYFZ79k9ZKj5ux9lpUqWQ6ZzTKupzDKDBbuC5U91lHbRwsXI
	 P2ScXe8tXxxkaflG4zJIi/VDGCYZF+yZZRiw5rKZbVRzys8Rr6FjHXPVpZtupWY4paw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993054;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=02LIbFuw/HWS4TexzWx0+oek9+lkTnMXsK6lOglTeCM=;
	b=nvXGeEboOh2nHkRvWvxkiMyEc04CNIM7fdJK4QyPB8aQXRkKs1Twm1dZvujbw5MbbdXk
	 eoCGppPVhXlBRPKERQ00VPm0DaA0MTs3EQd99zFFr6LktpClMSZOuA/8qN5Ij59C14H1c
	 sXqRGpGvApNaUkQeAnFIiUxbpGErQdPaDJxmTKK7LUFUJuYvgML5n95SMs2DaQ4KUgX1P
	 3NvF2TWnNaAet5dNx+QBAbhI906T03njmSSOJJ57xBxHOXfOVm64g6sOlejCSB1VeFLfm
	 ukCCutJC1ksfxsieN6M6ln8cLolBNRsm4RykqKVqNUKbIuEEj3WCDkYpfrJwWZIlCjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aiq9YH6M;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F32606A320
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77F32606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aiq9YH6M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=02
	LIbFuw/HWS4TexzWx0+oek9+lkTnMXsK6lOglTeCM=; b=aiq9YH6MCUDpmMxXIb
	wEmK8PPdLRmlbu/z4Dv8a11QCedbUysdz1hwlkE3w8scHlZN/eldvFJeLiXc/J9n
	FTyQl8Zss+9ABHl9DhAKH64Dx5PT2FwRXX5B8k7rWq0KdC+8B0uJu1Es1BMaPzmh
	iGeCQ19rYwQSLToBNQtziQAd4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3UiuQa_1qEjvuGg--.61000S2;
	Wed, 18 Nov 2026 17:10:41 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 24/37] ntfs: report index validation and block I/O errors
Date: Wed, 18 Nov 2026 17:06:48 +0800
Message-Id: <20261118090701.1858849-25-wangxuewen_ky@163.com>
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
X-CM-TRANSID:PigvCgD3UiuQa_1qEjvuGg--.61000S2
X-Coremail-Antispam: 1Uf129KBjvAXoW3KFW5Xw15Wr4rWry8tw13urg_yoW8JryDAo
	W2vrs0kan3Jw15ua4j9w1aqryUZaykCw4ktw1rJrn7CF9xCa1DG3W7J3WUZay5uw4rKF15
	Zr1xJ3yrJFW8JryDn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUbiiSDUUUU
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzREZAmr9a5EuyAAA3M

From: Dandan Wu <wudandan@kylinos.cn>

Index validation and block I/O can detect corrupt entries, MST
failures and short reads without reporting them. Use EFSCORRUPTED for
corruption and report failures against the index owner.

Preserve block-read errors through index lookup and update its handling
of corrupt search results. Keep underlying I/O errors distinct and
normalize short index-block writes to EIO.

Report locally detected block corruption at the common exit, without
repeating corruption already reported by the attribute-read path.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
Changes in v6:
Use EFSCORRUPTED for the upstream child-VCN validation and missing
required INDEX_ALLOCATION checks.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.

 fs/ntfs/index.c | 125 +++++++++++++++++++++++++++++-------------------
 1 file changed, 77 insertions(+), 48 deletions(-)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 42e15ae2686f..596fece97532 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -39,7 +39,7 @@ static int ntfs_index_entry_inconsistent(const struct ntfs_volume *vol,
 	     le16_to_cpu(ie->length))) {
 		ntfs_error(vol->sb, "Overflow from index entry in inode %lld\n",
 				(long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 
 	} else {
 		if (collation_rule == COLLATION_FILE_NAME) {
@@ -51,7 +51,7 @@ static int ntfs_index_entry_inconsistent(const struct ntfs_volume *vol,
 				ntfs_error(vol->sb,
 					"File name overflow from index entry in inode %lld\n",
 					(long long)inum);
-				return -EIO;
+				return -EFSCORRUPTED;
 			}
 		} else {
 			if (ie->data.vi.data_length &&
@@ -61,7 +61,7 @@ static int ntfs_index_entry_inconsistent(const struct ntfs_volume *vol,
 				ntfs_error(vol->sb,
 					"Data overflow from index entry in inode %lld\n",
 					(long long)inum);
-				return -EIO;
+				return -EFSCORRUPTED;
 			}
 		}
 	}
@@ -110,8 +110,11 @@ static int ntfs_icx_ia_ensure(struct ntfs_index_context *icx)
 			return -EIO;
 	}
 	/* Without $INDEX_ALLOCATION the index inode is an empty resident stub. */
-	if (!NInoNonResident(icx->ia_ni))
-		return -EIO;
+	if (!NInoNonResident(icx->ia_ni)) {
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni),
+						-EFSCORRUPTED);
+		return -EFSCORRUPTED;
+	}
 	return 0;
 }
 
@@ -126,8 +129,10 @@ static int ntfs_ib_write(struct ntfs_index_context *icx, struct index_block *ib)
 		return ret;
 
 	ret = pre_write_mst_fixup((struct ntfs_record *)ib, icx->block_size);
-	if (ret)
-		return -EIO;
+	if (ret) {
+		ret = -EFSCORRUPTED;
+		goto out;
+	}
 
 	ret = ntfs_inode_attr_pwrite(VFS_I(icx->ia_ni),
 			ntfs_ib_vcn_to_pos(icx, vcn), icx->block_size,
@@ -137,12 +142,18 @@ static int ntfs_ib_write(struct ntfs_index_context *icx, struct index_block *ib)
 	post_write_mst_fixup((struct ntfs_record *)ib);
 
 	if (ret != icx->block_size) {
+		if (ret >= 0)
+			ret = -EIO;
 		ntfs_debug("Failed to write index block %lld, inode %llu",
 				vcn, (unsigned long long)icx->idx_ni->mft_no);
-		return ret;
+		goto out;
 	}
 
-	return 0;
+	ret = 0;
+out:
+	if (ret)
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni), ret);
+	return ret;
 }
 
 static int ntfs_icx_ib_write(struct ntfs_index_context *icx)
@@ -288,7 +299,7 @@ static int ntfs_index_entry_vcn_inconsistent(const struct ntfs_volume *vol,
 		ntfs_error(vol->sb,
 			   "Index entry with node flag has no VCN in inode %llu.",
 			   (unsigned long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	vcn = ntfs_ie_get_vcn(ie);
@@ -297,7 +308,7 @@ static int ntfs_index_entry_vcn_inconsistent(const struct ntfs_volume *vol,
 		ntfs_error(vol->sb,
 			   "Invalid index entry VCN %lld in inode %llu.",
 			   vcn, (unsigned long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	return 0;
@@ -333,7 +344,7 @@ static int ntfs_index_header_inconsistent(struct ntfs_volume *vol,
 		ntfs_error(vol->sb,
 			   "index block in inode %llu is smaller than an index header.",
 			   (unsigned long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	entries_offset = le32_to_cpu(ih->entries_offset);
@@ -345,28 +356,28 @@ static int ntfs_index_header_inconsistent(struct ntfs_volume *vol,
 		ntfs_error(vol->sb,
 			   "Invalid index entry offset in inode %llu.",
 			   (unsigned long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	if (index_length <= entries_offset) {
 		ntfs_error(vol->sb,
 			   "No space for index entries in inode %llu.",
 			   (unsigned long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	if (allocated_size < index_length) {
 		ntfs_error(vol->sb,
 			   "Index entries overflow in inode %llu.",
 			   (unsigned long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	if (allocated_size > bytes_available || index_length > bytes_available) {
 		ntfs_error(vol->sb,
 			   "Index entries in inode %llu exceed the available buffer.",
 			   (unsigned long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	return 0;
@@ -389,30 +400,30 @@ int ntfs_index_entries_inconsistent(const struct ntfs_volume *vol,
 			ntfs_error(vol->sb,
 				   "Index entry out of bounds in inode %llu.",
 				   (unsigned long long)inum);
-			return -EIO;
+			return -EFSCORRUPTED;
 		}
 
 		if (le16_to_cpu(ie->length) < sizeof(struct index_entry_header)) {
 			ntfs_error(vol->sb,
 				   "Index entry too small in inode %llu.",
 				   inum);
-			return -EIO;
+			return -EFSCORRUPTED;
 		}
 
 		if ((ie->flags & INDEX_ENTRY_NODE) &&
 		    ntfs_index_entry_vcn_inconsistent(vol, ie,
 						      vcn_size_bits, inum))
-			return -EIO;
+			return -EFSCORRUPTED;
 
 		if (ntfs_ie_end(ie))
 			break;
 
 		if (!ie->key_length)
-			return -EIO;
+			return -EFSCORRUPTED;
 
 		if (ntfs_index_entry_inconsistent(vol, ie,
 						  collation_rule, inum))
-			return -EIO;
+			return -EFSCORRUPTED;
 	}
 
 	return 0;
@@ -560,7 +571,7 @@ static u32 ntfs_ib_canonical_entries_offset(u32 block_size)
  * The size of block is assumed to have been checked to be what is
  * defined in the index root.
  *
- * Returns 0 if no error was found, -EIO otherwise
+ * Returns 0 if no error was found, -EFSCORRUPTED otherwise
  *
  * |<--->|  offsetof(struct index_block, index)
  * |     |<--->|  sizeof(struct index_header)
@@ -589,7 +600,7 @@ int ntfs_index_block_inconsistent(struct ntfs_volume *vol,
 	if (!ntfs_is_indx_record(ib->magic)) {
 		ntfs_error(sb, "Corrupt index block signature: vcn %lld inode %llu\n",
 			   vcn, (unsigned long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	if (le64_to_cpu(ib->index_block_vcn) != vcn) {
@@ -597,21 +608,21 @@ int ntfs_index_block_inconsistent(struct ntfs_volume *vol,
 			"Corrupt index block: s64 (%lld) is different from expected s64 (%lld) in inode %llu\n",
 			(long long)le64_to_cpu(ib->index_block_vcn),
 			vcn, inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	if (ib_size != block_size) {
 		ntfs_error(sb,
 			   "Corrupt index block : s64 (%lld) of inode %llu has a size (%u) differing from the index specified size (%u)\n",
 			   vcn, inum, ib_size, block_size);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	if (ntfs_index_header_inconsistent(vol, &ib->index,
 					   block_size -
 					   offsetof(struct index_block, index),
 					   inum))
-		return -EIO;
+		return -EFSCORRUPTED;
 
 	if (le32_to_cpu(ib->index.entries_offset) <
 	    ntfs_ib_canonical_entries_offset(block_size)) {
@@ -619,12 +630,12 @@ int ntfs_index_block_inconsistent(struct ntfs_volume *vol,
 			   "Index block: entries offset %u is below the minimum for a %u-byte block: vcn %lld inode %llu\n",
 			   le32_to_cpu(ib->index.entries_offset), block_size,
 			   vcn, inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	if (ntfs_index_entries_inconsistent(vol, &ib->index, block_size,
 					    cr, inum))
-		return -EIO;
+		return -EFSCORRUPTED;
 	return 0;
 }
 
@@ -637,7 +648,7 @@ int ntfs_index_root_inconsistent(struct ntfs_volume *vol,
 	if (value_length < offsetof(struct index_root, index)) {
 		ntfs_error(vol->sb, "$INDEX_ROOT in inode %llu is too small.",
 			   (unsigned long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	return ntfs_index_header_inconsistent(vol, &ir->index,
@@ -743,7 +754,7 @@ static int ntfs_ie_lookup(const void *key, const u32 key_len,
 			ntfs_error(icx->idx_ni->vol->sb,
 					"Index entry out of bounds in inode %llu.\n",
 					(unsigned long long)icx->idx_ni->mft_no);
-			return -ERANGE;
+			goto corrupt;
 		}
 
 		/*
@@ -762,7 +773,7 @@ static int ntfs_ie_lookup(const void *key, const u32 key_len,
 		if (rc == -EINVAL) {
 			ntfs_error(icx->idx_ni->vol->sb,
 				"Collation error. Perhaps a filename contains invalid characters?\n");
-			return -ERANGE;
+			goto corrupt;
 		}
 		/*
 		 * If @key collates before the key of the current entry, there
@@ -796,13 +807,17 @@ static int ntfs_ie_lookup(const void *key, const u32 key_len,
 	if (*vcn < 0) {
 		ntfs_error(icx->idx_ni->vol->sb, "Negative vcn in inode %llu\n",
 				(unsigned long long)icx->idx_ni->mft_no);
-		return -EINVAL;
+		goto corrupt;
 	}
 
 	ntfs_debug("Parent entry number %d\n", item);
 	icx->parent_pos[icx->pindex] = item;
 
 	return -EAGAIN;
+
+corrupt:
+	ntfs_report_file_metadata_error(VFS_I(icx->idx_ni), -EFSCORRUPTED);
+	return -EFSCORRUPTED;
 }
 
 struct ntfs_inode *ntfs_ia_open(struct ntfs_index_context *icx, struct ntfs_inode *ni)
@@ -822,6 +837,7 @@ struct ntfs_inode *ntfs_ia_open(struct ntfs_index_context *icx, struct ntfs_inod
 
 static int ntfs_ib_read(struct ntfs_index_context *icx, s64 vcn, struct index_block *dst)
 {
+	int report_err = 0;
 	s64 pos, ret;
 
 	ntfs_debug("vcn: %lld\n", vcn);
@@ -834,20 +850,31 @@ static int ntfs_ib_read(struct ntfs_index_context *icx, s64 vcn, struct index_bl
 
 	ret = ntfs_inode_attr_pread(VFS_I(icx->ia_ni), pos, icx->block_size, (u8 *)dst);
 	if (ret != icx->block_size) {
+		if (ret >= 0 || ret == -EINVAL) {
+			ret = -EFSCORRUPTED;
+			report_err = ret;
+		} else if (ret == -EIO) {
+			report_err = ret;
+		}
 		if (ret == -1)
 			ntfs_error(icx->idx_ni->vol->sb, "Failed to read index block");
 		else
 			ntfs_error(icx->idx_ni->vol->sb,
 				"Failed to read full index block at %lld\n", pos);
-		return -EIO;
+		goto out;
 	}
 
-	post_read_mst_fixup((struct ntfs_record *)((u8 *)dst), icx->block_size);
-	if (ntfs_index_block_inconsistent(icx->idx_ni->vol, dst,
-					  icx->block_size, vcn, icx->cr,
-					  icx->idx_ni->mft_no))
-		return -EIO;
-	return 0;
+	ret = post_read_mst_fixup((struct ntfs_record *)dst, icx->block_size);
+	if (ret || ntfs_index_block_inconsistent(icx->idx_ni->vol, dst,
+						 icx->block_size, vcn, icx->cr,
+						 icx->idx_ni->mft_no)) {
+		ret = -EFSCORRUPTED;
+		report_err = ret;
+	}
+out:
+	if (report_err)
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni), report_err);
+	return ret;
 }
 
 static int ntfs_icx_parent_inc(struct ntfs_index_context *icx)
@@ -864,8 +891,10 @@ static int ntfs_icx_parent_dec(struct ntfs_index_context *icx)
 {
 	icx->pindex--;
 	if (icx->pindex < 0) {
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni),
+						-EFSCORRUPTED);
 		ntfs_error(icx->idx_ni->vol->sb, "Corrupt index pointer (%d)", icx->pindex);
-		return -EINVAL;
+		return -EFSCORRUPTED;
 	}
 	return 0;
 }
@@ -947,7 +976,7 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 
 	old_vcn = VCN_INDEX_ROOT_PARENT;
 	err = ntfs_ie_lookup(key, key_len, icx, &ir->index, &vcn, &ie);
-	if (err == -ERANGE || err == -EINVAL)
+	if (err == -EFSCORRUPTED)
 		goto err_out;
 
 	icx->ir = ir;
@@ -972,21 +1001,19 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 
 descend_into_child_node:
 	icx->parent_vcn[icx->pindex] = old_vcn;
-	if (ntfs_icx_parent_inc(icx)) {
-		err = -EIO;
+	err = ntfs_icx_parent_inc(icx);
+	if (err)
 		goto err_out;
-	}
 	old_vcn = vcn;
 
 	ntfs_debug("Descend into node with s64 %lld.\n", vcn);
 
-	if (ntfs_ib_read(icx, vcn, ib)) {
-		err = -EIO;
+	err = ntfs_ib_read(icx, vcn, ib);
+	if (err)
 		goto err_out;
-	}
 	err = ntfs_ie_lookup(key, key_len, icx, &ib->index, &vcn, &ie);
 	if (err != -EAGAIN) {
-		if (err == -EINVAL || err == -ERANGE)
+		if (err == -EFSCORRUPTED)
 			goto err_out;
 
 		icx->is_in_root = false;
@@ -996,6 +1023,8 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 	}
 
 	if ((ib->index.flags & NODE_MASK) == LEAF_NODE) {
+		err = -EFSCORRUPTED;
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
 		ntfs_error(icx->idx_ni->vol->sb,
 			"Index entry with child node found in a leaf node in inode 0x%llx.\n",
 			(unsigned long long)ni->mft_no);
-- 
2.51.0

