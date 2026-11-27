Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780255;
	b=gg0vMu4SPCy8F6fuXFhK5P11DMFqrV07hz0Yxq7/WmoQgnkdXCqbOUj9q+QxHGF+uDi7
	 quM/jkTVRa1JRjEkgrgs/+dX80a8i+yQ58iMf+KQ5cEK7xislcf9TwRIo20BmslqFoDn6
	 UbmapMlva1fa9HRADZQM4aHNrfwEXG8WOus0keggmThJedEZWMwEigI6UtOrCs7PCZSxP
	 Vrm4GnQGkxl82KjQFUN11owegq9bxa78+lF/iDovC5RWne09+517LLP1n9KEfW6ZdFlVN
	 4EUZmdjfZcnsurS9CCh4edAkCOryBRtvXFXjL27vV6qoUQ4/9KFmyQ064z1GOoIkaqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780255;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lN2obwQ9zT6PeSWONEr+vd1G6rQvxvgPzKXPWi3zu7o=;
	b=I1nIopqMg64IuO+1NDkFV5BSF5qZGWZB4E0FhX+Yww5H3+VOxrJyyXUrarzbo6waqnHr
	 DnTbaC8FGhh3fqu+cZ98ONga6udo+UnbB+XAyt5ys2tcfaGTGmrajL94DhUx/Xuwii0mm
	 TfmaFb5+BMN/rzbqLZR4JUEMsdDokOq4xESBauZIRil/S5XDlp/C6JOy8zmqI3bNTPCvY
	 k+bJpLtLldjEwqNxC9gYWurP+3IAsPN/mmTFIvs164xv0q1r1JLY5DxrzWTrNRaQsNwaL
	 CCIBmlwS2J2PV7wODIyYog0Yu++zGg+e43RGo6X3bLAKqla9iESD3rfkKRyWulmsA/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4kk2ZOY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A997A606A31F
	for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 11:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4kk2ZOY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504A21F00893
	for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 11:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795780255;
	bh=lN2obwQ9zT6PeSWONEr+vd1G6rQvxvgPzKXPWi3zu7o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=V4kk2ZOYx0FmjDQKZxvg2MjvcL3mx37xpUpi2SHiRS4er1KXFPT7G4a+WWQn1eLSE
	 XvwmM7nlK3sVAu9jclAP7Q5DYyJmvwWIFmYCa/Hi78pU0DWRrgoN/ydNVzvf5zIMsy
	 Qsobc46rJDIJ4HICsq8/Oo4bmKEmC2ay0/JH3XpdIyQPy7ISxa8yOpF4njgKhtxdPv
	 w6lD3hGbD7LscYV3Y4wzmIdE0i8m1UKjHYDL1NUZ2IGP90s682lywAb25QKkS3OwFk
	 sifnU2qJEl3KoQLHHlcjz2T1gYdw28sPMead3i+hk8/PoKDGQ8ia4bZljkHd928bRV
	 z2UPb/tRBtnpg==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4395d31228so1367144366b.1
        for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 03:50:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEbZS2/dcjI97G+xiAWYZkjDdUPEQfj9Hn/j26izNGZBgDZbF29I4WBjyGNDk/0dwYjZmaZ@lists.linux.dev
X-Gm-Message-State: APuU4Z+7ftzCC1gaTre6gZoCCXqDIqjjSnIzxqK4cHwqdY0cZuJKrLA0
	DGh2/Pej46bHwN9LPMNYZILvms17sEdN72DrHcY84V2Cl4uqPRPmXa9JNhCkazxA+tpUZo5sJbg
	NXwhwSYgKwmHAEWAwHJAo8QswkZWIjL8=
X-Received: by 2002:a17:906:a256:b0:c3f:c878:7c1d with SMTP id
 a640c23a62f3a-c513a5e1bc6mr1669269466b.9.1795780254004; Fri, 27 Nov 2026
 03:50:54 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261126233846.540372-1-hyc.lee@gmail.com>
In-Reply-To: <20261126233846.540372-1-hyc.lee@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 27 Nov 2026 20:50:40 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_cu1j6bOKGSFoAOjBn07sedSd=VHqnavaGKdYUG_Ov_w@mail.gmail.com>
X-Gm-Features: Aa3M54oCVqSuAd-DDTVso8BY51r1xSVdKBckKFtNVzvv3ddPHXbcBzW0t2eXp_4
Message-ID: <CAKYAXd_cu1j6bOKGSFoAOjBn07sedSd=VHqnavaGKdYUG_Ov_w@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: fix false directory corruption on
 case-insensitive lookup of POSIX names
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>, ntfs@lists.linux.dev, 
	Sazpaimon <sazpaimon@cultnet.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 8:39=E2=80=AFAM Hyunchul Lee <hyc.lee@gmail.com> wr=
ote:
>
> On a case-insensitive mount, a directory index may legitimately contain
> two POSIX-namespace names that differ only by letter case. During
> a lookup, ntfs_lookup_inode_by_name() treated any second case-insensitive
> match as directory corruption, failed the lookup with EIO.
>
> Keep the first case-insensitive candidate and continue the collation and
> B+tree traversal so an exact match is still found.
>
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Reported-by: Sazpaimon <sazpaimon@cultnet.net>
> Link: https://github.com/namjaejeon/linux-ntfs/issues/99
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
Applied it to #ntfs-next.
Thanks!
