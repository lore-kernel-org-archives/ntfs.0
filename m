Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685018;
	b=CutRonzrSZBIZnGBQIsfJRbfnKaqDjUw1/dcl2TgvTuHowmHpOMzi7V0ardr10uBxzHR
	 cMd5yEf5x4YVlPEW1cgpg452vSNcfajHDY6qeVBsvyuR5HZ5wdoGSc8UyOPNq7COThnfe
	 NZUf5sEKIqHussVWa2nm3IxGpMsRyybEWI/mGizmHUag/CKcTYqHfkZWOwzSNVMBemFZt
	 7bYpE+s5ngH/7hXY3cfl85R8kOco2qrx5OKqU1QvM7sKns81NokBksfJdxAzBK2+lh5uo
	 0KNfHIhOwvtRlDzc6ljAjSc7lk5ASEWyZffyvWpLRvwTdh2VaDlVVsJGXBlYV47WTWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xckR6blDjDVAhqTSlG7y2c/dJk+7MAk3ZiUn44VZKcw=;
	b=Y4Qk0rqqC88fRghpQ6RjlZIJEV8hn13ZGEM/R/VjK/Q6SjAYDGwJj158V2eAlELsBKHU
	 wP32mr2bSXpl+PN7LzUfB4aDi/jJv1fsM+zVSps1WpGFaNiT8yIPnpjZT2nhQZtfPAMSe
	 WCKPKIHsQ8rQ7AXf3BJtQCyLG1qC1MusDhzcuGAQHzsE59hONJxGjXfSRIq5d7KTciyPP
	 kPdzQRe+4eEWmotU7kf2Bd0/GhbTea8IiduTTgXzBOR1smHrTJS0DcD5FENhquQOc9ze1
	 b7M56HmyAZC/HCq2NEY+24DBqahh5JVzPpo8TiXNOWLxwIhJal7gAhNBGPSgVzInUUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CSH7UW2D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45355606A323
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 09:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45355606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CSH7UW2D
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so8747552a12.2
        for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 01:23:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795685017; cv=none;
        d=google.com; s=arc-20260327;
        b=Lp95yMuh5YVF6awW1vBtyoB0o9xoKmU7jAL/JFqd95RLkhGLZeoy/V5zN8CM9GmM7f
         LGQQCYr3YH4AQrFIhdWQEPyAw1vz6nW3kp5mx1BYWZjNjX5qGKgRMgPlpDuji0QRjw9e
         Rp4W0RQ3lrt08hws1j7Bkpf+2EqKbz9bhFPzhwoGmEINlzJ8XtzOdelnAAjHIaPwG5Dp
         hUDKlXnntx6z2zb8gjSszHxvVmtQ3CRJerEFvKHOqAxPwOAi2zx9u7o4HFYj8ZqpMRw5
         3yFG6kawpe0bPxyffoOxMbypA1zj1h9C4pwV4LToFwY5DksWoaXzdfxa+0AcgoDc57pW
         BTQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xckR6blDjDVAhqTSlG7y2c/dJk+7MAk3ZiUn44VZKcw=;
        fh=V+BwD3WvcncvoGRHznkKD17WQdJAR2B0ysUg3gGNrnU=;
        b=mbGg7rclYiRRPHskK0jYYsIjtR7jJAiHmUWGUfW7CwN4dpkNYamuHnX4a9N3o0GwGl
         5TWQmEE0pnF+FVTPfAGGmsNKQDWu1QmjlkZ+XBdIyszaoy+RBkzkZYHDxLkuQXuYinaq
         os2Bc2AEwUHSFoPAmI8Zzng1VWCk3lqJURDJ1l2roobRL+IpCYy+SHF8SE53BwnrTcmF
         eormUyV/IHzPNDYCMQ1ik0Tg5pN4wF1cd6kuKWDGYbuTeU1ZaQ4TY31R4BQpYVTuf836
         Gm273gy0Fiy923lhaIokVhZka1EQAkOZNhtmKlJ5PnliG8/0bAl6VuRSyZCnjIdII2iI
         iYxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685016; x=1796289816; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xckR6blDjDVAhqTSlG7y2c/dJk+7MAk3ZiUn44VZKcw=;
        b=CSH7UW2DJRTtMHd9mAtUj+F1fCz36lN/8em+efbPcULnrYM047ZCQ36NeCVxzgsMKV
         OUBMvqNIA+bpllzZcNjWjqD2WwLm+VqhnbjLvmKpIhrl0aOfytSkx74kxvIgh6zUr8LD
         ePuusfcV2nIExbgAQJRWXBIm3EHJCvMAhyhtaoQG46hlPm2F+4QI1H+tymDQFSAimOTa
         ZC3SB5WHYCNNsjVfmbdlto+3QxRfZjI9XFk6dsIekfGhubdVUvt1SbKvkGVIJ97oCoqb
         0HPqqK2vo3QiN/J2wzGOmKfYpaXH340d8+sVn/pEMfbm+6tpf9np7qrjkf8i9wCEj1CN
         iGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685016; x=1796289816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xckR6blDjDVAhqTSlG7y2c/dJk+7MAk3ZiUn44VZKcw=;
        b=atsdSTIl8ASCJJ/9SsJPIALMF9Oie5kfs68dkzF15EbrMPjzpJ/TPDhI03qTxRJH0I
         ebUReTXjriJu3pzP3w54OJUP+pl0cb5MA98i7OcmEJySxf6o5Qi+s1IzoOwEULV6SWiM
         XjGWDM78qqOlh4OBsasziwM/nuOSjm+oozImZeZhsVwtOe2eqmmJ8O0aJQBMFp/fx/hw
         cJsH2zVsMNTp2zfzx98/nWIH8jQXHTyyxls9mW2KDMaHUpBqCTQYGqs+BmUQHCf9TFq7
         i0CpKe/+smUM46Sn4Lsyu6PsDRuovs0yCEc5dRnPScbAG2aZqhOcuK2XHa9UpbdKhFzd
         uAUQ==
X-Forwarded-Encrypted: i=1; AL+hErFFAcN6be952NTX5F8v0mEK4w1VfF/b7OKqOtUbmIYskalkKrvc26noJkeQToeuuQTSn6/A@lists.linux.dev
X-Gm-Message-State: APuU4Z9qgTXcNN6jGNOkN+NmmK5thMJXmmPGFydaJJitrUETywulyAMT
	MVGl8op1MHrz8CmMaj1yxfipD68PVXN12bu8tQS7eHg4ns/fQS92BuoC0glXxZ28298rNaPXpOK
	7a0hUvaTeY3/lLUh3/iTiYckIf9q71NE=
X-Gm-Gg: AZFdTZfhAU5I/XeuG6nRxkk7VYR0Hf2bcUVC5EcpFc031Tr2z9fgYVQ/S/92WhyKlVn
	dIRll6/pUPppozJh8SyA71isbXE9pLPhSTJ6vEF2Gqm1HsQ897LVgmRsFekAHQYUvLCdv2w+UfE
	qJO7g4VlzMwjx+BXJoVcLipEd7e41pdf2PSe8P8CwMyi4ecgVA9FO42aumR7drHnjvpiTCxOOQ/
	VTXnqFxqXi8bX4y+UqlgDz8Uytr8gTCrotM2xkvp91PNwUZ/OmABkYKeF70yb81UOjUIAFEqvRD
	twjYq6Zye+oOzTivOqgiQAJo7tI1nfZffFqrrsPVmjF7QmeaHFzApBTvck7ebJliUw8TyxEj627
	oLjHZz1TMlSaVZlRvrmLOoO65e+hq2ZxG57s/PNfqNdJCTUhYyGPvYEJk/L8zpUh9r6Q8VQ==
X-Received: by 2002:a05:6402:1501:b0:6b7:182c:5d4e with SMTP id
 4fb4d7f45d1cf-6ba37c7c3a6mr11134218a12.5.1795685016112; Thu, 26 Nov 2026
 01:23:36 -0800 (PST)
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
 <DN4KLSM2OO0K.2C8Q5CPFBVNL6@gmail.com> <CAOQ4uxhpJygZH-arLFSUYEEfqFG96Sr3_6CWakfSkdWxEsOxMg@mail.gmail.com>
 <DN50PH7HHSWZ.3H4T25JFPQECY@gmail.com>
In-Reply-To: <DN50PH7HHSWZ.3H4T25JFPQECY@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 26 Nov 2026 10:23:23 +0100
X-Gm-Features: Aa3M54qgNadyHP5LQf6BsvKupVU6AY9XgOmNRBH-yAFSYibTS_3xHgBMtDNHcI0
Message-ID: <CAOQ4uxgJTSspRJqRFaSJxKUShVULaJpMv8UhBFR-DV2kUe1sXw@mail.gmail.com>
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

On Thu, Nov 26, 2026 at 9:59=E2=80=AFAM koraynilay <koray.fra@gmail.com> wr=
ote:
>
...
> >> > Attributes that have X_value like fsx_projid have few types:
> >> > 1. 0 means disabled (all existing values incl. projid)
> >> > 2. 0 is a valid value but cannot be unset (btime)
> >> > 3. 0 is a valid value and NULL/unset is also a valid value
> >> >
> >> > Only for type 3 does can the interpretation of
> >> > (!XFLAG_X && !fsx_X) be considered as an "unset"
> >> > and anyway, this will require support in individual fs.
> >>
> >> IMO !(xflags & XFLAG) && (rw_mask & XFLAG) should clear/unset the valu=
e
> >> in all cases, ignoring what's in fsx_X.
> >>
> >> And all existing values would be of type 1 for VER0, but of type 1 + 3
> >> for VER1.
> >>
> >
> > I agree that this will be more consistent.
> >
> > With explicit opt-in to FILEATTR_MASKS API
> > vfs can determine that
> > (!XFLAG_X && !!fsx_X) is alway -EINVAL
> >
> > When fsx_X =3D=3D 0, the value of XFLAG_X does not really matter
> > so filesystems can decide themselves if they want to act on
> > an "unset" flag or not.
>
> Hmm, I think fsx_xflags should have priority over the value in this
> _masks API.
>
> In my mind, to clear PROJID a userspace program would only need to do:
>
>   struct file_attr fa =3D {
>         .fsx_xflags =3D 0,
>         .fsx_xflags_rw_mask =3D FS_XFLAG_PROJID
>   };
>   file_setattr(&fa, AT_FILE_ATTR_MASKS);

If the program (e.g. chattr -p) internationally sets rw_mask =3D FS_XFLAG_P=
ROJID
what do we gain from not requiring the program to also set fsx_projid =3D 0=
?
I just don't see any wins for anyone from this design choice.

Maybe I am missing something.

>
> and have projid cleared (same for EXTSIZE/EXTSZINHERIT/COWEXTESIZE),
> while to set/change it:
>
>   struct file_attr fa =3D {
>         .fsx_xflags =3D FS_XFLAG_PROJID,
>         .fsx_xflags_rw_mask =3D FS_XFLAG_PROJID,
>         .fsx_projid =3D 67,
>   };
>   file_setattr(&fa, AT_FILE_ATTR_MASKS);
>
> and this:
>
>   struct file_attr fa =3D {
>         .fsx_xflags =3D FS_XFLAG_PROJID,
>         .fsx_xflags_rw_mask =3D FS_XFLAG_PROJID,
>         .fsx_projid =3D 0,
>   };
>   file_setattr(&fa, AT_FILE_ATTR_MASKS);
>
> would have the same result as the first snippet, but not the same
> meaning, since this would mean "set projid to 0" while the first snippet
> means "clear/unset projid" (but in this case, for projid and all the
> other already existing fsx_* it would have the same result).
>

As I wrote it could matter per attribute and per filesystem
whether set to 0 or unset is different.

The man page language should be flexible enough about this point.

It only needs to document the invalid combinations.

When proposing an UAPI change I often included a man-page draft
as a proof that the UAPI can make sense to human readers.

Thanks,
Amir.
