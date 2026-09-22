Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7A825B09D
	for <ntfs@lists.linux.dev>; Tue, 22 Sep 2026 01:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040474; cv=pass; b=IAWXhvq5steaFhmEyf7wo0oEZlF2lckgX4lo7ZRl2oEKMKclgZP/O38MyFWcyEYnlMkyUvmG9RX66CZUY3VP+ZalpvAyGCUWIULKeRL/W6Rg2eSEUGiZZH3kxnCXJBwpC9N7gfzRewevuQX0sFzNzSUk6XRpd1g2zLKcHAbI+Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040474; c=relaxed/simple;
	bh=4wtfyH2gbDISSQ847svY2Wn+BJSusPMW+7FuPi2R9k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdWN70KasCsWHRyVDOYA2OdN0ZANDHV6mH8+07vvfnAZkjDnBCwEAFRGo2qCBftYG/vFsa5fHS89WLBGhIFriQltXfS1jh74y6DKVhDoGMqrrGDR5pD0sDWpx5MuPzvPnxFjKqsq9dULfSUpsWoh+qeEulrI5uuxwUEaEF29rc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YE3vF9U4; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YE3vF9U4"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b899413537so5495364e87.1
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 18:27:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790040471; cv=none;
        d=google.com; s=arc-20260327;
        b=iYt48v0DVYN2ozNupCeFlEr+OnlQkf/Sijt96RMWgKGM1m3aGyEjZrls1NbdambsaV
         0v5ebdd1jx80MYs+lq08TCvLtj1jYBKHAltUjoNiJpNbDC7l/Z0RpFXPmECc03DguKAt
         HljKEPQIBzcBay0mzHcA2XPgWbI8S9rS36p2DXUIBKNPTSmM0abaZl5eFo8IqzLjv5PC
         wCS06hwOrt7qseCeUf80Kf35kbHwuAkX/hxfme9xWh8Ft59simR6qy2b/soHmLXlQbZK
         5cDUCx/+m4cWqtsXA8MgUQiY/2DQk52+Xw6V4MaQ0LNomWhrFNgd6rgA/bqGTYxfI8EJ
         H2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UpG2yA1GLAbDH5yPWIjoayJ5BV/uUuseomHkaAiaiOM=;
        fh=dSHOxmRMXhslhGgj3Vi8I96GYLhvKYlQ++jY589UJOk=;
        b=k81yctvBkUgD4kZikXYQvPde2Mw5CYbpp4lQJIbvl5Df+VVyqTpYpdydTQSs/3rdEq
         TXmeQ275ihWZdkdUw+u3Gs8MM2VIWtV99O06dVdtu+PJDlulPNRtGHJ9qDZFtpfOA0zE
         GYD95FDbvAXFeB+xuzRk2r/ReJYmTuxZ6bZ2SRNP5GL6B/2U4XzwXpDvdgAd5MJXXcEp
         Ipka//vuVzMgfDqPPbrRPI/lPruPIjq/5BaXGxIWr23+k8bocDrK+VTGbg358XsQ4uoL
         4d+rMgRqO6BJQijwMF5KjPWJbEdSgjd8iMWdyoYpqRfnSYo+rFNWCrOhbVkwvMMlGeGZ
         1K2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790040471; x=1790645271; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UpG2yA1GLAbDH5yPWIjoayJ5BV/uUuseomHkaAiaiOM=;
        b=YE3vF9U4Ob/Tp+s40ulnU8CLytGIAxV6SDMPUgfeVr6rThQphmbt0LeMNuzPzDekBx
         0ChF7OZ3lMCVZqhQyU7qJKrGEF9uOyrOzaAvMXIoMxWEYAngvxF4GVIecmy5qxBiZxWQ
         5Up5PnT5jB6uGJ521HjbTx6wfmdlZlzjNxLHuYQXEM2HuIqMJNcER3kyonzIevjZU0BK
         C4y+5TaUhp+W3x6bccnhUCWbqYA7NQep44+4rF4MHS1E1bELi74TbkjWNZJaGgjBZSlj
         a8HVLwR4sEjap81lCpezBd1h85ocmhifRvQp9NDNTWJ9u6hYsFDUEhvZBUYOCUAk5WU6
         Xydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790040471; x=1790645271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpG2yA1GLAbDH5yPWIjoayJ5BV/uUuseomHkaAiaiOM=;
        b=At9poAEasot9GZuc1zd3HBQXtuBMVlSWW+OK41p725Lat+9qrrU3Y+x2oNihZlv2ch
         poXJOv7RfKV++CZOIxROsEhHkSRA/MygceplQHEf8p7Vy4v5EGGSVdQlx7XdTi2Nw8wv
         msZGYOjVcgs3KlNvoFFjESXRaC3YBcl7b9GM0NC7nMxAtCOsKaThfw5NX+BaIVeS8aUI
         KRD0zKXWF/fg/oYycPjvx3CxgiUeJbm7Thb7OsG+73jUZJt6edr+8fF7nnThpX+T1ToQ
         XvGlhLyG4+TDrS1wvm/GakqTej77VAi938TUenjXeOCB04+50DRFpXhMH0m9f2OHQa98
         y9KQ==
X-Forwarded-Encrypted: i=1; AKwUvBycZ9veuB1hVNdqAcwrRmjIqGC9++xBN7ZUNPAgx37nL/DaIKjsw0N4RM6uLMOSm7tUOCgL@lists.linux.dev
X-Gm-Message-State: AFuF++mK1VJQpe1ZDcyVDR1d5Z8N7jc8mlRpzgdAyM2iQ6Yo4k7Sq7cH
	BKuWwKe4prGnvCHHrRfyXBtkxtpctFUs8oZCRzezakh+NEZJgH7IJwP5ZpARAjtIEkesNGnY6NG
	BXXIkHKwhUEfY2BSltYz5Ry8nOIye/ZJC6wE0
X-Gm-Gg: AYBFou2Umx2pIg2s7qfCl2BwyC2SPX0ZFfdoirzj6If19rCBfPdJOrzz+rWxAjKu3kC
	yHpGZBqiXzQHzSuvRkgKG/l0rNIukvcGcIhTuDB+gRnX27Ubs1jtGhhQk5Ww8kOSDo1BG51mNpu
	GrDcN3IRo45adC3+nMGkx4Fe2inIv0mslA5u8Bx8vh3KOK4i/uHFoeO4szl8kgst3mRv5UsOEB7
	F8D/JS7yVrck6rZKkRQX1tTxYwbrRkl/5PBS9kn2vrowRL2+iophh8efSkTFL+ZnibAXCsu+NrT
	Rd/gKID15d/zy4ThzKR7cD8vRfCXPvOmOx5pC2G+KKlemdz6tZkG+p+P
X-Received: by 2002:a05:6512:159d:b0:5b6:183b:d1ff with SMTP id
 2adb3069b0e04-5b8c1848f71mr3672886e87.38.1790040470714; Mon, 21 Sep 2026
 18:27:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921091907.1491879-1-zenghongling@kylinos.cn>
In-Reply-To: <20260921091907.1491879-1-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 22 Sep 2026 10:27:37 +0900
X-Gm-Features: AclHuK9v0-3G0OKw4yrT0tHq508ZFGF0ZOQDIAhozp-C_3rMkOzvG2J2yrfh04o
Message-ID: <CANFS6bayojT_K-8zGaZrbe_FXtRsjSoq6qTDChN6i0gi8Mh=LA@mail.gmail.com>
Subject: Re: [PATCH v6] ntfs: mount hibernated volumes read-only regardless of errors=
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 21=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 6:19, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> The hibernation check in load_system_files() only converts the
> superblock to read-only under errors=3Dremount-ro.  With the default
> errors=3Dcontinue (and with errors=3Dpanic), a hibernated volume is
> mounted read-write and the mount-time $LogFile emptying writes to it,
> although a hibernated volume must not be written to at all.
>
> Drop the on_errors term so that a hibernated volume, or a volume whose
> hibernation state cannot be determined, always mounts read-only.
> NVolErrors() is still recorded, so ntfs_reconfigure() keeps refusing
> remounts to read-write, and the $LogFile emptying is skipped by its
> !sb_rdonly() check.
>
> The check itself must not apply the errors=3D policy either: it runs
> before SB_RDONLY is set, and ntfs_lookup_inode_by_name() and ntfs_iget()
> call ntfs_error() internally on corruption or I/O errors, which under
> errors=3Dpanic would panic the machine before the read-only fallback has
> made its decision.  Temporarily substitute errors=3Dremount-ro for
> errors=3Dpanic around the check: nested ntfs_error() calls then fall
> back to read-only, and any read-only transition they trigger is
> preserved even when the error is not propagated to the check's return
> value or recorded in NVolErrors().  This is safe during initial mount,
> before the super block is published.
>
> If the check reports hibernation or fails, set SB_RDONLY and record
> NVolErrors() unconditionally: hibernation safety takes precedence over
> the errors=3D policy.  A volume with errors recorded during the check or
> earlier in the mount, e.g. when loading the LogFile, also stays
> read-only, matching what ntfs_reconfigure() enforces for remounts.
>
> Fixes: 6251f0b0de7d ("ntfs: update super block operations")
> Cc: stable@vger.kernel.org
> Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
> Change in v6:
>  - Temporarily substitute errors=3Dremount-ro for errors=3Dpanic during
>    the hibernation check.  ntfs_error() does not always set
>    NVolErrors(), so the v5 restore condition could re-enable write
>    access after a real error.
> ---
>  fs/ntfs/super.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index f4a73e45773d..da2c8f310a7f 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -1398,6 +1398,7 @@ static bool load_system_files(struct ntfs_volume *v=
ol)
>         struct ntfs_attr_search_ctx *ctx;
>         struct restart_page_header *rp;
>         int err;
> +       u8 saved_on_errors;
>
>         ntfs_debug("Entering.");
>         /* Get mft mirror inode compare the contents of $MFT and $MFTMirr=
. */
> @@ -1572,8 +1573,19 @@ static bool load_system_files(struct ntfs_volume *=
vol)
>          * NVolErrors() without setting the dirty volume flag and mount
>          * read-only.  This will prevent read-write remounting and it wil=
l also
>          * prevent all writes.
> +        *
> +        * Nested lookup and inode-loading errors must not panic before t=
he
> +        * read-only fallback has run.  Temporarily use errors=3Dremount-=
ro
> +        * instead of errors=3Dpanic, preserving any read-only transition=
 even
> +        * if an error is not propagated to the check's return value or
> +        * recorded in NVolErrors().  This is safe during initial mount,
> +        * before the super block is published.
>          */
> +       saved_on_errors =3D vol->on_errors;
> +       if (saved_on_errors =3D=3D ON_ERRORS_PANIC)
> +               vol->on_errors =3D ON_ERRORS_REMOUNT_RO;
>         err =3D check_windows_hibernation_status(vol);
> +       vol->on_errors =3D saved_on_errors;
>         if (unlikely(err)) {
>                 static const char *es1a =3D "Failed to determine if Windo=
ws is hibernated";
>                 static const char *es1b =3D "Windows is hibernated";
> @@ -1581,12 +1593,15 @@ static bool load_system_files(struct ntfs_volume =
*vol)
>                 const char *es1;
>
>                 es1 =3D err < 0 ? es1a : es1b;
> -               /* If a read-write mount, convert it to a read-only mount=
. */
> -               if (!sb_rdonly(sb) && vol->on_errors =3D=3D ON_ERRORS_REM=
OUNT_RO) {
> -                       sb->s_flags |=3D SB_RDONLY;
> -                       ntfs_error(sb, "%s.  Mounting read-only%s", es1, =
es2);
> -               }
> +               /* Hibernation safety takes precedence over the errors=3D=
 policy. */
> +               sb->s_flags |=3D SB_RDONLY;
>                 NVolSetErrors(vol);
> +               ntfs_error(sb, "%s.  Mounting read-only%s", es1, es2);
> +       } else if (!sb_rdonly(sb) && NVolErrors(vol)) {
> +               /* Match the read-write remount restriction for recorded =
errors. */
> +               sb->s_flags |=3D SB_RDONLY;
> +               ntfs_error(sb,
> +                          "Errors were recorded during mount.  Mounting =
read-only.  Run chkdsk.");
>         }
>
>         /* If (still) a read-write mount, empty the logfile. */
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
