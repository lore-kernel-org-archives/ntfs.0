Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444270;
	b=g0TTp8AuKbjp+JA3/QTCy+1qxcJyytrp7jeifNkX3e3tKaeW1/I0dhlNfTJI8gNdx3pB
	 unUjbxjirl+UCc8th+wB/t+xCpTeBggzntXMnBwAU0Wx4v2/7Y7I8N2i48ZEfF5TlSdho
	 CtAFeEQmyWfVrsBhBsh2RX89uwKNEJSEv/FZG6BboAJZfuY10wUv9YsMP8+4baJpB+T34
	 CKw5jBOS+Y6d2+SN5STLJx6W2KInzK3PL/93OV64/SqVt+2A1tTncxyYiH45kAbZtayyL
	 H3Vh4vXEJ7yle9LrVJ9ScF59a3GrQXu+xZxIFIEpUX6sdn4oI1Kpe9fugldKjsuATGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=Q4jTJ4I7+4H3U2t4gGtedRgvTT6Hqn+CljxWSv/Jr1w=;
	b=mFBJ6ejrryGIhVvTiO3nSNwFhdYBjce8djeSm4qwZBBZWRB9hK2O1Z6d/bqzUAsxFAAL
	 ZovOHY344GJasXTSs64FeqBxFXQ92pZg+n05iv2OlfLvJ7g2/glld2hM2cAKdZoBfHbT8
	 XhE1PCAw1HFClMsQDhhB9JE/IoSFxVPTCGKK3SlVFD8D3WnEL0Rij1FA4JaDspwVIxDPY
	 o1Joei7bntdBjwk1HD23bpfnvN1FoOZpZ7uKADbBO6+KLNNhUCGXiA7iLZkbXINsQL+WW
	 D92VwWK3x4nyTDzPksdJTZSCNPunI3JK/usLCIGaKBg5JAXbIEVhQylFQApV5PgaBSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rBW+u1Lo;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE404606A31A
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 14:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE404606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rBW+u1Lo
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so2802416f8f.1
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 06:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795444268; x=1796049068; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q4jTJ4I7+4H3U2t4gGtedRgvTT6Hqn+CljxWSv/Jr1w=;
        b=rBW+u1LoJ9GYwrIS1Y1HV7Itwq21ZAee/8XQ4KIkJ6Mquiefab5f9u2rgujC8da25E
         nlnNEvNBkq0EwYoPjNgqRPrhb46RkEVQAjoiEKPkl6VFXTKRn8iP4rz1W9HF7vWNIMXy
         VdEaP8WmzsE/Vib1nulq7zRDbgMvr1NSXUHEBJTh7J7Vh2vlsjipk9T61qODz/7bt1se
         4JJ0uchGhYg3B3Vb5+lIXjVKqDYuf8t6BZFf/OBEfiYMzB/RETUwAYWcoM+1tzTXzYwm
         Pr+zeH4mifdEAv3j3M/jbU91S56GtNfTSqcKgq8eR4elkvHp6QWCZ1cV7xMJ39Fj7WN5
         bQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444268; x=1796049068;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q4jTJ4I7+4H3U2t4gGtedRgvTT6Hqn+CljxWSv/Jr1w=;
        b=KnvLeliE7GQHfXENZiD3Dg78/YpFxNVhc7Sc5jSmI84ecxWySpciGN1SflluHNaTqH
         dEJlae+hFBelETtoQbOOxKSY3eoN75bUX3QdMFjDlkZ2GZSVYz8f87f0senytff4R3z2
         WzxQEuG6TTDzyQIEY8Rxyxgmqis5m0cHpmE+nPp39mNClRf2nXW/fOOGVQAY4n+hsgps
         FVDKgmNjiBqWpuRAd6f+ImbJ8BxjEouf3YgbH6m7rDLAnVUx3bSbNNmNf064sJ0vH9Ps
         K3szXgXnyX+Ia5B3GCEVZea2vCZ1tXxoDHY75HJI3ZQMTgHtbAwmd74uN67XTmUa2BFd
         NrCg==
X-Forwarded-Encrypted: i=1; AL+hErEAcq7ynus7AdLCyfI6ij473fCI7evoNCK84vn+4RN5obPKDcieOtlzmLFxx9IkC2Zq2/DW@lists.linux.dev
X-Gm-Message-State: APuU4Z9gblJ8OgmykBIk5yRZCP9ebdLWziO0KcDKCh8DXEYU3IAwJNol
	gHgvl0q8R8Bxm3BGeUcoDNvZ6sHs9eWNYdWao2GUswOfu56BbhegJg8l
X-Gm-Gg: AZFdTZcmql9f4k8A/dA09QtN6QZshhKNGn8nUJm+rXQ4e9HLjigHP8iX1W4uAoOUoqO
	4P9lfXqLZcd2A7N7OAH313YvX9UrXkkEnQxh8GpavorExEd7fC0oVgZR8YyXQvVqZRfKAHCdUCc
	Oa37t7W/D+WrlG6oorcKlpSdlVnyJ/ZeT/Rgx3NwVtYgzHzrrZvZCFK+u3eR6SUGWMn8Uy3jzpA
	ZI3tW9O0WJ/xgjc9ixW2gf14OxoT5PEo60qG0bPCLLRRB3etPiuHrOCJBKnlyvzakPfLU3ZpXv3
	9e1F2moJN4k9m3/pNixoczivzI+ThCJ5DNtRxNfi4iWyEJSp9R9dBe0tDM57Ujhfwhbz4+1DCOw
	wbsDcu/vjHyqu0zAMrgJeXA96LzD9UP4U0Rl0nJrSmcPtJgDxK4pgSe5/VWukXQ7A1QtQTHeE13
	4K10XzjbOWODzRH660iiVXlK5DgN/56FGObhm45UNUwdgprxaAnm7u8rIeN4bOYA16ULJplF0e4
	RSoD7b5vd+7Brz4BxsBc0XGoIqZBlO3emqZa4K5yVw315N4TaABuYKRWwuWyT1/IiowyjBlUXat
	D+3zYbFecP0U9jMPmY/FxbR7rA==
X-Received: by 2002:a05:6000:4616:b0:491:8286:5f0e with SMTP id ffacd0b85a97d-4abb514609amr20025380f8f.55.1795444267943;
        Mon, 23 Nov 2026 06:31:07 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b205443sm23631206f8f.39.2026.11.23.06.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:31:07 -0800 (PST)
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
 boundary=dc84db75a66914bb784f1de9596eb2f7bc5819cd207268d8e5d18dd76353;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 23 Nov 2026 15:31:05 +0100
Message-Id: <DN2NVGUNO0GA.89JAB2PVI0LA@gmail.com>
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
Subject: Re: [PATCH 3/3] ntfs: switch to the new xflags fileattr API
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261122000856.536902-1-koray.fra@gmail.com>
 <20261122000856.536902-4-koray.fra@gmail.com>
 <CAOQ4uxgc6pP+_xvJMbqj6wOdGzS75Vn6x6i_vUfCJDD46DAA_Q@mail.gmail.com>
 <DN2N0BY83OY2.1OV3ZAZFSWCDG@gmail.com>
 <CAOQ4uxg9O-R_SUPAZ75ESGB99-4Z4EEUKGMkCF2f-sXkGPq1GA@mail.gmail.com>
In-Reply-To: <CAOQ4uxg9O-R_SUPAZ75ESGB99-4Z4EEUKGMkCF2f-sXkGPq1GA@mail.gmail.com>

--dc84db75a66914bb784f1de9596eb2f7bc5819cd207268d8e5d18dd76353
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 23, 2026 at 3:14 PM CET, Amir Goldstein wrote:
> On Mon, Nov 23, 2026 at 2:50=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> On Mon Nov 23, 2026 at 2:00 PM CET, Amir Goldstein wrote:
>> > On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmail.co=
m> wrote:
>> >>
[...]
>> > Rule:
>> >
>> > You cannot add a flag to common without carefully auditing all
>> > filesystems that support the legacy flag.
>>
>> Yeah, sashiko pointed out a problem in f2fs, and I could reproduce it in
>> testing, where adding COMPR to COMMON makes f2fs crash, it also needs
>> NOCOMP in COMMON.
>>
>
> I don't think this is correct, or at least not enough.
> My agent said that this breaks or changes things on  f2fs/ext4/ubifs
> I didn't bother to check if all of them are true - I doubt it
> bottom line - need careful audit and good testing.

Yes, definitely.

>
>> > FS_XFLAG_ENCRYPT can go into common but must also
>> > go to FS_XFLAG_RDONLY_MASK because it's read-only for
>> > all existing fs.
>> >
>> > COMPR is rw for some fs and ro for others.
>> > As with CASEFOLD, you cannot make it COMMON before
>> > converting all casefold fs to new API so that each can say
>> > whether it wants RO or RW.
>>
>> How's CASEFOLD currently handled? in the v2 I'm drafting, I added
>> fileattr_mask_to_legacy() and fileattr_legacy_to_mask(), which convert
>> between the old format (filtering by FS_XFLAGS_MASK) and the new mask
>> format.
>>
>
> Good question.
> Need to check this.

Can you do that? If not, I'll check tonight, no problem.

>> > I think there may be a way to deal with this easily since
>> > ntfs doesn't need to set either but not sure.
>>
>> We could export the 2 other helpers I added for v2 (xflags_to_flags and
>> flags_to_xflags) and make NTFS use them?
>> Though adding the fileattr_ prefix will make the current (v2) vfs code
>> maybe too verbose.
>>
>
> Honestly, I can't say for sure - you can try
>
> I think you may need a different set of helpers fileattr_prep_ used by th=
e
> filesystsems that are converted to xflags_mask, which may be different fr=
om
> the set of helpers used by the user facing ioctls but I'm not sure.
>

I guess I'll think about it when I move NTFS's impl to the updated vfs
code.

> The thing is - this is all hard to wrap our heads around
Yes.
> You and I have parts of the design in our heads w.r.t backward
> compat with legacy API, both UAPI and vfs internal api.
>
> I think you should put it in writing to see that you and I have
> not left anything out because this v1 surely does get it wrong
> in several places both wrt legacy UAPI breakage and internal
> API correctness.

I agree, now the version in my head is not finalized yet, so I'll do
that in the v2 patch/cover letter.

TLDR is "use the legacy to/from mask converters whenever needed, so:
- user legacy -> fs legacy: keep as the old code did
- user legacy -> fs mask: fileattr_legacy_to_mask()
- user mask -> fs legacy: fileattr_mask_to_legacy()
- user mask -> fs mask: pass it through

(before finalizing the GET path I want to finish the SET path).

Thanks,
koraynilay

> Thanks,
> Amir.

--dc84db75a66914bb784f1de9596eb2f7bc5819cd207268d8e5d18dd76353
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCawROKQAKCRDmj22qf5IG
XIluAQCkRERpwhiWlAG1vnH4LLTLbZOFc6HLeE1vttoO1MkJnAEAs/LzOmQQYKAR
R7lCcHjWSuolpqeVgvCGo0f1qKCRTw0=
=50n4
-----END PGP SIGNATURE-----

--dc84db75a66914bb784f1de9596eb2f7bc5819cd207268d8e5d18dd76353--
