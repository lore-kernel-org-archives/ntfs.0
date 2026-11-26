Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795659759;
	b=nbGQlQlYVvLAw4aPV+jlX6uoevVG6p1vjIVYbgealxevZ0Zar7iYBectyxT6/TOnjE9e
	 PB231cHLWlWOMi1M6/U/pNu0MtSPQZ/JFSiToSsxpz88lNqeRRMPnDjAVJKw73sUZ+lO5
	 OAu5VIM/daAuLo/UczOOwsCoguCyKq239YH5TjdP9qRokSmdV0OCsDGI8mt3S3Ks31yx/
	 I0e4zmbaI3d/cGRgT6JU30D3YfiVANBdYXjctbbIJT6asbHmMjQXiLY6xs53sSDXbFThW
	 SjaBj2usY/lett1aCN9Tm0IlLyuIYG5Zh+a2DiFOdViDeqq84Xvp4QKytcvkRQLb99g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795659759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RpJDCLRm18xYUWazApHpM/KeBrjGEMvY+NE4LSf3/XQ=;
	b=h/XpWaVsJUF1CFlkhqOlx0qjYREu1FiNfFfOHtqlkna2R0jMAE3Hkb/t1dS+EvXU6AKq
	 pLvlXYrlDAWmwSI6+4/KQZS5IU43wJtwMATeN3yJ1Zz3NSlIk9/AWeNeRB8QQ4tZCSoQx
	 L9UD2mHXhjolV73tfXEFBBCSJH08Ibhof89VZXPkhoZ5/WEk7cGBZk+PCz0fMT6HNOba6
	 wbghNrhZb7FJDvUhKmS9S6rESnQCmu3IDvvQftLEixBsYOMZ0l+lS3dS9Y6YGCe6CLMqY
	 7MD9M+a3Sg5N9EkGrDL1DaEItKlcZjdH7X/GfGesp5LejIjpIQ6H4kxeMuYGNYwgKBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUtrx9Y1;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90962606A31E
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 02:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90962606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUtrx9Y1
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so3410160a91.0
        for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 18:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795659758; x=1796264558; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RpJDCLRm18xYUWazApHpM/KeBrjGEMvY+NE4LSf3/XQ=;
        b=hUtrx9Y105cQElxEVlGAaf1Q+17BHiTrIp5VbDmxMe/OtH59aZqQ4hWfk7pabm+d4V
         uuvbZZm6lPxJt9X89oyEdDqYXoXGyFOzfj0+H1KfVjsiEbs4z09CYquGz1lBmviR/FRO
         eAIyo9+VFQ/DB4uJbANoGAFCmMdQCbfXJnjc0AkBGOgp8WFpKiRk1KR+9vJPQocQcc9U
         IYddJcKEAbHPbTRriy0mHlkhctqpknRriW9bCgPs+tMk/oKJifRWDXAbA0mThAriak/w
         xaq2zhuRfJGFXZkHWzuvCQMh19wYRn4WTBgTl/xHFSfJV7h+yhUt3c5Y09Qtv1tX8shp
         avjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795659758; x=1796264558;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RpJDCLRm18xYUWazApHpM/KeBrjGEMvY+NE4LSf3/XQ=;
        b=nrfpk24s0OQxQ1lkVjvSSfAs3HAf8EDpX6DETTR0mBkb2zh9K4UAr2su0uuzNdi6EO
         FflnLf1M9Nb8RPXXMsT3Xu2abjN0+wikM6w118Wt+mDqCiENrcLX98g+OpZdXUdr0o4w
         4I5C4vAhEZnr5ElsyQjSq/AVhhY1WMqCHI+mDJsAsth1PCzIapeqW5+6FqZArfE4hvP+
         AKEqSGMJmeCVjwl1U+gXNEObhkfgRvx+cCDDlXVFb7RxhNyXgtZ8mqbweX+qClxNvy8B
         5LY660k0YIbm2UTqMl5vEs6c31Yet45BxOT2wiBK/tD3a5ageQOIllPYCd0zijZmQcUt
         DOug==
X-Forwarded-Encrypted: i=1; AL+hErErAU7wIM+ySl7nHHW6l23CMuDesPnUerM/u2vSskzCDgFTN1Gbj1oUJTAesTbaXVzdoszx@lists.linux.dev
X-Gm-Message-State: APuU4Z/Oq5haSVSL1ZTaoXtfR1/w8bGVJUY4+Lyuj1msrVsPYNW5tfJh
	Z2v9tJOw4KEKwQCNK1KWq3uwzYD5MPShf3feLgs/CIGKtPiITwpc3alh
X-Gm-Gg: AZFdTZfXTKjDM/M46wxeW8T8jw2tIn1Z3nANtmnGMeQHyiJ9ORKnrYha0PSAcVr7OCI
	NHW6qgL+K6wRfC4Dhruxd7saE4vkF/jA3Mgn63wmhWpLM8VAeqbGGnIWRVtag0w+XJBnvBYpsl8
	RHPC68Nn7cgHPeS2gQiTA56x2T65kJv9cZxUrxRuCkWZ+w6k0pjucow/BKq8awJnuihtcWCcpZQ
	T60iVURNoWh+rd5wMWzvbUcTM9WAnHRLQIyzDkO2W0T5wLpzEN1DikJ1OZCnON6vKjZnVAMStmT
	o++NGRSJf5q0YeCRC7fynfYGRJD3KiqvrVAaePSQy9iIkVeOL0fjOekm7+AIdoVe6RV3d2Mn6Pl
	D2xuFL628WYRO6evyrVOD+60lw90T/cq1gxSGPYiXWpz2yqx1k3dvwiibIWcl3k0FYBcdgdJJf0
	Rm4e1cNxlyCRtk3h+GnZk7OlHuHBISPEAC+UXAmAiupzsjBU2JZJFYucE6HxiFQHUr+Tlim1laL
	mx1YiLl5Vjm86eWzmBa3RHO5umcixCvwtyDaeUsygIYhfQVP3yYxA9KahG6sJ+U2E4LOBS+XFkv
	uPGZFB/RQqAmqjFyc5g=
X-Received: by 2002:a17:90b:2ecb:b0:3b0:e2a9:3466 with SMTP id 98e67ed59e1d1-3b41c98a1d1mr16637388a91.16.1795659757863;
        Wed, 25 Nov 2026 18:22:37 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm32686630a91.14.2026.11.25.18.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:22:37 -0800 (PST)
Date: Thu, 26 Nov 2026 11:22:34 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: liubaolin12138@163.com, liubaolin@kylinos.cn, ntfs@lists.linux.dev,
	theBIT5 x3zk <x3zk@outlook.com>
Subject: Re: [PATCH v2] ntfs: prevent modification of $Extend system metadata
Message-ID: <aweX6oQjDlQpVckQ@hyunchul-PC02>
References: <20261125112226.96786-1-linkinjeon@kernel.org>
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
In-Reply-To: <20261125112226.96786-1-linkinjeon@kernel.org>

On Wed, Nov 25, 2026 at 08:22:26PM +0900, Namjae Jeon wrote:
> The $Extend directory contains system files such as $ObjId, $Quota, and
> $Reparse. show_sys_files only controls directory enumeration, so hidden
> system metadata remains reachable by explicit path. With the default
> mount options, forced immutability covers reserved regular files,
> allowing removal of $Extend and its entries. This can make later mounts
> fail when load_system_files() opens FILE_Extend.
> 
> Make FILE_Extend and its direct children immutable independently of
> sys_immutable. Classify the children during inode loading so protection
> covers directories and files with an unnamed $DATA attribute. This
> prevents userspace from changing directory entries or writing to the
> protected files. Return -EPERM for file flag updates before writing
> the $LINUXFLAGS EA or updating ctime.
> 
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Reported-by: theBIT5 x3zk <x3zk@outlook.com>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
 
-- 
Thanks,
Hyunchul
