Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C072D46A1
	for <ntfs@lists.linux.dev>; Fri,  4 Sep 2026 01:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788485582; cv=none; b=R2C+y0kWovHXmyBiL7kL205v2HQjgFtBqm9wFqDLbI/jHXui+C0IOIaJ+bpxXuHE3K9drrnnbXxrWILU2g9y+m9EAVkQFnT0/cDNMCmRhBASz1sI98FIWlrLGY2TdH9EndesCiC6uv6kPZ4sg7Myjwqnl27XNduA9xmruUQ1iII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788485582; c=relaxed/simple;
	bh=QMGDN7UWqvyzj4uYWIrOiDAcu8Any7ncs7JdxASNOg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLZvOo5F5kkUdLe7fWBN5D4t0LT/yd9d4KxgHbhIMcSyAvj2B6nl1yIOAXBZrt85abSRuuHw6CgnG7g3iTIlNVWmZg30hl3WERA4Dd4aTr9y/uiNebgKTZ+wMJVOjoqOn88ivjfjeHTGwGX9dxR3y8iU5fTYKnZEBb9cOELhnbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=K4U7AraB; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="K4U7AraB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=2yZtti8UnCE2Bw/Nr6RulJp+hgYwmiGN9/iQf2NRUWg=;
	b=K4U7AraBzmHAYMt3lQQ0L468GOLLqdnm7Bq/B1ie8qxoab6Ucz5PM+TNtuyGyq
	7qrDtkh+uD7nLF48OLbP8dUtx6qxkR8G/YI/go7FoLCiJtwClo47sytq/q+Frte1
	GTttLuP02m4fNZ8NwbKnMCzmP4dS2mEhbUDGoUL1sbMGA=
Received: from [IPV6:2409:8900:1a96:d5f:519a:bd19:ff78:1325] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCnpgW6H5pqVXVIQw--.44861S2;
	Fri, 04 Sep 2026 09:32:44 +0800 (CST)
Message-ID: <1995795b-e410-46fa-b49e-5373233f4ac7@163.com>
Date: Fri, 4 Sep 2026 09:32:42 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: fix sector conversion on 4Kn devices
To: =?UTF-8?B?5pyxIOWkqea1qQ==?= <zhutianhao75@hotmail.com>,
 "linkinjeon@kernel.org" <linkinjeon@kernel.org>,
 "hyc.lee@gmail.com" <hyc.lee@gmail.com>
Cc: "ntfs@lists.linux.dev" <ntfs@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <SY0P300MB0312121B2DA3A618B0632D3BDEB62@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <SY0P300MB0312121B2DA3A618B0632D3BDEB62@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgCnpgW6H5pqVXVIQw--.44861S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFWUAr43Gry5ur47AF1kKrg_yoW5urW5pF
	sIyF1SyF4DGF17t3ZI9a129F1F934xK3WUGrW7Ww17urs7Krn7tF1kKryYg3WktrWftrn7
	Xa1DJrW3CryDXrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2zuZUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhw4A2qaH7x4hgAA3I



在 2026/9/3 20:44, 朱 天浩 写道:
> The NTFS driver was converting byte offsets to bio sector numbers using
> the filesystem block size (sb->s_blocksize_bits).  However, block layer
> sector numbers - bio->bi_iter.bi_sector and sector_t - are always in
> units of 512 bytes, independent of the filesystem block size.
> 
> On a device with a 4096 byte logical block size (4Kn), sb_min_blocksize()
> lifts s_blocksize to 4096, so every MFT writeback bio built by
> ntfs_sync_mft_mirror(), write_mft_record_nolock() and
> ntfs_mft_writepages() ended up with a sector number eight times too
> small.  The resulting LBA is not only wrong, it is usually not a
> multiple of the logical block size either, and some controllers reject
> the write outright, e.g.:
> 
>    ntfs: (device nvme0n1p3): ntfs_sync_mft_mirror(): I/O error while
>    writing mft mirror record 0x3!
>    ntfs: (device nvme0n1p3): write_mft_record_nolock(): I/O error while
>    writing mft record 0x3!  Marking base inode as bad.
> 
> Reproduced on an Apple SSD AP0256J (4Kn) with a volume using 4096 byte
> sectors, 4096 byte clusters and clusters_per_mft_record = 1; after the
> fix a 13 MB file written to the volume is byte-for-byte identical
> after a umount/mount cycle.
> 
> Fixes: 40796051991d ("ntfs: update in-memory, on-disk structures and headers")
> Signed-off-by: Zhu Tianhao <zhutianhao75@hotmail.com>
> ---
>   fs/ntfs/ntfs.h | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs/ntfs.h b/fs/ntfs/ntfs.h
> index df5a75d506f6..b66ce62f67c9 100644
> --- a/fs/ntfs/ntfs.h
> +++ b/fs/ntfs/ntfs.h
> @@ -20,6 +20,7 @@
>   #include <linux/smp.h>
>   #include <linux/pagemap.h>
>   #include <linux/uidgid.h>
> +#include <linux/blkdev.h>      /* For SECTOR_SHIFT. */
>   
>   #include "volume.h"
>   #include "layout.h"
> @@ -71,7 +72,11 @@
>   #define NTFS_CLU_TO_POFS(vol, clu) (((u64)(clu) << (vol)->cluster_size_bits) & \
>   				    ~PAGE_MASK)
>   
> -#define NTFS_B_TO_SECTOR(vol, b) ((b) >> ((vol)->sb)->s_blocksize_bits)
> +/*
> + * bio->bi_iter.bi_sector and sector_t are always in 512-byte sectors, even
> + * when the filesystem block size is larger (for example 4KiB).
> + */
> +#define NTFS_B_TO_SECTOR(vol, b) ntfs_bytes_to_sector(vol, b)
>   
>   enum {
>   	NTFS_BLOCK_SIZE		= 512,
> @@ -154,11 +159,15 @@ static inline u64 ntfs_cluster_to_poff(const struct ntfs_volume *vol,
>   	return (clu << vol->cluster_size_bits) & ~PAGE_MASK;
>   }
>   
> -/* Convert byte offset to sector (block) number. */
> +/* Convert byte offset to a block layer sector number.  Those are always in
> + * units of 512 bytes, never in units of sb->s_blocksize, which is raised to
> + * the device logical block size on 4Kn devices.
> + */
>   static inline sector_t ntfs_bytes_to_sector(const struct ntfs_volume *vol,
>   		u64 bytes)
>   {
> -	return bytes >> vol->sb->s_blocksize_bits;
> +	(void)vol;
> +	return bytes >> SECTOR_SHIFT;
>   }
>   
>   /* Global variables. */

Hi Tianhao,
    Thank you for submitting this patch.
    This issue has already been fixed by commit 6faa235a649e ("ntfs: 
compute bi_sector in 512-byte units"), which is included in the current 
ntfs-next branch. The existing fix covers the same MFT write paths, so 
this patch does not need to be applied again.
    Thank you for your work.

Thanks,
Baolin.

