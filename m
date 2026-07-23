Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03314342524
	for <ntfs@lists.linux.dev>; Thu, 23 Jul 2026 02:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784773056; cv=pass; b=OHeqzBGCOkfe0hoTPSe0QNDkFxIPS2a7+ntHQabJ8xMQzAMqNeaKBnBet3d4h33cINqhi22uvH6LabTAOFFAXDm2u8AGbTlOdn0LQTt9UT5mTfGejrV58s0B4R8M0f0R6Iye5Ia9CCfBN2L9VymYsXj5Kf6K73lcNruYOCMwiak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784773056; c=relaxed/simple;
	bh=/0lERv7Iv2QEHNr05soCnz1TbZYks978Okv047NILQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=da7ot2lYYvbsi2Zj8JxClNMvTrCsn0ZdmTUw7jUyrvVaiTHH7N1uWWCq+vGZtZC7RbGnLSKqesoa6lkDuOuozuMPr2gRxtUrqhODVMMl/k9RQJMji49EpK6ewyTlsmEsRnhD+zmVuoQiWM7fStvh8Rg19qHDhVOP/fLCB60A+G8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cd2TunkA; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cd2TunkA"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso102352e87.2
        for <ntfs@lists.linux.dev>; Wed, 22 Jul 2026 19:17:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784773053; cv=none;
        d=google.com; s=arc-20260327;
        b=lbTPUiPqyP2IInGAX4mn0hOxCjpl2P73ibNSb8XckwwlglwGmZw8LzjFuPvoWM9FPO
         h0IJJJbH97xaNQdhDyWz/AE/DJ/9JW9lsx0tejv6qiaU5HfkVFNWCVrfhnWSGLsvHHJB
         NLImjEOqAsj3cYaI0f2c2CjwFthqgt5e7ZotFle6QkpfJPVSmrEf+HPAt49S7XPFwENB
         oX/YRqJKUqSmJJwAKple+cE9Vc8idSVBY5gMCoqdWjkDEL/MVN3o0AL2v1TplnooWJd2
         70zIDftoYTTDSE7FQenKj1aXGBQcxgwDWb+IVfl3V+R3hFQkSoPW0dJmh4MP5h+ha8kd
         EcZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RabTp13IklNKyl5eXr2MlUL3YqAQZyyQuVbdYywuVRQ=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=q049MuDHtHss3jlOpJfm/RYw6pWWR7EIAa+UdR3Ul9Digsb020ArCmoRG+ERn8X5sh
         zPGSpRchsC2DzLmgmXAxYgZQDPC2ILn8qrpGClSK93Glyy17ONNMaIKLxTnscpNhITPI
         bwKlcV1jxisTT9K0mj+xusmBn3/bqv+7nhCBGaFv8rKY4fvnzNJGwZ4+gSmdYFaMZyhY
         I/DYLXwLi5fNmTanOPbuYSA7rxMCHf6dIiLqojURw9Y4U7GECctST4bClFYmzck+FMMW
         a0ALcOgdjcdQMcH2Iqwy1aangA06ZaTF6lXsicblKUfQnXFeadjv41onP8QAwccwSmb0
         dZow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784773053; x=1785377853; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RabTp13IklNKyl5eXr2MlUL3YqAQZyyQuVbdYywuVRQ=;
        b=cd2TunkAZXgYnnetaclf2ozWaxmMqoZOhiq+qLafTmOGnz9YIr5RPZ1DZsPOzMnSyJ
         s6JutPlSFT2BZ6JzyWKS8r8eoJ7bKSFgZBKdxtiIGGv4ZzuhsYyhALS5cDx9wo6xA8OE
         2u1TAel8amGCIbi6gs6FJraWzxRuU9wXN/3qSfAA8jD20W22vIuooWKjmATBlQtNaxRu
         LLLOWNHl+voXb7SXOMcJfmeI5QhxL97O85lTMOyJweCx2Y8Q9pNWaWg9gIpb2hw+S6Wj
         QkXlItGUmPgirVRJAbiJJBjILI8vkjbzljBBw6sopLAYln30pJBqOIP2crhh9Z6OFRT4
         9j1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784773053; x=1785377853;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RabTp13IklNKyl5eXr2MlUL3YqAQZyyQuVbdYywuVRQ=;
        b=H6fL1MF0o8iGoegxBKar/siQVESOMcaCcVC2OLbGpLR8c6WgtsEm5swW2LvVJIqLt8
         E0a/Me3oQJMT4NLS6GSAMQcK9KWCVvBedOd7uOMUZpyHlIO5Jz8NLQXc7L6Xxrjes0WT
         um2jRicxGikye2OGuB07zhLGl7dxPnk9rTrzfzuMsS0hvnTn4tgke8aQj/oM/245CQy4
         FFLmagFgjD1VipzMpOKIIZuhNc/J5yHi/Ww6rpXS0ENYyXE1KdY7Qs1jAhL4iqXxCK/l
         Xj3AplPnzkxZDOORw5//ige7GzxZkl0CzlJ0kYhZ3BCe0D9uASaRNXltTr4/WkZelc/K
         r+hQ==
X-Gm-Message-State: AOJu0YxAOIaHc4MSNO4DtVv30sgGVflSoIqDRFxs/xKretBl2RUv0vrT
	1krtVTZSO41vboWk94gLXbXbGwTe+ZielcC7grBnAzUsDJ6Cpf2PyaNxJPgBEtNNMk3Dk1UYIUf
	XQ0SSV29O4OvMQmt8/pIKgLbULiTBihk5Ek4/
X-Gm-Gg: AR+sD10MiqBEv8OccvYkp2F5INOh4MRlfHciHh910aaa6xtWuYP/lh367zxcIVrvwG7
	CNCyVD1gOVz4rSkYYC5TQ4VegFPHTq775zjh+N5g9Vm1ZyoNpTRubSY5MzqHgSl1O3ZQMM79rpY
	/elJmqE9ZXEnAKs+Uwlz8hc4yw2SiE1wmBP4r+TV9UBOuRU9zy9ygTFWxkTEoS0a99mYGdV0fNd
	yQfd+DYJQWfwA3boK0QI3UBhBP2ioEJzsjbg9miEAeDKoGTmj13JIKfgVEylA==
X-Received: by 2002:ac2:4a6e:0:b0:5b0:1f7c:254d with SMTP id
 2adb3069b0e04-5b2b2f946b6mr96617e87.58.1784773052829; Wed, 22 Jul 2026
 19:17:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721095431.6619-1-linkinjeon@kernel.org> <20260721095431.6619-11-linkinjeon@kernel.org>
In-Reply-To: <20260721095431.6619-11-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 23 Jul 2026 11:17:19 +0900
X-Gm-Features: AUfX_myWZl9xm46uPoWcg5UsLgLGb-RxqzagUdPWUvPh2pRER33W-iDCv_Kk-rY
Message-ID: <CANFS6bZcYS7tuAHUmEOkqTgfyus8ic6hqO6ODbO6SMqWBFJC9g@mail.gmail.com>
Subject: Re: [PATCH 11/11] ntfs: move attribute payload before shrinking its record
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 21=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:55, N=
amjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> ntfs_new_attr_flags() resizes the non-resident attribute record before
> moving its name and mapping pairs to their shorter-header offsets when
> compression or sparse state is cleared.
>
> Shrinking the record first moves the following attribute over the tail of
> the old record. The subsequent memmove() therefore copies bytes from that
> following attribute instead of the old mapping pairs. Re-enabling
> compression on an empty file persists those bytes as a malformed mapping
> pairs array, which ntfsck reports as a missing or invalid run length.
>
> Move the payload before shrinking the record, while retaining the existin=
g
> resize-before-move ordering when growing it.
>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/ea.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
> index 95587b9a7129..4fb10d51211c 100644
> --- a/fs/ntfs/ea.c
> +++ b/fs/ntfs/ea.c
> @@ -631,7 +631,7 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni,=
 __le32 fattr)
>         struct attr_record *a;
>         __le16 new_aflags;
>         u16 old_name_ofs, old_mp_ofs;
> -       int mp_size, mp_ofs, name_ofs, arec_size, err;
> +       int mp_size, mp_ofs, name_ofs, old_arec_size, arec_size, err;
>
>         m =3D map_mft_record(ni);
>         if (IS_ERR(m))
> @@ -726,6 +726,19 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni=
, __le32 fattr)
>
>         mp_ofs =3D (name_ofs + a->name_length * sizeof(__le16) + 7) & ~7;
>         arec_size =3D (mp_ofs + mp_size + 7) & ~7;
> +       old_arec_size =3D le32_to_cpu(a->length);
> +
> +       /*
> +        * Move payloads before shrinking the record.  Otherwise resizing=
 moves
> +        * the following attribute over the old payload before it can be =
copied.
> +        */
> +       if (arec_size < old_arec_size) {
> +               if (a->name_length && name_ofs !=3D old_name_ofs)
> +                       memmove((u8 *)a + name_ofs, (u8 *)a + old_name_of=
s,
> +                               a->name_length * sizeof(__le16));
> +               if (mp_ofs !=3D old_mp_ofs)
> +                       memmove((u8 *)a + mp_ofs, (u8 *)a + old_mp_ofs, m=
p_size);
> +       }
>
>         err =3D ntfs_attr_record_resize(m, a, arec_size);
>         if (unlikely(err))
> @@ -736,18 +749,12 @@ static int ntfs_new_attr_flags(struct ntfs_inode *n=
i, __le32 fattr)
>          * shrinks by the compressed_size field. Update the in-record pay=
load layout
>          * to match the new offsets before exposing the new mapping_pairs=
_offset.
>          */
> -       if (name_ofs > old_name_ofs) {
> +       if (arec_size > old_arec_size) {
>                 if (mp_ofs !=3D old_mp_ofs)
>                         memmove((u8 *)a + mp_ofs, (u8 *)a + old_mp_ofs, m=
p_size);
>                 if (a->name_length)
>                         memmove((u8 *)a + name_ofs, (u8 *)a + old_name_of=
s,
>                                 a->name_length * sizeof(__le16));
> -       } else {
> -               if (a->name_length && name_ofs !=3D old_name_ofs)
> -                       memmove((u8 *)a + name_ofs, (u8 *)a + old_name_of=
s,
> -                               a->name_length * sizeof(__le16));
> -               if (mp_ofs !=3D old_mp_ofs)
> -                       memmove((u8 *)a + mp_ofs, (u8 *)a + old_mp_ofs, m=
p_size);
>         }
>
>         if (new_aflags & (ATTR_IS_SPARSE | ATTR_IS_COMPRESSED)) {
> --
> 2.34.1
>


--=20
Thanks,
Hyunchul
