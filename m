Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54267359A66
	for <ntfs@lists.linux.dev>; Mon, 28 Sep 2026 01:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790559753; cv=none; b=Tn/dlVQw2xCWTIgkNixB5d0x5whFsy06UZi8k8RYPVQLqoargnTwgl66OUVPJ/fuI7PVz2mmnmEvAJC5WKC5uKkVkTltrqoZ0F1MQTKdZgBoh9q8daTzK3u8Kw5WpGKBWD1xg2EeOZvzGzLmBtEeLV5xcCrruxB79+qdmJBNAQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790559753; c=relaxed/simple;
	bh=M2rfpd69M4leNhETTwDwZ/UhdDJ3meopIk42Ywj5DnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPjxYovtJ9LDGbgx4hbipxAFzUQIbyEtRaBqavMQKt/zYMEJ4ii7KuJXtAPc0/CZRGLv/7YrccMU2FaXdnw5z9bMDmObQz7xkuHyIo8gTAI/TfG2EYMMQAPuY2Q9zt3CzcX403ykMF/gqIvxk9+QigX14dlDmjAowLkILygEbB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzuCzQ7e; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzuCzQ7e"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df958a8272so8997535ad.3
        for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 18:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790559751; x=1791164551; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dw2eDfHBpoJS0T1ZS6akDzDpDkeWdsLJ0iH9yZFxrPc=;
        b=LzuCzQ7eizAsbppcc+8HPGbfUkCArlnGCimBv3P/KqxdvAkHPyc69yFgOF6A2lUJ0d
         rTAT9GZAF9g/jM4TI/7TcXoZrjMC83QQZ7rxMh0afEB/FdodAlmqBWiEd0y5CVPkKS4l
         5odYfqj09Qu6h7VnwLYNW8KZ9fO/DKSDyz/EKzMubQE0Wi97Oa0r34DczaEYjU1GEjY3
         rc3+1HOB8DFI3R/zo+6IYc8GRkbq0D/ZqJsJhHokoe7BROKHRJIuDelm6Vp1zXOtW/pH
         Vlm72ye0XAbvbaBgDHPHE61fOmUGees4vkt9/sNjpVGxGjau/+sIbedWM0wVeKc91wLA
         AIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790559751; x=1791164551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dw2eDfHBpoJS0T1ZS6akDzDpDkeWdsLJ0iH9yZFxrPc=;
        b=AEqlo2x+Iw53Sf3pgElYH8BXa6EBhfls3fWG4KJi9tqyQBVApegwuk1ExOH9W3c7gZ
         qhPFbm4Dm9ovTivKTz5rfYoMHDjkWl02VtHJYHBm6c5vklInkr5tDTrcraJlujSEqmQM
         VAYS8ICssrJiPkQwiEK093XWKYbKHiwJ8IwPoQxSwZcTIVcfe6uwlIqe9gL6xY8Auo9M
         fZnv0NPegHwiuDLiMFAEv8y1tZgB8MLsc72fUGRQg1Hfswm5jmE+YLN0FgvaqGfA6r1z
         YMxe9keqcuyoeWoG5hKBacU4jbz3T/2CWwxWN6vsch/vQZIz0mcxrO525qSy/8p1HN7D
         lFXg==
X-Forwarded-Encrypted: i=1; AKwUvBx+7Rwy7elx1UHl/dMGwza4NuHYCTmurdWCGhxoisFMNWbF1+x8NE287dh+lHgz9i7Xb/B5@lists.linux.dev
X-Gm-Message-State: AFq9FYJ374JscKWtoRV8JFBPp/Lg1W4qpoU76r7zIf8UeoCdvwhNo39Q
	IRzNqFUyoKnQCQE7/Z0F/cbenqM1RIOYexZGLmWFwWdQqJ8k0vDoyWkI
X-Gm-Gg: AYBFou2P3b/ZEaI5nwSPCPrTxgak/Xs8ZRpmOCRHlEkMTr8MIdB9vFUwzGVqQXpvn9k
	XmKapuBGXGsRTwAGQJVZl97YMlAbTpldG8NN4jg0B2yADurQaFeIZ58B+DgAaNC9KJA4gFMbam0
	0Yiyi6R/OOgu4Op0CD7ivRUrLVuc0+rIpLdBvlYsaOgWW3c7NTrCaw0hUqAvTp/0/fW3JdwYkT6
	NuwYevTXGIHxvnubvIMRFhcyfVz465nDLzTvw2gB3yQXqHrImDoYofBBs0MUyjGevIZCKS0KYSk
	J651sq0aSLoLu42eioYz2cBCZgeZoWW+wMoOhGNQsI3N+36JWf32d689m1r1W2xiuPOYUFxq84x
	auBnvunT6uIX6IWB0bYpYffMsHkEzSa56Ncdp4lLc4oo826ecLKZnIzOEWZLzSmI+RF+Ux/G6Gv
	9e9uK+49Br2Pa/GHDOGmTII1nuC7mg2lRstR8V4xX45uJqQ3itUlGqfRJ+NPDE
X-Received: by 2002:a17:90b:2749:b0:39e:5b3c:4633 with SMTP id 98e67ed59e1d1-3a0985be307mr8946287a91.21.1790559751229;
        Sun, 27 Sep 2026 18:42:31 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e7036e3bsm10540562a91.13.2026.09.27.18.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:42:30 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:42:28 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] ntfs: reject non-resident attributes whose sizes
 exceed their allocation
Message-ID: <arnGBFRct0BXUFWb@hyunchul-PC02>
References: <arMoap0ZgeORuktT@hyunchul-PC02>
 <cover.1790417653.git.matthias.goergens@gmail.com>
 <20260927050831.2739166-6-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927050831.2739166-6-matthias.goergens@gmail.com>

On Sun, Sep 27, 2026 at 01:08:25PM +0800, Matthias Goergens wrote:
> ntfs_read_locked_inode(), ntfs_read_locked_attr_inode() and
> ntfs_read_locked_index_inode() take a non-resident attribute's data_size
> and initialized_size from disk without checking them against its
> allocated_size.  The runlist ends at allocated_size and the read path
> maps what lies beyond it as a hole, so a data_size larger than the
> allocation makes reads return zeros that are not on disk, with no error.
> 
> On a crafted volume with 4 KiB clusters where a 6144000-byte file claims
> a data_size and initialized_size 64 KiB beyond its allocation, reading
> the file returns 16 clusters of such zeros.  A sparse file behaves the
> same.  A compressed file instead fails with -EIO after a burst of "Still
> have pages left!" errors from ntfs_read_compressed_block().
> 
> Require 0 <= initialized_size <= data_size <= allocated_size, with
> allocated_size a multiple of the cluster size, when the inode is read,
> as fs/ntfs3 does in mi_enum_attr(), and fail with -EIO otherwise, which
> marks the inode bad and the volume as having errors.  initialized_size
> above data_size is rejected too because an extending write zeroes the
> gap it opens only from initialized_size onwards.  An unaligned
> allocated_size ends inside a cluster that the read path treats as past
> the end: a crafted 66440-byte file with 4 KiB clusters reads its last
> 904 bytes as zeros.
> 
> Sparse and compressed attributes need no exception.  Every non-resident
> attribute has a cluster-aligned allocated_size >= data_size, holes
> included, on eight public test volumes (seven written by Windows, with
> LZNT1-compressed files, a sparse $UsnJrnl:$J and a OneDrive placeholder
> whose unnamed $DATA is one hole, and one by mkntfs), on a volume written
> by ntfs-3g and on one written by this driver, and the patched driver
> reads every file on them as before.  fs/ntfs3 has enforced the same
> checks since v6.6, also without exceptions.  The layout.h comment saying
> that data_size can exceed allocated_size for compressed and sparse
> attributes is corrected.
> 
> This also covers a non-resident attribute list, which
> load_attribute_list() reads through ntfs_attr_iget(), and $MFT, whose
> inode goes through ntfs_read_locked_inode() after the previous patch's
> check.  The check was already missing in the classic driver; the Fixes
> tag names the commit that brought that code back.
> 
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
>  fs/ntfs/inode.c  | 38 ++++++++++++++++++++++++++++++++++++++
>  fs/ntfs/layout.h | 13 ++++++++-----
>  2 files changed, 46 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 9c97fc3f9e5ff..126c50b5a349e 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -651,6 +651,38 @@ void ntfs_set_vfs_operations(struct inode *inode, mode_t mode, dev_t dev)
>  	}
>  }
>  
> +/*
> + * The clusters of a non-resident attribute end at its allocated size.  Past
> + * that there is nothing on disk to read, and past the initialized size reads
> + * return zeros and writes zero the gap they open, so the sizes must satisfy
> + * 0 <= initialized_size <= data_size <= allocated_size, with allocated_size
> + * a multiple of the cluster size.
> + *
> + * Sparse and compressed attributes get no exception.  Windows, ntfs-3g and
> + * this driver all count holes in allocated_size (the clusters actually in use
> + * are in compressed_size), including for streams that are entirely a hole,
> + * and fs/ntfs3 has applied the same check to every non-resident attribute in
> + * mi_enum_attr() since v6.6.
> + */

Could you remove the comment above. The comment in layout.h already
document these size relationship sufficiently, so I think that the
duplicated explanation is unnecessary.

> +static bool ntfs_non_resident_sizes_inconsistent(struct inode *vi,
> +						 const struct attr_record *a)
> +{
> +	s64 allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
> +	s64 data_size = le64_to_cpu(a->data.non_resident.data_size);
> +	s64 initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
> +
> +	if (initialized_size >= 0 && initialized_size <= data_size &&
> +	    data_size <= allocated_size &&
> +	    !ntfs_bytes_to_cluster_off(NTFS_I(vi)->vol, allocated_size))
> +		return false;
> +
> +	ntfs_error(vi->i_sb,
> +		   "Attribute 0x%x of inode 0x%llx is corrupt (initialized size %lld, data size %lld, allocated size %lld).",
> +		   le32_to_cpu(a->type), NTFS_I(vi)->mft_no, initialized_size,
> +		   data_size, allocated_size);
> +	return true;
> +}
> +
>  /*
>   * ntfs_read_locked_inode - read an inode from its device
>   * @vi:		inode to read
> @@ -1184,6 +1216,8 @@ static int ntfs_read_locked_inode(struct inode *vi)
>  					"First extent of $DATA attribute has non zero lowest_vcn.");
>  				goto unm_err_out;
>  			}
> +			if (ntfs_non_resident_sizes_inconsistent(vi, a))
> +				goto unm_err_out;
>  			vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
>  			ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
>  			ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
> @@ -1446,6 +1480,8 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
>  			ntfs_error(vi->i_sb, "First extent of attribute has non-zero lowest_vcn.");
>  			goto unm_err_out;
>  		}
> +		if (ntfs_non_resident_sizes_inconsistent(vi, a))
> +			goto unm_err_out;
>  		vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
>  		ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
>  		ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
> @@ -1675,6 +1711,8 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
>  			"First extent of $INDEX_ALLOCATION attribute has non zero lowest_vcn.");
>  		goto unm_err_out;
>  	}
> +	if (ntfs_non_resident_sizes_inconsistent(vi, a))
> +		goto unm_err_out;
>  	vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
>  	ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
>  	ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
> diff --git a/fs/ntfs/layout.h b/fs/ntfs/layout.h
> index 8f5792139d719..2de83d4ca40b9 100644
> --- a/fs/ntfs/layout.h
> +++ b/fs/ntfs/layout.h
> @@ -811,14 +811,17 @@ enum {
>   *                                  on XP SP2+.
>   * @data.non_resident.reserved:     5 bytes for 8-byte alignment.
>   * @data.non_resident.allocated_size:
> - *                                  Allocated disk space in bytes.
> - *                                  For compressed: logical allocated size.
> + *                                  Allocated size in bytes, a multiple of
> + *                                  the cluster size.  For compressed and
> + *                                  sparse attributes holes count as
> + *                                  allocated; the clusters actually in use
> + *                                  are in compressed_size.
>   * @data.non_resident.data_size:    Logical attribute value size in bytes.
> - *                                  Can be larger than allocated_size if
> - *                                  compressed/sparse.
> + *                                  Never larger than allocated_size, also
> + *                                  when compressed/sparse.
>   * @data.non_resident.initialized_size:
>   *                                  Initialized portion size in bytes.
> - *                                  Usually equals data_size.
> + *                                  Usually equals data_size, never larger.
>   * @data.non_resident.compressed_size:
>   *                                  Compressed on-disk size in bytes.
>   *                                  Only present when compressed or sparse.
> -- 
> 2.55.0
> 

-- 
Thanks,
Hyunchul
