Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B184175A83
	for <ntfs@lists.linux.dev>; Tue, 25 Aug 2026 05:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787636743; cv=pass; b=a6AHX9DdclyyS41cEaSUXKQd2eaGk7RxHwhyJXiK0hjJ8aykbUv/t4M3IM9rOD+3vuYHVNEdXORfKsm92wJ59ZmSIAvbaiBdDsbVEosWAe6zRydtDZZ4dZVwKc7YDk21HgF6i7wJOmVy+UwQb4dWodTuC+5wP7BTW/8vLcAMSrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787636743; c=relaxed/simple;
	bh=fVKmBJGxjhinLcjH37If02pe9z8nlCMRKqdziirEWes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QX3ekDGWV6eEVq40NO2pPrz1Wi9aw2HPcxyIoIwG95WlyIBDMYRste72C/ZZe95+p27dDq10ZsSPTmRl60wkxnvWWOSipKcUtSQNqENqAZwFOikW2pbXVua/hIa5VQklD9G5gqHPLiMroJLmTcwFW7Pc8IzpsFFTVUirbmmdU4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e51U1QYi; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e51U1QYi"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b4747943b8so3589851e87.0
        for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 22:45:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787636740; cv=none;
        d=google.com; s=arc-20260327;
        b=XnDHv8GiyYwL+Pcy5wayQTT2dWIcRsRAZzKY+9ZbLrjr5g46hCOdmXGXhrHUT4EtXO
         YJxaKNrN30rhd4X8PjrdE1VI0KkYbVdYLBD0p5GvFtrjZol8sqTm8kVzFDYHcWp0Yffi
         A3A0h4mxHyuxse0x9fI1qR2ZhcmYOz1qM89t58u3TqnnDOti2PGxnGcovzr+Kbn8FLNR
         abERGWEFXLmiyVSauhHNtYTZ5LFAfMH4auGxw/4uj5vTDVthibDveFVLBYAhLHS8lKI4
         ZDadoU2TOL067B7vLru4uYu5Sa1DniNtnF4WHqJEp5e6r0yHKxadkBmP8EfrtEY1JboD
         pang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nZm3zCM2V5j8UkW0i/0Tml0ywqi5opHYJwOAEvHaea0=;
        fh=JGBhUMt3IMtKkhoxLcwjlpnAv9CU874js/Wn3g4YlBk=;
        b=ZHY3cIS6wMVl0lYbvnIYzKLaZkPAvCpyXWj9ouGwk4NKjj/ODM3bYOJiMRRA8CCqUm
         slmksW103jIZFddWn3uMqc+3fFS8X5PP/vy64lRklQpcKGu4N+mvVA9yFaSxkEHcbP6t
         IDJJvPhAxDRyV7b5V2CfXyciZIiqXHhTZmlGI7pRnNEC9chnz2OZJIr2GwUwf5tuycth
         rmjAdcceOIRSfTm/Fa2YIJvFl8VDPWGKEIuvpbKupYIR7iCi0waGFnv6l7ZxLM5hU8mj
         mqR31gmSPjtibrZtIBMcgZdByfCjIOB7bzQTsfuSZwUMnjTIBht58OzF3qIHtjM5MtWE
         o/BA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787636740; x=1788241540; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nZm3zCM2V5j8UkW0i/0Tml0ywqi5opHYJwOAEvHaea0=;
        b=e51U1QYi6NoTbzsOxc1DSaX0/E2l+QLm75m2phntuIYgTrREuFkETy7CLkHUQihJmK
         YS7ZWrtzj9ytd7vovgeq8ZkNcax7aWD/inyFfiTdAB2M033ez2byRZRvfSzVGs9+X1nh
         cDw00g+dPuvNwb4+4PsJto6jy9ucFv7sRekAgpy2GlBm4bGWiAqjiXpogAD1ijkWfQ3y
         jc8ncgRVFkHxwI32v4w3JyPQkfP8uBd9YXXGWGEsDtRVnVwpRTkv980ENaFwZqOzhYZi
         Zp3W27/dGEXmOE4GICkVhdT5YwYsZXSVkO5l7AD4iJjTA+ptHTkMUT4fFSZF1DVNZ+r+
         Gl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787636740; x=1788241540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZm3zCM2V5j8UkW0i/0Tml0ywqi5opHYJwOAEvHaea0=;
        b=RC9y4niGi05wIqYZtrmv4AyXUG6c1i/yX+xkX1iFZ21luJFxccjwh8gayOCHCToplA
         hbsw6dfD5ue0E+1356I4O4nw8pHBFMA0rXsZmwJD1FBRK07QVO15FzQiEm0a8NahPbka
         S4nfUghlhqo75obKaed/lcFk5lcAFp2EhQiIl18rfWE5u6imroiNjvSL9d34BcCHMtpe
         GnwHEoB6FhbqjiCmAdPEdqx/YVCvQM1RskjebXKfIT2o+y7V3hZZiVlLiydZO5OIqiIB
         JWNOjuyVaViNt0chw8oIq6G7sMB9IhenrctKxoNoUW/ORQQkngMqTKduX24BRjqYI4Xf
         bIAw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/2lPkH3zR13x7pdRXgYNeotb8O4cEX1Dh0SjGBBeGseLV3A6yARSp+joJM7d1yCxI3asS@lists.linux.dev
X-Gm-Message-State: AFuF++k2b45I22HOC8gIUylauH5drAOPXwYoS+7RjxMSkm0m5vtQqpfM
	FFab5+5l+CKspMTSfI4/M7xmfVIelwTu45k1RM+XqTKRLjXuq8RsVpqSs+0cbDmXwxgdeJWcOHJ
	ZKo+3nvnNpYJhAn3YdbRjxYtjD2GKjpU=
X-Gm-Gg: AR+sD10dfv84q69HhvKNcbW+1yc/iCRNqi4bLxrZOsQB5VH9m1NicC8OBSuynX37pvH
	FxE6fk0dehGFp/MK6vUIVkcSP6L3BIauFFMrCGt9cufjC+2l4ym+7ucu5lWflLAUJlb7LjYcQrT
	bWvyjb5JezbHgt8aaIAFmVRbdc0NY1PUPkJBPWIvoqEcM5x9/SceMRm4O1FjUwocaFDbDWmVhZd
	v4W9OZhhmNG68o3rxciLLf0MLZoeTRbyCMQVLyO2vKbECflH5pV9dgzvOlp93IS7GlvuwoQkHUh
	Ln1QxCJGY3VCuZxMkvdJDHZ1ucwXrW1Rc3p5xD6RBBWu
X-Received: by 2002:a05:6512:6c2:b0:5ae:b59e:aa45 with SMTP id
 2adb3069b0e04-5b48b89675dmr6626651e87.17.1787636739775; Mon, 24 Aug 2026
 22:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824075935.170457-1-zenghongling@kylinos.cn>
In-Reply-To: <20260824075935.170457-1-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 25 Aug 2026 14:45:28 +0900
X-Gm-Features: AcwNN1U11ydoTh6uaw40HLjsN2bokfkPv25rkwZoOV36XuEEmlRAqCwe6v9Q9XY
Message-ID: <CANFS6bZczfbx3HKO9pN2wOm9Wy8oCX0GAA_uAoXzhu1j34Jo7w@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix memmove overlap in ntfs_new_attr_flags
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hongling,

2026=EB=85=84 8=EC=9B=94 24=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 4:59, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> When the record shrinks while the payload offsets increase (e.g., enablin=
g
> compression reduces padding, making arec_size < old_arec_size, but the he=
ader
> grows by 8 bytes), moving the name first can overwrite the old mapping_pa=
irs
> before they are copied. Move mapping_pairs first in this case.

Can this situation occur even when
it is not a crafted image?

>
> Since mp_ofs is derived from name_ofs, they always change in the same
> direction. Checking name_ofs alone is sufficient.
>
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>  fs/ntfs/ea.c | 33 +++++++++++++++++++++++++++------
>  1 file changed, 27 insertions(+), 6 deletions(-)
>
> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
> index 534f7efaf128..c836d33ab0d3 100644
> --- a/fs/ntfs/ea.c
> +++ b/fs/ntfs/ea.c
> @@ -729,15 +729,36 @@ static int ntfs_new_attr_flags(struct ntfs_inode *n=
i, __le32 fattr)
>         old_arec_size =3D le32_to_cpu(a->length);
>
>         /*
> -        * Move payloads before shrinking the record.  Otherwise resizing=
 moves
> +        * Move payloads before shrinking the record. Otherwise resizing =
moves
>          * the following attribute over the old payload before it can be =
copied.
> +        *
> +        * When offsets increase, move mapping_pairs first to avoid name
> +        * overwriting the start of mapping_pairs.
>          */
>         if (arec_size < old_arec_size) {
> -               if (a->name_length && name_ofs !=3D old_name_ofs)
> -                       memmove((u8 *)a + name_ofs, (u8 *)a + old_name_of=
s,
> -                               a->name_length * sizeof(__le16));
> -               if (mp_ofs !=3D old_mp_ofs)
> -                       memmove((u8 *)a + mp_ofs, (u8 *)a + old_mp_ofs, m=
p_size);
> +               if (name_ofs > old_name_ofs) {
> +                       /* Payload offsets increased: move mapping pairs =
first. */
> +                       if (mp_ofs !=3D old_mp_ofs)
> +                               memmove((u8 *)a + mp_ofs,
> +                                               (u8 *)a + old_mp_ofs,
> +                                               mp_size);
> +                       if (a->name_length && name_ofs !=3D old_name_ofs)
> +                               memmove((u8 *)a + name_ofs,
> +                                               (u8 *)a + old_name_ofs,
> +                                               a->name_length *
> +                                                       sizeof(__le16));
> +               } else {
> +                       /* Payload offsets decreased or unchanged: move n=
ame first. */
> +                       if (a->name_length && name_ofs !=3D old_name_ofs)
> +                               memmove((u8 *)a + name_ofs,
> +                                               (u8 *)a + old_name_ofs,
> +                                               a->name_length *
> +                                                       sizeof(__le16));
> +                       if (mp_ofs !=3D old_mp_ofs)
> +                               memmove((u8 *)a + mp_ofs,
> +                                               (u8 *)a + old_mp_ofs,
> +                                               mp_size);
> +               }
>         }
>
>         err =3D ntfs_attr_record_resize(ctx->mrec, a, arec_size);
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
