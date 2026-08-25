Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58541FF7C8
	for <ntfs@lists.linux.dev>; Tue, 25 Aug 2026 01:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787621437; cv=pass; b=mQyarS91CsWyw8dP5WWj0EQEMezsIoSN6ETzoNV3D2ZILfTMejz3jc1LqCN7vCXc29vJIyssqxFu+lxzHvugq+MPML07d4oOS0byUK5xF3cN6YWrOoRe4kpQmWsBzzoIhZ9+q5vzwQc+ufLdGT2zX4Zf+/QwtSI+9rxuQOc4V0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787621437; c=relaxed/simple;
	bh=cM0/7iRrggwx13fJlmVTiTrl5iQ6FdVCOXdjRrR2HXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T8Mrf/z2WdKlbSQCGmlamu/RTEAT3yKwRnbUpjEzSlIN9sbutlln8orhSub8COou43wTMnPAz0wDZcUMCEr9XQ2K7KzYWcx7PqLE6m+K4atjLz45gk5lke5kWRngxYIDY0coEzb8sW7Of0fLf9XJbHMjel8dhRgQ0AoQEtpaspI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4jcpn4L; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4jcpn4L"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39f91ba1ef7so30474561fa.3
        for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 18:30:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787621434; cv=none;
        d=google.com; s=arc-20260327;
        b=G7TmXO2izGHa0KjZMrF0h4Izf66b4srH3GsW3YvfECqj4pCP8R3zEU/VbLXKhGNqqC
         5pm5xVAP5q4R+YS2OWTb4fVKRfnBgvo65npLqCSkLB2ZXH6sesMNncsjkEXd3smWWg0Z
         71xsilIE/8812WKPHCHSe5m9MvZtGMKmJ7EU4eYG4CD20KExZRDlpr5swbU5H486Np9t
         rfv3EGtsEYLXdbVdXAxy+DxhuvKC+P20O300nVXFfW3nlTX0lOri+zePiSBfqeIirvW/
         do4CXVPnhAPJ9OmAjURytpND8N2dvk+xsCmEG2OPTm7A/Xnlnvo0QbS5U21Ryfo2h0GD
         BsSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cM0/7iRrggwx13fJlmVTiTrl5iQ6FdVCOXdjRrR2HXs=;
        fh=Dnp0/GN/a29fWIL4NEzbrxxfnMgSbXh3OV+VTfqxihw=;
        b=LaEsdzBp6PbulDnlvPbPb3eJo/qTeUmtEdAIIJuGixzpDxRQx/7mCCSTvBaSW2JNl0
         M3tB8waYyaWluAoj3R5s60Atw88RTdw2FyJ3UcGRwTu1TRPrl3VbQhQ+vv12LxqvLahh
         U1fct14zKodjrx1Uau2OYVTRUyAUz3g4w0PN0SXWUfvROi4SJk2Ufal4QThHLnndm+BA
         El+K55kbvKEuxKLjNKO0Gt7ZX01rjRyKs1Adxf1ry+SMBuJri2M8jHTDFm8utqrDvWhg
         ffmBXnvCrqXhRCuSNhYYzGCQy9MPsa3gpT5LKWYuIWytuhk62GTM6e/nFSDFlYpI+B8q
         kUjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787621434; x=1788226234; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cM0/7iRrggwx13fJlmVTiTrl5iQ6FdVCOXdjRrR2HXs=;
        b=F4jcpn4Lzx947zPGWJWRy4QY5IQ6Pt+vByJdz7b2UrPnzPTwRyCx2PNK1GKte8Y0/F
         VpGGLy9njy4bUQIVVqNnXd5TyazS1EucTSxxMmKp4rgrQQo02g5C0E0fILhwF/F/nWal
         RYXrijwGWItZId9rFDASrgm9QGFrc/nvrO2nb1DN2uesmxIf1UHvht/zvImysb/dq504
         D6Z+X37ufrd0ff9purFR5NIsaHdH6Hyc4uE7D86WHr+vxi8eiZWW21aGI8dS5WFmPFof
         DEFfAE6OIjd5YZBoQKgl1c6XQAF8Kix4Eg7Z2EuxN2QMes+G7fY8KdMg1h8S0fOwlFYb
         Au+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787621434; x=1788226234;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cM0/7iRrggwx13fJlmVTiTrl5iQ6FdVCOXdjRrR2HXs=;
        b=XCFxO5LQQ/ulADvbb1XR3dWcetYzGnawipncvqb0bHrAR2ZP3hnSKqg/aEm9u29IZ+
         A1iFa0V4g6KIOcKqvdQrLzPf6nL9KRwT0y+KjwjMyr6pIJ2/SCLnaVb0MzLpm0HCLQuU
         H48yW8bjicSQjSKl98bXby6gFzvz3Tr2LsLDYyRgN4tFLYsnXqPni8eHAWNZFYR8fq5X
         lbBgPQM9rktzMAajb6Us1OtLVBV4+0MuWELGZfjQoSSnB364vHGqt93KpguIMNN7gAd1
         bK6ZXmbFv7Y3DNWazAUqJkpfMrz3EMrK9+80ins/dCzuyxCX2lTUNJCGrw4Na0aVCzD/
         ghuA==
X-Forwarded-Encrypted: i=1; AHgh+RpJt8pH68QZa1lqGbS067T5BJo9st0FecR8m8LIVoeHJ7pDwJpue629LwiBEx7MU7zTAV4Y@lists.linux.dev
X-Gm-Message-State: AFuF++lD94j19FvkSZO/xKAJbxAcpmNAC51+xza9Dbgcr8GbS6G8ETj2
	tAtn/iCQFPTbvL9DFuvQyUJVeFjNgKGifkgyMzFsqo0htQU/5b1UhmFXiPbupkYg87ZOaeU6L84
	sbvXKny8sX90bXLy4Nrsv4cain3CoNeg=
X-Gm-Gg: AR+sD12Zm6T/1zMJzNG+/c2gZadHKzf87trUra/D8psRTg16T9PZHcNmGaKwYGq5I3N
	JhnQD5p9w2vnNA6v+7SJXeqO/Uj8uVFaNiz5oYzsR18FYniM8fXZS80/+Elkxh6hj1bdJ7JzYJl
	tWrL6uYjyUTtZB3eIC1EROM6bQ+vIQGKUupRfB2eE3R+pnCQMTdymLiHNVEZJ3y6bmO/akl9kTR
	ubeRcdfWAELwqsljFe3O4NFa+VpxpsE4M3CgXSvLQTf89h5SnH7jaeAn4S8EqxENNToGfkPFTCk
	TQmiaonkLYMTcgpVPz/f/S8o50NU6lnZhYaGjpRPqKjX
X-Received: by 2002:a05:651c:41d3:b0:39b:695:32a3 with SMTP id
 38308e7fff4ca-3a1c1ea8683mr49067031fa.13.1787621433570; Mon, 24 Aug 2026
 18:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANFS6bb5BHY_XskcC2BoYQnB8iq0J0q90+r08xuANRoJNwHOeQ@mail.gmail.com>
 <6a8c583f.a4ccd6f3.2488d7.bd37@mx.google.com>
In-Reply-To: <6a8c583f.a4ccd6f3.2488d7.bd37@mx.google.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 25 Aug 2026 10:30:21 +0900
X-Gm-Features: AcwNN1U-7uQo7LPI8ozaC1VB1_fK-kIAwioGuMEeNRr3HNOUH2RX7rV2L5A0O74
Message-ID: <CANFS6bbXLNsuuMoOP6_BSX48K5bzNx3M-BnxJrYGBJQbPAX9TA@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: mount read-only when mft records are smaller
 than the device block
To: Dennis Tighe <dennis.tighe@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 8=EC=9B=94 24=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 11:42, =
Dennis Tighe <dennis.tighe@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> An mft record is written with a single bio of exactly mft_record_size
> bytes. bio_unaligned() rejects a bio whose size is not a multiple of the
> device's logical block size, so on a volume whose mft records are smaller
> than that block no mft record can be written at all.
>
> On 512n and 512e drives this is a non-issue, since both report a 512-byte
> logical block and a 1k record is a clean multiple of it. On 4Kn drives th=
e
> mft record (1k) is smaller than the 4k logical block, so every mft write
> fails. At the same time, other writes (like directory index entries) that
> are 4k will succeed leading references to unwritten mft records and a
> corruption situation.
>
> Reads are unaffected, so mount read-only rather than refusing outright,
> and refuse a later remount read-write for the same reason.
>
> This is a stopgap. Writing these volumes needs read-modify-write at the
> device's block size, which this does not implement.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Dennis Tighe <dennis.tighe@gmail.com>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

--=20
Thanks,
Hyunchul
