Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080112;
	b=Hpv+ydOLsXeU1VOAeiKCML5y+gkVxLozT6XRVOwQSC5Z7mTnto7ipH4oKcfRQQuGGBiZ
	 p9V38uR+Ny/xTAHI0xfazIh4I+c4DQyw7GIy8AFE/wlb26ykhViGG00MJQvLfLns6nO0L
	 0af8BPn+jb21/EJlNMsfuYgPnq2F0lwQoPoAMSecjSVNhofy5+rsmqOjltowrdiECMTjC
	 snTfYQd1agKayseWezna88a05k+vOq3/9Hok8fNX39BgoPpyK7rN8qRphAcwv4pqhRGVm
	 JETVCAojOjwyYP/VS4E4DDGf9iZKqD3fWjAphUYwaxZdxK8q+J5ftMcqZkw4NqP2pXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3HZ4Fm4AG3rsN53yKwwnj0LhzGAfQLgw5WMO8Bj1+J4=;
	b=ydnJ1wlc4sMnoo0JsZSkEVCBVFKw4xpFFHLV3Gp3g3x1CRdPe0/PJ1LMI/s8qb/iKAk7
	 CzG3Q1PSqeTjGkjM7GYvGOQySRbK+LYLjU+NbwRiq0KbJrmTCiSiJaIqz2TWfaOmezyqe
	 ABXTW5f9TSSZWD0/cVwVelFKgPLp/qhDmhVuS+h5nrQqhAy4CFYQG3Ggxckg74WCy8HMp
	 wjzM7pRjmHS1vzi/4OstFPS4rbOCWo1TYTex+e6O4a9rmDq6kO7joNjlAG43rgE8Slenq
	 87qWunkki1Ae3rjfGbzVeZ+dZRR6FZpquVtFSC4JGlBYNseteZ6zK7wuaD5JweT0I1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PYnV3+FS;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D35606A31A
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 05:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35D35606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PYnV3+FS
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1944806a91.0
        for <ntfs@lists.linux.dev>; Mon, 26 Oct 2026 22:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080112; x=1793684912; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3HZ4Fm4AG3rsN53yKwwnj0LhzGAfQLgw5WMO8Bj1+J4=;
        b=PYnV3+FSCNOc393rOLuw7zJqkrGn64VMNV3/8jyzc2JVcoPjd4iFHgZZmok5qqU85d
         xoj5yIqG4Vu1b5/22birPq0dX+8Mf+zOqeit8vwYcad8+pahlLJ+PtEmbgLoY0UARSdH
         +WQdA41Cs0kQYfv7vTMXP/Xx4wNO/kPVOb9zBhNGrsNMGKdv9CCpP3I6QFiDho12xJfm
         vxpnDBAW1sPdHsU3HUEMw/yKKTI3r9darxopSeuJp+4mWc9toXIRlVAeg6tWl/CKPX2f
         HKI6wfycHNtjIQ4glRDZ3sP/ocpRTlOL70+n6yXRfLvo6HdcQ5TAvA2ciWLnIRH8KtXK
         iudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080112; x=1793684912;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3HZ4Fm4AG3rsN53yKwwnj0LhzGAfQLgw5WMO8Bj1+J4=;
        b=fP0nei9Ic6g1ERFo8iV/SPg6PaPsEUKNfbvEB3hBdi8ef/uT3fiw8IwaEDE04rfbmO
         N0HgUdWuklU2jZ8C868HPB8ePS6pGSIXT5XYf8Kj64GFBmHiwYzU4/xCps9xl4wSpAMq
         gsAHFJIQfWOfJdQVnlRcyHKV63IbyqJ3T8GYlHtJ+UER8iOEL3edgVCowGH4kZOByv1y
         p41HKioQtEIzYCrXLGXO5lNOD+b2M2Kz2uR8tVwvqRoGjdVpIyr7fMY3WWQIG9ARUwyJ
         yIiLEMoICk4s/be0JOHa74tTFbgcET99Wgw8CfiGduwBYXJ2ks/yTDkWEGeoejBfzwnI
         z4Kg==
X-Forwarded-Encrypted: i=1; AKwUvBy+7ER/328Jp21wWtyNlPo77dQX3qZO8sCbm8R5Y4GrsxLOSK0rGvj9GN0GsRIZno26CkaH@lists.linux.dev
X-Gm-Message-State: AFq9FYK9fo25U/gUOyv3ZrRcCrE8YP8W9EP4hb9zU/9mPcL4nmS294p9
	u/2Y5wkwcNHpscMba1tLv2Ps5cep44wXvW+t2X3IU8YrpHTInzEVn0UI
X-Gm-Gg: AYBFou2TRzRNqio5WPnL3nWJsd+W4ReTgsyGldCqLRE6dDKpmJMFAm0wAGNbmqjFUIx
	fUCUBFkbXzRiSoYveqpIGtB5Jdj21MuJzoDFCOhuoM6WUJ6q74zoklJ20BMB4BcQR5avqrzgrmE
	c2oCsKxhrc9wXrxNhs+NF1rw4NtehcYDuMykgChWLwUSkyTTKspIFj71a+MYDShKIvPlzvshJhb
	o0cdWHDYVpMNU53h27c85H2WDBMYims8LH1QOSIYXtEPWKehqpML4nkdk86j7aqDVF68CcU4w7u
	axLUPpTLILnvPegj4TOe4hLPwSedLBz03NfWRCs+h8gVQNTEJ7tXS03ZKnzx0kL7YS9rZAB7mXj
	zdjQn/9DEThRWDxRXjdGg0xSoFH3NRxCg2+9rMGWusCWfyVWX0wDkvaKz+BGnsGCktsqzemSzs9
	5uCyZik4Dr+110CYUY/JLy1qdp6DV62cxXknnr/Pe9Nlhbhu4R0kTSdVy8V+Xbg+Ic4lWrla4dv
	v7W40MSCEYWjfI6kauiQRJ3yMd1RXbdz3yuSeWY8ymjgg==
X-Received: by 2002:a17:90b:3e4c:b0:3ac:9e76:aa98 with SMTP id 98e67ed59e1d1-3adeafc8962mr7575012a91.64.1793080111459;
        Mon, 26 Oct 2026 22:48:31 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4064f4bdsm2015679a91.11.2026.10.26.22.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:48:30 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:48:28 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: Re: [PATCH v4 05/31] ntfs: report boot geometry and MFT bootstrap
 errors
Message-ID: <auA7LJX2rUZUH8v9@hyunchul-PC02>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
 <20261020084421.2196486-6-liubaolin12138@163.com>
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
In-Reply-To: <20261020084421.2196486-6-liubaolin12138@163.com>

> @@ -2802,7 +2822,8 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
>  
>  	tmp_ino->i_ino = FILE_MFT;
>  	insert_inode_hash(tmp_ino);
> -	if (ntfs_read_inode_mount(tmp_ino) < 0) {
> +	err = ntfs_read_inode_mount(tmp_ino);

There is still one error handling case where ntfs_read_inode_mount()
returns -1.

-- 
Thanks,
Hyunchul
