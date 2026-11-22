Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795306154;
	b=mePND9lR/2x+C8aKGw4bN6cIzTwxmKymmCN+BPBlnjrlFiQxmS5LFqEDVc9kIVcT/O8Z
	 Z9GVzevdvg5TgQ0hcxxv/ovrn40wWpulFqNNcGb0ZSwOlOplL4r9s/zlimT2udzmZpnsB
	 9ecQ2/o7axr9wag7ocfmUWpFoDVOVOFi5HW20Kk+pzMrnA9on0OAa08emyz/nRWpweGc0
	 wdE/KUzr7Eg6RTyqNKaHy+4FEc6C4Tf3xeYnlIi+M2s4lXt/bpAjjg8gmxBevV+Gz8Y7r
	 A5h2BIETvI38bRmTlwHqHNnwLCoo22DcrobkLX+N0sxWtIcesxyi1oFWMthc+NJKueA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795306154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m+aU85cIm+C4zcua0cgiJZNThrvCIO+uOHsPRDd+6Js=;
	b=EfnaxJwg4eTaGFH71aOXgGsMPGvO0mG7V1zTLA4AtGp/Q+6tNrksNtEra+t7FVXTCOE6
	 2oY7TY+4gm1hJX+eSJUbVFU7bOqjartCsEo5c+gW0G65W/qKRxWw0eJ8UpT8HSHGCHFQx
	 u+C/R/WC67zK3Hkg4nGsIhj8XWQ6/uzshT4SZD+YlfZKGhX2LT0Ymp8e4PWJ+GS1XFT4r
	 il+NG06EVVdVZKsLP2jDCeVv3MRDJGiiZQoELP3msWKrp/vy0BQcJLgkZYrFp8NZtWi+J
	 nDR1eWQw5CUXEyTMeA0fFTKW74QtDEZejbPv6rFQejdiIkfuBYRQl2zsqTBkiyCeaGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3kM5jQb;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B6E606A335
	for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 00:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B6E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3kM5jQb
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so1963705f8f.3
        for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 16:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795306152; x=1795910952; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+aU85cIm+C4zcua0cgiJZNThrvCIO+uOHsPRDd+6Js=;
        b=N3kM5jQb2Ct9UrpCgNbNFGkhq1DMUyeviC7Jye3YgpunssC3vy5JhEoPRKuQ1+ZUJy
         4ib7xMUweLrLnMrZ9onRNFLRtHB4ojRKzB4v353/AmFN57BqzwAh03aI5soah/swow47
         FumVRYGF32hwDUaqNi/Y4wOkezzx9tFHvnqCz9dUDMmQMeH+HVzfBHM7QhDhywqqKKLt
         CbAk1tLAGPYKe/zheiZTbH9phdx3YyLE92aonsQLO2ol1nEaxcjpjgnpyCP7IphG0djH
         xvEHA1ll+V8cKIHLSSL3q2rsFn0MEZBQvf/nAZaSwwr5DwakAf+qxWSRUaOoqo19dB1E
         g0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795306152; x=1795910952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+aU85cIm+C4zcua0cgiJZNThrvCIO+uOHsPRDd+6Js=;
        b=Z+a6sLVnrgSkg1vkRnOY5FcFmf1FvV/aAIHY+xgaL+wAXR6bfLprasMf3aK1PC/Fk9
         /go3Fo3rcoxZFnOPF4rdqW6W96EgddcPoA2IN9zXjkJ/idVsJdk2gyLDmPCOHTTkfKeO
         S88QB+jgAYtMQ7iH7vcxIpED9h/MaxOqGIB+KdRV8mUhK2Oeiw0tRY7yGJH7vBeSP4DK
         mMPDfVxAWfRi3Zy1Ei3jNbOijj660qzyHYcuAtfvfVWgxKUaGikC3DC/z2PZ7iWQVdS/
         e6ONZkqmol2rtzX8cQVgecLV/T8ewaSzePS2auAK0Sxb0gXuMAYeVuo5dmf2f/VLzWJM
         OGxw==
X-Forwarded-Encrypted: i=1; AL+hErGfQwkv6rU5afN90+8oTHqshyIA2eK1vK1wtazhOuJzMF4JlVq4/9R6Dgf4HDk4Qxj4YF6m@lists.linux.dev
X-Gm-Message-State: APuU4Z8mgwD+lYHim96qNJ4w4WEw1C+SYAiepClNftvtyU4vhfH8pQcG
	JYk7ZL8Tt9ele/dVa5oShwMYTI7oMg864NPltZkqKOpWR09x5Y9YtUjK
X-Gm-Gg: AZFdTZeC89Olgyza3ZZQkYdYzj5cFAvdV+3CAxgseBG7tzLVPk3U8QrQQ2+FIacexjV
	D6kgMkutw8djOcT4Vg1NjPTvoZ6MYIv+rwzefZSpfe5+MPXrqwaenpKs2a0ZBycT/AZ2C97Xhv8
	JJe1bYfqiYq/fQDZHxH+7Esng0matBs94K/Y9NOJNN8wbI3uga17k1y07ILPpJguyUDDlFjFu1H
	s0HIfte6SAMAOUYGI4WFJNZUOEc36DHbTfxKM3Pk3V2zdDxw+VF0m766RfbBoCA7yDCAlxmDusP
	ksKPP8l9YdZF1WI05S/dppejMtzIXF8ln9DvW0Y6UY6NaasXBIvaQkG4OY22ZGH45ZLU7FulK2C
	/yz4S1eukwLumIuBK+rrSpyisrXABKNskQuizMKm7qyFHoG2jfVWvTXNOToVR4RnTAEf8UYtSSZ
	hTGzojj/3qlEN00ET7ti3EKhlcTq4DTJZZgU5hOgth+AIw/UAE/O5Zh5u+eW/6q507AeOIJIjy4
	NXBpSCLCG7LADhLlRiTc6PzguLoe8Dpifv0slABklRTTDKZPFQavoBTIYDGgL6RG6pcdP7pkfwx
	SD4//lq9ds+K6WWg/ebSCgYvxw==
X-Received: by 2002:adf:e011:0:10b0:48d:f99d:a0d2 with SMTP id ffacd0b85a97d-4abb2168f53mr10514425f8f.15.1795306152315;
        Sat, 21 Nov 2026 16:09:12 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm13461872f8f.0.2026.11.21.16.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 16:09:10 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lauri Gates <lauri.gates@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Dave Chinner <dgc@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	ntfs@lists.linux.dev,
	linux-nfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [PATCH 0/3] Add f*_xflags_{rw,ro}_mask flags to the fileattr API
Date: Sun, 22 Nov 2026 01:08:53 +0100
Message-ID: <20261122000856.536902-1-koray.fra@gmail.com>
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

This is a follow up patch series stemmed from [1] and [2], splitting the
_mask change for the fileattr API into its own separate patch.

The first patch is a preparatory patch so that the code in the patch
after can be formatted better.

The second patch is the actual implementation, which introduces:
- fa_xflags_{rw,ro}_mask fields to struct file_attr
- fsx_xflags_{rw,ro}_mask fields and has_masks selector to struct file_kattr

These masks have the following semantics:
- rw_mask:
  * for filesystems: advertise which xflags they support changing
  * for userspace: specify which xflags it wants to modify
- ro_mask:
  * for filesystems: advertise which xflags they support only reading
  * for userspace: ignored

(ro_mask for userspace was also proposed as a "verification mask"[3] but
I left out that semantic to keep this patch series more contained, and
can be added later if needed.)

This allows userspace to not have to do a RMW cycle when using the
file_[gs]etattr() syscalls, avoiding possible race conditions and
simplifying their usage.

Patch 2/3 also introduces the missing FS_XFLAG_PROJID flag so that
programs like chattr can leverage the new mask API.
FS_XFLAG_PROJID is kept out of the legacy FS_XFLAG_MASK and so it's
defined as part of a new FS_FILE_ATTR_XFLAGS_MASK group of xflags that
will be used moving forward for any new xflag (like the one proposed in [2]).

Patch 3/3 converts fs/ntfs to this new API, to show how it can benefit
filesystem drivers too.

The series has been tested across NTFS, ext4 (with project quotas), XFS
(project quotas and extent size hints), and Btrfs.

Thanks,
koraynilay

[1]: https://lore.kernel.org/CAOQ4uxg8aVcWyNiFDk8djdn-M3xJcu_7-kRxVq9jjFsbcGp1ew@mail.gmail.com/
[2]: https://lore.kernel.org/CAOQ4uxjVQ9cjV=_jBjQtNg9zCuWUEJT9KNYMKV+1jwBkHen5OA@mail.gmail.com/
[3]: https://lore.kernel.org/CAOQ4uxjCN-ekd18R-soD8tkGFnXjK0S1VdSNhq9b3Ev6y8K9jQ@mail.gmail.com/

koraynilay (3):
  vfs: use goto out on error in vfs_fileattr_set()
  vfs: add xflags mask to fileattr API
  ntfs: switch to the new xflags fileattr API

 fs/file_attr.c           | 179 ++++++++++++++++++++++++++++++++-------
 fs/ntfs/file.c           |  63 +++++++-------
 include/linux/fileattr.h |  13 ++-
 include/uapi/linux/fs.h  |   9 +-
 4 files changed, 197 insertions(+), 67 deletions(-)


base-commit: 3857587d9d6fa44d40d1c73bde6a39f6f7a5216c
prerequisite-patch-id: 7af19117a27af492e3e525774310fb3a76700ffa
-- 
2.56.0

