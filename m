Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467BE441633
	for <ntfs@lists.linux.dev>; Sat, 26 Sep 2026 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790427189; cv=none; b=HR8u/XHI5NGeZHhDQUH2Iv5krYAhA1LtmAIeKdrJeIZ8hh2OoxEOauxTwjLOYSqLT9D1BeOsUTAoSJos6YzoyIdOyGeBxhexMYP/FuuRDq12BW3GEm1++wAOc7z2x4N3T9j81k8JlUItg20HnWVNl2Nilz7oR8gzdkrYMhpyzQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790427189; c=relaxed/simple;
	bh=A9HS+gVdZjcLNBnpHSlruVJ50737lR2r9B8OkSSYKS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPqppc0o9ggxVBE54yCDRJiYhwWXExIjLd9/VvRo2H4odHsIK5kMasj+lt3y5WyPHCnEuV1Fhq2iJ+T8ROziFshaNxHGEY0ooakAw/f5wR+E91OUDRNhO/RzFEQ7F3JQ8ZuDfYUCdPIdk1drTGeajg1XExNsj4nPN7ulgZqs6ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=G++K7qqr; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="G++K7qqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=0jkTHyU0InToqzfGvkxHo0JwF3ptW4i16rlCzwab6pU=;
	b=G++K7qqrDBe9HT+NdLqOAZiFY+RdZQO8SCHrHnBMQw4qKeZByQZA9DulnZyFrQ
	MgtjQif/l5TkE2BbrjwLGLPv3k9YbZG/2R5jp79vSHU+5ARYPKQbBC3G4wXmTWkX
	VHoncDBpBI+gWQQF3leyM3gjuTIjocjEVZMWwdZYMwjAE=
Received: from [IPV6:2409:8949:6ca0:7910:cfbd:ff70:c0fd:a387] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnz8sRwLdqhP+xAw--.23214S2;
	Sat, 26 Sep 2026 20:52:34 +0800 (CST)
Message-ID: <285c4581-ee1b-4963-9741-ed44c9ad2583@163.com>
Date: Sat, 26 Sep 2026 20:52:32 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] ntfs: report shutdown errors to fsnotify
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
References: <20260924090102.2865942-1-liubaolin12138@163.com>
 <20260924090102.2865942-7-liubaolin12138@163.com>
 <CANFS6baY+nbdzux-pF-MZ+8ryP8Q34RyO0Rh4qVR7rqvjsPHbg@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CANFS6baY+nbdzux-pF-MZ+8ryP8Q34RyO0Rh4qVR7rqvjsPHbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnz8sRwLdqhP+xAw--.23214S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr4fWr4fXr45uFWxCw15urg_yoW5XrykpF
	97AFnIkwsrXF129rsFqw43AF1Svas29w1UKr17Gw1Igr4vkr18tF4vkF1F9F4F9r9Y9w48
	Z3WjganxurW7ZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UliiDUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwRK8h2q3wBKuhAAA3N



在 2026/9/26 08:40, Hyunchul Lee 写道:
> 2026년 9월 24일 (목) 오후 6:02, Baolin Liu <liubaolin12138@163.com>님이 작성:
>>
>> From: Baolin Liu <liubaolin@kylinos.cn>
>>
>> Notify FAN_FS_ERROR listeners when NTFS enters forced shutdown after
>> FS_IOC_SHUTDOWN or backing-device removal. Keep the shutdown state
>> transition and notification together in a dedicated helper.
>>
>> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
>> ---
>>   fs/ntfs/super.c  | 12 +++++++++---
>>   fs/ntfs/volume.h |  1 +
>>   2 files changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
>> index a7a7ecf9d074..a0d3934ef6c8 100644
>> --- a/fs/ntfs/super.c
>> +++ b/fs/ntfs/super.c
>> @@ -414,6 +414,12 @@ void ntfs_report_file_metadata_error(struct inode *inode, int error)
>>                  fserror_report_file_metadata(inode, error, GFP_ATOMIC);
>>   }
>>
>> +void ntfs_report_shutdown(struct ntfs_volume *vol)
>> +{
>> +       NVolSetShutdown(vol);
> 
> Could we call test_and_set(NV_Shutdown, &vol->flags)
> to avoid races?

Hi Hyunchul,
    Thank you for pointing this out. I'll use test_and_set_bit() in v4 
to avoid duplicate shutdown notifications from concurrent callers.

Thanks,
Baolin.

> 
> 
>> +       fserror_report_shutdown(vol->sb, GFP_ATOMIC);
>> +}
> 
> we can avoid test_and_set() to prevent race
> 
> 
>> +
>>   void ntfs_handle_error(struct super_block *sb)
>>   {
>>          struct ntfs_volume *vol = NTFS_SB(sb);
>> @@ -430,7 +436,7 @@ void ntfs_handle_error(struct super_block *sb)
>>                        sb->s_id);
>>          } else if (vol->on_errors == ON_ERRORS_CONTINUE) {
>>                  if (errseq_check(&sb->s_wb_err, vol->wb_err) == -ENODEV) {
>> -                       NVolSetShutdown(vol);
>> +                       ntfs_report_shutdown(vol);
>>                          vol->wb_err = sb->s_wb_err;
>>                  }
>>          }
>> @@ -2086,10 +2092,10 @@ int ntfs_force_shutdown(struct super_block *sb, u32 flags)
>>                  if (ret)
>>                          return ret;
>>                  bdev_thaw(sb->s_bdev);
>> -               NVolSetShutdown(vol);
>> +               ntfs_report_shutdown(vol);
>>                  break;
>>          case FS_SHUTDOWN_FLAGS_NOLOGFLUSH:
>> -               NVolSetShutdown(vol);
>> +               ntfs_report_shutdown(vol);
>>                  break;
>>          default:
>>                  return -EINVAL;
>> diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
>> index 366e9f5d0443..648fe8991304 100644
>> --- a/fs/ntfs/volume.h
>> +++ b/fs/ntfs/volume.h
>> @@ -256,6 +256,7 @@ DEFINE_NVOL_BIT_OPS(SymlinkNative)
>>
>>   void ntfs_report_metadata_error(struct ntfs_volume *vol, int error);
>>   void ntfs_report_file_metadata_error(struct inode *inode, int error);
>> +void ntfs_report_shutdown(struct ntfs_volume *vol);
>>
>>   static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 nr)
>>   {
>> --
>> 2.51.0
>>
> 
> 
> --
> Thanks,
> Hyunchul

