Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AF34BEE44
	for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465479; cv=none; b=Skq9V/LB6qVYs3DpXONXHrvOFvbgbGKUU8QjVPubY1HK5/8kmRI3OfSVrqRUF8gvwCegsQqyMxrc9jwdTf1tJnr+S36UWogMEg9FVN6EMF4ofTuQtmS0aygCD4SODgC2lWqDc94YFwEJX7uSRxQtMCWECmSk482VrDiWIdY32pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465479; c=relaxed/simple;
	bh=ZRUYkSO1sVmgPKy7vRmA2LLLgk4+SVyD2PaX3Z/T1Bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dlnNi4dardmZ2v7sphx/40O95tHPgEpVwKHH4Yb6BvIeLTG4wt2/Ppvk9ydb9MRTqchCCJm8YzHs2lXFv0j+15erpJP6kcs8b9/XfBouDbKf8Q3XmA/DogymFA0S1yZPgN1aYCqlrNr2YoQKr4NY1m+KuEn5O3MPNBOnky8gXUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=P0ino6T/; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="P0ino6T/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=z7EHtk758Zec5kMDtkiPwaeDIuKMOBgxIrGj+6BkGcg=;
	b=P0ino6T/W+U/bTAZ8DTJch2eKEDrS6tjdL4MzscWgg3Tl47QHBVbxQZClbe42z
	RBUNsEvIg3VGZEus6BHy7L8DfEK5HtaGl//6fOC38Pg89vQ/I/KsjRUy+hpAvHx0
	CPvFN/wxB3ykokZLfCm9OuQRAjqd0xOih0A78kUXufbsc=
Received: from [IPV6:2409:8900:21a7:a33a:233e:9c3e:6224:4649] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgAXu_92E6lqc6MPQQ--.17021S2;
	Tue, 15 Sep 2026 17:44:22 +0800 (CST)
Message-ID: <fd6194ed-a4c6-49ed-babf-28e4a8869d1f@163.com>
Date: Tue, 15 Sep 2026 17:44:22 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ntfs: fix directory lookup on large-page systems
To: =?UTF-8?Q?Marek_Weso=C5=82owski?= <marek@wesolowski.eu.org>,
 ntfs@lists.linux.dev
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
References: <81955f5b-ee97-4856-bb77-bffc739a8f5d@163.com>
 <20260915074722.27533-1-marek@wesolowski.eu.org>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260915074722.27533-1-marek@wesolowski.eu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgAXu_92E6lqc6MPQQ--.17021S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGrWktryxZF4kKr17Cr17Wrg_yoW5Kr4fpF
	sxuanakwsrt342grsFgF42qayxu34xCF47KrZ8Jw1fJw4fKwn7ur1Utw1rXry8tFZ8A34D
	X3WxWFWDua4UZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U038OUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwRfmsWqpE3fGTgAA3u



在 2026/9/15 15:47, Marek Wesołowski 写道:
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
> and propagate fixup failures before validating the block. Report fixup
> failures through ntfs_error() so the configured errors= policy is applied.
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
> Changes in v3:
> - Rebased onto the current kernel.org ntfs-next branch at 65829d51fa81.
> - Report MST fixup failures through ntfs_error() so the configured
>    errors= policy is applied.
> 
> Changes in v2:
> - Rebased onto the kernel.org ntfs-next branch.
> - Updated the Fixes tag as requested.
> 
>   fs/ntfs/dir.c | 9 ++++++++-
>   fs/ntfs/mst.c | 4 ++--
>   2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
> index 2d594cb..af2f648 100644
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
> @@ -352,6 +351,14 @@ fast_descend_into_child_node:
>   			   vcn, dir_ni->mft_no);
>   		goto unm_err_out;
>   	}
> +	err = post_read_mst_fixup((struct ntfs_record *)ia,
> +				  dir_ni->itype.index.block_size);
> +	if (err) {
> +		ntfs_error(sb,
> +			   "MST fixup failed for index block vcn %lld in directory inode 0x%llx.",
> +			   vcn, dir_ni->mft_no);
> +		goto unm_err_out;
> +	}
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
> 
> base-commit: 65829d51fa811ebcbf082c1e5d0cbecad2f9a836


Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

