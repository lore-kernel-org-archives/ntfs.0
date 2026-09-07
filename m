Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6462031B130
	for <ntfs@lists.linux.dev>; Mon,  7 Sep 2026 06:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762139; cv=none; b=PeiVK/vgDBq0g5p4kl2j6/SwxqdpIlzVEKHV4waZYDlb38nyY2DyA2Im9YuAbgfjNgQe2uRR4qPfaiKAjN5/f0ad7iyQfEWEWSnuHX8iB+iH2wrp1IZLlW75jGZjjiuZ92Hu2ybQU6dOla5bdjOmfqc0IRAaAS+LoSQITNHtArI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762139; c=relaxed/simple;
	bh=li40nXgnh4+ZAZLCtSMyWBbIGK8N9V/nHFlIIFtjL50=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TP8quFSWTZclW/l3dBNJz1uyF7Hvnkd6WQ0UrJ41KZP9Bn6u6SWEOA8YObLZpSJIYjvtjBalU3W5Ya+LKmN9OXyPNJOmTP7QswvH4FyCW50bNKiNe4nTfxYinE1ArTVLML7BOcI3xya8C1davR6IWPblb2cKq98hYhOULngLElY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 75ac99aeaa8411f19a56ed5b684f684d-20260907
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7e287a7b-f686-4685-984d-91dc571f53fb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:608833aa1352185db17d9c6ee12b652e,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 75ac99aeaa8411f19a56ed5b684f684d-20260907
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 775850993; Mon, 07 Sep 2026 14:22:11 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v3 0/3] ntfs: fix volume flag update races and persist the recorded error state
Date: Mon,  7 Sep 2026 14:22:03 +0800
Message-Id: <20260907062206.260638-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

First of all, my apologies for the many versions of this patch.  I
should have folded the reviewer feedback in and resent a single coherent
series sooner; the split across v1/v2 and follow-ups made the thread
harder to follow than it needed to be.  This v3 consolidates everything
into one series of three patches.

To recap the review discussion:

The original patch (now 1/3) fixed the lost-update race where
ntfs_set_volume_flags() and ntfs_clear_volume_flags() computed the new
value from vol->vol_flags outside any lock.  The review correctly
pointed out that a race remained in ntfs_sync_fs(): it checked
NVolErrors() outside the critical section, so a concurrent error path
could still record an error after the check and before the clear, and
the volume would end up persisted as clean despite the recorded error,
meaning chkdsk would not run on the next mount.

That race is now fixed in 1/3 itself: the NVolErrors() check and the
clearing of VOLUME_IS_DIRTY both happen inside the same mrec_lock
critical section, via a dedicated ntfs_clear_volume_dirty_if_no_errors()
helper.  With that, every interleaving of the sync thread and the error
path leaves the volume dirty on disk.

Patches 2/3 then close the writer-side half of the window: the runtime
metadata-corruption paths in fs/ntfs recorded only the in-memory
NVolErrors() flag and never persisted VOLUME_IS_DIRTY at all, so a
volume could unmount with a clean on-disk flag despite recorded
corruption.  Persisting from the error paths themselves is not an
option: they run under a wide variety of ntfs locks (runlist locks,
vol->lcnbmp_lock, vol->mftbmp_lock, mrec_locks) while the dirty-bit
write needs the $Volume mrec_lock and can take the $MFT runlist lock,
which self-deadlocks or forms ABBA cycles.  Instead, 2/3 makes
persistence a property of the lock-free sync contexts: the new
ntfs_sync_volume_dirty_state() sets VOLUME_IS_DIRTY when NVolErrors()
is recorded and clears it otherwise, evaluating the error flag under
the $Volume mrec_lock.  It is called from ntfs_sync_fs(), the
remount-to-read-only path and ntfs_put_super(), with NV_Hibernated
gating so a hibernated volume is never written by these paths.  The
guarantee is eventual rather than instantaneous (a crash between the
error record and the next persistence point remains a window);
ntfs_put_super() runs on a quiesced filesystem after evict_inodes(),
so a volume that is read-write at unmount time cannot unmount clean.

Patch 3/3 is pure hygiene found during review: the load_system_files()
error unwind leaves a stale vol->vol_ino pointer in place, and carries
a dead iput() inside the IS_ERR(vol->vol_ino) branch; NULL the pointer
like ntfs_put_super() and the ntfs_fill_super() error path already do.

Patch layout:

  1/3 ntfs: fix volume flag update races
      Move the read-modify-write of vol->vol_flags inside the
      $Volume mrec_lock; ntfs_sync_fs() clears the dirty bit under
      the lock with the NVolErrors() check.

  2/3 ntfs: sync the volume dirty bit with the recorded error state
      New ntfs_sync_volume_dirty_state(), called from the lock-free
      sync contexts (sync_fs / remount-ro / put_super); NV_Hibernated
      gating.

  3/3 ntfs: NULL vol->vol_ino in the load_system_files() error
      teardown
      Drop the stale pointer and the dead iput().

The series builds cleanly with W=1.

Thanks,
Hongling
