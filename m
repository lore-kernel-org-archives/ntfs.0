Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F832D5C68
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230277; cv=pass; b=JUwLTgYBR5+uTSJ0w5ymTQp/Oct8sl8fmF23mCofPvwJq+8yJCeSvxvbtU9aWB9kecusrsAIlbuZCOb/xYjlwpR7bjiu+OhvJjzS4mgp7P0I/LKGOjA4oP9Nak0mgLl41VJ4fuK3ewdLzd8nStLVUN+fBnHy69Wx3tF/cxbTua0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230277; c=relaxed/simple;
	bh=qFpibHGLEI0Jx60/PNyLYRe21PueaCJpidA3Af3q+rI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMwEtOYPfwHc1AMBngQXk8bypPzZla0YR9/mTjp4pTdnfjqoSWI66O1D359olTWYdGWpCguQPjqMrAGdjf6p1Xlvgt7xTrA2ctShM9q0Wc28JY46OUff8TgaOygWXNqZgEnlUkTT9RUlOkDOobD+VNbWPEcHU+64D7EkHMJ0y1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQGc22UQ; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQGc22UQ"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a33307ecd9so18717201fa.2
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789230273; cv=none;
        d=google.com; s=arc-20260327;
        b=iXac2zlByqr5nVIC/Ql71ssoxI2e/nSDc6KqIlJuYRv7+BoALMHri2tbjYt3iZqzsR
         puKdSSoevb6btUHGBRIl5mOgP6NO15t37Okrtx6O4OnCmMe9iBiqq+vws/c0j6r9CmFc
         B0MEHJuvr2hgYlFN64coid4C2xPTA+Retr5KC2W3NTcAjzQtLQVEEQRq4elwHxWnRgpl
         lZLnAawB+6pBlROS9tHYmL1OM6EplYbwdjOYVoRdIS89oDulbSkGbKpKHccdFJf4ErVM
         m+EvxJ0LrkXn+hN9ZbZnDZPD4BO08gifzEpFzuM/0zd8r8zthO8cxBrtzfDD8swDvMMN
         WkGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mzxje7qMANa7EwZ4FvopA9qGr90WrfvmCKLX3pX1aAo=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=OGuBIiHb39/NAm+T7hxWql18TxFyAnMm2nwjhALDahqMRrPfoVPP67wwxgDltJm5It
         A0gF5IlSH/ybIosQxJC9metnbODBEeUYHLmMe2kEge35eYlDHSY9yYR7PXDuyUwDNQiu
         3HlVtAseZl/9AMG1dHoy0Z71bROHpHtkr3jlCVTznvLCR/3SarJAGe+yOBphuPeCC74A
         S5SxZbGe7SNOwyTGqftIUKFvaNbLpgiFhamLM+TT5HGxtlu48v37v1tiIyw5qP3S2F8Q
         2m6+3JP9eWcSiYmG95KwJ87ZMrsBWFoh83/LnMPcI+xsnEeiEqpxkflrgYUfm5uWaYWf
         w/rg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230273; x=1789835073; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mzxje7qMANa7EwZ4FvopA9qGr90WrfvmCKLX3pX1aAo=;
        b=mQGc22UQGgZV6kRcVukqIBhQsMEyekJU9n/FOnPBxjkXELLNJE1qACdU7zfEkA2HeR
         kVSeUxZa4zOzbtWm7GKycsjsElS98Yoti2hvR3sVwwDAmangAnksxI4Lf46dfwtzSFpr
         +Us6YXr9FtBK/NCYbqvv5ckab+sdzpk6oOxSq0Sxv2/54/A0LQSOxSPv5B5D6s6GqkPG
         YqtAFqrfnYEjagfYUmOVKVxKlKXaG/Js7oTFZ51G2hVNY3/feWm3ibd569zRSPOAFyfS
         bV6+v1y4w3q7wrPXn5zHUuMLCPrFS+XouvUdFRHLuikx5wwArFWZfyg4S2ig4aCYsn7u
         Um5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230273; x=1789835073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzxje7qMANa7EwZ4FvopA9qGr90WrfvmCKLX3pX1aAo=;
        b=lM0qcZL5Tfgx/s10fm2BUkPP6HC8vgi7lhdVWnS93LpJoQhAh/RAItJc+nnKhOzH88
         ZldO+WhraWGtGnLj9H+JyQ7opLAYTnf2bDumzaOM1zbkt02Rk8OpxRT6cHHkNkuTEU/c
         knlQOn8W3ZPUYnyL89u+KZRQJ7RN/v+xQm1avejTnRGotYy0hd4PTYdTLcfZEhboUp4A
         IhV7jaFqHv7TV9UhRGiuhEAi+0mlyJyI9Ap8H/6Mh6LcktVs/bmkyPirYxOErX/BVM+E
         iTwL8XZJQiDoEq6gr/VRzZxUmkiLA4SgfTqcsJ8gV35PQzOWujn6QT7AT8WD48U+0xwT
         GWUg==
X-Gm-Message-State: AFuF++k7MAMIRd76f3fYXZJLqo2W8/gHujcG+L1umvhyq0vpluu6U2Qz
	uZHQc8iG8Ou63vik9FAcv6PMhlOfL8eDstqOZaiyZ4AEvRGyxT3baDU7WPPRPZfyIuEyHvqW6dV
	loSrVM7TvB+8McSsjW7WdF3ruQET88Po=
X-Gm-Gg: AYBFou26XC0oy8xefrEPvV7FVnj69OOd8hQoAPvf2VmvUtLsoOfFxo95wRwbCwmbXPT
	URZBcdoe/CYGS0ph3DjS5TPAI23qnNBC3wGh2QYoWvhQMqPOxIcXqiswR4byXQpjx1zcXNDfr11
	XWKkciBD52oKLMJPqobufBtSmY6wFzdvGf753xEsrVDQdFFHqzleGiKK/CEu+vhYMrUMUR5/SDO
	Eg3Nv4n8kElDOB5MCpkAQNWYN148qaXZW37zrMJ3J9lBlnwdSG/I3Ihyh4YKw08rLUHlYZn0yIx
	3H0Ur469b1vwdGOsGYuctsbjMJqH5+MRcflhnVUz8nZKyS6Eacq51csv
X-Received: by 2002:a05:6512:3e1b:b0:5b6:1a81:ba62 with SMTP id
 2adb3069b0e04-5b8a0330710mr2066764e87.67.1789230272675; Sat, 12 Sep 2026
 09:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908094416.10534-1-linkinjeon@kernel.org> <20260908094416.10534-2-linkinjeon@kernel.org>
In-Reply-To: <20260908094416.10534-2-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sun, 13 Sep 2026 01:24:19 +0900
X-Gm-Features: AcwNN1VBmWh-Vhcs4TRlIG2spu9x_ZOTD_6ZnCIYc8O7RMp79DzOxSJW-Kw2a1Y
Message-ID: <CANFS6bYNK_ee7SX4keVE6J0J1hRm-MxUbPoQg0QASLqjs4ZJew@mail.gmail.com>
Subject: Re: [PATCH] ntfs: repack $MFT/$ATTRIBUTE LIST
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 8=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:44, Na=
mjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Repack the non-resident $MFT/$ATTRIBUTE_LIST into a contiguous run
> when its mapping pairs no longer fit in the base MFT record. Propagate
> allocation and writeback errors, and check synchronous replacement writes=
.
>
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/attrib.c   |  47 ++++++++---
>  fs/ntfs/attrlist.c | 202 ++++++++++++++++++++++++++++++++++++++++++---
>  fs/ntfs/inode.c    |  10 ++-
>  3 files changed, 236 insertions(+), 23 deletions(-)
>
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index 81b9e0971b3e..d1696ce6acd5 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -3844,13 +3844,13 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_in=
ode *ni, s64 from_vcn)
>                          */
>                         if (ni->type =3D=3D AT_ATTRIBUTE_LIST) {
>                                 ntfs_attr_put_search_ctx(ctx);
> -                               if (ntfs_inode_free_space(base_ni, mp_siz=
e -
> -                                                       cur_max_mp_size))=
 {
> -                                       ntfs_debug("Attribute list is too=
 big. Defragment the volume\n");
> -                                       return -ENOSPC;
> -                               }
> -                               if (ntfs_attrlist_update(base_ni))
> -                                       return -EIO;
> +                               err =3D ntfs_inode_free_space(base_ni, mp=
_size -
> +                                                       cur_max_mp_size);
> +                               if (err)
> +                                       return err;
> +                               err =3D ntfs_attrlist_update(base_ni);
> +                               if (err)
> +                                       return err;
>                                 goto retry;
>                         }
>
> @@ -4522,13 +4522,39 @@ static int ntfs_non_resident_attr_expand(struct n=
tfs_inode *ni, const s64 newsiz
>                                         ntfs_bytes_to_cluster(vol, ni->al=
located_size),
>                                         first_free_vcn -
>                                         ntfs_bytes_to_cluster(vol, ni->al=
located_size),
> -                                       lcn_seek_from, DATA_ZONE, false, =
false, false);
> +                                       lcn_seek_from, DATA_ZONE, false,
> +                                       ni->type =3D=3D AT_ATTRIBUTE_LIST=
, false);
>                         if (IS_ERR(rl)) {
>                                 ntfs_debug("Cluster allocation failed (%l=
ld)",
>                                                 (long long)first_free_vcn=
 -
>                                                 ntfs_bytes_to_cluster(vol=
, ni->allocated_size));
>                                 return PTR_ERR(rl);
>                         }
> +                       /*
> +                        * A contiguous ATTRIBUTE_LIST allocation keeps i=
ts mapping
> +                        * pairs small enough to fit in the base MFT reco=
rd. The
> +                        * allocator can return a short run when contigui=
ty was
> +                        * requested, so discard it and retry normally if=
 necessary.
> +                        */
> +                       if (ni->type =3D=3D AT_ATTRIBUTE_LIST &&
> +                               (rl->vcn !=3D ntfs_bytes_to_cluster(vol,
> +                                               ni->allocated_size) ||
> +                                rl->length !=3D first_free_vcn -
> +                                       ntfs_bytes_to_cluster(vol, ni->al=
located_size) ||
> +                                rl[1].length)) {
> +                               ntfs_cluster_free_from_rl(vol, rl);
> +                               kvfree(rl);
> +                               rl =3D ntfs_cluster_alloc(vol,
> +                                               ntfs_bytes_to_cluster(vol=
,
> +                                                               ni->alloc=
ated_size),
> +                                               first_free_vcn -
> +                                               ntfs_bytes_to_cluster(vol=
,
> +                                                               ni->alloc=
ated_size),
> +                                               lcn_seek_from, DATA_ZONE,=
 false,
> +                                               false, false);
> +                               if (IS_ERR(rl))
> +                                       return PTR_ERR(rl);
> +                       }
>                 }
>
>                 if (!NInoCompressed(ni)) {
> @@ -4921,7 +4947,8 @@ int ntfs_attr_expand(struct ntfs_inode *ni, const s=
64 newsize, const s64 preallo
>         ntfs_debug("Entering for inode 0x%llx, attr 0x%x, size %lld\n",
>                         (unsigned long long)ni->mft_no, ni->type, newsize=
);
>
> -       if (ni->data_size =3D=3D newsize) {
> +       if (ni->data_size =3D=3D newsize &&
> +               (!prealloc_size || prealloc_size <=3D ni->allocated_size)=
) {
>                 ntfs_debug("Size is already ok\n");
>                 return 0;
>         }
> @@ -4936,7 +4963,7 @@ int ntfs_attr_expand(struct ntfs_inode *ni, const s=
64 newsize, const s64 preallo
>         }
>
>         if (NInoNonResident(ni)) {
> -               if (newsize > ni->data_size)
> +               if (newsize > ni->data_size || prealloc_size > ni->alloca=
ted_size)
>                         err =3D ntfs_non_resident_attr_expand(ni, newsize=
, prealloc_size,
>                                                             NVolDisableSp=
arse(ni->vol) ?
>                                                             HOLES_NO : HO=
LES_OK, true);
> diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
> index a1c00e426e80..b280af3c4b77 100644
> --- a/fs/ntfs/attrlist.c
> +++ b/fs/ntfs/attrlist.c
> @@ -12,6 +12,9 @@
>  #include "mft.h"
>  #include "attrib.h"
>  #include "attrlist.h"
> +#include "lcnalloc.h"
> +
> +#define NTFS_MAX_ATTR_LIST_SIZE        (256 * 1024)
>
>  /*
>   * ntfs_attrlist_need - check whether inode need attribute list
> @@ -51,11 +54,151 @@ int ntfs_attrlist_need(struct ntfs_inode *ni)
>         return 0;
>  }
>
> +/*
> + * Repack the $MFT/$ATTRIBUTE_LIST data into one run.
> + *
> + * The mapping pairs for an $ATTRIBUTE_LIST must remain in the base MFT
> + * record. Once that record has no room left, extending a fragmented lis=
t
> + * can require one more mapping-pairs byte than the record can hold. The=
re
> + * is no attribute that can legally be moved out in that state: $STANDAR=
D_
> + * INFORMATION, $ATTRIBUTE_LIST, and the first $MFT/$DATA extent all hav=
e to
> + * stay in the base record.  Move the list data to one contiguous run. T=
he
> + * caller supplies the minimum allocation size so a recovery can use the
> + * smallest useful run while normal updates can still request the maximu=
m
> + * legal list size as a reserve.
> + */
> +static int ntfs_attrlist_repack(struct inode *attr_vi,
> +               struct ntfs_inode *attr_ni, s64 min_alloc_size)
> +{
> +       struct ntfs_volume *vol =3D attr_ni->vol;
> +       struct runlist_element *old_rl, *new_rl;
> +       u8 *data =3D NULL;
> +       s64 data_size, alloc_size, nr_clusters, written;
> +       s64 old_alloc_size;
> +       size_t old_rl_count, new_rl_count;
> +       unsigned long flags;
> +       int err, restore_err;
> +
> +       if (attr_ni->mft_no !=3D FILE_MFT || !NInoNonResident(attr_ni) ||
> +               min_alloc_size < 0)
> +               return -EINVAL;
> +
> +       err =3D ntfs_attr_map_whole_runlist(attr_ni);
> +       if (err)
> +               return err;
> +
> +       data_size =3D attr_ni->data_size;
> +       if (data_size < 0)
> +               return -EIO;
> +
> +       if (data_size) {
> +               data =3D kvmalloc(data_size, GFP_NOFS);
> +               if (!data)
> +                       return -ENOMEM;
> +
> +               written =3D ntfs_inode_attr_pread(attr_vi, 0, data_size, =
data);
> +               if (written !=3D data_size) {
> +                       err =3D written < 0 ? (int)written : -EIO;
> +                       goto out_free_data;
> +               }
> +       }
> +
> +       old_alloc_size =3D attr_ni->allocated_size;
> +       alloc_size =3D max_t(s64, old_alloc_size, min_alloc_size);
> +       nr_clusters =3D ntfs_bytes_to_cluster(vol,
> +                       alloc_size + vol->cluster_size - 1);
> +       if (nr_clusters <=3D 0) {
> +               err =3D -EFBIG;
> +               goto out_free_data;
> +       }
> +
> +       /* A single run keeps the mapping pairs at the minimum size. */
> +       new_rl =3D ntfs_cluster_alloc(vol, 0, nr_clusters, -1, DATA_ZONE,
> +                                   true, true, false);
> +       if (IS_ERR(new_rl)) {
> +               err =3D PTR_ERR(new_rl);
> +               goto out_free_data;
> +       }
> +
> +       new_rl_count =3D 0;
> +       if (new_rl->vcn =3D=3D 0 && new_rl->length =3D=3D nr_clusters &&
> +               !new_rl[1].length)
> +               new_rl_count =3D 2;
> +
> +       if (new_rl_count !=3D 2) {
> +               ntfs_cluster_free_from_rl(vol, new_rl);
> +               kvfree(new_rl);
> +               err =3D -ENOSPC;
> +               goto out_free_data;
> +       }
> +
> +       old_rl =3D attr_ni->runlist.rl;
> +       old_rl_count =3D attr_ni->runlist.count;
> +       down_write(&attr_ni->runlist.lock);
> +       attr_ni->runlist.rl =3D new_rl;
> +       attr_ni->runlist.count =3D new_rl_count;
> +       up_write(&attr_ni->runlist.lock);
> +
> +       write_lock_irqsave(&attr_ni->size_lock, flags);
> +       attr_ni->allocated_size =3D ntfs_cluster_to_bytes(vol, nr_cluster=
s);
> +       write_unlock_irqrestore(&attr_ni->size_lock, flags);
> +
> +       /* Populate the replacement extent before publishing its mapping =
pairs. */
> +       if (data_size) {
> +               written =3D ntfs_inode_attr_pwrite(attr_vi, 0, data_size,=
 data, true);
> +               if (written !=3D data_size) {
> +                       err =3D written < 0 ? (int)written : -EIO;
> +                       goto restore_old_runlist;
> +               }
> +       }
> +
> +       err =3D ntfs_attr_update_mapping_pairs(attr_ni, 0);
> +       if (err)
> +               goto restore_old_runlist;
> +
> +       /* The new mapping is now authoritative; release the old data run=
s. */
> +       if (ntfs_cluster_free_from_rl(vol, old_rl)) {
> +               ntfs_error(vol->sb,
> +                          "Failed to free old ATTRIBUTE_LIST extent: ino=
de %#llx",
> +                          (long long)attr_ni->mft_no);
> +               NVolSetErrors(vol);
> +       }
> +       kvfree(old_rl);
> +       kvfree(data);
> +       return 0;
> +
> +restore_old_runlist:
> +       down_write(&attr_ni->runlist.lock);
> +       attr_ni->runlist.rl =3D old_rl;
> +       attr_ni->runlist.count =3D old_rl_count;
> +       up_write(&attr_ni->runlist.lock);
> +
> +       write_lock_irqsave(&attr_ni->size_lock, flags);
> +       attr_ni->allocated_size =3D old_alloc_size;
> +       write_unlock_irqrestore(&attr_ni->size_lock, flags);
> +
> +       restore_err =3D ntfs_attr_update_mapping_pairs(attr_ni, 0);
> +       if (restore_err) {
> +               ntfs_error(vol->sb, "Failed to restore ATTRIBUTE_LIST map=
ping pairs (%d)",
> +                          restore_err);
> +               NVolSetErrors(vol);
> +       }
> +
> +       ntfs_cluster_free_from_rl(vol, new_rl);
> +       kvfree(new_rl);
> +       err =3D err ? err : restore_err;
> +
> +out_free_data:
> +       kvfree(data);
> +       return err;
> +}
> +
>  int ntfs_attrlist_update(struct ntfs_inode *base_ni)
>  {
>         struct inode *attr_vi;
>         struct ntfs_inode *attr_ni;
> -       int err;
> +       s64 written;
> +       int err, retry_err;
>
>         /*
>          * generic_shutdown_super() clears SB_ACTIVE before evicting cach=
ed
> @@ -74,21 +217,55 @@ int ntfs_attrlist_update(struct ntfs_inode *base_ni)
>         attr_ni =3D NTFS_I(attr_vi);
>
>         err =3D ntfs_attr_truncate_i(attr_ni, base_ni->attr_list_size, HO=
LES_NO);
> -       if (err =3D=3D -ENOSPC && attr_ni->mft_no =3D=3D FILE_MFT) {
> -               err =3D ntfs_attr_truncate(attr_ni, 0);
> -               if (err || ntfs_attr_truncate_i(attr_ni, base_ni->attr_li=
st_size, HOLES_NO) !=3D 0) {
> +       if (err =3D=3D -ENOSPC && attr_ni->mft_no =3D=3D FILE_MFT &&
> +               NInoNonResident(attr_ni)) {
> +               retry_err =3D ntfs_attrlist_repack(attr_vi, attr_ni,
> +                                       base_ni->attr_list_size);
> +               if (retry_err) {
> +                       ntfs_error(base_ni->vol->sb, "Failed to repack at=
tribute list");
>                         iput(attr_vi);
> +                       return retry_err;
> +               }
> +
> +               retry_err =3D ntfs_attr_truncate_i(attr_ni, base_ni->attr=
_list_size,
> +                                                HOLES_NO);
> +               if (retry_err) {
>                         ntfs_error(base_ni->vol->sb,
> -                                       "Failed to truncate attribute lis=
t of inode %#llx",
> -                                       (long long)base_ni->mft_no);
> -                       return -EIO;
> +                                  "Failed to resize attribute list after=
 repack");
> +                       iput(attr_vi);
> +                       return retry_err;
>                 }
>         } else if (err) {
>                 iput(attr_vi);
>                 ntfs_error(base_ni->vol->sb,
>                            "Failed to truncate attribute list of inode %#=
llx",
>                            (long long)base_ni->mft_no);
> -               return -EIO;
> +               return err;
> +       }
> +
> +       /*
> +        * Reserve the maximum legal list size while the MFT metadata are=
a is
> +        * still easy to allocate contiguously. This prevents a later lis=
t entry
> +        * from needing another mapping-pairs byte in the full base MFT r=
ecord.
> +        * Failure to obtain the optional reserve must not reject the cur=
rent
> +        * metadata update; the repack retry above remains available if n=
eeded.
> +        */
> +       if (base_ni->mft_no =3D=3D FILE_MFT && NInoNonResident(attr_ni) &=
&
> +               attr_ni->allocated_size < NTFS_MAX_ATTR_LIST_SIZE) {
> +               retry_err =3D ntfs_attr_expand(attr_ni, base_ni->attr_lis=
t_size,
> +                                            NTFS_MAX_ATTR_LIST_SIZE);
> +               if (retry_err =3D=3D -ENOSPC) {
> +                       retry_err =3D ntfs_attrlist_repack(attr_vi, attr_=
ni,
> +                                       NTFS_MAX_ATTR_LIST_SIZE);
> +                       if (retry_err =3D=3D -ENOSPC)
> +                               retry_err =3D 0;
> +               }
> +               if (retry_err) {
> +                       ntfs_error(base_ni->vol->sb,
> +                                  "Failed to reserve attribute list spac=
e");
> +                       iput(attr_vi);
> +                       return retry_err;
> +               }
>         }
>
>         i_size_write(attr_vi, base_ni->attr_list_size);
> @@ -96,14 +273,15 @@ int ntfs_attrlist_update(struct ntfs_inode *base_ni)
>         if (NInoNonResident(attr_ni) && !NInoAttrListNonResident(base_ni)=
)
>                 NInoSetAttrListNonResident(base_ni);
>
> -       if (ntfs_inode_attr_pwrite(attr_vi, 0, base_ni->attr_list_size,
> -                                  base_ni->attr_list, false) !=3D
> -           base_ni->attr_list_size) {
> +       written =3D ntfs_inode_attr_pwrite(attr_vi, 0, base_ni->attr_list=
_size,
> +                                        base_ni->attr_list, false);
> +       if (written !=3D base_ni->attr_list_size) {
> +               err =3D written < 0 ? (int)written : -EIO;
>                 iput(attr_vi);
>                 ntfs_error(base_ni->vol->sb,
>                            "Failed to write attribute list of inode %#llx=
",
>                            (long long)base_ni->mft_no);
> -               return -EIO;
> +               return err;
>         }
>
>         NInoSetAttrListDirty(base_ni);
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index eed48e1c90e5..f35d6370e2fb 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -3746,6 +3746,7 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(st=
ruct inode *vi,
>                         u64 rl_length =3D 0;
>                         s64 vcn;
>                         struct runlist_element *rl;
> +                       int bio_err;
>
>                         lcn_count =3D max_t(s64, 1, ntfs_bytes_to_cluster=
(vol, attr_len));
>                         vcn =3D ntfs_pidx_to_cluster(vol, folio->index);
> @@ -3788,8 +3789,15 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(s=
truct inode *vi,
>                                         goto err_unlock_folio;
>                                 }
>
> -                               submit_bio_wait(bio);
> +                               bio_err =3D submit_bio_wait(bio);
>                                 bio_put(bio);
> +                               if (bio_err) {
> +                                       ntfs_error(vi->i_sb,
> +                                                  "Synchronous attribute=
 write failed (%d)",
> +                                                  bio_err);
> +                                       ret =3D bio_err;
> +                                       goto err_unlock_folio;
> +                               }
>                                 vcn +=3D rl_length;
>                                 offset +=3D length;
>                         } while (lcn_count !=3D 0);
> --
> 2.25.1



--=20
Thanks,
Hyunchul
