Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443738;
	b=ps2Txnn3ydd5kTUx7HtgoGk36bSNXDONtZ1Nfhve0Lf1LQtTyeLH4c57F3+Xzz45/DTT
	 ktCaS9JARcqNMRBvcX/Z0m8SgBQYmVvTgkwfW9EUb9pFoSDMvdhObLv245uPRmwHd8swe
	 +KeD5+v9WTYeMWV9p7uhDz65sTvNfZ/uJyM0anJqCZ9Dmq3S2j6f0akX3I8K4XZk8xAVq
	 835iZWjsf3wPbBk8ivz6bcHNk1r+f3BfA64L0H5RI7wOu12ZmNvi2NEMkKn1d/q3wHPy1
	 OnfGAxJk5aT+X4WynGl8QfWGKEC514AgdglPHTbK2hHJtPRaARg3yzLdFLKTr5vsDrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=MWpQl1xkyrhsa4v1aNpU05mPb+pCD8JS1KWXDWW/Gpo=;
	b=WQ8AK7/m8qnZHrtQ7jcpmUW8th3Ea8KPlNCJbabDxlay4bUIwssRKBf7I7+D+3OFfCK5
	 7lo2ow7PNR0dosLci/GSjVlljsIUsCWVWEgkky38q3qoDyAGSFYEPdgBHROGXGcPJmedk
	 hBOVmn97b18QFFOHPJXk0aOLHXW2BZ2QEoERpbDticSez2gWvtHjlhU7GzDZyTSP/i7Z+
	 XqDPT3OEpna+epGykFMtB+xkxV+924tuUJ/6/KGfty53BsdScDGNHiYj2fGfpgsZwqJdA
	 TBFdWAaubu+rOO1a+k8Nz8GtpsePfv0PHLRXGMFKgOCL+jphTtkCwwex01hr010CMhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IdOx8tZn;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882D2606A33D
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 14:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 882D2606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IdOx8tZn
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so35571915e9.1
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 06:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443737; x=1796048537; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MWpQl1xkyrhsa4v1aNpU05mPb+pCD8JS1KWXDWW/Gpo=;
        b=IdOx8tZnR+E67955+Po6TM2lhN0Xf28TLbtt1j/7Gy+uKeZwoHy0BqY3c5PO9Z8MTP
         oFE8Jj1pxGN3AnqvjRhkbcQpt1rTBhIQ7rMTB914MxAChu/zA55+HSDjcuytDijQ/bsK
         CMbLFuRZxfvQgfoWZqVs3llaH5Gw1+rTvOLUND/qdcYNCi5m00+itui9CfoqKUckVW7/
         H3uvTcJxUCPb+1YbHLZg9QOH6CW9kXKjG85emPPzIC7oJWKOj0ZdeQraHzfMvadUTxvp
         0y5ROUcUhFUHTseKAqureQ7KF1FBnNPC6hEGbuc2+kcOIHkmNIz2/VluMcLyHi1bh4kX
         ZzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443737; x=1796048537;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MWpQl1xkyrhsa4v1aNpU05mPb+pCD8JS1KWXDWW/Gpo=;
        b=z3Y9MUV1/7rTJKrIHAowPsHfYtIhpP7/zsgkFJGM44Mit7k54gv3PnRYJIUw2w4GbY
         KERRjIyEKaHkZ7vaDUYjN+dtNradrEMVh9pQ5MRMVhcp+4qKRlKXasPsPFIPpQT3BKJl
         QosyWlCa7c4qDn8LVZve0fWPV00KvOA05C08aU6bZcz1SkW9esWxGerVRpmCHCVFC2X4
         BFPjd0G+wR39Oei+kRkCHBURBWvy/p8S3Y8BrZYc+tgm4fPyjLhHIYjMvrUIzkOp2c0H
         3f1yOE6hHFAVXh0T2K6QhdMzUVYENOxRjZSyel8bKK4zbTZSC1cuBFepZkMQORhS4t3h
         ciOg==
X-Forwarded-Encrypted: i=1; AL+hErHmm+frspJSJhDEfDklfzkhjazLZNy7/KkaBPiIEWylcg8rjGbj0IGwIbFePe3CoB6NOmOx@lists.linux.dev
X-Gm-Message-State: APuU4Z8VMzJ1U2OkQMP7XXR8aFBRqORTtd1wCqltC8FZ8LQG8WU/l/F2
	kGIoWnNzF1YAadMYhVskPHXF1tS9TgjfRK3oc831QixyOCPxfQO+FGDp
X-Gm-Gg: AZFdTZeR9QRgFmDtsRfjgHOiGgDZDha6+E/ZxPquQcL9wYQ8RtqhNq5qhAN8qj7skO8
	RLjXsJvpMFKYa+493YYoVX2jBEBNgy2TJx9MeW5XRJI0/7I/tZzkBWdZ4AhI79ouGV4DEA6HYfE
	3//SvGqLiRYxFBTDC0lf/Bcojg6rMFp+WJz3GTa5VY9Oskw04U3qt7MmXowgkHmEOL2WQypJoNX
	cz6XFkuZG1bGNe8Pz6k/obGM2hY9oHePHwqW3AQr87NbfsFlwqrtBa+XZyyDA9/rHO3/oG8YoHY
	4/ERV33Lb3Cn8BoPqwywhwQTYe9HjtlWI9DSLciCrU75XDPHnzWa+q72WpF3Qu+hqilukNdWTIo
	HbqbIDdF8KEyrBFCdh/JschdrfAtKlV7q9rtn1n/odPcCfWmhEx6F3tE9ST0us9jFWCc/LIaWr8
	qer+RB3h5iBQZHyF+hX8o0xZ13dZY8g0YBMzTc7mT8Q3dHyQMSebzu5dleu8nqKp9LBrtC1hQZ9
	xjivBmhvtFr/Kd9UBHwLY1oLHtrSUhjLmvGH1DKzOzcGnvu5IryJ6+pHArn6Eb2LosW+DqWvAEG
	xuUOUDP71D4JJHQnMwJxWQV3eg==
X-Received: by 2002:a05:600c:64c9:b0:4bb:679a:86ee with SMTP id 5b1f17b1804b1-4bb88938dbemr253115345e9.29.1795443736768;
        Mon, 23 Nov 2026 06:22:16 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm170939525e9.2.2026.11.23.06.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:22:15 -0800 (PST)
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
 boundary=6835006247ad5b556582ac77c37dad0d5918ae309cf17b9da0cf6b359cde;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 23 Nov 2026 15:22:13 +0100
Message-Id: <DN2NOOG9J6HX.1L4IO84SKCYOG@gmail.com>
Cc: "Andrey Albershteyn" <aalbersh@kernel.org>, "Namjae Jeon"
 <linkinjeon@kernel.org>, "Hyunchul Lee" <hyc.lee@gmail.com>, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>,
 "Chuck Lever" <cel@kernel.org>, "Jeff Layton" <jlayton@kernel.org>, "Jan
 Kara" <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>,
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "Lauri Gates"
 <lauri.gates@gmail.com>, "Christoph Hellwig" <hch@infradead.org>, "Dave
 Chinner" <dgc@kernel.org>, <linux-btrfs@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <ntfs@lists.linux.dev>,
 <linux-nfs@vger.kernel.org>, <linux-api@vger.kernel.org>
Subject: Re: [PATCH 1/3] vfs: use goto out on error in vfs_fileattr_set()
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261122000856.536902-1-koray.fra@gmail.com>
 <20261122000856.536902-2-koray.fra@gmail.com>
 <awP8S5KF9v-nqWVY@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
 <DN2NJH234CC4.2LSWRSOO4TX5I@gmail.com>
 <CAOQ4uxiREfVU-WKiUVRZLb-uzMXzDEsmG13FVMW7YBoyq10=Nw@mail.gmail.com>
In-Reply-To: <CAOQ4uxiREfVU-WKiUVRZLb-uzMXzDEsmG13FVMW7YBoyq10=Nw@mail.gmail.com>

--6835006247ad5b556582ac77c37dad0d5918ae309cf17b9da0cf6b359cde
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 23, 2026 at 3:18 PM CET, Amir Goldstein wrote:
> On Mon, Nov 23, 2026 at 3:15=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> On Mon Nov 23, 2026 at 9:42 AM CET, Andrey Albershteyn wrote:
>> > On 2026-11-22 01:08:54, koraynilay wrote:
>> >> Switch from using if (!err) { ... } to the cleaner if (err) goto out;
>> >> in the main body of vfs_fileattr_set().
>> >>
>> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
>> >
>> > Looks good to me
>> > Reviewed-by: Andrey Albershteyn <aalbersh@kernel.org>
>>
>> Thank you, can I add this tag to the v2 version of this patch (since it
>> won't be changed, and link to this thread in the comment section of the
>> patch)?
>
> You should always keep RVB when re-posting without meaningful
(RVB =3D Reviewed-by, right?)
> changes to a patch.
>
> That's how reviewing works.

Ok perfect, thanks.

Best,
koraynilay

> Thanks,
> Amir.

--6835006247ad5b556582ac77c37dad0d5918ae309cf17b9da0cf6b359cde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCawRMFQAKCRDmj22qf5IG
XCZkAQDH8wiuPEqDaB1cat+NLbwVTy9AgTGpQeVFZlTodz2juwEA00+c7xq8+RtC
rQ07nQ+3av0Gvb1S4BH2IP+66ik5awQ=
=/Ubu
-----END PGP SIGNATURE-----

--6835006247ad5b556582ac77c37dad0d5918ae309cf17b9da0cf6b359cde--
