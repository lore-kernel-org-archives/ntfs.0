Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1892E3C4176
	for <ntfs@lists.linux.dev>; Tue, 22 Sep 2026 03:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790049425; cv=none; b=irH80jLYlDflZ6YCHpCAzdLTJXS6Gfupu+iSb50Ktt9Vd2xUYHbOGepzMkraYsI0whDUwvRhxGm2a0fkrxRL2Q0zP4HpXGFW2ObeRrSz+x+BBjqZWGQMfgbcM39sBgdI7F9klQ1uOgpNV5fYGz/M226uidRcFPSq4Toxx62DR9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790049425; c=relaxed/simple;
	bh=fs9BRfKmiz/PyKIurs8g3vcO8wdLXzJJUSrw4BeuuS0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=thOzfsH2y/3JPQaDZHoVJIukSQ1ZrC68bdFCQ5CYyLBE7Kz+7aKdeuMuyQhI/zmuaed5ch8+SQByAnj8a7gv9QqLvyuwhNbFBepOr63v+J6t19cBkYeyj5AoSPCcxdNKMLh7IlN1t3YOeeG9XAwgna0AC6oV5lY/dXn/oRbwSLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DDc/ieWQ; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DDc/ieWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:To:
	Content-Type; bh=/abNEaTU8UnmTUqiIkX9MYVhg0s2UGieH1rZ9EcWZrE=;
	b=DDc/ieWQwPxLVWTOICtipOHBovsRq0+wb+ZAZmlh2ZluB/OWLNcx0J24baXcy9
	z5dDnnKmVjcfXj6XPvQnVvKFEanquFnjxVgJ8TDK2tt8SY+OocPBOPvRoMUdFp0I
	cH7k9z9uZe12+Fj4elohbI0KJHJ1umJw9p+ICxsya8ISU=
Received: from [IPV6:2409:8900:1ee3:222c:420f:a5a2:eb51:8645] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBnT8p9_LFqrEKxAg--.19696S2;
	Tue, 22 Sep 2026 11:56:47 +0800 (CST)
Message-ID: <d56a1b4b-8080-449b-a324-eb10cc45a130@163.com>
Date: Tue, 22 Sep 2026 11:56:45 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] ntfs: validate EA chains and link
 zero-terminated tails
From: liubaolin <liubaolin12138@163.com>
To: linkinjeon@kernel.org, hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260921102318.2104180-1-liubaolin12138@163.com>
Content-Language: en-US
In-Reply-To: <20260921102318.2104180-1-liubaolin12138@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgBnT8p9_LFqrEKxAg--.19696S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Wr4kAry5Xr4xuw15JFWfAFb_yoWxKw13pF
	Z0y3s8JrWfJrnrWrn2ka1DXayrCw4xWryUK34xKw10krn0qr1qqas0kFyfuayFy3s7ur1F
	gFZ8tFs5uF1UAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2zuZUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwh9lMGqx-H9plwAA3u

Hi Namjae,
   Hyunchul has suggested avoiding the $LX prefix because it may 
conflict with the WSL namespace. I agree with this concern and have 
proposed using $LINUXFLAGS instead.

   Because this name change affects the complete series, I plan to 
update the code and documentation, rerun the relevant tests, and resend 
the full series as v4.

   Please ignore the standalone v3 revision of patch 2 for now. I will 
supersede it with the v4 series after the new EA name is confirmed.

Thanks,
Baolin.


在 2026/9/21 18:23, Baolin Liu 写道:
> From: Baolin Liu <liubaolin@kylinos.cn>
> 
> A zero next-entry offset terminates an EA list. Appending an entry
> without linking the old tail makes the new entry unreachable. Invalid
> entries are also treated as missing names, allowing setters to proceed
> on corrupt metadata.
> 
> Validate the entire chain before modifying it and connect a zero tail
> to the append position. Check name terminators and retain the full tail
> span when removing an entry. Return EUCLEAN for malformed EA structures
> and inconsistent information lengths, preserving that error through the
> get, set and list paths. Keep ENOENT for a missing name and translate it to
> ENODATA only at the xattr read boundary. Preserve lower-level read errors.
> 
> Reuse the same full-chain validation in ntfs_listxattr(), including
> size-only queries, before copying names. Reject malformed lists with
> EUCLEAN instead of returning an empty or partial list.
> 
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
> Changes since v2:
> - Reuse full-chain validation in ntfs_listxattr(), including size-only
>    queries, and return EUCLEAN for malformed EA structures.
> - Remove the duplicate listxattr structure checks; preserve lower-level
>    read errors.
> 
> This replaces [PATCH v2 02/10]. Original v2 patches 3-10 apply cleanly
> on top without modification.
> 
> Validation:
> - QEMU listxattr tests covered normal and zero-terminated lists, empty
>    lists, size-only queries, short buffers, malformed offsets, missing
>    name terminators, oversized values and truncated entry headers.
>    Verified EUCLEAN after successful file open, including tiny buffers.
> - Checked an oversized query length at the patch-2 stage, and ordinary
>    file/xattr writes plus unmount/remount.
> 
>   fs/ntfs/ea.c | 81 +++++++++++++++++++++++++++++++---------------------
>   1 file changed, 48 insertions(+), 33 deletions(-)
> 
> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
> index bb97df3045a0..2ee700f8227e 100644
> --- a/fs/ntfs/ea.c
> +++ b/fs/ntfs/ea.c
> @@ -53,10 +53,13 @@ static int ntfs_ea_lookup(char *ea_buf, s64 ea_buf_size, const char *name,
>   	loff_t offset, p_ea_size;
>   	unsigned int next;
>   
> +	if (!ea_buf_size)
> +		return -ENOENT;
> +
>   	offset = 0;
>   	do {
>   		if (ea_buf_size - offset < sizeof(struct ea_attr))
> -			break;
> +			return -EUCLEAN;
>   
>   		p_ea = (const struct ea_attr *)&ea_buf[offset];
>   		next = le32_to_cpu(p_ea->next_entry_offset);
> @@ -64,31 +67,31 @@ static int ntfs_ea_lookup(char *ea_buf, s64 ea_buf_size, const char *name,
>   
>   		if (p_ea_size < sizeof(struct ea_attr) ||
>   		    offset + p_ea_size > ea_buf_size)
> -			break;
> +			return -EUCLEAN;
>   
>   		if ((s64)p_ea->ea_name_length + 1 >
>   		    p_ea_size - offsetof(struct ea_attr, ea_name))
> -			break;
> +			return -EUCLEAN;
>   
>   		actual_size = ALIGN(struct_size(p_ea, ea_name, 1 + p_ea->ea_name_length +
>   					le16_to_cpu(p_ea->ea_value_length)), 4);
> -		if (actual_size > p_ea_size)
> -			break;
> +		if (actual_size > p_ea_size ||
> +		    p_ea->ea_name[p_ea->ea_name_length])
> +			return -EUCLEAN;
>   
> -		if (p_ea->ea_name_length == name_len &&
> +		if (name && p_ea->ea_name_length == name_len &&
>   		    !memcmp(p_ea->ea_name, name, name_len)) {
>   			*ea_offset = offset;
> -			*ea_size = next ? next : actual_size;
> +			*ea_size = p_ea_size;
>   
>   			if (ea_buf_size < *ea_offset + *ea_size)
> -				goto out;
> +				return -EUCLEAN;
>   
>   			return 0;
>   		}
>   		offset += next;
>   	} while (next > 0 && offset < ea_buf_size);
>   
> -out:
>   	return -ENOENT;
>   }
>   
> @@ -126,7 +129,7 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
>   		return PTR_ERR(p_ea_info);
>   	if (ea_info_size != sizeof(struct ea_information)) {
>   		kvfree(p_ea_info);
> -		return -EIO;
> +		return -EUCLEAN;
>   	}
>   
>   	ea_info_qlen = le32_to_cpu(p_ea_info->ea_query_length);
> @@ -137,7 +140,7 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
>   		return PTR_ERR(ea_buf);
>   
>   	if (ea_info_qlen > all_ea_size) {
> -		err = -EIO;
> +		err = -EUCLEAN;
>   		goto free_ea_buf;
>   	}
>   
> @@ -162,7 +165,8 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
>   		return ea_value_len;
>   	}
>   
> -	err = -ENODATA;
> +	if (err == -ENOENT)
> +		err = -ENODATA;
>   free_ea_buf:
>   	kvfree(ea_buf);
>   	return err;
> @@ -216,7 +220,7 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
>   			goto out;
>   		}
>   		if (ea_info_size != sizeof(struct ea_information)) {
> -			err = -EIO;
> +			err = -EUCLEAN;
>   			goto out;
>   		}
>   
> @@ -255,12 +259,29 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
>   	}
>   
>   	if (ea_info_qsize > all_ea_size) {
> -		err = -EIO;
> +		err = -EUCLEAN;
> +		goto out;
> +	}
> +
> +	/* Validate the whole chain before modifying it, including its tail. */
> +	err = ntfs_ea_lookup(ea_buf, ea_info_qsize, NULL, 0, &ea_off,
> +			     &ea_size);
> +	if (err != -ENOENT)
>   		goto out;
> +	/* A zero tail offset must be linked before appending another EA. */
> +	for (ea_off = 0; ea_off < ea_info_qsize; ea_off += ea_size) {
> +		p_ea = (struct ea_attr *)(ea_buf + ea_off);
> +		ea_size = le32_to_cpu(p_ea->next_entry_offset);
> +		if (!ea_size) {
> +			ea_size = ea_info_qsize - ea_off;
> +			p_ea->next_entry_offset = cpu_to_le32(ea_size);
> +		}
>   	}
>   
>   	err = ntfs_ea_lookup(ea_buf, ea_info_qsize, name, name_len, &ea_off,
>   			&ea_size);
> +	if (err && err != -ENOENT)
> +		goto out;
>   	if (ea_info_qsize && !err) {
>   		if (flags & XATTR_CREATE) {
>   			err = -EEXIST;
> @@ -537,7 +558,7 @@ ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size)
>   		goto out;
>   	}
>   	if (ea_info_size != sizeof(struct ea_information)) {
> -		err = -EIO;
> +		err = -EUCLEAN;
>   		goto out;
>   	}
>   
> @@ -550,32 +571,26 @@ ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size)
>   		goto out;
>   	}
>   
> -	if (ea_info_qsize > ea_buf_size || ea_info_qsize == 0)
> +	if (ea_info_qsize > ea_buf_size) {
> +		err = -EUCLEAN;
> +		goto out;
> +	}
> +
> +	/* Validate the entire chain, including size-only queries. */
> +	err = ntfs_ea_lookup(ea_buf, ea_info_qsize, NULL, 0, &offset,
> +			     &ea_size);
> +	if (err != -ENOENT)
> +		goto out;
> +	err = 0;
> +	if (!ea_info_qsize)
>   		goto out;
>   
>   	offset = 0;
>   	do {
> -		if (ea_info_qsize - offset < sizeof(struct ea_attr)) {
> -			err = -EIO;
> -			goto out;
> -		}
> -
>   		p_ea = (const struct ea_attr *)&ea_buf[offset];
>   		next = le32_to_cpu(p_ea->next_entry_offset);
>   		ea_size = next ? next : (ea_info_qsize - offset);
>   
> -		if (ea_size < sizeof(struct ea_attr) ||
> -		    offset + ea_size > ea_info_qsize) {
> -			err = -EIO;
> -			goto out;
> -		}
> -
> -		if ((int)p_ea->ea_name_length + 1 >
> -			ea_size - offsetof(struct ea_attr, ea_name)) {
> -			err = -EIO;
> -			goto out;
> -		}
> -
>   		if (buffer) {
>   			if (ret + p_ea->ea_name_length + 1 > size) {
>   				err = -ERANGE;

