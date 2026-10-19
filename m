Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792425300;
	b=B/u357qxGYtgKlecTglh+CRVYT0TXX1icNrmUTFmTHmfAmfuplNr0v6wCicvIsma5ZfA
	 ycwYidsn8wp3oIU0qD75lYLzSUH/733HbPK/V1L3DxLOFzUvS7nLKB73QEhtiCyhurQh6
	 /14NRIHBXCLD/4UAcj4v/0sI5Qvg2XnFobcKYzgs3/mjG8P0OrguerdnUdxzpwiXpqNcw
	 oJYWItSMw2TF9snQMfSYYE8hP1iJKATYvTVhGxJmSWwSlJF7AiF+ljpyem4ehwH75jTaB
	 qQzV+1BTB90sL1rCts5JyfNSCm8djRz2dxe7uNj+WMXR0m02GF9+LDU/spiOzG78N+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425300;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=N+vtEGM/j8yUiYWQYDKqPwwZxk6KGQffAyV27Dhw6lU=;
	b=w6iyxZ7mzdSHFuEM592BdrpyQHHQW8Ex//vwNkgk4Q7YhX5kE5wVSAQEY/K8HiFa+DW0
	 CWYPu3kD2eQgrCGbrbZSNV+1SodQpi1TmSuutrem2vcEN5d9ZLciQkfDe6ACJg2N7e5FK
	 V+uwLdjcVKFmoL3mxw3aECT2Q2yR4nqSbKbZglJkZpRNK9UCgHrSztce/U+JTcfCXOJ9F
	 lMpbeWbfGFWx2QIQXagoo7HajpakRatyrchfnwc+73x+LB15GI6WwaLWAiQALk8ssDR+m
	 S97DAwM87QaCwa3J5o7PQrKarEXBkQG8H2VSFP2+0P7/3eclkJGXfH3wb0YSTpyKFSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ckNOQOl+;
	arc=none smtp.remote-ip=162.62.57.87
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A06606DA65
	for <ntfs@lists.linux.dev>; Mon, 19 Oct 2026 15:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A06606DA65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ckNOQOl+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792425283; bh=N+vtEGM/j8yUiYWQYDKqPwwZxk6KGQffAyV27Dhw6lU=;
	h=From:To:Cc:Subject:Date;
	b=ckNOQOl+toccNDiQuPr/NUPDBESiPbxJYmvNmGxa/igi6dOTfSs7ORil0OAbSiVH+
	 o/NQPuFrV0OH+ZoRV2+2xuerEntTcITD9MEoFjw4/fShz4KPwGOSHTmclYsu7mD7lZ
	 GwULTBot5gsvbVEJEX1lXaMV/EvnKlHyv7FgPB+s=
Received: from localhost.localdomain ([2409:8d5c:c30:3b3:b0a0:db46:6df2:867d])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id DA823AAC; Mon, 19 Oct 2026 23:54:40 +0800
X-QQ-mid: xmsmtpt1792425280t928rmq3g
Message-ID: <tencent_17B0FD18F1E99339D2CC57497A4419F98506@qq.com>
X-QQ-XMAILINFO: OD8Oy9jBXVxFBLaNweU9tknVSGw+Vasoc6fWx+XAZexhsiKC6KC5YYxBJKjfvt
	 0fIG3hou55GERGN1hd3zWR2W47MOZnPh2Yrv0XBS4HBB0L1BmGyDF6ziPpRmqWiSis54BqwVWCpk
	 qau28VEFp1mCDBfIauC7yvpQ48gLYKqq//jWCkZ7GgfrRZZMYI4cgjcZ2K6M6hE6ZXGo/T2sRUqb
	 fiSTByoZIcgY7zhHacf7yoTzdLwZC/0LQIFb4FgTwmp70yCLZfnHWZA6jSP3v/cVB7H8Zoo1WFfa
	 v13KsIFJ9IrZKxoUszx/uAQ+2vOQ7e/lMZMaI6hC6cluqVHRSeccICvqmBGwWdTd/maCm+D43bzZ
	 bW71g32uyb4og8+YqbAtF/ypKdg+IqnkbQQ0+2tOsIrcN7RX6VHICBI/KZn03E5iNwmOLrCKTODX
	 SLvvWArEQPdCYK7mXbsz5aFQn7m85JTbf+E02d3KewSyzJJJeQDar5lHO2LauSGqsDAYNod8n0CH
	 Hatx4EjAo+B1UVyRyiFUzcILtgiKM0/H5k8nEmHItH3aIxdgbuOmC2kip9f60xMEMqQxHfP6nT2P
	 DY4otlOHeqxslWtlmoCjvMdKGPjHqUBOFnFMBspMufGoU6Ocmk0pCMtus4qDUxZcIh54V+3VyUdG
	 xVBMX5a8FHKdLNH0BZOy8jDn23NK7FgzWAqFEnWfKf2/NENLBf4no14aYPuHeoPIZZMtRMy78+b9
	 8e5GRBMkT3MhPA9TrI6jl7adcN/O6u49cZgzJSukE9QF2+4c5RG+6zlA497Ebzs0yelcQU90kzZu
	 DuTf429yDy631JAEEASOEdGj9zIT13gd6Qh4rt8X2UnfOtBl0uf7fLYOC9VJJSCN8OUaNIP6yKFJ
	 l43EMPWCeBXHnbAutJ8sH6RUPsD5UwX5btgFUsxJ2GNdciH0IxkXNXbVTmhc5zU/NGRg7JHvFJtl
	 pQRKnBfU1l7fYw4+ruYMJRL40WLEfFogmAX3GQechpJdZDbvuJHgcIpx7F5ei66BbtuCdf9jU4Wg
	 2QvHtaj83wRuOBB1RaEkSBSGOP5Sebm0dGJ8F7RYKSJtEt6RltzTTklcW0g4s=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Hang Nan <2122295973@qq.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	security@kernel.org
Subject: [PATCH v4] ntfs: reject index blocks with a too small entries offset
Date: Mon, 19 Oct 2026 23:54:39 +0800
X-OQ-MSGID: <20261019155439.146528-1-2122295973@qq.com>
X-Mailer: git-send-email 2.47.3
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

Index blocks read from the volume are checked for a plausible header, but
nothing keeps a block from placing its entries closer to the header than
ntfs_ib_alloc() does when it creates one.  The allocation adds the update
sequence array, one entry per 512-byte sector plus the terminator, to the
index header and aligns the result to 8 bytes, so the first entry of a
4096-byte block starts at offset 40, while a corrupt block may declare 16.

ntfs_ib_copy_tail() then copies the entries that follow the median entry
from the source block into a freshly allocated destination.  The tail is
sized as index_length minus entries_offset and the median entry, both from
the source, while the destination only has allocated_size minus the
canonical offset of room.  With the values above the tail is 4040 bytes
and the destination holds 4032, so the last 8 bytes are written past the
end of the new allocation, with contents taken from the mounted image.

Reject such a block when it is read: entries_offset must not be smaller
than the canonical offset for the block size.  Derive it from block_size
rather than from the block's own usa_count, which post_read_mst_fixup()
treats as "not protected" when it does not match the block size, and use
the same helper in ntfs_ib_alloc() so both stay in sync.

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Signed-off-by: Hang Nan <2122295973@qq.com>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
---
v4:
 - validate the entries offset when the block is read, as suggested by
   Hyunchul, instead of checking the destination capacity before the copy.

Testing: with slub_debug=zf and an image whose 4096-byte index block
declares entries_offset 16, the split now fails when that block is read
(ntfs_index_block_inconsistent(): entries offset 16 is below the minimum
for a 4096-byte block), creat() returns -EIO and no redzone report
appears.  An unmodified image of the same volume still mounts and accepts
new files.
---
 fs/ntfs/index.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 580998990..1e296afaf 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -489,6 +489,22 @@ static struct index_entry *ntfs_ie_dup_novcn(struct index_entry *ie)
 	return dup;
 }
 
+/*
+ * Canonical offset of the first index entry of an index block: the index
+ * header, the update sequence array (one entry per 512-byte sector plus the
+ * terminator) and the padding up to 8 bytes.  ntfs_ib_alloc() lays out new
+ * blocks exactly like this, so a block read from disk must not put its
+ * entries closer to the header: ntfs_ib_copy_tail() sizes the tail it copies
+ * from the source block, while the destination only has allocated_size minus
+ * this offset bytes of room.
+ */
+static u32 ntfs_ib_canonical_entries_offset(u32 block_size)
+{
+	u32 usa_count = block_size / NTFS_BLOCK_SIZE + 1;
+
+	return (sizeof(struct index_header) + usa_count * 2 + 7) & ~7;
+}
+
 /*
  * Check the consistency of an index block
  *
@@ -548,6 +564,16 @@ int ntfs_index_block_inconsistent(struct ntfs_volume *vol,
 					   offsetof(struct index_block, index),
 					   inum))
 		return -EIO;
+
+	if (le32_to_cpu(ib->index.entries_offset) <
+	    ntfs_ib_canonical_entries_offset(block_size)) {
+		ntfs_error(sb,
+			   "Index block: entries offset %u is below the minimum for a %u-byte block: vcn %lld inode %llu\n",
+			   le32_to_cpu(ib->index.entries_offset), block_size,
+			   vcn, inum);
+		return -EIO;
+	}
+
 	if (ntfs_index_entries_inconsistent(vol, &ib->index, cr, inum))
 		return -EIO;
 	return 0;
@@ -957,8 +983,8 @@ static struct index_block *ntfs_ib_alloc(s64 ib_vcn, u32 ib_size,
 	*(__le16 *)((char *)ib + le16_to_cpu(ib->usa_ofs)) = cpu_to_le16(1);
 	ib->lsn = 0;
 	ib->index_block_vcn = cpu_to_le64(ib_vcn);
-	ib->index.entries_offset = cpu_to_le32((ih_size +
-				le16_to_cpu(ib->usa_count) * 2 + 7) & ~7);
+	ib->index.entries_offset =
+		cpu_to_le32(ntfs_ib_canonical_entries_offset(ib_size));
 	ib->index.index_length = 0;
 	ib->index.allocated_size = cpu_to_le32(ib_size -
 			(sizeof(struct index_block) - ih_size));
-- 
2.47.3

