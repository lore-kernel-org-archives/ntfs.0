Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5AE416872
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 10:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380557; cv=none; b=DL+GCT2y+yRRZjwa9rYVgDQTHkdm6Aqc6jNWs03nkKXgG89dnEZ0RENUu2NELOFfYNubvS4Br2Z/SN890NEgE2zdzCCPMEMCFSzaVnj5TS1jH5kDmbFSmsVYGg2JnMN6nsXlhkwcX0D2iyncR5Y831JnPXhhKqKAIDq1gX270Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380557; c=relaxed/simple;
	bh=kW2fORwBJH98NTXn+xWAWGFgRIJFSDZQkhzEzx/oqnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LLngWHp25HEVqWCnUF7Au3GN45ndSPsUZVWABc94x6aQiTTeMP9iLVirlSO02Dn5uftmZXvc7uuL+fWJMDt/9cdp0jtCoUoI72yZj940KN55HazGuCc+WJdCMRhKlvOaTFYgwGGaQ5nk9ddNDsJdmcb0JC3zGAzhi2KeZKhmAaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cnixc5IW; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cnixc5IW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=tCy7flV655RBzI9X6QMlXQvmsOR0XmzsEALVyOAnTOg=;
	b=cnixc5IWzkmjQEmzXBaj7S+ZBFJwZE597mUEvPHUpU0boxa5Ub4hDhn/imbCqw
	jkSeanTYP/CgYeJTN1CiP7Z9xAmXxL3RLBsomI3UpH+qu6p8ahDtuxKpG1ZJkVM3
	m2Isfaxx3ggIGjH16CWxv5Ek+Bq1QCMxjyAr+XXYfWMQs=
Received: from [IPV6:2409:8900:1e93:14fb:a085:adb4:61d:add9] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCnFPO8x6dqkUBzQA--.63368S2;
	Mon, 14 Sep 2026 18:09:02 +0800 (CST)
Message-ID: <38b0d495-30bb-4eda-b535-7dd67df90f05@163.com>
Date: Mon, 14 Sep 2026 18:09:00 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: fix directory lookup on large-page systems
To: =?UTF-8?Q?Marek_Weso=C5=82owski?= <marek@wesolowski.eu.org>,
 ntfs@lists.linux.dev
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
References: <20260914080243.10704-1-marek@wesolowski.eu.org>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260914080243.10704-1-marek@wesolowski.eu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgCnFPO8x6dqkUBzQA--.63368S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGrWktryxZF4kKr17Cr17Wrg_yoW5tryxpF
	Zxua1S9wsxt3429rnrta1xZFyfu34ruFW7GrWkGw1Sy34fKwn7Wry8ta13Xr1UKFZ5ZrZ8
	X3W8JFZ5uw1UArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UjYLPUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6h6lcGqnx751JAAA3E



在 2026/9/14 16:02, Marek Wesołowski 写道:
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
> Fixes: d3ad708fecaa ("ntfs: Initial commit")
> Signed-off-by: Marek Wesołowski <marek@wesolowski.eu.org>
> ---
>   dir.c | 6 ++++--
>   mst.c | 4 ++--
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/dir.c b/dir.c
> index f22fea6..0e535a6 100644
> --- a/dir.c
> +++ b/dir.c
> @@ -338,7 +338,6 @@ descend_into_child_node:
>   	}
>   
>   	memcpy_from_folio(kaddr, folio, 0, PAGE_SIZE);
> -	post_read_mst_fixup((struct ntfs_record *)kaddr, PAGE_SIZE);
>   	folio_unlock(folio);
>   	folio_put(folio);
>   #else
> @@ -357,7 +356,6 @@ descend_into_child_node:
>   		goto unm_err_out;
>   	}
>   	memcpy(kaddr, (u8 *)page_address(page), PAGE_SIZE);
> -	post_read_mst_fixup((struct ntfs_record *)kaddr, PAGE_SIZE);
>   	unlock_page(page);
>   	kunmap(page);
>   	put_page(page);
> @@ -380,6 +378,10 @@ fast_descend_into_child_node:
>   			   vcn, dir_ni->mft_no);
>   		goto unm_err_out;
>   	}
> +	err = post_read_mst_fixup((struct ntfs_record *)ia,
> +			dir_ni->itype.index.block_size);
> +	if (err)
> +		goto unm_err_out;
>   	err = ntfs_index_block_inconsistent(vol, ia,
>   					    dir_ni->itype.index.block_size,
>   					    vcn, COLLATION_FILE_NAME,
> diff --git a/mst.c b/mst.c
> index 7f9faad..cc63634 100644
> --- a/mst.c
> +++ b/mst.c
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

Hi Marek,
    Thank you for submitting the patch.
    The fix itself looks reasonable, but this patch is based on the 
standalone https://github.com/namjaejeon/linux-ntfs repository rather 
than the current kernel.org ntfs-next branch.
    Please recreate the patch on top of the current kernel.org ntfs-next 
branch and update the Fixes: tag to:
Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")

Thanks,
Baolin.

