Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F2A36921B
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 06:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972407; cv=none; b=ESb9ocxPY/mGFMzfh2KRgpJD1CoWg5mMreOeBFqj8C2Ud8eMU7KaGF2Fs2XkqRbunlPdd0aQyBnMQbWP73XRFupXyUZybk1T9y+Ghg5rIUnic6YfqiNOR5J7CXeFqqyjZhCSCK9K/56jac9s79qKwozxgndMqj/Wuynz4OyLVvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972407; c=relaxed/simple;
	bh=CczJ6dDlvjtvJ+eTTrJW/4EihpLzzZfyewxqfUmXk+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pmiS63764MmbLU703MRlAoL+oSIBDEA2xuUVhIt2Irl4DxzqmzXBuqx8URqWrqtPHDq92iPgQ/F/dx7jxbY/BZn04Au+kwp2OhFmkA2C2fXuFhYL5YKLkMots6lHz2OfTTMR4Dse1/pGKgzbRod6QPQyMDUXwjQ3pDO+Dg5N+EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pYowTaxe; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pYowTaxe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=60IhnEXvQL+RWjL4VJXZsChaMHwwa9jvvbBq3WAaVf4=;
	b=pYowTaxe/Ro3oQKqyk3hbfUiCC1XG0Xce6WHMx9RxzQZmn9zYDtMm684NgEht9
	0RusK/ZDIQmeMf6IaW9+4DSa2PpwSOMxfE425tg2Tct1EoSOVndaNc15/Z4NAdP7
	EUYgLfpj9apDm7tYhIEq8RtYCpcGqFCJ7ea/mQz72Tv/w=
Received: from [IPV6:2409:8900:1ee3:222c:3c21:ce3b:b986:2f34] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAXRkWcz7BqfAxIAg--.10354S2;
	Mon, 21 Sep 2026 14:33:02 +0800 (CST)
Message-ID: <e5b56c23-b18b-468b-b126-c4ad0adcbebf@163.com>
Date: Mon, 21 Sep 2026 14:33:00 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: fix FITRIM bitmap indexing for large pages
To: Hyunchul Lee <hyc.lee@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev, gunho@lge.com,
 =?UTF-8?Q?Marek_Weso=C5=82owski?= <marek@wesolowski.eu.org>
References: <20260921014116.2781001-1-hyc.lee@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260921014116.2781001-1-hyc.lee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgAXRkWcz7BqfAxIAg--.10354S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw1DXFWkZrWxtr1rtw13Jwb_yoW5Aw1xpr
	4ktr13Kr43J3sF9wn8KrnrWryfK3s3tr4UJay8Ja43WasxWrZ5Kr95tFn5Zw17C3yIgrWk
	J3Wj934Dur9xurDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U24iUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6h7hrGqwz541-wAA34



在 2026/9/21 09:41, Hyunchul Lee 写道:
> The LCN bitmap has one bit per cluster, so a bitmap page represents
> PAGE_SIZE * 8 clusters. ntfs_trim_fs() still used a 15-bit shift when
> selecting the page. On arm64 with 16 KiB pages this selects the wrong
> bitmap page and can test or discard the wrong clusters.
> 
> Compute bitmap indices from buf_clusters, use the page cluster base as
> the bit-search origin, and keep the requested range as the clipping
> boundary.
> 
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
> Cc: Marek Wesołowski <marek@wesolowski.eu.org>
> ---
>   fs/ntfs/bitmap.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/ntfs/bitmap.c b/fs/ntfs/bitmap.c
> index 1840b7d84c62..df97970dc3d0 100644
> --- a/fs/ntfs/bitmap.c
> +++ b/fs/ntfs/bitmap.c
> @@ -20,7 +20,7 @@ int ntfs_trim_fs(struct ntfs_volume *vol, struct fstrim_range *range)
>   	struct folio *folio;
>   	unsigned long *bitmap;
>   	char *kaddr;
> -	u64 end, trimmed = 0, start_buf, end_buf, end_cluster;
> +	u64 end, trimmed = 0, start_buf, end_buf, end_cluster, page_cluster;
>   	u64 start_cluster = ntfs_bytes_to_cluster(vol, range->start);
>   	u32 dq = bdev_discard_granularity(vol->sb->s_bdev);
>   	int ret = 0;
> @@ -45,8 +45,8 @@ int ntfs_trim_fs(struct ntfs_volume *vol, struct fstrim_range *range)
>   		return -ENOMEM;
>   
>   	buf_clusters = PAGE_SIZE * 8;
> -	start_index = start_cluster >> 15;
> -	end_index = (end_cluster + buf_clusters - 1) >> 15;
> +	start_index = start_cluster / buf_clusters;
> +	end_index = DIV_ROUND_UP_ULL(end_cluster, buf_clusters);
>   
>   	for (index = start_index; index < end_index; index++) {
>   		folio = ntfs_get_locked_folio(vol->lcnbmp_ino->i_mapping,
> @@ -59,19 +59,20 @@ int ntfs_trim_fs(struct ntfs_volume *vol, struct fstrim_range *range)
>   		kaddr = kmap_local_folio(folio, 0);
>   		bitmap = (unsigned long *)kaddr;
>   
> -		start_buf = max_t(u64, index * buf_clusters, start_cluster);
> -		end_buf = min_t(u64, (index + 1) * buf_clusters, end_cluster);
> +		page_cluster = (u64)index * buf_clusters;
> +		start_buf = max_t(u64, page_cluster, start_cluster);
> +		end_buf = min_t(u64, page_cluster + buf_clusters, end_cluster);
>   
>   		end = start_buf;
>   		while (end < end_buf) {
>   			u64 aligned_start, aligned_end, aligned_count;
> -			u64 start = find_next_zero_bit(bitmap, end_buf - start_buf,
> -					end - start_buf) + start_buf;
> +			u64 start = find_next_zero_bit(bitmap, end_buf - page_cluster,
> +					end - page_cluster) + page_cluster;
>   			if (start >= end_buf)
>   				break;
>   
> -			end = find_next_bit(bitmap, end_buf - start_buf,
> -					start - start_buf) + start_buf;
> +			end = find_next_bit(bitmap, end_buf - page_cluster,
> +					start - page_cluster) + page_cluster;
>   
>   			aligned_start = ALIGN(ntfs_cluster_to_bytes(vol, start), dq);
>   			aligned_end = ALIGN_DOWN(ntfs_cluster_to_bytes(vol, end), dq);

Hi Hyunchul,

   Looks good to me.
   Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

Thanks,
Baolin.



