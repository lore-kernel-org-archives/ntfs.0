Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B503D75AA
	for <ntfs@lists.linux.dev>; Thu, 16 Jul 2026 22:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240928; cv=pass; b=XxvqlK+OXTIK7fKF7I8rqbgxbOHIVmbYdp42wpr4F6vDi4RQCzDrYxy35yVV7reyXqUcJUMpFvI1A0gqHNcIqXFoiOgivMWfOkX6rF/nfMrJ61mtlWWyMKc5N/mPVxMkOrtbV9/i7wUEl8EVBbKNW40f8L6eL4+2jCAsjreAcnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240928; c=relaxed/simple;
	bh=ONDagBgJZvR9dg0unKgoZjq6Nl27AmeBJzUlL+tmTEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DcrjEGlfOXrRZSccrPKlIEuyO992DEc4CpYRCrgVYr4ts3wJwXbzufb0X98m9AdAdjfaMmXoYq/3/CA5EDCkw0YUWiQvyFDrhjd7EiCeMjXCgIhe4iGacC8hJuhHxvEi2iOgYuy6Mszq4mLGCeyl7x69NMRjj2hXWlOX6fiT8Cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQLNjExa; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQLNjExa"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aea0fff535so4318778e87.3
        for <ntfs@lists.linux.dev>; Thu, 16 Jul 2026 15:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784240925; cv=none;
        d=google.com; s=arc-20260327;
        b=LJPSPUku5J7l0uVJkY3bSTesAqDt0+cG98VsW1KBKbgNLU7E3YkGmK1+SbaMAHQwh6
         qied23uEnrl5UsrUH2KT6snfVnvT292JC0oWYmPXVQcsuUKXKMJkvWOadiXs8TRX8/FA
         00tOhm0c3QlZnQF529ZfcfK4dWqoctV0nHu/5Q3uzk+ui/9pyDMUcJFrd7x1rQI9W8L4
         akoo9gxhL60pKeJq4fpZBZ860m1P+smYtPsJPVPqks//S1Ws3wJnXjorsXy0nLA5Abhz
         hxTmY7sTF+cENuOXh/2RW5kDJirrJ6BOJhMnJji/fiSyLv95OhCZNd7ioPWZPBG91Kcu
         ZGqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y4g3hX9kwv1LG4AWh7Eb8rRRUHNBzvOmYbs7dqFRKrU=;
        fh=mgLCjrAE0uxzwsGYKz6SaNYZVNHieaxuEHuKwftvBIM=;
        b=jr81Dk4bj+Lw3WqfW09d4zfQkP96GY8AS+Dtu6NMuvOmcGvJJoNkgNEP/7Af18HQDi
         NwBd/ltWrCONLVECr/xgwQKkJOFJswn8PZtI/JsBT36WHuIgGztFWrK0YZePlI4dIPhH
         8ZOtriNRaZHRUvqXdEJ08arYFUZJDhsG3aqHMJ2oZNAp5Tiqcbd2SoQBHdTkc6GygxbC
         B7nldOwJfnFTe/1sX+E+9vY4krpzdlMpRLNqqL4dtHeHWzR4sa/qGZUjvya5QiJihgO9
         4X9qPuzH9oNHHlVB1uPw8EtNtjCO6S3L+DJ3Uddz+z69L3r5u/2oNhC/b5YvbA9padK8
         cOrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784240925; x=1784845725; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y4g3hX9kwv1LG4AWh7Eb8rRRUHNBzvOmYbs7dqFRKrU=;
        b=RQLNjExa66BhZbycVkrXkC5Uh5XEmRTgddrUXA4zfR8k1H4aOQl53IxIMY99rgxp83
         F6oUXwlB2d+fCmcqQW48bKM2oJaRMV7En1v/JK3otjJ8szFxe1tu/vcUYQ+JQqEEgpjZ
         mrzL1vd+RmeViihSPByA8s8NQk2HHHM9zqCiKGNJDYfcPIJlhhIxoFEY3pXFnLxotAyC
         cO0Lfb8qBncAAy2aChwwcahH8eFAaiAcqvjBrq2T5nNo0bZli6KMbxrR4AzXP+Gdcy7q
         FYhKh3IycKm93dbhNrfBdK3jZ3Bnrjs92+OW7Uy5193F5eeQyQUqkj50wUeXm8EgQBWS
         nLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784240925; x=1784845725;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4g3hX9kwv1LG4AWh7Eb8rRRUHNBzvOmYbs7dqFRKrU=;
        b=Xsri/KBaeAxNsAUkyoFKCRby0cWt4qJIF8bPy6nYdZyLU7dOa6xx7qwGSuSGjYzTwh
         RnKT2kEmMKvba6WaC4B2w+eVwkoGSzRxkGvzijfPn/hYQYFhzs4+J0ZmbP0FZFqeS6Ky
         uR17S0LbNyJhc7mc4P8LeKQVe1YVM2s354crQL+OKTo91oevvFS5mBWScdIK7BXXn3y5
         /h7/HWFDBolXWF93EZrT4bL4f2UavS6DVb2vi4YoML6fuxnxjL/OxcZt+YkiitxyTN9A
         KVa62hzz9CLrJ533JhOH6KDwB1jYT3x3XbJ1zexCiqYtBcO62emLqKRTvnxAnv9C6a/y
         +ohA==
X-Gm-Message-State: AOJu0YzVEjOAyeEZ1u7/qV7mr6ux0FNHGyLGVKTH4OxrojwEwHziErTo
	xQVKyrzinBsG+myrEzyLNywUBeV/LIj2bEvUCNF23w+JOZliFsVjNbH86ANuxiUTdlQfAUSxDAS
	VKcGTNX0mE1u11til2ZvxNitJZVX0993jVnA9
X-Gm-Gg: AfdE7cmzbtiwzDn/BF6wzBH28cEV37GpGJV8SfNgZia2vvJ3ixDrXlTaZwY/IDFZ0fK
	4r+24tOpLYLk56REiSNr2NddJbdTfA87Yoj8qxrSTWtq/KACXJnOqZQslc/y8kkPjSepfJvxO+W
	NkPUfgQcGgjSSo1ObLaMECzzcHDkHOdmmCRMcMLnqXFJhH8IPKT9eyi0VtqHqozZffyhTozd25j
	HqIhHcuir9nKupD+lOtoDqDGYkqc0XphWA0wH+GbHHKIviuSkKh33a3x4ZSjnw=
X-Received: by 2002:a05:6512:3f14:b0:5ae:be77:44bc with SMTP id
 2adb3069b0e04-5b28f855ba9mr16942e87.4.1784240924521; Thu, 16 Jul 2026
 15:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716024640.13396-1-linkinjeon@kernel.org> <20260716024640.13396-6-linkinjeon@kernel.org>
In-Reply-To: <20260716024640.13396-6-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Fri, 17 Jul 2026 07:28:31 +0900
X-Gm-Features: AUfX_mzo8ufpztJCsPoHqaOj_Q_a4qhA1ZcnM4PGnuZvkNbyplUZqoSjp_daTnU
Message-ID: <CANFS6bbPxFJw1vBD_16AfAGFONMPBh7Uk6roDBnuxZmo_tKP8w@mail.gmail.com>
Subject: Re: [PATCH] ntfs: use pagecache_isize_extended() on size extension
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 16=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 11:47, =
Namjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> When extending file size, call truncate_pagecache() first, then update
> i_size, and use pagecache_isize_extended() instead of manual
> iomap_zero_range(). This ensures the straddling folio is properly marked
> RO so page_mkwrite() is called and post-EOF area is zeroed.
>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/file.c | 28 ++++++++++------------------
>  1 file changed, 10 insertions(+), 18 deletions(-)
>
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 9061f8f77f7e..c8e49f83fd92 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -268,23 +268,19 @@ static int ntfs_setattr_size(struct inode *vi, stru=
ct iattr *attr)
>                 return err;
>
>         inode_dio_wait(vi);
> -       truncate_setsize(vi, attr->ia_size);
> +       if (attr->ia_size > old_size) {
> +               truncate_pagecache(vi, old_size);
> +               i_size_write(vi, attr->ia_size);
> +               pagecache_isize_extended(vi, old_size, attr->ia_size);
> +       } else
> +               truncate_setsize(vi, attr->ia_size);
> +
>         err =3D ntfs_truncate_vfs(vi, attr->ia_size, old_size);
>         if (err) {
>                 i_size_write(vi, old_size);
>                 return err;
>         }
>
> -       if (NInoNonResident(ni) && attr->ia_size > old_size &&
> -           old_size % PAGE_SIZE !=3D 0) {
> -               loff_t len =3D min_t(loff_t,
> -                               round_up(old_size, PAGE_SIZE) - old_size,
> -                               attr->ia_size - old_size);
> -               err =3D iomap_zero_range(vi, old_size, len,
> -                               NULL, &ntfs_seek_iomap_ops,
> -                               &ntfs_iomap_folio_ops, NULL);
> -       }
> -
>         return err;
>  }
>
> @@ -1165,13 +1161,9 @@ static long ntfs_fallocate(struct file *file, int =
mode, loff_t offset, loff_t le
>                 filemap_invalidate_unlock(vi->i_mapping);
>         if (!err) {
>                 if (mode =3D=3D 0 && NInoNonResident(ni) &&
> -                   offset > old_size && old_size % PAGE_SIZE !=3D 0) {
> -                       loff_t len =3D min_t(loff_t,
> -                                          round_up(old_size, PAGE_SIZE) =
- old_size,
> -                                          offset - old_size);
> -                       err =3D iomap_zero_range(vi, old_size, len, NULL,
> -                                              &ntfs_seek_iomap_ops,
> -                                              &ntfs_iomap_folio_ops, NUL=
L);
> +                   offset > old_size) {
> +                       truncate_pagecache(vi, old_size);
> +                       pagecache_isize_extended(vi, old_size, offset);
>                 }
>                 NInoSetFileNameDirty(ni);
>                 inode_set_mtime_to_ts(vi, inode_set_ctime_current(vi));
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
