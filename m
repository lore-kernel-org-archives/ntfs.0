Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974360;
	b=inBQipMuAjtuga6J0J788/EXS3nuIFCBoj4t02F2uVX10ipo2C3p7XpEXLGxGx2TOEHB
	 TqcZ+6V940B3dNnQcvp8E+rCGApwVmOKZsnxH1YmbawONGOfg8wA/d9hipIp3fe5XmPB/
	 ivGxKEA/zpifaSKNHO8/n2T63SNm6HzevkXLV3NghJQYWW1JXCDzBSzCX6jfHhyPhAGNI
	 kghZCNEkvQNNrJlWpKGYlHbrG0zXeCGQ7FvaThczagU8/55Dm7WK1UPo9pkxw3DY3RLzE
	 tzaUEvx7iIZhFdw4mKflQ2NWbJwi3DGeTcE5mLXYkCVjgmUb4Gz3crlGBqtVslshmOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974360;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Hy9Nb6PTTUob6aohVhlErbLUpEbw+NLmXu1l6Sjgt7M=;
	b=ECCV4GmdBNkfQKFx2k29HrXVD8/LK9QhueaBIPyNCbWormsdR7vKCsmVpFFHdM4BzlkO
	 BYj9uh5r1VjMN8nmA9WTkXVU1sFGHMe8QSsk9RmpMo9th8LySHdE3rABYtfcKl5diAVeI
	 kg/YymKmGFzQ6q7VD8fSsJFNDIclyxEJG1jmLQvp1EUd88kpdej5ldoY7sDxI0C1NR50V
	 fKRguOkrSkYrtY6w/qnLBjX6y7A9uTJ7N5EEKU4YshkIua+0mEMa8lEioHAQSqIjmMamr
	 qK27G8Zj2z6YroEw4y5OKTKwiPmsAhoE2xWf3OjDmZo8OaMo8yuizLH4dUGx7BJ+ccw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzH98RjQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7171606A32C
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzH98RjQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1301F008A3
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 14:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974359;
	bh=Hy9Nb6PTTUob6aohVhlErbLUpEbw+NLmXu1l6Sjgt7M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TzH98RjQsHDOqeXhw7sIiddkbUl76gvevZ2XcY843kQ1SCq5N8euopxVsRxB9TIAe
	 rwaJf+Rut6RsXnRzA28n5d0Hr4+eMNEjyAnfLRu4UShUUAN/jwWKql4t47hRzpu6DO
	 Em3hWPDhvGt3eDEUiZv0euYdchAOf1WS15AgvkKqWIt8rUwgFO20KjGBGOyHxT7QeT
	 T/1dxLzTDMJZ4iJXCwp8JbYF/mKTSaTDlbBWXOI9h/pdSkxpvjI5Bz+CeW5njrLrxr
	 3L6XLS4cEveqTNRoakjgnBrNH55we73pSdMmq7UjiIHYzhXfsOpan383dscrdzvQxl
	 /OOvDsNFsoWnw==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6798eb0d190so514252d50.3
        for <ntfs@lists.linux.dev>; Fri, 06 Nov 2026 06:12:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGqztQ5Fyo1J8s+Cx7bbpBmn6oStobBU4WBvdtAhI14g0ae9JDO2yQF0sc2pEHcVD+17n5e@lists.linux.dev
X-Gm-Message-State: APuU4Z/BJivQYifmOPUOQjEBPVMKYV+OxQ9IMdmFQjDb0JImN9V30+rI
	fnp5/gSvXT3jeUPxdtQGvbAR9pxzmwzqoKmgDhLsXHHSJEt3zIi3se1RuHgr6lZlcYBBHVVYviR
	QBuJF+7vM+qSKmEuTcdptWBYN1PxztD0=
X-Received: by 2002:a53:e808:0:b0:67c:11a9:bbfe with SMTP id
 956f58d0204a3-67c142c4275mr1111242d50.20.1793974358607; Fri, 06 Nov 2026
 06:12:38 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261106124553.2617026-4-wahidzk0091@gmail.com> <20261106133110.2659482-1-wahidzk0091@gmail.com>
In-Reply-To: <20261106133110.2659482-1-wahidzk0091@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 6 Nov 2026 23:12:21 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
X-Gm-Features: AclHuK_T2DQUMc0OEmrubLWb5yXs7ugphPBK2FPnifKmAkfBBAp1bb89FaW0bos
Message-ID: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ntfs: do not convert a named $DATA stream when
 making room in a record
To: Wahid Khan <wahidzk0091@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:31=E2=80=AFPM Wahid Khan <wahidzk0091@gmail.com> =
wrote:
>
> Hi Namjae,
Hi Wahid,
>
> The Sashiko review of 3/3 also suggests skipping every AT_DATA
> attribute in this loop, not only the named ones. I'd keep the unnamed
> case as it is, for three reasons:
>
> - Converting the unnamed $DATA from this loop is what the loop already
>   did before the patch. The patch only stops it from pairing the length
>   of a named stream with the unnamed inode.
>
> - The lock order the review points at (mrec_lock held while
>   ntfs_attr_make_non_resident() locks folio 0) is the same one used by
>   the direct conversion near the top of ntfs_resident_attr_resize(),
>   before the loop. So it is not specific to the loop.
>
> - When an EA or a stream grows in a full record, converting the unnamed
>   $DATA is what frees the space. Skipping all of $DATA would turn those
>   writes into failures.
>
> If you'd rather drop the unnamed case from the loop too, I can send
> that as a separate patch so the two changes can be judged on their own.
I think making the lock ordering consistent and using ntfs_attr_iget()
for named $DATA would be the right approach. Please check it if you
have the time.
Thanks for the patches!
