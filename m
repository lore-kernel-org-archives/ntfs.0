Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737A033C182
	for <ntfs@lists.linux.dev>; Thu, 23 Jul 2026 02:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772923; cv=pass; b=dtx4pgziEdoFWezL7Hh9mCDJSfgcol/wUxQAcCiE6d13oTFFDrfdmJGndh9bCkD7Um29MPxfng+k2mpoNckYvRNFq2GViDBDd8MqRnwdjr4ghxTIWtbmiZIGclM/LxJGazdoDqJRFkynHDFo8dyry+G4lxNeOkjyZyYQ/zfiru0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772923; c=relaxed/simple;
	bh=suN4jTfovqtAQ+pj7EFtsvsgYJ6bjJBo5yd4P/q4qBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MghWbm2/lhtzLhFIWm6NwAQG9GR0wIQv6kInBRuW1s1bS4P2USKQ+sC78ojnqYMyj3L+W6URxjCaZCi6vyOA4pWaf/uEMvCy1v0sy0NnAcLMEHqo4Ify2nxoFUrK7NDoeRm3OM1oEUV7FylJ21l5/+Ajw2VLWjCk3Y0++i/SLB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m96LwqLE; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m96LwqLE"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so119975e87.2
        for <ntfs@lists.linux.dev>; Wed, 22 Jul 2026 19:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784772920; cv=none;
        d=google.com; s=arc-20260327;
        b=jnrQs5oV4louPgWhxpdG3YDKvY676yIekGHt6NT2bre/7l9A/I7cTtNtWpIIPnKNCG
         sjNYe2Gsz9xIPSp8clytRPE0byPCmjtyPsC2EQKOf0dciup62/4HJ0CSWlEM9maaKgsy
         qTKFpiFgl8qZEEirdvFaqEJ+jRkhDxO8HNgcWsCY56rApdpGkwPuR6bi/XeX8HXvcnZF
         67vdvT1GvlfND0iMr3bvxwQsZFbWLRZZyoJQ79aV0bW75rnBp5pslDZXz8XQ7ZreOE+z
         Eo/stWSQAaDP2xZGtxl5LwnsbMHy/gIWdSq7Zs3Bk5+5ESVbghXs0YZHwj0legmnWp+2
         8v5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uqllsLdI5m2/wwVOpvwGzrkzukFXpUjzRsLlIk6YKcQ=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=UAmWTC4LKxlxOJ8x1WOvmcYUj8wGe7Ft2DvB/f4/nrmsSI8kF3xCduUP3xD3WybHbK
         Xx0QlIj9SdfjD7oluQ8CLT+WkYXy3+jTFLTwjjoRsUTutd9+eAErW3/TRpzdvtI3a87F
         R4JBg6eZpocFWguSEYA3ZUAh+MzXGDoA13GROxSDo5keKzjtfF0Zc68EA+aGI/Zfm6p4
         sFDNiTXVBXhCkMnfb1jG3Sbr44wPzSaZRpavLfoxxQ9MV4tYJVnog3UdJ/pklHkQfwID
         J/P0ywCpLX8TcnjlePIshrAaeepxpEe52RnX21tMMurzZtLahiKMt4ZgPamy70A4IHJC
         Ezew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784772920; x=1785377720; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uqllsLdI5m2/wwVOpvwGzrkzukFXpUjzRsLlIk6YKcQ=;
        b=m96LwqLEAlqBvfxpOeOjJnlxylM1NRJJuOS5lx6qHh+hPZdMXvsRxBir9OKPfxA183
         vMEwmYH1wPGfc5pa+CXUea/vRGMPjBe5wU+e9/ufRwlE1WbR1QLZt0nfCmHpgXddsatE
         adcZxpFcsq/5MTazUIjmA8mwFVF/ETVhnQdmxYs2mdYWrD30fvYczVMTqfbeKgWC31mC
         Qq6Nztuc0i/icKZyGVFeq68sa3JJyjfKUg/uTAR7a9FReNk2HbEtgOxVEwJdjufXg9+J
         fCdHBMdAtNsMGcmM1G8OecerjtmgnX4u6ut0HPeoOu8zCH/kdz0r9LwR+Q6VOTkOw3sM
         eBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784772920; x=1785377720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqllsLdI5m2/wwVOpvwGzrkzukFXpUjzRsLlIk6YKcQ=;
        b=rEOny6dvLDsNn3xCXewdpMu1Fdi6WkE1gve+Ic7dd7WMEaoHuzoixTtK+7lxxQ+avl
         0ncceiWKMohspd5oBu5zCAWgFTTrFpX6vrEZtLsefI6VMP298BtXxrLwSFcBquCwEt4F
         ItdvPosl6BC7mxYMA6iC/VsaxB9Vhhi9OzMSobuIj8WO4R+Nv/Wcte9FV6uQamH6i4t8
         bZcabWuDNKyKJp6Mk2eag2fNLCOvGaWsJaU0L0VJ4OhRY8OWNCBU/255ctxnkuyC3s/A
         GQpuxtoAoeMOli43DFajHB0/EfhKv0O4Ch37NZ4PXlZSxF1AWQ3NziGBsrHUBYCFWQMO
         hH9g==
X-Gm-Message-State: AOJu0YwMAobSwrEGO1qTuRa6HuuM/EBqtZtPr8g4pY0uEG7NtjmRwSmf
	aFtkFWcnjrEpWZ8Xl6W18PCP3N5p+B8+E/rwuNvZ5inkQzjGYZcbMyprVfymEcl3Cq/5mkyDHaK
	jtsLS8QI27AHxyGqmmLgk4VSkAE7y8blJukqs
X-Gm-Gg: AR+sD13nrzCspIKbQQk725lDgFo5h/S15S6cQY2/FqLWYj6zsjFmTXUg3pSifNuugQw
	QkVhl/xdtWL3p/bapxxRn48WqUkJ2glyYP3dHeic7gpcv/tPwwfrrehmJTYEyT4eEe15RVFhiF3
	zotMUwswoCk0h47seENXvznCGvUnO3wxYVu1CTJb4UI8zXHoL2v3jIOq+uIbABc2b79YI+i7vNx
	GSzsITyerSJmPclbDPJooO9V0cdYrRdzWl2TZ7TYk2yL9UP4UCwDUNsYuIQqQ==
X-Received: by 2002:a05:6512:6699:20b0:5b0:cce:d99a with SMTP id
 2adb3069b0e04-5b2b2e4fd31mr89662e87.14.1784772920299; Wed, 22 Jul 2026
 19:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721095431.6619-1-linkinjeon@kernel.org> <20260721095431.6619-6-linkinjeon@kernel.org>
In-Reply-To: <20260721095431.6619-6-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 23 Jul 2026 11:15:08 +0900
X-Gm-Features: AUfX_mx6cfCAHv6-c6x4z7KiGO1Z6XlRChSi_JsYJMoZHZ37YDLgo1EP_PEfl0g
Message-ID: <CANFS6bZWH9dXv2ZoT_c34ayxVyHU9m02Okd9c+frZrz_mORCzg@mail.gmail.com>
Subject: Re: [PATCH 06/11] ntfs: reuse the compression context during writes
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 21=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:54, N=
amjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> ntfs_compress_block() allocates and initializes a roughly 40 KiB match
> finder context for every 4 KiB sub-block. A 64 KiB compression unit thus
> performs sixteen large allocations even though the calls are serialized.
>
> Allocate one context for the complete write request and reset its hash
> chains for each sub-block as before.
>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/compress.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
>
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index a993cba3b961..f073a53f6136 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -1072,10 +1072,9 @@ static void ntfs_skip_position(struct compress_con=
text *pctx, const int i)
>   * header (minimal size is 2, maximum size is 4098)
>   * A negative error code if an error has been met.
>   */
> -static int ntfs_compress_block(const char *inbuf, const int bufsize,
> -                              char *outbuf)
> +static int ntfs_compress_block(struct compress_context *pctx,
> +                              const char *inbuf, const int bufsize, char=
 *outbuf)
>  {
> -       struct compress_context *pctx;
>         int i; /* current position */
>         int j; /* end of best match from current position */
>         int k; /* end of best match from next position */
> @@ -1090,10 +1089,6 @@ static int ntfs_compress_block(const char *inbuf, =
const int bufsize,
>         int tag;    /* current value of tag */
>         int ntag;   /* count of bits still undefined in tag */
>
> -       pctx =3D kvzalloc(sizeof(struct compress_context), GFP_NOFS);
> -       if (!pctx)
> -               return -ENOMEM;
> -
>         /*
>          * All hash chains start as empty.  The special value '-1' indica=
tes the
>          * end of each hash chain.
> @@ -1249,16 +1244,12 @@ static int ntfs_compress_block(const char *inbuf,=
 const int bufsize,
>                 xout =3D NTFS_SB_SIZE + 2;
>         }
>
> -       /*
> -        * Free the compression context and return the total number of by=
tes
> -        * written to 'outbuf'.
> -        */
> -       kvfree(pctx);
>         return xout;
>  }
>
>  static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page =
**pages,
> -               int pages_per_cb, unsigned int page_offset)
> +               int pages_per_cb, unsigned int page_offset,
> +               struct compress_context *ctx)
>  {
>         struct ntfs_volume *vol =3D ni->vol;
>         char *outbuf =3D NULL, *pbuf, *inbuf, *in_mapping;
> @@ -1321,7 +1312,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lof=
f_t pos, struct page **pages,
>                 else
>                         bsz =3D insz - p;
>                 pbuf =3D &outbuf[compsz];
> -               sz =3D ntfs_compress_block(&inbuf[p], bsz, pbuf);
> +               sz =3D ntfs_compress_block(ctx, &inbuf[p], bsz, pbuf);
>                 if (sz < 0) {
>                         err =3D sz;
>                         goto out;
> @@ -1472,6 +1463,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lof=
f_t pos, struct page **pages,
>  int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
>                 struct iov_iter *from)
>  {
> +       struct compress_context *ctx;
>         struct folio *folio;
>         struct page **pages =3D NULL, *page;
>         int pages_per_cb;
> @@ -1486,6 +1478,11 @@ int ntfs_compress_write(struct ntfs_inode *ni, lof=
f_t pos, size_t count,
>         pages =3D kmalloc_array(pages_per_cb, sizeof(struct page *), GFP_=
NOFS);
>         if (!pages)
>                 return -ENOMEM;
> +       ctx =3D kvzalloc_obj(*ctx, GFP_NOFS);
> +       if (!ctx) {
> +               kfree(pages);
> +               return -ENOMEM;
> +       }
>
>         while (count) {
>                 pgoff_t index;
> @@ -1554,7 +1551,7 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff=
_t pos, size_t count,
>                         goto release_pages;
>                 }
>
> -               err =3D ntfs_write_cb(ni, pos, pages, pages_per_cb, page_=
offset);
> +               err =3D ntfs_write_cb(ni, pos, pages, pages_per_cb, page_=
offset, ctx);
>                 if (!err && pos + copied > ni->initialized_size) {
>                         mutex_lock(&ni->mrec_lock);
>                         err =3D ntfs_attr_set_initialized_size(ni, pos + =
copied);
> @@ -1584,6 +1581,7 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff=
_t pos, size_t count,
>         }
>
>  out:
> +       kvfree(ctx);
>         kfree(pages);
>         if (err < 0)
>                 written =3D err;
> --
> 2.34.1
>


--=20
Thanks,
Hyunchul
