Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E717546D0B5
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 09:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796009; cv=pass; b=r/RRUvjtwc33+695APL74TQMoLVIY6Y6EXsOtdMeMuXC0XiWTK9sZcqezdT/cGDLTIhdrfwuGSrmUUR2E6xGFh/74IHhsU8+6b4XihKNunp4BBqMdk1IpGfeHJJS0awWxPa6wQOlGdHLFwwGEmXiM07YCi1iHivHl0vNlBbcl8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796009; c=relaxed/simple;
	bh=u6z0nz0rXLQD/d/++bl8nKXdZ9kodSiFoq2BerR4sr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pulpuajcgDTAkglqGHRWtf3XnXpoGUcLmSd/GDzRcsYFD+Zp5QgcbyA+XvjRhYx4GCE9OXUouwtUXxboBIGRXuPSq246Xf/IxOTDbauxn35qtf651zGPEmreWxRCyoHnV97B6Q4h1fQEORLBeWB22bqQKkxNc7N7IPBejdAvovQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbQcPBuC; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbQcPBuC"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-675ee8fe788so161642d50.1
        for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 02:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796007; cv=none;
        d=google.com; s=arc-20260327;
        b=hicwPGzJ9Ttb5pPOS5YeV8EVif6lXtZNg1T2ekFkrYMiHHC+3ltYEpuOvV0ctfO6L1
         w1Ho1AFcx0Uu9lJj+s/R5J7YYck8jg+9dLdoN1nTmkrt/0OdvEdSkx1vZSYrPL4Jxd2U
         dXsswZvC0V6nhm3H65cbV7vFzWyW6Y1vn7mleaOhMDGhjcoBsayxFLNz2xJGmTY/YWTa
         KnLAennAphO73ne/Hq49W4f8DkLQVdizf2+BQ9JvTkZoRciyOXrI/HJ0GTmaLQKA1W6P
         BHbOx5KyvP57BG+KJS2FQVckBFtYvMxWhYdj0IKTIq9PAjYyNMnvFyvVvqacZ5wGD96B
         HSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7DociiOpQMr/snyhgBdk+Kg98nBD7g+hHAnoUTnSy0Q=;
        fh=PbOaAQ3sATPxx0hTdZ3OuUja/CXssMmMWYpnkyIYMJ8=;
        b=ZgQ+1OOAN9MAFPMImlCtM1myFDoEpcq0u0yMDx+5X6fWKUntjeAD3IvE/ioxa0gFiS
         PNDIdFzIa3cvbRPk1uakdIY7roTUa5Ep+Q6nKXYBeAGui5a0ly6tz0+cVftbCDy4A0Mx
         TB5YOBDwspsi38SHy7hUjfWXIH2dOdbZxjiAX7MvjzBtJRb7hSvUaGJ+tJ0NAii9haBC
         CKSsmCMJJM1x40hhxd+HTHKnOBzbqrA30DZRH2S95TWswv32dHT+HVY+xGNiO0S7acbv
         QbmtzwMy7d1clMJVA+hss0PKZ4ZfCAbo+LuTXYRwY2/egvF3aGu52RHqqJTj29B+PUth
         t5DA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796007; x=1792400807; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7DociiOpQMr/snyhgBdk+Kg98nBD7g+hHAnoUTnSy0Q=;
        b=LbQcPBuC2Abkl9TRTaRLI13XaSTiuGZ35pH1f7u70CUKc2NCMO+UEVBbrLg8EtPUCE
         U/eVpfPrwm3yIwFUjPG1sHvgeX6AsyQXYruS6lqitRUZifZV0YO9vT2m1Ddmf1hiw+ks
         NkMdeVNIfcwWpoG2bvon+2bV6ujUZ5A73x/3yzpsOM+6MCRY5a2DUMt/eH55mG8Bx6kG
         UmERu/Vzk0FQyBtcOeroUqw75x6ypmWBytoypMKMPI0Ag2kc+mUs9PcnadbhO6Tf3Xru
         iQNR3YrAy6zRHmJyQTrAD8Hokr18f67y+K9OGhlKlrQ8lSUUJxFFyFKd99WIAi0inhPb
         UBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796007; x=1792400807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DociiOpQMr/snyhgBdk+Kg98nBD7g+hHAnoUTnSy0Q=;
        b=kIMi6LwopLDAa7Oslodb743RuykSw9V5oaCyqTwa5OsIJaJ18rZoVeJITEmgLz/L7t
         YcpDwEPkxnKcjzIeWCNq8mU5nSw+iiLgQe5F+cKZ8VYX0mQw0XUkKA8MfwNH+dpyVCQF
         uide/a7bUSMnJ+pxcE0VGV/oZN+Dr6fn7xPVvMnKzhqD6b042aM0I1RyG4Pg4UAk1oqX
         6L2Atb2LX8TXEGjopPuWJhw8wXduZwKFlaAbi/4kwPyVyuZk5AqK7aBO5kSpRqnA0R87
         PJ1IjIRAUgXQHZN+k0nzTNnGPM/+0qGKkblSZ8bnrElgtjJEPoVKCkN33pJQJLOMQOo2
         aw+g==
X-Forwarded-Encrypted: i=1; AKwUvBwIXDgmwZWK1FKlZ7aQFDdbLRenGEfz7f7kvq9vs4kbBdFURGzloqgs0wFN/fY8gZGy7g0W@lists.linux.dev
X-Gm-Message-State: AFq9FYKiekMezgmvbsmxWWJHZuawSvUIWRcTt/6qI/oXfX6yeaMZ2ge6
	B44TRAQsvbi7+zo4tvp6BFgoon7ekrDYQEFbu1EPhBMIah1HPBUlSaQtkcRMlhm7ZRSnbPPHJ8T
	xz1UnZytFfvj8JYHpFFop76JtZJpRsO8=
X-Gm-Gg: AYBFou3DdbOqBiq4Ag8shV2/FiAWiwgIhEMfNHD8Qe5BTuYXyACENNDLyTY9zdyYln0
	aNgUeVZ0WnD9JulJi7dNKaH0o6gT7SSxS9ao5gl7qk9NEtTYoog4u533/mweX0h7j/BymYEQH3U
	1W5ybmQhiCx3jZ93veKaUO3hk8So6MSGaq11fz4ttoX6nLXlZSqwhhqGRQV2plQrNnPaNpM1QBD
	/w87Yv61AJbHtjvkNQOwdBGFpsz0SRaiPZfVUPuSA7IWE2i8H5ZHh/VGmm9dpjJzumFGU4Rmg9w
	uyHNom8OiW3wuHlwgkLTL38WLhboi52rZNeMpvSAWfeWSCt0b7GRe9rOuQ==
X-Received: by 2002:a05:690c:6e10:b0:855:ba1b:c71a with SMTP id
 00721157ae682-8b07edcda9emr55018537b3.3.1791796006796; Mon, 12 Oct 2026
 02:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012031656.3858771-1-charsyam@gmail.com> <d19c802b-623b-4900-ba09-76302fc7b602@163.com>
In-Reply-To: <d19c802b-623b-4900-ba09-76302fc7b602@163.com>
From: CharSyam <charsyam@gmail.com>
Date: Mon, 12 Oct 2026 18:06:34 +0900
X-Gm-Features: AclHuK-5pJRz0EpMFaEkPVRrTYtxxFY8A2HZW0Ubbkdh28bgEbVt00nBBYDq37g
Message-ID: <CAMrLSE6UGq4gfq2kuxgTdzzVFEocs_7gzx=FwN-o8Nm9+ZvDcg@mail.gmail.com>
Subject: Re: [PATCH] ntfs: compare streams_interface with mounted volume on remount
To: liubaolin <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, hyc.lee@gmail.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi liubaolin.

Thanks for your reviews.
I will fix it soon.

2026=EB=85=84 10=EC=9B=94 12=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 5:26, =
liubaolin <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
>
>
> =E5=9C=A8 2026/10/12 11:16, DaeMyung Kang =E5=86=99=E9=81=93:
> > During reconfiguration, fc->s_fs_info points to a newly allocated
> > ntfs_volume. It does not contain the mounted volume's stream setting.
> > Consequently, a windows mount rejects a remount with the same
> > streams_interface=3Dwindows setting, but accepts streams_interface=3Dno=
ne
> > without changing the active pathname interface. This also breaks an
> > ordinary read-only remount when the existing windows setting is passed
> > again, for example from fstab.
> >
> > Compare the requested setting with the mounted volume instead. Use its
> > superblock when reporting an unsupported setting change.
> >
> > Fixes: 2de2cdd9cc08 ("ntfs: add pathname access for named streams")
> > Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
> > ---
> >   fs/ntfs/super.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> > index 242fb19ced2b..711e90be9382 100644
> > --- a/fs/ntfs/super.c
> > +++ b/fs/ntfs/super.c
> > @@ -275,8 +275,8 @@ static int ntfs_parse_param(struct fs_context *fc, =
struct fs_parameter *param)
> >                       result.uint_32 =3D=3D STREAMS_INTERFACE_WINDOWS;
> >
> >               if (fc->purpose =3D=3D FS_CONTEXT_FOR_RECONFIGURE &&
> > -                 NVolStreamsWindows(vol) !=3D streams_windows) {
> > -                     ntfs_error(vol->sb,
> > +                 NVolStreamsWindows(NTFS_SB(fc->root->d_sb)) !=3D stre=
ams_windows) {
> > +                     ntfs_error(fc->root->d_sb,
> >                                  "Cannot change streams_interface on re=
mount.");
> >                       return -EINVAL;
> >               }
>
> Hi DaeMyung,
>
>     The fix looks correct.
>     However, vol->sb is NULL in the newly allocated volume, so
> ntfs_error() only logs the message. Changing the argument to
> fc->root->d_sb also invokes the mounted volume=E2=80=99s error-handling p=
olicy,
> which would trigger a panic on a read-write mount with errors=3Dpanic.
>
>     This branch only rejects an unsupported option change during
> remount; it does not indicate filesystem corruption or an I/O error.
>
>     Could we use ntfs_warning(fc->root->d_sb, ...) without triggering
> that policy?
>
> Thanks,
> Baolin.
>
