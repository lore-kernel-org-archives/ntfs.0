Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870831;
	b=4bpoxiTnV/3BICA+DI9wEcv40Hlk4TJph9R+rk6+bbrWToWO77RSRtOuMbOCae+JjntF
	 eZ8SE38U02yvowDhdQW4bwVQgqImX6C2rz0rWX/ANMxiMquz4CTuWm9xEo7se9Cs+ZBLs
	 XYqgnkFmmh9ruTADWYmVCqw/i6HtD82N0+cywM/Q3aWy88cKNZwuI9NxPWvWJWzZGl0Wn
	 AgNOZ2F4eNGaNlQE2BYDloYY8sE7poO0Ya1hmbEq4+3xrOuGMzKtvTZWT+WbHyIVmoGCf
	 jQGyq4+r53z9blI70GjKJSwOMT3ZNnzCjcYNnL+JJlGWISOyu0UOcnuHWDA9UmaISpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870831;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=S8OhL0sWlaiu9HTVuPROxOXwPJKrkeDv120Lpyg3CIo=;
	b=gqubNXI20DydoRrdddWye/5y3O4iiY93tvPIK081xT23iZuWoyiBuuv0TWDLc6z09tSC
	 V9B12arQ/ppYpnA3St8POztkW3eTHsAtA1vNR7yAq1TKrQKplK6ktsygqkQUEUzevD9e9
	 2HzQkBWGJDXIxVGtJiOtd+usBPBDAjeVUDexO3Oweb/iYnyA08nwrEVlcGFyuDxJTcSYD
	 IryexOfqU9L4OUw7FC4b1ELUlnbE5AQh01qa1qtakNWnM7SH+CG2qLMX0o7aztC3qi4fV
	 2IhdrLmZoylxD+76rlRFZqvuiwlaELG8eff9FJA1Q6PHxkI67/vrMSPWD0hvQQIpmTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GlwtRxbi;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6925D606A331
	for <ntfs@lists.linux.dev>; Thu,  5 Nov 2026 09:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6925D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GlwtRxbi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=S8OhL0sWlaiu9HTVuPROxOXwPJKrkeDv120Lpyg3CIo=;
	b=GlwtRxbijzUXJNq0K8qSjdS3z5kMtIMdNd4guz9kWdeoQhFysajAt3d6VgJwf1
	uki9EnDa5V9fgFGSOZFxJWHXyeJGk+XXhnX/TNoFKxRF+CfJi9gSuNqpEdPP8fzs
	A3Z8XV3IEOV4NpkOrhsudlykaTrHvF1b/KGZ3HWEFxHcA=
Received: from [IPV6:2409:8900:1fc3:1c4:3f62:6239:6a4a:222a] (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgBnaJHYS+xqZ2xoEA--.8144S2;
	Thu, 05 Nov 2026 17:26:50 +0800 (CST)
Message-ID: <470adc85-93ad-4e75-9e72-ab35362373bd@163.com>
Date: Thu, 5 Nov 2026 17:26:48 +0800
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
Subject: Re: [PATCH] ntfs: fix out-of-bounds write race in
 NTFS_IOC_LIST_STREAMS
To: Xingyuan Mo <hdthky0@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>
Cc: "open list:NTFS FILESYSTEM" <ntfs@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20261105073353.433854-1-hdthky0@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261105073353.433854-1-hdthky0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgBnaJHYS+xqZ2xoEA--.8144S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF43Xw4rtFW3Gw4UJrWrKrg_yoWrCF15pF
	y3K3ySqrs7Jr1xArs7ta1Y9ry093Z2gw4UKrZagFy2va13Xr1aqF17K3y8Wry8CrZ8uFyU
	Aas0q39xWw1Uua7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U24iUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hreqWrsS9pZagAA3j



在 2026/11/5 15:34, Xingyuan Mo 写道:
> NTFS_IOC_LIST_STREAMS walks the base inode's MFT attributes twice:
> a first pass sizes the output buffer, a second pass fills it, both
> times filtering out streams that ntfs_stream_unlinked() reports as
> unlinked.  That filter is the culprit: it treats a stream inode that
> is no longer in the inode hash as live, which is precisely the state
> a stream being deleted ends up in.
> 
> When a base file is deleted while one of its named streams is still
> open, ntfs_cleanup_deleted_inode() sets NInoStreamUnlinked on the
> stream inode and removes it from the inode hash after dropping the
> MFT record lock.  Nothing serializes this against the ioctl's two
> passes, so if the flag and the unhash land between them, the first
> pass excludes the stream while the second pass includes it, and the
> ioctl writes an entry the allocation never accounted for.
> 
> The per-entry bounds check cannot catch this divergence, because
> "offset > required - entry_size" underflows when entry_size exceeds
> required.  With a 1-character stream sizing the buffer at 48 bytes and
> a 250-character stream surfacing only in the second pass, a 544-byte
> entry is written into the 48-byte kmalloc-64 allocation.
> 
> Close the hole in two steps:
> 
> - Reject base inodes that are being deleted before walking their
>    attributes, like the other named stream entry points in this file
>    already do.  This also stops the listing from reporting streams of a
>    deleted base file as live, which is reproducible even without the
>    race.
> 
> - Make the bounds check underflow-safe so any remaining divergence
>    between the passes can only produce -EOVERFLOW, never an
>    out-of-bounds write.
> 
> KASAN report from the reproducer (timestamps stripped):
> 
> BUG: KASAN: slab-out-of-bounds in ntfs_ioctl_list_streams+0x7a9/0xa00
> Write of size 500 at addr ffff88800b1931a8 by task ntfs_ads_race/305
> CPU: 2 UID: 0 PID: 305 Comm: ntfs_ads_race
> Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0x73/0xb0
>   print_report+0xd1/0x610
>   kasan_report+0xff/0x130
>   kasan_check_range+0x10c/0x1c0
>   __asan_memcpy+0x3f/0x70
>   ntfs_ioctl_list_streams+0x7a9/0xa00
>   ntfs_ioctl+0x3b6/0x420
>   __x64_sys_ioctl+0xd1/0x120
>   x64_sys_call+0x2a5/0x2220
>   do_syscall_64+0x109/0x5e0
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
>   </TASK>
> 
> Allocated by task 305:
>   kasan_save_stack+0x3d/0x60
>   kasan_save_track+0x18/0x40
>   kasan_save_alloc_info+0x3b/0x50
>   __kasan_kmalloc+0x9c/0xa0
>   __kvmalloc_node_noprof+0x2dd/0x800
>   ntfs_ioctl_list_streams+0x57f/0xa00
>   ntfs_ioctl+0x3b6/0x420
>   __x64_sys_ioctl+0xd1/0x120
>   x64_sys_call+0x2a5/0x2220
>   do_syscall_64+0x109/0x5e0
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> The buggy address belongs to the object at ffff88800b193180
>   which belongs to the cache kmalloc-64 of size 64
> The buggy address is located 40 bytes inside of
>   allocated 48-byte region [ffff88800b193180, ffff88800b1931b0)
> 
> Fixes: 48996054b706 ("ntfs: add named stream ioctls support")
> Signed-off-by: Xingyuan Mo <hdthky0@gmail.com>
> ---
>   fs/ntfs/named_stream.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs/named_stream.c b/fs/ntfs/named_stream.c
> index 95a3c05f9821..70c589207713 100644
> --- a/fs/ntfs/named_stream.c
> +++ b/fs/ntfs/named_stream.c
> @@ -1632,6 +1632,10 @@ int ntfs_ioctl_list_streams(struct file *filp, unsigned long arg)
>   	ubuf = (void __user *)arg + sizeof(hdr);
>   
>   	mutex_lock(&ni->mrec_lock);
> +	if (NInoBeingDeleted(ni) || !inode->i_nlink) {
> +		mutex_unlock(&ni->mrec_lock);
> +		return -ENOENT;
> +	}
>   	actx = ntfs_attr_get_search_ctx(ni, NULL);
>   	if (!actx) {
>   		mutex_unlock(&ni->mrec_lock);
> @@ -1731,7 +1735,7 @@ int ntfs_ioctl_list_streams(struct file *filp, unsigned long arg)
>   		}
>   
>   		entry_size = ALIGN(name_offset + name_len, 8);
> -		if (offset > required - entry_size) {
> +		if (offset > required || entry_size > required - offset) {
>   			ret = -EOVERFLOW;
>   			kfree(sn);
>   			sn = NULL;

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

