Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FE442882B
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 07:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977558; cv=pass; b=IT4zIpo4ZUTilaBV+vedD6OX4TgNymHHn4XPdTRedBpAcyHIv+O6YAYe1k1FkfcfmLq2bY2NFCQmwEqpOsvWeq0MtZlBYFBBYJZ3M+5mf4NFeWq4vl437LaPfza5DbF/cZemY8L0alL/oX+0NREw8ery+8klbTvAkjjl9UbG9KE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977558; c=relaxed/simple;
	bh=I2KFHCsto5ktwcOC7Smw2RZRoRdPhzo99usTN0lCH4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+mnkkaLrIw3KUjvUmqy888pTv/s2zM3mYtgA919L0uBdgU4PDCUHtuNAcrcvglgFXBZIFfrTKL+5kMk2iOvJrdI1/N0EMCeRAV+/LqeTsNvzh5DT+VoRUwbnooYUcUNu8AE8kOddqP3NjQ747QrAuHdn2QWrTyUD1D9wbiyEEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3E0nTfb; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3E0nTfb"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c7a1aeecso1651328e87.3
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 00:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789977555; cv=none;
        d=google.com; s=arc-20260327;
        b=ULW+GsE/KJHcjaSM6yVazaIVcVYdmjvfazZrfZNi0T6f1G8wbIyUqiGHo0O4fGuYKC
         +ddtZxZbkyUncsk3v9BMYq+MmoJgPAZx/lq2Lg7Ngwo5MdWVGvwCOYn8rKfeHWFjGgdE
         DqyEu9YiExKLfkVFXYqP3PVa+rE0z8hEg+9LYtbm7vbDhddRA42JPBIFpZ7FGUo67NjK
         bIvtjAsqIY+XpWxkj3inKhvrIJX8z2GdcOE7HSEIdbB4kBAtiHpApJ+vgrf6WW46dV1X
         7JZY6Cey9fr0olgsYNqUGPzmt4iAeUmVUtZZi0qZlsyZhiF9bOhI9m9ihB51xPf5Yr3m
         JlRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3aepA27SIv41SqDk2ILO7FI1p6Gl+MGhkJvg7WvtfaU=;
        fh=rMw1qD2cBEmeDD6hTtDqdOytUxTo4akhWclfsz9GXBM=;
        b=AVLKk8Q0vvmwqKdDNyXmvdi+jPcskOzql0Lc6sqcltFZCFU0BIKQnHE68An2ZAxayi
         tY9mpBV+4fpsjOTl0DqrX8PTcUOE+jkZqfkyAZo/Fmeapkm1qXbBTiJ/JJs9zKtxDIIa
         d7jHBdMh6r0XouZotP5IGHL6aoZMN2cg5vhy9/UoedYVCDt0cBd0X/qjllkmLPq2aWIK
         hlpZW679OeFZ5RvhBab89CvXXQVIRXPv74ugqzy57e52gs22RcTLWW8oPjqXN1760iD4
         n0hRm38KtcFh7pzFCVQ9uC/nkIUrVRJJ8AlnIK7VaXz46tnHRk528MqK5+KlaUymCg6E
         GvAw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789977555; x=1790582355; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3aepA27SIv41SqDk2ILO7FI1p6Gl+MGhkJvg7WvtfaU=;
        b=V3E0nTfbfYG3AA+TMvnqBG9GgaZrNp023JJTNZZGRDs0FVkWRbpn91Iml2eQMOt0bG
         WXuc50NP7SMhWqi+Kt9so36IiG3MWmZao5OdEHVrWhyIZ0kZdIS6xILoBv1aHl4zxtzW
         Q5GuJvY97k4gQOzHobRTShHzB/kwI+O07NhD/CWpyCpvfO37QcD8sHSVzVAyrCaA1uXG
         8zXLGMOemEzU1cLC5gAU6USOWXII6oCI1bUcPwVDi+nwIKpiMwHtfRA0kaHYtQ067ynU
         Jkd5K0anUb90xIUdJ2Yt6GmF54hn6iH0gAzffIXE/xi4qj+MREaC0RVvm/Asd+Ce29cm
         fWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789977555; x=1790582355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3aepA27SIv41SqDk2ILO7FI1p6Gl+MGhkJvg7WvtfaU=;
        b=2Y8cPQryMNJUJPnWYC01JudTD3oeINRPaGc8EckZ6kyKAM/c5VFIOfkTA1GfNQ2e/j
         2HkayFckwoEzVsv9JJ4aerxzTfKGPYlJ9xrKDsKC4da+zcCuripP7XO0N6QBJGWMgUq0
         VL1fJvo6mSupJ/kzDgt2hBgG/+cNBl08rnqdQ9nngLPPx2tC/3ETx7nkr7+kOIMfwED8
         c3Mnipf5djY0l64olwx89K8Jq7roSNF+8piMuskCMhtzeLfHujM+bo9quZhjUvLpsbr3
         Kl6tdS/qdSo3l+msymx31vWcq3pTHjeq85vlxt+Ui+ZJPiA3WSjec5uAuXGsApcjo/rZ
         g7WQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCpJ1t5+wVMbcaT9b3eS8qLpgkEjjBRAvU2In4bMLfYpQldNmHSTZf+294MdzG28eWThXh@lists.linux.dev
X-Gm-Message-State: AFuF++ledXogWBSpfFehHU1UQ2NbociA59AVCqvUcGYUC78soqiRp4+D
	z1aep+XXoKFtzLFWhsuyhn7LtScozsIOs+0SDGehap+3XTWzGWNq57H5os+uI8reOmnNoWg9itK
	PUgEtdkuT9pVagtm5r1r6BibtODM9tZc=
X-Gm-Gg: AYBFou1/7DC429znTmAsgyetS0admd2G8AsZbPbTxRmeT9Rd+oikgakEwtSwspk1m2J
	HIIAj/EMTT3KB54bTqpt/4UKZEvxZC1IXHkK2H8w63bDm22XCZFwiEPSvHe6byh5+nTf5/DkrPb
	Og+evhto37ItpjMkwl49xp+FsNaRH0BmpgJ+W8+z9iZMv3I9SzChKL5COrDQj9B6NlrzP3sz5pt
	s+OHNGK9OHO6hqg/QoJ5YYBp893WUUqVlJx8DjNk2bOD71PuLKT4ieBY2Y6jr6IUV8oCiJWzNCE
	sfEjNRR0jJvwDPqw52d7ZLF/+ErhQJE+4+/52dgeFUMp0RzsPIVumLU=
X-Received: by 2002:ac2:5685:0:b0:5b6:1783:d7b1 with SMTP id
 2adb3069b0e04-5b8c17fe594mr3210051e87.17.1789977554310; Mon, 21 Sep 2026
 00:59:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260920063153.376958-1-wangxuewen@kylinos.cn>
In-Reply-To: <20260920063153.376958-1-wangxuewen@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 21 Sep 2026 16:59:01 +0900
X-Gm-Features: AcwNN1UkiQ_JkJL9NtBeCTb_hgmCbNBO3fvAM0Z6ss-_2PtRfA3QV5xcX422Ypo
Message-ID: <CANFS6bY7vbzua0K8DJ74Cps7WDmpWOfxozPA4cu9Nro_Zx3xOw@mail.gmail.com>
Subject: Re: [PATCH v1] ntfs: preserve the 64-bit FITRIM minimum length
To: Xuewen Wang <wangxuewen@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 3:32, X=
uewen Wang <wangxuewen@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The minlen member of struct fstrim_range is a 64-bit byte count, but
> ntfs_ioctl_fitrim() uses max_t(u32, ...) to compare it with the device's
> discard granularity. This truncates the requested minimum length before
> passing it to ntfs_trim_fs().
>
> For example, a minimum length of 4 GiB is reduced to the discard
> granularity, allowing smaller free extents to be discarded. The truncated
> minimum length is also copied back to userspace.
>
> Use max_t(u64, ...) to preserve the requested minimum length. The bitmap
> scan already compares the aligned extent length against range->minlen
> using 64-bit values.
>
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 8164326b7812..e315fed4d13b 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -866,7 +866,7 @@ static int ntfs_ioctl_fitrim(struct ntfs_volume *vol,=
 unsigned long arg)
>         if (range.len < vol->cluster_size)
>                 return -EINVAL;
>
> -       range.minlen =3D max_t(u32, range.minlen, bdev_discard_granularit=
y(dev));
> +       range.minlen =3D max_t(u64, range.minlen, bdev_discard_granularit=
y(dev));
>
>         err =3D ntfs_trim_fs(vol, &range);
>         if (err < 0)
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
