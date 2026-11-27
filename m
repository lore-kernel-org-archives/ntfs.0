Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769326;
	b=FogRFg8VZ6BLoyAyIVGFkMzgcZsaB7inAZl6ta9rDfvcUgp5IcEkn/SbYUEdy4ibAVnx
	 SA8s4UV3tPFr2BW6VdwyfsPd8IS5VHoLtOEUgPuwd18jXAm3q2olbTg9Ex4MRS0gr8Adg
	 nYsu8vzRIlpPk3IYE3O8zgNL4Ff3/GMhtqDEdPx/UoKkWrAeKAHKD1/qZhS1WPMVBBg4F
	 F4jdBsCIvPZ/dLs9DUe8ZCzUxSjN17+JnOT8YtMroHPZ3RUX12xlF1o/svPCADg6pIyGG
	 EA8vNdsEe1zwwJBWZnLkEiEbdzqBVphjFl3ycwzlkGAr0a+0bNXpFgCVmFJ4RpaD8Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=IDez9NqT7Tj1QDvV6FYEN7zWNFn2T031QM3aseBOhj8=;
	b=SHGtiBTJoXqrICmQCj6lIUbM37YGekT61Dt7tHXDhfIN8/U4T0SDY8/WHuBBD8OHNWLr
	 FsQ4MwHFAwgfp96zVtXjrUyKFq2EPpsgfc6s7kC/Yl9PwsSbt32/aKbkaOD708r6HOYdn
	 pP3kdcdPM+tK7SDeUBU5MXXHsJKtt6dlkRFDg1YR7NbCuagnepodUShS/4zNiznlH3PBW
	 S7BtdGIrUeWbo4xrX3j9cyE7TGjoTviibqEH1RSYQtZ55y3w8oQmUEjt7B0t8sc1u+2hd
	 wmEJJqzmM/MbL10XhUHPN7vwg5/utn4NX1y/fJ8VgKmag2HEe6wOc7T8+6oP9xUJICw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qwPQbZbP;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A06D606A327
	for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 08:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A06D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qwPQbZbP
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso76852795e9.0
        for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 00:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795769324; x=1796374124; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IDez9NqT7Tj1QDvV6FYEN7zWNFn2T031QM3aseBOhj8=;
        b=qwPQbZbPqileIpzDaA3aOtFzVwzrUUk4ex1/sjqp0r5R7WsAA0284Vydn1g+00mB1k
         1PB7UEADjbsgcdHUwgJB17JYvBq7jz9Dm1Jh0LGLdiUBLUi9ONB6xKZPcgFGfUi/tDdP
         vtBvgZgt+p+1gnWtFyu4QDymNxH9OJhGdj9+rp3kNhZ4plZ8bUbILLxWbQx2yAwZu6wQ
         SWIBUtLosQYruNFlIT+91euB0kny5QhWvAHSuol+NJIXsTJRK0QWJVEsQUATNE+OFnmA
         QZ9nO8JF6yaX9WBpLmnitet0ZxMq5ugL0204u8w5URCfqqSkYdbwH04IHbq9ZXBLe8Eu
         AYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769324; x=1796374124;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IDez9NqT7Tj1QDvV6FYEN7zWNFn2T031QM3aseBOhj8=;
        b=cq9oM0rnqFHmlmB4F5meo32bw8f3QJE7jfc3kGDbQVy6csd0kFaUZA2VFXhJMLLV3n
         CCzl2aIY0CYhPdapT5z0rFRLVECpx4xEg1jpU07Y7kuAmRfgciGRzWIhp3xgkURYgOvB
         FBVaLnkN4nAZgFysySU7mVt1JfAW6W6P5B59oDE+hNvN6aEmmwpXxWl/8gVrvfR963Qh
         TR8SIU2UHS8rTOYgRHNIKXrGWUPa7ltd/F6nR0cgl29tE1T4v/KuW3rM45jR6beWyjvT
         iNjnJN5v3NF8zL1VKiyXXgCvy8HZNKd+bA+CFIQ/kB9V4kGXR8asrHlSbrQdk/VlY3+a
         3NIQ==
X-Forwarded-Encrypted: i=1; AL+hErGO2braVHoZwcQYdkwd5/wY2Z9ROSWz6wOcfaBqcY5TFOfpLFj1ecRmNvcNEWL7KYNXnssO@lists.linux.dev
X-Gm-Message-State: APuU4Z9SrjbrZHnUxbEK5D+r5WdPrsewrVTN5Jb8O67a74H5qsieDXYf
	Agoun0CcgPTW4L4vaBmLGQuM+oSo09VMC6SldCR6UWOI37fmLRI/mgh8
X-Gm-Gg: AZFdTZe7W8+BxGQ/RBh2ULhXCEuMtgG/CXkVqiPI2WuCedwTQP+v++B1oevfhSqYDmw
	XHFY8nPS1iqqkd0zGT59cj+hQo830xd3tTVuuVgdtNtd4caGkshzh73J3QXDbkQsU7GLkupMTvP
	sQyfSLzOlP7jX78xTM4CuoFnEDnEwvqW73CqOI/pIKLh8LAYR0RielsA5mhkAfweSTIAo/B91DU
	YmkwG7kukfX8/pczKvSxITzWrjdJuSJCrLVppMmr0zkR6dkn8KYuNHPeygAINArEqSFjYRL2wSn
	dzEACJQuf7blaZ2tGWtgqJvhE/Djny2JrBNNlnsZURvF4lQ/W0gGA8q9dEl4wGzrUTyERfCth8a
	zvbVen4fk8RDzYMxzJUKLuaXiWF5mwM9jpFDdLUEybB48D1ccAxaG774WyjnMefezO6ewfqHth3
	dWF21hQ+co3EpBvT2PbyTyoxe2DjtY23tQ1B9k9aMFI9EgkHEwhRRSZpHOdUlMVFpG9acZgm8eL
	pUHOw3y+yDGTuzi/GqViEaDspKAlQmOMvKiFQwQdl5GDSHXxsoTwNYDqJZzCZJ6o7i8sqslw+4/
	MkKjmkt0o8pPOd4Zv7Xmwy9axyNT4CeNsMG+AFJdnFMjN5xi2eUIXpeJsru0KbyeEQabKA==
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr454676765e9.7.1795769323802;
        Fri, 27 Nov 2026 00:48:43 -0800 (PST)
Received: from localhost ([130.192.98.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm426511305e9.2.2026.11.27.00.48.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:48:43 -0800 (PST)
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
 boundary=c6f8ca06bd0087fb130def184d18448cb7c766d554c063c5f32d1cf88680;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 09:48:36 +0100
Message-Id: <DN5V3F9BWZNC.ZIJY7Q6XMDOM@gmail.com>
Cc: "Namjae Jeon" <linkinjeon@kernel.org>, "Hyunchul Lee"
 <hyc.lee@gmail.com>, "Eric Biggers" <ebiggers@kernel.org>, "Theodore Y .
 Ts'o" <tytso@mit.edu>, "Jaegeuk Kim" <jaegeuk@kernel.org>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>, "Chuck
 Lever" <cel@kernel.org>, "Jeff Layton" <jlayton@kernel.org>, "Jan Kara"
 <jack@suse.cz>, "Alexander Aring" <alex.aring@gmail.com>, "Darrick J .
 Wong" <djwong@kernel.org>, "Andrey Albershteyn" <aalbersh@kernel.org>,
 "Amir Goldstein" <amir73il@gmail.com>, =?utf-8?q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, "Lauri Gates" <lauri.gates@gmail.com>, "Christoph
 Hellwig" <hch@infradead.org>, "Dave Chinner" <dgc@kernel.org>,
 <linux-btrfs@vger.kernel.org>, <linux-xfs@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <ntfs@lists.linux.dev>, <linux-nfs@vger.kernel.org>,
 <linux-api@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] vfs: use goto out on error in vfs_fileattr_set()
From: "koraynilay" <koray.fra@gmail.com>
To: "Greg KH" <gregkh@linuxfoundation.org>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261126163114.403846-1-koray.fra@gmail.com>
 <20261126163114.403846-2-koray.fra@gmail.com>
 <2026112647-earful-frosted-6ef3@gregkh>
In-Reply-To: <2026112647-earful-frosted-6ef3@gregkh>

--c6f8ca06bd0087fb130def184d18448cb7c766d554c063c5f32d1cf88680
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Nov 26, 2026 at 8:05 PM CET, Greg KH wrote:
> On Thu, Nov 26, 2026 at 05:31:11PM +0100, koraynilay wrote:
>> Switch from using if (!err) { ... } to the cleaner if (err) goto out;
>> in the main body of vfs_fileattr_set().
>>=20
>> Signed-off-by: koraynilay <koray.fra@gmail.com>
>
> Real name please.

Hello, this is the handle I use for everything online, thus my "known
identity", and even Linus himself in Commit d4563201f33a
("Documentation: simplify and clarify DCO contribution example
language") said
> And despite the language, we've always accepted nicknames and
> that language was never meant to be any kind of exclusionary wording.

Also, I already have a few accepted commits (here[1] and elsewhere[2])
with this DCO, so it shuold stay like this.

Thanks,
koraynilay

[1]: https://lore.kernel.org/linux-cifs/?q=3Dkoraynilay+%22Applied+it%22+f%=
3Ajeon
[2]: https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D29803ed3ce

--c6f8ca06bd0087fb130def184d18448cb7c766d554c063c5f32d1cf88680
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCawlD5AAKCRA0bnTtJTDo
OA8rAQDeEx1D2WxXRvyGunXEuOW+Cj+dElpy7MJchlEm/WMNBwD+JvucXkEupO3z
6yiHSY99QVuCP3aqlN/orccezZlLGQ4=
=mM8H
-----END PGP SIGNATURE-----

--c6f8ca06bd0087fb130def184d18448cb7c766d554c063c5f32d1cf88680--
