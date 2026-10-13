Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984D64B8293
	for <ntfs@lists.linux.dev>; Tue, 13 Oct 2026 23:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791933884; cv=none; b=BK1HxtMH7Izud+Hh9AEtJvYcEfFk84O/imHzNfBRYZpbgPLuGqqtH6naiEtN+RNi1INtMusfdfJX1Qy64yJ7RYPQnt2qtq2JEJOW9GR1txC5TxvymnNoREv2b60XrlF046XeBlZ3eiBCX6NrqGlaitUcLBqFVyJU9zIu+5ZTtmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791933884; c=relaxed/simple;
	bh=Zxe1ke8IecLNwIRNUt4DD97QaPXlv4d3HU6wCaWGUdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKTr9oN3l4kciXqKOVyRZgPkCus3FqAZ8TCsytFFqRi6XHF9O+ZfbYfRyV4nave4+sKl5FDhdVt3wBJUlQiPamL32WSR6VeLzLVlCfE0n3VaXqNaqZDELWW5ulasK+5oBKoR2imNCMuQJs5RtEebOQycDh38VdTqsorBgwDL6LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IZb9Mfx9; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IZb9Mfx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=cxeqF0hbguvmh50FR2udmR5/i9PQqhuQfqU7PmhdImc=;
	b=IZb9Mfx9E09E/d8TYnQqnWXBWqD6UjOfD3I4oCzmJGJCNphM7KFeawC2+TqvE4
	5IX5o4mf+aQUgxfJQ2jFwwthAoEzLvZeY/H17D7QaxKFA7JYpHzkYgY1RuBPDV3d
	sAvuy4/g/ggNPkcmgGXlvpZiDY3Moj5v9DZT4yLGDnCTU=
Received: from [IPV6:2409:8900:1a87:d0a0:9d82:6fdf:5e33:6bcb] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3H7+jvc5qdfoaEQ--.17989S2;
	Wed, 14 Oct 2026 07:24:21 +0800 (CST)
Message-ID: <764fa7c0-d585-400f-9dd6-351de2b7e222@163.com>
Date: Wed, 14 Oct 2026 07:24:18 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ntfs: handle block device cache flush in fsync paths
To: DaeMyung Kang <charsyam@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261013145846.56415-1-charsyam@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261013145846.56415-1-charsyam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H7+jvc5qdfoaEQ--.17989S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF47GF4xtw4UZFWxAF1xuFg_yoWkWrX_ua
	48Xw1UX392grn7u3Z3tr1UZayqv3W0yw45Ar92qFykA3yxArn5uF1DJrs0vrs0gFWkKr1F
	gr1Y934fAr47ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj0tC3UUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QXmsWrOvaWnPwAA3f



在 2026/10/13 22:58, DaeMyung Kang 写道:
> Regular-file fsync currently ignores a block device cache flush failure,
> while directory fsync never issues a cache flush. Both can report success
> without ensuring that the data and metadata reached stable storage.
> 
> The first patch returns and logs flush failures from regular-file fsync.
> The second adds a flush to directory fsync and reports its failure. The
> syncfs path already handles flush errors.
> 
> QEMU blkdebug injected -EIO for flush_to_disk on ntfs-next at
> 04fb910da2c8. Before these changes, both file and directory fsync
> returned success while syncfs returned -EIO. With the respective fixes,
> both fsync calls return -EIO. A kretprobe confirmed the flush failures.
> 
> DaeMyung Kang (2):
>    ntfs: report block device flush failures from fsync
>    ntfs: flush the block device when syncing a directory
> 
>   fs/ntfs/dir.c  | 2 ++
>   fs/ntfs/file.c | 4 ++--
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 04fb910da2c857cdf99a331c576c3e5e7197c6dd

The series looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

