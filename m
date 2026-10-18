Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8693148D8
	for <ntfs@lists.linux.dev>; Sun, 18 Oct 2026 11:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321418; cv=none; b=gvBUMGtQhoOOeH0Z8NcLWTQwpc0PWWLDtew+E3meq+bUbFsFzjoo0eo/tR9kTCiCUDEngAQeO7lw8vZmbKrn4kVC64P3cw1w7Z7mEgAd8+FcjpnqpvIhuxLVTOyBkg0DQdHM+fZ53uNs7hRNavDVXxEsk1j2xXeQ3rQopPn21M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321418; c=relaxed/simple;
	bh=gPf8zrv8u0gOfI+bcQm8USO6VoJAEczCq2VA/aO6x0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbfME5JXu7FogOEUi8h2QA/iqkDkrnFUQjZZ5dnJnsv/T5sQDi8HU6Zz4Lk8ozYC/Hoa/JM3alYar8/gMRWHTOEjEFhptS33fwpsjBVUoecN/ubNT7o+9IVTV+EFL4InAW8GDa1TEP+mdA99fRKTymj3eoilhZ4d7WNAUQjghEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=F7urFTig; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="F7urFTig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=ROLNxw2kwaeqAL7/iAx4lxtb3owIxwgaBMd4Q/DgR/8=;
	b=F7urFTig22w/0X7rr4r1PnkwK6e3V7vlq2iP00vL6O9kKDipmzBTaEGaUJg0sC
	vgIBv6mEfvI2DinKSNl8/eXHyLHt0QSsEieTyD9AymJLUqwZJHi4IoVqzyyMLb0Y
	uUHgdKO+ONkmqDWA8xBUH6zUD5yzeYMDaI7dJ9Cu6jwNc=
Message-ID: <39b6c8df-4d5f-4a62-b366-58d1cef3ee58@163.com>
Date: Sun, 18 Oct 2026 19:03:22 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: check index block capacity in ntfs_ib_copy_tail()
To: Hang Nan <2122295973@qq.com>
Cc: linkinjeon@kernel.org, hyc.lee@gmail.com, ntfs@lists.linux.dev,
 security@kernel.org
References: <tencent_01175C3A5019C145877D1C31E2532BD2D806@qq.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <tencent_01175C3A5019C145877D1C31E2532BD2D806@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgBnk4t6p9RqkHJLAg--.6189S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3JFWrGrWfAF47XF1xtr48Xrb_yoW7Ar1fpa
	17G3s3ta97Xr47Zrnaq3WUtasa9w4fGrWUGrW5GFy7C3sxtrn7KF9YyryYgayIkFZ3A342
	qF1jg347uryDXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UQ2-OUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RvXomrUp3sBngAA36



在 2026/10/18 01:15, Hang Nan 写道:
> Hi Baolin,
> 
> Thanks for the review.  Both points are addressed in v2 below.
> 
> 1. ntfs_error() now gets icx->idx_ni->vol->sb instead of NULL.  I checked
>     __ntfs_error(): it only calls ntfs_handle_error() and prints the
>     "(device %s)" prefix when sb is non-NULL, so passing NULL was indeed
>     skipping the errors= policy.  At this point icx is the index context the
>     caller passed in and idx_ni is the index inode being modified, so the sb
>     is always available.
> 
> 2. The commit message is now 15 lines: the triggering condition, why the
>     copy goes out of bounds, and how the capacity check stops it.  The code
>     excerpts, the comparison with ntfs_ir_to_ib() and the full logs are gone;
>     the analysis below carries them instead.
> 
> Re-tested on v7.3-rc7 with the same crafted image and slub_debug=zf:
> 
>    - before: [Right Redzone overwritten] ... @offset=20480, 8 bytes,
>              "BUG kmalloc-4k: Object corrupt" on free_to_partial_list
>    - after:  no redzone report, and the create fails early with
>              ntfs: (device vda): ntfs_ib_copy_tail(): Entries (4040 B) exceed IB capacity
>              creat -> -1, errno=5 (EIO)
> 
> Note the "(device vda)" prefix, which is what your point 1 restores.
> 
> For the record, the analysis that I removed from the commit message:
> 
>    tail_size is computed from the source block alone:
> 
>          ie_head  = ntfs_ie_get_next(median);
>          ies_end  = (u8 *)ntfs_ie_get_end(&src->index);
>          tail_size = ies_end - (u8 *)ie_head;
> 
>    The destination is ntfs_ib_alloc(new_vcn, icx->block_size, ...), so its
>    usable area is allocated_size - entries_offset.  ntfs_ie_get_end() returns
>    index_entry_end, which for a block of ib_size bytes sits 16 bytes before
>    the end of the block (that is the size of one INDEX_ENTRY_END).  A source
>    block whose index_length == allocated_size therefore yields
> 
>          tail_size    = (24 + 4072) - (24 + 16) - 16 = 4040
>          dst capacity = 4096 - 24 - 40               = 4032
> 
>    i.e. exactly 8 bytes too many, and the 8 bytes come from the image.  The
>    sibling conversion path got this check in dc09bf79b76f ("ntfs: Fix
>    index_root heap OOB write in ntfs_ir_to_ib()") in July; this copy site was
>    missed.
> 
> Full console logs of both runs, the mkntfs-based image-crafting script and
> the initramfs that mounts the image and creates the file are available on
> request.
> 
> --- 8< ---
> From: Hang Nan <2122295973@qq.com>
> Subject: [PATCH v2] ntfs: check index block capacity in ntfs_ib_copy_tail()
> 
> ntfs_ib_copy_tail() copies every index entry after the median entry into a
> newly allocated index block:
> 
> 	ie_head = ntfs_ie_get_next(median);
> 	ies_end = (u8 *)ntfs_ie_get_end(&src->index);
> 	tail_size = ies_end - (u8 *)ie_head;
> 	memcpy(ntfs_ie_get_first(&dst->index), ie_head, tail_size);
> 
> tail_size comes from the source block's on-disk entries_offset and
> index_length, while the destination has only allocated_size minus
> entries_offset bytes of room.  A corrupt source block whose entries
> extend into the bytes reserved for the last entry can therefore overflow
> the destination by up to the size of that reserved entry (8 bytes for a
> 4096-byte block), writing attacker-controlled data past the allocation.
> 
Hi Hang,
    Please correct the root-cause description here. The 8-byte overflow 
in this reproducer comes from the different source and destination entry 
offsets, not from space reserved for the last entry.

    The source uses entries_offset == 16, while ntfs_ib_alloc() sets the 
destination's entries_offset to 40 to accommodate the index header, 
update sequence array and alignment. After skipping the 16-byte median 
entry, the source tail is 4040 bytes, but the destination has only 4032 
bytes available.

    The commit message can simply state that a corrupt source block can 
have a smaller entries_offset than the newly allocated destination, so 
the remaining tail may exceed the destination's usable capacity.

Thanks,
Baolin.

> Reject such a split before the copy and fail it with -EIO, which
> ntfs_ib_split() already propagates after clearing the newly allocated VCN.
> 
> Signed-off-by: Hang Nan <2122295973@qq.com>
> ---
>   fs/ntfs/index.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
> index 580998990..2c345e32d 100644
> --- a/fs/ntfs/index.c
> +++ b/fs/ntfs/index.c
> @@ -1200,6 +1200,7 @@ static int ntfs_ib_copy_tail(struct ntfs_index_context *icx, struct index_block
>   		struct index_entry *median, s64 new_vcn)
>   {
>   	u8 *ies_end;
> +	u32 ib_cap;
>   	struct index_entry *ie_head;		/* first entry after the median */
>   	int tail_size, ret;
>   	struct index_block *dst;
> @@ -1215,6 +1216,17 @@ static int ntfs_ib_copy_tail(struct ntfs_index_context *icx, struct index_block
>   
>   	ies_end = (u8 *)ntfs_ie_get_end(&src->index);
>   	tail_size = ies_end - (u8 *)ie_head;
> +
> +	/* Entries must fit in the allocated index block */
> +	ib_cap = le32_to_cpu(dst->index.allocated_size) -
> +			le32_to_cpu(dst->index.entries_offset);
> +	if ((u32)tail_size > ib_cap) {
> +		ntfs_error(icx->idx_ni->vol->sb,
> +			   "Entries (%d B) exceed IB capacity", tail_size);
> +		kvfree(dst);
> +		return -EIO;
> +	}
> +
>   	memcpy(ntfs_ie_get_first(&dst->index), ie_head, tail_size);
>   
>   	dst->index.index_length = cpu_to_le32(tail_size +

