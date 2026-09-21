Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC4B4A5EB8
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 14:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000191; cv=none; b=EGqSPSSWLc3vf1E5NfUUNEtWyX9o6DJdsrbiQ78L2nAjm0UAdSwVZT/w3sxTyPVh7bqYqwBb9NfPf/QGskNQ8666GOPAJ1yfEpyxGGVefnCo6eDHRYmTtFYEhflOyye34vBUT/S/Vzc9Ge6Ah/0S3y+Ws85/cRBqdCNTmxfIxE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000191; c=relaxed/simple;
	bh=XO/Iyvnz3qETNkeIWvlQee03cckRo7x8Wx3SnMguIOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcqC01umuHTSlRZcaHWM/LAeZG1pPqlp3JMC0cVFR2tJsyHRJjDxlarNpDufPzbI5RzHDE1goQDdvm5giIitfuLSzAZFWDFML+MaE+JNpdpK/+a5iz8vhhKQq15hfN1xi7BZwOVKL5TqWsRxDNtzmV65idCZ3Jh2Ll3em8GZc7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThA8Jthr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThA8Jthr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31CE1F00898
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 14:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790000190;
	bh=VNwpL4KwapgAM2FRhULX1UUMm7aiHSA+6ZAEI7tm5o4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ThA8JthrHF0hm5Ec4CkxU/Uf7UVWzsGhyve5hpMa621Lja5wfVMUsE94LuJn/3dOT
	 ldi7hLFr39cLYwVnYSsgJmE+GN1ee3GSe6I2C/qASRUDVIA3aSWS5qjJsBnJAA4SUi
	 xUMHhFw8RbtVWwM8kwAMbyqYWFEEMHeoplcjrvB297LlKrSOa1jRxNK2JmIaxR2R7h
	 uHqk/jxpAe2uZ9t31Na9t3qr0DZj1fzBrzcL1cPe11yrNt1b/vd0776oeHJ/xvXe3H
	 TMBrmdZD+gnrLkdFfEscXKcVdcc2jwMkvpgjsOBX756ded13dua/6eopq62PiBWsTg
	 YEJaNVlgp2HxQ==
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso5228605a12.2
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 07:16:29 -0700 (PDT)
X-Gm-Message-State: AFuF++kr2fD81YmsLL43iS1NBGCxNhBq38s0/xLntfj/eM20J1Id1cXV
	bEDBBW4RVLi2OJ2vexQBAKXoMVa64b1uHfkyUl1uH8bgpMr+egM7992ydcDdMMepi5sGz4f8W3r
	vNBM3sqcOr56WvH38twplhJ/PnPBDeE8=
X-Received: by 2002:a17:907:c0c:b0:c24:b11c:6c05 with SMTP id
 a640c23a62f3a-c2a156d58bemr876967466b.14.1790000188573; Mon, 21 Sep 2026
 07:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921-topic-4kn-lkml-v6-0-75069f590b22@gmail.com>
In-Reply-To: <20260921-topic-4kn-lkml-v6-0-75069f590b22@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 21 Sep 2026 23:16:16 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-QufcTW7RRXASSeaoc_fhnKx8sv+m9Quf4Dnqh98RM1Q@mail.gmail.com>
X-Gm-Features: AcwNN1XQ6ml5CtRpw3KH592HGx_gkmEpWnK_Q0XDHSzzi7fG6qv-Z6j9QYfPf6s
Message-ID: <CAKYAXd-QufcTW7RRXASSeaoc_fhnKx8sv+m9Quf4Dnqh98RM1Q@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] ntfs: support 4K-native devices with smaller MFT records
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 3:44=E2=80=AFPM Hyunchul Lee <hyc.lee@gmail.com> wr=
ote:
>
> Make MFT writeback safe on native 4Kn devices when MFT records are
> smaller than the device I/O unit.
>
> Validate MFT I/O geometry, map and submit containing I/O units, and
> coordinate direct writes with generic folio writeback. When a write
> covers multiple MFT records, preserve the unchanged contents of
> neighboring records in the containing I/O unit. Keep the completion
> behavior requested by each direct-write caller, while requiring
> synchronous completion before releasing an MFT bitmap entry.
>
> ---
> Changes in v6:
>   * Add Fixes and Cc tags to all patches.
> Changes in v5:
>   * Rebased onto ntfs-next from
>     git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git.
>   * Patch 6: Adapt allocations to the kmalloc_objs().
> Changes in v4:
>   * Patch 6: fix for the 32-bit ARM __aeabi_uldivmod link failure
> Changes in v3:
>   * Rebased onto ntfs-next from
>     git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git.
> Changes in v2:
>   * Fix compilation error in Patch 3.
>   * Keep valid but unsupported MFT geometries read-only and reject
>     read-write remounts.
>   * Document the sync-dependent -ENOMEM return from write_mft_record().
>   * Add Patch 9, which trigger page_mkwrite after native 4Kn partial-EOF
>     size extensions.
>   * Add Patch 10, which wait for attribute folio writeback before copying
>     a new non-resident attribute.
>
> To: Namjae Jeon <linkinjeon@kernel.org>
> Cc: ntfs@lists.linux.dev
>
> ---
> Hyunchul Lee (10):
>       ntfs: read MFT writeback bounds under size_lock
>       ntfs: validate the MFT I/O geometry
>       ntfs: write MFT mirror data in mapped I/O units
>       ntfs: serialize raw MFT updates against folio writeback
>       ntfs: track direct MFT writes until BIO completion
>       ntfs: write MFT folios through mapped I/O units
>       ntfs: write MFT records through containing I/O units
>       ntfs: use sync flag for direct MFT writes
>       ntfs: trigger page_mkwrite for native 4Kn size extension
>       ntfs: wait for attribute folio writeback before update
Applied them to #ntfs-next.
Thanks.
