Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B322331EA8
	for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 05:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548152; cv=pass; b=FyEqlSO8Jpc3ZPYMTZ2WO6Lx8uNunCH0+jRMtroJ1cwpnF/5vpwB/skAPDW7w0E6uwNPe0ni4Np63Ih4lsVVt+jDNHlK1eIhHwGEsp0uNGsSrZ7uZCC6REYndoynk60bCrMYzzpmWSU7CG3dzpwdcKcwOZ+/DDxIEDXeznd4KCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548152; c=relaxed/simple;
	bh=oPnJoYRjsNPA8xg6al8HI9/9f/17eJKIUxWHpf9q3hY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7G13VR1lv/YJZV1qCx8jZQBxdebj8xmpaWzYZU4NQjC0F4F+jqHcWjz21BykrNtPWVycLrP/7uM6QdpFW4+dv9+0BhWAsopdR/IszWq2OVMvnQtpcNRanaxYz1llekEnszoGnbFJsN+gNaFn2BT0RJ/Euse0uZOU3Ta5fmItME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXHjyWjV; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXHjyWjV"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b29599b81cso3718865e87.1
        for <ntfs@lists.linux.dev>; Sun, 23 Aug 2026 22:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787548149; cv=none;
        d=google.com; s=arc-20260327;
        b=ijFq+MXhMRTDwE4e/SR2gHia7XBZxrW/NhvjGE53X7heJd79SsLADBPADIxtvwj7kG
         K4GB/+OqlPzCLi4KENb9MUk0ZG2yjaKTAZ4fMtDL/XztIGfmPThXw4bvwcvNItDNuAXv
         vIdFx7cCfTfGlOZClAYD+6TOyeoE2UNuF8Us0g687haY2YKnLSa3/4jE43JFB8ScIaTx
         cmF2Ky2PlYIlg469qyQqIoaKyJ7gEoLuOuypJAAUvOWXyoVNfnm8y7Hlf6xohErIh5IU
         u1NqJLcsXxzyAf2MFlF30yAVA+H0gmN35Ijd71dx7xHfqUhCUFL7V49oXRF9UTjIhE+h
         F/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BpAjc1lkb3aji+6OoovnhPPrlgUdpHLBfYHpVvjp7ko=;
        fh=RUlbyqponndMw1hWZCVnl3E7acgzessgNd8BoU/gH9o=;
        b=XJd41HD/V4VPKJSLgicrngsJ0DHMeha5RPeotDBy9cd+hdu++Z42FsNWdX9g2t1NyZ
         rNHuEOjaY/LMFSkEKHFcw0psPbUnPMvzHOrC3Y8ts+n0GDpkUp45HAYiDVkRweCsVAah
         mzAyrEog1EgryI2GriIAG2Q+G5sJtFR/wEyIQHDniD0qXtvAC8etT0r6XOukSg3CRabu
         OBtFWY1rpEXK+zAFYYuoz8MCsDYdsTmw9so7nIx9ukuJ0T6ovOB1hee3PORma+pkoIpQ
         RRIGeK0Pk+9qf3m61OhgWP8zE8D1NJy0dabQIWqVii3OJU+QSsWgFodtCv1t8a4ZJ1kH
         6PYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787548149; x=1788152949; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BpAjc1lkb3aji+6OoovnhPPrlgUdpHLBfYHpVvjp7ko=;
        b=HXHjyWjVpVPZdrNfYyS8Nih3+MA4OpsexJpRDZWV1RrbwpAsf5NhDhaGo8UBHCP/S8
         VceuGPvr5KlHawyDHzf3dDe7+q3cYx+CyU/a4fW9Fpa9hJXNL9OLwYlfrq2nzOszh82x
         aB1kStUztQVcQtcPu8pYA8gmmYESteFjVHn5cVX4i7DYt7APpqtowGIhxwvLkv1v9aNO
         VfRsQKFefY33IROoFhqD4CM/tZOlenbUtL/Y1r5b90IesShj/CiIr+Q9i8UD6CCcczz3
         U9AJ+OxJEPilZd2ewcHV6awTfTvV2By4Ai3HUyYv3eeQ19UpU9AByGyGMbgpYtkLODJw
         SStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787548149; x=1788152949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BpAjc1lkb3aji+6OoovnhPPrlgUdpHLBfYHpVvjp7ko=;
        b=SJSwtcJrB+7lzM9h0qr1NJNbWmeBEv3c9orB3V0e0am4SbKkDcNFZiCHobKyQXRptW
         9XUlGUX+MB2epREq+e34I9faJvQRWT/d3ZYNz3Cb/TaDjduTCF8i5rIGWgwXCDYlRV/i
         F3+KiCnO+/6Cu643YMSByQgo9HP4NXWa9PMwobxbO/Ic6Yfu6IJ7DVLnVQyXNCrVnk9o
         ZCuNhObgZ/GD9Cmx24MCpT6xKcICoOvZjuuL9Z0NS7QamQEVEsqaiLbjBkAeZMaSpVbX
         7m1s5usFdR2gltBawUatr8lH/2nui+nH83m8IyVPz7T7QQWZ8zj1jD442XFsBctcPmsn
         28Ig==
X-Forwarded-Encrypted: i=1; AHgh+RoKu3PkZJlCkQo2Hnwr8u1zQAX00M7LefwCWOxUnmx+dL/9WQlP3iOOieaBbCuAWUgR56za@lists.linux.dev
X-Gm-Message-State: AFuF++lUdqjPepiCAVi1Owx/ccYoNnOhedLmHBNE71HBuxaBy9aY7/Bg
	iHPwH2w68Y2q4a1KsCgq9/sd+/scRHVo5ZPxSvY1H5Z20Z4pYtQhtEi56uxmzodJHYMAHoSHAfl
	IE1trsnkQ1OfkccyHeBXxFGof7uHUO0U=
X-Gm-Gg: AR+sD12eJHUNO9f23QPCpqHt5R+D1izERb4pBqbndQalxKsU2NK73jxgEeaPYy9zOT3
	t/D/ZaqTSn4i9uLXdYOqUUQkShq5vECfa3kziVLHjfklLSYNxDi56YZHoZPm/GxGmgkV/qZhix9
	nC5+waBEVUz4mBNtm9R7ZW6z//2Viln0ptCZxuXQNh2/yZkTH8WRV3tOsIFYLQbzE+covw03Scs
	8ojzPTryLNoQXiEu+zJeq7WTwMDcWkpPEcZdU6WjdijgZDn6YD45AnF7UBFvln0pvXcQJ4Us2ww
	1NT0/PUQ+KhznGS7/pObIn0kR1AfLlwqEsPOPemon0fnnpFKdeRhDFo=
X-Received: by 2002:a05:6512:2398:b0:5b4:5352:e2b5 with SMTP id
 2adb3069b0e04-5b48b88bfc0mr4529948e87.15.1787548148475; Sun, 23 Aug 2026
 22:09:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821053238.1281310-1-liubaolin12138@163.com> <20260821053238.1281310-3-liubaolin12138@163.com>
In-Reply-To: <20260821053238.1281310-3-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 24 Aug 2026 14:08:57 +0900
X-Gm-Features: AcwNN1Xc7cD5fNsuuyBRRrTJ_gF0oceYk1kkDz5HHX1-doYdRLc7g8Kxu1Tkuuw
Message-ID: <CANFS6bap1ZRdf1HCgKq3XMQ-JwPrxJNrGdnBJ9zBtMNU72aoiA@mail.gmail.com>
Subject: Re: [PATCH v1 2/9] ntfs: fail EA update when reading $EA_INFORMATION fails
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
> In ntfs_set_ea(), when the $EA_INFORMATION attribute exists but
> reading it fails or returns an unexpected size, the function jumps
> to the exit label with err still 0, so setxattr(2) reports success
> without writing anything.
>
> Worse, ea_info_qsize is still 0 at that point, so the exit path
> calls NInoClearHasEA() on an inode that does have EAs on disk,
> hiding all existing EAs until the inode is evicted.
>
> Return -EIO in this case and leave the HasEA flag untouched on
> failure.
>
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/ea.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
> index 59e5e86e38e3..10d5b192f07e 100644
> --- a/fs/ntfs/ea.c
> +++ b/fs/ntfs/ea.c
> @@ -208,8 +208,10 @@ static int ntfs_set_ea(struct inode *inode, const ch=
ar *name, size_t name_len,
>         if (ntfs_attr_exist(ni, AT_EA_INFORMATION, AT_UNNAMED, 0)) {
>                 p_ea_info =3D ntfs_attr_readall(ni, AT_EA_INFORMATION, NU=
LL, 0,
>                                                 &ea_info_size);
> -               if (!p_ea_info || ea_info_size !=3D sizeof(struct ea_info=
rmation))
> +               if (!p_ea_info || ea_info_size !=3D sizeof(struct ea_info=
rmation)) {
> +                       err =3D -EIO;
>                         goto out;
> +               }
>
>                 ea_buf =3D ntfs_attr_readall(ni, AT_EA, NULL, 0, &all_ea_=
size);
>                 if (!ea_buf) {
> @@ -390,10 +392,12 @@ static int ntfs_set_ea(struct inode *inode, const c=
har *name, size_t name_len,
>                 *packed_ea_size =3D p_ea_info->ea_length;
>         mark_mft_record_dirty(ni);
>  out:
> -       if (ea_info_qsize > 0)
> -               NInoSetHasEA(ni);
> -       else
> -               NInoClearHasEA(ni);
> +       if (!err) {
> +               if (ea_info_qsize > 0)
> +                       NInoSetHasEA(ni);
> +               else
> +                       NInoClearHasEA(ni);
> +       }
>
>         kvfree(ea_buf);
>         kvfree(old_ea_buf);
> --
> 2.51.0
>
>


--=20
Thanks,
Hyunchul
