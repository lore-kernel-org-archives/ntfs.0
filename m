Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD948331203
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230419; cv=pass; b=cjtiD4Cij7RvrW44QY1mloNT8zDN0UBchnGjx/U5SOiqB2mv2qB5u7gHlSMgJmN37IajM2QWXnDTSYFaX8GT12r1QJE39yd117W7MG6x8L4V62JKkQsB/tIdlR187SDbfXI8LLetizVzy2JOhtbc8M9bbIE3IynK2yhbxqkUsPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230419; c=relaxed/simple;
	bh=7W/aSBKx2U8qdYaWh/4nG+VG0Eam1u3M4H4ZMxYYpXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZ8OUAETTx25BC5hWdfKk/LIJk61/GSIzQdcVhgYCj5vWOOemlQRTdpe22RRFXSgFrnROuZMWmqmF1TQc2D0knQtlOns3HTx62j/fKBSJCQPpQym+/CeOCkD951dxOnflFahKoEsJF9tS+GQK/PY2l1XtLXn1TIjokbCHZrQlJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QF0e8F2A; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QF0e8F2A"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e023so362468e87.0
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789230415; cv=none;
        d=google.com; s=arc-20260327;
        b=fhWTNsurFowhpr+TIe8Tzodjw65RDG2XUxEXPX6Ut6jzqiDVoc3Lpb4eDKGDJx/Ek3
         rxn0P75CdL81/dbQWl0alLexezbjg6KfDumGYqrgxX8zsT+LnmgKkx/DvQrEsmIViDAx
         CVnU8Ygq+N0eYPCdDlmIn29GphKBGbGhuH8qvysEjy9coFcAFnLPlDMnYHv0Uyv4cuzp
         JS9AbwuqiJ+VqA6ybV4QY2kSlHUbKAcqQnr/ya/lbtw5Oh6lXnIwL+hPKnnEo3SLL5PK
         WZyliXuSxA7TwyIQlM0MlEEc0TkvMC130Xje1Np2cMlI/Tyf/JYLUXUZeMWZV9Xr77Fy
         u1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t4ubc0YvaVlXBILWLkRpPmOj+D3Jn9wa2+3GmNy/oOY=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=dfwVq1Wrx+CxIAZH2+2thJ69J7GNUUufd0vkmQQHNrF9Udy7AD4TKCQJhRTvaMUcm7
         EiD/0gXIySybqYMs9NUy69IIX2bOyh96W3j7xg7iqWEV0XRX+ZB7OI+vUT3mC4qlxBmh
         1twqni0J6TkV7Z18ZJO9bPOgVkErbjJIxjs93mjuK2P+16ZD/qy8p6zIsidJ/7irrjJm
         3/GqniThfhk7AOa+HB7R8iR5QmLkMTzDBQaeucUO+vCrw+Aj6iDUbm9XR9U0QFJDSyNb
         Bm9l5B4Qyhp/1CFHFlUDb3/l/9MDgzN6LcL9IAZ0ZDg2fkx+kZLO3CG/bCEBI2sJc6kV
         sLqQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230415; x=1789835215; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t4ubc0YvaVlXBILWLkRpPmOj+D3Jn9wa2+3GmNy/oOY=;
        b=QF0e8F2A5wvpszRnux/Zr70P71WvcO4XY5aWFtu+9K24Ghjdk4chlDcRpYKhOl8RU8
         uQAeGoFVU9JKa+YFSwcjbuAYAO3oTNyWc4chWR+3hMftf4iKpUtX5it0VWJVty6Sh30m
         CvpSLfG4sm6353McP4Pkbh00PbZ2T5T40TI71v2gHDMuyRp4G09/SBvdOmqWGTpWWY3h
         mefvm59sIyqBtO1PHZTyTEHHB0fni6PA3OreLxMADxR20P9B9VOq2GU5aEmW81QWDYtY
         fvvOpo976tFItRLnTebJ1jfUSzRi9FPTRX+i2d6U6kdzrtIybd/H3e56xuCTvtxO5u7Q
         2hKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230415; x=1789835215;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t4ubc0YvaVlXBILWLkRpPmOj+D3Jn9wa2+3GmNy/oOY=;
        b=lEp8zwgv/QOrFg7AX/a5ztwU9tK4d+W7wGe5AyQvenp/NvDzaoxhzWuJqbKvD6HBMZ
         URhOoIdVmeVBwELKJzJ0uX63U+Vi0LbxDZUalG5WwNwNUzVhEkNrUyBZzSeN2nJ0xHxh
         goTyc9nZzsMlHw99/S1DL1yDzibETBPsRC5NMy2I3AnKKCEORMVgh3pBK0qvVse3H7r1
         fWXQNgfqdy1ksVwE+NCKt/S0b+fega0gVbhWvH3KHlmIh7MslpDXKHFeWADmXmZEXvPP
         jjv3nNF9rE8RaGdhO5qoogKLv7qjyGyRYBouAbZeUhk8wJtMNs/tx0AoiDk0HbrXKXOp
         SI7A==
X-Gm-Message-State: AFuF++ndEqlszjLnVqfEteCu6cMlQK6I5pMEG5Y3+e68iHASPBZ5oNfI
	cXx2pOJDakdWL4hIdFbSzHwO+z7A0QBh+qRxnx4UfKedyGVCikfcPQ0qH/jE/WwM9rrWfFg9iTm
	yYSvzT1hBrYvF/8b6GEnd6ZqRgq46iv83FV5F
X-Gm-Gg: AYBFou0e2o8RMIPUMQ8xcwrAbdnI8nJ0Hi4vqTacYxMcapNfnsF35IMtg20VCTYNzlR
	zRtDdKYlpkQ/97ubL4crsrb8L2Nsy7nKX2NfedSSraNoVpB1x8vfYRU2k6/XiFdDm3VEPMuOeZD
	1zw1NiSl/t6K6WFfIWgWzT9+Cyd4RuQueGFG7C1eIVZTUHWtbJw8s1YLh/M+7724a3I4ZkMW7y8
	nzlZGsk+1sVe22ESMpeV75nFPQDNfT9cZ2btYxajxJZrHafLZ+SY8oUjKaeSGoNvEwzasFkxJ4U
	9JPNocPLP8qNbKHYnlj6xyLYoZzwywAAQGxk4g4z/TuRmXprNYNM/A0d
X-Received: by 2002:a05:6512:1052:b0:5b4:ac27:8f76 with SMTP id
 2adb3069b0e04-5b8a02fa196mr1867922e87.7.1789230415397; Sat, 12 Sep 2026
 09:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908094416.10534-1-linkinjeon@kernel.org> <20260908094416.10534-6-linkinjeon@kernel.org>
In-Reply-To: <20260908094416.10534-6-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sun, 13 Sep 2026 01:26:43 +0900
X-Gm-Features: AcwNN1V3A5yT7kF1UUdA7Rh1NXiYZOwR-v50f_EEzRhX2BXgXxmgxZ-HsiAtlME
Message-ID: <CANFS6bYJaY4gn5i8HED2ae9pH+gATyZbvahsuFmq+3EVJFGivg@mail.gmail.com>
Subject: Re: [PATCH] ntfs: ignore interrupted inode reads as corruption
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 8=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:44, Na=
mjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Do not mark the volume in error or report an inode as corrupt when
> reading it was interrupted by a signal. -EINTR and -ERESTARTSYS indicate
> a transient read failure rather than on-disk NTFS corruption.
>
> Fixes: 115380f9a2f9 ("ntfs: update mft operations")
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/inode.c | 21 +++++++++++++--------
>  fs/ntfs/mft.c   |  3 ++-
>  2 files changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index bb97cc6c6ba7..b735cd829120 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -1241,7 +1241,8 @@ static int ntfs_read_locked_inode(struct inode *vi)
>         if (m)
>                 unmap_mft_record(ni);
>  err_out:
> -       if (err !=3D -EOPNOTSUPP && err !=3D -ENOMEM && vol_err =3D=3D tr=
ue) {
> +       if (err !=3D -EOPNOTSUPP && err !=3D -ENOMEM &&
> +           err !=3D -EINTR && err !=3D -ERESTARTSYS && vol_err =3D=3D tr=
ue) {
>                 ntfs_error(vol->sb,
>                         "Failed with error code %i.  Marking corrupt inod=
e 0x%llx as bad.  Run chkdsk.",
>                         err, ni->mft_no);
> @@ -1467,12 +1468,13 @@ static int ntfs_read_locked_attr_inode(struct ino=
de *base_vi, struct inode *vi)
>                 ntfs_attr_put_search_ctx(ctx);
>         unmap_mft_record(base_ni);
>  err_out:
> -       if (err !=3D -ENOENT)
> +       if (err !=3D -ENOENT && err !=3D -EINTR && err !=3D -ERESTARTSYS)
>                 ntfs_error(vol->sb,
>                         "Failed with error code %i while reading attribut=
e inode (mft_no 0x%llx, type 0x%x, name_len %i).  Marking corrupt inode and=
 base inode 0x%llx as bad.  Run chkdsk.",
>                         err, ni->mft_no, ni->type, ni->name_len,
>                         base_ni->mft_no);
> -       if (err !=3D -ENOENT && err !=3D -ENOMEM)
> +       if (err !=3D -ENOENT && err !=3D -ENOMEM &&
> +           err !=3D -EINTR && err !=3D -ERESTARTSYS)
>                 NVolSetErrors(vol);
>         return err;
>  }
> @@ -1676,8 +1678,9 @@ static int ntfs_read_locked_index_inode(struct inod=
e *base_vi, struct inode *vi)
>         /* Get the index bitmap attribute inode. */
>         bvi =3D ntfs_attr_iget(base_vi, AT_BITMAP, ni->name, ni->name_len=
);
>         if (IS_ERR(bvi)) {
> -               ntfs_error(vi->i_sb, "Failed to get bitmap attribute.");
>                 err =3D PTR_ERR(bvi);
> +               if (err !=3D -EINTR && err !=3D -ERESTARTSYS)
> +                       ntfs_error(vi->i_sb, "Failed to get bitmap attrib=
ute.");
>                 goto unm_err_out;
>         }
>         bni =3D NTFS_I(bvi);
> @@ -1721,10 +1724,12 @@ static int ntfs_read_locked_index_inode(struct in=
ode *base_vi, struct inode *vi)
>         if (m)
>                 unmap_mft_record(base_ni);
>  err_out:
> -       ntfs_error(vi->i_sb,
> -               "Failed with error code %i while reading index inode (mft=
_no 0x%llx, name_len %i.",
> -               err, ni->mft_no, ni->name_len);
> -       if (err !=3D -EOPNOTSUPP && err !=3D -ENOMEM)
> +       if (err !=3D -EINTR && err !=3D -ERESTARTSYS)
> +               ntfs_error(vi->i_sb,
> +                       "Failed with error code %i while reading index in=
ode (mft_no 0x%llx, name_len %i.",
> +                       err, ni->mft_no, ni->name_len);
> +       if (err !=3D -EOPNOTSUPP && err !=3D -ENOMEM &&
> +           err !=3D -EINTR && err !=3D -ERESTARTSYS)
>                 NVolSetErrors(vol);
>         return err;
>  }
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 5b9723abb10f..6d5e56378afd 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -213,7 +213,8 @@ struct mft_record *map_mft_record(struct ntfs_inode *=
ni)
>                 return m;
>
>         atomic_dec(&ni->count);
> -       ntfs_error(ni->vol->sb, "Failed with error code %lu.", -PTR_ERR(m=
));
> +       if (PTR_ERR(m) !=3D -EINTR && PTR_ERR(m) !=3D -ERESTARTSYS)
> +               ntfs_error(ni->vol->sb, "Failed with error code %lu.", -P=
TR_ERR(m));
>         return m;
>  }
>
> --
> 2.25.1



--=20
Thanks,
Hyunchul
