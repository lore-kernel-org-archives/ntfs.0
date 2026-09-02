Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEB437F312
	for <ntfs@lists.linux.dev>; Wed,  2 Sep 2026 07:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334010; cv=none; b=Sqg4s7u8zvvzJoW+htSueVLqMWbUUCZk+uwlRLnapO0e9F/781O2XmYoQot/t6377KAL+f6doka5WuMvHi1kFQCH9Tm5dB5pb7Pz4aRA+i6Z6aTWNMwXggIrDMJCtnlQ1586ukhlHykiTahNLl99yPYezlzfy0zem1LpXixPX3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334010; c=relaxed/simple;
	bh=wGluGmkaCI2Q/JeXHxIV9kU7zwJvWqQJ/8aLZAvYbj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIjnp9tTk+DPQm4o5bJpa3DFvze/S9biCUutr2tkHkKoGwYtxn5dQ+OnebU5XM4WE0D/UKaLPqkWu7SXbfWxE8iAJ1bZpnlc9pZRXD730Hub/vZDxvysX4DKHgUV4zba5G9rYTbnV1izFL1i5NGspyBi08OtQb55cTHbi9vWG8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Xy7fby/o; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Xy7fby/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=mmF7kuUqInWK7BFYVybGZoatxlS0WTc6kdHQli6tuHI=;
	b=Xy7fby/oN8attI/zwbMBSCdkee77aQODKpemczXvxw0Z0LlMuR1hEH7uXWt0ob
	MsILx4vJp74TVO4uEG7yy6iJyfX1Tt+n4vntXa722IEtM+kokwJ3V+NpIRz8G0tK
	XhRkt7MIOZqru88SeN37PyxlcSMySXapFga2aFS2vuXMY=
Received: from [IPV6:2409:8900:1ef4:8f82:6ff7:7c40:6535:9660] (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgAnDVKmz5dqvho3NQ--.53035S2;
	Wed, 02 Sep 2026 15:26:31 +0800 (CST)
Message-ID: <0e7814f1-74a7-4123-a6d2-3e13e39c1d6c@163.com>
Date: Wed, 2 Sep 2026 15:26:30 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ntfs: wire up the fileattr API
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260901091519.2885376-1-liubaolin12138@163.com>
 <CAKYAXd9HVhS8K3zXhcfUz1H09CDaqADpDzXt0dO9FV3Pa7Rs0Q@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CAKYAXd9HVhS8K3zXhcfUz1H09CDaqADpDzXt0dO9FV3Pa7Rs0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgAnDVKmz5dqvho3NQ--.53035S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWDGrWxAr48XFW7JrW5ZFb_yoW8Ar1kpF
	Z3GayUKwn7trW3A392gF1UW3yjv348ArW3Wr9rZrWxCF98Jry2vryIk3WS9F1vyr1fA342
	qF4qgr9IvanIvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2iiDUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QedaGqXz6eK8wAA33



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

Hi Namjae,

   You are right about inode reclaim, I had not considered that - not just
   a remount, memory pressure or drop_caches can silently drop these flags
   as well.

   I will look into how to persist them without breaking compatibility.


   Thanks for the review.

Thanks,
Baolin

