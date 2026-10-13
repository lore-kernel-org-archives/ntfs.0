Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB98D4B1468
	for <ntfs@lists.linux.dev>; Tue, 13 Oct 2026 23:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791933895; cv=none; b=ii/Al+M9MlKP6C+4F9H4pitTiGmP66dmy5TRyRU3p7xPXnzfQ7Z9nEDoCR6gZu14AaHOwdJCZ1GgkAHQt/jvY8aDgzxrapUtjTnjCzejnIDib8K6pPnmfmOhqzvUWWGkCBXRioFCxabmXDNEwFbESNrGmt509xaiIi8K4KcMXuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791933895; c=relaxed/simple;
	bh=Df5euMZ7GRB7lzj9XqtNsgNgiWwI0LnGkjQxrVqI2go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hCN1WJdp9JJQP62L63KjM04ifl1LkLr/2pXetEPfIZFBmnxeZQo4ovcOVFYPNGLzhey3XiuNpJtkXliM4k25bhwZDGvzHX3ylBHcCBIFBQb+sHNums/IStprJiGaeAFLDljIN/j9nlSSWroQ+pPx8OJY8pjHbRU3HhEkM7MuuYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HQt/oFwp; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HQt/oFwp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=bNPAQuPoxBsX/MPcYdsx2mO9t/aLPKwgxQnaOfUiNwY=;
	b=HQt/oFwp+PyaBAylMssyA1epl6ynuap1P1RHFrUiyECg84Pv/ky6dXmrYkucVT
	bew0rbQp9HKUyHfLOmBCit3VY9DjbT2A5BUnlYNmcAfsZzf4o6BpY+0KlIP/qUA8
	nbem5WFMYt2R38BoktLRa914LfQ9UAJE2JUlBBgiGWQmw=
Received: from [IPV6:2409:8900:1a87:d0a0:9d82:6fdf:5e33:6bcb] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDXBES2vc5q3HPQEQ--.29313S2;
	Wed, 14 Oct 2026 07:24:39 +0800 (CST)
Message-ID: <8e59b334-696a-4e7c-8acd-625ad18239b6@163.com>
Date: Wed, 14 Oct 2026 07:24:38 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ntfs: report block device flush failures from fsync
To: DaeMyung Kang <charsyam@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261013145846.56415-1-charsyam@gmail.com>
 <20261013145846.56415-2-charsyam@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261013145846.56415-2-charsyam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDXBES2vc5q3HPQEQ--.29313S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF48WF13Cw1UurWUJF4rGrg_yoW8XF1Upw
	sxCryrJ39YvF1UK3Z0kF4jgFWFvFZ7t342gF9xuw1Sgr45J3WDWFWrtw1Fqas5trykArW8
	Gr4DWFZ0ya4UArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2iiDUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RfqtWrOvbepDQAA3r



在 2026/10/13 22:58, DaeMyung Kang 写道:
> ntfs_file_fsync() calls blkdev_issue_flush() after writeback but discards
> its return value. If the device cannot flush its write cache, fsync()
> reports success even though the file is not guaranteed to be durable.
> 
> Reproduce this with QEMU blkdebug failing flush_to_disk with -EIO.
> On ntfs-next at 04fb910da2c8, a kretprobe recorded -EIO from
> blkdev_issue_flush() while fsync() returned 0. With this change,
> fsync() returns -EIO and logs the failure. The syncfs() path already
> reports this error.
> 
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
> ---
>   fs/ntfs/file.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 58afd310d57b..afc2efb4b699 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -417,14 +417,14 @@ int ntfs_file_fsync(struct file *filp, loff_t start, loff_t end,
>   	err = sync_blockdev(vi->i_sb->s_bdev);
>   	if (unlikely(err && !ret))
>   		ret = err;
> +	if (!ret)
> +		ret = blkdev_issue_flush(vi->i_sb->s_bdev);
>   	if (likely(!ret))
>   		ntfs_debug("Done.");
>   	else
>   		ntfs_warning(vi->i_sb,
>   				"Failed to f%ssync inode 0x%llx.  Error %u.",
>   				datasync ? "data" : "", ni->mft_no, -ret);
> -	if (!ret)
> -		blkdev_issue_flush(vi->i_sb->s_bdev);
>   	return ret;
>   }
>   


Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

