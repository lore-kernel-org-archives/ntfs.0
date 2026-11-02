Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604950;
	b=0+WbYa9s8/K/9c5rMG0Ltf6aVZ2kWuOBOpQ8HqxdauTIEaC9bx2FNHIGDsK3fW9HPhkH
	 qRRQDJQK+hPrgz8Xx0I8+KC9nEpnNeA2XoWqw3z02jHdQswD70WEfkbB0iTORCNZGTdhI
	 n3/DdcblaGNzJ2FKmtL83xYjIB5NhdKaTZ4gIwXNsz1bRpsBsRpTJIOH8RBoNxOq1ckv9
	 VMGLWggOpNJbvI6arNWBLWQZgvjFoxZs9q9iaQI2+BR7buA+sJ6QxrSRt9m0b8iIVqqDH
	 Kk23LJoEUEwby7bUZP6odd2FvWP8JhRX9nt1W6RIViz536vUsHcrvWMFdkRy/iGA7xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604950;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=H8bgsnBmy+s9QeJK5LIf80vVKjPFt0+InMVENaj/8xk=;
	b=Rdb0MI1q6Lx7CXEpK9Zwz3/B76yeFyFb82r1BkRe40TeWO5wow+YP2kI42iWRWd7zuOZ
	 IBTQ5J2x5kHvLDl/0XYtYwjRq5Ia0hu/2OrrBS4cIuiiZlH9XCPRiZWqVv5H4XFlkyysE
	 9d96Fvp65VgC6rOGMIP4kMQoLDhlRi1BgfEUCj6PvyTwaEjI2GBMSYwrSbH5z2COCXoDB
	 f0Mlya0+lW2I8xW8DGexQgSqW8zwCEnFEfXa7eDf9R+bR+O+SENNt31+9BtI6/8qDwNwf
	 JjmaB3QBx3nF4aGwFRcfLh2YBfvFNgyBdkoTkDputwamJc0k//E+Uah0SSgBv2r+Jcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=I31rqLVO;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5551B606A32D
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5551B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=I31rqLVO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=H8
	bgsnBmy+s9QeJK5LIf80vVKjPFt0+InMVENaj/8xk=; b=I31rqLVOlKt2gNfkfI
	p55p9Twe1FgBWiuKybGvaWnUFBycG2OPG+w7psPWwz7nVdZIrELPQkeiZT9/SgmN
	1kMciDnT0EVAB5J375nd6H4q0FhSyfU1X7PwOp/2Bkn3+J6vos32W/Pnoobg4NdW
	ClKDXU0J0+VjPpkz/fTgRUoo0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3f5hGPehqi52fEw--.9836S2;
	Mon, 02 Nov 2026 15:35:35 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v5 00/31] ntfs: report metadata errors and shutdown through FAN_FS_ERROR
Date: Mon,  2 Nov 2026 15:35:01 +0800
Message-Id: <20261102073532.98873-1-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:_____wD3f5hGPehqi52fEw--.9836S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Cw1xCrWrXw15Cr4xtw1DZFb_yoWDuw15pF
	Z3C3s5tws7tFyIyws2y3yjya4Skas5Ga1UXr1DK342krn8Kr12qFW8t3WUZFyrurWFq3yq
	qw4jq39ruryUAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4uWdUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzgc1HmroPUc6rgAA3O

From: Xuewen Wang <wangxuewen@kylinos.cn>

Report NTFS metadata corruption, failed recovery and shutdown through
FAN_FS_ERROR. File events identify the affected base file; volume events
cover errors without a safe file reference. Preserve the existing volume
error bit and errors= policy. Before SB_ACTIVE, metadata reporting helpers
record the volume error state without queuing an event.

Use -EFSCORRUPTED (-EUCLEAN) for confirmed corruption in the updated error
paths, both in reports and in failing NTFS operations. Preserve the errnos
of genuine I/O, allocation and unsupported-format failures. Ordinary EOF
and missing names or streams are not corruption. Partial-I/O and
best-effort operations retain their existing return semantics; an
independent recovery failure can report a different errno from the
initiating operation. Generic file-handle decoding may still translate
filesystem errors to ESTALE.

Based on ntfs-next commit 5dffb7307023
("ntfs: handle a failed size rollback in the write error path").

Changes in v5 (since v4):

Address the four points raised during the v4 review:
- Patch 4: ntfs_attr_exist() now returns 1 for a present attribute, 0 only
  for -ENOENT, and the negative errno for search-context or other lookup
  failures. Its callers propagate negative results instead of treating an
  error as an absent attribute.
- Patch 5: The remaining inner ntfs_read_locked_inode() failure in
  ntfs_read_inode_mount() now goes through common cleanup and returns its
  specific errno instead of the literal -1.
- Patch 6 and other affected paths: defer local reports to common exits,
  after releasing resources acquired on those paths. Suppress a duplicate
  when a lower layer already reported the same failure, but retain a report
  for an independent cleanup or recovery failure.
  The follow-up audit also covers resident WOF reads, attribute-list and
  nested-attribute removal, and index/bitmap operations.
- Patch 28: distinguish malformed EA metadata and missing required EA
  attributes from read failures. Preserve lower-level EIO, ENOMEM, EFBIG
  and other errors. In listxattr(), recheck HasEA under mrec_lock and report
  missing required EA_INFORMATION or EA as -EUCLEAN. Ordinary missing keys
  remain -ENODATA, and lower-layer reports are not duplicated.

Other changes since v4:
- Rebase all 31 patches onto the updated ntfs-next base. Adapt the series to
  the upstream write-size rollback change, the minimum INDX entries_offset
  check, the logfile USA-count widening, and the current iomap and const
  mnt_idmap interfaces.
- Adapt patch 23 to the rebased file-write rollback path. The upstream size
  rollback implementation is retained; this series adds FAN_FS_ERROR
  reporting and records the volume error when an attempted size rollback
  fails.
- Adapt patch 19 to the existing minimum INDX entries_offset validation and
  report the resulting corruption as -EFSCORRUPTED (-EUCLEAN) from the
  affected index-read paths.
- The follow-up audit adds reports for EIO from LZNT1 block reads and direct
  nonresident WOF table/chunk reads, and for failure to restore the resident
  MFT record after an unsuccessful conversion. It also preserves errors
  returned by lower-level runlist operations.
- In patch 23, treat positive reparse-index cleanup lengths as success and
  report only negative cleanup errors. Recheck the reporting paths on the
  rebased tree and rerun the validation listed below.

The v3 maintainer feedback is retained and rechecked in v5:
- The cited omission paths are covered: ntfs_ib_read() reports local
  short-read, MST and index-block corruption errors, and corruption exits
  in ntfs_read_iomap_begin_non_resident() report as well. The current tree's
  corresponding directory-lookup path is ntfs_lookup_inode_by_name(); its
  corruption exits report against the affected directory. Genuine I/O and
  allocation errors, ordinary EOF and missing names or streams retain their
  existing meaning.
- Use ntfs_inode_base() at the affected call sites for base-file
  attribution, with volume reports when inode lifetime prevents retaining a
  safe file reference.
- Use test_and_set_bit(NV_Shutdown, &vol->flags), so concurrent callers
  notify only the first caller for each clear-to-set shutdown transition.

The series remains split by metadata subsystem and recovery operation.
The search-context API conversion stays together with all its callers.

Series organization:
- 1-4: writeback errno propagation, cluster-free counts, reporting
  helpers and search-context/attribute-existence error propagation.
- 5-7: boot/MFT bootstrap, required system files and logfile errors.
- 8-10: runlists/cluster allocation, iomap and LZNT1/WOF streams.
- 11-17: attribute moves, lookup, record/list updates, conversion,
  resize/relocation and incomplete range updates.
- 18: inode metadata and eviction cleanup.
- 19-22: index validation, traversal, directory lookup and index updates.
- 23-24: namespace/file recovery and export parent reconstruction.
- 25-27: MFT record lifecycle, bitmap/data growth and writeback.
- 28-30: EA/ACLs, named streams and reparse/ObjectID metadata.
- 31: atomic shutdown reporting.

Validation:
- Built all NTFS objects and the bootable kernel with W=1.
- Sparse C=2 checked all 31 NTFS translation units without diagnostics.
- Passed 13 QEMU guest runs with NTFS built in, including normal file
  and namespace operations, named streams, inode/index/runlist/EA
  corruption, readdir, shutdown, filesystem ustat selftests and
  fsync/remount/data verification.
- Two of those runs specifically exercised INDX entries_offset below
  the new minimum, through lookup and readdir. Both operations returned
  EUCLEAN and generated EUCLEAN events after the listener was ready.
- Tested 374 controlled error-path scenarios using extracted, unmodified
  functions, including every ntfs_attr_exist() caller and EA/readall
  error classification, LZNT1/WOF read failures, runlist lookup errors,
  resident-record restoration, EA setter reporting and failed
  relocation/list persistence, including duplicate-report suppression.
  Forty of these cases cover index bitmap set/clear errors and local
  duplicate-report suppression. These are userspace harness tests with
  controlled dependencies. Eighteen cases check reparse-index cleanup
  return values, including successful positive lengths.
  Twenty-four additional cases check duplicate-report suppression in the
  two resident-attribute relocation paths.
  Thirty further cases exercise the real WOF table parser and chunk reader,
  including lower-layer errors and local corruption checks.
  Twelve cases check list-entry removal reporting and early failures.
  Thirty cases exercise real range-editing helpers with malformed
  runlists, valid ranges and allocation failures before and after changes.
  Forty-two additional cases exercise nested attribute removal and
  index/bitmap reads, distinguishing propagated corruption from local
  detection, I/O errors and independent failed cleanup.
- Fault injection in a separate test kernel validated errno handling in
  ntfs_read_inode_mount(). The tested function matches the final v5
  implementation apart from the test instrumentation. ENOMEM, EIO and
  EUCLEAN were preserved; missing required metadata (ENOENT) returned
  EUCLEAN.
- The QEMU test runs used non-strict KCSAN and lockdep; all 3 KCSAN
  selftests passed, and no KCSAN or lockdep diagnostics were printed.

The patches in this series are available at:
https://github.com/liubaolin-murphy/liubaolin-ntfs/tree/main/ntfs_notify/ntfs_notify_patch_v5

Thanks to Hyunchul and Namjae for reviewing the earlier versions.

Baolin Liu (11):
  ntfs: preserve cluster-free counts in attribute cleanup
  ntfs: add filesystem metadata error reporting helpers
  ntfs: report runlist and cluster allocation metadata errors
  ntfs: report attribute lookup and validation errors
  ntfs: report attribute list update and recovery failures
  ntfs: report attribute conversion and mapping update failures
  ntfs: report inode metadata and eviction cleanup errors
  ntfs: report MFT record validation and lifecycle errors
  ntfs: report MFT bitmap and data growth recovery failures
  ntfs: report MFT writeback errors to fsnotify
  ntfs: report each shutdown transition once

Dandan Wu (11):
  ntfs: report required system file and volume metadata errors
  ntfs: report logfile metadata and emptying errors
  ntfs: report iomap corruption and preserve buffered read errors
  ntfs: report LZNT1 and WOF compressed stream errors
  ntfs: report attribute resize and relocation recovery failures
  ntfs: report incomplete attribute range updates
  ntfs: report index validation and block I/O errors
  ntfs: preserve index traversal errors and directory retries
  ntfs: report directory lookup and metadata corruption
  ntfs: report index update and recovery failures
  ntfs: report namespace and file recovery errors

Xuewen Wang (9):
  ntfs: propagate mapping-pairs update errors from inode writeback
  ntfs: preserve attribute search context initialization errors
  ntfs: report boot geometry and MFT bootstrap errors
  ntfs: handle source record removal failure during attribute moves
  ntfs: report attribute record update and cleanup failures
  ntfs: serialize and report export parent reconstruction errors
  ntfs: report EA metadata and restoration errors
  ntfs: report named stream metadata and recovery errors
  ntfs: report reparse and object ID metadata errors

 fs/ntfs/aops.c         |  24 +-
 fs/ntfs/attrib.c       | 890 ++++++++++++++++++++++++++++++-----------
 fs/ntfs/attrib.h       |   8 +-
 fs/ntfs/attrlist.c     |  61 ++-
 fs/ntfs/attrlist.h     |   4 +-
 fs/ntfs/bitmap.c       |   2 +-
 fs/ntfs/compress.c     |  35 +-
 fs/ntfs/dir.c          | 112 ++++--
 fs/ntfs/ea.c           | 173 +++++---
 fs/ntfs/file.c         |  30 +-
 fs/ntfs/index.c        | 349 ++++++++++------
 fs/ntfs/inode.c        | 266 ++++++++----
 fs/ntfs/inode.h        |  10 +-
 fs/ntfs/iomap.c        |  66 ++-
 fs/ntfs/lcnalloc.c     |  17 +-
 fs/ntfs/logfile.c      |  58 +--
 fs/ntfs/mft.c          | 351 ++++++++++------
 fs/ntfs/named_stream.c |  61 ++-
 fs/ntfs/namei.c        | 144 +++++--
 fs/ntfs/object_id.c    |  50 ++-
 fs/ntfs/reparse.c      | 109 ++++-
 fs/ntfs/reparse.h      |   2 +-
 fs/ntfs/runlist.c      |  23 +-
 fs/ntfs/runlist.h      |   4 +-
 fs/ntfs/stream.h       |   2 +-
 fs/ntfs/super.c        | 310 ++++++++++----
 fs/ntfs/volume.h       |   4 +
 fs/ntfs/wof.c          |  49 ++-
 28 files changed, 2287 insertions(+), 927 deletions(-)

