Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682710;
	b=OKpS4NESC0sw3QiCoYSz6Sr8f88Sl5ExLeJGMnf4Sc3ZXyfPsvmj4OZViw2clVYLlh8m
	 5n5JBDy6EU9yzjFp4YSEXcvEvCp8K8V2+ynu6UoTJ3PTZvP7IqOLJj+27LPhZi14GbO+/
	 clPmu0RJLQivmRi8lfCowpsl+DpXHEBNpHw3kD7Pz+miitoK1tFTxBr16tIjXrUW6/gR4
	 Y20y1CIu9pBBZ3UDOYFWr5t2VXXxNsG5BkS9sD6NB+yFh11pHNqRo20t7Qsa48WtzF1Mh
	 S1OkWab/vmOAPI6sV7vaF5zFm6Z9BHhus1EsR3gTDOiLgz2R6y2cyIFHlm+BEaV4Czg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HHkvrm/cXf+KKJ9uHpRzjH6xQO1oeJsTmoSROPx2mwI=;
	b=mhO3AOAGsyt+3J6tDZ9PfC6LdRQ3yuvlGOgBaZhAoeKRkPQzZ++17YvX47CsnP0f6K63
	 Mhyjt3p3dYsXgGQHJ6rzg93oIpcJL9lpy85cUeF7+5lwGVrEPZt9y6Z03P2n3q2fRTWGb
	 8Q8xGVQpnwmaLPnPjQzbFnjyOUz0qxjintgT4gGxCyUZS2ZhjkuA4i2Sv3vZ69UXnRiZd
	 aVEJs13b3cMC/W9pkVssNRlLYEmAuLzLyK9LvbAGt9utUa+bSinZu2StWZ/qPikmLdUHY
	 RIdoLbchwPOMQzQyh+W1lvnaebVZnXWF3pTR2quiieltIcSugNPPyA6Dcv0UamMWuYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0IGjbDc6;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8C3606A321
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 08:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC8C3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0IGjbDc6
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f02f04a426so55339695ad.1
        for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 00:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795682709; x=1796287509; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HHkvrm/cXf+KKJ9uHpRzjH6xQO1oeJsTmoSROPx2mwI=;
        b=0IGjbDc6tSJyAY6ytn1pqddIvDEfh1gN9lwzGP8kqkL5f4Kv4U0rh6RRk/syC1CinZ
         ZJdCbIqrCNESsmHDU3SAWXyjssZSRORE7gNg+1nBxlnxR1YVhT8JD9i5I22VVThi3Nya
         Dq8wpYGkDUveixjxHehUxI5qoORpzR3v7rMEY97kVe0hAgNo0HDJ9MsOO3QiJWQVNBdX
         fFcUTwjh1+RG7uOCCHnmjS+HWmvRB3+w3ZyQOgmmudcZFhGigFZAEubxibytur2aQHhz
         9pPQB2K+Yvd7YdZ2oiJFSOWKop3rJKdWDXKx86v0Gf3SqHEbAAjkhEHsjYsc0qV1MlnI
         84dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682709; x=1796287509;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHkvrm/cXf+KKJ9uHpRzjH6xQO1oeJsTmoSROPx2mwI=;
        b=CYlNxCFfjkbma1CU3n+sWHiXlJsGTukSW0thrudYuSnPLeriykgsExZzakIRgb/UqR
         f3ynZJxD2mpsd39oabHDlUabzPa13TooVT4hJ4Uqif0Xw3xtdnJ7xezxdg8rBoxtuaFn
         WK0Aggv/wKMPb48aAPSigxQs4XvTdrLa/U73zKXTDhx0WVoNI7yPgP0kcn2EIG0tYrjC
         IyiJygP/U8kzBDenccn69/NE9zVIzpTZkH0oA2G+sx5XKhrDTFtHBr/Eo81Od6hbI4Ki
         q2UjcukwSfLVxd2PDlG6I1PMYVzjD4JfOmdi4W3v+M1oUJGaP6xH+xLoFJHFyO89fj06
         R+Kw==
X-Forwarded-Encrypted: i=1; AL+hErFHBtf3aFSefyg0CPxmJQHZdm+FVmiQdlNJ9+187d2Rv5MREc4i49lHW0sum/uXNTssbIBV@lists.linux.dev
X-Gm-Message-State: APuU4Z/JCoF/0opWw4LmS1ubvSdea+cWZXvnXmd4mebcUDI9f3EAeWun
	6eqSR5hkkK1dyekQpZ7J9ul095j6xRDohFVsLtT99o3RGxbl3DaW8wHc
X-Gm-Gg: AZFdTZcumOK097MtCi6QCHxrineqQfeGhmz+1xxhPUO+V638Lv1s72LUb69Au8ydaWz
	5eDWui40ODuR0DZG8Q0DDO9YR9xZh2NSy/HVpi2Q09q19PrZpKLhQtcU2hYjV7dP/ymX4JkyAkH
	oLsno+5gUGoMH5w+r2rPOEhUu85ne+hKYPm5hk/SIBNXmgx8dW/hEws4qvEckKsrjYRPFtCz2Gb
	C00W6JccJxPfSa1ZpyXxXWSGfovL5PlndeliPRUUW20m4DKBCzokgbZ8N1HrpkCqKozXgONEeWU
	rz91zTPfbrIaq3hq8akhL1hJvD0Y8Wmv5suof2GPnI63uAxs2OJlv8cTMNaC7bCmsqZxif9VIYc
	HWOgXfdRtbB8Ll9KKJLGDOh14KTBo3ld/pgfq1gMJmBSShEEE9y9BCvJr4NIBZQNmN799oEKWN7
	6V+8c0KgjNv5PEcpr+2j6Z1jHc938qXzfEpeteRx2d+sdInoXPObk1XTaRPljdrLMmQDUlOg4Gi
	zedCMoJKdgqakLSSXrBtrrRMU8zRB3Uh3JdDDu2JtEKQTVHBvLCpiDb90qxxJgezVGDbZrJsUnu
	vKA5iP1D6SLXM52CVMWYLuSO7m/q3tdKhXPaAysL
X-Received: by 2002:a17:902:e849:b0:2ef:f37c:723 with SMTP id d9443c01a7336-2f03f1cfb80mr227770735ad.9.1795682708843;
        Thu, 26 Nov 2026 00:45:08 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84425sm102021965ad.6.2026.11.26.00.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:45:08 -0800 (PST)
Date: Thu, 26 Nov 2026 17:45:06 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, liubaolin12138@163.com, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH 1/6] ntfs: mark the record dirtied by a resident write at
 iomap begin
Message-ID: <awfxklnX3OVrMoom@hyunchul-PC02>
References: <20261125073547.154150-1-zenghongling@kylinos.cn>
 <20261125073547.154150-2-zenghongling@kylinos.cn>
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
In-Reply-To: <20261125073547.154150-2-zenghongling@kylinos.cn>

Hi Hongling,

>  
> +	/*
> +	 * The record holding a resident attribute can be an extent record.
> +	 * Mark the record the lookup found dirty here, while the search
> +	 * context still points at it.  The writeout of the record cannot
> +	 * overtake the inline copy: it is serialized by the mrec_lock held
> +	 * until iomap_end.
> +	 */
> +	mark_mft_record_dirty(ctx->ntfs_ino);
> +

If the write fails before the data is copied into the resident
attribute, the MFT record is still marked dirty and may be written back
even if its contents have not changed.

>  	a = ctx->attr;
>  	/* The total length of the attribute value. */
>  	attr_len = le32_to_cpu(a->data.resident.value_length);
> -- 
> 2.25.1
> 

-- 
Thanks,
Hyunchul
