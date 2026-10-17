Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD11638399E
	for <ntfs@lists.linux.dev>; Sat, 17 Oct 2026 01:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792200862; cv=none; b=chPcMZIrNV1npis5Mpnn8cHbFKTUUs16fXoMgGPK4R8GD0vpCKOXOPwS3Drykpw8lLoMShQBxq9sIV8MWt7Cfri90nOciZd9LKWYuchYBW2vd1gtZoCpn9xutnoK3cFN30sajT6+WpA9ho4BmbTCwHUJRZqiT0sCXa645RHOTYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792200862; c=relaxed/simple;
	bh=OyLWKnjCcaitkGnW0yPKGxPK3/hNI/n6ru3X+ZiRGso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rroC+rK37DK8pfncyenKvZtz1uVeG4wmEmSD+/umTpgl5M/Gko+W8l+euoGsuRyoZ0Bu5Kyr6Coz4t17uSuzZhhlKJDvU/rnBQrFtn5uZ/DSFCNhvK5AyFOqt/NmC3VYIl1/W98/FZTKiypLRZJCp1z9aIZ4fgqAK/2WV3+oZMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SczjP/HR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SczjP/HR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5982C1F000C4
	for <ntfs@lists.linux.dev>; Sat, 17 Oct 2026 01:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792200860;
	bh=OyLWKnjCcaitkGnW0yPKGxPK3/hNI/n6ru3X+ZiRGso=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SczjP/HRZ3AJdTZZw7yQn4jb5vt7v58A561hhUSLEkqD65l2fharvQnJ56ANl1Un2
	 tMnutO3MuCzh4nDk06FKjkb5ux3rMGB2PYvXt3d/ri6CpuTmuCjg0Oqz6Wz/2UhlU8
	 xjsl52aXwnaqz0C3lI5WoENIHBEupZnaaTsm+z8AAxShSqGdYZbdd3BugGqGfaTUmG
	 YDFl5iIyyCpFrsMMziTfX8E9+aeFYzOCSS9tl7Cr5MzwOEcm8alAaS6OUD2oKyscuz
	 EsCjlTGn7K7H8WuKl3H9rVgmixDb3HjarmaIyQeSzRIsKhiPIoFCWj2Z8c+aviXHU5
	 W3ia/eXE9lc9Q==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso497118a12.3
        for <ntfs@lists.linux.dev>; Fri, 16 Oct 2026 18:34:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz+uKtIZhZhiuKdcH9FaSQIE3Vfy3esoIFB1v6u6Pz84tvdsLz+99eHgXjDktcYm1edy9BE@lists.linux.dev
X-Gm-Message-State: AFq9FYI/Cm1HyI4CKj16jVi6s1WPtMhtgwgrE5VQJrFe0GUhvPOXonT3
	cpAF1CUpAKCase65ymIGOWFKADwrcuoMqLH3bpTHNWNtV514J+hxlIzbvij/NdF3WKlVVaLQiAn
	Z/xmFYApDejNTVbu0kWoaVgsPTYW17AY=
X-Received: by 2002:a17:907:3e15:b0:c2e:808a:f78a with SMTP id
 a640c23a62f3a-c419f31b40emr99910466b.32.1792200859037; Fri, 16 Oct 2026
 18:34:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261016030957.1053110-1-wangxuewen@kylinos.cn>
In-Reply-To: <20261016030957.1053110-1-wangxuewen@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 17 Oct 2026 10:34:06 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9pU3edmgpDw1+qqz5LZ8NMTQKgW2gSX4yfk9nD2auzmA@mail.gmail.com>
X-Gm-Features: AclHuK9iyf0yT2FnTgOenB5xDy5fxe8J_3MJaIkiNpqGQXYz-tMatY6etY51pmY
Message-ID: <CAKYAXd9pU3edmgpDw1+qqz5LZ8NMTQKgW2gSX4yfk9nD2auzmA@mail.gmail.com>
Subject: Re: [PATCH v1] ntfs: support persistent noatime attribute
To: Xuewen Wang <wangxuewen@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 12:10=E2=80=AFPM Xuewen Wang <wangxuewen@kylinos.cn=
> wrote:
>
> NTFS currently rejects FS_NOATIME_FL in its fileattr setter. This prevent=
s
> users from disabling automatic access-time updates on individual files or
> directories with chattr +A.
>
> Store noatime in bit 3 of the private $LINUXFLAGS EA and restore S_NOATIM=
E
> when loading an inode. Report and accept FS_NOATIME_FL in the fileattr
> callbacks, updating the in-memory flag only after the EA update succeeds.
> The VFS then suppresses automatic atime updates for the inode, while
> chattr -A restores the mount's atime policy.
>
> Document the new on-disk bit and that newly created children do not inher=
it
> the attribute.
>
> Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
