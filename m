Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDC2307AE3
	for <ntfs@lists.linux.dev>; Sat, 26 Sep 2026 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790433115; cv=none; b=iVm0JoMY8wGryCRr9fFbxFTlL4KjgM4mvX2nB5L5Mrmu0DGrFOkdRMsfGHcM7FoCgDYDQTDt98vkYAhaLkR9TsJ24VHANpek+d5DyZHLQvfaRx7pThSOguf9bCkZF0zmJZGChkJ4D7wMcWrlk4XrQQhwL8T8pXNDUtBrRnKA1OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790433115; c=relaxed/simple;
	bh=QXH2LiT8YGjoI7rTuB/5Bwfp0I60en8jf6uXJuf9Tts=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qfRIExJFpK6JvUwAIyKZ9KH6KhmWmS11Q9ceC2B1LU36KfGoOr+P8Pxb/UeRCZNf7AO2shs/WCF6vaIFqZo6jasKrvl6g+vBBJr0GYXy40iZqauc44X3NI4AtQI70rYpbGL9dkAJc+xLIziGliWSDJQUsYBdMUFsBRZK8YdX6bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UcQPa3aJ; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UcQPa3aJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=91ZRTd//Cy0HjvpGiq45l4WHobWPEmRrOtgmFOlGYxg=;
	b=UcQPa3aJ+hEFfrrsF4esGR7x+OlREP35kb6KBrK0tTHioyeZOGGdEldOHJmSuf
	zsst9XNPdD0qIOug0W0Ry62P1p+W5208HBfN4UB+WvG9ZC5z4hEsi1QfUdtYg+89
	/KC+o8nC4RVopZ40a850JZVatUHLH+UOZf8jluWf+/ULc=
Received: from [IPV6:2409:8949:6ca0:7910:f5b:45b8:eba1:685a] (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD330c217dqjFyMAw--.59026S2;
	Sat, 26 Sep 2026 22:31:20 +0800 (CST)
Message-ID: <cad0b025-1c84-4076-8a3d-d04cd736a767@163.com>
Date: Sat, 26 Sep 2026 22:31:17 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ntfs: drain in-flight DIO before buffered write
 fallback
To: Jiale Yao <yaojiale02@163.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260926072612.3022680-1-yaojiale02@163.com>
 <20260926072612.3022680-3-yaojiale02@163.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260926072612.3022680-3-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD330c217dqjFyMAw--.59026S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWrWDZryfZF47Cw48Aw4DXFb_yoW5Jw4Dpr
	Z0kFy3Jr9FyrWxWwn3GF48W3WF939rJ3y3urWkW3W7CrWrKr4vga18KF1Yvr4fJFnrJrW2
	qF4v9rykCryUZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2-erUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hmMV2q31zlvkwAA3n



在 2026/9/26 15:26, Jiale Yao 写道:
> An asynchronous direct write can remain in flight after the inode lock is
> released.  If another direct write falls back to buffered I/O while the
> first write is still pending, iomap_file_buffered_write() can dirty pages
> before the first write completes its post-I/O page cache invalidation.
> The invalidation then finds dirty pages, reports a page cache invalidation
> failure, and records -EIO in the mapping error sequence.  A later fsync()
> therefore returns -EIO.
> 
> Commit 15cdefd0c0522f9d5e12d947fa04f4c11649b699 ("ext4: drain
> in-flight DIO before buffered write fallback") fixed the same race in
> ext4.  NTFS has an equivalent fallback after iomap_dio_rw() returns
> -ENOTBLK or a short write, but does not drain other in-flight DIO before
> dirtying the page cache.
> 
> Wait for in-flight DIO before calling iomap_file_buffered_write() in the
> fallback path.  Since NTFS supports IOCB_NOWAIT, do not enter the blocking
> fallback for such requests.  Return -EAGAIN if no bytes were written, or
> preserve the positive short-write result if the direct write made partial
> progress.
> 
> A reproducer using concurrent AIO direct writes and buffered fallback
> triggered the following warning and made a subsequent fsync() return
> -EIO:
> 
>    Page cache invalidation failure on direct I/O.  Possible data corruption
>    due to collision with buffered I/O!
> 
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Link: https://lore.kernel.org/r/20260629113827.4074335-3-libaokun@linux.alibaba.com
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   fs/ntfs/file.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 007d1614b9ac..8bbfa842889a 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -525,8 +525,21 @@ static ssize_t ntfs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   		ssize_t written;
>   		int ret2;
>   
> +		if (iocb->ki_flags & IOCB_NOWAIT) {
> +			if (!ret)
> +				ret = -EAGAIN;
> +			goto out;
> +		}
> +
>   		offset = iocb->ki_pos;
>   		iocb->ki_flags &= ~IOCB_DIRECT;
> +
> +		/*
> +		 * Prevent concurrent direct I/O and buffered I/O to the same file
> +		 * range. Wait for in-flight DIO to finish before dirtying pages.
> +		 */
> +		inode_dio_wait(file_inode(iocb->ki_filp));
> +
>   		written = iomap_file_buffered_write(iocb, from,
>   				&ntfs_write_iomap_ops, &ntfs_iomap_folio_ops,
>   				NULL);

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

