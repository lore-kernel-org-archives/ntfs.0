Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AFA36EAB0
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 05:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266020; cv=none; b=BFrEWy70V7+2w+1Yzwj70CM3bXoHZmImYJON4mu/pPugvyo563KT8xGbB2vERzpXqlhbtYAPitrsB3Z//Y0Ak0JrqEQux6Yu4/yoZ5z8W+It+PsOxezpO5+kTjOLdS9P91zOWqTNc3fZA7HeAXuJxKACDrWgv/H7rLzBXpu4yz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266020; c=relaxed/simple;
	bh=My/fORUKZgbhPcKtFojcsvPV7jhgh3rAkw1XdxaJxA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIp1vkfkr/lUMQVf0EXTq0nfxNYLbpizF39y756H6rGiN6g+N2R1oUTmCPsJKk17EjvB9rWnLZIUB39bOX+6OAYJNXTvT+HwVMMWhF/o5hw8+KhvUYbCL+HT/Y3f8L1VrziIdazmRRtNSCa9gLFG576PiIh7ht0mqRzmgFW8EpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgvvRt9R; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgvvRt9R"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-888b8fe095aso920943b3a.2
        for <ntfs@lists.linux.dev>; Mon, 05 Oct 2026 22:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266018; x=1791870818; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aW12SFpvFc1iSA1EJus8VaKRrWk8UTqkcWWYajxdsok=;
        b=SgvvRt9R0vHqyPcg3mc2NasIFfmaJFqfjuHd/lwPTT2NR3t69UfV+E/ATIG8gnEwF1
         u1cLvrsYsZS0quhFj/vPWY6JCWImuJIEqsL5LrIdvqOYB3eOmKy982WsSqpFMHJ9GQwJ
         kxycn+CTx7x6nT6ONiI4bFA3HTZ4Xm4Ti3f46LsBevjfgunRo9ax4+9ySP9hMIAKAxLz
         uG+kERoKbzjZWu/GKO7eJ84Vhk346qeXbK6BtRKv2RgRhJhevZulWqCNVBgtUKCBdUKd
         P/mb5mUy21Q3z00vTyh2cR6BtLVw74v+LjzGyIv7OPbL/QZmLBSZ9s+cfztFJRmobrnk
         +Rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266018; x=1791870818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aW12SFpvFc1iSA1EJus8VaKRrWk8UTqkcWWYajxdsok=;
        b=ojKgWiLYAafFECcGwxmUo+bDVp8XlaX6Gq/3iD9um1xCFead7UBSEpu9DpCqDc/ghG
         uUSr9pQPjmOZQTxWhSowMgbcKCYKzHbowygSWZAapyfRHjWeng/fxyTHKHXEnPip4FWT
         a7Mz1uRRU/HV/hLrcG8lnWwcOZ2QK3To3IQ1qZkJ7OEp6HZqDvSXpRTLEVaN+d7LJdgT
         /yUtIG7eMpZo6TG1a+JxoKChkoXWN4PO3Mgr5sYofEfrxHlthOamlV4Jb4SRzCvd8cMV
         Gh2S4Gg/2/Lzl7iDHZgzAB8lsvWx5xKQdHXqY9ZhKlqDTyk3HlSAgyzf3TUtHfAuIUjB
         Qstw==
X-Forwarded-Encrypted: i=1; AKwUvBx77MuwCoj/OVIBjfeTP5WFaftBGYzefp7uyF8XseFI7agbFeuBAqLZqMohk4BfXNskbmVP@lists.linux.dev
X-Gm-Message-State: AFuF++ntPPIb6Ij4nMagzqE93l2gwRUjOVwpKYYa82LWs+xOg56y/bKd
	fN9Ss9tuGEceZTiPusia+jXJmok5bYaUEM89K4opRmSn2e2gN4oBQV1C
X-Gm-Gg: AYBFou0rHOj0uly8jEp4pYYERD1YNgsCmBkLzctwa3RVlNEnJNeJGC7PnHPxjyQseY4
	IFqO0iFyiDtpANvEqt5CZuSJIlNc92NOViLMtvgw03UeAL8+oTc8ZGziC/lyKZ56ng/Md2YCE/g
	7wr4gKOK31diVabee7j3cao3IUyWHnh8WB9RwLAQGSSeETkpDU2sYoE4n+gOtf1e6W8Hqn37ssd
	UGLlCer1dI+wWHl7Or+ImGVSq0WyrEAxqQXVvtvmj1clavzVerh1betyWALLI9GCEpXJRlhua1R
	y7jMT71MnajkFXrMYa6GiKz1/XlcEfcmhvEp7GtJ31oFjHam2fvVxEuz0UthfV+TNqg/FfL6I+W
	8yYO7uNGZhDf5LDPWflmPTZ9TbLCnrkUzKeiuLxQqlcZ/EhqyqSQWMeRWiGFfV5kOPZXCdbiLgF
	UIFGezD+s92WvXyzZCE0eQDKkX+zfHHVEjCSk8mo1RLmcaVvF02vhSh1U0+unLnppHQSIeOK4=
X-Received: by 2002:a05:6a00:2d8b:b0:882:94ab:20f6 with SMTP id d2e1a72fcca58-890dba87bd6mr367008b3a.1.1791266018130;
        Mon, 05 Oct 2026 22:53:38 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0cb76185sm4247213b3a.46.2026.10.05.22.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:53:37 -0700 (PDT)
Date: Tue, 6 Oct 2026 14:53:32 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH] ntfs: handle a failed size rollback in the write error
 path
Message-ID: <asSM3LZyQymjjuj8@hyunchul-PC02>
References: <20261004024822.640574-1-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004024822.640574-1-zenghongling@kylinos.cn>

On Sun, Oct 04, 2026 at 10:48:22AM +0800, Hongling Zeng wrote:
> ntfs_file_write_iter() extends the data and initialized sizes before
> it copies the user data and restores them when the write then fails.
> The restoration is best-effort: both results are discarded, even
> though the extension is already recorded in the dirty MFT record.
> When the restoration fails too, the extended sizes reach the disk
> while the VFS inode keeps reporting the old ones: after a remount the
> file appears grown again, with an uninitialized tail where the failed
> write never put any data, and nothing records the failure.
> 
> Keep both undo results: on failure, set NVolSetErrors(), which the next
> persistence point persists as VOLUME_IS_DIRTY, and log a message for
> the errors= policy.
> 
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>  fs/ntfs/file.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 3ec82715a588..b5b30e44ac51 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -678,14 +678,39 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  				&ntfs_iomap_folio_ops, NULL);
>  out:
>  	if (ret < 0 && ret != -EIOCBQUEUED) {
> +		int undo_err = 0;
> +
>  		if (ni->initialized_size != old_init_size) {
> +			int init_err;
> +
>  			mutex_lock(&ni->mrec_lock);
> -			ntfs_attr_set_initialized_size(ni, old_init_size);
> +			init_err = ntfs_attr_set_initialized_size(ni,
> +					old_init_size);

I think the rollback needs to distinguish resident and compressed
attributes.
If the data attribute is still resident,
ntfs_attr_set_initialized_size() always return -EINVAL.


>  			mutex_unlock(&ni->mrec_lock);
> +			if (init_err && !undo_err)
> +				undo_err = init_err;
>  		}
>  		if (ni->data_size != old_data_size) {
> +			int data_err;
> +
>  			truncate_setsize(vi, old_data_size);
> -			ntfs_attr_truncate(ni, old_data_size);

> +			data_err = ntfs_attr_truncate(ni, old_data_size);

And ntfs_attr_truncate() always return -EOPNOTSUPP for a compressed
attribute.

> +			if (data_err && !undo_err)
> +				undo_err = data_err;
> +		}
> +		if (undo_err) {
> +			/*
> +			 * The extension is recorded in the dirty MFT
> +			 * record already, so a failed rollback leaves the
> +			 * new sizes on disk while the VFS inode keeps
> +			 * reporting the old ones.  Record the error: the
> +			 * next persistence point persists it as
> +			 * VOLUME_IS_DIRTY.  Run chkdsk.
> +			 */
> +			NVolSetErrors(vol);
> +			ntfs_error(vi->i_sb,
> +				   "Failed to roll back the size update: %d",
> +				   undo_err);
>  		}
>  	}
>  out_lock:
> -- 
> 2.25.1
> 

-- 
Thanks,
Hyunchul
