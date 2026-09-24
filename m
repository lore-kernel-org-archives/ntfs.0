Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076163CFF77
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 02:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790216826; cv=none; b=J0BRfK0PctNDTby3QSCD8QYq+dDtvzWKVUxEaGSrpIy19cGG7on2QTHD4oJTQ07GDmBtTu7eJ5CYkdRbKn1tMNum+WQ2zmBWF65KrrIRUDYwn7dr7oThqI3+Q3/ZBK1grWZt26MHxbLwv5tFeOdxA6Vcgrpv1pgOkEHqUsZ0/bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790216826; c=relaxed/simple;
	bh=jghUrPhO0/eKHEsDwAOn23sfmynn5HkbDMwfkI4rZL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WxioWdoZuli6mz3h+UaweeL1BqrUxfgtN833IalAj1w8hdMn4csMdAfGWizTH5Kb6CKUumi7EgOUv4qvs88QXR6aP3J8PBAJqJAtRkJnluOj9eN2uGslCO4cdCiW/gw8Nl0jkazOybBRR1B/C5peflyg+t4lPrSpmbN2vu6IvIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pdA3Yg/X; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pdA3Yg/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=kj4UYJOSYvHDeh2Q35xJ8AqHB1NDHgMUkTPqHJ9dGBc=;
	b=pdA3Yg/XOWYZzcg4G3hZSaI6I8FSKQHPi3uOc2wkJyF3Pk1GxJijcSX1C2w1eL
	T74sa5+/PVpHypm0EZpw5NV2A6m6XFMbbwNHnFHsvYXuS3HHB9YrRQ2EePYKhrnO
	9ars+snSLL3nb3jqBS3ws7FT7ZRo9oGt2gX78d5i8+MsI=
Received: from [IPV6:2409:8900:1eb0:45e:3c13:fdf5:6f81:b37a] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3V21tirRqv7zMAQ--.1437S2;
	Thu, 24 Sep 2026 10:26:54 +0800 (CST)
Message-ID: <4fcb44c4-2008-4c07-b32a-b8a3e324a7ac@163.com>
Date: Thu, 24 Sep 2026 10:26:53 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] ntfs: account for direct MFT bitmap cluster
 allocation
To: Xuewen Wang <wangxuewen@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260924014514.1678828-1-wangxuewen@kylinos.cn>
 <20260924014514.1678828-5-wangxuewen@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260924014514.1678828-5-wangxuewen@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3V21tirRqv7zMAQ--.1437S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFW8Ww1fWr45Wr1rGry8Krg_yoW8CFWfpr
	Zxtrn2ka1DAr42gwnI9w1DJ3W0g3saga1UKF4Sgr1fXFs3t3WvgwnIk3W8Xw18trWrJF1v
	vF15Wa43u3W5Z3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR-zV5UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwg6FUGq0im4XdQAA3B



在 2026/9/24 09:45, Xuewen Wang 写道:
> The MFT bitmap extension fast path sets $Bitmap directly, bypassing
> ntfs_cluster_alloc() and its free_clusters and lcn_empty_bits_per_page
> updates. Successful extensions overreport free space, and rollback adds
> back counts that were never deducted.
> 
> Update both counts under lcnbmp_lock and the bitmap folio lock. Require
> a nonzero page count and space remaining after delayed-allocation
> reservations; otherwise use the regular allocator. The page check also
> prevents underflow when the initial scan recorded zero after a read error.
> 
> Fixes: 6251f0b0de7d ("ntfs: update super block operations")
> Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> ---
>   fs/ntfs/mft.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 489a5935202c..e01e367a588d 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -1404,10 +1404,18 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
>   	folio_lock(folio);
>   	b = (u8 *)kmap_local_folio(folio, 0) + (ll & ~PAGE_MASK);
>   	tb = 1 << (lcn & 7ull);
> -	if (*b != 0xff && !(*b & tb)) {
> +	/*
> +	 * A page skipped by the initial scan has no free bits recorded.
> +	 * Honor that and the space reserved for delayed allocation.
> +	 */
> +	if (*b != 0xff && !(*b & tb) &&
> +	    vol->lcn_empty_bits_per_page[ll >> PAGE_SHIFT] &&
> +	    ntfs_available_clusters_count(vol, 1) > 0) {
>   		/* Next cluster is free, allocate it. */
>   		*b |= tb;
>   		folio_mark_dirty(folio);
> +		ntfs_dec_free_clusters(vol, 1);
> +		ntfs_set_lcn_empty_bits(vol, ll >> PAGE_SHIFT, 1, 1);
>   		folio_unlock(folio);
>   		kunmap_local(b);
>   		folio_put(folio);

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

