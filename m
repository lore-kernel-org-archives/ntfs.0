Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BC63264F4
	for <ntfs@lists.linux.dev>; Wed,  2 Sep 2026 06:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330272; cv=none; b=OXWhsvxRKe1YM+C/neS9HWw+LsdJoBT8QSoFdAGHoKiKiK/7ZJHmKt9R7s1iTdlUmzAZPq2baIzOoceLJkWvxHCd3fFwJe7I1lc/ug8Od2sxYgWuUQ2hOtJZaybZw5WRF0sslY7cPtOut3xVe6KfiklFxnjcRkapLwHm16VvHT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330272; c=relaxed/simple;
	bh=brng0bRiT5cu3/DYRbYdWoiHwfhUS4jDWa0VC9+jKSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNSd0s1/VT8fH/nJgGTfzU5VMIUIr5UcPH5Z2O5zp0ZqRGJ6Q7rbX3i0MNbnlyrUZT6fAnBdoP9EQnNRXA3vVxKaB+3QdIvAWdYul7kiOa9HIpm8qmks/aq3iiZ+fUStYUyK8H5IxZ//7qMH/+/ZXPLBnNk2l9DRzFEttkQh7bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OMQYCV5z; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OMQYCV5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=cpnqEjO6iI7zgkL8DSulCWgeDzfK9i3xYT6V2zEnq1M=;
	b=OMQYCV5z/B6MLTTf0EI3q0dECQ2wBjYcbS5GgaubhZOuM7B23Om01mb3atiUSX
	Nm3Z+POl+FE/WetP/d8eNmwrhwywBP7XJZxGaDlh1gSIqjde0WGoHmzXwIjA3GpT
	8+cIf9YhlhktW8YMYM00YEOF2uqlKhLFryol/FGde+fcw=
Received: from [IPV6:2409:8900:1ef4:8f82:6ff7:7c40:6535:9660] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCXPysIwZdq0qoYPg--.10717S2;
	Wed, 02 Sep 2026 14:24:11 +0800 (CST)
Message-ID: <ccf7802c-45d8-4113-8994-50346427ee08@163.com>
Date: Wed, 2 Sep 2026 14:24:08 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs: fix -Wmaybe-uninitialized warning in
 ntfs_ioctl_fitrim
To: huhai <15815827059@163.com>, linkinjeon@kernel.org, hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, huhai <huhai@kylinos.cn>
References: <20260902032006.173174-1-15815827059@163.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260902032006.173174-1-15815827059@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgCXPysIwZdq0qoYPg--.10717S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF48Zr13Kr48tFyUuFykXwb_yoW5Gr47pF
	9xuw1kKrW8ZrWjg34qyw45Zry0qwnrW392vr95Ww17XFWfKrykKFn0gw40krs7trWDKa1x
	KFy293y5Ww1DZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U24iUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwgvyvWqXwQu-gwAA3N



在 2026/9/2 11:20, huhai 写道:
> From: huhai <huhai@kylinos.cn>
> 
> With CONFIG_KASAN, CONFIG_WERROR and -Wmaybe-uninitialized enabled,
> GCC 16.2 reports that range may be used uninitialized in
> ntfs_ioctl_fitrim():
> 
>    CC [M]  fs/ntfs/file.o
> In file included from ./include/asm-generic/rwonce.h:26,
>                   from ./arch/arm64/include/asm/rwonce.h:81,
>                   from ./include/linux/compiler.h:369,
>                   from ./arch/arm64/include/asm/current.h:5,
>                   from ./include/linux/sched.h:12,
>                   from ./include/linux/writeback.h:8,
>                   from fs/ntfs/file.c:9:
> In function 'instrument_copy_from_user_before',
>      inlined from '_inline_copy_from_user' at ./include/linux/uaccess.h:184:2,
>      inlined from 'copy_from_user' at ./include/linux/uaccess.h:222:9,
>      inlined from 'ntfs_ioctl_fitrim' at fs/ntfs/file.c:845:6,
>      inlined from 'ntfs_ioctl' at fs/ntfs/file.c:876:10:
> ./include/linux/kasan-checks.h:38:27: error: 'range' may be used uninitialized [-Werror=maybe-uninitialized]
>     38 | #define kasan_check_write __kasan_check_write
> ./include/linux/instrumented.h:146:9: note: in expansion of macro 'kasan_check_write'
>    146 |         kasan_check_write(to, n);
>        |         ^~~~~~~~~~~~~~~~~
> ./include/linux/kasan-checks.h: In function 'ntfs_ioctl':
> ./include/linux/kasan-checks.h:20:6: note: by argument 1 of type 'const volatile void *' to '__kasan_check_write' declared here
>     20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
>        |      ^~~~~~~~~~~~~~~~~~~
> fs/ntfs/file.c:833:29: note: 'range' declared here
>    833 |         struct fstrim_range range;
>        |                             ^~~~~
> 
> copy_from_user() initializes the entire structure on success, but GCC fails
> to recognize this after the KASAN checks are inlined. Zero-initialize range
> to avoid the false positive.
> 
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: huhai <huhai@kylinos.cn>
> ---
>   fs/ntfs/file.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 88747217ba61..9bc979af4031 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -830,7 +830,7 @@ static int ntfs_ioctl_set_volume_label(struct file *filp, unsigned long arg)
>   static int ntfs_ioctl_fitrim(struct ntfs_volume *vol, unsigned long arg)
>   {
>   	struct fstrim_range __user *user_range;
> -	struct fstrim_range range;
> +	struct fstrim_range range = {};
>   	struct block_device *dev;
>   	int err;
>   

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

