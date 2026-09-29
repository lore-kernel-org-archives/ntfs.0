Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56B023ABBE
	for <ntfs@lists.linux.dev>; Tue, 29 Sep 2026 00:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790642220; cv=none; b=mWZldlTC0ZLnkXjUJMeMtgCU+Ad1u9TJ2vsoKoQWLAZxEZHzJwsvKiLO06ZjhAqsog7tDo9zQKOrjBhVaMrYMo9gRAV9690A/3a5N/QdTbYa5x8fkF2brsGLgl7Yeek3VIl1WFSmWQ6P7P8FjqM+Ywsu+Q7CO17sCaGI0m8Cluo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790642220; c=relaxed/simple;
	bh=n5FDxnPBPzLKkNj1Sx7krgBP10+YYKPcENPn+cozrdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JO94IoyR03oePYml8krRiW/fESIWQ7a8eBSCWOfPObrleuV3qehOTKYTP6bVBdpPgRy20v07ikCLSOyR+bU2HhK7k9pPlmOoF10yfSc23QLkejUrPUtxU+UB5hlq4uqDjLNyUAoPwxQADQoKl3jF3xAQcK7Um9rmr5HQA21zHXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mKpbgScR; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mKpbgScR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=9NyuA0bMM6aqKVWQQjVwVwgsCTdTkCPEE5XMDeAICzc=;
	b=mKpbgScR9JnPafBMnSbFuPFcUOSBA/rKIvFLrlE/Dqm8fvi0r2zM4sme66J2Tm
	RNcEPFz/6bgwAZzTzvTvz0aWo+uuWTCso3DlfN3jhMP7LgdYY7SN980bQ9Cd0eea
	FLDNykO0SbR3HtaPS2+li9xM331rhvVO+0eR0bcxH/a8M=
Received: from [IPV6:2409:8949:6ca0:7910:58ab:b82f:e3cc:2f41] (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3H2wWCLtqaeyIBQ--.55936S2;
	Tue, 29 Sep 2026 08:36:38 +0800 (CST)
Message-ID: <00a35199-9862-4781-8217-3d9a2192102c@163.com>
Date: Tue, 29 Sep 2026 08:36:37 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: accept standard sparse compression unit
To: Hyunchul Lee <hyc.lee@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
References: <20260928072513.1776685-1-hyc.lee@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260928072513.1776685-1-hyc.lee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H2wWCLtqaeyIBQ--.55936S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF13Zw1rGryfGw4rZF13Jwb_yoW8XFy8pr
	9Ik34rKwnrXry0kw4xKr4jgFyfZryrXayDJrn7Gw1UJan3trn2qF1kKF18K393t3yrXayD
	ua1vgr1kG3yYvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zROdbnUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RaQW2q7CBYaQAAA3h



在 2026/9/28 15:25, Hyunchul Lee 写道:
> Windows native sparse-file inspection shows that a non-resident $DATA
> attribute can be marked sparse and record the standard compression unit
> (4) even when the file is not compressed.
> 
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
> ---
>   fs/ntfs/inode.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 9583b2c6c7a2..de848180749d 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -1148,14 +1148,21 @@ static int ntfs_read_locked_inode(struct inode *vi)
>   					goto unm_err_out;
>   				}
>   
> +				/*
> +				 * Windows stores the standard compression unit in
> +				 * sparse attributes even when the data is not compressed.
> +				 */
>   				if (NInoSparse(ni) &&
>   				    a->data.non_resident.compression_unit &&
>   				    a->data.non_resident.compression_unit !=
> -				     vol->sparse_compression_unit) {
> +				     vol->sparse_compression_unit &&
> +				    a->data.non_resident.compression_unit !=
> +				     STANDARD_COMPRESSION_UNIT) {
>   					ntfs_error(vi->i_sb,
> -						   "Found non-standard compression unit (%u instead of 0 or %d).  Cannot handle this.",
> +						   "Found non-standard compression unit (%u instead of 0, %d, or %d).  Cannot handle this.",
>   						   a->data.non_resident.compression_unit,
> -						   vol->sparse_compression_unit);
> +						   vol->sparse_compression_unit,
> +						   STANDARD_COMPRESSION_UNIT);
>   					err = -EOPNOTSUPP;
>   					goto unm_err_out;
>   				}

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

