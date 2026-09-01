Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AF82F290B
	for <ntfs@lists.linux.dev>; Tue,  1 Sep 2026 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254149; cv=none; b=PnbgElAYs5CvkdAJh3hZajLNwaZYzaPKj3p4sXGjL583q02UFbjAAU+1oIwFLC5PpMfnpETKXDfgd2C7XIkuZuLzS4guIq1Es9ypygQpFrEpMxAOw5Sc1DmffMCtxgtznJXE8EQIQjYUdS1yeqAiAkHzy1t8m6G330/h7FPpCrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254149; c=relaxed/simple;
	bh=E+Rt5wOPJ8RNnN5YxUxJHXBh0UHtkQZj6cIJL9v9y3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cDM51f0IXLRFl3JW2naZVP5KFRAQtwnk5PfXRK+gkYPD9CzcdV7Ojn1mlgmO73V68UDdGAIfwKTyE3NAYYRqHzMfK+D8beL1ZB7AyQ5jM4tWf1nFcyeDEzJ348CKp+zfcTT3KpfsJEohgVOtIhjToGXLcywsSzw77tnR7vfkO5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WgOvLae/; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="WgOvLae/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=DC
	nerTV0ZvZoIkpRk6nnjdtD9XaIEisWkGaFoLXO7UA=; b=WgOvLae/WiUOPCqDO2
	9jJoqX7jU+O+TmXbOxAtcQngQ6NtWC3hHGaALrnSjVZMb2Bzb15VFsQ4JfEX8l8W
	TnRNPbjQXblsaVsr4FMjdwUDN9QfYxC3AWllsE0x5fEKMU32LiGNJAdZELd6YwRc
	rbu1ictffHQ5eNya+uuffca8A=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDXmJ6pl5ZqstwpQw--.142S2;
	Tue, 01 Sep 2026 17:15:27 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH 0/2] ntfs: wire up the fileattr API
Date: Tue,  1 Sep 2026 17:15:16 +0800
Message-ID: <20260901091519.2885376-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXmJ6pl5ZqstwpQw--.142S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kry5XF4DAry3WF1kCF15Arb_yoW8AF1rpF
	WfCFy3WrnrXry2ywsavr1DW3yFqw4kXrWUWry2q34xCFn8Jry2gFyIk3Wrurs2yrWfJ3sF
	qr4jqr9rWan0ya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pir-BtUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwg9RHGqWl69iMgAA3U

From: Baolin Liu <liubaolin@kylinos.cn>

This series implements fileattr_get and fileattr_set for ntfs so that
lsattr(1) and chattr(1) work on ntfs.

Patch 1 wires up the fileattr inode operations and implements support
for FS_IMMUTABLE_FL and FS_APPEND_FL. These flags map to inode->i_flags
(S_IMMUTABLE, S_APPEND), so the VFS enforces them. fileattr_get also
reports the compressed and encrypted state, which the driver already
exposes through STATX_ATTR_* in ntfs_getattr().

Patch 2 adds FS_NODUMP_FL support, which dump(8) and other backup tools
use to mark files to skip. The flag is stored in a new ntfs_inode field
and reported through both fileattr_get (for lsattr) and ntfs_getattr()
(as STATX_ATTR_NODUMP, for statx), so the two interfaces stay consistent.

All three accepted flags (immutable, append-only, nodump) are kept in
memory and do not survive a remount, matching ntfs3 behavior.

Tested in QEMU on an NTFS volume, both with chattr(1)/lsattr(1) and with
a test binary issuing the ioctls directly:
 - chattr +i/+a/+d each set the flag and lsattr reads it back
 - appending to a +i file fails with EPERM
 - statx(2) reports STATX_ATTR_NODUMP once nodump is set, and stops
   reporting it once cleared
 - FS_COMPR_FL is rejected with EOPNOTSUPP
 - lsattr reports 'c' on a compressed file
 - chattr -i/-a/-d clear the flags, and a flag set before unmounting is
   gone after dropping caches and mounting again

Baolin Liu (2):
  ntfs: implement fileattr_get and fileattr_set
  ntfs: support the nodump flag

 fs/ntfs/file.c  | 65 ++++++++++++++++++++++++++++++++++++++++++++++++-
 fs/ntfs/inode.c |  1 +
 fs/ntfs/inode.h |  1 +
 fs/ntfs/ntfs.h  |  4 +++
 4 files changed, 70 insertions(+), 1 deletion(-)

-- 
2.51.0

