Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED43C24EA90
	for <ntfs@lists.linux.dev>; Mon,  5 Oct 2026 02:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791167203; cv=none; b=iGh9rg04ZXL59+7FNfCT+7xCYMqvY6rME1qX9QsdbrGU0E/zD9CCXdbeJhfeBH6ekcrtLrHFaXKlBD62/cTr9M+u+LlB2OdhR2UXTDeo9ytgkLFKN7Eg1hitQp7Yhm5vh9MTRGg/EiMm8lbUPJtP6UAeQ9JNiX3KcOa0ZrICEx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791167203; c=relaxed/simple;
	bh=BZu7kbKm7tXVt4cHXmSjQCuMo1kUNFde6jUcPtpGWN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=upziEPgmZ0nXCsbP7v5IRdtHbApJeqU1zU3CTiYEjTREx3YI/zy+y4qRDtx3srlRpA6156jwe3rj/lSwW+j2tMrBaZsLSBDhhZseVjP80ZqD2kcCJlYQJI1tOhcffibopZ6bKkC24dh3UZB7QTQhuDALdZB5oZGAdV4ew4s9hcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZpFxUfA6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZpFxUfA6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBD61F000FF
	for <ntfs@lists.linux.dev>; Mon,  5 Oct 2026 02:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791167201;
	bh=fmBmJMA9CHZROT69fKavj/o6WX65hjRDOpiQKalyZuo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZpFxUfA6rBd/KwyHo8PsNODPMrCEargjylR7+P6JUKsosVxR3Gqws1feeuwsRUuY7
	 Ukz+GN0TZu8vWLZ6EZbDKTJiANu2/IB8Mm3XJ2a/3Q2rbtnhK7pWh1aOBbz5cgXLFR
	 sAWULgMtyTg9LnC2r98LEEjIw+bZMC+FA8HvpxylYIpiKCfAGYx10i0hCHcgOsMzev
	 N3cD/5rSABBYz0YXmv3jjQNSuJmpedDxHpHHOVxWMoWGZgaP2Tb0Bd9qm6GkZfqLx6
	 X0/ovHJMFaE14WYoq+tCG14rnTOJPXh0Mr7c0EUq9EZARwDO1n354bqMnTl6Dy8yaM
	 EY3lTOrMUR4dQ==
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6af82ce3c83so1856820a12.1
        for <ntfs@lists.linux.dev>; Sun, 04 Oct 2026 19:26:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzPFOLm70RNiuqu0+O8bYv0vuCgXG75+fCHxeJbdEU6y33N7ZviqFE+43Cqu/NwWKbdQvgW@lists.linux.dev
X-Gm-Message-State: AFq9FYIVJgrM2j/esTFTal4R/FzHtoPfJTrV6ONIJTslJexnVmiHtdYB
	ex9DTu7lXAWj9wjdW72vApzsHOrWhjjbJFqYXGDI2Rvv+RU7nQq1dwyidsIa1ehLI77DKf7kuHK
	UaLPV4s4gM1z79BDed6wLCG/7zx+1/18=
X-Received: by 2002:a05:6402:210a:b0:6ac:6fd3:1e97 with SMTP id
 4fb4d7f45d1cf-6af9e361a2bmr7693828a12.35.1791167200235; Sun, 04 Oct 2026
 19:26:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1791107674.git.matthias.goergens@gmail.com>
In-Reply-To: <cover.1791107674.git.matthias.goergens@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 5 Oct 2026 11:26:27 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9HfQJGC14R2o1zxN__DQwg11RXvpZXmdSRN5-=VjVEJA@mail.gmail.com>
X-Gm-Features: AclHuK-rFEsyGvCTAXbMzRjNRbIHSZ2OatIr2asBmKKfNHcSM9hMdklvE-i9bb8
Message-ID: <CAKYAXd9HfQJGC14R2o1zxN__DQwg11RXvpZXmdSRN5-=VjVEJA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ntfs: fix spurious EIO and ENOSPC on nearly full volumes
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Baolin Liu <liubaolin12138@163.com>, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 6:56=E2=80=AFPM Matthias Goergens
<matthias.goergens@gmail.com> wrote:
>
> These fix three errors returned while free space is left, and a
> contiguous cluster allocation that comes back in two runs.  Patch 1
> fixes file creation failing with EIO on a nearly full volume; it now
> goes on until the volume is full and then fails with ENOSPC.  Patch 2
> fixes the cluster allocator missing free clusters when its start hint
> lies at or past the end of the volume, which empties the MFT zone, and
> patch 3 removes the fallocate() check that then fails every later call.
> Together the two bugs make fallocate() refuse space that is free until
> the next mount.  Patch 4 keeps a contiguous request to a single run:
> fallocate() zeroes only the first run, so the clusters of a second one
> kept the data of a deleted file.  Reproducers, run with KASAN and
> lockdep:
> https://github.com/matthiasgoergens/linux/tree/reproducer/2026-10-04-ntfs=
-nearfull-v3
>
> Changes in v3: Namjae Jeon asked whether a contiguous request can still
> get a second run once the search has left the hint, for instance when
> the run reaches the end of a bitmap page and the next page is skipped as
> full.  It can, on that path and on two more: where the search wraps to
> pass 2, and where it shrinks the MFT zone after trying every zone.  On
> ntfs-next each left 16 of 20 fallocated clusters reading the data of a
> deleted file.  New patch 4 does what he suggested: before setting a
> cluster's bit, it checks that the cluster follows the run, and returns
> the run otherwise.  Patches 1 to 3 are unchanged apart from Hyunchul
> Lee's Reviewed-by.  Rebased on ntfs-next.
>
> v2: https://lore.kernel.org/all/cover.1790853718.git.matthias.goergens@gm=
ail.com/
> v1: https://lore.kernel.org/all/cover.1790503811.git.matthias.goergens@gm=
ail.com/
>
> Matthias Goergens (4):
>   ntfs: set the attribute list size before reserving space for it
>   ntfs: restart the zone search when the allocation hint fails
>   ntfs: do not refuse fallocate() when the MFT zone is empty
>   ntfs: do not give a contiguous cluster allocation a second run
Applied them to #ntfs-next.
Thanks!
