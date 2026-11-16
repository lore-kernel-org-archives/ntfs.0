Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827408;
	b=SCdrV/PbB+Q/cz3fu0P95fxYVbCPpFmSgf0iPE3wsj2uTKVDbNWreNEZCPmn9Eof4b6o
	 5P088a5GGw2uG38Qavl2dzF8/8qUalJBNLWyTReZXtaZcdjTXZPIyvFaVdlsauLItywVZ
	 jrp0kn8GPGD6+d58AAHT4eBFK4jTHI1FM9wZwNnsWlx4QjdtV10e2Pruc9+YBrPNm6WDM
	 q92vgpPkhMbVvVHYzS79Tv7eOIzc5s0u6364EA65O08/w8qHk/Odj30Gab7e4FN6ooQCl
	 flVxT9865EsTYIglduYXCaxfDSWEdr6ye+roqBd86PPWokGSz8IMHcm8ygMFiz8gYyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827408;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=ARSjlfwSvTJHDHJ9auuuNGPn8mj9QRRd+oWrwxrA4lE=;
	b=UUGNxviQXyVv9uuEJpTTsuGC6KUM1bT2iFd8UWJF+ur+XNrbZ8o7HoY9f16DhKYR59kx
	 WfCFcwl3xNLlEMm6WCKL1YgltU1Py+boLxTzYnfbV12WW6ibiuEpdWFQ97L7UWUjRgk6Z
	 w9U0v+Qp8xE2T+UGG3tK+pAsfKC/Vj+/07vrLQ3jUiulFkX3PCA57Yw0UN12nqUeU1hGA
	 bToKskZ8Y5XAIAPsgNwA2OyrRmevLy9EK/junUWEFQorhAEl85Ct7symNMiNBpueBIyL6
	 qqf9SoCqBTReDenC6NSvlFq4d/FyCKPikObjhJ7csEV+0dmyDGxcS4PArrLSg+vBOuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=QOJ2b4WB;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F97B606FDB3
	for <ntfs@lists.linux.dev>; Mon, 16 Nov 2026 11:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F97B606FDB3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=QOJ2b4WB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=ARSjlfwSvTJHDHJ9auuuNGPn8mj9QRRd+oWrwxrA4lE=;
	b=QOJ2b4WBP6ZguHOD/G2q8O4SHkSWm1viQC/PCo3uCumdat2ob6gndRvI+sX5WC
	NQUxtqkATCLGgIZULRrYeyeOUmtdpdd6GlO953RcsorhnpfzvmNJwBpZo4Qd5747
	cGU8Lqbw9sU2XrGeZjrSb14ovEXS3wnBgv3hw4kQU0dWw=
Received: from [IPV6:2409:8900:1fc4:b5fb:636e:2d9e:ad45:c531] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgAnPQ575PpqKX2SFw--.19505S2;
	Mon, 16 Nov 2026 19:09:49 +0800 (CST)
Message-ID: <dc0cc4cf-4213-4f7f-85f4-2e947c6db81a@163.com>
Date: Mon, 16 Nov 2026 19:09:47 +0800
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
Subject: Re: [PATCH v5] ntfs: trim the sizes after a short write
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, zhanxusheng@xiaomi.com
References: <20261116091121.2547497-1-zhanxusheng1024@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261116091121.2547497-1-zhanxusheng1024@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgAnPQ575PpqKX2SFw--.19505S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuw45Wry3GFWxXw1rXFykGrg_yoWfXw1fpr
	WagrnxKrWIqryxCrnxJ3WUXF4Yqa95Cr4UCa45GFyxAr95Crn2qFyUtrW0gayvy392y3WF
	vF4vvrWkWwn8Zw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U6yIbUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6h2xfGr65H1SSwAA3q



在 2026/11/16 17:11, Zhan Xusheng 写道:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> ntfs_file_write_iter() moves the data size and, for a non-resident
> uncompressed file, the initialized size to pos + count before the copy.
> __ntfs_extend_initialized_size() only zeroes [old initialized size, pos),
> so the range [pos, pos + count) is initialized only by the copy itself.
> When iomap_file_buffered_write() copies less than count, it returns a
> positive short count and the error rollback at out: does not run.  The
> file keeps the size pos + count, and [pos + ret, pos + count) reads back
> whatever the freed clusters held before, also after a remount.  A local
> user can read the old contents of freed clusters this way.
> 
> Run the existing rollback for a short write as well, and roll the data
> size back to the end of what was written.  Keep the initialized size,
> as a page fault through a shared mapping may rely on it while the write
> is stalled on its source, and zero what the write did not reach, up to
> the end of the block holding pos + count.  Only if that fails, take the
> initialized size back to where the zeroing started.
> 
> Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
> v5 (Baolin):
> - start the zeroing at pos, not at the old initialized size, which
>    overwrote data stored through a shared mapping below pos
> - do the same for a direct write, instead of truncating the page cache
>    and taking the initialized size back
> - if the zeroing fails, take the initialized size back to where it
>    started, instead of skipping both rollbacks
> v4: for a buffered write, zero the unwritten range instead of
> truncating the page cache and taking the initialized size back, which
> dropped data stored through a shared mapping during the copy (Baolin).
> v3: clear the cache up to EOF, not up to the extended initialized
> size, which left the rest of the block holding pos + count (Baolin).
> v2: also clear the cached tail of the last block, which v1 left in
> place when the write stayed inside the old data size (Baolin).
> 
> v4: https://lore.kernel.org/all/20261113050148.1466682-1-zhanxusheng1024@gmail.com/
> v3: https://lore.kernel.org/all/20261112093233.1118469-1-zhanxusheng1024@gmail.com/
> v2: https://lore.kernel.org/all/20261112030815.982026-1-zhanxusheng1024@gmail.com/
> v1: https://lore.kernel.org/all/20261111093459.660484-1-zhanxusheng1024@gmail.com/
> 
> Tested in a VM on ntfs-next b025f526c5d0, with all free space filled
> with a known pattern first.  Short buffered writes of 4M, old data
> readable after drop_caches and after remount, 3 runs each:
> 
>                                      unfixed    v4     v5
>    fallocated, ends block-aligned    3137536    0      0
>    fallocated, ends inside a block   3141332    0      0
>    fallocated, unaligned start       3137536    0      0
>    same, pos + count in that page    -          0      0
>    append                            3137536    0      0
> 
> Marker stored through a shared mapping at 64K while pwritev() is
> stalled on a userfaultfd source page, state after remount, with and
> without fallocate():
> 
>                                            unfixed  v4     v5
>    buffered 4K at 128K, EFAULT             lost     lost   kept
>    O_DIRECT 12K at 0, EFAULT               lost     lost   kept
>    buffered 12K at 0, short 8192 (v3)      kept     kept   kept
> 
> A store into [pos + ret, pos + count) itself during the write is
> zeroed, as that range belongs to the write.  With iomap_zero_range()
> failing (injected -ENOMEM), a 32K write to a 16K file that returns
> 12288 leaves the size at 28K with no old data, also after remount.
> fsx (buffered, no-mmap, O_DIRECT and mixed), compressed files,
> fallocate, insert/collapse range and punch hole give the same results
> with v5 as with v4.
> ---
>   fs/ntfs/file.c | 69 +++++++++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 62 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 3213a0c9f96b..83e424a25a48 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -928,10 +928,21 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   		ret = iomap_file_buffered_write(iocb, from, &ntfs_write_iomap_ops,
>   				&ntfs_iomap_folio_ops, NULL);
>   out:
> -	if (ret < 0 && ret != -EIOCBQUEUED) {
> +	/*
> +	 * Both sizes were moved to end before the copy, so a short write,
> +	 * like a failed one, must take back what it did not write.
> +	 */
> +	if (ret < count && ret != -EIOCBQUEUED) {
> +		loff_t new_init_size = old_init_size;
> +		loff_t new_data_size = old_data_size;
>   		int init_err = 0;
>   		int data_err = 0;
>   
> +		if (ret > 0) {
> +			new_init_size = max(old_init_size, pos + ret);
> +			new_data_size = max(old_data_size, pos + ret);
> +		}
> +
>   		/*
>   		 * Like ntfs_setattr_size(): __ntfs_attr_truncate_vfs()
>   		 * expects the invalidate lock held across the size
> @@ -939,14 +950,58 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   		 */
>   		filemap_invalidate_lock(vi->i_mapping);
>   
> +		/*
> +		 * A page fault through a shared mapping may have used the
> +		 * extended initialized size while the write was stalled on
> +		 * its source, so keep that size and zero what the write did
> +		 * not reach instead.  [old_init_size, pos) was zeroed before
> +		 * the write.  Past end, zero the rest of the block that a
> +		 * buffered copy may have read from disk, unless such a fault
> +		 * already moved the initialized size past end and zeroed it.
> +		 */
> +		if (NInoNonResident(ni) && !NInoCompressed(ni) &&
> +		    ni->initialized_size > new_init_size) {
> +			loff_t zstart = max(pos, new_init_size);
> +			loff_t zend = ni->initialized_size > end ? end :
> +				      round_up(end, i_blocksize(vi));
> +			int err = 0;
> +
> +			zend = min(zend, new_data_size);
> +			if (zend > zstart) {
> +				err = iomap_zero_range(vi, zstart,
> +						zend - zstart, NULL,
> +						&ntfs_seek_iomap_ops,
> +						&ntfs_iomap_folio_ops, NULL);
> +				/* A direct read must not see the old blocks. */
> +				if (!err && iocb->ki_flags & IOCB_DIRECT)
> +					err = filemap_write_and_wait_range(
> +						vi->i_mapping, zstart, zend - 1);
> +			}
> +			if (!err)
> +				new_init_size = min(ni->initialized_size,
> +						    new_data_size);
> +			else
> +				new_init_size = min(zstart, new_data_size);

Hi Xusheng,
    Thanks for v5 and for working through the feedback over the previous 
versions.
    There is one remaining adjustment from my review; with that 
addressed, the patch looks good to me.

    The out: path can also be reached when 
ntfs_extend_initialized_size() fails before the copy, leaving the 
current initialized size below pos.
If the cleanup zeroing also fails, this assignment can incorrectly 
increase the initialized size, exposing bytes that were never 
successfully initialized.

    I suggest also capping the fallback at the current initialized size.
    This only requires a small change, replacing:
        new_init_size = min(zstart, new_data_size);
    with:
        new_init_size = min3(ni->initialized_size, zstart,
                             new_data_size);

    This prevents the failure cleanup from increasing the initialized 
size, while preserving the existing behavior when initialization before 
the copy succeeded.

    Could you please send one more revision with this adjustment? Thanks 
again for your patience and work on this fix.

Thanks,
Baolin.

> +		}
> +
>   		/* ntfs_attr_set_initialized_size() rejects a resident one. */
> -		if (ni->initialized_size != old_init_size &&
> +		if (ni->initialized_size != new_init_size &&
>   		    NInoNonResident(ni)) {
>   			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
>   
> +			/*
> +			 * Only reached when the zeroing above failed or did
> +			 * not apply.  Drop what was cached past the new
> +			 * initialized size, as __ntfs_extend_initialized_size()
> +			 * does.
> +			 */
> +			if (ni->initialized_size > new_init_size)
> +				truncate_pagecache_range(vi, new_init_size,
> +						max_t(loff_t, i_size_read(vi),
> +						      ni->initialized_size) - 1);
>   			mutex_lock(&mrec_ni->mrec_lock);
>   			init_err = ntfs_attr_set_initialized_size(ni,
> -					old_init_size);
> +					new_init_size);
>   			mutex_unlock(&mrec_ni->mrec_lock);
>   		}
>   		/*
> @@ -955,13 +1010,13 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   		 * the uninitialized tail, so skip it unless the rollback
>   		 * above restored that size.
>   		 */
> -		if (ni->data_size != old_data_size && !init_err) {
> +		if (ni->data_size != new_data_size && !init_err) {
>   			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
>   
> -			truncate_setsize(vi, old_data_size);
> +			truncate_setsize(vi, new_data_size);
>   			mutex_lock(&mrec_ni->mrec_lock);
> -			data_err = __ntfs_attr_truncate_vfs(ni, old_data_size,
> -					old_data_size);
> +			data_err = __ntfs_attr_truncate_vfs(ni, new_data_size,
> +					new_data_size);
>   			mutex_unlock(&mrec_ni->mrec_lock);
>   			/* Like ntfs_setattr_size(): stay on the durable size. */
>   			if (data_err)
> 
> base-commit: b025f526c5d04929212c9d5fb7ffc96608f3eacc

