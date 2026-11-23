Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795400183;
	b=nDvnBBSs+hR5JolAi07EMkD1ICh7/Nhlb9blgab3aqb0D6x/h9y8/fvti073Mf72G+VN
	 Pdda8Ptb4o6boWhnkGEJD/hWZ1+jSdnI3UajEQQUq9jVFtklGavBYsCfaHj41lH7etV7r
	 ob4mTSf6x3pSeDHQog0roNk7NHbeEp0Mqyx/39C0CDzPIqUp7APuBspPMgBcjc99Y1kzt
	 wCQI+Jlj9UKP/QbeSuKCCzLNjsmwDiOnMWQPkDW+ApZhjoihOzZSJv3GgA4dwBoYMX9iN
	 7noGF8hKkXdjxJJwQiZWJZOEiHAq8mvczYH0zJ+9eMUjFkvE+8rQtinFK/PeTkogH2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6lRbJCOVU+DRb+wBjrdaaxkOGEdqJxji7R1nJ/0GyKk=;
	b=kS0Zpn4En4zqPSzALf7O5KPZru71NZyBcM/7JwtlpMJ2ScotrMkfmqH4MRD8oLtmN0Bs
	 LHnQN72QZkGbEz8lyuDEgVSl2wtPeIHlC06bbl3NAagpPlJ/jUnpwzsYP3wAvQ1iwOo/d
	 8VFILxmX8IPX/8pIlCcDHIj1d2zENmp77UTAmQNODNWbJSyk9I7XuOwSguJPk9eX2A4In
	 KvOUFiXx8uIYKfKTclZoYzKdCqV+7MFWtBJSdVgRx4xdBOEXyk4zgbTbx2wvhz7OSQKuC
	 LpLdc3NikJOcgZS8BWguO/tjH9geYbTDtXNWVLqsoP/972F4lRZkv35F7s3JqDdOwKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvXXeoa8;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A64606A320
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 02:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21A64606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvXXeoa8
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38699cf08dfso2362889eec.1
        for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 18:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400182; x=1796004982; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6lRbJCOVU+DRb+wBjrdaaxkOGEdqJxji7R1nJ/0GyKk=;
        b=bvXXeoa8EzQxYWT0AxeDM7c8ZOcDv7Iew4/vVO5eoInTpOHB2IWjSeJES7e2zgIvUo
         sYPR+XTz0lCYqBIZcG5BHDpDIkOhtZ2dDg991PCWP6OgqVLkhXBuq+wQUoJZpRjainrU
         ClgWsTkK2y7P1whx6xeIoLV53KLDNXIQvbxcxSlKArg2plJ72eVUvFsPdcTLcBMIE6/C
         fE8Li2boKahYcTNX5PUmbL18Z1JhwomVcwPFbfKxNpLWm8WBcf1vYCjnjQFeAy7Q3KiD
         SmG30x5JGY0DK7IouMSWaX4SFhR8xv7kKvauOADgRV6oCSmuLzVQxD/PJO3wuu7NWXOE
         8d8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400182; x=1796004982;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lRbJCOVU+DRb+wBjrdaaxkOGEdqJxji7R1nJ/0GyKk=;
        b=WgS93j5Kxare9m9dAQM9f7VC+lv4xQGZbDJYrQp59EuYs2QT8R0vPaJ7Qn0yh/aW42
         nhHiRdiZwRb4ttmlxkYWRnkPytF9JNBI486ESOd065PWcqdrZIz9uXGVgwbiAjNvnk7M
         bhHr+WPxIZj7LwqbNAptYexOfjkQ9V3ZZTsXJc9s42rw2P7SIza11mxccJfHijpEWXfX
         SwGYwTag0+szjtQKO3DGu0/y9NckoyxiPASCvdHRwA5wmDUzcG2LQBpcbRFRMWf1pSS+
         iPK/nu7xDYHaVDbbBnN7HYH3nLQGTG3oaPGmiYBx2gXJrkPAf84iAGrwo9H2TDPLu2i2
         EK7Q==
X-Forwarded-Encrypted: i=1; AL+hErHWlica7RZLytXB2f17L92sBDl/LvhEPaU54OSvLTJPyscjeKU1y39pwHLI+xvic7k96aGr@lists.linux.dev
X-Gm-Message-State: APuU4Z+HgGtERw/tLgtMO3d2dfNZQbrjizItpdDJE1RppurP9zdE3Sdz
	ZlSaBG0t9BHggGXjGEDI+GGmnM9CdaM44dPDtGY7xJqoU9njJyBCwriV
X-Gm-Gg: AZFdTZcANjYTNzOio2v3llIu9nA6xwPjrwiujiHoT8ixpiQaEpHWschBMPtx3JaPA43
	mjvdNeRBv6nsSadCuu0qtfDFJPW4n9JVuhg8rdqjEC97cg8FPwegYYDMiS+agtqMA99Ro1/0BBC
	4tDwRsnmR3zzlXdpcxQGSC/E3hnqEA9/GbdJGtVfMqN7/yhw6LVT6slmqPItWZLlsdyqyKgMadK
	7dL9jvrNqqx1LCY+RMhD+dKSxPj+HvLW+SNnC5SV0ith3Pj9NHtrKIKyF0pIatK0UTMxJhOXXJO
	AC4eKfZcEBu9ZZEEzLEti+I8M8LB+LgsDdd3g+nT2dUApbkkcL/THeWoqVvx29A7A9GHgUqxy3M
	ig236Exw7zdv8A81HflB46DOgOWA2jpVVeCkGNmKb6nZI4GihuX9OwYiA2xGrzDWIzftFvsIhwH
	zkAKfwNqAKVUVPFe6GPdVCLvDOwIbiUASJPvlEKGDHbTyTlNqTpswignnT9TLndvc0XfP0hoMv5
	si+z5vYM+Yq4TmTWE06y65aV/tWsD+Lo+IkCkz911ke+CWeuUjtaLRbdoocSdwmYXqDtMgwA9Mm
	knvP4E+HXIlw2hvqpxQ=
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr16658728eec.27.1795400182000;
        Sun, 22 Nov 2026 18:16:22 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm25726347eec.25.2026.11.22.18.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:16:20 -0800 (PST)
Date: Mon, 23 Nov 2026 11:16:17 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: ernest.borowski.git@proton.me
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Baolin Liu <liubaolin12138@163.com>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng1024@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/7] ntfs: release delalloc reservations cut off by
 truncate
Message-ID: <awOh8Zxdmg_-wKPg@hyunchul-PC02>
References: <20261122-b4-ntfs-delalloc-fixes-v1-0-0726f0dce403@proton.me>
 <20261122-b4-ntfs-delalloc-fixes-v1-1-0726f0dce403@proton.me>
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
In-Reply-To: <20261122-b4-ntfs-delalloc-fixes-v1-1-0726f0dce403@proton.me>

Hi Ernest,

On Sun, Nov 22, 2026 at 07:19:37PM +0100, Ernest Borowski via B4 Relay wrote:
> From: Ernest Borowski <ernest.borowski.git@proton.me>
> 
> A buffered write into a hole turns the hole into an LCN_DELALLOC run and
> reserves its clusters in vol->dirty_clusters
> (ntfs_write_simple_iomap_begin_non_resident()).  Writeback hands the
> reservation back when ntfs_cluster_alloc() allocates the run.
> 
> A truncate that cuts off delalloc runs before writeback drops their
> dirty folios, frees the clusters of the attribute with
> ntfs_cluster_free(), which skips everything that is not a real cluster,
> and removes the runs with ntfs_rl_truncate_nolock().  Nothing gives the
> reservation back, so the free space reported by statfs() and used by
> ntfs_available_clusters_count() shrinks by that many clusters until the
> volume is unmounted.  $Bitmap is not affected.
> 
> Workloads that rewrite files (open(O_TRUNC) + write) or truncate freshly
> written data lose free space quickly: a test that writes, truncates and
> punches holes in six 400 KiB files on a 128 MiB volume sees statfs()
> free space drop from 79 MB to zero in 80 seconds, after which writes
> fail with ENOSPC or come back short.  A 1 MiB buffered write followed by
> ftruncate(fd, 0) and sync leaves 256 (4 KiB) clusters reserved.
> 
> Release the reservation of the delalloc runs that the shrink cuts off,
> before the runlist is truncated.
> 
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ernest Borowski <ernest.borowski.git@proton.me>
> ---
>  fs/ntfs/attrib.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index 6ee6b6bcac..4028c310fc 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -4383,6 +4383,37 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
>  	return 0;
>  }
>  
> +/*
> + * ntfs_release_delalloc_from - give back the reservation of delalloc runs
> + * @ni:		non-resident ntfs attribute whose runlist is about to be truncated
> + * @start_vcn:	first vcn that is cut off
> + *
> + * Delayed allocation reserves vol->dirty_clusters for every LCN_DELALLOC
> + * cluster when the buffered write is done and only gives it back when
> + * writeback allocates the clusters.  Runs cut off by a truncate never reach
> + * writeback (their dirty folios are dropped from the page cache), so their
> + * reservation has to be released here or it is lost until unmount.
> + *
> + * The runlist must be mapped completely and locked for writing.
> + */
> +static void ntfs_release_delalloc_from(struct ntfs_inode *ni, s64 start_vcn)
> +{
> +	struct runlist_element *rl = ni->runlist.rl;
> +	s64 nr = 0;
> +
> +	lockdep_assert_held_write(&ni->runlist.lock);
> +
> +	for (; rl && rl->length; rl++) {
> +		if (rl->lcn != LCN_DELALLOC || rl->vcn + rl->length <= start_vcn)
> +			continue;
> +		nr += rl->vcn + rl->length - max(rl->vcn, start_vcn);
> +	}
> +	if (!nr)
> +		return;
> +	ntfs_release_dirty_clusters(ni->vol, nr);
> +	ni->i_dealloc_clusters -= min_t(s64, nr, ni->i_dealloc_clusters);
> +}

If ntfs_cluster_alloc() succeeds for a LCN_DEALLOC run but the
subsequent kmemdup() in ntfs_attr_map_cluster() fails, the reservation
has already been substracted from dirty_clusters but LCN_DELLOC run
remains.

Is this planned to be addressed in part 2?

> +
>  /*
>   * ntfs_non_resident_attr_shrink - shrink a non-resident, open ntfs attribute
>   * @ni:		non-resident ntfs attribute to shrink
> @@ -4479,6 +4510,8 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
>  		}
>  		ntfs_attr_put_search_ctx(ctx);
>  
> +		ntfs_release_delalloc_from(ni, first_free_vcn);
> +
>  		/* Truncate the runlist itself. */
>  		if (ntfs_rl_truncate_nolock(vol, &ni->runlist, first_free_vcn)) {
>  			/*
> 
> -- 
> 2.56.1
> 
> 

-- 
Thanks,
Hyunchul
