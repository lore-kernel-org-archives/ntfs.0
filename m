Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D361D432D
	for <ntfs@lists.linux.dev>; Tue,  8 Sep 2026 05:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846693; cv=none; b=fWDOA21ELDABm0c/axhYJS7E0o+GH5iL3otoZIob0aixqj4DO2FMnYv1e7efkJ/mMjJVKZQJVR780pU0rvYnL26qDYTlbcs2smcifS1eu+uNABuOacUAAFmjFW/aUNWqB7SE2oF5o7yAxhuVv0rbTqpuTMlOnNL4Q/vkqh1nNLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846693; c=relaxed/simple;
	bh=b/YpcU/SZTQ7suBXhAmovdv3YrQFr9IFtG/dZ+tV87c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K4X2IyeDeQH0MdIW8/rsebfHG0kp3rEaYmuFQiV4xCK5+AsDCLeoqk6RaQJ/0TlZp4S3Y9AegaSbe8yu+6UAT+0X91glt4z4PHIkuvKQpj8nd7EifxSNUKfdcv3ogFRF3DkvHjz/xIXFEJVzDUeTZPTnWEaNOtcZophwzJsJNSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=G71s5Ggz; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="G71s5Ggz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=d5CRftcM8cKZg4S+msRCJ3n7gXADB26qmvhpulgYttw=;
	b=G71s5GgzdokRvAkxK9i+m0IeOP4iaBsuTDvL3k2yyz0WQcspmpUNOplKID+6n4
	6+Mu2qvTp7PxoisXHq0yQl/s2+m3sRTdZDlRCEm8jmLdmk6v3m8Gt7yQ/kUIdvQS
	z2KFH9s/k9vO6jhU3x2flUY19DV1kiVkc/B/8ZBJBn3bI=
Received: from [IPV6:2409:8900:1e93:d74:46a:b98a:2b32:6a19] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDXXzRUop9qlvlgQg--.45536S2;
	Tue, 08 Sep 2026 13:51:18 +0800 (CST)
Message-ID: <5a81c4fa-807e-47ca-a143-6985036534a9@163.com>
Date: Tue, 8 Sep 2026 13:51:16 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ntfs: fix $MFTMirr write offset when it spans multiple
 folios
To: =?UTF-8?B?5pyxIOWkqea1qQ==?= <zhutianhao75@hotmail.com>,
 Hyunchul Lee <hyc.lee@gmail.com>
Cc: "linkinjeon@kernel.org" <linkinjeon@kernel.org>,
 "ntfs@lists.linux.dev" <ntfs@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <SY0P300MB031263862D7FD47834F1E87FDEB42@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
 <CANFS6baT-+_u+c99qThd7jekqXZ3BW5utLPERLa_X3FE7XiBNw@mail.gmail.com>
 <SY0P300MB0312DC95FDD1B45AF364267EDEB22@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <SY0P300MB0312DC95FDD1B45AF364267EDEB22@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDXXzRUop9qlvlgQg--.45536S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw1kKw4ruw13XF1kur17KFg_yoWrGw4xpF
	9xCwn3Ar4kKryIk39rKa109a4kX39rKF1UKrW7Jr1I9anIqw1kWF4Uta9Y9FyFyr1Ykrn7
	XF1kKrnxWF1DAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2zuZUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hZAC2qfolYKkQAA3t



在 2026/9/8 04:41, 朱 天浩 写道:
> When commit 115380f9a2f9 ("ntfs: update mft operations") refactored the
> MFT code to use folios, it assumed $MFTMirr is allocated contiguously,
> which is indeed what mkfs arranges.  However, the folio rewrite kept a
> leftover from the old buffer-head/runlist based implementation:
> vol->cluster_size_mask is still applied to the mirror write offset.
> In fact it is no longer needed -- and in some configurations it is
> actively wrong.
> 
> The bug triggers whenever the four mirror records do not fit in a
> single folio, i.e. when mft_record_size exceeds PAGE_SIZE / 4 (for
> example mft_record_size > 1KiB on 4KiB pages).
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
> v2:
> - Removed the unreachable folio-size guard (thanks Hyunchul for the review)
> - Dropped the "While here" paragraph from the commit message
> - Clarified the trigger condition and retitled the subject
> 
> fs/ntfs/mft.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 7e58c99f1728..8399f07d45d6 100644
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
> @@ -492,15 +492,11 @@ int ntfs_sync_mft_mirror(struct ntfs_volume *vol, const u64 mft_no,
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


Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

