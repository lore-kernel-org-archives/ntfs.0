Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139120;
	b=XeXGIwnbttCaGC8fTJkE4z4zqsMEB3fAsLLBTVm6r9Z8oeTZaGqTd/OLvyKVqfuy64cc
	 ER6POTN2iajeqWKEy3BC3/aJar9aTOog03q+4yp0dYd8ohPV010WYnDNWz8JdATNeu84P
	 NK3I81aB5YfQi8GJU1M0Q8VGct4BSgVKuIFpkTPJNi9iPTeMCGn40K12WTuoB3FvvShCI
	 1fe2IWgz9Xqw1r4vGmXsgqnhT1tA92ptk5EdxEW6sPtlyN9xeRIzyGhwaFv28v+rrMMIv
	 hLFKAENxre87d6LUelQO7LrzKQ/PpiMr8/Nk+Sj31CrR0yt9p/mtTeJHjNitigmriJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139120;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=gQNE6VoRIAEfn1/Gt+xe9s768TekISgng+U/sAxGZco=;
	b=e9C711LPe7Y1x7Oa/vMgWlccP7asuL3h8OK4ZDyWs3q0kJQ9uffRqL1bL65ZtGuoHsRP
	 t53g0skQM7cG0nWwIOiJCtX+SASOQeQeIDJmWYMuMNL76kpMd0Dker0N8iVqI3r2VbyaC
	 iLuMhItShnengsq9f/WCz1IcYnQKnX38Tn/xOlk034xFP3hgGaGAjEMRKl/nClqobAmbh
	 O/zGQZWzOyol0/Vu33RWOh2pn+i+FpAxuxvYheSPERbNkqSPgrk8bM8rRLmOzXNUmYCgX
	 Y9y1XxY5fMgg4ZzfHXuhRCKuO5EGhTb3xeO4Vj7cKCPnV7hdxfgAxB3QQVLfRnwBFHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=YDXqRcj6;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6348A606A320
	for <ntfs@lists.linux.dev>; Fri, 20 Nov 2026 01:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6348A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=YDXqRcj6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=gQNE6VoRIAEfn1/Gt+xe9s768TekISgng+U/sAxGZco=;
	b=YDXqRcj6ObJUq6MocuEfu2gr3tmfEC5nY5XxC4cd8yxxA1yi8tVzJowIU0EFj3
	0bzmU3YCJ/YcDtVlpgBynvQA/LC+IHuleFdcENeblk8P60KrN24A6EujILN6Mm17
	+YZ0DPtIfzdu7lmsNnIK7CX1b8viameSWzjLpmztiRFsc=
Received: from [IPV6:2409:8900:1e87:c681:e0d9:72d0:20c3:a0ec] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBXFj3xpf9qSfVNHA--.38048S2;
	Fri, 20 Nov 2026 09:44:19 +0800 (CST)
Message-ID: <8898e174-62fe-42f5-8eef-25f411dded61@163.com>
Date: Fri, 20 Nov 2026 09:44:17 +0800
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
Subject: Re: [PATCH] ntfs: use kzalloc_flex() for FILE_NAME attributes
To: Hyunchul Lee <hyc.lee@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Cc: Baolin Liu <liubaolin@kylinos.cn>, ntfs@lists.linux.dev
References: <20261120005105.2718500-1-hyc.lee@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261120005105.2718500-1-hyc.lee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgBXFj3xpf9qSfVNHA--.38048S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrGryfXFy8Zw4rXw48Crg_yoW8GrW7pF
	Z2934jy3y3Jryj9anrtr4qv3yYgay2gr4UGryjkw4akrnYqwn8KFyDK34v9ws3AFykuryr
	Xa1DtFyxXF9rZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziWEEUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hNAC2r-pfNLRAAA3+



在 2026/11/20 08:51, Hyunchul Lee 写道:
> Allocate the variable-length FILE_NAME attributes with kzalloc_flex()
> and use struct_size() to calculate the attribute length.
> 
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
> ---
>   fs/ntfs/namei.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
> index 67f1d7eecf2b..f3c6911a1bc1 100644
> --- a/fs/ntfs/namei.c
> +++ b/fs/ntfs/namei.c
> @@ -672,8 +672,8 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
>   	}
>   
>   	/* Create FILE_NAME attribute. */
> -	fn_len = sizeof(struct file_name_attr) + name_len * sizeof(__le16);
> -	fn = kzalloc(fn_len, GFP_NOFS);
> +	fn_len = struct_size(fn, file_name, name_len);
> +	fn = kzalloc_flex(*fn, file_name, name_len, GFP_NOFS);
>   	if (!fn) {
>   		err = -ENOMEM;
>   		goto err_out;
> @@ -1387,9 +1387,8 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
>   	}
>   
>   	/* Create FILE_NAME attribute. */
> -	fn_len = sizeof(struct file_name_attr) + name_len * sizeof(__le16);
> -
> -	fn = kzalloc(fn_len, GFP_NOFS);
> +	fn_len = struct_size(fn, file_name, name_len);
> +	fn = kzalloc_flex(*fn, file_name, name_len, GFP_NOFS);
>   	if (!fn) {
>   		err = -ENOMEM;
>   		goto err_out;

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

