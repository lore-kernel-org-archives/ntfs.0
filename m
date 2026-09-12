Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAE5345EA2
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230294; cv=pass; b=HYzMBcbgI4fnjAj5dIcDW0e4O59kS2e+y8kBd2C0lwPEO4kFHz9IQchhT/mRsFynGnhOgbksDdjIq8aturSjAjRm6xoZYmZRm9XMK3yIKTe59pvxEhXX+y+RxFyOz8B1XGolfJyDhbWJWA7RWVINsmyPJW5EuNGs3+hEm4hl+14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230294; c=relaxed/simple;
	bh=8iDBeNCiN0hHJUZMaq7UhQbMSbgVa6Ej4eiaggtYEBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhxWSe3uWKsSaUEsBBYos9en6914AqYG6CwKo8Pa+i7c9weHr0eXwcKVNZ3IcTzlnfHoinN4CszcIzv1Q3xGYGKcoIDPlYg4KoEsjAHFALmDtQ9u+3PFh6i1EifM79Q0ppzwheM/yRfembfqxghMiRkE8hzqlt5VE4BJ4GTGGOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awu0eAqM; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awu0eAqM"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a318299b93so4613471fa.0
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789230291; cv=none;
        d=google.com; s=arc-20260327;
        b=JMmfEfJJg04Rm8P2p1/xEo+0f6nOMfXJQvq8FUrGMkRLrcVRzP1aO+ibR35LXlimky
         b4VjTrB7mcTrHRoejSOZfAE9MvbWhM69+RWG+qK+YIERRhCJSH4E3s2QvQoMjXcRK96S
         qbAyRd7EHPublm/PLA3gDISRKHGlzM8v4ktsKa66Z4sFg8OwZKuBcCYH1uvdPIoeHt2f
         OXWQPVq1jNxCq3KteCv0TzNO+dzoLsiJ2zzY9McmCsHcpU5EoK41aUWi/H2wLuVxtmCS
         iiuHavk//yNVObcMDs4GT3495q9LDCycwh3Uld2KsxWeN+5fa0lmbOmEnaqwm4kR2DKJ
         zBfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z9q+sCcYZMF4wQ4+sdiAoeIwVGno+N9kY6E86HHMjfQ=;
        fh=+fIODGKEI8GC7DJYPoGy51apnbpxk8ZO4wgRszSRpeI=;
        b=FfbhJY7T9U/wIxgUmMhzTCNOMuN+KpKyATTaxQ+Z9AuKyVzuFh2eV6WWP/v3UsEpHY
         ZB5vH+HXYa2Fgn0amRu2a8y2G6vDAG3WjeHDv+VGgGo6648TSxYcJXUTpYeGhnrrqzJX
         nb6Dw0VXovfFeWdVAD9jYwBTtn3GcS+0+ELWF8xbxorgr60I7oFQ5LdUXzsBLWz2odhj
         sZHkBtFTboWjJDnew+OcJXLxvDItBSbBzp6RxquEI2BCU/da63NrOI3gbUG46tsWTcrT
         LNm9d+KfAfBdJLIkwYo2GS4zWLI8iT8KnPan+p+mYglNuI8O4Z0llaEF3xYrw9AJliHu
         XBxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230291; x=1789835091; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z9q+sCcYZMF4wQ4+sdiAoeIwVGno+N9kY6E86HHMjfQ=;
        b=awu0eAqM4Le8J69M2W7l2B7qxmBxd9WnqYRPClrZSGEMwDAM2yS/dA/uXsqclRatuU
         BefjKlVcBBB7AQmgwbym73Jviz7sH50Sfo/X1N6+n5vm7Zh/oZ6BlsRJ3xfsCyScUSRP
         H+WZkQNV4ZDs32LkYVWfSSY8m5ygxZU3coEyHOpezOdrjjNCOFyMqfyNGmn/O8MXrULA
         1oMIz2gyNlGF+DQ4wUlhziO5wvKEEn3uwn2Uy2KLcCs6x+2YVJcwO083/viAn4FzNgUn
         T2sxchQrmSZC6e7GWcgz4NqfNVIowgrVL5Qrd3ozCEM6s6JlGXVIoh/AWjscdhbm2Y4u
         bEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230291; x=1789835091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9q+sCcYZMF4wQ4+sdiAoeIwVGno+N9kY6E86HHMjfQ=;
        b=SPMhbclcs39idfnLjwyE0pXbFVAhy2MzBEvovO7xPCSWpGhe8WdQRCBtW48xU/LIOU
         GKnQ6HQbnathY3OUUCKKiF5XRs/Vz9+tM9bhDLCC0yUx4r6k5ggdWJPqL8b5RDbuvOx9
         eMsguxlIJnwsnxZbRkwHTKEZTn/BHf2igTAnNVXA+smIky9jIIcb3e4lGUOob8e+zhta
         LSG/5tgEWKZzAVLjH1p1D1EP2AECZTzItyxmA55SvZW7eD57mHhIaTFzTcSUvkwHz0rH
         H/RLqZdVBBazKE9DlGvO54ZtIWwFhxOclVu4XUW6gcgRHR8IVKFdTm2dhil0e0ybf8Ha
         F0mg==
X-Gm-Message-State: AFuF++l3b6cNN02cWg+rOwodm4+YWNTQcz/Qo8WHYc648MqcWJRY63cS
	2sdsv9okHPG426jc4nlDqe+ece0czxUAomjCQyfTCUBBkxVKZSQHfAHRb8ruuzwJWuAoYBHiUfE
	V3h/wEWoMH9ExEp+82PqkThJbJg2qcotPoNKO
X-Gm-Gg: AYBFou0cpsBgbdcA+PzmRgyOtL1LKIN38MQFnDp/46s/niRZ3ohecRVbqFowqepfmFg
	El6Lv9+GOgldyjjuoMKOxOOMyCXZrlOkMQfRXqwgVGMD3iZ+/FUppCPkZHPZO6pPD4So1SBTOri
	nOJ2RznzqHcqDbYgcdCjrMBS9blvowp2SAJOAwtTda+TxSFFe1rRmGVOgNY2GQ6zX5RXJ5QdwSJ
	XD0A+HKaXbccYflMw9qcD2BRyEF4ur41GkVzX96b99F1gavRT0fviNIcQ4UJFdsvU4y+rU1WKlz
	JpqXcTtjMoVaLRGGlyiQWkfcNkfXb/QrfNZYbP8v+ZxOsN3ZGTY08JdO
X-Received: by 2002:a05:6512:1313:b0:5b6:4ae:3ff3 with SMTP id
 2adb3069b0e04-5b8a8ed97e0mr693001e87.27.1789230290482; Sat, 12 Sep 2026
 09:24:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908094416.10534-1-linkinjeon@kernel.org> <20260908094416.10534-3-linkinjeon@kernel.org>
In-Reply-To: <20260908094416.10534-3-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sun, 13 Sep 2026 01:24:38 +0900
X-Gm-Features: AcwNN1XDLR-1H_F4yGUTT9D4WfusOmIw2y2Qd1zPkFSejgc6LpuAEUYxXKcLDqo
Message-ID: <CANFS6bbhcXLw9LSo+9EFEZ_t21R0ABezPG3iTXyQ75ehm+mEDg@mail.gmail.com>
Subject: Re: [PATCH] ntfs: account for MFT records added during allocation
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 8=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:44, Na=
mjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> When no free MFT record is available in the initialized $MFT/$BITMAP,
> ntfs_mft_record_alloc() extends $MFT/$DATA and formats the requested reco=
rd
> together with a dynamically sized tail reserve. Those records become
> visible through the $MFT file size before charging the requested record t=
o
> the free-record counter.
>
> Account for all newly visible records before releasing the MFT allocation
> lock, then subtract the one record being allocated. Keep MFT counter
> updates independent of the asynchronous free-cluster scan and update the
> counter when a record is successfully cleared in the MFT bitmap.
>
> Store the clamped result of the MFT bitmap scan and keep statfs from
> exposing an invalid cached count if an accounting error occurs.
>
> Fixes: 115380f9a2f9 ("ntfs: update mft operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/mft.c    | 11 ++++++++---
>  fs/ntfs/super.c  | 12 +++++++++---
>  fs/ntfs/volume.h |  6 ------
>  3 files changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 61d4ee3a57fd..f0656d0bbeeb 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -1539,7 +1539,6 @@ static int ntfs_mft_bitmap_extend_initialized_noloc=
k(struct ntfs_volume *vol)
>         ret =3D ntfs_attr_set(mftbmp_ni, old_initialized_size, 8, 0);
>         if (likely(!ret)) {
>                 ntfs_debug("Done.  (Wrote eight initialized bytes to mft =
bitmap.");
> -               ntfs_inc_free_mft_records(vol, 8 * 8);
>                 return 0;
>         }
>         ntfs_error(vol->sb, "Failed to write to mft bitmap.");
> @@ -2135,6 +2134,7 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, =
const int mode,
>                           struct mft_record **ni_mrec, const s64 mft_data=
_vcn)
>  {
>         s64 ll, bit, old_data_initialized, old_data_size;
> +       s64 nr_new_mft_records =3D 0;
>         s64 max_mft_no =3D -1, reserve_start =3D -1, reserve_end =3D -1;
>         s64 candidate_reserve_end =3D -1;
>         s64 *reserve_endp;
> @@ -2501,8 +2501,13 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol,=
 const int mode,
>                         mft_ni->initialized_size);
>         WARN_ON(i_size_read(vol->mft_ino) > mft_ni->allocated_size);
>         WARN_ON(mft_ni->initialized_size > i_size_read(vol->mft_ino));
> +       nr_new_mft_records =3D (i_size_read(vol->mft_ino) - old_data_size=
) >>
> +                            vol->mft_record_size_bits;
>         read_unlock_irqrestore(&mft_ni->size_lock, flags);
>  mft_rec_already_initialized:
> +       /* Account for newly visible MFT records before dropping the lock=
. */
> +       if (nr_new_mft_records > 0)
> +               ntfs_inc_free_mft_records(vol, nr_new_mft_records);
>         /*
>          * We can finally drop the mft bitmap lock as the mft data attrib=
ute
>          * has been fully updated.  The only disparity left is that the
> @@ -2813,6 +2818,8 @@ int ntfs_mft_record_free(struct ntfs_volume *vol, s=
truct ntfs_inode *ni)
>         if (base_ni->mft_no !=3D FILE_MFT)
>                 down_write(&vol->mftbmp_lock);
>         err =3D ntfs_bitmap_clear_bit(vol->mftbmp_ino, mft_no);
> +       if (!err)
> +               ntfs_inc_free_mft_records(vol, 1);
>         if (!err && base_ni->mft_no =3D=3D FILE_MFT &&
>             mft_no + 1 =3D=3D vol->mft_record_reserve_pos &&
>             mft_no < vol->mft_record_reserve_end)
> @@ -2822,9 +2829,7 @@ int ntfs_mft_record_free(struct ntfs_volume *vol, s=
truct ntfs_inode *ni)
>         memalloc_nofs_restore(memalloc_flags);
>         if (err)
>                 goto bitmap_rollback;
> -
>         unmap_mft_record(ni);
> -       ntfs_inc_free_mft_records(vol, 1);
>         return 0;
>
>         /* Rollback what we did... */
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 60d43339c590..0867d6a82ebe 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -2064,8 +2064,7 @@ static unsigned long __get_nr_free_mft_records(stru=
ct ntfs_volume *vol,
>         /* If errors occurred we may well have gone below zero, fix this.=
 */
>         if (nr_free < 0)
>                 nr_free =3D 0;
> -       else
> -               atomic64_set(&vol->free_mft_records, nr_free);
> +       atomic64_set(&vol->free_mft_records, nr_free);
>
>         ntfs_debug("Exiting.");
>         return nr_free;
> @@ -2131,7 +2130,14 @@ static int ntfs_statfs(struct dentry *dentry, stru=
ct kstatfs *sfs)
>         read_unlock_irqrestore(&mft_ni->size_lock, flags);
>
>         /* Free inodes in fs (based on current total count). */
> -       sfs->f_ffree =3D atomic64_read(&vol->free_mft_records);
> +       size =3D atomic64_read(&vol->free_mft_records);
> +       if (unlikely(size < 0 || size > (s64)sfs->f_files))
> +               ntfs_warning(vol->sb, "Invalid free MFT record count %lld=
.", size);
> +       if (size < 0)
> +               size =3D 0;
> +       else if (size > (s64)sfs->f_files)
> +               size =3D sfs->f_files;
> +       sfs->f_ffree =3D size;
>
>         /*
>          * File system id. This is extremely *nix flavour dependent and e=
ven
> diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
> index 2b60d14fc7ef..bc85a9592245 100644
> --- a/fs/ntfs/volume.h
> +++ b/fs/ntfs/volume.h
> @@ -258,17 +258,11 @@ static inline void ntfs_dec_free_clusters(struct nt=
fs_volume *vol, s64 nr)
>
>  static inline void ntfs_inc_free_mft_records(struct ntfs_volume *vol, s6=
4 nr)
>  {
> -       if (!NVolFreeClusterKnown(vol))
> -               return;
> -
>         atomic64_add(nr, &vol->free_mft_records);
>  }
>
>  static inline void ntfs_dec_free_mft_records(struct ntfs_volume *vol, s6=
4 nr)
>  {
> -       if (!NVolFreeClusterKnown(vol))
> -               return;
> -
>         atomic64_sub(nr, &vol->free_mft_records);
>  }
>
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
