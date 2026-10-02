Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1211B330328
	for <ntfs@lists.linux.dev>; Fri,  2 Oct 2026 06:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790920895; cv=none; b=AiG+WJ6O+2loKnaxXDSb1nYJsqu1NFkiHlsfVNWK5PYvxpxMToSSLhFNEA+EcjVeoxepi6ODe9ELRVQMr9t47AbKyXE0oynQSQtH67GFipJqqEN3zl9D6r0vDRI62sMTzDL241z5hA7vO8FTpv+PfvZ89TcFvX/ju8MCoilorSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790920895; c=relaxed/simple;
	bh=Zzl8GQMYT4ovWCoYqlximp5PJDij3vOuu7nwytPtyeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHcCamHt3dToEVVG7XMWMEA+7PwRVvJ68VBO/BE10Y0/iCx7XiYtsiB7fOudue2eGsnawargMMT7enTuzBzad+AT3vXOT1LQDGz7hvhaJeBfTqLyxK0G5jhb6LUJbNukwuXdr0MARvS01SMvsc9sHops01dEiyFOnBQPVtaLebw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5uVEKWx; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5uVEKWx"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a02551822eso742990a91.1
        for <ntfs@lists.linux.dev>; Thu, 01 Oct 2026 23:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790920893; x=1791525693; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bvzqwuTjdPy91zWm37KIYjrvoEq9pY5JTP911vnp5Bg=;
        b=j5uVEKWxHclHRFLlaA9mkgGm4gnXhxOn1ki8h0iVCF3B19JcsURb2A5qNgjPpH+DLq
         swz99ITLvMAma9PEX5q0BrItGplk1i8HMi9QR5paiVxoshGUQ1e3TvuC/27xIXn6iHsW
         gHGlzh5/OejvczGyttQ9B7P1J80u3tj0MBQXMkuyjwhfmfzeXYgm3p6eF42/iJu1XIuN
         A2WhLGiFjd1RK/cvL/coQQD2NGj2j079D6HATxRDF4eRoEyyG6M5EspD0It0D1s+egeE
         k9DXg4jk3nPgmGInjhqc/gWp67GoqDE4cEKFaED+RRTNNnOAY7M03jxje/yaVa4ofLlz
         0F5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790920893; x=1791525693;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvzqwuTjdPy91zWm37KIYjrvoEq9pY5JTP911vnp5Bg=;
        b=N60rJyZKXc2WXkx2X04Eo+Pq4kN9iKYQL+r/9PXdAFU1/84YPCqyfHZVqXHQaP4zqB
         PSCwjOp3cYiUuA8r+U5m2v6Uk/7g0O0ZIfb4dMIoUgvH9pmBWjhZGHXIvVWquhz7qSNO
         2WC65vQgwUNjbDdVseGWOEpi0KNd/qmq+D7w2dkStdsFqESNEOxtbvLEWKbMTMntb4d2
         sSWZO/p2Q3/XRI/16pi4MVPevOBtDxGWIHm9NttguS9Dmg4Cnp+qL0gRRb2pXya4EQsD
         PrvqydXLnpZkqYrHb3O/HQ6ZlnTp8c/eRtOD44lG8BKDjhKfRfRnIxUIforONSQTj9KG
         y3qQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1ZUjtSEET9lrZH/Wy/oKMH+ZOtA+A9hjtXfhCaat8CA+qlVgyM/2RpNA8Xu+FDGK6LlHB@lists.linux.dev
X-Gm-Message-State: AFq9FYLxzTO9p3qJJuKKtkqItSy8fJTedq63RK9WZpfG8hkzMhi8Rw5d
	uJcbwyMjZeQ6XaLJgYQPtzl3KLJOjotAe99UWGY4FTt9NOgjWJtvgIsq
X-Gm-Gg: AYBFou2WcnLv7YzLbiaYpuBtvKRgTdDwvJ4r5JW1GwKuOSxTkpcHGPuhdqzeoDfcCuq
	fP+CbHGDe+6gCRA4iTJ94qOi2wx1h5sqMpfr7M3lX8gFuSFnDK+/D1ZNVeLtO+w72t2G4tCeAJf
	nc8SaA8WHirygSiCh44NozHCaSZOaRRwyYt8Nxs7QiHbVXIUOLWwGPMuW9dKqEUIjeZ1qNqH0DO
	rblaH8j30NqV915+4+XACqRElwifeS8ubvoIWkQ3F7+IKCbgdDVOM/w2GQ9neCAoDD2A3K/W3qk
	ZUM70VWHPrylDQNQYnEK5Ias3q56ESNc/8RFrKQILGJ9wXk4MhoU1lHREPdoWtfzyrMAqD867bS
	Ua14sIXLtmk/OyIJvc4MHkOVDiGyXMIxwfhmCYrADBj3ake8RStjLIEildRe5+UpcIV6I/vggjh
	ugRieYMt3JU8KNXfwht308jQuLr9zxsY+sJ29MCfGYYAvWKLv46oJjExHW2sjr
X-Received: by 2002:a17:90b:2644:b0:3a0:f2e1:8af9 with SMTP id 98e67ed59e1d1-3a4f3d124f2mr3588321a91.52.1790920893294;
        Thu, 01 Oct 2026 23:01:33 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f721a6afsm519169a12.0.2026.10.01.23.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:01:32 -0700 (PDT)
Date: Fri, 2 Oct 2026 15:01:30 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: NeilBrown <neil@brown.name>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Breno Leitao <leitao@debian.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jan Harkes <jaharkes@cs.cmu.edu>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Carlos Maiolino <cem@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org,
	linux-um@lists.infradead.org, codalist@coda.cs.cmu.edu,
	coda@cs.cmu.edu, linux-mm@kvack.org, ntfs@lists.linux.dev,
	linux-xfs@vger.kernel.org
Subject: Re: [PATCH 1/7] VFS/xfs/ntfs: drop parent lock across
 d_alloc_parallel() in d_add_ci()
Message-ID: <ar9IuknaJqrGoF-j@hyunchul-PC02>
References: <20260929034158.1455429-1-neilb@ownmail.net>
 <20260929034158.1455429-2-neilb@ownmail.net>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929034158.1455429-2-neilb@ownmail.net>

On Tue, Sep 29, 2026 at 01:36:01PM +1000, NeilBrown wrote:
> From: NeilBrown <neil@brown.name>
> 
> A proposed change will invert the lock ordering between
> d_alloc_parallel() and inode_lock() on the parent.
> When that happens it will not be safe to call d_alloc_parallel() while
> holding the parent lock - even shared.
> 
> We don't need to keep the parent lock held when d_add_ci() is run - the
> VFS doesn't need it as dentry is exclusively held due to
> DCACHE_PAR_LOOKUP and the filesystem has finished its work.
> 
> So drop and reclaim the lock (shared or exclusive as determined by
> LOOKUP_SHARED) to avoid future deadlock.
> 
> Signed-off-by: NeilBrown <neil@brown.name>

For the NTFS part,

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
