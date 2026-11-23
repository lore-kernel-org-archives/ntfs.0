Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795447127;
	b=2PQlmTCTs03XJLaXYspk0dS42/QJoJSZTYNi3VelX39UdTfMF7O8TI3LBQziw8eXXI4S
	 t86RjNXA1bzBinHBY8bNX4jP9BLWsNM/p1pqugjsDK2cIfrEf3trnrj9KrNmuSURmuWE/
	 8/pvK2vQ/hGihOfQ9NoekiWPvvnAPAqF0JSVTtPt+hOohNscR1dctwSVSefKXtLawDMa8
	 /hBU5Lhg7MPGlKvcFW4ok10KV0XOSaNgHLhrdNDV99/thv4xQ6MFJJ8UnUK8d0YthQYSv
	 s0xVOdOw3R/oY0/+6F/wVyvlmbZR7BOyD+HMKaF6VABLPuWqGe6ux3eIMQ9z7YeCBZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FQauslTrJye8WtEKr4/uMYFLXtDrCWIYYsnNnENx50w=;
	b=eAWlwtIq+Fyo10qXr9/hCwC78IsU3D7WZR4dKogya2u8bLySNB1wsRwnkOgGAVJl8OyW
	 cpcZvaEdrhUEdwJSMxxRnKgfLnop11vxaEAVJyt2GtrGf6tCOtuNXiCM2P1neulj3wY/z
	 O+PfnsgaLX8PKOzfpv/euG/hNT9/hTxXn6vAvenenY61WEDpkkfSH3Eq/6kENFAWGfz8H
	 R19ak4wR+H7aJ9QrQTRYpR9aGr6k80D6eLkjuG9mKIzOOatZxRc0xvjPQYpjTta9anIph
	 co5NZdPgz+imGxYV54vOiM0/wb9DKnsXKkRP7aqXK21oac/9EiJHuEuOcVBtwXpABuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=noOsh6Ez;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7BE606A327
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 15:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF7BE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=noOsh6Ez
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so4203697a12.2
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 07:18:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795447125; cv=none;
        d=google.com; s=arc-20260327;
        b=JA8LDVi8NzsBVRAZFvLI8ZOEG5Ds57UGmOLEHvTawynowZdDcNZM6feIiV6Z8Fdxqh
         Bwnsr3Zx/NUIfNRwEK/g2NHvMjlXeyrUKkF7YIOJqhfpX5piP1QlBerZxNKQYE1yiXRI
         smxnEtmj6v3nmg3+8nUqagMIBm0OzYfT4C6SOJuHg77bjcZWfanLXkbSABWBy1Wpob+0
         NfDs4s773It3f0KYKSf+/FZRBGVfP1vxlyhg3rWtmOKDLOk9fQfJP4f8uqvrMsj9KwZq
         WoQR5xNkCQEuEmjtGg7hC7g0Lw72nuR//k96K6hCgfMDAyKJLek3Uy14YdgxYhYgKOyt
         rqyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FQauslTrJye8WtEKr4/uMYFLXtDrCWIYYsnNnENx50w=;
        fh=jr2FEYCUWuhd2sodarxfJqcC++GcSqct9w7PqqKKWgI=;
        b=IpErkqSiDVyK7nxjBcrRWTXwuKMnSVuArIAQRJhBi7+tzWjEA0YrfBp9TnYmqYCsJS
         DIMq/OsmoCC6Cyv+cuYvq0in8B/ieChaMDg++cFfXJ/kVpri8D5QUOa/Nd98jkwvbJsJ
         1DDjmZCk+o/DXnVMA7tdymF3UQV4LCjP4enqxBC09bg9xQU0Opthghe3gEYDeEU0gSVG
         KmjbWpiqkEPYE2NsmccPPeB8M7sEad3Nqn9ukdsc5J5D01f2POeoES7NunXpyLlrKqZz
         AIx6CmsqOYfJEMMV0r6uWFVGL+mmLh2VNi//EVOSMD89ZQurxrMwjoTsiyIgcdjLPQif
         OfdA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447125; x=1796051925; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FQauslTrJye8WtEKr4/uMYFLXtDrCWIYYsnNnENx50w=;
        b=noOsh6EzP0OCZ2B04lFZeH/8JDhQXx7monKOIa2xXn0T01b1zzLcsIhqWfaDI52oIW
         ApDhG/7tPdnLbIq8BHeiYPQ0fleBI6uoKYNBMQBa43XfHpw9o4WV7aoFqrn3PyoCu9Ho
         1p3w5XmUQCV9J9+n/Wfbmj0JXFF+AENkIKVgHNwfVL9DUvIUCvYg59WvvGhjxAxopkq1
         hU9vqot7xbIjY4bb5efhbDer+md95zPUurRB1FNO3ueNjtIeFNBa9i5zvfXCZlFodW4p
         z3qcTN3ypaNSowfK+a/JC8IvRpyyc+cvzVh4dkK0iv3s1u26dg+wczHocvj1PmBoh8Vx
         zqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447125; x=1796051925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQauslTrJye8WtEKr4/uMYFLXtDrCWIYYsnNnENx50w=;
        b=PJrcuQluRlp2Wf/zxWnZ2EpMqFeAtyxVY/XoOiv0G6kzMUM94+4hmnMPTxMNaVuHao
         RJ//JGPOzsHkfvAtvvr6j2E3C+v0dJWUtmEGc/uJKFUgjRygXN1wXpUF8uDdcYA6lEBl
         p4bjEsJrdjA1mUvg2usGZULaoMDy6WYBI6zIVk9C5cRX6WIPDbtgHAniD0eIvmFkOW8p
         VkwyOmmS8i8dP8cFIu5xWUkVGq5qjwKyoasUeT6IcZtBKmg0753qTacUlsgmHPZvXtAL
         a/r/+6B3NncKUQ54f+PbhYmE6hrGzt3akzIfPrcjqXw4jFASknFg6xpmdpKGoljRu67H
         jc7A==
X-Forwarded-Encrypted: i=1; AL+hErFaDYybHHM+XUw8SPgxHDpRtYb+0IPJNuDlIyFBrbFm2fHRP3eRmIQWYfO6PciThtLs+lWQ@lists.linux.dev
X-Gm-Message-State: APuU4Z8UqIEhwmVQoJmhNkGgABJXQPUd1NBZ2p+asRgtr1xl+3XWGWzK
	zaEfZxcpKEYwzByCmWB3e6GiLVr9acA6V3T6cuo3gbeN65icqAocVT2Cmlqbbk+sywYo1/320hh
	/oPWz42ffTTf5jSj7jq1Rf97ef180VQE=
X-Gm-Gg: AZFdTZcpH26j+Yqb1Iep3lhcL4wEECUog3MA0DZXRqcy9BqK+VQqyLmwTPYEi4f8j0i
	cg0NZZWtIqIBQRwYQDpBeNsQERA5cToljbSXxdRdmMRjcXuMm+SVb+ketMSr+SAjBHNgAaexcU9
	/nhow3jyJXJyWv33Rz+LPtHhP6oLBF+MojM2KpZmS5dCDLPowo1Lh8SfxmFbIGX4muG30l2mVXw
	UxCpEYCGhLft0FITAA1z3/aAwUh7Obv1Z+Oy7EiY1ltYsqdgS4WAgZ+pS8Dr0iCzVSdksAMERcF
	9Ism5oXqn0Y66Mr6hTUyTU2WwneT5ZaOYBVQI8igsUHvVO2ynrasEaN9tiENm2m60py2S7wDgyk
	D7d3dnVDNeQYJfJlbCPQPXMSR3tGm+oYcIpBX/bxmv8cgDKIo34DlhDeOMa2X38FUzyi+LO4=
X-Received: by 2002:a05:6402:23d0:b0:6b1:b97b:744 with SMTP id
 4fb4d7f45d1cf-6ba37ec18e4mr7070716a12.32.1795447124603; Mon, 23 Nov 2026
 07:18:44 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122000856.536902-1-koray.fra@gmail.com> <20261122000856.536902-4-koray.fra@gmail.com>
 <CAOQ4uxgc6pP+_xvJMbqj6wOdGzS75Vn6x6i_vUfCJDD46DAA_Q@mail.gmail.com>
 <DN2N0BY83OY2.1OV3ZAZFSWCDG@gmail.com> <CAOQ4uxg9O-R_SUPAZ75ESGB99-4Z4EEUKGMkCF2f-sXkGPq1GA@mail.gmail.com>
 <DN2NVGUNO0GA.89JAB2PVI0LA@gmail.com> <CAOQ4uxjuAN0FdxGr_-OccO5qnUuLF5oxOq7L_545tG3+36EKFw@mail.gmail.com>
In-Reply-To: <CAOQ4uxjuAN0FdxGr_-OccO5qnUuLF5oxOq7L_545tG3+36EKFw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 16:18:32 +0100
X-Gm-Features: Aa3M54oObGzmT9EyX7FArFQpCHBYwqipULgBnYau0_-PZcRo8HGalO_VEERbt3I
Message-ID: <CAOQ4uxgyKcB8GjE5_S9fgMv9oC_dKKaypDWEf-eXEkFeo5e89g@mail.gmail.com>
Subject: Re: [PATCH 3/3] ntfs: switch to the new xflags fileattr API
To: koraynilay <koray.fra@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Darrick J . Wong" <djwong@kernel.org>, Andrey Albershteyn <aalbersh@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lauri Gates <lauri.gates@gmail.com>, Christoph Hellwig <hch@infradead.org>, Dave Chinner <dgc@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	ntfs@lists.linux.dev, linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 3:55=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Mon, Nov 23, 2026 at 3:31=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
> >
> > On Mon Nov 23, 2026 at 3:14 PM CET, Amir Goldstein wrote:
> > > On Mon, Nov 23, 2026 at 2:50=E2=80=AFPM koraynilay <koray.fra@gmail.c=
om> wrote:
> > >>
> > >> On Mon Nov 23, 2026 at 2:00 PM CET, Amir Goldstein wrote:
> > >> > On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmai=
l.com> wrote:
> > >> >>
> > [...]
> > >> > Rule:
> > >> >
> > >> > You cannot add a flag to common without carefully auditing all
> > >> > filesystems that support the legacy flag.
> > >>
> > >> Yeah, sashiko pointed out a problem in f2fs, and I could reproduce i=
t in
> > >> testing, where adding COMPR to COMMON makes f2fs crash, it also need=
s
> > >> NOCOMP in COMMON.
> > >>
> > >
> > > I don't think this is correct, or at least not enough.
> > > My agent said that this breaks or changes things on  f2fs/ext4/ubifs
> > > I didn't bother to check if all of them are true - I doubt it
> > > bottom line - need careful audit and good testing.
> >
> > Yes, definitely.
> >
> > >
> > >> > FS_XFLAG_ENCRYPT can go into common but must also
> > >> > go to FS_XFLAG_RDONLY_MASK because it's read-only for
> > >> > all existing fs.
> > >> >
> > >> > COMPR is rw for some fs and ro for others.
> > >> > As with CASEFOLD, you cannot make it COMMON before
> > >> > converting all casefold fs to new API so that each can say
> > >> > whether it wants RO or RW.
> > >>
> > >> How's CASEFOLD currently handled? in the v2 I'm drafting, I added
> > >> fileattr_mask_to_legacy() and fileattr_legacy_to_mask(), which conve=
rt
> > >> between the old format (filtering by FS_XFLAGS_MASK) and the new mas=
k
> > >> format.
> > >>
> > >
> > > Good question.
> > > Need to check this.
> >
> > Can you do that? If not, I'll check tonight, no problem.
> >
>
> CASEFOLD is set in FS_XFLAG_RDONLY_MASK and NOT set
> in COMMON
>
> Therefore, doing set with the old xflags API for the common flags always
> preserves the old CASEFOLD.
>
> This is kind of ugly and works but its hard to see the design there
> so hopefully all the new helpers and masks will sort this and make it
> more explicit.
>
> IOW, ENCRYPT can use the VERITY RDONLY and COMMON
> precedent because it is read-only across all fs (via this API).
>
> COMPR (for the purpose of ntfs patch) can follow the precedent
> of CASEFOLD of RDONLY and ~COMMON, which somehow works.
>
> Note that for fs that were converted to the xflags_mask API,
> COMMON should be irrelevant.
>
> COMMON is only used in SET to do GET and preserve the ~COMMON
> bits of the "other" API flavor.
>
> With the xflags_mask API, unless we adopt the "verify" feature
> there needs to be no internal GET with user SET and then COMMON
> is not used at all relevant at all for those fs (e.g. ntfs) only the
> _fill_ converters are important.
>

The statement above came out too strong

The internal GET is still needed for the permission checks (immutable, etc)=
,
and for converted fs COMMON still matters for the legacy ioctls, but it is
not used when the new xflags_masks API is used.

I would love it if we could get rid of the internal GET, by moving the
IMMUTABLE|APPEND checks to the fs fileattr_prep_ helpers.
But this can wait, you should not be distracted by this now.


Thanks,
Amir.
