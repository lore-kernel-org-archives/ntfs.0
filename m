Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68794BD36E
	for <ntfs@lists.linux.dev>; Wed, 14 Oct 2026 12:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981565; cv=none; b=soy2tjX9mjKdBrkMTiCvSc0lhkN9O2cZAoV+fRi0VHFL+iRFTBqFi4kaeK9M2ukJR56rOGnB4GC8aa5aPF22Zz0UBcJSYDjrR3eYcVHoBS7kgRDWlMyNnNLdRH4g9mgXGNoVaA0eCMr3A1ipUAAw3K/BgGei5TMewrX1Hcx3A5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981565; c=relaxed/simple;
	bh=7Kk0CxwEtjzYkojvCKWxzAP67CgEdO67ClErl6G2Ym4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tw5JchO+OywzeCeAXuq+++QdSIf/SK3YVH0id2OARKNb4e7On5cagskt7M5UaRfCaeAr40dUEPGqIH1QAq4VLYr7VhqR3ObDAdyMrn7nt8dNbfr/Y8+5JruGlz+RVrBzr5+PPKzUWgiVNh4oDElLAvGTRTNNISuBTbfUyVR/eYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aO69Pm3o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aO69Pm3o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E951F0089A
	for <ntfs@lists.linux.dev>; Wed, 14 Oct 2026 12:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981564;
	bh=Knf75Ls2vrIpkylWUr/pvbXb19RPsFAB0AeEvO/u/KE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aO69Pm3orR74eKnDwFMNan/luuWNO7WGE9hfDknGgP47EDc2T5jPGbbZhnA852w9F
	 xy37hDBw7Kp5L/NbHjSkMmxq5gBJBROv0CTxDgc3ZyUWyTcjonU5y97mtmaiVEXSQf
	 WtR2f9TfOpbZT/AkY9E2FQeyDSYK6S3RXwTKMNHtZG09r1/BQjRivCLDZkNOI+NnhD
	 hT5acDpAp0hz6O8mexoA1DIdoWbnyofqjlw4NK8zUu84kqAF0SX7JcAwF99jB2Kq7a
	 Mp6Tw1TaP1UM+kBGv1pBbfBS6nxBfs8xMTLS859QZfjnPzah+tenYouIdiVlg07dgP
	 AZ/C31ZKmeU+A==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c3156e7705cso167304566b.1
        for <ntfs@lists.linux.dev>; Wed, 14 Oct 2026 05:39:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByBG++7dMfSbsdqEnnN7R92IJEjCgHw4q28z+ClHJQSjHm9JHtANpX8OVvcgHM2K+IQhawP@lists.linux.dev
X-Gm-Message-State: AFq9FYIwqc9AfHFZYEvcK9ZBKqlMy1/ESqJbpo0/fLt1Ero7DZvksDup
	rkkCQCLm1xIqrLT1OFjnNt29C2+7PIrIDRwE6mfb4mvif1d2SX6o7yMMCJKF2NitqRAimelR4qT
	FsU73WYKeORHCy4xz33jl7DNTOMQ3xw4=
X-Received: by 2002:a17:907:96a6:b0:c31:5c2b:9e4b with SMTP id
 a640c23a62f3a-c31a9fcf341mr1694753366b.9.1791981563351; Wed, 14 Oct 2026
 05:39:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013145846.56415-1-charsyam@gmail.com>
In-Reply-To: <20261013145846.56415-1-charsyam@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 14 Oct 2026 21:39:10 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9oz1EgU_+wscBQtQhy2OvY0aTLD+qspgWuxG_wUXN0XA@mail.gmail.com>
X-Gm-Features: AclHuK9ycT3hqCHux-rWwKW7hmgl-GX0VeiRBI-Vic7dBTJo9x-xz8Sv84ssuYQ
Message-ID: <CAKYAXd9oz1EgU_+wscBQtQhy2OvY0aTLD+qspgWuxG_wUXN0XA@mail.gmail.com>
Subject: Re: [PATCH 0/2] ntfs: handle block device cache flush in fsync paths
To: DaeMyung Kang <charsyam@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 11:58=E2=80=AFPM DaeMyung Kang <charsyam@gmail.com>=
 wrote:
>
> Regular-file fsync currently ignores a block device cache flush failure,
> while directory fsync never issues a cache flush. Both can report success
> without ensuring that the data and metadata reached stable storage.
>
> The first patch returns and logs flush failures from regular-file fsync.
> The second adds a flush to directory fsync and reports its failure. The
> syncfs path already handles flush errors.
>
> QEMU blkdebug injected -EIO for flush_to_disk on ntfs-next at
> 04fb910da2c8. Before these changes, both file and directory fsync
> returned success while syncfs returned -EIO. With the respective fixes,
> both fsync calls return -EIO. A kretprobe confirmed the flush failures.
>
> DaeMyung Kang (2):
>   ntfs: report block device flush failures from fsync
>   ntfs: flush the block device when syncing a directory
Applied them to #ntfs-next.
Thanks!
