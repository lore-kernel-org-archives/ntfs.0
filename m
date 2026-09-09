Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B67448C402
	for <ntfs@lists.linux.dev>; Wed,  9 Sep 2026 09:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945065; cv=none; b=JVsVxPSYVA7J2CyZ4j1d8x5HPQal+hHdjWMW8vy98A9yf30+4q/uROnCD4DK650qDAIMcIqi9FF0DAkofMQc6r9i6zidhBYUp/YCQZISi1/C5wvgdSObphybxyNwZoocp+0qnVwdwJs8dRkOmmljE4a5JEnzC9gXgNFuh1iaM+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945065; c=relaxed/simple;
	bh=SbC+dA/AQ/crXji6m5W8ChM2Su/gCfCkulOxgfe5WtI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KA6AXwqm90J+WmjwrbMudW5Nw0ijMIFdpRNrdDexwIGtAWqa13DbSGh+y2Wv3TKIpI3SUY+YXckDedGFlZIjNsOdCe5uRW1jvMaozFq68CKSyzjMiP7KUnhShIWMbTZ7iA6PUGLhmXlYz33QFEXpDdSQiNaqp20Ej9d8dagDUA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5dc641eaac2e11f19a56ed5b684f684d-20260909
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a006dac7-4106-4af9-ac68-10a27ff2ad31,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:1d9ae0c2187d731f12f607eb25004f75,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5dc641eaac2e11f19a56ed5b684f684d-20260909
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2069558697; Wed, 09 Sep 2026 17:10:56 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v5 0/4] ntfs: fix volume flag update races and persist the recorded error state
Date: Wed,  9 Sep 2026 17:10:48 +0800
Message-Id: <20260909091052.1217728-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

v5 of the series, incorporating Baolin's review of v3.  The 3/3
hygiene patch ("ntfs: NULL vol->vol_ino in the load_system_files()
error teardown") has been applied separately, so this respin carries
the remaining work as four patches.  1/4 and 3/4 are unchanged from v3
(formerly 1/3 and 2/3); 2/4 and 4/4 are new and close the two races
Baolin spotted.

Changes since v3:

  2/4 (new): the callers in file.c and namei.c checked VOLUME_IS_DIRTY
      without any lock before calling ntfs_set_volume_flags(), so the
      check could race with the ntfs_sync_fs() clear and leave the
      volume clean on disk despite a metadata modification.  They now
      call ntfs_set_volume_flags() unconditionally; with the
      unchanged-value check under the mrec_lock from 1/4 this is a
      cheap no-op in the write itself when the bit is already set, at
      the cost of taking the lock on every call - see 2/4's commit
      message for why that cannot be avoided.

  4/4 (new): ntfs_put_super() persisted the dirty state before the
      just-in-case mftmirr/mft commits and the final write_inode_now(),
      which can themselves record NVolErrors(); errors from those
      points would leave the volume unmounted with a clean on-disk
      dirty bit, contradicting the "cannot unmount clean" guarantee.
      The persistence now happens after the last of them, with the
      iput(vol->vol_ino) moved to the end of ntfs_put_super() so
      vol->vol_ino is still available.

To recap the discussion that shaped v3:

The original patch (now 1/4) fixed the lost-update race where
ntfs_set_volume_flags() and ntfs_clear_volume_flags() computed the new
value from vol->vol_flags outside any lock.  The review correctly
pointed out that a race remained in ntfs_sync_fs(): it checked
NVolErrors() outside the critical section, so a concurrent error path
could still record an error after the check and before the clear, and
the volume would end up persisted as clean despite the recorded error.
1/4 fixes both: the read-modify-write and the NVolErrors()-checked
clearing of VOLUME_IS_DIRTY happen inside the same mrec_lock critical
section.

3/4 closes the writer-side half of the window: the runtime
metadata-corruption paths in fs/ntfs recorded only the in-memory
NVolErrors() flag and never persisted VOLUME_IS_DIRTY at all, so a
volume could unmount with a clean on-disk flag despite recorded
corruption.  Persisting from the error paths themselves is not an
option: they run under a wide variety of ntfs locks (runlist locks,
vol->lcnbmp_lock, vol->mftbmp_lock, mrec_locks) while the dirty-bit
write needs the $Volume mrec_lock and can take the $MFT runlist lock,
which self-deadlocks or forms ABBA cycles.  Instead, 3/4 makes
persistence a property of the lock-free sync contexts: the new
ntfs_sync_volume_dirty_state() sets VOLUME_IS_DIRTY when NVolErrors()
is recorded and clears it otherwise, evaluating the error flag under
the $Volume mrec_lock.  It is called from ntfs_sync_fs(), the
remount-to-read-only path and ntfs_put_super(), with NV_Hibernated
gating so a hibernated volume is never written by these paths.  The
guarantee is eventual rather than instantaneous (a crash between the
error record and the next persistence point remains a window); with
4/4, ntfs_put_super() persists after the last commit that can record
errors, so a volume that is read-write at unmount time cannot unmount
clean.

One housekeeping note: this series was rebased onto the current ntfs
tree after the first posting failed to apply there.  Dennis Tighe's
"ntfs: do not mark the volume clean in sync_fs when errors were
recorded" landed in the meantime and fixed part of the same sync_fs
problem this series addresses; 3/4 supersedes that fix with the
ntfs_sync_volume_dirty_state() helper, which guards the clear in every
persistence context, not just sync_fs.  No conflict with its intent.

Patch layout:

  1/4 ntfs: fix volume flag update races
      Move the read-modify-write of vol->vol_flags inside the
      $Volume mrec_lock; ntfs_sync_fs() clears the dirty bit under
      the lock with the NVolErrors() check.

  2/4 ntfs: set the volume dirty bit unconditionally on metadata
      changes
      Drop the racy caller-side VOLUME_IS_DIRTY checks in file.c and
      namei.c; the locked unchanged-value check makes the unconditional
      call skip the write when the bit is already set.

  3/4 ntfs: sync the volume dirty bit with the recorded error state
      New ntfs_sync_volume_dirty_state(), called from the lock-free
      sync contexts (sync_fs / remount-ro / put_super); NV_Hibernated
      gating.

  4/4 ntfs: persist the dirty state after the final put_super()
      commits
      Move the persistence after the last commits that can record
      errors, with the iput(vol->vol_ino) moved to the end.

Thanks,
Hongling Zeng (4):
  ntfs: fix volume flag update races
  ntfs: set the volume dirty bit unconditionally on metadata changes
  ntfs: sync the volume dirty bit with the recorded error state
  ntfs: persist the dirty state after the final put_super() commits

 fs/ntfs/file.c   |  14 ++--
 fs/ntfs/namei.c  |  24 +++----
 fs/ntfs/super.c  | 140 +++++++++++++++++++++++++++++++------------
 fs/ntfs/volume.h |   4 ++
 4 files changed, 130 insertions(+), 52 deletions(-)
