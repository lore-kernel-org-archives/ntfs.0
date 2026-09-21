Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECD037649B
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 06:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973084; cv=none; b=JJ45bP0/jMySMTY8RNHb3iX1w4NLvQzJX7HqGasqwvYLiugBpsUFuE67H+YbBXNw5PKK9lRVpWTbgaz/c6WVW4bUsNoFQFgW9r33HS136KhTM91Af1blwo1FZDmJEz7XawG1L9l4POVIoIHy9fOyn9noIGQmVA5aoIc8t3QPnNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973084; c=relaxed/simple;
	bh=WJeH59gz0mbPnDNtI62U1rsgsp7lvQ74cA8dJkUjp9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bkwQEDxhkMUop3hI+uhYWY7jwMOdYqEG91ElBqoU4h3Ur4+f/OwlTvuigC3jaoOocc1BdThfEA/0I916UQXCVr5onOHigmwVwkafAfcHSncZkE/z/yr+Tg+amld9K8ivZ1q0LHA2BO2vHdcxHz8CFSq9J5TSfsDEsng2yS4so0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=avNH9Y31; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="avNH9Y31"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=2HnTd9Z+06DNCNP8+G4GTLW1y30c1AsfvtKzhuWaGlM=;
	b=avNH9Y31a9JqVJN20ezmy0N7185Vk5yI0FY6WOhToZiaC+bzzCLwH/SNV9u3xg
	/Qj0uG9MslfwCQNbHWAz1830rvO80lLxdGANo1ZTquT9DELsyHmFaYo+cub7L8Wn
	qcJW0cPE1MBdRSyta5NdVCwmFyqVMIy0Dxf1dp793Avzs=
Received: from [IPV6:2409:8900:1ee3:222c:3c21:ce3b:b986:2f34] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wAXY51E0rBqGcEABw--.154S2;
	Mon, 21 Sep 2026 14:44:23 +0800 (CST)
Message-ID: <fce8925e-19a8-407b-8fa1-425facf8c97e@163.com>
Date: Mon, 21 Sep 2026 14:44:20 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: require page-aligned full-page attribute writes
To: Hyunchul Lee <hyc.lee@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev, =?UTF-8?Q?Marek_Weso=C5=82owski?=
 <marek@wesolowski.eu.org>
References: <20260921014257.2790279-1-hyc.lee@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260921014257.2790279-1-hyc.lee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXY51E0rBqGcEABw--.154S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyfAw4DJw4UAr1ftF47Jwb_yoW8Gr1Upr
	s7AF9Ikw48Z34DKFs2gr4jqa40vayxGw47JFZrCw1xArnYq3srKF1jkw1xXr4xK3y8ZrW0
	qF4j9F17uF42vrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziZmR8UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QeMV2qw0kftZwAA3w



在 2026/9/21 09:42, Hyunchul Lee 写道:
> __ntfs_inode_non_resident_attr_pwrite() treats count == PAGE_SIZE as
> proof that the request covers the complete folio. it allocates the folio
> without reading it and copies at offset zero. That proof is valid only
> when pos is page aligned.
> 
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
> Cc: Marek Wesołowski <marek@wesolowski.eu.org>
> ---
>   fs/ntfs/inode.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index d5e526d3612a..0391e4945e1c 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -3720,7 +3720,7 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(struct inode *vi,
>   
>   	index = pos >> PAGE_SHIFT;
>   	while (count) {
> -		if (count == PAGE_SIZE) {
> +		if (count == PAGE_SIZE && !offset_in_page(pos)) {
>   			folio = __filemap_get_folio(vi->i_mapping, index,
>   					FGP_CREAT | FGP_LOCK,
>   					mapping_gfp_mask(mapping));
> @@ -3742,7 +3742,7 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(struct inode *vi,
>   
>   		folio_wait_writeback(folio);
>   
> -		if (count == PAGE_SIZE) {
> +		if (count == PAGE_SIZE && !offset_in_page(pos)) {
>   			offset = 0;
>   			attr_len = count;
>   		} else {

Hi Hyunchul,

   Looks good to me.
   Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

Thanks,
Baolin.

