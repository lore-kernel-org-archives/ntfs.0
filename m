Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793076930;
	b=FOkHYO3d5k+tHwWhfTdtmvLodWuDNqxNMmRlc/AKpO/qFSk/1Ouejtfyv1nYjRi8LH/7
	 lHJgC/ZYqqKWr+LxnnbjP904orXCU8ut8XvxjaL6KHuz+c8RTWAPWKHPesX8b8NoAVfC4
	 34YjcQvBOPe/ankc6gs1i0iKkHTZTe6zD+RByxHeLizUYPP4NhqGbLlNKbS6Gk9LB671B
	 4cRjRBy1MODc0u6yJdthv7v3pm0tCwY7SyJ0asK2fsHqoEDJCeaoYHi+I6EBYtYMnEq1u
	 eP+AdjBzQjXV+12YTZ+8XX6h0yhX0tb61hLs27xCnhSQQG4BP8JCENNHqdnsBHlNe3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793076930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ifXiq38RfV6JUjjogLt0WLS6JNpzZahoP0/G/TMJs/U=;
	b=vbrEGxeSNNrYr7HjHTT2g8A7tx+FTA+eIBsHHu9U66htewp0rolN5HOL3iNW+6OIAUaP
	 sOtRzA4HMf1x+Pcd7NalUPFy3kNwj+7BAPBRHcRfaj/AjBKNPiIlvV1gYoyHraa19p9Zs
	 b98hckQpi9yrf3aL1A1AyAcxz1K4JAjr1CmLoudNeFs99RJth4Bx8XJQjhpEWolVwRbEt
	 2JV5lOI45U38e8aDP96f9I4Aic66cqXWJf6h+0ud+8jzPcDeBmvCiCIpJxlSV3rOrzhYC
	 bYeCqnDjiqAyrlQwkCW1wu8yKanhGa70E7IY0nYfoH8uIo7QRWoMkBDoCfqOsmYsWwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jYinVqkd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25BC606A31A
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 04:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25BC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jYinVqkd
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0a45e0fc2so3335297b3.1
        for <ntfs@lists.linux.dev>; Mon, 26 Oct 2026 21:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793076929; cv=none;
        d=google.com; s=arc-20260327;
        b=i5izrSGtNXUzO5lnnFZK/qJkEY9Jx/aBDvqPq7xfmdmq+VVLGa6ggZ2BFz51jonjdG
         e/3haigo+weIMHg8R3XiuSZ01OVg82nbPj1mvi4A/exZTL4+KzRkNEhL7OeqK+Bgnrq3
         +/LPaecE9Y8iIi9WgtvDVtDFU97pWEpRdWikFZiSjWqtwo4IfYam8CdSFfZasiRqpAcP
         DWXZzpMaRXi0SsNT1WcViwMt9ehNt8ohEeRQeBc8FQPsBwOg+1usyFni51Yk+eQNDxJc
         wE3J0C19GEGnaB6RW7C+v81T1Jcnrf2vUmamFD3+Dgw3iNwvjL3r5YbVeKWx0WUBlePR
         BJiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ifXiq38RfV6JUjjogLt0WLS6JNpzZahoP0/G/TMJs/U=;
        fh=VunGTfO+5wxe6nEk/OXOMK/4D9tS997+MAJhvdcygQ4=;
        b=QeQ7ueY40ohZNKtiubregxwypn40XHyfmd/NGuRHsB7bC+4GMbsv6EDrj+1fE4A+om
         2d/ichxUpC6tV/IqlhGFyj86i9qFrMWZe4ziV2EJlcz5Y242KdX7nFyFId41w7AI/dRp
         c9l9PuYejyUoav4CgU6Rp6lZHPHKMggKuyMaWe4+QvN4X7Eqx2iv688JezB2fLjV/5Gm
         ewtCj8zSn0d2o7+CgzOTU5yLSSnypOXBUDQElAWWSG8XfZSP71C39+S69Az1rJQI4aSw
         asBxIN5cR4O0aKSPI6CFJ+YmOcxXgy/Qua4tfKdefntvoR+eh/ZItcTLuAzZ143WtaE/
         6uNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793076929; x=1793681729; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifXiq38RfV6JUjjogLt0WLS6JNpzZahoP0/G/TMJs/U=;
        b=jYinVqkd0yK8UnCYYX0nWOWf0/LeSEqtBxKpg5rPiPZyMYGW5qK3sbOCy/lyTDkeR/
         Sld3MR1H4eAIW4qS5UrkzIYp4/tF6XkxzmvX8e2BN/Z2a/Bz0l1eUqWL/5rYF/zgHl/U
         trzsZKhGY8z4hRn9jiCiSl6N6D7/Dc0VtMEVNA45ulXKeslA/et3pnrFKNQjDiecwk10
         SdbPyavZLpMc4EluImm6JMLSKGj0nIXVRh8p0DSqiae1lPnUYldx0PTw6sAgoR3/Kv1x
         MYGDP5ScX9mAYwaXmntbdIRYASSW0kyQBNeYfO/5rMNqUI/DMeQ5paZBxf8mr0MCbuPj
         YEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793076929; x=1793681729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifXiq38RfV6JUjjogLt0WLS6JNpzZahoP0/G/TMJs/U=;
        b=qY4RXJY1OzMmish0ffmZm+C/GfxNmdJhtptdpzG034ZwFUncz8dk1CbINY85flRfE8
         iBCq4FH68rn/fJlzKs8YuxqzSx3cuHCTg5oSDvmv6aYmRiXA5UDYCJsJEDXAe5RvUVxt
         dOHIn+ki5THAyLe3RmJPtWIHQauXfY+EP/Bf4+hEmEdsiGELrtnE7jXWfbj+s2IWhsZd
         kbgdWQfMRFfX6I50/5lbFDhcPG5dheVoMx1d49IFLFImWe8+m0KwdNRY+Gz2geGd+Zm8
         x3z2r/scVoDlq48N91JCJZFt/+3n/5ZlHQXRrK+C/zuhfJFL/6/JfBU0kz0Ph/D1dpVs
         lsiw==
X-Gm-Message-State: AFq9FYJMFDRNK7TI4uyANzjBrJsgY7tFDWBzYkEvTLAhE7rkQ/U0IHMx
	Ly4eg1G5HOUWsYQyvn3w/Q4aAw/xLmO8DLAcGqEKom4pEbrDaO1rVC45xWrS1FdG+rRPy8Pk8co
	SWK7l9EccsoS5/LtJsEob++95zihy3Dw=
X-Gm-Gg: AYBFou15UPWU3c4OF/a0/vqCCGTH3Y/94UTr6XvxWnOlVG+uC1C5mHhYi1LNgED9SEX
	9GrvKHNKtCgRtOR1UhC6W+urITEZh4rnzRNv/8rzM4wK1p2mWplsnJ4+M1cYywKgugzLNeDvOTB
	Uom7MzTEm9cm+Pe3IVX/1CuEQ8/DIY/wvbRQwSnDI4qIiS4km1eD+KuK7ZJ4vBM17sO99Nqtq06
	uOgmhrjaFWtFqvcakP+PDVjjCRVi3xKRV5hzRUFO8I2RmtJwyZ/7zkKJ80OBYC/S9NmbecIXlkW
	G90de099/+lHGNK/Yqij5WRy67oL7htDDIPDg/kgvcN0CqgMk31/JfMNc01RkKAx5mRy4x4BXbu
	4psXxqJKN5DJ0pLeXs9QakxYTuTLRtc++VOS1CA==
X-Received: by 2002:a05:690c:a847:20b0:8b1:a3dd:a6b4 with SMTP id
 00721157ae682-8b1a3dda6e1mr5130697b3.4.1793076928709; Mon, 26 Oct 2026
 21:55:28 -0700 (PDT)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAPLZLeaXKkev=_EwAb679RaZ-Lcb_XQO1FsAw6RyT=M56rP7zw@mail.gmail.com>
 <at72kIgNxnK9p1tq@hyunchul-PC02>
In-Reply-To: <at72kIgNxnK9p1tq@hyunchul-PC02>
From: Jaidan Brashier <jobrashier@gmail.com>
Date: Mon, 26 Oct 2026 21:55:17 -0700
X-Gm-Features: AclHuK9b3TPyFBJAapRakBUGw1D4uYfkpHMGetNWotW5w4Ja3AOIvYdY0AwLyDE
Message-ID: <CAPLZLeYo6AhBLcCBeZgDAs5Duv08B4i1rdFNFH5ikTXhcueMAg@mail.gmail.com>
Subject: Re: ntfs: EIO/stale-reference errors on several volumes and on-disk
 corruption after switching from ntfs3 (Fedora 44 7.2.x)
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linkinjeon@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Hyunchul,
Thank you for your timely response!

I do have fstrim.timer enabled. According to my logs, since Oct 2, it
has issued fstrim requests 4 times:
Oct 05 01:05:41,
Oct 12 06:59:03,
Oct 19 09:35:47,
Oct 26 01:20:31 (today).

Cross-referencing these times with when the issues occurred, I do not
believe there is significant correlation.

Additionally, fstrim.timer only operates on drives that have
discarding enabled, which my two HDDs do not, including sdc2, the site
of the major corruption.
The fstrim activity logs confirm that while it has been operating, it
has only operated on my SSDs; therefore, it cannot be the sole culprit
behind the issue that has spanned both drive types.
I can post these logs as well if you'd like.

On Sun, Oct 25, 2026 at 11:43=E2=80=AFPM Hyunchul Lee <hyc.lee@gmail.com> w=
rote:
>
> Hi Jaidan,
>
> On Sat, Oct 24, 2026 at 03:18:21PM -0700, Jaidan Brashier wrote:
> > Hello.
> > Recently on Oct 2, i swapped from ntfs3 to ntfs, and since then I=E2=80=
=99ve
> > seen recurring EIO/stale-reference errors on four NTFS volumes, a
> > hardlink creation error, and one case of on-disk corruption (repaired
> > by Windows chkdsk) on Oct 23. Logs attached.
> >
> > Environment
> >   OS: Fedora 44 KDE Plasma 6.7. Incidents spanned several boots
> > ranging versions 7.2.8-200.fc44.x86_64 to 7.2.11-200.fc44.x86_64
> >   Mount (all 4 drives):    rw,noatime,uid=3D1000,gid=3D1000,umask=3D00,=
iocharset=3Dutf8,
> >             case_sensitive,errors=3Dcontinue,mft_zone_multiplier=3D1,
> >             windows_names,native_symlink=3Draw,symlink=3Dwsl
> >   Devices:   corruption occurred on a SATA HDD, sdc2, NTFS 3.1, 4k clus=
ters.
> >   3 other NTFS drives are present (2 SATA SSDs and another SATA HDD).
> >   smartctl and Windows chkdsk /r report no bad sectors on any drive.
> >
> > Fast Startup has been disabled for months. No volume was ever flagged
> > dirty. Unclean shutdowns occurred on these volumes before the switch;
> > none that I know of since.
> >
> > Workload
> >   Previous issues: General desktop use; I don't know precisely what
> > activities preceded previous errors
> >   Most recent issue: Steam Linux Runtime 4.0 update (heavy I/O
> > traffic, lots of temp files, symlinks and hardlinks)
> >
> > Twice prior, i noted a seemingly random file on my system was refusing
> > to be read, returning an I/O error.
> > Both of those times, I fixed the issue by running `sync && echo 3 |
> > sudo tee /proc/sys/vm/drop_caches`, unmounting the drive, and
> > remounting, in some order (unsure). The underlying files were pristine
> > both times, i therefore suspect the issue was only a stale reference
> > in the cache.
> >
> > Yesterday (Oct 23) i encountered a much more pronounced error i
> > believe to be of the same kind as, or otherwise some how related to,
> > the previous ones.
> > The Steam client errored while updating its Linux Runtime 4.0 package.
> > After some digging, i found similar EIO messages, and expecting an
> > error of the same kind, i tried unmounting/remounting and clearing
> > drop_caches a few times.
> > Realizing that did not fix the problem this time, I shutdown my
> > machine in preparation to boot up my secondary Windows install to run
> > chkdsk. Shutdown hung for ~10 minutes (normally ~10 seconds), likely
> > on the NTFS volume.
> >
> > Booting into windows, I ran `chkdsk /f /r /x` on the relevant drive.
> > chkdsk cleaned up the following errors, and more:
> >   - ~350 index entries deleted from $R of file 0x1A ($Extend\$Reparse)
> >   - Many $I30 entries deleted that pointed at nonexistent records,
> >     including runtime library names and Steam appmanifest/appworkshop f=
iles
> >   - "Recovering orphaned file appworkshop_32470.acf.async217386.tmp
> >     (and two more .tmp names) into directory 2B582".
> >   - Several libraries (libcurl, libcrypto, libSDL3) recovered into two
> >     directories each. Expected hardlinks
> >   - Free space marked as allocated in the volume and MFT bitmaps
> >   - No bad sectors, cross-links, or security descriptor errors
> >
> > After this process completed, i ran `chkdsk /f` on all my other
> > drives, which cleaned up some small errors but nothing major.
> >
> > Attached are 3 logs, of every ntfs error my system has logged since
> > Oct 2, the shutdown hang, and all the times i cleared drop_caches,
> > respectively. You may note that errors ocurred several more times than
> > i noticed and attempted to fix them.
> >
> > I made a few amateur attempts to recreate the issue, hypothesizing
> > that it might relate to moving and renaming, temp files, symlinks,
> > hardlinks, and possibly full MFT tables, but i was never able to.
> >
> > If necessary, i can supply the full chkdsk output too, and i'd be
> > happy to test a theoretical patch or supply further debug info.
> >
> > I wasn't sure who to address, so I addressed all three.
>
> Are you running a service that periodically issues FITRIM, such as
> fstrim.timer? A patch fixing an incorrect FITRIM dicard range was
> released[1], but it is not included in your kernel version. Some of
> the corruption patterns appear consistent with this bug.
>
> Could you check whether FITRIM ran before the corruption occurred?
>
> [1]: https://lore.kernel.org/stable/20261023163719.159193934@linuxfoundat=
ion.org/
> --
> Thanks,
> Hyunchul
