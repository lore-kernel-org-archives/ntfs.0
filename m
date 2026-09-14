Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F5146AEFE
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 12:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390705; cv=none; b=QN0Nar1t/3IuEljBfMG0AutH30lcd7ADEwDwYnKxhLqF/ugiIy0cPrtnhpMfim+CIrkOMkXWxtXizgjuxyPlzcbkNWmrTDYCADDmVVEtuOuBA8Bv/+CjHuKyeI3YYmTg5cb+CfacKPRTUJ8MS+M4mpY181gg1qz552f+8gxNNKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390705; c=relaxed/simple;
	bh=CpKvQ4emW+umPkGi15cFYXg+oN6reK+kuKqDepTCRac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AvTXH4oVlnOF+ok7kh6VYUYBkPqDuS57RrxJe2GVSid3FPOeluhZp55onQprHoWuUC1gy1OP93dUh5VuLBOK30CTDvdNWgZS7vWD3rLqowUTKoILG0FXZJ2HRdR658OT6cJlCJsSFuWxTH2qYzzkwDxgrLvDTVMW4GugzjB49HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5HlJmQ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5HlJmQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06081F00898
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 12:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789390703;
	bh=T2t4zkNzOccBCNEzMIDTSA66YSwDdOoXBfFK4NOudFA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=H5HlJmQ3KNTXDEmkPra8bx3ssxJadSvgpm1bRxv/bsJb/pMG/6pYcWVXjPIHaui1v
	 W2fNrr6U7wC09G0YP1HjUR0hNMPdO0pFv3TOpTPi12vi7g6N0cE4MHlNHYVjMeEUIU
	 h8Ua+K+Mh4TRjErclqkyyLXiOzsq3V5fCA5Q5R/k/6RYJaxfSJVniMBFOmCz8p4GwA
	 eH9qzrTZDnYRd7ExX6NArTkuZ5rR5tWlxesWLume8mY0ywbJ041vjvqL246ir1+obk
	 SnCrb7ptMC8xQ/Kz8uFPRm0vw7sXHeOQK2Hb/YKLPSgb9g4BVh+IY5ilr6gERULNsf
	 NAJ7/nMdAyJEw==
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efebso306291466b.1
        for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 05:58:23 -0700 (PDT)
X-Gm-Message-State: AFuF++k7a71fpdckXRXbtu8crh9VPF2TM7VOP4SUE+o6LSzgAleNUysD
	uAM1eYqGc2ET75oE2LnC9QaHuOK+ODVXOiU0BE4JEhbnZyR9U0LOx6/yD5QIqdJYtRT3ZxXzdkR
	vO8omXtiEsZV+4anQgBVxkz/tgbebZNA=
X-Received: by 2002:a17:906:618a:b0:c29:45ce:85ad with SMTP id
 a640c23a62f3a-c29b84c9a53mr146506466b.1.1789390702370; Mon, 14 Sep 2026
 05:58:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260913-topic-4kn-lkml-v2-0-2bc455e81635@gmail.com>
In-Reply-To: <20260913-topic-4kn-lkml-v2-0-2bc455e81635@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 14 Sep 2026 21:58:10 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-fWBJSYJaLvn0s9xUjS+sje7=bcOnSSaTnTVPJVGB8+w@mail.gmail.com>
X-Gm-Features: AcwNN1UTBczIGJ7xMttSCz9ot4Ql70GStDDL8ccZtJmJdzlG2xNaHREV4C6Gljw
Message-ID: <CAKYAXd-fWBJSYJaLvn0s9xUjS+sje7=bcOnSSaTnTVPJVGB8+w@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] ntfs: support 4K-native devices with smaller MFT records
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 1:21=E2=80=AFAM Hyunchul Lee <hyc.lee@gmail.com> wr=
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
