Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DDF27F72C
	for <ntfs@lists.linux.dev>; Sat,  5 Sep 2026 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788617343; cv=none; b=PUMeSv2vYAQPU1MlZGXKRBXAgsqWf5xhqeNXvGTpzriNe7Bt7Lvclyb2QAnoWx+3Vj+HHxn9LotvjuLn68D+L5W4TlskBW14S5zpSYJWTTchxgXja6SZPnCow8XYR4KxFa/udVCoOCppyj6dCQLPscV6uoD1USsnWufiqfzi8lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788617343; c=relaxed/simple;
	bh=XFkaaKEWY64wtPrc5AzlfuAzqKxMuoThga6wWScNrjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uWj6DxL8UQYWVUaqYhY4VTC0JcrrcrCDIEsWBYk1aDL1JqzSuiB0/yuyZfgTVAh4GcEKLz2rWKl+i9bH4SL0SJHjGRrRzmQVMA+gtFhiW2zXo7iPFI0VCs6mv3uFNoHLYoVifFkawFK/RFT1yQtcBAd524CFAWvkxbkHl2fnlKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=basIqN/9; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="basIqN/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=SPojwjLkaMA11kPJdNiZJMswWTdi4XubYxdhDNobZx8=;
	b=basIqN/98SNEhXlYaqmMWAGO7yRqPkJnb+Nu+hFAuIm6gSpwiTA1Kj5t+0Vqah
	ibNHPXeQMRNqPTPN9OgB0TjaFsf/sLzn6O78FyizZ+BpsRwVYS3i3BaXK1xR9yRh
	ooKwQ6OTKJdP3deS+eyyMubRlD3YjjY1OqvjBt52Ymg8g=
Received: from [IPV6:2409:8907:9f4b:3fe:b252:b6b3:7eed:98b6] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3n41sIpxqpVCYAw--.59650S2;
	Sat, 05 Sep 2026 22:08:45 +0800 (CST)
Message-ID: <39a9c42b-7e47-4d3b-b3c2-6eb05af41ce0@163.com>
Date: Sat, 5 Sep 2026 22:08:44 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: fix $MFTMirr write offset for MFT record sizes
 larger than PAGE_SIZE
To: =?UTF-8?B?5pyxIOWkqea1qQ==?= <zhutianhao75@hotmail.com>,
 "linkinjeon@kernel.org" <linkinjeon@kernel.org>,
 "hyc.lee@gmail.com" <hyc.lee@gmail.com>
Cc: "ntfs@lists.linux.dev" <ntfs@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <SY0P300MB031263862D7FD47834F1E87FDEB42@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <SY0P300MB031263862D7FD47834F1E87FDEB42@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n41sIpxqpVCYAw--.59650S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF15tw48Xw4UZFy5Jr1DWrg_yoW7Jw1kpF
	9xK3s3Jr4ktr9rC39Fga1Iga48X393JFyUWFW7Gr1xCFsYq34kWF4Ut3yruFyFyr4Yywn7
	X3WkGrnxWFyDAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2zuZUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6g1lMGqcIm2jbwAA3H



在 2026/9/5 20:35, 朱 天浩 写道:
> When commit 115380f9a2f9 ("ntfs: update mft operations") refactored the
> MFT code to use folios, it assumed $MFTMirr is allocated contiguously,
> which is indeed what mkfs arranges.  However, the folio rewrite kept a
> leftover from the old buffer-head/runlist based implementation:
> vol->cluster_size_mask is still applied to the mirror write offset.
> In fact it is no longer needed -- and in some configurations it is
> actively wrong.
> 
> For example, on the built-in 4Kn SSD (Apple SSD AP0256J) of a
> MacBookPro14,1 with 4096-byte MFT records, mirror record 3 is still
> written to the location of record 0.  $MFTMirr therefore gets out of
> sync with $MFT and the following warning is printed on remount:
> 
> 	ntfs: (device nvme0n1p3): check_mft_mirror(): $MFT and $MFTMirr
> 	      record 0 do not match.  Run chkdsk.
> 
> Fix it by always adding the folio offset (folio->index << PAGE_SHIFT)
> to the base LCN address instead of applying the cluster_size_mask
> truncation.  This is the standard file-offset calculation and is
> correct for every combination of cluster size, page size and MFT
> record size, provided $MFTMirr data is contiguous from mftmirr_lcn
> (which mkfs always arranges).
> 
> While here, verify that the folio returned by read_mapping_folio() is
> large enough to hold the whole mirror record (folio_ofs +
> mft_record_size <= folio_size(folio)), guarding against records that
> straddle a folio boundary when mft_record_size exceeds PAGE_SIZE,
> although this cannot happen in practice.
> 
> Tested on the volume above: before the change mirror records 1-3 are
> all written to record 0's sector; after the change the write-back
> probe reports:
> 
> 	ntfs: NTFSDBG pre mft_no=0x3 folio_idx=0x3 ofs=0x0 mftmirr_lcn=0x2540c5 clu_bits=12 rec_bits=12 PAGE_SHIFT=12 sect=0x12a0640
> 	ntfs: NTFSDBG pre mft_no=0x0 folio_idx=0x0 ofs=0x0 mftmirr_lcn=0x2540c5 clu_bits=12 rec_bits=12 PAGE_SHIFT=12 sect=0x12a0628
> 
> which matches the expected sectors computed as:
> 
> 	(NTFS_CLU_TO_B(mftmirr_lcn) + (folio->index << PAGE_SHIFT)) >> SECTOR_SHIFT
> 
> 	record 0: (0x2540c5 << 12) + 0x0000 = 0x2540c5000 >> 9 = 0x12a0628
> 	record 3: (0x2540c5 << 12) + 0x3000 = 0x2540c8000 >> 9 = 0x12a0640
> 
> A 13 MB file write succeeds on this volume and the file is byte-for-byte
> identical after a umount/mount cycle.
> 
> Fixes: 115380f9a2f9 ("ntfs: update mft operations")
> Assisted-by: UOS-AI
> Assisted-by: CodeBuddy:Hy4 preview
> Signed-off-by: Zhu Tianhao <zhutianhao75@hotmail.com>
> ---
>   fs/ntfs/mft.c | 26 ++++++++++++++++----------
>   1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 7e58c99f1728..a62b1d41697c 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -462,7 +462,7 @@ int ntfs_sync_mft_mirror(struct ntfs_volume *vol, const u64 mft_no,
>   {
>   	u8 *kmirr;
>   	struct folio *folio;
> -	unsigned int folio_ofs, lcn_folio_off = 0;
> +	unsigned int folio_ofs;
>   	int err = 0;
>   	struct bio *bio;
>   
> @@ -482,25 +482,31 @@ int ntfs_sync_mft_mirror(struct ntfs_volume *vol, const u64 mft_no,
>   		goto err_out;
>   	}
>   
> +	/* Offset of the mft mirror record inside the folio. */
> +	folio_ofs = NTFS_MFT_NR_TO_POFS(vol, mft_no);
> +
> +	/* The mirror record must fit entirely within this folio. */
> +	if (folio_ofs + vol->mft_record_size > folio_size(folio)) {
> +		ntfs_error(vol->sb, "Mft mirror record 0x%llx does not fit in folio.",
> +			   mft_no);
> +		folio_put(folio);
> +		err = -EIO;
> +		goto err_out;
> +	}
> +
>   	folio_lock(folio);
>   	folio_clear_uptodate(folio);
> -	/* Offset of the mft mirror record inside the page. */
> -	folio_ofs = NTFS_MFT_NR_TO_POFS(vol, mft_no);
> -	/* The address in the page of the mirror copy of the mft record @m. */
> +	/* The address in the folio of the mirror copy of the mft record @m. */
>   	kmirr = kmap_local_folio(folio, 0) + folio_ofs;
>   	/* Copy the mst protected mft record to the mirror. */
>   	memcpy(kmirr, m, vol->mft_record_size);
>   	kunmap_local(kmirr);
>   
> -	if (vol->cluster_size_bits > PAGE_SHIFT) {
> -		lcn_folio_off = folio->index << PAGE_SHIFT;
> -		lcn_folio_off &= vol->cluster_size_mask;
> -	}
> -
>   	bio = bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRITE, GFP_NOIO);
>   	bio->bi_iter.bi_sector =
>   		ntfs_bytes_to_bio_sector(NTFS_CLU_TO_B(vol, vol->mftmirr_lcn) +
> -					 lcn_folio_off + folio_ofs);
> +					 ((u64)folio->index << PAGE_SHIFT) +
> +					 folio_ofs);
>   
>   	if (bio_add_folio(bio, folio, vol->mft_record_size, folio_ofs))
>   		err = submit_bio_wait(bio);

Hi Tianhao,
   Thanks for submitting this patch.
   You identified a real issue where the write offset for $MFTMirr 
records can be calculated incorrectly on some configurations, which may 
leave $MFTMirr inconsistent with $MFT.

   I have reviewed the patch carefully, and I believe the proposed fix 
is  effective.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

Thanks,
Baolin.

