Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74903314A98
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 02:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790216799; cv=none; b=MICXc2knHWcE4mCddPUUkzDfJJyNXNRsIj3qlW3037oUQgjElNfrKT4UhEnvR4Yb3KwrMuunhVyDGIu4mWEostlmgpnbnOhSuf4JRXtAnIq86u6CVEbjS3Z9H5WZKHVwG1PmU0dIfU+wLuETcVD6LnLwuHI0uuAKAg+D43wXejc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790216799; c=relaxed/simple;
	bh=gad31LCs28Ku5VnuvZzl4EZGe9BgdnA3ux5K3Ea89V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LEBoNXS56nltluxT7tThLPzhQWppan2PBUlEjaHpdC684Rtw/n6FXrW69eMQPFke6bTz0jk2j4vVMGbmsYq3zBd+FDKj+ykwXrqDlrCO2Xxsq4ZRKHHoYl1MHuILNyu9dXezNnUX/U3tyo6KsIRRinOcEVVNIJTFIxUSPlRn8tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=StoZ7RPo; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="StoZ7RPo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=GSnCV5uMkB5yMD9m3h+bFqFsIrxHgzl10PHcoFQG4NQ=;
	b=StoZ7RPo5TR8YhTVm/hCToeYtj4ae7os2aF+oLkbGYSINBOf0oo1dq6NjGBT6m
	OhDUNSRFUD/0FXgHlmw5EeUNImG2S9Ey+Pk2qkojFPEvpa7UUC6e81Fuc2Vbzi2s
	wohP484vlWNChdzYzvoo/+YaxB0Zp1cBan7bzg2c5W0xc=
Received: from [IPV6:2409:8900:1eb0:45e:3c13:fdf5:6f81:b37a] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3H2JGirRqsIJdBA--.15476S2;
	Thu, 24 Sep 2026 10:26:16 +0800 (CST)
Message-ID: <d99b5d9c-1abe-4d5b-9f87-3596bd18f4d8@163.com>
Date: Thu, 24 Sep 2026 10:26:14 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] ntfs: bound the adjacent cluster in MFT bitmap
 extension
To: Xuewen Wang <wangxuewen@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260924014514.1678828-1-wangxuewen@kylinos.cn>
 <20260924014514.1678828-2-wangxuewen@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260924014514.1678828-2-wangxuewen@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgD3H2JGirRqsIJdBA--.15476S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1rZr43WF4rZFy8KF13twb_yoW8Ww4kpF
	s8tF17Kan5JrsrKanIgwsFka4fW3s7KwsrGay0qryxCrn3Jwnagrn5KrnYva4vkw4xJFs8
	XF1qkw47ur15Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U45lnUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Qh8R2q0ikgvuwAA3S



在 2026/9/24 09:45, Xuewen Wang 写道:
> When the last MFT bitmap run reaches the volume boundary, the direct
> allocation path tests the bit for nr_clusters, an invalid LCN. A clear
> bit allows an out-of-volume allocation; a bitmap read failure aborts
> extension even if valid clusters remain available.
> 
> Check the candidate LCN before accessing $Bitmap and fall back to
> ntfs_cluster_alloc() with no locality hint when it is outside the volume.
> 
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> ---
>   fs/ntfs/mft.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 8bb8b4085c8b..88bac85d22bc 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -1377,6 +1377,11 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
>   	lcn = rl->lcn + rl->length;
>   	ntfs_debug("Last lcn of mft bitmap attribute is 0x%llx.",
>   			(long long)lcn);
> +	/* There is no adjacent cluster if the last run ends at the volume end. */
> +	if (lcn >= vol->nr_clusters) {
> +		lcn = -1;
> +		goto alloc_cluster;
> +	}
>   	/*
>   	 * Attempt to get the cluster following the last allocated cluster by
>   	 * hand as it may be in the MFT zone so the allocator would not give it
> @@ -1413,6 +1418,7 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
>   		kunmap_local(b);
>   		folio_put(folio);
>   		up_write(&vol->lcnbmp_lock);
> +alloc_cluster:
>   		/* Allocate a cluster from the DATA_ZONE. */
>   		rl2 = ntfs_cluster_alloc(vol, rl[1].vcn, 1, lcn, DATA_ZONE,
>   				true, false, false);

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

