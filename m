Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88DF3859E6
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230256; cv=pass; b=jOaDmHzYgDIsTCzVwmRF/l4qNXxitko+GtU8//LGWo5Xf6/zQq6VFvfot4z6E+I/rXa6dKjFvOKnsrNZUsrYDC9n6O6VRpWFZ2BLuNqFqlf4wFopBGlcukHVRfeo4LQod/qR2Wiw5YxnrSt88NpQtYVbhOdQtRC2V2KY1vtd1+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230256; c=relaxed/simple;
	bh=vFtKOUoap6Qddmnmg0EXPgSrilTiu+ofCb3X7A2yO1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZ7iUoyX4EBQmSO5h6Bhs0nGhzZpUc6yb1c97n1qWW3ExVHuHrgKNzAAHhnkL08tU3zJ1GhfWUOEylGIxz/hqFY/uIogYKnYfGCnuLw8jTlf1mH1MKSN5CeZPZCV06upHGH809cYzb+4wB9om3tQ0NHZllkpQ0auuAn9jA08xUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ir7+ybiv; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ir7+ybiv"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b81a2d33f7so1877651e87.3
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789230252; cv=none;
        d=google.com; s=arc-20260327;
        b=QhAs1Yu0WCCTf9V0xq3pgNpg4aVHpLy11QjE0R3kqir7ixUJ5fU4bxnmz7Oa3wTIPf
         +xIZryUKpbhcAUjIjB5bqHY+MVmKVmUJhd6H9hPaNvA4ZiYHRFi3jDZwsTmoW5DqmbV/
         rZcCyZzbXDmnWjTj5NbXzaOEXOVBP7ynrrInKoEUuDK+ClsD3v4qrMUeB0ukooPK8Y7J
         z0/imF8QCnUZOmxRHgZoTIb1sTGIyBx+AnA/7evc+IHnqXp7zPGWnaZFix3o9BTXyc6D
         kk4iM0iAnkDQ+VJ7jpZokfRd/TUDS2m2RxsiOMv5MjeJlAayivowA5w1rXW7quwz8ngI
         tlGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aImJk0GxpY2Ey1DGCVDIqAzFFI3/ahS9QsGRenc9nXA=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=GonZSNeLL36wvo9sShagqAeZr1UtINpjxBNajR33jGJi2O9XhBLaphRWdkrhxCL7Xd
         6OZonFdUVm86gZScmcyZrxBEcHzJFxoakOi2yIwE/iLwLKikTEy3J58D1u8M57LphmLb
         YAktKodAbTbOatP83uNldDu8XoVeU8g+0IF00Zi8GkZy6SmAXVb/DwS1PTScBvWUvTe1
         frZqtXR/ZZI7I5G0TrFRRJ50SYSK3DKowW885dwZtM4xf7b8MWwsqbKZTDWKGrfQ7xqj
         O95Cdujg2hDn4wNvsNk509dArJlfGPtCs5AWoPzdPdhcC905THNYLSW8TiirjMpPLdSN
         5PZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230252; x=1789835052; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aImJk0GxpY2Ey1DGCVDIqAzFFI3/ahS9QsGRenc9nXA=;
        b=ir7+ybivjQO7LllRyp/O+JktnRDWGo/OCXajkx+KMR1ngFXnmxAyei0JAo+ubALbYc
         oK/Ezxepw9JG/CNOrtbrbKFMjwpk0GqGSZUswRM1hFcav762+NtVK3ELBcEfW/0/UkM5
         wHHXOhEj4BBox0oDFCppXVsc3Abvrmiig56/32onVtUGcJkMzI2NloiSbaIx0ZX/Ozm7
         GI7XIiYyKGVF7Hx2yrKxVlyDXZvwgO2H0+avBk3MtTteHzrBnuWxu4NjVl/LaTpyoDHY
         mwDFQmvmrW2DGla3Y0BrQVspRc9OkKENAzbAtCK7FKYXUKMO+JvE2XVunzhKvXFn2Vsf
         eX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230252; x=1789835052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aImJk0GxpY2Ey1DGCVDIqAzFFI3/ahS9QsGRenc9nXA=;
        b=loXt8dEcVjRjjGFyRbqgsIKgla8jSButRLdUaWjx9vOsrj95sDjWJcYYaPZqaX8T6I
         uicWyR9gs28Jd7wUmiE/PXqrVEeH/Vj3+He4+8IUfsZLVGu/hAeB///XCApU0RFc1tD7
         49n52uKyfhDciOugjihVZdOZvxY1xkYXp0+86kLb2y2L1avEiJXtbDCWtO2ichbs/qcB
         EoIrV4+gKo8y9nWj3DOpeTz+NSp8r937Mli7+ZTYPpGSaK38+S8RXPCk4SGb1Ag0LY8U
         xpZUMtvvqhgnrWHGW/Z+rcQz+r8/0HKY2B+bjr/AYP31InmiDF/PHJL0hd9Pv278yPeJ
         JitQ==
X-Gm-Message-State: AFuF++mZx0fa+bkR8+N/+csIKxusEZVhb/SKK5XVuliH+RYwlH/DCTxU
	XsgWt7eXcSaG+b6vnXlb7llPkYOOvF4GY2MguRXfA6q7ywgAwwi5USCYYQePwcdUKrWScJhJ4pb
	DscfJyemsAzBG21oy1ksi3eMDK0EvT8w=
X-Gm-Gg: AYBFou0Of4lbJADqAph2W8LX79hdcPmxx8Ga41e00fxm5uFiXJFtbVxmKj/bbduwjnw
	LVq2wotjy79Ykn0ztE9i5B3PZxOPswn7LO4RrNcBDjnBoNVZ9ZgIKgfps5ndb2UuoNCY2Vsh35h
	7B3nijV+l2lyvAeticV20IveuQCbEEWKrda1fwy1eBo/TDZPlqb67CdRJdHkvMftGzbIPHPh3HX
	PUe6duesZ2KrUpf2UV9xGJyhrwE5Y3nbJjGp3PR88bZD3+R046DXL/eHntHdtVnVIeh5OjxjLZ8
	SZ0RafD1vx2/6W6SOaJOB/45dMTw7xZkd9LEDcswxzQ6Tsl6N8yXAiJF
X-Received: by 2002:a05:6512:10c4:b0:5b8:993e:6dcb with SMTP id
 2adb3069b0e04-5b8a029ddb7mr1710260e87.20.1789230251021; Sat, 12 Sep 2026
 09:24:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908094416.10534-1-linkinjeon@kernel.org>
In-Reply-To: <20260908094416.10534-1-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sun, 13 Sep 2026 01:23:58 +0900
X-Gm-Features: AcwNN1UklFVzPg5_oWuOF2tiUr_xRZ2SH2Vg4nSm1B-X7xV2Ku5xeHr73y4aVNA
Message-ID: <CANFS6bY5uf8Btfhj7zyMGzrL9RvYxojFkM+JU04kGBOuZz0TRQ@mail.gmail.com>
Subject: Re: [PATCH] ntfs: use dynamic MFT tail reservation
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 8=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:44, Na=
mjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The ntfs MFT allocator historically treated records below 64 as a
> permanent extension area and stopped searching for $MFT extent records
> after record 400. Windows and ntfs3 do not maintain that on-disk
> layout, so an NTFS volume can have free MFT records while ntfs returns
> -ENOSPC when $MFT:$DATA needs another mapping-pairs extent.
>
> Use record 24 as the first normal record and maintain an in-memory tail
> reserve of up to four initialized records. Normal allocations skip the
> reserve, while $MFT metadata extent allocations consume it. When a new
> tail is initialized, allocate at least two records and reserve the
> following records to avoid recursive allocation during MFT extension.
> Existing free runs can seed the reserve on volumes mounted without one.
>
> For $MFT/$DATA, constrain an extent record to a record whose byte offset
> is below the new extent lowest VCN byte offset. This preserves bootstrap
> reachability without an arbitrary record 400 limit. If no safe record is
> available, validate and use reserved records 15, 12, 13, and 14 as
> bootstrap candidates while keeping their MFT bitmap entries in use.
>
> This allows existing Windows volumes to extend $MFT using their actual
> free records and prevents normal file allocation from consuming
> the metadata reserve.
>
> Fixes: 115380f9a2f9 ("ntfs: update mft operations")
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/attrib.c |  11 +-
>  fs/ntfs/mft.c    | 420 +++++++++++++++++++++++++++++++++++++----------
>  fs/ntfs/mft.h    |   2 +-
>  fs/ntfs/namei.c  |   2 +-
>  fs/ntfs/volume.h |   6 +
>  5 files changed, 349 insertions(+), 92 deletions(-)
>
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index 848a0d338b89..81b9e0971b3e 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -2917,7 +2917,7 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 typ=
e,
>
>         attr_ni =3D NULL;
>         /* Allocate new extent. */
> -       err =3D ntfs_mft_record_alloc(ni->vol, 0, &attr_ni, ni, NULL);
> +       err =3D ntfs_mft_record_alloc(ni->vol, 0, &attr_ni, ni, NULL, -1)=
;
>         if (err) {
>                 ntfs_error(sb, "Failed to allocate extent record");
>                 goto err_out;
> @@ -3550,7 +3550,7 @@ int ntfs_attr_record_move_away(struct ntfs_attr_sea=
rch_ctx *ctx, int extra)
>          * new extent and move attribute to it.
>          */
>         ni =3D NULL;
> -       err =3D ntfs_mft_record_alloc(base_ni->vol, 0, &ni, base_ni, NULL=
);
> +       err =3D ntfs_mft_record_alloc(base_ni->vol, 0, &ni, base_ni, NULL=
, -1);
>         if (err) {
>                 ntfs_error(sb, "Couldn't allocate MFT record, err : %d", =
err);
>                 return err;
> @@ -3976,7 +3976,10 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_ino=
de *ni, s64 from_vcn)
>                 unsigned int de_cnt =3D 0;
>
>                 /* Allocate new mft record. */
> -               err =3D ntfs_mft_record_alloc(ni->vol, 0, &ext_ni, base_n=
i, NULL);
> +               err =3D ntfs_mft_record_alloc(ni->vol, 0, &ext_ni, base_n=
i, NULL,
> +                                           base_ni->mft_no =3D=3D FILE_M=
FT &&
> +                                           ni->type =3D=3D AT_DATA &&
> +                                           ni->name =3D=3D AT_UNNAMED ? =
stop_vcn : -1);
>                 if (err) {
>                         ntfs_error(sb, "Failed to allocate extent record"=
);
>                         goto put_err_out;
> @@ -4836,7 +4839,7 @@ static int ntfs_resident_attr_resize(struct ntfs_in=
ode *attr_ni, const s64 newsi
>         }
>
>         /* Allocate new mft record. */
> -       err =3D ntfs_mft_record_alloc(base_ni->vol, 0, &ext_ni, base_ni, =
NULL);
> +       err =3D ntfs_mft_record_alloc(base_ni->vol, 0, &ext_ni, base_ni, =
NULL, -1);
>         if (err) {
>                 ntfs_error(sb, "Couldn't allocate MFT record");
>                 goto put_err_out;
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 7e58c99f1728..61d4ee3a57fd 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -841,12 +841,126 @@ static bool ntfs_may_write_mft_record(struct ntfs_=
volume *vol, const u64 mft_no,
>
>  static const char *es =3D "  Leaving inconsistent metadata.  Unmount and=
 run chkdsk.";
>
> -#define RESERVED_MFT_RECORDS   64
> +#define FIRST_NORMAL_MFT_RECORD        24
> +#define MFT_RECORD_RESERVE     4
>
>  /*
> - * ntfs_mft_bitmap_find_and_alloc_free_rec_nolock - see name
> + * Records 12-15 are marked in use by Windows but normally have no name
> + * and no links. Keep them as the last bootstrap option when a volume
> + * mounted without an in-memory tail reserve needs its first $MFT metada=
ta
> + * extent.
> + */
> +static bool mft_reserved_is_free(struct ntfs_volume *vol,
> +               struct ntfs_inode *mft_ni, s64 mft_no)
> +{
> +       struct attr_record *a;
> +       struct mft_record *m;
> +       struct folio *folio;
> +       void *mapped;
> +       pgoff_t index =3D NTFS_MFT_NR_TO_PIDX(vol, mft_no);
> +       unsigned int ofs =3D NTFS_MFT_NR_TO_POFS(vol, mft_no);
> +       u32 attrs_offset, bytes_in_use;
> +       bool available =3D false, have_std =3D false;
> +       int i;
> +
> +       for (i =3D 0; i < mft_ni->nr_extents; i++) {
> +               if (mft_ni->ext.extent_ntfs_inos[i] &&
> +                   mft_ni->ext.extent_ntfs_inos[i]->mft_no =3D=3D mft_no=
)
> +                       return false;
> +       }
> +       m =3D kmalloc(vol->mft_record_size, GFP_NOFS);
> +       if (!m)
> +               return false;
> +
> +       folio =3D read_mapping_folio(vol->mft_ino->i_mapping, index, NULL=
);
> +       if (IS_ERR(folio))
> +               goto free_m;
> +
> +       folio_lock(folio);
> +       mapped =3D kmap_local_folio(folio, 0);
> +       memcpy(m, (u8 *)mapped + ofs, vol->mft_record_size);
> +       kunmap_local(mapped);
> +       folio_unlock(folio);
> +       folio_put(folio);
> +       if (post_read_mst_fixup((struct ntfs_record *)m, vol->mft_record_=
size))
> +               goto free_m;
> +
> +       if (!ntfs_is_mft_record(m->magic) ||
> +           !(m->flags & MFT_RECORD_IN_USE) || m->base_mft_record ||
> +           m->link_count)
> +               goto out;
> +
> +       attrs_offset =3D le16_to_cpu(m->attrs_offset);
> +       bytes_in_use =3D le32_to_cpu(m->bytes_in_use);
> +       if (attrs_offset > bytes_in_use || bytes_in_use > vol->mft_record=
_size ||
> +           bytes_in_use - attrs_offset < sizeof(a->type))
> +               goto out;
> +
> +       for (a =3D (struct attr_record *)((u8 *)m + attrs_offset);
> +            (u8 *)a + sizeof(a->type) <=3D (u8 *)m + bytes_in_use;) {
> +               u32 len;
> +
> +               if (a->type =3D=3D AT_END) {
> +                       if ((u8 *)a + sizeof(a->type) + sizeof(a->length)=
 >
> +                           (u8 *)m + bytes_in_use)
> +                               break;
> +                       /* Also accept a record emptied by an earlier boo=
tstrap. */
> +                       available =3D have_std ||
> +                                   (u8 *)a =3D=3D (u8 *)m + attrs_offset=
;
> +                       break;
> +               }
> +               if (a->type =3D=3D AT_FILE_NAME)
> +                       break;
> +               len =3D le32_to_cpu(a->length);
> +               if (len < offsetof(struct attr_record, data) ||
> +                   (u8 *)a + len > (u8 *)m + bytes_in_use)
> +                       break;
> +               if (a->type =3D=3D AT_STANDARD_INFORMATION) {
> +                       u32 value_len, value_ofs;
> +
> +                       if (have_std || a->non_resident ||
> +                           len < offsetof(struct attr_record,
> +                                          data.resident.reserved) + 1)
> +                               break;
> +                       value_len =3D le32_to_cpu(a->data.resident.value_=
length);
> +                       value_ofs =3D le16_to_cpu(a->data.resident.value_=
offset);
> +                       if (value_ofs > len || value_len > len - value_of=
s)
> +                               break;
> +                       have_std =3D true;
> +               }
> +               a =3D (struct attr_record *)((u8 *)a + len);
> +       }
> +out:
> +       kfree(m);
> +       return available;
> +free_m:
> +       kfree(m);
> +       return false;
> +}
> +
> +static s64 mft_reserve_end(const u8 *buf, s64 buf_start, s64 buf_end,
> +                          s64 start, s64 pass_end, s64 initialized_mft_r=
ecords)
> +{
> +       s64 end =3D start + 1;
> +       s64 limit =3D min_t(s64, start + MFT_RECORD_RESERVE, pass_end);
> +
> +       if (limit > initialized_mft_records)
> +               limit =3D initialized_mft_records;
> +       if (limit > buf_end)
> +               limit =3D buf_end;
> +       while (end < limit &&
> +              !(buf[(end - buf_start) >> 3] &
> +                (1 << ((end - buf_start) & 7))))
> +               end++;
> +       return end;
> +}
> +
> +/*
> + * mft_bitmap_alloc_free_rec - find and allocate a free MFT record
>   * @vol:       volume on which to search for a free mft record
>   * @base_ni:   open base inode if allocating an extent mft record or NUL=
L
> + * @max_mft_no:        first record which must not be allocated, or -1
> + * @new_reserve_end: if not NULL, end of a free run starting after the r=
esult
>   *
>   * Search for a free mft record in the mft bitmap attribute on the ntfs =
volume
>   * @vol.
> @@ -862,10 +976,12 @@ static const char *es =3D "  Leaving inconsistent m=
etadata.  Unmount and run chkds
>   *
>   * Locking: Caller must hold vol->mftbmp_lock for writing.
>   */
> -static s64 ntfs_mft_bitmap_find_and_alloc_free_rec_nolock(struct ntfs_vo=
lume *vol,
> -               struct ntfs_inode *base_ni)
> +static s64 mft_bitmap_alloc_free_rec(struct ntfs_volume *vol,
> +                                    struct ntfs_inode *base_ni,
> +                                    s64 max_mft_no, s64 *new_reserve_end=
)
>  {
>         s64 pass_end, ll, data_pos, pass_start, ofs, bit;
> +       s64 initialized_mft_records;
>         unsigned long flags;
>         struct address_space *mftbmp_mapping;
>         u8 *buf =3D NULL, *byte;
> @@ -882,30 +998,36 @@ static s64 ntfs_mft_bitmap_find_and_alloc_free_rec_=
nolock(struct ntfs_volume *vo
>         read_lock_irqsave(&NTFS_I(vol->mft_ino)->size_lock, flags);
>         pass_end =3D NTFS_I(vol->mft_ino)->allocated_size >>
>                         vol->mft_record_size_bits;
> +       initialized_mft_records =3D NTFS_I(vol->mft_ino)->initialized_siz=
e >>
> +                       vol->mft_record_size_bits;
>         read_unlock_irqrestore(&NTFS_I(vol->mft_ino)->size_lock, flags);
>         read_lock_irqsave(&NTFS_I(vol->mftbmp_ino)->size_lock, flags);
>         ll =3D NTFS_I(vol->mftbmp_ino)->initialized_size << 3;
>         read_unlock_irqrestore(&NTFS_I(vol->mftbmp_ino)->size_lock, flags=
);
>         if (pass_end > ll)
>                 pass_end =3D ll;
> -       pass =3D 1;
> -       if (!base_ni)
> -               data_pos =3D vol->mft_data_pos;
> -       else
> -               data_pos =3D base_ni->mft_no + 1;
> -       if (data_pos < RESERVED_MFT_RECORDS)
> -               data_pos =3D RESERVED_MFT_RECORDS;
> -       if (data_pos >=3D pass_end) {
> -               data_pos =3D RESERVED_MFT_RECORDS;
> +       if (max_mft_no >=3D 0 && pass_end > max_mft_no)
> +               pass_end =3D max_mft_no;
> +       if (base_ni && base_ni->mft_no =3D=3D FILE_MFT) {
> +               data_pos =3D FILE_first_user;
>                 pass =3D 2;
> -               /* This happens on a freshly formatted volume. */
>                 if (data_pos >=3D pass_end)
>                         return -ENOSPC;
> -       }
> -
> -       if (base_ni && base_ni->mft_no =3D=3D FILE_MFT) {
> -               data_pos =3D 0;
> -               pass =3D 2;
> +       } else {
> +               pass =3D 1;
> +               if (!base_ni)
> +                       data_pos =3D vol->mft_data_pos;
> +               else
> +                       data_pos =3D base_ni->mft_no + 1;
> +               if (data_pos < FIRST_NORMAL_MFT_RECORD)
> +                       data_pos =3D FIRST_NORMAL_MFT_RECORD;
> +               if (data_pos >=3D pass_end) {
> +                       data_pos =3D FIRST_NORMAL_MFT_RECORD;
> +                       pass =3D 2;
> +                       /* This happens on a freshly formatted volume. */
> +                       if (data_pos >=3D pass_end)
> +                               return -ENOSPC;
> +               }
>         }
>
>         pass_start =3D data_pos;
> @@ -940,38 +1062,28 @@ static s64 ntfs_mft_bitmap_find_and_alloc_free_rec=
_nolock(struct ntfs_volume *vo
>                                         size, data_pos, bit);
>                         for (; bit < size && data_pos + bit < pass_end;
>                                         bit &=3D ~7ull, bit +=3D 8) {
> -                               /*
> -                                * If we're extending $MFT and running ou=
t of the first
> -                                * mft record (base record) then give up =
searching since
> -                                * no guarantee that the found record wil=
l be accessible.
> -                                */
> -                               if (base_ni && base_ni->mft_no =3D=3D FIL=
E_MFT && bit > 400) {
> -                                       folio_unlock(folio);
> -                                       kunmap_local(buf);
> -                                       folio_put(folio);
> -                                       return -ENOSPC;
> -                               }
> -
>                                 byte =3D buf + (bit >> 3);
>                                 if (*byte =3D=3D 0xff)
>                                         continue;
> -                               b =3D ffz((unsigned long)*byte);
> -                               if (b < 8 && b >=3D (bit & 7)) {
> +                               b =3D bit & 7;
> +                               for (; b < 8; b++) {
> +                                       if (*byte & (1 << b))
> +                                               continue;
>                                         ll =3D data_pos + (bit & ~7ull) +=
 b;
> +                                       if (ll >=3D pass_end)
> +                                               break;
> +                                       /* Keep the dynamic tail reserve =
for $MFT metadata. */
> +                                       if ((!base_ni || base_ni->mft_no =
!=3D FILE_MFT) &&
> +                                           ll >=3D vol->mft_record_reser=
ve_pos &&
> +                                           ll < vol->mft_record_reserve_=
end)
> +                                               continue;
>                                         if (unlikely(ll >=3D (1ll << 32))=
) {
>                                                 folio_unlock(folio);
>                                                 kunmap_local(buf);
>                                                 folio_put(folio);
>                                                 return -ENOSPC;
>                                         }
> -                                       *byte |=3D 1 << b;
> -                                       folio_mark_dirty(folio);
> -                                       folio_unlock(folio);
> -                                       kunmap_local(buf);
> -                                       folio_put(folio);
> -                                       ntfs_debug("Done.  (Found and all=
ocated mft record 0x%llx.)",
> -                                                       ll);
> -                                       return ll;
> +                                       goto found;
>                                 }
>                         }
>                         ntfs_debug("After inner for loop: size 0x%x, data=
_pos 0x%llx, bit 0x%llx",
> @@ -994,7 +1106,8 @@ static s64 ntfs_mft_bitmap_find_and_alloc_free_rec_n=
olock(struct ntfs_volume *vo
>                          * part of the zone which we omitted earlier.
>                          */
>                         pass_end =3D pass_start;
> -                       data_pos =3D pass_start =3D RESERVED_MFT_RECORDS;
> +                       data_pos =3D FIRST_NORMAL_MFT_RECORD;
> +                       pass_start =3D FIRST_NORMAL_MFT_RECORD;
>                         ntfs_debug("pass %i, pass_start 0x%llx, pass_end =
0x%llx.",
>                                         pass, pass_start, pass_end);
>                         if (data_pos >=3D pass_end)
> @@ -1004,6 +1117,18 @@ static s64 ntfs_mft_bitmap_find_and_alloc_free_rec=
_nolock(struct ntfs_volume *vo
>         /* No free mft records in currently initialized mft bitmap. */
>         ntfs_debug("Done.  (No free mft records left in currently initial=
ized mft bitmap.)");
>         return -ENOSPC;
> +found:
> +       if (new_reserve_end)
> +               *new_reserve_end =3D mft_reserve_end(buf, data_pos,
> +                                                  data_pos + size, ll, p=
ass_end,
> +                                                  initialized_mft_record=
s);
> +       *byte |=3D 1 << b;
> +       folio_mark_dirty(folio);
> +       folio_unlock(folio);
> +       kunmap_local(buf);
> +       folio_put(folio);
> +       ntfs_debug("Done.  (Found and allocated mft record 0x%llx.)", ll)=
;
> +       return ll;
>  }
>
>  static int ntfs_mft_attr_extend(struct ntfs_inode *ni)
> @@ -1471,8 +1596,9 @@ static int ntfs_mft_bitmap_extend_initialized_noloc=
k(struct ntfs_volume *vol)
>   * @vol:       volume on which to extend the mft data attribute
>   *
>   * Extend the mft data attribute on the ntfs volume @vol by 16 mft recor=
ds
> - * worth of clusters or if not enough space for this by one mft record w=
orth
> - * of clusters.
> + * worth of clusters or if not enough space for this by two mft records =
worth
> + * of clusters. Keeping at least two new records breaks the recursion be=
tween
> + * extending $MFT and allocating a record for a new $MFT attribute exten=
t.
>   *
>   * Note:  Only changes allocated_size, i.e. does not touch initialized_s=
ize or
>   * data_size.
> @@ -1526,10 +1652,8 @@ static int ntfs_mft_data_extend_allocation_nolock(=
struct ntfs_volume *vol)
>         }
>         lcn =3D rl->lcn + rl->length;
>         ntfs_debug("Last lcn of mft data attribute is 0x%llx.", lcn);
> -       /* Minimum allocation is one mft record worth of clusters. */
> -       min_nr =3D NTFS_B_TO_CLU(vol, vol->mft_record_size);
> -       if (!min_nr)
> -               min_nr =3D 1;
> +       /* Keep room for the allocating record and at least one MFT reser=
ve. */
> +       min_nr =3D DIV_ROUND_UP_ULL((u64)vol->mft_record_size * 2, vol->c=
luster_size);
>         /* Want to allocate 16 mft records worth of clusters. */
>         nr =3D vol->mft_record_size << 4 >> vol->cluster_size_bits;
>         if (!nr)
> @@ -1928,6 +2052,7 @@ static int ntfs_mft_record_format(const struct ntfs=
_volume *vol, const s64 mft_n
>   * @ni:                [OUT] on success, set to the allocated ntfs inode
>   * @base_ni:   [IN]  open base inode if allocating an extent mft record =
or NULL
>   * @ni_mrec:   [OUT] on successful return this is the mapped mft record
> + * @mft_data_vcn: [IN] lowest VCN of a new $MFT/$DATA extent, or -1
>   *
>   * Allocate an mft record in $MFT/$DATA of an open ntfs volume @vol.
>   *
> @@ -1955,30 +2080,23 @@ static int ntfs_mft_record_format(const struct nt=
fs_volume *vol, const s64 mft_n
>   * optimize this we start scanning at the place specified by @base_ni or=
 if
>   * @base_ni is NULL we start where we last stopped and we perform wrap a=
round
>   * when we reach the end.  Note, we do not try to allocate mft records b=
elow
> - * number 64 because numbers 0 to 15 are the defined system files anyway=
 and 16
> - * to 64 are special in that they are used for storing extension mft rec=
ords
> - * for the $DATA attribute of $MFT.  This is required to avoid the possi=
bility
> - * of creating a runlist with a circular dependency which once written t=
o disk
> - * can never be read in again.  Windows will only use records 16 to 24 f=
or
> - * normal files if the volume is completely out of space.  We never use =
them
> - * which means that when the volume is really out of space we cannot cre=
ate any
> - * more files while Windows can still create up to 8 small files.  We ca=
n start
> - * doing this at some later time, it does not matter much for now.
> + * number 24 because numbers 0 to 15 are the defined system files and re=
cords
> + * 16 to 23 are kept for metadata compatibility. Records reserved dynami=
cally
> + * at the initialized MFT tail are skipped by normal allocation and cons=
umed by
> + * $MFT metadata extent allocation.
>   *
>   * When scanning the mft bitmap, we only search up to the last allocated=
 mft
> - * record.  If there are no free records left in the range 64 to number =
of
> + * record.  If there are no free records left in the range 24 to number =
of
>   * allocated mft records, then we extend the $MFT/$DATA attribute in ord=
er to
>   * create free mft records.  We extend the allocated size of $MFT/$DATA =
by 16
>   * records at a time or one cluster, if cluster size is above 16kiB.  If=
 there
> - * is not sufficient space to do this, we try to extend by a single mft =
record
> - * or one cluster, if cluster size is above the mft record size.
> + * is not sufficient space to do this, we try to extend by two mft recor=
ds or
> + * one cluster, if a cluster already contains at least two mft records.
>   *
> - * No matter how many mft records we allocate, we initialize only the fi=
rst
> - * allocated mft record, incrementing mft data size and initialized size
> - * accordingly, open an struct ntfs_inode for it and return it to the ca=
ller, unless
> - * there are less than 64 mft records, in which case we allocate and ini=
tialize
> - * mft records until we reach record 64 which we consider as the first f=
ree mft
> - * record for use by normal files.
> + * When extending the initialized MFT tail, we also initialize up to fou=
r
> + * additional records and reserve them in memory for future $MFT metadat=
a
> + * extents.  If there are less than 24 mft records, records are initiali=
zed
> + * until record 24, which is the first record used for normal files.
>   *
>   * If during any stage we overflow the initialized data in the mft bitma=
p, we
>   * extend the initialized size (and data size) by 8 bytes, allocating an=
other
> @@ -2014,9 +2132,12 @@ static int ntfs_mft_record_format(const struct ntf=
s_volume *vol, const s64 mft_n
>   */
>  int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
>                           struct ntfs_inode **ni, struct ntfs_inode *base=
_ni,
> -                         struct mft_record **ni_mrec)
> +                         struct mft_record **ni_mrec, const s64 mft_data=
_vcn)
>  {
>         s64 ll, bit, old_data_initialized, old_data_size;
> +       s64 max_mft_no =3D -1, reserve_start =3D -1, reserve_end =3D -1;
> +       s64 candidate_reserve_end =3D -1;
> +       s64 *reserve_endp;
>         unsigned long flags;
>         struct folio *folio;
>         struct ntfs_inode *mft_ni, *mftbmp_ni;
> @@ -2027,7 +2148,9 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, =
const int mode,
>         unsigned int ofs;
>         int err;
>         __le16 seq_no, usn;
> -       bool record_formatted =3D false;
> +       bool record_formatted =3D false, from_reserve =3D false, tail_all=
oc =3D false;
> +       bool reserve_created =3D false;
> +       bool forced_reserved_record =3D false;
>         unsigned int memalloc_flags;
>
>         if (base_ni && *ni)
> @@ -2036,6 +2159,21 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol,=
 const int mode,
>         /* @mode and @base_ni are mutually exclusive. */
>         if (mode && base_ni)
>                 return -EINVAL;
> +       if (mft_data_vcn >=3D 0 &&
> +           (!base_ni || base_ni->mft_no !=3D FILE_MFT))
> +               return -EINVAL;
> +       if (mft_data_vcn >=3D 0) {
> +               u64 vbo;
> +
> +               if ((u64)mft_data_vcn > (U64_MAX >> vol->cluster_size_bit=
s))
> +                       return -EOVERFLOW;
> +               vbo =3D (u64)mft_data_vcn << vol->cluster_size_bits;
> +               /*
> +                * The whole extent record must be reachable without this
> +                * extent, including when an MFT record spans multiple cl=
usters.
> +                */
> +               max_mft_no =3D vbo >> vol->mft_record_size_bits;
> +       }
>
>         if (base_ni)
>                 ntfs_debug("Entering (allocating an extent mft record for=
 base mft record 0x%llx).",
> @@ -2050,10 +2188,39 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol=
, const int mode,
>                 mutex_lock(&mft_ni->mrec_lock);
>         mftbmp_ni =3D NTFS_I(vol->mftbmp_ino);
>  search_free_rec:
> +       from_reserve =3D false;
> +       reserve_created =3D false;
> +       candidate_reserve_end =3D -1;
>         if (!base_ni || base_ni->mft_no !=3D FILE_MFT)
>                 down_write(&vol->mftbmp_lock);
> -       bit =3D ntfs_mft_bitmap_find_and_alloc_free_rec_nolock(vol, base_=
ni);
> +       if (base_ni && base_ni->mft_no =3D=3D FILE_MFT &&
> +           vol->mft_record_reserve_pos < vol->mft_record_reserve_end &&
> +           (max_mft_no < 0 || vol->mft_record_reserve_pos < max_mft_no))=
 {
> +               bit =3D vol->mft_record_reserve_pos;
> +               err =3D ntfs_bitmap_set_bit(vol->mftbmp_ino, bit);
> +               if (unlikely(err)) {
> +                       ntfs_error(vol->sb,
> +                                  "Failed to allocate reserved MFT recor=
d 0x%llx.",
> +                                  bit);
> +                       goto err_out;
> +               }
> +               vol->mft_record_reserve_pos++;
> +               from_reserve =3D true;
> +               ntfs_debug("Allocated MFT metadata record 0x%llx from tai=
l reserve.",
> +                          bit);
> +               goto have_alloc_rec;
> +       }
> +       reserve_endp =3D vol->mft_record_reserve_pos >=3D
> +                       vol->mft_record_reserve_end ? &candidate_reserve_=
end : NULL;
> +       bit =3D mft_bitmap_alloc_free_rec(vol, base_ni, max_mft_no, reser=
ve_endp);
>         if (bit >=3D 0) {
> +               if (candidate_reserve_end > bit + 1) {
> +                       vol->mft_record_reserve_pos =3D bit + 1;
> +                       vol->mft_record_reserve_end =3D candidate_reserve=
_end;
> +                       reserve_created =3D true;
> +                       ntfs_debug("Reserved free MFT records [0x%llx, 0x=
%llx) for metadata.",
> +                                  bit + 1, candidate_reserve_end);
> +               }
>                 ntfs_debug("Found and allocated free record (#1), bit 0x%=
llx.",
>                                 (long long)bit);
>                 goto have_alloc_rec;
> @@ -2068,6 +2235,24 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol,=
 const int mode,
>         }
>
>         if (base_ni && base_ni->mft_no =3D=3D FILE_MFT) {
> +               static const u8 bootstrap_records[] =3D {
> +                       FILE_reserved15, FILE_reserved12, FILE_reserved13=
,
> +                       FILE_reserved14,
> +               };
> +               int i;
> +
> +               for (i =3D 0; i < ARRAY_SIZE(bootstrap_records); i++) {
> +                       if (max_mft_no >=3D 0 && bootstrap_records[i] >=
=3D max_mft_no)
> +                               continue;
> +                       if (!mft_reserved_is_free(vol, mft_ni,
> +                                                 bootstrap_records[i]))
> +                               continue;
> +                       bit =3D bootstrap_records[i];
> +                       forced_reserved_record =3D true;
> +                       ntfs_debug("Using reserved MFT record %lld to boo=
tstrap metadata extension.",
> +                                  bit);
> +                       goto have_alloc_rec;
> +               }
>                 memalloc_nofs_restore(memalloc_flags);
>                 return bit;
>         }
> @@ -2087,10 +2272,10 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol=
, const int mode,
>         old_data_initialized =3D mftbmp_ni->initialized_size;
>         read_unlock_irqrestore(&mftbmp_ni->size_lock, flags);
>         if (old_data_initialized << 3 > ll &&
> -           old_data_initialized > RESERVED_MFT_RECORDS / 8) {
> +           old_data_initialized << 3 > FIRST_NORMAL_MFT_RECORD) {
>                 bit =3D ll;
> -               if (bit < RESERVED_MFT_RECORDS)
> -                       bit =3D RESERVED_MFT_RECORDS;
> +               if (bit < FIRST_NORMAL_MFT_RECORD)
> +                       bit =3D FIRST_NORMAL_MFT_RECORD;
>                 if (unlikely(bit >=3D (1ll << 32)))
>                         goto max_err_out;
>                 ntfs_debug("Found free record (#2), bit 0x%llx.",
> @@ -2176,6 +2361,11 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol,=
 const int mode,
>         read_lock_irqsave(&mft_ni->size_lock, flags);
>         old_data_initialized =3D mft_ni->initialized_size;
>         read_unlock_irqrestore(&mft_ni->size_lock, flags);
> +       tail_alloc =3D (!base_ni || base_ni->mft_no !=3D FILE_MFT) &&
> +                       bit >=3D (old_data_initialized >> vol->mft_record=
_size_bits) &&
> +                       vol->mft_record_reserve_pos >=3D vol->mft_record_=
reserve_end;
> +       if (tail_alloc)
> +               ll =3D (bit + 2) << vol->mft_record_size_bits;
>         if (ll <=3D old_data_initialized) {
>                 ntfs_debug("Allocated mft record already initialized.");
>                 goto mft_rec_already_initialized;
> @@ -2208,6 +2398,29 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol,=
 const int mode,
>                                         mft_ni->initialized_size);
>                 }
>                 read_unlock_irqrestore(&mft_ni->size_lock, flags);
> +               if (tail_alloc) {
> +                       s64 bitmap_records;
> +
> +                       read_lock_irqsave(&mft_ni->size_lock, flags);
> +                       reserve_end =3D mft_ni->allocated_size >>
> +                                       vol->mft_record_size_bits;
> +                       read_unlock_irqrestore(&mft_ni->size_lock, flags)=
;
> +                       read_lock_irqsave(&mftbmp_ni->size_lock, flags);
> +                       bitmap_records =3D mftbmp_ni->initialized_size <<=
 3;
> +                       read_unlock_irqrestore(&mftbmp_ni->size_lock, fla=
gs);
> +                       if (reserve_end > bitmap_records)
> +                               reserve_end =3D bitmap_records;
> +                       if (reserve_end > bit + 1 + MFT_RECORD_RESERVE)
> +                               reserve_end =3D bit + 1 + MFT_RECORD_RESE=
RVE;
> +                       reserve_start =3D bit + 1;
> +                       if (reserve_end > reserve_start) {
> +                               ll =3D reserve_end << vol->mft_record_siz=
e_bits;
> +                       } else {
> +                               reserve_start =3D -1;
> +                               reserve_end =3D -1;
> +                               ll =3D (bit + 1) << vol->mft_record_size_=
bits;
> +                       }
> +               }
>         } else if (ll > mft_ni->allocated_size) {
>                 err =3D -ENOSPC;
>                 goto undo_mftbmp_alloc_nolock;
> @@ -2276,6 +2489,12 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol,=
 const int mode,
>         mark_mft_record_dirty(ctx->ntfs_ino);
>         ntfs_attr_put_search_ctx(ctx);
>         unmap_mft_record(mft_ni);
> +       if (reserve_start >=3D 0 && reserve_end > reserve_start) {
> +               vol->mft_record_reserve_pos =3D reserve_start;
> +               vol->mft_record_reserve_end =3D reserve_end;
> +               ntfs_debug("Reserved MFT records [0x%llx, 0x%llx) for met=
adata.",
> +                          reserve_start, reserve_end);
> +       }
>         read_lock_irqsave(&mft_ni->size_lock, flags);
>         ntfs_debug("Status of mft data after mft record initialization: a=
llocated_size 0x%llx, data_size 0x%llx, initialized_size 0x%llx.",
>                         mft_ni->allocated_size, i_size_read(vol->mft_ino)=
,
> @@ -2315,8 +2534,8 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, =
const int mode,
>         /* If we just formatted the mft record no need to do it again. */
>         if (!record_formatted) {
>                 /* Sanity check that the mft record is really not in use.=
 */
> -               if (ntfs_is_file_record(m->magic) &&
> -                               (m->flags & MFT_RECORD_IN_USE)) {
> +               if (!forced_reserved_record && ntfs_is_file_record(m->mag=
ic) &&
> +                   (m->flags & MFT_RECORD_IN_USE)) {
>                         ntfs_warning(vol->sb,
>                                 "Mft record 0x%llx was marked free in mft=
 bitmap but is marked used itself. Unmount and run chkdsk.",
>                                 bit);
> @@ -2389,9 +2608,13 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol,=
 const int mode,
>                         ntfs_error(vol->sb, "Failed to map allocated exte=
nt mft record 0x%llx.",
>                                         bit);
>                         err =3D PTR_ERR(m_tmp);
> -                       /* Set the mft record itself not in use. */
> -                       m->flags &=3D cpu_to_le16(
> -                                       ~le16_to_cpu(MFT_RECORD_IN_USE));
> +                       if (forced_reserved_record) {
> +                               m->base_mft_record =3D 0;
> +                               m->flags |=3D MFT_RECORD_IN_USE;
> +                       } else {
> +                               /* Set the mft record itself not in use. =
*/
> +                               m->flags &=3D cpu_to_le16(~le16_to_cpu(MF=
T_RECORD_IN_USE));
> +                       }
>                         /* Make sure the mft record is written out to dis=
k. */
>                         ntfs_mft_mark_dirty(folio);
>                         folio_unlock(folio);
> @@ -2463,7 +2686,8 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, =
const int mode,
>         (*ni)->mft_no =3D bit;
>         if (ni_mrec)
>                 *ni_mrec =3D (*ni)->mrec;
> -       ntfs_dec_free_mft_records(vol, 1);
> +       if (!forced_reserved_record)
> +               ntfs_dec_free_mft_records(vol, 1);
>         return 0;
>  undo_data_init:
>         write_lock_irqsave(&mft_ni->size_lock, flags);
> @@ -2475,10 +2699,13 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol=
, const int mode,
>         if (!base_ni || base_ni->mft_no !=3D FILE_MFT)
>                 down_write(&vol->mftbmp_lock);
>  undo_mftbmp_alloc_nolock:
> -       if (ntfs_bitmap_clear_bit(vol->mftbmp_ino, bit)) {
> +       if (!forced_reserved_record && ntfs_bitmap_clear_bit(vol->mftbmp_=
ino, bit)) {
>                 ntfs_error(vol->sb, "Failed to clear bit in mft bitmap.%s=
", es);
>                 NVolSetErrors(vol);
>         }
> +       if ((from_reserve || reserve_created) &&
> +           vol->mft_record_reserve_pos =3D=3D bit + 1)
> +               vol->mft_record_reserve_pos =3D bit;
>         if (!base_ni || base_ni->mft_no !=3D FILE_MFT)
>                 up_write(&vol->mftbmp_lock);
>  err_out:
> @@ -2514,9 +2741,11 @@ int ntfs_mft_record_free(struct ntfs_volume *vol, =
struct ntfs_inode *ni)
>         int err;
>         u16 seq_no;
>         __le16 old_seq_no;
> +       __le64 old_base_mft_record;
>         struct mft_record *ni_mrec;
>         unsigned int memalloc_flags;
>         struct ntfs_inode *base_ni;
> +       bool keep_reserved;
>
>         if (!vol || !ni)
>                 return -EINVAL;
> @@ -2529,9 +2758,23 @@ int ntfs_mft_record_free(struct ntfs_volume *vol, =
struct ntfs_inode *ni)
>
>         /* Cache the mft reference for later. */
>         mft_no =3D ni->mft_no;
> -
> -       /* Mark the mft record as not in use. */
> -       ni_mrec->flags &=3D ~MFT_RECORD_IN_USE;
> +       if (likely(ni->nr_extents >=3D 0))
> +               base_ni =3D ni;
> +       else
> +               base_ni =3D ni->ext.base_ntfs_ino;
> +       keep_reserved =3D mft_no >=3D FILE_reserved12 &&
> +                       mft_no <=3D FILE_reserved15 &&
> +                       base_ni->mft_no =3D=3D FILE_MFT;
> +
> +       old_base_mft_record =3D ni_mrec->base_mft_record;
> +       if (keep_reserved) {
> +               /* Restore the special, unnamed form used by reserved rec=
ords. */
> +               ni_mrec->base_mft_record =3D 0;
> +               ni_mrec->flags |=3D MFT_RECORD_IN_USE;
> +       } else {
> +               /* Mark the mft record as not in use. */
> +               ni_mrec->flags &=3D ~MFT_RECORD_IN_USE;
> +       }
>
>         /* Increment the sequence number, skipping zero, if it is not zer=
o. */
>         old_seq_no =3D ni_mrec->sequence_number;
> @@ -2560,16 +2803,20 @@ int ntfs_mft_record_free(struct ntfs_volume *vol,=
 struct ntfs_inode *ni)
>         if (err)
>                 goto sync_rollback;
>
> -       if (likely(ni->nr_extents >=3D 0))
> -               base_ni =3D ni;
> -       else
> -               base_ni =3D ni->ext.base_ntfs_ino;
> +       if (keep_reserved) {
> +               unmap_mft_record(ni);
> +               return 0;
> +       }
>
>         /* Clear the bit in the $MFT/$BITMAP corresponding to this record=
. */
>         memalloc_flags =3D memalloc_nofs_save();
>         if (base_ni->mft_no !=3D FILE_MFT)
>                 down_write(&vol->mftbmp_lock);
>         err =3D ntfs_bitmap_clear_bit(vol->mftbmp_ino, mft_no);
> +       if (!err && base_ni->mft_no =3D=3D FILE_MFT &&
> +           mft_no + 1 =3D=3D vol->mft_record_reserve_pos &&
> +           mft_no < vol->mft_record_reserve_end)
> +               vol->mft_record_reserve_pos =3D mft_no;
>         if (base_ni->mft_no !=3D FILE_MFT)
>                 up_write(&vol->mftbmp_lock);
>         memalloc_nofs_restore(memalloc_flags);
> @@ -2595,6 +2842,7 @@ int ntfs_mft_record_free(struct ntfs_volume *vol, s=
truct ntfs_inode *ni)
>                 "Eeek! Rollback failed in %s. Leaving inconsistent metada=
ta!\n", __func__);
>         ni_mrec->flags |=3D MFT_RECORD_IN_USE;
>         ni_mrec->sequence_number =3D old_seq_no;
> +       ni_mrec->base_mft_record =3D old_base_mft_record;
>         NInoSetDirty(ni);
>         write_mft_record(ni, ni_mrec, 0);
>         unmap_mft_record(ni);
> diff --git a/fs/ntfs/mft.h b/fs/ntfs/mft.h
> index 75a51a98d0f6..ed5c1d595c0d 100644
> --- a/fs/ntfs/mft.h
> +++ b/fs/ntfs/mft.h
> @@ -78,7 +78,7 @@ static inline int write_mft_record(struct ntfs_inode *n=
i, struct mft_record *m,
>
>  int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
>                 struct ntfs_inode **ni, struct ntfs_inode *base_ni,
> -               struct mft_record **ni_mrec);
> +               struct mft_record **ni_mrec, const s64 mft_data_vcn);
>  int ntfs_mft_record_free(struct ntfs_volume *vol, struct ntfs_inode *ni)=
;
>  int ntfs_mft_records_write(const struct ntfs_volume *vol, const u64 mref=
,
>                 const s64 count, struct mft_record *b);
> diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
> index 7091b2496fac..fdf52fac4329 100644
> --- a/fs/ntfs/namei.c
> +++ b/fs/ntfs/namei.c
> @@ -480,7 +480,7 @@ static struct ntfs_inode *__ntfs_create(struct mnt_id=
map *idmap, struct inode *d
>         mark_inode_dirty(dir);
>
>         err =3D ntfs_mft_record_alloc(dir_ni->vol, mode, &ni, NULL,
> -                                   &ni_mrec);
> +                       &ni_mrec, -1);
>         if (err) {
>                 iput(vi);
>                 return ERR_PTR(err);
> diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
> index 65fd3908af26..2b60d14fc7ef 100644
> --- a/fs/ntfs/volume.h
> +++ b/fs/ntfs/volume.h
> @@ -55,6 +55,10 @@
>   * @attrdef_size: Size of the attribute definition table in bytes.
>   * @attrdef: Table of attribute definitions. Obtained from FILE_AttrDef.
>   * @mft_data_pos: Mft record number at which to allocate the next mft re=
cord.
> + * @mft_record_reserve_pos: First record in the in-memory MFT metadata r=
eserve
> + *                         (protected by mftbmp_lock).
> + * @mft_record_reserve_end: First record beyond the MFT metadata reserve
> + *                         (protected by mftbmp_lock).
>   * @mft_zone_start: First cluster of the mft zone.
>   * @mft_zone_end: First cluster beyond the mft zone.
>   * @mft_zone_pos: Current position in the mft zone.
> @@ -119,6 +123,8 @@ struct ntfs_volume {
>         s32 attrdef_size;
>         struct attr_def *attrdef;
>         s64 mft_data_pos;
> +       s64 mft_record_reserve_pos;
> +       s64 mft_record_reserve_end;
>         s64 mft_zone_start;
>         s64 mft_zone_end;
>         s64 mft_zone_pos;
> --
> 2.25.1



--=20
Thanks,
Hyunchul
