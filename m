Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E30A242D88
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532692; cv=none; b=Qj8h2Uzu7DUpkcFU7vWbQKJxRtUOzZ/8yRlQjH3eDUoPtqoCmJd9bA9VoBAGmSIbJd8yVLtgKwGzuy4pThni/QRalixLXQtx7Xr9JZDAp5xWkd7hbONekCv1QF52ct6n07buGo2cwr/TbgZwHIf+xe72nd3R1a0O3HqV3l7do9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532692; c=relaxed/simple;
	bh=cIQm5B34mYIZi1ft8Tru7QN0mZUaF935R3j1c/f5EaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PM0w/qlz2Qe3GsV1M/0AIS741lGtkNEZIfaLtAh7Dejjfa5Jyxb6BUs3wP6oQcFEPG7d+jCTgQkYZg1YZ0AjXU+jr5gzG6MUgbnGwzl5wM0Eyp3VjJsjPcvyPO0ZAhW/+xVpUMKH5HUt3aZtmZyxFj2axckoFAqd1Z/XJcoI0TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IvMHKis4; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IvMHKis4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=o64powhMT+ok2bugfNluu2BHFIGMb2xNerw6EGpozFI=;
	b=IvMHKis4jrMy6P/LoD+g51uKLxXLkg1PSOC/1uhy5mD0waqjxTBphB1GqnVhxN
	5G4d4uX5t+pZeVpzEqTXUt46zye9QeRsDL5Afa627K0ZAP6T4x4YZ44vzIWHcPwA
	zuVsgVjgBJOuzMx12o+RS3inoBoE+1BmIPN9AFsOF5eLA=
Received: from [IPV6:2409:8949:6ca0:7910:556a:2884:1c35:3923] (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3v_ZEXLlqGIq_BA--.45690S2;
	Mon, 28 Sep 2026 02:11:17 +0800 (CST)
Message-ID: <e3c533d3-6f76-4fd4-bbeb-932f81b39920@163.com>
Date: Mon, 28 Sep 2026 02:11:16 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ntfs: set the attribute list size before reserving
 space for it
To: Matthias Goergens <matthias.goergens@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1790503811.git.matthias.goergens@gmail.com>
 <a3db61194cd4c2a472963aa6d9e9563ceb8efd33.1790503811.git.matthias.goergens@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <a3db61194cd4c2a472963aa6d9e9563ceb8efd33.1790503811.git.matthias.goergens@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v_ZEXLlqGIq_BA--.45690S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFy3tFWDtFykJr1fZF47Arb_yoW5XF48pr
	9xCrnrtwsIyw17GrsrK3W8Ga40grWxGr12vryvk3yUAw4qyw4SgryfKrZagayftFZ5Zw4D
	Zr4DGrWxArZ8ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uc2-OUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwgUx+2q5XEXd6gAA3w



在 2026/9/27 18:57, Matthias Goergens 写道:
> ntfs_attrlist_update_locked() resizes the attribute list and then, for
> $MFT, tries to reserve the maximum list size.  When that allocation
> fails with -ENOSPC it falls back to ntfs_attrlist_repack(), which reads
> the list through ntfs_inode_attr_pread().  The read stops at i_size,
> but i_size is only updated after the reserve, so when the list has just
> grown the repack gets a short read and returns -EIO.  Only -ENOSPC from
> the reserve is ignored, so the -EIO fails the $MFT extension and with
> it the file creation that needed a new mft record.
> 
> On a 32 MiB volume with 512-byte clusters whose $MFT has a non-resident
> attribute list, 591 of 1500 creations of empty files succeed and the
> rest fail with EIO while 742 KiB is still free:
> 
>    ntfs: (device vda): ntfs_attrlist_update_locked(): Failed to reserve attribute list space
>    ntfs: Failed add attr entry to attrlist
>    ntfs: MP update failed
>    ntfs: (device vda): ntfs_mft_record_alloc(): Failed to extend mft data allocation.
> 
> Update i_size as soon as the list has been resized.  File creation then
> goes on until the volume is full and fails with ENOSPC.
> 
> Fixes: b1d732e62a5b ("ntfs: repack $MFT/$ATTRIBUTE LIST")
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
> The volume is frag.img from
> https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-26-ntfs-mft-runlist
> (mft-bootstrap/frag.img.xz); creating empty files on it until one fails
> is enough.  Tested with KASAN and lockdep: after the patch the files
> written before the volume filled read back intact after a remount, and
> ntfsfix and ntfsresize --info find nothing wrong with the image.
> ---
>   fs/ntfs/attrlist.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
> index 1bbd2bc62c582..62dfb96e31a3c 100644
> --- a/fs/ntfs/attrlist.c
> +++ b/fs/ntfs/attrlist.c
> @@ -252,6 +252,9 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
>   		return err;
>   	}
>   
> +	/* ntfs_attrlist_repack() below reads the list up to i_size. */
> +	i_size_write(attr_vi, base_ni->attr_list_size);
> +
>   	/*
>   	 * Reserve the maximum legal list size while the MFT metadata area is
>   	 * still easy to allocate contiguously. This prevents a later list entry
> @@ -279,8 +282,6 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
>   		}
>   	}
>   
> -	i_size_write(attr_vi, base_ni->attr_list_size);
> -
>   	if (NInoNonResident(attr_ni) && !NInoAttrListNonResident(base_ni))
>   		NInoSetAttrListNonResident(base_ni);
>   

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

