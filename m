Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180656;
	b=aBWcIShs/eG72ac3WMPhzJth+ipbWEa3MbzQY9HC+86kGTt4eXmyf913kp7JCqRStnf9
	 Eh79yux/5E0uOcIZlzNyOVtm+LZq8qoaUsaz12ycOgTDqJA7GYA8FRaYCn5elwE/k29Cn
	 7XCzPHmw+KDglW5jVzUdvOvBtqBtQlNknV1bmK67GI5qee9pUZSvciZ74uxcoQMm+joE9
	 yR15zs4rGPgyI2Rd/wDW+m0I3Vwr9G6gtXUJwzgHj95+7sCKjuPRzzH8KCAGiqd4f1xGJ
	 4UJgKd7Yk51oWCR4d7RHFrhtg5vrzioFu5edvGzEBL/q//CuoOcF62/CQ25nr4CstxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180656;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=qVzquCb9Ly5sqRzVkG/72GQLGOnNOl62XOGIXp3U6AY=;
	b=I6CgcmIrzOi+CRruZMjjnOley6z0AH25zKZPcs74u0XJ12/xJmn7/hjVOr4zd89UL4tB
	 mYGY5Bl3GASpvIX/mOn8tYKxdqN09PWV+tqDy80HxOapeYckk+rBYrVBE/Y2eJkIvJlI2
	 tuGEf399ak//on8xy2csE2Fh1rYI2XYPbPN3CyZICorhThs8U0ublCyioQrt07pw1lTs2
	 lhVPh6kJOCQ2jf6bpLEhqE41kWYLoMiqBGSH5NjXuuuMvPsHHjVoWQxXbElwzPDsBv5QJ
	 mCJeZBKW+pCw6g6hHAwbj5Ee1JxY4qS51dLfyqZqdnmKxkAKMxDVPu63RuwUatRYEwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Y3oon8Y2;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB558606A31A
	for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 09:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB558606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Y3oon8Y2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=qVzquCb9Ly5sqRzVkG/72GQLGOnNOl62XOGIXp3U6AY=;
	b=Y3oon8Y2zLvo3g44exxBkudXBWqNMd0YDN8BCXDjPyqcaRbhHpvJRpiwJFhHuV
	KV9DnQyH/Hhv8dzFGh/lSq42u+CbWX7J6yTzopFQQ5AvdrIGeihz7cKFfQIugzi2
	xuMu1RddPJgdJEFt+qduPQukiMWplZsnuNpkOgF/Y2das=
Received: from [IPV6:2409:8900:1a83:1c7d:c982:2c1e:474c:2013] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDXv2Lgw+Fqu2hMDA--.16733S2;
	Wed, 28 Oct 2026 17:44:02 +0800 (CST)
Message-ID: <adc7d62e-ff24-4ceb-ae14-373ec5e2b6be@163.com>
Date: Wed, 28 Oct 2026 17:44:00 +0800
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
Subject: Re: [PATCH 3/3] ntfs: avoid overflow when limiting attribute read
 length
To: Hyunchul Lee <hyc.lee@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
References: <20261028084248.2149976-1-hyc.lee@gmail.com>
 <20261028084248.2149976-3-hyc.lee@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261028084248.2149976-3-hyc.lee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXv2Lgw+Fqu2hMDA--.16733S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw45ZryUGFW8trWkJw13Jwb_yoWDXrc_X3
	WxCFn2gw4Yqrn2qan5C39YvrsIvw4Fkr90gr4UAF12qa90yasYqrZ7Jrs0yFsrXrsIgr98
	Cws3AFnI9r1avjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREU7aUUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gI8B2rhw+JCAwAA34



在 2026/10/28 16:42, Hyunchul Lee 写道:
> ntfs_inode_attr_pread() limits a read to the attribute size using
> pos + count. A large count can overflow the signed sum and bypass
> the attribute EOF boundary check. Compare count with isize - pos
> instead, after validating pos, so the read length limit cannot wrap.
> 
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
> ---
>   fs/ntfs/inode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index b8a1af8c4cea..54940e22668b 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -3721,7 +3721,7 @@ s64 ntfs_inode_attr_pread(struct inode *vi, s64 pos, s64 count, u8 *buf)
>   		mutex_unlock(&mrec_ni->mrec_lock);
>   		return -EINVAL;
>   	}
> -	if (pos + count > isize)
> +	if (count > isize - pos)
>   		count = isize - pos;
>   
>   	if (!NInoNonResident(ni)) {

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

