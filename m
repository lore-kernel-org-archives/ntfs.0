Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622F4483BC2
	for <ntfs@lists.linux.dev>; Tue,  8 Sep 2026 08:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856297; cv=none; b=ajmmQh93sLi7Zd4jtyZDAqZzp0cdE4yGTamEGIufnHxI1ocg2pCTA1+GKIrJpeRyHu90AIS1zCinlrTa4v7KgukUA5DuzGst9+wzYFw9yHadQkpwvOMR9jKlP/e7rALwCNTl6yv/IcJIAQ8W6ZjCIcL4Iwes38KvZJQkJngJ2r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856297; c=relaxed/simple;
	bh=N6r459gQKIAKQol6L5vGfE54Mg7w3uk9uZDKEmmRf50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dRnJ9vb5VM3OhoXUU6M/xDq7Re53NTxs1zp0YKzwsa6McSCoT7KmYHaRoAOEMw7EbHMgu2wsdnsFUrhXVe3OLCgi1EP1LVYIrIho6OcFmB3t0qHGQI8BirPm49VQYP8JfN/hdnIlvoyhaCjZ+riZpOFCRWzkpcQXxaHChJMsnDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=f6yu1a/J; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="f6yu1a/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=FxrQjmdnNKvzk2HS7CE6p6YLx2A/uJBnU99tPj+pSlc=;
	b=f6yu1a/J5xa1J1mDe0c0z+Nff64MwAZsMGBkAgHsqzc5I1U+ntISfSdEPojs2G
	ZmP8LJjCx1wkT0B5aQfB+U/abw9MQpTIb/iwy+G9Dr2My2EiiGs0vipiQEyGMpd2
	BXr0mUsvE6GDYeCCgHXuQfNeALNNPwF+m0DOw1cHXL2h8=
Received: from [IPV6:2409:8900:1e93:d74:11d3:93db:9b15:f204] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v0jTx59qOPunBQ--.23780S2;
	Tue, 08 Sep 2026 16:31:16 +0800 (CST)
Message-ID: <4a46d66d-6c15-4b45-be8b-0d98d3472659@163.com>
Date: Tue, 8 Sep 2026 16:31:15 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ntfs: wire up the fileattr API
To: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260901091519.2885376-1-liubaolin12138@163.com>
 <CAKYAXd9HVhS8K3zXhcfUz1H09CDaqADpDzXt0dO9FV3Pa7Rs0Q@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CAKYAXd9HVhS8K3zXhcfUz1H09CDaqADpDzXt0dO9FV3Pa7Rs0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v0jTx59qOPunBQ--.23780S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxur17trW5ZFyrJF4rXr47urg_yoW5GFW8pa
	93GFW7Kan7XrW3C392vF4jgay0vw48ZFW5ZryqgryxAF98X342vr97K3WY9rn7Jr17Aw1j
	qFWjgrZrXan8Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2zuZUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RWpdGqfx9U-3QAA3k



在 2026/9/2 09:44, Namjae Jeon 写道:
> On Tue, Sep 1, 2026 at 6:15 PM Baolin Liu <liubaolin12138@163.com> wrote:
>>
>> From: Baolin Liu <liubaolin@kylinos.cn>
>>
>> This series implements fileattr_get and fileattr_set for ntfs so that
>> lsattr(1) and chattr(1) work on ntfs.
>>
>> Patch 1 wires up the fileattr inode operations and implements support
>> for FS_IMMUTABLE_FL and FS_APPEND_FL. These flags map to inode->i_flags
>> (S_IMMUTABLE, S_APPEND), so the VFS enforces them. fileattr_get also
>> reports the compressed and encrypted state, which the driver already
>> exposes through STATX_ATTR_* in ntfs_getattr().
>>
>> Patch 2 adds FS_NODUMP_FL support, which dump(8) and other backup tools
>> use to mark files to skip. The flag is stored in a new ntfs_inode field
>> and reported through both fileattr_get (for lsattr) and ntfs_getattr()
>> (as STATX_ATTR_NODUMP, for statx), so the two interfaces stay consistent.
>>
>> All three accepted flags (immutable, append-only, nodump) are kept in
>> memory and do not survive a remount, matching ntfs3 behavior.
> This patch-set does not persist these flags on disk. So, the settings
> survive only while the corresponding inode remains cached. inode
> reclaim caused by memory pressure or drop_caches can discard them
> before unmount. Could you find a way to persist immutable, append, and
> nodump in metadata without causing compatibility issues?

Hi Namjae,Hyunchul,

   Regarding the persistence concern, I propose storing the 
Linux-specific flags in one private EA entry in the file's existing NTFS 
$EA attribute:

     EA name:  $LXFLAGS
     EA value: a 32-bit little-endian bitmask

     bit 0: immutable
     bit 1: append-only
     bit 2: nodump

   The three flags are boolean states, so one bit is sufficient for each 
of them. Using one 32-bit value also leaves room for future expansion.

   This would add an EA entry named $LXFLAGS to the existing $EA 
attribute;it would not introduce a new NTFS attribute type. The driver 
already uses the standard $EA/$EA_INFORMATION mechanism for $LXUID, 
$LXGID, $LXMOD and $LXDEV, so this approach would reuse the existing 
on-disk mechanism.

   The inode loading path would restore the flags from $LXFLAGS, and 
fileattr_set() would update the entry. The entry would be removed when 
all three flags are cleared. This would allow the flags to survive inode 
reclaim, drop_caches, unmount/remount, and reboot.

   This approach would not require changes to mkntfs or to the NTFS 
filesystem format.

   Would this approach be acceptable? If so, I will implement it and 
submit a new revision as soon as possible.

Thanks,
Baolin.

