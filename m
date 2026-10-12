Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C774772A5
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 09:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798596; cv=none; b=UJGordumAuaQDunsJlEejhARfEPtaiG19uVY45HEWwq/1wGEBJ3ksnzM4HVY3vaDO2jXJ5Cev81IKKsHr0ur75LpE7ZhGsYNMQOIUCRdMk0U882kS8zUzxpkWNnJv2bIp/L2ulacjx7SoN3ODsuKD6pKEx4k+2oYuxP9f3Y/i+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798596; c=relaxed/simple;
	bh=tquEmo3gl+DNuEdBkeQmX5Ac3hcWeJexs8oMeBPJW+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QALcjXstgeF3uaQlzkvw+GkED/jo33TCYv5oMDQG3vfQ2/rzHz0Vw4MD6pDniSh2sQalMnJ0zIkNk9njHWWfwIKvfItKVl2CZ4sRgF2ty2JlCRvfgboEpyOc18uIl6mP+L2eCE9USM8Hnzo00FkcdafThpDf9alBUmdBQ/yXyT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GaitvKMW; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GaitvKMW"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso550317a12.3
        for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 02:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798586; x=1792403386; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W79TeYdawJl05fpvMEHv8uRrqzpyiJUu8pXbceDlpDs=;
        b=GaitvKMWuW/qUkm8zILogwmEfWYc52Fffx4r+6gqUDpij/wzgY7lUts+jvlLVqw/5r
         esJGZ2k1b9b9lO9YWpOOGqYNVZMmIk6GY1ZfNR8uKAZ0SlvaLAakgZR4dXdjLq3CXrA5
         D3m6YrusVpS6r2eD7o6VtW6oyPsdC6CAQyS4xU7jwb1FyROSptszv11CR0+v0psS/x8B
         hv0zo/y/DnqOXyI0aewqpmQyXpZCqBiW7unge+q2Vt/2Lg7+1mbeqjfhxO1j0RwR1c5K
         UgUEBt+gpZNk3PDSppFa+PctXyDoj0Pjo/I+aZv2K3lGWaTG3TiidVUHp/qQQUnbmYEj
         L70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798586; x=1792403386;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W79TeYdawJl05fpvMEHv8uRrqzpyiJUu8pXbceDlpDs=;
        b=K0FZ70cWB2fx0Uyd/VsEu6HSUrzkGTKODHgfdMh2KQOIr9IW51OLY9PyFIM11XOYBK
         NLrMu7B3/Lb6U/mA6NU+cg2BKjLPCc5FN3vpz7+ZNcndPJyNTUNGpYV08QmYdLgPO1LW
         acQW1ILeldsM0Z8HqztwgOWkRUMoyTNscBapZoA+tDCrbPMzRt6yfs0i8a1KdV8Fc6yI
         OrKvnbo/TPMHIgirvd/d3A6MdybKtyYuN3jORDgOa89eg5fvs81OPC7VHTElos24P4BJ
         OV+NdDnuhyxnYgUIi23J/MuZZvmtPNnWhHdCLNAsWLu5ATM2gatbdZ2oW2pBQmAhWyrr
         zbSQ==
X-Forwarded-Encrypted: i=1; AKwUvBws9sVXXSkmvMDZvjr4fNx+sUk9jAvDgI0NAJZ8ebSjFhnavF/ucetzYkGRVIwLD+rJrCEZ@lists.linux.dev
X-Gm-Message-State: AFq9FYKFPhIU7Pciu4mXwKWBpMzWd0Fvnyzv880fFSZuZdANumhI3EPh
	uuFBS1gPk+MThSHiuqrddcG8mxXxFYPY6/EygExnwitw9+EcAjgiIkL6
X-Gm-Gg: AYBFou2v8R5ZE4SW+OaXQUdoEZ1ck08bvSINaLR6CGgdovERv21sRNdu0VhyAFfTfRK
	0EvdrxCEx0EPq5uxEZKUjG2cgA7t4a+exSg4wSu/DLgFv3iFVcvoQCC2N0RsKZYB88RdmWatOmD
	j91fV56cZNSEJ9G6OUynlUUqXnaPkJ7BOKaXS/SOHBvihAIh3O9vf85KVgx3B2lDW2YExLRtAji
	Ky9Dyc0qEzGnEVkbqwBQ5leDAoO36miYWEYdtWt85QFRbTiUnpVqkLjddaMbNlIa9FKOQWByuvT
	6lVo2O5t0P5IcxglqljTsoLYzreFlXR1CEG8xCbrS+Tg51LsTgZL1zLmF9NOFrgLUdhOSGU/03L
	9zCWlvAV92FACOBQ65gM0UmYqbeWCKMNm5Q1CE8naxt8xfoO4CVJpFRYqmoEb8JHYi7T6gcdloa
	BJH1/xmmr0wv/GpN5HSj+CkvZdk1qLa7sT0hajRWbzn2Vny92D1hZaOqWVMWF7
X-Received: by 2002:a17:90a:d2c7:b0:3ab:1b19:78f0 with SMTP id 98e67ed59e1d1-3ab3a8e1d1bmr7225596a91.41.1791798585771;
        Mon, 12 Oct 2026 02:49:45 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9639bsm15214275a91.4.2026.10.12.02.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:49:45 -0700 (PDT)
Date: Mon, 12 Oct 2026 18:49:42 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v4] ntfs: roll back the ACL xattr commit when the WSL
 mode update fails
Message-ID: <asytNg4xTuvkSxa-@hyunchul-PC02>
References: <20261012073452.90099-1-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012073452.90099-1-zenghongling@kylinos.cn>

Hi Hongling,

On Mon, Oct 12, 2026 at 03:34:52PM +0800, Hongling Zeng wrote:
> ntfs_set_acl_ex() commits the ACL xattr before it rewrites the WSL
> mode EA, and removes it again when the rewrite fails.  That only
> undoes a set that created the xattr: when the update replaced or
> removed an existing one, the old ACL is discarded along with the
> failed update.  The undo result is discarded and the EA paths record
> no error state, so when it fails too, the new, typically more
> permissive, ACL is left on disk while i_mode, the mode EA and the
> cached ACL keep the old values.  Once the stale xattr is loaded again
> after a remount, a chmod 0640 -> 0777 that reported failure leaves
> the file accessible to the relaxed ACL while stat() still reports
> 0640.
> 
> Save the previous xattr before committing the update, and restore it
> when the mode EA rewrite fails.  A removed xattr is restored by
> creating it again: the removal dropped the entry, and XATTR_REPLACE
> fails with -ENODATA on a missing entry.  Remove the new xattr only
> when there was no previous one, and skip the undo when the commit
> changed nothing, e.g. removing an xattr that never existed.  Fail
> the update when the previous xattr cannot be read back.  A failed
> rollback is still recorded: NVolSetErrors(), which the next
> persistence point persists as VOLUME_IS_DIRTY, and a log message the
> errors= policy acts on.  The flag cannot be written to disk here
> directly: the target inode's mrec_lock is held and the $Volume
> mrec_lock cannot be nested under it.
> 
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
> Changes in v3:
> - Save the previous ACL xattr before committing the new one and roll
>   back to it when the update replaced an existing one, instead of
>   removing the new one (suggested by Hyunchul Lee)
> - Fail the update when the previous xattr cannot be read back, and
>   restore a zero-length previous xattr without XATTR_REPLACE
> Changes in v4:
> - Undo a removal too: restore the previous xattr by creating it
>   again, since the removal dropped the entry
> - Skip the undo when the commit changed nothing, e.g. removing an
>   xattr that never existed
> ---
>  fs/ntfs/ea.c | 90 +++++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 86 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
> index 1104fd72cd2a..0577a2adc365 100644
> --- a/fs/ntfs/ea.c
> +++ b/fs/ntfs/ea.c
> @@ -1038,8 +1038,10 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
>  {
>  	const char *name;
>  	size_t size, name_len;
> -	void *value;
> -	int err;
> +	void *value, *old_value = NULL;
> +	int err, old_len = -ENODATA;
> +	bool old_exists = false;
> +	bool acl_committed = false;
>  	int flags;
>  	umode_t mode;
>  
> @@ -1083,7 +1085,40 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
>  	}
>  
>  	mutex_lock(&NTFS_I(inode)->mrec_lock);
> +	if (!init_acl) {
> +		/*
> +		 * Save the previous xattr so the update can be
> +		 * rolled back to it when the mode EA rewrite fails.
> +		 * A new inode cannot have one yet, and one that
> +		 * cannot be read back fails the update.
> +		 */

Could you shorten this comment? I think that the explanations are already
clear from the code.

> +		old_len = ntfs_get_ea(inode, name, name_len, NULL, 0);
> +		if (old_len >= 0) {
> +			old_exists = true;

Could you remove the old_exists? we can use old_len >= 0.

> +			/* kmalloc(0) returns the non-NULL ZERO_SIZE_PTR. */
> +			old_value = kmalloc(old_len, GFP_NOFS);
> +			if (!old_value) {
> +				err = -ENOMEM;
> +				goto out_unlock;
> +			}
> +			err = ntfs_get_ea(inode, name, name_len,
> +					  old_value, old_len);
> +			if (err != old_len) {
> +				kfree(old_value);
> +				old_value = NULL;
> +				if (err >= 0)
> +					err = -EIO;
> +				goto out_unlock;
> +			}
> +		} else if (old_len != -ENODATA) {
> +			err = old_len;
> +			goto out_unlock;
> +		}
> +	}
>  	err = ntfs_set_ea(inode, name, name_len, value, size, flags, NULL);
> +	if (!err)
> +		acl_committed = true;
> +out_unlock:
>  	mutex_unlock(&NTFS_I(inode)->mrec_lock);
>  	if (err == -ENODATA && !size)
>  		err = 0; /* Removing non existed xattr. */
> @@ -1095,8 +1130,54 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
>  		mutex_lock(&NTFS_I(inode)->mrec_lock);
>  		err = ntfs_ea_set_wsl_inode(inode, 0, &ea_size, NTFS_EA_MODE);
>  		if (err) {
> -			ntfs_set_ea(inode, name, name_len, NULL, 0,
> -				    XATTR_REPLACE, NULL);
> +			if (acl_committed) {
> +				int undo_err;
> +
> +				if (old_exists) {
> +					/*
> +					 * Restore the previous xattr.
> +					 * A removal dropped the entry, and
> +					 * XATTR_REPLACE fails with
> +					 * -ENODATA on a missing entry, so
> +					 * create it.  A zero-length xattr
> +					 * cannot be restored with
> +					 * XATTR_REPLACE, which would
> +					 * remove it again.
> +					 */

And I think this comment can be reduced.

> +					int undo_flags = acl && old_len ?
> +						XATTR_REPLACE : 0;
> +
> +					undo_err = ntfs_set_ea(inode, name,
> +							name_len, old_value,
> +							old_len, undo_flags,
> +							NULL);
> +				} else {
> +					/*
> +					 * No xattr existed before the
> +					 * update, so remove the newly
> +					 * committed one.
> +					 */

This branch is self-explanatory from `!old_exists`. 

> +					undo_err = ntfs_set_ea(inode, name,
> +							name_len, NULL, 0,
> +							XATTR_REPLACE, NULL);
> +				}
> +				if (undo_err) {
> +					/*
> +					 * The xattr change is committed
> +					 * already, so a failed rollback
> +					 * leaves it on disk while i_mode,
> +					 * the mode EA and the cached ACL
> +					 * keep the old values.  Record the
> +					 * error: the next persistence point
> +					 * persists it as VOLUME_IS_DIRTY.
> +					 * Run chkdsk.
> +					 */

Same here.

> +					NVolSetErrors(NTFS_I(inode)->vol);
> +					ntfs_error(inode->i_sb,
> +						   "Failed to undo the ACL xattr: %d",
> +						   undo_err);
> +				}
> +			}
>  			mutex_unlock(&NTFS_I(inode)->mrec_lock);
>  			inode->i_mode = old_mode;
>  			goto out;
> @@ -1109,6 +1190,7 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
>  	}
>  
>  out:
> +	kfree(old_value);
>  	kfree(value);
>  
>  	return err;
> -- 
> 2.25.1
> 

-- 
Thanks,
Hyunchul
