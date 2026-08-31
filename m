Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D72B3B0AFA
	for <ntfs@lists.linux.dev>; Mon, 31 Aug 2026 05:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155714; cv=pass; b=KoOdxNu2dwAngn5up1OrBQi0Flm+378vnpiMC13urs/QSiTA6oFb7d2mpO98PCUY4VbDRyFW2RjwLCprgopGHWMWVB4gVY8S0c23/Qkav88cNEzqGV9zMI46LblpAHjpe2tvTVj1xom3xQ1uBcT+IhNk+Z7qF3wvINK54mhaOAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155714; c=relaxed/simple;
	bh=avFXt2NwZSaJmZTlq/99ONsB7S23gzDNnpMAoXMT6+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BMgMhFfgcjEVxSgiHGZN9RZXNhvWU9KALvh1HcyX8vFO2dX/sONneMHf4RqY00BM6du86rD/QDgJhj9MuY2cHiEeXxM3X+QhGzBR5QJxzT7xD6YRYxdtN2SAsDpeAHmjBiI9jGsxpnF5Km06uzr0ZgJevwyntCJ+tEI7iCMvKy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTCo50sk; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTCo50sk"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a20367cf82so25632681fa.1
        for <ntfs@lists.linux.dev>; Sun, 30 Aug 2026 22:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788155710; cv=none;
        d=google.com; s=arc-20260327;
        b=exeCX+iC9cwyrVr5jgklbd2wJuoykT4Ittysk6YKdbRznE/gIZUZWeatW91GSwtklk
         CtglR737v2NM54d9j7EwZp2NJ1ePjx78ZMU7zLL1uGqJuYeThULuLfsbJ8zHsHZKlNRe
         EcR5M9TiuqWa80jL50Vt2uQsQzCbtscbVD0Yd3buh7pfZNB1+anYnpDL9G9Je3ZkdUBn
         0pyu1gliu6+c7N4THY+X8yfkpTT+NJarpXfNthpjpoKAbG2nTaJPj45OhG14rKJ09BK1
         oDpbBZciBArTOGWN9BaHpwwjer00efYHXZVzA13ZJrryf0pDSiw9uYBd7D2pja3WmnAa
         GmGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7sLw2AeV2P6KNEKrsx6930m88AgTvdoPZQBUw+YeVAs=;
        fh=Mp3L9thq3BGRQy8S0ZG4HCHvjBYZpXOy4TMctyVlVZQ=;
        b=ZASKge1OK9A6222qjRnn5PemabY9jdNLF6Fkxsf3vlaCZ5+KE7Lg4Du1CNDwPSJwrF
         7ronpVQYdMOuCcaH5lfenaO3NlAC1eUvVvPmhO0nCod30tmKpGFTN6cBpfFnQrjCnoXP
         gkutVUp+RwRi4G8yXSgU4tVo43W1eadr6hm1BvoHPwaEhPUjuQeI9HE3xxrvvun6dEOG
         xuwoIPfS0xZdS1wwi5qyebWeNbjgZQq6vfDFQXZoMHpiBufHGC4Bd9yU0QJJG1vaYByg
         9PTk80a0PJJmwuF2JWZYHukDeLV6ISRO7SD71SDFieNFzBKRe9LgWEyi8dGz2fM3xL1D
         Ygqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788155710; x=1788760510; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7sLw2AeV2P6KNEKrsx6930m88AgTvdoPZQBUw+YeVAs=;
        b=JTCo50skvJ3D7I1Pc+R977WENU9i99DfFz996tAKRe5tEfSEU3qgP7ag2bB4g9y5/U
         7/TzNa4i9RgMI7/WgQHSeGP08p2P3860WDYOGsHsW3Qs6Rx57UtMnX55gTVZBOckuw4v
         /rpgFO0uaO0bAYeRNcw5jBAETv889ulvYWU4g0n5gO8hdzbudgP0b96nbHfPGsofGWsx
         NMCfvMW1sdIK3AuCd2K5nrIVRz8QxYYc7qwwoRILbp0Hg1ZsmoGgo6BTUPFnQ4JzZ4o0
         x60DzXfGPsOXHpBqCbo5gb9yJ6MvDKDheKSkd+fbJqkYr8Go1Ze6GSKoMKapyCmIC5H0
         rUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788155710; x=1788760510;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7sLw2AeV2P6KNEKrsx6930m88AgTvdoPZQBUw+YeVAs=;
        b=CueOgwD9F6xIrrMZpBy5fS5NVZChBPQmVXwpCYmgqrGVQ9vMQepuWTTMeGI2062v5u
         HEWuUZCH4JZ8/j4Dmjzam38spBhCmjAqnIp2SJ5HDf6tVujk+Ql0PVoXT8VOOtY75LoE
         3tQ79GMJ/6ktmo+g7iR+Xmz/87JjF05puph9LKV5kv/Gzk09qXkhwCuHErk5+RAz+iVL
         5C607HCZAyANsfJkj/SL+44NOlh2hd8Np9IfE9oVvcxBL/Qr4VV9yNFTv9vLoPqq+bf4
         Wr38XS4DbHJ5aOqeghLb7ZCjFIgYU+gv0J5T7Jko9Od1KR8r748f3V9UQh/hnm257r0+
         FbmA==
X-Forwarded-Encrypted: i=1; AKwUvBy8ZNRvLdH7RoX+xl1/Qeael0UO/aTscddHG4PnSCuNrzWm0gR1VlcPNsa5FNjM9uSzmXog@lists.linux.dev
X-Gm-Message-State: AFuF++kKsCG1O+Agp+FGMnobpOXItAxdOWI6qEXpusvdTuReKyCmrInq
	9KAIz01elEMQix4S/jxIDRwnDZsQCnTR+6soh5BjuCuLaQruJ9XTRwqiRXlkZ+fCT6BTGYr2SMi
	yxXWRtn1VOF4vzPnFiC8WMMXhrHJPVmQ=
X-Gm-Gg: AYBFou0zL8E6vwqelssfG2ynhOgwOL7g8OkL4D8kgqcxVDgGeuffHsXxthr6bOSCPvD
	vJv701xaa5V9skDjvfH8yvaqD2rkADyhdS647IMWCWJO2hFX3pETv+eXcYgGndvicuxXFLZPB7O
	Hw22aiwuxEw16AxJ36cOw/jUoJILUkWs9ojJCcH62EgWj7My+WVNyRfEqeKLjdZnR8U3mQ7UIB1
	eRKDQkFegm8Bp6hhdJrS9pc+Nwdh6kr0e598ZimRomrGeXOqjfi9MdGPnj5zvUHkxsnIMfxssqN
	8zFynX1hfDragR3X4m6axxQdigh8M+zmW9g+GS6rlO/9
X-Received: by 2002:a05:651c:1117:20b0:3a2:522:c75 with SMTP id
 38308e7fff4ca-3a301acf03bmr40336271fa.4.1788155709731; Sun, 30 Aug 2026
 22:55:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260828061607.240845-1-zenghongling@kylinos.cn>
In-Reply-To: <20260828061607.240845-1-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 31 Aug 2026 14:54:57 +0900
X-Gm-Features: AcwNN1Vq8QdxtrNHIaWYU8Wnk45GDQtB2EcUMzJdPzNM04Z_J89xYwtm8Deytzk
Message-ID: <CANFS6bbkTT1eXQ0DC5Xi1NW8LFv91Dv78ebg-nXecAZ-v1OLWQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ntfs: take invalidate_lock in ntfs_setattr_size()
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 8=EC=9B=94 28=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 3:16, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> ntfs_setattr_size() updates i_size and resizes the on-disk attribute
> without holding mapping->invalidate_lock.  Page faults take the lock
> shared, so a fault racing the resize can resolve a VCN against the
> transient runlist state of ntfs_non_resident_attr_expand() and fail
> with a spurious SIGBUS, and can interleave with the size-change
> epilogue (truncate_pagecache(), i_size_write(),
> pagecache_isize_extended()).
>
> Take invalidate_lock exclusively around the whole resize after
> inode_dio_wait(), matching the fallocate path and other filesystems
> such as xfs, which wraps truncate in its mmaplock (=3D invalidate_lock).
>
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

--=20
Thanks,
Hyunchul
