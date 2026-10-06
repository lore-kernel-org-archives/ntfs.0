Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274553BF677
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 07:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272740; cv=none; b=g3vE7JO2UNnpUqHtRV5pfEG60y2Lo3dYsbm1PG/ED3/Ai3Nlz/Dk24LJR464IeqkZ95Bl4JmRvUWkXcNTtGRskmEtuaflPr0pKceynuO2AN3vECCdmdjbmqDFAmdDaGvb1kEQPxdEbik8Xfld75Xo8yKAmchLiHTUS6+/uGcqd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272740; c=relaxed/simple;
	bh=gswyYHgG6+cbNtDgGgjUv36ANWNguTy6txMhWw/9Q/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/57Ah5CjqjqRSH1eP0t0E+yz2fcrvlkKTxXFZPTFA4fPb8KPgMmZU3gqEyK96nGjMnp+hk0ZrQ1iLdNw7dxupxnkq13RGTB57wdVzc9wbEBoPWNKeQhqLmfpzOCklnwtEDRRxzsvPwGWTh7wxlyPBrj+bBzoPu0q58LxqHWjO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLLhWj43; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLLhWj43"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so123447a12.3
        for <ntfs@lists.linux.dev>; Tue, 06 Oct 2026 00:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791272738; x=1791877538; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IeOABbw1AEMgbuUTv7+MYPnb9w8CsNeZNb8Vm/4uxnk=;
        b=XLLhWj438wPz3F13fkqXIzvbEWA9t6myJULafPtTh8uMze/VL+OsLRZOrrcjHdHjrj
         chf0QiQShHTA4IDPk8mNq/ac6BzSfpaCRL7jbGRvJDA40yQbotqmmlwAXS5GHoYt2aqR
         EbmYiEnClCDxZvBfBtEZfltJ3PGO0r20JN9Ge7bJkB8LPV76CjdQo6I6Uxejb31A2xMF
         cflYhXb9LMBpxYWNfA+qlwz8FW6xR5OBE5a+RJ4SLK1WY20cobgxSNViuppwfw/RfXd6
         iz6Jqc/3P6a0/OvFgBe4jhc7f5tSVkjUbDf+k2jpUjRNyH3z/3XkyIn2WakRMf5SnsbQ
         HSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272738; x=1791877538;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeOABbw1AEMgbuUTv7+MYPnb9w8CsNeZNb8Vm/4uxnk=;
        b=rMcglFSkQk6n1WnvHhjrtRPAI1afS0+yIItEI+fGZxl7TidcKPQs0k4VFOYyEdtrbI
         G7Wrr2dIpDk7KBODo0DuJSG8LRev31dqG58EJ63j+uUbVV/iHMp/KaTBxrKquSdi1nmh
         k4O8DHZYoMDZ1EEVaDj/zwyDyw0/pBRy9mTHS90ueVLJFshAhM0lT97Bk5PlXdLp8izt
         sHFUvJ132N1vAFYeDsj9WrK3Ld4KADRNBkcnbSWQO7ZzJsqCKJbs/pXfKg+halikxldl
         ULHNbJX6oY0aak0ILctrmanpyskJ6Kc/F9fuB1Ty6V9hMqcqeSDU/jQtheIZDG7s6s3j
         pZQw==
X-Forwarded-Encrypted: i=1; AKwUvBxwhxbC5ghX6icBAeW4wjrz//M3rCXk5NiUA3gmaolFSE/1HbbpxCMfNeBcukWlnYlPAtZ9@lists.linux.dev
X-Gm-Message-State: AFq9FYJv3opIZKvL6juZ3etbX86GojN/+0wU3cXAGn6mY2+NIKRhsgYn
	zeBii0tyS5jMBIsL/ykpPLmhadsBveAIuKnE3NVT3rRsvtEP3GDat3VR
X-Gm-Gg: AYBFou0xzjRsrjwZB5zCCp6L3Yq/vcrrq/4s6b2J+2SIGrCa+DWkYiMpd6d9Jldh4Ou
	y7nx79ogAtrb8tN06LnaT1xOT3uAFM4h3XYMuI5k2PfXxiJ89lV8bWR5r4qnn6lq3FRlOGNEpUS
	G87y3JPfqemva5HN7ah75TBsUMCthCLiSUuWPwWmtZsiN28jij9XlYG3RsX1ZsV3+qbrFc8X6e3
	dYtzS1LpF4aX+IUA2bht8SLAUTDPY9rMAxCR413jV7w+lYe6C22tgFz5y7xWWy1Sk1SXjAnq57Z
	ozBWv4/H7DamccuHFXhJgeg7UM5VfIg9cXF/XHIQp8OM2emafng0ujA6V17XDTMISdBGTSRjq8+
	JhZJpumRyhyoLZ0SYVJcdOxWUY+WSQ0ZoDVqdkM8uNUw/J3TavoZaxKhxNVXrQbmLme/JIa6H8G
	m0+6XB2TguNiCPOuZXUNWtypMbrSTtYvqpXrowyoGGzFKABkvsgU+xVIdVl3qw
X-Received: by 2002:a17:90b:582f:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3a87373d2f3mr388324a91.58.1791272738167;
        Tue, 06 Oct 2026 00:45:38 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85c7677ebsm1410530a91.3.2026.10.06.00.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:45:37 -0700 (PDT)
Date: Tue, 6 Oct 2026 16:45:34 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Jiale Yao <yaojiale02@163.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
Subject: Re: [PATCH v4 2/3] ntfs: drain in-flight DIO before buffered write
 fallback
Message-ID: <asSnHv9NPHpFAxqS@hyunchul-PC02>
References: <20261003093035.532916-1-yaojiale02@163.com>
 <20261003093035.532916-3-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261003093035.532916-3-yaojiale02@163.com>

On Sat, Oct 03, 2026 at 05:30:34PM +0800, Jiale Yao wrote:
> An asynchronous direct write can remain in flight after the inode lock is
> released.  If another direct write falls back to buffered I/O while the
> first write is still pending, iomap_file_buffered_write() can dirty pages
> before the first write completes its post-I/O page cache invalidation.
> The invalidation then finds dirty pages, reports a page cache invalidation
> failure, and records -EIO in the mapping error sequence.  A later fsync()
> therefore returns -EIO.
> 
> Commit 15cdefd0c0522f9d5e12d947fa04f4c11649b699 ("ext4: drain
> in-flight DIO before buffered write fallback") fixed the same race in
> ext4.  NTFS has an equivalent fallback after iomap_dio_rw() returns
> -ENOTBLK or a short write, but does not drain other in-flight DIO before
> dirtying the page cache.
> 
> Wait for in-flight DIO before calling iomap_file_buffered_write() in the
> fallback path.  Since NTFS supports IOCB_NOWAIT, do not enter the blocking
> fallback for such requests.  Return -EAGAIN if no bytes were written, or
> preserve the positive short-write result if the direct write made partial
> progress.
> 
> A reproducer using concurrent AIO direct writes and buffered fallback
> triggered the following warning and made a subsequent fsync() return
> -EIO:
> 
>   Page cache invalidation failure on direct I/O.  Possible data corruption
>   due to collision with buffered I/O!
> 
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Link: https://lore.kernel.org/r/20260629113827.4074335-3-libaokun@linux.alibaba.com
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/file.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 007d1614b9ac..8bbfa842889a 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -525,8 +525,21 @@ static ssize_t ntfs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		ssize_t written;
>  		int ret2;
>  
> +		if (iocb->ki_flags & IOCB_NOWAIT) {
> +			if (!ret)
> +				ret = -EAGAIN;
> +			goto out;
> +		}
> +
>  		offset = iocb->ki_pos;
>  		iocb->ki_flags &= ~IOCB_DIRECT;
> +
> +		/*
> +		 * Prevent concurrent direct I/O and buffered I/O to the same file
> +		 * range. Wait for in-flight DIO to finish before dirtying pages.
> +		 */
> +		inode_dio_wait(file_inode(iocb->ki_filp));
> +
>  		written = iomap_file_buffered_write(iocb, from,
>  				&ntfs_write_iomap_ops, &ntfs_iomap_folio_ops,
>  				NULL);
> -- 
> 2.34.1
> 
> 

-- 
Thanks,
Hyunchul
