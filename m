Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327CB31987D
	for <ntfs@lists.linux.dev>; Wed,  2 Sep 2026 06:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331514; cv=none; b=upD+JW/8t1s55AUO5jN71OwnkH5/AeQaCMhu3vCsGcsHMi+vefJ4lhl3avFuKmGR7/9kdMzjjn5YedsfCjR0HoZSfHF/UrA4aAJooMsY5iRrd8x6VykDR/NMmpXHElktDfxQJSitx//fyz1cGZo2EVnZBQtynQI/uCEh80YJeUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331514; c=relaxed/simple;
	bh=GgAdxwkkk41/uwfxZ2ES24qbG6JzfhzWY0JMutbCZhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OpWpBXvWGr59yayd90UgDMU1TApN5gerJoymYC5VBHSqdeAX8SngMQMI/IzkngdERI45Epi2+BaszdpWn2mfnTbk+PG1cxjWpjIrLWkYTtObx1E1r+uOzbFEp4MusdLD6p3PqcyhbfG0kZNrZ3cT5rR0LndRmtSYwPCcY4kA0d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DkzbRBjg; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DkzbRBjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=kctKcD064GAsrzHHvliOKYeQjxpgDbB8xDJ1Z98T0a0=;
	b=DkzbRBjgKf8RJniAcZJzQ17MMAiFWjANM7c4qouvhuYoKUT2oFsFH4G62jjbrg
	HpEmiN3bJOZOq9ftbBtR7qEycM2Ic6COTn9HIdX/fqWPZ6hSHl5nmAGxWCU/DhuJ
	n9PvbXg26F8jvIX90wEcj2GB2Zd5L8gZQnI28xVC3spZ8=
Received: from [IPV6:2409:8900:1ef4:8f82:6ff7:7c40:6535:9660] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCHaADdxZdqkh3MQQ--.55522S2;
	Wed, 02 Sep 2026 14:44:47 +0800 (CST)
Message-ID: <9105aa5d-7390-490a-8336-5dba6b97895b@163.com>
Date: Wed, 2 Sep 2026 14:44:45 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ntfs: implement fileattr_get and fileattr_set
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260901091519.2885376-1-liubaolin12138@163.com>
 <20260901091519.2885376-2-liubaolin12138@163.com>
 <CAKYAXd94Hy-cEXAsfibh+B66774rg9wALwPWGfir91dqJWTtgg@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CAKYAXd94Hy-cEXAsfibh+B66774rg9wALwPWGfir91dqJWTtgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgCHaADdxZdqkh3MQQ--.55522S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1Uury8CFykCryUJryxZrb_yoW8Xw1UpF
	WrGayxKFs7Cry7G3s29w13WayFqw18Xr45ZryqgryxC3ZxC342vryxKr13uFWqyr1fAw12
	qFyjqa47AF1YvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRS_MhUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6R8p82qXxd8bPQAA3t



在 2026/9/2 09:22, Namjae Jeon 写道:
> On Tue, Sep 1, 2026 at 6:15 PM Baolin Liu <liubaolin12138@163.com> wrote:
>>
>> From: Baolin Liu <liubaolin@kylinos.cn>
>>
>> Wire up the fileattr inode operations so that lsattr(1) and chattr(1)
>> work on ntfs.
>>
>> fileattr_get reports the compressed and encrypted state of the attribute
>> and the immutable and append-only flags, the same states ntfs_getattr()
>> already reports through STATX_ATTR_*.
>>
>> fileattr_set accepts only FS_IMMUTABLE_FL and FS_APPEND_FL. Compression
>> and encryption are rejected because changing them would require
>> rewriting the attribute data. Both accepted flags go to inode->i_flags,
>> so the VFS enforces them.
>>
>> Neither flag has an on-disk representation of its own, so a value set
>> through fileattr_set only lives for the lifetime of the mount. Note also
>> that S_IMMUTABLE is re-derived on every mount, from FILE_ATTR_SYSTEM when
>> mounted with sys_immutable and unconditionally for system files, so
>> clearing it on such a file does not survive a remount either.
> NTFS forces S_IMMUTABLE on system metadata files such as $MFT, but
> this patch allows userspace to clear that protection. The patch should
> reject clearing immutable for these files and for files made immutable
> by the sys_immutable mount option.

Hi Namjae,

   You are right, that is a hole. The driver forces S_IMMUTABLE on those
   files for a reason and userspace should not be able to clear it.

   I will add the check and send a v2.

   Thanks for the review.

Thanks,
Baolin

