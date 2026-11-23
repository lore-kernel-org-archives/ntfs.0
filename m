Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445772;
	b=e2MygZY3GR4KeeUWB1sNteZMplDL9fcxpHtgAHlrFuNSWrSQ5nMnLesAq0Zwie4IAaYU
	 qyWMVcMc0wfsEqxCBuWY/4DGvsQPILlIRK0NtTsJ1Pu+v996HaisE0YHJg8pbhJVX0XEb
	 5dAyESaj+IPT9U6U9Gx0QpRImL8leKjKc0H7xaZ/w7whdUaG0C6W7hKmHihEWNc9erzI9
	 xgrvrMeRaXCGcaNl2kuIHIqpgW2fmE9QjznLTIt/Wd9e3fWuAXvvp8/jLck1qez3mrIGC
	 bI3PX71BUCsci3XccF3Jo45cwkwQ9lwAFCGZ6LNu01bVNWoVho0YfCvgSaODAGorLVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iLBZumrqdFfo+uoEqy5DjzVlLpVK7yMeWhuKRObIsyk=;
	b=CtLUhNIewhJCajaqP6JhwWY39Hg3jlYv2S1cVmYqAJlWjT3TBP32dARtdEjUbuoeyXmt
	 rYP0AtLcXhV7ofpajXXuoHE33NFmJQgEaUN+Xvax2ejFhXPpHSUWaIwGEvvQH8BDjF2Rh
	 CtM7XJ0B1oJCjtMfwXIoLaoJ/3tg+JJDhy5JKf3EJ2y5gnHtZ5fkUnEUOjUHkm1qhrA1+
	 xLbkKcA5IUxPwfKFgMJBuy2hZuR3CNU18G2Os00vUYBjAeORUeDxXfYxJA7zY3kLExjGP
	 QJN2j/iTVfRW2z13Aq9IP/dq9XTwGp4Xg8N3J+ciXwMoQFGY1WL9B67e8u6DXIDElYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DM9E4NeE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646C9606A33A
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 14:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 646C9606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DM9E4NeE
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso484207466b.3
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 06:56:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795445771; cv=none;
        d=google.com; s=arc-20260327;
        b=X7a0IQmSD38wtB8xQ7Ij2qqWUqzhy87Nb0hmL/2KlKJwcApX5vCak1/FJs0rO/3oXO
         NPxqvDb0U4qum0DOV1YZ5vpujDOvMAfz03xZ6kL2S0KwPpSE75gtndyCXXPyd1ZFeyq2
         505Nm4ZDOruF6wSAifKbyCeD/VuiKIZLCdKQP7HG0l9zQd9nijYuBLp5qjMj6H/fusQH
         ZDvfp2A+P2ARdm++LMJMdVCS1aszWv1QuYK6fFcWAaoFxsa8lXkyxqr5QFDk1Jv8pVbw
         rfAKsRU2hoQ1go6wmg90VVgd30k9nVkzdrq5E3mM9vU6j/dojSKAAO26tsxPOu7k3a9s
         wa3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLBZumrqdFfo+uoEqy5DjzVlLpVK7yMeWhuKRObIsyk=;
        fh=9Zw3YhUaPCuVEaJsZFzZMh81Odz0rN4iCNiewQAso+c=;
        b=XkX8e7GtQiYWVAblcbWskhge41f5QWgelTrNKWAsEFEdubwjj2qDUlqfg8F/wN82N5
         4hXcfySGB1kxe6MPDue4QG8yBeqCl19oAoB8BbeBFy/UfRO+Sxgv3MgQD2ZyZpxpiXAr
         Iw5Lo0U86ADyUjrHivHsix5nPKod8izaqG/xPlIAYg67MHE2NEDLcRnsRsoRksrAEdcr
         y8/AfBeZIOddmJ7gQb9KbotmkijPrmJix9LpLfjSvVioTgCyKvshkPEw9j378qobKdgE
         zDfD2ZPQs/mSd31Ba8L+AQStE2hZ5bbdc0pAlPvHOtBCC78VDrT7NXhRq2iwjXbB/7H3
         EBaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795445771; x=1796050571; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iLBZumrqdFfo+uoEqy5DjzVlLpVK7yMeWhuKRObIsyk=;
        b=DM9E4NeEFK6cyWToMGoJr/lnRZQmc5mWinaYrtYDMcebDj2oeIP+51NIJIhjTmFSKE
         d1N2BJlRLyqMa1GlO0MwBT8mJex5V5E/a519Wh3GhMdi0Y0JdqH4rrcbLxCNA9d4UNeF
         wmkGFRtqrH/H0d65tTmh/S5msUdo7ONck4rbZ/nm7Aha7SQUflLdZuorTVQwbxk5Mh3V
         9C9+t2BMGyzxGzo8MHjk7ELYovr6RvNmFNamjEd6i5zpWmti6NgyNqtxg60Nt9MEIs94
         d+mlGsReOjSpVeVrIK0nKTnNUUumaDbCIHD/m5xhI9fnSBoaAMfiArB4wvS0zMDj7JbG
         s+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445771; x=1796050571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLBZumrqdFfo+uoEqy5DjzVlLpVK7yMeWhuKRObIsyk=;
        b=0Sr1XjgjYo/v6FvCTBllLo0pie50AWU513SSCkj/fklcUE5D7nx/WXXk+RLpOUqSWd
         ELPRnVRw6/dT9ASHeVvF4Ka4bpshUOzSrk9qJIwwV+0xExNllFQ6VcAt+mogxrq+kLW7
         DdczCT1QvnZOAkiYFAoY1iQqytkRzBkPEOrJzbtVkMyDD6WM8U6dQXBqu3fAJ2sH485u
         2FWwoddRX/+/XCAreNW1XGHl2AGLiiDMjNBg4C1ievk1VKTE7BGvmoPnZ9mv18pGd6pA
         lCDuEotFdzCDnBRyt8eI9ew0ePjlA4bbcasr5S/8GdfLuqjpi6DDV7AKYaG7jFfxCgX1
         zJtQ==
X-Forwarded-Encrypted: i=1; AL+hErFzdHUXtJQRCxJsnSJbc1RAmpuSokHYwQj11wdl1ac+9M6whwKyQqy4ToHDpdQdia1ZwY8o@lists.linux.dev
X-Gm-Message-State: APuU4Z/MkzVXLNAzfjstpzF/wtHywoZ8oZBsP/nkf0xjhVcrCGqeRqGP
	oXSfGUPdr5Ub+mcuku6taOYN7xJX6fmQlKCJ8dD4uySdO4kJ3alKyVCLL3FIhtb39PTzOUt091O
	GBA5lx8Vh3Dz5w7brioy3r5XyELZMAS4=
X-Gm-Gg: AZFdTZcXtzDQ90+wq2wNvOMEWe+DzZIc90XNyYcNLlT0dmB+EVHk+gDcZfWcO43C0io
	4QDGm69CezAIDvcRFylpZ2AzvywxaGKjaiEmu5pPl7ZRdhyU0PXB3znHPJzsykIrCaJ1nuEc+91
	pwS1PUIfdyCNtgLGsGyk2Xr5ApgiRa37K1kVs+AhEs0PCD6wdkAmF5Cvgty9w6dANH+BTIc4raE
	oXTQFbVxHtHG7fQ4vpZlnmRVHbkoOZiXrLUH675+3wRXQp9ranqwKONkbqB47rjHi2BR/UJP9/A
	XGw767JrZeZhQRdw7Nl0HC7v/LjM494Qu5fMxdMFIE0+ist6G7l8OD2Mlq+yskVANhUkc0noNFH
	nf/2FLv0zUwBUqUPwxnysqOU42gyRt2v0cahipmnA+boydyZIPuHmfnDnbcKgmfEXJi2x0Q==
X-Received: by 2002:a05:6402:5516:b0:6b6:ef7f:600d with SMTP id
 4fb4d7f45d1cf-6ba37e74244mr7852050a12.21.1795445770471; Mon, 23 Nov 2026
 06:56:10 -0800 (PST)
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
 <DN2NVGUNO0GA.89JAB2PVI0LA@gmail.com>
In-Reply-To: <DN2NVGUNO0GA.89JAB2PVI0LA@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 15:55:57 +0100
X-Gm-Features: Aa3M54p3kKL3ZKUzvEHZq54IOonM6T5WCFB3q5vIRbaCh5i5swbxajRtrCtjW5o
Message-ID: <CAOQ4uxjuAN0FdxGr_-OccO5qnUuLF5oxOq7L_545tG3+36EKFw@mail.gmail.com>
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

On Mon, Nov 23, 2026 at 3:31=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Mon Nov 23, 2026 at 3:14 PM CET, Amir Goldstein wrote:
> > On Mon, Nov 23, 2026 at 2:50=E2=80=AFPM koraynilay <koray.fra@gmail.com=
> wrote:
> >>
> >> On Mon Nov 23, 2026 at 2:00 PM CET, Amir Goldstein wrote:
> >> > On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmail.=
com> wrote:
> >> >>
> [...]
> >> > Rule:
> >> >
> >> > You cannot add a flag to common without carefully auditing all
> >> > filesystems that support the legacy flag.
> >>
> >> Yeah, sashiko pointed out a problem in f2fs, and I could reproduce it =
in
> >> testing, where adding COMPR to COMMON makes f2fs crash, it also needs
> >> NOCOMP in COMMON.
> >>
> >
> > I don't think this is correct, or at least not enough.
> > My agent said that this breaks or changes things on  f2fs/ext4/ubifs
> > I didn't bother to check if all of them are true - I doubt it
> > bottom line - need careful audit and good testing.
>
> Yes, definitely.
>
> >
> >> > FS_XFLAG_ENCRYPT can go into common but must also
> >> > go to FS_XFLAG_RDONLY_MASK because it's read-only for
> >> > all existing fs.
> >> >
> >> > COMPR is rw for some fs and ro for others.
> >> > As with CASEFOLD, you cannot make it COMMON before
> >> > converting all casefold fs to new API so that each can say
> >> > whether it wants RO or RW.
> >>
> >> How's CASEFOLD currently handled? in the v2 I'm drafting, I added
> >> fileattr_mask_to_legacy() and fileattr_legacy_to_mask(), which convert
> >> between the old format (filtering by FS_XFLAGS_MASK) and the new mask
> >> format.
> >>
> >
> > Good question.
> > Need to check this.
>
> Can you do that? If not, I'll check tonight, no problem.
>

CASEFOLD is set in FS_XFLAG_RDONLY_MASK and NOT set
in COMMON

Therefore, doing set with the old xflags API for the common flags always
preserves the old CASEFOLD.

This is kind of ugly and works but its hard to see the design there
so hopefully all the new helpers and masks will sort this and make it
more explicit.

IOW, ENCRYPT can use the VERITY RDONLY and COMMON
precedent because it is read-only across all fs (via this API).

COMPR (for the purpose of ntfs patch) can follow the precedent
of CASEFOLD of RDONLY and ~COMMON, which somehow works.

Note that for fs that were converted to the xflags_mask API,
COMMON should be irrelevant.

COMMON is only used in SET to do GET and preserve the ~COMMON
bits of the "other" API flavor.

With the xflags_mask API, unless we adopt the "verify" feature
there needs to be no internal GET with user SET and then COMMON
is not used at all relevant at all for those fs (e.g. ntfs) only the
_fill_ converters are important.

> >> > I think there may be a way to deal with this easily since
> >> > ntfs doesn't need to set either but not sure.
> >>
> >> We could export the 2 other helpers I added for v2 (xflags_to_flags an=
d
> >> flags_to_xflags) and make NTFS use them?
> >> Though adding the fileattr_ prefix will make the current (v2) vfs code
> >> maybe too verbose.
> >>
> >
> > Honestly, I can't say for sure - you can try
> >
> > I think you may need a different set of helpers fileattr_prep_ used by =
the
> > filesystsems that are converted to xflags_mask, which may be different =
from
> > the set of helpers used by the user facing ioctls but I'm not sure.
> >
>
> I guess I'll think about it when I move NTFS's impl to the updated vfs
> code.
>
> > The thing is - this is all hard to wrap our heads around
> Yes.
> > You and I have parts of the design in our heads w.r.t backward
> > compat with legacy API, both UAPI and vfs internal api.
> >
> > I think you should put it in writing to see that you and I have
> > not left anything out because this v1 surely does get it wrong
> > in several places both wrt legacy UAPI breakage and internal
> > API correctness.
>
> I agree, now the version in my head is not finalized yet, so I'll do
> that in the v2 patch/cover letter.
>
> TLDR is "use the legacy to/from mask converters whenever needed, so:
> - user legacy -> fs legacy: keep as the old code did
> - user legacy -> fs mask: fileattr_legacy_to_mask()
> - user mask -> fs legacy: fileattr_mask_to_legacy()
> - user mask -> fs mask: pass it through
>
> (before finalizing the GET path I want to finish the SET path).
>

Maybe for me if I don't see the full picture, full get-set cycle
it's hard for me to judge.

Thanks,
Amir.
