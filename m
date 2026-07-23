Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2301027AC45
	for <ntfs@lists.linux.dev>; Thu, 23 Jul 2026 02:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772858; cv=pass; b=gVRKXvYi4hJ7qWg6mZaq6MsGlRaT4+WBqKJy07a5ykK3nYPPTlF+iKXUB5Xel8tPpFPU/rEHX1zFk7HavBP097yenfdCh2TESgASR54qcdneZcyr3ESNmBgI68G1Ry5jXOD+LQtO4KdyHlEQsp7VfML3GhXVF/JMx9UgKvCFaCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772858; c=relaxed/simple;
	bh=919VwU/tYR4uaGiBA0SeEA9DrUQBOePkCGetlZ0jnWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bgCgo0y/s0jnda1VUPc088ZqC/jIux/Vel+oT8TrO0evZgR0W7fTsDEWxQB40dladprFV6J7b7OUM+q3LdbSZJhRfs3Xxqeet1PsfdYaa9fQHGSJ99HNpv2re4gvcDYmmzRMKhlKb/Fhz33brbrZrVbJ+dmmsPziYNlp3ewfwWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPyjPK1a; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPyjPK1a"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39eb257e9fbso689651fa.0
        for <ntfs@lists.linux.dev>; Wed, 22 Jul 2026 19:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784772855; cv=none;
        d=google.com; s=arc-20260327;
        b=KlfSi8Y3J5jX2O+WDM8M4T6+GiUHDpV/MtSAl+akm/Q5CtX/ba2IfHJ4Ifb93ut+Ri
         Uuml7RK3iMevrfT6BoJNOb//ap6kJ5J1OI0REJlcHYKN5S2mXhsqwDs1budLjp1lzNFM
         9MhpScerKdoKlAAX0odPsUzWZY036nONtjetUh/F4JW7RE7S86ZcZqnW3CZ+rMywd/Rn
         jo6j2++TP5UIouK7WQgOPPV4OS0ypolemGsxJogDBpllI9gz956Y6AA4N06I9r028Zx+
         wE4z422QNtNSP5EsYgL/9CcEBgvB83VHv3gVHBvKwqv8cdzKauxdp36ABFTGzQdDQ77M
         xytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I/rygiyNDf9wOrRzmD3qN2K3MK5iDakyZ1usXkGmu6U=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=kqf0X+673jfC5U5drfFZb2wt18PHJ71r42GOPQmmvqQYBBH+ZjTJEDxFwGCHsLK/vh
         C+p/V2SnXjKPN2oIFwITC2pf4HClVfbXivDKWO62h128JXX2/3ez623XPHSMS81sIria
         WrRcBL6glTfv3kSfgxNxY+g6alK8zrY6WXsjsTpnJEDJ3QpEIByUz+wYbGd4nL2JgONp
         4y8x4WtMj13O7AvfGSvVXTiqF/z7qochXZAvAlwNQCGbCbaJ9iZG8n4BQnEuNjA/fVec
         N0zn+pvtPA7Mc6I34XA1GJnpq+m3bT1NQBVlnDKlLtpPc0UNT1l8Ifu2SWkaWa1nnQnm
         M0gQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784772855; x=1785377655; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I/rygiyNDf9wOrRzmD3qN2K3MK5iDakyZ1usXkGmu6U=;
        b=GPyjPK1axtV25CB+qYJjrWfXX0FeuHgR/umqPVuTlsjDgqGr1EIs+4olh1QSknp1/C
         4sL0QFF1+pe9ACf44bDOqJA6LI54d9Xx+amQ8EB2dmeRXsFsgD9k7eagyzPzqf28rvnx
         0kxaQhKqvhZT0aGVDw2YHe8xF5VAwIvWqvTPO8B4EBY3m0wP4dpbLriSMrp43JPkcN8q
         Fat+mETBtI8yTE/jgOATEZZh1XH+Kpv+U9j8DNBePJT3gHwr+nfj13ALZkMRRVYfyvD8
         wonHTl/LEGuegDyTqbVNOjb+8FR9uGYdb/eD4cTlp2oHgc1VORpY2DY0GXQEkdB93Bxj
         meEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784772855; x=1785377655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/rygiyNDf9wOrRzmD3qN2K3MK5iDakyZ1usXkGmu6U=;
        b=FSsBSkJaspWCThT/HmzTW3CLq0rzu2pYyGz6N9SQAw4cjE568AHRpSVwn2Q+FyZ9Bb
         3qi+E8Fymh7VGtzxQoGcGJIEp8dCKX3tOFP8DZJCMpNx23gimBhOkURGQ5qC1uzGfiwO
         eTNj2CpwU5rdKyKbAHhhpFpARvL1PH/LFYZjwziccNx6pYEFuXd9NnpobI9N/vAHLx78
         IUry4+pSYYPnk/ktpmOC4sQOFsrmzCP1p9c9d77WvVGe03xebJagDIwfexuoi1b/br1K
         h9Zb4hW227IIOCBwYa64XFn0Ot2f6KdFnUJVbfiFVyFYfM1Cgk5V9ekXTRCxCYhWMalD
         clyA==
X-Gm-Message-State: AOJu0Yy+xv73HSZ+ju+P7fVTat6z2bt37FALKekyKsIj85GIAiww+QYs
	SgGOlz/yy1YOfsooS0eE1T+er3pc765s9BfeW2gVAa/oOFQ+id2T9v3qY7A6QhdGbqleOzRFUxX
	FMZy6FjSkAC5zVJk8Klcm2zO0TvCd8P4=
X-Gm-Gg: AR+sD12ggHwyD8RlMnlgHBp7jmCd/StMfwihs4Cj3vocMC0co/nta5zHkNRzoatqqdm
	MPdODyU/fNfs+LlwLeoNRQ1oY1WzKtta2gQw72OGOpLRa9aFNQhrQ1aZOfheRsFo2HPw5VoxoiW
	oXWTkqTjximMs7qu7cZcoPvkTLY45iZ4L+pUIMxtiIwPHrl1oN71UY5g1dkttL10/wy+furh6W5
	KGMtBhNxUAGx6jhEsO6t2KyWE722HyKEYTmCEfbGSdfTOk5pf3cBNlOm8h8Tw==
X-Received: by 2002:a05:6512:1c7:b0:5ae:bc4f:d631 with SMTP id
 2adb3069b0e04-5b2b2f77269mr106387e87.44.1784772854920; Wed, 22 Jul 2026
 19:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721095431.6619-1-linkinjeon@kernel.org> <20260721095431.6619-4-linkinjeon@kernel.org>
In-Reply-To: <20260721095431.6619-4-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 23 Jul 2026 11:14:03 +0900
X-Gm-Features: AUfX_mwBM2whFL2r_Pk1Q0oef5_Re0q-d917AdM190ku7V7GR2ASb_7yUFZv7sg
Message-ID: <CANFS6bbgWJXbU9+nQ2W48yZ7iaE4vT1KN1EacDnKGa8GTBbrzA@mail.gmail.com>
Subject: Re: [PATCH 04/11] ntfs: write compressed data before replacing old clusters
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 21=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:54, N=
amjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> ntfs_write_cb() punches the old compression unit and publishes the new
> mapping before submitting the replacement data. An allocation or I/O
> failure after the punch loses the previous contents and can leave the
> mapping pointing at unwritten clusters.
>
> Allocate and write the replacement clusters first. Replace the runlist on=
ly
> after the synchronous write succeeds, and free new clusters on failure.
>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>


> ---
>  fs/ntfs/compress.c | 63 ++++++++++++++++++++++++++--------------------
>  1 file changed, 36 insertions(+), 27 deletions(-)
>
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index 33ed0456bf7e..5b5cd494e5d8 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -1373,10 +1373,6 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lo=
ff_t pos, struct page **pages,
>
>         new_length =3D ntfs_bytes_to_cluster(vol, round_up(bio_size, vol-=
>cluster_size));
>
> -       err =3D ntfs_non_resident_attr_punch_hole(ni, new_vcn, ni->itype.=
compressed.block_clusters);
> -       if (err < 0)
> -               goto out;
> -
>         rlc =3D ntfs_cluster_alloc(vol, new_vcn, new_length, -1, DATA_ZON=
E,
>                         false, true, true);
>         if (IS_ERR(rlc)) {
> @@ -1385,28 +1381,6 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lo=
ff_t pos, struct page **pages,
>         }
>
>         bio_lcn =3D rlc->lcn;
> -       down_write(&ni->runlist.lock);
> -       rl =3D ntfs_runlists_merge(&ni->runlist, rlc, 0, &new_rl_count);
> -       if (IS_ERR(rl)) {
> -               up_write(&ni->runlist.lock);
> -               ntfs_error(vol->sb, "Failed to merge runlists");
> -               err =3D PTR_ERR(rl);
> -               if (ntfs_cluster_free_from_rl(vol, rlc))
> -                       ntfs_error(vol->sb, "Failed to free hot clusters.=
");
> -               kvfree(rlc);
> -               goto out;
> -       }
> -
> -       ni->runlist.count =3D new_rl_count;
> -       ni->runlist.rl =3D rl;
> -
> -       err =3D ntfs_attr_update_mapping_pairs(ni, 0);
> -       up_write(&ni->runlist.lock);
> -       if (err) {
> -               err =3D -EIO;
> -               goto out;
> -       }
> -
>         i =3D 0;
>         while (bio_size > 0) {
>                 int page_size;
> @@ -1423,6 +1397,10 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lo=
ff_t pos, struct page **pages,
>                 if (!bio) {
>                         bio =3D bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRIT=
E,
>                                         GFP_NOIO);
> +                       if (!bio) {
> +                               err =3D -ENOMEM;
> +                               goto free_rlc;
> +                       }
>                         bio->bi_iter.bi_sector =3D
>                                 ntfs_bytes_to_sector(vol,
>                                                 ntfs_cluster_to_bytes(vol=
, bio_lcn) +
> @@ -1433,7 +1411,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lof=
f_t pos, struct page **pages,
>                         err =3D submit_bio_wait(bio);
>                         bio_put(bio);
>                         if (err)
> -                               goto out;
> +                               goto free_rlc;
>                         bio =3D NULL;
>                         goto setup_bio;
>                 }
> @@ -1442,6 +1420,37 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lo=
ff_t pos, struct page **pages,
>
>         err =3D submit_bio_wait(bio);
>         bio_put(bio);
> +       if (err)
> +               goto free_rlc;
> +
> +       /* Do not discard the old compression block until the new one is =
safe. */
> +       err =3D ntfs_non_resident_attr_punch_hole(ni, new_vcn, cb_cluster=
s);
> +       if (err)
> +               goto free_rlc;
> +
> +       down_write(&ni->runlist.lock);
> +       rl =3D ntfs_runlists_merge(&ni->runlist, rlc, 0, &new_rl_count);
> +       if (IS_ERR(rl)) {
> +               up_write(&ni->runlist.lock);
> +               ntfs_error(vol->sb, "Failed to merge runlists");
> +               err =3D PTR_ERR(rl);
> +               goto free_rlc;
> +       }
> +
> +       ni->runlist.count =3D new_rl_count;
> +       ni->runlist.rl =3D rl;
> +       rlc =3D NULL;
> +
> +       err =3D ntfs_attr_update_mapping_pairs(ni, 0);
> +       up_write(&ni->runlist.lock);
> +       if (err)
> +               err =3D -EIO;
> +       goto out;
> +
> +free_rlc:
> +       if (ntfs_cluster_free_from_rl(vol, rlc))
> +               ntfs_error(vol->sb, "Failed to free hot clusters.");
> +       kvfree(rlc);
>  out:
>         if (outbuf)
>                 vunmap(outbuf);
> --
> 2.34.1
>


--=20
Thanks,
Hyunchul
