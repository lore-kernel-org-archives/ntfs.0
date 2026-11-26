Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710707;
	b=izEfGMNaQjHVCdcGuLqaB9+rZiXQw+OfByiwRLMwVTuOMuq73+/I96ecmclQcOSmixOV
	 NpZV/19exVuOy++ELQAphG8k2J8y4XDPo5+pDYku+EkcjMM4mdur28sHu5XtaBtQv1tpc
	 Rtj3cby/uGOL9WMPHEvlS3UfCSjSh1rvD1pRTbFIVSS5/getZFx6+ss0dkuoe162wnRHE
	 qGpDyau8f6omh4Nje1Ik9q6/4g9H7x0s5Z6q456c9nw/+VusOU6ZLU+G9FvtiW9WxZVdP
	 /+7NNS2Ak8/WF47vWj3su3JYxWfqDkiiVOSvRzSvKv+Ktf2PAFyLcAgDTgZ/bMWFj2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OPwcu3THbOq+3XWyQQ+nL5e2PeyQBnz7B0EEXV1jfaY=;
	b=QE1qu/FzwXSeWlAmyl2DphpFoobJ6wI8USOqV58XggUypSSGg5gU30Y6sbdwvJ8NGG+Y
	 TISXRAzv/X5gdnGPCumAEOmNJuizj3riFBd9KEBMKXgE1OBjMeeL/njEmq+ntx9iA/90i
	 tMZw1c/l/78LZSv49mhQ18U0V4RCW9+5BtK5a+uqsufX/WEVN4SSQHjPoLjttwhFjP+P8
	 aaD3Y6G/0bahfY0ImFQkkLqoNaI2sktefvqRSGiBmSEP3dwC7dSRWlJaKzxPU1IkLY34C
	 +Pvx3IJOJRUzfOYfUcb70R0hgWKbL7YTaNemngEn65CWx3MfJJ1MV2CO/M3AGOj0sLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snVflDPj;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903A3606A331
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 16:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 903A3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snVflDPj
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d05d51553so51219635e9.2
        for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 08:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795710705; x=1796315505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OPwcu3THbOq+3XWyQQ+nL5e2PeyQBnz7B0EEXV1jfaY=;
        b=snVflDPjLBKxlABSdl1tXvjnrMXLyVQKhK64H4989P7UUTekfW0PSeb0hvMPmcYdit
         FPy0GeOE79RozoEVYi7ajo4GqCXwykMbhAEayRdxkZaqsDrXufn2krlkml1wNCCA6EaY
         fEKTSSbsddkkdLtSDl+Jm/75YWo3m1f8hhbPmR0oB0OeY1mkTmLyFZhkKwlsKrlfZ2ka
         B52NeMsyudlMAWqhOC0/ruumcddwYM9Rk/w6TdJp6Omj0baOf5gxBcZ2J4sXBnyVS7RY
         8F2PL67yhnXaj6gztc2MlHrjSuoZW2UxJKwdSmROM4j0uUzr92Ovpj2VHRyDdljPI1nr
         +zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710705; x=1796315505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPwcu3THbOq+3XWyQQ+nL5e2PeyQBnz7B0EEXV1jfaY=;
        b=g4eanUtLkSfMyPpVBCpEx358KM8hiC86kIfolOAtsRwAUYmz7+Z4V7V/hTvoAa6bnn
         BVdl1ruResYWeR9Bgns9tuy7p75qQcQsqRrKEt7iuk6uqQvQ3C6IANjek6IMn5EOb6bp
         XULGl1xHMcKOkZPdW5Ye+uAsZpgm9KtngDRSXjSi73/YGmB7PM5keIRMrl+RJiyhzMUa
         fE2WB0HLTQqCfek5BK3sxesNprsouLEGkRKsczan/ffNJfVaam1H6sIh+x9VH6Jf6kIu
         +pemTlHuEb+ZcPty4Cnj90LymeXx8xBe2eWcNx3M5jzotwp7QhB/K2OMtifmfDc7c86u
         rIIA==
X-Forwarded-Encrypted: i=1; AL+hErFvMDumTp78KYNVjh0IpyH3OmL5kpdFbJFz169hRNKq3ACc7Hsli/f5InXum0ex2Vt7DiEk@lists.linux.dev
X-Gm-Message-State: APuU4Z87c9PSyv917BtwMP+bm8TWHTp3wIeYZAnQs70J/X+ImbAzzRuI
	0dlm6ingAUP41j1hOXIhj8Dkv0RLc5fAaKbn4Tma6q8FJeARuPXkStBz
X-Gm-Gg: AZFdTZcerRSSVn9acRzLQRz/wgiRnkV3qElqvSQfuUXnLm/+kDYHyxf134lZyA/XM+S
	bO6abIvqfEihwOFy0LNiRNNdDZyTapQW2rYLnpThrDsOKtKjgZ7fZ0f5H2d42DefbxG4yFNcW/V
	Ea19mvtQ2ad5yeWHmjswHmLbKG+ZUnJtwzDmRwiu4WqlmmZHQ9Wi0rk1eYNL3GiYLkcV27HpABy
	ii7BCRXz5ie8KH6gjHxqMsN/GEYEOuKKxZuOUpU2eV0mgLiYAqvTK1+PE5gDcj5NS3g7E8uxjI9
	Dx3c32Irj7yybYQlF8A8YCw8SjH4E0wMz3BZKvVTLXDxDvTbEh2R17ofQe6TDN8Kx0/chKmQMJM
	y8k4RFtG0gPK1szEgAmQl9Syc8ZBd7t/REkWtC1UyQAd+7SU3f7eOmXR7ayH8/8lGjHlomYG0tv
	o1pTISSjd92/89sfxFAC9cctk2wQ/kDT6qO8yz6MP4HAZg4Tu9Xo02g3I/UG1wt2OjvctFPyshY
	JSdFEc8CebEOoMvw1QwW1aWtm4Z100rQX/vPEVdsssP4FLeXHEE05P9kWwR9BZMgwDeIDRTnSz7
	Y2WBEvX0T20M7m+bYUuJM58p
X-Received: by 2002:a05:600c:820d:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb887c3ae7mr436997625e9.1.1795710704643;
        Thu, 26 Nov 2026 08:31:44 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm721964995e9.11.2026.11.26.08.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:31:44 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Aring <alex.aring@gmail.com>,
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
Subject: [PATCH v2 0/4] Add f*_xflags_{rw,ro}_mask flags to the fileattr API
Date: Thu, 26 Nov 2026 17:31:10 +0100
Message-ID: <20261126163114.403846-1-koray.fra@gmail.com>
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

The first patch is a preparatory cleanup so that the code in the later
patches can be formatted better.

The second patch updates fscrypt_prepare_setflags() to take FS_XFLAG_*
xflags instead of legacy FS_*_FL flags.

The third patch is the actual implementation, which introduces:
- fa_xflags_{rw,ro}_mask fields to struct file_attr
- fsx_xflags_{rw,ro}_mask fields and has_masks selector to struct file_kattr
- AT_FILE_ATTR_MASKS at_flag for file_[gs]etattr()

These masks have the following semantics:
- rw_mask:
  * for filesystems: advertise which xflags they support changing
  * for userspace: specify which xflags it wants to modify
- ro_mask:
  * for filesystems: advertise which xflags they support only reading
  * for userspace: ignored

This allows userspace to not have to do a RMW cycle when using the
file_[gs]etattr() syscalls, avoiding possible race conditions and
simplifying their usage.

Patch 3/4 also introduces the missing FS_XFLAG_PROJID flag so that
programs like chattr can leverage the new mask API.
FS_XFLAG_PROJID is kept out of the legacy FS_XFLAGS_MASK and so it's
defined as part of a new FS_FILE_ATTR_XFLAGS_MASK group of xflags that
will be used moving forward for any new xflag (like the one proposed in [2]).

Patch 4/4 converts fs/ntfs to this new API, to show how it can benefit
filesystem drivers too, and for this purpose adds FS_XFLAG_COMPR and
FS_XFLAG_ENCRYPT from their FS_COMPR_FL and FS_ENCRYPT_FL counterparts.

The series has been tested with custom xfstests [3] (generic/816-835,
xfs/611, xfs/673) across NTFS, ext4 (project quotas), XFS (project
quotas and extent size hints), Btrfs, and F2FS.
Note: these tests were written by gemini and not manually checked,
before sending them upstream (if needed) I'll have to review/rewrite
them manually.

Note 2: there are apparently quite a few bugs with overlayfs and a few
other issues, but I wanted to get the final API design out first.

v2 changes:
- make fa_xflags_{rw,ro}_mask in struct file_attr __u64;
- add AT_FILE_ATTR_MASKS to opt in to mask semantics instead of needing
  unreliable heuristics on usize and mask values;
- reject intermediate sizes between VER0 and VER1;
- reject non-zero masks on SET without AT_FILE_ATTR_MASKS;
- add patch 2/4 for fscrypt_prepare_setflags;
- add xflags_to_flags() / flags_to_xflags() and
  fileattr_set_{legacy_to_mask,mask_to_legacy}() to translate between
  legacy RMW callers/filesystems and _mask callers/filesystems;
- clamp fa->fsx_xflags to rw_user_mask in file_attr_to_fileattr();
- update fileattr_set_prepare() to validate capabilities and projid
  changes against rw_user_mask / xflags;
- move the rw_mask == 0 early-return no-op from file_setattr() into
  vfs_fileattr_set();
- put FS_XFLAG_COMPR in FS_XFLAG_RDONLY_MASK only (keep FS_XFLAG_ENCRYPT
  in both FS_XFLAG_COMMON and FS_XFLAG_RDONLY_MASK);
- update ntfs_fileattr_set() to apply only bits selected in
  fsx_xflags_rw_mask;

Thanks,
koraynilay

[1]: https://lore.kernel.org/CAOQ4uxg8aVcWyNiFDk8djdn-M3xJcu_7-kRxVq9jjFsbcGp1ew@mail.gmail.com/
[2]: https://lore.kernel.org/CAOQ4uxjVQ9cjV=_jBjQtNg9zCuWUEJT9KNYMKV+1jwBkHen5OA@mail.gmail.com/
[3]: https://github.com/koraynilay/xfstests/tree/patches-in-queue

koraynilay (4):
  vfs: use goto out on error in vfs_fileattr_set()
  fscrypt: update fscrypt_prepare_setflags() to use xflags
  vfs: add xflags mask to fileattr API
  ntfs: switch to the new xflags fileattr API

 fs/crypto/hooks.c          |  10 +-
 fs/file_attr.c             | 357 +++++++++++++++++++++++++++++++++----
 fs/ntfs/file.c             | 109 +++++------
 include/linux/fileattr.h   |  14 +-
 include/linux/fscrypt.h    |   6 +-
 include/uapi/linux/fcntl.h |   6 +
 include/uapi/linux/fs.h    |   9 +-
 7 files changed, 409 insertions(+), 102 deletions(-)


base-commit: 3857587d9d6fa44d40d1c73bde6a39f6f7a5216c
-- 
2.56.0

