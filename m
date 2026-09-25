Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C6B3403F4
	for <ntfs@lists.linux.dev>; Fri, 25 Sep 2026 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790325744; cv=none; b=CIZolMFeLzhn1H3z1mcHDqkxdT6LbkV5D+we41vX8GNLKDLo8LddP4c68JPF3HPo03c5zmTqqDg+vcGwnk/WkNLUBGqfhPW3bHy3f1E1D6RjKRtfJr3z8fCMDBmo/W4zYEe+oqBE2hjIVSAV3q8t3Es7G8ERqihimgTRGp7LYBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790325744; c=relaxed/simple;
	bh=kq7Xr0qZq5SIrw/g3FvF56cCahOW1bfM0GOYOHuO/jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQ644UrbSrcpOFXpUWdwSMDjhyvhsBMKQWfkSvC0PZnFuuUGOeSYrgy9DBLNPpUv5DEflQvWel6hSxA0ia3+mLLEkIh1MQ6vdv99gwjBfu9SliQ0wY22xJEj7lz/XBNv8EFs8EyBSuJPpZY4QMwSYPOGSRlIwn4X+AXggA9Xpn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBmlGsDt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBmlGsDt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8411F00898
	for <ntfs@lists.linux.dev>; Fri, 25 Sep 2026 08:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790325734;
	bh=kq7Xr0qZq5SIrw/g3FvF56cCahOW1bfM0GOYOHuO/jc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cBmlGsDt4bjaH+j3a/VkZir05T9IXpT2+YXbeaQqVIOcMt6LsApJsy1TMuDSSShl5
	 mXdIFOD+oSYfWs5Uk3Gz8OshbofiugCteOAMiaRBkQQHNRvTN9eEflgCT2uIvpaAA7
	 fqHA3KkOudkaDt5R3OTHcmGwxljfgd4997p9ncvyCgoOYJFZ2br+XMuLi0Z6FF9tqS
	 DlZqOzayUR5TJtplRxooc7zgsRzjc7G0Om8Mhw6BIFTotMi5jrrF+0rvxl1P3UtEaw
	 +BJo9x55wQbWx6KEcAmyllCGG05b7MiKkAfikS3erLDCOBU1efN8nmdNkYMFLvFfeX
	 wxSZqvh083v2Q==
Received: by mail-ej2-f36.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso99962066b.1
        for <ntfs@lists.linux.dev>; Fri, 25 Sep 2026 01:42:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy0MheOjExzdbb+cB7MFo7bNFMnRmLL7mJLI0QSBX3fKTklLFJbbgkiVkF4VUri+r6w51ym@lists.linux.dev
X-Gm-Message-State: AFuF++lKaGyjnJhuWK320UzW+cOCh5Ml12P01Odo7RpAt3N0HxmlHAkP
	eHS3jCl0aIHwrRa1a/WJ3xEfysvjJ9xUNeIubh/3ipEl1oVZgkGY0ytuyKgkCs9oHohGZqDIHlA
	q29OIE8IeQN0//Xnn202voWlicCUq5KU=
X-Received: by 2002:a17:907:6eac:b0:c29:f5d8:9c82 with SMTP id
 a640c23a62f3a-c2ac22f9694mr475995366b.49.1790325733527; Fri, 25 Sep 2026
 01:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <tencent_5D0FB865BC14FCE7080CBF2AA1E23ECA2005@qq.com>
In-Reply-To: <tencent_5D0FB865BC14FCE7080CBF2AA1E23ECA2005@qq.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 25 Sep 2026 17:42:01 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-M6aoyfL1d46Z5u9XGAyQK=1Qi814KpH06_XFvVpKAyA@mail.gmail.com>
X-Gm-Features: AclHuK9d2wes8GqOzYqOyGtkDd8N66VnrhqEwhA0nQjE7hfbWdjpAoQbjn-uORs
Message-ID: <CAKYAXd-M6aoyfL1d46Z5u9XGAyQK=1Qi814KpH06_XFvVpKAyA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix runlist marker allocation and count
To: pwngets <2605452642@qq.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 2:41=E2=80=AFPM pwngets <2605452642@qq.com> wrote:
>
> The marker path can append an unmapped element and an ENOENT
> terminator after the merge helpers have already computed the resulting
> runlist count. In that case, allocating ds + 2 elements leaves no room
> for the terminator at ds + 2. The path also increments new_rl_count even
> though the merge helper already accounted for the final runlist size,
> causing a later merge to start past the terminator.
>
> Allocate space through ds + 2, and derive new_rl_count from the final
> terminator index instead of incrementing the count a second time.
>
> A crafted NTFS image can reach this path through a normal read after the
> image has been mounted and trigger out-of-bounds kernel heap accesses.
>
> Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator=
")
>
> Assisted-by: OpenAI Codex:GPT-5
> Signed-off-by: pwngets <2605452642@qq.com>
Applied it to #ntfs-next.
Thanks!
