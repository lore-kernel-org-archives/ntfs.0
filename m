Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB4343303F
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230447; cv=pass; b=q2c3g/TX5Kv19WoVAU3XHNs3Lf9pBovgnoc2oJKfxhaBVtNPqA3KV6CH3Jzl08pbGqRLKMxC61uDdhxIO8pccLteKcxVtYL94xfdOD7kkSljUjALay0MRafzQvPKuw2WJuGmWy7ym5K2/pAugFbEk8FRmtawG8fWTcxEJ+GhIT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230447; c=relaxed/simple;
	bh=5p0mDzZz7NmEDy0shwH66bL4VIO0oLKjSi900YI/dik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1P2aknvoLijjUQENnsEK9xNug8W3cx1GpOhXgRuMvugn4AoajjnkM+uA2EvFPfMDB0TkQHVELaTCYIqGw9NjuJSv5krJOWlhY+ORyWGcpFCnXqyJNqFGy7MB8X7XtoJSkLsqoxSvXLp37qIeDvQql5aFZwb0mRUygMVueidX7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHiN8ea3; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHiN8ea3"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1801fso1252078e87.2
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789230443; cv=none;
        d=google.com; s=arc-20260327;
        b=hj83DYwndRJM2FaMXrSKkZmY9J5aoJnIH4CLekZPrBZ9Y7WpFM4imTjX0JfVEmewnY
         V+OC25V0ZCDKvi+KuxgCLHIU4nNxOu4Vui1MqugkpXWm0GdRbqSYzKxpkiTcyqsCTWKL
         4iP6oceegZAq/6Xo8LutPWL4KQKZiOi6G0L4NxPSOIOLGn2v6jicQLrhVLf+mb9HkiC5
         pFhks5cwuisAHZYs+IfQpdfiI8q51pQJEIhCQAqiHfU7ROZaVrrBnIy1PY1WxLIFiGqE
         srkk3MF2FpPpECfTCZKwWj96TEoNkoRO2uT8Hn3WHIYtJNejxQcc+BCXlYbzL1X3ZCPH
         Po4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FkQSjQxEJi/rcBp+Nw6Y5sna5j9ScN/96TOT/xQrrUc=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=hgYGzjbAfSKkeP1+nR9hNLR51XQz6iL7Rm7k+5Jubn7pBQWkoL1hOD6Lggx08HU2QZ
         aLdLAlaq+f0Ef2e96BxPkghn+MXS+42gSgp0FNOPt1as9GFILHQ5V5xyTdWRYjUUJt0v
         +LNFp3Dm49w4rjyaH5VQy5tH0DgiDjeaFWtAOu14lMxVmSS14JwOzvbfPCabmdVJzjjv
         Cki7AJoDvpmN+JVlszKzlUox0iFQ5Q6+esRGScKdglyzshKYfinSb2vjivLk+iTw2WrT
         Q//GfTaLd4R7ERlTeHWxFeNDUYybyj6isg9rFAFy5q0xJViVTbwPqcWMUjVwW4AH73gr
         WoRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230443; x=1789835243; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FkQSjQxEJi/rcBp+Nw6Y5sna5j9ScN/96TOT/xQrrUc=;
        b=tHiN8ea3Ie/9WBdm7wKRHYmIN230U1uBX0K7uLS3tIt459GWGHb/ebTeEy2NJPcVif
         0sfetUcmFUQl5u2uDPgoMu7ijKfJsrJmnmuJfL746L0gYUNcBvJst/e1kjwcViZnHxgo
         JdG2Kj5+C2v86oNeuDM5bev9u8xIrQ4Rq//b24DBM5DHaoS8NMKkY5wOLs72PX3bADup
         wZ6o/X/XW8pXJ/3OrvupO6DBFn59dAxFtrwNpyZYZnpl6vZ70e16QKgu9nII7VzOssr0
         WEv1os6X6pX0llZ7VTLK3jjLPlG2sKTcRJmIrpwhEsfjkPr6fEd9+laZP5cTHwo0LGg8
         Khpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230443; x=1789835243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FkQSjQxEJi/rcBp+Nw6Y5sna5j9ScN/96TOT/xQrrUc=;
        b=MCkNQpaKucsGNyG5NuTzmjmtfvn4VdXd4ukYpIyI82M8Qx86uJDWDIBHdm2pTTQVeu
         hV1JkWi1k1PepvRR2iRgJ7d7e5QFwq+4f2Ai/mLZJN+yj2k9HY61eo6RVLJEUKtYy4S1
         aAHCuZPt110Bu2OHq+Iy6JcBb64KtGrDnR84WzLNTBSNzdvxzfYFYkOpLIhggl/Tjbvg
         jECsrtTDJ6oz7Dz58KFNcpYiQJf2X0G/LECA/ULn/9K2BII3paOscZFJkwjFX18J9/gG
         1Vxo+zqS2X2ozMg+1Z0khOEvT6oDwtfSqxl4I7kD/1RwuWjvE14Sv5pNeMrwcObIthAH
         AINA==
X-Gm-Message-State: AFuF++m4x0GDL0rqG5Q2K5Bf0a0izFgRVNWw7kJO13qcE9jOdjjO5TkG
	JVm6ScbwWAphu1H6Jsjrd2MHpFgsI4uAVENwaHWgp3KLdaKVEbHLa8r7WSZu/vTkHCQ6isJ4IXp
	hEZDgIGzMlKT8d3cWI9nNWCOF/ryOdMBSbaCh
X-Gm-Gg: AYBFou2qJzmSgijtTQsEhOVnsmAtI4VLvNplXh303yeb0cwgqwpzsmfAD/bqpOT5Dw5
	g/X4Vjb9IrAS9By8kbhak2YO1xeyv8Dxd9WYrH5Nv9GW3eb2dYZDPinSMoa7ci24hICZSgrrEX9
	JVjKyOhh6KtouhPLvukplFIG3JOW6VCnIhis0CSg+ngFGBjeO4/9Scdgg3rHhuL1CE81Q4UNo9P
	E0ALnWzCsPawKgZdpAe/jhscO4pVN9r6VGEvjT7VvA0B6TjwrC82C+5OkowxCeqTT9RTsWUp+TO
	EHS4PJMoYkxlkgt2uCE9qsEzwufDbcJS7TDbhB+4v9KnBtlrb8NsHefMoOvyYoCM9Zg=
X-Received: by 2002:a05:6512:1594:b0:5b6:1883:b1ab with SMTP id
 2adb3069b0e04-5b8a0316203mr1637721e87.40.1789230442661; Sat, 12 Sep 2026
 09:27:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908094416.10534-1-linkinjeon@kernel.org> <20260908094416.10534-8-linkinjeon@kernel.org>
In-Reply-To: <20260908094416.10534-8-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sun, 13 Sep 2026 01:27:11 +0900
X-Gm-Features: AcwNN1U-uwtH-SsAzQogY8RDkB2r2Fp8_aBBKnfP8nUxpQr3TUEqN37rWosWgaE
Message-ID: <CANFS6bYJEWH=r4XpR=fqNqT3uHrbc7S2k1VbaRy_asRWHorwtA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: unhash failed inode reads
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 8=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:44, Na=
mjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Remove a newly allocated inode from the inode hash before discarding it.
> NTFS may set i_nlink before a later initialization step fails, in which
> case iput alone can retain the incomplete inode in the cache.
>
> Fixes: bf6be898fbc5 ("ntfs: discard inodes that fail initialization")
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/inode.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 5f0201610e2d..cc0e3271a85d 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -170,9 +170,10 @@ struct inode *ntfs_iget(struct super_block *sb, u64 =
mft_no)
>         /* If this is a freshly allocated inode, need to read it now. */
>         if (inode_state_read_once(vi) & I_NEW) {
>                 err =3D ntfs_read_locked_inode(vi);
> -               if (err)
> +               if (err) {
> +                       remove_inode_hash(vi);
>                         discard_new_inode(vi);
> -               else
> +               } else
>                         unlock_new_inode(vi);
>         }
>         /*
> @@ -232,9 +233,10 @@ struct inode *ntfs_attr_iget(struct inode *base_vi, =
__le32 type,
>         /* If this is a freshly allocated inode, need to read it now. */
>         if (inode_state_read_once(vi) & I_NEW) {
>                 err =3D ntfs_read_locked_attr_inode(base_vi, vi);
> -               if (err)
> +               if (err) {
> +                       remove_inode_hash(vi);
>                         discard_new_inode(vi);
> -               else
> +               } else
>                         unlock_new_inode(vi);
>         }
>         /*
> @@ -288,9 +290,10 @@ struct inode *ntfs_index_iget(struct inode *base_vi,=
 __le16 *name,
>         /* If this is a freshly allocated inode, need to read it now. */
>         if (inode_state_read_once(vi) & I_NEW) {
>                 err =3D ntfs_read_locked_index_inode(base_vi, vi);
> -               if (err)
> +               if (err) {
> +                       remove_inode_hash(vi);
>                         discard_new_inode(vi);
> -               else
> +               } else
>                         unlock_new_inode(vi);
>         }
>         /*
> --
> 2.25.1



--=20
Thanks,
Hyunchul
