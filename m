Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6D93BB66B
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790507226; cv=none; b=QRqSpcjSEy8of+gTKU1olXbSN9rdKT6vRPzHrGzDNuQR6f/CphdHK/f41AmhuK0hyrSxmE5J4p6HPsSNKKoKyeBLw05FH7LG6mpEkEaia8PTZud3lU2Pkohcj7+P5MKMAWtgfeEYm5ObZ9nAC/IS/KrBwoa/eCAbNSz3c001FZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790507226; c=relaxed/simple;
	bh=aiq7B4bPRKF1TJLmFkgbIuH2DEfZ6XMGvpvLJtCMyX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iMFidVBgkLjwW3l+sevt0U7lWo6Khdg/WpqAuY33mwImUBX1g2Pei5TafYbGbWHRk9Za6k/ZX7b9kG2SlWo1SkYLbz7D/oNE1SiPXbln8MD5tZFTY3a0WBrymlFMsKRBQUYtHvb8gjqnYI/oBIf56o+/HMsENHEO8kOuMr9Avbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NYyahw0c; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NYyahw0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=bqXA3/q1Ke1Rrhjdu3cp9cj6b1KPze010o4jTafdRnI=;
	b=NYyahw0cIdkO7oIwv5ZOVxNRwJSnNJNAuqcXomO47gr7N3AM6dwJuq+xNk+BIB
	tHxxAprdHeyvulotvhMB6MeONPi4fdAzq6pfMn/D/TXaRbPJ5pAF2Nv27dyqKHw7
	qHEbragV8D1D9btJqg0Wk/nlNlz5h6R9xEvys5jZg4gsU=
Received: from [IPV6:2409:8949:6ca0:7910:556a:2884:1c35:3923] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD39_zJ+Lhqx0LYBA--.3715S2;
	Sun, 27 Sep 2026 19:06:50 +0800 (CST)
Message-ID: <1b2a44db-de4c-4fbd-84a9-3c8fd3c9fce8@163.com>
Date: Sun, 27 Sep 2026 19:06:49 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: hold the runlist lock while expanding a
 non-resident attribute
To: Matthias Goergens <matthias.goergens@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260927063149.3356920-1-matthias.goergens@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260927063149.3356920-1-matthias.goergens@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD39_zJ+Lhqx0LYBA--.3715S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtFykAr43tFy8Jw43XFyDtrb_yoWfWFW5p3
	9I9rZxtw45ZwnIqrn7tw1jg3Wfuw1kK3yUuryUGw1Iyan8tw1IqFyxKFyrXFWxtrWkJan5
	JF4UCrW7C3yqvFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U24iUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwgs5BGq4+MvlXAAA3s



在 2026/9/27 14:31, Matthias Goergens 写道:
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
>    BUG: KASAN: slab-use-after-free in ntfs_attr_vcn_to_rl+0x19b/0x200
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
>   fs/ntfs/attrib.c | 72 ++++++++++++++++++++++++++++++++++--------------
>   1 file changed, 51 insertions(+), 21 deletions(-)
> 
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index 333b3371acb47..a07acef3a03e8 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -4453,6 +4453,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>   	struct ntfs_inode *base_ni;
>   	struct super_block *sb = ni->vol->sb;
>   	size_t new_rl_count;
> +	bool runlist_locked = locked_ni == ni;
>   
>   	ntfs_debug("Inode 0x%llx, attr 0x%x, new size %lld old size %lld\n",
>   			(unsigned long long)ni->mft_no, ni->type,
> @@ -4494,10 +4495,17 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>   	 * clusters if there is a change.
>   	 */
>   	if (ntfs_bytes_to_cluster(vol, ni->allocated_size) < first_free_vcn) {
> +		/*
> +		 * The runlist array is replaced below.  Readers such as the
> +		 * iomap read path hold only the runlist lock, not mrec_lock.
> +		 */
> +		if (!runlist_locked)
> +			down_write(&ni->runlist.lock);
> +
>   		err = ntfs_attr_map_whole_runlist(ni);
>   		if (err) {
>   			ntfs_error(sb, "ntfs_attr_map_whole_runlist failed");
> -			return err;
> +			goto unlock_runlist;
>   		}
>   
>   		/*
> @@ -4522,7 +4530,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>   						last + more_entries + 1);
>   				if (IS_ERR(rl)) {
>   					err = -ENOMEM;
> -					goto put_err_out;
> +					goto unlock_runlist;
>   				}
>   
>   				alloc_size = ni->allocated_size;
> @@ -4547,7 +4555,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>   				rl = kmalloc(sizeof(struct runlist_element) * 2, GFP_NOFS);
>   				if (!rl) {
>   					err = -ENOMEM;
> -					goto put_err_out;
> +					goto unlock_runlist;
>   				}
>   
>   				rl[0].vcn = ntfs_bytes_to_cluster(vol, ni->allocated_size);
> @@ -4594,7 +4602,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>   				ntfs_debug("Cluster allocation failed (%lld)",
>   						(long long)first_free_vcn -
>   						ntfs_bytes_to_cluster(vol, ni->allocated_size));
> -				return PTR_ERR(rl);
> +				err = PTR_ERR(rl);
> +				goto unlock_runlist;
>   			}
>   			/*
>   			 * A contiguous ATTRIBUTE_LIST allocation keeps its mapping
> @@ -4618,8 +4627,10 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>   								ni->allocated_size),
>   						lcn_seek_from, DATA_ZONE, false,
>   						false, false);
> -				if (IS_ERR(rl))
> -					return PTR_ERR(rl);
> +				if (IS_ERR(rl)) {
> +					err = PTR_ERR(rl);
> +					goto unlock_runlist;
> +				}
>   			}
>   		}
>   
> @@ -4631,7 +4642,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>   				ntfs_error(sb, "Run list merge failed");
>   				ntfs_cluster_free_from_rl(vol, rl);
>   				kvfree(rl);
> -				return -EIO;
> +				err = -EIO;
> +				goto unlock_runlist;
>   			}
>   			ni->runlist.rl = rln;
>   			ni->runlist.count = new_rl_count;
> @@ -4639,11 +4651,28 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>   
>   		/* Prepare to mapping pairs update. */
>   		ni->allocated_size = ntfs_cluster_to_bytes(vol, first_free_vcn);
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
>   		}
>   	}
>   
> @@ -4677,6 +4706,9 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>   	ntfs_attr_put_search_ctx(ctx);
>   	return 0;
>   rollback:
> +	if (!runlist_locked)
> +		down_write(&ni->runlist.lock);
> +rollback_locked:
>   	/* Free allocated clusters. */
>   	err2 = ntfs_cluster_free(ni, ntfs_bytes_to_cluster(vol, org_alloc_size),
>   				-1, ctx);
> @@ -4684,12 +4716,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>   		ntfs_debug("Leaking clusters");
>   
>   	/* Now, truncate the runlist itself. */
> -	if (ni != locked_ni)
> -		down_write(&ni->runlist.lock);
>   	err2 = ntfs_rl_truncate_nolock(vol, &ni->runlist,
>   			ntfs_bytes_to_cluster(vol, org_alloc_size));
> -	if (ni != locked_ni)
> -		up_write(&ni->runlist.lock);
>   	if (err2) {
>   		/*
>   		 * Failed to truncate the runlist, so just throw it away, it
> @@ -4702,12 +4730,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>   		/* Prepare to mapping pairs update. */
>   		ni->allocated_size = org_alloc_size;
>   		/* Restore mapping pairs. */
> -		if (ni != locked_ni)
> -			down_read(&ni->runlist.lock);
> -		if (__ntfs_attr_update_mapping_pairs(ni, 0, locked_ni, true))
> +		if (__ntfs_attr_update_mapping_pairs(ni, 0, ni, true))
>   			ntfs_error(sb, "Failed to restore old mapping pairs");
> -		if (ni != locked_ni)
> -			up_read(&ni->runlist.lock);
>   
>   		if (NInoSparse(ni) || NInoCompressed(ni)) {
>   			ni->itype.compressed.size =  org_compressed_size;
> @@ -4715,6 +4739,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>   		} else
>   			VFS_I(base_ni)->i_blocks = ni->allocated_size >> 9;
>   	}
> +	if (!runlist_locked)
> +		up_write(&ni->runlist.lock);
>   	if (ctx)
>   		ntfs_attr_put_search_ctx(ctx);
>   	return err;
> @@ -4722,6 +4748,10 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>   	if (ctx)
>   		ntfs_attr_put_search_ctx(ctx);
>   	return err;
> +unlock_runlist:
> +	if (!runlist_locked)
> +		up_write(&ni->runlist.lock);
> +	return err;
>   }
>   
>   /*
> 
> base-commit: 259abb551e2944998cad4214c201954ab1ac5c8d

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

