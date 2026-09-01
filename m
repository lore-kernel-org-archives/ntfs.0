Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA705470EB5
	for <ntfs@lists.linux.dev>; Tue,  1 Sep 2026 09:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256127; cv=none; b=QqMDLv3DcRPcZfGbudTvZpTL139Ab50ns78LK8gLKpCSuIP2bsJBTUuuU6PozOJkHt17M7VLBBRoNIYlC0j5NyjAFzLhx7Jxc6/qAcD9L+b8mJLAxzHerSmk0zbgx9dVyD/KjaH+aX31nENcoWfcAwaDLJxjC7l8vn8zqbgEh7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256127; c=relaxed/simple;
	bh=KaKHTjJP6maqXyyFZTupgoIGA05+0Mx9hjqgSw5vu1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0b8NtFD3wNvzY7afA32jVZLm9pREjHhbLlWH4KZkwk2zp7tTRunv/TaDIyNFDzRVQzbw+XVr9fWKo1TKwlfzP5O1O6wV6W+3uko44YlKluSjIElJhi5EEZzDu/vFS0Dad2CUvWQq+g9xLRNUy2jTxwaL17KmejQlKdRqM0oU9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PeKbWsFV; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PeKbWsFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=bpoxNlNsE/rnv3QgKo3WpL5jXF0IhTodGTVdgaDxGnM=;
	b=PeKbWsFV88ZGzH585opFniKKg7sx5ET495H3CKRy524vAuMgGI45qPPODeY8vA
	fxLUXs5qQWqWCkPIuGdAg3sVLn74wnRQ0BIh2iEMKfvBR7aQK+gEwIFHBol6E2Cj
	Poftaou4q/osgoJsR50CXtnq5aaG/G8bqletBQSE+mwJE=
Received: from [IPV6:2409:8900:1ef4:8f82:70cd:c8db:75a7:b1e2] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAnZ6Zmn5ZqRFLNTQ--.49450S2;
	Tue, 01 Sep 2026 17:48:25 +0800 (CST)
Message-ID: <cbe8b022-dbe0-4696-8a97-633ee9ba664b@163.com>
Date: Tue, 1 Sep 2026 17:48:22 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ntfs: report volume errors to fsnotify
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, liubaolin12138@gmail.com,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260826122734.2129830-1-liubaolin12138@163.com>
 <20260826122734.2129830-2-liubaolin12138@163.com>
 <CANFS6ba-=yXwSrA+NGnnZ84Yffmm-gNrAWEWpyjdC5fazWSXxw@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CANFS6ba-=yXwSrA+NGnnZ84Yffmm-gNrAWEWpyjdC5fazWSXxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnZ6Zmn5ZqRFLNTQ--.49450S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyfJFyxXr47Kw43tr4xWFg_yoW8urWUpF
	WkCan3KFWkJry7WrnI9rWavFsYg34xWa1Utr13tw1xXrn5tr1DtFs2vw1FgFn29rWvgw4I
	qF1jgr93WFZ8Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2-erUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwQlCDWqWn2kucQAA3S



在 2026/8/31 14:38, Hyunchul Lee 写道:
> Hi Baolin,
> 
> 2026년 8월 26일 (수) 오후 9:28, Baolin Liu <liubaolin12138@163.com>님이 작성:
>>
>> From: Baolin Liu <liubaolin@kylinos.cn>
>>
>> The ntfs driver reports volume corruption only to dmesg. Wire up the
>> generic fserror infrastructure at NVolSetErrors(), the point where the
>> driver concludes the volume metadata is inconsistent, so that an
>> FS_ERROR event is emitted as well. This lets health monitoring daemons
>> watching the mount with fanotify(FAN_FS_ERROR) learn about corruption
>> without scraping kernel logs.
>>
>> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
>> ---
>>   fs/ntfs/super.c  |  8 ++++++++
>>   fs/ntfs/volume.h | 14 +++++++++++++-
>>   2 files changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
>> index cd8fa2c13370..5229eb27bb30 100644
>> --- a/fs/ntfs/super.c
>> +++ b/fs/ntfs/super.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/sched/mm.h>
>>   #include <linux/fs_context.h>
>>   #include <linux/fs_parser.h>
>> +#include <linux/fserror.h>
>>
>>   #include "sysctl.h"
>>   #include "logfile.h"
>> @@ -330,6 +331,13 @@ const struct option_t on_errors_arr[] = {
>>          { 0,                    NULL }
>>   };
>>
>> +/* Mark the volume as corrupt and notify fanotify(FAN_FS_ERROR) listeners. */
>> +void NVolSetErrors(struct ntfs_volume *vol)
>> +{
>> +       set_bit(NV_Errors, &vol->flags);
>> +       fserror_report_metadata(vol->sb, -EFSCORRUPTED, GFP_ATOMIC);
>> +}
> 
> NVolSetErrors() is also reached when some functions
> return -EIO. Could you preserve the original errno?
> 
> And in some situations, fserror_report_file_metadata()
> can be useful instead of fserror_report_metadata().
> 

Hi Hyunchul,

   You are right, reporting -EFSCORRUPTED unconditionally loses that
   distinction - a media failure and genuine metadata corruption should 
not look the same to a listener.
   Agreed on fserror_report_file_metadata() too, several call sites do 
have the inode at hand.

   I will rework the implementation along both lines and send a v2.
   Thanks for the review.

Thanks,
Baolin

