Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412883;
	b=4BKO4Q6wrfbk74CVECV4U+UH39wltLn3Yfu/jPWkyA3lnzQq7fIjB+YCBENU0/b42HpQ
	 cn9JFiZCgYhkLYCWbvLmQPEYalMAiC9APqcOMaRn3qfbPPg/EGlvHe4AYq0f8Nrpe5tra
	 IQrWar+DyZfflsP4V0tFwAxmgJsZZssrfBCv73GE1zlCeqmPuwjD/3c4pl6aafahIpy9U
	 GBD7uN51gGan8XZ6Jso99Xrwu9fVtuaWfAb6nf6l8YGe0Q0/Dbx6eRffUw69g7A+Ls4OY
	 FuXYTIvBKYdmfFrIwlI8EIDdpuE7kfdRiiAu3EFI0bhbAvTBQyW4HsP2/8iymsB6IDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=C6kM09UB5CIeWG4FIgxtnyVAELn2QRDca2eMQrsTeqQ=;
	b=MxmtFsEQO4m/kDssmL3edd8ddwywWgpedo5xp94xvS0+Y0No8MJufBia4CeZ2SvsSBKG
	 lEd5j03yLtG0xVSGXPrnnbOFsDA7zae4PDA7SkSTSs7SJv2T7iLmgbZ8ZnRw5k2IwRyoI
	 /IUECVAQJeF7vnz/x2j3eDFZGK93yorHLBdyO6ui1QIZ9klkwgS2/1os6bv1ajLoYL0aM
	 nHJWT2+lUPgCA8CajVh9xWxYJjgAHdWTF2euiKjezEwfopN++oYsaJCTQp86OvEbqD+RH
	 laHKJiymdQCnYA8Iwtev5x92R5v8ublhFUJu9eTqPVTzDaESQLNTxRW1Yla4ZFRdlpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IkIO4Y/l";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0BA606A31A
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 05:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A0BA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IkIO4Y/l
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b3af93b85cso1598634a91.1
        for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 21:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795412882; x=1796017682; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6kM09UB5CIeWG4FIgxtnyVAELn2QRDca2eMQrsTeqQ=;
        b=IkIO4Y/lFMSX/iRJxupr4nv29aGaXS/VGJNbj70LY8ddpLEtEe5BN1dm8ZYZsICZo1
         spvK7LJbxeq6Yw77WmxUsO/4zsHEZgv6Eiagr4eX1KKyKrO2xA7aeYxFWjk8FJqsoTSF
         fWGtEM/RZj4CwBpuL1QpaL6M25Jg1RDp+ghQ98mE5wZcEHPKDo6qRm8Os/WNR0P+tpix
         khWR3Fhtc+PtgUDh4t+npueoFtPVyZgmTE2a1UeDI9050PWLKrFMAhMFahOhLcNsNVGz
         vymq8Ar2A7RWrrJEx+0UzYs1Cn64zlirAQS8cjABISnFdDoyBpAhAY5Kz/z3hJGpalLM
         AwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412882; x=1796017682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6kM09UB5CIeWG4FIgxtnyVAELn2QRDca2eMQrsTeqQ=;
        b=lPTXZrnTwftf8Il5adSlOqikFFcc9udH9r1HzWmxsns0YK3zBwtH1Y7Z5qgvI5dSzh
         zTx/au6WYW6olNutHO5kp31GQ55DsI6JeZ4tAj3fSh6lNXDjYkYOAedl1SSDJU+HFbyd
         xMMy2V02NZJM6KCYNiHBQlNYxY6ttJ2ntrXB1tTja9bjxIfv0TKO044kT0omp4M33NzS
         diZS7h7Wu+t0bIz/vWk37SstG9n8eUAoc9BFw1q6TipliRURLfEEiwOYoqtJwcxU0b2d
         np47FGB8vub/RSrCH3R3R9usKHOQFfPO+OfF6sFpYMgsDJGuuJ7pxR6pMIEnXdO/Oebj
         IzTg==
X-Forwarded-Encrypted: i=1; AL+hErHxKMnHZVg1a0hJopWX3+VOvjDTGK9wca3iZPeDMnOpbrTLGnS2oEjAP+Ouic45EIcEKckj@lists.linux.dev
X-Gm-Message-State: APuU4Z8kgcjBjq9l36nNLFhJYDa4mHRcZOulMkYGwhI6PjkJdhhf2q0J
	Ch90E7EQsXcbO9j7NbnyTVbD4URPskQvRkWu19mbURPc7w354hmJOlm1
X-Gm-Gg: AZFdTZfSONe/l/IZ9gfn0WTCBRrNic/aC63v3yZtbQ7cvTzVoYQ7+t3hXyA/pWQc/ps
	Irg1lirxWR2EIW8FTjuw8LuKSlMtk1wtdMcWRDYrGAzcObYn0pYOvFjlRAMlkqsRJj7Apnzy4nW
	r0rtCbP137qn9gpul8W1Naq0XchTXR5iOIaaCjbwfetesHoXwJ9ho7pMQsDYpWAi6BOsZ9CIbOE
	fcwMl5w1Xmy2RaV1X0ft0ljFZ/wJNAd23/7+MhnDHYZG2pIR21QhkF7LejjlLje9EEkDFLzBTTU
	CjvKrbzQWidlSSW81R64mqA5Fo+K4Hqa3ZNvPpwoavnQhI3uDmrBdLDBniAKqx/J7If3XBWG3tQ
	3GdoO+57f3Y+ZXxgYeS0Eljmqbq6fw9YpRT+XY48N/9TUGOFJERqvwfGaN+nA8j7JycOMn8jpLf
	AtJisw9YgBdqfpZEm6c5SlInSAO5VaMCQfp2iatZC94xlKqMVibl+9YKnWZsCfGDAPkxCCQOEEr
	2UI2QDpbVlfhM43hG/jbD6d9M89xImg1d0vJJu30VrsIvBtN87nFIjkGhnquyGxtySoHB4aU1HQ
	IeQghrE4AlrXu6aVBHI=
X-Received: by 2002:a17:90b:4a48:b0:3b1:2d60:66cc with SMTP id 98e67ed59e1d1-3b41c7b56bemr9221452a91.8.1795412881662;
        Sun, 22 Nov 2026 21:48:01 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm18719260a91.13.2026.11.22.21.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:48:00 -0800 (PST)
Date: Mon, 23 Nov 2026 14:47:58 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: ernest.borowski.git@proton.me
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Baolin Liu <liubaolin12138@163.com>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng1024@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 5/7] ntfs: punch out the delalloc reservation of a failed
 buffered write
Message-ID: <awPTjheQrp6sxB5W@hyunchul-PC02>
References: <20261122-b4-ntfs-delalloc-fixes-v1-0-0726f0dce403@proton.me>
 <20261122-b4-ntfs-delalloc-fixes-v1-5-0726f0dce403@proton.me>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261122-b4-ntfs-delalloc-fixes-v1-5-0726f0dce403@proton.me>

On Sun, Nov 22, 2026 at 07:19:41PM +0100, Ernest Borowski via B4 Relay wrote:
> From: Ernest Borowski <ernest.borowski.git@proton.me>
> 
> ntfs_write_simple_iomap_begin_non_resident() turns the holes a buffered
> write covers into LCN_DELALLOC runs and reserves their clusters before
> any data is copied.  If the copy then fails or comes up short (EFAULT
> from the user buffer, a fatal signal), the clusters that no dirty folio
> covers stay delalloc.  Writeback never allocates them, so the
> reservation is kept until the inode is evicted, and the stale runs
> survive the writeback that fallocate() relies on before it edits the
> runlist.
> 
> Reproducer: a pwrite() of 512 KiB from an unmapped address into a hole
> of a 1 MiB sparse file fails with EFAULT and leaves 128 (4 KiB) clusters
> reserved after sync.  A FALLOC_FL_PUNCH_HOLE or COLLAPSE_RANGE through
> the range then hits the run splitting bug fixed by the previous patch.
> 
> Do what XFS does: in ->iomap_end() of a delalloc mapping that was not
> written completely, let iomap_write_delalloc_release() find the ranges
> without dirty data and turn the clusters entirely inside them back into
> holes, releasing their reservation.  Clusters that still hold dirty data
> stay delalloc, including the partial first and last clusters of an
> unaligned write that ->iomap_begin() zeroed in the page cache; those are
> written back as zeros, as before.  Delalloc runs are holes on disk, so
> the mapping pairs do not change.
> 
> The error path of ->iomap_begin() itself, taken when zeroing the edges
> of the new run fails, only subtracted the reservation and left the run
> and i_dealloc_clusters in place, so a later truncate or eviction would
> release it a second time.  Use the same release there.
> 
> Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ernest Borowski <ernest.borowski.git@proton.me>
> ---
>  fs/ntfs/attrib.c | 63 +++++++++++++++++++++++++++++++++++++++++++++++++
>  fs/ntfs/attrib.h |  1 +
>  fs/ntfs/iomap.c  | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 134 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index 39fa983cd8..7c19e4534a 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -4416,6 +4416,69 @@ void ntfs_release_delalloc_from(struct ntfs_inode *ni, s64 start_vcn)
>  	ni->i_dealloc_clusters -= min_t(s64, nr, ni->i_dealloc_clusters);
>  }
>  
> +/*
> + * ntfs_attr_punch_delalloc - turn delalloc runs back into holes
> + * @ni:		non-resident ntfs attribute
> + * @start_vcn:	first vcn of the range
> + * @len:	number of clusters in the range
> + *
> + * Turn the LCN_DELALLOC parts of [@start_vcn, @start_vcn + @len) into holes
> + * and give back their reservation.  Used when a buffered write that reserved
> + * them failed before it dirtied any folio over them, so that writeback will
> + * never allocate them.  Runs that are not delalloc (anymore) are left alone.
> + * Delalloc runs are stored as holes on disk, so the mapping pairs need no
> + * update.
> + *
> + * The caller holds the mrec_lock of the base inode and the runlist lock for
> + * writing.
> + */
> +void ntfs_attr_punch_delalloc(struct ntfs_inode *ni, s64 start_vcn, s64 len)
> +{
> +	struct runlist_element *rl, *punch_rl;
> +	s64 vcn = start_vcn, end_vcn = start_vcn + len, run_end;
> +	size_t new_rl_count;
> +	int rl_count, err;
> +
> +	lockdep_assert_held_write(&ni->runlist.lock);
> +
> +	err = ntfs_attr_map_whole_runlist(ni);
> +	if (err) {
> +		ntfs_error(ni->vol->sb,
> +			   "Failed to map the runlist to drop delalloc runs: %d", err);
> +		return;
> +	}
> +
> +	while (vcn < end_vcn) {
> +		rl = ntfs_rl_find_vcn_nolock(ni->runlist.rl, vcn);
> +		if (!rl || !rl->length)
> +			break;
> +		run_end = min(rl->vcn + rl->length, end_vcn);
> +		if (rl->lcn != LCN_DELALLOC) {
> +			vcn = run_end;
> +			continue;
> +		}
> +
> +		for (rl = ni->runlist.rl, rl_count = 0; rl->length; rl++)
> +			rl_count++;
> +		rl = ntfs_rl_punch_hole(ni->runlist.rl, rl_count + 1, vcn,
> +					run_end - vcn, &punch_rl, &new_rl_count);
> +		if (IS_ERR(rl)) {
> +			ntfs_error(ni->vol->sb,
> +				   "Failed to drop delalloc run at vcn 0x%llx: %ld",
> +				   vcn, PTR_ERR(rl));
> +			break;
> +		}
> +		kvfree(punch_rl);
> +		ni->runlist.rl = rl;
> +		ni->runlist.count = new_rl_count;
> +
> +		ntfs_release_dirty_clusters(ni->vol, run_end - vcn);
> +		ni->i_dealloc_clusters -= min_t(s64, run_end - vcn,
> +						ni->i_dealloc_clusters);
> +		vcn = run_end;
> +	}
> +}
> +
>  /*
>   * ntfs_non_resident_attr_shrink - shrink a non-resident, open ntfs attribute
>   * @ni:		non-resident ntfs attribute to shrink
> diff --git a/fs/ntfs/attrib.h b/fs/ntfs/attrib.h
> index faa2dfba3a..ca2a8b53a4 100644
> --- a/fs/ntfs/attrib.h
> +++ b/fs/ntfs/attrib.h
> @@ -110,6 +110,7 @@ int ntfs_non_resident_attr_insert_range(struct ntfs_inode *ni, s64 start_vcn, s6
>  int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn, s64 len);
>  int ntfs_non_resident_attr_punch_hole(struct ntfs_inode *ni, s64 start_vcn, s64 len);
>  void ntfs_release_delalloc_from(struct ntfs_inode *ni, s64 start_vcn);
> +void ntfs_attr_punch_delalloc(struct ntfs_inode *ni, s64 start_vcn, s64 len);
>  int __ntfs_attr_truncate_vfs(struct ntfs_inode *ni, const s64 newsize,
>  		const s64 i_size);
>  int ntfs_attr_expand(struct ntfs_inode *ni, const s64 newsize, const s64 prealloc_size);
> diff --git a/fs/ntfs/iomap.c b/fs/ntfs/iomap.c
> index ce916707f6..1909824c30 100644
> --- a/fs/ntfs/iomap.c
> +++ b/fs/ntfs/iomap.c
> @@ -372,6 +372,10 @@ static int ntfs_zero_range(struct inode *inode, loff_t offset, loff_t length)
>  				NULL);
>  }
>  
> +static void ntfs_write_delalloc_release(struct inode *inode, loff_t pos,
> +					loff_t length, ssize_t written,
> +					unsigned int flags, struct iomap *iomap);
> +
>  static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_t offset,
>  						      loff_t length, struct iomap *iomap)
>  {
> @@ -543,7 +547,13 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
>  			if (err == -EPERM)
>  				err = 0;
>  			if (err) {
> -				ntfs_release_dirty_clusters(vol, max_clu_count);
> +				/*
> +				 * Nothing will be copied: drop the delalloc
> +				 * clusters that no zeroed folio covers.
> +				 */
> +				ntfs_write_delalloc_release(inode, offset,
> +							    iomap->length, 0,
> +							    IOMAP_WRITE, iomap);
>  				return err;
>  			}
>  		}
> @@ -762,6 +772,61 @@ static int ntfs_write_iomap_end_resident(struct inode *inode, loff_t pos,
>  	return written;
>  }
>  
> +static void ntfs_write_delalloc_punch(struct inode *inode, loff_t offset,
> +				      loff_t length, struct iomap *iomap)
> +{
> +	struct ntfs_inode *ni = NTFS_I(inode);
> +	struct ntfs_inode *mrec_ni = ntfs_inode_is_named_stream(ni) ?
> +			ntfs_base_inode(ni) : ni;
> +	struct ntfs_volume *vol = ni->vol;
> +	/* Clusters that still hold some dirty data stay delalloc. */
> +	loff_t start = round_up(offset, vol->cluster_size);
> +	loff_t end = round_down(offset + length, vol->cluster_size);
> +
> +	if (start >= end)
> +		return;

Could this leave clean dealloc clusters reserved?

For example, with 1 KiB clusters and 512-byte blocks,
iomap_write_dealloc_ifs_punch() calls this callback seperately for each
clean block in a dirty folio. For a cluster covering [1024, 2048),
the callback receives [1024, 1536) and [1536, 2048) separately. Rounding
each range produces an empty punch range, so neither call removes
the reservation, even if the entire cluster is clean.

> +
> +	mutex_lock(&mrec_ni->mrec_lock);
> +	down_write(&ni->runlist.lock);
> +	ntfs_attr_punch_delalloc(ni, ntfs_bytes_to_cluster(vol, start),
> +				 ntfs_bytes_to_cluster(vol, end - start));
> +	up_write(&ni->runlist.lock);
> +	mutex_unlock(&mrec_ni->mrec_lock);
> +}
> +
> +/*
> + * A buffered write that failed or copied less than it mapped leaves delalloc
> + * clusters that no dirty folio covers: writeback never allocates them, so
> + * their reservation would stay until the inode is evicted, and the stale
> + * delalloc runs would outlive the flush done by fallocate() and friends.
> + * Punch them out again, keeping every cluster that has dirty data in the
> + * page cache.
> + */
> +static void ntfs_write_delalloc_release(struct inode *inode, loff_t pos,
> +					loff_t length, ssize_t written,
> +					unsigned int flags, struct iomap *iomap)
> +{
> +	struct ntfs_volume *vol = NTFS_I(inode)->vol;
> +	loff_t start_byte, end_byte;
> +
> +	/*
> +	 * Delalloc is reserved per cluster, which can be larger than the
> +	 * block size iomap_last_written_block() would round to.
> +	 */
> +	if (written)
> +		start_byte = round_up(pos + written, vol->cluster_size);
> +	else
> +		start_byte = round_down(pos, vol->cluster_size);
> +	end_byte = round_up(pos + length, vol->cluster_size);
> +	if (start_byte >= end_byte)
> +		return;
> +
> +	filemap_invalidate_lock(inode->i_mapping);
> +	iomap_write_delalloc_release(inode, start_byte, end_byte, flags, iomap,
> +				     ntfs_write_delalloc_punch);
> +	filemap_invalidate_unlock(inode->i_mapping);
> +}
> +
>  static int ntfs_write_iomap_end(struct inode *inode, loff_t pos, loff_t length,
>  				ssize_t written, unsigned int flags,
>  				struct iomap *iomap)
> @@ -769,6 +834,10 @@ static int ntfs_write_iomap_end(struct inode *inode, loff_t pos, loff_t length,
>  	if (iomap->type == IOMAP_INLINE)
>  		return ntfs_write_iomap_end_resident(inode, pos, length,
>  						     written, flags, iomap);
> +	if (iomap->type == IOMAP_DELALLOC && iomap->flags & IOMAP_F_NEW &&
> +	    !(flags & IOMAP_FAULT) && written < length)
> +		ntfs_write_delalloc_release(inode, pos, length, written, flags,
> +					    iomap);
>  	return written;
>  }
>  
> 
> -- 
> 2.56.1
> 
> 

-- 
Thanks,
Hyunchul
