Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB2039E6CD
	for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 08:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756064; cv=none; b=eaThKXNfGgxgbaUtwNRY5qun3dh9qaGENrYYwjTjJpG4HphjLh4BrDKySC6fury8ZaHeSfCTaeq3PNncYAGFOXE/uh/tEMvWVe248fQqjIZ33WMwlM1WGVSoQ/NlHRr54itZY9XREoxDXr7fMl+/tUuT7N73ulvhkusHdkGqt2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756064; c=relaxed/simple;
	bh=4sVvF5N0X04y82EiZvsck+TNhVspB5fM8AD0Kq/G1ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEznoT7AIekJUHGQsR4kltd7VPIxajGewDUltib3FGMb+Qkltw3w+q7OrcGQbbAkZcJTW2dcqpSweVnumPfGSmIz5+BdVm5TQKsAm49lUIDuzRV9BQ/8Iq/CFeQh54AyALF5jjsHGyTnFGIYF8LRanlC7fqUnNXGGKqBqnQ4jUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8p8lv+R; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8p8lv+R"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso1273406a91.3
        for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 01:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790756062; x=1791360862; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9SBW8K2oQrTXOHOneJy45UcoEEuUnutRwJ1mYqQQoWY=;
        b=i8p8lv+RvMOI3ciRl4IpLm4UHvIzHSf+cWY53SJWrDtb11JlqAl9RZ19jdDmerk0sY
         iRv5UXwJJwgBF4hv+zGO3H0L5sq17mwXxB99M8bUsPK/SI7hWF8Y8NLGFJL+sGBSq3jL
         eZ23yo3GaRlVBwGsUtd3xogIszJtzjXJrbY+3/WZ8KhcnTU6zOAAcDCR3zwShHExg786
         X3zjC2tpjXwM6+vKk3olWt+tEJpWj4KbIn2Dwy7/HCPJYu9CRdhkdLAp0FGB6xM/k6c5
         7URvRopu43iox4AVQwg58+YZEiNK2Rz44fVpEWgRDFDOTWQnbOW1Giyad13e+uEWrGyJ
         yHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790756062; x=1791360862;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9SBW8K2oQrTXOHOneJy45UcoEEuUnutRwJ1mYqQQoWY=;
        b=o8unBKpwvg78tiFz5S/TnNcRlgt1VbMTSi3pJ95eQz7vo/FauWSuk5QScGdReouG3L
         ZHapgDOD2f16K7Ql5i3TZuaOK73sVhtCRppfiYVkBBYB5B8yPqCm/F1vRYdoE5Y9tVwd
         hT0Ir05q2wbwguNDFp47kQeCD3F5ceI6lL0I9Agq90sx1WGH83yjPB6FYpErthRFDhFC
         yLSyhNQ7anN50gAyJO0zUpLXfbUeqsW3iIPb970akqT02bMciFr4d9RBOj2ZO8I9xa2D
         UiuMVIhUVfAFocVJ3LTIXFvPtBdg6KorTwD10ntA6D4xLpKhIuyD6HxDD1qUhyoaILzO
         CsVA==
X-Forwarded-Encrypted: i=1; AKwUvBzXdwrX/UUscPbm8Gfs4ptIFJNwUWEDL1finA3Q4oXJv/H2UMeHpRULxxTM60tgGuIn6gn9@lists.linux.dev
X-Gm-Message-State: AFq9FYLgYfHhC+GmJmt+kl09DLX52ymH+80f2Qzq1/PdFa95aUGMRGmZ
	PsX0QPEa+4ma/f+IVJrAdsVXP4wdC+CD8P4DC06eTm7A9N2m3FsMMRhJ
X-Gm-Gg: AYBFou0nzPGyTTnDuehPhveJ1OT3kGvG3P20sFDyNYH/3Ae+h+J22ymq5ilyEpfrzQp
	wQhELsMgitKXICR9FZR/hNkik39ckOs22DCpX6v2Tw7XV/obypixpK3976pI7bwyHSxNAl3YiQ5
	6P8hq33RPi0vP0HeyAnWDERqxJtp0SNjaTy5PGnwLakukX4wyesbr+E5gihch/Lqwz77TmFUPZV
	uhjAwxYsTsBhL9Ag+AXhmODLt0rJTKvAneDdzaqNGR0eD+zrm79df2NMYKmTzp8iwOvAd3ZIUEE
	DKXEthqdXQ+kf7708oNLN3Dkg9hl51CvUkCRPd7XeV/NXmsE/f0HN5IQjWhMXRoriOFlrm7vr+L
	eKUVxv9pHFUTnFXPppGcaGqNbnb1KAEzAL/UCe/cE8/6SDdSgF/6jaQeTmx6vNBXDx3Y8RFWBKB
	VNgfsdHRZvKB2JWZQRLP4ygMZi6sRZuxIqC2y/G1SqJ0zzJLtg63Nk81vpyN6GfL0bcrQ1B9w=
X-Received: by 2002:a17:90a:ec8f:b0:3a0:22bd:6ef6 with SMTP id 98e67ed59e1d1-3a4d0f03a1amr417944a91.2.1790756062115;
        Wed, 30 Sep 2026 01:14:22 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce40a6d5sm1974462a91.15.2026.09.30.01.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:14:21 -0700 (PDT)
Date: Wed, 30 Sep 2026 17:14:19 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ntfs: balance the $MFT runlist lock in data
 extension error paths
Message-ID: <arzE28Mcte2g2-KW@hyunchul-PC02>
References: <20260930033556.169300-1-matthias.goergens@gmail.com>
 <20260930033556.169300-2-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930033556.169300-2-matthias.goergens@gmail.com>

Hi Matthias,

On Wed, Sep 30, 2026 at 11:35:55AM +0800, Matthias Goergens wrote:
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
> which were never written.  If the truncation fails, the runlist may
> still reference the clusters, so they are not freed.  In that case, and
> if the copy cannot be allocated, the clusters stay allocated and the
> volume is marked for chkdsk.
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
> v2: do not free the clusters if ntfs_rl_truncate_nolock() fails
> (Hyunchul Lee).
> 
> Without this patch, a forced map_mft_record() failure gives "WARNING:
> lock held when returning to user space" for the $MFT runlist lock, and
> the next file create and $MFT writeback block on it.  A forced lookup
> failure in restore_undo_alloc gives "bad unlock balance".  With it, the
> create fails with EIO, lockdep stays quiet and the volume keeps working,
> also when the copy allocation is forced to fail.  With the truncation
> forced to fail, nothing is freed that $MFT's runlist still maps.  $MFT
> growth on a fragmented volume behaves as before.
> 
>  fs/ntfs/mft.c | 59 ++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 51 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index e01e367a588d..8edc65911aa2 100644
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

Would it be worth considering preserving the rl2 returned by 
ntfs_cluster_alloc(), instead of re-allocating the tail with
ntfs_mft_copy_tail() during rollback.

It can avoid the runlist scanning and kmemdup(). I think that we could 
introduce a variant of ntfs_runlists_merge() to preserve the source
runlist.

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
> @@ -2026,15 +2054,30 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
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
> +	 * dropped, as lcnbmp_lock nests outside it (see above).  If the
> +	 * runlist cannot be truncated or the copy cannot be allocated, the
> +	 * clusters stay allocated until chkdsk.
> +	 */
> +	down_write(&mft_ni->runlist.lock);
> +	tail_rl = ntfs_mft_copy_tail(mft_ni->runlist.rl, old_last_vcn);
>  	if (ntfs_rl_truncate_nolock(vol, &mft_ni->runlist, old_last_vcn)) {
>  		ntfs_error(vol->sb, "Failed to truncate mft data attribute runlist.%s", es);
>  		NVolSetErrors(vol);
> +		/* The runlist may still reference the clusters, so keep them. */
> +		if (!IS_ERR(tail_rl))
> +			kfree(tail_rl);
> +		tail_rl = NULL;
> +	}
> +	up_write(&mft_ni->runlist.lock);
> +	if (IS_ERR(tail_rl) || ntfs_cluster_free_from_rl(vol, tail_rl)) {
> +		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
> +		NVolSetErrors(vol);
>  	}
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
