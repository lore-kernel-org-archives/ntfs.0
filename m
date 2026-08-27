Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016B135F5F8
	for <ntfs@lists.linux.dev>; Thu, 27 Aug 2026 03:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787801871; cv=none; b=rnJWMWxNR3NRZw8JrmjZpRPeIxPgTQFnWnhipE0GWTo3ow9ZmdAj8fVay/vYKwPtLBs6hlsRCUoRmkH4n4fNgdazH4cZXH/kfmOnA4kHx+Ee9MPsLjgwVDAZGUgFtsDYt9yaQ+ivCbN76d+lTI7GM65vbxEqfHoHDeDH+gQqz5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787801871; c=relaxed/simple;
	bh=30xqhXVuW50Xi8gBUXoBjow+R6JQELvl8rH7ykpfKKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3kvqtUk9XNjakEC1fq85yCCrWvpgVAL8UKY5tvV5TzPS/1uukZqUU5D6jGDR3OjqYiL/0b6TPzQ1vg2DcLLeGmF9lvPJd3StgU1qMSHNoO5fRvXN1PIMY5dhpeg/7Qd4EXJCHxq8aEcP8mqtRHi9Bk7Gt46LIXKNur07+6F53A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dpFrl0GO; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="dpFrl0GO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=XtavyOH0DxwVIQ6iw4IhqocgatWfmZ/qQBc1GNH3Eq0=;
	b=dpFrl0GOCgCvm6neta/l37pfeO/G20EGmWglOxh765BB+hJ6muU9tF7mxwcJVd
	XU61eTQTWLKAaMYEv5LGo9tDV2idgc0geHlMXgC+hsJCKwNyArfmuUos2qhNtryq
	KWrSsm2n5HB01P1AGqz76iPowKWrc1iJek2CHbbFUVZtc=
Received: from [IPV6:2409:8900:1ef4:8f82:6a1b:f1a6:cbdd:11fe] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wC3NIn0sI9qO69oSQ--.57593S2;
	Thu, 27 Aug 2026 11:37:25 +0800 (CST)
Message-ID: <bd197da8-a8ec-40ad-a50d-dc579840d680@163.com>
Date: Thu, 27 Aug 2026 11:37:24 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ntfs: fix race between fallocate and mmap reads
To: Hongling Zeng <zenghongling@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, stable@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260827031647.1605970-1-zenghongling@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260827031647.1605970-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3NIn0sI9qO69oSQ--.57593S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFWxXw4Dtw1rurW7Gw4UJwb_yoW5Wryxpr
	ZFgF1UKws3XrWjgF1kKw48uF1rWw4Ig3y5urWfJ3WxZFn5KFn2gw1jkFs3WFyftFZ3Jr45
	Xr1UXrZrua4av3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U39N-UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwRbnsmqPsPYVKgAA3e



在 2026/8/27 11:16, Hongling Zeng 写道:
> The fallocate implementation only takes invalidate_lock for punch hole,
> collapse range, and insert range operations. For standard allocation modes
> (mode == 0, FALLOC_FL_KEEP_SIZE), the lock is not held.
> 
> During ntfs_attr_fallocate(), new clusters are mapped to the runlist via
> ntfs_attr_map_cluster() before being zeroed by ntfs_dio_zero_range(). This
> creates a window where concurrent mmap page faults can read uninitialized
> disk data.
> 
> Since mmap uses filemap_fault() which takes invalidate_lock in shared mode,
> it can fault in pages during this window and expose old disk contents to
> userspace. This is an information leak and data integrity issue.
> 
> Fix by taking invalidate_lock for all fallocate operations, not just for
> punch/collapse/insert modes. This prevents concurrent page faults from
> accessing unzeroed clusters during the allocation window.
> 
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
> Change in v2:
>   -Remove now-unnecessary map_locked variable.
> ---
>   fs/ntfs/file.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 88747217ba61..779baafa0319 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -1153,11 +1153,8 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
>   	}
>   
>   	inode_dio_wait(vi);
> -	if (mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_COLLAPSE_RANGE |
> -		    FALLOC_FL_INSERT_RANGE)) {
> -		filemap_invalidate_lock(vi->i_mapping);
> -		map_locked = true;
> -	}
> +	/* Take invalidate_lock for all fallocate operations to prevent races */
> +	filemap_invalidate_lock(vi->i_mapping);
>   
>   	switch (mode & FALLOC_FL_MODE_MASK) {
>   	case FALLOC_FL_ALLOCATE_RANGE:

Hi Hyunchul and Hongling,

I think map_locked might still be needed though.

Before filemap_invalidate_lock() is taken, there's this check:

         inode_lock(vi);
         if (NInoCompressed(ni) || NInoEncrypted(ni) || 
NInoWofCompressed(ni)) {
                 err = -EOPNOTSUPP;
                 goto out;
         }

         inode_dio_wait(vi);
         filemap_invalidate_lock(vi->i_mapping);

If that goto is taken, we reach the exit path without having locked.
Without map_locked, we'd call filemap_invalidate_unlock() on a lock
we never took.

Would it make sense to either:
1. Keep map_locked as a guard for the unlock, or
2. Change that goto to inode_unlock() + direct return, so the shared
      exit path always holds the lock?

I'd appreciate your thoughts on this.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

Thanks,
Baolin.

