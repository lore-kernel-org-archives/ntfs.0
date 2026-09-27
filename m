Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A4B39FCCA
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790514256; cv=none; b=hyx5o2fm9mDeNrWE0EDCyiwuhkwQL+JQ8VJjEdqyJvtcEWG7u5LKj3rnTneyE2hbupOnCtrCbPDSAnQWR9sMpocr6SX38w9agjD5T2+pfFY6ifv0k/HexNNFzhZqaObcSgBR0vpZX8kg64Yl61JL2axkybZ+MXL8Zg2rWtXzqSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790514256; c=relaxed/simple;
	bh=p9cO9JMFWXX0HLrRt2D6U3b2wHJxPxcWREanVSA5Y9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHbLQ6CzeZg12U6Pa/nwO4YX6QLtllfk6PeICK64CRXOuPRmx6mB5K9KZiV6fS+6qBynFco3UmC0TWAoWU9ajFurfBH3iGyXHKL4dZXyLsOlmgD/cdvdJ4t8wC9goOeA781uI7m6bf8lYd40yDeWz0nt/RdkxHFWX6085Ser1EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NRkXQ9l9; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NRkXQ9l9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=CN983ZgIiNQFtMEtBbzIuQKcZyGEWDc6oc7uP1SHe/E=;
	b=NRkXQ9l9eNJEB32Vn/g5LDhOOl6vPjVuGb76W6xxdTwD3aB5v0DFW6WUvgAqv9
	maFbfTxgefhFQ68CMehUtKvf0p9tXyg7yytUcbrqlc0+1kTLfe1nUkcF9LA4e2g3
	T4H1hvVVbWgEpu67a42nnbi2Ug+tkyZwYzdMljzrU9cN4=
Received: from [IPV6:2409:8949:6ca0:7910:556a:2884:1c35:3923] (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCHC3g+FLlqUIenBg--.3115S2;
	Sun, 27 Sep 2026 21:04:00 +0800 (CST)
Message-ID: <39004acb-789b-4c8e-b99b-a150cd08f046@163.com>
Date: Sun, 27 Sep 2026 21:03:58 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ntfs: balance the $MFT runlist lock in data extension
 error paths
To: Matthias Goergens <matthias.goergens@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260927105706.3111333-1-matthias.goergens@gmail.com>
 <20260927105706.3111333-2-matthias.goergens@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260927105706.3111333-2-matthias.goergens@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgCHC3g+FLlqUIenBg--.3115S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jw4fJF4kGr1kWr4kGryfJFb_yoWxJr1Dp3
	9IyrnIkw1YqrnFgwnIqwsF9ry3Cw1xW3yUGr1xG3WxCrn0qw1xGFn0kFyYg3W0yrWxJFyk
	XF4DK3y7CF98Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2hFsUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwQAe6Gq5FEDGpgAA3Q



在 2026/9/27 18:57, Matthias Goergens 写道:
> ntfs_mft_data_extend_allocation_nolock() drops the $MFT runlist lock
> before allocating clusters, and every path into undo_alloc arrives
> without it, except a map_mft_record() failure, which takes it first.
> undo_alloc never releases it, so the lock leaks and the next $MFT
> extension and $MFT writeback hang.  The restore_undo_alloc failure
> path, on the other hand, releases the lock without holding it.  And
> undo_alloc frees the clusters with ntfs_cluster_free() and truncates
> the runlist without the lock, although both require it.
> 
> Enter undo_alloc without the lock on every path.  Under the lock, copy
> the new runs and truncate the runlist; after dropping it, free the
> clusters from the copy with ntfs_cluster_free_from_rl().  That keeps
> lcnbmp_lock outside the runlist lock, as the function documents.  Like
> the runlist merge failure above, this does not discard the clusters,
> which were never written.  If the copy cannot be allocated, the
> clusters stay allocated and the volume is marked for chkdsk.
> 
> A shorter fix would keep calling ntfs_cluster_free() on the live
> runlist without the lock, relying on $MFT's runlist being fully mapped
> and changed only by this function under mrec_lock.  That breaks
> ntfs_cluster_free()'s documented locking rule on an argument about the
> rest of the driver, so this patch does not do that.
> 
> Fixes: 115380f9a2f9 ("ntfs: update mft operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
> Without this patch, a forced map_mft_record() failure gives "WARNING:
> lock held when returning to user space" for the $MFT runlist lock, and
> the next file create and $MFT writeback block on it.  A forced lookup
> failure in restore_undo_alloc gives "bad unlock balance".  With it, the
> create fails with EIO, lockdep stays quiet and the volume keeps working,
> also when the copy allocation is forced to fail.  $MFT growth on a
> fragmented volume behaves as before.
> 
>   fs/ntfs/mft.c | 54 +++++++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 46 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index e01e367a588d9..58676042444b6 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -1764,6 +1764,36 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
>   	return ret;
>   }
>   
> +/*
> + * ntfs_mft_copy_tail - copy the runs of a runlist from a vcn onwards
> + * @rl:		runlist to copy from
> + * @vcn:	first vcn to copy
> + *
> + * Return a terminated copy of the runs of @rl covering @vcn and everything
> + * after it, NULL if there are none, or ERR_PTR(-ENOMEM).  The caller must
> + * hold the runlist lock and free the copy with kfree().
> + */
> +static struct runlist_element *ntfs_mft_copy_tail(struct runlist_element *rl, s64 vcn)
> +{
> +	struct runlist_element *end, *copy;
> +	s64 delta;
> +
> +	rl = ntfs_rl_find_vcn_nolock(rl, vcn);
> +	if (!rl || !rl->length)
> +		return NULL;
> +	for (end = rl; end->length; end++)
> +		;
> +	copy = kmemdup(rl, (end - rl + 1) * sizeof(*rl), GFP_NOFS);
> +	if (!copy)
> +		return ERR_PTR(-ENOMEM);
> +	delta = vcn - copy->vcn;
> +	copy->vcn = vcn;
> +	copy->length -= delta;
> +	if (copy->lcn >= 0)
> +		copy->lcn += delta;
> +	return copy;
> +}
> +
>   /*
>    * ntfs_mft_data_extend_allocation_nolock - extend mft data attribute
>    * @vol:	volume on which to extend the mft data attribute
> @@ -1791,7 +1821,7 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
>   	s64 min_nr, nr, ll;
>   	unsigned long flags;
>   	struct ntfs_inode *mft_ni;
> -	struct runlist_element *rl, *rl2;
> +	struct runlist_element *rl, *rl2, *tail_rl;
>   	struct ntfs_attr_search_ctx *ctx = NULL;
>   	struct mft_record *mrec;
>   	struct attr_record *a = NULL;
> @@ -1904,7 +1934,6 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
>   	if (IS_ERR(mrec)) {
>   		ntfs_error(vol->sb, "Failed to map mft record.");
>   		ret = PTR_ERR(mrec);
> -		down_write(&mft_ni->runlist.lock);
>   		goto undo_alloc;
>   	}
>   	ctx = ntfs_attr_get_search_ctx(mft_ni, mrec);
> @@ -2015,7 +2044,6 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
>   		write_unlock_irqrestore(&mft_ni->size_lock, flags);
>   		ntfs_attr_put_search_ctx(ctx);
>   		unmap_mft_record(mft_ni);
> -		up_write(&mft_ni->runlist.lock);
>   		/*
>   		 * The only thing that is now wrong is ->allocated_size of the
>   		 * base attribute extent which chkdsk should be able to fix.
> @@ -2026,15 +2054,25 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
>   	ctx->attr->data.non_resident.highest_vcn =
>   			cpu_to_le64(old_last_vcn - 1);
>   undo_alloc:
> -	if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
> -		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
> -		NVolSetErrors(vol);
> -	}
> -
> +	/*
> +	 * Entered without the runlist lock.  Take the new runs off the
> +	 * runlist under it, and free their clusters from a copy once it is
> +	 * dropped, as lcnbmp_lock nests outside it (see above).  If the copy
> +	 * cannot be allocated, the clusters stay allocated until chkdsk.
> +	 */
> +	down_write(&mft_ni->runlist.lock);
> +	tail_rl = ntfs_mft_copy_tail(mft_ni->runlist.rl, old_last_vcn);
>   	if (ntfs_rl_truncate_nolock(vol, &mft_ni->runlist, old_last_vcn)) {
>   		ntfs_error(vol->sb, "Failed to truncate mft data attribute runlist.%s", es);
>   		NVolSetErrors(vol);
>   	}
> +	up_write(&mft_ni->runlist.lock);
> +	if (IS_ERR(tail_rl) || ntfs_cluster_free_from_rl(vol, tail_rl)) {
> +		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
> +		NVolSetErrors(vol);
> +	}
> +	if (!IS_ERR(tail_rl))
> +		kfree(tail_rl);
>   	if (mp_extended && ntfs_attr_update_mapping_pairs(mft_ni, 0)) {
>   		ntfs_error(vol->sb, "Failed to restore mapping pairs.%s",
>   			   es);


Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

