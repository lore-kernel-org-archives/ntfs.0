Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70594E5337
	for <ntfs@lists.linux.dev>; Tue, 13 Oct 2026 23:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791934764; cv=none; b=DI6INIer/frgMO5CHsAbTC5qBtl0ilRi4CmWqntHWt2kaDjc0SsWoBYZxB2qRmd4VoGt8M6SmZyDE9Rt2gq3yhlKjk3oeukwYTFzwspUWU3VPMe2Fl22hRpsrmqf5nVx5zZeF/fuhLhbSWLum+UtC0MM+nJiTFk89wbGPs4RMB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791934764; c=relaxed/simple;
	bh=hYap/LxKCLQAatY/8iXkHodBIjFF0dk3ql2qxDeaNMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clWg+yePuI49VMWuAJPSCkDddjhPMWwQoJ+kYJgenFvEHL7gmYLIwfkcoemtMGtlJkzIn+TzvLAyZDlR+su2LoH+qj2EA2Lro0QJjUPPthj3iMgatn6blYBv+OsRMHbnxJaSKtFUCujOaJ57TGKNHnkagsTaztgGwfOPEatw7aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Z3xZ6n+r; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Z3xZ6n+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=3jdvwbss58BY7guXUR0LgqIwUPv+LsOGeapfQrzXrLM=;
	b=Z3xZ6n+r3wXu2VtgrknLJEDfqDB4tozq5hrygUh23dTwd5uDFpmkO2D7EcapXA
	jLNVpAjf0iGTWJVGG8wk2yjAjrb23glHuGziQzIeYvDJh/YubUIppqw8p6sT0X5o
	ORrLxqmtm521DOubFcnj2cmy//sq9WmSknzDnjxUT2wXI=
Received: from [IPV6:2409:8900:1a87:d0a0:9d82:6fdf:5e33:6bcb] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3dyEQwc5qXTIdEQ--.4112S2;
	Wed, 14 Oct 2026 07:38:57 +0800 (CST)
Message-ID: <00af14f7-20a7-46db-a611-b42097d87049@163.com>
Date: Wed, 14 Oct 2026 07:38:56 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: avoid unnecessary padding in uapi structure
To: Arnd Bergmann <arnd@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261013204931.2287813-1-arnd@kernel.org>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261013204931.2287813-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3dyEQwc5qXTIdEQ--.4112S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFW3Xry3Aw45KF45Xr15XFb_yoW8Jw13pF
	n3Gw1xGFZrWF1UCwsFkFWftF40qw4UKa4YkrW29w1jkFWaqFyvqrWv9r409ryktrWkua1Y
	qF9rKFy5Cw1qvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2oGLUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RLCjWrOwRIKgQAA3I



在 2026/10/14 04:49, Arnd Bergmann 写道:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Building the uapi headers with -Wpadded shows a warning that
> may indicate an incompatibility:
> 
> ./usr/include/linux/ntfs.h:91:1: error: padding struct size to alignment boundary with 4 bytes [-Werror=padded]
> 
> This is relatively harmless here as the 64-bit members force natural
> alignment, so this is not a problem for compat ioctls, and I checked
> that the padding word is still initialized by means of using kvzalloc()
> to allocate it, but it's better to avoid the padding out of
> principle.
> 
> Change the reserved member to use a 64-bit type so the name field
> starts after the structure and all padding is explicit.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   include/uapi/linux/ntfs.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/ntfs.h b/include/uapi/linux/ntfs.h
> index f5b3d4997a56..89467ba07262 100644
> --- a/include/uapi/linux/ntfs.h
> +++ b/include/uapi/linux/ntfs.h
> @@ -86,7 +86,7 @@ struct ntfs_stream_entry {
>   	__aligned_u64 alloc_size;
>   	__u32 name_len;
>   	__u32 name_offset;
> -	__u32 reserved;
> +	__aligned_u64 reserved;
>   	__u8 name[];
>   };
>   

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

