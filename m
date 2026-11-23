Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443035;
	b=NbfcB3cbcbHoW+mKqG4WjGpEEmOAQPAxiF4Edzp//joNPwnrZzs8h78HOccimAky4J4N
	 HTpzcTYYTT5LEXyVOEfhJvwEQMN3Uzz+eMyeyEARvcaUzuMjfEHZOw1SzDXSoa7PGStx4
	 lNzceaYXZqze+ZykXl61jWDZ8hQrXwigI7UAII0XoZS1cuXbsllR7MAySm2OpHD9ueU/d
	 6mMXVRgp6pQbMkCdT5ompBvo6qMTecms/UHNPLaHbUfCSB1xKUVfaCLrdblfzyTLy85tK
	 8D+YTNkHHnFCyZd3g6dKZ8Y1Xffb3UuAJy9buzb9IaHl2U11WKDi+UODlNcEcK12cLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:X-Mailer:
	 References:In-Reply-To;
	bh=CuMgRbNwzbHcnBEprb4vp2b0/t/8wHp/89cdVf+1khg=;
	b=MhHQqenQY7l2t63wPfGIEKeNA4IQaVyaAR+fV82l2CMlYs6de0fkUHur+TYskbt5Zwvh
	 +SZUIbnQx2aonn4heARE5JZr07CZkGRSle02U7L/O7P69dHzt+dr2NMJ+I3ihnhpWuWR2
	 WAHRkUzO7jDo8QvG2dc47lajwa/Z91NoECl8HOUHe5Ssy5kwVMcInJ00xGciBbaq/SYcH
	 /EoMVm+/vGmax4lEZTZ5bWDlnMnJdgCE1aZBSu2vVTu7USNdmPJbzidGONz3emR74a/Wd
	 RFd/TfcOUB+HGQHmUouJnMBMW2AGsP7Bv67yZGQoJ1/HXnBdh/Hpsof8w6fV2VxjJpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0BbxAsqY;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D82606A31E
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 14:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05D82606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0BbxAsqY
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so42770955e9.1
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 06:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443033; x=1796047833; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CuMgRbNwzbHcnBEprb4vp2b0/t/8wHp/89cdVf+1khg=;
        b=0BbxAsqYMNLy9FbWk67w84CmI8bNPsYyz5BoYCAIu2bsO5QJrhMS8PfzwEEsUPCY0V
         foYMuxe5SaFmKecKjAdjUa91dzcM77Jaq+IfZUhELqembfdRWC+HUAAhJujd+pYr7sMs
         zypjygcgJuTWmy5qOLGaao/ux5qhWePII1Hkn08fVQJvn/PsAu482Cstw0ll2F428M9y
         OriQXl27tzbSHkPQqUISZ+2Nwb8amm3EL5K4bFjCBjlu+McAqcwLYGMHuU4QwoPbCGQO
         UrdSMg/rSYvxa+9gElbM9AY3NCqHs0Phnqu+/CWkOmwjpvviaCCqnTS4A/ZYwHM380TB
         5G+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443033; x=1796047833;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CuMgRbNwzbHcnBEprb4vp2b0/t/8wHp/89cdVf+1khg=;
        b=lOm4c5jcyrhOvfUOWr35mSP3MXvoYUWmE3fFNGuvRI5LzOha4Zyfse0o8OdBMe2WIJ
         MCC+a0NTJb1dPW3e3MadAoxKffj/8G2onz+Wcvy7mfX0p+BD0/eGJ6B1/P8JPpu6789X
         XJNruKVdc+0wJso5DYenDDoy0ykJr3p7wz8LkfiOlxudiiqumfmb82TUEoO0U5eoAQcE
         IWFuX/13prg5UUuli+z4M/EMHr68850PEjib7szGa7TPkjBCVpOGHfNF3bhnF7P21HDi
         0HSpbEeCpA/Di/evxhs2f/MDWye9C5lwssC8w4hqNt5oGm2aaIFF+iqn3bE6kSxp9iia
         EtVA==
X-Forwarded-Encrypted: i=1; AL+hErGrCbvmAghOx5HSuUQ+74mdiu7JM27N9FonpWUbUspkiKGUHXZ0MSxlDfYYZFH1BAWaQUJr@lists.linux.dev
X-Gm-Message-State: APuU4Z9utJ8pPeFdBdVYfvxwlnRgh2JBDaCmzl8ldOFH/Uh9FIz8A0cS
	F86EJPX88sJ2ozUPSHLMXqAKbgFv80GyTxF66BWpwaMz9ljTheaa7Kx8egfpzkorsiM=
X-Gm-Gg: AZFdTZco3C5aY4OM5cRzt+OHy1Ave61rpa00N5MpDJIsati8uocdP3V3dG++pcENptd
	lYCNmgeusC7Efz7/fdoQpXhe8bp9IHYQjxRa0gaeOiwLZrj5yKd5rDRiFYtYh5vADm9hXk/cMz4
	OGlKs/mGZpzcTV/935m77+zW9Whpludf14uY1SUW4gM1VR/5n8JLRym+HkFdnGJJC9bPFcd2Hr7
	HYg4mz6vEVw3y9AP91YjQZR2380DPsIoiKWjYgXp+33k0rlK1D5OJ5DJJ0yJud0+kXLtzBhYnAW
	abYrwzxzmjL+lEFf3TNSwMpeM6wpzwxiORYuTKi3U5vBSrOQcQiM/g5QFLQr70Cr5PJKzuq6CBD
	TzOJH96zSAdhNBlIO4kuKrAqBGtTylBBhslCyoRiK1a35keLD1oQMl0cyYVx/SlcShZFzGx4Uoi
	cp5HJ1F/nwIaYqVv3yahq2H5zLdBvitQVlJDVWElasp+91V52RDmYFjXnsai6mqZwFIQfQu/wsM
	aCXLpQ5ka0QG2lg0zXfa6AfeJIE91CzXSnu1fKb87CBdfeyciNLol+u13WGPlfwF0LXYjFZCoMW
	zvyzAZIoGhT3MdM9ZqNOJj58XEQ=
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb88785898mr250028695e9.0.1795443033146;
        Mon, 23 Nov 2026 06:10:33 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm170559065e9.5.2026.11.23.06.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:10:32 -0800 (PST)
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
 boundary=b1a345f2b4a5254b3632da7c1e235601a7730bbbbe126372d6b8eae348d4;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 23 Nov 2026 15:10:28 +0100
Message-Id: <DN2NFOEO4XGN.1PEF1SWOF7YCQ@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
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
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261122000856.536902-1-koray.fra@gmail.com>
 <CAOQ4uxgf2KE=Ag13EPAu5=KnrFwt7zRH=im-qmLc8+i10Tjd+Q@mail.gmail.com>
In-Reply-To: <CAOQ4uxgf2KE=Ag13EPAu5=KnrFwt7zRH=im-qmLc8+i10Tjd+Q@mail.gmail.com>

--b1a345f2b4a5254b3632da7c1e235601a7730bbbbe126372d6b8eae348d4
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

Nice.

>
>>
>> (ro_mask for userspace was also proposed as a "verification mask"[3] but
>> I left out that semantic to keep this patch series more contained, and
>> can be added later if needed.)
>
> Not so easily added later.
> We cannot change the meaning from ignore to verify without any opt-in
> later, but we could use the combination of
> rw_mask |=3D X
> ro_mask |=3D X
>
> to "verify" (set it as long as it is already set)

Isn't this just "preserving"?

> all we need to do now is make sure that the API returns -EINVAL
> for rw_mask & ro_mask on set.

Yes, the current (v2) code does

if (fa->has_masks && (rw_user_mask & ~old_ma->fsx_xflags_rw_mask))
	return -EOPNOTSUPP;

at the start of set_prepare(), I think that is enough, since we assume
the filesystems return the masks such that rw_mask & ro_mask =3D=3D 0.

>>
>> This allows userspace to not have to do a RMW cycle when using the
>> file_[gs]etattr() syscalls, avoiding possible race conditions and
>> simplifying their usage.
>>
>> Patch 2/3 also introduces the missing FS_XFLAG_PROJID flag so that
>> programs like chattr can leverage the new mask API.
>> FS_XFLAG_PROJID is kept out of the legacy FS_XFLAG_MASK and so it's
>> defined as part of a new FS_FILE_ATTR_XFLAGS_MASK group of xflags that
>> will be used moving forward for any new xflag (like the one proposed in =
[2]).
>>
>> Patch 3/3 converts fs/ntfs to this new API, to show how it can benefit
>> filesystem drivers too.
>>
>> The series has been tested across NTFS, ext4 (with project quotas), XFS
>> (project quotas and extent size hints), and Btrfs.
>>
>
> Judging from the number of bugs reported by Sashiko and by my agent
> on the COMMON flags change,
> I think this needs test coverage for the old APIs, especially with old bi=
naries
> chattt/xfs_io that do the get/set cycle and re-built binaries with new he=
aders
> both tested against old and new kernel.
> Sorry, but the UAPI issues are fragile...

Yeah, I thought about adding some tests to xfstests yesteday after I
made my agent test the sashiko issues in my test vm, but I don't want to
make it generate them and submit them with minimal oversight.

It could still be worth to make it generate them to just test locally,
then clean them up and submit them after the vfs design/code is
finalized.

> This is one of the changes that would have been very hard to audit withou=
t
> the LLM agents. Hopefully with the agents it is doable, but need to guide
> them how to review/test for regressions.

Yeah, the amount of edge cases it catches in my code is very high, I
manually wrote the main vfs code in this patch series, but I took at
least the same amount of time to fix *some* (considering the amount
sashiko still reported anyway) of the bugs the robot pointed out.

Thanks,
koraynilay

> Thanks,
> Amir.

--b1a345f2b4a5254b3632da7c1e235601a7730bbbbe126372d6b8eae348d4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCawRJVAAKCRDmj22qf5IG
XPMqAQDKSRELLXXkJM1eWJs/2jAv9K7PNaXrJgEdc9WUuhVlqwEA+UC/ffcMo2z2
JMu/9eWe5JddaVS+uSeZePo0JhjpBAg=
=ToHp
-----END PGP SIGNATURE-----

--b1a345f2b4a5254b3632da7c1e235601a7730bbbbe126372d6b8eae348d4--
