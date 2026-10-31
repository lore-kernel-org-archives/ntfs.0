Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424569;
	b=bYG+9WnyKG/o7kImKwpKv82Zz/aZoYowLc/ktQljS02jsO2h6qyvtjRSsr7VXGh+Ubwc
	 C+JeWdmRIl/eYUMEY1FeoVc8OdfZFCs0JXQFSK1yYIRVntZukBH9tsq4MlYgBBRhD9b0N
	 is1rQT7BLh761K722agbEOnf72G4XrMsSh4/pkjEg3GSrg1iFpq6TPX7WqqPqyLjt8Bge
	 DfSGSOoSV/8D49zZOu+frU1LgYSgKHnKiq98iSBZ66c0HtzdQHUvnS11Xan2g/LzwALaL
	 DbT2HBul6OQFLCfhHyttmEXXdmQZVXvCq8dzrdrmXdXIXyZsUI38FL8NV4dDjEAdyDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424569;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=mFnKL/QrSRH4cvdCu7rAUF+JIfMFvdtrjMOwHA75laE=;
	b=oXVjkoR7hsY//ZEGd/R1DZPwKxjOVdcPGuycUiSjTNVFmctd23DtNN6rKEJLQxIeJtRu
	 1zf21xivlWa/gY+CGu6XzMNUHX8mvqoribLe8pTYYG8WyX08DmVJr1eBVEgAx64i2ZLnZ
	 LkR9EliuakyaqKprSD+Vrky+dkCUHsyvlyTETWpIjflZPUrfmODXsiUT7K5DRbg0GCwiE
	 7yWX/CzBWWJR/6Swfh3bXmCA67FNti6jUpAtMhd2zJAh9VZqPQYKLksShySpACi/5lLy0
	 eqv24+ztHWfEOXNnkwIBzGjTDnfTgmaP3csOlw2C0Ory7QunV6nMdq1/vrhXIpGEeJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SqJOHoFi;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F628606A31F
	for <ntfs@lists.linux.dev>; Sat, 31 Oct 2026 05:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F628606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SqJOHoFi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=mF
	nKL/QrSRH4cvdCu7rAUF+JIfMFvdtrjMOwHA75laE=; b=SqJOHoFioNfDZ8mtoo
	0EsS89YvUFag3jbaVsZoJN1tPtYufS2zkSXX+BChzjb86X4796nIAB99A76EgTnw
	riTfTxhYLdERn0CLAhiSKIyri1/l5KyWGepioHN/w8/bSAsgMRojfqD9AQWolPUd
	zEsvb+e2auT8xGrs1/I3RD450=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDX37adfOVqFDprDA--.9490S2;
	Sat, 31 Oct 2026 13:29:03 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 0/5] ntfs: support O_TMPFILE
Date: Sat, 31 Oct 2026 13:28:52 +0800
Message-ID: <20261031052857.1542936-1-liubaolin12138@163.com>
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
X-CM-TRANSID:QCgvCgDX37adfOVqFDprDA--.9490S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF1fuFWfCry7tr4DZw4DXFb_yoWrXr1UpF
	ZagrZ0qwnrJF1I93s3Za1DXr1F9ayfCF47J3W5Wry2ywn0gFnavr40gF4DZasrGr93tF4j
	qw1jq397Wr98CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UPpnLUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6R9aJWrlfJ-qpQAA3q

From: Baolin Liu <liubaolin@kylinos.cn>

This series adds O_TMPFILE support to fs/ntfs. Applications can prepare a
regular file's contents and metadata before publishing it with linkat().
Unpublished files are reclaimed when their last reference is released.
O_EXCL prevents publication.

The series keeps the same five changes and ordering as v1:

  1. Initialize inherited ACLs after allocating the new MFT record.
     Anonymous creation needs its inherited ACL stored before returning.
  2. Preserve prepared atime and mtime when publishing the inode through
     the hard-link path.
  3. Initialize the new FILE_NAME's packed EA size, since a temporary
     file may already have EAs when it is published.
  4. Complete unlinked-file attribute writes before dropping the cache,
     including nonresident EAs prepared before publication.
  5. Add O_TMPFILE creation and publication support.

As requested in review, patch 2 gives the new FILE_NAME and directory
index entry the same ctime as the inode. The inode ctime is updated only
after the link succeeds. Patch 1 also initializes a newly created
FILE_NAME's ctime after inherited ACL setup, fixing a timestamp mismatch
caused by moving ACL initialization later in v1.

While implementing and testing O_TMPFILE, we also found pre-existing
NTFS bugs in attribute rollback and ACL lookup. These include stale
attribute inodes left cached after failed creation, which can cause
subsequent creation to return EIO even after space is freed, incorrect
ACL inheritance when the default ACL is not cached, and a fixed-size
read buffer that cannot handle larger ACL values. The underlying bugs
predate this series.

To keep this series focused on O_TMPFILE support and the v1 review
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

Thanks,
Baolin

Baolin Liu (2):
  ntfs: initialize inherited ACLs after allocating the MFT record
  ntfs: support O_TMPFILE

Xuewen Wang (3):
  ntfs: preserve timestamps when creating hard links
  ntfs: initialize packed EA size when creating hard links
  ntfs: write unlinked file attributes before dropping their cache

 Documentation/filesystems/ntfs.rst |  15 ++++
 fs/ntfs/inode.c                    |   8 ++
 fs/ntfs/namei.c                    | 140 +++++++++++++++++++++++------
 3 files changed, 136 insertions(+), 27 deletions(-)


base-commit: 564c7753647731d19170914c1c637d3b33d88d3b

