Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32D739FCCA
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790514285; cv=none; b=JXmzhvithVQFe4SOZ1NOxFHtjVCciBDKuicf6YQiKGC5a/0TRqRmCDtJLfkkKhB3MYgk9eTSl/cbH0FWY0zSMZXzN/xhdSIwgAqEc2/Ac0+tspCsMkaz0IeRoL6/0AxbqYRMSYSyXMOysR86PCyvCHWKg4CtrtkY6SwyKE05EZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790514285; c=relaxed/simple;
	bh=Ehjd7KQKYoiFG5GALnCvhpmMeeHIzSqeA0pg7VzK/nU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bBjiv0np/Vzm1HKu+QJqUw4PaNn9qPDUqENvE4ahJ19gg1t2xcQQu9zti3ye4to6lARVAMRD9zZe8X2Fu3f8UW/8u/Pq+AHH19WsC0xa754nLLzh3HPaVbRIRwRfzIGW6B8MvuICPnnbKnUsPckebzJmpMhFUbTP9ks7hOu9ajA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Kk/tGJM0; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Kk/tGJM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=XxGyb9O2fOMBR42nQtG9tBy2Uuj5p7qZcZrUukCdB/s=;
	b=Kk/tGJM0FiCjxAJ4pULro1ibWb00/kLQk6FrmXRaktwmqk7nIBLtltrqw198Y4
	yFt8Db3uXeOMWUBL1eW+EQmifrFY7Bq2d4tGm3e4EN/rtjeTwm8z5V4TlUGMAUj5
	J7px6Xv9qGfwYu0aTby2sa/EkppjWxOkK9726m3YfOyO4=
Received: from [IPV6:2409:8949:6ca0:7910:556a:2884:1c35:3923] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgB3pURaFLlqOTOvBg--.35076S2;
	Sun, 27 Sep 2026 21:04:27 +0800 (CST)
Message-ID: <fa59fd96-5aac-48c1-b949-ea6b6b858cc3@163.com>
Date: Sun, 27 Sep 2026 21:04:26 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ntfs: do not use a stale runlist pointer when undoing
 $MFT extension
To: Matthias Goergens <matthias.goergens@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260927105706.3111333-1-matthias.goergens@gmail.com>
 <20260927105706.3111333-3-matthias.goergens@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260927105706.3111333-3-matthias.goergens@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgB3pURaFLlqOTOvBg--.35076S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWrXw4kJryUZr18tw13urg_yoW8Zw1fp3
	45ArsFk3s0qr9FqasFga1Ykr1rCwn3t3yUAr1xA3Za9rZxWw18K3W3KF4Y93WIyrW8Jr17
	CFs5A3y7Ca90vrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U7nY7UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhsk7mq5FFvNqAAA3q



在 2026/9/27 18:57, Matthias Goergens 写道:
> When ntfs_mft_data_extend_allocation_nolock() fails after it has
> rebuilt the mapping pairs of the last $MFT data extent, undo_alloc
> truncates the runlist and then rebuilds the old mapping pairs from rl2,
> a pointer into the runlist taken before the truncation.
> ntfs_rl_truncate_nolock() can reallocate the runlist, and KASAN then
> reports a use-after-free in ntfs_mapping_pairs_build().
> 
> Pass the start of the runlist instead, and hold the runlist lock for
> reading while the mapping pairs are built from it.
> ntfs_mapping_pairs_build() skips to the element containing the first
> vcn by itself.
> 
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
> A forced lookup failure of the first $MFT data extent, on a volume
> whose $MFT has several extents, gives the KASAN report before this
> patch and nothing after it.
> 
>   fs/ntfs/mft.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 58676042444b6..5831ea7600315 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -2081,11 +2081,16 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
>   	if (ctx) {
>   		a = ctx->attr;
>   		if (mp_rebuilt && !IS_ERR(ctx->mrec)) {
> -			if (ntfs_mapping_pairs_build(vol, (u8 *)a + le16_to_cpu(
> +			int err;
> +
> +			down_read(&mft_ni->runlist.lock);
> +			err = ntfs_mapping_pairs_build(vol, (u8 *)a + le16_to_cpu(
>   				a->data.non_resident.mapping_pairs_offset),
>   				old_alen - le16_to_cpu(
>   					a->data.non_resident.mapping_pairs_offset),
> -				rl2, ll, -1, NULL, NULL, NULL)) {
> +				mft_ni->runlist.rl, ll, -1, NULL, NULL, NULL);
> +			up_read(&mft_ni->runlist.lock);
> +			if (err) {
>   				ntfs_error(vol->sb, "Failed to restore mapping pairs array.%s", es);
>   				NVolSetErrors(vol);
>   			}


Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

