Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795474624;
	b=T5JkwR1bVd7vPc5OZaE+oGM6lPtitcAKCXJ1twCUt/SFpqJ4w0wtybyZ1x26TjxOmKPD
	 ysV8JiVgH77/LoyUFQ5hSOPthf9jekGFNWL4VYy1OsF6eH5DgM/iPHfiGKjFVcAtxXjBl
	 zx3Xx8fgOs2mkLiXjDYAh7Z85zGqdc7AAgHjwhOH7YIU92uKugdh6PI2YmL//T6jBADRQ
	 y07GHwTuYQeXsh7v5PbRGiQmlso6MdTmX2xHLZA140wYJOph3/KcNhXd/PBsvEQzb4n4T
	 mNR3uaIbcqq+7/n2lmoUvsxvgFwUXKu/m2chpv8vVvzgmKdGF1yB07C5F4MrDWR5VsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=sPZNFd5TfGrxBwoDp6YQ8+YhzR/t7dsRFdx4A9ccfqM=;
	b=bpHlGKj9lcO1Ne2WlFVyCaS3q3Sbmy/PfOKqJ1Y8WPILfZx3p8bpSaC+i2wRCeP049vu
	 tq4fBKjYk8+LhEZHkAYRlT84M4l2oEuRdGpVK87ld8AmUkH0jSjmhST0/hDJrUyQiN9xj
	 2xkV3TcQNVatssD4JWydlf5yt+unhptqxwnoQob9Y4UFCo/mrrfFiAvg5meO5tS2ad/8W
	 p4ondAuoxxHdrklSFlvS5JN+egAhrCfuSQamWapgVP5RSv43MD/++16b5gdROn6IFkF7B
	 MFyXdGhYv8XkhlmgHn8jOuHFveHgys14PkMmFO6rV0cCmdXxJ6P+h5Ysd2A5+XXEw+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQ2zqsFb;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70283606A327
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 22:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70283606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQ2zqsFb
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so40897195e9.0
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 14:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795474622; x=1796079422; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sPZNFd5TfGrxBwoDp6YQ8+YhzR/t7dsRFdx4A9ccfqM=;
        b=eQ2zqsFbs/xxog/gtQj0/EzrOY5/w3Jg6fweT9/FeEEAgresJSoG9t7IVSO+tgi9g4
         3x/WmyrHYMDtob+FLMFRLSsnYZXeJjzVmxA6XHNLyN1eP2lgwMy+/S225e/KzP00Io2m
         uj+dPaJY4Xvx2I2Y9iencOP7JScDtI7tydj4fMHqj+6dhCW8tUe6+ezAPxBQwZwy+uZV
         abzwjUChNVrlCcOIab0YKhAzUxTfFY3d23Mg+Ad9JQuL84Db++OFK+0sD4+fYqI+Bv81
         aTOYlBHPlr/wJDJMwR2eNkWKGoxRHnIEnNYFvaf6zrgkIkLlIYOUWHl0RHAHQ1yJsYQa
         c28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795474622; x=1796079422;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sPZNFd5TfGrxBwoDp6YQ8+YhzR/t7dsRFdx4A9ccfqM=;
        b=oZPkktp3MlwyKLRd2xVLS6DdcdKHv/EL+lljdWPVeMiLoz2hr0TNAhTZ+IGnlc24jl
         +jEG63327fpf6AqesNCLU2SkUAOEkeyBpitVJXguFunD1+jasrPUbD+AyNIukUfqe9sI
         0sox9ZseumcK8D9azLOSPVrKn2ydhACYnJ0vvKWBqqJysUCWTrp68KEvuyEYecbSJjog
         wiEdBNFHHa6zO5TU1DY9CSvROR4jFDh2HAud51bXMmWPKpy8TKEiCXYrqwvZc45uA5O8
         8/JcUklhlogQ2+uiBGoEm6XWK2Dr52DlMgYfo6kAgnGJ7qgo69/0GvFqB/PCdO9P2i8t
         drIA==
X-Forwarded-Encrypted: i=1; AL+hErE7KOABC6a4fYK1AQxTnXLCkp0jIo2MVPlBeVwwCFNB1SfKmTq+sGdbAagLidSNX1qm8czw@lists.linux.dev
X-Gm-Message-State: APuU4Z/rsvQI2hzwaTqzATCnsxgPr85QAmpFW+po6pa6dGotao6v+kpy
	fPROvpHyhfxdpWo6ihJts3KalxPVJffBNl5YIgnGXzVxbRyVZCA/St3v
X-Gm-Gg: AZFdTZd6lgP8aB/OectUufYNAu37o6pbt+SDwK5gWnzrh2l89hmwBkiiXwGcozJQZNx
	yft7GwkmXf/alN8L7jXU3G8IFtd8UL3PvXZUw8NOmmybNp3C8GutyF3I3vQQnj/eIW9gmx1Up/a
	C2FsuokkTpfrOIDObu+wUdw/FPNfwuwTiTHt8Mb+5g/tl+9/2OTiJJAvCSKw9fhzoiriCunN2lJ
	3WQ7fHETyfQnNP+Tf++N4uhgWyk2m4CEFuMLjfBDrYZBf3uSTixT8wuzIkrKQVbz6HIPW83xWAL
	Yhs8YYJ28nQTdJuLusyv5qVXZATM3WCk1C1ClDzvNS7QDAf2p/aWIpHCrJqEvKT0uGtanp2PE8X
	9GpcOVAi9WiHLXPbya1KaD3RcqjvLwjuLG6fRr79uKtYTBXTtYbs11YkrmKlkqiODA+eZxnBMZR
	pdnS3QdSmpK81NDKgqt9uBxxOQvE+cN/D6qZO+jjUOX9vsChzVzs9RqeI/uQpxp/B6m2FQpzm3p
	yuvZ54eGV0WNZbXqCY2lXiG3XolsLvVkYg0EFZEikqJ4hKlPFYCHwsY2ZILgx18lG3sxHQakGPF
	za5EUj7L1qTXXhUAPz4W8NeSmA==
X-Received: by 2002:a05:600c:1548:b0:4bb:7347:d5df with SMTP id 5b1f17b1804b1-4bb88814405mr279680765e9.13.1795474622192;
        Mon, 23 Nov 2026 14:57:02 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm387664415e9.3.2026.11.23.14.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 14:57:01 -0800 (PST)
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
 boundary=087e7b3569ab5fea48a039af92ae6dae8d0b4b3bd53fcaa587687d1ee3aa;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 23 Nov 2026 23:56:59 +0100
Message-Id: <DN2YMTH77KWE.3IPE9OG8377X0@gmail.com>
Cc: "Namjae Jeon" <linkinjeon@kernel.org>, "Hyunchul Lee"
 <hyc.lee@gmail.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>, "Christian
 Brauner" <brauner@kernel.org>, "Chuck Lever" <cel@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, "Jan Kara" <jack@suse.cz>, "Darrick J . Wong"
 <djwong@kernel.org>, "Andrey Albershteyn" <aalbersh@kernel.org>,
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "Lauri Gates"
 <lauri.gates@gmail.com>, "Christoph Hellwig" <hch@infradead.org>, "Dave
 Chinner" <dgc@kernel.org>, <linux-btrfs@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <ntfs@lists.linux.dev>,
 <linux-nfs@vger.kernel.org>, <linux-api@vger.kernel.org>
Subject: Re: [PATCH 0/3] Add f*_xflags_{rw,ro}_mask flags to the fileattr
 API
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261122000856.536902-1-koray.fra@gmail.com>
 <CAOQ4uxgf2KE=Ag13EPAu5=KnrFwt7zRH=im-qmLc8+i10Tjd+Q@mail.gmail.com>
 <DN2X3RC5JUFQ.2LNGLQOUX4ZPF@gmail.com>
 <CAOQ4uxhsv_1EEqAZ3Ebp5Uy8Q6nvEnE3EAomJjjQO86nTcW0cg@mail.gmail.com>
In-Reply-To: <CAOQ4uxhsv_1EEqAZ3Ebp5Uy8Q6nvEnE3EAomJjjQO86nTcW0cg@mail.gmail.com>

--087e7b3569ab5fea48a039af92ae6dae8d0b4b3bd53fcaa587687d1ee3aa
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 23, 2026 at 11:47 PM CET, Amir Goldstein wrote:
> On Mon, Nov 23, 2026 at 10:45=E2=80=AFPM koraynilay <koray.fra@gmail.com>=
 wrote:
>>
>> On Mon Nov 23, 2026 at 2:35 PM CET, Amir Goldstein wrote:
>> > On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmail.co=
m> wrote:
>> >>
>> >> This is a follow up patch series stemmed from [1] and [2], splitting =
the
>> >> _mask change for the fileattr API into its own separate patch.
>> >>
>> >> The first patch is a preparatory patch so that the code in the patch
>> >> after can be formatted better.
>> >>
>> >> The second patch is the actual implementation, which introduces:
>> >> - fa_xflags_{rw,ro}_mask fields to struct file_attr
>> >> - fsx_xflags_{rw,ro}_mask fields and has_masks selector to struct fil=
e_kattr
>> >>
>> >> These masks have the following semantics:
>> >> - rw_mask:
>> >>   * for filesystems: advertise which xflags they support changing
>> >>   * for userspace: specify which xflags it wants to modify
>> >> - ro_mask:
>> >>   * for filesystems: advertise which xflags they support only reading
>> >>   * for userspace: ignored
>> >
>> > Nice!
>> > I think this API description is very clear and coherent
>>
>> By the way, should I use this description in the commit message (and
>
> You could use that as a short TLDR intro

Hmm, then would it be better keep only this for the commit message

>> integrate it with missing information before/after the bullet points),
>> or should I keep the current one?
>>
>> (current one:)
>> > This lets filesystems advertise their support for specific xflags, lik=
e
>> > statx.stx_attributes_mask does, and userspace can specify only which
>> > xflags it wants to change without needing a RMW cycle:
>> > - on GET: each filesystem that wants to support this new API fills the
>> >   masks according to its supported and read-only xflags, then:
>> >   * for boolean xflags: it fills fsx_xflags with the current on-disk v=
alue
>> >   * for value xflags: it sets the xflag bit to 1 in fsx_xflags and the
>> >     xflag value in the struct field;
>> > - on SET: userspace fills the rw_mask with the bits of the xflags it
>> >   wants to change, then:
>> >   * for boolean xflags: it provides the xflag value as a bit in fa_xfl=
ags
>> >   * for value xflags: it sets the xflag bit to 1 in fa_xflags and then
>> >     provides the value in the struct field; if the xflag bit is set to=
 0
>> >     instead, this informs the kernel to unset/clear that value.
>
> You can keep it also but tbh UAPI documentation is more useful in
> comments and in Documentation than in commit messages.

and add a documentation patch that uses this (maybe expanded/clearer
since it would be user-facing docs)?

> You and I have parts of the design in our heads w.r.t backward
> compat with legacy API, both UAPI and vfs internal api.
>
> I think you should put it in writing to see that you and I have
> not left anything out because this v1 surely does get it wrong
> in several places both wrt legacy UAPI breakage and internal
> API correctness.

It would also be useful for this actually, so I'll draft it tomorrow
and then send it as part of the patch series.

Thanks,
koraynilay

> Thanks,
> Amir.



--087e7b3569ab5fea48a039af92ae6dae8d0b4b3bd53fcaa587687d1ee3aa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCawTEuwAKCRDmj22qf5IG
XJSLAQDMKqaaLRonYupOnklcoeYgChReKj8OE4zSSu89z/D8OQEA7usw5cak0k1z
cR5yX9avh+N9tPTBs/BRmKcdA8wcowk=
=072h
-----END PGP SIGNATURE-----

--087e7b3569ab5fea48a039af92ae6dae8d0b4b3bd53fcaa587687d1ee3aa--
