Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B054C3B05BD
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 08:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794967; cv=none; b=GMmo/JRUbw3xr+1bSEqZgfZze5aSkGLdpluLOotTwT5mcQfAZIY6osCwdzfDW0v37nsgy7wcBZLpoXT020J9TiyTW1qJ1YOrSgVqVLoIXOj+xrmX2NrzsJneKmeyTFSg+b6oS4nrVNgH1V6Yrn2mfXk5t/jTFv+Z5sDajWdj/Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794967; c=relaxed/simple;
	bh=SYtJXGGl+yph6qeQVD3MUpSP66ecjEx1Pm5NwbiP+Ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DkD+XnRPEPcaylvhDx+htGL7hLfmI9aRuAGh1VWHDoLWWe5myhSevLg67ym50XMHpGwN65T2qtNdHc2cl4q/4SqG233dEXs1j/oXYyPUkoQyRk7A/6UNxn+aigUUYUr5korswWN7mAfoetGC6zMRM/62C9djAc2Z6XvUlfF2fZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LL300y+E; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LL300y+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=FaJVnMdDN4fWJeDn3xRhGTrEnnilxQp9t1zir9qO1yw=;
	b=LL300y+ES2gtYyMgoMimUvHnS/fq3ekIomYimgdUlWa4T7u/UznRkecLqBYc/P
	XmEZhAYn8gKCqqxF7q9rzLEyjpwsFV5Cro8nhAXFFQuzFQO1sFYJ9iBB8RfZqc4o
	Tre13AxL16/fNPnbvYoM62oB55h7iTrM/2PvKemy2ANnI=
Received: from [IPV6:2409:8900:1a87:d0a0:cf38:5aca:d24d:b7a4] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDnV+YHn8xqO6nBEA--.54362S2;
	Mon, 12 Oct 2026 16:49:12 +0800 (CST)
Message-ID: <e590b551-b021-4ec7-b769-aad43fe6ac1c@163.com>
Date: Mon, 12 Oct 2026 16:49:10 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ntfs: do not read ahead encrypted files
To: Zhan Xusheng <zhanxusheng1024@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
References: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
 <20261012062040.3826828-2-zhanxusheng@xiaomi.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261012062040.3826828-2-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDnV+YHn8xqO6nBEA--.54362S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr1UWr18JrWftFWfJw43KFg_yoW8ur18pF
	ZxCF98Kw1xAryI9w4xKFyfWr1xurW8GF45GrW8J34fAa4fGrs5KryfK3WFqFy8GFyrKw1U
	Zr4FvrW7Ja15X3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2zuZUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gi3gmrMnwiwigAA3c



在 2026/10/12 14:20, Zhan Xusheng 写道:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> ntfs_read_folio() refuses EFS-encrypted files with -EOPNOTSUPP because
> decryption is not implemented.  ntfs_readahead() has no NInoEncrypted()
> test and passes them to iomap_readahead(), which maps the runlist and
> fills the folios with the raw on-disk ciphertext.  The folios are
> marked uptodate, so the read that follows never reaches ->read_folio
> and returns ciphertext instead of -EOPNOTSUPP.
> 
> ntfs_read_locked_inode() sets NInoEncrypted() and NInoNonResident() for
> a non-resident encrypted $DATA attribute and rejects the
> encrypted-and-compressed combination, so none of the three existing
> conditions fires.  read(), mmap(), splice() and fadvise() all populate
> the page cache through readahead.
> 
> Skipping readahead leaves the folio unpopulated, so the read falls back
> to ntfs_read_folio() and gets the intended error.
> 
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
> ---
>   fs/ntfs/aops.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs/aops.c b/fs/ntfs/aops.c
> index 517d9a1563e7d..ad781674fef1a 100644
> --- a/fs/ntfs/aops.c
> +++ b/fs/ntfs/aops.c
> @@ -240,10 +240,11 @@ static void ntfs_readahead(struct readahead_control *rac)
>   	};
>   
>   	/*
> -	 * Resident files are not cached in the page cache,
> -	 * and readahead is not implemented for compressed files.
> +	 * Resident files are not cached in the page cache, readahead is not
> +	 * implemented for compressed files, and ntfs_read_folio() refuses
> +	 * encrypted files because decryption is not implemented.
>   	 */
> -	if (!NInoNonResident(ni) || NInoCompressed(ni) ||
> +	if (!NInoNonResident(ni) || NInoEncrypted(ni) || NInoCompressed(ni) ||
>   	    NInoWofCompressed(ni))
>   		return;
>   	iomap_readahead(&ntfs_read_iomap_ops, &ctx, NULL);

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

