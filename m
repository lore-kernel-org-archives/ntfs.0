Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C513ED5C3
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238476; cv=none; b=mjZjrIURaSzsigbs2pkBgB0BUvFXeVBRyVxlCKA0KbDolkljTri1FvNt1Bok2s8F1Qk+eAds25wOUy5kfXtR0AtoXfhmSC45TPwURl9vD6Q96S+nWcU9VjF+7iYelQavxETk5DaWhAi5ZnJcNJEqznf0iC+1Iy/KRL5zRXn7+yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238476; c=relaxed/simple;
	bh=KwcK5xgPqiIzsIdZYwj+iTwLj1QDZWahTspRdU2yLkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tRYbUAGcEWSRN4YZZUUefDOLGp9Yz7o32hoObdt5Dx2Hhoo6BVGUxqycmzedX2fR3btiU906vdXPZW7jqryFBzWfsbAGV+4kkhK15TCunS6Dmn2LbXD/eQ47HxeAYAeP735ZrnDE/8CTVbGuO3+kfxMVLDRGVDKksQf7Az+jrYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kBJ3uuVk; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kBJ3uuVk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=mihx/T4hDNaaTgoju8xfzL5c8ChT4gZv0yw0Iy7hzj4=;
	b=kBJ3uuVk7qPt73DvNfl9W8Tovxc05tQYlYDAVAtmMFjKnAC4V4XlvFYCmVr6M9
	RsrJrrJBHxzZBC/KNGqH7ypzjZgv1Rfd40aE0Vy33OK1fHou4L/A4c6nSJqnSSuR
	+loScpCXc2aumD8sPXUN58UqGYhFcfRyGclM3miGcDdlY=
Received: from [IPV6:2409:8900:1eb0:45e:3c13:fdf5:6f81:b37a] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnr6fx3rRqFo8PAg--.38281S2;
	Thu, 24 Sep 2026 16:27:30 +0800 (CST)
Message-ID: <e71aaf63-433e-45bf-a22c-b48f7ab3c4d8@163.com>
Date: Thu, 24 Sep 2026 16:27:28 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: exclude DOS aliases from VFS link count
To: Michael Woolweaver <michael@woolweaver.bid>,
 Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260924041720.16477-1-michael@woolweaver.bid>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260924041720.16477-1-michael@woolweaver.bid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnr6fx3rRqFo8PAg--.38281S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WF4ktw4fXw4xWw4rAw17trb_yoW3CFWrpF
	ZxC3sxtrZ3Xr12g3s3tw4DZa4S9r1Fkr4UXr9rGw13Aa1Fqwn2gFy8KrW0vr1SyrZ8Jw1q
	qF4Yg3y7CayDXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR-18dUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwRO7hmq03vPwwAAA3s



在 2026/9/24 12:17, Michael Woolweaver 写道:
> NTFS counts each $FILE_NAME attribute in the MFT record link_count.
> A file with separate Win32 and DOS 8.3 names therefore has a link_count
> of two even though the DOS name is an alias and does not represent a
> separate VFS hard link.
> 
> ntfs_read_locked_inode() copies the MFT link_count directly to i_nlink,
> causing stat() to report an extra hard link for files with a separate
> DOS alias.
> 
> The same distinction is needed when unlinking. ntfs_delete() removes
> both the DOS and Win32 $FILE_NAME attributes, decrementing the on-disk
> link_count for each, but it must decrement the VFS link count only for
> the Win32 name. Otherwise a real hard link can reach i_nlink zero while
> another VFS-visible name still exists.
> 
> Count non-DOS $FILE_NAME attributes when initializing i_nlink, while
> still verifying that the MFT link_count matches the total number of
> name attributes. Do not drop i_nlink when ntfs_delete() removes a DOS
> alias.
> 
> This was reproduced with a file containing separate Win32 and DOS
> names. Its MFT link_count was 2 while stat() incorrectly reported 2
> links. With the fix, stat() reports 1.
> 
> After adding a real POSIX hard link, the MFT contained three
> $FILE_NAME attributes while the VFS correctly reported two links.
> Removing the Win32/DOS pair left the POSIX hard link with both the MFT
> link_count and VFS i_nlink equal to 1.
> 
> The fix was runtime-tested with fs/ntfs on a disposable NTFS image and
> compile-tested on ntfs-next with W=1. checkpatch.pl reports no issues.
> 
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
> Assisted-by: LLM
> Signed-off-by: Michael Woolweaver <michael@woolweaver.bid>
> ---
>   fs/ntfs/inode.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++++
>   fs/ntfs/namei.c |  5 +++-
>   2 files changed, 81 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 9583b2c6c7a2..74a0d9d1e82b 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -621,6 +621,67 @@ static int ntfs_is_extended_system_file(struct ntfs_attr_search_ctx *ctx)
>   	return 0;	/* NO, it is not an extended system file. */
>   }
>   
> +/*
> + * ntfs_count_vfs_links - count VFS-visible hard links
> + * @ctx: initialized attribute search context
> + *
> + * The MFT link count counts all $FILE_NAME attributes.  A separate DOS 8.3
> + * name therefore contributes to the on-disk count even though it is an alias
> + * for its Win32 name and does not represent another VFS hard link.
> + *
> + * Return the number of VFS-visible links or -errno on error.
> + */
> +static int ntfs_count_vfs_links(struct ntfs_attr_search_ctx *ctx)
> +{
> +	unsigned int expected, names = 0, links = 0;
> +	int err;
> +
> +	expected = le16_to_cpu(ctx->mrec->link_count);
> +	ntfs_attr_reinit_search_ctx(ctx);
> +
> +	while (!(err = ntfs_attr_lookup(AT_FILE_NAME, NULL, 0, 0, 0, NULL, 0,
> +					ctx))) {
> +		struct attr_record *attr = ctx->attr;
> +		struct file_name_attr *fn;
> +		u32 attr_len, value_len;
> +		u16 value_off;
> +
> +		if (unlikely(attr->non_resident))
> +			goto corrupt;
Hi Michael,
   This check appears redundant.
   Both lookup paths used by ntfs_attr_lookup(), ntfs_attr_find() and 
ntfs_external_attr_find(), call ntfs_attr_value_is_valid() before 
returning a matching attribute. That function checks 
ntfs_attr_type_is_resident_only(), which already includes AT_FILE_NAME.

   A non-resident $FILE_NAME would therefore be rejected by the lookup 
before entering this loop body.
   Could we remove this duplicate check to simplify the code?

Thanks,
Baolin.

> +
> +		attr_len = le32_to_cpu(attr->length);
> +		value_len = le32_to_cpu(attr->data.resident.value_length);
> +		value_off = le16_to_cpu(attr->data.resident.value_offset);
> +
> +		if (unlikely(value_off > attr_len ||
> +			     value_len > attr_len - value_off ||
> +			     value_len < offsetof(struct file_name_attr, file_name)))
> +			goto corrupt;

Hi Michael,
    These bounds and minimum-length checks are also covered by 
ntfs_attr_value_is_valid().

   For the first two conditions, ntfs_resident_attr_value_get() already 
checks that value->len <= attr_len and value_offset <= attr_len - 
value->len, ensuring that the value fits entirely within the attribute. 
This covers the same bounds, with the subtraction arranged differently.
   For the third condition, ntfs_resident_attr_min_value_length() 
returns offsetof(struct file_name_attr, file_name) + sizeof(__le16) for 
AT_FILE_NAME, which is stricter than the check here.

   None of these conditions can therefore hold after a successful 
lookup. Could we remove these duplicate checks to simplify the code?

Thanks,
Baolin.

> +
> +		fn = (struct file_name_attr *)((u8 *)attr + value_off);
> +		names++;
> +		if (fn->file_name_type != FILE_NAME_DOS)
> +			links++;
> +	}
> +
> +	if (unlikely(err != -ENOENT))
> +		return err;
> +
> +	if (unlikely(names != expected || !links)) {
> +		ntfs_error(ctx->ntfs_ino->vol->sb,
> +			   "Inode link count doesn't match file name attributes. You should run chkdsk.");
> +		return -EIO;
> +	}

Hi Michael,
    This condition indicates filesystem metadata corruption: either the 
number of name attributes does not match the on-disk link count, or 
there are no names contributing to the VFS link count.
    Could we return -EFSCORRUPTED instead of -EIO to describe the error 
more accurately?

Thanks,
Baolin.

> +
> +	ntfs_attr_reinit_search_ctx(ctx);
> +	return links;
> +
> +corrupt:
> +	ntfs_error(ctx->ntfs_ino->vol->sb,
> +		   "Corrupt file name attribute. You should run chkdsk.");
> +	return -EIO;

Hi Michael,
   Both checks that jump to corrupt appear to be covered by the 
underlying validation and can be removed.
   If you agree with those changes, the corrupt: label and its 
associated error handling can also be dropped.

Thanks,
Baolin.

> +}
> +
>   static struct lock_class_key ntfs_dir_inval_lock_key;
>   
>   void ntfs_set_vfs_operations(struct inode *inode, mode_t mode, dev_t dev)
> @@ -872,6 +933,22 @@ static int ntfs_read_locked_inode(struct inode *vi)
>   		}
>   	}
>   skip_attr_list_load:
> +	/*
> +	 * The MFT link count includes separate DOS 8.3 aliases.  Once the
> +	 * attribute list is available, derive the VFS link count from the
> +	 * $FILE_NAME namespaces instead.
> +	 */
> +	if (!(m->flags & MFT_RECORD_IS_DIRECTORY) && vi->i_ino != FILE_MFT) {
> +		int nr_links;
> +
> +		nr_links = ntfs_count_vfs_links(ctx);
> +		if (unlikely(nr_links < 0)) {
> +			err = nr_links;
> +			goto unm_err_out;
> +		}
> +		set_nlink(vi, nr_links);
> +	}
> +
>   	err = ntfs_attr_lookup(AT_EA_INFORMATION, NULL, 0, 0, 0, NULL, 0, ctx);
>   	if (!err) {
>   		NInoSetHasEA(ni);
> diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
> index 75e201096525..891ee697c0d2 100644
> --- a/fs/ntfs/namei.c
> +++ b/fs/ntfs/namei.c
> @@ -829,6 +829,7 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
>   	struct file_name_attr *fn = NULL;
>   	bool looking_for_dos_name = false, looking_for_win32_name = false;
>   	bool case_sensitive_match = true;
> +	bool is_dos_name;
>   	int err = 0;
>   	struct mft_record *ni_mrec;
>   	struct super_block *sb;
> @@ -932,6 +933,8 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
>   	if (err)
>   		goto err_out;
>   
> +	is_dos_name = fn->file_name_type == FILE_NAME_DOS;
> +
>   	err = ntfs_index_remove(dir_ni, fn, le32_to_cpu(actx->attr->data.resident.value_length));
>   	if (err)
>   		goto err_out;
> @@ -942,7 +945,7 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
>   
>   	ni_mrec = actx->base_mrec ? actx->base_mrec : actx->mrec;
>   	ni_mrec->link_count = cpu_to_le16(le16_to_cpu(ni_mrec->link_count) - 1);
> -	if (!S_ISDIR(VFS_I(ni)->i_mode))
> +	if (!S_ISDIR(VFS_I(ni)->i_mode) && !is_dos_name)
>   		drop_nlink(VFS_I(ni));
>   
>   	mark_mft_record_dirty(ni);
> 
> base-commit: 401898d748fcc8e19ceea1a37ed0de9075fe9ff2

