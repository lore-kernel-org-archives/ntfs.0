Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227D31E1A17
	for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 03:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740121; cv=none; b=ovODYHuVNLDBjVGaToXxgK/dCIxm0YN9FGdj7AEtblBa6swOB22dxzm3bPfPcFVJ26o84EWm5NTu244qpCjs7WYmczRvcQYAy7/a11e8+VYtuCyevHO0ibqdDaYCk6cYK1zuXFwG0U2dZIr3xt+gCqCx4AzvbWBNV/NIEOKPSyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740121; c=relaxed/simple;
	bh=UKI790QDojdJDY+DeD1jJ52elEwoCQln0jg4STWj20w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FvtOc/HQ6LGzwcChU305jQBQONvptuiV/5fInVkj5uB0+eLFmUeN0IcDg8p0f6XT85/FDartHb+X3ahSHxK1eQwknlq4MWevtGLHmpndc7tTpDgUvsE6x3auvceHZiYysfs8HbtMEZMrcLmQXOahWf9sQS9XlXeaNpcAfgmkKV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLljoLDy; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLljoLDy"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f05ffcso23099755ad.0
        for <ntfs@lists.linux.dev>; Tue, 29 Sep 2026 20:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790740119; x=1791344919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wIXIFL7vyYRyEByzr98V2DuVEMckRb61lDQSAtKhBgI=;
        b=VLljoLDyjg6nvU2KH88EZka1Ve9FbvpCTp7wFSWU9mh4frIMC35RecTho1pKlzYZuw
         c4tgeA0uNrFE00RhnidntQOmCrTcvTn5ppvRHoraoFOpEiri+3NG/7wMD04zgZXW15de
         UBkXrU4t2LRcqxb8FNWNjGjIBdayz0tfGjdv9nzlTnyb9Y/f4jUpTuh434pnlWH4UrKI
         1MaREJ4SDhdjJIMIlQ4oUgzTRcr/Degl4TGl1uxhxzkUTtt8wEQPtTil8hGDnwTe1rBy
         6pQPZo/6SVVp0WXsAGIarr0KtMUmMR27OuVUwv+AVgMPXCMxlB52tXKKnkg11lYevdPt
         RpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790740119; x=1791344919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wIXIFL7vyYRyEByzr98V2DuVEMckRb61lDQSAtKhBgI=;
        b=vjJThUL3soATwCvpTkC/c2aTw+8rxK3pU6P2niPkfXENFxHMSqCNyEtb1SzqDKHru/
         oXuiDrIsP35jWn/0qVmjL4qqr0kx9JPDsFI6WovSd6YstY6H2qdGIOwoSsCJfqo6v5xA
         IwW+PEh8Hm7uyxwH4A4M5K5eJVjUquKzmiIg/zkgcLidsK+PKuE30NQ25z7v6bni47oS
         Y8x/PN+LDIXn/mXiKb778hdm6F6EhZdPVPGOn+DtxuksFsg4K/FVvKuOka5sgLX/iEwz
         UvRNkHsTFzjfjkHbVJwc3GxzYdWFVnFJUWyQcGlP4ILR8dy14yKeC9bvrWyxqUwDoa1b
         LBkw==
X-Forwarded-Encrypted: i=1; AKwUvByVPggVOQ6DSFjqimHxxSLzJ4Fc1JDJdLuv/kiPleAvJjcRwz3Oa+RFk1ysTvylWVIBKjU4@lists.linux.dev
X-Gm-Message-State: AFq9FYKBAJELa5LKYhK/h77U1yvCdiuj2AwGxkri0f24sJC7jWn16wyd
	pKheCYj1eHJLCGO8D1LojxYBT4+Dp+vCi3LiUf8w8v9PmTj0V5+iIfpNycTgUEHAVxZRUg==
X-Gm-Gg: AYBFou19x1GmWWpGSVpHNKhuVT1DmQVp/ovACmvYlYdQKocVYbx60BfWll7baRq0Svd
	UuGiyf1QSe02hED7xBwfdLLLqLFWEOoKZrlYLB4l92Y3asQaBuGfdocOBwghD228EQfsC/Aaifb
	kl46ZeptCjLX7EdblMfThwh2GiVCQm7jCMAgisRnKaupkDsrd4e8tLLB/RD3RV+tKRmDkA51dR1
	Uxw+h/f+80vanFdui61gv+lcDOxoqCFJ8HIRJ4XI8mYUYrAYM1Ulpn8cxz+VWOHPWPQcWSWY7s2
	/KOSID+7UMCcItN+0Kgrgzb8TXLya1nlnNVAphME3TXG9w5J5smH0SLYM2tN5831SGFSyTxrzMu
	60ESf3Rkpasz9WJQTwC9b9qJissFvJ0HH1UvM87VZa/F7xCSxMwvkyix/khoML9L1PqFBFoMW/y
	zrhrrIyDksZE9F6h4ds3HRXolRqfcN60kdxBcqIG0gvEOJKKGLkGrfzD1cgOO0hoZ1dk8z7FG/P
	djL+9GVhX0eg8/v5xIxFUkgG2ww7NX1Zi01ForvXyPnkRkLSabCgvl538Yl5hOaOfhnrSkBINCy
	X122QdmuLquZCsU9knM5rKR0C6IBPc7DKmimm1SYgTOlrE2lVjbO2HU0h2A0
X-Received: by 2002:a17:903:2349:b0:2df:8f19:5db8 with SMTP id d9443c01a7336-2e2e4ba0b86mr1471765ad.59.1790740119319;
        Tue, 29 Sep 2026 20:48:39 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2dd86f3ddsm3760005ad.68.2026.09.29.20.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:48:38 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] ntfs: fix the $MFT bootstrap hang and reads of unmapped runlist ranges
Date: Wed, 30 Sep 2026 11:48:29 +0800
Message-ID: <cover.1790684177.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hyunchul,

This is v3, with your review of v2 and Baolin's applied:

- Patch 1: a failed retry for a vcn at or beyond allocated_size returns
  the runlist end again, as in ntfs-next; only lookups below it fail
  with -EIO.  On its own, v2's patch 1 also failed lookups past EOF,
  for instance when reading a file's last folio with 512-byte clusters
  (Baolin).  Baolin suggested moving patch 4's allocated_size check
  before the retry instead, but that skips a retry ntfs-next makes: on
  a corrupt volume whose allocated_size is cut to where a file's last
  extent record starts, the rest of the file was then read as zeros,
  where ntfs-next and v3's patch 1 read the data (with the whole series,
  patch 6 rejects that file).
- Patch 4: the if statement you asked me to merge is gone, as the
  allocated_size check now sits in patch 1, and in
  ntfs_attr_vcn_to_rl() patch 4 only extends patch 1's -EIO to
  LCN_ENOENT.  The expansion rollback restores allocated_size under
  size_lock.
- Patch 6: the comment is gone, and $MFT's own non-resident attribute
  list is checked too (Baolin); a volume where that list claims more
  data than its allocation used to mount and now fails to.

Patches 2, 3 and 5 are unchanged.

The series fixes a hang at mount when $MFT needs its own extent records
(patch 3, which needs patch 1).  Patches 1 and 2 fix reads and writes
of a runlist range held in an extent record that cannot be read, which
returned zeros with no error or silently lost buffered writes, and
patch 4 does the same for a runlist that ends before allocated_size.
Patches 5 and 6 check the sizes of $MFT's data and of every non-resident
attribute against their allocation, as fs/ntfs3 does.

Tested under qemu with KASAN and the hung-task detector on ntfs-next,
with and without the series.  Nine crafted images that hang or crash
the mount without it fail to mount with it, and six that read zeros
that are not on disk return errors instead.  Eighteen images that mount
without the series, among them eight public test volumes written by
Windows or mkntfs, read every file the same with it, and six small
mkntfs images still mount.  v3 gives the same results as v2 on all of
them.  The images and the scripts that generate them are at

  https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-26-ntfs-mft-runlist

and, for the ordinary file of patch 4, the unaligned allocated_size of
patch 6 and three of the eighteen volumes that mount, at

  https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-26-ntfs-v2-extra

and, for v3's changes, at

  https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-30-ntfs-v3

v2: https://lore.kernel.org/all/cover.1790417653.git.matthias.goergens@gmail.com/
v1: https://lore.kernel.org/all/20260922153931.1976405-1-matthias.goergens@gmail.com/

Thanks,
Matthias

Matthias Goergens (6):
  ntfs: do not map an unmappable runlist fragment as a hole
  ntfs: do not turn an unmappable runlist fragment into delalloc on
    write
  ntfs: fail the mount when $MFT needs its own extent records
  ntfs: do not map a vcn as a hole when its runlist lookup failed
  ntfs: fail the mount when $MFT's data size exceeds its allocation
  ntfs: reject non-resident attributes whose sizes exceed their
    allocation

 fs/ntfs/attrib.c   | 51 +++++++++++++++++++++++++++++++++++++++++-----
 fs/ntfs/attrlist.c |  8 ++++++--
 fs/ntfs/inode.c    | 46 +++++++++++++++++++++++++++++++++++++++++
 fs/ntfs/iomap.c    | 16 +++++++++++++--
 fs/ntfs/layout.h   | 13 +++++++-----
 fs/ntfs/volume.h   |  3 +++
 6 files changed, 123 insertions(+), 14 deletions(-)


base-commit: 259abb551e2944998cad4214c201954ab1ac5c8d
-- 
2.55.0

