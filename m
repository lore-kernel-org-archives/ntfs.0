Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C02F309EEC
	for <ntfs@lists.linux.dev>; Wed, 14 Oct 2026 12:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981925; cv=none; b=L8VYhc7qI0/LTznSYlg6yKDSGQW7suIGUn+85tTD480fInYYpChj6ee6OvIhwolOyk3mVC6inPCzrv0mv8RN4BdSWKKCm+Ds6QEDzxAX675TY4vMq2Sxs9OII5KMThXACU7haHFxRmI8jVrS9CweHMOF+kyeLUi+5M+Ivib9mZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981925; c=relaxed/simple;
	bh=+sdmBdFqZHNG0saDebF+xCMGTvp5ngjZRqxxK+4anpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+1gtvrR60xNDN4zcvRL+ZNfk3t+tTCCOUGFzjtWnpO5/DAB2cjk9iJ9GRffRxfj3nGcuR2GBYBumCqZIrrNs+p9Pja1B80f9KCnYofX1BlLyASndRoqs2cqJzwhNW6sNV96OEvsavO0RAKaaL5nm0nAu3Tac6ciiekvOC/oIe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etc+yaiC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etc+yaiC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EB21F00898
	for <ntfs@lists.linux.dev>; Wed, 14 Oct 2026 12:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981923;
	bh=+sdmBdFqZHNG0saDebF+xCMGTvp5ngjZRqxxK+4anpw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=etc+yaiCmizEvDAA/dn3ncgfMKWvTxZk9G6FoR4J8lPLtPATXCCHtXRqICsgWDuFQ
	 3vTtlQtOfYkgdg1ispFasknuudJ6lfHHNVj5M+mUu7X5wocBZ7MDuMO5tu7yjozOIE
	 xt6zg220V7zN4P2CfMvDxO2+WzMr7AXie0RhShuZjV7mr8sdCFNPJJmii4x7p36ZVy
	 Oj0PJAsiZ3pTSOIKm1jRqdlzlogk28r9CBye0ZOYif9WPDy6uFUEOsFlZ7nHM/oNSv
	 wzhHN1s1yOVP286igrOckTkKQDv6YVyJpz6/NYgi/oVQWoMYtCQvlvOUi4SmjQxizO
	 ZmDobKLqIxduA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso1305352a12.3
        for <ntfs@lists.linux.dev>; Wed, 14 Oct 2026 05:45:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0Lr6mo240g3SdWyuv0Vigove5QhF5k6UyMy8DnPeLIVYM+NAWqeyc2SjtDMJYUwP0jl31@lists.linux.dev
X-Gm-Message-State: AFq9FYIH9tD7ObNfEH5MVZOcemBuGmFfjLGYoywaorGe7kNFtOUFfzTZ
	hd+SKl5ZBaJ1el5a7iP9c9MU8ibWeZxEGwNj042YTL6YznicAmPSYgzGtSpJ4LIih4w/SbQ/Ge0
	0DVhd2TvztSaOgnuYsc8lPgXTBCB+FFE=
X-Received: by 2002:a17:907:7f90:b0:c2e:3124:e9c0 with SMTP id
 a640c23a62f3a-c31a9b0ad3amr1448474166b.17.1791981922184; Wed, 14 Oct 2026
 05:45:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013204931.2287813-1-arnd@kernel.org>
In-Reply-To: <20261013204931.2287813-1-arnd@kernel.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 14 Oct 2026 21:45:09 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-JAa2ZCXyHwUrD67z-sKj9Mv4Eb+1AsfGFmQUUJv3kuw@mail.gmail.com>
X-Gm-Features: AclHuK-JpYoq_88nWVDFLtCUhY-23i6GLaz7FCmTKRSJ-CnbTsEH2teohLDJ-Rk
Message-ID: <CAKYAXd-JAa2ZCXyHwUrD67z-sKj9Mv4Eb+1AsfGFmQUUJv3kuw@mail.gmail.com>
Subject: Re: [PATCH] ntfs: avoid unnecessary padding in uapi structure
To: Arnd Bergmann <arnd@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Arnd Bergmann <arnd@arndb.de>, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 5:49=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Building the uapi headers with -Wpadded shows a warning that
> may indicate an incompatibility:
>
> ./usr/include/linux/ntfs.h:91:1: error: padding struct size to alignment =
boundary with 4 bytes [-Werror=3Dpadded]
>
> This is relatively harmless here as the 64-bit members force natural
> alignment, so this is not a problem for compat ioctls, and I checked
> that the padding word is still initialized by means of using kvzalloc()
> to allocate it, but it's better to avoid the padding out of
> principle.
>
> Change the reserved member to use a 64-bit type so the name field
> starts after the structure and all padding is explicit.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Applied it to #ntfs-next.
Thanks!
