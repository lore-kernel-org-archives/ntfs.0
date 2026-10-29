Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238566;
	b=3TvVzBpoLRD0W8dGH49+un/z9WKWSG7CMGKD5BPoGiDeTmj84lpP1ZBeeDSfnUObohBN
	 Zlj/xsPFAUvNw6Pe4iu3aqxP7EYO0NBv+PSOFvpifpF73JbqQm0BGlvqVQtE4nkoiHm1b
	 IEFigMHWSTLWgkmngc+BJIuBALD2xwCJtsLXWRAdN1yzfjSSCdWscluIui6rF/4sREjVC
	 h5Nq4CwKaPhIOxanYODjE1nt54tXu73me1TQi+uTj6NasqbN188NAtCMlM++u9xO/Tw0C
	 76SGBga0dqovnvU1cjp4uzuFj1esOWgkucLRspYwDtdWPNFdRs4I7jDbCK+ZlUwLKbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238566;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=7Y+Nxfb8E05KTxopERSwje+mXc60ODixr4br2J1rWwU=;
	b=SufCtwkI6ARVlvPI/sqCZa76JBcOCvytMwgTdHJ91bZzk2Izu2Jm0P1lzgot6wp8B542
	 uLbXWFIqFoYXFaBWdFN92IJiuvL1Wxtl8FMz3ktlykNXZVIbV8MglIYk3oK5S8f36ohgN
	 LB4EWgCuKZDVmUInX8Dj6Hb5N1AQKJ4b6uVGfXMo6J6OXruarfdxWTiTHGrg3S0dtignP
	 /BoLgZPP/CloLobq6Q0ozb5Qa7pj5KngKdGiykrj6zCUKZv3IzTCHsuzq+SdUjwrtWCgQ
	 DAo2h4NJR2vswqcoMwWq9ghgJfrDXXoqN9QDNLdClXko4KXMSJM8D7NaIEKdIl/UefA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lt0QuNJd;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12D8606A31A
	for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 01:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A12D8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lt0QuNJd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=7Y+Nxfb8E05KTxopERSwje+mXc60ODixr4br2J1rWwU=;
	b=lt0QuNJdH5MqHGb/zQn/Kn1SQqpe8KXWcSeEKkgMR6RwnD6VYXKz0AT+KHRr8E
	IV2ECi7FZpOsguxYBpwFllUhPbkWhJ1Zc1L7tTcnBdIzv1LtGAtzXhvlSlTB2IY4
	vEsc9ecmvqEiBlyQaOhLnf/vit+cPbesaUqnrxxp8cKX0=
Received: from [IPV6:2409:8900:1fd1:c0be:78be:cbf2:dfd7:c36a] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCncjcSpuJqGYPtCg--.13001S2;
	Thu, 29 Oct 2026 09:49:07 +0800 (CST)
Message-ID: <a81b1308-dc85-4d93-beb0-17d728e85f11@163.com>
Date: Thu, 29 Oct 2026 09:49:06 +0800
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
Subject: Re: [PATCH v1 2/5] ntfs: preserve timestamps when creating hard links
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>
References: <20261027093515.344799-1-liubaolin12138@163.com>
 <20261027093515.344799-3-liubaolin12138@163.com>
 <auKQCM-vwM5RPYDc@hyunchul-PC02>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <auKQCM-vwM5RPYDc@hyunchul-PC02>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgCncjcSpuJqGYPtCg--.13001S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF43Zr45AF1xZrykWFyrXrb_yoW8uw47pr
	Z5Ga4DK3WkJrW7CF92yrsxXFyvgayIgF4xJFs8J3W7A3Z5K3ZYqF40gFyUuFy0kr95Wr1I
	vF4qgryUXw1Y9FJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U24iUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hMBy2riphNGIQAA3p



在 2026/10/29 08:15, Hyunchul Lee 写道:
> Hi Baolin,
> 
> On Tue, Oct 27, 2026 at 05:35:12PM +0800, Baolin Liu wrote:
>> From: Xuewen Wang <wangxuewen@kylinos.cn>
>>
>> ntfs_link() resets atime, mtime and ctime on both the source file and
>> the destination directory after creating a hard link. This overwrites
>> the source file's atime and mtime and the directory's atime.
>>
>> Update only the source ctime and the destination directory mtime/ctime.
>> Mark both inodes dirty so these changes are queued for writeback instead
>> of relying on the earlier FILE_NAME write.
>>
>> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
>> ---
>> Tested with the complete five-patch series in QEMU. Explicitly assigned
>> atime and mtime are preserved across ordinary hard-link creation and
>> O_TMPFILE publication. A separate persistence check set and synced
>> atime/mtime on the published file, then verified those values after
>> cache eviction, remount and a fresh boot.
>>
>>   fs/ntfs/namei.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
>> index 0c84a5c..4442e1d 100644
>> --- a/fs/ntfs/namei.c
>> +++ b/fs/ntfs/namei.c
>> @@ -1663,12 +1663,13 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
>>   	}
>>   
>>   	inode_inc_iversion(dir);
>> -	simple_inode_init_ts(dir);
>> +	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
>> +	mark_inode_dirty(dir);
>>   
>>   	inode_inc_iversion(vi);
>> -	simple_inode_init_ts(vi);
>> +	inode_set_ctime_current(vi);
>> +	mark_inode_dirty(vi);
> 
> Could you also update the last_mft_change_time of $FILE_NAME? it still
> appears to retains the old ctime.
> 
> Additionaly, could you run run xfstests generic/004 and generic/389?

 >
Hi Hyunchul,

    Thanks for your review. Xuewen and I will make modifications and run 
tests per your comments, and submit the v2 patch afterwards.

Thanks,
Baolin.

> 
>>   
>> -	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
>>   	d_instantiate(dentry, vi);
>>   	mutex_unlock(&dir_ni->mrec_lock);
>>   	mutex_unlock(&ni->mrec_lock);
>>
> 

