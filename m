Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195858;
	b=Y3b+bLsMLWq5+lI0xvXeo+yWAVzTl/xDzSeA25w5i49zMbwTIi+Z1vM3UCm6lI3UAe0o
	 7NdbA+7I2eIa+k5wCkdUrbZmDt0TAau4aBACjF5ZvVBZJC05uilsVhe/pWO5EV46PNVeW
	 tpYOXp4gQmqh7vdvafC3m8lMMHehtK8FqvvsOit2nwWNm12rB4v71SWrXUCr3ANqYHot1
	 v9Z5yyoDP4cuBG83PlyTCpRqINBlL4LeaOoy4SUD+GoEU7D8n2GY3T4FVlHMcT2EIIWqK
	 QncS4iZbkO1TklH1QjfVGxVpT0Pp9TBAtKg44nGlP3sCKcCEAyVY+4hqlozcLqdrKQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Cpp+sFCicuYgf+c3zxc4haugV0ip6eM5biX4gD19sTs=;
	b=AKVjsM1nEZHZgGhXKUblV9tOlAwIGCJ+MnPQ105l5dc2r7SaXsXWFCNtPv+TmDDns+uq
	 a8o0+nHDh/PIrQzG/2t1+OLmGyEpxGXeku6b+zo8ml8XBXSdThY79jCvhz4m1xxpxAB2N
	 yRRuk3vWnYaVlSSAJAK6taxtAGyzCSHv4M1T8etlQqOaCPrjUaib1jBYLeT7rmTTsud19
	 Tx0k1k8O2Q8DICXHPJrK66Q4CnVF8Y3v0NbksPPHYWeSABt9rkgrp6iV2ZiGOJod+59Jz
	 uxK7HbKnnNqats+yFAnY1vi5saYfBzARSfV65iO4I+KYJ2kN78xkNGLXReKzwYG44eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.cmu.edu;
	spf=pass smtp.mailfrom=andrew.cmu.edu;
	dkim=pass header.d=cs.cmu.edu header.i=@cs.cmu.edu header.a=rsa-sha256 header.s=google-2021 header.b=RGyu6SPB;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DF7606A33B
	for <ntfs@lists.linux.dev>; Fri, 20 Nov 2026 17:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77DF7606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.cmu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrew.cmu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.cmu.edu header.i=@cs.cmu.edu header.a=rsa-sha256 header.s=google-2021 header.b=RGyu6SPB
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53639b8903bso14305901cf.0
        for <ntfs@lists.linux.dev>; Fri, 20 Nov 2026 09:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.cmu.edu; s=google-2021; t=1795195855; x=1795800655; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cpp+sFCicuYgf+c3zxc4haugV0ip6eM5biX4gD19sTs=;
        b=RGyu6SPBEHYDmLTEwxK1uQToBdZe/27/VWaUp+NWKkIKkK8kn0qCfXW59imn8d2Vds
         3RqGd2aBUgkiI9+ML28cgyCU2AcckjZ6dbKetG0Nh24H1vN3Zbu+yQ2JuA1wGBwagMVp
         zgwELNEcrWscGb2SQzm9V9kLU6aPToLOXWquPa0OX9uzU9FrgWi80eg/z4okOV7Zrbi2
         Ahj96I6voDWy0AvALBjY3lPEnf6Q/nrCVbqkSmMytJwdLWF8FRcIu9P1u9dFLVvvVKVp
         xEk86V0zdgLZ096FJnJCdHtFEu3HstUgQoiwL319+IBfbWwMhDz09oJImf6vaAlzNV8g
         /APA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195855; x=1795800655;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cpp+sFCicuYgf+c3zxc4haugV0ip6eM5biX4gD19sTs=;
        b=Yv1+zltkWEtB2A/SF343yYAp/LK0+Y+0BcCoQlsSU9YBKlnW+FbIUGFqd+repuOrUF
         hSLXUg3/2hHRBR98n9SJtOHF+eDs/Vq7oSzmlXcLBN0dA/Q6hTvrEvcJv7iaExFeAZ4N
         L63ZZVpKDSeKFQNZRl4iT5G3urL27les5Jm+zfGOqLz8IuYB3/ZjARbejPOqBbDTasyC
         MHr323Ms17xvtOrYTAYiIvmnGkh9bGSddrbRcccQW1rumEzSDLHr2eXsYt/ngADoGkcS
         fpnPwXX5WklyGiLbzzwG3Jv+91ig3usQkAO7SLmHmm3vJJQOn7MTKqi65D08l9TJyNDi
         G6hA==
X-Forwarded-Encrypted: i=1; AL+hErG/M/knlM9TD1/R6tA46cscNEl0cXBdSVY+/AavePLkVbDQA2imcKDcQ0XeTRMNHAZls4xK@lists.linux.dev
X-Gm-Message-State: APuU4Z8sKngZPD6Nht1H4WtVUfEMDevAbzl3NP3IrfhKie7rUU8hlu5P
	BZAhXw0h9h0LUsqcNyCLKHeAgqaEfnJIGzaGPp4dcbJWz4wDP3PYN9uYGgv9W/DhlQ==
X-Gm-Gg: AYBFou1IVsG1GUy0ByTDU4MpajniTC9MjOFG6dz3/xzMD/XVE+ADQQb4NWrB0K7UhYO
	GhsAjqyJ0v+UFlNDlr1CrY8WphT84oVODF/jQxlqJGw2l0CfmVabnIyaeTsD7MNvhC0eYU3bHjV
	1JFls6VeKiA/U9KHMSuMTqfS3PiJeRKUu/xl73Hs9SoZinIl0Ppx7LpeRRKj76a3G21lMGQmJ+q
	Okn+KLVB/2wkmPqadrvjLvl4JC0DAooMQrmHWrYo+ohrZcUPzcSfW26vqBH12+MuxD9UNKVJEDt
	/N8EVHfFcdNdOPXcedcM1GJipoKoAEPLe3vZJ5wYBBgNnOHyn29wwSNmTdEFUgYtJA4fPIxr8Vl
	jzVuJg4HquwnwUBrBVKCO/CU2zxd9aDiJW9OfvAWO/ojrtcFGw1ipTLTrMYDMqK8ptM5sC+m517
	Y+m2uC4hlHyU9eoV0hCrXm0tnftIksvtmqg4kpDT6kvu9xZ10cg21WSTO/zJhsXk2yNwivs2NqN
	CcKXovFIUIx4+ZtXTB46lqdiphuV2VU7/vF2tYRR2pARaf/UZUZcd49NopDFDvWTbm3VyYW8fWa
	s5h/vJoEInPul7+gwwBB2rO87I280uOQEXrN+GpHjRMlT1/0QRg=
X-Received: by 2002:ac8:5d0e:0:b0:535:1d5b:a7fa with SMTP id d75a77b69052e-55d769fe4ddmr65344931cf.14.1795195855134;
        Fri, 20 Nov 2026 09:30:55 -0800 (PST)
Received: from cs.cmu.edu (tempest.elijah.cs.cmu.edu. [128.2.210.10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882e32dsm28152341cf.13.2026.11.20.09.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:30:54 -0800 (PST)
Date: Fri, 20 Nov 2026 12:30:41 -0500
From: Jan Harkes <jaharkes@cs.cmu.edu>
To: NeilBrown <neil@brown.name>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>, Carlos Maiolino <cem@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
	ntfs@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v2 2/4] coda: don't d_drop() early.
Message-ID: <20261120173041.bd3xeidt4ndkmimd@cs.cmu.edu>
Mail-Followup-To: NeilBrown <neil@brown.name>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>, Carlos Maiolino <cem@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
	ntfs@lists.linux.dev, linux-xfs@vger.kernel.org
References: <20261117000115.1433875-1-neilb@ownmail.net>
 <20261117000115.1433875-3-neilb@ownmail.net>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117000115.1433875-3-neilb@ownmail.net>

On Mon, Nov 16, 2026 at 07:09:14PM -0500, NeilBrown wrote:
> From: NeilBrown <neil@brown.name>
> 
> Proposed locking changes will mean that calling d_drop() could
> effectively unlock the name allowing a parallel lookup to proceed.
> For this reason it should only be called *after* the attempt to create a
> symlink (in this case) has completed (whether successfully or not).
> 
> So move the d_drop() to after the venus_symlink() call.
> 
> Doing this also means that if the upcall that handles venus_symlink()
> happens to look up the name being created, it will get -ENOENT rather
> then a possible deadlock.
> 
> Signed-off-by: NeilBrown <neil@brown.name>

Acked-by: Jan Harkes <jaharkes@cs.cmu.edu>

I was sort of already assuming that the userspace cache manager should
never ever traverse into the mounted /coda file system tree because
there is only a finite pool of worker threads. But it is good to know
that this change would fix at least one possible deadlock.

> ---
>  fs/coda/dir.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/coda/dir.c b/fs/coda/dir.c
> index a85be5962e62..b47299527b65 100644
> --- a/fs/coda/dir.c
> +++ b/fs/coda/dir.c
> @@ -249,13 +249,13 @@ static int coda_symlink(const struct mnt_idmap *idmap,
>  	if (symlen > CODA_MAXPATHLEN)
>  		return -ENAMETOOLONG;
>  
> +	error = venus_symlink(dir_inode->i_sb, coda_i2f(dir_inode), name, len,
> +			      symname, symlen);
>  	/*
> -	 * This entry is now negative. Since we do not create
> +	 * This entry is still negative. Since we did not create
>  	 * an inode for the entry we have to drop it.
>  	 */
>  	d_drop(de);
> -	error = venus_symlink(dir_inode->i_sb, coda_i2f(dir_inode), name, len,
> -			      symname, symlen);
>  
>  	/* mtime is no good anymore */
>  	if (!error)
> -- 
> 2.50.0.107.gf914562f5916.dirty
> 
