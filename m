Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686456;
	b=S0j18awAQUuIbHReENpAYTaRhbzdLKorUshq5zq2jkebX1tu5lVG4ySmsb3lrCLc1jAP
	 WGMFiQ1SpY3Xy7usBSPk/9Sm5MwmiLnweuH0EgyIjv07HrGb34/61XNR8ppjRWi5kEDPZ
	 j+67P6Fsh5s7V/iup7VLp8vQjz0Kjnjsqebachxg/O7R7hnKerW3JXhEK1gf0nsWnZIGW
	 KI0iKWxbgOJ9VvOeX3szSbwusoSS05uyTTPDiVh8bduRu/PcMCPU/PraJHLusyGr8M/Ak
	 p1Eh2KPNVPn6o2I2xZ6w9YHUpVvfaeBFwXjbI3MOVW/Vb1badnTjVTuC0CtZAsDp9Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=vftivs/ZcwAXfWGGaHfjRVFbQTh5u76KaVfGvH0yVJc=;
	b=tTklfR1DcKc1D28L0Yj8SP3ysW5h6cvW21xTD2Q+j1OVpjB5vCzbVcbIQvrV3NdLFgS7
	 A9L4unpA2rH6pcgJHiJzN3iWFti4kTY8Ey3zfpeTXImBSxhppTFX7t9KymiQ1zF2gpxM1
	 6STSGn9110WOVT4VUmHCafqXmWOOHKdRa07cLg31dfArNi2hXU3SZicVCbUjsaPRrSUrl
	 N5rJSJemOXOcNAsUCRUqWXWzPs67Pwv8N01Uy5fNdCB142xgWh0HEyNgqPn/QAl3eDrY3
	 HNdPTgLAK/ttFvwuZOZCsB91TFI9RRftQM4434aAQQPa5Pp60J7V9aI/BdLw7j8+zkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lh5jUUWy;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8102E606A33E
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 09:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8102E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lh5jUUWy
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-497614c95f0so3848855f8f.1
        for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 01:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795686455; x=1796291255; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vftivs/ZcwAXfWGGaHfjRVFbQTh5u76KaVfGvH0yVJc=;
        b=Lh5jUUWywnOrqeftXMBSN6Zldtb58v3dJJdM4jwgBWa3M9fMEcKOzmTYlyWDzeNk+8
         Teb89mLWcZM18VehfANumcqwEsRdAHhrjtjOddNANfjrLJnm8Y3SIt6SxwZQs+Aex5Q5
         YBYZHPTmtworVduLDQGC7MMQt6OyYnOhbrESqVEVUtP2UxPMgt9Q5shM5xSxF33t3H+c
         B/Eyq6fbrNneYOBxt1XbmXAStOfzRXUirU0CKp/9RxaiXB5jx5XqV5SkuzthIg2UCf5l
         v0CPfK9W/wlYv+5Cb18AVMavzMe1Qxg9mPqJOV2Vy+qPx/9Paz2n0saToaEKPZ+xLq00
         RiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686455; x=1796291255;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vftivs/ZcwAXfWGGaHfjRVFbQTh5u76KaVfGvH0yVJc=;
        b=YqrdE3cY0p11czhkYyBN4oK2NjYXxD3PvP4DRRcl3FmRafpF6IifnTShFyboB9ExSU
         Lc+uRoEVOuBnLPD+ZnKpTCP/Zq4o7RLeAOupKmTdHkVRRD4/mBwTaW81bTKLsAGUKiqP
         1bN5j6elmmR2jhMtDlSsZyFIgxmqVBCYhNWvNy3ARkL7uHQeO6TW9I2oRk+Z1RVejCrk
         HPK2Oeb5P9ipl8LD+in2u6jZZ5nyKZlww2qgw1pDLBpiQnCLEVoETHwgJBR7mSEVavyx
         Nh6XjfNYvNM9lJY6FtN3WzyvZ9msvj6nbL7R9f+14S/SL5nXQQJTdVnURZTtpfYO+jnC
         5OVg==
X-Forwarded-Encrypted: i=1; AL+hErFneU8IAJhiZbfw1SZnldPCUBj4vCDapgCwFstD7/+b0r2qW/ln0O6/n7UmMek9MZm9NNr3@lists.linux.dev
X-Gm-Message-State: APuU4Z/+XXug/cgZzSTMn3SSLU3Q2MlwovnQFQx99Hk1JYiMMPByu1lT
	kE9QEtrkU2DeiTQOtdeif0FjEOElHsWpYMXzkpkT/7bc36CItBkc36cW
X-Gm-Gg: AZFdTZfTVUBpkrYHKSIIEbgECOdMDtXkyJURyB9xIhlXicUQSwhcF7KWJnNJB6r9H7/
	Jg9ZWQUOBsbuBp3NUNcirwwhdJ45yxcf1hiiHaViR+20tDWe+eDVI4ppYw9wE6nEP5zbVTgxoPs
	VUhGJU/5vX/Wo2YQ7z1gq5ySBY0C22/ovzehOMcjsnZsF/zlWb0HmSnf4dKU6xhRTQzPfmsO1aR
	IDwA8ZL4zlrOIzPQv6QmkdeHG9FJAWTA6kpM9z8NYpploHJAx5Gq+lBnNzKfQnRr7l5vRE3wW5M
	rnEkH3GGUgXTYe//UOpOdaoMhiY5qrep39kX1CeKdwW58t7mxoBifNePMC8Eu6jVyGJHf1H1XdV
	8p6xIoVHxzxW7mrz0wwyVd1zfsSIMB8YK9ctSUtViSozaGpB8os7kTg2x9mmzXZaArRhKM09yui
	d3HT1KUUszT55r97HyPgh94CAXe5ecR+FCuoh8vATN42RZ12860QdunehmwKAwRqJ9okgGz2OyO
	/DuOD9myz02tS1dFSeesMZ5f7CvHhACMn4t7YGoHXdvWnSxrByVP3i0wTrgBBWaBmeSjY8MGpZc
	YuAdJ4GkjJ8vg8cKlPY4hly9iirljUMqo+5Kdix9DfgDnqy/mbXJ3wmJ4gQk2Gs=
X-Received: by 2002:a05:6000:200e:b0:4aa:76ce:4b9f with SMTP id ffacd0b85a97d-4abb6746af3mr40052013f8f.56.1795686454572;
        Thu, 26 Nov 2026 01:47:34 -0800 (PST)
Received: from localhost (mob-176-246-236-25.net.vodafone.it. [176.246.236.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f281sm37241600f8f.22.2026.11.26.01.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:47:33 -0800 (PST)
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
 boundary=79d3767db7994af79d385e900d46b036c798a71ba18599848e4679aadf0e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 26 Nov 2026 10:47:26 +0100
Message-Id: <DN51PX8IPQRE.120Q2U9RLZZ7B@gmail.com>
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
Subject: Re: [PATCH 2/3] vfs: add xflags mask to fileattr API
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261122000856.536902-1-koray.fra@gmail.com>
 <20261122000856.536902-3-koray.fra@gmail.com>
 <CAOQ4uxhegn1z=41_MHL1Zu2hXuPtzNhC=x4gd371oaeJE4-weQ@mail.gmail.com>
 <DN2N6A68PBO1.2QT8ZOARF4I6L@gmail.com>
 <CAOQ4uxhDQqEQ3T9NveBFpUmSU032BxrNV5D+_zHj8u9LOQY+qg@mail.gmail.com>
 <DN4DRUYPHYMP.20U4DYV5VBN7P@gmail.com>
 <CAOQ4uxg0g+XkPb3-kQS5ez1-rp7Q=BkYDHW0CGOFhpbcf70yMg@mail.gmail.com>
 <DN4KLSM2OO0K.2C8Q5CPFBVNL6@gmail.com>
 <CAOQ4uxhpJygZH-arLFSUYEEfqFG96Sr3_6CWakfSkdWxEsOxMg@mail.gmail.com>
 <DN50PH7HHSWZ.3H4T25JFPQECY@gmail.com>
 <CAOQ4uxgJTSspRJqRFaSJxKUShVULaJpMv8UhBFR-DV2kUe1sXw@mail.gmail.com>
In-Reply-To: <CAOQ4uxgJTSspRJqRFaSJxKUShVULaJpMv8UhBFR-DV2kUe1sXw@mail.gmail.com>

--79d3767db7994af79d385e900d46b036c798a71ba18599848e4679aadf0e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Nov 26, 2026 at 10:23 AM CET, Amir Goldstein wrote:
> On Thu, Nov 26, 2026 at 9:59=E2=80=AFAM koraynilay <koray.fra@gmail.com> =
wrote:
>>
> ...
>> >> > Attributes that have X_value like fsx_projid have few types:
>> >> > 1. 0 means disabled (all existing values incl. projid)
>> >> > 2. 0 is a valid value but cannot be unset (btime)
>> >> > 3. 0 is a valid value and NULL/unset is also a valid value
>> >> >
>> >> > Only for type 3 does can the interpretation of
>> >> > (!XFLAG_X && !fsx_X) be considered as an "unset"
>> >> > and anyway, this will require support in individual fs.
>> >>
>> >> IMO !(xflags & XFLAG) && (rw_mask & XFLAG) should clear/unset the val=
ue
>> >> in all cases, ignoring what's in fsx_X.
>> >>
>> >> And all existing values would be of type 1 for VER0, but of type 1 + =
3
>> >> for VER1.
>> >>
>> >
>> > I agree that this will be more consistent.
>> >
>> > With explicit opt-in to FILEATTR_MASKS API
>> > vfs can determine that
>> > (!XFLAG_X && !!fsx_X) is alway -EINVAL
>> >
>> > When fsx_X =3D=3D 0, the value of XFLAG_X does not really matter
>> > so filesystems can decide themselves if they want to act on
>> > an "unset" flag or not.
>>
>> Hmm, I think fsx_xflags should have priority over the value in this
>> _masks API.
>>
>> In my mind, to clear PROJID a userspace program would only need to do:
>>
>>   struct file_attr fa =3D {
>>         .fsx_xflags =3D 0,
>>         .fsx_xflags_rw_mask =3D FS_XFLAG_PROJID
>>   };
>>   file_setattr(&fa, AT_FILE_ATTR_MASKS);
>
> If the program (e.g. chattr -p) internationally sets rw_mask =3D FS_XFLAG=
_PROJID
> what do we gain from not requiring the program to also set fsx_projid =3D=
 0?
> I just don't see any wins for anyone from this design choice.
>
> Maybe I am missing something.

I don't think we gain something, but I think it wouldn't make sense
semantically to require it.

At least personally, I wouldn't expect to be required to also 0 the
value if I'm already saying "I want to change PROJID and I want to unset
it" (rw mask =3D PROJID, xflags =3D 0).
Also for maybe future attributes belonging to type 3, the value should
be ignored when unsetting, since there would be no "invalid value" like
0 for projid.

>>
>> and have projid cleared (same for EXTSIZE/EXTSZINHERIT/COWEXTESIZE),
>> while to set/change it:
>>
>>   struct file_attr fa =3D {
>>         .fsx_xflags =3D FS_XFLAG_PROJID,
>>         .fsx_xflags_rw_mask =3D FS_XFLAG_PROJID,
>>         .fsx_projid =3D 67,
>>   };
>>   file_setattr(&fa, AT_FILE_ATTR_MASKS);
>>
>> and this:
>>
>>   struct file_attr fa =3D {
>>         .fsx_xflags =3D FS_XFLAG_PROJID,
>>         .fsx_xflags_rw_mask =3D FS_XFLAG_PROJID,
>>         .fsx_projid =3D 0,
>>   };
>>   file_setattr(&fa, AT_FILE_ATTR_MASKS);
>>
>> would have the same result as the first snippet, but not the same
>> meaning, since this would mean "set projid to 0" while the first snippet
>> means "clear/unset projid" (but in this case, for projid and all the
>> other already existing fsx_* it would have the same result).
>>
>
> As I wrote it could matter per attribute and per filesystem
> whether set to 0 or unset is different.

Yes, then filesystems could handle them however they want, maybe even
use the fsx_* value (if it's not 0) in the reset case above.

> The man page language should be flexible enough about this point.
>
> It only needs to document the invalid combinations.
>
> When proposing an UAPI change I often included a man-page draft
> as a proof that the UAPI can make sense to human readers.

Yes, I think I'll write the explanation in the cover letter to have the
ideas written down, then I can add man-pages and docs in v3.

Thanks,
koraynilay

> Thanks,
> Amir.



--79d3767db7994af79d385e900d46b036c798a71ba18599848e4679aadf0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCawgALgAKCRA0bnTtJTDo
OEQ/AP9wDjyrdFJEEzzmJJCrvCFrjxBqlkeNnNjqPWC/hJRgXgEA49DY4UXyB1Kj
wKwdt2yo0aESyGLzlPUZRwD8RmhwnQQ=
=UumB
-----END PGP SIGNATURE-----

--79d3767db7994af79d385e900d46b036c798a71ba18599848e4679aadf0e--
