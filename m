Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792815429;
	b=YuKIW7quXr7agp0WPvNAUCBu84XmEUHSySm7k7Bfl1OKZRXY8EWVHnvB3dOAYEwq0HJQ
	 DnOF6RtkVhI9iTLPFEmLkYfeMw4XCYNZhXzlVz3GGV/mK0ca5icV9YQBgfvnR41tcpDfk
	 9MyjNUFBVDZXpSjTQu/HMWRJOwndjVT2BJtMIq04da+OqRvszbBFVmS1uQGt8sQRFYpmn
	 6rutdDsAO764lPsABzr9FAuWc8EmwmzDuvOJ6SUIW12NKRTB/zO+/AWOkfnSFiAnfZKz5
	 zPVc3QZJhuipRjYz7r1Q7/0QHDT3Ox/kdIJM2JVNFGAH6DVGIgZr9xibpcCHVQhze7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792815429;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=FylkLybIu+ZG7I577ND3mdjtOlZYdfX704wHzYT80cs=;
	b=EiF2SlgM6b13UWyE9g3d7wUbvKKjKUBajg0akG++jvmvnYLuEAXfd8QdDUUGZ73tU2K+
	 BmaG7QDSnBEFd5SWj9ppoDhNVU4pY9aJc9GAruNrTqnshNcAW0JinBMzPG0TaZFMfWcTr
	 x8wySqWeE6ZJj1RGhD5GO+wuzrdTvsoYsNyG8quZP5cLbIecidjmlM6k0rv0hmjpBDrTx
	 f3Dco8rZhCGNUTMBq1p29V6vK+0sXiOeaKahaVD+JqxGKvdY6jS0+3g/sktx1es1JQCeT
	 zGUCVQCwLKZF/FGTF9LtUFt8pMdmG8lPauxWTjI6h2Qf0g5T9JCU0mpJ9kI5KhcFdqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T+s82pfX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DC9606A31A
	for <ntfs@lists.linux.dev>; Sat, 24 Oct 2026 04:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T+s82pfX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC5C1F01828
	for <ntfs@lists.linux.dev>; Sat, 24 Oct 2026 04:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792815428;
	bh=FylkLybIu+ZG7I577ND3mdjtOlZYdfX704wHzYT80cs=;
	h=From:Date:Subject:To:Cc;
	b=T+s82pfXHRwuBCXFIBcpcIpAulcZHdzQHgtvDSoXdtDvdpfaK/a2o4KH8I+RgzSSP
	 L6qTSIII0WKxp36v8XcyuUkwX9/pYs+mPRGGrO9RMf8WigfDbIH8Hp5k/hVgxZbpQ3
	 mDFtZcGaovjXrLbCn/amB6ModpB8NaB3hm5FTpwS42UojWb/AKJtWNjh9MEtndWlbu
	 SDm7ZdhkmLMC2/uPX5iVcH38nSJ9J2Oh8sbnFfdbPl+D/OJCKe+CJ7/wYpNC6Omp7N
	 ArFl3GtLMjPpZDzaVKdgaVLnpMQ4lx5rh6ZEkV2TH79FJOHUTY8pbUb3NuU9nXl7IH
	 +NV4rYYEv7uhA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c411e139259so118726566b.2
        for <ntfs@lists.linux.dev>; Fri, 23 Oct 2026 21:17:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwHH7tfzk1QEqOZU/TWf2Y3+9SamTixA0DKP9tiaUZiy3CnPd812FBWGAZndHpaGMFT180i@lists.linux.dev
X-Gm-Message-State: AFq9FYJWKCM6WJfkRHxiPPKg4IxyJh0M0tfByCVClBWDq/IQVZ5ULD2q
	QTDVJbXRyCi1jCmHotELklkd9wKSFunZyBJAg1iX0HoQB700Q5Xm/qO1BthXez5hN9TAQi5efIE
	qDU4L9g4zByFkOc4niH//PmN2nfwRmlE=
X-Received: by 2002:a17:906:478c:b0:c42:9ded:6a8a with SMTP id
 a640c23a62f3a-c46bdd9ae46mr110584266b.16.1792815426832; Fri, 23 Oct 2026
 21:17:06 -0700 (PDT)
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
Date: Sat, 24 Oct 2026 13:16:54 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-XG_n3ufHzayWZ0jEBR15-=khbRFRDuLD1nAu6JqRDOA@mail.gmail.com>
X-Gm-Features: AclHuK-eY1bSEFSZLpEDVSrIGLLQpKBbXJcAA9kG94llF49gZfX9zRsACI7dNDg
Message-ID: <CAKYAXd-XG_n3ufHzayWZ0jEBR15-=khbRFRDuLD1nAu6JqRDOA@mail.gmail.com>
Subject: [GIT PULL] ntfs update for 7.4-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

This is ntfs update pull request for v7.4-rc1. I add a description of
this pull request below. Please pull ntfs with following ones.

Thanks!

The following changes since commit f47d223627f80cb7a1eb14c585fe6cb35de5e984=
:

  Merge tag 'vfs-7.4-rc1.sync_close' of
git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs (2026-10-19
21:03:21 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git
tags/ntfs-for-7.4-rc1

for you to fetch changes up to 5dffb7307023d909277cb5f5f3f18f32afa31e2f:

  ntfs: handle a failed size rollback in the write error path
(2026-10-23 09:43:20 +0900)

----------------------------------------------------------------
New features:

 - Implement ioctls to list, read, write, and remove named streams on files
   and directories. Provide optional file:stream pathname access through
   streams_interface=3Dwindows, exposing streams as regular file descriptor=
s
   with support for mmap, locking, truncation, and allocation.

 - Support file attribute queries and updates through FS_IOC_GETFLAGS and
   FS_IOC_SETFLAGS. Store immutable, append-only, nodump, and noatime
   settings in the private $LINUXFLAGS extended attribute and restore them
   when loading inodes. Also report compression, encryption, and
   the mount-wide case-folding policy as read-only attributes.

Other changes:

 - Expose the existing NTFS volume serial number through FS_IOC_GETFSUUID
   by registering it as an eight-byte filesystem identifier.

 - Validate MFT I/O geometry and write MFT records and mirror data through
   mapped I/O units, keeping neighboring records intact when multiple
   records share a native 4Kn block. Track folio writeback until all BIOs
   complete, serialize raw record updates against writeback, and use the
   caller's requested completion mode.

 - Discard stale uninitialized cache data before extending initialized
   size, ensure shared mmap writes update initialized size after native
   4Kn size extension, and synchronize attribute inode sizes after internal
   resizes. Keep VFS and NTFS sizes consistent when write-error rollback
   fails and record the volume error.

 - Wait for existing folio writeback before updating attribute data,
   require page alignment for full-page write optimizations, and include
   the final partial cluster in synchronous writes. Skip duplicate VFS
   page-cache truncation under the MFT record lock to avoid a truncate
   and writeback deadlock.

 - Restart allocation zone searches after failed hints and prevent
   contiguous allocation requests from returning additional disjoint runs
   that callers leave uninitialized. Allow fallocate after MFT-zone
   exhaustion and interrupt allocation loops only for fatal signals,
   avoiding spurious interruptions from io_uring task-work notifications.

 - Wait for the initial bitmap scan before extending the MFT bitmap,
   bound direct allocation candidates by the volume size, update free-space
   accounting, and undo only newly allocated clusters after run coalescing.
   Update attribute-list inode size before reserving additional space.

 - Hold runlist locks while expanding non-resident attributes, balance
   locks during MFT extension error handling, and avoid pointers
   invalidated by runlist reallocation. Keep source runlists available for
   rollback and allocate enough room for runlist markers and terminators.

 - Return errors for unmappable runlist fragments instead of treating them
   as holes or delayed allocation. Check non-resident attribute sizes
   against their allocation and fail mounts when $MFT needs extent records
   outside the decoded runlist to describe itself, preventing silent zero
   reads and mount hangs.

 - Load and validate $BadClus:$Bad at mount time and reserve known bad
   clusters before the free-space scan. Fall back to read-only operation
   when bad-cluster metadata cannot be validated and prevent subsequent
   read-write remounts.

 - Serialize volume flag updates and retain the dirty bit after metadata
   changes while the volume remains mounted read-write. Persist recorded
   errors after final metadata commits, fail ordinary read-only remounts
   on sync, commit, or flush errors, and retain the dirty bit on forced
   remounts.

 - Flush the device write cache when syncing directories and report flush
   failures from both file and directory fsync. Drain in-flight direct I/O
   before buffered write fallback and keep nonblocking requests from
   entering the blocking fallback path.

 - Mount hibernated volumes, or volumes whose hibernation state cannot be
   determined, read-only regardless of the errors=3D policy. Prevent
   mount-time and dirty-state updates from modifying hibernated volumes.

 - Validate complete EA chains, link zero-terminated tails when appending
   entries, retain the EA presence flag, and distinguish empty values from
   removal. Propagate lookup, write, and truncate errors, restore both EA
   attributes after failed updates, and shut down the volume if restoration
   fails.

 - Restore the previous ACL xattr when a subsequent WSL mode update fails,
   including replacement and removal cases. Record rollback failures so
   an unsuccessful permission change cannot silently leave inconsistent
   ACL and mode state.

 - Apply MST fixups to individual index blocks on large-page systems and
   use fixed 512-byte VCN units when an index block is smaller than its
   cluster. Support lookup and removal of POSIX names containing
   Windows-invalid characters and identify directory symlinks and
   junctions during enumeration.

 - Report the stored creation time for symbolic links through statx()
   when querying the link itself with AT_SYMLINK_NOFOLLOW.

 - Use wider decompression offsets to avoid overflow on 64 KB pages,
   accept the standard sparse compression unit, and require the
   compressed-size field only on the first attribute extent. Block direct
   reads and skip readahead for encrypted files to prevent returning raw
   ciphertext.

 - Validate index entry offsets, logfile update sequence array counts,
   attribute-list sizes, and index collation key lengths to prevent
   out-of-bounds accesses, NULL pointer dereferences, and excessive
   allocations from corrupt volume metadata.

 - Derive FITRIM bitmap indexes from the page size and retain the full
   64-bit minimum discard length. Balance highmem mappings in logfile
   and MFT mirror checks and propagate specific errors from extent,
   attribute, and reparse operations.

 - Compare streams_interface with the mounted volume's setting during
   remount, make named-stream UAPI padding explicit, document stream access
   and Linux file attributes, and add the NTFS UAPI header to MAINTAINERS.

----------------------------------------------------------------
Arnd Bergmann (1):
      ntfs: avoid unnecessary padding in uapi structure

Baolin Liu (16):
      ntfs: return -EINVAL from ntfs_collate_ntofs_ulongs() on bad length
      ntfs: preserve the truncate error in ntfs_enlarge_attribute()
      ntfs: propagate the map_mft_record() error in ntfs_attrlist_entry_add=
()
      ntfs: propagate the ntfs_attr_iget() error in update_reparse_data()
      ntfs: fix error handling in ntfs_extent_inode_open and propagate erro=
rs
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
      ntfs: support FS_IOC_GETFSUUID

DaeMyung Kang (3):
      ntfs: compare streams_interface with mounted volume on remount
      ntfs: report block device flush failures from fsync
      ntfs: flush the block device when syncing a directory

Hang Nan (1):
      ntfs: reject index blocks with a too small entries offset

Hongling Zeng (12):
      ntfs: NULL vol->vol_ino in the load_system_files() error teardown
      ntfs: use fatal_signal_pending() for fallocate interruption checks
      ntfs: fix volume flag update races
      ntfs: set the volume dirty bit unconditionally on metadata changes
      ntfs: sync the volume dirty bit with the recorded error state
      ntfs: persist the dirty state after the final put_super() commits
      ntfs: do not clear the volume dirty bit during sync
      ntfs: check the dirty-state commit on remount and unmount
      ntfs: fail remount on sync errors and keep the dirty bit on SB_FORCE
      ntfs: mount hibernated volumes read-only regardless of errors=3D
      ntfs: roll back the ACL xattr commit when the WSL mode update fails
      ntfs: handle a failed size rollback in the write error path

Hyunchul Lee (19):
      ntfs: read MFT writeback bounds under size_lock
      ntfs: validate the MFT I/O geometry
      ntfs: write MFT mirror data in mapped I/O units
      ntfs: serialize raw MFT updates against folio writeback
      ntfs: track direct MFT writes until BIO completion
      ntfs: write MFT folios through mapped I/O units
      ntfs: write MFT records through containing I/O units
      ntfs: use sync flag for direct MFT writes
      ntfs: trigger page_mkwrite for native 4Kn size extension
      ntfs: wait for attribute folio writeback before update
      ntfs: fix lookup of POSIX names with Windows-invalid characters
      ntfs: fix incorrect VCN units for index blocks in large clusters
      ntfs: fix FITRIM bitmap indexing for large pages
      ntfs: require page-aligned full-page attribute writes
      ntfs: avoid truncate and writeback deadlock
      ntfs: validate attribute-list sizes before allocation
      ntfs: avoid misclassifying directory reparse points
      ntfs: accept standard sparse compression unit
      ntfs: only require compressed size on first extent

Jiale Yao (1):
      ntfs: drain in-flight DIO before buffered write fallback

Jiangshan Yi (1):
      ntfs: remove unreachable code in load_and_init_attrdef/upcase

Karl Mehltretter (3):
      ntfs: include the final partial cluster in sync writes
      ntfs: fix kunmap_local() of advanced pointers in check_mft_mirror()
      ntfs: fix kmap_local leak in ntfs_check_logfile()

Marek Weso=C5=82owski (1):
      ntfs: fix directory lookup on large-page systems

Matthias Goergens (14):
      ntfs: do not map an unmappable runlist fragment as a hole
      ntfs: do not turn an unmappable runlist fragment into delalloc on wri=
te
      ntfs: fail the mount when $MFT needs its own extent records
      ntfs: do not map a vcn as a hole when its runlist lookup failed
      ntfs: fail the mount when $MFT's data size exceeds its allocation
      ntfs: reject non-resident attributes whose sizes exceed their allocat=
ion
      ntfs: hold the runlist lock while expanding a non-resident attribute
      ntfs: do not use a stale runlist pointer when undoing $MFT extension
      ntfs: add a runlist merge that leaves the source runlist to the calle=
r
      ntfs: balance the $MFT runlist lock in data extension error paths
      ntfs: set the attribute list size before reserving space for it
      ntfs: restart the zone search when the allocation hint fails
      ntfs: do not refuse fallocate() when the MFT zone is empty
      ntfs: do not give a contiguous cluster allocation a second run

Namjae Jeon (9):
      ntfs: validate and reserve bad clusters at mount
      ntfs: sync attribute inode size after resize
      ntfs: clear stale pagecache on initialized-size extension
      ntfs: propagate EA truncate errors
      ntfs: add named stream ioctls support
      ntfs: add pathname access for named streams
      MAINTAINERS: ntfs: add UAPI header
      ntfs: document named streams
      ntfs: fix NULL dereference on index allocation open failure

Xuewen Wang (7):
      ntfs: preserve the 64-bit FITRIM minimum length
      ntfs: bound the adjacent cluster in MFT bitmap extension
      ntfs: fix rollback after MFT bitmap run coalescing
      ntfs: wait for the bitmap scan before MFT bitmap extension
      ntfs: account for direct MFT bitmap cluster allocation
      ntfs: report birth time for symbolic links
      ntfs: support persistent noatime attribute

Zhan Xusheng (4):
      ntfs: do not read ahead encrypted files
      ntfs: reject direct I/O reads of encrypted files
      ntfs: widen the sub-block offsets in ntfs_decompress()
      ntfs: fix u16 truncation of the update sequence array count check

pwngets (1):
      ntfs: fix runlist marker allocation and count

 Documentation/filesystems/ntfs.rst                 |   65 +
 Documentation/userspace-api/ioctl/ioctl-number.rst |    1 +
 MAINTAINERS                                        |    1 +
 fs/ntfs/Makefile                                   |    2 +-
 fs/ntfs/aops.c                                     |    7 +-
 fs/ntfs/attrib.c                                   |  328 ++--
 fs/ntfs/attrib.h                                   |    2 +-
 fs/ntfs/attrlist.c                                 |   22 +-
 fs/ntfs/bitmap.c                                   |   72 +-
 fs/ntfs/bitmap.h                                   |    2 +
 fs/ntfs/collate.c                                  |    8 +-
 fs/ntfs/compress.c                                 |    4 +-
 fs/ntfs/dir.c                                      |   32 +-
 fs/ntfs/ea.c                                       |  567 +++---
 fs/ntfs/ea.h                                       |   11 +
 fs/ntfs/file.c                                     |  504 +++++-
 fs/ntfs/index.c                                    |   29 +-
 fs/ntfs/index.h                                    |    2 +-
 fs/ntfs/inode.c                                    |  427 ++++-
 fs/ntfs/inode.h                                    |   21 +
 fs/ntfs/iomap.c                                    |   78 +-
 fs/ntfs/layout.h                                   |   19 +-
 fs/ntfs/lcnalloc.c                                 |   35 +-
 fs/ntfs/logfile.c                                  |   13 +-
 fs/ntfs/mft.c                                      |  976 +++++++----
 fs/ntfs/mft.h                                      |   19 +-
 fs/ntfs/mst.c                                      |    4 +-
 fs/ntfs/named_stream.c                             | 1821 ++++++++++++++++=
++++
 fs/ntfs/namei.c                                    |  208 ++-
 fs/ntfs/ntfs.h                                     |   11 +-
 fs/ntfs/reparse.c                                  |    2 +-
 fs/ntfs/runlist.c                                  |  103 +-
 fs/ntfs/runlist.h                                  |    3 +
 fs/ntfs/stream.h                                   |   81 +
 fs/ntfs/super.c                                    |  609 ++++++-
 fs/ntfs/unistr.c                                   |   29 +-
 fs/ntfs/volume.h                                   |   20 +
 fs/ntfs/wof.c                                      |    6 +-
 include/uapi/linux/ntfs.h                          |  130 ++
 39 files changed, 5167 insertions(+), 1107 deletions(-)
 create mode 100644 fs/ntfs/named_stream.c
 create mode 100644 fs/ntfs/stream.h
 create mode 100644 include/uapi/linux/ntfs.h
