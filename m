Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658471;
	b=krhc+akvKPifX/gGjq/VjCu6shwZOdS2jhqQfmlUwsQoZf1nu1/3rbEO+7fZdJbQ0WQF
	 0wN9tCc3TQ9UEgiKlH6SBr6s122EbBBwdVqAUq4SSDImmkGCG7wCFtyS43UXNmUNIzFJz
	 hvn7raMJS4WGW7QMrXXXiy0Q7jsc1QBD7kea6VJF1igGKxnnQa69Zki5ssYYFVFCXvdwW
	 Qb7JaGPvlxoPpWWCS1j5ljR0kdoTSRIyph2IUgDJaUILR+L6+UrTEslKsgjyiWthr3ucH
	 lmdCzUz2RTShv8Hg8c8rdgEG8x6JHitqttboujocRxDfAoJzkU7VbffGUyKsr0a3Wgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=znZpPMg7ooF6+R+ZrmeprHnl4R4cuXcKWPuk6CPDlBY=;
	b=v+j8Q5Qj2vJEBNIxPLamlaNejgHaa29D4pwYZou5cZTEmd7HEK8C69NqmcxAeWTpFqwg
	 OVG7rJ3GAtKpLAnLQQn/lJG0MozZhNkJDlvVMN8foahz3LEW2F2+IfwWnMwZnrnj0d4yB
	 HvdEDhB8uAR9PJGzSic0xO8fIRJUsbvZqGFwwsVEQTpvNX4UOhlKQs/9d5cNFHTbwyKzv
	 uMHbgnjCyM+kKuzHgL3WKF3qR1yN1lc7TlhMeDI+DFglHn2CYriri8kq7tzxqL0AmJDz5
	 v8i3Qh1AtwAg+zBSO6Q3z/vbpMp+RE2p2tw/kBmG/R6xHawFDBhNvWUv66iC+SkFfpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SkKlfJlw;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D135C606A337
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 02:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D135C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SkKlfJlw
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso3915464a91.0
        for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 18:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795658470; x=1796263270; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=znZpPMg7ooF6+R+ZrmeprHnl4R4cuXcKWPuk6CPDlBY=;
        b=SkKlfJlwyyBMMt7spsu+mRTloZaGdmGLBrsmSdFZ9XXiCEK64R/MMvNUWUzf4Frzwq
         KZlSdU/zt3YQs/Up9GRw+NcqPhSDHdFdOMurOvTh8cbwv55MeazRN/iHke+WF/e639pk
         xLkoww5NcI8CkpOLJE80BaPDPHsZJLnhdAvG54J/+E6C3p0bzpqC9dcD5voqOVsewFTf
         r5k9H1pr6SHhEyyOucxQ/vSDscSj5c+oVohRZz/GvjoqJ+QxYZziN+th3DkPgaG4SmuZ
         1LWdgRjAaiT3bMjw2/cX3BPK45ARUwr1PT4eGedbdojC1NIj2uNrsnJaafnaGFHIhiNT
         rs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658470; x=1796263270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znZpPMg7ooF6+R+ZrmeprHnl4R4cuXcKWPuk6CPDlBY=;
        b=X4H4VxlmMTlqNfYImDNaGwGuhIogrjXpiQQMq9kTG9z1yjc0WC6i1wja7rK+lSaqDs
         VIYltJwUZpCGFXK/0RI7nlhbFHppLL5xfSzwQ3rAvajj2sFZYbnnAGZmE2sqcZBZptKG
         z5EQ752NsLoSC1uibVRd+3n30RipTEP4TL/gCejNfWgetaJqaku0y4R0SAYE9qUYPj9e
         pBdGcD/+DfjmfezGAnF+3RsTlgC3ZmON97Q/4waqtGDY7wwgyBgXs23cu7cXaue2saae
         77GzYNdPUktdG0y/Hh0jXsyDLqB6QUuDeOi1l3ZEnPqq9mkaY/Tyh61Koh4WWgoYWL9z
         HE/A==
X-Forwarded-Encrypted: i=1; AL+hErEEemPeHwrlm4bKss14OywiuzYDlxbCllIRUBOYDIQrcvcDF1JGaHAIeM66Kjq62AH9YteX@lists.linux.dev
X-Gm-Message-State: APuU4Z9zvsao6xL78WiZJXv8MFubT1wZKjP6i/W7V/l4ymM5fFoFJDO7
	LNmYPNbmkZlaOFu9lJoGRZnQnn1LlNM4NgqHWD4DfR2WTZs+cT36LDN1y0sn1Q8N
X-Gm-Gg: AZFdTZfhahLJ0LUdLw8giRQP/r2US9l6oBySb8SZKClw1WHi9dPRIuATyCdnIRGyPSt
	1a/lmsad/zUr6abSt2ZvhPBfZGS1Q4tQCXwSL9l7qfbG+uFCJSLDIQmp/sXhyw9lc5j/kBf6Taf
	ambQ5N9I0Sg/brjJ22wKlYvHG89zfbK9QAqyPOS2AnMNK1NxedTH2195sDVH+hOkWguqLD5wUKq
	Obfj/GlJosvw/pODYrJAstqwkbYeERQeGY3plJN/akHk4ENGMiQIDFNkt+uSJYoMCrMIUJfl5mH
	aUOWRQOwD6n/tBA7dlUG1QSm6Y3FfYGe3g5tGt9ymbohHCvKYVb8cJIRB9zGd7hsUlThjmoUarp
	fNaeTzxI2HH/7SAb+RFuOnGRYppfw+aGhg7wXVFiX0LfRxBCaU1qdcv0cJPJ9IwnXfExkm5qTe1
	T8U1huLrHdw8XPNcT/8R93Z2ZhdkOOv3AmbmFwIlnDxq+OrswckWzCO+TJvS4SQ3IsmYfXIoeRv
	EEdglOcpkc6Oe15P5xkmD87/PweelHD9OursnL+bYgl5gUDPSEbqzEUslLwJjsW/A7PaOz416ZO
	WqGHOxQare6uCfmkniWvqzn4efswT8+VslOgQ9nq
X-Received: by 2002:a17:90b:3b49:b0:3ac:b048:fa13 with SMTP id 98e67ed59e1d1-3b41c9beaefmr19757865a91.67.1795658469904;
        Wed, 25 Nov 2026 18:01:09 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm35245361a91.8.2026.11.25.18.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:01:09 -0800 (PST)
Date: Thu, 26 Nov 2026 11:01:06 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Showta Ishizaki <zakinko@snowrabbit.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ntfs: keep i_size of a directory equal to its index root
Message-ID: <aweS4uqvdtATt2gm@hyunchul-PC02>
References: <20261125-ntfs-01-v1@snowrabbit.org>
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
In-Reply-To: <20261125-ntfs-01-v1@snowrabbit.org>

Hi Showta,

> diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
> index fe2a79b..73c8e6f 100644
> --- a/fs/ntfs/index.c
> +++ b/fs/ntfs/index.c
> @@ -1434,6 +1434,8 @@ retry:
>  		icx->idx_ni->data_size = ix_root_size;
>  		icx->idx_ni->initialized_size = ix_root_size;
>  		icx->idx_ni->allocated_size = (ix_root_size + 7) & ~7;
> +		/* As ntfs_ir_truncate() does; i_size kept the old length. */

Could you remove this comment?

> @@ -611,6 +611,13 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
>  		err = ntfs_attr_open(ni, AT_INDEX_ROOT, I30, 4);
>  		if (err)
>  			goto err_out;
> +		/*
> +		 * ntfs_attr_open() sets data_size to the length of the new
> +		 * $INDEX_ROOT, as ntfs_read_locked_inode() does with i_size
> +		 * too.  i_size stayed at the 0 set above, so stat() gave 0
> +		 * until the directory was read back from disk.
> +		 */

Please remove this one as well.

> +		i_size_write(vi, ni->data_size);
>  	} else {
>  		/* Add DATA attribute to inode. */
>  		err = ntfs_attr_add(ni, AT_DATA, AT_UNNAMED, 0, NULL, 0);
> -- 
> 2.54.0 (Apple Git-157)
> 

-- 
Thanks,
Hyunchul
