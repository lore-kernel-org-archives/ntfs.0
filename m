Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746921;
	b=gC5KjONg5IqV8bMTabmUyhv+BghbdfXhAYeX8sHGaT2aVsneJZ5Rpi0zD25etY/pHKVp
	 SaWrNZnHSBTBc45IiKyExB/UBS1AK+pcJmDouMhCfYFvdWHSoieDUV0YrAuOIH3G4oZi2
	 FQ79kW7ZhBmiIfk+Gv1lazEJW9RMk7Sfem3rCoqgURHSbTXa8iOnPKAtKwwRoSB5stT8l
	 3R3Y3DJ2BQiUF++iULLxz8GnSAdWeJvdAT1AaxsXFlVT43/k7T+KD3iO8hpr3T2Abd5JH
	 sZQxpIDrzBzHMEH4M3VkicoWW131VfVwWzgBHNxwBCgqnr9ImJmOEdWxG6KSOAP+IgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746921;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=FuK/rMcR6P+/z2BcvltHzWhlQLCOs4a9D7pGTlGMOho=;
	b=DpLj4yZ4/tFuhox1EVjpnSYmyonLfGTvAwJAgP7hM+k6BuzAaT91jWda+HqAUJA6Wkey
	 bWEv/IiOZW7HpXp9iGOmJ3Z9kReGd14e7+5V2Qwo5/UvY8x1WBOo82bKQnC6+XidimnKj
	 5g7dkhhCoxLObN0sJ0WTNqJP2uvKSyqsZk6d/u+uypGT0WscffjbOaC0YL7HX+KBkNBsG
	 sh1w31VkLUo2JEIlhhp9m0wolkQTBjWuBq24grQrmyV91RAX02HmGlwx8pzRn6ESHjGI/
	 0XgbTocbkRjVcF/ijOQe8kqgIqYgmcTNTM+ahFOA/ZslMR5A/rW2onCYLPjN4SQU7RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=K6p8xXcl;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9746606A31E
	for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 02:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9746606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=K6p8xXcl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=FuK/rMcR6P+/z2BcvltHzWhlQLCOs4a9D7pGTlGMOho=;
	b=K6p8xXcl9RouWJp30Bb4rMSX4usjf8H8fSXNW2u6NYrf5QqOQxCLSQOLddWef0
	9sRnpNmWDs+0Aw+VhhLSNX79WXncVK9v5KG5QA49tTCUeT0pu9tb+ITL9pDVJhb9
	+n9Q4QGjHOXYSViZMu4k7Dvqj4nvhLxaqpMYUIcWVJXDg=
Received: from [IPV6:2409:8900:1fda:c14d:95eb:cc66:f7a:f4bf] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3_6VO7AhrI3axIQ--.19986S2;
	Fri, 27 Nov 2026 10:34:56 +0800 (CST)
Message-ID: <ad4d6ba1-9e8c-4cc2-bd03-70eeb3d9d048@163.com>
Date: Fri, 27 Nov 2026 10:34:54 +0800
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
Subject: Re: [PATCH v2] ntfs: fix false directory corruption on
 case-insensitive lookup of POSIX names
To: Hyunchul Lee <hyc.lee@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Cc: Baolin Liu <liubaolin@kylinos.cn>, ntfs@lists.linux.dev,
 Sazpaimon <sazpaimon@cultnet.net>
References: <20261126233846.540372-1-hyc.lee@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261126233846.540372-1-hyc.lee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgD3_6VO7AhrI3axIQ--.19986S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gw4rtF45Gr47tr18Jw1DJrb_yoWxtw13pF
	s3CrsrXa9xJr17KwnakF1DJFyY9an7GF1jq34jgw1Ikwn5W34YqrW8KryF9FWkArWrJ392
	qa15GrWIqFyDXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U24iUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hAs9msI7FBYZwAA3A



在 2026/11/27 07:38, Hyunchul Lee 写道:
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
> Changes in v2:
>   - Remove the early return from the hibernation check.
> 
>   fs/ntfs/dir.c | 103 ++++++++++++++++++++++++++------------------------
>   1 file changed, 53 insertions(+), 50 deletions(-)
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

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

