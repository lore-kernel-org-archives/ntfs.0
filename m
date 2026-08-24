Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6E42571A0
	for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 05:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548274; cv=pass; b=eYUxxHQYThd9jzAEWcydBQd2p/Jy+HNVQXu1OIY4jrPW0lYjh+S2bK+mFpJI2V2c6fwZylHoKOLHwNolzvSta5SOrNgR3Z/woopXNzRWKzEMxpTPL2UzNGEe+83CBo6jKCNG48SyYNINR67xKShG5OzOdqr0rLyvVPVVSva6pXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548274; c=relaxed/simple;
	bh=syVFrfHUZoPooMoiT2lA/NxNbP/faAxTUuH817VOdWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a55sE81kbSERuI/JcvS/jsOWSWA3SwfK9jtZ73ZwdQM2C/Lxc6dfs0rt81YMbIuKMiE1iy9xohhJHwsjVU8Huo4OH6WlytNkg0gjd73H3hLBDyLfMwtylMaXWDyUvSLMce78FKCDNuq2s7LRLcyk2DbzqrwShkBjti48k7v0ab8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fksRRsK6; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fksRRsK6"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b29599b81cso3720642e87.1
        for <ntfs@lists.linux.dev>; Sun, 23 Aug 2026 22:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787548271; cv=none;
        d=google.com; s=arc-20260327;
        b=NQ5r5L31sptmxAc91ovvfmetPcw5I/pjgMwc9B8GH9rzBPThVfy1nSMughWHYWlrpi
         ZlVntHFr+xAFavgAdA5yvJzAjp46meV69Q6h7W+8ubIu3exasUMDqaSBIHQOXHqqfMRS
         HUxxbE8MX1uTrUwnC9GKLMoOA+UQH2YAKFXgED4gFvbYnBBEEnaVqCf6BdSTXtmrF1kh
         aneNAEik9rG4dbRjCZ54ivo4CrHklZzNaX62isOV4CieCTZZNfaG1Op3YHjW2D/9QyHX
         IeUL4ZSiSgDFviRGjKC10wfXTgTFqT7lWHYxfyKMUKQHd1eUxrD0QMULn2zCuBs/eRlN
         gHFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FVAV2ln1ZZcw2izZI9m/oJojxsUhwNhihJROEMqfK0E=;
        fh=QNe1FqBL0rsRwHp1zwy8yxo8OGoVP/ysQ/zD3We25/A=;
        b=SreruCEI6GRKOO1x8iOHectplLUJfu9IR1m8XDFUvFM97TAW/DwNOVeBv4t4/NZ6Xw
         mWvbFHUmNykkoG1+wziQzMqHW3eF7ezW0yQb1NXdpr4pVKOaaXQzKq0MlzNLOx/h3h/+
         eLuC9n5PIK8NxlUWfZstNq6MP/Ef4dfy3/6NWgVA7+HQQZVfyAIhN/oX1V0wY7PL5uTm
         lwaLM7zpTltPYZ1ohcYCd/wnRHTGL484bevP4ZzLyMq50ugcO9WVTsVXRS2qZbAol/lC
         KW2zy66Knu6QPy6F9ILOFWQ4Qg6tuYxQX80R7McKtbTJdtNV6CWuaM58B/bGt7DRXlqD
         mTnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787548271; x=1788153071; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FVAV2ln1ZZcw2izZI9m/oJojxsUhwNhihJROEMqfK0E=;
        b=fksRRsK6MvvoAjgZy1AH7SqrWW13xM6UoJVTFx3YojPtKC+RbPeDL1NBAifBKhYDDl
         0rHWWqXmTAZoqHt3C50N0QgGZAhQsnNIqGPUuKWnzeGWHNOXWtCnSjdPeAflEgqvcFjU
         HgDv1k3EhAs4fS9bQuCc8igbbEckk0buv13Zc1RqztyWmNglU/g4cg0hZMtv25vbvyrC
         S4cF4t8n4KfuPp4TqYYqt56TDeLMhRvVR70l2apQfuNUlwF3QxU88bdI7XvaRuwbT+ES
         5IWZLFbHiiw769UPlMQoRDUOgEOIAJiVGkhhiyju69HlN/HXfdwZfvRoEjnqOMQexKEl
         ZbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787548271; x=1788153071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FVAV2ln1ZZcw2izZI9m/oJojxsUhwNhihJROEMqfK0E=;
        b=hDqCkPTM4vapM8RwGcfJvBpGaw2Nkuzf1NLphG4ufX+9pdtwUaCLk4GFi3EtEjGVo7
         9Tv24fQYqfpxbDkFL2IFHu0fXMabK+5sYR1+GIQsS3Avm3Clx0y0DdueWTU8Npt5KxKl
         k6rt4qAxx1t/OE8EpJn7ATZ3586GFV3j3AUgfCl8ftGveGo+FhFvAnaBXxFMHtpBJXXJ
         V9T5rU9bFSJ2t2XIhtk020WhAwcBG/mIOmwt8/OMAIDtlDmiuM42rbKbSKZ9YLe0gW3c
         c2L5q9NzF3fsAT+c1QaPH2IETmv0h0Gbv9fnrzZBk/dk4EteEczxWUbssRHO4udAdxiO
         O26w==
X-Forwarded-Encrypted: i=1; AHgh+RqVnKJyMxNSEf8ElK2IESSP+LEKFFywaDtz1iHpUyYbKna1SF0kDmmC6jYHsC9qrepAa97f@lists.linux.dev
X-Gm-Message-State: AFuF++mPfJ/RuZVRx9G7sCM4fwd9lHJvN5LjK2/H6mpUX7/Mc/CZXa6r
	YnKTnyfc2hoAa1zCErT7cGpsOs/e6wZDIAVI3g05wfurS+ZMwhfZ/zKaNizWuEfg4CO0W56KCGv
	9nQVEX6KUsW5i62l+3AN6ySLPpVf492o=
X-Gm-Gg: AR+sD12Bt+bUxJ1J7gSi2vmV5KfYbW03LvoBWx2SZ63hcy3FAfmwisicCH+qICrRBWu
	vJWTRo6eCnI9NXHjNXIuz8Ao4MPo8ZAywtOGwUBcuszoZur85lDLNaT1UEYWQyZIRr+s6Izr0AH
	9a8UjFVrwjyP27V+2rVL/IxnGAx9SCjBRSE7WpjpkjF5jv69P7Na/K+6SrEg5FNU55Lguzg4AE5
	zYYS25zKaPBqVwaoN5hcupHY/IqTCzTN1ynPQeT5bT5goZyoScGZsnW0PIN/UDW7RKxbCqT0xXK
	V7EqiTCZ4qqro55moQWWtrVmhazSs0/ndNn9REx+URo9
X-Received: by 2002:a05:6512:1192:b0:5b3:11a0:968b with SMTP id
 2adb3069b0e04-5b48b8979a8mr4229626e87.19.1787548270977; Sun, 23 Aug 2026
 22:11:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821053238.1281310-1-liubaolin12138@163.com> <20260821053238.1281310-5-liubaolin12138@163.com>
In-Reply-To: <20260821053238.1281310-5-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 24 Aug 2026 14:10:58 +0900
X-Gm-Features: AcwNN1X92hK2M1Gd2rvSDP5coiuN0Lq2hOOxOea4ja81_Pw3e7uTy-jw7dsiX0Q
Message-ID: <CANFS6baDpf59XzJewz1k12DJCkgJdvJjgYfvQtKxdYxNKQN_-w@mail.gmail.com>
Subject: Re: [PATCH v1 4/9] ntfs: return -ERANGE for undersized xattr buffer
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	liubaolin12138@gmail.com, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 8=EC=9B=94 21=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 2:33, B=
aolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> When the value buffer passed to getxattr(2) for system.dos_attrib,
> system.ntfs_attrib or system.ntfs_attrib_be is smaller than the
> attribute value, ntfs_getxattr() returns -ENODATA, which tells
> userspace the attribute does not exist. The xattr API expects
> -ERANGE in this case, and ntfs_get_ea() in the same file already
> returns -ERANGE for regular EAs.
>
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/ea.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
> index 10d5b192f07e..616eb0d65ee3 100644
> --- a/fs/ntfs/ea.c
> +++ b/fs/ntfs/ea.c
> @@ -595,7 +595,7 @@ static int ntfs_getxattr(const struct xattr_handler *=
handler,
>                 if (!buffer) {
>                         err =3D sizeof(u8);
>                 } else if (size < sizeof(u8)) {
> -                       err =3D -ENODATA;
> +                       err =3D -ERANGE;
>                 } else {
>                         err =3D sizeof(u8);
>                         *(u8 *)buffer =3D (u8)(le32_to_cpu(ni->flags) & 0=
x3F);
> @@ -608,7 +608,7 @@ static int ntfs_getxattr(const struct xattr_handler *=
handler,
>                 if (!buffer) {
>                         err =3D sizeof(u32);
>                 } else if (size < sizeof(u32)) {
> -                       err =3D -ENODATA;
> +                       err =3D -ERANGE;
>                 } else {
>                         err =3D sizeof(u32);
>                         *(u32 *)buffer =3D le32_to_cpu(ni->flags);
> --
> 2.51.0
>
>


--=20
Thanks,
Hyunchul
