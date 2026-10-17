Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ED548F017
	for <ntfs@lists.linux.dev>; Sat, 17 Oct 2026 12:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792238675; cv=none; b=n8S8nO89STQTkw40D3dJdY3veBPwzhkLFzX5JiiSn9d/DSg8GBKJNvQuZxbujAx4epgP2sI1i78zkKWWq+uOuhe/i8LM/pq10m6q0ETLPaLxyBi8g//OU1/ShwFRVHHxlAVGrmcTVJJu7UHu/S5BeyIMbXpHnRYw0I2WGE0dOeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792238675; c=relaxed/simple;
	bh=ZjxTnbsU34aDPuNUOSPx3/8QO4DV1C+gczy8AqnDV+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GpJAwd8YYSF0UeMQPhSz6IuftXeY5Clr2j3jbmHrUyu7z4U7HksnsWlzVoouVp3Azt9ovl86yErrwcB5bEbO87rTSFVyc7rxyVIxVcj/lA/3g/t7HXKLyMnDOX+5Rqr1L9Q1tN+X0YiXTKGZK8x36L0wih6YUKHdkNQMTU+3nGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Q5zk9SYw; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Q5zk9SYw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=0iblGz6Ap8TXEifwU4JixX3TX6oNH4EhygedGzWwlrk=;
	b=Q5zk9SYwsNhcLI0KjrBtnt3nVro8ZAj/dKAIkP24HOUKjLjDiUA7ituzWGBrYO
	Jna1AQyYxDrqGCTgQURqWj1Aph8UpDIxLtqKkPYjWjXYMzemISDPdChp5aHZvXpN
	dvniYr2o17TdV+I/8eOlz2BGzzhtxlvfFNUHrhf3Ow6Fw=
Message-ID: <dbe87d5a-1f66-46c6-bc32-40016056ef26@163.com>
Date: Sat, 17 Oct 2026 20:04:16 +0800
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
X-CM-TRANSID:_____wD3fwRAZNNqHfAOAw--.55115S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuw18GF1ktry8uF1kGF4rXwb_yoWxZF17pF
	ZrGr93taykXr17urs2qF18Jasa9w18Ar4UGryYkFy7Casxtr1xKFnYvryYgas2krZ3Aa42
	qF1YqrW7uryUZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UgtxDUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gG4g2rTZEH1DwAA32



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
Hi Hang,
    The commit message is too long for this change.
The repeated code excerpts and detailed comparison with ntfs_ir_to_ib() 
make it harder for reviewers and future readers to identify the main 
issue and the fix.
    Please shorten it to briefly explain the triggering condition, why 
the out-of-bounds write occurs, and how the capacity check prevents it. 
Detailed analysis and full diagnostic logs can go in a separate email.

Thanks,
Baolin.

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
> +		kvfree(dst);
> +		return -EIO;
> +	}
> +
>   	memcpy(ntfs_ie_get_first(&dst->index), ie_head, tail_size);
>   
>   	dst->index.index_length = cpu_to_le32(tail_size +

