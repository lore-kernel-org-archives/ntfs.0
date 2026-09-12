Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545BB38398F
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230405; cv=pass; b=jZG6Hzb3EWou428srB3dFPEOIktYZFI81ASkQbl/BaYoD9WsQHRRBTwFx7hwn64zt8Q5zJuVR2p9otbz3kk6svka2gw1P7CeZvq+zmywyaXSroqrNkKPp+GnhoX7SEykgQhQQ+goWmnRFm7NbNuCWRhA5L1OCsVfmR2M3HvYF28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230405; c=relaxed/simple;
	bh=qZsLmJXcNVG3Syn1W4upwt/EF88/aIJ4XfedDRjUKH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kp8oavWuxo5P62c/vhcmGkNY7joqXODXvjL9NaMsqWWbL0btqQkl0+Wf4+/dNIG6Oc/BUwzPApdDd4kqhGWuS3VpxVrc+V3RpiexN7hoKMlhC6aLROOhDv7+wEMAypWmePv2SlbFfNliBlquLMpPbmcF6ACn/D0dpcIhfk82nrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aafZ0Eml; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aafZ0Eml"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so972093e87.1
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789230402; cv=none;
        d=google.com; s=arc-20260327;
        b=MtfIz03U7DsskyHdDrUcNcZrJsJzD3/5g9WHDoYQCic4ZWGBuxCZhYefaB/PowKz1F
         Dx14TS42PlfbNjW8/LQ1CSOUxCSPyjVAcUaRWTku7cyYIJYseu89kXXPvZ3Ia8lfEQIg
         mwyvKLVOclcPSEP1KBl3lyQAWZuyoj9Qfur/3mx3juuiVgJjhp3Hk3BJ0rdgj3S0jtwn
         Ln/h/Bj8CTxTM4A5tTcAVqnca5Blt/LR0liG7J+eIIGD8I+ITirHwyMNMf1zYH+fOtwq
         1lv2XVGCxVlo8SBUBK261RpNZBWOkDx76nsmKsZuIVnZhgQdD875ZhJkLz2wbFCt7S6Y
         WdHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9cO2XZs7kin2pWMvbXKGdDLu4fqPsCSwc6wnqWVMNKI=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=GaZhjpClktGurpn8tyAEtfB5dTitPSHN11DCzl4QekcyWFX629rS0JoBW9wfJtwMQN
         0b3hdvi9roAvxBMkdm8DIL7BwnegDlATTJc8sT2zQQBX20bAw6nZcpMRfMEijqG2ilZ7
         5hkmw2I4gLvcRQnhZMmTeOrHF4yRYJnb7upUHLgpRlbNwP34B717z8NiJlUuc5swwA9t
         1lJ7mm0OTdU54i2/v96SPJOLn+X+Dkrtmep/T8KPak1Jafz2qxyYpVNNm3XE3Ldps6M9
         BI+2BKhnMwNvfJwRojvOj493x2MAYVUviE3UsvYkejr+8eLZ6k46jbfBoWp/XpCtIKq0
         IkYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230402; x=1789835202; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cO2XZs7kin2pWMvbXKGdDLu4fqPsCSwc6wnqWVMNKI=;
        b=aafZ0Emlyscos9wvPQs0siVesOlZ6iu/9icxZCmmAFy1PofF1y9XG7DQFHUiusJOaa
         WOry4t/bGERk7PnXPCAbsiU5cIZsPT7vRCVrQyGuRQ8gEPWaY6lJ+41yRWnHZyZPZgB6
         gRSN+KGGMYCo7vmqWfH7IivIMaotdf0UcJr21sB5YCOxWrnc/ihqTDs2UWG948pHXdkL
         RMux3CZYMzsarmieudnxcEbKZviWRDazspLAfHtz4dZlLQSdBHc3jHaABJw1hpKgz6tT
         U7ffWWPeDiywYAp6Auwrcy1561/mabd1okhG/mVJCmnsh9YzUyGbZ74XnUd/FOODGrJ3
         ykUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230402; x=1789835202;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cO2XZs7kin2pWMvbXKGdDLu4fqPsCSwc6wnqWVMNKI=;
        b=Y0zguidyMvUsP3bRBihIn04xCjMLsSz2GGoiCDGVIVmJ4Jl39TudLJPrPmkRFuMNBO
         J0JYSgUkJ+smiCdtXr+4lZvVBSpG5t8N2VJ7o5oJ/egrEW+8Cc/8ct51fQQMOAnlCDGc
         WEGWMESeBaPsSTbrsEMkp+r455BbdPq0Trk+UJZ5mxuA5zfgAGQuzl4d9p5cXknZA9db
         H0thrhOPKm/QqAjrQnOJCE/9t0eQHHH+DeWhxTltuCAOWLPGLf//IcDVOSJuFFzo1UhO
         IhmyFovxASm5+O90PB4qOUk/BW2NMneEtfS32re8KQNjzCQ7yryOAIxIjhWU2dqHj+9K
         +Kcw==
X-Gm-Message-State: AFuF++kIgd1P0HoR1NnGKJSQB9etqg5/8tLp4dZddkxilVcXYpYgUydt
	8d73vnxv/pLoW6p1rPkEaguJewrISG9YIynbfBXYUbOmxIyWYJoQk7ywWe9P+rEtwrvJfwyxpYc
	s5W/jd+NBcusi8UrcXZiPLFyR4DPDpk/BY+9n
X-Gm-Gg: AYBFou1aJ+rBPIzs6i2GRzMgSgX+xdTE4FvjF656wsN//S+xX/CBB2MTTOOMc6qO3gk
	3RnxS88vAppO1QJprAYj8ugS/Jd0ITPnZgQe5oV62F+l96opdb3gVJ8AFMsmt+wYzq0m5rmKV+P
	crGApiMLYzKn77txttis84OC58sQhRjkIokTlv78Mq9DYTkwBuzKGe/z3KjKITy6pe7IVOccGS5
	6iBwQp/Niij1bKCydY47FmmTZLuyGm6K1a2t/hVRmg6A/oN8Rv6o8BoBAhRiX8Yp6HMs0UEhDvO
	3URTfxForumKO/U4WWQxco0jjZS86THiWbI/yPqWyvVt+9Hlt40UvuDD
X-Received: by 2002:a05:6512:2344:b0:5b4:ab2f:5bd5 with SMTP id
 2adb3069b0e04-5b8a02fa1e4mr4145768e87.8.1789230402151; Sat, 12 Sep 2026
 09:26:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908094416.10534-1-linkinjeon@kernel.org> <20260908094416.10534-5-linkinjeon@kernel.org>
In-Reply-To: <20260908094416.10534-5-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sun, 13 Sep 2026 01:26:30 +0900
X-Gm-Features: AcwNN1VT1Sp3GhcZzu09IG4rFnKQOxH4RSKN-VwPxr_E5SzPU54nTAJT3rh3yBU
Message-ID: <CANFS6bai-KbVEubx+DuHHp+7kbPPOCZ+6D9QbP+qgq20WjOYfg@mail.gmail.com>
Subject: Re: [PATCH] ntfs: propagate folio errors
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 8=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:44, Na=
mjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Return the error from __filemap_get_folio() instead of replacing it
> with -ENOMEM.
>
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index d1accde6d7c8..bb97cc6c6ba7 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -3714,7 +3714,7 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(st=
ruct inode *vi,
>                                         FGP_CREAT | FGP_LOCK,
>                                         mapping_gfp_mask(mapping));
>                         if (IS_ERR(folio)) {
> -                               ret =3D -ENOMEM;
> +                               ret =3D PTR_ERR(folio);
>                                 break;
>                         }
>                 } else {
> --
> 2.25.1



--=20
Thanks,
Hyunchul
