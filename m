Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011552;
	b=mKPqxboqwmsrWxvQxSW0O4AAnH2BeBrp4kc9d6QW5mPNVLOzd4nQ3490ky+oT+K2LcAW
	 BB2ZjGlobStidpVLP4ZoSCw3Arh5e7TxZ+I0imoML1EsIrhBzXXP39loWsvaofGCNaTIR
	 LQeXF9N7FkVKrq73ulJ/ZWAJWK8ZqUioO4yi9oIKIkfDn/t0tADLFTXR1T24fZFyhJh7e
	 E8cpS67dAyYUdDIN+OD3jMEXhckIxgeUNW3DI6bprxVgzpGOipfeyJvXH9nlsGK7bWZ4k
	 MxSlFDfREf9+l6R8KwvX8sZMUTwk4bi1CV2jZlYO68Yoy6ErwC4ojljOqY7ABImLbeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011552;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=pkTlAxtLLfyZwA9aguqr+9HUOssKJfczq1T7Ue2K5u0=;
	b=VUdBVnnv0Murr1oO+v7QvrUEwLBggJlY0W7PLSeyDMvUo8s9Cln5bSXlHTi9wyYhfn7J
	 FWWlDi3PZ+9BIk0uVysPUQDfSzLLdJ02kAfmUEpLZCm8HDmrIoLuglVXXTTP99jRPXh/Z
	 H+0ZPkD2hmkkSnSL8eaVwAmPwDThoI3AT13kb/NUEmS0Fl5HqsetDcklvU37vur8VqK3G
	 r7L4HuCVnUZnxOURh9TpAJgMABPEhtlJB0o7H5TvPEEK3xo0a4jckSxg0CCFv7siV4ASa
	 a+H47FDqf0dpewAN4mEAio6RtpgYarvKykfETPkqq0Nw533G0L3jdmXP+pMmXYSYmng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JHhzOp9u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50983606A326
	for <ntfs@lists.linux.dev>; Sat,  7 Nov 2026 00:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JHhzOp9u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75451F008A1
	for <ntfs@lists.linux.dev>; Sat,  7 Nov 2026 00:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794011550;
	bh=pkTlAxtLLfyZwA9aguqr+9HUOssKJfczq1T7Ue2K5u0=;
	h=From:Date:Subject:To:Cc;
	b=JHhzOp9u/2kHc+69zZEWOiwrJb9bVWslGdt96MBTrxaAhV1os28igsKBz5isZ6tCG
	 /NlJ4l3pGY89fuPzLtf9GfJdbI0fH5BSRE9LHM7SO6aDInTPDkK9nAN7FAdAQuTHBg
	 C2n30cmNYUun2Z3hC11y3hiFfV5Z3X+ddh0OspWunJTStw3WybUzcm2+RsIqEWxWff
	 0w5KVHMhPqpdXSE83wrABAF64b9kjwubYAzxFynGO/e/P7w0vGfSKpfVApoRZ2cFa3
	 SDR1Jczph0oLzrHkdc2iKJ/9rDe415zxlH5zVk4AqUU7HYcM95gk+WuJ6PMteHILNI
	 8mt0wp9P48haw==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b579003f29so1825661a12.0
        for <ntfs@lists.linux.dev>; Fri, 06 Nov 2026 16:32:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErENdEPIJN3vBkDrrwEk9BXKmpqwpMYckIZsD4Y1gVkkwIhZvYjuhVimZzgrWCPXLvztdN1Y@lists.linux.dev
X-Gm-Message-State: APuU4Z+F/kHzIdp8zj9ZSXLuW6WN1fUSLw44Niu+AoTDFFTq+u8Ut2Cr
	ea5xDtU3Ivy4MNXvR4ed55EYcYMoh+EUjd2erny6DTItSPqyhGQJ9tt9ULbom/uJzrZ+uLzoTd6
	uD9IZCRk8BSH/dgeMlADpVCfINjof+5w=
X-Received: by 2002:a05:6402:1493:b0:6b5:7140:e2f9 with SMTP id
 4fb4d7f45d1cf-6b59781b3demr2164432a12.33.1794011549496; Fri, 06 Nov 2026
 16:32:29 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 7 Nov 2026 09:32:17 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8+9m-FZuNU5Ahcco1reEac8u7b5KJ295ezA37rtcGjUQ@mail.gmail.com>
X-Gm-Features: AclHuK-V2WSrAkXb-coK7inCzTNsqTJGz-F9vMC0MQQRjsxZT4my5Vlm815RDb4
Message-ID: <CAKYAXd8+9m-FZuNU5Ahcco1reEac8u7b5KJ295ezA37rtcGjUQ@mail.gmail.com>
Subject: [GIT PULL] ntfs fixes for 7.4-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:NTFS FILESYSTEM" <ntfs@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

This is ntfs fixes pull request for v7.4-rc2. I add the description of
this pull request below. Please pull the following ntfs fixes.

Thanks!

The following changes since commit 6b4b543fa18757297ac756a6fe6e64f506b7844a:

  Merge tag 'parisc-for-7.4-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
(2026-10-25 18:04:17 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git
tags/ntfs-for-7.4-rc2

for you to fetch changes up to c77ab4eeeb3ed471bcc99a94673f0e0142c4b84a:

  ntfs: don't allow compression on volumes with clusters larger than
4K (2026-11-02 22:53:56 +0900)

----------------------------------------------------------------
- Don't allow compression to be enabled through system.ntfs_attrib on
  volumes with clusters larger than 4 KiB, preventing out-of-bounds
  accesses in the compressed read path.

- Don't allow resident attribute values to overlap the attribute header,
  preventing malformed records from causing writes outside the MFT
  record buffer.

- Fix recursive acquisition of the mapping invalidate lock when writing
  to non-resident named streams through NTFS_IOC_STREAM_WRITE.

- Keep the file size unchanged when extending the initialized size fails,
  avoiding unintended truncation and page-cache removal.

- Avoid integer overflow when limiting attribute reads to the attribute
  size.

- Initialize the promoted index entry's child VCN before inserting it
  into the parent during an index split.

- Validate index entry VCNs and return an error for negative attribute
  read positions before they reach pointer arithmetic.

- Fix cleanup after ACL initialization fails in __ntfs_create(), avoiding
  an erroneous free of $MFT, unmapping an unmapped record, and unlocking
  mutexes that were never held.

----------------------------------------------------------------
Bart Van Assche (1):
      ntfs: Fix error handling in __ntfs_create()

Hongling Zeng (2):
      ntfs: keep the file size on a failed initialized-size extension
      ntfs: fix a self-deadlock on writes to non-resident named streams

Hyunchul Lee (3):
      ntfs: reject negative attribute read positions
      ntfs: initialize VCN when inserting index entries
      ntfs: avoid overflow when limiting attribute read length

Namjae Jeon (1):
      ntfs: don't allow resident values to overlap the attribute header

Zhan Xusheng (1):
      ntfs: don't allow compression on volumes with clusters larger than 4K

 fs/ntfs/attrib.c |  9 ++++++---
 fs/ntfs/ea.c     |  5 +++++
 fs/ntfs/index.c  | 41 +++++++++++++++++++++++++++++++++++++++--
 fs/ntfs/index.h  |  1 +
 fs/ntfs/inode.c  | 38 +++++++++++++++++++++++++++++---------
 fs/ntfs/namei.c  |  6 ++++--
 6 files changed, 84 insertions(+), 16 deletions(-)
