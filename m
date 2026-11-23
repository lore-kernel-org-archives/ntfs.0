Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470309;
	b=H81LFb2o244hJ1BAJyA+zPWS+kBIQA5Ig4hML3v8yUeWe56bOntubizRqewAsWdnYDQ7
	 usrpvQmHmudzORfZxF07SFn0tH9qsNTxdBtn1JLa582ZcTe5VvsxzTCuDnhfdVOLp+0pM
	 /QpeczLyi105FWBc8TFBPb1s6HeDzKSGMsSgLx47lBY7fcEdF4obukph6yPkVCkHAevG0
	 olj+OCRbcUQsMZeoNwgH1PTZF7DJGE5Zxh60jx1X60Ut/eIV4FZdHYqfPlBPbix/qW4Hy
	 ysiXydLUdT48u7BOjWdOufT/Z8vJXY/pG524GMZPgsYCgbwqS2QaN969R03q1mVLPUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=LkpmMbGmbwOY5rWgpls3HX12a8MYucO7aG0St1F+2Jo=;
	b=OykfUK9btHuysUU3Z7Kv6eeviaBGgRY78xW7ZIijx97W42tCHFGBk2rleICMOs3pqjJy
	 UOtuH4JLF+RBGkUFqsyuWAcpcIjAM/9dAurTXrmpjhWQPwTxIYpZu2Z2G85VTjDLKf35f
	 3+SoMIxnr7dP/XWh9yN0L9ttUH5B7/c9pjIy2q7QeBY9nPbBqSVCZP/KYRPruZa9H0ZXd
	 WoR4epN4r+i8iqWjq18k1KRa2Ww2IIh/LW2kIA32vUi4cgNlauoDQmgpxa96nMhtRS+73
	 +uAiW4A65x36WrnsXJkIIJYtAAvuFPH3o7C1nq0ZaM4vybJnckMMjudKCwPF4acwbvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IzOPHo7N;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55954606A32C
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 21:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55954606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IzOPHo7N
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so36255315e9.0
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 13:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795470308; x=1796075108; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LkpmMbGmbwOY5rWgpls3HX12a8MYucO7aG0St1F+2Jo=;
        b=IzOPHo7NlLES7ydAwDf7Odw4EWFIuVnKqc6c9aVqw0RuYpJaJ/13FlD0PH6JDD3Naq
         DTUHYpXT6WTE5Iq6Jn0wg3pNLnG5i/3A0Uywh6Q5o7jUrEZ/QpsoEcR/EUZfT0UnqzzM
         3gYIGZndmeU0ysDVs2ywlMknIXoJtnoaLQRrtROA/u5ktN4CjMQTyGAMT8RZ48jEZJqM
         lv/6SiLiyUmYH5Wx+B7d7I8QksF46CeNB5CEhf1zBapVFS6lVoKJCqKwv97OVucCE9+v
         S2nt7qKRvSsg4c8MJ2HtaPWufioq6YbuQJGh05Z03g23MuVh6sSAYQcLMqVXDrR7OY/g
         Tj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470308; x=1796075108;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LkpmMbGmbwOY5rWgpls3HX12a8MYucO7aG0St1F+2Jo=;
        b=UsA2gAFA+28M3rloNXlIjhDMv8QoivW/f3lic2OwOy39/gLsGthSXKd/guA4GFDVHn
         o9kH/65Bj727wDhXW38F+9aOCnHZ1C176w9/5Pd9sNdsBG6kuQrFCdVijY1pPKgKrlCp
         HxvqR4WhC8o4aqj1Q8lguDDb+QndGVHZiW7GPolVbVdhwuk7ly6A+ONrYO2lDcsR5Fbv
         LPrqNnoM7Yd9whE9ho8A6mNtMwPW0FCvzBzm3skeMJ98U2AdbkKnruyPldILekUvsZIo
         X6H5Nc4qwSaWgQ94EoPuoVajkeaBDhMCX6ATcm7UeGLRmGBbO4blAY11rBWrPm/hMBov
         GeDw==
X-Forwarded-Encrypted: i=1; AL+hErFKTnCtvWZ+fL/DyLXmiIsfPD9F23lrUYk5Lc5ffdfisnyidn1DIKBSWHqJm2ZilawJIexD@lists.linux.dev
X-Gm-Message-State: APuU4Z+zkggmb7Fb3BtAmDL9e7UUmB8l/ImBijU3D0BgY7WSOT4BJjfE
	1t9alVNBpAAQ7CEIM+p6lOvfu8zXXLfqVE0JFo4Ozk+iF4hHhn0PI4F/
X-Gm-Gg: AZFdTZfqs6sMJn/3WIBHBfReiZq9Pf8okFzTEpUQwEDG8PH06jR+12FusVslN4XT4XG
	s1Ut6JjEq7RyPQ5cYqDuIoXzPaQJjszjL28mASbXCKSbIUJNwZlgvYXSyDwytO3ts+nSjAVjsT9
	knp21GBDkPbxwqVinakIk3b+B0C1NCO34f+FvUzjSTRVY0ZtIyMSK9HFXcTfegQTNvmud+k6kFJ
	H7LbdoEsuz14BcYe/3JS7z19aNurMSggIsAbMzBOlo11ZmB3tmp0xerqCuCoLEbnd9wlEvsa7Q7
	pg0gkFMFKCL7pMyy14nh9Ylp+PHWEbgb+i43J/85WqVwMHDDlyv0d3LhkwDg4TN3xM6g2rYA6uj
	FAgZcTeZOmPGf1y0YUdBNWEpoLj+d2OcKf7zV9UnO+UAh9I/cgeqjspmidO0Uq6VwTxEehCPif3
	Ug+cz1So5N+iL/GfvaDhnYvY4vCMGXMqLFu1KrJmCXriFwLA1gHfHoGb9LJ1C52vkcDltvOwJrd
	oSp2gifK/gnWax+SbT4d2t2fC7k4zWYn6CkAEg62R31owuhoTilZPWKeYaCiLzxG/qHIypZhTLN
	x0pjHdbfj2yo4teRzfbSaHI7a0YvZ4ljAsONyzci066I5bI=
X-Received: by 2002:a05:600c:a08b:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4bb88922c52mr247479825e9.13.1795470307434;
        Mon, 23 Nov 2026 13:45:07 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm390803475e9.2.2026.11.23.13.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:45:06 -0800 (PST)
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
 boundary=f93e91cd8129c4ef5a6623f4aac998269e771b61eaa5f43d069bef622e5a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 23 Nov 2026 22:45:05 +0100
Message-Id: <DN2X3RC5JUFQ.2LNGLQOUX4ZPF@gmail.com>
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
In-Reply-To: <CAOQ4uxgf2KE=Ag13EPAu5=KnrFwt7zRH=im-qmLc8+i10Tjd+Q@mail.gmail.com>

--f93e91cd8129c4ef5a6623f4aac998269e771b61eaa5f43d069bef622e5a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 23, 2026 at 2:35 PM CET, Amir Goldstein wrote:
> On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> This is a follow up patch series stemmed from [1] and [2], splitting the
>> _mask change for the fileattr API into its own separate patch.
>>
>> The first patch is a preparatory patch so that the code in the patch
>> after can be formatted better.
>>
>> The second patch is the actual implementation, which introduces:
>> - fa_xflags_{rw,ro}_mask fields to struct file_attr
>> - fsx_xflags_{rw,ro}_mask fields and has_masks selector to struct file_k=
attr
>>
>> These masks have the following semantics:
>> - rw_mask:
>>   * for filesystems: advertise which xflags they support changing
>>   * for userspace: specify which xflags it wants to modify
>> - ro_mask:
>>   * for filesystems: advertise which xflags they support only reading
>>   * for userspace: ignored
>
> Nice!
> I think this API description is very clear and coherent

By the way, should I use this description in the commit message (and
integrate it with missing information before/after the bullet points),
or should I keep the current one?

(current one:)
> This lets filesystems advertise their support for specific xflags, like
> statx.stx_attributes_mask does, and userspace can specify only which
> xflags it wants to change without needing a RMW cycle:
> - on GET: each filesystem that wants to support this new API fills the
>   masks according to its supported and read-only xflags, then:
>   * for boolean xflags: it fills fsx_xflags with the current on-disk valu=
e
>   * for value xflags: it sets the xflag bit to 1 in fsx_xflags and the
>     xflag value in the struct field;
> - on SET: userspace fills the rw_mask with the bits of the xflags it
>   wants to change, then:
>   * for boolean xflags: it provides the xflag value as a bit in fa_xflags
>   * for value xflags: it sets the xflag bit to 1 in fa_xflags and then
>     provides the value in the struct field; if the xflag bit is set to 0
>     instead, this informs the kernel to unset/clear that value.

Thanks,
koraynilay

--f93e91cd8129c4ef5a6623f4aac998269e771b61eaa5f43d069bef622e5a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCawSz4QAKCRDmj22qf5IG
XFP0AQDoHuI0GUaYOoQkPYkvkC952uJ2NGRvnCWrDXc2mGNcRgD8D3IvRyNkeRF4
hY+IdbU3Ldb+X7gx8ejbGnOW7iQXcAM=
=P1l+
-----END PGP SIGNATURE-----

--f93e91cd8129c4ef5a6623f4aac998269e771b61eaa5f43d069bef622e5a--
