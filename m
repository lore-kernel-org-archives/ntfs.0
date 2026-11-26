Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724952;
	b=gRxdD+fUzwl0KzneZr2mSrbALI4EFVBKVLhRR/RPqJwk59SVojuhQIyM6KuDxI+vjMji
	 Otk3sRH4E3ehH9x7bJXCfz1Jq6UBGCx1Z1TcNiTPi5btXCNRyNy15MqxHD+3ITwTThZq4
	 u8xMc/MjIswll7MmvRhf8blC+03ktf2MQzm2jy6ShWjJBD927Ogi2JdIXrOYvZwbTl//0
	 NH8TGh6qgQkAlhkSxIwsSvmuihliySNPWbBVRYVd4EsECNBKfO3veGf+eYn/sndSLVHzL
	 Tv+sukIdgIVNSfMSsn2lqOM9zwefW2o2/z10mm3jnQDzQEMl1+1efbG/Oesi7CLOxIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724952;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=w7OwYSrzF1I9/u/lz07XEyzNBc0+r0ellylgwNOk6fA=;
	b=B6pwYHdYn5vbc0QMqVBKCRkmLC4D9BAS5xqTw/idNuQdSB0GA3Z1hhu6rtWTSvjPwhFf
	 oaBafQMEMYzeMtF6q/Nci10QR/PP4ITHCFdNMrTDn6Fv29VY3fh7O3MCHRQC43W+1VlIH
	 imSVIWoaU4r/QJZZvNvq+I5Ef8hN4mj9Eio9V+Ib/NAFcf1Mfobqrr6wPM0B4UUv7D/Uv
	 aapA+ULqdueZsld2mvZ2hTRiOvfp0SiDd23mN5VK5s99CWwiMs5EnMoR6wpStTNd5g7rX
	 YklGtKuI2V50+0LcHrkWeyvApyNXonDGIdmyHedndvl/VuecV6LPiNHHPMdKRWW9SZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=g7QtIBEX;
	arc=none smtp.remote-ip=79.135.106.102
Received: from mail-106102.protonmail.ch (mail-106102.protonmail.ch [79.135.106.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3EF606A31C
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 20:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F3EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=g7QtIBEX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795724949; x=1795984149;
	bh=w7OwYSrzF1I9/u/lz07XEyzNBc0+r0ellylgwNOk6fA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=g7QtIBEXMwqKvVNOpsjMcNdYSm2BmInBBJl4GiXVbvHuWUBXXuYrpUScNyRE6xrv1
	 p1s7XH0hsSPlrhGQm7W411Z5ikmUv/0aGGUk2Jalb76UVWQ/USERlNzPz9xdfW+6p0
	 nSC8lsPzCrTBCreDXQmT8arvOvsfJlGlwosdZX6zl8Jww4JeOU+AAi6qsZSa/SGIZW
	 mdO4J/r8mOe9ZUi17Oeuk383oxGR1dA1e7G/RHLOqhSJ+y08KPlmX2B7mSdjRzE6H5
	 7406b0BbAmVkeKGAYumc6wnp3kek+jujuPD05o/awVWXWieO9tsMa7jqBMShnChBPq
	 Ri6fdMXxrfuJw==
Date: Thu, 26 Nov 2026 20:29:03 +0000
To: liubaolin <liubaolin12138@163.com>
From: Ernest Borowski <ernest.borowski.git@proton.me>
Cc: ernest.borowski.git@proton.me, fstests@vger.kernel.org, Zorro Lang <zlang@kernel.org>, ntfs@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, Zhan Xusheng <zhanxusheng1024@gmail.com>
Subject: Re: [PATCH 1/4] common: add support for the ntfs driver
Message-ID: <179572494067.404475.7096722370604870601.b4-reply@b4>
In-Reply-To: <362ec779-2133-40ff-894b-d0d96a756828@163.com>
References: <20261125-ntfs-reproducers-v1-0-0cc67533d803@proton.me> <20261125-ntfs-reproducers-v1-1-0cc67533d803@proton.me> <362ec779-2133-40ff-894b-d0d96a756828@163.com>
Feedback-ID: 236360163:user:proton
X-Pm-Message-ID: 4a6d7dcc6942c68ee59f6dca99484e56c7a42ab4
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 10:43:26AM +0800, liubaolin wrote:
>     There is a mismatch here when -s/--sector-size is supplied. The
> calculation uses the device's logical sector size, while mkfs.ntfs
> interprets the sector count using the size specified by that option.
[...]
>     Could the calculation use the effective mkfs sector size, falling
> back to the device sector size when no override is given?

Yes, mkntfs computes the volume size as the sector count times the -s
size. v2 takes the sector size from -s or --sector-size in MKFS_OPTIONS
and falls back to blockdev --getss when neither is set:

=09sector_size=3D$(echo "$MKFS_OPTIONS" | sed -rn 's/(.* )?(-s|--sector-siz=
e)[ =3D]?([0-9]+).*/\3/p')
=09[ -n "$sector_size" ] || sector_size=3D$(blockdev --getss "$SCRATCH_DEV"=
)

I added a section with MKFS_OPTIONS=3D"-s 4096 -c 4096" to my test runs,
on a loop device with 512-byte sectors. In that section, generic/816 now
gets the 512 MiB volume it asks for on the 1 GiB scratch device.

Thanks,
Ernest

