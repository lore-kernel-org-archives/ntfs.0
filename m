Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEEA28690
	for <ntfs@lists.linux.dev>; Fri,  2 Oct 2026 00:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790900372; cv=none; b=KSx57NAz9ikc9CJuHv4XgBKGIhlEGeiPwVLgdzvZOlk69Itn/A6WdhjbomZJ35SoroBtezgsUVB0+581hxdLPp8jJpvctxvfnWobu8Un9FZil9Tv8IZrcXfPlqXTXXS/h5RrH828Ot3u591QeNYi3cuy4boesy+E4y9qjnNgx/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790900372; c=relaxed/simple;
	bh=kUBQTyDRdNBIObWlxG/YdDxpo87GWyYgJttoaaGXTqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zx24KLL3BxpFW02FEemMzGByntcxPR/BUhW44YY3Vaj5BAs304TjfVINxeo8P9YJ+h0jc32CHbZt6ZbKt8IZlOQ3ygOoSdHNGNvEDWuRn3zIZ+Azs1T+ugtUgCaAd4RfR9V3p97Rq/93FZkMzVdGPQLBq3y3X0eoIhRAYmXSAB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhrIu9cE; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhrIu9cE"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78dd412cfso2877911a12.0
        for <ntfs@lists.linux.dev>; Thu, 01 Oct 2026 17:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790900370; x=1791505170; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BUsap1DSRISulfdDtCLguVKFC6X0B5V082PAsB5stsk=;
        b=FhrIu9cEllVYAGhjNz+8xqrZCPYI5/4NL9DZu3alwjXU6u5pomMV0/m7cVlh9Dc+m0
         PCMUBM5ogYgQfkfI2TvKAeP0aRG638npSxv9Py9SUDKbx2gGZZ1Olyb/95nArU1fO9b8
         /66cbFoIKXwE/L1BVzBqHWv934fh6v2koL7v9wbB/r/G8LT2VHxcPjvT/rQ7TbaAvi6F
         ZdQLltSyVuIPJrg/Szu5e6tkorq6AH0rymbQMX7gKK/3hgzFR1Znn59M2xQfIPW0x6qk
         sIZuJDv02kwv1yRbFQ7BkeoYean/j//Zf6HOZ0masH1qM4lPB1wpu9Kvjm/zvZRsRYF/
         fJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790900370; x=1791505170;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BUsap1DSRISulfdDtCLguVKFC6X0B5V082PAsB5stsk=;
        b=dj9N8A+IkPRS4TaD2vD/WKuRr2OMp0wFOW3NxzfLuL5vcmi8JXoELw/EkWjJH+y/Wj
         aBvuiTbHr4Lgeiuv47BSEmgOZpeydHRXdAXAwQ2WQYVqH1nLwfNGkSFCUHjvilO6qvNM
         YcVtPXTVD0mQJDZy84gMwDw/ry0RyK4lkI0LyQNNpWLsHqinY5IyUXyR/nQB1DV2922F
         nTwWU/eA0GANL64XaE5Xf4ShRZDL5BAOgfdhg5fC8DXrpihHh2qX4CEEA+zidhqRpg0k
         x94SWhm+yy/LXEPOGa34ZrBN6N0embOq0mtfM7UDuKiafad7xumMAEPZju8ddrEgkYXw
         lCEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyS6o/EXFYOQn0o2lVfcuIhQ3g03sszV1XyBL9mpBD5zLRv0TI4J9h02NzX3smzszHc1Nm@lists.linux.dev
X-Gm-Message-State: AFuF++l902ZVogO49aGf6X1PtsIfDwikOu7MeyXFbqafJkpv1wwQvLXq
	Lnd68rOcm9+1kqNlL+3fPIOWFbITryp6xXna1qsiNqXVRx1HuIA+e4Pz
X-Gm-Gg: AYBFou2W/l+rsCv5MPVCL/N+cfjgt7vuj6CcK+OnxMswUUxZym3WCsXwliOnkcOimmu
	L93D/pAs8i9rN3cqcZ6REi90K8sR+yGBqpKErQMtsjXnjYqISR3EC4004/+6QaIXIAklJgKYkQf
	1XzinN4d4Sl3VXcQkuF5HMThHSgfPulVU1MRCeEMBPSYzr8tP8gvFASi9Hkd1WfB1x6EQKH4Kfn
	5F/k2h+tI6Rhnf4bPtzD4hfZD0/soub37ikZZd10j09y451lUnSOMUYX6s3Cv+LulPMZAKp6fx7
	T7vF4gzpGhQQbvZrtwQm4hMNWzhQsakdfUNhZ6ItKddsKtJI29MDYvPKYKWxvNS6xuetIwe383I
	gj/r0cL/t/3c/CWyhuGw8LLorQeMIOewdaAjApKkeA2yRUm4iWfwnkKMoKmxSkr5uMi9QTYNKkP
	1hOUQb1oSu1aeDRB0xP83dk4g8EjLSqVzgnrH2UwICBfUJQy5u9D+pH3uWZeXD
X-Received: by 2002:a05:6a20:d74c:b0:3de:7854:854a with SMTP id adf61e73a8af0-3e0bcaa8497mr1036858637.6.1790900369746;
        Thu, 01 Oct 2026 17:19:29 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f738639esm261847a12.23.2026.10.01.17.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 17:19:28 -0700 (PDT)
Date: Fri, 2 Oct 2026 09:19:26 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Mark Eiger <eigermark8@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev
Subject: Re: [PATCH v2] ntfs: write a clean LogFile on unmount and remount
 read-only
Message-ID: <ar74jneAvzVH3Zeb@hyunchul-PC02>
References: <arzJaqJbyue5sjIO@hyunchul-PC02>
 <20260930225213.53315-1-eigermark8@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930225213.53315-1-eigermark8@gmail.com>

Hi Mark,

> Leave the LogFile the way Windows does after a clean dismount instead:
> two identical LFS 1.1 restart pages with RESTART_VOLUME_IS_CLEAN set and
> a single "NTFS" client whose restart record is an empty checkpoint, so
> there is nothing to redo or undo.  The checkpoint follows a no-op record
> in the first log record page, which is also stored in both tail copies.
> The log record pages are written and flushed before the restart pages
> that refer to them.

Thank you. I also verified that this approach works as expected on
Windows.

> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -381,6 +381,14 @@ static int ntfs_reconfigure(struct fs_context *fc)
>  				return err;
>  			}
>  		}
> +		/*
> +		 * Leave a clean LogFile behind, so that Windows can mount the
> +		 * volume without writing to it.  Not after a forced remount:
> +		 * writers in progress may still be modifying metadata.
> +		 */
> +		if (!(fc->sb_flags & SB_FORCE) && !NVolErrors(vol) &&
> +		    vol->logfile_ino)
> +			ntfs_write_clean_logfile(vol->logfile_ino);

I think one more change is needed. $LogFile should be persisted before
$Volume in this function and in put_super() to prevent a failed
$LogFile write from leaving $Volume marked clean.

And any errors from persisting $LogFile should be also propagated to the
caller.

>  	}
>  
>  	ntfs_debug("Done.");
> @@ -1729,6 +1737,13 @@ static bool load_system_files(struct ntfs_volume *vol)
>  			ntfs_error(sb, "Failed to load LogFile. Mounting read-only.");
>  		}
>  		NVolSetErrors(vol);
> +	} else if (rp) {
> +		struct restart_area *ra = (struct restart_area *)((u8 *)rp +
> +				le16_to_cpu(rp->restart_area_offset));
> +
> +		/* Continue its LSNs when writing a clean LogFile later. */
> +		vol->logfile_lsn = le64_to_cpu(ra->current_lsn);
> +		vol->logfile_seq_bits = le32_to_cpu(ra->seq_number_bits);
>  	}
>  
>  	kvfree(rp);
> @@ -1974,10 +1989,6 @@ static void ntfs_put_super(struct super_block *sb)
>  	iput(vol->mftbmp_ino);
>  	vol->mftbmp_ino = NULL;
>  
> -	if (vol->logfile_ino) {
> -		iput(vol->logfile_ino);
> -		vol->logfile_ino = NULL;
> -	}
>  	if (vol->mftmirr_ino) {
>  		/* Re-commit the mft mirror and mft just in case. */
>  		ntfs_commit_inode(vol->mftmirr_ino);
> @@ -2025,10 +2036,18 @@ static void ntfs_put_super(struct super_block *sb)
>  				 */
>  				ntfs_warning(sb,
>  					"Volume has errors.  Leaving volume marked dirty.  Run chkdsk.");
> +			} else if (vol->logfile_ino) {
> +				/* The volume is clean on disk, so is the LogFile. */
> +				ntfs_write_clean_logfile(vol->logfile_ino);
>  			}
>  		}
>  	}
>  
> +	if (vol->logfile_ino) {
> +		iput(vol->logfile_ino);
> +		vol->logfile_ino = NULL;
> +	}
> +
>  	/*
>  	 * Release $Volume while the mft inode is still available: if the
>  	 * commit above failed before it could clear the dirty flag,
> diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
> index fdb57279d..1e6696b60 100644
> --- a/fs/ntfs/volume.h
> +++ b/fs/ntfs/volume.h
> @@ -71,6 +71,9 @@
>   * @mftmirr_ino: The VFS inode of $MFTMirr.
>   * @mftmirr_size: Size of mft mirror in mft records.
>   * @logfile_ino: The VFS inode of LogFile.
> + * @logfile_lsn: current_lsn of the LogFile restart area found at mount
> + *	time, or of the clean restart area we last wrote, 0 if unknown.
> + * @logfile_seq_bits: seq_number_bits belonging to @logfile_lsn.
>   * @lcnbmp_ino: The VFS inode of $Bitmap.
>   * @lcnbmp_lock: Lock for serializing accesses to the cluster bitmap
>   * @vol_ino: The VFS inode of $Volume.
> @@ -144,6 +147,8 @@ struct ntfs_volume {
>  	struct inode *mftmirr_ino;
>  	int mftmirr_size;
>  	struct inode *logfile_ino;
> +	u64 logfile_lsn;
> +	u32 logfile_seq_bits;
>  	struct inode *lcnbmp_ino;
>  	struct rw_semaphore lcnbmp_lock;
>  	struct mutex volume_label_lock;
> -- 
> 2.54.0 (Apple Git-157)
> 

-- 
Thanks,
Hyunchul
