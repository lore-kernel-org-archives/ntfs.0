Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAB126F288
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 02:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790216819; cv=none; b=cxiSM74GJcLy4ZpJUCR0eMeemuDmNlFHMLh/Zqpc2PyRhH6IxUaajPtY+1ll7LS5T42i225TD/0XgMJO4roBOmdeXBs/SnmaplqUBbBYEZjUgtxOTSfRaFI/bOwbHTheIbT0tc1dA50S5O2YL+eON88zUBo9fDgHOg2AV3Zk8c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790216819; c=relaxed/simple;
	bh=DEfHzhVYdCsZTkesdwgEszk6aZ7rUcyfzNrNH0y42iQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nsv++WMjQgMz49C0XplXxTF6Pb0ushlXGhPBjCbohYUeUNU8hD007ikk0aeCVmf3l5TTkphodVOkTQ9CkJS1nos3+eluDwdSm7ChSYy7ixcqLpxxfp6utunJrSEhMPO+ehBY3YsBuRxNSufQSpGsWOtdJyz/EvAz9+5cJ3EKhno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Wkqk+3BM; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Wkqk+3BM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=enlgkrlga+KddxoPt5qbGEbcQ3zCsrw1b4dNmkczDHk=;
	b=Wkqk+3BMplINjwGvkKVB6k5L+aBFzrUqGkDi0A4mizWTn+IU66XehJkvwUdcNw
	anQF97ul1k3nXnp2wYLrWIuPbexJPVmpqkYDxJE1hj4h25p76I51UWrrHYlVq0WQ
	BuE+hdT3Qp6DwyOSF2dfERAo2xuw+rBDFPojtIQ3t5xQw=
Received: from [IPV6:2409:8900:1eb0:45e:3c13:fdf5:6f81:b37a] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBXBENjirRqjJZdBA--.14752S2;
	Thu, 24 Sep 2026 10:26:44 +0800 (CST)
Message-ID: <ae989750-e61a-41e5-a7fa-dfef870679a6@163.com>
Date: Thu, 24 Sep 2026 10:26:43 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] ntfs: wait for the bitmap scan before MFT bitmap
 extension
To: Xuewen Wang <wangxuewen@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260924014514.1678828-1-wangxuewen@kylinos.cn>
 <20260924014514.1678828-4-wangxuewen@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260924014514.1678828-4-wangxuewen@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgBXBENjirRqjJZdBA--.14752S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFW7Cw4Dtw13Wr1rXry8uFg_yoW8Jw4fp3
	9Ik3WxKw4UAr42g3sFgw4Fka1xu395K3yDGa1Fqr17WFn3t3ZIga1rKF10q340yrWDJF17
	XFnFva17ua45ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2oGLUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwQSDTmq0imQQYwAA3L



在 2026/9/24 09:45, Xuewen Wang 写道:
> If MFT bitmap extension fails before the initial $Bitmap scan completes,
> rollback calls ntfs_bitmap_clear_bit(), which holds a folio lock while
> ntfs_set_lcn_empty_bits() waits for the scan. The scanner deadlocks if it
> still needs that folio.
> 
> Wait for the initial scan before taking the runlist or bitmap folio locks
> and attempting allocation.
> 
> Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> ---
>   fs/ntfs/mft.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 12666668a80e..489a5935202c 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -1352,6 +1352,10 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
>   	size_t new_rl_count;
>   
>   	ntfs_debug("Extending mft bitmap allocation.");
> +	/* The initial bitmap scan must finish before we lock or change a folio. */
> +	if (!NVolFreeClusterKnown(vol))
> +		wait_event(vol->free_waitq, NVolFreeClusterKnown(vol));
> +
>   	mft_ni = NTFS_I(vol->mft_ino);
>   	mftbmp_ni = NTFS_I(vol->mftbmp_ino);
>   	/*

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

