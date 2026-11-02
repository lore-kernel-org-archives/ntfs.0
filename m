Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793582863;
	b=bhncpq0PrgrfeAiiifojy4QAysCqhTAnoRqpqd/dGVtnTCPbFhc8DBwp2T1C33EXGTbh
	 vLm2L61Cw7XikIoCpJgQWoFJMzZ5lL3rfjESyO+rfAs3C8qZc0fa9KQxg254OYvjozPaG
	 W6CFutZC/o+svqVUYRr25nPU0lSB49sRV+JQVNEdlhjAKe4ckARhYkmdOicuf+K0nVY0e
	 AhnXVUzk9KGl3WZt7Qj1ieiO0qHaCnNVx69Wd1Try23XEpLPuMeyqIy+keU5lX/UHviZu
	 5nKtXOAJOVRchg7Fkgjhg74vRy0Xw1rxYA92kh0TnyoBeWlfqO/PacKVtbB9hI07xkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793582863;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=9MdEfYVNw4UaXqvoxSqg3QZ/2+jK+uQAvsgyvu2Lk2c=;
	b=4Ex1uhBOeWvU7EUHbQ6bBp17wrogz7AYU6YXCyi9/FUb7iTwQtO5yU9I+KkLxXVOvUus
	 /gIqrgH16MwIyqsD1wfu+fzL//QvkcKzFHE3n1CTiXSVjQZaXXsv+w9DlBwaBp3wvxKcf
	 /EKGc7wvAceLu1mYSDJ+E1D+PJwOavwKNYD670suIK88knKkaWG9Rvy8qdfx4AI5e8W/9
	 Xd/6dtg/Nveys7ADsyt4574/ZLgu405v0h71/ku+eGoiQMf6XpL64AGVwo8zDIP7Fwu03
	 FiydGlXWQd1AoMAyfRARTZVg9UjwwegZUUpqsLJ0mn+12VcXBfg9SdSr9wNkT8GA4Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Z2jNwbD1;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBADA606A334
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 01:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBADA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Z2jNwbD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=9MdEfYVNw4UaXqvoxSqg3QZ/2+jK+uQAvsgyvu2Lk2c=;
	b=Z2jNwbD1MXQI6Ofy2WeMGsGgZ7+3h10eKw7V9KTvHNMOTmhhaLk3nc7u8EfFA2
	RRtC8UmR3aJctPU6DlpoxqUQpMMgq2C18KD8K7/T64tMn3mdi5bQ9HJj+oUKAvdG
	MCu33XppR64H+qb9U0aVt3cyIn00CTcORbe5WgZOF0PDo=
Received: from [IPV6:2409:8900:1ec1:a6a9:20b7:ad53:8d1b:95af] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgC3hmzm5udqUTzWDQ--.41251S2;
	Mon, 02 Nov 2026 09:27:04 +0800 (CST)
Message-ID: <3c2206e2-158c-4e0c-af9c-116c3a77b1d7@163.com>
Date: Mon, 2 Nov 2026 09:27:02 +0800
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
Subject: Re: ntfs_resident_attr_value_resize() uses value_offset w/o check
To: rtm@csail.mit.edu, Namjae Jeon <linkinjeon@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev
References: <72452.1793479234@localhost>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <72452.1793479234@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgC3hmzm5udqUTzWDQ--.41251S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF4UArW8Xr4UZrWrGryrtFb_yoWrWFW5pr
	WSyFn8Gr40qw1UWrsFgFs8J3WFkw1v9ayUWr9rW34Fvr43uw1a9a4xK3yUWrZ7trykGr47
	JF4vq3yxAr15WaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRQTmgUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QqIU2rn5uoIuwAA3K



在 2026/11/1 04:40, rtm@csail.mit.edu 写道:
> In ntfs/attrib.c's ntfs_resident_attr_value_resize():
> 
>          old_size = le32_to_cpu(a->data.resident.value_length);
>          if (new_size > old_size)
>                  memset((u8 *)a + le16_to_cpu(a->data.resident.value_offset) +
>                                  old_size, 0, new_size - old_size);
> 
> A corrupt NTFS image could have value_offset greater than the
> attribute length, so that memset() zeros outside of the allocated
> memory.
> 
> A demo:
> 
> # wget http://www.rtmrtm.org/rtm/ntfs40e.img.gz
> # gunzip ntfs40e.img.gz
> # cp ntfs40e.img junk
> # mount -t ntfs -o loop,rw junk /mnt
> # echo b >> /mnt/a
> 
> You'll need to add a printk to ntfs_resident_attr_value_resize() to
> see the problem (unless you get lucky and the memset() disturbs some
> critical kernel data).
> 
> (gdb) where
> #0  ntfs_resident_attr_value_resize (m=<optimized out>, a=0xffffffd6059ce548,
>      new_size=new_size@entry=4) at fs/ntfs/attrib.c:1982
> #1  0xffffffff804c0ab0 in ntfs_resident_attr_resize (
>      attr_ni=attr_ni@entry=0xffffffd603ded000, newsize=newsize@entry=4,
>      prealloc_size=prealloc_size@entry=0, holes=1) at fs/ntfs/attrib.c:4918
> #2  0xffffffff804c1814 in ntfs_attr_expand_locked (
>      ni=ni@entry=0xffffffd603ded000, newsize=newsize@entry=4,
>      prealloc_size=prealloc_size@entry=0, locked_ni=locked_ni@entry=0x0)
>      at fs/ntfs/attrib.c:5207
> #3  0xffffffff804c18c0 in ntfs_attr_expand (ni=ni@entry=0xffffffd603ded000,
>      newsize=newsize@entry=4, prealloc_size=prealloc_size@entry=0)
>      at fs/ntfs/attrib.c:5224
> #4  0xffffffff804c786a in ntfs_expand_for_write (end=4, ni=0xffffffd603ded000)
>      at fs/ntfs/file.c:850
> #5  ntfs_file_write_iter (iocb=0xffffffc600253dc8, from=0xffffffc600253da0)
>      at fs/ntfs/file.c:923
> #6  0xffffffff803031d2 in new_sync_write (ppos=0xffffffc600253e40, len=2,
>      buf=0x2aaaae3620 <error: Cannot access memory at address 0x2aaaae3620>,
>      filp=0xffffffd6049351c0) at fs/read_write.c:595
> #7  vfs_write (file=file@entry=0xffffffd6049351c0,
>      buf=buf@entry=0x2aaaae3620 <error: Cannot access memory at address 0x2aaaae3620>, count=count@entry=2, pos=pos@entry=0xffffffc600253e40)
>      at fs/read_write.c:687
> #8  0xffffffff803035fa in ksys_write (fd=<optimized out>,
>      buf=0x2aaaae3620 <error: Cannot access memory at address 0x2aaaae3620>,
>      count=2) at fs/read_write.c:739
> #9  0xffffffff80303678 in __do_sys_write (count=<optimized out>,
>      buf=<optimized out>, fd=<optimized out>) at fs/read_write.c:750
> #10 __se_sys_write (count=<optimized out>, buf=<optimized out>,
>      fd=<optimized out>) at fs/read_write.c:747
> #11 __riscv_sys_write (regs=<optimized out>) at fs/read_write.c:747
> #12 0xffffffff80ebc0ce in syscall_handler (syscall=<optimized out>,
>      regs=0xffffffc600253ee0) at ./arch/riscv/include/asm/syscall.h:112
> (gdb) print old_size
> $1 = 3
> (gdb) print new_size
> $2 = 4
> (gdb) print *a
> $3 = {type = 128, length = 8, non_resident = 255 '\377',
>    name_length = 255 '\377', name_offset = 65535, flags = 0, instance = 0,
>    data = {resident = {value_length = 3, value_offset = 48925,
>        flags = 0 '\000', reserved = 0 '\000'}, non_resident = {
>        lowest_vcn = 210131274956803, highest_vcn = 4294904417,
>        mapping_pairs_offset = 65535, compression_unit = 255 '\377',
>        reserved = "\377\000\000\000", allocated_size = 210131274956803,
>        data_size = 0, initialized_size = 0, compressed_size = 0}}}
> 
> Robert Morris
> rtm@mit.edu

Hi Robert,
    Thanks for reporting this issue. I checked the latest ntfs-next, and 
the issue is still present.
    The fix should validate the resident value offset before resizing, 
and reject any resize that would make the attribute record smaller than 
its header. This prevents a corrupt offset from causing the resize to 
overwrite the attribute header before the code clears the newly extended 
value.
    If you’re interested, please feel free to submit a patch. We’d be 
happy to review it.

Regards,
Baolin.

