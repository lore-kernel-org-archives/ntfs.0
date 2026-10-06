Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BF92D2394
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 06:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266654; cv=none; b=HxoDCQgbjEeECgCGDqeqR3LkgvBFiWrpa4DiFIYOK3LAz8vX66WhBOorabKsODsBtjZoKK9xbWXKGIynlpEfMcIsKkNwzuPeGUfO64KrEk0gdukgFNx6j2+MdHVYcUYQU0+nxZ5ab+PctTaSew1nTiIlAB/kaHP3teJkCE84u1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266654; c=relaxed/simple;
	bh=BNgmcKSZXcGUVU8k7WxmELTXP/8N0YkOdPBXblP3Yeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6rsrVNB6vOSW90gh76O3+ecHefOkuZfhM0nuT4q6pnRWIVoEFUJ3GzhHjnljNyejdsO9HqT2UMHlOseet4zmbHIRjiMm/bCcwJJBkfqtBI/gz/Tgy5/qjfq2SbTlndiGJFE6nI2oZmBXUD1CKK0pg1rutjJCE4UpGhZMYGcx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVOMiewI; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVOMiewI"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4b5bdd578so91504a12.2
        for <ntfs@lists.linux.dev>; Mon, 05 Oct 2026 23:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266652; x=1791871452; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UV1Wpg++CLTH0y2WXLJtTkZDyBO1kADLVwQMoaPRuB8=;
        b=jVOMiewIGjOCBxYaslGEH7kR/7FWQSNlBqYQ0YeTLJuUbOaWhWHHB3yXeY18yBTB2f
         jlQNFhP4Jdb9DvZIwvk1l9wh+2X8uD1ounqDV2ZpYD00VTqYaXDEG3e3sCSE575W4h2C
         c2uqrHN/wm8RpfAeVjBdG6JbxZrwX7sm7bAmDJW13Tmqwd5DE4uzGm8H4AELIaDk70rK
         aJU2j1mRq375iaEq8UNv8NQshYW+sOXyisGMvEMWhi5sk4aOGpBm6d/PD6bL8V5PCMOl
         81U+1XXcmvHsaJFtUQuYOvJja5gwZAOXow4dXOxXdfffEzkhA/+cIqBLYjbTclaVae13
         QpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266652; x=1791871452;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UV1Wpg++CLTH0y2WXLJtTkZDyBO1kADLVwQMoaPRuB8=;
        b=bzc1Y8vWxAFqzSkWjnXVZtye0b2QYfGV3yrKFawHAXfWFOn3tzN089629qTuAPilCn
         q46HqstBgMR1TZtkiayropO5JZPmTSn313IKunZys4tIAh7V1/MGHOSfSLd4ywT0SSaj
         56BNAIozyJHzzDnQqaaslOLJfRlJEkTvvY/N676z68aqLN3qMUqc7o3cnMlys9vMWD4i
         tSbqwvAxbayVdIrE+mVYuIvpH/9XpKZI76PFNW78/V6vav1hf0mfiJwCFdfAZan8eSUu
         FCK8G+E30TaHqfmnj+cpHk/2RvOyJTlXXw9XWKrAhw5LcRcnpVwGZlgkw1+Z9xalHVtC
         qnKA==
X-Forwarded-Encrypted: i=1; AKwUvBxfnIVgReFOHFZcc9ykd8VRbUPyylNcjAWRV6ow9E8DQv4UeLCEwO2ymlZA1fd4TAzSxnG1@lists.linux.dev
X-Gm-Message-State: AFq9FYIDBhZPlsI0IjX4f4V9VDvxClFyc0JDg+iNZmq23LYUjuTbpEJC
	iyNEThsDk92LIeZJ0u2RJU/34KuBH/HEunpLiIrmlvvziUi0CVZGEdKH
X-Gm-Gg: AYBFou3yEozIOryN0i+wvKuzQQ6EEyEorcTppkOR1kBv6sPHllx5SDK6aj+Ja9Cq8ZJ
	ibCE4+MfJET8bTOURYBP7bmq7X0iGR08mBKqCJpzbjxCFmE60+28eiNbodbmhJBw9zsIE18+ToT
	Qiy9jeHkLdrqOu7Wahf1UcQUU1qCmLPJcO+0VtMiQQHhB314XC0xbeUW+yxvn+XZiabZU/xB0M/
	EqpopehTgXcQYDNcMWdaoe2WB8gD7sQlsMcIen+8MtD8EgvB1Xg+rQi5XBH8/FeduiCfgdINzWl
	K4bEicipXqVbQ2SZTN1N711AQXsq9Uad6+pxDeFF7tPOOxY51+0CHfU4vPRhNLHR6g/Xm96kISw
	g+CFWBNqJ9qK9i/grpoNqoiSgrBUJpc33KjsVOU/1xbi/+brOllVrUxmg2843SKqBxLDBoXm0KT
	YE1FsWNiAfer0rFtPo5+AD4BrJ0+xccntp4xExv6Reh2vo+Nu0NW0t7SBeO+n9
X-Received: by 2002:a17:90b:3cce:b0:3a7:ee74:e8d2 with SMTP id 98e67ed59e1d1-3a87354e80bmr139385a91.25.1791266652342;
        Mon, 05 Oct 2026 23:04:12 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a79e7c243csm6954884a91.0.2026.10.05.23.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:04:11 -0700 (PDT)
Date: Tue, 6 Oct 2026 15:04:08 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ntfs: fix two kmap_local bugs on 32-bit kernels
Message-ID: <asSPWFQM60is9C0-@hyunchul-PC02>
References: <20261006045136.5911-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261006045136.5911-1-kmehltretter@gmail.com>

On Tue, Oct 06, 2026 at 06:51:34AM +0200, Karl Mehltretter wrote:
> Two kmap_local bugs in the mount path of fs/ntfs. Both only show on
> 32-bit kernels with HIGHMEM, where kmap_local_folio() hands out fixmap
> slots from a per task stack of 16 entries. multi_v7_defconfig enables
> both NTFS_FS and HIGHMEM, so the stock 32-bit ARM configuration is
> affected.
> 
> Patch 1: check_mft_mirror() unmaps pointers that were advanced past the
> end of the page. On 32-bit ARM this clears the wrong fixmap entry and
> the mount dies with a BUG a few calls later. syzkaller found it on a
> multi_v7_defconfig kernel. A fresh mkntfs volume reproduces it on the
> first mount.
> 
> Patch 2: ntfs_check_logfile() maps the same page once per loop
> iteration and unmaps it once, so a mount leaves three entries on the
> stack of the mounting task. After one mount the CPU it ran on can no
> longer be taken offline. A process that mounts ntfs volumes five times
> hits the BUG_ON() in kmap_local_idx_push(). x86-32 also warns when
> mount(2) returns.
> 
> The two fixes are independent of each other. Patch 2 was tested on top
> of patch 1. Both were tested on 32-bit ARM and x86-32 in QEMU. Details
> are below the --- line of each patch.
> 
> Changes in v2:
> - v1 carried an older copy of patch 2 as a second 2/2 by mistake. The
>   patches are unchanged.
> 
> v1:
>   https://lore.kernel.org/r/20261006043810.5393-1-kmehltretter@gmail.com/
> 
> Karl Mehltretter (2):
>   ntfs: fix kunmap_local() of advanced pointers in check_mft_mirror()
>   ntfs: fix kmap_local leak in ntfs_check_logfile()

The whole series look good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> 
>  fs/ntfs/logfile.c | 11 ++++++-----
>  fs/ntfs/super.c   | 20 +++++++++++---------
>  2 files changed, 17 insertions(+), 14 deletions(-)
> 
> 
> base-commit: 551c722f40809618230001baccf219193e22fc5a
> -- 
> 2.53.0
> 

-- 
Thanks,
Hyunchul
