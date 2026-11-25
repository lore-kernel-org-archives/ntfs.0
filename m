Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612262;
	b=WhTACWVfz+52RVquhDTPvEQx8LIBYksi5/4/O1DDQlFfsBh/Oxp4cqUKVQaBfOFlBzn7
	 g8FpmxsyxXqXkES8PRzsrxFOplns5bJ30xLDv2u/kgZUXEE26mtmnTjxKhpfObhvrYMWu
	 +7nx1s09+ynXuIsEQfd0HGKYy89CR9XqP8bsbzyJ3bLD/oDTU5NH6gk6Iv13Zz24gMAXZ
	 QRHLheukjMyCa1QWbZDZJEAKDucltKcEKBwAYhMxzGrXBtMObd2CjgR2n2sZEfnyAvSHd
	 07wJMRGoddpC6PK88o2Q3qaOhnNztswDhUi8KtiT127mn+TAV0BBa2lEzmOpQZdVOGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612262;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=iYX6GmZGqJUOXI0Icv8Oa/hgvoCNbBUBkFsvoL592y4=;
	b=Ve4xv0sG8GKbhgXYOJTdmupoKnXE9HpTC5jWUEIdNbaMYBBlTXmi8PNjWDT4oUWVezgv
	 PYA12s6q/kAO46ykE1wpfzUnUeztlqrPxlc1mK5OQWMOa+UqTNZ/9EG3DpJS+/EgAa/T2
	 h/USKKclWU5JZms/fYPtM+N7G3NRy9jgkgHLED9pGvfIufu/LfeMqfTlEzl1hLhWwqpD4
	 bNVc6e62IESmhsjEoKs2AT51LJjjKo2ymkTx4Cz3+l9LKm2qqwzk3OHXtfFKD12XyFjHI
	 TCJxrg6JcKxkSzQ9/JxYKgDcBzEkTWfAW/ciPJQSplbFdMDN5JWN/1yhn759SiVVRvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CDud+JTD;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC160606A321
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 13:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC160606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CDud+JTD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=iYX6GmZGqJUOXI0Icv8Oa/hgvoCNbBUBkFsvoL592y4=;
	b=CDud+JTDHA9LpbKaDtkrx0KGhPJhP/aUi7J2ACKFYSej9kmbdRtAdfvgi99bGb
	04HepioXElfl9CRFgOa25HF3S1QftAV4dbwPdVEg8J6klWN9HMGCVq0IDaA/SqRC
	hL2ibwKGA4c8VNAJvK5iHFv7IpcYfLlbyEt0Qt3Mo+dGQ=
Received: from [IPV6:2409:8900:1a90:8163:5fb3:f207:88ec:aa89] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCXcyBL3gZr5WLFKA--.8345S2;
	Wed, 25 Nov 2026 21:10:37 +0800 (CST)
Message-ID: <d62e976d-59c0-406f-b4e6-2904c1a5eedf@163.com>
Date: Wed, 25 Nov 2026 21:10:35 +0800
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
Subject: Re: [PATCH v2] ntfs: prevent modification of $Extend system metadata
To: Namjae Jeon <linkinjeon@kernel.org>, hyc.lee@gmail.com
Cc: liubaolin@kylinos.cn, ntfs@lists.linux.dev,
 theBIT5 x3zk <x3zk@outlook.com>
References: <20261125112226.96786-1-linkinjeon@kernel.org>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261125112226.96786-1-linkinjeon@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXcyBL3gZr5WLFKA--.8345S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw18Kw43GFyfur18tFW5ZFb_yoWrAr13pr
	Z5CF1a9rsrA34j9FnakF4jqryF9rZ7Xa1jqr9FgF17A3Z5W34qgF4Iyw4Fgr48GrWfC3yj
	q3Wqv3yUCF4UZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR-18dUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6g0n8WsG3k37NAAA3A



在 2026/11/25 19:22, Namjae Jeon 写道:
> The $Extend directory contains system files such as $ObjId, $Quota, and
> $Reparse. show_sys_files only controls directory enumeration, so hidden
> system metadata remains reachable by explicit path. With the default
> mount options, forced immutability covers reserved regular files,
> allowing removal of $Extend and its entries. This can make later mounts
> fail when load_system_files() opens FILE_Extend.
> 
> Make FILE_Extend and its direct children immutable independently of
> sys_immutable. Classify the children during inode loading so protection
> covers directories and files with an unnamed $DATA attribute. This
> prevents userspace from changing directory entries or writing to the
> protected files. Return -EPERM for file flag updates before writing
> the $LINUXFLAGS EA or updating ctime.
> 
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Reported-by: theBIT5 x3zk <x3zk@outlook.com>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
> ---
> Changes in v2
> - Use Baolin's inode-loading change with the existing lookup helper.
> - Block file flag writes with a direct check in ntfs_fileattr_set().
> 
>   fs/ntfs/file.c  |  4 ++++
>   fs/ntfs/inode.c | 19 +++++++++++++++----
>   fs/ntfs/inode.h |  3 +++
>   3 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 7d93a520566e..612498b45fbb 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -231,6 +231,10 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
>   	if (fa->flags & ~allowed)
>   		return -EOPNOTSUPP;
>   
> +	/* File flag updates would modify $Extend metadata. */
> +	if (ni->mft_no == FILE_Extend || NInoExtendSys(ni))
> +		return -EPERM;
> +
>   	forced_immutable = ntfs_is_forced_immutable(vi);
>   	if (!(fa->flags & FS_IMMUTABLE_FL) && forced_immutable)
>   		return -EPERM;
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 4fbdcd459652..3aac1d7d310f 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -960,6 +960,15 @@ skip_attr_list_load:
>   		goto unm_err_out;
>   	}
>   
> +	/* Classify $Extend children regardless of their data or index layout. */
> +	if (ni->mft_no >= FILE_first_user) {
> +		err = ntfs_is_extended_system_file(ctx);
> +		if (err < 0)
> +			goto unm_err_out;
> +		if (err > 0)
> +			NInoSetExtendSys(ni);
> +	}
> +
>   	if (ni->flags & FILE_ATTR_REPARSE_POINT) {
>   		unsigned int mode;
>   
> @@ -1307,11 +1316,13 @@ no_data_attr_special_case:
>   
>   	/*
>   	 * System files such as $Bitmap and $MFT are maintained by the driver
> -	 * itself, and writing them from userspace corrupts the volume.
> -	 * Always make them immutable regardless of the sys_immutable option.
> -	 * Directories are skipped so the root and $Extend stay usable.
> +	 * itself. Always make them immutable regardless of the sys_immutable
> +	 * option. Protect $Extend and its system files too; modifying them
> +	 * through the VFS can corrupt NTFS metadata.
>   	 */
> -	if (ni->mft_no < FILE_first_user && S_ISREG(vi->i_mode))
> +	if (NInoExtendSys(ni) ||
> +	    ni->mft_no == FILE_Extend ||
> +	    (ni->mft_no < FILE_first_user && S_ISREG(vi->i_mode)))
>   		vi->i_flags |= S_IMMUTABLE;
>   
>   	/*
> diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
> index 7ea52c59c04b..8c1929bebe44 100644
> --- a/fs/ntfs/inode.h
> +++ b/fs/ntfs/inode.h
> @@ -182,6 +182,7 @@ struct ntfs_inode {
>    * NI_HasEA			ntfs inode has EA attribute.
>    * NI_RunlistDirty		runlist need to be updated.
>    * NI_StreamUnlinked		Named stream is unlinked but still open.
> + * NI_ExtendSys			Inode is a system file in $Extend.
>    */
>   enum {
>   	NI_Dirty,
> @@ -204,6 +205,7 @@ enum {
>   	NI_HasEA,
>   	NI_RunlistDirty,
>   	NI_StreamUnlinked,
> +	NI_ExtendSys,
>   };
>   
>   /*
> @@ -265,6 +267,7 @@ NINO_FNS(BeingDeleted)
>   NINO_FNS(HasEA)
>   NINO_FNS(RunlistDirty)
>   NINO_FNS(StreamUnlinked)
> +NINO_FNS(ExtendSys)
>   
>   /*
>    * The full structure containing a ntfs_inode and a vfs struct inode. Used for
> 
> base-commit: f674e4b6c315ebe742d08af80659386992d58ce9

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

