Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24304E8E15
	for <ntfs@lists.linux.dev>; Wed, 14 Oct 2026 12:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981867; cv=none; b=EPTX9Ptc5385rNbq4c3NAfurbDlPjBdSyOmVijLrDY9usbbqQ1jcsLsFe1Bh2+0DOwAKI7J8w6eK21hw2Z1vZ6UoSTWOjBC2t69Po71WKZ23X8oPMQE9++NXaOux8npfp4hg9XQAwXDm+ybTO/g1YMapwPznUx6VGjf08MuPiTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981867; c=relaxed/simple;
	bh=eMPn4cPSWoSrdPxRQaiE0mcaKbIlI9N8RW4otXgnA1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWsrKUZxvYF0+bJTfNTFiRzNIsj+8oaHY2ISi/3+eL5IeciDXO46+SAQhavBnXT5omT2u5wJ1qCgrUCLkM2OEtT12tYpfDQDn45Sy+HSUDmUVUWQGTAeaNzC0uJPoSsqvhTW61gjPiL+wcoiAAwgqnjuXHgdV0CCGASoM+evels=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HrZvElBr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrZvElBr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6481F00893
	for <ntfs@lists.linux.dev>; Wed, 14 Oct 2026 12:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981866;
	bh=eMPn4cPSWoSrdPxRQaiE0mcaKbIlI9N8RW4otXgnA1c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HrZvElBrsKEENoHVPiSUuiBTC+jvDnCcj+2D6fli8akQUcbrge+t0PXA0aR5coOBZ
	 yPlOo0hfqtX08VnZdTYj7G556oLcFAuELpX/OaU+HUOhM3oAsiSOG+kqNKSYY5UETW
	 fqmzQ1C8cee4vUQj5vs1ZKGxla44O2XUMPjwuUtUrQmGxDGdhAfjo7d85AoclFKGNw
	 EW6IdwqLMzgMQ59LKLkiO+sUSP6hUVIv7uk1TGYgFh9Dr+3cZko+ahnsiGGRYfahmG
	 d1DNpZoiyaTbLp5OnBhmwiUlYvOwxCtev7JcoESDMIWrsu1Afi6IUWDf4yxAIpaoLZ
	 7zbky5NjAMfLw==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2e5e090746so394077066b.0
        for <ntfs@lists.linux.dev>; Wed, 14 Oct 2026 05:44:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx5c8MeZoIt2nRCCGPPaM1eq1XxzewUtsWVTCv84LJO2cEbQhrIuFAmFfU9ZCLZZgFotz4u@lists.linux.dev
X-Gm-Message-State: AFq9FYJp+b8LkqLuq2NThVYTGZcotz71rTgXGmuf7rRkPkGgwbHY3Ud3
	Nafmx1wnt9WlgDdqPqiBRJ6af/vgDR+FPLq2I4OuuI7eOndoOliqRR5bDFoHyWw4x3TJNShfwzt
	cLqF2GqrFmVkXma2tUsyftou9w6BhT1c=
X-Received: by 2002:a17:906:730d:b0:c2e:63ba:1f90 with SMTP id
 a640c23a62f3a-c31aa0fb050mr1548431466b.48.1791981865098; Wed, 14 Oct 2026
 05:44:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014011824.493241-1-wangxuewen@kylinos.cn>
In-Reply-To: <20261014011824.493241-1-wangxuewen@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 14 Oct 2026 21:44:12 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-0BDeMF+4Bj7WMPUeGy6tw2je+yujrUjYG+pw6RqdzOw@mail.gmail.com>
X-Gm-Features: AclHuK9B7ZaxmSn5-KIb94CXT9spp5et8QHLxVQmMwj_bUrDkjev2j-dNgQc4Fk
Message-ID: <CAKYAXd-0BDeMF+4Bj7WMPUeGy6tw2je+yujrUjYG+pw6RqdzOw@mail.gmail.com>
Subject: Re: [PATCH v1] ntfs: report birth time for symbolic links
To: Xuewen Wang <wangxuewen@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 10:18=E2=80=AFAM Xuewen Wang <wangxuewen@kylinos.cn=
> wrote:
>
> NTFS already loads the creation time into i_crtime and reports it through
> ntfs_getattr(). However, the symbolic-link inode operations omit getattr,
> so statx() with AT_SYMLINK_NOFOLLOW falls back to generic_fillattr() and
> does not return STATX_BTIME for the link itself.
>
> Use ntfs_getattr() for symbolic links to expose their stored creation tim=
e.
>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
