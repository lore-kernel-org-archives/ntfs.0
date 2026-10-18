Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EEB49F127
	for <ntfs@lists.linux.dev>; Sun, 18 Oct 2026 12:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792328104; cv=none; b=L0k3ePOchJeqvh7k4tFW6DF0aEvX7vydCarytT5IPyp/fXdzU7uVPmL2OhHwCLCqLaT2YQYwYWBC5fy7ydLUPjjgmgPIR+0TnpQjbdGQiA90870h6OxN1znW/WmM+y+ldxdQjqP9Cdd/EgzI8X3IuI/QQNDjYE7y8dWlMe2e3VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792328104; c=relaxed/simple;
	bh=SmKo7BwEgMCVhVkfC9IPMNK7+dJmi26h43ByLoT3ODQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+QqKSGSilmc+snarjejn9TtkJCKRM/il6IqveBg72fG6LTmIX3dhLZzlOwy0HyJgZy6MqXpEA8QXa4uwN8V6Hw48HFBaFN2MzdeC31ZyHPZ4oaFICIEtkzuZLatltkQ54MDu6MMD3iekDJ6m3IgPLNch54fJA5LFEJxgVW7F70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=P1DpJ5v4; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="P1DpJ5v4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=odiuJRjHO5VH1rcOlNBvfq3JtWnhIkMtbLXvEjvE/bw=;
	b=P1DpJ5v49BGUKmzXGOmjvSdVe+19LjiTqMRFihLm8wSR3Cewu22NQvNB0HU1GF
	Nrfijdw63cXy7ArdeGi8RE5Q+3zTKadtKG/TeU1R2GIaD22KsmEyVdMEHdBBInk3
	cXI5WI+9CQm3U9xMta7nRoHpZxIDxlR1aqYqQA9kj4cnE=
Message-ID: <59388b04-7438-4f45-b7e5-10659c46a7be@163.com>
Date: Sun, 18 Oct 2026 20:54:48 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ntfs: check index block capacity in
 ntfs_ib_copy_tail()
To: Hang Nan <2122295973@qq.com>, linkinjeon@kernel.org, hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, security@kernel.org
References: <tencent_AC559EC491E8BEF6D2D9CBD02E00EC518809@qq.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <tencent_AC559EC491E8BEF6D2D9CBD02E00EC518809@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgD3P0iYwdRq1ulfAg--.8725S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFyrZry3Cw4xWF15ZrWxCrg_yoW5Kr13pa
	nrG3s3KaykXr17uFnava1jyF9a9w4fGrWUGrW5KrW7C39xGrn7KFnYy34Yg34xtrWfA34j
	qF1jqry7uFZ8ZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UHVb9UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RlmMWrUwZm8WQAA3k



在 2026/10/18 19:59, Hang Nan 写道:
> From: Hang Nan <2122295973@qq.com>
> 
> When an index block has to be split, ntfs_ib_copy_tail() moves every
> entry that follows the median entry into a freshly allocated block.  The
> number of bytes to move is computed from the source block's on-disk
> header alone: it is the distance from the first entry after the median
> to the end of the source block's entry area, so both entries_offset and
> index_length are taken from a block that comes from the mounted image.
> 
> The destination is set up by ntfs_ib_alloc(): its entry area starts
> after the index header, the update sequence array and the padding, which
> for a 4096-byte block puts it at offset 40, and its usable capacity is
> allocated_size minus that entries_offset.  A source block can declare a
> smaller entries_offset than that, so the tail computed from it can be
> larger than the destination can hold - 4040 against 4032 bytes in the
> case at hand - and the copy writes the surplus past the end of the new
> allocation, with values taken from the image.
> 
> Reject such a split before the copy and fail it with -EIO, which
> ntfs_ib_split() already propagates after freeing the newly allocated
> VCN. The sibling conversion path, ntfs_ir_to_ib(), got the equivalent
> check in commit dc09bf79b76f ("ntfs: Fix index_root heap OOB write in
> ntfs_ir_to_ib()"); this copy site was missed.
> 
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Signed-off-by: Hang Nan <2122295973@qq.com>
> ---
> v3:
>   - describe the size mismatch in words instead of quoting the code from
>     the function.
>   - correct the root cause: the overflow comes from the source and the
>     destination block having different entries_offset values, not from
>     space reserved for the terminating entry.
>   - restore the Fixes: tag.
> 
> Testing: on v7.3-rc7 with slub_debug=zf and a crafted NTFS image, the
> destination object's redzone is overwritten by the last 8 bytes of the
> copy before the change; with the change the split is refused, creat()
> fails with -EIO and no redzone report appears.  The console logs of both
> runs, the image-crafting script and the initramfs are available on
> request.
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

Thanks for v3. This addresses my previous comments. The code change 
looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

