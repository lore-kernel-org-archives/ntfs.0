Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E19249A3B0
	for <ntfs@lists.linux.dev>; Tue, 13 Oct 2026 23:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791933898; cv=none; b=gr+zpZx44jHhiK1f7Qcs/4MdOPzCCuSVsRKz6h0WxL5QKY1sGMAkU4DvtdXmCh6AxwQJpfEZvr1wDUKlON7kUK4uQLGA5rNPSYyOLoXNTUQayTuXMdxtrv07ZN1O04f/iFoetBqSdonrJQI5mQ2D2MKtdiUgjGYwkDIUaSA3FHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791933898; c=relaxed/simple;
	bh=0Uc5nTrSrEVS61F9ewvawrSUIhc5TtcDIRAD8UZVhEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbkq90Lr5ck3inIEDg8eroLI070nevQ6InvzEKkQMG1YC/nmtke410u2eNUVlcFDKroCpOasq+4R7FnNcn/lBMjx1DS0OYwh71TuPGtEoIu7gbrzFjHbZSmFpCwa2+LXvVrjPBZN6AcngvThvsF8enFSs6QaPXSFlzNIt8tauS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EsKn/uj4; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EsKn/uj4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=N26AKMAXiTM6rFqNoRgV4qhW8JRriwgrdYp79xxB7vw=;
	b=EsKn/uj4pQDiiR5eAhBL5w2OrH2ZE50dBrO3s8noaVy6oCy+VH9Y1IQ6ZC7rLE
	vcbgUXDQ4er+rzetvbYrIkRiWPlpLwdgzWfRzs4y/DWrXxmSKJsLIJ3m/AH7IIe4
	mrvsmiJ8Dh3c0QJgRxr1RGDP4vchK91cWV6/ZmILB5V7Q=
Received: from [IPV6:2409:8900:1a87:d0a0:9d82:6fdf:5e33:6bcb] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD317_Avc5qu_TvEA--.475S2;
	Wed, 14 Oct 2026 07:24:49 +0800 (CST)
Message-ID: <1bf29aae-f8f1-4e70-9f06-eb34599bfa60@163.com>
Date: Wed, 14 Oct 2026 07:24:47 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ntfs: flush the block device when syncing a directory
To: DaeMyung Kang <charsyam@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261013145846.56415-1-charsyam@gmail.com>
 <20261013145846.56415-3-charsyam@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261013145846.56415-3-charsyam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD317_Avc5qu_TvEA--.475S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr4rJFy7Cr45tw1rCFW3Wrg_yoW8GF15p3
	y2kF9xG3sYvrW8KFnakF4UtFyxuF9rKw4fXFn0vw1furn5Z3ZrWFy3ta40q3W0qFy3A3yU
	XrW2gFWrAFyUAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2oGLUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gHtuGrOvcE94wAA34



在 2026/10/13 22:58, DaeMyung Kang 写道:
> ntfs_dir_fsync() writes directory metadata and calls sync_blockdev(),
> but does not flush the block device write cache. A successful fsync()
> can therefore leave the directory's metadata in a volatile device cache.
> 
> Issue a cache flush after successful writeback and return any flush error.
> This matches the regular-file fsync and syncfs paths.
> 
> With QEMU blkdebug injecting -EIO for flush_to_disk, fsync() on an NTFS
> directory returned 0 before this change while syncfs() returned -EIO.
> After this change, both return -EIO. A kretprobe confirmed the flush
> error in the directory fsync path.
> 
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
> Cc: stable@vger.kernel.org
> Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
> ---
>   fs/ntfs/dir.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
> index 5a0e21e7c283..fce10baa2b93 100644
> --- a/fs/ntfs/dir.c
> +++ b/fs/ntfs/dir.c
> @@ -1192,6 +1192,8 @@ static int ntfs_dir_fsync(struct file *filp, loff_t start, loff_t end,
>   	err = sync_blockdev(vi->i_sb->s_bdev);
>   	if (unlikely(err && !ret))
>   		ret = err;
> +	if (!ret)
> +		ret = blkdev_issue_flush(vi->i_sb->s_bdev);
>   	if (likely(!ret))
>   		ntfs_debug("Done.");
>   	else


Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

