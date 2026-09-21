Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016C644F57A
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 14:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000267; cv=none; b=JePMxZTNIPxCn9nhHxefiJgc3R7bcd4uE8+Vy/kkUvvrOQ/OGth4qB3igY7mzrdP8KC8LI/ioDh6I/fAAsNEMQ7Re3rXKF3piHiArYeM9hlTeFbGSgxdoUvK2Pvh7iQfPKvwgfVwHlCvaKlyMakbICX5nfHauiXS/ftkmswE0o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000267; c=relaxed/simple;
	bh=cRjTGHnXcCHtRjF0FXLx/rBGri5WJWJid4WEG1fJfto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NL9YaMGkYr0zVNa0suR+opBIIDIvJJdifxXyakTg3eKDnhZOJE0Xabn633SXjzugpSN19eNhEWy7y5Ft2FfB0uXfxrJxGIIUXtG+b9t/3S/bUjVJVu6zZ57UslN1JHUu9Wz+i6g0OHo5+9V4neskoSuP34gkC6F6G3ZfRSZ3LtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3/Goa87; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3/Goa87"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F031F0089A
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 14:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790000265;
	bh=cRjTGHnXcCHtRjF0FXLx/rBGri5WJWJid4WEG1fJfto=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=R3/Goa87utUUzvCUsbMUk22h4KwKnvmIbDaTRBDQGM1VMZE9jYFDDmLQdOxGyDI4T
	 jRcTGeLH2pfKwCHVzgXx8mviePfLlroFiCaI3md7dZBVVAHRni5v30SX//r7TpLwQV
	 Cx/aoy/VDvPv3iJgIU1uibmE555aIWwonVomqDYFX3+W9j5phEhmQN2j1f3r8TZfRr
	 NhLwr36RDCMsyvJRMqjU3RdOHQUN5ZqxM0is4BIrEH69cu9EXahDsI2yvCBvZ83dq5
	 a8jbdCwxkJygVxsgMrrx+DsC7nFB7ll31kiTWui9oSYa7ZXskfbBOSNAUF6133cxHg
	 G6b7fmbJLyUQw==
Received: by mail-ed2-f16.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso5192367a12.0
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 07:17:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3gVftYLhUOk3pGS+fzDSDprcrBR6rAA44dbyazKNXRgCb81YsEa8wMv7MKUIkfgnGMrzq@lists.linux.dev
X-Gm-Message-State: AFuF++knfgVtA2DFryF73zGD1hnkogUbSp+ws0XgWhMVv8vm1cyiZGqA
	GlBLhqq2Xa9foxDbEvtyKnlnibegP3JfUXTchRwQRLi5tq7poPbASyfaa2568333EzN6qSk47Pe
	GFc4cUef4zbouHXaYgIzhMPmoX6TjgtY=
X-Received: by 2002:a05:6402:3249:20b0:6aa:91e6:9b06 with SMTP id
 4fb4d7f45d1cf-6aa91e69d3emr1228691a12.29.1790000264118; Mon, 21 Sep 2026
 07:17:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260920063153.376958-1-wangxuewen@kylinos.cn>
In-Reply-To: <20260920063153.376958-1-wangxuewen@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 21 Sep 2026 23:17:32 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9SS+TS+Ok4TNBhcjGFvZP_Z-rJg8Bhpx4+Rf53xPDPKg@mail.gmail.com>
X-Gm-Features: AcwNN1WBeft8CvCtyU7bP8-pGIcM0J0V_wOB2K-fgX1WObezl6N-aG8LtSmq7dg
Message-ID: <CAKYAXd9SS+TS+Ok4TNBhcjGFvZP_Z-rJg8Bhpx4+Rf53xPDPKg@mail.gmail.com>
Subject: Re: [PATCH v1] ntfs: preserve the 64-bit FITRIM minimum length
To: Xuewen Wang <wangxuewen@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 3:32=E2=80=AFPM Xuewen Wang <wangxuewen@kylinos.cn>=
 wrote:
>
> The minlen member of struct fstrim_range is a 64-bit byte count, but
> ntfs_ioctl_fitrim() uses max_t(u32, ...) to compare it with the device's
> discard granularity. This truncates the requested minimum length before
> passing it to ntfs_trim_fs().
>
> For example, a minimum length of 4 GiB is reduced to the discard
> granularity, allowing smaller free extents to be discarded. The truncated
> minimum length is also copied back to userspace.
>
> Use max_t(u64, ...) to preserve the requested minimum length. The bitmap
> scan already compares the aligned extent length against range->minlen
> using 64-bit values.
>
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Applied it to #ntfs-next.
Thanks.
