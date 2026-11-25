Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615723;
	b=pWGq7onI0dZ468iD8wzTnAA1NNkVjvYLZ25bU2lrQQjNLsPXuMwPXTFD//t5WD1/r+gv
	 8i92O3d7LDx3L7DY8U+OyQj5sAgXAwvxf3F6tzY79t/YodaVH8krJkGm30EI0dfoXT38t
	 6xWyY6H5cA3UGrLftUQacUmCCIrCT/mf5bpbMWfAG3woYGA9j/eoQm/MWb9Mbx9103/uf
	 Y5lJAVsck+dLHneAQN8v9VgLKg1gbYj13Pc0IZR2h8aQhN9M1kegHAM3LmJ0FKgQdKgr+
	 fZZYtov/Vo8ppwZONs3qZwGcW60bcMYHMiircBaXy+V3bl7XrL//1wEy3pVFoGQYnfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615723;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=tuLumBpIMLso2Lr/rLv5zzqVpLJVjnzSowByv8Jlal8=;
	b=e04I3vc+Ma1EWnUf1ql7L9+VYXWjlnkHvlVLqRoXnHUwcGYVQLU4ib9Y3tWPE0xuZBTb
	 ybI8GUIh4Ad1IeroaeQ/P0sggd3DwwolLZWNJCsL1S0eR8mKCCRWutjF/+Ox0yD5eh2+F
	 lmjEjN3CRV/XaGEqbGLAJ7fhRe+W3J43mvyrVsfZh9yPa0TkmM7VhZkxzWzEiqeebFj4p
	 NCWtyG+TinQsRa/Mer8MXUHGRi0ViNhwe+tX3GSkaez1j/1e/nrHx5nM00lyydPhhNIeZ
	 We8Ba4IYWXw+8HEqOnBVhEcXkYVMQqc201VxihpKjOYkl85vremyHMI5uqO7WbyChVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=DwmmYAb3;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DAA60A261B
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 14:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7DAA60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=DwmmYAb3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=tuLumBpIMLso2Lr/rLv5zzqVpLJVjnzSowByv8Jlal8=;
	b=DwmmYAb39u7Ko5S7YMQtFtttqDFGWGBwpcyUBh8aAF1mpCdu5g1Nse65HgGkvz
	UuZr6xgzQC8DNrAspauV9h5Mvy1G8/C9+wFtpv3CEFyroqEDypdW4r+HKtC+hAnK
	YA+z/p2HOv0xGEquaz74VqUSTDwWhxvHB449TkXnRM25c=
Received: from [IPV6:2409:8900:1a90:8163:5fb3:f207:88ec:aa89] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDXX+bX6wZr0NDWJg--.10488S2;
	Wed, 25 Nov 2026 22:08:24 +0800 (CST)
Message-ID: <02126467-a189-4ed7-953a-3df80ab90754@163.com>
Date: Wed, 25 Nov 2026 22:08:23 +0800
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ntfs: serialize the mmap write fault initialized size
 update
To: Hongling Zeng <zenghongling@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, stable@vger.kernel.org
References: <20261125073547.154150-1-zenghongling@kylinos.cn>
 <20261125073547.154150-6-zenghongling@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261125073547.154150-6-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXX+bX6wZr0NDWJg--.10488S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFy8Aw47tF4fCFy5Gw18Grg_yoW5Xr18pr
	9F9FZxGr1UX342qws3K3yrXa4F9340kr47Wr1rCr13ArZYqwn2qF15Ka48urWxtrW2yF1v
	qF4q93yxC3ZxZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UgSdkUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RiNWGsG69jamQAA35



在 2026/11/25 15:35, Hongling Zeng 写道:
> The mmap write fault path checks whether the faulting range extends
> past ni->initialized_size with an unlocked read and then calls
> ntfs_attr_set_initialized_size(), which rewrites the field and the
> MFT record with its argument unconditionally. The call is made
> without the MFT record lock that every other caller of the function
> holds, and a buffered write or a second fault extending the
> initialized size between the read and the rewrite can make the
> rewrite shrink the field again, which exposes initialized data as
> uninitialized.
> 
> Hold the MFT record lock across the check and the update and read
> initialized_size under size_lock inside the critical section, so the
> decision is made on the value that is current for the record and the
> field can no longer regress through the fault path.
> 
> Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>   fs/ntfs/attrib.c |  1 +
>   fs/ntfs/iomap.c  | 15 +++++++++++----
>   2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index 081ce3e829f2..56df3049a386 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -2431,6 +2431,7 @@ int ntfs_attr_set(struct ntfs_inode *ni, s64 ofs, s64 cnt, const u8 val)
>   	return ret;
>   }
>   
> +/* The caller must hold the base inode's mft record lock. */
>   int ntfs_attr_set_initialized_size(struct ntfs_inode *ni, loff_t new_size)
>   {
>   	struct ntfs_attr_search_ctx *ctx;
> diff --git a/fs/ntfs/iomap.c b/fs/ntfs/iomap.c
> index afc4494822e1..39772e9e5f32 100644
> --- a/fs/ntfs/iomap.c
> +++ b/fs/ntfs/iomap.c
> @@ -676,10 +676,17 @@ static int ntfs_write_da_iomap_begin_non_resident(struct inode *inode,
>   			return err;
>   	}
>   
> -	if (ntfs_iomap_flags & NTFS_IOMAP_FLAGS_MKWRITE &&
> -	    iomap->offset + iomap->length > ni->initialized_size) {
> -		err = ntfs_attr_set_initialized_size(ni,
> -				iomap->offset + iomap->length);
> +	if (ntfs_iomap_flags & NTFS_IOMAP_FLAGS_MKWRITE) {
> +		loff_t initialized_size;
> +
> +		mutex_lock(&mrec_ni->mrec_lock);
> +		read_lock_irqsave(&ni->size_lock, irqflags);
> +		initialized_size = ni->initialized_size;
> +		read_unlock_irqrestore(&ni->size_lock, irqflags);
> +		if (iomap->offset + iomap->length > initialized_size)
> +			err = ntfs_attr_set_initialized_size(ni,
> +					iomap->offset + iomap->length);
> +		mutex_unlock(&mrec_ni->mrec_lock);
>   	}
>   
>   	return err;

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

