Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793930167;
	b=DTBd6Fvi4qjgOz0h2qSnWOwb3eatTVD1ZjirWDM1KPyUdro2nIGi114LMZRDxemUidhS
	 5DPha20JMjgS6vzVUsK6gEO1NPJem7mM1kzeis8nMVk3qzItsgO1ac5+5S9SpcTbTwKCv
	 5hGSpNCxo0Y7kSbR9+U1nTOSoBRnDPVSBUQbhNWVN2bB30eFTK29oT/RSS7kiU04f885J
	 yVCvikrMAYwZBJH/2HZ1NYl1qFCIfZ1vcM0ulxPnVx1UrB+Xi5nDI7T+31LKr2nrU2HG7
	 vq9g/Xc9vOjKD5CMdWdvoBLMDA9RrZpz11/ZJXvlFQ1rb/VxAEmLLXMYUio8gMoCe7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793930167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2IwaaquVGNd7gM6MhL4GlZ3FLZbafuQnYr1jszjtRIw=;
	b=aAxdv0aKUwuKOQ9/IBD30rSvsIS+sJS3XrCrJRW1OSdiSLX5XGsuNQiKiPZGrEVjAZ15
	 Bn7f25X1rskTnCScry1R38V/7bgKMN/5VNFkKoiwrQcu/TLeJQTeHRJ+vIjyyAe9W8Tvl
	 h4hrIO/N6x6HiZTDk5K6iN+zlnK3EqCIbYqvQBANlT2AHW7ugr7DVmV3/hFePfFUYUx7E
	 mRPp+B6yoEsUTd0hM9KMeRWpgvVr9jNymIrYjvjbufj1Goqs08AdugSON5QzZEbZFxJfp
	 TzHNfFttjDGOG8wZHPuDkCwqQBq/lCEBpfZhiEwy4MPjeBddBYhxAr2V3BZeCzZTJeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQkeMowA;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75185606A31B
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 01:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75185606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQkeMowA
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc758830601so78671a12.2
        for <ntfs@lists.linux.dev>; Thu, 05 Nov 2026 17:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793930166; x=1794534966; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2IwaaquVGNd7gM6MhL4GlZ3FLZbafuQnYr1jszjtRIw=;
        b=CQkeMowAVIzkxSZ5AuM/jWmA4gE7Pmrb/lkFkyhFZmM2BuvHyK93UiM9eeYN/BennG
         Ov1i3REFmNSWxH+j+X9mKlaHsHM5DIoYsqwXq4mlfprFX544/0Kaoyl+sBU03G0OlN7R
         lQZTilBHXVwt5cDNSCCgE5iy7NrWKBCCd3bwiV3+XMkVXu7F7dM/NyG+ZrijDtBQm2KW
         v31mKGG4tBUWWXFzGtS9l7UJBJvLI/X2YgJqJD3a8FLxB93XhRnnubZwpwKNxQRLj8aB
         zY6FtkhCid5F/p4VJ25xy6dMKLsnjW7xuFDGFp+xPTnoN5mR0pBDcVHyhe3fdX00rCmn
         8sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793930166; x=1794534966;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2IwaaquVGNd7gM6MhL4GlZ3FLZbafuQnYr1jszjtRIw=;
        b=wj4vClQIic40emEATLySWanzqru9Rb8rnUdd+P7K+/V6WA1XsfecbEgOWRntbbgFAG
         rivXNd0naSr67GczJiAJI+jrsByDRegohIjEOXe6rvSg3ozI7Ymew3ZldEbCkTqicbhw
         J/WSL4HlVjzAlVnRgcanP33p/yFUYK6DEVqR5hkVfPn8AUB6QJVZATIFL7ICylL+FaIv
         E0Ou+ZUffSDepdJFnMbyClKYwdehn1Zo6Ht+S7wBcS1jsrmiMMJGVGW0SByd4WVsojgg
         WImGx5b7Pghre9OHOvse2re7mUfv+U4ivh4zMfQrWlK3T+Um8GzrdUNglu4mecMHzJ9M
         Qj9Q==
X-Forwarded-Encrypted: i=1; AL+hErFKAlKiNFVEHhkwwiLsltvxmr1kg6N7AKokyDCixci5UmF6JD9hdZQtwWohoz1XT/oBQMyk@lists.linux.dev
X-Gm-Message-State: APuU4Z8UMDSs6FtEJSpnpJpwZ8pRDr7Jr5BGeNZsEyI8OgNnETlUsJv0
	4X9xj18mQkAORDQ2khJ3JCFCVGnwz28EY29JP/9VVkZV/zthrY35Rfb0
X-Gm-Gg: AYBFou31/r6kMjL87mtBdAd+dozddI845evkyZ4YTq69P1NLjNidArtjBfSE0PbeSax
	H3I7ncgIeSrbOEQ2gviQcuvSgSsS7vPsApsMwMBOo8646NgzWFieMSlSPceewW+11Fj0c86CZE/
	jWBR3Mijb4bIpmDNXm4kwUZYgG7M/Jp27H7lm+dvozOqWVFK9P8uKG5QlK+n4qP+1ICn4OrD9eo
	ai3Cpf17H9++hN4z77zcc6X2Oe65Ov9JgBcsRAEjQHeN3XyDPD1cQy5bhuBWlrOxnx4XGlVUElg
	R4OKta0Uhh1snoMBvhAgAsQiyVWbIxotAALgOZFatQfDQE1unMCuFJcWH3AEqVV0QhlIImpLNVX
	OWbaUlfPJ7ZriZlXn2A+3uKAvC1iLfO1ni1029gPCrtmere5420CN1BPXk/uS5g4KIzCX56TQrQ
	BVplWD2wpzwt0utiAoQk7euJ+qiJWCS9G9LJjTf6DK/8uioZBZrJTanN5B3vBc8uqRGiCSMUKN6
	iK01vCxsFiXAlW2BgLd2Uy6LeXQ6elZBCIfEe8qV6dEFHObWJ8mP30q8tRTAH5ukUf9pyJPDsdK
	stIWpOgeK+55Z+V1mQ==
X-Received: by 2002:a17:90b:2c86:b0:3b0:9a1b:b6fe with SMTP id 98e67ed59e1d1-3b0db70871dmr983678a91.62.1793930165680;
        Thu, 05 Nov 2026 17:56:05 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32678ecsm6138265a91.9.2026.11.05.17.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:56:04 -0800 (PST)
Date: Fri, 6 Nov 2026 10:56:02 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] ntfs: don't write a compression block after a short
 copy
Message-ID: <au0zsi-oLfcprQxI@hyunchul-PC02>
References: <f385711f8772132f64462e1d6c13efadadc51bc2.1793874221.git.zhanxusheng@xiaomi.com>
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
In-Reply-To: <f385711f8772132f64462e1d6c13efadadc51bc2.1793874221.git.zhanxusheng@xiaomi.com>

Hi Zhan,

On Thu, Nov 05, 2026 at 09:01:58PM +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> ntfs_compress_write() does not read in the folios of a compression
> block that the write covers completely. If the copy from user space
> then comes up short, the rest of those folios still holds whatever
> the memory held before; ntfs_write_cb() compresses that to disk and
> the folios are marked uptodate.
> 
> The copy can come up short after fault_in_iov_iter_readable() has
> succeeded if the source buffer is unmapped in between. On a volume
> with 4K clusters, writing 64K at offset 0 of a compressed file while
> another thread unmaps and remaps the last page of the buffer leaves
> 61440 new bytes followed by 4096 bytes of another process's freed
> memory in the file. The write returns -EFAULT.
> 
> Treat a short copy into a full block like a copy that made no
> progress.
> 
> Fixes: 5b676a77f3e4 ("ntfs: skip reads for full compression unit overwrites")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

This patch looks good to me. But the second patch in this series
appears to be missing.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
> Tested in QEMU on ntfs-next with KASAN, 4K clusters, page cache
> dropped and freed memory filled with 'Z' before each write:
> 
>   before: 16 of 41 writes failed, 3 of them changed the file, each
>           time bytes 61440-65535 read back as 0x5a
>   after:  286 of 731 writes failed, none changed the file
> 
> The same loop on rootfs gives short writes and no corruption. I can
> send the reproducer if it helps.
> 
>  fs/ntfs/compress.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index 82c7c7d29073..287bd47282d9 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -1567,6 +1567,16 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
>  			}
>  		}
>  
> +		/*
> +		 * The folios of a full compression block are not read in, so
> +		 * after a short copy the rest of the block holds whatever the
> +		 * folios contained.  Don't write that out.
> +		 */
> +		if (full_cb && copied < cb_size) {
> +			iov_iter_revert(from, copied);
> +			copied = 0;
> +		}
> +
>  		if (!copied) {
>  			err = -EFAULT;
>  			goto release_pages;
> 
> base-commit: 564c7753647731d19170914c1c637d3b33d88d3b
> -- 
> 2.43.0
> 

-- 
Thanks,
Hyunchul
