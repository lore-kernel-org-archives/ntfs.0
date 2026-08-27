Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2B93112B2
	for <ntfs@lists.linux.dev>; Thu, 27 Aug 2026 06:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787813421; cv=none; b=QvuB3uUdD6iNWMYhGKyofxYdQ+UV/NXAs5YvLmQuSFL1JSaDEVFTLYTxZWffGEfGDMFlXHqoN4KR9TS0JednBHwu8IvUcrx2GBCvqlmcmpNTy7oKn6tCdFnb6LU6WW/4jcTHmybqx2bJuWpWn6iroRhe903kwNq2ccSOiGbb77M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787813421; c=relaxed/simple;
	bh=hv+xlhgHQqFoGGetKUqiilEVfE/MVrK3vbsngmt+m8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kpI/f/aDRbw8v9M/+jRu49EVOguAUhkvpWhVkX5D7O+31f/4KqXXRCoSpNKu45gSncN8GGbS/yitAK6CiqOek56fD7EFsfPOuO4XC4R+yPmeWKD3II23bw2bjJ8y9PvH2BPQVf7NJ1wT7kJ+UQkL4Df9zuLjn1lyzIAqRInUo6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FYuu7vE5; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FYuu7vE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=2tmet0Taqk062cGPdarBxbGdQBHmdXGdZ0eRNqncnmM=;
	b=FYuu7vE5RqZnTufIev7meJpy3SbF1FlUCTT1lvWBNrj0eMXZxdKvRZZSO8yo45
	AGnvg+TanTeQQYelffciyDm0YnS/HrtIKJCdekPfqnRK7jju2RnDnCMgESMbpAIq
	WOMie9sIWPKlX4fjWtXvOnWUim2d3/QDhVgHy7stImKGM=
Received: from [IPV6:2409:8900:1ef4:8f82:6a1b:f1a6:cbdd:11fe] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3HrIX3o9q5yLmOQ--.48857S2;
	Thu, 27 Aug 2026 14:50:01 +0800 (CST)
Message-ID: <85040eb1-03d4-487b-b2ee-a8b9d44a63ce@163.com>
Date: Thu, 27 Aug 2026 14:49:59 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/9] ntfs: assorted error path fixes
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 liubaolin12138@gmail.com, Baolin Liu <liubaolin@kylinos.cn>
References: <20260821053238.1281310-1-liubaolin12138@163.com>
 <CAKYAXd8gPPzMuKxrwXAUyLC88=uUNbUK-EoRWKWrKwNxXcKH6Q@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CAKYAXd8gPPzMuKxrwXAUyLC88=uUNbUK-EoRWKWrKwNxXcKH6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgD3HrIX3o9q5yLmOQ--.48857S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFWDKF1ktrykKw1ktw1xAFb_yoW8Xw4kpr
	WxtFyDKw4qvr17AF92y34UAay0v3y7Cry8Xw45Gw1Ivw15Gr1ftrWrtF1jqr95KryrCw42
	qrWUu34fu3WUuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4v35UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hk8B2qP3hkYlgAA3k



在 2026/8/26 19:21, Namjae Jeon 写道:
> On Fri, Aug 21, 2026 at 2:32 PM Baolin Liu <liubaolin12138@163.com> wrote:
>>
>> From: Baolin Liu <liubaolin@kylinos.cn>
>>
>> This series fixes a number of problems on error paths in the ntfs
>> driver: errors that are swallowed or collapsed so operations report
>> success or a wrong errno (patches 1-6), a kmap_local leak (patch 7),
>> and free cluster miscounting on failed frees (patches 8-9).
>>
>> Baolin Liu (9):
>>    ntfs: return DT_UNKNOWN on inode lookup failure in readdir
>>    ntfs: fail EA update when reading $EA_INFORMATION fails
>>    ntfs: propagate reparse index insertion failure
>>    ntfs: return -ERANGE for undersized xattr buffer
>>    ntfs: preserve error code in ntfs_resident_attr_record_add()
>>    ntfs: return real error from ntfs_non_resident_attr_record_add()
>>    ntfs: fix kmap_local leak in write_mft_record_nolock() error paths
>>    ntfs: only count successfully cleared runs when freeing clusters
>>    ntfs: skip free cluster decrement when rollback fails
> 
> Applied them except 0002 patch to #ntfs-next.
> Could you please recreate 0002 patch based on the #ntfs-next branch?
> 
> Thanks.

Hi Namjae,

    The 0002 patch has been recreated on top of ntfs-next and sent as
    "[PATCH v2] ntfs: leave HasEA flag untouched on setxattr failure".

    Note that the subject changed: on ntfs-next, the -EIO return for a
    failed $EA_INFORMATION read is already handled by 56cc42a7b387
    ("ntfs: return errors from ntfs_attr_readall"), so only the HasEA
    flag part of the original patch remains.

Thanks,
Baolin

