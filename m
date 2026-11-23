Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443331;
	b=NcRH+4LKTMWSZOKPPt2/+M8uVMAzfeZ+hYfRGQw9E7WxDsLLSb5G5+5sm4aCIXYXTb7H
	 emrG6KohZ7VgS5iKLzSWwjgNW+4CZvgAeGAR6xT+p3PVe2nLUag2qMRGN3/CAs1iekcCn
	 Q5qZjb6AAJTptEwQttwxVs8Ein8SQ44res/TyljTIl8iZFdX5Zh5vOjcg9c7SOOwHzz/h
	 BI3nG1++g7rttxrH20d+6DlhoULIiOS3iSTGHHeQVGDnNXVWV8FmaQcCuZAggWejUy8yr
	 kxpHZ91Jp7VHGcYGtYmAE0mkFnf1mwSTo8BZFYhh8zraD5M2F9XGNU8tgm7FTup8+bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=SVkCiAZ9hVspPzZuKZbqXCYeKQk4BcDbwlCFk9p1ut0=;
	b=HJXp1EOiJ+8S8x1urSYxKWSEoCACmdIBj6kJ6Fm0tew7zj51AGMxXtsIGIPg1XFSHIRe
	 6tcdUl8OorrN4jmjcWI+g0uUgaBD875bnG4PGjs2xk/43jnR4a8ZS5B1bmNXel+0EXYGv
	 4/rw0ELVnpf7uQlbaSW0xL2g/2QOxB9thzTJPnftU6CY7bO18WSujjAxX+w5Xwsx7PMPN
	 E+0BVCUMOsgV96N/F3jJ1958Yg7YeI9TsPIb3SdeIrbBm4pHoEuBsQUqh22UfqIb8pf/v
	 QaNBfU2KQKhhE6BECe91GpmleCPBPMH1RmtnAWpgD602p0ih8Mg7Ibde3Go7jrLUL3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYhzVx4S;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D6E606A32D
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 14:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83D6E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYhzVx4S
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49412eb1474so2121070f8f.3
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 06:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443328; x=1796048128; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SVkCiAZ9hVspPzZuKZbqXCYeKQk4BcDbwlCFk9p1ut0=;
        b=qYhzVx4SEMiBu9hJf4f9/bBP5aDB/xOIOCtP6Tx8lTu/yCMeq7yCgNr0RV5Ccosy4z
         g4xIMW20M7is30xngg0jAxsnOUb3g6zDxNTeTEtMluRZlVrMfJPJlxsfTOwUBuPqj6OP
         aFHHvjR4LgULEA81vBoPcqu3ncU2oRLbw+qUYm/uqLXC2IATiMc3QY4zvM+wL7cksPvD
         5tnFw4ovP4Hhp8SWEVbszwbHcWcuY8dPhGBnAOZPt91aETGcuEJhyMy2aCNzwy0KbN68
         cq0uAY/AqL8SPJigQz6zN60dwYAl2WA9KzOkfcMyHstuVUx9/wGHJe0gGaE7kDgnAANl
         TIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443328; x=1796048128;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SVkCiAZ9hVspPzZuKZbqXCYeKQk4BcDbwlCFk9p1ut0=;
        b=UhUKaTqddrTYr/WMEPpTmwLlPFITSZFQc6gEnw5c/DZeQzEw6gqnzzK291LNWh0A5p
         X8rQ9oG+v1D+K8yv9H1Q6Zsi+9KORy8Hvha90ExXK7PEKjBJqerZWpdvMAZEjMdE9dVp
         r/aYn4Y8fqKBHSX7KTQFOHznBvfstfzNIDLLNFb85QoeJtE0DZiSwW6iMwDtm7Y/whB2
         WVFRUc/ACp1PSwhfydM/0TQ2lvHfUwGYJi603jtoqEsEbHyj57+P4ehW3RuwKYQN2V6T
         LMH0Jo4fU+lwgzEAYGtJyGwa/LRZqpeJGEEUuHl5H/dbqA/sKOBGLDFfmyo+6kbI6QEG
         q6iQ==
X-Forwarded-Encrypted: i=1; AL+hErG9Q2owHG4nHRSybF3dDJb27BFFhb/r+4oKRGNa+Zi4ocJ/dBMg0kUjf5nCVBkjPsCHGhL+@lists.linux.dev
X-Gm-Message-State: APuU4Z80mDkRNJ5BiZa5zZeJVdbtdb6KvXHmrmgQDEfYKuzNoxyvIZLC
	XeFb3Tymi295aKdNV06VFhqnHQjxm1KgwP5BzXTZ2KkCaaPdMjtJx8Jj
X-Gm-Gg: AZFdTZe8mbOWdX1Uc2caQ2xda20XAqJxwv8Rye/ytHJR6YRAOK7aJ4bQCBlSNmQGdVg
	Pu1tNm+j5uV3MCH5nQjqJwjmdXk3HS/dQEsCt4aoSvYXpk0J1ZksZrW0LVLHbJnoGu9/++Re206
	aQRKpM1bKrTArHs0Y72FmNUu/Hpy2yEEKD/Q/ATQ+P4kjmFDS+douxBBd2jGYvoJBO557YgmoDu
	OmLaCRmRqTeLzFU77kymaOwk9HqJ0vIC64YmFU8JdTRVTX2UVLch1gVDM8KmOlYTWHOgCwlNvoy
	S+YSs2MJ8aEll+KRnhiuVYBQP2+MNbcKKe7JqyaI3vmaU64IW+W90EVN9idHuZsd87T/BW3SEzZ
	JHsXINgONobZQpEd7NG3CYhhWIk3tWuabYsl5LMFPBwvQOBig5fGyvuvnOIxH+ju8LnyleMx19j
	8hO8GhaDKV8Flhxf6kwHnWCxa+QdJ+YE5zDHF89JuxfGFTxe/Dx3yx0ZPY3idN3pMgFpdm6aJ6D
	xeoNzw4MeEc5UvvcsBuds0XZQcudPMNmvsTqtFNgM0di613K5eJg4HJsZ6tJwshjz8BwMcw9II6
	AhdFe4XDHmMhgVr2pmKTzrd0VLw=
X-Received: by 2002:a05:6000:4b0f:b0:48e:d7c:4bc8 with SMTP id ffacd0b85a97d-4abad6a1782mr21438558f8f.7.1795443327853;
        Mon, 23 Nov 2026 06:15:27 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm15815535f8f.15.2026.11.23.06.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:15:27 -0800 (PST)
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
 boundary=d4d0d8ea600ad9a6a0e804d6ccca97eae7564ecdc87e5749b6027a98fdf4;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 23 Nov 2026 15:15:25 +0100
Message-Id: <DN2NJH234CC4.2LSWRSOO4TX5I@gmail.com>
Cc: "Namjae Jeon" <linkinjeon@kernel.org>, "Hyunchul Lee"
 <hyc.lee@gmail.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>, "Christian
 Brauner" <brauner@kernel.org>, "Chuck Lever" <cel@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, "Jan Kara" <jack@suse.cz>, "Darrick J . Wong"
 <djwong@kernel.org>, "Amir Goldstein" <amir73il@gmail.com>,
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "Lauri Gates"
 <lauri.gates@gmail.com>, "Christoph Hellwig" <hch@infradead.org>, "Dave
 Chinner" <dgc@kernel.org>, <linux-btrfs@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <ntfs@lists.linux.dev>,
 <linux-nfs@vger.kernel.org>, <linux-api@vger.kernel.org>
Subject: Re: [PATCH 1/3] vfs: use goto out on error in vfs_fileattr_set()
From: "koraynilay" <koray.fra@gmail.com>
To: "Andrey Albershteyn" <aalbersh@kernel.org>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261122000856.536902-1-koray.fra@gmail.com>
 <20261122000856.536902-2-koray.fra@gmail.com>
 <awP8S5KF9v-nqWVY@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
In-Reply-To: <awP8S5KF9v-nqWVY@aalbersh-thinkpadx1carbongen13.rmtcz.csb>

--d4d0d8ea600ad9a6a0e804d6ccca97eae7564ecdc87e5749b6027a98fdf4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 23, 2026 at 9:42 AM CET, Andrey Albershteyn wrote:
> On 2026-11-22 01:08:54, koraynilay wrote:
>> Switch from using if (!err) { ... } to the cleaner if (err) goto out;
>> in the main body of vfs_fileattr_set().
>>=20
>> Signed-off-by: koraynilay <koray.fra@gmail.com>
>
> Looks good to me
> Reviewed-by: Andrey Albershteyn <aalbersh@kernel.org>

Thank you, can I add this tag to the v2 version of this patch (since it
won't be changed, and link to this thread in the comment section of the
patch)?

Thanks,
koraynilay

--d4d0d8ea600ad9a6a0e804d6ccca97eae7564ecdc87e5749b6027a98fdf4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCawRKfQAKCRDmj22qf5IG
XGk/AP9j2YLEmAts6UKmrX6qw0EDoHRjv0eLrfHDRJfhkjSDdQEAixfLgqqT3tMt
wDbEqGGddyloPl2sCvNgcE83htldvgM=
=8yb/
-----END PGP SIGNATURE-----

--d4d0d8ea600ad9a6a0e804d6ccca97eae7564ecdc87e5749b6027a98fdf4--
