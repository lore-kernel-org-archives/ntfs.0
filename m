Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03C432A3D7
	for <ntfs@lists.linux.dev>; Thu, 23 Jul 2026 02:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772776; cv=pass; b=ouxSfOukejxkYhJ/imiM1QKwtDRAuJXS9EoFAt1MdO6zHBaEdYvF0ZmDEYbEpAucAqYi26P6ye64p/7BDPNqq2Iwrw+1t/erDdxAw7W+IaUU7BKD0UAbqw7UvzmQupLt0Z1zBsJo2g4GkILt4PiNKA4/t+fq2H97Uqt2WKuMFZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772776; c=relaxed/simple;
	bh=4IMwx2moyzssD32btkj4FcV2lTt30BBiGbecy7WBZ/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVB2VefyTesGTrHcfX+Z6uGvTs+alLdc2ZL4fCPk7zD+3iE1Fdp/BDF7ph70QKIo3gbzhaHPuGDPahTMNtZ7fW1yf+ameEenVh5a1ywx+5VqxfLRNkcEiiP62J3b7r43kVlXVtZDhbRTAgNgqNmq5tBLM1Kk/L8QFCVQuYx0kds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2hakImq; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2hakImq"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b015532f7bso123351e87.0
        for <ntfs@lists.linux.dev>; Wed, 22 Jul 2026 19:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784772773; cv=none;
        d=google.com; s=arc-20260327;
        b=D7OyBpHmVDw6+BcqqgN+rIqffhog1N33VOMb0NUh2pBJsyqhmDQUI5e+xFYnOyUO+3
         i9LDHA2E2w/7q8aNXyTr2GQVxlcRDWhOtkGBuYflkKIGNt8PcBRsEeIf13525Qyr2dAP
         Epnhr1PdAzMG8xVdWMalQMpyNLfi+wbykYidFvLP1yAgpDexJKOtEv5/1sXMF0cE9+8l
         6M5T1SEl8mLH1QHThWhUp9dhtVBnBvbk7785DAuBD0Xd+PqGaWh5TZpGILpUZJMB68vO
         TfDd8tzcFN65nPtnYjwVN6ppgw7syxbtDY5nZyAzjHGzrLzXdhaEuFpztMrgVw0k0jrM
         GhWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tD/qjNtMTiUOOsZ58a+7vN5aPr4pnrMcIePYSZgC77c=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=Jc1vdlnkVR0bF7Zug2cxhMEwlVesNHqiiWzXS/KhWvam7q5twGeOhAgW1vluZE9l/m
         ghbHTejnJE6Eaddz2s5vWsH2i8VAdGHGhqZ2YZmUwg06X5gKEhx4CukLNB5/a5g7uaVY
         3SPf/2BZLLFPs93NFLy/Q2dYw+MWpLLkrxAzAacRd7pvGwiFa5CBXrQgl1vAqNOr+hsV
         foB/JXBf173eBnUL/7DzcbUfWAcCOgAyUmai/qYNMWx0ZsTEz1ZEBLgr+H5IAM+cbRxx
         K4yVXfvTu4k/vXarRsiQCg1mYEOBwVjW1fn0M5JRLbq8e5BlxnawVtOpJjXJCpLid+qh
         51wg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784772773; x=1785377573; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tD/qjNtMTiUOOsZ58a+7vN5aPr4pnrMcIePYSZgC77c=;
        b=m2hakImq9xOhJWKP65TBTPV939tGNh69Z4xe3jkhsZvAa8GO9GMuVj1orZeziGDGaC
         zIU/0NUmWl1yB5wCuFQlpge+7EyyqxF9tTa2iqUSfdT7jGhr9JdC4Vc2jpmaQnFI/r2c
         bI48DQnk9R1UNXnF1xOVuR/XZApL92XVQQmANWKYdHlSiMZpTFWZKp00Akm2UZjzap0S
         5dRf0sl+A+IBGmv7Cr/WYf+HW9Z3nQgTN9/lkfJcQ1hMY0L7+Xbxfaj3GrXwXCzIFEEO
         HbG0f3q6AxHdViQoV9sj9qXOc/1puXTwmnfBpV/fRWQhUTrpkILhfoP5GhOcWhnLaxM2
         j7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784772773; x=1785377573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tD/qjNtMTiUOOsZ58a+7vN5aPr4pnrMcIePYSZgC77c=;
        b=pp+34O+x6CHU4tQCdNezmh2g7aIIIPCYsMh0943REKeu8ndgOB69CAzocaeJ+yT7Lz
         mbVoAJllccX1wPSUnDdzK8dOvYBpC3ftPbUpwtmROvcsgJbHXi/WSA7iAiZ7MxkujKZp
         7H8cgLrxV8XfvfmEJzFyK4fFyDtosF/t+k/2toFyY4QVOVgM4lmjKlGsjgvCsmKga6s9
         DO50ok9oRsHbWLTh9MZn2fPyHx6x0nc42Q0JM59TKgYQkjGDtTo3tK7ESs7EkFTH4Ebi
         KqVlLKCjHyKfguoeJsO2iwtYd+0gwv0zcCBgKV4q5zwDy5DfWvmqcft4KBGbuyqbH2Mt
         vcFA==
X-Gm-Message-State: AOJu0YxJflix318Wi359Cc02Lb/laVvS3ZynJLpKlhM8ja11EdkNUId/
	qVUP9MIXoj8zNRexEzV27I5Uc/QObaBZDZYoDygxRhoMPZqglLssR4Jx4L54aItLtQ/76m0FswH
	9mK0AlkJfw+Dr9Gm2QgJIWEFDHSkEwfcyIYCt
X-Gm-Gg: AR+sD125qbVVQbjux0DmHyKiKfVmkl6dM5YtogVVQO/i74RKmoSwaecneINDgtCKTX0
	v8syYoIcnJ8E8I0VH5sszn9KmKotsJhAjyzDokKXID84HEWR6dj/izlBl3zs4LYLUNPs7x5dTR1
	06gw02JJT1vmUHlr4p/Nw3z8QV4D62yhHRZ2Cc3g7SbTVCqfVmUwnNxm5r+AE3b9gFR+QlBuYVv
	JmsYeELnRLht4EDlzo4OrOfylrsFZfDEh3/RQywKrM3SkIqEiDysw46ow6RJzSkXiK1kVWH
X-Received: by 2002:a05:6512:6193:b0:5b1:5fb6:5cf6 with SMTP id
 2adb3069b0e04-5b2b2f4e34dmr172425e87.17.1784772772660; Wed, 22 Jul 2026
 19:12:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721095431.6619-1-linkinjeon@kernel.org> <20260721095431.6619-2-linkinjeon@kernel.org>
In-Reply-To: <20260721095431.6619-2-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 23 Jul 2026 11:12:40 +0900
X-Gm-Features: AUfX_mw4kJoRe8Igl4fYW--1O4DHTxmSX0xvVG3blFyo1AEMCZyzRhfTDTt_llM
Message-ID: <CANFS6bYqGYv_GLSgj1EgthN_xxW4EPNpTya+Z0YOoJhEKiEDXA@mail.gmail.com>
Subject: Re: [PATCH 02/11] ntfs: support large pages in compressed writes
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 21=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:54, N=
amjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> ntfs_compress_write() derives its page count by shifting the compression
> block size and assumes that every compression block begins at a page
> boundary. This produces a zero page count for small compression blocks on
> large-page systems and ignores an in-page compression block offset.
>
> Map every page covering the compression block, pass the in-page offset to
> ntfs_write_cb(), and stage uncompressed output in page-aligned pages.
>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/compress.c | 33 ++++++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 11 deletions(-)
>
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index 6b78a8efe3ac..006b8831836c 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -1258,11 +1258,11 @@ static int ntfs_compress_block(const char *inbuf,=
 const int bufsize,
>  }
>
>  static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page =
**pages,
> -               int pages_per_cb)
> +               int pages_per_cb, unsigned int page_offset)
>  {
>         struct ntfs_volume *vol =3D ni->vol;
> -       char *outbuf =3D NULL, *pbuf, *inbuf;
> -       u32 compsz, p, insz =3D pages_per_cb << PAGE_SHIFT;
> +       char *outbuf =3D NULL, *pbuf, *inbuf, *in_mapping;
> +       u32 compsz, p, insz =3D ni->itype.compressed.block_size;
>         s32 rounded, bio_size;
>         int sz;
>         unsigned int bsz;
> @@ -1284,14 +1284,15 @@ static int ntfs_write_cb(struct ntfs_inode *ni, l=
off_t pos, struct page **pages,
>         loff_t new_length;
>         s64 new_vcn;
>
> -       inbuf =3D vmap(pages, pages_per_cb, VM_MAP, PAGE_KERNEL_RO);
> -       if (!inbuf)
> +       in_mapping =3D vmap(pages, pages_per_cb, VM_MAP, PAGE_KERNEL_RO);
> +       if (!in_mapping)
>                 return -ENOMEM;
> +       inbuf =3D in_mapping + page_offset;
>
>         /* may need 2 extra bytes per block and 2 more bytes */
>         pages_disk =3D kcalloc(pages_count, sizeof(struct page *), GFP_NO=
FS);
>         if (!pages_disk) {
> -               vunmap(inbuf);
> +               vunmap(in_mapping);
>                 return -ENOMEM;
>         }
>
> @@ -1361,7 +1362,9 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lof=
f_t pos, struct page **pages,
>                 err =3D 0;
>                 goto out;
>         } else {
> +               memcpy(outbuf, inbuf, insz);
>                 bio_size =3D insz;
> +               pages =3D pages_disk;
>         }
>
>         new_vcn =3D ntfs_bytes_to_cluster(vol,
> @@ -1420,7 +1423,8 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lof=
f_t pos, struct page **pages,
>                                         GFP_NOIO);
>                         bio->bi_iter.bi_sector =3D
>                                 ntfs_bytes_to_sector(vol,
> -                                               ntfs_cluster_to_bytes(vol=
, bio_lcn + i));
> +                                               ntfs_cluster_to_bytes(vol=
, bio_lcn) +
> +                                               ((s64)i << PAGE_SHIFT));
>                 }
>
>                 if (!bio_add_page(bio, pages[i], page_size, 0)) {
> @@ -1437,7 +1441,8 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lof=
f_t pos, struct page **pages,
>         err =3D submit_bio_wait(bio);
>         bio_put(bio);
>  out:
> -       vunmap(outbuf);
> +       if (outbuf)
> +               vunmap(outbuf);
>         for (i =3D 0; i < pages_count; i++) {
>                 pg =3D pages_disk[i];
>                 if (pg) {
> @@ -1446,7 +1451,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lof=
f_t pos, struct page **pages,
>                 }
>         }
>         kfree(pages_disk);
> -       vunmap(inbuf);
> +       vunmap(in_mapping);
>         NInoSetFileNameDirty(ni);
>         mark_mft_record_dirty(ni);
>
> @@ -1458,12 +1463,15 @@ int ntfs_compress_write(struct ntfs_inode *ni, lo=
ff_t pos, size_t count,
>  {
>         struct folio *folio;
>         struct page **pages =3D NULL, *page;
> -       int pages_per_cb =3D ni->itype.compressed.block_size >> PAGE_SHIF=
T;
> +       int pages_per_cb;
>         int cb_size =3D ni->itype.compressed.block_size, cb_off, err =3D =
0;
>         int i, ip;
>         size_t written =3D 0;
>         struct address_space *mapping =3D VFS_I(ni)->i_mapping;
>
> +       pages_per_cb =3D DIV_ROUND_UP(offset_in_page(pos & ~(cb_size - 1)=
) +
> +                       cb_size, PAGE_SIZE);
> +
>         pages =3D kmalloc_array(pages_per_cb, sizeof(struct page *), GFP_=
NOFS);
>         if (!pages)
>                 return -ENOMEM;
> @@ -1471,6 +1479,7 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff=
_t pos, size_t count,
>         while (count) {
>                 pgoff_t index;
>                 size_t copied, bytes;
> +               unsigned int page_offset;
>                 int off;
>
>                 off =3D pos & (cb_size - 1);
> @@ -1479,6 +1488,8 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff=
_t pos, size_t count,
>                         bytes =3D count;
>
>                 cb_off =3D pos & ~(cb_size - 1);
> +               page_offset =3D offset_in_page(cb_off);
> +               pages_per_cb =3D DIV_ROUND_UP(page_offset + cb_size, PAGE=
_SIZE);
>                 index =3D cb_off >> PAGE_SHIFT;
>
>                 if (unlikely(fault_in_iov_iter_readable(from, bytes))) {
> @@ -1527,7 +1538,7 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff=
_t pos, size_t count,
>                         }
>                 }
>
> -               err =3D ntfs_write_cb(ni, pos, pages, pages_per_cb);
> +               err =3D ntfs_write_cb(ni, pos, pages, pages_per_cb, page_=
offset);
>
>                 for (i =3D 0; i < pages_per_cb; i++) {
>                         folio =3D page_folio(pages[i]);
> --
> 2.34.1
>


--=20
Thanks,
Hyunchul
