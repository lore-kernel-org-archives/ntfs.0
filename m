Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B41314D06
	for <ntfs@lists.linux.dev>; Mon, 28 Sep 2026 01:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557762; cv=none; b=cJWK8ZxWQ7mvoXO9VLoI196LW18+UFMxt9Wb9f9BXlc6KXWJJy1P8mOooT2Xo5L0U1zMD5fvyxohFZoTLVhSOLoScSJXwRBy0kWQBYfktHZgUpWlMYPd+7xkoz7zslGjUQ9FJQoH9x9kw1YXikyX9pICvKVjgCLhTpXg27a3V6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557762; c=relaxed/simple;
	bh=DQWmD/aoM2fmLlnF4I+dfh/v5SgcSIIszjJcQ2p6i4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUa+R5j/kUZ/wQljD+Mscy7rrCevdwPLYOyHM9YzX5Rk+8VpQviMIz+nuLIfdneE5AdZVOrP7x/W2f/m/kfofapNzHVLBN4vtSykLgOS3WMR0Mi3FIabHppQyq0infwkLtmv92RApL76kQlH46TYppHrm3dgVArF4n5wut2Fp1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9SKT22c; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9SKT22c"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86b90133ae8so1082263b3a.1
        for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 18:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790557760; x=1791162560; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BWGV9HijPZkgScMjW7yhzmUJLDY0aEw94lDIbUCILps=;
        b=g9SKT22cqGw1+fwPFdM5t33TcWETZ0FC3GuIJZ0W70ljLM3G0+pGvy9pncX5n3RZjH
         z2Kfepx7wL91ZfNjB6AJNZ1h6rh3NwIdRxWfSj1yg8nf3FFibZefWMQOiot6FeClbpZZ
         1bkj5dZ/Toa9hCfXzbz/ESkIVBjQXXqtwBf7jhxmcbVxxMHim6yKLYlT8YSPy+0os80K
         y/UdyBq+RepLewBgYQsxpu3jTJSf6GzBlX9LTqYmeXSQevye1MxtDFE/1ORXAgdYmXn/
         j+Q71CVHac2DeQim8yu5P2SkJocmhEDd7EYBcm8N6QYNmLsjS1mjO5C3vEmOmRgPQTxg
         6J/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557760; x=1791162560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWGV9HijPZkgScMjW7yhzmUJLDY0aEw94lDIbUCILps=;
        b=ZOxQvWCTDsgaKXGs091iGV8lBOC/wg2R6We1ZkyYrKD8Z/kut0WcpKU8R3DMLEfsI5
         NKzldgaHNjUgSUxUPEpOcyYLTRRU1FimIi3YSvNKKdmImeGZPJ1PySWP4vDL8AvPom+I
         Qki6q3ajgNJB30cLpc95vfyJAHvz8EvzAmr2l81sHtjFgoDK4oppaePlyFVz8vOZ3CP6
         xA0/KK+7r5v+yiDG9xK8hTYJ0FGvhaHmU/VU+CR0+JOJcTw7HzJmGtpqcVuSCTERaPI9
         jQ2MHq7V+oS65txI5Fw4lAfvQ8JvVmoH3qhq9Tz8ArED47SSNwzrAJYtxd5PfV1fHJm6
         BDlA==
X-Forwarded-Encrypted: i=1; AKwUvByy0LGLZMO6u38HkkNFhzYJpG67idBn7sLybbb875wLqS5yK+/WmeOJyECG9oKAuKo9TzmG@lists.linux.dev
X-Gm-Message-State: AFuF++mwDFd/rnhApIlKwD8CR7ECJH3J4zVwRkhkpABOJJDsaBLNr2cK
	XLaadNK+7WO6wxIW/p4qzXPUgIr8o37LNOIjcRVYdzoM6FSLtbXH19OR
X-Gm-Gg: AYBFou2pNpNQV3LCWUwsuRoAaXlK3VD+CnknmZm1bEiX84mOutGnF7ULZBxkSxUC63P
	EHtJGFhERIDuYeOuMr7LocZ76EZt6++z4/GbrDH6vi4s2jTWsPOGA1EJn9v34sQr6JKCYyj6O1j
	yxJ5xcx/8B60yUdvq4Kz7DlJnX2/hszDLnlIAQtzivMD5Ku/Ekh/mwyuFTdIr9fo828Y/tr+Aha
	mXiUuglBrfSnx1T7Rl3X2QQJtGm+GwyBBXXrOpp5AXlPMyf2C0VK6uQ2dBaNCjn2/1FEOpj5tcq
	o+6QhpcmlCln8XfKEcSxuGgy5SHIGD+3XhY1VXJznXB56g8XPNeCOpsoZmPh41WN5FeaiZC/GCv
	3ojHgbuPJzBLnS+PV/7qZlyX5MLoDJNRfHcTYJzN/DZ00VxAdLAiLEApfcSyxT8crHeh5sGJQ9s
	CDNDPrPUqYdI+AyHm8CV//wA0fDHtYQLHI39zMzVsgl2O+tQv4Wb3sOjDgJt/q
X-Received: by 2002:a05:6a00:989:b0:871:ec2a:1cd8 with SMTP id d2e1a72fcca58-87e9967583amr9195258b3a.21.1790557759582;
        Sun, 27 Sep 2026 18:09:19 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8808f999924sm2754509b3a.3.2026.09.27.18.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:09:18 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:09:16 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] ntfs: do not map a vcn as a hole when its runlist
 lookup failed
Message-ID: <arm-PN-hKgF2U_Qr@hyunchul-PC02>
References: <arMoap0ZgeORuktT@hyunchul-PC02>
 <cover.1790417653.git.matthias.goergens@gmail.com>
 <20260927050831.2739166-4-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927050831.2739166-4-matthias.goergens@gmail.com>

On Sun, Sep 27, 2026 at 01:08:23PM +0800, Matthias Goergens wrote:
> ntfs_attr_vcn_to_rl() retries ntfs_map_runlist_nolock() for any lcn up
> to LCN_RL_NOT_MAPPED, which includes LCN_ENOENT, but turns a failed
> retry into an error only for LCN_RL_NOT_MAPPED.  For LCN_ENOENT the
> error is dropped and the read path maps the range as a hole.
> 
> An LCN_ENOENT below allocated_size comes from a base extent with a
> highest_vcn of 0, which ntfs_mapping_pairs_decompress() takes to map the
> whole attribute, so the runlist ends after its last mapping pair.  If
> the pairs end early, the retry finds the same extent and fails with
> -ENOENT.  On a crafted volume with 4 KiB clusters, a 64-cluster file
> whose mapping pairs stop after 16 clusters reads 48 clusters of zeros,
> with no error.
> 
> The same layout gets a crafted $MFT past the check from "ntfs: fail the
> mount when $MFT needs its own extent records".  With 512-byte clusters
> and $MFT's mapping pairs ending at vcn 4, an unpatched kernel hangs on
> the folio lock reading records 0-3.  With the check alone, the -EIO is
> dropped, records 2 and 3 read as zeros and the mount carries on until
> check_mft_mirror() finds the zeroed record 2.
> 
> Fail the lookup whenever the retry leaves @vcn unmapped, -ENOENT
> included.  At or beyond allocated_size nothing is mapped, so do not
> retry there: the runlist ends with LCN_ENOENT, or with LCN_RL_NOT_MAPPED
> when only the last extent is mapped, as after a write into it, and with
> clusters smaller than a page every read of a file's last folio looks up
> such vcns.
> 
> A failed expansion in ntfs_non_resident_attr_expand() or
> ntfs_attrlist_repack() truncates the runlist under the runlist lock but
> restores allocated_size only after dropping it.  A lookup in between
> would now fail, so restore allocated_size under the lock in both.
> 
> The crafted file now fails from vcn 16 on with -EIO, and the crafted
> volume fails to mount with the check's message.
> 
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
>  fs/ntfs/attrib.c   | 38 +++++++++++++++++++++++++++++++-------
>  fs/ntfs/attrlist.c |  8 ++++++--
>  2 files changed, 37 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index eab4d8d32132f..30d3d2eb5ef3c 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -344,6 +344,23 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
>  		rl++;
>  	*lcn = ntfs_rl_vcn_to_lcn(rl, vcn);
>  
> +	/*
> +	 * Nothing is mapped at or beyond the allocated size: the runlist ends
> +	 * there with LCN_ENOENT, or with LCN_RL_NOT_MAPPED if only a later
> +	 * extent has been mapped.  Return that end as it is.  Below the
> +	 * allocated size, an unmapped vcn is worth a retry.
> +	 */
> +	if (*lcn <= LCN_RL_NOT_MAPPED && !is_retry) {
> +		unsigned long flags;
> +		s64 allocated_vcn;
> +
> +		read_lock_irqsave(&ni->size_lock, flags);
> +		allocated_vcn = ntfs_bytes_to_cluster(ni->vol, ni->allocated_size);
> +		read_unlock_irqrestore(&ni->size_lock, flags);
> +		if (vcn >= allocated_vcn)
> +			return rl;
> +	}
> +

Could you merge the above if statement with the one below? Both
statments use the same condition.

>  	if (*lcn <= LCN_RL_NOT_MAPPED && is_retry == false) {
>  		is_retry = true;
>  		err = ntfs_map_runlist_nolock(ni, vcn, NULL);
> @@ -354,11 +371,14 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
>  	}
>  
>  	/*
> -	 * The runlist fragment containing @vcn could not be mapped, e.g.
> -	 * because the extent mft record holding it is corrupt.  Do not hand
> -	 * LCN_RL_NOT_MAPPED back to callers, which would treat it as a hole.
> +	 * Neither the runlist nor the retry mapped @vcn, which lies below the
> +	 * allocated size, e.g. because the extent mft record holding it is
> +	 * corrupt or because the mapping pairs end too soon.
> +	 * ntfs_map_runlist_nolock() reports the latter as -ENOENT, as @vcn
> +	 * lies past the extent it found.  Callers would treat
> +	 * LCN_RL_NOT_MAPPED or LCN_ENOENT here as a hole, so fail instead.
>  	 */
> -	if (*lcn == LCN_RL_NOT_MAPPED)
> +	if (*lcn <= LCN_RL_NOT_MAPPED)
>  		return ERR_PTR(err == -ENOMEM ? -ENOMEM : -EIO);
>  
>  	return rl;
> @@ -4703,11 +4723,17 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>  	if (err2)
>  		ntfs_debug("Leaking clusters");
>  
> -	/* Now, truncate the runlist itself. */
> +	/*
> +	 * Now, truncate the runlist itself.  Restore allocated_size before
> +	 * dropping the lock: ntfs_attr_vcn_to_rl() fails a lookup below the
> +	 * allocated size that falls past the end of the runlist.
> +	 */
>  	if (ni != locked_ni)
>  		down_write(&ni->runlist.lock);
>  	err2 = ntfs_rl_truncate_nolock(vol, &ni->runlist,
>  			ntfs_bytes_to_cluster(vol, org_alloc_size));
> +	if (!err2)
> +		ni->allocated_size = org_alloc_size;

We should protect it with ni->size_lock.

>  	if (ni != locked_ni)
>  		up_write(&ni->runlist.lock);
>  	if (err2) {
> @@ -4719,8 +4745,6 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>  		ni->runlist.rl = NULL;
>  		ntfs_error(sb, "Couldn't truncate runlist. Rollback failed");
>  	} else {
> -		/* Prepare to mapping pairs update. */
> -		ni->allocated_size = org_alloc_size;
>  		/* Restore mapping pairs. */
>  		if (ni != locked_ni)
>  			down_read(&ni->runlist.lock);
> diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
> index 1bbd2bc62c582..3660e7fd24b13 100644
> --- a/fs/ntfs/attrlist.c
> +++ b/fs/ntfs/attrlist.c
> @@ -168,14 +168,18 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
>  	return 0;
>  
>  restore_old_runlist:
> +	/*
> +	 * Restore allocated_size before dropping the runlist lock:
> +	 * ntfs_attr_vcn_to_rl() fails a lookup below the allocated size that
> +	 * falls past the end of the runlist.
> +	 */
>  	down_write(&attr_ni->runlist.lock);
>  	attr_ni->runlist.rl = old_rl;
>  	attr_ni->runlist.count = old_rl_count;
> -	up_write(&attr_ni->runlist.lock);
> -
>  	write_lock_irqsave(&attr_ni->size_lock, flags);
>  	attr_ni->allocated_size = old_alloc_size;
>  	write_unlock_irqrestore(&attr_ni->size_lock, flags);
> +	up_write(&attr_ni->runlist.lock);
>  
>  	restore_err = ntfs_attr_update_mapping_pairs_locked(
>  			attr_ni, 0, locked_ni);
> -- 
> 2.55.0
> 

-- 
Thanks,
Hyunchul
