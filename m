Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696257;
	b=CP2XZVO/64EsV6jtWd9WCYkcWWVIbv8K+usfHTvk7LDLZ2WH56bC/oCJOQEDFsVpJprZ
	 h0jfLFmxWNYKP/cym7rOUV6FmJ990+Ss11fWpAephC4OChuMemTsY62kJh3vdsZRJAM8F
	 rIgEjzTLAKKN3X2DQ6SATwOuGAk5w0PajeQ33B8VTsANQljT7XqGknIUdP5EozxphqxO5
	 HJn6CHDMw+xdTzBf14CB/HGrwr3vyPGABHhtHDc0EAcuRbqMDe4lNC2Pzhs87DIOxBP8v
	 eLB0fPFYABf2vPdN34umOn/XMDR2PUvL0eG54u8UKbHUh+uf7YDnMknh2JOmlrU8YrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696257;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=H85SpE2LlkLNp9tLUNmM3H1oGmoh72e/RdEzmkGk3Bo=;
	b=iv6ILi8As80/Bndz+6t8c7/rK/yylOkWbx5MYIr64j578dKmFNCfs7ZZ9XRFph35cIl6
	 Xfom+wKnrPrzdMiwY7OvbMSfSfTnjKGEaJF9zHGAGs8RVrIy+bKFAF/HakhS+q8Z4Vgtc
	 hDX49UOYuoTWgSSr6f9cxW1fuvmaRYDnedVOpm1FiLIMN0kPaYHRj7cwz7EhQuV6thsUg
	 ZD2IWTmQCukTqGGhPjtABkBAA19H9B7M3Gxz0T/Tdzx0SIjUC9g2xno5EL0hLGaLrihvx
	 q3DSZX7q5/Uo1IG5lNAk/qqNbREn9SJ/UKiigW4US68oYLow3XY8KBldHT3J9FyMekA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RxnXpRDy;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03017606A31E
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 12:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03017606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RxnXpRDy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=H85SpE2LlkLNp9tLUNmM3H1oGmoh72e/RdEzmkGk3Bo=;
	b=RxnXpRDy+bZQmvrWLqKE/Pe65R0EijgnLiFqFvif4muwDwsr31Bg8JW5KDDnF0
	VxbToxXPcHLxfcIPkx7qLHbhwJg6ylINEjyATqcKS0DNqF8DVS5BsT9C7yU9v/Ys
	Iq1o8EvUPAfkK/foE8tIb+61kgUB8oQF+cqe77/b50/30=
Received: from [IPV6:2409:8900:1fda:c14d:a943:bd11:7b57:b027] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3f+5dJghreGvTLA--.47196S2;
	Thu, 26 Nov 2026 20:30:23 +0800 (CST)
Message-ID: <823a5bb7-a3f5-4734-b589-c0a45fa4e441@163.com>
Date: Thu, 26 Nov 2026 20:30:21 +0800
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
Subject: Re: [PATCH] ntfs: fix false directory corruption on case-insensitive
 lookup of POSIX names
To: Hyunchul Lee <hyc.lee@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Cc: Baolin Liu <liubaolin@kylinos.cn>, ntfs@lists.linux.dev,
 Sazpaimon <sazpaimon@cultnet.net>
References: <20261126022939.1227362-1-hyc.lee@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261126022939.1227362-1-hyc.lee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3f+5dJghreGvTLA--.47196S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3XF43JF4Uur4kGw4fWFyrXrb_yoW3ur43pF
	ZakrsrXa9xJr17KwnakF4DJFyF9an7GF1jq34UWw1Ikwn5Wr1YvrW8Kry09FZ5JrWrJ392
	qa15WrWIqFyUXFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2zuZUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6h99SGsIJl+MTgAA3Y



在 2026/11/26 10:29, Hyunchul Lee 写道:
> On a case-insensitive mount, a directory index may legitimately contain
> two POSIX-namespace names that differ only by letter case. During
> a lookup, ntfs_lookup_inode_by_name() treated any second case-insensitive
> match as directory corruption, failed the lookup with EIO.
> 
> Keep the first case-insensitive candidate and continue the collation and
> B+tree traversal so an exact match is still found.
> 
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Reported-by: Sazpaimon <sazpaimon@cultnet.net>
> Link: https://github.com/namjaejeon/linux-ntfs/issues/99
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
> ---
>   fs/ntfs/dir.c   | 103 +++++++++++++++++++++++++-----------------------
>   fs/ntfs/super.c |   4 ++
>   2 files changed, 57 insertions(+), 50 deletions(-)
> 
> diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
> index a93f3566603b..2ff90852bccc 100644
> --- a/fs/ntfs/dir.c
> +++ b/fs/ntfs/dir.c
> @@ -54,8 +54,8 @@ static inline u64 ntfs_check_mref(u64 mref)
>    *
>    * Note, we look for a case sensitive match first but we also look for a case
>    * insensitive match at the same time. If we find a case insensitive match, we
> - * save that for the case that we don't find an exact match, where we return
> - * the case insensitive match and setup @res (which we allocate!) with the mft
> + * save the first match on the search path in case we don't find an exact
> + * match, where we return it and setup @res (which we allocate!) with the mft
>    * reference, the file name type, length and with a copy of the little endian
>    * Unicode file name itself. If we match a file name which is in the DOS name
>    * space, we only return the mft reference and file name type in @res.
> @@ -91,6 +91,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
>   	struct folio *folio;
>   	u8 *kaddr = NULL;
>   	struct ntfs_name *name = NULL;
> +	bool seen_nonposix = false;
>   
>   	/* Get hold of the mft record for the directory. */
>   	m = map_mft_record(dir_ni);
> @@ -191,13 +192,11 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
>   		}
>   		/*
>   		 * For a case insensitive mount, we also perform a case
> -		 * insensitive comparison (provided the file name is not in the
> -		 * POSIX namespace). If the comparison matches, and the name is
> -		 * in the WIN32 namespace, we cache the filename in *res so
> -		 * that the caller, ntfs_lookup(), can work on it. If the
> -		 * comparison matches, and the name is in the DOS namespace, we
> -		 * only cache the mft reference and the file name type (we set
> -		 * the name length to zero for simplicity).
> +		 * insensitive comparison. DOS names are matched this way even
> +		 * on a case sensitive mount. If the comparison matches and no
> +		 * candidate is cached, we cache the filename in *res for
> +		 * ntfs_lookup(). For a DOS name, we only cache the mft reference
> +		 * and the file name type (we set the name length to zero).
>   		 */
>   		if ((!NVolCaseSensitive(vol) ||
>   		     ie->key.file_name.file_name_type == FILE_NAME_DOS) &&
> @@ -210,29 +209,32 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
>   			u8 type = ie->key.file_name.file_name_type;
>   			u8 len = ie->key.file_name.file_name_length;
>   
> -			/* Only one case insensitive matching name allowed. */
> -			if (name) {
> +			/* Only one imperfect non-POSIX match is allowed. */
> +			if (type != FILE_NAME_POSIX && seen_nonposix) {
>   				ntfs_error(sb,
>   					"Found already allocated name in phase 1. Please run chkdsk");
>   				goto dir_err_out;
>   			}
> -
> -			if (type != FILE_NAME_DOS)
> -				name_size += len * sizeof(__le16);
> -			name = kmalloc(name_size, GFP_NOFS);
> +			if (type != FILE_NAME_POSIX)
> +				seen_nonposix = true;
>   			if (!name) {
> -				err = -ENOMEM;
> -				goto err_out;
> +				if (type != FILE_NAME_DOS)
> +					name_size += len * sizeof(__le16);
> +				name = kmalloc(name_size, GFP_NOFS);
> +				if (!name) {
> +					err = -ENOMEM;
> +					goto err_out;
> +				}
> +				name->mref = le64_to_cpu(ie->data.dir.indexed_file);
> +				name->type = type;
> +				if (type != FILE_NAME_DOS) {
> +					name->len = len;
> +					memcpy(name->name, ie->key.file_name.file_name,
> +							len * sizeof(__le16));
> +				} else
> +					name->len = 0;
> +				*res = name;
>   			}
> -			name->mref = le64_to_cpu(ie->data.dir.indexed_file);
> -			name->type = type;
> -			if (type != FILE_NAME_DOS) {
> -				name->len = len;
> -				memcpy(name->name, ie->key.file_name.file_name,
> -						len * sizeof(__le16));
> -			} else
> -				name->len = 0;
> -			*res = name;
>   		}
>   		/*
>   		 * Not a perfect match, need to do full blown collation so we
> @@ -447,13 +449,11 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
>   		}
>   		/*
>   		 * For a case insensitive mount, we also perform a case
> -		 * insensitive comparison (provided the file name is not in the
> -		 * POSIX namespace). If the comparison matches, and the name is
> -		 * in the WIN32 namespace, we cache the filename in *res so
> -		 * that the caller, ntfs_lookup(), can work on it. If the
> -		 * comparison matches, and the name is in the DOS namespace, we
> -		 * only cache the mft reference and the file name type (we set
> -		 * the name length to zero for simplicity).
> +		 * insensitive comparison. DOS names are matched this way even
> +		 * on a case sensitive mount. If the comparison matches and no
> +		 * candidate is cached, we cache the filename in *res for
> +		 * ntfs_lookup(). For a DOS name, we only cache the mft reference
> +		 * and the file name type (we set the name length to zero).
>   		 */
>   		if ((!NVolCaseSensitive(vol) ||
>   		     ie->key.file_name.file_name_type == FILE_NAME_DOS) &&
> @@ -466,30 +466,33 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
>   			u8 type = ie->key.file_name.file_name_type;
>   			u8 len = ie->key.file_name.file_name_length;
>   
> -			/* Only one case insensitive matching name allowed. */
> -			if (name) {
> +			/* Only one imperfect non-POSIX match is allowed. */
> +			if (type != FILE_NAME_POSIX && seen_nonposix) {
>   				ntfs_error(sb,
>   					"Found already allocated name in phase 2. Please run chkdsk");
>   				kfree(kaddr);
>   				goto dir_err_out;
>   			}
> -
> -			if (type != FILE_NAME_DOS)
> -				name_size += len * sizeof(__le16);
> -			name = kmalloc(name_size, GFP_NOFS);
> +			if (type != FILE_NAME_POSIX)
> +				seen_nonposix = true;
>   			if (!name) {
> -				err = -ENOMEM;
> -				goto unm_err_out;
> +				if (type != FILE_NAME_DOS)
> +					name_size += len * sizeof(__le16);
> +				name = kmalloc(name_size, GFP_NOFS);
> +				if (!name) {
> +					err = -ENOMEM;
> +					goto unm_err_out;
> +				}
> +				name->mref = le64_to_cpu(ie->data.dir.indexed_file);
> +				name->type = type;
> +				if (type != FILE_NAME_DOS) {
> +					name->len = len;
> +					memcpy(name->name, ie->key.file_name.file_name,
> +							len * sizeof(__le16));
> +				} else
> +					name->len = 0;
> +				*res = name;
>   			}
> -			name->mref = le64_to_cpu(ie->data.dir.indexed_file);
> -			name->type = type;
> -			if (type != FILE_NAME_DOS) {
> -				name->len = len;
> -				memcpy(name->name, ie->key.file_name.file_name,
> -						len * sizeof(__le16));
> -			} else
> -				name->len = 0;
> -			*res = name;
>   		}
>   		/*
>   		 * Not a perfect match, need to do full blown collation so we
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 39ff56cecf62..a87b47adb28d 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -1380,6 +1380,10 @@ static int check_windows_hibernation_status(struct ntfs_volume *vol)
>   	mref = ntfs_lookup_inode_by_name(NTFS_I(vol->root_ino), hiberfil, 12,
>   			&name);
>   	inode_unlock(vol->root_ino);
> +	if (!IS_ERR_MREF(mref) && name) {
> +		kfree(name);
> +		return 0;
> +	}

Hi Hyunchul,
    Could we remove the four lines above and keep the hibernation check?
name can also be set when the lookup finds a WIN32 filename that differs 
only in case.
   For example, with -o nocase, looking up hiberfil.sys can find a WIN32 
entry named HIBERFIL.SYS and return a non-NULL name.
    This early return would skip the file size and header checks and
treat the volume as not hibernated, even if the header contains the hibr 
signature.
    That could allow a read-write mount instead of applying the existing
read-only protection.

   With those four lines removed, the rest looks good to me.

Thanks,
Baolin.

>   	kfree(name);
>   	if (IS_ERR_MREF(mref)) {
>   		ret = MREF_ERR(mref);



