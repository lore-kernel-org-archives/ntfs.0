Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6E5379980
	for <ntfs@lists.linux.dev>; Mon, 27 Jul 2026 09:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143970; cv=none; b=EjjGB60cNlZkJd8fEVCPdCB0w962dw3DFs9NShlOcJo7yIbEQO3I9ug2XLezpM7Z82ZL7W6j+wjvEUmUZ0auUeG+XEbyF7CQznXmXW0syFujUwaY6C/g4XUpfAv7gqw7SOw7Hr7hbzXylHLb+EUaEX7mqEEMdAIqT9TIS1h9v0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143970; c=relaxed/simple;
	bh=swijtrGNwyJHZ51jwsfxfJirQ38Id+RvzKrtH26Y0Us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Thc49bUi4iGeuCS14wvbdx72X7S3gD2BAKsaXJrehXVPao9aXfCM5M9nz6ZT+UqX/iTxwP1baw8eX8hpYvE4UvFrn2w7EipjAQ+GW2haf03BF9M6hpOCyQ4odh/tBuuM1cuWBEtDDsdwgRBHR+0l/lX/jOovPwgw6XRtxo6caeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+JmJe6E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+JmJe6E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CED21F00A3A
	for <ntfs@lists.linux.dev>; Mon, 27 Jul 2026 09:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785143968;
	bh=L+zejFW3cFT+YOYos4muap5F4V5G8LJXR+Rxgobla4k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=X+JmJe6E41ypNauP06vxuXfELjz41zXZyTzvvXvAlxoITcrtrgEY4u4VcAw2ey2dq
	 YYutty3j8uglk4Hgrdzh87H/pu8x0LdApO8JVdmMT2gOuPUCDXX3wIGV1a9vck48uz
	 DxJtYlcD+PERoQKehPDXvrMKd3t45KOuHFcFF8dxJIxw97HWdQxOoOHWck7ObYgUau
	 v6UPEfUo7eVVit2fp+HNDSHQxFwfCWkxzDuL/96DtOnygcbS5KYiuFbrrpfzInJ2Lz
	 ImtgL9KXx9bueuR6lxskMyYK256sWuLq8XQIuoE5RO7LObpMfHRhBHmKSUtIL8zJVO
	 KdtqRrPKWsaLQ==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso3852254a12.1
        for <ntfs@lists.linux.dev>; Mon, 27 Jul 2026 02:19:28 -0700 (PDT)
X-Gm-Message-State: AOJu0YzlWNB378+byqquZYuG4444OK5Sc6fpmEZPgxgJHtxrzwqpyBHi
	OIUs3lAya/LbTFiaEgoEY0qcPIx49TohHf1ycRe9Hocr7/GX2VRiCVpbHe9diFY1kx4675SjsDQ
	6v7fOS3LVkVcAOV7LCzV3CIcnwpd3ZjQ=
X-Received: by 2002:a17:906:9fca:b0:c16:9d13:26ba with SMTP id
 a640c23a62f3a-c1f1f0ab0cdmr343588866b.35.1785143967129; Mon, 27 Jul 2026
 02:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727-topic-attr-list-lock-v6-v1-0-664c5339d9b9@gmail.com>
In-Reply-To: <20260727-topic-attr-list-lock-v6-v1-0-664c5339d9b9@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 27 Jul 2026 18:19:14 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9KwVD8RB4pB9KM1ayx_FT1Mw+xH_rqQkWmmJKZcWiwSw@mail.gmail.com>
X-Gm-Features: AUfX_myWNVgLVD5Ew_kSqwpP3QFGBbO9138fuyl1Rr2DMvGCRUP5TaetlGrMqhI
Message-ID: <CAKYAXd9KwVD8RB4pB9KM1ayx_FT1Mw+xH_rqQkWmmJKZcWiwSw@mail.gmail.com>
Subject: Re: [PATCH 0/4] ntfs: serialize attribute-list access
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, Cen Zhang <zzzccc427@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 9:59=E2=80=AFAM Hyunchul Lee <hyc.lee@gmail.com> wr=
ote:
>
> ntfs_external_attr_find() walks base_ni->attr_list using raw
> attr_list_entry pointers stored in ctx->al_entry.  Because other paths
> can replace base_ni->attr_list and free the old buffer while a lookup
> still holds one of those cursors, a concurrent attribute-list mutation
> can turn a saved cursor into a stale or freed pointer.
>
> Reported in:
>   https://lore.kernel.org/all/20260702161710.2606853-1-zzzccc427@gmail.co=
m/
>
> This series fixes that hazard by replacing the raw ctx->al_entry
> pointer with restartable, generation-checked locators, and by adding
> locks that serialize attribute-list buffer replacement and on-disk
> persistence so concurrent mutations cannot corrupt state or double-free
> memory.
>
> The four patches are:
>
>   1. ntfs: replace raw ctx->al_entry with restartable attr-list locators
>   2. ntfs: protect attribute-list buffer replacement with
>      attr_list_persist_lock
>   3. ntfs: protect attribute-list creation/teardown with
>      attr_list_persist_lock
>   4. ntfs: protect mapping-pairs attr-list updates with
>      attr_list_persist_lock
Please add Fixes tags to the patches.
Thanks!
