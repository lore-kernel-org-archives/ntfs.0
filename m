Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF6725A2A4
	for <ntfs@lists.linux.dev>; Sat, 19 Sep 2026 00:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789778705; cv=none; b=KgT2KdaXPB6Xd6YwnRkN3AQY43CEWxkxo6h8Ei6vb2ud/a2QS7aM6fHF6i+j9max0HJUFKAvmVjFDtfTB7GqUWaNWsHpCofAJ20FTI87zFKETqw7izXg+gHZmkBCM8CyhJhsUGtYQ4IeuwNc+ZAhUJRmbN5pswOPwQyzc4ep9pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789778705; c=relaxed/simple;
	bh=13C/WI0tA91/I2tSYxg/UcML/cN5jYRQ/aLCePws1qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aZSw7IILdjg4SWPF+ID3o6OjT0bNeCG3uCwafN/G1uyUrvdBKs6vmHRHHJctg8Lt/wHABaHNwzvIwNKJVjd6JtnLxW25NbiA7XbMUU6K5bRBHYDMEwLd0+3VF9FXBcIrld5+Hz1s4LaM+p7/2PS5nQ5D23ruZx5kJKSWFZZxgLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCzCvy6i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCzCvy6i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEDB1F00898
	for <ntfs@lists.linux.dev>; Sat, 19 Sep 2026 00:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789778703;
	bh=rIDnBiA9ftYEDAvYGSztVvVqe3QY62gox9li25t/iT8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iCzCvy6it7dPyNvh4ig1naJ2+by7PUFRJL/HPhGH9GXVh4lqNCPJzwn1lOvh7Mdlr
	 rzX+WAR5+zL3onVaSl1vV8/ILFDxRr+aMFldEcbmO6VLFv3Eq4/qH3LKj80f13+K+t
	 5iF91ffwwtoQGRKz4n+GkE8N40XQTE9QfEjVHbCpXItrsQU4GBxMkSy6noR123Cs3J
	 OtB9LScu9seOODOFVw2Nmf/D985qGF/nd5n0eVdSDlkuXamgU82TAmXi+zkZdmW50k
	 LgjK0us+9Ts4syT49YzJNyf9lpE0Vx7OiP3DyYrFUmwJ4xKy7GRXuM+ANa3ax1Vctb
	 zgs6B0I1ru1hw==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6aa13a28848so1679439a12.1
        for <ntfs@lists.linux.dev>; Fri, 18 Sep 2026 17:45:03 -0700 (PDT)
X-Gm-Message-State: AFuF++m7qVOuaApaZwqZIqBvkFwCsrXerCiEz6hbwVuhnvL5nY159Inx
	GTi39hI3cdzONOY7JeJEXdxLVgsYelrMX9xH+lo4+Oj0F5Yo345qc2BUjlisGNPA6fd9VE5O9QM
	HIg+7Y+5gHnYgrHvasC5iuc4rysp84Kk=
X-Received: by 2002:aa7:de86:0:b0:6a9:8863:ada4 with SMTP id
 4fb4d7f45d1cf-6aa36d9c89fmr5169582a12.3.1789778702385; Fri, 18 Sep 2026
 17:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
In-Reply-To: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 19 Sep 2026 09:44:48 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-hdbbCcAzk0QuN4xhm9gpmqxXq66fFoad5ooV3coa51w@mail.gmail.com>
X-Gm-Features: AcwNN1XFxfN5rvH12YAFDU5ZlpcA4BoeHPyuxob_0AtJGv1t4NBcBycpgc26v5Q
Message-ID: <CAKYAXd-hdbbCcAzk0QuN4xhm9gpmqxXq66fFoad5ooV3coa51w@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] ntfs: support 4K-native devices with smaller MFT records
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 10:03=E2=80=AFAM Hyunchul Lee <hyc.lee@gmail.com> w=
rote:
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
> Changes in v4:
>   * Patch 6: fix for the 32-bit ARM __aeabi_uldivmod link failure
>
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
Please rebase this series onto the latest ntfs-next and resend it.
Thanks!
