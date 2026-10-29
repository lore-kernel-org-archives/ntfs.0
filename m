Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793248096;
	b=xlVDeIAv4b/03frzsk0SHu3fde7zujEhAilGq3UoMNrfxn5xeaR3psPOnhlbDt4W552i
	 x2zY/fPqjMFIxbGKeDQRiXXaAZSRlyv2amtVpdFUBIAU9X1rVlTfEwEq59STaliXjI7Px
	 QkYL3izd3OP0HGHdFg5sYjgs/pLRxXp/LcNbopVp4QulOoTLVcz4+O2MFkvpHeDvZpCa9
	 G6GF6F9/rl8jYuCy7VzfBF6r6Ho9IvcLgD3ztHF0YnIP9zp9khnQJKxdkIsGv6zuRBWFG
	 ICIMITdiu8FhRpdJ0WBbYEKloc57UioxyYsE8yEyhvBnHW4vJfzASBF4lESz1RBQg6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793248096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CSHf8I62FhzeLncTYbcQDe6xLWKGa/E6H6jtHXh4bkk=;
	b=IfG7q0T5RUn/GS8908Y3kBYfE2O3uvQEGdc4GVeBEUxzLP645H6udWeN0JZOLc+rzrGg
	 KCmJCkOfIvBgEWSTjSAVue7PzAIWwNsMyaAi9vJaV0gSVhqTSPUunQkYT0yM9lCtMeH22
	 2CWsXsMYJfmhRBRh/wlwoEF99gPZN95TufcNcjXIbxdczrMvFu4KVbl7uiHV898LkS2rc
	 F+nuz9EWaD6Y4mG4masruC0PrfPrxGzyz5NijNh5oEOeFwTR5tTjSKklKXowXEMYoHiHD
	 j7C0+K4Uxmryg9SHW/Q+lGIggteNSPeAoOtspDEEVl7TYBi5MdRDKMyciOTws5e8Drg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n0VMUMDO;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5D6606A31F
	for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 04:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A5D6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n0VMUMDO
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-156cbe59524so1982943c88.1
        for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 21:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793248095; x=1793852895; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CSHf8I62FhzeLncTYbcQDe6xLWKGa/E6H6jtHXh4bkk=;
        b=n0VMUMDOYb3yX1y74GOKvd98cCfVqXQeuY1sj7CajrhLytar8sHlFU1ETs+qicCyxi
         xVr0Q+e5zRxhXAWYMJbl/EDNv/fPImEILEsTmddwQEYoGR3bNLYTl8ArZqH6Bp45Crpt
         6fmtjg0KeH9S0MSKAzGJ5wun6GkU3sqJx6sxWgeLLneGRv4szVuNLEcfZUw2cQyaWTEx
         yF+VRyFy/exdK5CmUe7dVreHcZy/BGri4+qhBWQbqE8EZlIBpVX7Kj9krfq2gAXosOaJ
         rTWBFQswIxVvSZNjck6JqVVML+e4EIFwNlq0pmCpDLU2nPvq4N7hSlfU0QKfIGntAzq8
         zZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793248095; x=1793852895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSHf8I62FhzeLncTYbcQDe6xLWKGa/E6H6jtHXh4bkk=;
        b=ETWgByYUa1Ogs7eOd5sZtVjJyKB3UZBN3X9sRtMPgojVbHvz2rncT69LxO6onHsjBk
         qkumB5PVXTdLxBafkAMc+TsKI2gLkYdtHYzmNGRSXl11OzXEIisDdYHgufcP4/QZ222A
         W5CjL4QJlDAhhaHGw4kOFu8YCgiPrrpOKXJ8P82T0xnMjMocBVJXeC+zpyYGDsfHoyEs
         HmcPQavVH+6QGh+caKmLEQEBTeVP/wV7dHZqiQba/VQLXjDVVuD3jAxoK8/MZFehUzIo
         J+APZRzQcYKHEqnFM469Awfsv4Gz2YiRzkMSz/e1oz28GRAAYejwcR5vbtPSKU/eMnWj
         ee4g==
X-Forwarded-Encrypted: i=1; AKwUvBw0P8fJuC6WAPMXp/9sYFLr5oS/yH5TDcJCsJh9ZCIlbH7/+tS3DmRdbWOuXNFR0/JeqJF7@lists.linux.dev
X-Gm-Message-State: AFq9FYI4aaUOjoxFacIhqH6XX60OntsFy1uB/7TWHQUMRhlacNJvsTHo
	9Zi6SGPKIVizF0gmN8O5ev4YjBZiAa7Egx0JtSmDD+wgn04NWf1M3rsf
X-Gm-Gg: AYBFou3uAXRYP0DLxEDeMFk5tPS/mmmV9Jg0LHqDYlWFTjCF4QAvHLIhOTt6afg3+wy
	qczlrTY4BxRf/sjn2YAOrMg5N3J1L1LdQLtYjuZ3WJ7Y6iex2gOo1++Zorux9bZ/wXxPXqKOW7G
	i71/k2fNdkLIfQcwtEWYO/OSdbOSVrqW4o6iZvtSUG6w7CVmEbPczBmKwqrPq+vlio14AoRzJPF
	gHuiknWoAitNLliI8ep6weHWwp9ZU2buQRwLvAH7vxSGMiOiwZX+0eTWTMHytO018z1LBK8Ttkh
	lKlOUE8IC0RbHvXwlbKsiZfAmCTwgSE+mJ7LAQu1AHVm5wkP1W9+AAMi2FsX8pasp49YO9D40bN
	XqAlm7KlkyGZDYxonMAe10NofQQLFCIFwiB1ML5iydpuapyTasUJeN6Ob4xOCZW8vHtIMLP46oE
	LE2qPafTTMLbOb+03gFL8AXoCBh0kUjMnrcpICsQSf/XfneAa3Q0iUQkcUcxtzqqx/4iHnaYz1I
	JZP9B+iF6Zq1JNCEPsbeReeHGNEePCd7kmWBJQcOUU9luaWg2FmInLC6i/P76yP+bwJ0n2qbGLn
	K79T1tDrlP4QOIv062A=
X-Received: by 2002:a05:7022:f502:b0:16a:8ffd:4977 with SMTP id a92af1059eb24-1a6ce113cf7mr5846676c88.17.1793248094861;
        Wed, 28 Oct 2026 21:28:14 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e0098basm10515062c88.12.2026.10.28.21.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 21:28:13 -0700 (PDT)
Date: Thu, 29 Oct 2026 13:28:10 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH 1/2] ntfs: keep the file size on a failed
 initialized-size extension
Message-ID: <auLLWhcN3xKsSdB6@hyunchul-PC02>
References: <20261028080656.1027283-1-zenghongling@kylinos.cn>
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
In-Reply-To: <20261028080656.1027283-1-zenghongling@kylinos.cn>

On Wed, Oct 28, 2026 at 04:06:55PM +0800, Hongling Zeng wrote:
> ntfs_extend_initialized_size() only extends the initialized size and
> never changes the data size, but on a failure it calls
> truncate_setsize() with the old initialized size, which shrinks the
> VFS size down to it and drops the page cache beyond that point.
> 
> None of the callers rolls the shrunk size back.  A buffered write
> into a hole has nothing to roll back - the data size never changed -
> so the file keeps the shrunk size even though the data size on disk
> is intact.  The mmap and named stream callers return without any
> rollback either.
> 
> The sizes did not change, so nothing needs the shrink.  Remove it.
> 
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/inode.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 206db4e99ef1..ac13e8776909 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -2599,8 +2599,6 @@ int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
>  	mutex_lock(&mrec_ni->mrec_lock);
>  	err = ntfs_attr_set_initialized_size(ni, new_size);
>  	mutex_unlock(&mrec_ni->mrec_lock);
> -	if (err)
> -		truncate_setsize(vi, old_init_size);
>  out:
>  	filemap_invalidate_unlock(vi->i_mapping);
>  	return err;
> -- 
> 2.25.1
> 

-- 
Thanks,
Hyunchul
