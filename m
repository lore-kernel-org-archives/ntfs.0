Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795781098;
	b=lrUQRNQfkx3H5oQTRFeGN/DG2vntdQIcbAVoT78bA4rynr6sVQ3CiUS93g5HpFK6I5Dr
	 zccwDXqoVfDPvaIRFs6DUxDvE70GNIUJH7n03tisJ8h8piOCSnP7dtGerMTdJPn0SJOk5
	 HFtshTPBr714ffMnExyb9R5iEABHx1R/yDzTaF5LR46fwKN39jyri22mK62i7F6592XOc
	 wtnTEryRfv9ACM2hvIiAcmIY3G5QV4ad2J3X2EKH/FY6qsWVRhdcO9gCqV4feM3yCyZ97
	 jSrZVYFmZjmY+CSAXCGofKvQWDzd+I8t4nDJNXsRBhhWhJdZi7xRrDt79dCZphQOrUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ftbPRsCQ0aqf0DRrrjwD4Al8a/o+mRVmt2zUH0Y6zDA=;
	b=M/le109MD5g2OPM3LM8czsFkIwjE3SPkMQUrX5U2km7rQIi3CiDUAZ7kYKjWHRNbzo8T
	 SU9O0kJzBinKMm+jDUkM9z/fPDYhvr9EwyMeSllFZ+Rb/emQFx4A/6Y4UW1TjnHTJy5J2
	 DBKHyIcfNfD6aMPejqbR7qQ/w8RWmkd/ofivv36bd9NqWAYXOX4av8ZySTXsalE/1En7Z
	 kNzlUL28F6K7KFJaGDyjX6YNSsjJQMkOaavuFBCyW7NETjXTMqAUivAL6Vwnr0Fy4IA95
	 Ar3qFWUMGbmNoA85grtFNFh0pKxF+N6jGvRXJen8WtoK8BuMZHzmaCJgWpVL8BlxkZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uUer53t0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACC9606A32C
	for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 12:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ACC9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uUer53t0
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b8c60e0d39so10282058a12.2
        for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 04:04:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795781096; cv=none;
        d=google.com; s=arc-20260327;
        b=IhxGIA4RtugTSWXFC0Evp1KXfltg4RwBsaDd6tiMbxiDMkQ4UYusijjJntxb36ZR3x
         pUXPbJlK7txXrV8rpjW70CWlAVtBOzAmv8UyoNRH4mOBEEKxt2bOlhAO04/NMyfDSmnX
         PqvaE7LnHFoGghG/HosgxRZWbLN+8F8eW2DiiIC61dUZnfqFxJabZK09QATM4Kg8tQI4
         7G03oKLCYlDum1x0bD3liU0Bzzosr4O95i3mLPc5mE22vwfWQBrwTLIeRfUfWtNig6OF
         pDxU6od91JYpIME6jvXXYmB+RK3wE15o9/fjiXnBT3xG1UcjVv8iB6OtyHNCFheJNWxy
         vXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ftbPRsCQ0aqf0DRrrjwD4Al8a/o+mRVmt2zUH0Y6zDA=;
        fh=kuhPljL/sYdCjkLu7R16iLAic3IG+Xgx1wiJgvIOCUc=;
        b=nrzoi0x5YbI8UyGDuvhfUKJCWUzvhXz7oi7t0IIsai+lC0Fv5vWFNUt9hZGEO6d2GR
         2cJ/XdFRvG0k0PIIQ9wZGYEBzSmyiFDVka8JnJtljsMrN8ajRm+4+adQ9ddlmiuPEFEB
         0OqdKSFirSwFWBsx5wHymQTzrBaSS/rRPvDFTj1obg05Ri04owk+UfXEjvGP7Cz48VKN
         yyoo4VX/NYyb1nMMgGuQTAcCcYqEURzFzyLZOr1AgOhWC6rTc2fzcGqvYLDVtJ4mPK9r
         w9UyiZOBzgbs8GCjue3I72dEmqCqh7jC75S9roKtPe4U04wKjJW6RVNCSHHeH+pZGSic
         jcAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795781096; x=1796385896; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ftbPRsCQ0aqf0DRrrjwD4Al8a/o+mRVmt2zUH0Y6zDA=;
        b=uUer53t0H7wZhcLWE7IH3UlXsJOvL6QA7HjVP8+uY4v14sHyK9/PxtRtZF3UazZhpl
         1jxKlup5ug+N/MdFjiOdCWnm+GLvhH4P71ldviqEkkSNWV7cLUEKHctSfBg9RcuZ2EUU
         x2ihZpd2W1JbVloaYOdUcxOU9Msd40xCGTnVkaROZIdX3GAe5ulpUU/6HE2z/W9/vTEH
         OdtrBIZYoAegWNEJZoofYqOJPmnfhU5DDWwtL7dreuv6pwDarFCWFGSO8fQMGN/ebPaA
         St3d6Orios+d6MJ2rz04WNE9xRcqRZ5avYhE8S05y/5FCDwmjasyBA4bkpSC0GbujKEn
         Y8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781096; x=1796385896;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftbPRsCQ0aqf0DRrrjwD4Al8a/o+mRVmt2zUH0Y6zDA=;
        b=nSVrsXWTLpO57AYxzA0K0v0Aq2KlzXnoYPb9c15hMBOpeQ/CWHgNMbAmr8wkwJiVBe
         Ns+/PBxHNcMdYC8+XSmrpBkRJcOxf/CG3noA3aEutH9yjQ2GIIO1Bmtbz06X2SIdsGSn
         vCTIpEuCH3wLHrHgSqZGW5RTSZMme5YRbycqlDpjOtTEdPOar/kfvxPYYIRFaCqMxSwe
         Co4uHwHv8WEyWXnUgmHtXEmy0aef8YinkQkMFWAY1QaNcbSzIJNWwCXCJ4n0tvyaRH0v
         ka2g7sQRNlyJVIuNwYXyL1px/oB9aa+UYwrk7L6MCWoZIu0zaUjIMBAdpk9BB3qcY6cC
         klCA==
X-Forwarded-Encrypted: i=1; AL+hErGZB1UmUsDnLDKv474baYyo+P/7MiW2XTK2sGtwYQOtkl+Jx1LtidmohAkiigZuejfigDAJ@lists.linux.dev
X-Gm-Message-State: APuU4Z8GaMbmo0m7UqBpiS1JvhzaXrRw03O1kq2N/mDbl3djfnUrmwsG
	YeX2nQXYXKIfha7mn3EwHV7zgMX3dmVPB9MOGvjnY6LRGU4OHy3jfyCqrJwATdFjLrHVij32lYk
	NYMRZ6HlCwgUXegRVFgj+LCV6hJU9eJM=
X-Gm-Gg: AZFdTZeJ6+22/+sOifxVhWenANfsNc/2AgLX0EPA0FjXP980UA+0r1v2oGrmHTkRs7d
	mdtDBEbZdYPVfjBA2D1DrlX3KD4JjIU0k3qnSqB2dfRXJWH8WNvWyaHpvd8p4sxavO4/V4PDcf9
	VDg/f3/9eXug3Zhx9xmPdlECwBD/p1/JhyBl52E2OhhpI2XBBPho4JQ3lla3GcxhVOLkhSmeuGW
	HXlN/Q4r0Ok+6XBPh8KWDpDiheQUhqx5te0/3ALPhO/8uecplqM18sc4c4RtmsrGNBXgcpa4pMO
	hynDP0jf+0zlbbcJom+o48mo8n/wKSXlXI8/z1NGsNRpHqTZcQ3SUZcYF/R3QanrdUG4BnHAL+i
	3VLF9lVy0nWICgtfY4wPtMtoqXzzwzozljd18PfkSzrDzICfTKYBLNpI=
X-Received: by 2002:a05:6402:320f:b0:6b4:59d0:7294 with SMTP id
 4fb4d7f45d1cf-6ba37e9ec85mr20367582a12.31.1795781096175; Fri, 27 Nov 2026
 04:04:56 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261126163114.403846-1-koray.fra@gmail.com> <20261126163114.403846-5-koray.fra@gmail.com>
In-Reply-To: <20261126163114.403846-5-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 27 Nov 2026 13:04:44 +0100
X-Gm-Features: Aa3M54qEfB_iTiJNZjGRc3XRinkgqc1ntuigIkhA7BS94_VSwwZ4uoMmp26Q3TQ
Message-ID: <CAOQ4uxgJjy3TaORBkMOdef-JvzX2uA5K2sbMDEcLqmpkedsESw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ntfs: switch to the new xflags fileattr API
To: koraynilay <koray.fra@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Eric Biggers <ebiggers@kernel.org>, "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexander Aring <alex.aring@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Andrey Albershteyn <aalbersh@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lauri Gates <lauri.gates@gmail.com>, Christoph Hellwig <hch@infradead.org>, Dave Chinner <dgc@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	ntfs@lists.linux.dev, linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Switch ntfs_fileattr_[gs]et() from the legacy FS_*_FL flags to the
> modern xflags (FS_XFLAG_*) fileattr API with masks.
>

This is where the commit ends doing what its subject is saying.

> Introduce FS_XFLAG_COMPR and FS_XFLAG_ENCRYPT to be used in this API
> upgrade.
>
> Following the FS_XFLAG_VERITY example, put FS_XFLAG_ENCRYPT in
> FS_XFLAG_RDONLY_MASK and in FS_XFLAG_COMMON, since it's read-only for
> all filesystems.
>
> Following the FS_XFLAG_CASEFOLD example, put FS_XFLAG_COMPR in
> FS_XFLAG_RDONLY_MASK but not in FS_XFLAG_COMMON, since it's read-write
> for some filesystems and read-only for others, to avoid breaking
> existing filesystems.
>
> Also update vfs fileattr_fill_* helpers to include these two flags as
> well.

All of those non trivial bits deserve a patch of their own.

Not only are they independent vfs changes, but they also have
implications outside
of ntfs which need to be spelled out.

With current patches, I think this change now advertizes COMPR|ENCRYPT
in fxs_xflags for all filesystems that have them set even with the old VER0=
 API.
That may be ok, but it needs to be spelled out.

Do we also allow to set COMPR via VER0 API? Do we want to?
These are questions to be asked on a standalone patch.

Thanks,
Amir.
