Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666074772A6
	for <ntfs@lists.linux.dev>; Sat,  5 Sep 2026 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788605803; cv=none; b=DbC9zyKMfET+LA4FkWHSJ/kfxqZJTaR3R9qnHJ+00rf+QKWwTdMANHxB7k8ueEpVC5kpdMcNpwIpNhKUXJj1uYMOp7nxwa/Ltw7Qhi2QeBa8VLYTTrCCl5y0TVCskFEMcA95lNG6dV3VpRNPDSvOvJw31FrgGwq9Ua/Kuq6Egw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788605803; c=relaxed/simple;
	bh=DsPdZcpG3UyVYdEnsBsDhOX1Q7LRZuAipSOOHg2oTRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ktcf9L+sJo1BQODCkdmuEzjVg++2iz6IZAbbJTtl78MWTmeUld0+TKha+gHgCUmGJb3RFpDkNlMTcVJn/dQzMTDbk8gtl2iy9jUldzf+oxRWULQzkLyP4ChSFDJJsk0f8numCSGI9B422XzUw6dnWFFiDYiE0bHg2a6NyMLbNrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RTpJJYYE; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RTpJJYYE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=H+MDQNP+4zoBscxDSnl1ZcB0EMkc1YkGDUeMpKarj90=;
	b=RTpJJYYEoGPCH2jokNLVfCLPKUYoX6dhx4/V02rOUAzDHhIizaaoE0U32L+pA/
	2EC4Xf3yBzR0l29vBz2KRsp2FfumjeEXHTYSqxeeS+OWxyHDuwDLjWUkTX5Rd2q7
	612Al/cjaFas3gpz12JuvzsYLbCmce7lE+I/3Ua/+CNs4=
Received: from [IPV6:2409:8907:9f4b:3fe:b252:b6b3:7eed:98b6] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3vxRO9ZtqjesGOw--.17440S2;
	Sat, 05 Sep 2026 18:56:15 +0800 (CST)
Message-ID: <f841b07c-d2e7-4547-a833-101e2ff80af8@163.com>
Date: Sat, 5 Sep 2026 18:56:14 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] ntfs: fix incorrect error codes returned to
 callers
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260904090054.3365538-1-liubaolin12138@163.com>
 <CAKYAXd9V_rPOaoy2keiWxeJOf2Op=zr=c36hgJug6m+HUDhv2g@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CAKYAXd9V_rPOaoy2keiWxeJOf2Op=zr=c36hgJug6m+HUDhv2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgD3vxRO9ZtqjesGOw--.17440S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxurWfWrW8Cw13AF4xCw1xXwb_yoW5Jw1rpF
	W7A3WDKw4kAryIkFWvva42y3WS9ryftrWUKrnYg3W29a45Kwn5Xr1xt3W09rna9rZ5Gw18
	Zr40g3Wfua47ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U7Oz-UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwQ8S3Gqb9U-urwAA3K



在 2026/9/4 22:22, Namjae Jeon 写道:
> On Fri, Sep 4, 2026 at 6:01 PM Baolin Liu <liubaolin12138@163.com> wrote:
>>
>> From: Baolin Liu <liubaolin@kylinos.cn>
>>
>> Changes in v2:
>> - Patch 2: Fixed ntfs_extent_inode_open() to use ERR_PTR() instead of NULL,
>>    so it can properly propagate error codes (suggested by maintainer).
>>    Updated ntfs_inode_attach_all_extents() to use IS_ERR()/PTR_ERR() to
>>    preserve the actual error code from ntfs_extent_inode_open().
>> - Patches 1, 3, 4, 5: No code changes, added Reviewed-by tag from Hyunchul Lee
>>
>> Five places in fs/ntfs/ return the wrong error code: a real errno is
>> replaced by -1 or by a hardcoded substitute, so callers and userspace see
>> something unrelated to what actually went wrong. The fixes are
>> independent of each other.
>>
>> Patch 1 is different from the rest: there the error is not just
>> mislabelled, it is not seen as an error at all. -1 is what a normal
>> comparison returns for "collates before", so ntfs_ie_lookup() acts on it
>> as a tree-descent hint, and a malformed entry in $Reparse/$R or $ObjId/$O
>> is silently treated as a lookup miss instead of being reported.
>>
>> Patch 2 fixes ntfs_extent_inode_open() which had two bugs: it treated
>> map_mft_record() failure as success, and returned NULL for all errors
>> (losing error information). Now it returns ERR_PTR() with the actual
>> error code (-EIO, -ENOMEM, -EINVAL).
>>
>> Patch 3 fixes a -1 return in inode.c that reaches userspace as EPERM.
>> It loses ENOSPC among others, so a full volume misreports create(),
>> mkdir() and link().
>>
>> Patches 4 and 5 restore errors that are already available as an ERR_PTR.
>> Both collapse -ENOMEM into something else, so an allocation failure is
>> misreported.
>>
>> No control flow is changed; every callee already returned these codes.
>>
>> Based on ntfs-next (0fecc393f206).
>>
>> Baolin Liu (5):
>>    ntfs: return -EINVAL from ntfs_collate_ntofs_ulongs() on bad length
>>    ntfs: fix error handling in ntfs_extent_inode_open and propagate errors
>>    ntfs: preserve the truncate error in ntfs_enlarge_attribute()
>>    ntfs: propagate the map_mft_record() error in ntfs_attrlist_entry_add()
>>    ntfs: propagate the ntfs_attr_iget() error in update_reparse_data()
> Applied them to #ntfs-next except 0002 patch("ntfs: fix error handling
> in ntfs_extent_inode_open and propagate errors").
> Thanks!

Hi Namjae,

   Thanks for applying them.I'll send the 0002 patch alone as v3.

Thanks,
Baolin.


