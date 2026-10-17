Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3461E3BFE2D
	for <ntfs@lists.linux.dev>; Sat, 17 Oct 2026 17:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257343; cv=none; b=awfXL+cT8ru+/KV/ZfftQ1f6HNUgIhMK/2jdPMJrRjiaepqyBtqcnlpIz6/fuXHvMqnBV3Zd8fZ4510daUNgjdsD/sOWtD2SujnrbsnMDIBzkg+EJAqCeDcjcku5M+sN0MtF+BZ6W5GVSjRrigqnOIFSICcUNCD/inblUW4PASQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257343; c=relaxed/simple;
	bh=R38KA6kIOQdZvvim5ulnwao1GFD4H9HTPkPNoq3uEyM=;
	h=Message-ID:From:To:Cc:Subject:Date:Content-Type:MIME-Version; b=dRBZN07E0KSy7xg2q7slb11Yaf1oMvu/tZnbwSJ+5NXZZW1wm4gEOJ+MA1xTg0vzdkpEyqk/ytNHho9QObI8xxvvdFV/yzmcGh6uI23vgQ2wdhOsUNZxAXufCOYGvNF6jYajOsO+4ZNrfDTORiS6Rd/dVvvgVHbn5SEPiujcTwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=xg+oHCHL; arc=none smtp.client-ip=203.205.221.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="xg+oHCHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792257327; bh=13Y+xAJ5EtlUaXAkuHTBIAUIZP5bCxfh50HAjhT/32w=;
	h=From:To:Cc:Subject:Date;
	b=xg+oHCHLJUzpzKaQKZSPm90vlWnFAKezIiN/3LgCaVJ+bDUQth9RGvn3FyZNxzRaV
	 HYdaFPenZvqnbbWd8TrYFaeJbncF84abSYSkUUd1q0oQ0m+lQVTfpVe/U3dUkGSqEf
	 Om+J56UPWF6zrQ8Eo1Uepaq69QqkTDYNvVijRoHI=
Received: from [127.0.0.1] ([2409:8d5c:c30:3b3:3d39:a6e9:e5bc:61cf])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 3D9B08BF; Sun, 18 Oct 2026 01:15:25 +0800
X-QQ-mid: xmsmtpt1792257325tayqa6en7
Message-ID: <tencent_01175C3A5019C145877D1C31E2532BD2D806@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznV/W+DYYFLTk7BWsCSQqmAkE90Oglv5C4qiHGLRd1TEivkDzVvQ
	 IJmZOf3HUIkx6kfM3ZkoAP2KwAk3rC0nuVN/kKs2VbHJZ6XfmrsiAn64qrzzIgq3iy6mUvTRWbQE
	 A4gulxXiRX8EMazm3z+hCj8f7a9jYY4TBVjh9Fdk+8zFKGKEaVrCp828C/p+fukEET7UhTGCZ/X6
	 Oj808KAJY/4Kj0EdBppTijYGyZEXXxe5o64GEh54tJB0rhiiZP5EX8EFOIOpwZw0QYJvm4ReE6n/
	 WTQRvsOcdXthdGFYTWGOK1Q9ZMPTcq6bRVbt+Zj/XLIeCZ7UvFOLvhtN787edXxm5gFQxsy2ssVr
	 ufMhhbwodzEhtsCC+AAZD2eNSXp95M8dKQE3fG5kX+g26x73CyMcDj0oaZhxtK0XXSZzzFKuAFLf
	 saQo+CnEYaDpwc5Mciej51w229XK/oWYgIG7McvmRsnTWxPkC81O9qaQb+Ay7wrjog/x9eilZQQ7
	 /Zh7nhmHJEcnhfFido1Yzd7ft6eKb9MHoOxGbX2gsDEHBgQcb/yM/ZNSvheZqie3kivSj7wDTL04
	 hCirP36EeYPqxLvdu9p/sfOJqx6T38DKXQAyo015lEA+Owb2C99h2SybA8RHLNOZb3hLzNyi6Weo
	 e6786curObECjJQYF2DK134mDmXVWtxze0HHkAZJtzr/LEJ/wSd2gvtihfMiIKS8U2tRfztV9hWh
	 cY6tbfvmURLDtvmsFOKj6uMk9jwsxYJ8kHOJgvMidKLho1Mk20lOB6SXNM1JQbnuC8gHN6kJH0un
	 5ticCYrzlbedvp7O0WMJiiO5BcRDrlpraun8Gpwztdsii+L+1dd+S/YAj8TOYhIsePbSql8a2APb
	 I2grC16/GVd92IKvxI2I7pVvCZFD7GHlO0LLq8Kg3JBKYawO2u0+I70enh1PqtHzAIcQyxH+vROC
	 R74pWMdPLzQyvTdzrkrb8R+lSwX+BC0D6+8m88d49GgYOYkdCrJ//+azIqKNp9MSPpos+MEK/OmK
	 acW/FsQyopKudqM9/nw5aEgHu3EfPOjY6wOoSmJjUT9OTx0Guq
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Hang Nan <2122295973@qq.com>
To: liubaolin12138@163.com
Cc: linkinjeon@kernel.org, hyc.lee@gmail.com, ntfs@lists.linux.dev,
 security@kernel.org
Subject: Re: [PATCH] ntfs: check index block capacity in ntfs_ib_copy_tail()
Date: Sat, 17 Oct 2026 17:15:25 +0000
X-OQ-MSGID: <58a75bd476894919ac9ba416341e062a@qq.com>
X-Mailer: plain-text review reply + v2 patch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Baolin,

Thanks for the review.  Both points are addressed in v2 below.

1. ntfs_error() now gets icx->idx_ni->vol->sb instead of NULL.  I checked
   __ntfs_error(): it only calls ntfs_handle_error() and prints the
   "(device %s)" prefix when sb is non-NULL, so passing NULL was indeed
   skipping the errors= policy.  At this point icx is the index context the
   caller passed in and idx_ni is the index inode being modified, so the sb
   is always available.

2. The commit message is now 15 lines: the triggering condition, why the
   copy goes out of bounds, and how the capacity check stops it.  The code
   excerpts, the comparison with ntfs_ir_to_ib() and the full logs are gone;
   the analysis below carries them instead.

Re-tested on v7.3-rc7 with the same crafted image and slub_debug=zf:

  - before: [Right Redzone overwritten] ... @offset=20480, 8 bytes,
            "BUG kmalloc-4k: Object corrupt" on free_to_partial_list
  - after:  no redzone report, and the create fails early with
            ntfs: (device vda): ntfs_ib_copy_tail(): Entries (4040 B) exceed IB capacity
            creat -> -1, errno=5 (EIO)

Note the "(device vda)" prefix, which is what your point 1 restores.

For the record, the analysis that I removed from the commit message:

  tail_size is computed from the source block alone:

        ie_head  = ntfs_ie_get_next(median);
        ies_end  = (u8 *)ntfs_ie_get_end(&src->index);
        tail_size = ies_end - (u8 *)ie_head;

  The destination is ntfs_ib_alloc(new_vcn, icx->block_size, ...), so its
  usable area is allocated_size - entries_offset.  ntfs_ie_get_end() returns
  index_entry_end, which for a block of ib_size bytes sits 16 bytes before
  the end of the block (that is the size of one INDEX_ENTRY_END).  A source
  block whose index_length == allocated_size therefore yields

        tail_size    = (24 + 4072) - (24 + 16) - 16 = 4040
        dst capacity = 4096 - 24 - 40               = 4032

  i.e. exactly 8 bytes too many, and the 8 bytes come from the image.  The
  sibling conversion path got this check in dc09bf79b76f ("ntfs: Fix
  index_root heap OOB write in ntfs_ir_to_ib()") in July; this copy site was
  missed.

Full console logs of both runs, the mkntfs-based image-crafting script and
the initramfs that mounts the image and creates the file are available on
request.

--- 8< ---
From: Hang Nan <2122295973@qq.com>
Subject: [PATCH v2] ntfs: check index block capacity in ntfs_ib_copy_tail()

ntfs_ib_copy_tail() copies every index entry after the median entry into a
newly allocated index block:

	ie_head = ntfs_ie_get_next(median);
	ies_end = (u8 *)ntfs_ie_get_end(&src->index);
	tail_size = ies_end - (u8 *)ie_head;
	memcpy(ntfs_ie_get_first(&dst->index), ie_head, tail_size);

tail_size comes from the source block's on-disk entries_offset and
index_length, while the destination has only allocated_size minus
entries_offset bytes of room.  A corrupt source block whose entries
extend into the bytes reserved for the last entry can therefore overflow
the destination by up to the size of that reserved entry (8 bytes for a
4096-byte block), writing attacker-controlled data past the allocation.

Reject such a split before the copy and fail it with -EIO, which
ntfs_ib_split() already propagates after clearing the newly allocated VCN.

Signed-off-by: Hang Nan <2122295973@qq.com>
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

