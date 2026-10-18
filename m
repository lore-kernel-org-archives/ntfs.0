Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D74143E9C6
	for <ntfs@lists.linux.dev>; Sun, 18 Oct 2026 11:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324676; cv=none; b=GTBA5bJGqpWq6IlhgyhewxlbXwPPX7UOd4j3CjvQKpXogQTUVZSEb+o5lDCfGUh1Nn06RfN75Ht4qQhnO9kRjaCaui9ooV/HnxlGcFw8AnbMNiZYzPHujYXecOxivl7ik0wsyQ/H++MFVnbD9mMrLsUHDr+cptSmS7bmpXNggZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324676; c=relaxed/simple;
	bh=l93wSqUZc6owvPY9dYVRDKO1zoAk1+G/ahycBSFGP08=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:MIME-Version:Date; b=LD4GxDP+j0/gpciW5AU46J171HTtsQgMSKN+BQ5zucl3BtwnmxGPOxWx/iMKFtfD10xcy78mLGPfFijUu/OmZHJyX4PFWKThByFlJqFTOXBKuZli+eDBMH8hl9kbn6MMf+Lsfph4bgJabb+2bxForjFTIJVKNT4BXXrmWykizSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Z6+Jjoyj; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Z6+Jjoyj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792324662; bh=jlgM9t4x/blYgNq+CyK6/sg/R25vooLyEICRkpeirUY=;
	h=From:To:Cc:Subject:Date;
	b=Z6+JjoyjcVJf+bMS1z06b7NrgscWnqRhNxeI7VqoqzA39YdElozw5Y+Svl9CfDWBT
	 DcjD5DX6AlC4EBmZDGVhYUmlPrv8gBSLnUoTbMWjhoQOod72k+T7a0Y8orIvhpQEGy
	 kGqZ0I8mh5ZX1D4Eu+KOFYF3TpvathYiL/10PEWo=
Received: from [127.0.0.1] ([2409:8d5c:c30:3b3:3d39:a6e9:e5bc:61cf])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id E6813C26; Sun, 18 Oct 2026 19:57:40 +0800
X-QQ-mid: xmsmtpt1792324660tdmh880hz
Message-ID: <tencent_68D8DB4B110F3D9921617E29A7A7967D5C0A@qq.com>
X-QQ-XMAILINFO: Me8mHstNM5a8yrpmdXiiEnYYYG0y39chhp5ksD8C7wazUWy6cLJmzumHZZUkg7
	 iq2bL33Oi9wcb5g3mVBA45EtWifOhz8KJ7M30sG0s4qzTSP9ZlFPDuyGu69vvG2x2fIVSydDTfy1
	 l99Cp+peddTwEu7KuGCt92ee8j7G5cwwTPSzlYaMtaDO2+F5aX9MhCo03gmNsfh2jcWKr5OQHvyB
	 R1VtqX4sB5w0zLv+0dCe/GCyTDGz/lhFA3p1rTmzHmRrR5oG3CBRMui5S4fQn08FnP1XL4364hm+
	 cfBaHlILZALxorO186bud8QsL1h3SqaIb0T7XudY+JxNki7rZuWxkPmDm5j4Cek3UzYbn0zqNNJo
	 rlnWIkugWM47DD/vrDdDQ5CeiGA4I5GiFsVVoXNqakMw/P010nqc5nRFf52lNx3Dfaj68iFjfQHD
	 V5cPaBC/22v2Wyv/An1vTvaM9YyGVYddy7Yj5ny7nvDjM5gBIhuLY1tNBTzfs0rSKZkA5eroCic6
	 6r4aQY1tsniVxOZL25yQlg7OMIdXBWzYTHWcnrNVvqQlHkQbvkWj+934aa3soJmy9PsDRaer45J+
	 yziUj0CGsn85G52jVAkWAUGuQXmSPx9hfCIbbJpvmpqaS6aA/CQp9tusrXMN+ozhSMDIXxBvjfeT
	 73HdTklqpms/FqeIdYxrD6mKqAUWy8o8yR+HlF5hOK19mSNcQL/frsqRD7GdRups547W5CXMk8pV
	 MZwHY+WoyOkpyCCAvA2jcko40L9A5/+BG/1Da6bHJvf8sXpOkdtdNLjkr1GH0SkWlVkX+oGenwZq
	 LbASjQugAceoKuDETltLczOn110mcK7TONW+DH5wu+B2DI/09qjz4wLLR3qFgSFCQo+3UGlbGA2K
	 te1gJUZcKMBi5FtZOAdSlMB8p3rkq/quEN3lgQLDOX/cEH7E8vxI14iFLa6/Ybz6i9vsU1CTjnpt
	 Fkvzc2Clt5Uq3RD2JEsCyMMqSyqYzNs19PSvvr6boSiCQki0CPtwtx07hCPBOb+pl6LFIRaRi7M1
	 UYmaB1BP7HU5mmrX+FeaDK6GYn74WHISQnPkwveNm5d+j8Pcc/gL29OtvZgzrPd8mlSGC7Cw7h/G
	 6RTlyruUdAKrKQK6Xc+JtWPcAKXA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Hang Nan <2122295973@qq.com>
To: liubaolin12138@163.com, linkinjeon@kernel.org, hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, security@kernel.org
Subject: Re: [PATCH] ntfs: check index block capacity in ntfs_ib_copy_tail()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Precedence: bulk
Date: Sun, 18 Oct 2026 11:57:39 +0000
X-OQ-MSGID: <1ecb8e14ea35496cb4472b135a6d7958@qq.com>
X-Mailer: git send-email style plain-text report

Hi Baolin,

My mistake - the tag was in v1 and I dropped it when I rewrote the commit
message for v2.  Restored in v5, right above Signed-off-by:

  Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")

While re-running checkpatch in a tree that actually has the history (the
local patch branch only has a handful of commits, so it cannot resolve any
of these ids), it flagged one more thing: the sibling reference has to be
written as "commit <sha> (\"title\")".  That is fixed as well, so
checkpatch --strict is now clean with the history present.

The code is unchanged since v2 (diff is byte-identical), so the earlier run
still applies.

Thanks,
Hang

--- 8< ---
Subject: [PATCH v5] ntfs: check index block capacity in ntfs_ib_copy_tail()

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
VCN.  The sibling conversion path, ntfs_ir_to_ib(), got the equivalent
check in commit dc09bf79b76f ("ntfs: Fix index_root heap OOB write in
ntfs_ir_to_ib()"); this copy site was missed.

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Signed-off-by: Hang Nan <2122295973@qq.com>
---
v5:
 - restore the Fixes: tag that was dropped when the commit message was
   rewritten (review), and use the "commit <sha> (\"...\")" form for the
   sibling reference so that checkpatch --strict passes.

v4:
 - correct the root cause: the overflow comes from the source and the
   destination having different entries_offset values, not from space
   reserved for the terminating entry (review).

v3:
 - drop the code excerpt from the commit message and describe the size
   mismatch in words.

v2:
 - pass icx->idx_ni->vol->sb to ntfs_error() so that the mount's errors=
   policy applies and the message is prefixed with "(device %s)".
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

