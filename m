Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DEE478870;
	Thu, 24 Sep 2026 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251479; cv=none; b=EYO0NcMy60B+qlJfbeEAMAv/rEfLlaDgXisIRmX5yvUkxOESBhAkM1UBjyJF7YMUtVZ/L+yyns5kJ4BdaKSabAN3qi0Bvgb/aLdFz3R8mD/R6uX7D8uBSNGdJ7DoDmYEbifvgLRDKeADwZSEtvIiqoWIKIGHPXxk+v/zAMXzG0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251479; c=relaxed/simple;
	bh=Wb9UfTdAfRe3M7usASG3pV8I28E3o5494Kjit7FKro8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uO85KRQo++LFpgKqXiH55ohQ1UrjLfzXAzA0zF0SFoO76qbiHZ1Qc6ZuJ9FfMiGNDADLwPw1NOu9P+Eq87QWf5U3MRXWdbBvOlPdeY7pC2Tg0T8KXd9bSSdQLRyeVQsViUantuEMTpMp0njy18X4NzKnjroDzxXU/CnKUx8z3+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mEaC849y; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mEaC849y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=BHGkzVj7YVTIwQWSxeG5FamHMAQuS8AgVPjPclOktEs=;
	b=mEaC849yZzIANJfxqgtQ0/Jrm6BZuParKlK8S6ZUAZmhhAjjF3wO+t1u0+dMGT
	+eojw893NVAbotH0Kl9UY/WNjxCTQi9A52z3Sy7WYar7MvUtmsXKfLjbL8/UtimP
	oZ8hG91LR5Wr4aGwRUBXkKJ7iMolLeRnSRo3trqrw/SsY=
Message-ID: <b51a2ffa-5778-4075-a679-84cd3acf419a@163.com>
Date: Thu, 24 Sep 2026 20:04:14 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ntfs: drain in-flight DIO before buffered write
 fallback
To: Jiale Yao <yaojiale02@163.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Jan Kara <jack@suse.com>, Hyunchul Lee <hyc.lee@gmail.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>, exfat@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org,
 ntfs@lists.linux.dev
References: <20260924110544.601390-1-yaojiale02@163.com>
 <20260924110544.601390-3-yaojiale02@163.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260924110544.601390-3-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgBHFBW+EbVq9SEGBA--.9703S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWrWDZryfZF47Zr1xJw13urg_yoW5Gw17pr
	ZakFy5Jr9FyrWIq3Z7GF4rWF1Fg397JrWa9rWkWw1UC3y8Gr4vgF40kr1jvr4rAFsrJr42
	qa109rykZryjvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U5CztUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gF8R2q1EcEEMwAA3o



在 2026/9/24 19:05, Jiale Yao 写道:
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
> fallback path.
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
>   fs/ntfs/file.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 007d1614b9ac..2fc2ffde3846 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -527,6 +527,13 @@ static ssize_t ntfs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   
>   		offset = iocb->ki_pos;
>   		iocb->ki_flags &= ~IOCB_DIRECT;
> +
> +		/*
> +		 * Prevent concurrent direct I/O and buffered I/O to the same file
> +		 * range. Wait for in-flight DIO to finish before dirtying pages.
> +		 */
> +		inode_dio_wait(file_inode(iocb->ki_filp));

Hi Jiale,
    This fallback path can still have IOCB_NOWAIT set, but 
inode_dio_wait() blocks when there is outstanding DIO. Clearing 
IOCB_DIRECT does not clear IOCB_NOWAIT.

   In comparison, ext4_buffered_write_iter() rejects NOWAIT requests 
before reaching the wait.

   Could we also handle IOCB_NOWAIT before entering this potentially 
blocking fallback?
   If no bytes have been written, we can return -EAGAIN; if some DIO has 
already completed, we should preserve the positive short-write result.

Thanks,
Baolin.


> +
>   		written = iomap_file_buffered_write(iocb, from,
>   				&ntfs_write_iomap_ops, &ntfs_iomap_folio_ops,
>   				NULL);

