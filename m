Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784816;
	b=2ki8k9B4aFkvEFjoL7uEKzphvpxARo6/vfzSq+rM0Zb4Jr+I/waLMR/qEzyl4i0cqJOn
	 /MzxgYIvjB4FJh3bThkoTspddq5+IUgsGky/kuavapOX17fKU0WSN5xIkamHJR4gR1NIR
	 Ojg5yt/+1K6g/QjdgIBZOOARNlIQDeMK6Oy1HQQflC++BoLagNz1veTH9MXGfHlXEjZhV
	 hC6reDbsQ5UEAAVYmeZMZTokvEdrc22yPmf19ozNuqp0dl+CjhruGzWSbIk7tfga/p1EM
	 12G3T5IcYHa1/y5uIYL48HRsvkdEz/2Rkyvnka04xxr7GeLA8WDpRFLMD7ck2vdo/rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784816;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=+9cDYXx0ggftXxc5g0vmsXvGR5C4OLG8lrN8nFMbIqw=;
	b=b8ZMJZzdcvxo/Lb/8aN3CcrRGAukXPtwvkviFTagZx0c7FYldI3yU0NroQckNO60jHYT
	 KUsJByGY72AbUJpyxsO9ldBnatCttvIqD94i2cdyDf07xINzyKvmyaSxbAcxYjdGj9dEG
	 h9dCFRkp0LQsyC0BXL+2uMqPGDLPjnC34rsO5KW6IquJVR3YB2xFZutqkK8YK1d/Ul//K
	 CrP1oYOjCU4gtynzMbFYtylMWRLF6rDZ7p/0FvNdWGlEC9F0ULlXkFIajmWsr4g9yMSeW
	 3KG8dATlKAP+oYCNvFoHXJlZwvCKWyduvHuWmaVU1rI9KFXooLkXU56BT7cvM8Q9Axw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ClQ9gyWl;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA17606A328
	for <ntfs@lists.linux.dev>; Wed,  4 Nov 2026 09:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA17606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ClQ9gyWl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=+9cDYXx0ggftXxc5g0vmsXvGR5C4OLG8lrN8nFMbIqw=;
	b=ClQ9gyWl1twOpBCN2mY580tl+JXv5jEoBuhP8uKZlT+i4lH91i4OyEqtZlitmT
	Z2pTFhPOOo5G+u/dfr1yWdHWdaiOze0nk3a2HTgOdY4O5uUtbqM51lxZJrfi70yT
	5pBo57yBFOw5jT3KOkhnHpsEoSqk7N/WprjEwoThU4xTg=
Received: from [IPV6:2409:8900:1ec1:a6a9:a9ca:f9ce:1857:1c64] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wA3_MvJ++pqogRYEw--.3057S2;
	Wed, 04 Nov 2026 17:32:59 +0800 (CST)
Message-ID: <df161e1a-7d41-4b53-875e-5c47b7b51193@163.com>
Date: Wed, 4 Nov 2026 17:32:56 +0800
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
Subject: Re: [PATCH v2 4/5] ntfs: write unlinked file attributes before
 dropping their cache
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Xuewen Wang <wangxuewen@kylinos.cn>
References: <20261031052857.1542936-1-liubaolin12138@163.com>
 <20261031052857.1542936-5-liubaolin12138@163.com>
 <CAKYAXd-ec8ve6HD5eBJik-LF4PUhZjV7y0c52E2xpALLFA=j2A@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CAKYAXd-ec8ve6HD5eBJik-LF4PUhZjV7y0c52E2xpALLFA=j2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3_MvJ++pqogRYEw--.3057S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWkuFWUJw1xKF4rJF4fXwb_yoW8JFWxpa
	yrC3srKr4DtrWIga92va15Ww1F9FWxGrW5XrykJrsrA3s5XFnrtFy3t340y3Z3tr95u3yU
	XF409347AFZ0vFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U24iUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QuGUWrq+8ueAAAA3b



在 2026/11/4 17:06, Namjae Jeon 写道:
>> @@ -4052,6 +4052,14 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
>>
>>          WARN_ON(!NInoAttr(ni));
>>
>> +       /*
>> +        * Attribute inodes of an unlinked file have no links either and are
>> +        * evicted at the final iput(). Do not leave their data in dirty pages
>> +        * that eviction would discard while the base file is still open.
>> +        */
>> +       if (!VFS_I(base_ni)->i_nlink && !ntfs_inode_is_named_stream(ni))
>> +               sync = true;
> This misses data dirtied by ntfs_attr_make_non_resident(). For
> example, with 1 KiB MFT records, create an O_TMPFILE, nearly fill
> its MFT record with a resident EA, then write 4 KiB to the file.
> Growing $DATA can force ntfs_resident_attr_resize() to convert
> SECURITY_DESCRIPTOR to nonresident form to make room. the conversion
> only dirties the folio. With patch 5, the subsequent
> iput(tvi) can evict the zero-link attribute inode and discard the SD
> contents before writeback. If the file is later linked with linkat(),
> it can retain invalid SD data after close. Please also ensure that the
> converted data is written back before dropping the last
> attribute-inode reference.
> 
> Thanks!

Hi Namjae,
    Thank you for the review. I will fix this issue and send v3 soon.

Thanks,
Baolin.

