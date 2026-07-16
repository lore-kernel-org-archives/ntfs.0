Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AB63C585A
	for <ntfs@lists.linux.dev>; Thu, 16 Jul 2026 22:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240820; cv=pass; b=G4DW3bVsQDsgRMdfD8BEuTMcHWN3bcD90CAa/wQjm0a9oy1dDiSS8tje0N4B0Thcwg1Qf4+V4pKy9ZnXaWaHUxdkmJ/9dChY8Y38kByPh3QfIjvofXKIJa77U4mttxr3Hd9tvkt6xasFt+DSANrlRIKT1PkHfXvxbHkOwVR2brg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240820; c=relaxed/simple;
	bh=XORAGmj4UwPXE+XpAJvwryIBfTrmjzMIj7yZFdIwN2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KnHPgQ05yZmGuNX/Cqw5iqUOUGHA4jJuikOlSuInvcnqmEdOpETOovD34w+pKW62nqMsvXemSP9WtJwcpK1Q4oN09vHTgm7++LJ88LBe2/9ClCTewP4wIPTWfdyrE4+Rw94gUEt+GDke2m43ZCDzxcdaEP7KKlHBVWqFvT3joe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIZEfP0s; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIZEfP0s"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso3420927e87.1
        for <ntfs@lists.linux.dev>; Thu, 16 Jul 2026 15:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784240817; cv=none;
        d=google.com; s=arc-20260327;
        b=Ll8ITyssaOwo4FaRGONjYRphuOAAmYCiIljfTSvcLrI36x6Sbqq7XrX792XfAQzrjV
         k/1JeaMqz1/hjjXgvVxOPR2bwQvDAmn/l0Fqf/v0wBzH1sXD6qTKTXzrOmxmWUJmPjIo
         Fbs/KeD6ibb9yyxmpnIo3McTmhoNYZUURXeFCr4BQt1qrcyjVMAnJ4EZc5i0YGoju0Ph
         7HFyeh59ndk4SxfIhC5jcCDWl2wEhVjLNHgpBQm3jYz7F+uk+TcQ+lVBhLJtKYhCvgoT
         v+ughPy0bAYsaziR3y12ecqgj7OH6E2C5JFiq1SPIicQ4QH27MuyDxduI/qJAXalrujK
         wK2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xJ7rddNt5xKHUUB42duiZt/GywOH2qba09r4BNPqEFI=;
        fh=mgLCjrAE0uxzwsGYKz6SaNYZVNHieaxuEHuKwftvBIM=;
        b=kf8UF0vkAnitjsjBGMBrdMi4rR5rtfO3+0cMwdBbqphq2TQIVQ/KpfD7VGCjQpodiX
         bcYCIpahwR6fTVf/2th9BWDmw9zsh0klKqgbNd0fbFz423Tsbxrrfjtn0sJ+GaCTEkCF
         mgIDsHQLHeoZvItFz1rDkpyaylEuayYm3tibvmEXhBHI6gP5OQMtXx0oSlprhfQJngwz
         pv4Y4cBASri5UN36d+1IFd0uT3oYwEtOJLj5wR7BMZPaRpq/doM7XHDWlRwyMnILz+hb
         F1Bi0hmOEpJou69/zqUDeoXtpHeoI1IFUlGtP5BKv/hzK1159WMQOkUMJzNu62AOqG9u
         9AHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784240817; x=1784845617; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xJ7rddNt5xKHUUB42duiZt/GywOH2qba09r4BNPqEFI=;
        b=WIZEfP0scQmwd22G2VhfsjDTxQSEdA6pO13Vh++0SiABkXb+aN5LwXd5VEWivUy8R6
         0zQ6AtvcIcjbNkVlx48CpPFhvrZTNndWHNzucqw36kCMI9FSZDQF21mgjP73sbiQ8N2m
         IfAZpW7I+xW/RbHn+XFVNQTQxkl0gKbtY4r8CbLjCoNjH3L/ohF+SzDSyP0H+W9QBNnx
         rIhpiEOiDSg4suSrAbHvXvh7L/GeYYOXnk75ND0IF1zGHQXjTUD8XiLxAgOvkdd8XYhe
         UST2pxOJ0kixjjNPXr7qp7qqYKbHmbTSD1KVg1IOQlptZz79kYh06CzQFOyOhiHWr+Cp
         SFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784240817; x=1784845617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJ7rddNt5xKHUUB42duiZt/GywOH2qba09r4BNPqEFI=;
        b=GdXwWU1KBtOPGrrIMPHbHN2SR/aM7/lIuox5LIDoJnT0XXG/CUxNu30ReGEMwym4xo
         IGm0HLVBrsBDDMm8jA/tjtmMowSkz2oGqth4QBN6HJSKhAjBT5mSv9hpL2fPzeUGrYqf
         fUeLpDRSOREt9pFLIkk19IFyd3thBDtjZWv12HokKe/V8vYZgY8o41AVKutVVahdPOR9
         1li1SIPfMVgXGKGXvnIsg2ZB8Hm6Qdr43Zax1crCuZt0IdiVv/Qnp8c2cG5Be1b/oSUr
         aac5X1mrehpeaz2kB5hvQH//hSJDTgdO2zLGVj8HNaiZtzOtd/VyB8OjLq7jkkAN6qxX
         DeVw==
X-Gm-Message-State: AOJu0YxNu2Z9wTJ672NmhNMmOU5zM9GO1tOiEM9TZqpSPDdjDupS9F+o
	Nf5MhDM+AEMNn5emyYo8gzuSYL4keclHwTG5+estYWUZI/dRhe8PA0C23SipR5jksmr+2BRYSHT
	6poT/iB+YjYoaNPHNF5Q0dxeGGrNrkCbd2D2z
X-Gm-Gg: AfdE7cl0rPgyHaRSeBXUnFn5gNyCPqACyzcqytkrxYf1p5847OsJiJqbyWkVNnD2zHj
	xvss+O5gyDwfFCUX20bzAEj6UR2e9iI/wZ3jVA0Gb2qVUR4DmOPLp2RhCtWSqT0NgCnxebSm9Du
	7gNQXDnMzbyTjZoQ4+qApSceU8CgDkUKcsI6ks+VMQmWbI7gSpPM0upWZNfy038sgdrYXN+hGW4
	nDUv0YxxYO2vjMpKsFtnhC4p4nPKrQ1b16r0lwrjHvzKPIbitzZ2g9L6GfC+HY=
X-Received: by 2002:a05:6512:1047:b0:5ae:befc:97a7 with SMTP id
 2adb3069b0e04-5b28f854e4fmr17980e87.13.1784240816604; Thu, 16 Jul 2026
 15:26:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716024640.13396-1-linkinjeon@kernel.org> <20260716024640.13396-2-linkinjeon@kernel.org>
In-Reply-To: <20260716024640.13396-2-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Fri, 17 Jul 2026 07:26:45 +0900
X-Gm-Features: AUfX_myHhVJbrThmMs5xfQR2Q-AZwHWKvv728hxOFYIbILvnNIFIHA594vnnQG8
Message-ID: <CANFS6bbLi90E0YkYZ3+6GDTDL8hYNFra1Au3wvN+Wu1Tx=TWDg@mail.gmail.com>
Subject: Re: [PATCH] ntfs: remove empty EA attribute pair
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 16=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 11:47, =
Namjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Removing the final xattr leaves an empty $EA stream. An empty $EA
> attribute paired with $EA_INFORMATION is not a valid EA chain and
> ntfsck reports it as corrupt.
>
> Remove both attributes when the final EA entry is deleted.
>
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/ea.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
> index 0eba3f41c7bb..88bfd6560692 100644
> --- a/fs/ntfs/ea.c
> +++ b/fs/ntfs/ea.c
> @@ -275,6 +275,15 @@ static int ntfs_set_ea(struct inode *inode, const ch=
ar *name, size_t name_len,
>                 ea_info_qsize -=3D ea_size;
>                 p_ea_info->ea_query_length =3D cpu_to_le32(ea_info_qsize)=
;
>
> +               if ((flags & XATTR_REPLACE) && !val_size && !ea_info_qsiz=
e) {
> +                       err =3D ntfs_attr_remove(ni, AT_EA, AT_UNNAMED, 0=
);
> +                       if (err)
> +                               goto out;
> +
> +                       err =3D ntfs_attr_remove(ni, AT_EA_INFORMATION, A=
T_UNNAMED, 0);
> +                       goto out;
> +               }
> +
>                 err =3D ntfs_write_ea(ni, AT_EA_INFORMATION, (char *)p_ea=
_info, 0,
>                                 sizeof(struct ea_information), false);
>                 if (err)
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
