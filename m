Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792464878;
	b=aEnjka7P1aPdq3E8qzJ9FCgmnrnqjiQF6iHm1E70VepAibml9l4sdn1ZRN+spdNhAYp/
	 kw6TAcPMOTPXN24h9n417BGG6fbzcefQgNCSPh8QRQ559Gc87j5sXReOELCElUiaahVQ5
	 7wL3Wi4oKypATkjpKfkIP6VPmNZoWKBIfpGM16wtl8WoHs3NQ1knJT8jk0QuQD0xQXkGe
	 8DDROlgDePJD26qXMjtfVsOKH6izmmHDAS5JxiyQ/N3cCbd/mK5Dee3SncLEHrYKy/iDQ
	 tCcoBOJkf6kyJZ1gHh+ol79rG9BJ0tt0U0ybUvg3KPdpm0/nv6VjGWwebpIokkGuuOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792464878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cHHMdux+IKbxsb4cqhar0LQ9q5oFKRSlwMjgy1dsTvg=;
	b=FOM2e7ZWX7wLpukmvF0ADsBFItKsAcIAJq9YUp/EgaIjXzPhcPtIrXE3PcWzU+PyKQ1I
	 MdZe7QVz+SAy6EMbeU0xVdm+J+6Zls11YHNGuJe4ppGExALsCyERGHLOV327yZA/uxek2
	 eLwPJOLCclFamflCPC4+GAiD3CyhyYy+33q3wJxqj4KN3O1oEtmGMkMyXM4Vb8VS4+jnp
	 yQemmR/RjhsQCSVIebia38PXx8gbbVe8T9Ty72nfyCyFzVqFsZghWTqx4xPg8wutUgReR
	 UT7PjStsiZuNa3K68r7dgAfxo2915XLzRAN+IhkOgIa/QAWcthGxBg3Rx9acMSOJrRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c7mHQXQM;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA64606A31B
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 02:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFA64606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c7mHQXQM
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso1350375a91.1
        for <ntfs@lists.linux.dev>; Mon, 19 Oct 2026 19:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792464877; x=1793069677; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHHMdux+IKbxsb4cqhar0LQ9q5oFKRSlwMjgy1dsTvg=;
        b=c7mHQXQMNRAKQUH3tY8P9a/ac0xDbWXZrXaCjE4VLVwCLnZ0IGABxhCkt+Z/86Ukok
         rbCzwICibu/UqgG/ujgtBv5j9F+1KVtfnApr+Atj1P0baZUljYwsdscrZEos2XoOgrGc
         NdshxT/Xz42NM3eByqqkVksJwj1kDLSQpCkd1mC2Jjja+kmTb1bPdY55ukRCViF2RQ1i
         e8wMzMesPHMEoxpDogDrHq8crDfaQ3WyEegH+RRZsUs9Rveadj4sVLbq+fgIl6IWJiYI
         wgUx25hsq/upY2EiA4DCY8OsJiU/YlQZo8KeJ7ov7lzMIQ9qeRp2ffQzPAzWvU/lSbhz
         E/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792464877; x=1793069677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHHMdux+IKbxsb4cqhar0LQ9q5oFKRSlwMjgy1dsTvg=;
        b=0yjfzeVWsRTrQeK7Ozkdjo5QI2UHmAbbp4w9nYTak6c/UAJ81LJaENlFyKRhLWo7EQ
         9f6Ai25Nvo57kB40J/Ohj5voamXX6RnLLRdUjo0OQkO01vVyW+T/M73QHFDB0hSP17zG
         YeznjCWJcB0rMuwCYESM7tIU9lrE0gtQ4OeVzYyfHylZOsoLEY6VRZ4IOnF1yyrkjafz
         c2FWApCrD6dbjtGGex0eoxkmazxqCf/5juZNjOV5LC2RvCxEeBeBTrfFrSQzBgAXbp8U
         ynPrEd5Dpub/HXLPNGPt7abak4mpmHF1bChZUwViV7XqqrOLG1JZGIAOXgzaBlOsNcyx
         402g==
X-Forwarded-Encrypted: i=1; AKwUvByIKu7KVRxXu1q3b7FbJL0dvOa5hdLBqiamnBab+5tv4i7cBNxk6hYJ6SP3GgDPvKLgzWRF@lists.linux.dev
X-Gm-Message-State: AFq9FYKnmUcs4Ow3zZjXIt0sEAoJHyrZCJAEsxILE+hHobQmhcmTTtsU
	QVznIyZrif5Fi/ZMjZl2F+/H98faTgoTBysa6wQLpldBGZtl128NiuAq
X-Gm-Gg: AYBFou3d0ke01NZF44jKKzKmIvWHAI/XfL09c6QnnJFsNPoBdpqbLGvyMOOYdhafh1m
	KpGLFjfopTou7tpVIyCWE9cPJqfK7czplbegZbY7igphmgLJKGhXTe/YIGWW0EaQIr630y9rvuB
	vlNo5Fqh0DZ8805106KuVJMLLh2qdtkRWbx+ITqyqJSH65Gr+V6MyQTLyo/ynyEEZb9g2ch0mZY
	BH9OFKRNHN3SGbP4VWotDfC/PJeSIwDOGC1HsF2F7hjNudrGfO7fcyZNgS9l9LeReUVp0rFkiE7
	FUL5Lw8MEC8Tm/rlGdo9HaC4Qr0t9hk5qgRYXR/sK4kWbWMzGMYbe8B/u0Om/uJaaPEmnkf5gYj
	Rf5LRlPvv8Qn6TLnHp1STKRHT+yjRnUJLUdFYiwu0IAZFTDJ9YkJTDavIx2LL7jw6Xet4jUpgFN
	z1pHJfyCBEOXhtewuC81mxNJdAcyZ6wHdGkW+8hP0SMi4G5JYUaWRmBv83b3KW
X-Received: by 2002:a17:90b:2790:b0:3a5:c08:4c41 with SMTP id 98e67ed59e1d1-3acef153994mr7234905a91.50.1792464876928;
        Mon, 19 Oct 2026 19:54:36 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60bf2039sm1776689a91.1.2026.10.19.19.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:54:36 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:54:33 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v2] ntfs: handle a failed size rollback in the write
 error path
Message-ID: <atbX6ZAHk8U4Xsuo@hyunchul-PC02>
References: <20261019064918.152859-1-zenghongling@kylinos.cn>
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
In-Reply-To: <20261019064918.152859-1-zenghongling@kylinos.cn>

Hi Hongling,

On Mon, Oct 19, 2026 at 02:49:18PM +0800, Hongling Zeng wrote:
> ntfs_file_write_iter() extends the data and initialized sizes before
> it copies the user data and restores them when the write then fails.
> The restoration is best-effort: both results are discarded, even
> though the extension is already recorded in the dirty MFT record.
> When the restoration fails too, the extended sizes reach the disk
> while the VFS inode keeps reporting the old ones: after a remount the
> file appears grown again, with an uninitialized tail where the failed
> write never put any data, and nothing records the failure.
> 
> Keep both undo results: on failure, set NVolSetErrors(), which the next
> persistence point persists as VOLUME_IS_DIRTY, and log a message for
> the errors= policy.
> 
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
> Changes in v2:
> - do not roll the initialized size back on a resident data attribute,
>   where ntfs_attr_set_initialized_size() always fails with -EINVAL and
>   the data size rollback restores both coupled sizes.
> ---
>  fs/ntfs/file.c | 46 +++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 37 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index d810ca5904bd..597fd70ed30b 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -934,22 +934,50 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  				&ntfs_iomap_folio_ops, NULL);
>  out:
>  	if (ret < 0 && ret != -EIOCBQUEUED) {
> -		if (ni->initialized_size != old_init_size) {
> -			struct ntfs_inode *mrec_ni =
> -				ntfs_base_inode(ni);
> +		int undo_err = 0;
> +		int init_err = 0;
> +
> +		/* ntfs_attr_set_initialized_size() rejects a resident one. */
> +		if (ni->initialized_size != old_init_size &&
> +		    NInoNonResident(ni)) {
> +			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
>  
>  			mutex_lock(&mrec_ni->mrec_lock);
> -			ntfs_attr_set_initialized_size(ni, old_init_size);
> +			init_err = ntfs_attr_set_initialized_size(ni,
> +					old_init_size);
>  			mutex_unlock(&mrec_ni->mrec_lock);
> +			if (init_err && !undo_err)
> +				undo_err = init_err;
>  		}
>  		if (ni->data_size != old_data_size) {
> -			struct ntfs_inode *mrec_ni =
> -				ntfs_base_inode(ni);
> +			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
> +			int data_err = 0;
>  
>  			truncate_setsize(vi, old_data_size);
> -			mutex_lock(&mrec_ni->mrec_lock);
> -			ntfs_attr_truncate(ni, old_data_size);
> -			mutex_unlock(&mrec_ni->mrec_lock);
> +			/*
> +			 * ntfs_attr_truncate() rejects a compressed one.
> +			 * Skip it also after a failed initialized size
> +			 * rollback: the shrunk data size would stay below
> +			 * the initialized size, which the loader rejects.
> +			 */
> +			if (!NInoCompressed(ni) && !init_err) {
> +				mutex_lock(&mrec_ni->mrec_lock);
> +				data_err = ntfs_attr_truncate(ni,
> +						old_data_size);
> +				mutex_unlock(&mrec_ni->mrec_lock);
> +			}
> +			if (data_err && !undo_err)
> +				undo_err = data_err;
> +		}
> +		if (ni->data_size != old_data_size && NInoCompressed(ni))
> +			ntfs_warning(vi->i_sb,

For compressed-file, the code only emits a warning, which causes the
VOLUME_IS_DIRTY persistence to be bypassed even though the MFT data size
remains expanded.

I think that we should report the compressed rollback as an error.

-- 
Thanks,
Hyunchul
