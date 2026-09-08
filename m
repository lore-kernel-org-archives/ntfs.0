Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F62F34F48F
	for <ntfs@lists.linux.dev>; Tue,  8 Sep 2026 04:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788841976; cv=none; b=LOgUuKtjmCQXANvbxYTPWbun9EFnBVvgY31VLnOOIGSB+jh0zGwG0zOR45vTWFgNvBROFw5HbCnZ7PQjyiMXVgws+8RoRjO0KzGwd2HrwiPx5QDSNuK1dIfx6VtZX7coEzU6uvj0REvdZn6+3/OzzUsAETxGisipH0xdWPhEIqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788841976; c=relaxed/simple;
	bh=woGBc4+O8NDfRuAzU7N9ac1EBujxeCk4WUhZuQN2CqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJe2feQqgF3BG3VKWJH4fOYGvAaZ4+2a5DWuem0NzixTHskjthgVmlDKM+6UQ1dwSXDCODDCTeWchQaUeVHXp+ZBFg6hT3dKqHgB6fjshjgkJ1BnWdsZXmj3ecmYUrqZMpuDfj6UDTcJ1GV9w1qFj+nEdL0kWwBty8q0J7B97iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JXjMDGoF; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JXjMDGoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=+75gtd7ceeyXkkK/xcKJ4GDdlFtH+tU23oAjcIcCkLA=;
	b=JXjMDGoFqMSpA8QMq3HJFc0ksLKrd4kvF9PmLJFAgR8xjTEtuJLVkPuduFA5gs
	X1r9cra1Ma4b4+9avYGr66fPv0hOzuf+NTscb2ynNQ/gz+ix7kuh9mbJgGUH+If4
	pUhLlOVObJ4P7YZVypgX6xEBp643NuwSxg0Re9tsgSfL0=
Received: from [IPV6:2409:8900:1e93:d74:46a:b98a:2b32:6a19] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3f5bWj59qBlrBBQ--.5218S2;
	Tue, 08 Sep 2026 12:32:24 +0800 (CST)
Message-ID: <3be9d721-5867-43e6-98fc-7ea713d59db4@163.com>
Date: Tue, 8 Sep 2026 12:32:22 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] ntfs: fix volume flag update races and persist the
 recorded error state
To: Hongling Zeng <zenghongling@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, zhongling0719@126.com
References: <20260907070852.291323-1-zenghongling@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260907070852.291323-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3f5bWj59qBlrBBQ--.5218S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr1fuw43ZF4Utw18GrW7Jwb_yoWrAF1Dpr
	ZavwnrK3ykAry29r92kay8Xa4F93yfA3yUCrykJ3y3Aw15Gr1IqFWSq34Y9a4j9rnagw1v
	yF4jkw15uwn8ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2zuZUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhicZ2qfj9i7owAA3b



在 2026/9/7 15:08, Hongling Zeng 写道:
> Hi all,
> 
> First of all, my apologies for the many versions of this patch.  I
> should have folded the reviewer feedback in and resent a single coherent
> series sooner; the split across v1/v2 and follow-ups made the thread
> harder to follow than it needed to be.  This v3 consolidates everything
> into one series of three patches.
> 
> To recap the review discussion:
> 
> The original patch (now 1/3) fixed the lost-update race where
> ntfs_set_volume_flags() and ntfs_clear_volume_flags() computed the new
> value from vol->vol_flags outside any lock.  The review correctly
> pointed out that a race remained in ntfs_sync_fs(): it checked
> NVolErrors() outside the critical section, so a concurrent error path
> could still record an error after the check and before the clear, and
> the volume would end up persisted as clean despite the recorded error,
> meaning chkdsk would not run on the next mount.
> 
> That race is now fixed in 1/3 itself: the NVolErrors() check and the
> clearing of VOLUME_IS_DIRTY both happen inside the same mrec_lock
> critical section, via a dedicated ntfs_clear_volume_dirty_if_no_errors()
> helper.  With that, every interleaving of the sync thread and the error
> path leaves the volume dirty on disk.
> 
> Patches 2/3 then close the writer-side half of the window: the runtime
> metadata-corruption paths in fs/ntfs recorded only the in-memory
> NVolErrors() flag and never persisted VOLUME_IS_DIRTY at all, so a
> volume could unmount with a clean on-disk flag despite recorded
> corruption.  Persisting from the error paths themselves is not an
> option: they run under a wide variety of ntfs locks (runlist locks,
> vol->lcnbmp_lock, vol->mftbmp_lock, mrec_locks) while the dirty-bit
> write needs the $Volume mrec_lock and can take the $MFT runlist lock,
> which self-deadlocks or forms ABBA cycles.  Instead, 2/3 makes
> persistence a property of the lock-free sync contexts: the new
> ntfs_sync_volume_dirty_state() sets VOLUME_IS_DIRTY when NVolErrors()
> is recorded and clears it otherwise, evaluating the error flag under
> the $Volume mrec_lock.  It is called from ntfs_sync_fs(), the
> remount-to-read-only path and ntfs_put_super(), with NV_Hibernated
> gating so a hibernated volume is never written by these paths.  The
> guarantee is eventual rather than instantaneous (a crash between the
> error record and the next persistence point remains a window);
> ntfs_put_super() runs on a quiesced filesystem after evict_inodes(),
> so a volume that is read-write at unmount time cannot unmount clean.
> 
> Patch 3/3 is pure hygiene found during review: the load_system_files()
> error unwind leaves a stale vol->vol_ino pointer in place, and carries
> a dead iput() inside the IS_ERR(vol->vol_ino) branch; NULL the pointer
> like ntfs_put_super() and the ntfs_fill_super() error path already do.
> 
> One housekeeping note: this series was rebased onto the current ntfs
> tree after the first posting failed to apply there.  Dennis Tighe's
> "ntfs: do not mark the volume clean in sync_fs when errors were
> recorded" landed in the meantime and fixed part of the same sync_fs
> problem this series addresses; patch 2/3 supersedes that fix with the
> ntfs_sync_volume_dirty_state() helper, which guards the clear in every
> persistence context, not just sync_fs.  No conflict with its intent.
> 
> Patch layout:
> 
>    1/3 ntfs: fix volume flag update races
>        Move the read-modify-write of vol->vol_flags inside the
>        $Volume mrec_lock; ntfs_sync_fs() clears the dirty bit under
>        the lock with the NVolErrors() check.
> 
>    2/3 ntfs: sync the volume dirty bit with the recorded error state
>        New ntfs_sync_volume_dirty_state(), called from the lock-free
>        sync contexts (sync_fs / remount-ro / put_super); NV_Hibernated
>        gating.
> 
>    3/3 ntfs: NULL vol->vol_ino in the load_system_files() error
>        teardown
>        Drop the stale pointer and the dead iput().
> 
> The series builds cleanly with W=1.
> 
> Thanks,
> Hongling

Hi Hongling,
    Thanks for putting this together. I left a couple of comments on 1/3 
and 2/3. Patch 3/3 looks good to me.

Thanks,
Baolin.

