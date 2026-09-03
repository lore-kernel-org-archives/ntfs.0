Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756C01E32D6
	for <ntfs@lists.linux.dev>; Thu,  3 Sep 2026 05:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413155; cv=none; b=Sr8d8H+oR/radSWVppBZg6Hck2xPpSYylsO2wtBhIARKt2Lcpd91I2z7tCXbzGCxpkHWlD9B9nG2rAkzJYYO7VRgSQvWGYg9k9OK5Z30GQjqJq75RkQrAFHEHL+yhBK4nM97fGf0D5SKNLRfv9nZYm7fmbbOHfYpJDQP3rsfO24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413155; c=relaxed/simple;
	bh=yIT0njN8zTaKqpnh4YeAXIBkAzc91BYCFPB8BlZBvJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqhzEPOy5c6Mj8dgqj2U1B8vJ9LED6QP9YHScl6e+LGfsBwgeQSgq+VlIY9qJ7qILjIo7LWwxr1Lb8dVsbMSxsAAssQrA+j24iATi9UO4jygoyCMQN/XzqA8UAVUlJs6l+ONz9agoK70gN2OkkvtQgayBdSFiq26A71IKzTEapw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njrce0PY; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njrce0PY"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8568e3ed034so1646287b3a.0
        for <ntfs@lists.linux.dev>; Wed, 02 Sep 2026 22:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788413154; x=1789017954; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6udNag1OXzwdNjMFsjD3U/BpLu/NXX2dA4Ypx91geA=;
        b=njrce0PYkHSgVJ8Gi7me3wg0p0wG+C9dgB3cdC6zX3P1PyGWyfCbNnf8awEd9ivpd+
         RR6NeDEf21YObnb9jgWZRSxSEyQkY8YxKUwXIUTlUu8YJmotMChvLCrxODJ7u6md8wR/
         pXz/pXoY9YKwpK10HpTvIwEWOmEOTqHuRhY28veARZ3t1v7drXrjmlPzO9ebLWB3qCYV
         +K7dv9i47YR7u0RqTRyvESjAOtowJGbDXLt5oOHW+GplYsabl+voSRHcekCa6ChT/ioe
         w5b+dakA6IeCmgTfIdkqkdfjYGXkhRNoZG43sZVC3lYpgLBCyRf5zbH3KLUuT9tR6L6q
         rPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788413154; x=1789017954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6udNag1OXzwdNjMFsjD3U/BpLu/NXX2dA4Ypx91geA=;
        b=Ly0ufjWUeEtuNA9Zbc74W99HbShUgQowpN5wEkkWroAiMx3Dx2JuBX0SC25/lllRt/
         z/fszs3mPLUEa1fVhvH/wQOnnSjoJAVj8qNQozPJu73+/gqzKn5suqHDLW2LnqWfUC9i
         Nok/0uR4m1pro2YURp3SaHinBHAf5p21yfXE5ef3tb7TBnvSaEXcDTjZVyaoX9vPehHR
         DfWdwPUohLKw0s9Gu6LCMaPbOMyL4gAee7keqfk9mIAf3OAVVTOoxw7zn2WorZRv7OM6
         zEJVPKzko8hbh6WrlPkyvft7WbFAkGlTVSj7YSQfK7j/tTYAzRTCZ/eiV+3/ycnvQP6T
         ie8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxmys867kSrgvM6gXx2Q1o1ijw3g6n0MbfjS1ChHU/H8iyEY5pPKoQ3HKioeOatqfIoHnUm@lists.linux.dev
X-Gm-Message-State: AFuF++n7cO3hyi6Zn0T3/1vLNf3ob49hyAp4A8NY3T8m0N9KWJy1FzK/
	E6WWsQlwDMfvbxvw26v96eB5+A7xXuTyYF7oaVgkV+SF/Y1GipEUrkXl
X-Gm-Gg: AYBFou1qasafwjJllBiWTHuf11r3obIA+ZYyA4Y6kLCWkc2lK8um7v78fYRfgDmYw0V
	XehDh3CEWHxSW97G2FcA2D2lJ7wGFu9lgfUyFeR6jwzLt8Rqq7x+kWZ5l9cDwJEW2qgI6820cQd
	ixzPYmoo9iL51FOtxz4ZYS0h20t4mNIUZ5Uvnt6dqjYLbhqoDki1VKq/UW90aXBz8Q71Fj8sKq2
	YtTdb3uchv5XeUWXZG/v6K/0yyr1amghxbFe0TCs47Svqbv/W5X1/E8lfiOC4G8H1xlioIqN1CI
	xK6nBhUxY6PgoqzQ7pew7MlGGiuozS0h08sBE0+x0RWC8iB8hXe9UdXaIcqvMe4jBCZUgUWkxfI
	Qnr0AelpVCJRygmPC0sBayapxVqiW5IWLS8fesF7+iywT1HYKD73uQQtUlfp7nWFdK6fifUtU5n
	LOxBeuS6vugyMu8ZS4ffCS1OpzthLWF06dcL8vlqCtfkDv9ES6z/zlw+raXJsASuk=
X-Received: by 2002:a05:6a00:2e9c:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-85ed3c7d861mr12889924b3a.12.1788413153492;
        Wed, 02 Sep 2026 22:25:53 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f20besm2388115b3a.7.2026.09.02.22.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:25:52 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:25:50 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
Subject: Re: [PATCH 2/5] ntfs: return -ENOMEM from
 ntfs_inode_attach_all_extents()
Message-ID: <apkE3nzoVd0raTde@hyunchul-PC02>
References: <20260902073249.3035977-1-liubaolin12138@163.com>
 <20260902073249.3035977-3-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902073249.3035977-3-liubaolin12138@163.com>

On Wed, Sep 02, 2026 at 03:32:46PM +0800, Baolin Liu wrote:
> From: Baolin Liu <liubaolin@kylinos.cn>
> 
> ntfs_inode_attach_all_extents() returns -1 when ntfs_extent_inode_open()
> fails, and both callers propagate it unchanged, so userspace sees EPERM
> from setxattr, reparse point creation and directory index updates on
> inodes with an attribute list.
> 
> Both paths that return NULL here are allocation failures: the
> kmem_cache_alloc() in ntfs_new_extent_inode() and the kvzalloc() that
> grows ext.extent_ntfs_inos[]. Return -ENOMEM.
> 
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
>  fs/ntfs/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 5aedc045f65a..747a60ae27c9 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -3025,7 +3025,7 @@ int ntfs_inode_attach_all_extents(struct ntfs_inode *ni)
>  				prev_attached != MREF_LE(ale->mft_reference)) {
>  			if (!ntfs_extent_inode_open(ni, ale->mft_reference)) {
>  				ntfs_debug("Couldn't attach extent inode.\n");
> -				return -1;
> +				return -ENOMEM;

Could you also fix the error handling of ntfs_extent_inode_open()?
It treats the failure of map_mft_record() as success. If we would 
fix that, this patch would incorrectly convert every failures to
ENOMEM.

>  			}
>  			prev_attached = MREF_LE(ale->mft_reference);
>  		}
> -- 
> 2.51.0
> 

-- 
Thanks,
Hyunchul
