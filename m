Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0E727AC45
	for <ntfs@lists.linux.dev>; Thu, 23 Jul 2026 02:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772751; cv=pass; b=pSfSU0vviLdj3L6bU/WLHGHfKQYGzTEMIQYdsz+tSQ/6IJh6P2jXToFTHApCsPWR+QST5o7Cr41mOgmPXo2Yf5EU60ZFb3ulpUdyYVT0hXwBNfDnYv3DNh25lt3LLdQWbIS2VAoGo8ADafgQgYyj0/FJHvWsK335kKl7hWDI4QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772751; c=relaxed/simple;
	bh=L1l2T0No58MstONZ3kt4ZYvGu0V0U8wVuECHQkfQh7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OSkyXVuuhdNg03JCcYz7I6fGUCU+9Kg8jruVIcw0eQ4rYafuq4fUu29L8Bl4SDhpjq4codekX+xLQ2kDqv0EJ520YJ23CMtFSWT0wiZhqUGvYv5e2OCdoKrkg2AOvXJQSndRETjbOh1sFxv5Lb6s53gLqXzuWvxXYnm878L/bIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8w3Emkj; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8w3Emkj"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso100564e87.1
        for <ntfs@lists.linux.dev>; Wed, 22 Jul 2026 19:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784772748; cv=none;
        d=google.com; s=arc-20260327;
        b=LYHJJL671YIgVypZZ6tfF8oA7Mh+1vHqH7c0oAM9tORATkQS2Qj3otTuqXpAlRk4Ve
         UD7nZR0+ubxleC4IS66QzyxaRK968dAOOyqtciv2fNwSEeW15ZaDkKiGZh9mONfUeODJ
         bpo7IVbD5SIiYTAAz4vki0XKeyW+vUqfrvRDpKi2XGzaMDIwaL3AqQPfA+Uu3hoMZ1ET
         n5H2KbfOfE+AC7YE5VcWQkO+dK8YowclqjbzbU8B65j4nHQzR5uKaGNECbhsRkjmf04z
         2VG0u+FF/CWSRAOrP036gvbZ1GeUkmF6qT9IZaDVQm3DtYE/5arfTjDnXyoOQMX2IVB5
         PHjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9drqMbwRaY+KZND54it+3ZRyXlvrLnNs4QxzTU94B+0=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=b1z/MSNrYHCuRUmGViM0UNxRMURYyTFHkHJwg9ZG8Mio0/QDo+ZduJNR4uG34FiA84
         07gmU08f4v5eWsPePNasZPVpRuNPPctdzDiVUnPxfFE4Cp/ih/2+ZfOFjWmZx7FaNh9p
         FsgoXsWb2GqPqydlGFNedfvMJlrVkmbPks2HnJlFXQAFRbNVU83bUdv/4jhavuTqmC1I
         HucO545tWN+y/MZrdUvi7BnJbaHloXwkuDdmQ8JpUWlwMiyXUEyw5gJ2bQq1OU06pWWI
         CeAdompMo7OxSlg6ikm7ofDy3Rs77K4I8xIgQ5GsUOK04ZqKpuwm+JFT7RZESWZHS3hG
         ptoQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784772748; x=1785377548; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9drqMbwRaY+KZND54it+3ZRyXlvrLnNs4QxzTU94B+0=;
        b=L8w3EmkjID0NOIjs0ZDbbCbQpzwLtmM8AaWD/OHUSHbnOEsHawlGSyFUe3k/t9NJk5
         ZJj+mze4qrqmLPIJS5ZsZoCwTkyn1VA7ihobk7RajebzfjV4YMzWLbe/PYTE82fGKrJJ
         i9xityuEgVNXFwSOeecNyZuxUSuUIJkKTpT0Aub2dc6u7K7ClrJVmVo5Okw6tAvzTMHZ
         bSAeaSGnEBGL/u037VdHKUi0JVKKv0KjLfmMN96kro3zXHRMbxq3EMDyUqwxpes7QheI
         wRpASvnJJRFjtDa3Y8+jyF1Js2HFPDTyLh6PAPUWsu6A0yw2NlQ5DdmBpgazgUGEOGdO
         8sjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784772748; x=1785377548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9drqMbwRaY+KZND54it+3ZRyXlvrLnNs4QxzTU94B+0=;
        b=cG8oi59+xIW56lWCDXjsuoD4BS5uNP6BO52mjSlgkRvi6Nr0OtRDhGp3QD3Tt5ZYd/
         Or5FZ8DUKj+8114oC8JV4Qq+E94GILJg5pV/l/j5y5vFBMXxEtXHIk029Qh2LnvNzYr6
         JQwuPtSWcXjGuq8O4Hx2i89qKfa2BRdKWTgam5AxBIuF7IpR+AdFcsE1H/hG5K4jNzYC
         ECq9xtUhei4JkJhhHxI9pybPZ1IrkskyAPSB4kVkcoJQZ8kunmtDOAhvuJ5a8elPTTmc
         PJHm5miUB4Gg7UtIc6xfOLcx1G9fyZExpfy+GmliErJrTK6z4GExKYF7kek81Y8Itkci
         gTQw==
X-Gm-Message-State: AOJu0YyBpfL0X4yx8xR07dnJh/Q+BzBRU0k11Wk/RM/7ZAP+isgcCQTW
	3exawRykdKZGsjaZK8GW/kCmtPaBhIh77sN/jjeWHoeTVZXOTaqunldlIjUjTJFPjIwuhcPiJHx
	J2mW5GfruCk0Dbk2gY8TPCIizpNN+CrE=
X-Gm-Gg: AR+sD10Uhok2VPEb4HXAZn/Ulj9pTmr6twr43iTYllTNMbHK74oj2CDbdrrDPtRgMw5
	BSoQvbodvz4OgfkZT38vDgdLos4rr7EU2zL4AVG/bEa0NSkz+wAjbnWsM0VZWf9yTBD9qrxiwcf
	taMgX2v0HsZIcreS0C/Xv5OUJG+BBtMZHXOldWEirA+bfRYtDboJV3dKG41HlX6h3sfvVYlYsnN
	mxHyjfBonKwwvaK6qJPzdRt1nR0Ri9+srRx5T8tfmc9hW2SQlxnhh1LxU8yIw==
X-Received: by 2002:ac2:456c:0:b0:5ae:a9ec:bb38 with SMTP id
 2adb3069b0e04-5b2b2f7a8d6mr107623e87.64.1784772747468; Wed, 22 Jul 2026
 19:12:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721095431.6619-1-linkinjeon@kernel.org>
In-Reply-To: <20260721095431.6619-1-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 23 Jul 2026 11:12:16 +0900
X-Gm-Features: AUfX_myGjR5MeZ_pNcfQquaoxq57oSbvY-vT_-jtLMZ8yFq57vmrbrGnNA8Rmr0
Message-ID: <CANFS6bb0NN4_1Y5BY0EGHzzC5tAKzL2gLzb2iHMgVLtcctWd7A@mail.gmail.com>
Subject: Re: [PATCH 01/11] ntfs: propagate compression context allocation errors
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 21=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:54, N=
amjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> ntfs_compress_block() returns -ENOMEM when its compression context cannot
> be allocated, but its unsigned return type turns the error into a large
> positive value. ntfs_write_cb() then hides the allocation failure.
>
> Use a signed return type and propagate negative errors to the caller.
>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/compress.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index fe1877b86f49..6b78a8efe3ac 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -1070,10 +1070,10 @@ static void ntfs_skip_position(struct compress_co=
ntext *pctx, const int i)
>   *
>   * Returns the size of the compressed block, including the
>   * header (minimal size is 2, maximum size is 4098)
> - * 0 if an error has been met.
> + * A negative error code if an error has been met.
>   */
> -static unsigned int ntfs_compress_block(const char *inbuf, const int buf=
size,
> -               char *outbuf)
> +static int ntfs_compress_block(const char *inbuf, const int bufsize,
> +                              char *outbuf)
>  {
>         struct compress_context *pctx;
>         int i; /* current position */
> @@ -1264,7 +1264,8 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lof=
f_t pos, struct page **pages,
>         char *outbuf =3D NULL, *pbuf, *inbuf;
>         u32 compsz, p, insz =3D pages_per_cb << PAGE_SHIFT;
>         s32 rounded, bio_size;
> -       unsigned int sz, bsz;
> +       int sz;
> +       unsigned int bsz;
>         bool fail =3D false, allzeroes;
>         /* a single compressed zero */
>         static char onezero[] =3D {0x01, 0xb0, 0x00, 0x00};
> @@ -1319,6 +1320,10 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lo=
ff_t pos, struct page **pages,
>                         bsz =3D insz - p;
>                 pbuf =3D &outbuf[compsz];
>                 sz =3D ntfs_compress_block(&inbuf[p], bsz, pbuf);
> +               if (sz < 0) {
> +                       err =3D sz;
> +                       goto out;
> +               }
>                 /* fail if all the clusters (or more) are needed */
>                 if (!sz || ((compsz + sz + vol->cluster_size + 2) >
>                             ni->itype.compressed.block_size))
> --
> 2.34.1
>


--=20
Thanks,
Hyunchul
