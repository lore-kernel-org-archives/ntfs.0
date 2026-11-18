Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987413;
	b=Nft+Li5ES6XEeHsyolnFvNwg4jt6bz5cDy8ZCJMbE91X2TTki/n3MVwkYcCwKApgHi09
	 KuIBmctMIKZpf8ADxXxZHyqZfVeGgeew16JSaPbPFS9v+YmPRNevrnkOtEuTv5trJZKCj
	 pXw2vryItAQLUnZxvNoVDSzUGCNo0PlehMFNbzEMh4HQVBqoE+VzJn06wbIXDxHH+Vm1J
	 oL+3DQ3LGjPK6JQhf/N/axnUDu65p4XPc1X0+qhctVyUfFoG+1QiJn45+TTApiOnj0+YF
	 M5mwB7T0AkQFcG/7EJbmxFrI6wtw4+x2xtjVQuUn1E6AnDPzhgTwTN1Kf/y/zTw2L+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2AQusGkZeF7By8v8HcNlOm3Ynbjfbz2pOngGJJFpkaE=;
	b=DojnTzBnLIFICdIun6qH44H7zovf4ftbrbAm3fCVDLrbE36CPGOfXCRhMbEKYobWBc6z
	 I61hJ77kdrQWsKM7FsoWE9Vn6Q0bwMA28GmRy34inrnjuZWvulzGaYYVb+mWZrNkGn0Ml
	 2qAX0ncHYeYH8z8tC4E+V/xCKtCkjEzAKbS2vl6/pbMFoaMghQO5T/Gv/Nctedl7km5JS
	 dEyn6KBN0kJqNbxa0Bqy5eKKJ2T/A+4jbaw0WoDHxKk6AuqnDCsaESPD+WkxUR/gdpCuk
	 SfhaSxVtEQoNXbeXoxMNTEZG52dU2mIXiPc8R0emRIRaPa0l95inCThPAjCQrDwB2Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HY3ZfrqV;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434AE606A32C
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 07:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 434AE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HY3ZfrqV
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b3af93b85cso323432a91.1
        for <ntfs@lists.linux.dev>; Tue, 17 Nov 2026 23:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794987411; x=1795592211; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2AQusGkZeF7By8v8HcNlOm3Ynbjfbz2pOngGJJFpkaE=;
        b=HY3ZfrqVtvl8i+sEhDOwbhLOrBf2xkm9K5UYXcrweH5ApCu29gMPYcJOKtHyfUkBN/
         IAn5SGBpdvDtOPv5cjEjZijgxgoPOPzJ6R6vEIVgh8739cyLV1RxLuLsjBxUvSjFMB8Z
         YtvqI5eIAEZn1ITYOwg8J6wFaApWcKZqOy2F6tisPBmLDf/XEA+O3EYQBLY+/kRW3cT5
         VyLsw8Tj6jEHr+rFaxXynkbonue28vOz2zKgPNX6uRSBPQ34qCYgObizFxJxBlPvOHNd
         XEO/us56l5krWlbVO2E4L5v7OivrHcpnLAdGL8kKj5yrDD/FEFAJgzCEFMwaMV3guR6w
         W5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987411; x=1795592211;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AQusGkZeF7By8v8HcNlOm3Ynbjfbz2pOngGJJFpkaE=;
        b=HlIwNs+uhTCFXqktpw8hsm6J+lswKMbNqpOGvAUM7OaI8heyiB3pSCsbGcM7orwXsV
         Cimoz0LxhksyWWf4q29NxolMz48Ax7ZEVAKyU5mtxxHOL//AdRRtuuFjJjNdVr6jr068
         cUVjR1NpbUdBQN0/YM5tsYcbp/XKXdqrIqBkOhY+hBGbV6hDrU4H4Bfz/BLpCWca09D3
         SP/wmd2OY0xfWVDWfG3PVwzV4un/hniH1NCKblxuVNhTEtrmqe3Ng4e7bTXVaANg3A4p
         pO9akctU59Qi8xtlvguKmJYEHYSOb9kOdSfkALeO9xo5r951RzLx+g110+PE763MhBpi
         G3ag==
X-Forwarded-Encrypted: i=1; AL+hErFuZ3xrcnA+rdEi29MNWRCbHSVUPKAP3zLBVCrUI0uTROjv3G9oV1bI9lyLHr1MhjXs4x9r@lists.linux.dev
X-Gm-Message-State: APuU4Z95N6DBQXNzNSM2jsYa0vNRjw4VHJOMPCOVBZMbbs+ndbxJql7e
	0h8PLQw25Vh1/LFPZt9P5CxYmvkmyO4S5PSpPDvQkUoWSk4m9zaeAj+p
X-Gm-Gg: AZFdTZcRpR4GYISbwrQX24XovNj0tghMEirBMbOl5aySG8xY6OdN+s7Go0TqvcHXf93
	LrT3rhXRl61JMZSK0P6PJ7gu3WHTBQf8aaQ9SG9G9Qty423DOh77wrSJyQ7XoypccAQvZX0WiRi
	KzGsleE9J6fOnwv7cL74/YnwDv1tYCxPxcxMihnTo7DWtqhrCSCWJVvVqW14OiVnTmlQlAognFd
	G7oZ8vPpOeOw1QKd1dVVar8YG1486Nc5y62f/3jMmIggfSwMA+pMVIq9eGmf4Wr2wectSyAYxlv
	Ft3HdVT39mu+LGTHqgE7lKwuS/eMU4QT7H3W/mDNWh6ruww6t6DTuFAntmhTWRsmt2NmNtnJGVj
	krnpxjfCYUsz6ZKVMuVXnSsUHHuBT1FUzS5DB9nNlJfHa1FCAfz6EHgBMBYeCOusbdKuGtxNuZ4
	fIwHth8IZpgzs1QVcnmUXn5eas4/o+mFMapAuMyqL742Ru3hWY82V8WIefGIFCU3g/pLmfzTsnG
	w8kF9jwwXFFhcAt2dz8bNPNqadFbE2R41Qwb4tlXXAZf+f+tyv3uOQSjn4Wyjf84rczjjyAblUM
	M3YZM+p1ohLcdKcaQdG6+4k9S3FfKM1ZNayIdlB+
X-Received: by 2002:a17:90b:2b4b:b0:3b1:a1d:3fb6 with SMTP id 98e67ed59e1d1-3b3d07b909amr1784590a91.51.1794987411394;
        Tue, 17 Nov 2026 23:36:51 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2cca15sm7716193a91.11.2026.11.17.23.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:36:50 -0800 (PST)
Date: Wed, 18 Nov 2026 16:36:48 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: linkinjeon@kernel.org, liubaolin12138@163.com, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH v6] ntfs: trim the sizes after a short write
Message-ID: <av1VkHMxr0lTVjWw@hyunchul-PC02>
References: <20261117082021.2947603-1-zhanxusheng1024@gmail.com>
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
In-Reply-To: <20261117082021.2947603-1-zhanxusheng1024@gmail.com>

Hi Zhan,

On Tue, Nov 17, 2026 at 04:20:21PM +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> ntfs_file_write_iter() moves the data size and, for a non-resident
> uncompressed file, the initialized size to pos + count before the copy.
> __ntfs_extend_initialized_size() only zeroes [old initialized size, pos),
> so the range [pos, pos + count) is initialized only by the copy itself.
> When iomap_file_buffered_write() copies less than count, it returns a
> positive short count and the error rollback at out: does not run.  The
> file keeps the size pos + count, and [pos + ret, pos + count) reads back
> whatever the freed clusters held before, also after a remount.  A local
> user can read the old contents of freed clusters this way.
> 
> Run the existing rollback for a short write as well, and roll the data
> size back to the end of what was written.  Keep the initialized size,
> as a page fault through a shared mapping may rely on it while the write
> is stalled on its source, and zero what the write did not reach, up to
> the end of the block holding pos + count.  Only if that fails, take the
> initialized size back to where the zeroing started, if it is above that.
> 
> Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
> v6: cap that fallback at the current initialized size, which a failed
> extension before the write can leave below pos (Baolin).
> v5 (Baolin):
> - start the zeroing at pos, not at the old initialized size, which
>   overwrote data stored through a shared mapping below pos
> - do the same for a direct write, instead of truncating the page cache
>   and taking the initialized size back
> - if the zeroing fails, take the initialized size back to where it
>   started, instead of skipping both rollbacks
> v4: for a buffered write, zero the unwritten range instead of
> truncating the page cache and taking the initialized size back, which
> dropped data stored through a shared mapping during the copy (Baolin).
> v3: clear the cache up to EOF, not up to the extended initialized
> size, which left the rest of the block holding pos + count (Baolin).
> v2: also clear the cached tail of the last block, which v1 left in
> place when the write stayed inside the old data size (Baolin).
> 
> v5: https://lore.kernel.org/all/20261116091121.2547497-1-zhanxusheng1024@gmail.com/
> v4: https://lore.kernel.org/all/20261113050148.1466682-1-zhanxusheng1024@gmail.com/
> v3: https://lore.kernel.org/all/20261112093233.1118469-1-zhanxusheng1024@gmail.com/
> v2: https://lore.kernel.org/all/20261112030815.982026-1-zhanxusheng1024@gmail.com/
> v1: https://lore.kernel.org/all/20261111093459.660484-1-zhanxusheng1024@gmail.com/
> 
> Tested in a VM on ntfs-next b025f526c5d0, with all free space filled
> with a known pattern first.  Short buffered writes of 4M, old data
> readable after drop_caches and after remount, 3 runs each:
> 
>                                     unfixed    v5     v6
>   fallocated, ends block-aligned    3137536    0      0
>   fallocated, ends inside a block   3141332    0      0
>   fallocated, unaligned start       3137536    0      0
>   same, pos + count in that page    -          0      0
>   append                            3137536    0      0
> 
> Marker stored through a shared mapping at 64K while pwritev() is
> stalled on a userfaultfd source page, state after remount, with and
> without fallocate():
> 
>                                           unfixed  v5     v6
>   buffered 4K at 128K, EFAULT             lost     lost   kept
>   O_DIRECT 12K at 0, EFAULT               lost     lost   kept
>   buffered 12K at 0, short 8192 (v3)      kept     kept   kept
> 
> A store into [pos + ret, pos + count) itself during the write is
> zeroed, as that range belongs to the write.  With iomap_zero_range()
> failing (injected -ENOMEM), a 32K write to a 16K file that returns
> 12288 leaves the size at 28K with no old data, also after remount.
> fsx (buffered, no-mmap, O_DIRECT and mixed), compressed files,
> fallocate, insert/collapse range and punch hole give the same results
> with v6 as with v5.
> ---
>  fs/ntfs/file.c | 70 +++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 63 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 3213a0c9f96b..866aaca1887e 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -928,10 +928,21 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		ret = iomap_file_buffered_write(iocb, from, &ntfs_write_iomap_ops,
>  				&ntfs_iomap_folio_ops, NULL);
>  out:
> -	if (ret < 0 && ret != -EIOCBQUEUED) {
> +	/*
> +	 * Both sizes were moved to end before the copy, so a short write,
> +	 * like a failed one, must take back what it did not write.
> +	 */
> +	if (ret < count && ret != -EIOCBQUEUED) {
> +		loff_t new_init_size = old_init_size;
> +		loff_t new_data_size = old_data_size;
>  		int init_err = 0;
>  		int data_err = 0;
>  
> +		if (ret > 0) {
> +			new_init_size = max(old_init_size, pos + ret);
> +			new_data_size = max(old_data_size, pos + ret);
> +		}
> +
>  		/*
>  		 * Like ntfs_setattr_size(): __ntfs_attr_truncate_vfs()
>  		 * expects the invalidate lock held across the size
> @@ -939,14 +950,59 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		 */
>  		filemap_invalidate_lock(vi->i_mapping);
>  
> +		/*
> +		 * A page fault through a shared mapping may have used the
> +		 * extended initialized size while the write was stalled on
> +		 * its source, so keep that size and zero what the write did
> +		 * not reach instead.  [old_init_size, pos) was zeroed before
> +		 * the write.  Past end, zero the rest of the block that a
> +		 * buffered copy may have read from disk, unless such a fault
> +		 * already moved the initialized size past end and zeroed it.
> +		 */
> +		if (NInoNonResident(ni) && !NInoCompressed(ni) &&
> +		    ni->initialized_size > new_init_size) {
> +			loff_t zstart = max(pos, new_init_size);
> +			loff_t zend = ni->initialized_size > end ? end :
> +				      round_up(end, i_blocksize(vi));
> +			int err = 0;
> +
> +			zend = min(zend, new_data_size);
> +			if (zend > zstart) {
> +				err = iomap_zero_range(vi, zstart,
> +						zend - zstart, NULL,
> +						&ntfs_seek_iomap_ops,
> +						&ntfs_iomap_folio_ops, NULL);
> +				/* A direct read must not see the old blocks. */
> +				if (!err && iocb->ki_flags & IOCB_DIRECT)
> +					err = filemap_write_and_wait_range(
> +						vi->i_mapping, zstart, zend - 1);
> +			}
> +			if (!err)
> +				new_init_size = min(ni->initialized_size,
> +						    new_data_size);
> +			else
> +				new_init_size = min3(ni->initialized_size,
> +						     zstart, new_data_size);
> +		}
> +
>  		/* ntfs_attr_set_initialized_size() rejects a resident one. */
> -		if (ni->initialized_size != old_init_size &&
> +		if (ni->initialized_size != new_init_size &&
>  		    NInoNonResident(ni)) {
>  			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
>  
> +			/*
> +			 * Only reached when the zeroing above failed or did
> +			 * not apply.  Drop what was cached past the new
> +			 * initialized size, as __ntfs_extend_initialized_size()
> +			 * does.
> +			 */
> +			if (ni->initialized_size > new_init_size)
> +				truncate_pagecache_range(vi, new_init_size,
> +						max_t(loff_t, i_size_read(vi),
> +						      ni->initialized_size) - 1);
>  			mutex_lock(&mrec_ni->mrec_lock);
>  			init_err = ntfs_attr_set_initialized_size(ni,
> -					old_init_size);
> +					new_init_size);
>  			mutex_unlock(&mrec_ni->mrec_lock);
>  		}
>  		/*
> @@ -955,13 +1011,13 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		 * the uninitialized tail, so skip it unless the rollback
>  		 * above restored that size.
>  		 */
> -		if (ni->data_size != old_data_size && !init_err) {
> +		if (ni->data_size != new_data_size && !init_err) {
>  			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
>  
> -			truncate_setsize(vi, old_data_size);
> +			truncate_setsize(vi, new_data_size);
>  			mutex_lock(&mrec_ni->mrec_lock);
> -			data_err = __ntfs_attr_truncate_vfs(ni, old_data_size,
> -					old_data_size);
> +			data_err = __ntfs_attr_truncate_vfs(ni, new_data_size,
> +					new_data_size);

It seems that this could free preallocated space reserved with
KEEP_SIZE.

>  			mutex_unlock(&mrec_ni->mrec_lock);
>  			/* Like ntfs_setattr_size(): stay on the durable size. */
>  			if (data_err)
> 
> base-commit: b025f526c5d04929212c9d5fb7ffc96608f3eacc
> -- 
> 2.43.0
> 

-- 
Thanks,
Hyunchul
