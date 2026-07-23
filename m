Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7612D2486
	for <ntfs@lists.linux.dev>; Thu, 23 Jul 2026 02:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772987; cv=pass; b=kuS0v01BeuLNkjZ8JFvW9VVFL4k9Oy+xEsGJDdfsY2/jq08A4yNDj/QyoR+ltx4pylET1NSHhKyPS/ds81Z89lFezH/4vIgKrlFwlkt26FYDDwYg+Vu30VL5UftvHrhgLlPHs4qOd+EuLiM6PV8CtF+ptdiYcQSqRFrl9vaORPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772987; c=relaxed/simple;
	bh=4gTMphBMHuSj6SSjWTC/kwDGjt5gki1YXFz7gGBarnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qT1c1hGPLie8YHhFyCiI0QtVCzmuP+yrp90DaPMiiMFChWB7QQUFytqJaGBGKH28FX36d4/EEZJX4h+d/QaG12mNjAIh+DMRo4oCJfcKlNRWXfpnJklR22TEqR1tPledlLQjMvIhK2g4Qd2nLLSVkeiUXZM3h/7tIxia/XJhH50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMEjGbGv; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMEjGbGv"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso96419e87.2
        for <ntfs@lists.linux.dev>; Wed, 22 Jul 2026 19:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784772984; cv=none;
        d=google.com; s=arc-20260327;
        b=kxKnJZ9rZWUTbblPCBCadBXOGR4UWdxEdAEMh62JgK7wi+Lc/JNxoh6PU9Gag6gcIT
         CV7OT9T3ump5TX178sm2jpPn+s/EWCTLrgdHWQs3JB6NUPg8hWrPrS7U1TF7YCPyrS6Z
         fY1dply3KuzqE1JWqopuG54UYgb/CKgUziq7Ewo28TGumeknAcJC+3PX0x86GCBBoiZu
         O9pGFkXoGUquakc0QPZ3s4SxxZOE++k7KAlzSqGFUDRmT7cpD9hafMpvPzK1wriOHpuy
         /i+s0AMeHrfGfQqTDKNaykDr6XsF4L2yQk+Pe8IAjl8dNmtXCNuC9+INq8VG7HFhOaQN
         //mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qGPxkC2NWkRRVrF5Lurqj4j0X7LJDmsBgHuozb7bcT0=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=I9E/6WzreKuRujVtu1fo42dcXy04Xgb8FwgJ8duO9ShONjfXdiJnvaJKFGfbDng0de
         /OVo1QWEcLJNm2D8Wr+70hn+BHiKPCrJ1bc51b2tEC+3OFBNtsCOl5PDCbZZlkc7Htz2
         lOG7osUW1t9Ywfu1beT1jaUuxCCWNZMgV5lEMVozQSQqm5av9CHVzBS7xlRv4ltY9lWE
         IEyPTQaDlUEvI7LLO08rpY8XTdNEyF3JGa93bz0P6ip/D1lmhEM9uWpQH5N8gmU7VAPq
         mMfELy3Sn3CY1eg6EIvCLKWTZeT8upLcDWqhKkn/Q1Z5Dpn9z1wpo2rg6bu7x7kyHfTP
         NCNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784772984; x=1785377784; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qGPxkC2NWkRRVrF5Lurqj4j0X7LJDmsBgHuozb7bcT0=;
        b=KMEjGbGvHZu38YvJ3VqM6rlIxERxpQPmQdxF5HN0UeqF2Lm48bmODWLSF/RJfl5M/k
         xnhn/9GvLe0e41PJzAcS/ION4X5IumyU0omCeLtjJKbuIpKaJnazQKJniyF+CaA4kO8e
         gtOxZnZBLLviHStKvfjsF/rRSUfxolvam/7WTtaXfMbciIiRX0cfZ9/5I1ZKFGjUteci
         Yx6//5Ow8AKf4rKxQLaCaP/fOtr9NlsKlaeD7f5BsgS6Ol9wuOIHeDsQUiAgCSHVQOHS
         X+arnOTqMOEq+fgLZSPhXTEZrjmyAxn06YfokmGneZyCqcWLHWIBbVP8fKme6QP/lSM1
         3wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784772984; x=1785377784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGPxkC2NWkRRVrF5Lurqj4j0X7LJDmsBgHuozb7bcT0=;
        b=XukqwgztVRNufH5bdsQYTPV7RMixVxOTYObu/2IRezZbv9VGVb5KN2cSEL3eni4CyO
         GE0m6/DULhnBSTWbcu5qApftQO+U7ULWER0MBP9R4FNu9swAlTvhk1yTJIIrhOuZr510
         vJhB1l+n5153fgNsrZjvh985qnlPQ0oUVrb64rA1USPUmQ9V//iS0z+qBlU4gntKmm1z
         Pdu6ORdWGUZk/dLjMqfCyxiJ16aEhAkE4ti33J7XOSCAszh0WZmZ3hUu5o67a7j20B05
         +ToLDRVCw59cOjcJEGRiY3E0ibKylSQWbnLGrXDbOmrtTdX56pTx3wN0pSPf0VzvtGOB
         2zvQ==
X-Gm-Message-State: AOJu0Yxq8mqZGUa+P9J/Ts4YtbxvfOrmgEHE/oE8ksyZoeIjAj5kuRw+
	H7/N7Xs/e1pEv9E0K4yIlC/RkAWOYXWW/F3oSzw21/fqhZ8zQEpVxFLsi7nmyhV6ObGCLDz7SSD
	yuM50rtjHEscKgDGeL+PemGfcRpJAe/a+gDt/
X-Gm-Gg: AR+sD10CzT2vf3kIE0jA9cyYuwTu2c/jFL+4+EON+7fDiLpHGqKoAi0xWP4cf4awlmz
	fA2UwSnk1Qslt7l1rXp6SkOj6o54VVaJCHf2esveWV3Zqrk1G8tGq5icOYIVE8THkq9Dl+kNsRM
	DWbLDoxm5nUSeg+THHTBGkeFyLAAdRa9YmyCFyQbPGX5w0DDh4PXDsO5kngn42wWL9jGKEUPxvi
	EQPhTjd3PsecN43wsXfGpjlrG9W35NBh1M1DJHZ19MBuA95GL3DXX6mS55lVvSoyUjPebS7
X-Received: by 2002:ac2:5464:0:b0:5b0:12cf:ae28 with SMTP id
 2adb3069b0e04-5b2b2f71216mr101150e87.34.1784772983489; Wed, 22 Jul 2026
 19:16:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721095431.6619-1-linkinjeon@kernel.org> <20260721095431.6619-8-linkinjeon@kernel.org>
In-Reply-To: <20260721095431.6619-8-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 23 Jul 2026 11:16:11 +0900
X-Gm-Features: AUfX_myZNyCkan_rFuU8flMqfmu8152z_0g4njt_humIjHhgDVrWABUMHZQkxg0
Message-ID: <CANFS6ba7DAGHvH0uanfq1+X-qZNCSQOry+5kRm_nRdFjjAbq=Q@mail.gmail.com>
Subject: Re: [PATCH 08/11] ntfs: submit one bio per compressed write unit
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 21=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:55, N=
amjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> ntfs_write_cb() allocates a single-vector bio and synchronously submits i=
t
> whenever another output page cannot be added. A 64 KiB uncompressed unit
> therefore requires up to sixteen separate bio submissions.
>
> Allocate enough vectors for the complete unit, add all output pages, and
> perform one synchronous submission.
>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>


> ---
>  fs/ntfs/compress.c | 43 +++++++++++--------------------------------
>  1 file changed, 11 insertions(+), 32 deletions(-)
>
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index f3c14518f78e..a3af669b1008 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -1327,7 +1327,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lof=
f_t pos, struct page **pages,
>         static char twozeroes[] =3D {0x02, 0xb0, 0x00, 0x00, 0x00};
>         /* more compressed zeroes, to be followed by some count */
>         static char morezeroes[] =3D {0x03, 0xb0, 0x02, 0x00};
> -       s64 bio_lcn;
> +       s64 bio_lcn, bio_pos;
>         struct runlist_element *rlc, *rl;
>         int i, err;
>         u32 cb_clusters =3D ni->itype.compressed.block_clusters;
> @@ -1410,41 +1410,20 @@ static int ntfs_write_cb(struct ntfs_inode *ni, l=
off_t pos, struct page **pages,
>         }
>
>         bio_lcn =3D rlc->lcn;
> -       i =3D 0;
> -       while (bio_size > 0) {
> -               int page_size;
> -
> -               if (bio_size >=3D PAGE_SIZE) {
> -                       page_size =3D PAGE_SIZE;
> -                       bio_size -=3D PAGE_SIZE;
> -               } else {
> -                       page_size =3D bio_size;
> -                       bio_size =3D 0;
> -               }
> +       bio_pos =3D ntfs_cluster_to_bytes(vol, bio_lcn);
> +       bio =3D bio_alloc(vol->sb->s_bdev, DIV_ROUND_UP(bio_size, PAGE_SI=
ZE),
> +                       REQ_OP_WRITE, GFP_NOIO);
> +       bio->bi_iter.bi_sector =3D ntfs_bytes_to_sector(vol, bio_pos);
>
> -setup_bio:
> -               if (!bio) {
> -                       bio =3D bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRIT=
E,
> -                                       GFP_NOIO);
> -                       if (!bio) {
> -                               err =3D -ENOMEM;
> -                               goto free_rlc;
> -                       }
> -                       bio->bi_iter.bi_sector =3D
> -                               ntfs_bytes_to_sector(vol,
> -                                               ntfs_cluster_to_bytes(vol=
, bio_lcn) +
> -                                               ((s64)i << PAGE_SHIFT));
> -               }
> +       for (i =3D 0; bio_size; i++) {
> +               unsigned int len =3D min_t(unsigned int, bio_size, PAGE_S=
IZE);
>
> -               if (!bio_add_page(bio, ws->pages[i], page_size, 0)) {
> -                       err =3D submit_bio_wait(bio);
> +               if (bio_add_page(bio, ws->pages[i], len, 0) !=3D len) {
> +                       err =3D -EIO;
>                         bio_put(bio);
> -                       if (err)
> -                               goto free_rlc;
> -                       bio =3D NULL;
> -                       goto setup_bio;
> +                       goto free_rlc;
>                 }
> -               i++;
> +               bio_size -=3D len;
>         }
>
>         err =3D submit_bio_wait(bio);
> --
> 2.34.1
>


--=20
Thanks,
Hyunchul
