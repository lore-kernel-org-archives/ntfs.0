Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB083D5662
	for <ntfs@lists.linux.dev>; Thu, 16 Jul 2026 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240788; cv=pass; b=sCTdhbaVk/rFqQpNjeZdMMqCMYqyzVVcWeK+1s9yaZHczAaUk41Hyk8rX8Nt5xLCRQe35w9DdoGOYM+5fmsLVjz/Lgkwk/GeP7c+3UyhwP+Jdu52Zm/1v7uEK1hTYxdxgYE6qUcFGiT7YmvGZFrmkzZO6jMhb373GzZSjBlA7QM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240788; c=relaxed/simple;
	bh=NbAF+ugPNPrv2W5iMy7iKfqjo/Rxt2EpPULg2ghKD70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s8Anbtz3f3AJrOMVHT9SonSMD+VwDIo9kJWu8fgah7zOxxH6JqQGniif7QALYLtVeQ1gIav3kF5pFgTSK6R9u8SEnAkw/fq6iRFQFvxQlWc9f6EwbV8A2ACw1tjuHSzOP/kbN6aIEFfKfbpuSmmz18N1OCSYAq8GrbmUR8R9/uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hmkpd2Pf; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hmkpd2Pf"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b01910b499so962945e87.0
        for <ntfs@lists.linux.dev>; Thu, 16 Jul 2026 15:26:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784240785; cv=none;
        d=google.com; s=arc-20260327;
        b=IDBKR2ytLrqP+t6fbu3h+8HoyyfAMvOXVvCBVUhcai2GjsGyF8lnqLEbaSX1P5nXry
         BIzjKjD4VYLyLfo05sMSzKxpX924al66FuF0smGtM6jGdpqWQMgpvoU2PvDVRi03u534
         0RNdrN5uOF845vWg1sz6ra0iegnGJzZeWumyc38PddB/gLfjPhSeUnRk5JyzTUJsGjE5
         FbdUbzsQ1av+hnVVkqzmG2r3Vf6YY49cHWIJt5rLghXI66WB94xiV0eYy786A2VoAyxT
         PXHgtX1085vwOX2QXi4bfCyvehBq9SZyZO7fhLAfKpnARfsl/m43bwiLzO7v3VBHtEiq
         doMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cqmQWaXE3DdDxs1rhJWy0b1hUegH/J+k8O5Dv43azUk=;
        fh=mgLCjrAE0uxzwsGYKz6SaNYZVNHieaxuEHuKwftvBIM=;
        b=clKJ6N0yAgfez3vVmXmAb4huvELQS4N/RwEx/aamdYAldsU1xtzKCWK1gXoKdlLJ8X
         QercuiuPvzynGKo2G/hDWkY8YjrsPTEuvcqZxuzFT74i6vEkeclmnlt6B5b68w9nl25T
         Tnpw6VrMlA85UQgc44GgycHmI9fggHh54Usqj5ta9Rj41ayMSB5SBmcaR/tqfJF+Lwd2
         hTv1S/5wGhpCJ8A5fypt+Abh/rkZbCWnOCCn1lN023R1ljPNiCVySEM4jG7aQ45iH988
         RAisxR+omC5bzAVGjOqHG+CIuAzaPuN77WNQcgpZ0u8kpnCyzCboSqMA2COAdRmnmjpG
         ok2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784240785; x=1784845585; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cqmQWaXE3DdDxs1rhJWy0b1hUegH/J+k8O5Dv43azUk=;
        b=Hmkpd2PfG4+KuNz10wgfF0Ds0CbW+AIFVVoeQlspVeIiuMp7VHui5cOYFXhATmFhDn
         PKOLz0fXzIIGto00kC4IrYzK92bgXzuWZsGw7szUgPUqAzMoZMSyPP1VH95IG44uB/7B
         0sXO27KAIggmUcxr05DTnwNToMQMXuEC+nu/Tyqrfn7eVHB9p6KiQJhLNYyryBXvg2WB
         51PJHq/sPhxHsLzBTg79trh16PMSh+QYL7Ip6OVSOXiK4kKJkXGwUSwtjt0ZlAoNPVLm
         AiemxDdVzAID/Q57bsUhjJgrBW/OUecOXje/z3xoHK3pMu39mMGhEDQWYjG8C2ZgcejU
         Bv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784240785; x=1784845585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqmQWaXE3DdDxs1rhJWy0b1hUegH/J+k8O5Dv43azUk=;
        b=O6LBCpqowEKixFEX7sFFvmXcIVbf90J1SZHSoIjguC7FZGdNWvK2iA2ZttcDJzfFfK
         bJBzAzR1KDaMod2hiS+5xQl9iaLkr6f33f8ph+veXkOlJgkTvLXxnQa7WLoXbmpFq7ko
         3jNtSIP/TYd6amzL2cNmoRVB6krLxIWMgSL1EfvjEUSaHs2dUtXCP9xZzmr3AmtLJ5pS
         sEYhuy4TBjVeBmwy3GZaVUIsHmKHznlOmB7+JKT6VcTWg0X8vsdiEpTFdS/VZkjsx7QW
         H9GDLyI/lSHujPi5DCIL8y6aIdH+AecZ2APsjMZekAzWU/7nAVMHHYEvvQqFnQ8fMn7w
         p9Zw==
X-Gm-Message-State: AOJu0YxTD+QgzyyfTkmSlbDPR6Rok0291upRth+VXWt3Igdqrspep+2V
	/sVRP6CSAEYZ0oHdcPBwdriT8Nxwww1VcPO5bDxJNXNpYjRNPpkRSuMH0CDZfmCM28DlSgH/5NE
	Hoy8+tYMQLLzPRyjcBnnTBeqGMQwsjAA=
X-Gm-Gg: AfdE7cldHPQz8HWeBZconCz9hNWGACfeUOi2/R01T68z14JLbB4i3B81Y14bNuHKrCc
	j9Zfaw4iRBJAOHyb0yID03s67proIRdf+qhhMYAZU1djBMQSi6g0F19nZjb+88njFdE+KKVcsHD
	U23HMwqQPCjeuNroGbYWyEDYmtAyUgYZmRd50G4DNNCnzyWvveJFCNMQQNrq4LIHyxq9ExuhL/g
	3kSgQ42705Wr9ehYYO3rJSanxdSFa4X6xsLwaU1cvLMlnCRcDsBWRr1oCAfvoM=
X-Received: by 2002:a05:6512:3d22:b0:5ae:c542:3416 with SMTP id
 2adb3069b0e04-5b28fe214admr4597e87.0.1784240784864; Thu, 16 Jul 2026 15:26:24
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716024640.13396-1-linkinjeon@kernel.org>
In-Reply-To: <20260716024640.13396-1-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Fri, 17 Jul 2026 07:26:13 +0900
X-Gm-Features: AUfX_myh6ejj2KN6f5hvYQZhdAxIrN_1znb5dOyW_QTT8N99EVX3PcgWlRddpZ4
Message-ID: <CANFS6baPdhk9yVyOJtH03eMmeBZ9vQsC7DmsE5i0XHpZqx5UqA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: validate final EA attribute size
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 16=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 11:47, =
Namjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> A replacement first removes the existing EA record, then adds the
> replacement. Check the size of that final $EA stream before mutating
> the current stream.
>
> This avoids committing the shortened $EA stream or $EA_INFORMATION before
> discovering that the replacement exceeds the AttrDef size limit.
>
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>


> ---
>  fs/ntfs/ea.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
> index 0cd192752b7c..0eba3f41c7bb 100644
> --- a/fs/ntfs/ea.c
> +++ b/fs/ntfs/ea.c
> @@ -250,6 +250,14 @@ static int ntfs_set_ea(struct inode *inode, const ch=
ar *name, size_t name_len,
>                         goto out;
>                 }
>
> +               /* Check the final $EA size before removing the old entry=
. */
> +               if (val_size &&
> +                   ntfs_attr_size_bounds_check(ni->vol, AT_EA,
> +                                       ea_info_qsize - ea_size + new_ea_=
size)) {
> +                       err =3D -EFBIG;
> +                       goto out;
> +               }
> +
>                 p_ea =3D (struct ea_attr *)(ea_buf + ea_off);
>
>                 if (val_size &&
> @@ -285,6 +293,12 @@ static int ntfs_set_ea(struct inode *inode, const ch=
ar *name, size_t name_len,
>                         err =3D -ENODATA;
>                         goto out;
>                 }
> +
> +               if (ntfs_attr_size_bounds_check(ni->vol, AT_EA,
> +                                       ea_info_qsize + new_ea_size)) {
> +                       err =3D -EFBIG;
> +                       goto out;
> +               }
>         }
>         kvfree(ea_buf);
>
> @@ -312,8 +326,7 @@ static int ntfs_set_ea(struct inode *inode, const cha=
r *name, size_t name_len,
>         p_ea_info->ea_length =3D cpu_to_le16(ea_packed);
>         p_ea_info->ea_query_length =3D cpu_to_le32(ea_info_qsize + new_ea=
_size);
>
> -       if (ea_packed > 0xffff ||
> -           ntfs_attr_size_bounds_check(ni->vol, AT_EA, new_ea_size)) {
> +       if (ea_packed > 0xffff) {
>                 err =3D -EFBIG;
>                 goto out;
>         }
> --
> 2.25.1
>


--
Thanks,
Hyunchul
