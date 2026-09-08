Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947FC328616
	for <ntfs@lists.linux.dev>; Tue,  8 Sep 2026 04:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788842313; cv=none; b=ks9nAD3afVPFkw7ee1eheJEefE23I++oJc/jku3TeXfAwm36obqYc6Tj+7MlL7IC2mLDyjrfd7BmCZHJs5mEc5/ZMEFbS/yd9NJdJA56z4o0jySTgjrTfHhQ4sGe7UwkzM8hlByHJ23KausK4R362PZiUWGPbX0fDw9i9tNmook=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788842313; c=relaxed/simple;
	bh=wLlhrdT0oDmwohDiFE29sGQwmDCJ5nOs7ldivlWwLRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISsVxn8m1Ji69XF1mGAy5PgByayB8c6GZh+Oy3jeTFsA4nqgPOUPqIJpz5BLOJEZplw7jL079v9kTOT9sOIYF022c6lapMXdhabjlZMGgJ6ufTAIyrq9y47EtMgS/F09f/6sb3PBDVcI1S7vCQS793R8xMCRlY+RXSgMnBLhi1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=a0zzPrYj; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="a0zzPrYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=Q9GM3GoVZAGmy0fKxgP5IztoBVi7MK2Pr1HkOGTNO8c=;
	b=a0zzPrYj//5G6GSJbatNISSbkCuYEXSjdVc6cJG7liGZiV0AGuhzoUblyndbXI
	4DswmUXrPxXSfclHcAErnnLVc5fevUcotQrxR3GDnft2Qx2VrvTR9ZpjAqaAg8q/
	o0d4APQeJT6dr2BOeEhxE3rXUwVRqIvotYrl2g78kovtw=
Received: from [IPV6:2409:8900:1e93:d74:46a:b98a:2b32:6a19] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDHdwcukZ9q9IGoPA--.7317S2;
	Tue, 08 Sep 2026 12:38:07 +0800 (CST)
Message-ID: <49ad7078-dbd9-44c4-b824-21fe0c0cede6@163.com>
Date: Tue, 8 Sep 2026 12:38:06 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ntfs: NULL vol->vol_ino in the load_system_files()
 error teardown
To: Hongling Zeng <zenghongling@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, stable@vger.kernel.org
References: <20260907070852.291323-1-zenghongling@kylinos.cn>
 <20260907070852.291323-4-zenghongling@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260907070852.291323-4-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDHdwcukZ9q9IGoPA--.7317S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw43uF4xCw4kuryUKrWkCrg_yoW8urWfpF
	Zayr12g3yDJFyjk3sF9FWIvF15Zw1ku3yrCr93Z39Fqan3KF1q9w1Utry5WFy8Kr4kCw1j
	qF4qkr18Wr4UWrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U-Z2fUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhDyvWqfkTDjaAAA3C



在 2026/9/7 15:08, Hongling Zeng 写道:
> The error unwind of load_system_files() drops vol->vol_ino on two
> paths but leaves the stale pointer in place while it keeps iput()ing
> the remaining system inodes ($Bitmap, $MFT bitmap, $MFTMirr; $MFT
> itself is dropped by the caller, ntfs_fill_super()).  A third path
> carried an iput() that can never execute: it sits inside the
> IS_ERR(vol->vol_ino) branch guarded by !IS_ERR(vol->vol_ino), and is
> removed along with the stale pointers.  Nothing in the teardown
> dereferences vol_ino today, so this is pure hygiene, but a stale
> pointer to a freed inode surviving the unwind is a trap for any
> future code walking the volume during teardown.
> 
> ntfs_put_super() and the ntfs_fill_super() error path already NULL it
> after their iput(); do the same here.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>   fs/ntfs/super.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 4b4af1ea8b09..2d4132aa39d3 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -1541,8 +1541,7 @@ static bool load_system_files(struct ntfs_volume *vol)
>   	 */
>   	vol->vol_ino = ntfs_iget(sb, FILE_Volume);
>   	if (IS_ERR(vol->vol_ino)) {
> -		if (!IS_ERR(vol->vol_ino))
> -			iput(vol->vol_ino);
> +		vol->vol_ino = NULL;
>   volume_failed:
>   		ntfs_error(sb, "Failed to load $Volume.");
>   		goto iput_lcnbmp_err_out;
> @@ -1551,6 +1550,7 @@ static bool load_system_files(struct ntfs_volume *vol)
>   	if (IS_ERR(m)) {
>   iput_volume_failed:
>   		iput(vol->vol_ino);
> +		vol->vol_ino = NULL;
>   		goto volume_failed;
>   	}
>   
> @@ -1716,6 +1716,8 @@ static bool load_system_files(struct ntfs_volume *vol)
>   	if (vol->logfile_ino)
>   		iput(vol->logfile_ino);
>   	iput(vol->vol_ino);
> +	/* Do not leave a stale pointer behind for the rest of the teardown. */
> +	vol->vol_ino = NULL;
>   iput_lcnbmp_err_out:
>   	iput(vol->lcnbmp_ino);
>   iput_attrdef_err_out:

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

