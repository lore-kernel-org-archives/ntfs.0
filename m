Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D35627B4F7
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 02:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790216809; cv=none; b=VHzDL4OYbL4vj1N1ZpfxRXYfrzowtYrGe+asDSMYxEzwXUtmEb0xKGsYmVOZ3ZqADIr2tL9hVLGd+uec2MQRXHjh/3O1WC6qQGub2gewzB2npdjYT85Tk9tRSAxyYE3U4W5B58/rkNDxygixkx4cMoU+LRF/Y5L/bx2QAzlSOo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790216809; c=relaxed/simple;
	bh=8XHegPWiGvtR/yyUSgw0JETd33ZMV3rgU7HzaUs4ptk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Et3cakwsUfs5czSzqKSzc/19muuBIIgGFZxIrXFc7olBfsrhH3mGWV6xfRCsrYm5yYSPy4gYm2597kXjC5hZ4FY/mvcZSd7I0Na5ADr3vMnW5XI7yM6C4I1MYGl3ZCr4hmkGao1BoJ0kXfDF9cShvTPubFJvKmHBXpxtNAkaH6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EFux759q; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EFux759q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=6HmxTJNJ/l+4raBUBixJRvJAWRddBq7P1CIRGoHJ5rk=;
	b=EFux759qDTtTvFZP74Fw7earL4hZiD3eU2EIC+2IQLuFTChXyQGsH5uQlV9AaO
	kePF4OdeF6/2gLO+lnBRp13jX8Yf2W4sdBORK4Ukga3yinFU+QdY3EqRtWwWzZd9
	po4GrycxO1FznQ/tDharZNAhjeqzVW6c+1uWGZIyF8rmw=
Received: from [IPV6:2409:8900:1eb0:45e:3c13:fdf5:6f81:b37a] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD33apairRqEBdkBA--.45631S2;
	Thu, 24 Sep 2026 10:26:35 +0800 (CST)
Message-ID: <b7326c4e-d408-46a4-abdd-e815c280da3e@163.com>
Date: Thu, 24 Sep 2026 10:26:34 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] ntfs: fix rollback after MFT bitmap run coalescing
To: Xuewen Wang <wangxuewen@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260924014514.1678828-1-wangxuewen@kylinos.cn>
 <20260924014514.1678828-3-wangxuewen@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260924014514.1678828-3-wangxuewen@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgD33apairRqEBdkBA--.45631S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF4DtF1xur47XF1rJr4UCFg_yoW8Cw4Dp3
	90yrZ8t3WrXrsrKasrKw4jk3Wfu3yxK3yUJw4vqw4xGFs8tw4Skrn0gFnYqa1vyFWxJFyU
	XFs7urW3ua9xZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRTqcUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6huAS2q0iltMVgAA3v



在 2026/9/24 09:45, Xuewen Wang 写道:
> After the direct allocation attempt drops lcnbmp_lock, a concurrent free
> can let ntfs_cluster_alloc() return the adjacent cluster. The merged
> runlist then extends the existing last run, but rollback assumes a new
> run was added. A later metadata failure removes the old mapping and
> frees its first cluster.
> 
> Record whether the allocated cluster is adjacent before merging the
> runlists. On rollback, shorten a coalesced run by one cluster and free
> only that cluster; remove the new run for a non-adjacent allocation.
> 
> Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> ---
>   fs/ntfs/mft.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 88bac85d22bc..12666668a80e 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -1428,6 +1428,8 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
>   					"Failed to allocate a cluster for the mft bitmap.");
>   			return PTR_ERR(rl2);
>   		}
> +		/* The adjacent cluster may have become available while unlocked. */
> +		status.added_cluster = rl2->lcn == lcn;
>   		rl = ntfs_runlists_merge(&mftbmp_ni->runlist, rl2, 0, &new_rl_count);
>   		if (IS_ERR(rl)) {
>   			up_write(&mftbmp_ni->runlist.lock);
> @@ -1442,8 +1444,8 @@ static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
>   		}
>   		mftbmp_ni->runlist.rl = rl;
>   		mftbmp_ni->runlist.count = new_rl_count;
> -		status.added_run = 1;
> -		ntfs_debug("Adding one run to mft bitmap.");
> +		status.added_run = !status.added_cluster;
> +		ntfs_debug("Allocated one cluster for mft bitmap.");
>   		/* Find the last run in the new runlist. */
>   		for (; rl[1].length; rl++)
>   			;

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

