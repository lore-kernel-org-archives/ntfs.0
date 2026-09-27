Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF4E2F8EAA
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 23:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790550259; cv=none; b=K4vX+ynWZrEezqhJgLJpQLNQZr+F2X4rg26VaheOQ5SRqdPqNymTwjsBHvQnc8X2LRkMQbRjL8ZfMt6QMIxZxfOmHH1G11uvNVoGD2R4jTq/OUdvqMf/elmn0IXywNKCgFmtbB4lGNxM2z8iL7Q6OdGMrAUzneLytjVgnw2VWKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790550259; c=relaxed/simple;
	bh=x12ekH/eBIO0WyYcyX4isGRnRpm0aA+2CF7L3xA6GEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZPNJWaOoDtaDwkSufe/oPtTruR2jH25RGyknEXh3t7aO0hDbxOgN88ePcLyPsZVYCD7s6fESH7+RB5fK6Fn1csgu1hF7qNlVxJEk+MpRj9tlbqGkqgXN1XbFdKQHJWkn+5MNj7nNAmX2nfClsVFwn9D3JO+7unRH3VAvScrpqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AdA914TX; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AdA914TX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=oP3ORZsEBaRWtddTZKbQNNI2ERTXJdkMdL9QJGqmxio=;
	b=AdA914TX7EM8Tce8XfbAZ9+Dya8Vjm4RAQgyFXsqrqhzezGzd2QG2MjEQMnx2R
	KwmJzKuKEBVyHrCTevZbI7J2za4Hs0+GcrVkF+tntu0EPjRASwEsI0r+nGJrXRwI
	sDg96FhUb3jxgJz0jhf4K5ZZhEGWe6V8PVN330Lm3l6hQ=
Received: from [IPV6:2409:8949:6ca0:7910:556a:2884:1c35:3923] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDHtLvboLlqcZH6BA--.65284S2;
	Mon, 28 Sep 2026 07:03:57 +0800 (CST)
Message-ID: <5443de08-2461-4fea-9eb2-8d53b01d7d14@163.com>
Date: Mon, 28 Sep 2026 07:03:55 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] ntfs: do not map an unmappable runlist fragment as
 a hole
To: Matthias Goergens <matthias.goergens@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <arMoap0ZgeORuktT@hyunchul-PC02>
 <cover.1790417653.git.matthias.goergens@gmail.com>
 <20260927050831.2739166-1-matthias.goergens@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260927050831.2739166-1-matthias.goergens@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHtLvboLlqcZH6BA--.65284S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFykWFy5Cr4Dtw1ftryDAwb_yoW5uw17pa
	93WrWSk390qr9FvFnFv3Wjvw1fC3s7Ja1Uury2ywnxAwnaqw4SgFyxK34IvF1rJrWxWF18
	Jr42g3yfAa9rZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2zuZUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6h1oM2q5oN33yQAA38



在 2026/9/27 13:08, Matthias Goergens 写道:
> When the extent mft record holding part of a file's runlist cannot be
> read, ntfs_attr_vcn_to_rl() ignores the failed ntfs_map_runlist_nolock()
> retry and returns with *lcn == LCN_RL_NOT_MAPPED.  The iomap read path
> only rejects lcn < LCN_ENOENT, so it maps the range as a hole and read()
> returns zeros with no error.  The first read already does this:
> ntfs_attr_map_whole_runlist() keeps the fragments it could read,
> readahead drops its error, and the next lookup finds the unmapped tail.
> 
> On a file whose runlist is split between its base record (vcn 0-214) and
> one extent record (vcn 215-1499), breaking only the extent record's FILE
> magic makes the kernel log "Failed to map extent mft record", yet read()
> returns 1285 clusters of zeros for vcn 215-1499.  A damaged attribute
> list entry, which makes the retry fail with -ENOENT, gives the same
> zeros.
> 
> Return -ENOMEM if the retry ran out of memory and -EIO otherwise.  Both
> callers already handle an ERR_PTR; other negative lcns, including
> LCN_ENOENT, are returned as before.  Reads of vcn 215-1499 now fail with
> -EIO.  An intact volume exercised with buffered, mmap and O_DIRECT I/O,
> fallocate, truncate, sparse and compressed files behaves as before.
> 
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
>   fs/ntfs/attrib.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index 333b3371acb47..a337a3429b401 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -317,7 +317,7 @@ int ntfs_map_runlist(struct ntfs_inode *ni, s64 vcn)
>   struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64 *lcn)
>   {
>   	struct runlist_element *rl = ni->runlist.rl;
> -	int err;
> +	int err = 0;
>   	bool is_retry = false;
>   
>   	if (!rl) {
> @@ -335,12 +335,21 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
>   
>   	if (*lcn <= LCN_RL_NOT_MAPPED && is_retry == false) {
>   		is_retry = true;
> -		if (!ntfs_map_runlist_nolock(ni, vcn, NULL)) {
> +		err = ntfs_map_runlist_nolock(ni, vcn, NULL);
> +		if (!err) {
>   			rl = ni->runlist.rl;
>   			goto remap_rl;
>   		}
>   	}
>   
> +	/*
> +	 * The runlist fragment containing @vcn could not be mapped, e.g.
> +	 * because the extent mft record holding it is corrupt.  Do not hand
> +	 * LCN_RL_NOT_MAPPED back to callers, which would treat it as a hole.
> +	 */
> +	if (*lcn == LCN_RL_NOT_MAPPED)
> +		return ERR_PTR(err == -ENOMEM ? -ENOMEM : -EIO);
> +

Hi Matthias,
    This check can reject valid lookups beyond allocated_size.
    Although patch 4 addresses this, could you move its 
allocation-boundary check into this patch, before the 
ntfs_map_runlist_nolock() retry?

   if (*lcn <= LCN_RL_NOT_MAPPED && !is_retry) {
   	unsigned long flags;
   	s64 allocated_vcn;

   	read_lock_irqsave(&ni->size_lock, flags);
   	allocated_vcn = ntfs_bytes_to_cluster(ni->vol, ni->allocated_size);
   	read_unlock_irqrestore(&ni->size_lock, flags);
   	if (vcn >= allocated_vcn)
   		return rl;
   }

   This would avoid introducing a regression when patch 1 is applied on 
its own, particularly for stable backports. The remaining changes can 
stay in patch 4.

Thanks,
Baolin.

>   	return rl;
>   }
>   

