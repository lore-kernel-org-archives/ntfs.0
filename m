Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132B12DF138
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 08:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239366; cv=none; b=eB/J3mZIqr6iPOIrWrq7tVN5wtpoYaTTktYljkCOw2lfYL53sY+I23oVc2MJNbY6+YyW7MZMV/U3cTeMrUQ5DEIWgEH63xBqlcGirudntInEncXCAe2HRLA+jUoviA9Eevs2KvGYvKMqhuxeozNAdKXYSfRaXuEtIL8FMJYCnzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239366; c=relaxed/simple;
	bh=LDR88pRPadH5YbVZB0JSvzlf8x8iZc+HAMLWxUPf9i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XiktGbR+DFNCKrSTC2aYrfINZjqpNyyELFHPnVh/B/b6pSjv5iY2sITEn+MuEVTKqz1+penDZ3J9SvwMS74xp6iXQvMA6z0XaN3TuLIwLxjj3wRAzmGSII4bGFIPcca4c+JIWbi7+AE4lnBge/mPs/AZ6gjTjB7JkLwOZqO1ByM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=T5K8icr1; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="T5K8icr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=IES0DGNs4px2D7Z1njUR246i9JYyabrNmEEAlJUEP9M=;
	b=T5K8icr1c+thaeaauEmupmgZHG3Tar1PiEUeS5ei2r9yY6cujOqEKFhJnAV7pg
	/U5TxncpHnlddAAoYsQGPXgmsWK9eKyzlRLFGKQN6WyuIJhQKLW9pzHyojasBI3W
	Qo0BwNizo3u0H3vK6Zgr71ygvDH1YOCrC60Dw1WcGfo7w=
Received: from [IPV6:2409:8900:1eb0:45e:3c13:fdf5:6f81:b37a] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3rr1s4rRqVNcMAg--.10243S2;
	Thu, 24 Sep 2026 16:42:21 +0800 (CST)
Message-ID: <0b50a37a-4ee6-47cb-9bf8-1b0d40cb26eb@163.com>
Date: Thu, 24 Sep 2026 16:42:15 +0800
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
X-CM-TRANSID:_____wD3rr1s4rRqVNcMAg--.10243S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WF4ktw4fXw4xWw4rAw17trb_yoWxWrWUpF
	ZxA3sxtrWfXry2vas3tw4DZ3WS9a4FkrWUXr9xGw13J3ZYqwnagF18KrWjvr4SyrZ5J34j
	qF4Yg3y7CayUXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRSAprUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwg2bZmq04m1jvwAA3-



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

Hi Michael,
   Could we reinitialize the search context before reading link_count?

   ntfs_attr_reinit_search_ctx(ctx);
   expected = le16_to_cpu(ctx->mrec->link_count);

   This ensures the count is read from the base MFT record even if the 
incoming context points to an extent record.

Thanks,
Baolin.

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
> +
> +		attr_len = le32_to_cpu(attr->length);
> +		value_len = le32_to_cpu(attr->data.resident.value_length);
> +		value_off = le16_to_cpu(attr->data.resident.value_offset);
> +
> +		if (unlikely(value_off > attr_len ||
> +			     value_len > attr_len - value_off ||
> +			     value_len < offsetof(struct file_name_attr, file_name)))
> +			goto corrupt;
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
> +
> +	ntfs_attr_reinit_search_ctx(ctx);
> +	return links;
> +
> +corrupt:
> +	ntfs_error(ctx->ntfs_ino->vol->sb,
> +		   "Corrupt file name attribute. You should run chkdsk.");
> +	return -EIO;
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

