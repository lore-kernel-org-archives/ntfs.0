Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3047377A9F
	for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 05:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548313; cv=pass; b=RFlqvc64gF0ghNSWrR1jQT8Sa7Ibi+og24Xesuzb/2wM/av2tu2hyoIJMsiY9pqNsIuaItDdzLfvP/+/BRoYgbSDhNcicb0Pc7RiOz7SwAQYEDY1ok+mxMAv70N3iY5yyCjEm+L+CnkNZ8Fm16WjQNu9r+gTzI+MNV3pDG04AnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548313; c=relaxed/simple;
	bh=LA4eAT+67MfId3JsD1w449rI5BVOnKs9loog33OqYI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vGcTnKz6zA4TGZI059zoJmYje5/Ms864xifmjw9H9kxOgOK6LVk3k+XZwfRfSh5eGUwQBGSSXhflwsK/2yHHGzSfRX1/oL1aAA2mh930dxCwaIW3brsZWIfVeFQElCpTO3RooQRS7Ab5L28N45HrHo62FMHe2mlhk4iKYL+KDlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMiOBog7; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMiOBog7"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b15c6fb864so2308859e87.1
        for <ntfs@lists.linux.dev>; Sun, 23 Aug 2026 22:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787548310; cv=none;
        d=google.com; s=arc-20260327;
        b=NL44IudNxkQ5fvzVM4+VnnG845gdmZ43ZHaL5I5QLvrpO2PbzLw5E5isyl34vpTRjf
         i7Y4jfonKSycoV5mRF9qld56pQCS3dkWbMmDYXiauA5AQ1rQs/+H13S91TxpysQNN5Ic
         O6ukDntjtbT6QT2X0ZtxIO3CVgAzoOI4LdGEZIrAVe9gzpHE444OfnpTKJCyKRsBw8xD
         hQNQBhkjSO5Rxi++Km+H5eiuNw1hO88oMUpENvks3McckYNCS6/jGIVkGvz9sCPeEVmG
         aW90Zjp3iX9euyl7bFK3jpLBvg2Hc23idgl5cGLzOBGqRKvGxQu0LzTSQHrCA7Frdht1
         y1yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VFepY6OCHDX3ygH6t9ADqnojg/LPbIdWVjjoE4zjX7o=;
        fh=6WE182c36rHEOQ5KxTkxgPU8oUMEPXVDHnn4jmboxjo=;
        b=YAhWzxy0umd6PLfsLylBKGwlnUfx0+IugihKX8PhsrdPQR69ZLxaVonBUdanfTpKIg
         MNtvFPgvLLPU9HX3u7G6/p/keBZ83yPOv5KJP/wU0oI6iie4ZL9Ef7CxoUpSzLhquKQl
         aMPmstzAYjOD2aN44FcUHSLMav6ikXVKHVQrHQAhF2fWPIvZS1r6AnxxfGMyScm/Ahuv
         MLzB1eqNdUclAwUYxerL3YFcA3WeQ9EdEkUxQ2jaQTgxoUJkIcso5+ww6I6oltQe+kTw
         SZ7bBKB0ZtKPIs+AVHIxdf1plRp2LRw7YIRRJB9jlxC1FpVu6fklE+BAVJhEstcDFEYh
         qAmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787548310; x=1788153110; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VFepY6OCHDX3ygH6t9ADqnojg/LPbIdWVjjoE4zjX7o=;
        b=nMiOBog71gtqgF4iS1EHxBkg2WX4UxughjiCOxvMMJC67NfNl3RXfTon7vjjsW2q09
         0QXQBpRgmlomc5Fc8Y3cfBFPKumo9hC6HcTLYN7wVILUD3kQ3UYsYBR177IlMVi0k9Ic
         p2n/YNRpZKkG0xAH2HQk5Nb09zdyZUl38wlJ5kj+HuqKFfCn0IBQzWB0yDTYrqM6XxgU
         a+ioQ2VXEqgf6oxZYXt28TtN5EnDVdmRbHNtLiC26DDRCinC83n2YXr3VnBAQEjoy7dW
         XQiJpms7GH/llhLyqp++GB5bEcba9PKexMUAk02IS0OdPLSPvAY0ANb92VM4HCYC1zsH
         wAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787548310; x=1788153110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VFepY6OCHDX3ygH6t9ADqnojg/LPbIdWVjjoE4zjX7o=;
        b=WZzm/XGtly3tJzX4+rMZBQKQLrHgrMiynMD+3VrnIYy2rOvz+RlZtS892u5g9qfXol
         DVV9WoJs+dIUGiP724lnGl1Up0Kg7fqe6s92tiiCqc69p/A/T95eDrvjdcY0QfgWOsOn
         dy/NnbBuKodSXrjVEuim5xVi0Cv1brAVPOSafXitxNM9Tz4XbQ41AgkTVb1u7ef1Htci
         NppcFlZH/iLJaJCUxg/4dCnBNPeg5OmnRDRVMYrhBLLuTEmyV09DoVIqQTLmqiFg199N
         B7714xOwbAD8Og3DunCaTFGCW57rT3DhklGDPnn8jtdfzoAfZSuaWzJPAhFcoPjkP6JX
         lxDg==
X-Forwarded-Encrypted: i=1; AHgh+RrYjpH155vAOXW7oGNLGBfgg9+A1whoevnwpuWW3Xp06KhFHunH2iMzuE/afQt5q20VQELb@lists.linux.dev
X-Gm-Message-State: AFuF++k8LpzqrvaZhGb3ESoJqRmFM2oLYnPIg9KhTdj/eAOKfnW31pSM
	iOf+B4bTjjDdDTxLxJyEhiYj7pozcIEVgCi2QBwJXZLtJUFxjiaMH57Xoly+XBWy2dwt2H13O23
	doo0YZ/jc0Iedzb6An/l/Pd4aPwQ1wWY=
X-Gm-Gg: AR+sD10eK15e7CaDzZcfCk1xj6D2/AFNV4W0CQtKqnx4gk7v+w2mw8PR1clHn2R2bCy
	BTTAC/DLMEiEtqDrQhchoi6sgwIH55TY2oUe2pSNV0zZy8m1peWvHklFDsuFffnzLHnoZJFOytb
	IXcj47qFghTfp2gvlUEDAegzlmZueuHxux+ARPoJ2sVlq4HjtAzdptPcrIv1SdNRm12LMD673Os
	5ileLc7vnNDLunGku3K+69f3AulCNmdWOK0dzRUL5TKFaPlCpnOPzyMX+4il6wKgkldySjcnoTD
	v8XtrPmIw6x5/EJyzYMBiUZnrSzJozxG/uGvC/ucJjGD
X-Received: by 2002:a05:6512:130b:b0:5b0:eda:de1c with SMTP id
 2adb3069b0e04-5b48b67d501mr4304922e87.5.1787548309896; Sun, 23 Aug 2026
 22:11:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821053238.1281310-1-liubaolin12138@163.com> <20260821053238.1281310-8-liubaolin12138@163.com>
In-Reply-To: <20260821053238.1281310-8-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 24 Aug 2026 14:11:38 +0900
X-Gm-Features: AcwNN1Xfn1PaCA_dyb-Q7ppHanMxoQJA7T6ypdUHnr5NTQmYb3TKV21aQQF7BDU
Message-ID: <CANFS6ba82SFbMdnSxqofYg=JdgkhhVFQg=OAzEoOFJ8JEPaOMQ@mail.gmail.com>
Subject: Re: [PATCH v1 7/9] ntfs: fix kmap_local leak in write_mft_record_nolock()
 error paths
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	liubaolin12138@gmail.com, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 8=EC=9B=94 21=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 2:33, B=
aolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> write_mft_record_nolock() maps the MFT record folio with
> kmap_local_folio(), but the pre_write_mst_fixup() and
> bio_add_folio() failure paths jump to the error label without
> unmapping it. kmap_local mappings are stack-ordered per task, so
> leaking one corrupts the nesting for any outer mapping.
>
> Unmap the folio on those error paths too.
>
> Fixes: 115380f9a2f9 ("ntfs: update mft operations")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/mft.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 984a0827f9ac..69b007e574fc 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -580,7 +580,7 @@ int write_mft_record_nolock(struct ntfs_inode *ni, st=
ruct mft_record *m, int syn
>         err =3D pre_write_mst_fixup((struct ntfs_record *)fixup_m, vol->m=
ft_record_size);
>         if (err) {
>                 ntfs_error(vol->sb, "Failed to apply mst fixups!");
> -               goto err_out;
> +               goto unmap_err_out;
>         }
>
>         folio_size =3D vol->mft_record_size / ni->mft_lcn_count;
> @@ -645,6 +645,8 @@ int write_mft_record_nolock(struct ntfs_inode *ni, st=
ruct mft_record *m, int syn
>         return 0;
>  put_bio_out:
>         bio_put(bio);
> +unmap_err_out:
> +       kunmap_local(kaddr);
>  err_out:
>         /*
>          * The caller should mark the base inode as bad so no more I/O
> --
> 2.51.0
>
>


--=20
Thanks,
Hyunchul
