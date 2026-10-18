Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FE03955E3
	for <ntfs@lists.linux.dev>; Sun, 18 Oct 2026 11:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324532; cv=none; b=C+WDvjUO25ssB1a2hNx2c64putI8pmh8wh/ug6zO67QCdL2MFSD8K9yelDDTP0H/KE2FieS+TuP5MJ16GcAOvvceYc09UoEMlJBK1D5/TgjJ9f4TYDut7enwcmBWQowApUjDppu7IubB9KJZXA7tO/1R94IFndsT+nHMPJb1Zyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324532; c=relaxed/simple;
	bh=AkmqaXj70e1Hry2kZYfF3WpbkQUppvCE50QSwM+ILSs=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:MIME-Version:Date; b=FaxcLQttZVW1B8KKfDAmUhIMMo5Zb/9tscdzR+UaJck5+cwKaOhXtKsWfWtT50EGzTN84NVvpowVTzt0kkLuDR8sSuWKCmdh3iy6DC/9Qr3pdMwHpCp6rRU2UKWupgJUDE60ESWlJR5X8ze1e48JrmOIe9pp9NUX1nkBkiRidy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=dsNz+ScP; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="dsNz+ScP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792324524; bh=nFeSvV9V+SdBxig77m8Xi6QfhTqFlAPZO7IeD6ugF7o=;
	h=From:To:Cc:Subject:Date;
	b=dsNz+ScP+veijshD/2q1YyaOzYX0bAHbJu4Et1UG8dNKf/T+P3oMIuLNzzl/URN+Q
	 QhC2NpTlK09CdZ6eIbpVREORqwDf513yZO6RPpT7nwJYGf4C/jAHyXY9YtMfE8F2yg
	 I/AhRHcRM1jlIP/BFG9Cb7xOeH8MpTeQqA4RuFzU=
Received: from [127.0.0.1] ([2409:8d5c:c30:3b3:3d39:a6e9:e5bc:61cf])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id DD69CC63; Sun, 18 Oct 2026 19:55:22 +0800
X-QQ-mid: xmsmtpt1792324522tcch66u5a
Message-ID: <tencent_0FA48B2FA0F4F4B2D58B25FB3FE2C7273907@qq.com>
X-QQ-XMAILINFO: MMvVzQSdFuTp7Xf/fKn9bj4cKJpv7BGb90Y7+Cw6mxEJOh69TbsigWRt3dRvZZ
	 YdTEMacnMyTdxWcl1hsvCxJGKWpVdtSyT+kGew9juZ6oeVd2yewwVC6fejXgT5y1RDC+78waN7Vr
	 NgRrYVYeQx5X+SdjlqL34R9L9m4NDCdQD2MEyWBOOMLRhH4oYS5CVPnbqhu/5U8Jmfr1bJUJVFG/
	 B1wgEDkh8COZ7+sy5gYPhg2OFQZJ/xG4o84n9LyiTngzbBThBXaxrS/rZQjcRCNPqnLu+uwaaQ78
	 0ld74zC7s8DVqjR4fX+4e6vwzzYsyo3G1DGJzEuxyj4lNsnFPfoXHlu0Z0GMOUTs2aAJVXfBt90b
	 zoPgPZ+KjUsOR0illWxYQOrCe3NUJys+YE8xJIP7TC1B6B4HaFfqCepxlYEVz344aSm6tpL5oEPe
	 ID3Z+ezcpfccO/sOsSwFGzT+ZYJS+uRfeLJBkGw3vEGBlj+WeuL6i2yqR7eyKGL7FUi4+6fQjp9E
	 Cl5GcNH0yKA6degPanVeQPx9jZYfcwY+H4cShKK/hAVzSKUeVPUv0+DeJOikfpu6PRDDhZJOhld4
	 F17u0ixBmSkHLB7tF9x937KHa8AIlXhCNFYeox2O5VDou1k6elonwHIcyW9IE+YF3k8p80huOAbP
	 wiqT0eZwISp0Hip9JItF5I+gqSoxD1c/rjnJ8xtdMPQgSHhf4M+n7E6lLjYMF7c/F7JHpLFFNxHG
	 f8+oB5bZCGcbPobfMbA5m1pe6OxFT6PxU6FU8K6XlCyJkLaWgTmib5a1PdfsKp6znoMgcyQu9kZO
	 H5sJ3YKc1Mlyxp2pu+Hcyh8YujBc3DVmVvibItamVk+iwxqmXzTRGrexdYIpqakUb1jpZZqbONB/
	 VWNJG6p/42qzkddYOHrh4ZfbfG+HGqoBE/X1GN+mJBshwnhZxiBdBaNBeistEGKpASYQU8BSIK2J
	 OqteU2NfUE4Qr6ioi3v0fVsxwqBGVNS3sENWYz2AzA4UblrG8+Mr9SNH6tCynAL/5ppML25aMBar
	 73mvixj/jBBreRDPJKW9li7QRavYKy4TFhuEJDBqeSGsL91QKupWDBglMRwlM=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
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
Date: Sun, 18 Oct 2026 11:55:20 +0000
X-OQ-MSGID: <689ba24e84ef431f928bc05c9bacefc3@qq.com>
X-Mailer: git send-email style plain-text report

Hi Baolin,

You are right, and thanks - "space reserved for the last entry" was the
wrong explanation.  v4 below puts it the way you describe: the source and
the destination block have different entries_offset values, so a tail
measured against the source's header can be larger than the capacity the
newly allocated destination has.

I re-derived the numbers from the tree to make sure I had them right:

  sizeof(struct index_block) = 40, struct index_header at +24 (16 bytes)
  dst entries_offset = (16 + 9 * 2 + 7) & ~7 = 40, usa_count = 4096/512 + 1
  dst allocated_size = 4096 - (40 - 16) = 4072
  dst capacity       = 4072 - 40 = 4032
  src (from the image): entries_offset = 16, index_length = 4072
  relative to the index header: ie_head at +32, ies_end at +4072
  -> tail = 4040 bytes, i.e. 8 bytes past the 4096-byte allocation

and the check compares that tail against the same 4072 - 40 = 4032.

The code is unchanged since v2 (the diff is byte-identical), so the earlier
run still applies with this patch; logs and the image script are available
on request.

--- 8< ---
Subject: [PATCH v4] ntfs: check index block capacity in ntfs_ib_copy_tail()

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
VCN.  The sibling conversion path, ntfs_ir_to_ib(), received the
equivalent check in dc09bf79b76f ("ntfs: Fix index_root heap OOB write
in ntfs_ir_to_ib()"); this copy site was missed.

Signed-off-by: Hang Nan <2122295973@qq.com>
---
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

