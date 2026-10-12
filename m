Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0F6309EEB
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 08:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794979; cv=none; b=igxbF0re2ZA/MXALbkqt9a8IQpGa/VYpfjcDuwsVg4/Mpu885UrCyPeUQSthAFlTvrzHeoyxTqcqnelK4Vl367qC2REdzJOMuGE5D058ZuxA1WJjUkDjaDaKyNxUWJd0Jy7bDMBLTkc/G8A95KiquDAnvXrRdoUb2v9jeR5dFq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794979; c=relaxed/simple;
	bh=NLZtWPO8QVlQcmrvlp9j/qdajGObJeVAWPQdkCJKNCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NyG6fs2y/dRPI9+QdzNYLhcNMUnoje4x/iDDLE4lQqTmqWL8irFH5bN0pCMF/uTbo5U62COE+QTM+/gsubdt/QlALNe34M4d9JenW6a8BK4W1+AH3/j530jcY496fGJO0G2rEah4fax2JXHsIGb+39i4Kgj5pEj2qIEv857zKcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nnWQFNVV; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nnWQFNVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=a6I13J2yhpsuzdMcyX3L3pi1BmQ4RE8TiPWvoAncAQg=;
	b=nnWQFNVVyOIanyNnLXvUQ6PBXcQN8Yq5oR2hRmlai0Eowi4vHmsO7R8UB7pBVm
	XoHL+2a15PIZVKEahbc2OqUmQnOWU+04m/o+kiDaRuuguu8uYZ3hMwl6CuaO1x7E
	iR1SK6NuRzsqcGBdIcy4fH1eV+QaR5s6Ep4LdhFKPAANo=
Received: from [IPV6:2409:8900:1a87:d0a0:cf38:5aca:d24d:b7a4] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnr2ISn8xq0I8XEQ--.1081S2;
	Mon, 12 Oct 2026 16:49:23 +0800 (CST)
Message-ID: <3e92aa95-c831-4449-b229-5a43d2ace3e3@163.com>
Date: Mon, 12 Oct 2026 16:49:22 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ntfs: reject direct I/O reads of encrypted files
To: Zhan Xusheng <zhanxusheng1024@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
References: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
 <20261012062040.3826828-3-zhanxusheng@xiaomi.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261012062040.3826828-3-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnr2ISn8xq0I8XEQ--.1081S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw1DCrWfGF4kZrWfJFWrKrg_yoW8GF4kpF
	ZIkFy5Ja18Jry7Ca9rKF4UZFyYqr4xGrWUurWDAw4xGF43Grn3KrW8tFnFqFs5tFyruw1U
	Zr48tF15Jr4YqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UyVb9UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RO5hGrMnxPHFQAA3-



在 2026/10/12 14:20, Zhan Xusheng 写道:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> ntfs_file_read_iter() refuses direct I/O for compressed and WOF
> compressed attributes but lets encrypted ones reach iomap_dio_rw().
> ntfs_read_iomap_begin_non_resident() has no NInoEncrypted() test, so it
> reports IOMAP_MAPPED for the attribute's real clusters and the raw
> on-disk ciphertext is copied to the caller.  Buffered reads are refused
> by ntfs_read_folio(), but direct I/O never calls it.
> 
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> ---
>   fs/ntfs/file.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 007d1614b9ac6..eb8ed1959cd4c 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -460,8 +460,8 @@ static ssize_t ntfs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>   	if (NVolShutdown(NTFS_SB(sb)))
>   		return -EIO;
>   
> -	if ((NInoCompressed(NTFS_I(vi)) || NInoWofCompressed(NTFS_I(vi))) &&
> -	    iocb->ki_flags & IOCB_DIRECT)
> +	if ((NInoCompressed(NTFS_I(vi)) || NInoWofCompressed(NTFS_I(vi)) ||
> +	     NInoEncrypted(NTFS_I(vi))) && iocb->ki_flags & IOCB_DIRECT)
>   		return -EOPNOTSUPP;
>   
>   	inode_lock_shared(vi);

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

