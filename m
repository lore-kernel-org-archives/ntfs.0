Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047E42E62B4
	for <ntfs@lists.linux.dev>; Tue,  8 Sep 2026 05:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788847146; cv=none; b=cn7P8Jzfp7oRTgarw5a62QV/CYKqfBfqANGq/YRIIdSWEALCUj3EiEgiOa8Jsohi/DY/IPKCpSkQvimxmwuoXLhnylTdMRL7uY9VVlpGgWXN/Ivn570LTlJWfa96Jjqa+LCjrRRdOwo00BTTTCxxa/Jr1bChPquXjCPqZhkyn1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788847146; c=relaxed/simple;
	bh=ZvXZNmeBH+8sKOxLRg55Za4YPfPmuz/3PFgEzmI3ILg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aF2jxiGD+u5f02oHCcXhGz0VSqe+y0kmJFA9dlYZb6F398ebylQXS2aREGlJF8P+4dCJGzZkfJ2I2ML+vbCqZWNqXD5bN9WnOlqLdtTlsTkAOCaGXCnaKC/VSj98EEUn3D5euPLeciAHp0Tya1F+Q3aEY2/FCo76vtQzVTF1u4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Zq8c1b9h; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Zq8c1b9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=tpCCPTQ6ugJb0wP1EWw7FqjFUJCQjqk1iP0NUIcqb5I=;
	b=Zq8c1b9hRkp6VmgfnVXFO4/286ECGeidPvzhoUGgeoqkEKGUS0nXw6TsWM4CJ8
	qI/nFpg6VaxW7CiVYf93FLaGc3uyRiSGm5xYIw3q87Y2mFjGz2RLbx1w2isbL5hH
	hHMjS97Z5/ZfH4bPxfir07634rVI0cxyGDjEx/+NBi6Bc=
Received: from [IPV6:2409:8900:1e93:d74:46a:b98a:2b32:6a19] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3P+IWpJ9qePyBBQ--.64697S2;
	Tue, 08 Sep 2026 13:58:47 +0800 (CST)
Message-ID: <dbb85dc4-70fb-4f99-90ab-7028d59c869c@163.com>
Date: Tue, 8 Sep 2026 13:58:46 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: remove unreachable code in
 load_and_init_attrdef/upcase
To: Jiangshan Yi <yijiangshan@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 13667453960@163.com
References: <20260907101623.671477-1-yijiangshan@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260907101623.671477-1-yijiangshan@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P+IWpJ9qePyBBQ--.64697S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1UKr1ruFW8ur1fuFWUtwb_yoW8ArWUpr
	Z29r4xK3yrAw15KF92ka1vq3W5ur1DGrW8G3sYg3yxXws2y3WkGr4rtw18uay8XrykZa48
	XFsxt3yfGayqv37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U7nY7UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Rewe2qfpBdIagAA3R



在 2026/9/7 18:16, Jiangshan Yi 写道:
> Both load_and_init_attrdef() and load_and_init_upcase() open a system
> inode with ntfs_iget() and, on error, run:
> 
> 	if (IS_ERR(ino)) {
> 		if (!IS_ERR(ino))
> 			iput(ino);
> 		goto failed;
> 	}
> 
> The inner guard is the exact negation of the outer one, so
> iput(ino) is dead code.  Drop the unreachable branch and collapse
> the error check to a single statement.
> 
> No functional change.
> 
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
> ---
>   fs/ntfs/super.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 60d43339c590..1b916deb7acc 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -1235,11 +1235,8 @@ static bool load_and_init_attrdef(struct ntfs_volume *vol)
>   	ntfs_debug("Entering.");
>   	/* Read attrdef table and setup vol->attrdef and vol->attrdef_size. */
>   	ino = ntfs_iget(sb, FILE_AttrDef);
> -	if (IS_ERR(ino)) {
> -		if (!IS_ERR(ino))
> -			iput(ino);
> +	if (IS_ERR(ino))
>   		goto failed;
> -	}
>   	NInoSetSparseDisabled(NTFS_I(ino));
>   	/* FILE_AttrDef must hold at least one entry and fit inside 31 bits. */
>   	i_size = i_size_read(ino);
> @@ -1301,11 +1298,8 @@ static bool load_and_init_upcase(struct ntfs_volume *vol)
>   	ntfs_debug("Entering.");
>   	/* Read upcase table and setup vol->upcase and vol->upcase_len. */
>   	ino = ntfs_iget(sb, FILE_UpCase);
> -	if (IS_ERR(ino)) {
> -		if (!IS_ERR(ino))
> -			iput(ino);
> +	if (IS_ERR(ino))
>   		goto upcase_failed;
> -	}
>   	/*
>   	 * The upcase size must not be above 64k Unicode characters, must not
>   	 * be zero and must be a multiple of sizeof(__le16).



Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

