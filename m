Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080024;
	b=y5Stx9J7vmI4hnxna/L8bCPfK3BvgkIA2EXQCdLzt/Wz2jYtW+C7Z7PTie9FWhR8umrO
	 H3Gg+6IcRNW3ZCYXwdaOg8N9m1jngboargPR3bbEf0BN9z9YzV4i9yYuo9NpPyGwFAB34
	 yP0Mnr1WTMYDTPE1s4RLd1J8pene3t5Spm5i1CnPuDIlM4zabhzLwwcC/UeVJFPrf6OzF
	 nBB3vn7xnifXgy3mciYPt4762nkI4mN/6FmZcOegNOlBb+aU0JGih+JQ7A8uVnq4KUsYX
	 vobIeVONcw5RHigDsL042wwKZBdYqjYg7y5bWX3DRqWiCONfn/4HjxAEA5o5kIJ9UbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AdM+3NvU13EIF1s02O4+z9d0vDNB4xMv1AhgPFsDih8=;
	b=V8tZhrf/6lwhHJ8rMAOCtqNlqTEbW4ff5eT99eVTH9jcdSgGPBivNPLuzHLHifPViCuA
	 U/7u+QiCY+LsoQTnuWdQggB1XvkV5Z+smtYN9PfVRa3lrrnDwC8cYPf2VYx5fmLiqmXPE
	 PFUk1y+1EwAFfD3ME3BLLBhWI+8Vs6ObuU8Fv98ZcQE1dX9oVLmCMl5hpgTwo7UB834aB
	 s3bQlYzn2kf6QnmB21ysLVT1Ku/L6ZBw6pYhtyu3Om4JXS1IkTAWJLeVeJYhVXBm48HjQ
	 Z8V0VhuUGdyxx8lqeRJdiC0qkkbZtf/h1mR1KB2Y+f8gByf9ekvoXgahiQwwpAHn+Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="JrpRJdQ/";
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70836606A31D
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 05:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70836606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JrpRJdQ/
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e977109392so21834415ad.0
        for <ntfs@lists.linux.dev>; Mon, 26 Oct 2026 22:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080024; x=1793684824; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AdM+3NvU13EIF1s02O4+z9d0vDNB4xMv1AhgPFsDih8=;
        b=JrpRJdQ/llcJ6nfNVr07G18AjFlfFmVIzWJZatLgHB/Kf08cBQx5MrRsCrNelWu7AB
         s+bGcMC2Uc+3U+J7rpx4WWI/B2hSteQlqdcSFpPC/TOXy/i1jb6IFFVtBvtMbnXnP4Z0
         jduysY7EF30nInC2xgUL1QLpXZEcxXVQrKuEm0nbGJX1pdrDGg/Uq9fCuSRgr/2PhLY4
         oBNKQLHcaUMhu9cadgwvr1rN2o1HBb3nlz/gxBfwY5k3PFjCYzjzBnNZSm/LqmgyWu22
         ALaYLgMj1NNGbUqIIVFeLvpe/EtlkxEN/IrDL/x9QvPPilCi4SfNqorTh9x0DkRrKfHr
         4W+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080024; x=1793684824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdM+3NvU13EIF1s02O4+z9d0vDNB4xMv1AhgPFsDih8=;
        b=mxE/0FRfGLvWciNt8bLXyNgTntw88knKg4L+eWBhELA1n62QbId86Z3x/OKUTo1gWj
         4QzNBi3pVpbohCNMr6zjznUfeb9pBYFGvioSR6g7G80togo9oyFwQiTMcOc3YyDJKxoX
         oOB5v+j5VV70Nd32Z8j0p11dcwW9scYy3iaYXoJDFfIYysTolPHhYwdxgnCeciJmcVHZ
         0e36AJ00dfoApmaWHw0HDSfMJozXQPWoOUtKzXXNhGuRbfZM1d87zuxmTlzvMW+Yv+vp
         UCpbta7tLPPjdAYheyrdkT0qNx8o3+0vH1SJCO5bJwW4qMwtsHV7yqQ+dW098Fmmsgw3
         clLw==
X-Forwarded-Encrypted: i=1; AKwUvByYYDnoug92UM04vLdKVL9mGOpLfH3hozk7rUNZyzaPl4FtCRVh6BMRDGuDkIJMQnKdOJpy@lists.linux.dev
X-Gm-Message-State: AFq9FYLUzFg9hx4Kw5LKq6TRdSYAqBgjv7ReJjMfTSBNgAZ7lR2eNHmy
	V404h5tTu3eWKh61sxgnzNi+tVhq2guNA7u+lj3XrOH1/3H7eND/r5Sm
X-Gm-Gg: AYBFou2qDfqNcmewMfST4HuXw7ZKKm9XlGW9o1vgWrAE9L8FYUpNCQpJUFVty14TQpF
	LJ2oQb2GTYzTxbybVowp3f3Edc0S6NbLByPT8GnVg8P1JQkL8NzcXcVHV/Jk5bJhVx+vIux2hCV
	HGTW4Yr+nyvSrZ/aMRi3vRufwpAnsJ1vC6oN1vHhspaCgJeoc+nSuebTt1/RnNaGa2HdXuJrXVo
	FlhWpA4SqJvurADc/rv+/ZgVU3r3FAM1Av1TVvLMkiY8FRU81dhWEkU173nYfiYa4SHuwwXc9PA
	l59D0eWnq8Lebpz2QXxfWPEs96ZqMlsQ870d7GomGFp5X3HLvzbLKzoR9VvUVdJC9XwyqZ1jVb7
	eXnQA86NFbelSp9VSqV8vtWymHrd+jJfHwN2GZxfbjBoepyZh7WjHnNaeUCjZciEjGCDomwbDVJ
	/sy++nFXXzTNgEOmqRM3SgbgBK7liuq3eOh5CFo154hl0k0DtM2U+vKJyJQnMzIsCk8H0bk+1dP
	agafTYOMDNEkJLSxwWG0acMdAB0x/fQBJuT2l0kM+Lcfos=
X-Received: by 2002:a17:903:3d07:b0:2e5:38bf:cb43 with SMTP id d9443c01a7336-2ea9c03ed08mr77511605ad.2.1793080023467;
        Mon, 26 Oct 2026 22:47:03 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c8f24esm3539175ad.57.2026.10.26.22.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:47:01 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:46:59 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: Re: [PATCH v4 04/31] ntfs: preserve attribute search context
 initialization errors
Message-ID: <auA600gtGbVWw_SU@hyunchul-PC02>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
 <20261020084421.2196486-5-liubaolin12138@163.com>
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
In-Reply-To: <20261020084421.2196486-5-liubaolin12138@163.com>

Hi, 

> @@ -5476,7 +5480,7 @@ int ntfs_attr_exist(struct ntfs_inode *ni, const __le32 type, __le16 *name,
>  	ntfs_debug("Entering\n");
>  
>  	ctx = ntfs_attr_get_search_ctx(ni, NULL);
> -	if (!ctx) {
> +	if (IS_ERR(ctx)) {
>  		ntfs_error(ni->vol->sb, "%s: Failed to get search context",
>  				__func__);
>  		return 0;

ntfs_attr_exist() still turns ntfs_attr_get_search_ctx() errors into
'attribute absent'.

> -- 
> 2.51.0
> 

-- 
Thanks,
Hyunchul
