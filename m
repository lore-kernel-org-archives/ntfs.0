Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793248118;
	b=hpV6gu8bSfV2I4S7qtzMckM4h7DL22b8S6BPJZUyjt7q5Llxqj31gp+Sqn2uFGoaYUUg
	 kPaVoAcv5oSMbKylDWFRlxQ2M+9DWr8Pfhs3Jf5sfJnEH/jwYvaitcbyRJUlvoHFTtZQQ
	 L8QkxUjOO8U6DNgedTi3XAF9zr6n9I0vimKhhn7TVJEEb24MRbtLYf8Z+pmJgToiDwOXL
	 qXLVpw36w/MGjKcxtg9yw8JPtC9w+xqPa6hVsOBENhvYaiaYOhqMzKwhEBEwsbJvFH9E6
	 iNbMqnv6CZHOHn2f7Hw6rb3xxlRVj+53/nbz6w4neMN73GSPtjXPJMw0jKDQPILAF5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793248118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=peGi2q4w0fAOeVYcPBrPo4Q6fHm+zWURoNSSlNJpq2c=;
	b=V37Q3XmoVkfHUYr4oKdyhvR2UhLw6TaKo8/7/ga9Z3ktow4zEEkHzxTMImaLJIysAz6s
	 VggpbX2B/oZN/WQpF4jQrQHQuESI1OG2jpOaLLKSLXwKrHASG9cbAtRwkz+gdSJxxa3Tw
	 P6K9gG4F0mVqE273Ar30OfZnZ4M8syRX98TioKWpMYJFYH21DYXpeV74sOghMgdZ4jSuX
	 9Zp34yLsRNFupUgDSBoTP1LhisYsj8mEPM7CCbhpc6BxlnQ7jDd2w2UVKciVXGpePWHQD
	 rgiWFf8NLnIGmOzCzJni274jt48STpdmhZl9HovwIyRHbQZEJiGYpKuNTon664bt2JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VOvmVn1h;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6355606A31A
	for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 04:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6355606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VOvmVn1h
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so378195eec.0
        for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 21:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793248117; x=1793852917; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=peGi2q4w0fAOeVYcPBrPo4Q6fHm+zWURoNSSlNJpq2c=;
        b=VOvmVn1h0HxubfARNfoUyGfZkdhBljPYCgq3/GObO/Shh8purbQ6i6uziywNb98pzs
         aOUFb0mk47Xer/bKU98B3IwiX0UR/rGDuMHZ5KEXjBLZcBCGntMuNG/0gizODFBTqK3w
         yIx5FWtDsVlFEnoPsjQjFFQ5G3G08FVYuWBEZPiEycf7Dr2bCRNEArIVnf0PPQ9r+hPS
         5rV4grdGZgxb8XjYLgzBPA+QlS4o3o4GA5ENP5dAtu0QM8pdVYb7H3e2+A7kNg6OmAXb
         Dos5yKFoxPKwzHLysBQRr+YcahmYb5pEN9AcMJvpBV88rWNj/dSyMQIkhBA9zMVuCF3C
         GCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793248117; x=1793852917;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=peGi2q4w0fAOeVYcPBrPo4Q6fHm+zWURoNSSlNJpq2c=;
        b=aNYGH7IZfW0E8F+WdJJAnG5Uf61U9WQkfnHq0jQl77Ecx/6cEd3oLxhmG6Q75/HpZU
         ozLFV49LJ+qgbs8+/tj9bYaK/pC1ay7Mwi9PT2oeLEP2fTuPTDbJ85YbaP30XFa2/ucO
         QJn/w6yqENGPKJHA6+hr9elPBpRz+dHYMddzcflvSevqImNlYID/ir8wsA8NjpLL4MNO
         hbXId6CjlSd7ulCpRU29jNx9XXW296RTK0GDzWDMtya7jU76emO40CJRmjKZSMCAJ1Yp
         br3LkhcZJUjYcfNUg4UDZ01nCg3poMpWMyQIVmk6mDG+YpCjQvsARaXK9tnAe4luJ2nC
         sk0A==
X-Forwarded-Encrypted: i=1; AKwUvBx87GATn1ZVrD2wGq+UYnQM0q7QW1dg+lfSigdjepUezRuJAF+5DYoX2NAx1dlVTt99QG5e@lists.linux.dev
X-Gm-Message-State: AFq9FYIoW4SfJ30Vf6ImU31ipw7AiEwpagD7bnkkdAR+WcnrwdFMLlAy
	Pn5q3NEHwuOm31+MtVukgMIfRAi0nQfRETnbzHQPlJfj87w+XgXnGODP
X-Gm-Gg: AYBFou1OEj2fuVW0N9Wb9xZBdD67/NJGTkmkGY2zPmrCecjU+RBKhPQ4yPiLR2MUEtr
	u53OOopH3wPY07p5ykEHdGkA6IGHA+jM2sLvYLoC3u5I3Wa5OtOVL2Ie+9ZvkG4UCXB5cG4OM9W
	Zxj/rYxxZ2ItN4CDFQDm/UX9NDfnKquKRG/PylrNc/SRwgoIEVZaR+naISOBJcMDYfz+JJKVm/0
	b9rWx7RKBmJ/VeYZ2VFoSOijnSh8sIW5f97rqueWtRNpZyKl0DewjEbE0+6YFtJhf7QLMDbuMh7
	nunS4n+Kw8JP40JHzV79rrrePjQPMTW9cTEchetHei1ayHxOkB6X1KtltEpQt6Z0ajNlmKXKMwm
	q+LlgJAhwet4G5iETX3G2yDIfxVImSfIyzSicQMsQcab0+bNzg3erZqVzZBDKVY0l7GvrFO47A0
	ISwdHoiHU5vzaKTXOPg3XwGbrRI9eviVAS+5aMEg7+y6XnfCLNe/mESWVYNY+caUFfimMqRiAO7
	BtewOjwFX1cChYlaK71zLT0cXv8T2muB0OqlixuB5r6KMwaT3N1P3AeQNYBauFFxnKMsT2bToao
	ejbVuK2kZK1IazWHTfo=
X-Received: by 2002:a05:693c:864c:20b0:36a:1819:4d0c with SMTP id 5a478bee46e88-36a2046c99amr7095157eec.41.1793248116464;
        Wed, 28 Oct 2026 21:28:36 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237be80csm27699405eec.2.2026.10.28.21.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 21:28:35 -0700 (PDT)
Date: Thu, 29 Oct 2026 13:28:33 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH 2/2] ntfs: fix a self-deadlock on writes to non-resident
 named streams
Message-ID: <auLLcf9BK7-rIGPz@hyunchul-PC02>
References: <20261028080656.1027283-1-zenghongling@kylinos.cn>
 <20261028080656.1027283-2-zenghongling@kylinos.cn>
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
In-Reply-To: <20261028080656.1027283-2-zenghongling@kylinos.cn>

On Wed, Oct 28, 2026 at 04:06:56PM +0800, Hongling Zeng wrote:
> The stream write ioctl holds the stream mapping's invalidate lock
> across ntfs_inode_attr_pwrite(), which calls
> ntfs_extend_initialized_size() for named streams, and that function
> takes the same lock again, before the check that could skip the
> extension.  A write to a non-resident named stream through
> NTFS_IOC_STREAM_WRITE deadlocks on itself.
> 
> The ioctl is the only caller that reaches the named stream branch of
> ntfs_inode_attr_pwrite(), and it always holds the lock there, so
> split off __ntfs_extend_initialized_size(), which expects the caller
> to hold the invalidate lock, and call it from that branch.  The write
> and mmap paths keep taking the lock themselves.
> 
> Fixes: 3f11c48d4f94 ("ntfs: add pathname access for named streams")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
> ---
>  fs/ntfs/inode.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index ac13e8776909..9275ebfebe3d 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -2554,8 +2554,12 @@ int ntfs_show_options(struct seq_file *sf, struct dentry *root)
>  	return 0;
>  }
>  
> -int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
> -				 const loff_t new_size)
> +/*
> + * The caller must hold @vi's mapping invalidate lock.
> + */
> +static int __ntfs_extend_initialized_size(struct inode *vi,
> +					  const loff_t offset,
> +					  const loff_t new_size)
>  {
>  	struct ntfs_inode *ni = NTFS_I(vi);
>  	struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
> @@ -2563,10 +2567,11 @@ int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
>  	unsigned long flags;
>  	int err = 0;
>  
> +	lockdep_assert_held_write(&vi->i_mapping->invalidate_lock);
> +
>  	if (!NInoNonResident(ni))
>  		return -EINVAL;
>  
> -	filemap_invalidate_lock(vi->i_mapping);
>  	read_lock_irqsave(&ni->size_lock, flags);
>  	old_init_size = ni->initialized_size;
>  	read_unlock_irqrestore(&ni->size_lock, flags);
> @@ -2600,6 +2605,16 @@ int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
>  	err = ntfs_attr_set_initialized_size(ni, new_size);
>  	mutex_unlock(&mrec_ni->mrec_lock);
>  out:
> +	return err;
> +}
> +
> +int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
> +				 const loff_t new_size)
> +{
> +	int err;
> +
> +	filemap_invalidate_lock(vi->i_mapping);
> +	err = __ntfs_extend_initialized_size(vi, offset, new_size);
>  	filemap_invalidate_unlock(vi->i_mapping);
>  	return err;
>  }
> @@ -4085,8 +4100,13 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
>  	mutex_unlock(&mrec_ni->mrec_lock);
>  	/* Attribute writes bypass iomap's delayed-allocation preparation. */
>  	if (ntfs_inode_is_named_stream(ni)) {
> -		/* A failed write must not expose any newly initialized data. */
> -		ret = ntfs_extend_initialized_size(vi, pos + count, pos + count);
> +		/*
> +		 * A failed write must not expose any newly initialized
> +		 * data.  The stream ioctl caller holds the mapping
> +		 * invalidate lock.
> +		 */
> +		ret = __ntfs_extend_initialized_size(vi, pos + count,
> +				pos + count);
>  		modified |= ni->initialized_size != old_init_size;
>  		if (!ret)
>  			ret = ntfs_attr_fallocate(ni, pos, count, true);
> -- 
> 2.25.1
> 

-- 
Thanks,
Hyunchul
