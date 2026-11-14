Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794635224;
	b=Tzg7RbFSVp0SUtx8+zEXlNwsD9i1KLKm5jy2VFE3YrUiGdcaAQzafTCVsiOSoF0D5Sha
	 yXfylYDtqLxZAYO2BeasklcYMX3jgD2cYOa2qs9STl0vxWfHmFIW/tKszOi364pz8u2bW
	 DLvrYuKeIwZEendb9sh19deiEKM7Qir351wHaZYdUpwLsnjD5V+DksHj7Jv8tSesCP5vS
	 ExVxPKnQgLgZC+YvkDI+id394xcCnRSlHrahNNLwJ8nE7T9de354l/Cs7DI0lE9MMg6m6
	 wcMHMMxFvF29xg5uYsxjbZL9My9cr0rQdW4v7gj7Y9kVzMF0IUXV8Uq4BDeGV1dkeKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794635224;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=XFzvZgIEep3ESf+0yHAHjZPGOLvnbYltmbPqObm7Juo=;
	b=v3DKbgHJxsGMfGF9niidBzogaAqs710jt0XuDBTUn82SSn5yRp4T+Pr46noAAJsAPglq
	 bWC1NZD2gYG9rE+cHon/ddACYhqptM/J0kkIHmnZYJg+o2NFraUeILqTX/zM6n1sfVJi7
	 OYlHQ05kro5dHg3VHXdg02Obt9Z2kGCnrPak26p/2D77Pt1rGM/RZeyABOETTycEixME9
	 HzlAlyRvdyx57iQpK+EuyAUjaG6LcLVg7/K9pDp0IUjEjxCC4qLH5KArXTW3cHPXTz+BZ
	 eAzl5IpKgnTHufQZFiinRiy6Z1hIBHyPvWjNS0eH7E4JOCcvAj4Xd88ImFR+EsHv+cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fCIa8S/x";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E00D606A32D
	for <ntfs@lists.linux.dev>; Sat, 14 Nov 2026 05:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fCIa8S/x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDDD1F000C4
	for <ntfs@lists.linux.dev>; Sat, 14 Nov 2026 05:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794635224;
	bh=XFzvZgIEep3ESf+0yHAHjZPGOLvnbYltmbPqObm7Juo=;
	h=From:Date:Subject:To:Cc;
	b=fCIa8S/xBvq09qkPhnL7NZLUIDyWTfBuFjJrXbSMcWVYG/uU40q8V6VsiJDcciR9h
	 uPilucZn4Yk+7VxCWomEl9Eaudp91fWj/K3FeVznqLEYqxQ3mam6Lt8RJWQw7q9thL
	 DYT1N/rmrSQ6uEy5VLONNOxa0wREuqL2pLojj/6YSIhGZWir8ymASjCmFXbuQoxxzh
	 WzP3i5o7XtxxkbCGehb3oT8Bw9NspXriQ/WxFCm+gZJW5mMrs7bnhU8ptiFx5vskhN
	 pOCHQ+qZAN4/JWKM4CdPXHctk2RVN0XjowVs/z5mrvvdIvX7W7aZGLNVLJ3HXiBG/V
	 AkFd7qFozAcig==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d58c50743so280348066b.1
        for <ntfs@lists.linux.dev>; Fri, 13 Nov 2026 21:47:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErERWGEURX6Lf+YuQsvaNr27wTst5PrZz0sMJr6TNorCfhHHTjbmEMatE3dJEZ0Og+QZCysA@lists.linux.dev
X-Gm-Message-State: APuU4Z8mG/WRf5W5Egk5flwRNNRNjh2VzxcY+ULiiGSBOLCylWgBKVH9
	fAXcCyBZfiGDXIe/4EjsKORsJgm0kvsHSqnCAc5x1hvWwI8KrECdja+bOEtDSglojy5zb1U4ynU
	Gtyu2ERkjv6vqis3TReJfVX+cXRIKPjg=
X-Received: by 2002:a17:906:c151:b0:c42:102f:15d3 with SMTP id
 a640c23a62f3a-c5096541a80mr378746566b.34.1794635222842; Fri, 13 Nov 2026
 21:47:02 -0800 (PST)
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
Date: Sat, 14 Nov 2026 14:46:51 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-4O90M9tdUv6LgoJc3CBmrLZnwhaLFvBkgbFpouJso0Q@mail.gmail.com>
X-Gm-Features: AclHuK9dH6WUicWRknYhe9QWDOvMiFa1zWa3vFtoh-cGOAXFzoYVuA3C2sAJkYs
Message-ID: <CAKYAXd-4O90M9tdUv6LgoJc3CBmrLZnwhaLFvBkgbFpouJso0Q@mail.gmail.com>
Subject: [GIT PULL] ntfs fixes for 7.4-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	"open list:NTFS FILESYSTEM" <ntfs@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

This is ntfs fixes pull request for v7.4-rc3. I add the description of
this pull request below. Please pull the following ntfs fixes.

Thanks!

The following changes since commit fa4ad798f6f681031775266044ba1b0cf3c670bd:

  Merge tag 'for-7.4-rc1-tag' of
git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux (2026-11-07
13:52:02 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git
tags/ntfs-for-7.4-rc3

for you to fetch changes up to bada7bbb11aaa6feba8904cf38ff833453f5b5d9:

  ntfs: open the index allocation before reading or writing an index
block (2026-11-08 12:43:07 +0900)

----------------------------------------------------------------
- Validate that $INDEX_ALLOCATION is open and non-resident before reading
  or writing index blocks, preventing NULL pointer dereferences when an
  earlier index operation has not opened it.

- Check that index allocation inodes are non-resident and child VCNs are
  non-negative and within bounds before directory lookup reads, preventing
  a deadlock when $INDEX_ALLOCATION is missing or damaged.

- Validate file names against the index entry's key length, preventing
  out-of-bounds reads when directory enumeration resumes using a copied
  key.

- Return -ENOENT for NTFS_IOC_LIST_STREAMS on deleted base files and fix
  unsigned underflow in its buffer bounds check, preventing out-of-bounds
  writes when the sizing and filling passes disagree.

- Use kfree() for the temporary runlist allocated with kmalloc() on merge
  failure, resolving the Coccinelle allocation/free mismatch warning.

----------------------------------------------------------------
Namjae Jeon (1):
      ntfs: silence kmalloc/kvfree mismatch warning

Wahid Khan (3):
      ntfs: check the file name against the key length of an index entry
      ntfs: do not read an index block outside $INDEX_ALLOCATION
      ntfs: open the index allocation before reading or writing an index block

Xingyuan Mo (1):
      ntfs: fix out-of-bounds write race in NTFS_IOC_LIST_STREAMS

 fs/ntfs/dir.c          | 14 ++++++++++++++
 fs/ntfs/index.c        | 30 +++++++++++++++++++++++++++---
 fs/ntfs/iomap.c        |  2 +-
 fs/ntfs/named_stream.c |  6 +++++-
 4 files changed, 47 insertions(+), 5 deletions(-)
