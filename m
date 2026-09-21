Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF314A8FE9
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 15:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006030; cv=none; b=Fq8iAdStycNwRLGNHNDibkhNGNcuONIn9V6EsyeqAH3WRX1ltwXn0fRyjZSQWuLCs/Op7IZ/zIZbzEukpBtewKFmYJN939YhzNqNru7K1s7LiMHKEGS6RuMCNt/FubkZfOItaGs2fJ9GxkRJ2wl7DNiFwBhJ5H+ttmVym441V8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006030; c=relaxed/simple;
	bh=ZJYhLSP+kH2gvHZZzMTdwvp6epUj2fwfuEGMdte1eKU=;
	h=To:cc:From:Subject:Date:Message-ID; b=OzGO5xsGnMeqsDcZLDJ5eIuz9anTeTREsDg3rN8CpAgsaD0vCPXy2z2OdyjhyKYdfsqL6eJMFvlka5+iItJIr2zPMnCcQlfVi/Wulbm71Zq0Aus0di0LDBL0ZYAS7xlskV4JbaLjv+qxKZimxkUbiai5oNsBvUxADMj+7Jc6Nls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=qDBBxCTz; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="qDBBxCTz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Message-ID:Date:Subject:Reply-To:
	From:cc:To:Sender:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qeX4NE8AicXh7hfXEcqF4WQgzWawOl18KFXNiF1Nl/I=; t=1790006028; x=1790870028; 
	b=qDBBxCTzDXK1P41Jk3J2vi4r2C02ftRzUVRCCD8oj/2iLj64PY4+1x/tMXC30qF+nG/a/foBtFL
	DDqyG//z7fr6mEeM16ZuO9BYE6Rgp3CJqCoiAb+HW7hDP7+wj/kPS0qL7+mF+yw1w/fOVON9SpifA
	+HDkCRg7pGXHkolrixRy1T2HnN9LhjDs9muFOtDT2+3X5CP8mbXQ/I3gKFJK1dR7iqggYhkxYrfa0
	yp1NYoRl70bfy8p8aaFuyArKE9vKmB1xcGgsDx1l4ncAOzMWT7RhdjLxvn0r4AiE+0/4kH/bC0N5m
	jTNj2OL0o34fDbnThw1n0Z+yVmWlMtuLW3+A==;
Received: from 30-10-12.wireless.csail.mit.edu ([128.30.10.12])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rtm@csail.mit.edu>)
	id 1x8gKw-008mSP-3q;
	Mon, 21 Sep 2026 11:53:46 -0400
Received: from 30-10-12.wireless.csail.mit.edu (localhost [127.0.0.1])
	by 30-10-12.wireless.csail.mit.edu (Postfix) with ESMTP id BF6493D56037;
	Mon, 21 Sep 2026 11:53:45 -0400 (EDT)
To: Namjae Jeon <linkinjeon@kernel.org>,
    Hyunchul Lee <hyc.lee@gmail.com>
cc: ntfs@lists.linux.dev
From: rtm@csail.mit.edu
Reply-To: rtm@csail.mit.edu
Subject: ntfs_read_inode_mount() can pass size=0 to kvzalloc() -> crash
Date: Mon, 21 Sep 2026 11:53:45 -0400
Message-ID: <88468.1790006025@30-10-12.wireless.csail.mit.edu>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>

If ni->attr_list_size (a u32) is e.g. 0xffffffe7, then this code in
ntfs_read_inode_mount() rounds the size "up" to zero:

  ni->attr_list = kvzalloc(round_up(ni->attr_list_size, SECTOR_SIZE),
                           GFP_NOFS);
  if (!ni->attr_list) {
          ntfs_error(sb, "Not enough memory to allocate buffer for attribute l ist.");
          goto put_err_out;
  }
  err = load_attribute_list_mount(vol, rl, ni->attr_list, ni->attr_list_size,
                  le64_to_cpu(a->data.non_resident.initialized_size));

kvzalloc() returns ZERO_SIZE_PTR=0x10, so the "if" doesn't catch it, and
load_attribute_list_mount() proceeds to treat ni->attr_list as a valid
pointer, and crashes.

A demo:
# wget http://www.rtmrtm.org/rtm/ntfs50a.img.gz
# gunzip ntfs50a.img.gz 
# mount -t ntfs -o loop ntfs50a.img /mnt
BUG: kernel NULL pointer dereference, address: 0000000000000050
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
Oops: Oops: 0002 [#1] SMP DEBUG_PAGEALLOC PTI
CPU: 8 UID: 0 PID: 2279 Comm: mount Not tainted 7.3.0-rc3-00508-g40288c9206c1 #44 PREEMPT(full)
Hardware name: FreeBSD BHYVE/BHYVE, BIOS 14.0 10/17/2021
RIP: 0010:memset_orig+0x33/0xb0
RSP: 0018:ffffc90000a67be8 EFLAGS: 00010203
 <TASK>
 ? ntfs_read_inode_mount+0x868/0xb80
 ? inode_init_always_gfp+0x1d8/0x210
 ntfs_fill_super+0xb77/0x2c90
 ? sb_set_blocksize+0x67/0xd0
 ? __pfx_ntfs_fill_super+0x10/0x10
 get_tree_bdev_flags+0x135/0x1d0
 get_tree_bdev+0xf/0x20
 ntfs_get_tree+0x14/0x20
 vfs_get_tree+0x29/0xf0
 fc_mount+0x13/0x90
 path_mount+0x35e/0xc40
 ? kmem_cache_free+0x20a/0x2f0
 ? putname+0x40/0x80
 __x64_sys_mount+0x11f/0x150
 x64_sys_call+0x13d9/0x2220
 do_syscall_64+0xdd/0x4a0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Robert Morris
rtm@mit.edu

