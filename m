Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98271375F96
	for <ntfs@lists.linux.dev>; Sun, 18 Oct 2026 11:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324763; cv=none; b=iYrdF+O+3cQBjpmJ7432hbzt2mjb2BwXH3SDbRAR5r0jgxYJvyqr6ppumZzkQ6KpMaLGvwoUNnrXRLa87+xITIYnfiisbC1ufbLoNGvKHeHgbIKGAa8W9HSIe/8NbmNnMZpfcX3QuBoSO9xRR7Q8dhnkaTY3TYnzBD6fcfvJgnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324763; c=relaxed/simple;
	bh=x4I89/l22fEIViargU21gbEZXFEQSf7GhMaTsHIbJEI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=pkGRDPiuZYZzDOqOV2jkrN7+vOvrTVtDs1U+wuHSEjIX4kPE9Pg6r6MMTzwy7bvtaYJBDdf49zb3acC+MkkLZu8qFKWKZexoEzaTfyvQkTS2AfSSFPz1zRVGAgXgulK6M2M2F9e69cNireIJMCOYyrhMBbiCBNm8m1BT6xSFk5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=W6udkLcv; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="W6udkLcv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792324756; bh=HXzRKflA0zSUsciPS8bP/o6SiApnbWrLEqI7BKcMn6U=;
	h=From:To:Cc:Subject:Date;
	b=W6udkLcvcnUYQE2ME9krY2edENTnaxo4pKOW8A7FjmdxmRHfBM5vwHdQKxmv2yQVL
	 8i/oKNhct26otV5Zas3WdIHJ77lrcNzXdHR5G9DVFk/1k6i4XrIBz8x46MfjBaJ3mw
	 vlohSkMuYnYhxv8Jqqe87mQHhQrGCMJGHV62DWC8=
Received: from localhost.localdomain ([2409:8d5c:c30:3b3:3d39:a6e9:e5bc:61cf])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id ECD11638; Sun, 18 Oct 2026 19:59:13 +0800
X-QQ-mid: xmsmtpt1792324753t73fq8kju
Message-ID: <tencent_AC559EC491E8BEF6D2D9CBD02E00EC518809@qq.com>
X-QQ-XMAILINFO: NC4p7XQIBeahtHKwu2+OBlEjs4IZG4oec53LbPaztELBr6PS5dswhtO5ylU6nZ
	 cTiocEh1DbM/WwByhUQQuP8KDCVkEV/+hvfvt2B+0wn4NlnnmXplfxjcbe4va0Udqz3HSMnbLure
	 Nm9VLRZ54YYU5e+Lmww94WUPL704Cu569Qrg+8BSB4B1eKcLWKjkYKyDGJICZpZ7FWP3W/VEXco8
	 3IKW1PG7W114/IxFd/4H3jb3gHoeTlPBhbZxz4BOVxbxPbWiEMa86f6UpM1aUzhwkjilJ7gB6rKm
	 0kbXwJwmuRZb40kCiPa1f+qeu1GgWFXzAAa9YClcJqWDimTHUAMxWfQ0xtyu5of1K5+RyHycKdmz
	 dzbZC2n7Y7w8xH0kRY+IQ+DcGIgM7EoDTLzJJA4ex3dryKRfk9bjwvgP71e2d6f1YRU3jGHgPwce
	 7+odF6VQSBCPVOSaCkz5ceG7CkWabBQQz+QkZgebRv/0tLu4OpqoThAGcHWuOfriEWPcJGlyGuLT
	 KjhQjYx9+tvufTXblhQvogEtv+Tpo1tDEI+RPk+nRkJOiLC7tznfo2Xi/kExqf3OhpqPV6ni1Tj7
	 6P8WvFckm3H0jPnFKbxjtC9LG9Ckm2/Vs2OcrahbSf7C6uaZpzUbiX5FLYuOZW6+eHBcU8ylZYlG
	 zbBmj4U0ApzUuDbd68s7aEWxF3lDRTjJqStzDs4BIRypEjoYxvLyKHTb/aOerymur1Cg8At8F7Zs
	 CfktDmQ8BojxPK7MisGpSyQ4FSSDHQP+43AUqjtKhr5zD28nFZnX/6PJuh4/EJOhMm689Q6qM+D7
	 dQPiwTQ3GMPDRWj6ex9buop2W0gaDsAKnLJVNtdDuCrqeFD+YUkPcb6JV8gzdYgmFfKW02vfyoUi
	 KBt2w3j5Y04xIJg7EuUN9Y8DKvtRAWtAEX7UId9mL0nUB6VPxB2VvSzKyLUQHh1iSlVvgm6TFNcg
	 Nbvh1L5HwHUBeZ8RbqfdrXjJ39gLBWEApyFqlvJVSBD2i6MbheHX6hG2SP6lOb0kXA9kwIZlydOC
	 tluMD+MhV6GIY8j5l+ecs4l+cnMvEFmImrUrCjzm+rv2Tm1JBSpc9qHXcfA6Q=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: "Hang Nan" <2122295973@qq.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	security@kernel.org
Subject: [PATCH v3] ntfs: check index block capacity in ntfs_ib_copy_tail()
Date: Sun, 18 Oct 2026 19:59:12 +0800
X-OQ-MSGID: <20261018115912.200911-1-2122295973@qq.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hang Nan <2122295973@qq.com>

When an index block has to be split, ntfs_ib_copy_tail() moves every
entry that follows the median entry into a freshly allocated block.  The
number of bytes to move is computed from the source block's on-disk
header alone: it is the distance from the first entry after the median
to the end of the source block's entry area, so both entries_offset and
index_length are taken from a block that comes from the mounted image.

The destination is set up by ntfs_ib_alloc(): its entry area starts
after the index header, the update sequence array and the padding, which
for a 4096-byte block puts it at offset 40, and its usable capacity is
allocated_size minus that entries_offset.  A source block can declare a
smaller entries_offset than that, so the tail computed from it can be
larger than the destination can hold - 4040 against 4032 bytes in the
case at hand - and the copy writes the surplus past the end of the new
allocation, with values taken from the image.

Reject such a split before the copy and fail it with -EIO, which
ntfs_ib_split() already propagates after freeing the newly allocated
VCN. The sibling conversion path, ntfs_ir_to_ib(), got the equivalent
check in commit dc09bf79b76f ("ntfs: Fix index_root heap OOB write in
ntfs_ir_to_ib()"); this copy site was missed.

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Signed-off-by: Hang Nan <2122295973@qq.com>
---
v3:
 - describe the size mismatch in words instead of quoting the code from
   the function.
 - correct the root cause: the overflow comes from the source and the
   destination block having different entries_offset values, not from
   space reserved for the terminating entry.
 - restore the Fixes: tag.

Testing: on v7.3-rc7 with slub_debug=zf and a crafted NTFS image, the
destination object's redzone is overwritten by the last 8 bytes of the
copy before the change; with the change the split is refused, creat()
fails with -EIO and no redzone report appears.  The console logs of both
runs, the image-crafting script and the initramfs are available on
request.
---
 fs/ntfs/index.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 580998990..2c345e32d 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -1200,6 +1200,7 @@ static int ntfs_ib_copy_tail(struct ntfs_index_context *icx, struct index_block
 		struct index_entry *median, s64 new_vcn)
 {
 	u8 *ies_end;
+	u32 ib_cap;
 	struct index_entry *ie_head;		/* first entry after the median */
 	int tail_size, ret;
 	struct index_block *dst;
@@ -1215,6 +1216,17 @@ static int ntfs_ib_copy_tail(struct ntfs_index_context *icx, struct index_block
 
 	ies_end = (u8 *)ntfs_ie_get_end(&src->index);
 	tail_size = ies_end - (u8 *)ie_head;
+
+	/* Entries must fit in the allocated index block */
+	ib_cap = le32_to_cpu(dst->index.allocated_size) -
+			le32_to_cpu(dst->index.entries_offset);
+	if ((u32)tail_size > ib_cap) {
+		ntfs_error(icx->idx_ni->vol->sb,
+			   "Entries (%d B) exceed IB capacity", tail_size);
+		kvfree(dst);
+		return -EIO;
+	}
+
 	memcpy(ntfs_ie_get_first(&dst->index), ie_head, tail_size);
 
 	dst->index.index_length = cpu_to_le32(tail_size +
-- 
2.47.3

