Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D8E304976
	for <ntfs@lists.linux.dev>; Mon, 28 Sep 2026 05:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790571675; cv=none; b=f6iVurrj/lLZfEzy+3wnPjOlUgRvBX0i9rm4SXZ7aJzeuMUqcOp9NN8AgRIG+lBfBxJutlndbN2vIFn4eKEfP12pjjDpbpdyM1dA3Qu8pA3WkDDwccUxArGipibYSo0lkUlsx0+xAIEFDPoyHpDnzPinpma3s/bYLjv1eI6+Vss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790571675; c=relaxed/simple;
	bh=0yV1JZGhIadJQ1R+MCpQcm51zAutz9fB71g8gd4WYAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEtysdufFFzj5wNf8h01rh34kFgaNQUqFqAgGqbSZJoN6Qzx0n9Iz9xhS76AgSMFXu1hWPhE4IpMNtvaaEgZ9v3clkehTsV/UtgZFG5+bbavQX9XTgIhPomiKy7AOha9VqB6yAHf5/kN6uXjz6TC5EIjbqErnKTTS2hLzbCvzGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwKosHbm; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwKosHbm"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a47d5764feso45801a91.2
        for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 22:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790571673; x=1791176473; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NgGjrZbQCm/J8GjAoOxEZlUVMDLBVAyGN67PqiCaZgA=;
        b=KwKosHbmz5hFkbvuMbsJwOc5OjY4RF0yoOmhzobd7tsrEcWut5+uFCMII7jqY/VDIj
         p6EwdofITQd4cQDK5B/P5fXP941Z15JXWsKZ0hM4YLkXEPK1Ff3Ygwxu1DM6ZqE0ueke
         0m7pDdRH72rQm+jNyhXpfuXojG76Hwhz/FwCG8B/pdYm2rN6LzmpcRA0DAEbZkqsQA1F
         pmhMnaRbRHZzHc4kFfwFicj/iITbgfbN9ZreK6aoMzFa98wmCNLDDOhzGOWzdavLKMrZ
         gZVPY2lo3Abe1DSDQF3r8OPOghlk3Hvwl/tWBLzAe03RKxIi4WAhaAD+Zi7Ix11H8MM8
         wJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790571673; x=1791176473;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgGjrZbQCm/J8GjAoOxEZlUVMDLBVAyGN67PqiCaZgA=;
        b=JOoVvw3LpLiokU1kU58yDokHC4Tdg+ak9m6t7KdY9ObwkU6Nsj7yeF7GHPf5DyX+2I
         EZnYxHqekDImKEDHP5L3LAJnydRfLpJNT5tgcUSiKSQi+GmUbkH+xD3ZXv+tHdLWWC+0
         Prp39h0SjhKx9VnAsT4RB1LufdstEb5zPxtxgR8XFymm/l/uYsKdoRmZXo8UDOxI0UBQ
         vc6+vN51kpIuWuuPIUNnCpq6Y3fXJt/R1CPz+QAzcied4JrbR50mfe0DHT+cewJhcboH
         Qr0ZVQdBi/7aY0mn6Bjmq2+lhteoy6prSDnDvhlx6MQzNGSRxPJNo0L/Mmk1QGpTsALz
         B+Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwu4b/kUDdVCH6HEG7bhWtjD0DoF8/Y8dV6rFcLduYeFZkps+sO0yklwYOaYN3bvhLTIXmf@lists.linux.dev
X-Gm-Message-State: AFq9FYKi0PJYwpEITS8pHThLv4F6ce9gJozZPi0xpBSQ2Wjb913rrOZ+
	E5eyGrQ8XG7GcFvCay1ELsUJznyOGy5ZwR46FQyN0pev/1b7awHrhYSP
X-Gm-Gg: AYBFou27gWPy/lcUJ6H6BlAnAgfujn7g+f7O/ytcunIcm68EZW71aSpCF7dG3yU6ukp
	dgk1pHvqlZR1G6s0WKPe0n3NgnovRL9C6CKfcaIExTv9ew4Y9/hl8D0aKkV/GAq1OljfWqxGegb
	pqTsRMNqh4xhrKPE8qEnxzVSN9WSHPcxBnGHQYZN07ivuJgDI04KOlRxScoopMJK8e7Zc/lsxsC
	u0ktGYaPRgp+3oIS1fnqv15vbdGMe79JaWKiToeQVt//ONt91TpsFBVUM8HiWnVE0lc/EIFMAjr
	V0e2cby1aEQwM+gZteTw7Hov8f2/JffAlri6kEeep1igQIkpvRr3B5ar2TkHE2I28MqqH0zMlyY
	HrTiu1UMHrYzbSyZUxqzxiIQmm56iLr1fF6JPWzVWTH7u+xLi/PzUlVnUrZFrj9vN2yl/5x/nHQ
	oItWF4JJ2CUmbebdya1ZX/BKNIu6bxjbSQ8YE01h6qlSyji+gpfdPTjHFpqvjoDg==
X-Received: by 2002:a17:90b:55d0:b0:3a0:4066:d3b0 with SMTP id 98e67ed59e1d1-3a098e560e0mr10125380a91.59.1790571673074;
        Sun, 27 Sep 2026 22:01:13 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972f111csm24600945a91.2.2026.09.27.22.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:01:11 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:01:09 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ntfs: balance the $MFT runlist lock in data
 extension error paths
Message-ID: <arn0lRtG96tfxPOE@hyunchul-PC02>
References: <20260927105706.3111333-2-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927105706.3111333-2-matthias.goergens@gmail.com>

On Sun, Sep 27, 2026 at 06:57:05PM +0800, Matthias Goergens wrote:
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
>  fs/ntfs/mft.c | 54 +++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 46 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index e01e367a588d9..58676042444b6 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -1764,6 +1764,36 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
>  	return ret;
>  }
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
>  /*
>   * ntfs_mft_data_extend_allocation_nolock - extend mft data attribute
>   * @vol:	volume on which to extend the mft data attribute
> @@ -1791,7 +1821,7 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
>  	s64 min_nr, nr, ll;
>  	unsigned long flags;
>  	struct ntfs_inode *mft_ni;
> -	struct runlist_element *rl, *rl2;
> +	struct runlist_element *rl, *rl2, *tail_rl;
>  	struct ntfs_attr_search_ctx *ctx = NULL;
>  	struct mft_record *mrec;
>  	struct attr_record *a = NULL;
> @@ -1904,7 +1934,6 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
>  	if (IS_ERR(mrec)) {
>  		ntfs_error(vol->sb, "Failed to map mft record.");
>  		ret = PTR_ERR(mrec);
> -		down_write(&mft_ni->runlist.lock);
>  		goto undo_alloc;
>  	}
>  	ctx = ntfs_attr_get_search_ctx(mft_ni, mrec);
> @@ -2015,7 +2044,6 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
>  		write_unlock_irqrestore(&mft_ni->size_lock, flags);
>  		ntfs_attr_put_search_ctx(ctx);
>  		unmap_mft_record(mft_ni);
> -		up_write(&mft_ni->runlist.lock);
>  		/*
>  		 * The only thing that is now wrong is ->allocated_size of the
>  		 * base attribute extent which chkdsk should be able to fix.
> @@ -2026,15 +2054,25 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
>  	ctx->attr->data.non_resident.highest_vcn =
>  			cpu_to_le64(old_last_vcn - 1);
>  undo_alloc:
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
>  	if (ntfs_rl_truncate_nolock(vol, &mft_ni->runlist, old_last_vcn)) {
>  		ntfs_error(vol->sb, "Failed to truncate mft data attribute runlist.%s", es);
>  		NVolSetErrors(vol);
>  	}
> +	up_write(&mft_ni->runlist.lock);
> +	if (IS_ERR(tail_rl) || ntfs_cluster_free_from_rl(vol, tail_rl)) {

If ntfs_rl_truncate_nolock() fails, we must not call
ntfs_cluster_free_from_rl(), because mft_ni->runlist may still reference
those clusters.

> +		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
> +		NVolSetErrors(vol);
> +	}
> +	if (!IS_ERR(tail_rl))
> +		kfree(tail_rl);
>  	if (mp_extended && ntfs_attr_update_mapping_pairs(mft_ni, 0)) {
>  		ntfs_error(vol->sb, "Failed to restore mapping pairs.%s",
>  			   es);
> -- 
> 2.55.0
> 

-- 
Thanks,
Hyunchul
