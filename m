Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B609B39FCE
	for <ntfs@lists.linux.dev>; Sat, 10 Oct 2026 01:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791594936; cv=none; b=IgRZL21xXXkoMUZYsFP0Jpjp/81ZAI2ypR+Rk4G8rqez9R5sHNlIEsbx+HF6/PmSKCLUETUigrTKZvHJMroU3DwoZimR3EmP4sMHWIacz176j3Rj5m7wWFg2ikLwhNqMuulwksGF/yhSYD1A619QCZchwP2wUUE/ZZIv8P1Q2AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791594936; c=relaxed/simple;
	bh=kAQSa5nX8c2ZUsjtBGBsyQqzHcCk8AYEH5rCND9zqgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XByY0gNU2l0Bg5tZ77sC9Ze7e04+EvgD52iq4XwLQSQeFejwkvRMtRePj8zci1rJyRw+3stu5cPPcCmDbq9my5VHTbuPriBd8IuWnp9/zrJlBHsAhI/5Zamnrc8yPXvUEI3I8mgVbpwz6xoGzxvjWyGoMktGunAmFVbdCwrePuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HYNCjt+I; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HYNCjt+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=1nkt/IUnTzUP0aQ9S7LfugyfQPM1afnAt6355T3gwhQ=;
	b=HYNCjt+I9iAfr14TPe2VXVDYzowsbQSRF/75a/EJx833ljlpCLQmybhSlgA9Yv
	yoc3abYtEUy0dmfIFNHOtWs5FockPzBLHB9gxzMqso82GaeTIZUoxh3Ru77SoZh6
	+RjcBro6RFnHPU7VNqJ/ADNr5vQEW+oj6aYLK/DPTmqX8=
Received: from [IPV6:2409:8900:1ec6:e6c:f7a8:8f42:dbce:ca48] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnT1KmkclqRsKpDg--.15446S2;
	Sat, 10 Oct 2026 09:15:20 +0800 (CST)
Message-ID: <915d6e3d-64c2-446c-bd47-281cddb4c742@163.com>
Date: Sat, 10 Oct 2026 09:15:18 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: widen the sub-block offsets in ntfs_decompress()
To: Zhan Xusheng <zhanxusheng1024@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Zhan Xusheng <zhanxusheng@xiaomi.com>
References: <20261009075523.3135206-1-zhanxusheng@xiaomi.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261009075523.3135206-1-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnT1KmkclqRsKpDg--.15446S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF4kCw1kWFWkZr17uFy3urg_yoW5Aw1rpF
	47CF1Yk3yrGr4xWFs7KFs5t347C395Jw4UGr4qy3sxZws8WwnagF1kKrW8Gw1ru393Awsr
	ZF4qvF98Aay3tFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UxWrtUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QibZmrJkag2ZgAA3W



在 2026/10/9 15:55, Zhan Xusheng 写道:
> ntfs_decompress() tracks where the current sub-block starts and ends
> inside the destination page with two u16s:
> 
> 	u16 do_sb_start;
> 	u16 do_sb_end;
> 	...
> 	do_sb_start = *dest_ofs;
> 	do_sb_end = do_sb_start + NTFS_SB_SIZE;
> 
> *dest_ofs is an int page offset masked with ~PAGE_MASK, and
> NTFS_SB_SIZE is 0x1000, so do_sb_end needs PAGE_SIZE + 0xfff of range.
> That exceeds u16 once PAGE_SIZE reaches 0x10000: the last sub-block of a
> page starts at 0xf000 and do_sb_end wraps from 0x10000 to 0.
> 
> The zero-fill that pads a short sub-block then computes a negative
> length:
> 
> 	if (dp_addr < dp_sb_end) {
> 		int nr_bytes = do_sb_end - *dest_ofs;
> 
> 		memset(dp_addr, 0, nr_bytes);
> 
> A sub-block made only of symbol tokens reaches this without consulting
> do_sb_end on the way, because that path just does
> 
> 	*dp_addr++ = *cb++;
> 	++*dest_ofs;
> 
> and is bounded by dp_addr against dp_sb_end.  With do_sb_start at 0xf000
> and eight literal bytes emitted, nr_bytes is -61448 and the memset()
> runs for 18446744073709490168 bytes.
> 
> Getting there is cheap: fifteen sub-blocks of eleven bytes each advance
> *dest_ofs to 0xf000, since the same zero-fill pads each of them out to
> 0x1000 while do_sb_end is still exact, and the sixteenth one triggers
> the wrap.  A compression block is 0x10000 bytes with 4 KiB clusters and
> the fixed compression unit of 4, so all sixteen fit with room to spare.
> 
> Phrase tokens are bounded against do_sb_end and so return -EOVERFLOW
> instead, and the
> 
> 	if (*dest_index == dest_max_index && do_sb_end > dest_max_ofs)
> 
> check at the top of the sub-block stops firing for the same reason.
> 
> Use int for both, matching *dest_ofs and dest_max_ofs.  The narrow type
> came in with the original import and survived the removal and revert of
> the driver.
> 
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
> ---
>   fs/ntfs/compress.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index 075b57fc1de61..82c7c7d290737 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -182,8 +182,8 @@ static int ntfs_decompress(struct page *dest_pages[], int completed_pages[],
>   	u8 *dp_addr;		/* Current pointer into dp. */
>   	u8 *dp_sb_start;	/* Start of current sub-block in dp. */
>   	u8 *dp_sb_end;		/* End of current sb in dp (dp_sb_start + NTFS_SB_SIZE). */
> -	u16 do_sb_start;	/* @dest_ofs when starting this sub-block. */
> -	u16 do_sb_end;		/* @dest_ofs of end of this sb (do_sb_start + NTFS_SB_SIZE). */
> +	int do_sb_start;	/* @dest_ofs when starting this sub-block. */
> +	int do_sb_end;		/* @dest_ofs of end of this sb (do_sb_start + NTFS_SB_SIZE). */
>   
>   	/* Variables for tag and token parsing. */
>   	u8 tag;			/* Current tag. */
> 
> base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

