Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFD5442FB6
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240523; cv=none; b=IpypUqBAdcMlSt5hsqeZaX2NgZ8aR2XGHCIR/kRsX79w8NR7N5Nr2HiVuDqQso/Q8fgs8gFfz+mDLe+roDl4PN3kiVOIQTKrxyQqBzFL4lZ2kiTIwP52Pgmv1eDwAmtSc6nfLQ5NkfrJ8bHbIm2T5BVxWnC4S+nbWR5ZBanUQVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240523; c=relaxed/simple;
	bh=8r8QnCPi7wPbio1pJSzVOPTHNFQWQFwwt/NZui/s1UA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BjVtL/oomVkq92RePGHtIa3Z3/BUyGacDpr0c/TEr4jsEH2Y7FOvCofmPGxFIMua9fhZqwF6sx9Syovl6TQp8faT560QkAvJjHwqlRXU+YyRnLVt/exLgNBBZs62K0wMBsC1bGUagD8v+3Qq1kVaWViH28ElrwwC1ZbT6Q9SXYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KNK/tz1x; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KNK/tz1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=DB
	j2idKGFoxfEqAjneLrEerB+jOLeusoUhDalVbL2n8=; b=KNK/tz1xigpSBLrt5k
	6SXDr+/P5J6BTEtqgF/QCULwu2wAmmuOSTHWhysywjx8TSTiXDDrNt5dshvI2d76
	3GVy8bNSMuWxSPDu/5KzAO+AiLQZ3XW9ZopSnmre0nwebBF0p8dxr74ScjXxhL45
	f5ZiGXF+WK2ZNue31/P0NiOEI=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3H73Q5rRqL6EhAg--.34883S2;
	Thu, 24 Sep 2026 17:01:07 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v3 0/6] ntfs: report filesystem errors through fsnotify
Date: Thu, 24 Sep 2026 17:00:56 +0800
Message-ID: <20260924090102.2865942-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H73Q5rRqL6EhAg--.34883S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF43Wr47XFy5tw17GF1fXrb_yoW5ZF1rpF
	Z3C3s3K393try2qr9xZ3yUt3WFgrZ3JayUJw13W34Ikrn8Kr1jqFWxt3W09FW5CryfXw4U
	Xw4UG39xCFyDArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnfHUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hO1gGq05tMMAwAA3o

From: Baolin Liu <liubaolin@kylinos.cn>

Report NTFS metadata and shutdown errors through the generic filesystem
error notification infrastructure. Use file-level events for errors
associated with an affected inode, and volume-level events for volume
metadata and shutdown errors. Preserve the volume error flags and report
failed recovery independently of the error that triggered it.

Report errors where they are detected and leave queued event merging to
fanotify. No error_reported state is carried through search contexts,
mapping-pairs updates or MFT mappings, so releasing a context cannot lose
that state or suppress a later rollback or restore failure.

Changes since v2:
- Follow Hyunchul Lee's suggestion to remove error_reported tracking and
  the reporting-aware mapping APIs throughout the series.
- Report independent cluster, mapping-pairs, ATTRIBUTE_LIST and MFT
  bitmap recovery failures while preserving the original operation errno.
- Base the series on ntfs-next at 401898d748fc ("ntfs: validate
  attribute-list sizes before allocation"). Retain its MFT parent BIO
  and folio writeback implementation. Report synchronous and asynchronous
  device errors in the existing completion callback; fserror itself
  defers notification work and holds the inode reference. No additional
  NTFS completion workqueue or pending-I/O counter is introduced.
- Cover stale extent references, failed extent-record cleanup, mirror
  failures and MFT preparation errors. Resolve attribute-inode reports
  to their base inode and keep cluster-free counts in 64-bit variables.
- Split MFT reporting into two patches: metadata validation, allocation
  and recovery in patch 4; write preparation, mirror and BIO completion
  errors in patch 5. This keeps the two review topics separate.
  Shutdown reporting is now patch 6.

Testing on this base:
- QEMU passed mount/read/write/fsync/truncate/xattr/rename/unlink, MFT
  growth and unmount without FAN_FS_ERROR events during normal operation.
- Verified EIO with a valid FID for file MFT corruption, EUCLEAN without
  a valid FID for an MFT bitmap mismatch, and ESHUTDOWN for forced
  shutdown.
- Fault injection of an initial mapping-pairs error followed by an
  independent restore failure produced a merged FAN_FS_ERROR event with
  error_count=2. Synchronous and asynchronous MFT completion failures
  also generated notifications. The injection code is test-only and is
  excluded from the series.

Baolin Liu (6):
  ntfs: report allocation metadata errors to fsnotify
  ntfs: report attribute errors to fsnotify
  ntfs: report inode metadata errors to fsnotify
  ntfs: report MFT metadata and recovery errors to fsnotify
  ntfs: report MFT writeback errors to fsnotify
  ntfs: report shutdown errors to fsnotify

 fs/ntfs/attrib.c   |  84 ++++++++++++++------
 fs/ntfs/attrlist.c |  17 ++--
 fs/ntfs/bitmap.c   |   2 +-
 fs/ntfs/inode.c    |  12 ++-
 fs/ntfs/lcnalloc.c |   4 +-
 fs/ntfs/logfile.c  |   2 +-
 fs/ntfs/mft.c      | 192 ++++++++++++++++++++++++++++-----------------
 fs/ntfs/super.c    |  32 +++++++-
 fs/ntfs/volume.h   |   4 +
 9 files changed, 235 insertions(+), 114 deletions(-)

-- 
2.51.0

