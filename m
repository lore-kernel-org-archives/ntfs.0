Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9353EDAD5
	for <ntfs@lists.linux.dev>; Thu,  3 Sep 2026 06:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417858; cv=none; b=QyUqjQBOKcP/Mg/NNKI+mqPTQMIONkJfH9LLK51FJ006pCljygsCMM7N82XVCO5It2lvpJ+2gbCcxPvUUH1NB51n7QIkpUnGaohYafw603FTC+/aIgwSu17/kHe7P7FHSpK57GWrZ1tcrrC1vEDx4FciiPta0aHSANvuvER+GSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417858; c=relaxed/simple;
	bh=+MJLtmpKs8LfijQlakiY6CcLUdsjPzuFuzy0PLP/nJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OQZ5io3iJBRvTc6tNTCsqbm7jImA45PgPZdlgCuO4DoLXJYhPpWGzTI9Ms5eEiM9wkl8AbAb4FzJai9WUFLMIJ/1rrUiVz+dMFdSlqLtCqfCYVCRkZ839GtNi8aKjQc4zKFjEqHEt5Tv1fHr1LANBJP9qOlgdv82GZ/lv8gFVEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LR9N2vZr; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LR9N2vZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=i02KUwoNEH8EXamT0RYTRYzZX/RjzaxJUQGYXyQ2bk8=;
	b=LR9N2vZr/n1KwmTn/D0W7lVP8qA6HeL/z8jHRSkDW5Fc7p9gCa3NGGdNgnpcXi
	9sUC075yQ6MN4kASFctSi7pvbRgYZvNt4zhWZJQlmp1bEp3+HUzis9bm2mgKZ4Wx
	qGMSAMKopOPnSU5ZvTfvoKYjE0/43vf20SL/Xd0PLBNeU=
Received: from [IPV6:2409:8900:1a96:d5f:b0d5:8955:9102:74c7] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wB3buIpF5lqXtlRAQ--.50466S2;
	Thu, 03 Sep 2026 14:43:55 +0800 (CST)
Message-ID: <4c2bdc40-2d2d-49a4-8821-410b4a7382c8@163.com>
Date: Thu, 3 Sep 2026 14:43:53 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ntfs: return -ENOMEM from
 ntfs_inode_attach_all_extents()
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
References: <20260902073249.3035977-1-liubaolin12138@163.com>
 <20260902073249.3035977-3-liubaolin12138@163.com>
 <apkE3nzoVd0raTde@hyunchul-PC02>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <apkE3nzoVd0raTde@hyunchul-PC02>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3buIpF5lqXtlRAQ--.50466S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyDJr1DJr17ZF4xKryxuFg_yoW8Ww1fpr
	Z7uF10kw4jv342kFyvvFs8t34F9ay7Kr4UGr1qvw17Z3Z8tw1IqF1vyrn2gF9YyrZ2k340
	vr48CF47WFyUZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR-18dUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwQvQm2qZFyvnLAAA3F



在 2026/9/3 13:25, Hyunchul Lee 写道:
> On Wed, Sep 02, 2026 at 03:32:46PM +0800, Baolin Liu wrote:
>> From: Baolin Liu <liubaolin@kylinos.cn>
>>
>> ntfs_inode_attach_all_extents() returns -1 when ntfs_extent_inode_open()
>> fails, and both callers propagate it unchanged, so userspace sees EPERM
>> from setxattr, reparse point creation and directory index updates on
>> inodes with an attribute list.
>>
>> Both paths that return NULL here are allocation failures: the
>> kmem_cache_alloc() in ntfs_new_extent_inode() and the kvzalloc() that
>> grows ext.extent_ntfs_inos[]. Return -ENOMEM.
>>
>> Fixes: af0db57d4293 ("ntfs: update inode operations")
>> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
>> ---
>>   fs/ntfs/inode.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
>> index 5aedc045f65a..747a60ae27c9 100644
>> --- a/fs/ntfs/inode.c
>> +++ b/fs/ntfs/inode.c
>> @@ -3025,7 +3025,7 @@ int ntfs_inode_attach_all_extents(struct ntfs_inode *ni)
>>   				prev_attached != MREF_LE(ale->mft_reference)) {
>>   			if (!ntfs_extent_inode_open(ni, ale->mft_reference)) {
>>   				ntfs_debug("Couldn't attach extent inode.\n");
>> -				return -1;
>> +				return -ENOMEM;
> 
> Could you also fix the error handling of ntfs_extent_inode_open()?
> It treats the failure of map_mft_record() as success. If we would
> fix that, this patch would incorrectly convert every failures to
> ENOMEM.
> 
>>   			}
>>   			prev_attached = MREF_LE(ale->mft_reference);
>>   		}
>> -- 
>> 2.51.0
>>
> 

Hi Hyunchul,

   Thanks for the review.

   I'll fix both issues you mentioned in v2 and send it soon.

Thanks,
Baolin

