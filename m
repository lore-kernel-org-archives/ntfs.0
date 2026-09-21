Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0475D31715D
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 06:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971448; cv=none; b=rCk0cwxbI3GAdpU5TyIk1ZYGh1P3uWvz1RMujFY6Lj+6nVIRPu7Fy2EU1KfnmMn3wKOElo6Gq/gocOS6rEeWCOg5YD3HhTetJI2biaghNBoCJXGACqUYXbfSBK2cpFN/sWbtwvfOAFmgw2YfzVOp51KjnCnvWOA+f1x8vnIqfpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971448; c=relaxed/simple;
	bh=490jmg6NH6IDq+4390mYDNoWpu9tMk9K9iZfK/HqUCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0BJ4OzG8+zanmHMFHjNrsOLVMiBYAvY0qYalupxCCSfrcvcglSAUpdZCgMajP9vHn3Ayptq8I8KTeKLfd5y2CaAogAf8oOJUu2cPjrF/3oo5GeSh02EHDSYXpBW4tihwcBxQMK5+HeV1ljrZWlENROh0+CrTU41DESenxGCEe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4/wurmM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4/wurmM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAA21F0089A
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 06:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789971446;
	bh=490jmg6NH6IDq+4390mYDNoWpu9tMk9K9iZfK/HqUCA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Y4/wurmM3Or05LplUGQCRDtkkBB9b+455lAy4L8nqejWSrTTbIfqwIZqSWLayzgWi
	 Mcl0ycj/PMu30FWpA93m83wUnBpipjGRIBea2GXujX+QtsmUZFzAaifgQoMKt8s7+i
	 wZSz4trkIxaQTPC0ellRL9qRWbiPZakDCBJ9t97sRcCnGD3QwEPEEHJgNx7MCORk5W
	 K6NFIItj54QcCDm95OAUHeIE0ihvwtNvu1HziYE2Fp7yUdJ1yZsNeT3VLcULbZXb2o
	 RQ935c9yfGAakbQ+49cpwdfzIxkvYkXyaC/EGtDMdtRM2TMrrrVifjxTzxhGlImDXa
	 TU+8YrkW64AGA==
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-895eaf31683so19897237b3.0
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 23:17:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFiBG804h4bva6gDZHCP15bol9Dx8lZVS6yhieN7OLNkfWusn/4yYWe2G/sab7AT24/Tm4@lists.linux.dev
X-Gm-Message-State: AFuF++l8UTmiRpIKiyXZZE4gGRBmcZH+ckHHGTL01PlxcvgxU5o8xkyf
	mjOvNuN3gJJuhoZ/OUgTvO6Jf70jI48ZnbtT77BXebEYWbs5srtcV4kTSdSwnq+cokssHnMBgpH
	Z3LZvUGJ6TDE6nQnXPQC0xuFlKzn/8vU=
X-Received: by 2002:a05:690c:97:b0:81f:238a:1709 with SMTP id
 00721157ae682-89736367111mr24107707b3.34.1789971446148; Sun, 20 Sep 2026
 23:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260920083131.1880061-1-liubaolin12138@163.com> <20260920083131.1880061-3-liubaolin12138@163.com>
In-Reply-To: <20260920083131.1880061-3-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 21 Sep 2026 15:17:10 +0900
X-Gmail-Original-Message-ID: <CAKYAXd80AqEnzUvad2Od8fLh4yh20X8G7CVN1EcQCg1Vj1iJQw@mail.gmail.com>
X-Gm-Features: AcwNN1XPJ8wSOMd4PglyskthANSjJd7xiQgGmfD9UvigjqfkdHiO3OQlWe755DE
Message-ID: <CAKYAXd80AqEnzUvad2Od8fLh4yh20X8G7CVN1EcQCg1Vj1iJQw@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] ntfs: validate EA chains and link
 zero-terminated tails
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chenxiaosong@chenxiaosong.com, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 5:31=E2=80=AFPM Baolin Liu <liubaolin12138@163.com>=
 wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> A zero next-entry offset terminates an EA list. Appending an entry
> without linking the old tail makes the new entry unreachable. Invalid
> entries are also treated as missing names, allowing setters to proceed
> on corrupt metadata.
>
> Validate the entire chain before modifying it and connect a zero tail
> to the append position. Check name terminators and retain the full tail
> span when removing an entry. Return EUCLEAN for malformed EA structures
> and inconsistent information lengths, preserving that error through the
> get and set paths. Keep ENOENT for a missing name and translate it to
> ENODATA only at the xattr read boundary. Preserve lower-level read errors=
.
Could ntfs_listxattr() reuse the same chain validation and return
-EUCLEAN for malformed EA structures? And you can send only this patch
for v3.
Thanks.
