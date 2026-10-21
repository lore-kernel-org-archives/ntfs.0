Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792547582;
	b=2TLMysg1xDNmXD+sZl+R5dqxPITaJ77M+NmktoM8Q47XmwXEBGIGJ0YaurgnCMcVzpk7
	 H25aNcoo9CrKd5IBY9cLNZEXTWmhCLRvOv/+qWBeR5/HrBCvAP9B0e47EqH+W30lMQHq8
	 9paxnHJqSUiOTylK5jLYCW2KM9fSclb8gqAVdNoRRLFzuJmgpAHdAPBA2uWrU5TD/Dvw/
	 WAiZPMKMrqg2gnZiIPnbhSiF1OceBf1pArEMgRTsBLq4K4xC8Dhpf5qcQLDdJi22c4Gld
	 dPXOvLnL2UesGZM3v/AjRkNnRLZIjodhcNzzbL+xx7MgtOg5y1rkwFCYJhOOixVkzlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792547582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lUdkRlQgwnmHOFGiCmmSMlV7jPJXmxW++5RTSRjhOKQ=;
	b=mNRE5IRpqQ1/07T1uXZFiUIM/KRZ/adxSa6acCmpvXuznDrwOlpeZRSoqSy9fKD5mNCB
	 geHxMwBWHUcp+Dctec/r6hG1OpA1IuF8/fXXmzTrGAdQp8GBDkY6PkKuIvjmaOeHJEGtN
	 1ymRZgpS8d3EeI59Caf2aeFgXXev6Js/KXYtx5EaGNh64ojovWaTqezZxFjz7IxC1mglP
	 NzQpDYImvHIr6kNGYWfGJSTBYCNUriumbZB3RNzhdO6aKTZCzEYE+dNc8s+583DFkLhYm
	 dxXvMs5E+vvPyTm98ci3PU5nBWHpDlzdQU/GZy8v0DNltHBEqGFpDqtoB4uT9E4W/XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="X8MY7f/3";
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5C1606A319
	for <ntfs@lists.linux.dev>; Wed, 21 Oct 2026 01:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB5C1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X8MY7f/3
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8b20a899fso1032215ad.1
        for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 18:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792547581; x=1793152381; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lUdkRlQgwnmHOFGiCmmSMlV7jPJXmxW++5RTSRjhOKQ=;
        b=X8MY7f/3j2S8vZr6YPzeagE+tntpOCJxmn7p+r1qlUILF25oi/JrREeUgpiLX2KjAL
         z0sjh7LSBOieCjh1w2t9KZDMqLkl1RGeKGInmjTRJQOQ6hWIa2AwCuPh0NqowyWERw+c
         cv8J/29jJIS9eOkI/ine8d3UWfsAWjI53OrYl3qOcU+CcQK3ZQMfpsoT2JDPnV9JiOBs
         YMdrf6ylcYqoGuXUO+pU0yqPIpFGvl2DrLOoscEyhY0k2C4iW2Eju+al3g1skRyzZAPx
         VQ+gYMJHkqegoIy0iwQIlboZrVWBi42Vo0HgRPQ7afEW4sKDJxZuQDnO2ihtUuXdHN8p
         Ftdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792547581; x=1793152381;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUdkRlQgwnmHOFGiCmmSMlV7jPJXmxW++5RTSRjhOKQ=;
        b=LIpWcdIcopbxvGKOjmBkRNAJyg9RoTLyl5WF8ob/Ea9OC4tr0MUG0564gAXNYMRVF7
         Hkvi1R2hIq6VZ9nPO6vG7quv7ZNIdRU1rGX/Kudu6eM7ZoidHCdZbd3EcDRTg4edUD4c
         EXE2OJwydj+btGKM/qc+WtlJmGXOF4lOp6va6HCfiQmCvsYlxgFEudc73tL5V/M5/Eer
         ti+ZA7aNzn2LeWQOhik2vMesirDRFluV75T+mWWowM/d5Tzjt/h/S8CWHq8wBPs605nP
         faFol+FqNJ2FVq1ZriD3+6q6QNit7Sfvjy9LZRV0ENAd2xg+nPA4qsA9dy4NyWz0sKSg
         HvaQ==
X-Forwarded-Encrypted: i=1; AKwUvByx+r6556AYp/OrPHyYUjkQMeN4CpspD7u0WXY59tJ4yk2Ft0T9347BSzhb7bObSBtiZA8E@lists.linux.dev
X-Gm-Message-State: AFq9FYIMUnEa5PVHMR+EOTccOrLH1EdhNuJe+0iRTWV8fnP9NAmbA9Wz
	0FhCDqCBoInoINuzN2RefzCh/YlO3CjwCBFsX92AHuXKWXhwjYdjB7NJ
X-Gm-Gg: AYBFou1/uKP1j14raf8bu6p8WHSvHQhJb5+/r+UxHcnPQRQTLoYjsgISzNGqs25FXby
	N8aLgebt87AczYA0jSWbZAPLKtqW33yxjLvq2j8rXPTgO2Y/2K6LCjvru3rgpIYYxtOQTOarc8A
	uRNt/b2MXZYcDVjS/sDE13W4pYIz8AGgsgzO7JnFFlcwn+eFCwOAq7ZVR/oI9nvwxFDWSolys+B
	Z5sYpEhtQaEfO3KI6BKcYjsitBFiQ/VplEXd9PDqN4CvWGZoZ1fjZJVKSE+RtJoW4L1yL12Oa2Y
	u//pJf4lzev/TYY22xpC7YBMdI5ikmn+lI4CqUYtHe2MulFBewHLOrOZzpxOIPRlwYzJAO5+tqX
	inQGuGfb++C9CeVmPvCk+vvg9N7eqBjJFlew9HIG8kRErYNiavWmAhxEkVfL284jABQW7h2B/th
	CKgxFfkDiQjQG6A0RlJly2N3g+nwOzRMJ+OpTojUBsoZ8XfXoP7ESuDFwDjGi6ad9V2S8pvYeS2
	TNR3aE0sr0l1uo0xW+OdJMnJQ8zwrGni+rgZK8GhrdTxhjd+PHBN5l0rhZBVy/cAms=
X-Received: by 2002:a17:903:1ce:b0:2e6:913:57ed with SMTP id d9443c01a7336-2ea43d3a661mr4864595ad.14.1792547580903;
        Tue, 20 Oct 2026 18:53:00 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b307c38sm4827445ad.6.2026.10.20.18.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:53:00 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:52:57 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v4] ntfs: handle a failed size rollback in the write
 error path
Message-ID: <atga-YNByHiwk-y0@hyunchul-PC02>
References: <20261020070641.793832-1-zenghongling@kylinos.cn>
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
In-Reply-To: <20261020070641.793832-1-zenghongling@kylinos.cn>

> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index d810ca5904bd..ad032cccfb15 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -934,23 +934,46 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  				&ntfs_iomap_folio_ops, NULL);
>  out:
>  	if (ret < 0 && ret != -EIOCBQUEUED) {
> -		if (ni->initialized_size != old_init_size) {
> -			struct ntfs_inode *mrec_ni =
> -				ntfs_base_inode(ni);
> +		int init_err = 0;
> +		int data_err = 0;
>  
> +		if (ni->data_size != old_data_size) {
> +			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
> +
> +			truncate_setsize(vi, old_data_size);
> +			/*
> +			 * ntfs_attr_truncate() would reject a compressed
> +			 * attribute.
> +			 */
>  			mutex_lock(&mrec_ni->mrec_lock);
> -			ntfs_attr_set_initialized_size(ni, old_init_size);
> +			data_err = __ntfs_attr_truncate_vfs(ni, old_data_size,
> +					old_data_size);
>  			mutex_unlock(&mrec_ni->mrec_lock);
> +			/* Like ntfs_setattr_size(): stay on the durable size. */
> +			if (data_err)
> +				i_size_write(vi, ni->data_size);
>  		}
> -		if (ni->data_size != old_data_size) {
> -			struct ntfs_inode *mrec_ni =
> -				ntfs_base_inode(ni);
> +		/*
> +		 * The shrink above may leave the initialized size above
> +		 * the old one; ntfs_attr_set_initialized_size() rejects
> +		 * a resident attribute.
> +		 */
> +		if (ni->initialized_size != old_init_size &&
> +		    NInoNonResident(ni)) {
> +			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
>  
> -			truncate_setsize(vi, old_data_size);
>  			mutex_lock(&mrec_ni->mrec_lock);
> -			ntfs_attr_truncate(ni, old_data_size);
> +			init_err = ntfs_attr_set_initialized_size(ni,
> +					old_init_size);

The shrink above can clamp initialzied_size to old_data_size. If
ntfs_attr_set_initialized_size() fails, the initialized_size remains
instead of being restored to old_init_size. For a compressed file,
this can expose stale data.

Could you restore the initialized_size first and perform the shink only
if that rollback succeeds?

-- 
Thanks,
Hyunchul
