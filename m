Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C17414419
	for <ntfs@lists.linux.dev>; Wed, 23 Sep 2026 06:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143399; cv=none; b=h+I3ijkVZRhM8BHMET+pvuP2yyj9O2AEBlgxZ4AF9AcqD/qjmh0TDt4JR4OWSA9DlBRjW6JpNAJ+n+didbrbyRqBOlmP4DuJi6+nJwxqOv+pNo/QhTJDJoPwqqzEij62FF+vHkbHOIjss9gzN3/mOF3xDAHIonmiFwHWx8rDZis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143399; c=relaxed/simple;
	bh=qwds/siRDE+eeZa5GkDL6duepRKLKaLT+6EW7WQwZuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T4PtRncW1DR/7qUBnqywJgWTmz2Uo4KtYDqxLl/3UjSiMQIqfy/VoKyq3mp2fwYiSS+dgvcHYpfvsrjb4MsI9hNXQ4Q5dGhNxIRnOprSSfZOLS7AN2H8SCMFJiE0BuiOE7TvS5+Ek+qxuvlREbAOUYEP0Jr1KfAR3sXDR6p7i7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SOX64Lc9; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SOX64Lc9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=jZ
	H6p0nbE6w/2bt0YPaWHLvUgTWm/ZxZD3uu7k6qs4c=; b=SOX64Lc9dSHp+w+sIV
	2fjj6BIgz5ovrGd7vsLK0AnjKOwD54WV4Ui0iLUb/8Y1XYtA4xps15mpWZDDu+NJ
	QjNf1fGDJVnWzJDPU3MEG6e5omPgkgFFc7nTUNT2AeKJdj/i/7q0Pr1mt4QvFpbK
	IyHB5CwgZr7JfTHEkjoezqug0=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCH_E+Ia7NqXdW_Aw--.58316S2;
	Wed, 23 Sep 2026 14:02:50 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 00/10] ntfs: persist Linux file attributes in an EA
Date: Wed, 23 Sep 2026 14:02:36 +0800
Message-ID: <20260923060246.2499192-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgCH_E+Ia7NqXdW_Aw--.58316S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gw4DWFyrAw47XFy3Cr18Grg_yoWxZFW8pF
	Z3K3sxK3ykJw17C392ya12qayF9Fs5AFWUWryDKry8uFyY9342qFWft3WYqF4xCrWfKw1U
	Xa1jq3ykurWrAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5eOJUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwQqET2qza4q8RgAA3C

From: Baolin Liu <liubaolin@kylinos.cn>

This series implements persistent immutable, append-only and nodump flags
using a private $LINUXFLAGS EA in the standard NTFS $EA/$EA_INFORMATION
attributes. No new NTFS attribute type or formatter changes are needed.

The value is a little-endian u32 with immutable, append-only and nodump
in bits 0, 1 and 2. Inode loading restores the flags. Unknown bits are
preserved, and the entry is removed only when its entire value is zero.
The setter protects system metadata and sys_immutable-derived immutable
state, rejects direct writes to $LINUXFLAGS, and updates in-memory flags
only after the EA update succeeds. Fileattr queries also report mount-wide
case folding. Nodump is reported through both fileattr and statx.

Changes since v3 (the standalone revision of patch 2):
- Rename the private EA from $LXFLAGS to $LINUXFLAGS, as agreed with
  Hyunchul, to avoid the WSL-owned $LX namespace. Rename the related
  internal fields, helpers and constants, and update the documentation.
- Include the v3 patch-2 changes: ntfs_listxattr() reuses full-chain
  validation, including size-only queries, and returns EUCLEAN for
  malformed EA structures while preserving lower-level read errors.
- Resend the complete ten-patch series with Hyunchul's Reviewed-by tag.

Changes since v2:
- The EA rename above and the listxattr validation requested during
  review. The on-disk bit assignments and update/rollback behavior
  remain unchanged.

Patch overview:
- Patch 1 fixes the cached EA presence flag after creating or replacing
  the only entry.
- Patch 2 validates EA chains and links zero-terminated tails before
  appending entries.
- Patch 3 preserves EA write errors and reports truncate failures.
- Patch 4 distinguishes missing attributes from lookup failures and
  rejects incomplete EA attribute pairs.
- Patch 5 distinguishes empty EA values from deletion and rejects
  removal or replacement of absent entries.
- Patch 6 prepares the new list before updating attributes, restores
  both old attributes on failure, and shuts down if restoration fails.
- Patch 7 adds fileattr queries for existing inode flags and mount-wide
  case folding.
- Patch 8 introduces the $LINUXFLAGS storage and inode-load paths, adds
  immutable persistence, and protects system-imposed immutable state.
- Patch 9 extends the persistent interface to append-only.
- Patch 10 adds persistent nodump and reports it through fileattr and
  statx.

Testing on this revision:
- QEMU tests covered flag and EA readback, inode cache reclaim,
  read-only/read-write remount, unmount/mount and fresh-kernel reload.
  Checked immutable write/unlink denial, append-only enforcement,
  normal I/O after clearing flags, and read-only SETFLAGS rejection.
- Verified EPERM when clearing $Bitmap protection, including without
  sys_immutable, and when clearing sys_immutable-derived protection.
  $MFT rejects SETFLAGS with ENOTTY through its empty operations.
  Checked casefold reporting and STATX_ATTR_NODUMP.
- Exercised first-EA creation/removal, XATTR_CREATE/REPLACE, zero-length
  values, zero-terminated tails, unrelated EA preservation, unknown-bit
  preservation, and direct LINUXFLAGS write/removal rejection.
- listxattr tests covered exact names and sizes, zero-terminated and
  empty lists, short buffers, and malformed offsets, name terminators,
  values and entry headers. Size-only, full-buffer and tiny-buffer
  requests returned EUCLEAN for malformed chains after a successful open.
- Malformed LINUXFLAGS length, chain offsets, name termination, value
  length and query length returned EUCLEAN. A corrupt tail following
  LINUXFLAGS prevented an update without changing the existing flags.
  An invalid resident EA_INFORMATION length rejected earlier by the
  underlying attribute parser retained that parser's EIO.
- Fault injection covered allocation failure, failures after each EA
  attribute update and rollback failure. Tested creation, replacement
  and removal with no other EAs, resident EAs and an 8 KiB non-resident
  EA; checked old values and protection after failure and remount, and
  shutdown when restoration failed.
- Additional injection checked ENOSPC write errors, short writes,
  truncate errors, ENOMEM/EIO lookup errors and missing EA attribute
  pairs, with old EA contents verified after remount.
- Formatted a SanDisk USB partition inside QEMU using the final kernel,
  and created combined and individual flag probes through SETFLAGS.
  A fresh QEMU boot with both disk and mount read-only confirmed flags
  0x70/0x10/0x20/0x40 and LINUXFLAGS values 7/1/2/4, directory nodump,
  absence of the cleared entry, unchanged canary EA and statx nodump.

The USB was freshly formatted with the label LINUXFLAGS_V4. The final
read-only check verified that $LINUXFLAGS is present with the expected
four-byte values and that the obsolete $LXFLAGS entry is absent.

Windows compatibility testing with the new $LINUXFLAGS name completed
on Windows build 26200.9457 (ver: 10.0.26200.9457), using the LINUXFLAGS_V4
USB volume (serial 3B3F-1D09). Windows mounted the volume and accessed
the existing probes with dir/type. After changing the current directory
to C:\, chkdsk G: /f completed all three stages and reported no filesystem
problems and no further action required.

After returning the USB to Linux, a fresh QEMU guest running the final
v4 kernel checked it with both the virtual disk and NTFS mount read-only.
GETFLAGS and EA reads confirmed combined flags 0x70 and individual flags
0x10/0x20/0x40, with four-byte $LINUXFLAGS values 7/1/2/4 unchanged.
Directory nodump remained set, the cleared entry remained absent, the
unrelated canary EA was unchanged, and statx still reported nodump.
The obsolete $LXFLAGS entry was absent.

The tested Windows mount/access/CHKDSK sequence therefore preserved the
$LINUXFLAGS names, lengths and values on this Windows build.

Baolin Liu (10):
  ntfs: keep the EA presence flag after creating the first entry
  ntfs: validate EA chains and link zero-terminated tails
  ntfs: propagate EA write and truncate errors
  ntfs: preserve EA attribute lookup errors
  ntfs: distinguish empty EA values from removal
  ntfs: restore EA attributes when an update fails
  ntfs: add fileattr query support
  ntfs: persist immutable in the $LINUXFLAGS EA
  ntfs: persist append-only in the $LINUXFLAGS EA
  ntfs: persist nodump in the $LINUXFLAGS EA

 Documentation/filesystems/ntfs.rst |  24 ++
 fs/ntfs/ea.c                       | 483 +++++++++++++++--------------
 fs/ntfs/ea.h                       |   9 +
 fs/ntfs/file.c                     | 125 +++++++-
 fs/ntfs/inode.c                    |  12 +-
 fs/ntfs/inode.h                    |   2 +
 fs/ntfs/namei.c                    |   2 +
 fs/ntfs/ntfs.h                     |   4 +
 8 files changed, 423 insertions(+), 238 deletions(-)

-- 
2.51.0

