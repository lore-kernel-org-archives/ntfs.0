Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795576722;
	b=NvpkMJRF4a4VaERm7GZ6N54SyIkGzZCmz8nZY8LGWOMaG5sGQGl69bF/CPeA6tl9yPme
	 ZUd/d/4VlA8ULWFxfFUSzceIr0e9Z1C5OFZMnGqCkt/3nmxGYA+WR4fMdlN/l4moJKAGC
	 XW8VGtxPKLbu/EuvXtzqmbBFTMUiLG4t5VB/C1j5fRO9aSOHPZNlaX1QAOxXp3Yl6/XWP
	 hxTdlue+/Fl5KRRm2nzHNTynfkf6UMlrI208SrfJZb8amqw+futHOXkvRs26vmYyM5mxr
	 9f9fbrPRhuHiRk2nf4t8R874v2otRjEU3krwLkU6sjwKyNnGXpas1d+amqnb06Av+zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795576722;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=3AGeBQ4n1Qn9/uaSpUsSFxFzHCYbDAjSiA3J7ReA5f0=;
	b=xNZ6lbQO/jAutRc0SZ5GaHY8nG2JlZyPkWEMzwhkG3m3TixJVYFGaI9+KcdtU9U8yVvG
	 x8trl1gpsqdpzqtBnhrtRJx9fKAKjCXG5vTdbCya8aJZ7zyucfTV8qZ76Aox0AjkZjjYf
	 wDLH0aLAiUY9xK+N+IK9YjjdUHtnMuSUvOGIQgvCg9PkWeVQ05/DLT4XmBi5wsEpt5pb0
	 h8Ne9moNDQEyX4UzYWC58Bogk0SiiByg4RmRB5SURlJFVnCU143mHF1YTjKQcIW76Rv2Q
	 dcFu5b0dG50xY3g9zDiNANxlkJGyghKzkfvNInVXlfx2YCGFMBbimJomXPx435XtJkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="E/a6ZQao";
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC75606A31E
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 03:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFC75606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=E/a6ZQao
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=3AGeBQ4n1Qn9/uaSpUsSFxFzHCYbDAjSiA3J7ReA5f0=;
	b=E/a6ZQaonO7qDO9pEfoug4VmVw+KeH9AHTVMUELkCUFqXowyV4ae0wjrSL4ahL
	rHG1Cw2l/NYuIk3awxF9h6/LEVpBXpb/Rx8mMVZcGZqkAtYJgbvboRQ7X7gTVFKX
	AKVF0B9iTxmvfZLMs569FdpDkljLOHSjaKlWYwBzx+rfA=
Received: from [IPV6:2409:8900:1a90:8163:30cc:9d3c:47b5:d01f] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDXtBBzUwZrmGkkKA--.58335S2;
	Wed, 25 Nov 2026 11:18:13 +0800 (CST)
Message-ID: <072df74b-3271-4802-8037-ee620d5d0888@163.com>
Date: Wed, 25 Nov 2026 11:18:11 +0800
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
Subject: Re: ntfs: deleting $Extend breaks subsequent mount
To: theBIT5 x3zk <x3zk@outlook.com>, Namjae Jeon <linkinjeon@kernel.org>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:NTFS FILESYSTEM" <ntfs@lists.linux.dev>,
 Hyunchul Lee <hyc.lee@gmail.com>, Baolin Liu <liubaolin@kylinos.cn>
References: <DM4PR15MB6276A5C442568B4C7E604AA386452@DM4PR15MB6276.namprd15.prod.outlook.com>
 <CAKYAXd-MHxzjvc20J-x4VYBnuk3sVpzmHo+zrHb8n3nx8Aav6g@mail.gmail.com>
 <a2f75e81-b012-4bb1-8885-a2ed310fa988@163.com>
 <DM4PR15MB6276AEA50787E7D27EF8590B86442@DM4PR15MB6276.namprd15.prod.outlook.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <DM4PR15MB6276AEA50787E7D27EF8590B86442@DM4PR15MB6276.namprd15.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXtBBzUwZrmGkkKA--.58335S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr1DKrWDtF13GF1fur4fGrg_yoWrZFykpr
	ZrGF92grykG347twnFqFZ8Z3W0vr1xtw4UXr13Xr18tas0q3ZIgF1jgFyYgr1rtryfKw45
	Zw4UW345uw4UAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U6a0dUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hVOGWsGU3W5OQAA3j



在 2026/11/25 01:20, theBIT5 x3zk 写道:
> Hi,
> 
> Built 7.4.0-rc4 with both patches applied and ran basic checks.
> Deleting '$Extend', creating files inside it, and writing to its system
> files now all fail with Operation not permitted, and remounting works:
> 
> # mount -t ntfs /root/ntfs.img /mnt -o loop
> # cd /mnt
> # rm -fr '$Extend'
> rm: cannot remove '$Extend/$ObjId': Operation not permitted
> rm: cannot remove '$Extend/$Quota': Operation not permitted
> rm: cannot remove '$Extend/$Reparse': Operation not permitted
> # cd '$Extend'
> # touch file
> touch: cannot touch 'file': Operation not permitted
> # cat /dev/null > '$ObjId'
> warning: An error occurred while redirecting file '$ObjId'
> open: Operation not permitted
> # cat /dev/null > '$Quota'
> warning: An error occurred while redirecting file '$Quota'
> open: Operation not permitted
> # cat /dev/null > '$Reparse'
> warning: An error occurred while redirecting file '$Reparse'
> open: Operation not permitted
> 
> Tested-by: theBIT5 x3zk <x3zk@outlook.com>

  Thanks for testing and confirming

> 
> ________________________________________
> От: liubaolin <liubaolin12138@163.com>
> Отправлено: 24 ноября 2026 г. 10:08
> Кому: Namjae Jeon; theBIT5 x3zk
> Копия: linux-fsdevel@vger.kernel.org; linux-kernel@vger.kernel.org; open list:NTFS FILESYSTEM; Hyunchul Lee; Baolin Liu
> Тема: Re: ntfs: deleting $Extend breaks subsequent mount
> 
> 
> 
> 在 2026/11/24 09:40, Namjae Jeon 写道:
>> On Tue, Nov 24, 2026 at 5:01 AM theBIT5 x3zk <x3zk@outlook.com> wrote:
>>>
>>> Hi,
>> Hi,
>>>
>>> Was messing around with the new ntfs driver (fs/ntfs) on 7.4.0-rc3-1-mainline
>>> and noticed you can just rm -rf '$Extend' even without show_sys_files.
>>> After umount, the filesystem fails to mount again.
>>>
>>> Steps:
>>>
>>> # mount -t ntfs /root/ntfs.img /mnt -o loop
>>> # cd /mnt
>>> # ls '$Extend'
>>> '$ObjId'  '$Quota'  '$Reparse'
>>> # rm -rf '$Extend'
>>> # cd /
>>> # umount /mnt
>>> # mount -t ntfs /root/ntfs.img /mnt -o loop
>>> mount: /mnt: wrong fs type, bad option, bad superblock on /dev/loop0,
>>>          missing codepage or helper program, or other error.
>>>
>>> dmesg:
>>> ntfs: volume version 3.1, dev loop0, cluster size 4096
>>> ntfs: (device loop0): load_system_files(): Failed to load $Extend.
>>> ntfs: (device loop0): ntfs_fill_super(): Failed to load system files (-22).
>> Please check the attached patch.
>> Thanks for the report.
> 
> Hi Namjae,
>     I noticed that NInoSetExtendSys() is only reached when looking up the
> unnamed $DATA attribute returns -ENOENT. A file directly under $Extend
> that has an unnamed $DATA attribute skips this path and never gets
> NI_ExtendSys set, leaving it mutable without sys_immutable.
> 
>     I reproduced this with your patch applied, using default mount options
> and a synthetic NTFS image containing a SYSTEM-marked file with unnamed
> $DATA directly under $Extend. After remounting, this write still succeeds:
>       echo changed > '/mnt/$Extend/review-data'
> 
>     Could we move the direct-child classification into the common
> inode-loading path, so that setting NI_ExtendSys does not depend on
> whether the unnamed $DATA attribute exists?
>     I tested the change below in QEMU. The write above is now rejected
> with EPERM, and normal file, hard-link, symlink and remount checks pass.
> 
> Thanks,
> Baolin
> 
> You may consider applying the following change on top of your attached
> patch:
> **************************************************************************
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index e1c5a767e62b..c0e2535401bb 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -959,6 +959,15 @@ static int ntfs_read_locked_inode(struct inode *vi)
>                   goto unm_err_out;
>           }
> 
> +       /* Classify $Extend children regardless of their data/index
> layout. */
> +       if (ni->mft_no >= FILE_first_user) {
> +               err = ntfs_is_extended_system_file(ctx);
> +               if (err < 0)
> +                       goto unm_err_out;
> +               if (err > 0)
> +                       NInoSetExtendSys(ni);
> +       }
> +
>           if (ni->flags & FILE_ATTR_REPARSE_POINT) {
>                   unsigned int mode;
> 
> @@ -1163,7 +1172,6 @@ static int ntfs_read_locked_inode(struct inode *vi)
>                            */
>                           extend_sys = ntfs_is_extended_system_file(ctx);
>                           if (extend_sys > 0) {
> -                               NInoSetExtendSys(ni);
>                                   if (m->flags & MFT_RECORD_IS_VIEW_INDEX) {
>                                           if (extend_sys == 2) {
>                                                   name = reparse_index_name;

