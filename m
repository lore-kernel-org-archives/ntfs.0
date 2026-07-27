Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A3634404A
	for <ntfs@lists.linux.dev>; Mon, 27 Jul 2026 01:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785116917; cv=pass; b=HR2FqBUxKXJoL84e65J/Wl0aUmAkevcLugmN4F1Z1dBZEHn8dHeCGsJF7cM6B/3Yx7Wbr/J3t7NoNEMu83sC6vb1n98o6GRy4xa9UDD+Qdbpc58zC8z2wqHTAvI+aim3Dco/1cyuHg2QaU15jd8voXXTZ963nRkoejVdg840PUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785116917; c=relaxed/simple;
	bh=whFkCPlU9dz3f1EX4GHkwCwKocy2OHyPJlIQhkJ+wEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=slEz3JHtP4h0QbzlckKzxkbDFfQIDdb1Ond8xpncJ/Md5PkS+KOx7iKznTd6YtIHzSwflAYXdHHWrro7SXANZIpuWLedgXBdyOAc6J6WV6BkPkBnraMqNVzdMx+U1wWL6mPSPQ54kG15IM1fG1kp3/WyZ4LOd4xbuKVqz9Ayroc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ci992AC2; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ci992AC2"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c8dbf4f38so19083291fa.3
        for <ntfs@lists.linux.dev>; Sun, 26 Jul 2026 18:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785116914; cv=none;
        d=google.com; s=arc-20260327;
        b=LiOQ7MBMkRFUHmKmr9intMnwrQgjDNwJDbksp9eVJwGjn1YnjPpoFTBdTJFA65C5S5
         QpIFSOrHk6hNmjp26Czzy7NhGe1pt+lIjElAkcrwUG1iCzp93fxn4+VxAs82UE8diEYK
         uARnSRY4woHihYNFy8uGgZomqq/B6Y1HxF+2lKCEZcJCFJvabHswJcQmVqBojhM8lnC2
         HE/figj4Bnr/mddVAMW/VZaTtHCAAU9i3FPyEHgp3vQiG6KyxGyB10EYNvfmveChTqQR
         gpCfCG1TuT72Gcw6o8nL/LU0MjnAazm801b+UVI2gMOGzejBf7Totht1///8nsdY0wXC
         V3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k7+HSyvbpNzON5WZgNTuo7n/+mTxR6saM4OTcFquMTk=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=AbD2mb2nQ9t2+UbThfKEkbh015WPi9Pz4BJ7mY69PAZ9FadmD4u4k2u0tHa8ohi3FO
         CNyR1HU2Ukpu68qE6xO1AvHh2LgSOpzp4MgVUeNAGTjpZoTsmx2Fzp8jPXDDr8iUD8pY
         iwh3/Ud50mMfldhVq1Izv4cumGAZEE5HHdlX+mcl7dZI9hb6yyDyltSh4elL7rzofnOy
         Na4sbNrWCEsgRbudfV/7gh/zitPsUa3aKhm9V4Pfu7K0mEsl+ddulnctwaPsItb0DKoa
         68/P+1RZMVng1jkTxS2/jhi18seqWg9p2jBtkX+mTd7g/RHLd2mgH5IkLGFvnJL/43dr
         hxQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785116914; x=1785721714; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k7+HSyvbpNzON5WZgNTuo7n/+mTxR6saM4OTcFquMTk=;
        b=Ci992AC2J/RCzqLhyGqvK4D9x1/0hAoKYUfiaUzUeNbNlksKcMOSvHTXWR8Al4EGbC
         ZkP9GhOdbTy561SWRCKqGeZNVX6r96ZiaUuETm10XgH/R0oDtWauDBmImw1l0rRYiL++
         p685PiJuHknUrEL+t4GUsx3jGoBVckDgZRi3y6/3fHt+KqLise5jb3BMyjDy/hjuKgZk
         MARmdD7J9/Rzhb9Ulma2aVlceq3bDhjVfeCztlx9UKMS9UX8l5OQqozrJy31wAVwM8oc
         q1HC66Bmte2wcz+df1NLsRlNLBIlsgAmGZ6KGQ6PTtUL89xs3o4zkQ7ubWeb+cA6L3Bo
         ipKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785116914; x=1785721714;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7+HSyvbpNzON5WZgNTuo7n/+mTxR6saM4OTcFquMTk=;
        b=fwPvpY2OXEyWNQaF/2R0+zhkUKr6e7LGdQrKIAM36M6NE+29njirrw8iUu/blYFjPS
         XH2BEthIGZBwZGqnyv75SNbDsiAclYao+aFYXRQA5vDPH4SarsGT0XdswbhHdK/MMPVI
         iYpgBJ48DRcr8iGmponyJ3W4Vunb1Z/4ArnSnGACM4ywKd4yo64n7l6ggdTJdTWON1Jw
         RaJHhVW8p1njhanghNGbVDx8wZDIjUfMRXDAYuRxVBVfLrlODzMSxazfbByoVpRU4zDy
         KW8XPYw7uOsgk/qaMYtB7ozCBNIiotkyQhFfjJDa/g0/KkDV3ZfMDKtISPY04YQ5xv7e
         tscg==
X-Gm-Message-State: AOJu0Yw6FFPJH9hJURik+yyZIuwOEzb2s9yeTAnQ8TjKnxr1OqP2JMJJ
	JmPMJtaPg8KYh27JzRu5aJedV4jmSNval3v+0xUTHHouJDZhYvYwqG5Yf+t/LPvlcMqAIuUVUEP
	qvXV7VqFqgKtjckbyaWpIAW7Yxr93RLA=
X-Gm-Gg: AR+sD117heSUjDTaJPruurb6QGW/rPimwqFpwgnObV8WkU8Hktzk7gYzOGFf92Vhbro
	gAVt1gopli0KwswyVdSGlr8IbtQ0RqJUuNAHfgKDo8YgOC59d+mbEnqWmwChzM4sdXB93XGL30A
	/YsMA30I4xsy1BXVaNsKm5NsaopawkKHQR3uAwE6nN8JWg41etmE8oCleJtIXRIL/YfDC2pG0vC
	XqTWX9SMJfxzJGykutnazH7/kyQASmSWOvQALwVb9cTf0KtEq/QW3Mk8dtn+g==
X-Received: by 2002:a05:6512:1281:b0:5aa:8823:e311 with SMTP id
 2adb3069b0e04-5b2c1b4d79emr1158896e87.47.1785116913998; Sun, 26 Jul 2026
 18:48:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724154900.21524-1-linkinjeon@kernel.org> <20260724154900.21524-2-linkinjeon@kernel.org>
In-Reply-To: <20260724154900.21524-2-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 27 Jul 2026 10:48:22 +0900
X-Gm-Features: AUfX_my9R2UBXYZF_bwnAhQ0ZaoFdFbTmldOj4Ms9g-oh-ezxlbjdwm_Otzu1Y8
Message-ID: <CANFS6bYsh2=9xK3LVSn7zKRFEK9D6kUnVTnpxbrZh2hnw+afww@mail.gmail.com>
Subject: Re: [PATCH 2/2] ntfs: preserve chmod mode before applying mount masks
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 25=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 12:49, =
Namjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> fmask and dmask must continue to constrain the effective permissions
> of every file on a mount. Applying either mask before persisting an
> ATTR_MODE change, however, stores the masked mode in . later remount with
> a less restrictive mask then cannot restore the mode that chmod requested=
.
>
> Store the requested mode in  first, then apply the mount mask to
> the in-memory inode. This retains the mount-wide access restriction
> without making it permanent. Also return failures while writing the
> WSL inode EA to the caller.
>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/file.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index c8e49f83fd92..a6855d62e1fc 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -342,14 +342,17 @@ int ntfs_setattr(struct mnt_idmap *idmap, struct de=
ntry *dentry,
>                 if (ia_valid & ATTR_MODE)
>                         flags |=3D NTFS_EA_MODE;
>
> +               mutex_lock(&ni->mrec_lock);
> +               err =3D ntfs_ea_set_wsl_inode(vi, 0, NULL, flags);
> +               mutex_unlock(&ni->mrec_lock);
> +               if (err)
> +                       goto out;
> +
> +               /* Apply mount masks after saving the unmasked POSIX mode=
. */
>                 if (S_ISDIR(vi->i_mode))
>                         vi->i_mode &=3D ~vol->dmask;
>                 else
>                         vi->i_mode &=3D ~vol->fmask;
> -
> -               mutex_lock(&ni->mrec_lock);
> -               ntfs_ea_set_wsl_inode(vi, 0, NULL, flags);
> -               mutex_unlock(&ni->mrec_lock);
>         }
>
>         mark_inode_dirty(vi);
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
