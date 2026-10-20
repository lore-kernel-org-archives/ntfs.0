Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486012;
	b=QayS1bWs1kpNV5FsVr8tPHsJRg3FTXUwCE7I6m7ogyfe6tNJPo6v/y4sWrcZiCkdoVm0
	 Y5hFWnyoYgiO2KuEhAEacnAkk0n8nHXibMFxd4x0jO2AQee/W3X+xhBtR/mEVyjv9aMv2
	 iBoNpCgv9NkcjmgK5TS8gWGdLKZLYMCnq2s8KvgFpm/n5gPfiuZdNtan61rhZpIT+7ALH
	 z/EOE5mEUkv30yANLeX72opRrc81NdlBDfH1um3ZrZ97c60M1AMpzH+2zo1yL5jBy+u3H
	 cBxu2rmQJCl+2KTly0sPAyqp+bQ/pl6LblNsEdIfjfyo3CR9tYwX/y1XDzVXNxsy+FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486012;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=zDF8/gxwxLGA0F09QyQWNLeE9Zzm2rWLLGXzmLRCVVs=;
	b=TrSq0WtQMLuSZteVBxDz1iw0XMrGDsgaecYsoPMt86I7HUOvtPpq9hKTzdoolPtdfFfg
	 wWldYEM8qCoSVaNcqnJynNl69MXQg08cTUqTn0ei6szkg/QKQESmnr3+IrTIFYPO7WP/J
	 3Sq5M7EOnEjQ0OH2ZNm2W7P6DeeoJY5bUt+hgYeGEk9mlIERvFKrBwaAnRYmudSAkOzCE
	 QTKhsftxWHedjmYaAl/oo0WPcLVZHZJyzJRMcIV/qCpZuDVrt4rMjEYyuw13TAc619oBm
	 8i42tREGYG0Kp1kGtlx28vowUtQmSIW2fGIcXaBOE04UkAaAhbAsads3XKdo7wYinQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aKyxEAYm;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA60606A319
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEA60606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aKyxEAYm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=zD
	F8/gxwxLGA0F09QyQWNLeE9Zzm2rWLLGXzmLRCVVs=; b=aKyxEAYmNx+p6tgnOC
	p/634nGrRkPNBxUa0UCa10P1V6Umyi96PuaAswGobEe9IXwA5X8G+bHifUELv1+P
	STbfZJJBoNgQAC3b8IspYCU2E59cRkxFoWnP/3pIu7faoqjZ+TE/Tj5vIl+7Fco9
	iODqMRlUl4YGPEGbMO86FUUzk=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3X_tvKtdqGocHBg--.23211S5;
	Tue, 20 Oct 2026 16:46:43 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 19/31] ntfs: report index validation and block I/O errors
Date: Tue, 20 Oct 2026 16:44:09 +0800
Message-ID: <20261020084421.2196486-20-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3X_tvKtdqGocHBg--.23211S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3KFW5Xw17AFyUZF47Ww1kuFg_yoWDAFWDpF
	nxG3s2kay5trySvrn3tF9xXw1a9w1xKw4DtrWUJa1xXa4Ikw10yF1jyr1a9ryfKrWkAry3
	JF4jgrWDur4UXwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jmNtxUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RM3AmrXKnNn7QAA3h

From: Dandan Wu <wudandan@kylinos.cn>

Index validation and block I/O can detect corrupt entries, MST
failures and short reads without reporting them. Use EFSCORRUPTED for
corruption and report failures against the index owner.

Preserve block-read errors through index lookup and update its handling
of corrupt search results. Keep underlying I/O errors distinct and
normalize short index-block writes to EIO.

Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
 fs/ntfs/index.c | 99 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 60 insertions(+), 39 deletions(-)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index afb08f0aa596..1adb722f0e7c 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -37,7 +37,7 @@ static int ntfs_index_entry_inconsistent(const struct ntfs_volume *vol,
 	     le16_to_cpu(ie->length))) {
 		ntfs_error(vol->sb, "Overflow from index entry in inode %lld\n",
 				(long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 
 	} else {
 		if (collation_rule == COLLATION_FILE_NAME) {
@@ -47,7 +47,7 @@ static int ntfs_index_entry_inconsistent(const struct ntfs_volume *vol,
 				ntfs_error(vol->sb,
 					"File name overflow from index entry in inode %lld\n",
 					(long long)inum);
-				return -EIO;
+				return -EFSCORRUPTED;
 			}
 		} else {
 			if (ie->data.vi.data_length &&
@@ -57,7 +57,7 @@ static int ntfs_index_entry_inconsistent(const struct ntfs_volume *vol,
 				ntfs_error(vol->sb,
 					"Data overflow from index entry in inode %lld\n",
 					(long long)inum);
-				return -EIO;
+				return -EFSCORRUPTED;
 			}
 		}
 	}
@@ -104,8 +104,11 @@ static int ntfs_ib_write(struct ntfs_index_context *icx, struct index_block *ib)
 	ntfs_debug("vcn: %lld\n", vcn);
 
 	ret = pre_write_mst_fixup((struct ntfs_record *)ib, icx->block_size);
-	if (ret)
-		return -EIO;
+	if (ret) {
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni),
+						-EFSCORRUPTED);
+		return -EFSCORRUPTED;
+	}
 
 	ret = ntfs_inode_attr_pwrite(VFS_I(icx->ia_ni),
 			ntfs_ib_vcn_to_pos(icx, vcn), icx->block_size,
@@ -115,6 +118,9 @@ static int ntfs_ib_write(struct ntfs_index_context *icx, struct index_block *ib)
 	post_write_mst_fixup((struct ntfs_record *)ib);
 
 	if (ret != icx->block_size) {
+		if (ret >= 0)
+			ret = -EIO;
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni), ret);
 		ntfs_debug("Failed to write index block %lld, inode %llu",
 				vcn, (unsigned long long)icx->idx_ni->mft_no);
 		return ret;
@@ -285,7 +291,7 @@ static int ntfs_index_header_inconsistent(struct ntfs_volume *vol,
 		ntfs_error(vol->sb,
 			   "index block in inode %llu is smaller than an index header.",
 			   (unsigned long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	entries_offset = le32_to_cpu(ih->entries_offset);
@@ -297,28 +303,28 @@ static int ntfs_index_header_inconsistent(struct ntfs_volume *vol,
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
@@ -338,25 +344,25 @@ int ntfs_index_entries_inconsistent(const struct ntfs_volume *vol,
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
@@ -496,7 +502,7 @@ static struct index_entry *ntfs_ie_dup_novcn(struct index_entry *ie)
  * The size of block is assumed to have been checked to be what is
  * defined in the index root.
  *
- * Returns 0 if no error was found, -EIO otherwise
+ * Returns 0 if no error was found, -EFSCORRUPTED otherwise
  *
  * |<--->|  offsetof(struct index_block, index)
  * |     |<--->|  sizeof(struct index_header)
@@ -525,7 +531,7 @@ int ntfs_index_block_inconsistent(struct ntfs_volume *vol,
 	if (!ntfs_is_indx_record(ib->magic)) {
 		ntfs_error(sb, "Corrupt index block signature: vcn %lld inode %llu\n",
 			   vcn, (unsigned long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	if (le64_to_cpu(ib->index_block_vcn) != vcn) {
@@ -533,23 +539,23 @@ int ntfs_index_block_inconsistent(struct ntfs_volume *vol,
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
 	if (ntfs_index_entries_inconsistent(vol, &ib->index, cr, inum))
-		return -EIO;
+		return -EFSCORRUPTED;
 	return 0;
 }
 
@@ -562,7 +568,7 @@ int ntfs_index_root_inconsistent(struct ntfs_volume *vol,
 	if (value_length < offsetof(struct index_root, index)) {
 		ntfs_error(vol->sb, "$INDEX_ROOT in inode %llu is too small.",
 			   (unsigned long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	return ntfs_index_header_inconsistent(vol, &ir->index,
@@ -668,7 +674,9 @@ static int ntfs_ie_lookup(const void *key, const u32 key_len,
 			ntfs_error(icx->idx_ni->vol->sb,
 					"Index entry out of bounds in inode %llu.\n",
 					(unsigned long long)icx->idx_ni->mft_no);
-			return -ERANGE;
+			ntfs_report_file_metadata_error(VFS_I(icx->idx_ni),
+							-EFSCORRUPTED);
+			return -EFSCORRUPTED;
 		}
 
 		/*
@@ -687,7 +695,9 @@ static int ntfs_ie_lookup(const void *key, const u32 key_len,
 		if (rc == -EINVAL) {
 			ntfs_error(icx->idx_ni->vol->sb,
 				"Collation error. Perhaps a filename contains invalid characters?\n");
-			return -ERANGE;
+			ntfs_report_file_metadata_error(VFS_I(icx->idx_ni),
+							-EFSCORRUPTED);
+			return -EFSCORRUPTED;
 		}
 		/*
 		 * If @key collates before the key of the current entry, there
@@ -719,9 +729,11 @@ static int ntfs_ie_lookup(const void *key, const u32 key_len,
 	/* Get the starting vcn of the index_block holding the child node. */
 	*vcn = ntfs_ie_get_vcn(ie);
 	if (*vcn < 0) {
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni),
+						-EFSCORRUPTED);
 		ntfs_error(icx->idx_ni->vol->sb, "Negative vcn in inode %llu\n",
 				(unsigned long long)icx->idx_ni->mft_no);
-		return -EINVAL;
+		return -EFSCORRUPTED;
 	}
 
 	ntfs_debug("Parent entry number %d\n", item);
@@ -755,19 +767,26 @@ static int ntfs_ib_read(struct ntfs_index_context *icx, s64 vcn, struct index_bl
 
 	ret = ntfs_inode_attr_pread(VFS_I(icx->ia_ni), pos, icx->block_size, (u8 *)dst);
 	if (ret != icx->block_size) {
+		if (ret >= 0 || ret == -EINVAL)
+			ret = -EFSCORRUPTED;
+		if (ret == -EIO || ret == -EFSCORRUPTED)
+			ntfs_report_file_metadata_error(VFS_I(icx->idx_ni), ret);
 		if (ret == -1)
 			ntfs_error(icx->idx_ni->vol->sb, "Failed to read index block");
 		else
 			ntfs_error(icx->idx_ni->vol->sb,
 				"Failed to read full index block at %lld\n", pos);
-		return -EIO;
+		return ret;
 	}
 
-	post_read_mst_fixup((struct ntfs_record *)((u8 *)dst), icx->block_size);
-	if (ntfs_index_block_inconsistent(icx->idx_ni->vol, dst,
-					  icx->block_size, vcn, icx->cr,
-					  icx->idx_ni->mft_no))
-		return -EIO;
+	ret = post_read_mst_fixup((struct ntfs_record *)dst, icx->block_size);
+	if (ret || ntfs_index_block_inconsistent(icx->idx_ni->vol, dst,
+						 icx->block_size, vcn, icx->cr,
+						 icx->idx_ni->mft_no)) {
+		ntfs_report_file_metadata_error(VFS_I(icx->idx_ni),
+						-EFSCORRUPTED);
+		return -EFSCORRUPTED;
+	}
 	return 0;
 }
 
@@ -785,8 +804,10 @@ static int ntfs_icx_parent_dec(struct ntfs_index_context *icx)
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
@@ -868,7 +889,7 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 
 	old_vcn = VCN_INDEX_ROOT_PARENT;
 	err = ntfs_ie_lookup(key, key_len, icx, &ir->index, &vcn, &ie);
-	if (err == -ERANGE || err == -EINVAL)
+	if (err == -EFSCORRUPTED)
 		goto err_out;
 
 	icx->ir = ir;
@@ -893,21 +914,19 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 
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
@@ -917,6 +936,8 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 	}
 
 	if ((ib->index.flags & NODE_MASK) == LEAF_NODE) {
+		err = -EFSCORRUPTED;
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
 		ntfs_error(icx->idx_ni->vol->sb,
 			"Index entry with child node found in a leaf node in inode 0x%llx.\n",
 			(unsigned long long)ni->mft_no);
-- 
2.51.0

