Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610547;
	b=PepnMn1s5zeyFpjUlg1GUTScQrWsLBN/g572oYLHWZJeyHcY79I5Pf+/PGnkIIgGBMb1
	 BVOzAr+aseWVcT2S6G9hZxuSYsN4bI5BPRe4250q3oT6yKbMsLs/gsdi0HWx1zZ2L6Ecp
	 +VqYjBJaR3BdiqP7VC+nkgQGC10vDguIdUz5hy/KW86yI3TSxC9HLl1VnBbEw3lh9SHzF
	 zdvU3H8szGJt6/dT4rSZDEq3gsBviQ3MZWDrXji+MorOYsG75bzBPQGLg9oECNbTekKsH
	 NjTTJsdF6ZPjBVYiYjO2g4mavjbJTWjdi63e6VZh+cOvzsQ+UmxPCzcn29p3kRlYHLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610547;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=MB00HLGLGdwnje1QQ1sMTnV/j2Yp3sGWV2N/w2Rs3oM=;
	b=GK/0JzJ20feptleBFT8GZ+W6M0w4yCOURSsOBEJ5uYumamHGqvdrSAdiZg5BBc/QDxWk
	 zMPOE5XhGPsvbRj9Cu6LdkjVpQwvISZ5K/akbhVYTXjZ4UjOfC77MwLbCP49C4QpPSR21
	 QBTIjNNkBwpkIMSLHtAJLp6hwsSeFTvMWMnl9kFRuOPbkjCQU7/WazN8Dbq+OXNi8WBJO
	 cMwT6K7dyqtUZseudpG27qQKBvJ17603tVdjeDm3RwuShfJnlvXAXylOordp4bW23pTF6
	 Qu8cvzZy8Bfd4joq4xzurVeclK0BRv4mbSmTWn1aFBPrkdk2o/CxJvZSwmjqFhkp0Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="YojFOY/9";
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABF3606A326
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 12:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DABF3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=YojFOY/9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=MB00HLGLGdwnje1QQ1sMTnV/j2Yp3sGWV2N/w2Rs3oM=;
	b=YojFOY/90n4nRyf3GdhLh3HzOuwrC8WcWIRTe1Y7WDYYad/v2+5giuUUz0Meji
	LVXiZlj/zx8GrAdk7I/SGfXryZrYGiCqovpTh3dp0MoMBMN4rexYN9VmrXO2Xqem
	70qNLKXW75MlBydw9BZbviSSe0PsXstcIwRyFt3N1wd1c=
Received: from [IPV6:2409:8900:1a90:8163:5fb3:f207:88ec:aa89] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBXHs6W1wZra32SJw--.7223S2;
	Wed, 25 Nov 2026 20:41:59 +0800 (CST)
Message-ID: <9cb7cd4e-a7ba-4d14-bf39-2910181e8a78@163.com>
Date: Wed, 25 Nov 2026 20:41:57 +0800
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
Subject: Re: [PATCH v2] ntfs: guard the final LZNT1 sub-block header read
To: shaos <shawnq1@163.com>, linkinjeon@kernel.org
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <179558384099.146091.12975349907127521352@163.com>
 <20261125085004.1816027-1-shawnq1@163.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261125085004.1816027-1-shawnq1@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXHs6W1wZra32SJw--.7223S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4fWr4fWr4UXFWrGF4kZwb_yoW8ZF1Upr
	9xKFWrtrn7Xr17trs7Kw4rKryfCay8J3WUGFyUtr45Aan8G3ZagF18KFykGr4UKrZ3Zw1D
	ZFs8Wa97CFn0vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR-18dUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Rd3QmsG15fiSQAA3N



在 2026/11/25 16:50, shaos 写道:
> The legacy NTFS LZNT1 decompressor reads a 16-bit sub-block header
> before checking that the full header remains in the compression
> buffer. If only one byte remains, the read crosses the end of the
> 64 KiB buffer.
> 
> Return -EOVERFLOW for an incomplete header while preserving successful
> termination when the buffer is exactly exhausted. Validate phrase-token
> length against the sub-block boundary before reading it.
> 
> Tested on x86-64 with QEMU. The original header-boundary reproducer
> and a phrase-token boundary reproducer no longer fault; both malformed
> streams are rejected with -EOVERFLOW. The one-byte control still
> returns byte 'A'.
> 
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
> Signed-off-by: shaos <shawnq1@163.com>
> ---
>   fs/ntfs/compress.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index 82c7c7d290737..c7c520d31c53d 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -200,10 +200,11 @@ do_next_sb:
>   			cb - cb_start);
>   	/*
>   	 * Have we reached the end of the compression block or the end of the
> -	 * decompressed data?  The latter can happen for example if the current
> -	 * position in the compression block is one byte before its end so the
> -	 * first two checks do not detect it.
> +	 * decompressed data?
>   	 */
> +	if (cb != cb_end && cb_end - cb < sizeof(__le16))
> +		goto return_overflow;
> +
>   	if (cb == cb_end || !le16_to_cpup((__le16 *)cb) ||
>   			(*dest_index == dest_max_index &&
>   			*dest_ofs == dest_max_ofs)) {
> @@ -384,6 +385,10 @@ do_next_tag:
>   		for (i = *dest_ofs - do_sb_start - 1; i >= 0x10; i >>= 1)
>   			lg++;
>   
> +		/* Make sure the phrase token is fully within the sub-block. */
> +		if (cb_sb_end - cb < sizeof(__le16))
> +			goto return_overflow;
> +
>   		/* Get the phrase token into i. */
>   		pt = le16_to_cpup((__le16 *)cb);
>   

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

