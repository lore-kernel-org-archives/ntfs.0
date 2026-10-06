Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FD734750F
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 13:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791293428; cv=none; b=dLE8Ga4bsVHV+cyrCeB2t/UTnnkyDglelwgPkQPpmipyxzdqXu2UABq+s+2n3U4zuMuFb14FDPWNrlnWVM9vlWDWvKJZVA7ZsoRSBQ0ys0cAmtX7uqEOaX4dibnmks+fP7G/nY+X2fJVI3Pi0pYOk/PLd7PlPnuGK2OzQzJrykg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791293428; c=relaxed/simple;
	bh=rwOMqiR8b/Y92bev5E0nl/w6Fvz14rVHDxXBg0T/JPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fJPCSerDT0xJZtgGs458QJBY1O5at7Er8NmYnXd6DAurwuRIkYexr2XfSL7DSw3CB3lS5rtS07oo+h8TqCiy+xcIw5HwZgkTMUI1cnNAAge78jkW9WXhuXSMfHdwkuJZbO+uZr4iap9pno/1UxQzdlolb7sKYdR46tqw3CAJm5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKCDMwdx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKCDMwdx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654661F00898
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 13:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791293427;
	bh=0kKwvGfqQZdzki7NsKCxz8F74iPkfXspPNaWPdWq2dk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RKCDMwdxZbkWLnOpU1TLJMwMWmqstyWkzfdQgYPNE8sBqNNriHHpuz8fGLefnZSYT
	 Nm8Pk3LJK1LjORIuccVM6lvq/B2HTAq5lu1cTQ6CymqZb9LRsw/28Ol7hlfMQCkcKo
	 lLHyY1PtvX1IV01FxzPIrnwj/Kwv5zRYrCagi7vEJmmo+vyiOSbQdeup0z+yx+nQUh
	 xgJKJk0+lIQhDPfvEqC5EuG1ROjYuqi4Gcv2jMvSpWpOpKdHywY8+d1gzXpLJ/QOzJ
	 CpIzRY3FlANVHlWdow02FGA6BlLpVZVuvSiOhze02rm1M4EtQWEkRuFCGPSbNZdnj0
	 v1S+mRrZ8OzKg==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-677aec6ddfcso570762d50.3
        for <ntfs@lists.linux.dev>; Tue, 06 Oct 2026 06:30:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwaWQdBsfXb59wO+LFxi9jqNOpWslHE8IOyI5Pa3vCx90WHUOWwhH6brSn8C6E5B0V2cTNk@lists.linux.dev
X-Gm-Message-State: AFuF++nYQ1pCocigtrfekTTN/1H9MIYliY2ZeYCXYO8F+aH4VkpStmC/
	qVcwadOOOGlOezElGDBmU8o5jLeYVdwACTA8QquJGNk+bYFx+pAnLV6X4kviVjI/Ftw64uCNDQ0
	FNKh7VOWHvJIZUPPBa4yjpcAKSzCeTb4=
X-Received: by 2002:a05:690e:4084:b0:677:cf4d:a90b with SMTP id
 956f58d0204a3-678fcef3520mr635346d50.151.1791293426687; Tue, 06 Oct 2026
 06:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003093035.532916-1-yaojiale02@163.com> <20261003093035.532916-3-yaojiale02@163.com>
In-Reply-To: <20261003093035.532916-3-yaojiale02@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 6 Oct 2026 22:30:13 +0900
X-Gmail-Original-Message-ID: <CAKYAXd81C1LYwtNL4eQPA1VeVk8Ueh2mVEKudZPZfnUTcGziAg@mail.gmail.com>
X-Gm-Features: AclHuK-IJ1OLRGrNQGEY6ZR9uaSxVShSNvUHj3bmyl2oEUPfVmjD9Hr2zXeTJnI
Message-ID: <CAKYAXd81C1LYwtNL4eQPA1VeVk8Ueh2mVEKudZPZfnUTcGziAg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] ntfs: drain in-flight DIO before buffered write fallback
To: Jiale Yao <yaojiale02@163.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 6:30=E2=80=AFPM Jiale Yao <yaojiale02@163.com> wrote=
:
>
> An asynchronous direct write can remain in flight after the inode lock is
> released.  If another direct write falls back to buffered I/O while the
> first write is still pending, iomap_file_buffered_write() can dirty pages
> before the first write completes its post-I/O page cache invalidation.
> The invalidation then finds dirty pages, reports a page cache invalidatio=
n
> failure, and records -EIO in the mapping error sequence.  A later fsync()
> therefore returns -EIO.
>
> Commit 15cdefd0c0522f9d5e12d947fa04f4c11649b699 ("ext4: drain
> in-flight DIO before buffered write fallback") fixed the same race in
> ext4.  NTFS has an equivalent fallback after iomap_dio_rw() returns
> -ENOTBLK or a short write, but does not drain other in-flight DIO before
> dirtying the page cache.
>
> Wait for in-flight DIO before calling iomap_file_buffered_write() in the
> fallback path.  Since NTFS supports IOCB_NOWAIT, do not enter the blockin=
g
> fallback for such requests.  Return -EAGAIN if no bytes were written, or
> preserve the positive short-write result if the direct write made partial
> progress.
>
> A reproducer using concurrent AIO direct writes and buffered fallback
> triggered the following warning and made a subsequent fsync() return
> -EIO:
>
>   Page cache invalidation failure on direct I/O.  Possible data corruptio=
n
>   due to collision with buffered I/O!
>
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Link: https://lore.kernel.org/r/20260629113827.4074335-3-libaokun@linux.a=
libaba.com
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
Applied it to #ntfs-next.
Thanks!
