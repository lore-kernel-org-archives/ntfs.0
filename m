Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E050E286425
	for <ntfs@lists.linux.dev>; Wed, 23 Sep 2026 01:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790126195; cv=none; b=YEUJ+OzLvTPrNUBy5K/iyaGLtUWgWAWfBY5gUhPdyzrDIFMpBdyISWQUzqnIp+XSnoZqkUGVulzFJSeDMQEQWWDrfV+vcLhSuGN4w1jR+lnwm0OZK+Pmuf0bZPhbNUqqi5gn6gnQpUBnRkVNTXUCfovmY1/Cqf6aUUjSSNAnbB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790126195; c=relaxed/simple;
	bh=a2c2CW6PypfgOVWO7cUHyksDLEj6SEFvukGjc6yON3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNu2tetUJ2vwr7uLkJQYX59NbFwh5u5PTD2P6c59gGamFBYIoDHcm07ss7klrUY+yJ/2yr3pHUfN2vh0q9yrMT3w2sjE1n5Iiq+yxyQtU2xwWzQT51T/CuX+I6nJCKqjBwKGpwOOXbi0673B7yywiWAwFXoKLoeEQeAjvZoCIWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMU3igLB; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMU3igLB"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so268285a91.3
        for <ntfs@lists.linux.dev>; Tue, 22 Sep 2026 18:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790126193; x=1790730993; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5lWji8UmxNSsnkxKoH/cSiuyuZZ53U03RDNiUtRnj4I=;
        b=aMU3igLBwqYvkrW4An3P5DOX0NDoKa5ij3Hrze/pELmFNEPRdhmcog+86moHU6/ihx
         Sx1G+4bkKDIRJdzEKx4xB8BIqgTGFVYJ4J9IzZxRoC0BBGsAwgOwuUCo7h9ytSbZsQOI
         WALpiSGwddQNfPc6a0WpB4F/yGDJ4jitzLdiAAHZ5meUGNXGLgqUKAk2O7PGKWbcvFMc
         JiDR+Akik1tHQnzNB9wX4WYRAN9r+J12XQoXM1KGXdR5r3GtxPH19r5/GFZsc9lP6oMj
         z9wOMZA0O5Kx85TgGHt9PzJ6+ykcqw4nNUYcPihj7+9Dcq50TezI8atpEGR3Grktiz0y
         tUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790126193; x=1790730993;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lWji8UmxNSsnkxKoH/cSiuyuZZ53U03RDNiUtRnj4I=;
        b=B9dnxQRdBCAlYKaqdKlMBhwgo7sEIq8N3gc9UMaQmtZ5JxI/ECTyTgN48Dk8kgVIAR
         r7GlOGH2r+XT8woqVK+qCY3Ju2DJSu3AGPrp7ivtzmOW2bmUGy3eCqTaKPYMxFuhMErw
         W9eg+2MIUpqw/eV8pu64aSKsULsXa71S31aK0dPZhiC5eTpjVIpy/bmNpjRzHGN9b7lK
         yjLzCQvSZ9zwxn3csKqdJl82zgra/B9U/QVtTuLvNfE8jlKYRXRp/OUiQPbfoSLL1pIa
         l3g820SWe8AkR8ItnP8ljvb1UH8/7K2PaMjem+CxYnkYurvfqsva/im49FTp34eO0JEE
         nQUw==
X-Forwarded-Encrypted: i=1; AKwUvBwHrinbpByel0+6q39IJpgYRHQTkDDfWGxDlw7qLKVGfz1775LPqnYkXtOiO9ey+TpUOPZ5@lists.linux.dev
X-Gm-Message-State: AFuF++mM2WWDW5KnSdhq5jWwtfdHYjiLCYhximfUk8iBF5hxUMGfbAiK
	SrkJmRRf99x9+R/q9hzlF+ycA1jxRZph8xam8xbJLks7zIQZw57PPyrs
X-Gm-Gg: AYBFou3DyQQjJdOa6rpeoGWw0IcqfOCZWkY39fVcbje75mhFkrwPmvn6mCT8p+sPutT
	7TbA3U2RSh8DpmIsiU+P/+o5yf3vofmBzABENqoMzbvLuA1r6bSbejEPE/FwtOeVWPm5eXVRc4W
	HSERPRGEfRkKlAYYg5gTOMoKxd3zAONcEUXxHXJ/+qmC4ap4bpd7qUZuZMOEG2uQu4dzTQVcRr/
	vjdcSzDYBPpdhOEKQ+VKb/L62Vo7zP2fillTAI0nnVZPdDis+KIoeZQZosiXKZjWGLFl8du9bkJ
	oePM/3D2JQtXTOUmYtBZxsBAY7iSPSarQ9U5cZkin1FwKWOBClhGP3x03VITzbSx+fDrG3TkZEP
	ixXx5TD4//iYpyZFxp24MpvUNCtAqWX7ebKM37R6p/c/i60GP4e/3aMo94LAG+uyGZGAENIZ+mc
	MEIDdxKSmQFhwL5eAoZfvCNaSuTNV3VNTtfjFUl/rb8YxQVHy6JC0IyEHUs2GMSm10H7j6S34=
X-Received: by 2002:a17:90b:3d8e:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-3a07e568a05mr1067626a91.12.1790126193148;
        Tue, 22 Sep 2026 18:16:33 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5db05dsm2499195ad.49.2026.09.22.18.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:16:30 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:16:26 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ntfs: fail the mount when $MFT needs its own extent
 records
Message-ID: <arMoap0ZgeORuktT@hyunchul-PC02>
References: <20260922153931.1976405-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922153931.1976405-1-matthias.goergens@gmail.com>

Hi Matthias,

On Tue, Sep 22, 2026 at 11:39:31PM +0800, Matthias Goergens wrote:
> Mounting a crafted image hangs the mount process forever: no output, no
> progress, unkillable, 0% CPU.  Nothing is reported, because the task is
> not blocked on any lock lockdep tracks.  With PROVE_LOCKING and
> DEBUG_MUTEXES on it stays silent, and only the hung-task detector
> notices:
> 
>   INFO: task mount:74 blocked in I/O wait for more than 30 seconds.
>   locks held by mount/74: 1
>     #0: (&type->s_umount_key#26/1) at sget_fc
> 
> It is a folio lock, which lockdep does not track:
> 
>   folio_wait_bit_common      <- waits forever
>   filemap_read_folio
>   map_mft_record_folio
>   map_mft_record
>   ntfs_map_runlist_nolock
>   ntfs_attr_vcn_to_rl
>   __ntfs_read_iomap_begin
>   iomap_read_folio
>   ntfs_read_folio            <- already holds that folio's lock
>   ntfs_read_inode_mount
>   ntfs_fill_super
> 
> ntfs_read_inode_mount() builds the first extent of $MFT/$DATA by hand
> and then calls ntfs_read_locked_inode() to pick up $MFT's remaining
> attributes.  The comment there says what that assumes:
> 
> 	 * ... we would hope that we don't need
> 	 * further extents in order to find the other
> 	 * attributes belonging to $MFT. ... But lets
> 	 * hope this never happens...
> 
> An image whose $MFT attribute list puts those attributes in one of
> $MFT's own extent records makes it false.  Mapping that extent record
> reads $MFT at a vcn the half-built runlist does not cover, so the read
> comes back into ntfs_map_runlist_nolock() for $MFT while it already
> holds the lock on the folio it then waits for.
> 
> So check it.  Mark the volume while the bootstrap is assembling $MFT's
> runlist, and refuse to map $MFT's runlist through the general path
> while that mark is set.  The bootstrap builds the runlist itself with
> ntfs_mapping_pairs_decompress() and never goes through the guarded
> path, so only the re-entrant case is rejected.
> 
> The mount now fails instead of hanging:
> 
>   ntfs: (device vda): ntfs_map_runlist_nolock(): $MFT needs its own
>     extent records to describe itself. $MFT is corrupt. Run chkdsk.
>   ntfs: (device vda): ntfs_read_inode_mount(): ntfs_read_inode() of
>     $MFT failed.
> 
> The guard bails before the function touches anything: no search
> context, no mapped record, no lock taken.  -EIO is not a new return
> value here either, and all six call sites already handle a negative
> one.  ntfs_map_runlist() and ntfs_empty_logfile() propagate it,
> ntfs_attr_vcn_to_lcn_nolock() maps it to LCN_EIO,
> ntfs_attr_find_vcn_nolock() passes it through, and
> ntfs_attr_vcn_to_rl() and ntfs_write_simple_iomap_begin_non_resident()
> only act on success, falling through to the unmapped-runlist handling
> they already have.
> 
> Found by fuzzing mountable images.  Checked under qemu with KASAN,
> PROVE_LOCKING and the hung-task detector: two crafted images hang an
> unpatched kernel and are rejected by a patched one, and eight
> well-formed images mount on both.
> 
> Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
> The two crafted images are 28 KB each; happy to send them or put them
> somewhere fetchable.
> 
> fs/ntfs3 rejects both while loading $Volume, so it is not affected by
> these images, but I did not try fuzzing its parser.
> 
>  fs/ntfs/attrib.c | 11 +++++++++++
>  fs/ntfs/inode.c  |  2 ++
>  fs/ntfs/volume.h |  3 +++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index c949ff765075..f94e928f145f 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -103,6 +103,17 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
>  		base_ni = ni;
>  	else
>  		base_ni = ni->ext.base_ntfs_ino;
> +	/*
> +	 * ntfs_read_inode_mount() builds $MFT's runlist itself, so nothing
> +	 * should reach here for $MFT.  A crafted image can: the read that
> +	 * gets here already holds the $MFT folio lock it would wait on.
> +	 */
> +	if (unlikely(NVolMftBootstrap(ni->vol) &&
> +		     base_ni == NTFS_I(ni->vol->mft_ino))) {
> +		ntfs_error(ni->vol->sb,
> +			   "$MFT needs its own extent records to describe itself. $MFT is corrupt. Run chkdsk.");
> +		return -EIO;
> +	}
>  	if (!ctx) {
>  		ctx_is_temporary = ctx_needs_reset = true;
>  		m = map_mft_record(base_ni);
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index a777de8a80c7..55f6d3334238 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -2150,7 +2150,9 @@ int ntfs_read_inode_mount(struct inode *vi)
>  			 * ntfs_read_inode() on extents of $MFT/$DATA. But lets
>  			 * hope this never happens...
>  			 */
> +			NVolSetMftBootstrap(vol);
>  			err = ntfs_read_locked_inode(vi);
> +			NVolClearMftBootstrap(vol);

The scope of the bootstrp flag seems to be too narrow.
The outer loop continues to call ntfs_attr_lookup() until all $DATA
extents are enumerated. ntfs_attr_lookup() can call map_mft_record()
also, when mapping pairs is stored in another MFT record. So the same
folio deadlock can occur.

I think that NVolMftBootstrap should remain set until all $DATA
extent enumeration has completed.

>  			if (err) {
>  				ntfs_error(sb, "ntfs_read_inode() of $MFT failed.\n");
>  				ntfs_attr_put_search_ctx(ctx);
> diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
> index bc85a9592245..f9ecbbe205ad 100644
> --- a/fs/ntfs/volume.h
> +++ b/fs/ntfs/volume.h
> @@ -184,6 +184,7 @@ struct ntfs_volume {
>   * NV_Discard			Issue discard/TRIM commands for freed clusters.
>   * NV_DisableSparse		Disable creation of sparse regions.
>   * NV_NativeSymlinkRel		Translate absolute Windows reparse targets (native_symlink=rel).
> + * NV_MftBootstrap		Mount is still assembling $MFT's own runlist.
>   */
>  enum {
>  	NV_Errors,
> @@ -203,6 +204,7 @@ enum {
>  	NV_DisableSparse,
>  	NV_NativeSymlinkRel,
>  	NV_SymlinkNative,
> +	NV_MftBootstrap,
>  };
>  
>  /*
> @@ -241,6 +243,7 @@ DEFINE_NVOL_BIT_OPS(Discard)
>  DEFINE_NVOL_BIT_OPS(DisableSparse)
>  DEFINE_NVOL_BIT_OPS(NativeSymlinkRel)
>  DEFINE_NVOL_BIT_OPS(SymlinkNative)
> +DEFINE_NVOL_BIT_OPS(MftBootstrap)
>  
>  static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 nr)
>  {
> 
> base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
> -- 
> 2.55.0
> 

-- 
Thanks,
Hyunchul
