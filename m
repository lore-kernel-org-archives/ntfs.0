Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257951;
	b=xS87pXorna8RXROVR8oKlUhOQO6A6Hhl1FGaL8DipPcaKtJNzYoDc2rSK1UeaRxmeobZ
	 mC6OcxEjt4MmF+VFki5zkpXEg4xi2t4GaTifPlDS5/6o/fSIgPixP0iRAot7K4XKBLVBS
	 TWWvdv48dIrb+9DnZpS5ppMQSZv6liEbV0jjeiOf8nBQ80Fd2PMhCNQMk6BuxbMZEnqb8
	 vcF17ZSJRcxQMFYBXIEJdxOmkRPSblmAhaGDhFAngVQFn/cIPLAK881m+7JXo9BQmp07I
	 geSWooFNlyxopoimxbwB+YAeTJMdYU7KgPWrMYEwwvZViOTbHtpt6OVkoVihuzDELDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257951;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=YE3HaUFMXr1zHYphXLYt4rfKv0I9yidvNxJtP4SlTG4=;
	b=hei+E7EJauYy3VhGiGkT3ny8y0Bjkr9faV5njal5hEiOH5B3m3rIiTX1RX4AehHOqNzI
	 U/MOnXILPZa3/5p+zZN8thf5X03aqet/sAblE2RewD/svv2+siuOvZOoYUQYbmBmbxPkO
	 r9mXqNa/m4VsTtek31pcuZe1C8mwPA4X7yxHhRhXHWsU4k22orGnucUZdVwVtOPltuKb4
	 0hetNeCG6X9SyrFyRkOUGaa3B7ggZAmBCbaAkkzWcoRxx6rX7DKkFuuayqXKppb0Rgqu3
	 bgxaI2hLP08ocxD6gKnPZ+Z5K3WoyK1FEDKh1Sd6UUyySVwCs1AGNCFFjz4lgplMBHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GYOZgeZC;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48F4606A31A
	for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 07:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D48F4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GYOZgeZC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=YE3HaUFMXr1zHYphXLYt4rfKv0I9yidvNxJtP4SlTG4=;
	b=GYOZgeZCLW/kRTBVJQyYzM2lWKL4NY3GGhuiRRHKPMefJkxwM1uxAd+py4lBkw
	Se9N4EpRA1N/3KO31Cz8Gqa1H1I1KTInjBotYwVtsB5671WXJuPLuSd2DTPz1sp1
	PLBHZxuocC3wAZKQeWTqYsFAyU0kQXfux64TLG5JHrJWk=
Received: from [IPV6:2409:8900:1fd1:c0be:78be:cbf2:dfd7:c36a] (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgBXy5bL8eJqvRzvCg--.27646S2;
	Thu, 29 Oct 2026 15:12:14 +0800 (CST)
Message-ID: <6be3a4e6-e345-4bfe-80b3-d3f4d34e6bc4@163.com>
Date: Thu, 29 Oct 2026 15:12:11 +0800
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
Subject: Re: [PATCH] ntfs: wait for bitmap folio writeback before modifying it
To: Shengzhuo Wei <me@cherr.cc>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>,
 ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, stable@vger.kernel.org
References: <20261029-b4-ntfs-bitmap-writeback-wait-v1-1-e2ba711b2dbf@cherr.cc>
 <374bf856-f880-4fa2-abec-c4b2a063bf57@163.com> <auLlFEHMZvANXUvU@kernel>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <auLlFEHMZvANXUvU@kernel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgBXy5bL8eJqvRzvCg--.27646S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr13ZF13KFWDWFWDJrWxXrb_yoW8Kw4Upr
	yftay7Kw4qqrn7ZrnFy342q3W09w48AFW7JF45WF4xArn8ZF1S9ayYgFy0vas5C397JFWU
	XF4Ska4xAw1jyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTCJQUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Q4DzWri8c5SpQAA3p



在 2026/10/29 14:17, Shengzhuo Wei 写道:
> On 2026-10-29 10:07, liubaolin wrote:
>   
>> Hi Shengzhuo,
>>     Could this deadlock during MFT bitmap
>> expansion？ntfs_mft_bitmap_extend_allocation_nolock() can recurse into MFT
>> record allocation while holding mftbmp_ni->runlist.lock.
>>
>>    With L being that lock, could we get the following interleaving?
>> A and B are $MFT::$BITMAP folios; B is outside the cached iomap.
>> Time flows downwards.
>>
>>    Writeback                        Bitmap expansion
>>    ---------                        ----------------
>>    lock A
>>    set PG_writeback(A)
>>    map A (take/release L)
>>    add A to wpc->wb_ctx
>>    unlock A
>>    [BIO still unsubmitted]
>>                                     take L
>>                                     extend bitmap mapping pairs
>>                                     need another extent record
>>                                     ntfs_mft_record_alloc()
>>                                       mft_bitmap_alloc_free_rec()
>>                                         lock A
>>                                         folio_wait_writeback(A)
>>                                     [wait for A's I/O, holding L]
>>
>>    lock B
>>    set PG_writeback(B)
>>    ntfs_writeback_range(B)
>>      __ntfs_write_iomap_begin()
>>        down_write(L)
>>        [blocked on L]
>>
>>    Cannot reach iomap_add_to_ioend()
>>    to submit A's pending BIO.        Cannot release L until
>>                                     A's writeback completes.
>>
>>     ntfs_writeback_range() obtains the next mapping before
>> iomap_add_to_ioend() can submit the pending BIO.
>>     Would we need to submit that BIO before taking the mapping locks?
>>
>> Thanks,
>> Baolin.
>>
> 
> Hi Baolin,
> 
> Thanks for the analysis. I checked the paths and agree with you.
> 
> Following your suggestion, I prepared a change to submit the pending
> ioend before obtaining a new mapping in ntfs_writeback_range(), clearing
> wpc->wb_ctx even on error to avoid resubmission. I plan to make this a
> prerequisite for v2, retaining all six waits.
> 
> One concern is that submitting at mapping boundaries may reduce BIO
> aggregation, including for ordinary file writeback. The change has
> passed object builds, but has not been runtime- or performance-tested.
> 
> Does this approach look reasonable to you?
> 
> Thanks,
> Shengzhuo

Hi Shengzhuo,

    That sounds reasonable to me.
    Clearing wpc->wb_ctx on error also makes sense, since the submit 
helper calls bio_endio() on that path.
    You could run some tests to check the performance impact.A 
before/after comparison of throughput and BIO sizes would help, 
especially where adjacent mappings are physically contiguous. Testing 
bitmap expansion alongside writeback would also help check the locking 
change.

Thanks,
Baolin

