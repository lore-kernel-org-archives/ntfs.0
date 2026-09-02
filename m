Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20909337BAB
	for <ntfs@lists.linux.dev>; Wed,  2 Sep 2026 02:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314424; cv=pass; b=FppqhMJngC2j43wPxXLwkA2eCwfnfPnGRWYdUcSPiOlfbc2fIwnVrApL9lMTCPdtF8xm61ud+Z9Ajqs6p6kr2uwJU/LBqKjlfN3tRx1YtP23rKiMHtjIVDsyHadYnBHYJPivwmXguL0TCwVxBLKA343b8Wg0uHAzbM448+ES7wM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314424; c=relaxed/simple;
	bh=1oADZaik6pnkoG+ihP13J3amltU3W4R/mXTq0FvOI+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DPmBd3IM4aNtLPNtSHj/ras67d4HfOzAeiNVA8WDsm4LOgMgmaqmnFOHt58utRi1PTaySterah0S7fnLm0eLGzm97jQaw/VwoPgR1YgfgiA+LIk60KkHd2gh8Q6BYJpCyQrzZ6w7useadHcJdc+IOTnqkjj6MZP3dru7kIouan0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oEcXQbE/; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEcXQbE/"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b159850b16so427183e87.3
        for <ntfs@lists.linux.dev>; Tue, 01 Sep 2026 19:00:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788314415; cv=none;
        d=google.com; s=arc-20260327;
        b=iRh0EaWN6FZcRxH5S43e18obNZtBcK4zclrpYBjgiR2Dkwq1la735Ub9qpUhM5SgFX
         phNlwk6PXk2JOkEOhUtJMYLBCMn+E6vYGngoPi+DHJ6G3TDYMuA4EeX/93zBORjZfubI
         jNHl9Fb7NDTYT8Kom7RRKmjEbrZp7a6qQKYZIj9vKmSNmUnO94X6C752zEAsJujoRtd4
         d+nGdMkhZ4RFy2sdx9D8kqB8VDmjeXQaLDvz0AndcO7HDJQO/4/BDqmsxvAJj4I+vVgd
         zWj40V+a777GVYQIOIh2SPI3HxryXubxeD+YXQ2KEzVqFeeMg990uYaxFAcduf2zyxMv
         t3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FycLFIgmhdNfFE6Eim7od4aPHIzWQVdNcWKO38Md7VQ=;
        fh=eQLc8jMZpp/dvVoyYqukn3iJKJBJA+RN4P2wm7eeHaA=;
        b=l0ndbFwNVbw5JKuLo8WHJPTeo0xiC9rNrq+6h05cY29lC+98SSOQNeth1oB1sTWbgB
         GZMYKnaqp76uY+FZLsLO42d9e79glC7fN604lT9BwfpgnNwFVB14ndSs1I299ZAhiOCM
         HSZB/Op006ut5/L60Cn1HI6Vy8kafghpdwXIw2SWaVPneFoy7VpL4Zp8B9/s9Y9xfSde
         cm8ht7xeja08zQPi4svjRMILv/tsHQMZp/uzpdJd8NF9k1zi2Xk4BxJ3b2fIiMo9cvCu
         XXf9cMIuB/eoug0Scz/28rfqtDUyuo5tVWq/NZLZ8fiQ/zXv/BAEYGnrxfx4SfUuPf/J
         llpA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788314415; x=1788919215; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FycLFIgmhdNfFE6Eim7od4aPHIzWQVdNcWKO38Md7VQ=;
        b=oEcXQbE/MWQUWIRVJcIiAOMdLOAlixTFYCbcrgfTP2/e/XGWRZG4KicpuNt7HLa196
         7fP58UTmPNUA/wUEzJcSLaKumFKODtQsDgqZcnumkO+1DL+J3Ios8zr8QPWTiSiqUOhP
         7GGZTpRtFQuxifWlauNnIOpA/alknr9V86UW0bxnlI0xlANnf5GAayNYLSD+71QBBbdv
         egi7XnQLVi6QxcB2edpg/RFycqp81JvBFUM5Sywf0LbQvytXRIwDlQ0HrRAPq9BxT2mp
         SvkSbE4q+V4LivPKyzZ4XWqLHozcUjRmrTQGR3qO/beDEUwawhCgTeGzSIUg3KF+fo+t
         A7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788314415; x=1788919215;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FycLFIgmhdNfFE6Eim7od4aPHIzWQVdNcWKO38Md7VQ=;
        b=gUBZqngmgrwaZOkOvF1SkeUse/wsra4n4xUpdug7aL93AYvqcsnoxmlrp3uFQyOSJK
         wUE2YzG2sNa+HKZqeGD6/dy8VcH47m7DXgUli82x8lhVUkHjwGpEYkCknX7+J5MUCD49
         6/wmhN3G0aQcfGYBleJK4/l49rcnxvhUV1o3P3ZbTWozp287WY0afyCqMMK6Vv0G52I+
         XH+ZHgwAp2zfZSklCyDaGyv0rdIrzTOQJxWlrB+3G1TH3FZ457JHSM2i9BirvdG8IgQ/
         AwfMJsowCzfKChM7a38fLY/gbOBLCEkA3m7K1xR992KZP9CA/IJhxF4VrVtZvO4yLQY0
         u5CA==
X-Forwarded-Encrypted: i=1; AKwUvBwh/iSa3SKDEoE2hHWtgj3pxqghFm0hQsCDJJjI+euOMWmhvDttSSpANm9C8pa2dhEM218Q@lists.linux.dev
X-Gm-Message-State: AFuF++m/aLsx9PXxCB7Ojq1RAjEw1aE56z2490I7mNJujJVXGceeWAzG
	CcpB1g4JgllcSdebmMGlDDoynf5ME8WTLJZQRtWYBUizlK5Tsh/BhQ8cfAVHRajmG19TjP5yX5A
	ikBv++4xTVadYgEjxeUf2Yn/Ce2CdtDg=
X-Gm-Gg: AYBFou0svp8yZVAuxtc9rWjaQO8WRmYubyBX+SUGF9ZgiQyxFoktZ/1Hq/VWgzkxfvB
	cg7b3s7pEfIUrSNrYJcYsVpjzGXFRN1U2gaQGx8ragfp0d8pzL2ylfL5RDndBNREseCd84T/SuG
	LZ2715blE693AM+KOhUh1o75IpF2ZhtMbf+dMhuKbF9Q01a3Tz/ojeqYSbTtqv1Nnv3aWqDeyXq
	HZEPoUEQZ1GCkZBJW0Eso4KpzL3YEJHWMgcV3AST0WvTKEMe3SJrAcVYKU2LoJfi8W0rfdBKTPD
	racm8sHCMTWsTz2MqU5D31JPNoCVxagCWPMo5WX2cuSr
X-Received: by 2002:a05:6512:b8f:b0:5b6:423:7f11 with SMTP id
 2adb3069b0e04-5b6087cf8cdmr424424e87.31.1788314415027; Tue, 01 Sep 2026
 19:00:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901091519.2885376-1-liubaolin12138@163.com> <20260901091519.2885376-2-liubaolin12138@163.com>
In-Reply-To: <20260901091519.2885376-2-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Wed, 2 Sep 2026 11:00:02 +0900
X-Gm-Features: AcwNN1Urt09KpsBbaUWi0KSrWxgWovvBVLS3g_-98g_dNLNQJdyHnSAOUCYf9Vw
Message-ID: <CANFS6bbVu2mrQXtKJfokDA=6ajReH9Xmm9OA1zVDzQhafHy0mA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ntfs: implement fileattr_get and fileattr_set
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

Hi Baolin,

> +/*
> + * ntfs_fileattr_get - inode_operations::fileattr_get
> + * @dentry:    dentry to report the flags of
> + * @fa:                filled in with the flags of @dentry
> + */
> +int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
> +{
> +       struct inode *vi = d_inode(dentry);
> +       struct ntfs_inode *ni = NTFS_I(vi);
> +       u32 flags = 0;
> +
> +       if (NInoCompressed(ni) || NInoWofCompressed(ni))
> +               flags |= FS_COMPR_FL;
> +       if (NInoEncrypted(ni))
> +               flags |= FS_ENCRYPT_FL;
> +       if (vi->i_flags & S_IMMUTABLE)
> +               flags |= FS_IMMUTABLE_FL;
> +       if (vi->i_flags & S_APPEND)
> +               flags |= FS_APPEND_FL;

It would be better to set FS_CASEFOLD_FL as well.

> +int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
> +                     struct file_kattr *fa)
> +{
> +       struct inode *vi = d_inode(dentry);
> +       unsigned int new_fl = 0;
> +
> +       if (fileattr_has_fsx(fa))
> +               return -EOPNOTSUPP;
> +       if (fa->flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL))
> +               return -EOPNOTSUPP;

> +
> +       if (fa->flags & FS_IMMUTABLE_FL)
> +               new_fl |= S_IMMUTABLE;
> +       if (fa->flags & FS_APPEND_FL)
> +               new_fl |= S_APPEND;
> +
> +       inode_set_flags(vi, new_fl, S_IMMUTABLE | S_APPEND);
> +
> +       inode_set_ctime_current(vi);
> +       mark_inode_dirty(vi);
> +       return 0;
> +}

Currently, these flags are not written to disk.
I think that we should store them to disk or
reject them.

-- 
Thanks,
Hyunchul
