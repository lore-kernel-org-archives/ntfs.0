Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100348;
	b=f3lK/Fcf/TGdIiMzVVNRGkBKkDkhT3qL5HNtI8VIEVfCr0ThEnOs/YDp7q1tou5RqZm8
	 RulGIoOmwB8HZvoG6xLQH73VF9IjayNoLF6QQJ5cCX2gVhlK4wImdRjoGG9ajMaKaqqIh
	 dst4nnKBkI5PF+MKoR72Ei5DfxaMB9k6bLkrzIb+GDGmrB4GsA7cy3RYBYK2HUx5f0dEo
	 r9vQfbHZnZE8PTYUMED+mGoQ9fF9qx+7zvnv+8vmbtKwPCDAPKHKwRjZNwvw9cBRbkj54
	 kd5NErDVYvE56DY7XhS2YngXB93vbZ+ruwvriNq6D+CFxT3pKdFtQm6BATjOoAmaZdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100348;
	h=DMARC-Filter:DKIM-Signature:Received:Received:To:cc:From:Reply-To:
	 Subject:Date:Message-ID;
	bh=j1BeC2kgX54K6qiUDJA1TwYDTwD4lopuyQeHJtfm+Eo=;
	b=JpY1Xb6rl22rbv4ImS9egZ5jnJsKEpJjQbGXmLWVrq3KHNqIm8F4WGqWt6zp39otw7Mx
	 uJl2P9+6cVD2N6BIKHdLww6RPkExM/q5BHYat12Jqq+DqA2MU8xppbMn7l2BZjUxVvppd
	 LE3odW2zCclxReSTOO52AO9wSjVAAzLiOYqgiby6xN+PVW5xhxwa3BuWxoHBMppRUfLNF
	 L9cAjDR14K1ER0lPpugYgQb1H8T6sYRyWv/rF2kBX25RJZq/rWabX7yRGlrrFxbAYSnrh
	 oUfP4RQtYqCxkbKC1h7ZMB7f//9UxP+TOTmHZkqF79U58LiutwKY0jI9wx95XIpPlkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b="H7zUwf/G";
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5368B606A335
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 11:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5368B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=H7zUwf/G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Message-ID:Date:Subject:Reply-To:
	From:cc:To:Sender:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=j1BeC2kgX54K6qiUDJA1TwYDTwD4lopuyQeHJtfm+Eo=; t=1793100347; x=1793964347; 
	b=H7zUwf/G7/kxMG+H2ClWoq+iiMsIsHOx65XIn9J2naGFapgM6y7nSWexbxYTEl3Pna6tBZlinKV
	Lg680ZEpAIHYSaehi+VPFGJa35XA65530gAhcXd8hbKSNTgP60ciSVen1ktmDjFPKzFSfDDcgLnqh
	rCmL0COSD5aAm2wq4guups7zsvuRI1I2E2SSIEf/leULEVOMcQ/To7CXnvW24StMcN5a9/0p10EYr
	FuJgLFjUvCDfMUShKVz/RDdSeXPw3ivC78W5OA1cQ/UDZXaWcBBr8jqSNI37e6qpArIHsl6YcY7HQ
	jVO4RrwqPwHjzURrZFcKD5mSKW2L/cufQ0SQ==;
Received: from [24.147.175.133] (helo=crash.local)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rtm@csail.mit.edu>)
	id 1xLfJI-00B2m4-Ts;
	Tue, 27 Oct 2026 07:25:44 -0400
Received: from localhost (localhost [127.0.0.1])
	by crash.local (Postfix) with ESMTP id 1A22F3E89EBE;
	Tue, 27 Oct 2026 07:25:44 -0400 (EDT)
To: Namjae Jeon <linkinjeon@kernel.org>,
    Hyunchul Lee <hyc.lee@gmail.com>
cc: ntfs@lists.linux.dev
From: rtm@csail.mit.edu
Reply-To: rtm@csail.mit.edu
Subject: huge VCN in ntfs can result in a kernel page fault
Date: Tue, 27 Oct 2026 07:25:44 -0400
Message-ID: <10091.1793100344@localhost>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list

If the 64-bit VCN in an index entry would have the the high bit set if
shifted left by icx->vcn_size_bits, ntfs_index_walk_down() will pass
that vcn to ntfs_ib_read(), which shifts it left and passes it (via pos)
to ntfs_inode_attr_pread(), which checks s64 pos for too big but not too
small:

        if (pos > isize) {
                mutex_unlock(&mrec_ni->mrec_lock);
                return -EINVAL;
        }

and then passes a bad pointer to memcpy() (line 3801 of ntfs/inode.c):

                memcpy(buf, (u8 *)attr + pos, count);

# wget http://www.rtmrtm.org/rtm/ntfs23g.img.gz
# gunzip ntfs23g.img.gz 
# mount -t ntfs -o loop,rw ntfs23g.img /mnt
# ls -l /mnt
ntfs: (device loop0): ntfs_lookup_inode_by_name(): Corrupt directory.  Aborting lookup.
ntfs: (device loop0): check_windows_hibernation_status(): Failed to find inode number for hiberfil.sys.
ntfs: (device loop0): load_system_files(): Failed to determine if Windows is hibernated.  Mounting read-only.  Run chkdsk.
Oops: general protection fault, probably for non-canonical address 0x7fffc039131f1c50: 0000 [#1] SMP DEBUG_PAGEALLOC PTI
CPU: 4 UID: 0 PID: 1475 Comm: ls Not tainted 7.3.0-16472-gd135ab453a74 #46 PREEMPT(full)
Hardware name: FreeBSD BHYVE/BHYVE, BIOS 14.0 10/17/2021
RIP: 0010:memcpy_orig+0x16/0x140
Code: 00 00 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 48 89 f8 48 83 fa 20 72 7e 40 38 fe 7c 35 48 83 ea 20 48 83 ea 20 <4c> 8b 06 4c 8b 4e 08 4c 8b 56 10 4c 8b 5e 18 48 8d 76 20 4c 89 07
RSP: 0018:ffffc90000b27ce8 EFLAGS: 00010206
RAX: ffff888104869000 RBX: 800037b810010000 RCX: ffff8881056fa140
RDX: 0000000000000fc0 RSI: 7fffc039131f1c50 RDI: ffff888104869000
RBP: ffffc90000b27d48 R08: ffff8881056fa140 R09: 0000000000000000
R10: 0000000000000018 R11: ffffffff817f16b6 R12: 0000000000000000
R13: ffff888104869000 R14: ffff8881056fa140 R15: 0000000000001000
FS:  00007fe46c7a5800(0000) GS:ffff8884aa47e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005646e478fb68 CR3: 0000000108cd4001 CR4: 00000000003706f0
Call Trace:
 <TASK>
 ? ntfs_inode_attr_pread+0x33c/0x410
 ntfs_ib_read+0x5f/0xf0
 ntfs_index_walk_down+0x76/0x120
 ntfs_readdir+0x8ae/0xba0
 ? selinux_file_permission+0x127/0x190
 iterate_dir+0x80/0x190
 __x64_sys_getdents64+0x77/0x110
 ? __pfx_filldir64+0x10/0x10
 x64_sys_call+0x96b/0x2220
 do_syscall_64+0xdd/0x4a0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Robert Morris
rtm@mit.edu
