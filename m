Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785381;
	b=El7/+gkVtEPaQrdBPZjnwbdozXYgYYtLwq2QHvnfmRAhfbdeP5FUUibevG2IsMy8O5se
	 5Qkt3o5iyWlPy0CMOUqVVUg/BVPEqX92wzuYrxY8nhG7ijDicD811ZJJEsY9MOnFmKGAK
	 KWrQdRusPrZ/G2/kIZep8YDjUTNH+EzXBa37WM9K6/ni9PCsprlDLerX2FWLj5niUnytq
	 Ixn4O09lnAC2i0d1/uPKs2f928buXAMPe7xaAz80lhfcW0ja00mHzve7zeDH1+AEa6KIP
	 YYTULmyY8+o5VA2jNv7g+mIs9JnmZWIJMSVDsThjJw8wiiihXShAAKR7MxculwxG4Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:X-Mailer:
	 References:In-Reply-To;
	bh=KP1KQQ5zc6J2penQP9T7HSMskKwpsejXhyxZijwDgBw=;
	b=Smgxibj+V95TTd9v6kY1p7lBzTR8+bithDPnrLPCrmWfujfy77Apv+tYRcvSEC2SjZ/E
	 UepdYapua+4x6LNme7Begib8KCl2s+V+MMh13tWcN1l7u6cQ53OcOoseWKqHw3iAD0lXG
	 a1L78HMNmsjjjT0YhDFNQ0PGMvyggnVBJ0DqM6TMufl7l44HbLoGjvLx8UcbHauHozp11
	 /J255hOOL7FHRoEgbRt7jy22lhSiZTCF+YKhJsgrQxVufztse5asfOETd06UWX4MGwp1u
	 gVpFecNy8/Lpqvj9R9UHXjjLo2Z6ZlAA6M/0kiVaP5B7Ur84IEOqofKfHVLCE78f5hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ML+Vq+0a;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CA8606A324
	for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 13:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28CA8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ML+Vq+0a
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so82089635e9.2
        for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 05:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785378; x=1796390178; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KP1KQQ5zc6J2penQP9T7HSMskKwpsejXhyxZijwDgBw=;
        b=ML+Vq+0aiGl7yhWU/TiBKTypBcvLBM1W+Yk5M+5jn9Zez5Bpv9feKaMPmLqhOpiSf4
         +2PkddIsarbe/ag9E128hf9DYC61Ec9cYaaZIolY9JNgNK8UuX/7UDUDipA6AnmfQ+Hx
         rn6bN19kFxFJyYqUSSXpS7VoCW9AmrmWsEZILNKkni33thOJTayqF2CflY+PLPtBplRn
         HBkYyUzSkiZ1w1vOl87UOkFwxDSpy9bzQ71CpNsCbSwmIb3FMOCOQMZf8Bnx3jOIrG4h
         T9nhKXFBWLLZdswuFGys82aRjhwdJGBOevcw7CnTJlHZi+3dfT3Am1Vmt6VQUpE07iW1
         KjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785378; x=1796390178;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KP1KQQ5zc6J2penQP9T7HSMskKwpsejXhyxZijwDgBw=;
        b=doKgkwh0fEE3McDw6rfq4yYDqn6uHboagPhMwPIuL0h03GVsz0O3vRGEnM2I+e9Z60
         6TfIIR4UGjxF5V9cG/UaXvReOcLPa4JoCfMcyCNpi3Dn1P54FTjuKYI6wscxFIaD7rse
         FGemkq5IbLp/yY8gi+nmgMg5InRPl+2KNODBtFPl6+PSQAxDJ/JDnMIAzx7OaH3wM/BC
         ZxY2a+o9MMhdsPCxp0GXWE1meuXDS0ulMNbJXC4vhsLjRWM7h+azIaixIaOiTnlfSBMq
         OZTUJ/pAaznZGpoT1cF3Yx5XaxiSfksH+qVI3vYwyTMwkGnx5m6WGLkwdz6rIQsgobbx
         Hw7w==
X-Forwarded-Encrypted: i=1; AL+hErHAc6AnO++8jnoW1/CsBbFJDaMQiAjKTktiPkeBm2Mgw1Uj2vjOhHm7/iupfOrkN1EaiD1g@lists.linux.dev
X-Gm-Message-State: APuU4Z8ZbRrXvoSbjNb6UUPX5eyoFgttRwklzt1185K/l9FzCR16FVS6
	DWSj/fk0UQSdr6drFZ+9Ce4K5GyWY8F9nixmKj1dp1tvq4JrvUkvOMO/
X-Gm-Gg: AZFdTZepylOBI2czZNWR0fuW20JIhGiwSimYXnviUikx0bpcaiVrYu5OeEcdSUdSKnU
	1deDCZgoQ6/NCA+xDVBmqGoXS77DVprjE/8ELOy10qFxZaUd4qvz7j4/IUyZ0jHALT5WvyT5I+t
	ijVvtrxW5rFiCvgEb6GTKkBgKOF7MDlSTkvyheyZTl9MYa/SDsiPzi9EagrDas3MoqshEqwzWUP
	RD1WnKve7e7YyrldaoIVpKzSVh5OiLo1AM6SIEFa7YsVPjuRbs1CYQMtUc2ZUoKGG0HP3i7rJev
	liU1abSmAUY+atlosTddNdVa7mr4yNAUSjybAdHt4xWL+nPfW6muhz934Kz40lh8AFY5hNWm1dh
	M6wadHzs3p3r9HEqvRoz4qHMd+iPtOuFizH38+ZBGzhBT5o9Ec1cbaqUAs47q5t/aAmV5PpxQp2
	ESI3J6mk/044pvYuiG87xQFrgl94VU2mWrnLDojcjHADXf4zBzjOMcVNFGacIG4QsIoRK3kKRrr
	o2bSRrNTYKOU412QWtVQR3WXtA/haDCABDcLDLWZzmDZzBZyKrKvJj0AaejPgFO74BL+nDWwPVf
	xcEJKNJIp0fUIHEUYt8F8kfObvutVKWsh5bzVmeLMy0zmQWto8erxGX7Z4sx
X-Received: by 2002:a05:600c:6219:b0:4bb:a5f1:fc5f with SMTP id 5b1f17b1804b1-4bba60168f3mr171039875e9.26.1795785378311;
        Fri, 27 Nov 2026 05:16:18 -0800 (PST)
Received: from localhost (mob-176-246-245-5.net.vodafone.it. [176.246.245.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm947107665e9.13.2026.11.27.05.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:16:17 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=d266ab6a5424ddaad121a0a52eacc7f99696bf23ca7b0dd531f4216c8dd3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 14:16:09 +0100
Message-Id: <DN60SA2AMQI2.3C10NXIO3L211@gmail.com>
Subject: Re: [PATCH v2 2/4] fscrypt: update fscrypt_prepare_setflags() to
 use xflags
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
Cc: "Namjae Jeon" <linkinjeon@kernel.org>, "Hyunchul Lee"
 <hyc.lee@gmail.com>, "Eric Biggers" <ebiggers@kernel.org>, "Theodore Y .
 Ts'o" <tytso@mit.edu>, "Jaegeuk Kim" <jaegeuk@kernel.org>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>, "Chuck
 Lever" <cel@kernel.org>, "Jeff Layton" <jlayton@kernel.org>, "Jan Kara"
 <jack@suse.cz>, "Alexander Aring" <alex.aring@gmail.com>, "Darrick J .
 Wong" <djwong@kernel.org>, "Andrey Albershteyn" <aalbersh@kernel.org>,
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "Lauri Gates"
 <lauri.gates@gmail.com>, "Christoph Hellwig" <hch@infradead.org>, "Dave
 Chinner" <dgc@kernel.org>, <linux-btrfs@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <ntfs@lists.linux.dev>,
 <linux-nfs@vger.kernel.org>, <linux-api@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261126163114.403846-1-koray.fra@gmail.com>
 <20261126163114.403846-3-koray.fra@gmail.com>
 <CAOQ4uxjGLfuZMFABCwMvdXwnU+P24G_aTJLudWbjeSmWwyDF6Q@mail.gmail.com>
 <DN5YPR39J7QI.1S1LCFLNUCZNL@gmail.com>
 <CAOQ4uxgzmB0dEpQCVGKOc8reJ6OFV=BxDMgRW81aKiCMwDSn_Q@mail.gmail.com>
In-Reply-To: <CAOQ4uxgzmB0dEpQCVGKOc8reJ6OFV=BxDMgRW81aKiCMwDSn_Q@mail.gmail.com>

--d266ab6a5424ddaad121a0a52eacc7f99696bf23ca7b0dd531f4216c8dd3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 27, 2026 at 1:02 PM CET, Amir Goldstein wrote:
> On Fri, Nov 27, 2026 at 12:38=E2=80=AFPM koraynilay <koray.fra@gmail.com>=
 wrote:
>>
>> On Fri Nov 27, 2026 at 12:35 PM CET, Amir Goldstein wrote:
>> > On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM koraynilay <koray.fra@gmail.co=
m> wrote:
>> >>
>> >> Update fscrypt_prepare_setflags() to use FS_XFLAG_* xflags instead of
>> >> legacy FS_*_FL flags.
>> >>
>> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
>> >> ---
>> >>  fs/crypto/hooks.c       | 10 +++++-----
>> >>  fs/file_attr.c          |  2 +-
>> >>  include/linux/fscrypt.h |  6 +++---
>> >>  3 files changed, 9 insertions(+), 9 deletions(-)
>> >>
>> >> diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
>> >> index 149498bdab94..52d6a33fc9e9 100644
>> >> --- a/fs/crypto/hooks.c
>> >> +++ b/fs/crypto/hooks.c
>> >> @@ -182,10 +182,10 @@ int __fscrypt_prepare_setattr(struct dentry *de=
ntry, struct iattr *attr)
>> >>  EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
>> >>
>> >>  /**
>> >> - * fscrypt_prepare_setflags() - prepare to change flags with FS_IOC_=
SETFLAGS
>> >> + * fscrypt_prepare_setflags() - prepare to change xflags
>> >
>> > prepare to change the file attributes with file_setattr() or one of
>> > the legacy ioctls
>>
>> Ah yes.
>>
>> >>   * @inode: the inode on which flags are being changed
>> >> - * @oldflags: the old flags
>> >> - * @flags: the new flags
>> >> + * @oldxflags: the old xflags
>> >> + * @xflags: the new xflags
>> >>   *
>> >>   * The caller should be holding i_rwsem for write.
>> >>   *
>> >> @@ -193,7 +193,7 @@ EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
>> >>   *        another error occurs.
>> >>   */
>> >>  int fscrypt_prepare_setflags(struct inode *inode,
>> >> -                            unsigned int oldflags, unsigned int flag=
s)
>> >> +                            unsigned int oldxflags, unsigned int xfl=
ags)
>> >
>> > This here is a backporting landmine -
>> >
>> > Changing the semantics drastically without changing the helper name
>> > or signature.
>> >
>> > Please rename the helper something like fscrypt_prepare_fileattr_set()
>> > so that backporting mistakes will be caught at build time.
>>
>> Yes, though, would it maybe be better to just use xflags_to_flags() in
>> the vfs patch instead of changing the fscrypt function at all?
>
> Yes, much better. I agree.

Ok, will do in v3.

> Now looking at the /* initialize missing bits from old_ma */
> hunk my reaction is to look away its huge and it should be
> using helpers probably called from within fileattr_set_prepare()
> itself - because if this is de-facto preparing for a set.

(I'll reply to this in the vfs patch thread, so it's easier for me to
find it again)

Thanks,
koraynilay

> Thanks,
> Amir.



--d266ab6a5424ddaad121a0a52eacc7f99696bf23ca7b0dd531f4216c8dd3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCawmCmgAKCRA0bnTtJTDo
OM+8AQC9tcOsGFPF287JKL4pLZnhvZs7off4ihtuxm56vgpT2AEArgij7OQEsKKN
AWm00Ai0JaPzKxHQtiid5dTOQhG5TAY=
=uJ63
-----END PGP SIGNATURE-----

--d266ab6a5424ddaad121a0a52eacc7f99696bf23ca7b0dd531f4216c8dd3--
