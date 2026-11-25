Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615706;
	b=wB/MR+DPL0ARLbvEKoNeUdPlcQAazoQ71RUa+hCcCNXpWD8tQUsdoPzWMJFKb4S+hBag
	 FRXli75QDurj7+fxAztDuByyyTzJmM9XuAeSN5NRcWiRnOJrDMg01QBmp01ZNvwqgiD0E
	 CCJ5vZVYavnLzamdNrdujvvyk8crBO9f1pv/xZBiyJo6emj9ZelFS2Y2ncxcqIUVcyI+s
	 ZH03qiBuswrdo5OoQkh/xJtWzGlDajeCovGV4hOKHSsenUThyY6gVW8wz/73vex+/op3c
	 3j4i0HnM1IodfOCg7+6mcSjOcEeoGKKv2oKCfvTu9zYoDhCMtFHpj42A5K/NkoyV5bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615706;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=GL2gpFtpLlptdo9lvbb/9IszouY72jtLocH1GX5+UFs=;
	b=DxR5HhxJu8g8hkCzq7fyhmnqmIRlg1FVtCrx4ufPrE9n9ozlozYY3x5liNeo1gTFyELt
	 4MfP4GWGb0tWDEk664oHWJcDjFU1f+1pXUAmGLtAKVcI8Y/CLTIO3NbaRaeSFG41cTNVv
	 oMxnmZUOZoqPXdKAmDH47jGUSwFCGo/maZR0vOFd1tOcINeSYdR+xM3wbbQR5PC5//8lo
	 AyK2n4MUv9zc/Gr4ATVJhpF8tbZpTFZBSQvrd5B1S49ABqjyDMCvBQimBzBdE9wYeUl2S
	 s5zOXpGgXa4X5s8E5JqA8qCc9xjtQyFxII7Xn5UB48HGZ5ptmcjv7KH0RW8dxoO8zYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=QTAjbWO6;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ABA60A263D
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 14:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80ABA60A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=QTAjbWO6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=GL2gpFtpLlptdo9lvbb/9IszouY72jtLocH1GX5+UFs=;
	b=QTAjbWO69UDiZxIFamb9e/V7Ciw7AldGwtJSqUXGqNVDji7rLAsaQTzW1wwiAv
	ytPQa9AbmWrsItaTpgzhjVMVpE2lYsgPL2wOrATr57pEe8LxGO0YN4KCXKkm+Fgs
	kjWQH3f2Z8BzEOh1dHa2FAIx5Xzhyk/fc6UboMipI6b8Y=
Received: from [IPV6:2409:8900:1a90:8163:5fb3:f207:88ec:aa89] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDXXxXD6wZrg3FNKQ--.33468S2;
	Wed, 25 Nov 2026 22:08:04 +0800 (CST)
Message-ID: <19c9d7b7-c280-46ce-9ab6-1840bdb428f1@163.com>
Date: Wed, 25 Nov 2026 22:08:03 +0800
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
Subject: Re: [PATCH 4/6] ntfs: update the in-memory sizes under the size lock
To: Hongling Zeng <zenghongling@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, zhongling0719@126.com
References: <20261125073547.154150-1-zenghongling@kylinos.cn>
 <20261125073547.154150-5-zenghongling@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261125073547.154150-5-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXXxXD6wZrg3FNKQ--.33468S2
X-Coremail-Antispam: 1Uf129KBjvAXoWfGr18Ww4UXry7WrW5Zr4UCFg_yoW8XrWkAo
	WfAFWa9w1kuFyYy3yv9w4DXryDu3yDK3y5JFZ8ZrsrCFnYgw4j9347Ww1rWr4fC345Kr1j
	gF1ftFWkCF47tFyxn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU0E_MDUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gSIU2sG68QBwAAA32



在 2026/11/25 15:35, Hongling Zeng 写道:
> The runtime mutation paths update data_size, initialized_size and
> allocated_size without size_lock, racing with the readers that use
> the lock to obtain a coherent snapshot.
> 
> Protect the shrink and expand tails, make-resident and resident-resize
> paths, insert/collapse range, KEEP_SIZE rollback, internal initialized
> size updates, preallocation trimming, and the compressed size
> recalculation. Group assignments that form one logical size-state
> update into the same critical section where possible.
> 
> The inode load, creation, and eviction paths are unchanged because the
> inode is not concurrently visible there. Existing inode and MFT locks
> serialize writers; size_lock synchronizes publication of the resulting
> state to readers.
> 
> All affected mutation paths are already serialized against one another by
> the inode lock or the relevant MFT record lock; size_lock is added only to
> synchronize publication to readers.
> 
> LOCKING PROTOCOL:
> - size_lock protects: data_size, initialized_size, allocated_size,
>    itype.compressed.size (allocated size for compressed files)
> - itype.compressed.block_size, block_size_bits, block_clusters are NOT
>    protected by size_lock (reader and writer access patterns confirmed)
> 
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>   fs/ntfs/attrib.c | 48 +++++++++++++++++++++++++++++++++++++++++++-----
>   fs/ntfs/file.c   |  3 +++
>   fs/ntfs/inode.c  | 42 ++++++++++++++++++++++++++++++------------
>   3 files changed, 76 insertions(+), 17 deletions(-)
> 
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index 6ee6b6bcac1d..081ce3e829f2 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -2436,6 +2436,7 @@ int ntfs_attr_set_initialized_size(struct ntfs_inode *ni, loff_t new_size)
>   	struct ntfs_attr_search_ctx *ctx;
>   	struct ntfs_inode *base_ni = ntfs_base_inode(ni);
>   	int err = 0;
> +	unsigned long flags;
>   
>   	if (!NInoNonResident(ni))
>   		return -EINVAL;
> @@ -2450,7 +2451,9 @@ int ntfs_attr_set_initialized_size(struct ntfs_inode *ni, loff_t new_size)
>   		goto out_ctx;
>   
>   	ctx->attr->data.non_resident.initialized_size = cpu_to_le64(new_size);
> +	write_lock_irqsave(&ni->size_lock, flags);
>   	ni->initialized_size = new_size;
> +	write_unlock_irqrestore(&ni->size_lock, flags);
>   	mark_mft_record_dirty(ctx->ntfs_ino);
>   out_ctx:
>   	ntfs_attr_put_search_ctx(ctx);
> @@ -3729,6 +3732,7 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
>   		struct ntfs_inode *locked_ni, bool defer_attrlist)
>   {
>   	int sparse, err = 0;
> +	unsigned long flags;
>   	struct ntfs_inode *base_ni;
>   	struct super_block *sb = ni->vol->sb;
>   
> @@ -3834,7 +3838,9 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
>   			goto out;
>   		}
>   
> +		write_lock_irqsave(&ni->size_lock, flags);
>   		ni->itype.compressed.size = new_compr_size;
> +		write_unlock_irqrestore(&ni->size_lock, flags);
>   		a->data.non_resident.compressed_size = cpu_to_le64(new_compr_size);
>   	}
>   
> @@ -4271,6 +4277,7 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
>   	struct attr_record *a = ctx->attr;
>   	int name_ofs, val_ofs, err;
>   	s64 arec_size, freed;
> +	unsigned long flags;
>   
>   	ntfs_debug("Entering for inode 0x%llx, attr 0x%x.\n",
>   			(unsigned long long)ni->mft_no, ni->type);
> @@ -4376,8 +4383,10 @@ static int ntfs_attr_make_resident(struct ntfs_inode *ni, struct ntfs_attr_searc
>   	ni->flags &= ~FILE_ATTR_SPARSE_FILE;
>   	NInoClearEncrypted(ni);
>   	ni->flags &= ~FILE_ATTR_ENCRYPTED;
> +	write_lock_irqsave(&ni->size_lock, flags);
>   	ni->initialized_size = ni->data_size;
>   	ni->allocated_size = ni->itype.compressed.size = (ni->data_size + 7) & ~7;
> +	write_unlock_irqrestore(&ni->size_lock, flags);
>   	ni->itype.compressed.block_size = 0;
>   	ni->itype.compressed.block_size_bits = ni->itype.compressed.block_clusters = 0;
>   	return 0;
> @@ -4401,6 +4410,8 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
>   	s64 first_free_vcn;
>   	s64 nr_freed_clusters;
>   	int err;
> +	unsigned long flags;
> +	bool update_initialized;
>   	struct ntfs_inode *base_ni;
>   	bool runlist_locked = locked_ni == ni;
>   
> @@ -4493,12 +4504,16 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
>   		}
>   
>   		/* Prepare to mapping pairs update. */
> +		write_lock_irqsave(&ni->size_lock, flags);
>   		ni->allocated_size = ntfs_cluster_to_bytes(vol, first_free_vcn);
> +		write_unlock_irqrestore(&ni->size_lock, flags);
>   
>   		if (NInoSparse(ni) || NInoCompressed(ni)) {
>   			if (nr_freed_clusters) {
> +				write_lock_irqsave(&ni->size_lock, flags);
>   				ni->itype.compressed.size -=
>   					ntfs_cluster_to_bytes(vol, nr_freed_clusters);
> +				write_unlock_irqrestore(&ni->size_lock, flags);
>   				VFS_I(base_ni)->i_blocks = ni->itype.compressed.size >> 9;
>   			}
>   		} else
> @@ -4531,12 +4546,15 @@ static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
>   	}
>   
>   	/* Update data and initialized size. */
> +	write_lock_irqsave(&ni->size_lock, flags);
>   	ni->data_size = newsize;
> -	ctx->attr->data.non_resident.data_size = cpu_to_le64(newsize);
> -	if (newsize < ni->initialized_size) {
> +	update_initialized = newsize < ni->initialized_size;
> +	if (update_initialized)
>   		ni->initialized_size = newsize;
> +	write_unlock_irqrestore(&ni->size_lock, flags);
> +	ctx->attr->data.non_resident.data_size = cpu_to_le64(newsize);
> +	if (update_initialized)
>   		ctx->attr->data.non_resident.initialized_size = cpu_to_le64(newsize);
> -	}
>   
>   	/*
>   	 * Drop any page-cache folios that now lie beyond the shrunk
> @@ -4808,7 +4826,9 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>   		}
>   
>   		/* Prepare to mapping pairs update. */
> +		write_lock_irqsave(&ni->size_lock, flags);
>   		ni->allocated_size = ntfs_cluster_to_bytes(vol, first_free_vcn);
> +		write_unlock_irqrestore(&ni->size_lock, flags);
>   		if (ni->type == AT_ATTRIBUTE_LIST && !runlist_locked) {
>   			/*
>   			 * Making room for the list's mapping pairs can resize
> @@ -4854,7 +4874,9 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>   	}
>   
>   	/* Update data size. */
> +	write_lock_irqsave(&ni->size_lock, flags);
>   	ni->data_size = newsize;
> +	write_unlock_irqrestore(&ni->size_lock, flags);
>   	ctx->attr->data.non_resident.data_size = cpu_to_le64(newsize);
>   	/* Update data size in the index. */
>   	if (ni->type == AT_DATA && ni->name == AT_UNNAMED)
> @@ -4900,7 +4922,9 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
>   			ntfs_error(sb, "Failed to restore old mapping pairs");
>   
>   		if (NInoSparse(ni) || NInoCompressed(ni)) {
> -			ni->itype.compressed.size =  org_compressed_size;
> +			write_lock_irqsave(&ni->size_lock, flags);
> +			ni->itype.compressed.size = org_compressed_size;
> +			write_unlock_irqrestore(&ni->size_lock, flags);
>   			VFS_I(base_ni)->i_blocks = ni->itype.compressed.size >> 9;
>   		} else
>   			VFS_I(base_ni)->i_blocks = ni->allocated_size >> 9;
> @@ -4936,6 +4960,7 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
>   	struct ntfs_volume *vol = attr_ni->vol;
>   	struct super_block *sb = vol->sb;
>   	int err = -EIO;
> +	unsigned long flags;
>   	struct ntfs_inode *base_ni, *ext_ni = NULL;
>   
>   attr_resize_again:
> @@ -4984,10 +5009,12 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
>   					newsize);
>   		if (!err) {
>   			/* Update attribute size everywhere. */
> +			write_lock_irqsave(&attr_ni->size_lock, flags);
>   			attr_ni->data_size = attr_ni->initialized_size = newsize;
>   			attr_ni->allocated_size = (newsize + 7) & ~7;
>   			if (NInoCompressed(attr_ni) || NInoSparse(attr_ni))
>   				attr_ni->itype.compressed.size = attr_ni->allocated_size;
> +			write_unlock_irqrestore(&attr_ni->size_lock, flags);
>   			if (attr_ni->type == AT_DATA && attr_ni->name == AT_UNNAMED)
>   				NInoSetFileNameDirty(attr_ni);
>   			goto resize_done;
> @@ -5789,6 +5816,7 @@ int ntfs_non_resident_attr_insert_range(struct ntfs_inode *ni, s64 start_vcn, s6
>   	struct ntfs_attr_search_ctx *ctx;
>   	int ret;
>   	size_t new_rl_count;
> +	unsigned long flags;
>   
>   	if (ni->type != AT_DATA)
>   		return -EOPNOTSUPP;
> @@ -5830,10 +5858,12 @@ int ntfs_non_resident_attr_insert_range(struct ntfs_inode *ni, s64 start_vcn, s6
>   	ni->runlist.rl =  rl;
>   	ni->runlist.count = new_rl_count;
>   
> +	write_lock_irqsave(&ni->size_lock, flags);
>   	ni->allocated_size += ntfs_cluster_to_bytes(vol, len);
>   	ni->data_size += ntfs_cluster_to_bytes(vol, len);
>   	if (ntfs_cluster_to_bytes(vol, start_vcn) < ni->initialized_size)
>   		ni->initialized_size += ntfs_cluster_to_bytes(vol, len);
> +	write_unlock_irqrestore(&ni->size_lock, flags);
>   	ret = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
>   	up_write(&ni->runlist.lock);
>   	if (ret)
> @@ -5871,6 +5901,8 @@ int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn,
>   	int dst_cnt;
>   	int ret;
>   	size_t new_rl_cnt;
> +	unsigned long flags;
> +	s64 allocated_size;
>   
>   	if (ni->type != AT_DATA)
>   		return -EOPNOTSUPP;
> @@ -5904,6 +5936,7 @@ int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn,
>   	ni->runlist.rl = rl;
>   	ni->runlist.count = new_rl_cnt;
>   
> +	write_lock_irqsave(&ni->size_lock, flags);
>   	ni->allocated_size -= ntfs_cluster_to_bytes(vol, len);
>   	if (ni->data_size > ntfs_cluster_to_bytes(vol, start_vcn)) {
>   		if (ni->data_size > ntfs_cluster_to_bytes(vol, (start_vcn + len)))
> @@ -5918,8 +5951,10 @@ int ntfs_non_resident_attr_collapse_range(struct ntfs_inode *ni, s64 start_vcn,
>   		else
>   			ni->initialized_size = ntfs_cluster_to_bytes(vol, start_vcn);
>   	}
> +	allocated_size = ni->allocated_size;
> +	write_unlock_irqrestore(&ni->size_lock, flags);
>   
> -	if (ni->allocated_size > 0) {
> +	if (allocated_size > 0) {
>   		ret = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
>   		if (ret) {
>   			up_write(&ni->runlist.lock);
> @@ -6029,6 +6064,7 @@ int ntfs_attr_fallocate(struct ntfs_inode *ni, loff_t start, loff_t byte_len, bo
>   	int err = 0;
>   	struct runlist_element *rl;
>   	bool balloc;
> +	unsigned long flags;
>   
>   	if (ni->type != AT_DATA)
>   		return -EINVAL;
> @@ -6076,7 +6112,9 @@ int ntfs_attr_fallocate(struct ntfs_inode *ni, loff_t start, loff_t byte_len, bo
>   				err = -EIO;
>   				goto out_unmap;
>   			}
> +			write_lock_irqsave(&ni->size_lock, flags);
>   			ni->data_size = old_data_size;
> +			write_unlock_irqrestore(&ni->size_lock, flags);
>   			i_size_write(VFS_I(ni), old_data_size);
>   			if (NInoNonResident(ni))
>   				ctx->attr->data.non_resident.data_size =
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 7d93a520566e..70a86d6fee6b 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -93,6 +93,7 @@ static int ntfs_trim_prealloc(struct inode *vi)
>   	s64 vcn_ds, vcn_tr;
>   	ssize_t rc;
>   	int err = 0;
> +	unsigned long flags;
>   
>   	inode_lock(vi);
>   	mutex_lock(&mrec_ni->mrec_lock);
> @@ -119,7 +120,9 @@ static int ntfs_trim_prealloc(struct inode *vi)
>   			ni->runlist.rl = NULL;
>   			ntfs_error(vol->sb, "Preallocated block rollback failed");
>   		} else {
> +			write_lock_irqsave(&ni->size_lock, flags);
>   			ni->allocated_size = ntfs_cluster_to_bytes(vol, vcn_tr);
> +			write_unlock_irqrestore(&ni->size_lock, flags);
>   			err = ntfs_attr_update_mapping_pairs_locked(
>   					ni, 0, ni);
>   			if (err)
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 7d7bb741455e..0d97633b3e4b 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -3844,18 +3844,22 @@ static inline int ntfs_enlarge_attribute(struct inode *vi, s64 pos, s64 count,
>   	struct super_block *sb = vi->i_sb;
>   	unsigned long flags;
>   	s64 old_data_size;
> +	s64 new_initialized_size = pos + count;
> +	s64 initialized_size;
> +	s64 data_size;
>   	int ret;
>   
>   	/*
> -	 * Snapshot the old data_size under size_lock: it is the rollback
> -	 * target, the other sizes are updated by ntfs_attr_truncate()
> -	 * itself
> +	 * Snapshot the old sizes under size_lock: data_size is the
> +	 * rollback target, initialized_size is compared below, the other
> +	 * sizes are updated by ntfs_attr_truncate() itself
>   	 */
>   	read_lock_irqsave(&ni->size_lock, flags);
>   	old_data_size = ni->data_size;
> +	initialized_size = ni->initialized_size;
>   	read_unlock_irqrestore(&ni->size_lock, flags);
>   
> -	if (pos + count <= ni->initialized_size)
> +	if (new_initialized_size <= initialized_size)
>   		return 0;
>   
>   	if (NInoEncrypted(ni) && NInoNonResident(ni))
> @@ -3864,7 +3868,7 @@ static inline int ntfs_enlarge_attribute(struct inode *vi, s64 pos, s64 count,
>   	if (NInoCompressed(ni))
>   		return -EOPNOTSUPP;
>   
> -	if (pos + count > old_data_size) {
> +	if (new_initialized_size > old_data_size) {
>   		ret = ntfs_attr_truncate(ni, pos + count);
>   		if (ret) {
>   			ntfs_debug("Failed to truncate attribute");
> @@ -3914,25 +3918,39 @@ static inline int ntfs_enlarge_attribute(struct inode *vi, s64 pos, s64 count,
>   		}
>   	}
>   
> +	/* ntfs_attr_truncate() may have updated data_size, re-read it */
> +	read_lock_irqsave(&ni->size_lock, flags);
> +	data_size = ni->data_size;
> +	read_unlock_irqrestore(&ni->size_lock, flags);
> +
>   	if (!NInoNonResident(ni)) {
> -		if (likely(i_size_read(vi) < ni->data_size))
> -			i_size_write(vi, ni->data_size);
> +		if (likely(i_size_read(vi) < data_size))
> +			i_size_write(vi, data_size);
>   		return 0;
>   	}
>   
>   	/* Named streams initialize gaps after dropping the MFT record lock. */
>   	if (ntfs_inode_is_named_stream(ni)) {
> -		if (i_size_read(vi) < ni->data_size)
> -			i_size_write(vi, ni->data_size);
> +		if (i_size_read(vi) < data_size)
> +			i_size_write(vi, data_size);
>   		return 0;
>   	}
>   
> -	if (pos + count > ni->initialized_size) {
> +	/* Re-read to avoid race after possible truncate */
> +	read_lock_irqsave(&ni->size_lock, flags);
> +	initialized_size = ni->initialized_size;
> +	read_unlock_irqrestore(&ni->size_lock, flags);
> +
> +	if (new_initialized_size > initialized_size) {
>   		ctx->attr->data.non_resident.initialized_size = cpu_to_le64(pos + count);
>   		mark_mft_record_dirty(ctx->ntfs_ino);
> +
> +		write_lock_irqsave(&ni->size_lock, flags);
>   		ni->initialized_size = pos + count;
> -		if (i_size_read(vi) < ni->initialized_size)
> -			i_size_write(vi, ni->initialized_size);
> +		write_unlock_irqrestore(&ni->size_lock, flags);
> +
> +		if (i_size_read(vi) < new_initialized_size)
> +			i_size_write(vi, new_initialized_size);
>   	}
>   	return 0;
>   }

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

