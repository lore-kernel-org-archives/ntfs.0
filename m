Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7068C34F49F
	for <ntfs@lists.linux.dev>; Wed, 26 Aug 2026 12:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747670; cv=none; b=QyaQ0ZGSi6GnDbNeVEytOthfEv8t70oeHv2kssomu4zX+IuOhsEYFk7+WXOW1aGMov+9EsnqlYvi+Wpj8YFhCQd946doWk2x4JcB87ZQmmAFceK3h6pHR/L3oXDg40IYNmFYRJHReeeu1rV/8In7IDwPVjgK/YRYDWRZ3783WWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747670; c=relaxed/simple;
	bh=wjW/4PVqkeidscqTj4m5J+vUCnzRJ2ZRePrrQAuM2Po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SApI5pJ4DF1VvfBOWcttPAXXGNuhP3ZEU+ya74lU1VivuBvtTSk4Peox/j/rswTDolhhC2OrYahMumK7jvDGmLQVjrlKskZBPbCgY9JH/6qOp5+x7FHmjL1l58q1U06J1u7J4qjTfRQmXBk2SV3qV1QOJ+YLviTPGQSAaMY2XH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=P64Bxo8q; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="P64Bxo8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=enAlStz1dRwFqpdDOX0WTjoy5hJTKtSaqkuqMlUN7Kk=;
	b=P64Bxo8q1Qo/lCaXVrFyTcosGIDt0H9RFD5KqDkBgLrknThrO0h6+9si9J4gGZ
	kck8BQM3eqQm+pOqa2g+z5fCvcUE6ROBfFQOEo3D1diRdIjQybxDKUfjfbovXpG+
	l52S73AU4bHvxb3fHjCj5UOhb4SFdifdQYsX+edwNKoUI=
Received: from [IPV6:2409:8900:1ef9:dee:fd7d:3170:e603:8258] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBXX8w53Y5q7xK7RQ--.20797S2;
	Wed, 26 Aug 2026 20:34:02 +0800 (CST)
Message-ID: <7df4b5fd-f020-48a2-9675-92034702374e@163.com>
Date: Wed, 26 Aug 2026 20:34:01 +0800
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
X-CM-TRANSID:_____wBXX8w53Y5q7xK7RQ--.20797S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFWDKF1ktrykKw1ktw1xAFb_yoW8Jw4Upr
	WIyFyDKw4qvr13ArZFy3yUA34jv3y3Gryvgw45W3yI9w15ur1SyrWSgF4j9r95KrZ8Cw47
	XrWUu34fu3WUuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2iiDUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhrDjmqO3Trs+QAA3D



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

Thanks for reviewing and applying the series. I'll recreate patch 0002 
based on the current #ntfs-next branch and send it shortly.

Thanks,
Baolin.

