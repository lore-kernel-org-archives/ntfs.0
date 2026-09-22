Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5293C0A0D
	for <ntfs@lists.linux.dev>; Tue, 22 Sep 2026 03:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047613; cv=none; b=JuknOgQRqEh2NhvnEYbTpT3oWZ4dLQuWimNGJIjbhyx5gFbcsZDZyrRWCx5i86AWw9GN+OIXfVd/HB3gkORktLCtGadEfStUYeFmsKcZVekX9y/clOV35dJf2b9KCSDqk8mZkdyiDh7dyhwGLsxGkvF6PWaRoBsQA+4TgHcztPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047613; c=relaxed/simple;
	bh=fZDVty2EKFGT2meCsgAbV182pHvpPGGPcvRq1sWrHbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ikzi/cdTZgUfim/SKfwfs2PFDtG5lE3+T0e0LgJ3iPL2aZZFPiGry82xPcCSKvslG/1eg+dsmvFX+3L5tAK1PSpiFYNScLrFn4ryIh1PTTwyStUNtWXbd8Ansi1LrI9E2sJBkL92kKnBkA91rlCZD1H9BB7b9C5GN+WjV0vBqJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JoQZsO8E; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JoQZsO8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=DbHU6Xh+kKVndfxKWDba1TS+MCuF9hZWRIjfYoNwB4w=;
	b=JoQZsO8EnXnImohg/JrRGwZexc6cGozupjMeEf6IBQAvbQ07p31HBhipmv0Vi3
	JDy3a42M8quGZr3O+fvmSoV/xGlyzlwslIibW5qd0YPZDeC+UKWlUIliq9gmSspK
	sOzu407IL/gOEuvMZpSaaqk7zznQitovuMoJEqnIs/8vY=
Received: from [IPV6:2409:8900:1ee3:222c:420f:a5a2:eb51:8645] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAX6Edb9bFqDmPqAg--.31447S2;
	Tue, 22 Sep 2026 11:26:21 +0800 (CST)
Message-ID: <250dd5e5-4a4e-4547-b205-f0b52bae4775@163.com>
Date: Tue, 22 Sep 2026 11:26:19 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] ntfs: persist immutable in the $LXFLAGS EA
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, chenxiaosong@chenxiaosong.com,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260920083131.1880061-1-liubaolin12138@163.com>
 <20260920083131.1880061-9-liubaolin12138@163.com>
 <CANFS6bajYthoK3asS3PmfU+9aocdsHS9ZFaUhmiKV5BfbaygeQ@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CANFS6bajYthoK3asS3PmfU+9aocdsHS9ZFaUhmiKV5BfbaygeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgAX6Edb9bFqDmPqAg--.31447S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyDtF4UAFy8JFyfWF4rZrb_yoWkJrc_X3
	y093s7tw4DJr1UuFs5JFs2qFsxGFs7Zr98Z340qw17A3s5tF1DXwsrAFZrKr18JF4UGrWY
	9F4DZFZYkF1a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj8R63UUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6R2bZmqx9V0bXwAA3+



在 2026/9/22 09:21, Hyunchul Lee 写道:
> Hi Baolin,
> 
> 2026년 9월 20일 (일) 오후 5:32, Baolin Liu <liubaolin12138@163.com>님이 작성:
>>
>> From: Baolin Liu <liubaolin@kylinos.cn>
>>
>> Add a fileattr setter for immutable and store its state in bit 0 of a
>> little-endian u32 in the private $LXFLAGS EA. Reuse the standard NTFS EA
>> attributes and restore the flag when loading an inode, so eviction and
>> unmount do not discard the setting.
> 
> 
> I think that the name $LXFLAGS is not appropriate. the prefix $LX
> seems to be a WSL-owned namespace. The name could cause
> confusion or a future semantics collision with Windows WSL.
> 
> Thanks,
> Hyunchul

Hi Hyunchul,

   Thanks for pointing this out. I agree that we should avoid the $LX 
prefix to prevent confusion or a future semantics collision with WSL.

   Would $LINUXFLAGS be an acceptable name for this private EA?

   If you agree, I'll update the code and documentation, rerun the 
relevant tests, including the Windows NTFS and CHKDSK compatibility 
tests with the new name, and submit the revised patches as v4.

   I look forward to your feedback.

Thanks,
Baolin.

