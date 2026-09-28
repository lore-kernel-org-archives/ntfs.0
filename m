Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B2D45D908
	for <ntfs@lists.linux.dev>; Mon, 28 Sep 2026 07:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578954; cv=none; b=lcQhRW6tX0opfwPYRmeSZPrOZlYA31Y5yLiUBa9OXKAaFEA0XN7Nf20YErnoo2liegXBTPj/uP023yCH5PYVrWbCcvmGk0smhII/RxoOAmadQFAvBL+vp11OB7iYuF7P7Yjp4Gp7qjoPPha2sWd+kRLeVbarR5eWkk138V8hync=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578954; c=relaxed/simple;
	bh=dCB6Bs/8gvDqSPCgP9V23Z4XNpwbRW9q4cE+KIMKmy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbv2mgli4qokWIQeIBWMxQh5qMLsLoeHYBtGWxjQoZ9ZbUFYUZBPch8agHIooqm5w3lqK+LN+wmytcxEduvVXl+XWAqr8xj3Dfu3Q1XACz2A6R5hWr69r0wLRs4nfcPkhDgHLv0mX3GBbxRUdvJk2oerO6n1lNl6wPpxu837uIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ER6or+Na; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ER6or+Na"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86212a185dcso1906509b3a.1
        for <ntfs@lists.linux.dev>; Mon, 28 Sep 2026 00:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790578952; x=1791183752; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lrBhSjeoQJHkdV/An2nOKm+QUssNk0bjUWkbA1WyVKk=;
        b=ER6or+NafuHuxBbf/44bLH0r8oSkrJLD+XCYamI10lUNDZXqSIjqoytopW/Bxf2MZH
         g4oFoSjIReaaaELolpPz2RhOwsTRrYlsvqq5rmpy2ZyW3jtytq59KXNEBn/86luh3A+e
         PYXhXapr2wbVmxxPTxUuKF1cjpkLUPGe4Q0gQXHe9S/H6J3MWeB+bU8YiaW2mVyTjsg3
         7VR2aSAjia5Sw59nmuo6mwuXJllRHJQafUXy6jADWtUYftFwqwPVkQSlQ5Jx6pRssKK3
         rklM078jLiArOU7T+yLAzv9NFEzFHM0AiUVgxbCUbwkbE2cSM3RS+AgUBW/XL7cs3zHJ
         znVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578952; x=1791183752;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lrBhSjeoQJHkdV/An2nOKm+QUssNk0bjUWkbA1WyVKk=;
        b=v3TAzfsG/MTFdALVVCFbR0hl2uRUqfk8U5QpINFy4EdFCas4T4KSE6c7NQP51f0WyU
         AqM9PlJeZ3jKB8CY2L8f1bYqbqG5ZMgnui1Tvu56Lo07Jv+bhDQVyIyEdx00lz1U1t3N
         yakiPKTTd2UJGFqvBWHxt+aCcregn/goXqyk8Fp2Keu2CU/j2NvICGluR5VyevDwO7q0
         +fLW5gA5q1KWo86weV2pf81k54CIONwOGjmpTHKUD0b9wTrPlyQFfSNklE8//YOEo+RN
         uoSYa001zayOQYs/C24Dsrbbv4Jev0IpTc+1FLJi+a++TojUvOZIBCtwMQWX1yWJaltD
         NwXw==
X-Forwarded-Encrypted: i=1; AKwUvBxNN5HZMKtWBUfdFE+lAH05GnmbftUWp1PlFdZHtBvOXHh/KO97Rx4+IdI+AD0ZaPaxFzBL@lists.linux.dev
X-Gm-Message-State: AFuF++lHDS9qfRWEJTfDM5kk/9EBE0hYG2hIiJ4DfY77BFTLa0ItsDZ9
	/fkiO9A8/Y4Z2VOH7REW60Hb81QH0gDeQ/Ng6WW152Q1v5xXbYRfQkRX
X-Gm-Gg: AYBFou2tsfX9R4OCFp2rpahrwus75Cw6T6ClXpaqPDvTsPaNI8oYEOh5X0k0EIhgFT5
	tLa+PzOgDihVSytPdVuBzE5ctmYgRgLL6BH9MywFIzr9DMw7a5ELy7wtttFdeMpm0d6gLt1KyMu
	PNnbvME5KBAMU0bKNz136J8FJILW8DBh0MCdlnpWNPJmVnR7V+UZR6vzMEYCsRnVI6OLtihkrhP
	ouPZOHnFlK7txtjbPx+oVJLfGOhn9+sZjKbF/9lQsl1qsAFX3DVpJjdWCMVnRO7vHIP8dWvIgSl
	uXVaJg+txHTRWOXZ9EuwlUnlPEmrSyu5nBz0b1XBhOqTVQANiNgXJeqoBIIkPNBz+mK+Dher0lm
	gKgZc/sIetfUaSlQBdc22nmFo2kQTRR5T8fEwS1gD0/N4m0GPtP0v43AM6QmQfEsL9DmwVozcRu
	wDX0t6yqIws44dtWemCfTlglWdpmMVJoYm6jbIiCylHtC1XkMlB1Uw/E+e6d2p
X-Received: by 2002:a05:6a00:4087:b0:878:34d7:6a32 with SMTP id d2e1a72fcca58-87e9ea62357mr9915782b3a.38.1790578950773;
        Mon, 28 Sep 2026 00:02:30 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea78fedbsm3633759b3a.23.2026.09.28.00.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:02:29 -0700 (PDT)
Date: Mon, 28 Sep 2026 16:02:27 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ntfs: hold the runlist lock while expanding a
 non-resident attribute
Message-ID: <aroRA0mPkFjvksy3@hyunchul-PC02>
References: <20260927063149.3356920-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927063149.3356920-1-matthias.goergens@gmail.com>

On Sun, Sep 27, 2026 at 02:31:49PM +0800, Matthias Goergens wrote:
> ntfs_non_resident_attr_expand() changes ni->runlist.rl while it
> allocates clusters: ntfs_attr_map_whole_runlist(), the compressed
> branch's ntfs_rl_realloc() and ntfs_runlists_merge() can each kvfree()
> the old array.  Unless the caller already holds ni->runlist.lock, none
> of this happens under it; only the rollback takes it.  Callers without
> it include the write path, fallocate, ntfs_inode_attr_pwrite() and
> ntfs_resident_attr_resize().
> 
> Those callers hold mrec_lock, and the write path also inode_lock, but
> the iomap read side takes neither: FIEMAP, page faults, readahead and
> splice read reach ntfs_read_iomap_begin_non_resident(), which takes only
> ni->runlist.lock.  A FIEMAP running while write(2) extends the same file
> can walk the array that ntfs_runlists_merge() has just freed:
> 
>   BUG: KASAN: slab-use-after-free in ntfs_attr_vcn_to_rl+0x19b/0x200
> 
> A reader that finds a vcn unmapped in the stale array also maps it from
> disk into the runlist the writer is changing, which shows up as "Run
> lists overlap. Cannot merge!".
> 
> Take ni->runlist.lock for writing around the part of the expansion that
> changes the runlist and allocated_size, up to and including the mapping
> pairs update, as ntfs_non_resident_attr_shrink() does since commit
> 91709ba5d6d7 ("ntfs: protect runlist updates with the runlist lock"),
> and hold it throughout the rollback, where ntfs_cluster_free() requires
> it.  The lock nests inside mrec_lock, as on the truncate-up path, which
> already calls this function with the runlist lock held.
> 
> For an $ATTRIBUTE_LIST whose lock the caller does not hold, drop the
> lock again before the mapping pairs update: that update can resize the
> same list through ntfs_attrlist_update_locked(), which returns -ENOSPC
> when told that the list's lock is held.  Holding it there made punching
> holes into a large fragmented file fail with -ENOSPC.
> 
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
> A reproducer that extends two files with interleaved clusters while
> FIEMAP loops over them hits the KASAN report above within two seconds in
> each of three runs; with this patch, three 60-second runs are clean.  I
> can send it privately if you want it.
> 
> Also tested in a VM with KASAN, lockdep and the hung task detector:
> writes past EOF, fallocate, truncate-up, sparse and compressed files,
> growing xattrs, directories and a non-resident attribute list, with
> FIEMAP after each step.  Output matches the unpatched kernel, and
> lockdep reports nothing.
> 
>  fs/ntfs/attrib.c | 72 ++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 51 insertions(+), 21 deletions(-)
> 
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index 333b3371acb47..a07acef3a03e8 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -4453,6 +4453,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>  	struct ntfs_inode *base_ni;
>  	struct super_block *sb = ni->vol->sb;
>  	size_t new_rl_count;
> +	bool runlist_locked = locked_ni == ni;
>  
>  	ntfs_debug("Inode 0x%llx, attr 0x%x, new size %lld old size %lld\n",
>  			(unsigned long long)ni->mft_no, ni->type,
> @@ -4494,10 +4495,17 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>  	 * clusters if there is a change.
>  	 */
>  	if (ntfs_bytes_to_cluster(vol, ni->allocated_size) < first_free_vcn) {
> +		/*
> +		 * The runlist array is replaced below.  Readers such as the
> +		 * iomap read path hold only the runlist lock, not mrec_lock.
> +		 */
> +		if (!runlist_locked)
> +			down_write(&ni->runlist.lock);

Could you add a locked_assert_held_write() check when runlist_locked is
true? This would catch callers which does not hold the runlist.lock. 

Otherwise this patch looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> +
>  		err = ntfs_attr_map_whole_runlist(ni);
>  		if (err) {
>  			ntfs_error(sb, "ntfs_attr_map_whole_runlist failed");
> -			return err;
> +			goto unlock_runlist;
>  		}
>  
>  		/*
> @@ -4522,7 +4530,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>  						last + more_entries + 1);
>  				if (IS_ERR(rl)) {
>  					err = -ENOMEM;
> -					goto put_err_out;
> +					goto unlock_runlist;
>  				}
>  
>  				alloc_size = ni->allocated_size;
> @@ -4547,7 +4555,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>  				rl = kmalloc(sizeof(struct runlist_element) * 2, GFP_NOFS);
>  				if (!rl) {
>  					err = -ENOMEM;
> -					goto put_err_out;
> +					goto unlock_runlist;
>  				}
>  
>  				rl[0].vcn = ntfs_bytes_to_cluster(vol, ni->allocated_size);
> @@ -4594,7 +4602,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>  				ntfs_debug("Cluster allocation failed (%lld)",
>  						(long long)first_free_vcn -
>  						ntfs_bytes_to_cluster(vol, ni->allocated_size));
> -				return PTR_ERR(rl);
> +				err = PTR_ERR(rl);
> +				goto unlock_runlist;
>  			}
>  			/*
>  			 * A contiguous ATTRIBUTE_LIST allocation keeps its mapping
> @@ -4618,8 +4627,10 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>  								ni->allocated_size),
>  						lcn_seek_from, DATA_ZONE, false,
>  						false, false);
> -				if (IS_ERR(rl))
> -					return PTR_ERR(rl);
> +				if (IS_ERR(rl)) {
> +					err = PTR_ERR(rl);
> +					goto unlock_runlist;
> +				}
>  			}
>  		}
>  
> @@ -4631,7 +4642,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>  				ntfs_error(sb, "Run list merge failed");
>  				ntfs_cluster_free_from_rl(vol, rl);
>  				kvfree(rl);
> -				return -EIO;
> +				err = -EIO;
> +				goto unlock_runlist;
>  			}
>  			ni->runlist.rl = rln;
>  			ni->runlist.count = new_rl_count;
> @@ -4639,11 +4651,28 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>  
>  		/* Prepare to mapping pairs update. */
>  		ni->allocated_size = ntfs_cluster_to_bytes(vol, first_free_vcn);
> -		err = ntfs_attr_update_mapping_pairs_locked(
> -				ni, 0, locked_ni);
> -		if (err) {
> -			ntfs_debug("Mapping pairs update failed");
> -			goto rollback;
> +		if (ni->type == AT_ATTRIBUTE_LIST && !runlist_locked) {
> +			/*
> +			 * Making room for the list's mapping pairs can resize
> +			 * this attribute list again through
> +			 * ntfs_attrlist_update_locked(), which takes its
> +			 * runlist lock.
> +			 */
> +			up_write(&ni->runlist.lock);
> +			err = ntfs_attr_update_mapping_pairs_locked(ni, 0,
> +								    locked_ni);
> +			if (err) {
> +				ntfs_debug("Mapping pairs update failed");
> +				goto rollback;
> +			}
> +		} else {
> +			err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
> +			if (err) {
> +				ntfs_debug("Mapping pairs update failed");
> +				goto rollback_locked;
> +			}
> +			if (!runlist_locked)
> +				up_write(&ni->runlist.lock);
>  		}
>  	}
>  
> @@ -4677,6 +4706,9 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>  	ntfs_attr_put_search_ctx(ctx);
>  	return 0;
>  rollback:
> +	if (!runlist_locked)
> +		down_write(&ni->runlist.lock);
> +rollback_locked:
>  	/* Free allocated clusters. */
>  	err2 = ntfs_cluster_free(ni, ntfs_bytes_to_cluster(vol, org_alloc_size),
>  				-1, ctx);
> @@ -4684,12 +4716,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>  		ntfs_debug("Leaking clusters");
>  
>  	/* Now, truncate the runlist itself. */
> -	if (ni != locked_ni)
> -		down_write(&ni->runlist.lock);
>  	err2 = ntfs_rl_truncate_nolock(vol, &ni->runlist,
>  			ntfs_bytes_to_cluster(vol, org_alloc_size));
> -	if (ni != locked_ni)
> -		up_write(&ni->runlist.lock);
>  	if (err2) {
>  		/*
>  		 * Failed to truncate the runlist, so just throw it away, it
> @@ -4702,12 +4730,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>  		/* Prepare to mapping pairs update. */
>  		ni->allocated_size = org_alloc_size;
>  		/* Restore mapping pairs. */
> -		if (ni != locked_ni)
> -			down_read(&ni->runlist.lock);
> -		if (__ntfs_attr_update_mapping_pairs(ni, 0, locked_ni, true))
> +		if (__ntfs_attr_update_mapping_pairs(ni, 0, ni, true))
>  			ntfs_error(sb, "Failed to restore old mapping pairs");
> -		if (ni != locked_ni)
> -			up_read(&ni->runlist.lock);
>  
>  		if (NInoSparse(ni) || NInoCompressed(ni)) {
>  			ni->itype.compressed.size =  org_compressed_size;
> @@ -4715,6 +4739,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>  		} else
>  			VFS_I(base_ni)->i_blocks = ni->allocated_size >> 9;
>  	}
> +	if (!runlist_locked)
> +		up_write(&ni->runlist.lock);
>  	if (ctx)
>  		ntfs_attr_put_search_ctx(ctx);
>  	return err;
> @@ -4722,6 +4748,10 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>  	if (ctx)
>  		ntfs_attr_put_search_ctx(ctx);
>  	return err;
> +unlock_runlist:
> +	if (!runlist_locked)
> +		up_write(&ni->runlist.lock);
> +	return err;
>  }
>  
>  /*
> 
> base-commit: 259abb551e2944998cad4214c201954ab1ac5c8d
> -- 
> 2.55.0
> 

-- 
Thanks,
Hyunchul
