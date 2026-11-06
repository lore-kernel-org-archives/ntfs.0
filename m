Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946719;
	b=O9Dy5fRlVq0pfBSk7FeJFzFClb8kcxng3brMroEE5+xqk5jhfsksu/o9g2ZPq8YcabU7
	 6EaUnKtFUdoYuqcoZiJzEVJ7LkJmSFgkwr/g8+pIwJ39DXX71dNKH5O2AQK6bE/v7wjij
	 sc9IrOTookQceuzvMhJHdeJho6XtKLHcPeJK82L55YFMFbHGTWXz3uo9tHFD93DSQo2WI
	 IF3gd+4SP7Fe5nhargcgVaI7YdBgTKvXKOtJtmJ82nOFZf8OV3bWWkaXl0oCNdf+KRyIU
	 teG0/Bkm/dFilTEY6E7159tQdonV9DUN4MzF6nGPNGyaXuRai3WsTwCA86jQiY7km6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946719;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=+abND1Cpq7xlyokcR3yG/tZi6qe7h+vJ+77wvDE4CUU=;
	b=YpmRYtmoD9v12lJE8QegDZM7UUmpcEX0u9P0PinOTjh8RWQNycIXL2dJrTxLV6TyIZN8
	 jOQlWPFOEn+SoV9ojO/KiAQIDWnQsaoP2ETO9AtyvHyCrXW4SBKOi8P+mk+boNyj57JiE
	 2yEO0pWWlyMg9LdvDBisxW4SQvNZ8iWqXLAcjgGKj3VbByV+Uyh+buGmfLl+WvqbuWeUl
	 PJcRdVu27Xqoh3e4jRBz+/DNqHZqY5JekzF4eVPiMTpXIISSYG3KpdxnNDPDRllzqm3my
	 1ja6ptgJVfhIAWiiOytx/5vHY9ORJSLCnVjFCfV8+cBd+q4VisxVcGNOcKZw/dlB84g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="W/dx1qKo";
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE8F606A32C
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 06:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE8F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=W/dx1qKo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=+a
	bND1Cpq7xlyokcR3yG/tZi6qe7h+vJ+77wvDE4CUU=; b=W/dx1qKoMbCyNZFXAv
	dc0K75WtodUoETvrT/AOLtjYeagQ5UC7/t/NqeL0Qp2/hWrvy0nCdiN1If/6QNZJ
	GZ3qEdJUR9VIt8ZMBFFWdrnlUqFmaiWtDt5x1q8BZ3R6dXOB/UjAO3joB4dOLzfz
	tg5JhV0GvHtd881H3SOwIzy4o=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3lzdFdO1qwIxJFg--.3403S2;
	Fri, 06 Nov 2026 14:31:35 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v3 0/5] ntfs: support O_TMPFILE
Date: Fri,  6 Nov 2026 14:30:54 +0800
Message-ID: <20261106063059.2904988-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
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
X-CM-TRANSID:_____wD3lzdFdO1qwIxJFg--.3403S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3JFyDGFyfAw4DtF1UGw18uFg_yoW7CF1rpF
	Z3K390qw1DJF1xW397Za1UXr1F9ayfGF47Jryjgry7Zwn8KFn2vrWxKF45Z3ZrC39agw4j
	qr4jq3s7WF98ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UPpnLUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QdED2rtdEdBVAAA3E

From: Baolin Liu <liubaolin@kylinos.cn>

This series adds O_TMPFILE support to fs/ntfs. Applications can prepare a
regular file's contents and metadata before publishing it with linkat().
Unpublished files are reclaimed when their last reference is released.
O_EXCL prevents publication.

The series keeps the same five changes and ordering as v1 and v2:

  1. Initialize inherited ACLs after allocating the new MFT record.
     Anonymous creation needs its inherited ACL stored before returning.
  2. Preserve prepared atime and mtime when publishing the inode through
     the hard-link path.
  3. Initialize the new FILE_NAME's packed EA size, since a temporary
     file may already have EAs when it is published.
  4. Complete unlinked-file attribute writes before dropping the cache,
     including EAs and data copied during resident-to-nonresident
     conversion before publication.
  5. Add O_TMPFILE creation and publication support.

As requested in review, patch 2 gives the new FILE_NAME and directory
index entry the same ctime as the inode. The inode ctime is updated only
after the link succeeds. Patch 1 also initializes a newly created
FILE_NAME's ctime after inherited ACL setup, fixing a timestamp mismatch
caused by moving ACL initialization later in v1.

In v3, patch 4 also preserves data copied by
ntfs_attr_make_non_resident(). As reported in review, growing DATA in a
nearly full MFT record can convert SECURITY_DESCRIPTOR and leave its
contents only in a dirty folio. Evicting the zero-link attribute inode
then discards those contents.

Write the resident value to the newly allocated clusters before
committing the conversion. If that write fails, release the new clusters
and retain the original resident value. Propagate the error to the caller
instead of continuing with another attribute. Patches 1-3 and 5 are
unchanged in code from v2.

While implementing and testing O_TMPFILE, we also found pre-existing
NTFS bugs in attribute rollback and ACL lookup. These include stale
attribute inodes left cached after failed creation, which can cause
subsequent creation to return EIO even after space is freed, incorrect
ACL inheritance when the default ACL is not cached, and a fixed-size
read buffer that cannot handle larger ACL values. The underlying bugs
predate this series.

To keep this series focused on O_TMPFILE support and review
feedback, we are leaving these existing bugs to a separate bug-fix
series. We plan to submit those fixes after this series is accepted and
merged. These issues remain present with this series applied.

Tested this five-patch series in QEMU with four CPUs, NTFS debug and
lockdep enabled. The requested unchanged xfstests generic/004 and
generic/389 passed. Tests covered creation, publication, last-reference
cleanup, O_EXCL, normal idmapped ownership, named streams, nonresident
EAs, direct I/O, mmap, allocation and concurrent publication. Published
data and metadata were checked after cache eviction, remount and reboot.
Offline inspection compared hard-link ctime in STANDARD_INFORMATION,
the new FILE_NAME and the directory index.

The conversion regression uses 1 KiB MFT records and varies EA sizes
before writing 4 KiB to anonymous and ordinary files. Offline inspection
compares SECURITY_DESCRIPTOR contents with the original resident value.
The v2 kernel loses converted security descriptors and some EAs; v3
preserves them with 512-byte, 4 KiB and 8 KiB clusters, including after a
fresh boot. An injected block write error returns EIO and leaves the
resident security descriptor and EA intact. Free space is unchanged after
that failure, and retrying the write succeeds.

Changes in v3:
- Extend patch 4 to write converted attribute data before switching the
  record to nonresident form, addressing the v2 review.
- Preserve the resident value on conversion write failure and propagate
  conversion errors.
- Add conversion and I/O-error regression tests and rerun generic/004
  and generic/389.
- No code changes to patches 1-3 and 5; add Hyunchul Lee's Reviewed-by.

Changes in v2:
- Update FILE_NAME and index ctime as requested in review.
- Set the source inode ctime only after successful hard-link creation.
- Initialize creation FILE_NAME ctime after inherited ACL setup.
- Run generic/004 and generic/389 on the standalone five-patch series.
- Rebase onto ntfs-next commit
  564c7753647731d19170914c1c637d3b33d88d3b, including the const mnt_idmap
  tmpfile callback signature and documentation context.
- Resolve patch 1 against the updated early ACL error handling in
  __ntfs_create(); the relocated ACL failure still uses MFT/EA rollback.
- Keep the original five-patch scope; submit fixes for the pre-existing
  attribute rollback and ACL lookup bugs separately after this series
  is merged.
- No functional changes to patches 3 and 4.

Baolin Liu (2):
  ntfs: initialize inherited ACLs after allocating the MFT record
  ntfs: support O_TMPFILE

Xuewen Wang (3):
  ntfs: preserve timestamps when creating hard links
  ntfs: initialize packed EA size when creating hard links
  ntfs: write unlinked file attributes before dropping their cache

 Documentation/filesystems/ntfs.rst |  15 ++++
 fs/ntfs/attrib.c                   |  58 +++++++++++-
 fs/ntfs/inode.c                    |   8 ++
 fs/ntfs/namei.c                    | 140 +++++++++++++++++++++++------
 4 files changed, 192 insertions(+), 29 deletions(-)


base-commit: 564c7753647731d19170914c1c637d3b33d88d3b

