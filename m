Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386D747ACC7
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 21:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593542; cv=none; b=Ga83LN+/tp4ttpNSXwl2sqE26IA6nV3bw049X7+sq48P74L13Q49xXvZNp4JzqSmnUv50+Yyi55WxImhwmTNWpl01MmsYpGSR/Glq/q9kfXnTA74VP+xkM+XzKnjzGwnd+kyMSot+eg7YrbK4BFbwBCsF8+kqysDlmUQsB9nn+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593542; c=relaxed/simple;
	bh=zXDJuJB/O0iIaGyq0VHQ35mZi8v73zGNbYzjjTH9Igs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLYpezTaooJVRSKkM+lDe18AZswKUPTTx+9tlyVtK1agsCod7uyFxAxdzsCHxcb4WbRxsbjQDFyHKY3HvVgae7Qwv/Fr1lQHrnkRfDhfIzCGTWI5zzYMVqon6zYQRwRmTWG6AzoZFVJDCxk9ooFtEz2tfFDTJ5TGRm2MUINdaiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Fph1bYti; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Fph1bYti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=Mhm0Cqv9nr0dnfojm5BB9FQ3ji0Ip1DTJBZdypnLaCg=;
	b=Fph1bYtijkjf714mS8uW+mKvT2gphlbuMbU1p/9jIF05bRCcEf1vrO9/qbupYV
	OaNMBisLAuAaQvoUJWqvs4XWnub/ozXIGF7AEWecJwxfKWULJXDkALPvTCwY79TT
	MpUDjO33yS1X7GzzzCGasDXO5yAIBxL7Sl+FrJv2UlvhA=
Received: from [IPV6:2409:8900:21a7:a33a:b45d:31d1:c098:7d46] (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3f8KrB6tqSyo9BA--.43583S2;
	Thu, 17 Sep 2026 05:18:36 +0800 (CST)
Message-ID: <3e9cb05c-8790-4ccb-a435-2013c474b06a@163.com>
Date: Thu, 17 Sep 2026 05:18:35 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 7/7] ntfs: fail remount on sync errors and keep the
 dirty bit on SB_FORCE
To: Hongling Zeng <zenghongling@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, stable@vger.kernel.org
References: <20260915083252.812126-1-zenghongling@kylinos.cn>
 <20260915083252.812126-8-zenghongling@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260915083252.812126-8-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3f8KrB6tqSyo9BA--.43583S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF1UJr48Cw47Cry5GrW5Awb_yoW5GF1DpF
	y7AFn8GayktF17Cwsa9FWftF4rur97Ca17K347Cw47XwnYyrnFyr18tryrWayxJr9Yyw4r
	XF4vkrW5KF1DZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UaksgUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwgxyPWqrB6zHcAAA3c



在 2026/9/15 16:32, Hongling Zeng 写道:
> ntfs_reconfigure() currently ignores sync_filesystem() errors, allowing
> a regular read-only remount to succeed even when dirty data was not
> synced. Check the error and fail regular remounts, leaving the
> superblock read-write so ntfs_put_super() can retry at unmount.
> 
> SB_FORCE does not wait for writers already in progress, so it must not
> clear the on-disk dirty bit. Warn and continue on sync errors for
> SB_FORCE. A forced remount updates the dirty state only when errors
> have been recorded, and never clears the dirty bit. Skip the commit if
> that state update fails, since the in-memory flags may be inconsistent.
> 
> Reported-by: Hyunchul Lee <hyc.lee@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>   fs/ntfs/super.c | 27 +++++++++++++++++++++------
>   1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 0228d7429596..82b5bf28b6ab 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -272,7 +272,13 @@ static int ntfs_reconfigure(struct fs_context *fc)
>   
>   	ntfs_debug("Entering with remount");
>   
> -	sync_filesystem(sb);
> +	err = sync_filesystem(sb);
> +	if (err) {
> +		ntfs_warning(sb, "Failed to sync the filesystem.");
> +		/* A forced remount must still turn the superblock read-only. */
> +		if (!(fc->sb_flags & SB_FORCE))
> +			return err;
> +	}
>   
>   	/*
>   	 * For the read-write compiled driver, if we are remounting read-write,
> @@ -329,11 +335,20 @@ static int ntfs_reconfigure(struct fs_context *fc)
>   		 * or flush fails the remount, leaving the superblock
>   		 * read-write so ntfs_put_super() retries at unmount.
>   		 */
> -		err = ntfs_sync_volume_dirty_state(vol);
> -		if (err) {
> -			ntfs_warning(sb,
> -				"Failed to update dirty bit in volume information flags.  Run chkdsk.");
> -			return err;
> +		/*
> +		 * A forced remount does not drain writers in progress,
> +		 * so one may still be modifying metadata when the flags
> +		 * are committed: never clear the dirty bit then; if
> +		 * errors have been recorded, the update preserves or
> +		 * sets it; otherwise, skip the update entirely.
> +		 */
> +		if (!(fc->sb_flags & SB_FORCE) || NVolErrors(vol)) {
> +			err = ntfs_sync_volume_dirty_state(vol);
> +			if (err) {
> +				ntfs_warning(sb,
> +					"Failed to update dirty bit in volume information flags.  Run chkdsk.");
> +				return err;
> +			}
>   		}
>   		if (NInoDirty(NTFS_I(vol->vol_ino))) {
>   			/* ntfs_commit_inode() would discard the error. */

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

