Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2E3392828
	for <ntfs@lists.linux.dev>; Sat, 17 Oct 2026 11:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792238332; cv=none; b=AgwgeVAjYpyjWIrYbsnVhzjHhjexX95ufQIr/aU26iy+sq4B7fiysU0GBJk0s1l44qPgYO7JDu1v6+j+7jtdpU43Hy/3h4bWmXg5BN+6ktwVeQ6ztY1Ucg98qiImWziB1F5aD2DB7UDNWTzozUnZjAAme/XMuwkLCRZuOrgItfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792238332; c=relaxed/simple;
	bh=T/9SkEwODbyajpkgrrIWz3smX7KnI4hwrneFTvaZWII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDUab9XcinkifthDCBQlOWq7Op5YM8UFmfWDb2XEBxL5EbyuJPdZ1g8ztMV6nC7ocBFBSeycmn1kGNismR0hXmDTuFNPt4p7hTsPzsj3XhkpNt+++rL0QECdaPhqfpRaD1ZAHReAcqcPiZ9hNpzugvRsQHTB4EuDzNQ1LjQ5mi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RbqWxeMo; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RbqWxeMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=yCD/TTQMviE6vaji4v0giLf1RPqkWhSu3L4P5tvLG34=;
	b=RbqWxeMoH7F3CVbyB6FkK1JMM9gPXgVR29WHHM6KbREGZwEWeLHUOpb56aKyvs
	+OxsBS4O9A0EGZVPOMx2PnDJwfZUESS1j5teI8rkgMJndUnrqzEZf2gCoF0596xg
	fkQuF/VRYEFa1wOYf3U3IY/hm5iExqERH9W/b8DBJlCPQ=
Message-ID: <a4dc245d-5c82-4051-a193-9678f94310e6@163.com>
Date: Sat, 17 Oct 2026 19:58:28 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: check index block capacity in ntfs_ib_copy_tail()
To: Hang Nan <2122295973@qq.com>, linkinjeon@kernel.org, hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev
References: <tencent_B4CAA82E44ED5B89EB9ED691CABE58D3BF09@qq.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <tencent_B4CAA82E44ED5B89EB9ED691CABE58D3BF09@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3Hw3kYtNqxtQiAw--.2495S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuw18GF1ktry8uF1kGF4rXwb_yoWxAw4rpa
	9rGr93tayDXr17urs2qF1UJasa9w1xAr4UGrWYkFy7Casxtr1xKFnYvryYgas2krZ3Aa42
	qF1YqrZruryUZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ukb15UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QVhLGrTYuVoZgAA3R



在 2026/10/17 01:14, Hang Nan 写道:
> fs/ntfs: fix 8-byte heap overflow in ntfs_ib_copy_tail()
> 
> This report was produced with the help of AI tooling, so per
> Documentation/process/security-bugs.rst I am reporting it publicly.  It is a
> plain bug and not a security bug under the project's own threat model (item 3).
> 
> 1. Affected version
>     v7.3-rc7 (and v7.2).  File: fs/ntfs/index.c:1218 (ntfs_ib_copy_tail()).
>     The file is byte-identical in mainline
>     0fcb05b72344f40806cbe810de8872f1698bf053 (2026-10-14), so this is not fixed
>     upstream.
> 
> 2. The problem
>     ntfs_ib_copy_tail() copies the tail of a source index block into a
>     destination index block without checking that it still fits:
> 
>         index.c:1216   memcpy(ntfs_ie_get_first(&dst->index), ie_head, tail_size)
> 
>     tail_size comes entirely from the on-disk fields of the source block, while
>     the destination is whatever ntfs_ib_alloc() allocated.  Worst case for
>     ib_size == 4096:
> 
>         tail_size    = (24 + 4072) - (24 + 16) - 16 = 4040
>         dst capacity = 4096 - 24 - 40               = 4032        => 8 bytes over
> 
>     The sibling helper ntfs_ir_to_ib() already got this check in the v7.2..v7.3
>     window (index.c:1163-1169); ntfs_ib_copy_tail() was not updated, so one of
>     the two copy sites is still unchecked.  Path:
>     ntfs_index_add_filename() -> ntfs_ie_add() -> ntfs_ib_split() ->
>     ntfs_ib_copy_tail() -> memcpy().
> 
> 3. Triggering conditions and classification
>     - image crafted so that index blocks report entries_offset == 16,
>       index_length == allocated_size == 4072 with a single INDEX_ENTRY_END, and
>       usa_count == 1 (which also switches off the MST fixup);
>     - the image has to be mounted => CAP_SYS_ADMIN (or a loop mount).  Per
>       Documentation/process/threat-model.rst:219-223, "bugs triggered by
>       mounting a corrupted or maliciously crafted file system image" are not
>       considered vulnerabilities ("mounting a block device is a privileged
>       operation") - so I am reporting this as an ordinary bug, not as a
>       vulnerability;
>     - observed on v7.3-rc7 with slub_debug=zf:
> 
>         [Right Redzone overwritten] 0xffff8937c24e5000-0xffff8937c24e5007
>         @offset=20480. First byte 0x50 instead of 0xcc
>         BUG kmalloc-4k (Not tainted): Object corrupt
>         Call Trace:
>          check_bytes_and_report+0x11e/0x140
>          free_to_partial_list
>          ntfs_ib_split+0x120/0x540
>          ntfs_ie_add+0xcd/0x200
>          ntfs_index_add_filename+0xca/0x120
>          __ntfs_create+0xa68/0xd60
>          ...
>          __x64_sys_openat
> 
>       The 8 bytes written past the block are attacker-controlled image data (the
>       log shows the marker bytes planted in the image).  A KASAN kernel reports
>       the same window: "slab-out-of-bounds in ntfs_ib_split", "Write of size 4040
>       at <object+64>" on a kmalloc-4k object - also 8 bytes past the end.
> 
> 4. Reproducer
>     Available on request: a script that turns a mkntfs-created volume into the
>     crafted image (plus the initramfs that mounts it and creates the file), and
>     the console logs.
> 
> 5. Proposed fix
>     Add the same capacity check ntfs_ir_to_ib() already uses, and return -EIO,
>     which ntfs_ib_split() already propagates.  Tested on v7.3-rc7: with the
>     patch applied there is no redzone report at all and the create fails early
>     with
> 
>         ntfs: ntfs_ib_copy_tail(): Entries (4040 B) exceed IB capacity
> 
> 
> --- git format-patch output ---
> (format-patch 信封的 From/Date 行已删去；下方即为补丁正文：提交信息 + diff)
> Subject: [PATCH] ntfs: check index block capacity in ntfs_ib_copy_tail()
> 
> ntfs_ib_copy_tail() moves every index entry after the median entry from the
> source index block into a newly allocated one:
> 
> 	ie_head = ntfs_ie_get_next(median);
> 	ies_end = (u8 *)ntfs_ie_get_end(&src->index);
> 	tail_size = ies_end - (u8 *)ie_head;
> 	memcpy(ntfs_ie_get_first(&dst->index), ie_head, tail_size);
> 
> tail_size is computed from the source block alone and is never checked
> against the capacity of the destination, so a source index block whose
> entries do not fit the destination's allocated_size - entries_offset area
> writes past the end of the destination block:
> 
>    BUG: KASAN: slab-out-of-bounds in ntfs_ib_split+0x481/0x1a60
>    Write of size 4040 at addr ffff88800358c040 by task creat/...
>    Allocated by task ...: ntfs_ib_alloc+0x29
>    The buggy address belongs to the object at ffff88800358c000
>    which belongs to the cache kmalloc-4k of size 4096
> 
> The destination is allocated by ntfs_ib_alloc() with the source block size,
> and the sibling conversion path already performs exactly this check before
> copying entries, in ntfs_ir_to_ib() - added by dc09bf79b76f ("ntfs: Fix
> index_root heap OOB write in ntfs_ir_to_ib()"), i.e. the same overflow in
> the same file, fixed in July 2026:
> 
> 	ib_cap = le32_to_cpu(ib->index.allocated_size) -
> 			le32_to_cpu(ib->index.entries_offset);
> 	if ((u32)i > ib_cap) { ... }
> 
> Add the same check here and fail the split with -EIO.  ntfs_ib_split()
> already unwinds correctly when this function returns an error: it clears
> the newly allocated VCN with ntfs_ibm_clear() and jumps to its error path.
> 
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Signed-off-by: Hang Nan <2122295973@qq.com>
> ---
>   fs/ntfs/index.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
> index 580998990..b9d0544f3 100644
> --- a/fs/ntfs/index.c
> +++ b/fs/ntfs/index.c
> @@ -1200,6 +1200,7 @@ static int ntfs_ib_copy_tail(struct ntfs_index_context *icx, struct index_block
>   		struct index_entry *median, s64 new_vcn)
>   {
>   	u8 *ies_end;
> +	u32 ib_cap;
>   	struct index_entry *ie_head;		/* first entry after the median */
>   	int tail_size, ret;
>   	struct index_block *dst;
> @@ -1215,6 +1216,17 @@ static int ntfs_ib_copy_tail(struct ntfs_index_context *icx, struct index_block
>   
>   	ies_end = (u8 *)ntfs_ie_get_end(&src->index);
>   	tail_size = ies_end - (u8 *)ie_head;
> +
> +	/* Entries must fit in the allocated index block */
> +	ib_cap = le32_to_cpu(dst->index.allocated_size) -
> +			le32_to_cpu(dst->index.entries_offset);
> +	if ((u32)tail_size > ib_cap) {
> +		ntfs_error(NULL, "Entries (%d B) exceed IB capacity",
> +			   tail_size);
Hi Hang,
    Please pass icx->idx_ni->vol->sb instead of NULL to ntfs_error(). In 
the current tree, __ntfs_error() calls ntfs_handle_error() only when sb 
is non-NULL, so passing NULL skips the configured errors= policy and 
omits the device name.

Thanks,
Baolin.

> +		kvfree(dst);
> +		return -EIO;
> +	}
> +
>   	memcpy(ntfs_ie_get_first(&dst->index), ie_head, tail_size);
>   
>   	dst->index.index_length = cpu_to_le32(tail_size +

