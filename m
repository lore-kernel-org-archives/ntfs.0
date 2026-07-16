Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCE43C585A
	for <ntfs@lists.linux.dev>; Thu, 16 Jul 2026 22:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240859; cv=pass; b=e0dvllgE4CByfEpY5qU46fxg1pAvxOJ5ENVyD0sYAqWZHKjMC1GhA4JL/nIFWQOhVVxmK1OCmyvASC17WF+TLqwBM6AZKQHPjrkfzscVx4cay73TSZJoP5B4WIPtFRV5vOt6lYXUyrkMZDA/+L3ljjj+VvEdW7Xq+WmBlweOrvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240859; c=relaxed/simple;
	bh=6izFKLAXQ25CZ+35TIl8yC0TEPevxXfyEBfY9m3soAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7GUWWJFFUTQi/hCAtWfuJUP0o1ZqJIorYIEs4A+twJtgHjGCfD5XgQsUj/FsCSaI1hCGR5lZ/5NgjtBMkcKJXOIGZCudB7lA4SggEccuhd+QLKDQELmvXZZ5tTVtEJ/0QFdLNLTNKj3rIi+1IfEdsrmxHMhUj9zPQieLmxzzJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baLJsUe7; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baLJsUe7"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b15dcaca31so2981809e87.0
        for <ntfs@lists.linux.dev>; Thu, 16 Jul 2026 15:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784240855; cv=none;
        d=google.com; s=arc-20260327;
        b=or1pBrkWT2zd1bwg/Ay5XPtL6KlpiOGePx2/xrG19EmY2VgBjXmg2jb+/jX7forjIY
         1iFWCdBC6aTPvVEOYtRH2NpW5QZEAYxCgM93nIjz7huxx8lSVcpek1y3ZTlIFDkT2l+K
         tCBaTQBymrm8b/lTWAIUdA05U7fmy94/LnG8Msbcw1//FeZjJMYd+iEaRwPjbFp6MmDk
         9T5IeXoi7tqsUn9cSGh9/vLLBi9a9sI7+aEFa031xUjHZhevLqTzpi4pg1tfR7AUFrhl
         PrqJqEwXdhaJyaO08K8mPSebagymdaN7F4nL0AsdIksK0rshIPLyQw/jwkr7zLHt2Qhq
         MBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3GNiDb8IqOV9RZOA/kubqQDgw9FaKyVldx5lkoAlLxg=;
        fh=mgLCjrAE0uxzwsGYKz6SaNYZVNHieaxuEHuKwftvBIM=;
        b=AAI8deoOIYIWyqsFb0lRD7Mcq4senAdm4UO+/NaODeyrx1ztqROaHLOZwwx4e//Fb0
         Ln4tvuOUypwsk4uGJZncXsyT6BUecuUcSK+8f4v7Q56MId2ln1V+53upalrF+v9Bahya
         A72myB2xRe5hwEYx8C/7vbYm2Jo7fWXfYnPo5e53B9dlZ3qGmvI9LbiryEVN7YsbFxOW
         Jc1/n0/s9BBcd2a+6ijlo9XFO84EXkQGYeP/mB9RfgQzU9Y2lT4XbsW39/hov9SkiT+Y
         0ZsQ8YDeDmKCGuKEPefHXhTuyuAtDXR8zTfPnrL1fk2vk/69LeczLg4+WNqE50Bd6w1L
         sG6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784240855; x=1784845655; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3GNiDb8IqOV9RZOA/kubqQDgw9FaKyVldx5lkoAlLxg=;
        b=baLJsUe7oET1ikgmXiqsDrpGMTue1l3stXtb7VYEvzSSsmOJF6prIWRRJr07SLyEgM
         MGudoY/ZRiDcZ0aL2fKvYoX7X++yFayNcF9ifkkExDe6AjlK1Iy53pAxe5dvmgBNJFYR
         SUhmRvfPh/MDEMkMUx5o1sclfjdUyM/XJrFUo272lUDmEvYUBOYiI9XbuKNNBfbbGdNN
         oYqPYjaRTN0SCAzG/KDAxUhGizj+nZhhAmr2ldfAy3aVtU85I2gAn5vroGL0M4L6rqqo
         UNMe4wO23qyhl2ql0mNMWPYefycw8OVOBpVS8dHflD3OXP2sxdUCHjfmxyntNXWuQIEj
         k7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784240855; x=1784845655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GNiDb8IqOV9RZOA/kubqQDgw9FaKyVldx5lkoAlLxg=;
        b=L59s3Z9R6CpN2NOOyP2dMl7xZqa/evjB/knnWfSoBECMlhzuReVINlRj7wkqgJRKQ1
         g+5G4/02QpO/ErYdHrEZGhxEvHH2h6eow8JDXsNv7/dk2YvcOmcyO8RFwQ3+sAf3zJbj
         4XNGFXihBZvWInAIX2iA3ZsRxZLuYpzrWk9NVoUL8L7VO3u8korT4jG330omun+i9fDW
         k9NaIdqAUF6Uka7juJw4rVQQvVh6n5KKOchcw/KK3DIkOb3YF0NRrBideZwL/UFqmzbZ
         1kViQNfpQMyzFz0ieNxC2Sr/nRixXjrOpih8QGghf7NvAqlYZJ44DQNUKM643IeMnUz2
         /VRQ==
X-Gm-Message-State: AOJu0YzysAMjDCVfpAtEZcw2/Sgzkn/vcDh/5DxklPtpEJZRYi7L17Z4
	cTWFarwvBaIgGXE5Z9I5mO3nEO56XtQkOPXvzbSWCrcsCIj3e+Fskcw7gbHPu0289ome6w9/gs2
	DtECVM9m+nxfLkQZh3lVWTpV7SHrVGsE=
X-Gm-Gg: AfdE7cmxuHlPKjIab54dv0TJ4UoydX05HXZ3fogeNOoDu3YHkV03URMx8J8qdPHpuNA
	Kz5JWUuOysu8sC3fTwhYOXe+fa3fGIAYueWXUQciKqr5V7IE04I/rAeu9Fi6jf0elUe2gna4F+F
	BfIZ3TtJG5iQ7esvS7eZRn+g2S3zjnrPiItg3VCI8fuesfvRRoyI+r16qJ7YUrfez1hj5471GXI
	xYqN6L3LbUhSJCWzgsuqYFDlr4YCOLwH4sMhNJKS20YJdAcpKLUVwJep4BtdQU=
X-Received: by 2002:a05:6512:6d0:b0:5ae:bd27:a13 with SMTP id
 2adb3069b0e04-5b28fabfad4mr8732e87.54.1784240855266; Thu, 16 Jul 2026
 15:27:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716024640.13396-1-linkinjeon@kernel.org> <20260716024640.13396-3-linkinjeon@kernel.org>
In-Reply-To: <20260716024640.13396-3-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Fri, 17 Jul 2026 07:27:22 +0900
X-Gm-Features: AUfX_myYgIQxt1JWeJH9pE66vaB9U7gaT7sPlFxz4ccOXwUwPMo308Xz88zQRmk
Message-ID: <CANFS6bZ7oASEgR57GkQNvos3cSm9G5sLWkVvET=OPUEXruxjcA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: rewrite EA stream before updating metadata
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 16=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 11:47, =
Namjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Updating an EA removes the old record and appends its replacement.
> Build the complete $EA stream in memory and rewrite it from offset zero,
> rather than committing a compacted stream followed by a separate append.
> generic/642 shows that the append path can leave an invalid record layout
> on disk, including when a new EA entry is added.
>
> When removing an EA, write the compacted stream before updating
> $EA_INFORMATION and restore the original pair if the metadata update
> fails.
>
> When the final EA entry is removed the $EA/$EA_INFORMATION pair is torn
> down. If removing $EA_INFORMATION fails after $EA has already been
> removed, the original $EA is restored so the two attributes stay
> consistent.
>
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/ea.c | 65 +++++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 46 insertions(+), 19 deletions(-)
>
> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
> index 88bfd6560692..d0044c61152a 100644
> --- a/fs/ntfs/ea.c
> +++ b/fs/ntfs/ea.c
> @@ -196,6 +196,9 @@ static int ntfs_set_ea(struct inode *inode, const cha=
r *name, size_t name_len,
>         struct ea_attr *p_ea;
>         u32 ea_info_qsize =3D 0;
>         char *ea_buf =3D NULL;
> +       char *new_ea_buf;
> +       char *old_ea_buf =3D NULL;
> +       struct ea_information old_ea_info;
>         size_t new_ea_size =3D ALIGN(struct_size(p_ea, ea_name, 1 + name_=
len + val_size), 4);
>         s64 ea_off, ea_info_size, all_ea_size, ea_size;
>
> @@ -249,6 +252,14 @@ static int ntfs_set_ea(struct inode *inode, const ch=
ar *name, size_t name_len,
>                         err =3D -EEXIST;
>                         goto out;
>                 }
> +               if ((flags & XATTR_REPLACE) && !val_size) {
> +                       old_ea_info =3D *p_ea_info;
> +                       old_ea_buf =3D kvmemdup(ea_buf, all_ea_size, GFP_=
NOFS);
> +                       if (!old_ea_buf) {
> +                               err =3D -ENOMEM;
> +                               goto out;
> +                       }
> +               }
>
>                 /* Check the final $EA size before removing the old entry=
. */
>                 if (val_size &&
> @@ -281,20 +292,33 @@ static int ntfs_set_ea(struct inode *inode, const c=
har *name, size_t name_len,
>                                 goto out;
>
>                         err =3D ntfs_attr_remove(ni, AT_EA_INFORMATION, A=
T_UNNAMED, 0);
> +                       if (err) {
> +                               /* Restore the original $EA if $EA_INFORM=
ATION removal failed. */
> +                               ntfs_attr_add(ni, AT_EA, AT_UNNAMED, 0, o=
ld_ea_buf,
> +                                             all_ea_size);
> +                               ea_info_qsize =3D le32_to_cpu(old_ea_info=
.ea_query_length);
> +                       }
>                         goto out;
>                 }
>
> -               err =3D ntfs_write_ea(ni, AT_EA_INFORMATION, (char *)p_ea=
_info, 0,
> -                               sizeof(struct ea_information), false);
> -               if (err)
> -                       goto out;
> -
> -               err =3D ntfs_write_ea(ni, AT_EA, ea_buf, 0, ea_info_qsize=
, true);
> -               if (err)
> -                       goto out;
> -
>                 if ((flags & XATTR_REPLACE) && !val_size) {
> -                       /* Remove xattr. */
> +                       err =3D ntfs_write_ea(ni, AT_EA, ea_buf, 0, ea_in=
fo_qsize,
> +                                       true);
> +                       if (err) {
> +                               ntfs_write_ea(ni, AT_EA, old_ea_buf, 0,
> +                                             all_ea_size, false);
> +                               goto out;
> +                       }
> +
> +                       err =3D ntfs_write_ea(ni, AT_EA_INFORMATION, (cha=
r *)p_ea_info,
> +                                       0, sizeof(struct ea_information),=
 false);
> +                       if (err) {
> +                               ntfs_write_ea(ni, AT_EA, old_ea_buf, 0,
> +                                             all_ea_size, false);
> +                               ntfs_write_ea(ni, AT_EA_INFORMATION,
> +                                             (char *)&old_ea_info, 0,
> +                                             sizeof(old_ea_info), false)=
;
> +                       }
>                         goto out;
>                 }
>         } else {
> @@ -309,21 +333,23 @@ static int ntfs_set_ea(struct inode *inode, const c=
har *name, size_t name_len,
>                         goto out;
>                 }
>         }
> -       kvfree(ea_buf);
> -
>  alloc_new_ea:
> -       ea_buf =3D kzalloc(new_ea_size, GFP_NOFS);
> -       if (!ea_buf) {
> +       new_ea_buf =3D kvzalloc(ea_info_qsize + new_ea_size, GFP_NOFS);
> +       if (!new_ea_buf) {
>                 err =3D -ENOMEM;
>                 goto out;
>         }
> +       if (ea_info_qsize)
> +               memcpy(new_ea_buf, ea_buf, ea_info_qsize);
> +       kvfree(ea_buf);
> +       ea_buf =3D new_ea_buf;
> +       p_ea =3D (struct ea_attr *)(ea_buf + ea_info_qsize);
>
>         /*
>          * EA and REPARSE_POINT compatibility not checked any more,
>          * required by Windows 10, but having both may lead to
>          * problems with earlier versions.
>          */
> -       p_ea =3D (struct ea_attr *)ea_buf;
>         memcpy(p_ea->ea_name, name, name_len);
>         p_ea->ea_name_length =3D name_len;
>         p_ea->ea_name[name_len] =3D 0;
> @@ -344,13 +370,13 @@ static int ntfs_set_ea(struct inode *inode, const c=
har *name, size_t name_len,
>          * no EA or EA_INFORMATION : add them
>          */
>         if (!ntfs_attr_exist(ni, AT_EA, AT_UNNAMED, 0)) {
> -               err =3D ntfs_attr_add(ni, AT_EA, AT_UNNAMED, 0, (char *)p=
_ea,
> -                               new_ea_size);
> +               err =3D ntfs_attr_add(ni, AT_EA, AT_UNNAMED, 0, ea_buf,
> +                               ea_info_qsize + new_ea_size);
>                 if (err)
>                         goto out;
>         } else {
> -               err =3D ntfs_write_ea(ni, AT_EA, (char *)p_ea, ea_info_qs=
ize,
> -                               new_ea_size, false);
> +               err =3D ntfs_write_ea(ni, AT_EA, ea_buf, 0,
> +                               ea_info_qsize + new_ea_size, true);
>                 if (err)
>                         goto out;
>         }
> @@ -370,6 +396,7 @@ static int ntfs_set_ea(struct inode *inode, const cha=
r *name, size_t name_len,
>                 NInoClearHasEA(ni);
>
>         kvfree(ea_buf);
> +       kvfree(old_ea_buf);
>         kvfree(p_ea_info);
>
>         return err;
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
