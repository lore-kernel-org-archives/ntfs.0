Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68D9346E5D
	for <ntfs@lists.linux.dev>; Sun, 18 Oct 2026 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321302; cv=none; b=Bn6Mikf6XS628F2+/i1k+IltbjWCuZUs3Ja0ykPVQbb4NQVakYmU497EP9dAwCmBBFJ9dUp5sfYVWaWBQEYulSDEwljK5tipV0fHqpzJTkZK+/uGtnwC9pUFXmtdLUeyYPQ+ZJKumwHJTGPpe/thfundQOGNl96VT+KKy1fgTnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321302; c=relaxed/simple;
	bh=T4v/8YgsXYs3GZknmCQilYSjBJA8hFxjDk/U6jaPN1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+Uh7F+9RwN4n+xXPhsV6bsi2CecSfyigHmNw/bbgC4jr4hJgAf7RkUnAmSY4UlpeduC6V2zDnSGeZfzHROsqEqgrpSDbhcz8b8fxkx6saJpJFfugd5fiOOoMxheSAyRnPM7ozHHTYbbEdXMug1ITwdBO/fuM/kSKcp5sEOd8R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PFfgJ5kM; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PFfgJ5kM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=nKCFeowwHAHCPOvQTz4lieL6V3+wHv5zV2fnXqaCUk0=;
	b=PFfgJ5kMGVRH/OSwlz061nCAyGK1JIw1bUmbQGCt67NXMbujdC2T+KRFNeyQQB
	pkfsmB2aYkeg3hpmpitBMm+lUybyfpeBygvBhzJUyhJbYMlfnHzF/oymrZOz6QjA
	VWKgbATCPpJfaQeaeYWm3mDQP3e1doOE4vF+iTkEx5fHQ=
Message-ID: <4c60e3a4-bbcc-48f4-b78a-c47513b95313@163.com>
Date: Sun, 18 Oct 2026 19:01:29 +0800
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
X-CM-TRANSID:PigvCgDn70kJp9Rqp6hQAg--.7237S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF4DXFy7ZrW7KFW5Jr47Jwb_yoW7Jr1xpa
	17K393taykXrW7ZrnaqF1Utasa9w1rJrWUGrWrKFW7C3sxJrn7KF95tryYgFZ2vrZ3A342
	qF1jgry7Cry5Xr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UHT5JUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Qq7hmrUpwrvnAAA3+



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
Hi Hang,
    The code excerpt is still present in the commit message. Please 
remove it and briefly describe the size mismatch in words. That would 
make the commit message more concise and help readers identify the cause 
and fix more easily.

Thanks,
Baolin.

> tail_size comes from the source block's on-disk entries_offset and
> index_length, while the destination has only allocated_size minus
> entries_offset bytes of room.  A corrupt source block whose entries
> extend into the bytes reserved for the last entry can therefore overflow
> the destination by up to the size of that reserved entry (8 bytes for a
> 4096-byte block), writing attacker-controlled data past the allocation.
> 
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

