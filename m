Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969164;
	b=j3L5UnFyKmkj5RahMqvyp7HZOhSe0bJ6ws7EmTRenhj13DKdLLAN7YRjxNsZF1rm8lSf
	 BFAM5a4LIj1qW3HYxdiUOW4dxmo/psQEp2iKOZ2JhAruZGiVM34fB1tF3AmNB+OsJI5Kp
	 wUcabbUXugDl8nGr/Rb0+lcY/eTHz+XyNPmDAZsx40wLj2O8wGZiQoaw3zqhEGYCUi2NS
	 YdUry0sr5ZOb2hWxon9TYOSCD14Wx6rjQeOJyXvuDLTQtRVTNtW4vm5Bo7D3TDFpo4Mcs
	 pv5JUY7CeAJb0sckgfU72AUJT1ZO/T4gehgm7FnIxKwA4G0bKwmTylJQZ4U2U38jZEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5lZ1X9OvYujo7R37IHLIlb8OsfThW1dgQ21ejL+gEBc=;
	b=ux1Joruk+iOvGXxH3H81b4ubJauHRedyvrh0a2GOW0C0vNbPJDe0yYRjVUiLRQWADXDz
	 TKb7eUmgvFVtdBKotcthF39g7C8huhtPWD/+WkBNQpwFuIYCNhYwkD2KMT7x4USjt7g8O
	 QViW1922QCgPqXmm/ryTVpb5QqTw2wuaJLJ2MzUSzHrlfq3T61D6Px0bLbHmIAYOgcq/E
	 bZhRKFY0cr7ANs/CwZPPwltZwRVHpDLgBuI5iv/G3/3mPhiZGJKwJiaZnX7+COKoR8nNu
	 DY+TIjSGceclmvwGg7XPcTM2JWFE8m9lV5Pc8R118KSgYKm16INdMR0H5W0wDw+EOAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EncLZZp5;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F9F606A32C
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 12:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F9F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EncLZZp5
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535a54bed9so863229eec.1
        for <ntfs@lists.linux.dev>; Fri, 06 Nov 2026 04:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793969163; x=1794573963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5lZ1X9OvYujo7R37IHLIlb8OsfThW1dgQ21ejL+gEBc=;
        b=EncLZZp5kA8KDUDKzzypWzRKzRqqTW9rI09cUad7fG/X1RDJPGczSDcxVVSWyxVjxZ
         T8rR1MkYAO6gM7vrJnwVdqdcYTYHDI+0TGDJ0QrcTPasPTtQyHut/J6bi7c6swTkjFF0
         9zTGLP1M0MTSpdjpxd2CA6E0d1qVQGKHndGBlO0x/TmxIw4hSyj4jp5vr1omK6XBQmfy
         kwwDxmc1XmARHlFQSwi4Pk071SWzgk+ycCXci6e718g4JFO8srvfNPP1TYqMfFo4HiLp
         PMyMaDJTHIJxXFSRJVo3NlknNQjKs9J1YR8hdKh+KqakpkHETrFi5VOigzgREHo//dV9
         kuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793969163; x=1794573963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5lZ1X9OvYujo7R37IHLIlb8OsfThW1dgQ21ejL+gEBc=;
        b=RqJp55DPhUwPg/TQTN1ee86yiNt15k7tXWqvlZOdglvhd45voAOC6DSdMNX4rpLUqz
         XNFwXbG7Mm2hfJ0J3edbje0v+ZBPUHIvc1rCawd+CAC8XKYryWC0Xy1kU8yMvj/7PbZf
         UryVbwPWQFg88g/WLX2yY07lGh8BiHkWqip70AmfnNEAgVmZ3lFHjOaCeTKWJQdycjes
         3eTnkzhSgrgfpn9ygcICnNVZIRwgpr4AwBSmXmKjQJvZ17vIASjIPxbLZ09RRHoyPfQA
         k+MOl2uhnqRLIvrAb7Sv2bXSMV0J0kgXSbIbiyeV6jOJk6qIaSNO1bNNrJUgtlEe449L
         ofuQ==
X-Gm-Message-State: APuU4Z/DdO0pszMqNC2S2Wu0kBSWoH3TRoNN2UDYEA0tN+IouxI6GKsK
	+w2PznarlFIOYthSJhuxAlvdrhrVL77spE32fw7/6WhGCK+L1ZGRD1IT
X-Gm-Gg: AYBFou3vznS9GQqYVNcyq9pX0uhXvmkfhYzKd3aZTDh/hyZ1As6VPhpyq9ZaHTDCASy
	7t1PCaBrUDCSDKyiLGhSjNXLR3kXAwJw2kO4defMZy/pxN/j6TbU9tM8/Qz7YdYogXShmg27B3h
	NolMmN48OXASoONSD/Rz5WrySnZj9tHLlExeag9TaKg153DzMQSbYmTT+vWKYS4HQRsfwu1wWHY
	XnfIaHXekUplQ8FcI5m784zZ5dDVNY8afAV2wEAK4YyajLKZq2phMfrLmyC2+m+04Pz5Iq8Nmie
	CGkokCKo/HgaSSyhQlnDrJ6cDwT2mSVuD3LFqH2gw+lZBpgITqXM8EfCx/Qp2jazmD3DwM7b7N7
	m8QioCICfEQgMnuAQt2SXSlIO+Ntv24ijw360f5yTfjqHEtNvdkOdJqLP821PIgAu4Ij1IE8+Pf
	RdO2nUzO7VcvjtNip9LXliFszn7WP2lIkuuCUP86aow52sRjwM8kVdrnrqWMmWqKkRkXVD88o8f
	pfo5lYStQaLrzYszGPVCvqgUqvoNpUxcHbJzjgd6h+O7YffKbgRPbOewvfCz6NWxD+vnPtjWsGA
	3e2e2m/R2Ji443bObBMz0cfHEFyYyd2eE6+08qAJpFWCr2QKUgGoNTqu4E6ms44+8A==
X-Received: by 2002:a05:7301:1601:b0:36e:dd5:fb08 with SMTP id 5a478bee46e88-36f773f7c7fmr3004408eec.40.1793969163232;
        Fri, 06 Nov 2026 04:46:03 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651eccdsm6802331eec.1.2026.11.06.04.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:46:02 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>
Subject: [PATCH v2 0/3] ntfs: three fixes for crafted images, found by fuzzing
Date: Fri,  6 Nov 2026 18:15:50 +0530
Message-ID: <20261106124553.2617026-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I fuzz the new fs/ntfs driver with mutated images: an image from mkntfs
populated with ntfs-3g, a few bytes changed, then mount, walk the tree
and write, under KASAN. These three problems are still present in
ntfs-next (e62b384ca). Each patch has its trace and reproduction steps.

1. ntfs: do not read an index block outside $INDEX_ALLOCATION
   A directory without a usable $INDEX_ALLOCATION hangs on its first
   lookup. The task waits for an mft record lock that it already holds.
2. ntfs: open the index allocation before reading or writing an index block
   NULL pointer dereference in ntfs_ib_write() on link().
3. ntfs: do not convert a named $DATA stream when making room in a record
   WARN_ON() in ntfs_attr_make_non_resident(); no damaged volume needed.

All three need an image to be mounted, so a crafted image, not a remote
attacker.

Changes in v2, after an automated review of v1 that I checked by hand:
- 2/3: ntfs_ia_open() also succeeds for a directory without
  $INDEX_ALLOCATION and returns an empty resident inode. Reject an index
  inode that is not non-resident, as 1/3 already does.
- 3/3: v1 opened the named stream and converted it. That would lock the
  stream's folio under the mft record lock, the reverse of the read
  path (ntfs_read_iomap_begin_resident()). v2 skips named streams in
  that loop instead.
- 1/3: unchanged.

v1: https://lore.kernel.org/all/20261106091420.2461683-1-wahidzk0091@gmail.com/


Wahid Khan (3):
  ntfs: do not read an index block outside $INDEX_ALLOCATION
  ntfs: open the index allocation before reading or writing an index
    block
  ntfs: do not convert a named $DATA stream when making room in a record

 fs/ntfs/attrib.c |  6 ++++++
 fs/ntfs/dir.c    | 14 ++++++++++++++
 fs/ntfs/index.c  | 22 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)

-- 
2.53.0

