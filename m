Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1E33A83B1
	for <ntfs@lists.linux.dev>; Tue,  1 Sep 2026 03:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788233290; cv=none; b=RjkDk2ub1Krz3TW9ws6tNErNw1yS/ESCIa3/9yydQ2oDcvswtt5osrDl0pY1mcuCqO2u+U0gdviOfsIEN2u3qdueONpf/EVvW/zSTGWQpPXAqhq785V7F91Tr7o5W3nw8V5qgGXEjx9isAAWL0e449TGYkPu8xfzYZu1zxmiC80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788233290; c=relaxed/simple;
	bh=QZioVrLWeUyVUyYloc8aIm06vc9RflpbapOP01CvxPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M199vDkclblkL3B/mFxO6sgE72t5odeJDHpdctMaqzAk4EQ9qmNx6xpbnMM450dPuNBzO7qCimMuR/Y14JoDDTkQ5CvuRs0qxuscx7kevoyBZoV8PeNX++88dJRB2JviRhIwzjAQ7k9saCrCa27PxIHYfLBZePQofj7fBSosIBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ecg9IgPO; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ecg9IgPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=DvBF+g+vfubWpiR1obCyTgV1E3Z8DpYZyK/mPhq0djY=;
	b=ecg9IgPOq19oJhizykRV9NisLcpzt2ujlLTsOC5R32Wq9rl71GCg1dIoZzj1fc
	CAwJwseWdjS1wZAHRwyQFxsTxnBhXSNRYPMgxjDUoByKp1zEf1Wxq4yFYm+8mIQ5
	sfkh1Qax4SINLnXVpZ6CGuY1ikjErRVKON+t7nDK7zyJQ=
Received: from [IPV6:2409:8900:1ef4:8f82:70cd:c8db:75a7:b1e2] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3b0sxRpZqy9YiTQ--.34582S2;
	Tue, 01 Sep 2026 11:27:47 +0800 (CST)
Message-ID: <583ee96d-a2ec-4489-b082-c4f836b075d7@163.com>
Date: Tue, 1 Sep 2026 11:27:45 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: fix lost volume flag updates in set/clear helpers
To: Hongling Zeng <zenghongling@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, stable@vger.kernel.org
References: <20260901024551.528056-1-zenghongling@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260901024551.528056-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3b0sxRpZqy9YiTQ--.34582S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF17GF4fZFWUCw13CFWUXFb_yoW8JFy5pr
	WxtFy7Kw4DAr1q9wn7Kr4Ivw4F9348Jr4fCryDt34UZFn8tr4xXF18t3WrXFn5tr92qw42
	qFWjvFW7Ca1UuFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTKZAUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RPdqGqWRjPaPAAA3g



在 2026/9/1 10:45, Hongling Zeng 写道:
> ntfs_set_volume_flags() and ntfs_clear_volume_flags() both read
> vol->vol_flags outside any lock to compute the new value before handing
> it to ntfs_write_volume_flags(), which only takes ni->mrec_lock around
> the actual write. The read-modify-write is therefore not atomic, and two
> concurrent callers can lose an update: ntfs_sync_fs() may derive a
> "clean" value from vol->vol_flags while a writer concurrently records an
> error and sets VOLUME_IS_DIRTY; the locked write then silently
> overwrites the freshly-set dirty bit. The on-disk volume looks clean
> despite the recorded errors, so chkdsk will not run on the next mount
> and corrupted metadata can persist.
> 
> Fix by moving the read-modify-write inside the mrec_lock: pass the bits
> to set and to clear separately, and combine them with the current flag
> state under the lock inside ntfs_write_volume_flags(). The set/clear
> helpers pass only the bits to modify, not the complete flag state. The
> bit manipulation is done on CPU-endian values, and the result is
> converted back to little-endian before storing it. The wrappers keep
> their signatures so callers are unchanged.

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>


