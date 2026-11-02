Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605096;
	b=ZbsIEZ3o9rMq1kMLC/EDZRS3WqNjP8JyvyOoPaSWGtEMOElgzx9uqQwEAaX8z//yV6gk
	 v+Zh1XubjTN1JzdccgDXrJF7iC7UUdTVAf2BtZ2fE6OBuuAzLYYv5PKYCC3ISKa7nWRc+
	 B1WB/Pirty1FsJlnTFJYvbCHjKlJ2k8PK5IDtuMTIGfaIkq52S+iVzJ58D5V7qAg3NmFb
	 4Ht1W48uwoa58rBry6J4Q14JIFvXDv/gPvAuVVRvhKbCqAN67sobUUHHJTpXDqTHfi5hd
	 6e+LT9WE5C22wfR4AOReCfNr6ZdVEk0p6dRlv9N1unjJj77fut8DmHRNsIdGclQvr4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605096;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=nWTYVyTaCw6s5Ex8WmhedUL3I1XHwqQDSjVn5dV6lLw=;
	b=oiFkqCYyTUKqlRJ6RCp71XVXOswbGYIDXWSx/zSXYtyev3Cae9JrU4a9kLTDNKXRWYr/
	 u5fG8gyh0L/H2OLiEe6knOdaPJ5mE28ANR7R3ILDx1RiK5GpwN/E0tX4aq6oxXJDqMXA1
	 ASHDt/dTNHeN9WV+7pG+36OIQWJi/6K8CuYZTYYbO2G+HXWUF278/yz00rF13x64qIW5S
	 A/WLF0Qw8R+AdmurwS8jmX5lPoxSRD2xne0xpZRz0dFdaI2KsSwcXT2l9mqmrJAl1tLOn
	 Ch3c+kfBkR6CvMg6sew1V3rKSF/izESTMoKyjbsXh/Nj14+vjk4Whtug4InsthMaeMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=VZlvBKBi;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FFF606A32C
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93FFF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=VZlvBKBi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=nW
	TYVyTaCw6s5Ex8WmhedUL3I1XHwqQDSjVn5dV6lLw=; b=VZlvBKBi8AT9NYgfNF
	KlrCg9EPKjGygKikQaRO70CqK4MFwN6YljfEKfl0THGWfWsa8Le+UfrAG2LP82Lf
	/S+9RdgOs/aBV1vQ8sODOdZXMqYTMdP6x0t7WBqeeaggbyT4PyGBuKQL06oggy3H
	pRFih3UbuRzQiQAUULvyIbCl4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3N9rIPehqahKgEw--.3981S5;
	Mon, 02 Nov 2026 15:37:46 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>
Subject: [PATCH v5 19/31] ntfs: report index validation and block I/O errors
Date: Mon,  2 Nov 2026 15:35:20 +0800
Message-Id: <20261102073532.98873-20-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3N9rIPehqahKgEw--.3981S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3try7tFyxtF4ftw18Kw18AFb_yoWkCF1rpF
	nxGwn2ka1UtrySvrnayF98Xr1a9ws7Kr4DtrWUJa1xZa4Skw1jyF1jyr1a9ryfKrWkAry3
	XF4jqrWUur1UXrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxTmhUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC8ApWP2roPcrkaQAA3r

From: Dandan Wu <wudandan@kylinos.cn>

Index validation and block I/O can detect corrupt entries, MST
failures and short reads without reporting them. Use EFSCORRUPTED for
corruption and report failures against the index owner.

Preserve block-read errors through index lookup and update its handling
of corrupt search results. Keep underlying I/O errors distinct and
normalize short index-block writes to EIO.

Report locally detected block corruption at the common exit, without
repeating corruption already reported by the attribute-read path.

Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
Validation:
- Thirty combined index/bitmap cases exercise the real attribute reader
  with the index-block wrapper and bitmap modifier. This set also covers
  patch 22.
- Propagated EUCLEAN is reported once on index reads; short reads, invalid
  positions, MST failures and local block corruption still report.
- All pass in an extracted-source userspace harness with controlled
  dependencies under ASan/UBSan; checks cover reporting calls.

 fs/ntfs/index.c | 113 +++++++++++++++++++++++++++++-------------------
 1 file changed, 69 insertions(+), 44 deletions(-)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index e719d3afcfb0..cd9f31da5189 100644
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
@@ -104,8 +104,10 @@ static int ntfs_ib_write(struct ntfs_index_context *icx, struct index_block *ib)
 	ntfs_debug("vcn: %lld\n", vcn);
 
 	ret = pre_write_mst_fixup((struct ntfs_record *)ib, icx->block_size);
-	if (ret)
-		return -EIO;
+	if (ret) {
+		ret = -EFSCORRUPTED;
+		goto out;
+	}
 
 	ret = ntfs_inode_attr_pwrite(VFS_I(icx->ia_ni),
 			ntfs_ib_vcn_to_pos(icx, vcn), icx->block_size,
@@ -115,12 +117,18 @@ static int ntfs_ib_write(struct ntfs_index_context *icx, struct index_block *ib)
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
@@ -285,7 +293,7 @@ static int ntfs_index_header_inconsistent(struct ntfs_volume *vol,
 		ntfs_error(vol->sb,
 			   "index block in inode %llu is smaller than an index header.",
 			   (unsigned long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	entries_offset = le32_to_cpu(ih->entries_offset);
@@ -297,28 +305,28 @@ static int ntfs_index_header_inconsistent(struct ntfs_volume *vol,
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
@@ -338,25 +346,25 @@ int ntfs_index_entries_inconsistent(const struct ntfs_volume *vol,
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
@@ -504,7 +512,7 @@ static u32 ntfs_ib_canonical_entries_offset(u32 block_size)
  * The size of block is assumed to have been checked to be what is
  * defined in the index root.
  *
- * Returns 0 if no error was found, -EIO otherwise
+ * Returns 0 if no error was found, -EFSCORRUPTED otherwise
  *
  * |<--->|  offsetof(struct index_block, index)
  * |     |<--->|  sizeof(struct index_header)
@@ -533,7 +541,7 @@ int ntfs_index_block_inconsistent(struct ntfs_volume *vol,
 	if (!ntfs_is_indx_record(ib->magic)) {
 		ntfs_error(sb, "Corrupt index block signature: vcn %lld inode %llu\n",
 			   vcn, (unsigned long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	if (le64_to_cpu(ib->index_block_vcn) != vcn) {
@@ -541,21 +549,21 @@ int ntfs_index_block_inconsistent(struct ntfs_volume *vol,
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
@@ -563,11 +571,10 @@ int ntfs_index_block_inconsistent(struct ntfs_volume *vol,
 			   "Index block: entries offset %u is below the minimum for a %u-byte block: vcn %lld inode %llu\n",
 			   le32_to_cpu(ib->index.entries_offset), block_size,
 			   vcn, inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
-
 	if (ntfs_index_entries_inconsistent(vol, &ib->index, cr, inum))
-		return -EIO;
+		return -EFSCORRUPTED;
 	return 0;
 }
 
@@ -580,7 +587,7 @@ int ntfs_index_root_inconsistent(struct ntfs_volume *vol,
 	if (value_length < offsetof(struct index_root, index)) {
 		ntfs_error(vol->sb, "$INDEX_ROOT in inode %llu is too small.",
 			   (unsigned long long)inum);
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	return ntfs_index_header_inconsistent(vol, &ir->index,
@@ -686,7 +693,7 @@ static int ntfs_ie_lookup(const void *key, const u32 key_len,
 			ntfs_error(icx->idx_ni->vol->sb,
 					"Index entry out of bounds in inode %llu.\n",
 					(unsigned long long)icx->idx_ni->mft_no);
-			return -ERANGE;
+			goto corrupt;
 		}
 
 		/*
@@ -705,7 +712,7 @@ static int ntfs_ie_lookup(const void *key, const u32 key_len,
 		if (rc == -EINVAL) {
 			ntfs_error(icx->idx_ni->vol->sb,
 				"Collation error. Perhaps a filename contains invalid characters?\n");
-			return -ERANGE;
+			goto corrupt;
 		}
 		/*
 		 * If @key collates before the key of the current entry, there
@@ -739,13 +746,17 @@ static int ntfs_ie_lookup(const void *key, const u32 key_len,
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
@@ -765,6 +776,7 @@ struct ntfs_inode *ntfs_ia_open(struct ntfs_index_context *icx, struct ntfs_inod
 
 static int ntfs_ib_read(struct ntfs_index_context *icx, s64 vcn, struct index_block *dst)
 {
+	int report_err = 0;
 	s64 pos, ret;
 
 	ntfs_debug("vcn: %lld\n", vcn);
@@ -773,20 +785,31 @@ static int ntfs_ib_read(struct ntfs_index_context *icx, s64 vcn, struct index_bl
 
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
@@ -803,8 +826,10 @@ static int ntfs_icx_parent_dec(struct ntfs_index_context *icx)
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
@@ -886,7 +911,7 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 
 	old_vcn = VCN_INDEX_ROOT_PARENT;
 	err = ntfs_ie_lookup(key, key_len, icx, &ir->index, &vcn, &ie);
-	if (err == -ERANGE || err == -EINVAL)
+	if (err == -EFSCORRUPTED)
 		goto err_out;
 
 	icx->ir = ir;
@@ -911,21 +936,19 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 
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
@@ -935,6 +958,8 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 	}
 
 	if ((ib->index.flags & NODE_MASK) == LEAF_NODE) {
+		err = -EFSCORRUPTED;
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
 		ntfs_error(icx->idx_ni->vol->sb,
 			"Index entry with child node found in a leaf node in inode 0x%llx.\n",
 			(unsigned long long)ni->mft_no);

