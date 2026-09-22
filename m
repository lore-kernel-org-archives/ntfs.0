Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D09436D9F9
	for <ntfs@lists.linux.dev>; Tue, 22 Sep 2026 01:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040430; cv=pass; b=QVihkjC90uXddIL5UpRJLzhT9ZYuBPCsNL5f+aN2MegyF5SnrNAGhteNyeQV7mp/SFZOL2/YCfZage2B+1f27RJqk+2QQdbJ6JRqhD0Vrv9JRj4VOgHLjpB6hQT+jYT92xtT36Nijen+xZEJuRLW9HxyN4rvBxsViuDZEhjPLmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040430; c=relaxed/simple;
	bh=mGJzwjWcciFg/IdZoQQK2Ap7EfoWAClw2S1eI36ylWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swrw8dRuNMrz3JJ+VePb2gfXf1a1pd3Ivbuwvo3Dc5rof9utrqPLmZAz86GbAJimCTUii54eBb3b6hOTw3gklmh2rfK1qpPEDYtbvYEYmRzRNsbyA4lPLKLTPYx3eQ9AyHjbE/XJxQzP5eZObjQqrTk4YV1xYTdaZ18upQ94lmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkPwZUR4; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkPwZUR4"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b74e0c2e4dso3256921e87.0
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 18:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790040427; cv=none;
        d=google.com; s=arc-20260327;
        b=MdS9nDIr2lLzFszDHZs73huFM1RqfmVKr59QNK9LWCmKu0ZwrwMuYWzs/fAuGeERpC
         61HaSj7a9JsBQPqLtRz+loOTzGgBwwtuRZyBGtCa0iaEqwEc0ARleOFAp7wNLYw5btso
         ds1wQVMLQB/xEsVn+vnm2wsSkOSHhpMMGDpknngu+894/+p0EzE2FZrZpV9xM84LukhG
         Jn7il07ufTYcxeAhvA0uuBWX6jyIwzJ40Yz/IjQZEIJcAZ8OIRTRH6dzw3Ote6J06JAC
         EHNkf9gU98Cf5RTD1WjfQAv4nAf3JgbKL/FczGZr65MZMiUAxzUPvk/ODp2LJ2AW+TUx
         TFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BANAs9OhClkxmYfYq7iCdVo5PmXyftur4GxG4QYIy6k=;
        fh=qKRBojjceh//4sOPrBkV+VZuQCsqgC0QDPdCemGefEo=;
        b=okbXv59wSYW7HxMB+DspORIEPn8ZQkGFckJZ1PKfBoBhbOOdIoo91Rg+KRlFBtxvsW
         LDE9gfivHLHPFPnNbAvVFmEI5MA3VoDRz1Kzl3O/wAPkCCX0gRuEDwk6ksrZNvB/KXRh
         AdAQGbc5hvKfuq0w2mbHXMgqwqUv8/SKKPMjDcogJ2JoAI3JgFwAMPfj3+oWNn/z+NlD
         TKtzkx+1ORtI6ONwxk7kx6y4km7rDhsqMNbO5DG4hC6YqxItJlxEH4F0sL1+wk7g2eiL
         T2NS5Qejl3c8OXGkq8mPN9610x/fltLx6fmJTXUzJEWmRiIZfU/ezjQGpErrCGO6erfN
         s5qw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790040427; x=1790645227; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BANAs9OhClkxmYfYq7iCdVo5PmXyftur4GxG4QYIy6k=;
        b=AkPwZUR4LiFMWaWEMe/aTb67Sx9sgHZLSKRMjggFgtMdmaElzXq64cl9s5XejkgSHF
         vlVykH6whVKq/UeRDd0R2rW8HWEdgWjkZjxf/DCOHtXCfuYikJcBUOKhzl+EqxhUEMfV
         TWWpA5IrclQAqU9DfnXb5Fn02CdaRQWtkFlK+/GCWWvuJ/UbTMOdJ35bftZb2WM7+VQY
         hmhc7c064R0Sbt4DRkr2q/oP9uub+2QQy6Iz6pnC6vOaaC6m+MJ1VLSmJiftNalJztZd
         Zi4ZPh2jYkMduV2WNxOWZzDE96nz8MBYGD7u2HHeN07Fh6TRgFxlyPU6UoFzbQqI6meg
         Naug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790040427; x=1790645227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BANAs9OhClkxmYfYq7iCdVo5PmXyftur4GxG4QYIy6k=;
        b=Odao+Ib9nh4uKIvSkkvPEi0RkGAzk7VLMO1ebT5ZRWkHzTKVayEzcFE9isblKrYPLk
         0jjajjxpYU5maPv6GlvReECDoc8t6b5G5/aBYVDv97XRPQu3obBZ6rZ8moTeZcVOJ0+s
         GwZnwqHnnmMIj0heP9rnPyMj23zGCkE1Ako7htoK08fpDsR5lspdspMQIzvmy4XkWyfg
         G7U7+iztJvEpQz7WmcmtoekSrx8CdLCkKzAje512uogYDD2n3Ukd1BbMX3sZEQK0jXkv
         vHUkro4Vp6KgOr2TM4PA2d0dV5w7QT42vB0tXrnyLMleEb62I4yfG7C3/UBya7yQXW5h
         gL3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwfzLPD1IXPjsdCMv7hjspfFkv4w4ESB5123vbDkJ+55SJWAQDFGzVaOKAtqO1Zgut85gnx@lists.linux.dev
X-Gm-Message-State: AFuF++ku3fCe2Re4G++q4jwZikQ3b3kJF+eEPZrRMCtkDYHHscQ+sfsq
	V00zx5O06F6Qx0raEfTiWukJaQmpghHEU1NlzKBpbXWz3K3EB2cLjC+ZeiCySdIIf8t9OX3ylfQ
	In16wM7sw/rsuTx8UPXEVEWK5vVJhDyw=
X-Gm-Gg: AYBFou2rKWX2Ri7sssmYirNhhoUgKhjayK7dDSmDxVgBc3EMivM00DuovJvQVirvd82
	9VYl2DuOh0Z/BowrsahUCukb5qNG/ZkUT6RycoxLRN7G7prRKD9UF7Nll7EujFYeG0khl+a/7oU
	W77DMnJtCKUhR3EondIjJplKQb+y5jfc4bcHqWEGU6eiRq+f9h84eE6XNjgQcQNFgnZ8QSUx3g/
	On4QclWmRiqNT4ERScivEZgZdzdPaFs122ec6CZq1cwfNakQ0E+KE9D5SoZaeHLOUmOphKahbE5
	s2DK52ftdC1zQiEfADef7FMcaK4JEa5FNy9t+oZEDotPmEHAEQK+mfV2
X-Received: by 2002:a05:6512:2396:b0:5b8:bc5e:b576 with SMTP id
 2adb3069b0e04-5b8c18521ddmr3616977e87.46.1790040426727; Mon, 21 Sep 2026
 18:27:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260920025955.31209-1-zenghongling@kylinos.cn>
 <04255390-4133-4e8e-81ad-4d2402498431@163.com> <CANFS6bYLBPr+FmE_MVWxBBMw+Qz55EFfy1u6UmBgkTak2CMyvA@mail.gmail.com>
 <4e70c6d0.7644.1a0c34d327f.Coremail.zhongling0719@126.com>
In-Reply-To: <4e70c6d0.7644.1a0c34d327f.Coremail.zhongling0719@126.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 22 Sep 2026 10:26:54 +0900
X-Gm-Features: AcwNN1Va4nHWDaoD6YaeJdDBsOK1DZQvNPVRpGTAPEu1genIzPZ2AwReUginLuQ
Message-ID: <CANFS6bYMbh3oJbSFdFzEOp4NpZh7YmagqamYXTw8iHueFm6KUg@mail.gmail.com>
Subject: Re: Re: [PATCH v5] ntfs: mount hibernated volumes read-only
 regardless of errors=
To: dd <zhongling0719@126.com>
Cc: liubaolin <liubaolin12138@163.com>, Hongling Zeng <zenghongling@kylinos.cn>, 
	linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hongling,

2026=EB=85=84 9=EC=9B=94 21=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 6:30, d=
d <zhongling0719@126.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi baolin,
>  Thanks for catching this. I agree that temporarily setting
>     SB_RDONLY
>     makes it impossible to distinguish an error suppressed by
>     ntfs_handle_error()
>     from a successful check. In particular, errors from optional WSL EA l=
oading may neither propagate through the hibernation check nor set
>     NVolErrors()
>     , allowing the flag to be cleared incorrectly.
>
> Hi all:
>    One question: with errors=3Dpanic, a corrupt $LogFile can still panic
> during load_system_files(), before the hibernation fallback is reached.
> For example, ntfs_check_logfile() panics on "LogFile is too small".
>
>    Should mount-time metadata errors generally avoid errors=3Dpanic befor=
e
> the superblock is published? If so, that seems like a separate follow-up
> to extend the temporary policy substitution over load_system_files().

As Baolin mentioned, I don't think that mount-time metadata should
generally bypass error=3Dpanic.

>
> Thanks!
>
> At 2026-09-21 15:57:29, "Hyunchul Lee" <hyc.lee@gmail.com> wrote:
> >Hi Baolin, Hongling
> >
> >>    If you agree with this approach, could you please incorporate it an=
d
> >> send another revision? I'd appreciate feedback from you, Namjae, and
> >> Hyunchul.
> >
> >I agree with this approach. It looks sound to me.
> >
> >>
> >> feel free to add:
> >> Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
> >>
> >> Thanks,
> >> Baolin.
> >>
> >>
> >>
> >>
> >>
> >>
> >>
> >> >       if (unlikely(err)) {
> >> >               static const char *es1a =3D "Failed to determine if Wi=
ndows is hibernated";
> >> >               static const char *es1b =3D "Windows is hibernated";
> >> > @@ -1581,12 +1594,25 @@ static bool load_system_files(struct ntfs_vo=
lume *vol)
> >> >               const char *es1;
> >> >
> >> >               es1 =3D err < 0 ? es1a : es1b;
> >> > -             /* If a read-write mount, convert it to a read-only mo=
unt. */
> >> > -             if (!sb_rdonly(sb) && vol->on_errors =3D=3D ON_ERRORS_=
REMOUNT_RO) {
> >> > -                     sb->s_flags |=3D SB_RDONLY;
> >> > -                     ntfs_error(sb, "%s.  Mounting read-only%s", es=
1, es2);
> >> > -             }
> >> > +             /*
> >> > +              * A Windows hibernation image is not a filesystem err=
or, so
> >> > +              * this is a safety interlock rather than something th=
e
> >> > +              * errors=3D policy may downgrade.  The super block is=
 already
> >> > +              * read-only here: the temporary flag taken for the ch=
eck
> >> > +              * above is not restored when the check failed.
> >> > +              */
> >> > +             ntfs_error(sb, "%s.  Mounting read-only%s", es1, es2);
> >> >               NVolSetErrors(vol);
> >> > +     } else if (unlikely(temporary_ro && sb_rdonly(sb))) {
> >> > +             static const char *es1 =3D "Errors were recorded durin=
g mount";
> >> > +             static const char *es2 =3D ".  Run chkdsk.";
> >> > +
> >> > +             /*
> >> > +              * Errors were recorded during the check or earlier, e=
.g. when
> >> > +              * loading the LogFile.  Stay read-only, like ntfs_rec=
onfigure()
> >> > +              * does for volumes with recorded errors.
> >> > +              */
> >> > +             ntfs_error(sb, "%s.  Mounting read-only%s", es1, es2);
> >> >       }
> >> >
> >> >       /* If (still) a read-write mount, empty the logfile. */
> >>
> >
> >
> >--
> >Thanks,
> >Hyunchul



--=20
Thanks,
Hyunchul
