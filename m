Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4398A2E7165
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 22:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789423910; cv=none; b=WIuEFhjO/U/v5MBigmv92Bf9zQL0dJcZVvTK0XwUmmpkR63M6H+emegj7XqaMF8wvxHH+Ip8ZJu/svKqUmz3hlIiYbg4K1PuzaK1bnZrzgDDtB5G8KHqrYzsPwRlTBmi7umIVJSq4nnkLOxTUJfNlrQJVxVZLlLLTegKbm0LnT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789423910; c=relaxed/simple;
	bh=ylBIR8daksVljny/ea5tkwjhAb/CAtxmvf7dfmKE45I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJr3RifsvZn+cZIVv/ZXsW86fmnmdOsNSneVXN6gQBjyGPHV/fJSKwccszRH1CCi99MdX7ZjuP49pSTTFuWpHoGGWa2z1al6P/ZKzjdlbFjwR8hL2TXS+Ozya7nbYcaH1nQXv5597jSLnb4tOG7hyvV2ZbCEFDd8zAdWuMTlr0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EP0Z3Qeo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EP0Z3Qeo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BC21F00893
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 22:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789423908;
	bh=9YBQon4crU+NBPudFT6PBpBCKg+huqu08S9SXDqNzEs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EP0Z3Qeo8b02HTl9H4FrpIoHMbBUxSiQUpwgLtRrtjgWackh08tv3iYbIPXs3u0IN
	 ni+K0IBcSP/W0wTE4QXgBpNOwoR6WK5AYhvCUMvFIF10Tm1L2yt9Ag6KJ6ZnqfZawL
	 dB9jBMHN4HRUzUoPcRKtvCuWpOuA7gzsoAlGK0CJHctknJQfocqwny/y4WKtAA4D85
	 X0KcQuIcFVVSHy6l+iHDfDryDBGjCCIM7AOMUyJxHzYxGsD4wBoBAmbqM04K43YOY/
	 nQewuVEUJV22bu941HQ6PeiJiENO+Ov7nE9794Issgdtr/hDzqQNmFSEC2+iWpRxA7
	 HNUYnA2yKF9hg==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c29c49a977aso89671466b.0
        for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 15:11:48 -0700 (PDT)
X-Gm-Message-State: AFuF++lJ+4rzBvCOuvJPxza9+8YAGjSpn3OLIfpCfimPSvAMrT0nTD5U
	mQFPF/xhMLh9r5IxelvjCk9ket3D10/l2M3NaZwbVi/CT96O2P0xN6gQkrYzhRz03+M7AkX+YiZ
	ZQvZEi4GtYFyWSBlkSA1XPMryisLNq3g=
X-Received: by 2002:a17:906:7312:b0:c25:2fb9:b897 with SMTP id
 a640c23a62f3a-c29b86353d1mr243692366b.18.1789423907428; Mon, 14 Sep 2026
 15:11:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915-topic-4kn-lkml-v3-0-447cfa17f780@gmail.com>
In-Reply-To: <20260915-topic-4kn-lkml-v3-0-447cfa17f780@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 15 Sep 2026 07:11:35 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9wnZ7-ZGc-b6dYx56CpybUjcfmXn+jheLxwH+iPZ3wBg@mail.gmail.com>
X-Gm-Features: AcwNN1UcZktsBy7iHdf_e0ID4mqMepnyKkrQiR0bLRI8_RoTcYGW7T0xpKjcGao
Message-ID: <CAKYAXd9wnZ7-ZGc-b6dYx56CpybUjcfmXn+jheLxwH+iPZ3wBg@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] ntfs: support 4K-native devices with smaller MFT records
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 12:21=E2=80=AFAM Hyunchul Lee <hyc.lee@gmail.com> w=
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
> Changes in v3:
>   * Rebased onto ntfs-next from
>     git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git.
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
Applied them to #ntfs-next.
Thanks!
