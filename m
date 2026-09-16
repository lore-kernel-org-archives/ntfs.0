Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF6E47B43A
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 21:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593501; cv=none; b=nO/S4dTNGVKx61Zd2YCIGO25xAs/+28uDnCSKCKqSmIAEBIdEn1LbLAugN3tkdBeQ2s4mm+YJGqDuaLk3WiT3Cg6AICX0CVaRRDrjRtAGyWQR2g/3J3BymPalfm760weLfrkZfpNAX0MmVIshVIAgD3vWBsEYncloTPMAen8W8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593501; c=relaxed/simple;
	bh=EtEHkPmTakAyHK0p4aTwgKMToC8/FICbQm3Ha666b60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggDoLsLD2pHkuKSpQYLwN30uESM4ncJjA4bt7TjzTxl9fUTGCRs95G86/eKAsw4OITj6sRGuVP+joA7z2yOA14PoBQ+H3mEtvDjWDFjVB4RBHOPCr0k8NEavlip0Xkg5HwBR4MXROS7g4dqKK72vxnYKwdmtD2onnF67w80KA18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BbZpWGy4; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BbZpWGy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=cSWAuY8c8B29ZzhKeQeJwy1M3UxvvMl2vo35tNx7Fgc=;
	b=BbZpWGy4K60lYw5GZuHZyfemVd24LLG4NszRcc9Vblb5Yh8+Yz/j2P+n1i2+m7
	qywGTlJPLLz1BYfVL2aI/3SlAyBDE5AfG5sOvqKduYZ5WS8vUKgK/jHCVJp7jJ6U
	JCNyhwmOJok8Y0FLulHQL7a5AjaWui7QoG9mKTBUoJ0tk=
Received: from [IPV6:2409:8900:21a7:a33a:b45d:31d1:c098:7d46] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBnTfaIB6tqSyPIBA--.29263S2;
	Thu, 17 Sep 2026 05:18:01 +0800 (CST)
Message-ID: <e45017e8-cf0c-4a97-8ae9-03b27ebd840d@163.com>
Date: Thu, 17 Sep 2026 05:18:00 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 4/7] ntfs: persist the dirty state after the final
 put_super() commits
To: Hongling Zeng <zenghongling@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, Baolin Liu <liubaolin@kylinos.cn>,
 stable@vger.kernel.org
References: <20260915083252.812126-1-zenghongling@kylinos.cn>
 <20260915083252.812126-5-zenghongling@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260915083252.812126-5-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnTfaIB6tqSyPIBA--.29263S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Wr4DGF18WF1UJrWxZFW3GFg_yoW7Cw4rpr
	Zayws3Gw4ktFy2k3s7KrW0gFySg348Cayxur18Gw17Xwn3Gr1xK3Z8t34S9Fy8trykJw18
	XF4qyrW5KF4Uur7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UIeHgUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwgppNGqrB4rFwwAA3f



在 2026/9/15 16:32, Hongling Zeng 写道:
> The just-in-case mftmirr/mft commits and the final write_inode_now()
> in ntfs_put_super() can record NVolErrors() after the dirty state has
> been persisted, so errors from those points would leave the volume
> unmounted with a clean on-disk dirty bit - contradicting the "cannot
> unmount clean" guarantee ntfs_sync_volume_dirty_state() is meant to
> provide.
> 
> Move the persistence to the end of ntfs_put_super(): keep the gated
> re-commits and the tail commits where they are, run
> ntfs_sync_volume_dirty_state() and the $Volume commit after the last
> write_inode_now(), and release vol->vol_ino only after the sync.
> 
> The release order of the special inodes matters for the $Volume
> commit: writing the $Volume record mirrors it through
> ntfs_sync_mft_mirror() (record number 3 is below vol->mftmirr_size),
> which fails with -EIO and leaves the mirror stale once
> vol->mftmirr_ino is gone, so the mirror inode is released only after
> that commit.  vol->vol_ino is then put before vol->mft_ino is dropped:
> if the commit failed before it could clear the dirty flag,
> ntfs_evict_big_inode() commits the inode again on its way out, and
> __ntfs_write_inode() resolves the runlist through vol->mft_ino.
> 
> Reported-by: Baolin Liu <liubaolin@kylinos.cn>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>   fs/ntfs/super.c | 75 ++++++++++++++++++++++++++++++++++---------------
>   1 file changed, 52 insertions(+), 23 deletions(-)
> 
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 733565953302..3574c224fe28 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -1812,26 +1812,13 @@ static void ntfs_put_super(struct super_block *sb)
>   	ntfs_commit_inode(vol->mft_ino);
>   
>   	/*
> -	 * If a read-write mount, persist the error state in the volume flags:
> -	 * mark the volume clean if no volume errors have occurred, and make
> -	 * sure VOLUME_IS_DIRTY is on disk if any have, so chkdsk runs on the
> -	 * next mount.  Also, re-commit all affected inodes.
> +	 * If a read-write mount, re-commit all affected inodes once more.
> +	 * The dirty state itself is persisted at the end of ntfs_put_super(),
> +	 * after the last commits and the final write_inode_now(): those can
> +	 * still record errors via __ntfs_write_inode(), and the sync must
> +	 * evaluate NVolErrors() with the last setter already run.
>   	 */
>   	if (!sb_rdonly(sb)) {
> -		if (ntfs_sync_volume_dirty_state(vol)) {
> -			ntfs_warning(sb,
> -				"Failed to sync dirty bit in volume information flags.  Run chkdsk.");
> -		} else if (NVolErrors(vol)) {
> -			/*
> -			 * The dirty bit is on disk now; only warn when the
> -			 * sync actually succeeded, or this message would
> -			 * contradict the one above.
> -			 */
> -			ntfs_warning(sb,
> -				"Volume has errors.  Leaving volume marked dirty.  Run chkdsk.");
> -		}
> -		/* Commits the updated volume flags if they were written. */
> -		ntfs_commit_inode(vol->vol_ino);
>   		if (!NVolErrors(vol)) {
>   			ntfs_commit_inode(vol->root_ino);
>   			if (vol->mftmirr_ino)
> @@ -1840,9 +1827,6 @@ static void ntfs_put_super(struct super_block *sb)
>   		}
>   	}
>   
> -	iput(vol->vol_ino);
> -	vol->vol_ino = NULL;
> -
>   	/* NTFS 3.0+ specific clean up. */
>   	if (vol->major_ver >= 3) {
>   		if (vol->extend_ino) {
> @@ -1872,8 +1856,6 @@ static void ntfs_put_super(struct super_block *sb)
>   		/* Re-commit the mft mirror and mft just in case. */
>   		ntfs_commit_inode(vol->mftmirr_ino);
>   		ntfs_commit_inode(vol->mft_ino);
> -		iput(vol->mftmirr_ino);
> -		vol->mftmirr_ino = NULL;
>   	}
>   	/*
>   	 * We should have no dirty inodes left, due to
> @@ -1883,6 +1865,53 @@ static void ntfs_put_super(struct super_block *sb)
>   	ntfs_commit_inode(vol->mft_ino);
>   	write_inode_now(vol->mft_ino, 1);
>   
> +	/*
> +	 * If a read-write mount, persist the error state in the volume flags:
> +	 * mark the volume clean if no volume errors have occurred, and make
> +	 * sure VOLUME_IS_DIRTY is on disk if any have, so chkdsk runs on the
> +	 * next mount.
> +	 */
> +	if (!sb_rdonly(sb)) {
> +		if (ntfs_sync_volume_dirty_state(vol)) {
> +			ntfs_warning(sb,
> +				"Failed to sync dirty bit in volume information flags.  Run chkdsk.");
> +		} else if (NVolErrors(vol)) {
> +			/*
> +			 * The dirty bit is on disk now; only warn when the
> +			 * sync actually succeeded, or this message would
> +			 * contradict the one above.
> +			 */
> +			ntfs_warning(sb,
> +				"Volume has errors.  Leaving volume marked dirty.  Run chkdsk.");
> +		}
> +		/*
> +		 * Commits the updated volume flags if they were written.
> +		 * The mft mirror must still be around for this: the
> +		 * $Volume record (mft record number 3, below
> +		 * vol->mftmirr_size) is mirrored by write_mft_record()
> +		 * through ntfs_sync_mft_mirror(), which fails with -EIO
> +		 * and leaves the mirror stale once vol->mftmirr_ino is
> +		 * gone, so the mirror inode is only released after this
> +		 * commit.
> +		 */
> +		ntfs_commit_inode(vol->vol_ino);
> +	}
> +
> +	/*
> +	 * Release $Volume while the mft inode is still available: if the
> +	 * commit above failed before it could clear the dirty flag,
> +	 * ntfs_evict_big_inode() commits the inode again on its way out,
> +	 * and __ntfs_write_inode() needs vol->mft_ino to look up the
> +	 * runlist of the record to write.
> +	 */
> +	iput(vol->vol_ino);
> +	vol->vol_ino = NULL;
> +
> +	if (vol->mftmirr_ino) {
> +		iput(vol->mftmirr_ino);
> +		vol->mftmirr_ino = NULL;
> +	}
> +
>   	iput(vol->mft_ino);
>   	vol->mft_ino = NULL;
>   	blkdev_issue_flush(sb->s_bdev);

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

