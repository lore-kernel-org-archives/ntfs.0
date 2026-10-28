Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176906;
	b=rXt4Zfc2WKNmFGmKDaVL0NwNIM9/CxsJc8oMIwl03i5/KYaVG4Yipwk/iB3o+3lp69y5
	 Q4htpVu9ljBW9Tr0lrIiqGdWfsjyvbBeQPPPQGHgpB/fc8U9Y4sVi6SgLfuEMv3ZB8K0g
	 sVhDR0z7QeBceG8k87gJwpMN9RNPycxwIxvwcaLKsk+kzPWhMsgHxRxIo23MNbQS/Cjw3
	 USLdDeS5rg3kXLWZMtIZk/cq6VZFo8GMn4sUXUfQvg9HrJ7JF/eD12QiOq/eI4cdVsrUm
	 OJunfvkkbiAkKA5BWfQ6cUPWtUAN1XBqr/659uRXYEunbkl88Jqw6X8//N/prlpOOyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176906;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=nogWIJdqnyhUp205Hb8BnlBTxvvqLFuP2b+cCj7ngm8=;
	b=Ge5g2qprOZDpx86IXn1WOHP7uW38cZAlazROKCWrP61L3m6rNtnfvViKH7aCnzFMRhK5
	 knFhANviUszhyKz+VbNNZ4jcaIuO9gHH/zkRB7p2fLi/HMHFrPWZmv4DInDeUWlLibU6a
	 mhNQwT94hqYgJYcazSF/plLtuXArbGGSoQzyEnwC8LgUbaUSklVPHVLLq4wrgWoLWe3gV
	 PKnhPZeaq8qFIP65+7FYgFz6vhgxDkZPLG11LCdMDSD9UKiddFZwGcJZCW7r9I9pjLoTb
	 bEMYj5QY+au9RyVcl2Q5rh+SiInwznvVG9uL04dkG4BlKcgd6YUmzwjEqsXRJOIiE5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aT4KyCjn;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C93606A31D
	for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 08:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C93606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aT4KyCjn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=nogWIJdqnyhUp205Hb8BnlBTxvvqLFuP2b+cCj7ngm8=;
	b=aT4KyCjnEBnbSEGadIphawaeMYs2LhBEC0W9YJwrPFzxMbvg0YE7qzJQByA73l
	FKY1roAYU3Jsb9pFiLxqBLjauQfQU4K+956Vq/ukWNPT+3rDpssgtouobp4k8059
	GGJPj3yKAyptQj5qMHPnDu146JWBirWmTJGSicD2QgJkA=
Received: from [IPV6:2409:8900:1a83:1c7d:c982:2c1e:474c:2013] (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnf8wzteFqWg_6DA--.60292S2;
	Wed, 28 Oct 2026 16:41:25 +0800 (CST)
Message-ID: <100b8d52-f829-46c2-82a4-3516dca07b56@163.com>
Date: Wed, 28 Oct 2026 16:41:23 +0800
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ntfs: keep the file size on a failed initialized-size
 extension
To: Hongling Zeng <zenghongling@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, zhongling0719@126.com
References: <20261028080656.1027283-1-zenghongling@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261028080656.1027283-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnf8wzteFqWg_6DA--.60292S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWkKrWxAFy3JF4DXF45trb_yoW8Gw13pr
	9F9rZIkrs5C34kWrna9w1vqw4Fq3Z7Kw4UGF98uFn2yFykGr1qgF40yrW8uFWktrZ3t3y5
	tF4DWrW7A34vvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UxEfwUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6haNWGrhtTbVGAAA3s



在 2026/10/28 16:06, Hongling Zeng 写道:
> ntfs_extend_initialized_size() only extends the initialized size and
> never changes the data size, but on a failure it calls
> truncate_setsize() with the old initialized size, which shrinks the
> VFS size down to it and drops the page cache beyond that point.
> 
> None of the callers rolls the shrunk size back.  A buffered write
> into a hole has nothing to roll back - the data size never changed -
> so the file keeps the shrunk size even though the data size on disk
> is intact.  The mmap and named stream callers return without any
> rollback either.
> 
> The sizes did not change, so nothing needs the shrink.  Remove it.
> 
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>   fs/ntfs/inode.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 206db4e99ef1..ac13e8776909 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -2599,8 +2599,6 @@ int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
>   	mutex_lock(&mrec_ni->mrec_lock);
>   	err = ntfs_attr_set_initialized_size(ni, new_size);
>   	mutex_unlock(&mrec_ni->mrec_lock);
> -	if (err)
> -		truncate_setsize(vi, old_init_size);
>   out:
>   	filemap_invalidate_unlock(vi->i_mapping);
>   	return err;

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

