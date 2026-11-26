Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795676858;
	b=ajvGXjREhe7nzqotCA+oof9wlBkyKp3zMLVLP4/QrTCBo47KnjwTC256AsHzTacVcwlo
	 uXz+jkDSFpkQBOR3NoJTcarAcBe+cQFdTFz3FybsZcV4cFp+qt2Ti3/L5xH5K0U5ci5MH
	 o+yUOYvFsGjrLU5qcUpIxFjvCvLW5qSKSzw0Lde41lJnwCbu8lQIChQhK0kjMm1y4hng/
	 6G97Sdpegjvg/OKACI5pfWTuFiHIi5KjF7JwefPjPvOVSKKsYQq1v4sUD1aiX54CisxOY
	 GZT0hsxJnjaUc26+eu6alvwdNLZ0Ym6xE77AIzn6LjBPfG+o7tVX93zXqy/ES0sxEPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vhA0eLnCIevNQ8XZQAJ5drG3uVP2Uo7mZJ7ZmJtYK1A=;
	b=GHNm9n3V8A9+DuOfySW7V5XNqJUu4CnfXRzxdzbi7uT+tHKR9F5THeMRo9FHVPYSQ+Ji
	 kTZBNeYnpiy0ocIzCdi1Dj53WWK/6LMPnp0lkD4FGNbCXdKBp5RLe0NGIlZYaZtNSvciS
	 1McWk/9mqedI36ijGwVNn/ZNI1JFKeNEW8eg3vEt6Nbu64RVDWpGqMmi3zGC8PPYywfc+
	 VjTPbQkQ9FH6aPejPp97xK0U6GdJcUbkY5AQUflqCmdZIbtP9wWp95n+iit6kdynJBXBg
	 Lu83J+7bOw89kcnh3l9WwJ4USIVl7FnUdJI3yOartN9ARFhxhpBfbYTK4US++wGxTBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fCyzKfec;
	arc=fail smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C873D606A327
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 07:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C873D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fCyzKfec
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso8411779a12.1
        for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 23:07:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795676856; cv=none;
        d=google.com; s=arc-20260327;
        b=Ae4jhv0xOXDJIdeDxTGrbfiy2imaKRFX2ejq+3u6VThJrZ0zimmOLk1mzk9Yz3J4NT
         di0tQevv9dGeEBkhCPHlpLRTC0V6c91T+BFcsBMJx6OknfjokWGiw3GL2y5Hnptk0mNo
         TmjOt4NoQG2HZ0bDAfUGGezbJUbpnkaYS9of1qXMqoDmn7LwISA4XFvBzJpSfHuRtB4D
         dgIAr2ka7la9FsyYli2p1688OEIgWl2b89juS1+MCym8xC40jiQGS2EdB93+lMP8DCRX
         7ao5tsvSjUpflTGg6xSXGPSth/uj1cDk7fr4f5kU9+CZ6kvSgCkSiODE8kTAlhLDQRjG
         nY8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vhA0eLnCIevNQ8XZQAJ5drG3uVP2Uo7mZJ7ZmJtYK1A=;
        fh=zYwxgNh3NHaeZu1fLsoD7AUmUSd/jVb5HNKMvLN75hc=;
        b=b+3RzthCCZlBQDuBN1dVTIB4NC396pjBlezg0XYuLmMfw90N79d60jg+5ZPldynOa0
         SWHzdoEBqMsrhyX/ifhIGQ4w2yKrfzeS20mGbRR/RSD2WUw4ztVCaHBeyz6hzrFzSzMP
         n536+QkqrYWYbIHpQaRmBAFj1owJ0jeUuHrjQ0QvzkDWBE6G5Y4Zji7L4dWkpfof0jKJ
         YWjAFq00txEzOciI7CrMImoZjAyWCZkZZBsw8fW+jKikFrJsZzRprQp4m+tHx29iuX+g
         HDHUF22GHI0ErMZYuEA0B6/YaKB1mVZ29yaGA087ud8tISp+9+pPrSNrFvUdM0NpJXqv
         Jc+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676856; x=1796281656; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vhA0eLnCIevNQ8XZQAJ5drG3uVP2Uo7mZJ7ZmJtYK1A=;
        b=fCyzKfecv5f8OaxZ3pIDOXZsi7YPXGj3N2KdEnpmL7t2p0/dxGfckskUQKIKZDc98v
         za15HgbXQJTaRL8WKvk4Jv6T0+V5rEhRRCa4fTPLBXLvLkC8tkHvkc7WM/DXwHbSxpoe
         HwQlKFi83WrkTp0E/wwI6RdQSC/cM1G5RkEKo4ROLIx4QbXfTEGmh6bDz5bmoaOpNjsM
         VK5ZxxPi2DHIRGKtKCIUPhFmdB+g0Y865+MxswPBlNx5QF1dNABFqXImlnvXoQ9nMGqM
         O197x1LOjcUuBir1wm3oCY5q1eg5sMI0J9b72QVJepBdKiaN9nTgfW09y/kgdshifWTd
         EWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676856; x=1796281656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhA0eLnCIevNQ8XZQAJ5drG3uVP2Uo7mZJ7ZmJtYK1A=;
        b=B5AWYBowRhp0/Xu4NKMdUWR92gQXSTGpv80ZW3S4A7YTsxoUp4mADMJPe99n8oBaC8
         lDMVe8M0oxCX3ef1ZhHJB9HXWRzqSeLdJuYvtDbiJZzkUFjRY0K71zwqusXVj8EP42s7
         jkyQG7TpGLZ4D4n2eEDnBMmphQTi75c0UHJSkjkqGZ6Rpsw+Q05K6I5NAHaReUswHz3u
         eI0BR6EQfTgPTkvfzs5TP6BEaQWbuwfxlbOC483nFPTqErknP/iyyB+3N6nMs/sJ/lKk
         eK1a0zeGSvvOa71bFfQTbAOETUy5adtib1lufUWwcjQiLXAObmVP7HoRKNL2HpvjS3Vw
         tQ4w==
X-Forwarded-Encrypted: i=1; AL+hErHNdoqhwXMyIQnp5j5l//NLf4DXJe4bNoX6OR6u84gHU4HJay3S9sxjHEiaX6kSRFki8eC6@lists.linux.dev
X-Gm-Message-State: APuU4Z9O5K3kjXueI/vhFD8Aq4FM1ZRXC/dcy0rqofaWGTYRAEyQsRWB
	gKBDw3ODFQ02Nvr7jit53DLXbnT35WOjtgo0V8Sg5JIPbDxJJ7MK9umRrVEpthyKWe0hFwKLnEY
	KjJsCI/guo7rcfS6ZE/gpN6HJFX5RGjE=
X-Gm-Gg: AZFdTZdsVE0xdad016WZB083wEJ189N71nuyfE+ncKpBSR9W/+9iRZqvGugqba8A3ch
	zwLc2H6NQVEphAP0usgJI92/f6qWe6vYMtiHKND/qaOluOkePtrQY8Z4lOtRalSZtVO3ZOICKPF
	Hw4ZhR1pvR60PG/dwJB/RxYrs+A89K/gDzkz0DlLCwspEfMFc0Nn+fsQxzFjWKbtSRIXa/PmI6t
	Ihf8BzU182Ltr2XvWKxtxM3EJoJyxpocNT9BRvpj6OGBq1TWL67p5Po/t8l+ghatFMQ8U8xKc5c
	FuLoN4l2R+EG7YqYLvtuyL2yjpaqh/J6WNTMF1c4nFR5NLVRoh5bFcAtFIyZM7LCG/ZmC4CFN0x
	qxg39W765QAEon8xphuUVVPohk+ntLm9rCOgJ0UWgZbqY8VJn+MWQCv9jPcmTGVGH7KWKBGk=
X-Received: by 2002:a05:6402:42c8:b0:6ba:90b8:6584 with SMTP id
 4fb4d7f45d1cf-6ba90b86c26mr10129365a12.27.1795676855879; Wed, 25 Nov 2026
 23:07:35 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122000856.536902-1-koray.fra@gmail.com> <20261122000856.536902-3-koray.fra@gmail.com>
 <CAOQ4uxhegn1z=41_MHL1Zu2hXuPtzNhC=x4gd371oaeJE4-weQ@mail.gmail.com>
 <DN2N6A68PBO1.2QT8ZOARF4I6L@gmail.com> <CAOQ4uxhDQqEQ3T9NveBFpUmSU032BxrNV5D+_zHj8u9LOQY+qg@mail.gmail.com>
 <DN4DRUYPHYMP.20U4DYV5VBN7P@gmail.com> <CAOQ4uxg0g+XkPb3-kQS5ez1-rp7Q=BkYDHW0CGOFhpbcf70yMg@mail.gmail.com>
 <DN4KLSM2OO0K.2C8Q5CPFBVNL6@gmail.com>
In-Reply-To: <DN4KLSM2OO0K.2C8Q5CPFBVNL6@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 26 Nov 2026 08:07:23 +0100
X-Gm-Features: Aa3M54p-xXrArmKFQVXQGyMmIHEH7IQOans_pobuFbiou8Pi118hgiXnigLCYjk
Message-ID: <CAOQ4uxhpJygZH-arLFSUYEEfqFG96Sr3_6CWakfSkdWxEsOxMg@mail.gmail.com>
Subject: Re: [PATCH 2/3] vfs: add xflags mask to fileattr API
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

On Wed, Nov 25, 2026 at 9:22=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Wed Nov 25, 2026 at 5:51 PM CET, Amir Goldstein wrote:
...
> >>
> >> My robot proposed 2 fixes: either don't introduce FS_XFLAG_PROJID
> >> (which, eh, not the best imo)
> >
> > Me neither. It's inconsistent IMO.
> >
> > But it is inconsistent in that we want to have a way for chattr -p to s=
ay with
> > the new API "set only projid", so we must have the flag, but we
> > mostly need it for the mask, we don't really care about its value in
> > fsx_flags.
> >
> >> or add a new flag to be used in at_flags,
> >> like AT_FILEATTR_MASKS, which would resolve all our legacy vs non-lega=
cy
> >> problems, but it would be in *at*_flags, so doesn't really make sense
> >> semantically (but it would work well since file_getattr already reject=
s
> >> unknown at_flags, so it wouldn't cause problems for old programs).
> >
> > I think this is an overkill as well.
>
> Semantics issue aside, I think this shuold be the way to go, because
> it's explicit and doesn't rely on guessing based on struct size or mask
> values.
>

Yes this is a good argument.

> > We discussed this before.
> >
> > Attributes that have X_value like fsx_projid have few types:
> > 1. 0 means disabled (all existing values incl. projid)
> > 2. 0 is a valid value but cannot be unset (btime)
> > 3. 0 is a valid value and NULL/unset is also a valid value
> >
> > Only for type 3 does can the interpretation of
> > (!XFLAG_X && !fsx_X) be considered as an "unset"
> > and anyway, this will require support in individual fs.
>
> IMO !(xflags & XFLAG) && (rw_mask & XFLAG) should clear/unset the value
> in all cases, ignoring what's in fsx_X.
>
> And all existing values would be of type 1 for VER0, but of type 1 + 3
> for VER1.
>

I agree that this will be more consistent.

With explicit opt-in to FILEATTR_MASKS API
vfs can determine that
(!XFLAG_X && !!fsx_X) is alway -EINVAL

When fsx_X =3D=3D 0, the value of XFLAG_X does not really matter
so filesystems can decide themselves if they want to act on
an "unset" flag or not.

> > fileattr_set_prepare() already treats the existing values as:
> > fsx_X =3D=3D 0 =3D> clear XFLAG_X
> >
> > And xfs returns EINVAL for !!(fsx_X) !=3D !!(XFLAGX)
> >
> > A simple solution is to fix the flag according to val in fileattr_set_p=
repare()
> (This should be in file_attr_to_fileattr() I think, but yeah)
> > if rw_mask contains this flag:
> >
> > if (fa->fsx_xflags_rw_mask & FS_XFLAG_PROJID) {
> >     /* Possibly legacy chattr -p compiled with new headers unaware of P=
ROJID */
> >     if (fa->fsx_projid =3D=3D 0)
> >           fa->fsx_xflags &=3D ~FS_XFLAG_PROJID;
> >     else
> >           fa->fsx_xflags |=3D FS_XFLAG_PROJID;
> > }
>
> I think this would be a bit too overcomplicated to understand, and

True

> robot says (with the current v2 code at least) it would make e.g. ntfs
> return 0 instead of -EOPNOTSUPP for e.g. chattr +S.
>

I suspected that existing filesystems may have different legacy behaviors..

> It also told me that statx already has AT_STATX_* flags that don't match
> the at_flags semantics (and indeed, AT_STATX_FORCE_SYNC/DONT_SYNC don't
> really make sense for "at"_flags semantics), so my only blocker for that
> solution is gone and I would really prefer that approach since it's way
> simpler and way cleaner.

Git history claims that I suggested making this an official UAPI policy:

b4fef22c2fb97 uapi: explain how per-syscall AT_* flags should be allocated

So definitely no objection to AT_FILEATTR_ semantics.

>
> One more thing gemini told me is that if we don't want to use AT_*, we
> have to choose between (copy-pasted, "ntfs" meaning any mask-aware fs):
> 1. Keep clamping fattr->fa_xflags & rw_user_mask (VER1 masked semantics
>    are clean, but recompiled VER0 RMW tools setting unsupported
>    flags/projid on ntfs silently return 0)
> 2. Reject unexpected non-zero bits/fields outside rw_user_mask | ro_mask
>    (protects recompiled VER0 RMW error reporting on ntfs, at the cost tha=
t
>    VER1 callers must zero or mask fa_xflags / fa_projid / fa_extsize
>    themselves rather than expecting bits outside rw_mask to be ignored).
>
> So I would *really* prefer adding AT_FILEATTR_MASKS and setting
> has_masks based only on that.
> This way we can keep the whole legacy path frozen and not have to worry
> about weird edge cases (well, converters code aside of course).
>
> And personally in this way I can reason about the changes a lot more
> clearly and I can finally take a better look at the whole code and maybe
> simplify it in some cases (probably not, but I'll have to see).
>

All very good reasons IMO.

> (Unless there is something equivalent to AT_FILEATTR_MASKS to filter on,
> like maybe a FS_XFLAG_MASKS (?), but that would be even worse
> semantically I think)

It's an option, but I think AT_FILEATTR_MASKS is cleaner.

Thanks,
Amir.
