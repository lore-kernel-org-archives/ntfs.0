Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA713C4172
	for <ntfs@lists.linux.dev>; Fri,  4 Sep 2026 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512499; cv=none; b=ACF5Sdngo77T6bEf8X6N5uCmr0/1laAgbEQfx5673mhccOwqsVD8Mvh3ZiQWUlaIL6mWwUVNiRAutorj88QMz7kS31tMfvuprlS1p3dUZFI0WgivnJZJ+TYCtZ0IJbSATZfecOsIZP9Ycnno8+FDVNf5DVZd10j5w3aEAuHx2+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512499; c=relaxed/simple;
	bh=B1SA4x2HJ9PgE14PaEnX0hd7BnztFbOnzEbOVeP9V7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X1nhL5P69nOMR/EitwFkrvPrKRNwXtUROKI5icrO/H7JubE7FMB8ugmZRd23vjhxMIB1yPwcwJvh042Xa5cRD5Agm7mHV9HAJnQLF7cRHpRKThojwhRON2gr34ZXhVZGSTmZ3pnOw5Xj7/Ug+5iPCbHFkG6rPHl7PDzfFpAhqFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gVAApm5X; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gVAApm5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=m7
	lJyr9ZcjOr+g95OJhkQRTUO4dnvLiehplKxsu+0ss=; b=gVAApm5XAzEOvzmtYM
	zpZYRV8a9IXAXv+l7c6qZBeo7VcgO7E302zo06yWkhPe1g0xJa6ZIB2/clMiLnGM
	1Cg5NTcRiGg6V7l21Jw3QF+D2VLcTQPLqiA5ZhB/Y2x7fLByVbphGiFrtgigGBJz
	TV0J0o57gO9e20or/8oypevU0=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAHU97ViJpqDNWCAg--.41284S2;
	Fri, 04 Sep 2026 17:01:11 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 0/5] ntfs: fix incorrect error codes returned to callers
Date: Fri,  4 Sep 2026 17:00:49 +0800
Message-ID: <20260904090054.3365538-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHU97ViJpqDNWCAg--.41284S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrW8Kr1rGrWfJrWxCrWUXFb_yoW8tFW7pF
	9xCrn3tr4kJ34IkFZYvay7Aw1S9F93J3y7tr1qgw1Iva45Xr1UXr18K3W09rWSkrWrJw1U
	Xr40gan3CFy7ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnfHUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwReYY2qaiNf8FgAA3o

From: Baolin Liu <liubaolin@kylinos.cn>

Changes in v2:
- Patch 2: Fixed ntfs_extent_inode_open() to use ERR_PTR() instead of NULL,
  so it can properly propagate error codes (suggested by maintainer).
  Updated ntfs_inode_attach_all_extents() to use IS_ERR()/PTR_ERR() to
  preserve the actual error code from ntfs_extent_inode_open().
- Patches 1, 3, 4, 5: No code changes, added Reviewed-by tag from Hyunchul Lee

Five places in fs/ntfs/ return the wrong error code: a real errno is
replaced by -1 or by a hardcoded substitute, so callers and userspace see
something unrelated to what actually went wrong. The fixes are
independent of each other.

Patch 1 is different from the rest: there the error is not just
mislabelled, it is not seen as an error at all. -1 is what a normal
comparison returns for "collates before", so ntfs_ie_lookup() acts on it
as a tree-descent hint, and a malformed entry in $Reparse/$R or $ObjId/$O
is silently treated as a lookup miss instead of being reported.

Patch 2 fixes ntfs_extent_inode_open() which had two bugs: it treated
map_mft_record() failure as success, and returned NULL for all errors
(losing error information). Now it returns ERR_PTR() with the actual
error code (-EIO, -ENOMEM, -EINVAL).

Patch 3 fixes a -1 return in inode.c that reaches userspace as EPERM.
It loses ENOSPC among others, so a full volume misreports create(),
mkdir() and link().

Patches 4 and 5 restore errors that are already available as an ERR_PTR.
Both collapse -ENOMEM into something else, so an allocation failure is
misreported.

No control flow is changed; every callee already returned these codes.

Based on ntfs-next (0fecc393f206).

Baolin Liu (5):
  ntfs: return -EINVAL from ntfs_collate_ntofs_ulongs() on bad length
  ntfs: fix error handling in ntfs_extent_inode_open and propagate errors
  ntfs: preserve the truncate error in ntfs_enlarge_attribute()
  ntfs: propagate the map_mft_record() error in ntfs_attrlist_entry_add()
  ntfs: propagate the ntfs_attr_iget() error in update_reparse_data()

 fs/ntfs/attrlist.c |  4 ++--
 fs/ntfs/collate.c  |  2 +-
 fs/ntfs/inode.c    | 28 ++++++++++++++++++----------
 fs/ntfs/reparse.c  |  2 +-
 4 files changed, 22 insertions(+), 14 deletions(-)

--
2.51.0

