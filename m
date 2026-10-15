Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A688F2459CF
	for <ntfs@lists.linux.dev>; Thu, 15 Oct 2026 00:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792023608; cv=none; b=XnwFh6qFdZu0k6iWGHjDehjS0vGF7ooFfNMGaS46rZAOtuNE8qUtlc+Ni/P/iLi5pIcmaHYNp0RJ2OAH1AXREGnbfW1sl5NUb5VCQY3oH94oNa8IOJTMyjf+bug+XsxX0Ogd6weztQMjGDy1o9U6TdxIiUT3C8S+0A+KWuF8yMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792023608; c=relaxed/simple;
	bh=AnNVEavxqtyOTLpLxYFj2+nZEID6bcl0Z2S7QWhHL6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYiq+Od1SDJnBbHvG3tEFjp0ZuShskHA/epR1zAS3wbzO1ymkdMJGLVrwp/axyFxlvVXKmQp5KZmyCCU2CU6PaAPltTfwO8upzHlmJhVzwr2ANFMhcs7AQ+b5ayAdlejed9pBGNKmJ3vDkj7V/K1tgXWNhA4ApeMloxZmHBApm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DI1f/TKr; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DI1f/TKr"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc502d509c0so703929a12.2
        for <ntfs@lists.linux.dev>; Wed, 14 Oct 2026 17:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792023605; x=1792628405; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ISbHRDvpK26efrlSANt4b/Vey+sE4YbMfz0mAYLwgdI=;
        b=DI1f/TKrSW8rNceckgDjNaZLXQBVmyFmxNu6K4fkfF3TRdxt18JtOm3HVhizHCvv45
         rk1dtvFiQUfWssAHUYflmD9u38KINr16XcpuYrXe0IcqyXM1KvozowR/TaQoYdU0l6km
         +URfo9lNRt/uolS/TujGSi9dqJTI1Ueid8HHqkWeqROx8n/vKD9+Gkx/yYdoOdQzSu5L
         cFKpn1srgZsx+UyIcXDuczCFigYy3MkMEvdr2YSxTddnMLBLtt5wpxpKGXJYffV/TRsW
         CL/OlYvwJ+ryS8l+OVG/vpTk6ykf+Y1pMSqxmrSXxZDEl7xRZovoztj2RrzI9zrX7z9G
         9hvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792023605; x=1792628405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ISbHRDvpK26efrlSANt4b/Vey+sE4YbMfz0mAYLwgdI=;
        b=M+A4cnJrZuleUs6QCqaymFa30T0nHIwm72oUk0wLouwWmed2xywzimaQADJFe4eebU
         OOXT15jGgruIZMLlxKa+FjY3Mk27Tc7SqEE1hLpy32nMR3DSNMgu58NSkNt3D7UuHFp0
         epxdxXz2sd5u3C8lg2F1gaK4uCgOrkVCP268IZT4vMhDdMAJ4CNG/cFcub/7DFaegOUe
         aGdn5x7nOvgvbdQqAAt935l/xgX36S7ZXGqDhpNX8fH0UjiiFrGRmx6Oz5SoZBO2ivhf
         pcny7TJzfecxYp+8S/0x+xcc68roEluJ3/jpGuVvR6aY9C5Ve9uGF9wRpKpEfPc5ZjBi
         skmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxy1R2MNLFQP7Aczcpgd65QRBXljNnNpk59EKaxDpnTs7HbMWPs4C+f+WCD4AHyKCdd10eN@lists.linux.dev
X-Gm-Message-State: AFq9FYJzII01yteCwU54wnQQQLftbI24la1H+Il+9Kx6UDSI408DF/BG
	XLQ8FtgbZWNRLXPzG8/84CCTwQFY/9PiilEw3ukdtwrHlgekNKcruRg6
X-Gm-Gg: AYBFou0MnBQNM0Bg/UZRWUb8bmUo7jElNbcYfmWjRTkvsyGZYaRWNzkH/3FYtgKO3Xw
	Df8iIMOtUBFFe3hmEZcnHyiiSPDzGysZQL+popWK1dvoqYJjRHGMwjELtaMbQKcj7WJ20GOn6v+
	sZLXer+Opbu6eUREqguvQmO0UzYzFJ8g3bKyxMfJKGWsVaCgKN3TF1uiUL4gQHQMr04t1nESeLf
	05oxkEOjHGEm2yqWZ9E488Yk2j/duF3VmugtEVtPMeE8dqYE+vuo/QokpMYPwTsF7NuUGNvsddg
	bJ638XlkD8tQU5rXBJnRkR2ATeMQho/YofABNSXwRVuKPPpKROttCkaGDLbqXOnYe26kKR71Kif
	he+2zbujNMH5xND3GhPNZdWNLxAQdayhMkFgjFbzB/HmE6bxQEnDTR9bDyG4M1GcQqpGKpT1Etr
	vPJqJe8t+byns7lp+p4rHP+aSRlG2yDfVe/ux7uz+F4fYrT8nQ9mesHXZhmERo
X-Received: by 2002:a17:90b:2681:b0:3ab:189b:6981 with SMTP id 98e67ed59e1d1-3ab3a92f9f3mr13983908a91.48.1792023604661;
        Wed, 14 Oct 2026 17:20:04 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac93ff4474sm1597813a91.0.2026.10.14.17.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:20:03 -0700 (PDT)
Date: Thu, 15 Oct 2026 09:20:01 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v5] ntfs: roll back the ACL xattr commit when the WSL
 mode update fails
Message-ID: <atAcMSHpAbf0aTGP@hyunchul-PC02>
References: <20261013015652.19724-1-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013015652.19724-1-zenghongling@kylinos.cn>

On Tue, Oct 13, 2026 at 09:56:52AM +0800, Hongling Zeng wrote:
> ntfs_set_acl_ex() commits the ACL xattr before it rewrites the WSL
> mode EA, and removes it again when the rewrite fails.  That only
> undoes a set that created the xattr: when the update replaced or
> removed an existing one, the old ACL is discarded along with the
> failed update.  No error is recorded when the undo fails, so the
> new, typically more permissive, ACL is left on disk while i_mode,
> the mode EA and the cached ACL keep the old values.  After a
> remount, a chmod 0640 -> 0777 that reported failure leaves the file
> accessible to the relaxed ACL while stat() still reports 0640.
> 
> Save the previous xattr before committing the update, and restore it
> when the mode EA rewrite fails.  A removed xattr is created again,
> since XATTR_REPLACE fails with -ENODATA once the removal dropped the
> entry.  Remove the new xattr only when there was no previous one, and
> skip the undo when the commit changed nothing.  A failed rollback is
> recorded: NVolSetErrors(), which the next persistence point persists
> as VOLUME_IS_DIRTY, and a log message the errors= policy acts on.
> The flag cannot be written to disk here directly: the target inode's
> mrec_lock is held and the $Volume mrec_lock cannot be nested under
> it.
> 
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Cc: stable@vger.kernel.org
> Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
