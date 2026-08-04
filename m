Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F023E8685
	for <ntfs@lists.linux.dev>; Tue,  4 Aug 2026 09:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785834653; cv=pass; b=RKuldxFQYBZ0RE/3u1l8EMpZ/1eW01GPAuTPMiCSw21jJvZUOTBJb2+cP/xnL2wTpAimgYQjrdJUaQ9mZQ8zdar/hDeq+xZE+ehd2KfuSHAv5vZNz5DVMqKsvJWRzDt9cDBbI/6tLWirgOHaL5o7z0UVYso4RuR5ka6yf4ztYqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785834653; c=relaxed/simple;
	bh=D41cRLYBHnw6B9Y2G3XWqLyHU0FJj3zLnJbRklH5eKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=VjR4T4ay9fOWHXV7WKdmu7CQNqFf14mIE48J5ZYBi91MtxO5aQmxX3GEN+APpJltlbtbqKDso/2+WiMyKcDjq6noflvF2X035S6apPkRq3z6ScUYkwTvE27pXZxgdIxDrDuu9CCImJ14XQdeUHLQIAaZlkfoyQcbY00G10Vu2Ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsCjJ0qs; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsCjJ0qs"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so4119344e87.0
        for <ntfs@lists.linux.dev>; Tue, 04 Aug 2026 02:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785834650; cv=none;
        d=google.com; s=arc-20260327;
        b=N8J+Jt7TeaM7GqtgC2Dh+kqiDg+zptGJtlVXF9QpLnv3hd1SJNuuo8TbECnFU+210h
         TSmdBAyW50ERg+cDfhiK0qYR3MEugggj/UU3RFITkIQE+48XhqkBYzsKjtWh6czPDfFY
         L+5xpAEll7CHO3LrRQUOxcuKDNFZDHvO+kko+i6crbv0Glq+dzsmuHA8aoCalVIq78xy
         2BlXWu7TbY1AAzQmg7txz8PpC9IDBORsecYFJnx9P6XgwoGPBACiT3nmyP/aBKYNkLoz
         fGlimTlJOIxu1dJFr9JCTkRy6x/ZW0W211RZJ8eYl0ZlGfrTqjz4joacr0uIk6qs3Fa8
         j0Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gKrRKD9mOOpHls+nK2VAtpKS46uprjKQsiDimCvh0MI=;
        fh=hwtfrABqq5NLEhMhwvoXeIH1gcb6eoKj9e4/4hBIHbU=;
        b=W9GDqTur7uMJ3D/YmiQkQWi+8nl2KmS5yuLyI3G036EZXW68UZCU7Ca2zotT/Afdpd
         HCn8FsyKbLZxscohQiqoHkI0AK5cgV5fmZ4RFsCnZMKOROaFq2AnqOzHPJMpjpQbiOi3
         AmKN/DfTnxZukcY1RZoDCQSM26Shl0dmqaoCO1RO77kYUJQ10IxBOZyxCtFV+aLrwKRC
         7VU05aSCNb6urKVb01rxffLnYIBzZ3Oklpznzzd3pX3GQPOCvjWfUBg5cm8I1+6uTnX3
         sIcnYdWptK4WXXvpQHmo6vaiaZXTjlTX5nC1zCuzCYBoXQJ9ULjaAvwN4dAuv14eOmOX
         zy3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785834650; x=1786439450; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKrRKD9mOOpHls+nK2VAtpKS46uprjKQsiDimCvh0MI=;
        b=NsCjJ0qsO36WPXxSNTCqtwGAkZSMOdR0XHXbUZXCTDPk4g+XLrElaxYJr+d+kTuV7v
         OSSyFRDkVmGeRngEjXlY7y97RO6nP4PpSbsQS2ObIDY2BRt5egN1lh+Ku+hLH7ZMBIeQ
         NyR0HWPHGAcRHdKoI0pgpIMGAeUUElbXy4SibZQXI2QrLlKQTXwIFHhuqmNZoe3q6hwI
         wWTo+rdLgOyA3XDKEnxrkUdETMd5a3kvOxLOnC8h2eDB8tvA2hOKEDmKbJKmq5mp3ud2
         uODfA43xqMVluyhyuh+gBqSvB7SGqZeV5XlKLp2mfl+LvJMzRscyvNEFLbIs/MMpHfmj
         Ntcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785834650; x=1786439450;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gKrRKD9mOOpHls+nK2VAtpKS46uprjKQsiDimCvh0MI=;
        b=G3lt/5aHfj6TcZG8VZ0yrR0WntT8Oqxqmq7J1FXnvTOFu+6GYST5XIrA4W/8Rf0/6c
         svtYbaPYfS4p2eNeva5Rt572jjkCUVv12ruEGgNeIeEH/bEzTIxdy0xhJnGwPj5741+w
         ueX36Q4R5+d2FMxRKodrF2SuDyhakvURdwMdQGXlb/uSJiApixqGcTrB9+q8bCXiJ8CW
         u65N4WlPUCJJ0RdJKLOy9Mvso/jW5uQHnhWnZyV9gH+n5Wjw6MvUuFt7sxw5w6zMEOu0
         kWMt+b/ugyAbtLJ2Ek+d+F+e5K3wfcnoh+lY1XZq7ChFCsS7gsxSGyrvk8jnCR9UGfDB
         TpiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXdB7CSjzn+Aon3Ga42qLN+6fMLIisYVMcgchjniarkl+lxrmPN+9ieBP/OO4MQOiDkgbd@lists.linux.dev
X-Gm-Message-State: AOJu0YwEZoucSiHaNk9ErXgGnNA38g7uOyuYtuv/QLIfgYXWTZnkiRs3
	DYbPAh3OzruwY2uGtTHgvcCbK7lUxewAePrOFPo+S3B835SnDX6QZr4+6at0JhV/DcWGwY7SIK3
	32CLOp7GFOiO3plsPHKRiFmI0cnjn0Hk=
X-Gm-Gg: AR+sD10qWEWsUyITHNKLAiM9sbeaAXJy9kTVKNROGROH1cFzQht6WQQ0EqHqtbaCUkV
	ZZxeisVpZwGgWrFrDxNkm0NVzvrstiQwPCzfgNAvRtrnxzDHpbGYJYyR2YnaM/ZAOOE+o7HNxD4
	GePOqTwSch/UkR+vCNmDSxHIpQcHySBVPZ/hGx48GKhABEhoWKjt7LHXI6sRgijFsPrHlfhWWv0
	KYw//PFY1hS3krSan2OyeH09MhZNwxOTDCMwIIHZDwKoa39P0ehixDJ1zfCvHouUDH1u9m5OSfS
	4avU5ICVm0DTFC18FpxpOfNf/+1wRnrNyD9V3EWxUpYVqyqKV9a4k38=
X-Received: by 2002:ac2:4307:0:b0:5b0:82d:e90e with SMTP id
 2adb3069b0e04-5b2e4f3405fmr1874406e87.19.1785834650023; Tue, 04 Aug 2026
 02:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729110036.12129-1-linkinjeon@kernel.org> <CAPJSo4WUxiKcfjDkHuOVhqBmvHng7JdWX1dibsYFjW6qwTCUSw@mail.gmail.com>
 <CAKYAXd_oohSF2rLCns432OMACc6S-M7Hv8jCGtkD-rOd2QMYEQ@mail.gmail.com>
In-Reply-To: <CAKYAXd_oohSF2rLCns432OMACc6S-M7Hv8jCGtkD-rOd2QMYEQ@mail.gmail.com>
From: Sebastian Feld <sebastian.n.feld@gmail.com>
Date: Tue, 4 Aug 2026 11:10:12 +0200
X-Gm-Features: AUfX_mxs4J-zNjoQGvz1DTxT6nz7Z7O04WeQAWYbe-SYZyntetnQXDrEW-1S1So
Message-ID: <CAHnbEGJxN9mh7cGN7ycay63F75Z0+_G0fsHm9bgxHesacUrcSA@mail.gmail.com>
Subject: Re: [PATCH 1/1] ntfs: add ioctl support for named data streams
To: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 2:01=E2=80=AFAM Namjae Jeon <linkinjeon@kernel.org> =
wrote:
>
> On Mon, Aug 3, 2026 at 6:10=E2=80=AFPM Lionel Cons <lionelcons1972@gmail.=
com> wrote:
> >
> > On Wed, 29 Jul 2026 at 13:00, Namjae Jeon <linkinjeon@kernel.org> wrote=
:
> > >
> > > Sebastian and Cedric requested NTFS driver support for an interface t=
hat
> > > WINE can use to access named data streams.
> > >
> > > NTFS supports multiple named $DATA attributes, commonly known as alte=
rnate
> > > data streams, but they are not directly accessible through the existi=
ng
> > > file operations. Add NTFS-specific ioctl commands to let userspace li=
st,
> > > read, write, and remove named data streams on an opened file.
> > >
> > > The new UAPI provides separate commands for each operation:
> > >
> > >   - NTFS_IOC_STREAM_READ
> > >   - NTFS_IOC_STREAM_WRITE
> > >   - NTFS_IOC_STREAM_REMOVE
> >
> > Wouldn't it be better to just provide an API to get a fd, relative to
> > a filename? Win32 named streams can be sparse, and it is common to
> > punch holes to deallocate sections of streams too. Streams do have
> > their own timestamps, too.
> I believe the current ioctl interface is the best fit for this
> support. It operates on an already-open base-file fd, avoids pathname
> ambiguity with :,

Nope, NFS already fixed this by allowing "unnamed" fd for deleted
files. Not having a name is OK. Win32 uses
"filename:streamname:$DATA", if any resolving is needed. That works,
because the Win32 API and NTFS forbit ':' within file and dir names.

> supports UTF-16 stream names, and does not require a
> new system call or VFS changes. If WINE requires hole punching for
> sparse streams, I can extend the ioctl interface to support it.

Wearing my hat as the one who has to do the WINE implementation side:
I think a fd with all normal file operations available is the better
option, because we need to do per stream: read(), write(), fsync(),
fdatasync(), sync_file_range(), file locking for each stream
separately, mmap(), getting/setting timestamps, futimes(), fstat(),
ftruncate(), lseek() SEEK_HOLE,SEEK_DATA, fallocate() for space
allocation/deallocation, unlink(), ... and likely more. Pretty much
every syscall, except mkdir(),mknod(),rmdir().

Sebi
--=20
Sebastian Feld - IT security consultant
