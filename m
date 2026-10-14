Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BAD222597
	for <ntfs@lists.linux.dev>; Wed, 14 Oct 2026 01:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791941740; cv=none; b=jtZaBWIDkS4j9unJSM+kjezSzOhvAlTqnsu/svV85vl9OwsuQB6we7pIbrg1N2XeEwS1GCKW09HiFELFTJUBmetA9znYo1+gU1yLOQKjCuqyexm5y3jJY0sfTCyC1mgtddanhZng8Fhn3aTvIWphGhAXIkkDqbltpQdqfT2Hzls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791941740; c=relaxed/simple;
	bh=X/pd6ocYaGbl1O9wiK83fbDQwE4I3DlCpEFq2etAkY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iyz1UbujMeUlaDj9v1L75mGH0SUrV4TNR3kdu9hFTtSB0N2xq0k18Mfps5GTHL0Ymi4wfpUOy8FF+n7NTngkw/xaPnPmeFkGCNUxt8aSz0OaCRXoiFcKNsYCUf47tUmtRqFHrox0pxWYAzHmfPGWUAW56XV8L0o/Iw/x4sw0Myg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZjOsZiWG; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZjOsZiWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=C94zaAN9A0TMB4WBqu99jC2MxYW8dS4sJdU6B0/H454=;
	b=ZjOsZiWGenZ5wBXt70Rha5ySwFX9nTCKE1GbFfiWCl1oj31IQjcQZpfPKzcQQd
	ik0VyFMlQxcGeEiqnw5x0+FlO/GSKJ8RDwuTO67/grlBU3un5QbIHOY+E/ppARjn
	0ChQgpRxWYJ12SH+Hmq6/sj/v8YGGGmj5IPJyd9ko67Oc=
Received: from [IPV6:2409:8900:1a87:d0a0:9d82:6fdf:5e33:6bcb] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDHrapU3M5qHX8IEg--.55453S2;
	Wed, 14 Oct 2026 09:35:18 +0800 (CST)
Message-ID: <95d849be-0e81-41dd-a508-ef46fad08c3d@163.com>
Date: Wed, 14 Oct 2026 09:35:16 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ntfs: report birth time for symbolic links
To: Xuewen Wang <wangxuewen@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261014011824.493241-1-wangxuewen@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261014011824.493241-1-wangxuewen@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDHrapU3M5qHX8IEg--.55453S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWDWryrGw45Xw1rGFy8Zrb_yoW8Gr1xp3
	yfA3WYkanrJrW7W392kF4qg3WY9ayfWr4jgr1DXr1xC3Z8Jwn7KFWqq3W0kF40yrykJr1q
	qr1Igr4UWr15ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2zuZUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RaaZWrO3FZTSgAA33



在 2026/10/14 09:18, Xuewen Wang 写道:
> NTFS already loads the creation time into i_crtime and reports it through
> ntfs_getattr(). However, the symbolic-link inode operations omit getattr,
> so statx() with AT_SYMLINK_NOFOLLOW falls back to generic_fillattr() and
> does not return STATX_BTIME for the link itself.
> 
> Use ntfs_getattr() for symbolic links to expose their stored creation time.
> 
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> ---
> Tested in QEMU with WSL and native symlinks, including dangling links and
> links to directories. Birth times survive inode cache eviction, remounts
> and a fresh boot. Queries that follow a link still report the target's
> creation time.
> 
>   fs/ntfs/file.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 58afd310d57b..58aad7f5c6c5 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -1556,6 +1556,7 @@ const struct inode_operations ntfs_file_inode_ops = {
>   const struct inode_operations ntfs_symlink_inode_operations = {
>   	.get_link	= ntfs_get_link,
>   	.setattr	= ntfs_setattr,
> +	.getattr	= ntfs_getattr,
>   	.listxattr	= ntfs_listxattr,
>   	.fileattr_get	= ntfs_fileattr_get,
>   	.fileattr_set	= ntfs_fileattr_set,

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

