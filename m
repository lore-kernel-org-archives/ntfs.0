Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7763CD8BF
	for <ntfs@lists.linux.dev>; Tue, 25 Aug 2026 07:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787642912; cv=none; b=tJ+9JZtn2hjNkHfKwl4i7Zkujh0IvUmQfztaI2l0nlzUfMp64T3j3p9bPLyLHsAnCRYms2gNG4O37v13NublG+sX1f4fcxPMyfIZilefl0vAwEOtdyjGrnetBnwhOzUku3X6/nyfqH7/CxwdDuA/Ar4h6f9BH4JJYEqMiEZGZ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787642912; c=relaxed/simple;
	bh=jgVTNqtVoTjLkxkknZ+b4kzTrQatYNGmcbvwotZYPGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asjrH/IELKrTLWyiHZgHukJQH9zQvtczNzagi11vbtSOrrR673vUzn4QHLi20yArLY0YuZ80c7dgOwK0fY/k4NewxLYI3v8+IqPgCknkMunT+F7S8p6s6gYY+ZRFwOroBf+WmvQzED5fGmSzUEw8ruzdM7hKJYPdKKeT6ewhXMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AB9YIcYl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AB9YIcYl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFFE1F00A3E
	for <ntfs@lists.linux.dev>; Tue, 25 Aug 2026 07:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787642911;
	bh=ZNZVmCECI42X8E8eZzGspgnTGbVW4QVbr9N5dLzXKas=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AB9YIcYlnvFf6TUeb0ZRNyIGdztW6lanPOmWu4llvKlweLoe7FOYEFOu8zsbOzZ9U
	 AYB+TwmO9fgrtA+JgK6LtGb7g23nxDNwgVjRzfEF+AjVvLPkRUKsROw3LPhmie1+15
	 I6kmI7Q8zNR/qbooy6FGC9xbXxWh7l+AtEz1NA8fA0fBusT9Z/Km4ZV084gE3904tO
	 EXu9EheYia+kkS0s/Jf1GMjYnEHollR64xmomXvydmoSxFegRzf2DH0N81GBGHHaZ8
	 e2mLhDvY4nZdft5C//7IjSXCC90d2s8ppJa+z4ARkI7cmvhgEOURy2cJ+uCIL+4u74
	 Px8QaAmcTDiZw==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15f020a223so648172766b.1
        for <ntfs@lists.linux.dev>; Tue, 25 Aug 2026 00:28:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqP02npbB+zd9RJps0jSskrc2XxlesqBB00eqS3Bv2eOhgYNntNlVW+k56Dq/gqLNPzKXyZ@lists.linux.dev
X-Gm-Message-State: AFuF++mFhMKIKpCEMGyxU4e/E+CTbwe8xJPT7yFDmlB1nnSHa1uDVvzU
	vsJ1zRFYfkmZsp1m1jGSkzi3VBELvHzUdou0eZMrySw1v6B1FOBQH0M5TMkigNRh0L0iDG+X2Jf
	PfK0cB/n5pCapYP8Y3sJEqqZPaKz/cVU=
X-Received: by 2002:a17:907:a703:b0:c16:13c3:b1ef with SMTP id
 a640c23a62f3a-c246a73b5b7mr3808015266b.24.1787642910034; Tue, 25 Aug 2026
 00:28:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6a8b31d3.6dfd78af.244576.33c7@mx.google.com> <ao0saL_dQcM35LFU@infradead.org>
In-Reply-To: <ao0saL_dQcM35LFU@infradead.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 25 Aug 2026 16:28:17 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_=JmKzF7W74JEcvKcKoLa8AmD2fY_Y3qLG8ihRXbDgXQ@mail.gmail.com>
X-Gm-Features: AcwNN1U-EmoWgx6_eU4mHGPLbPx0mVF6r3z2wUG0zUZJf1dvSPF_Sgn2sD3Vr3A
Message-ID: <CAKYAXd_=JmKzF7W74JEcvKcKoLa8AmD2fY_Y3qLG8ihRXbDgXQ@mail.gmail.com>
Subject: Re: [PATCH] ntfs: mount read-only when mft records are smaller than
 the device block
To: Christoph Hellwig <hch@infradead.org>
Cc: Dennis Tighe <dennis.tighe@gmail.com>, Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 2:47=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Sun, Aug 23, 2026 at 10:45:48AM -0700, Dennis Tighe wrote:
> > An mft record is written with a single bio of exactly mft_record_size
> > bytes. bio_unaligned() rejects a bio whose size is not a multiple of th=
e
> > device's logical block size, so on a volume whose mft records are small=
er
> > than that block no mft record can be written at all.
> >
> > On 512n and 512e drives this is a non-issue; however, on 4Kn drives whe=
n
> > the mft record (1k) is smaller than the logical block size (4k) mft
> > writes begin to fail. At the same time, other writes that use all 4k
> > will succeed leading to a corruption situation.
> >
> > This is a stopgap change that mounts as read-only. The longer term fix =
is
> > to perform 4k writes on 4Kn devices when writing the mft; however, that=
's
> > more involved.
>
> Between this and your previous patch it is pretty clear that a sector
> size > 512 bytes is not supported.  So instead of adding predicted
> band aids, reject this entirely for now and let someone who has the time
> actually understand this for real fix it with a real design test plan
> and all the others bits needed.
NTFS previously supported 4K native, so this seems to be a regression
introduced by some changes.
We will look into it a bit more and then decide whether to reject the mount=
.
Thanks!
