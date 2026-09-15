Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE083D410D
	for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 05:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789451059; cv=none; b=EDYOETbgKPr4Ic4c8CWZYHS2SgLNdglcsoGLcSeEPpryOAJpp5pMOS7lU69N+D9jiktGmu+kub7gp2JOUSgW9HYF6n3CUtFo+KdJzJfbHYBuGunXCepzIKa4YpgZ1YvoYRe5rvCkwbYEsTkXVFSpg5e6bijBiZgQt0adKNV3jDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789451059; c=relaxed/simple;
	bh=mdnZgjVLc47RGVBNoUCQ11nP5X7QFV/p8dW6M/sCD4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EoGFOF8PBelRsNi1bzzxWkFY7ijdkzWJe36OjAp+3Sz4/z8gMjC3Qj3R8SeS6Wp8lGUCStylYTp0+FdwHIrSXt4ty8+ilHiDAQ1X4EPeQoAP1rQGpwAb+bVGAHgir8AHlF0vHGdbojvoYDbjexrSYVwJQVaT9SOGR3Ao6/CvfN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SEPPH0xj; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SEPPH0xj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=p45A4mfROotzulMMY94fCu+p+UqfqHAK5pOZb4aHKR8=;
	b=SEPPH0xj5ZQ8UJy3qIfBOI294mzrk2oEf9uDC+DZmPfxbkg5Dfwh4o0pEN0eBd
	PoOPsk6DDy9P0OxNNo5OzmivdZ6WA9uW8qfl+mpfsWfRtr9Cb0XwgKl9dj/BtM8i
	Q2iX925UE3THc05pjzFUK5QvzMPPWcCkUayt0yEirZ+v4=
Received: from [IPV6:2409:8900:1e93:14fb:93e6:4816:3b13:f1ac] (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3l70b26hqpRb0Ag--.39268S2;
	Tue, 15 Sep 2026 13:43:57 +0800 (CST)
Message-ID: <81955f5b-ee97-4856-bb77-bffc739a8f5d@163.com>
Date: Tue, 15 Sep 2026 13:43:55 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ntfs: fix directory lookup on large-page systems
To: =?UTF-8?Q?Marek_Weso=C5=82owski?= <marek@wesolowski.eu.org>,
 ntfs@lists.linux.dev
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
References: <38b0d495-30bb-4eda-b535-7dd67df90f05@163.com>
 <20260914105304.16086-1-marek@wesolowski.eu.org>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260914105304.16086-1-marek@wesolowski.eu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3l70b26hqpRb0Ag--.39268S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGrWktryxZF4kKr17Cr17Wrg_yoWrGw1kpr
	ZxuFsakwsrKry2vrs7K3ZrtFy8C34fCF47KryrJw1ay3ySkwn7ur4Ut3WrXry8KFZ8Aw1D
	X3W8WFZ8ua4UZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uj4EiUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwh3CjWqo2x1iWAAA3u



在 2026/9/14 18:53, Marek Wesołowski 写道:
> ntfs_lookup_inode_by_name() copies PAGE_SIZE bytes from the index
> allocation mapping and applies MST fixups to that entire buffer before
> selecting the requested INDX block.
> 
> When PAGE_SIZE is larger than the NTFS index block size, the USA count
> belongs to the smaller INDX block. post_read_mst_fixup() therefore treats
> the PAGE_SIZE call as not applicable and leaves the update sequence words
> in place. A directory entry crossing a sector boundary can then be returned
> by readdir but missed by lookup.
> 
> Select the INDX block first, apply the fixup using its actual block size,
> and propagate fixup failures before validating the block.
> 
> Return -EIO when post_read_mst_fixup() detects an incomplete multi sector
> transfer, since this indicates an on-disk metadata integrity error.
> 
> Reproduced on arm64 with 16 KiB pages and 4 KiB NTFS index blocks. The
> affected entry was visible in readdir but stat returned ENOENT. Both exact
> and case-insensitive lookup succeed after this change.
> 
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Signed-off-by: Marek Wesołowski <marek@wesolowski.eu.org>
> ---
> Changes in v2:
> - Rebased onto the current kernel.org ntfs-next branch at 8809c3f29555.
> - Updated the Fixes tag as requested.
> 
>   fs/ntfs/dir.c | 5 ++++-
>   fs/ntfs/mst.c | 4 ++--
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
> index 2d594cb..caf640d 100644
> --- a/fs/ntfs/dir.c
> +++ b/fs/ntfs/dir.c
> @@ -331,7 +331,6 @@ descend_into_child_node:
>   	}
>   
>   	memcpy_from_folio(kaddr, folio, 0, PAGE_SIZE);
> -	post_read_mst_fixup((struct ntfs_record *)kaddr, PAGE_SIZE);
>   	folio_unlock(folio);
>   	folio_put(folio);
>   fast_descend_into_child_node:
> @@ -352,6 +351,10 @@ fast_descend_into_child_node:
>   			   vcn, dir_ni->mft_no);
>   		goto unm_err_out;
>   	}
> +	err = post_read_mst_fixup((struct ntfs_record *)ia,
> +				  dir_ni->itype.index.block_size);
> +	if (err)
> +		goto unm_err_out;

Hi Marek,
    Thank you for providing this patch. I have a suggestion for this patch.
    post_read_mst_fixup() only logs the failure through 
pr_err_ratelimited(); it does not invoke the configured errors= policy.

   Previously, when it detected an incomplete multi-sector transfer, it 
changed the record magic to BAAD. Its return value was ignored, so the 
following ntfs_index_block_inconsistent() call detected BAAD and called
  ntfs_error(), which applied the configured errors= policy.

   The early exit here skips that ntfs_error() path.
   Could we call ntfs_error() here before jumping to the cleanup path?
   For example:
   	if (err) {
   		ntfs_error(sb,
   			   "MST fixup failed for index block vcn %lld in directory inode 
0x%llx.",
   			   vcn, dir_ni->mft_no);
   		goto unm_err_out;
   	}

Thanks,
Baolin.

>   	err = ntfs_index_block_inconsistent(vol, ia,
>   					    dir_ni->itype.index.block_size,
>   					    vcn, COLLATION_FILE_NAME,
> diff --git a/fs/ntfs/mst.c b/fs/ntfs/mst.c
> index 7f9faad..cc63634 100644
> --- a/fs/ntfs/mst.c
> +++ b/fs/ntfs/mst.c
> @@ -19,7 +19,7 @@
>    * magic of the ntfs record header being processed with "BAAD" (in memory only!)
>    * and abort processing.
>    *
> - * Return 0 on success and -EINVAL on error ("BAAD" magic will be present).
> + * Return 0 on success and -EIO on error ("BAAD" magic will be present).
>    *
>    * NOTE: We consider the absence / invalidity of an update sequence array to
>    * mean that the structure is not protected at all and hence doesn't need to
> @@ -71,7 +71,7 @@ int post_read_mst_fixup(struct ntfs_record *b, const u32 size)
>   			 * Note that magic_BAAD is already converted to le32.
>   			 */
>   			b->magic = magic_BAAD;
> -			return -EINVAL;
> +			return -EIO;
>   		}
>   		data_pos += NTFS_BLOCK_SIZE / sizeof(u16);
>   	}
> base-commit: 8809c3f29555f9d1e66fe015080a8d4979d91eaa

