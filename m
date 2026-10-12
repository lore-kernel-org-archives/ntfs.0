Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C46446074
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806431; cv=none; b=TXQoWfKuEGTZM2qFLgqHh61eVXubWsVo5n9w434WgZLLc5AmMgsJ1qEfOnXFb+uTlOyAJBKF9LmaOpp1OlPGlCmOfFA2gyz6pxGyxMMngCXQ0KtO6q4b6jiSATI7KRq3KhCtFIqyUS7bwLqihO3lPyF2uM3X3gAeSP9quLFrYSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806431; c=relaxed/simple;
	bh=v36kMXCoWhLlci2FoPDTFXCbNshChbzEDGVmxQaK1jA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKAjo16/kJ4zXcoO4F7cFv0/08DObX/jJfh67SUuzSfYCUDbmNCBzR9IxYOsJ4dZCrZxV1D3pYK3NvSHKrTAFhAB4edn2Fe8F+NbimsK6/5+8tiI6QW+YAGT9pgeSQONsfRlUWp7ERB9ZXJOSfHBVG2S9IM0tH9XQwOKR3q9jEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOYunkU6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOYunkU6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0991F0089B
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 12:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791806430;
	bh=aEz6mK8G91zL2oei9SD/3hGK+6I5qzlNp2zPpQheMg0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kOYunkU6TtZWZp06Pfu6me0ARTNbf6jf6RPWgl97j51YXw6J3xWTxJibkeoN8O7Pb
	 hVLv36gPk2SIV9yNCKEQ0l9voUmyTTLyQQiQqrEtRA6/2Gngvrx4mHJicFlPpSjPKD
	 CjR/pr+J2VGi+ZoDNNwXX+dFovA5zRjxBLtbVVFEhR66o7aGcGTwdSL8MUdWpXfVnL
	 MU4kqcCO67ACW3pFMm7deQym6JuCnK6sRBDflU+RaTxTi6JO77kHWqVy1OJL78wSsf
	 0H9PZLn+poupYlTgHKRgDrPBRp53INcjbSmeeCoKlb0ur8k6njvR+K2ODMZYZPvwyB
	 ApH4FidazYFhg==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c29c6a3930bso222608866b.3
        for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 05:00:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBypmYHhxnCUucEATkeMULZhk+gywZbzGc8geBdnL0l4gnT5IqJ6unT/1shVDq49bE3VCHMn@lists.linux.dev
X-Gm-Message-State: AFq9FYLXmP2lWFjt16emYx83lAMFuXvP51lQ/NQ6RX99SOb1iyjMdvLg
	hVsUrW32135wme0L/oFKaSsxVHK8mQsvGNo4dEeIJvK/omHmBYyb5/lF9LIYjMNjWsxEp0mA7Pf
	sDiaNDyRZlxyqKcO4LT7fr2D2cjqywq0=
X-Received: by 2002:a17:907:8d8d:b0:c26:306f:289b with SMTP id
 a640c23a62f3a-c31a9b0b097mr785702466b.13.1791806429225; Mon, 12 Oct 2026
 05:00:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009075523.3135206-1-zhanxusheng@xiaomi.com>
In-Reply-To: <20261009075523.3135206-1-zhanxusheng@xiaomi.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 12 Oct 2026 21:00:16 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9Xi3kHSCuMFKY_cQWBz4HagCy6pgE6gKvfwrgs5XNAVQ@mail.gmail.com>
X-Gm-Features: AclHuK-ZUxkPnPfEewj9Uhye7k_tFzT2AQ58OP-vqGk-bZwZYBczFLJUbX204oQ
Message-ID: <CAKYAXd9Xi3kHSCuMFKY_cQWBz4HagCy6pgE6gKvfwrgs5XNAVQ@mail.gmail.com>
Subject: Re: [PATCH] ntfs: widen the sub-block offsets in ntfs_decompress()
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 4:55=E2=80=AFPM Zhan Xusheng <zhanxusheng1024@gmail.=
com> wrote:
>
> ntfs_decompress() tracks where the current sub-block starts and ends
> inside the destination page with two u16s:
>
>         u16 do_sb_start;
>         u16 do_sb_end;
>         ...
>         do_sb_start =3D *dest_ofs;
>         do_sb_end =3D do_sb_start + NTFS_SB_SIZE;
>
> *dest_ofs is an int page offset masked with ~PAGE_MASK, and
> NTFS_SB_SIZE is 0x1000, so do_sb_end needs PAGE_SIZE + 0xfff of range.
> That exceeds u16 once PAGE_SIZE reaches 0x10000: the last sub-block of a
> page starts at 0xf000 and do_sb_end wraps from 0x10000 to 0.
>
> The zero-fill that pads a short sub-block then computes a negative
> length:
>
>         if (dp_addr < dp_sb_end) {
>                 int nr_bytes =3D do_sb_end - *dest_ofs;
>
>                 memset(dp_addr, 0, nr_bytes);
>
> A sub-block made only of symbol tokens reaches this without consulting
> do_sb_end on the way, because that path just does
>
>         *dp_addr++ =3D *cb++;
>         ++*dest_ofs;
>
> and is bounded by dp_addr against dp_sb_end.  With do_sb_start at 0xf000
> and eight literal bytes emitted, nr_bytes is -61448 and the memset()
> runs for 18446744073709490168 bytes.
>
> Getting there is cheap: fifteen sub-blocks of eleven bytes each advance
> *dest_ofs to 0xf000, since the same zero-fill pads each of them out to
> 0x1000 while do_sb_end is still exact, and the sixteenth one triggers
> the wrap.  A compression block is 0x10000 bytes with 4 KiB clusters and
> the fixed compression unit of 4, so all sixteen fit with room to spare.
>
> Phrase tokens are bounded against do_sb_end and so return -EOVERFLOW
> instead, and the
>
>         if (*dest_index =3D=3D dest_max_index && do_sb_end > dest_max_ofs=
)
>
> check at the top of the sub-block stops firing for the same reason.
>
> Use int for both, matching *dest_ofs and dest_max_ofs.  The narrow type
> came in with the original import and survived the removal and revert of
> the driver.
>
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
Applied it to #ntfs-next.
Thanks!
