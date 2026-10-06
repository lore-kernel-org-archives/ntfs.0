Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B293B6C09
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294556; cv=none; b=PaeVcXYpwjncHGyY/vcETLsLf2Z3Rh4Jx3nqRiU1NCdD+gPwXUeao1FhAVYkqhS2yrtXRgl0EdCpYotSMXWG9ImpWJMenrYBnvYKYUreRCNMB010rbbZZqFcTFsSil5b0IrYyNp6QbPzcYzA/fRVLL3EHENxlEIq118K7mEVGe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294556; c=relaxed/simple;
	bh=8R/ldjXjAlBbpS7zZfQqlDCtbPWXIwxq4sj4mSvlxgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pm6msNA8NEIGR1FFOPX/i9Y38Bh1m6ZUzdKw5S3QzTFEq+KCvIJnLX2QOfAP183Mt/1SEQwEn543lEExuu0XN+48Bq3Le6FDCenA+f7XHuMsapL9342cGNl4RpiGXP8Xu3kJTg3JyqmYlzhsxY16NpUkTUS5VXFa6Pl4DKEFtZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+6Lkteb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+6Lkteb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBCF1F000FF
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 13:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791294555;
	bh=8R/ldjXjAlBbpS7zZfQqlDCtbPWXIwxq4sj4mSvlxgk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Z+6LktebL53T1qNjGAcaSv/lqNBmvLqqzge/nf13F4aEwtkOaOezEqrUDM3ezYg5X
	 N/RmTQxIwYY9Jf+7dBH1qiPsinsXAsaSGIdTh33M0lI7d3fgrsMWBEdAB2Kgytrr1h
	 gynY+71pIKNU0K88bNZ46MF0Msm0XEYdsqTi3gEpqnb+9EEw7WvDmjwEKTGGezb3XU
	 Wu0dBlGNTSk+dR8cK7pELByzyESVbIiLvC4brv93ymI5L5X7zpZSXsGdF1T9OIo09f
	 zUbSVQM0R7S/YUgiAW/ewyFemvhWWWEvXrBswft+83UMYyDL4ccNuZChWa7FUEjjjo
	 fL/gBK+Xgd2Yw==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-677cc343120so2856800d50.0
        for <ntfs@lists.linux.dev>; Tue, 06 Oct 2026 06:49:15 -0700 (PDT)
X-Gm-Message-State: AFq9FYLU4DVByVfx/AkyYTB8pEYEDdS8dV9/KiydHiUan4je38LzJoqc
	cxKLg+vGX2PM9WzOR5JVov6JFIqT+Pyj36OZrzZd5MicXxBS7/+qN0HJ0+VbvZfVN9FdAEzquCN
	bO+7Zyb2nUg9U5Ycc9oGNy3zJhdbHecE=
X-Received: by 2002:a05:690e:1487:b0:675:5dd5:bcbd with SMTP id
 956f58d0204a3-677bd2ff1f0mr4704044d50.32.1791294554293; Tue, 06 Oct 2026
 06:49:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261006-test-port-ntfs-oot-ntfs-only-require-compressed-size-on-first-exten-v2-1-080315ae06d3@gmail.com>
In-Reply-To: <20261006-test-port-ntfs-oot-ntfs-only-require-compressed-size-on-first-exten-v2-1-080315ae06d3@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 6 Oct 2026 22:48:59 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_LY+HqVV8gTigb+Nma4W-mJ7hyCXbw391hDk67sf1DEA@mail.gmail.com>
X-Gm-Features: AclHuK8_nyWiOTfnHi-ut9Y9zc_oTnzfCvj-wPb09U9vE4P4Xp-0Dbh0rQDnGOM
Message-ID: <CAKYAXd_LY+HqVV8gTigb+Nma4W-mJ7hyCXbw391hDk67sf1DEA@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: only require compressed size on first extent
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 11:24=E2=80=AFAM Hyunchul Lee <hyc.lee@gmail.com> wr=
ote:
>
> The attribute validator required the compressed_size field for
> every sparse or compressed extent. Continuation extents omit that field,
> so their valid mapping_pairs_offset of 64 was rejected and compressed
> reads failed.
>
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
Applied it to #ntfs-next.
Please add a Fixes tag next time.
Thanks.
