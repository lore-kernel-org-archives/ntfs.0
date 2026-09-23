Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D6E4718E1
	for <ntfs@lists.linux.dev>; Wed, 23 Sep 2026 08:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153712; cv=none; b=kvZeBgpZsEyOJSVNet6pP/m3nTDwrZPKCmaEY+vsTAUWYIrZFkh325ybSLulvsxfc5ld06tgjO9iKFql6uhQzW2Tt++jwxU3c5NFnW4IEzNYUR8iY3je7FYflc9PczZwSyWegy6nzTvLvPAOxSb3/TyQrIJ3fpmNbQ5BD3k3qtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153712; c=relaxed/simple;
	bh=t9TFd8F5CdzpyO0zVBh2fZK+ok6ePZhg2w6rGtcCeE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqxELo1VuhQI3QakUHDvdP03yXgBWVcDbMPUOzaLKX2WymFIT031KO09In+oVpl2Bu0ucbS1aGYYImHQ7cViGt6FBNrEICczQGNckY5osTiqFuCZ9NrylkEp7TUQHY4BPteWDwrTKwNqfxdqJAzjplLNqxkc63GtZHX8kXnH/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=G1Ez8ZvU; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="G1Ez8ZvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=dYEDrwNRmz/xZBDXGhELe0HR3iKeT/x9dTI/Olg7Bv0=;
	b=G1Ez8ZvUEji0UGsJ0tp36rRoZMU/luwex3ZNRbPhIVyp2yVuRQBtMHEIp4tBfp
	oPcFjD/hc66o7VbSo+tnfB5d7nDlN6Ca/+j8DK+CwQLeKV32Wp5rolJWjmdiZKKH
	NaM3K61pXzi9lJtO8fjsdgPsFAgoWyIhIrg7K3D0bJnA0=
Received: from [IPV6:2409:8900:1eb0:45e:2b98:92e3:4869:1f5c] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3j9_ek7NqLe_dAw--.22839S2;
	Wed, 23 Sep 2026 16:54:56 +0800 (CST)
Message-ID: <86f0fe86-d5bd-452a-a572-f854eb291b10@163.com>
Date: Wed, 23 Sep 2026 16:54:54 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: fix runlist marker allocation and count
To: pwngets <2605452642@qq.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev
References: <tencent_5D0FB865BC14FCE7080CBF2AA1E23ECA2005@qq.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <tencent_5D0FB865BC14FCE7080CBF2AA1E23ECA2005@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgC3j9_ek7NqLe_dAw--.22839S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw17uF47Jr15AFWkKr4xCrg_yoW8Cryxp3
	ySvrZ09rs7XryDtrWDAr17Kw1xWr93A3s8Kr4kJryIvrn5Jwsa9FWDKw4vg3Z8tF4rZryU
	Xr12gay2vanxZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UT6wtUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwgCkb2qzk+A6+gAA3j



在 2026/9/23 13:41, pwngets 写道:
> The marker path can append an unmapped element and an ENOENT
> terminator after the merge helpers have already computed the resulting
> runlist count. In that case, allocating ds + 2 elements leaves no room
> for the terminator at ds + 2. The path also increments new_rl_count even
> though the merge helper already accounted for the final runlist size,
> causing a later merge to start past the terminator.
> 
> Allocate space through ds + 2, and derive new_rl_count from the final
> terminator index instead of incrementing the count a second time.
> 
> A crafted NTFS image can reach this path through a normal read after the
> image has been mounted and trigger out-of-bounds kernel heap accesses.
> 
> Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")
> 
> Assisted-by: OpenAI Codex:GPT-5
> Signed-off-by: pwngets <2605452642@qq.com>
> ---
>   fs/ntfs/runlist.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs/runlist.c b/fs/ntfs/runlist.c
> index 3a61f19bcbeef..f13d28c15887d 100644
> --- a/fs/ntfs/runlist.c
> +++ b/fs/ntfs/runlist.c
> @@ -680,9 +680,8 @@ struct runlist_element *ntfs_runlists_merge(struct runlist *d_runlist,
>   				/* Add an unmapped runlist element. */
>   				if (!slots) {
>   					drl = ntfs_rl_realloc_nofail(drl, ds,
> -							ds + 2);
> +							ds + 3);
>   					slots = 2;
> -					*new_rl_count += 2;
>   				}
>   				ds++;
>   				/* Need to set vcn if it isn't set already. */
> @@ -698,11 +697,11 @@ struct runlist_element *ntfs_runlists_merge(struct runlist *d_runlist,
>   			ds++;
>   			if (!slots) {
>   				drl = ntfs_rl_realloc_nofail(drl, ds, ds + 1);
> -				*new_rl_count += 1;
>   			}
>   			drl[ds].vcn = marker_vcn;
>   			drl[ds].lcn = LCN_ENOENT;
>   			drl[ds].length = (s64)0;
> +			*new_rl_count = ds + 1;
>   		}
>   	}
>   	}

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

