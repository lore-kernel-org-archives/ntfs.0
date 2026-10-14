Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EDF4C1512
	for <ntfs@lists.linux.dev>; Wed, 14 Oct 2026 12:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981900; cv=none; b=QCxQ1mMHkYIM3ml5Wj1snetT7Xr/zyQ36dRdxtn91JupZdBkTRhDDiGBIZ9TYfUBNNf+iD2silhVgyaXasnJxS63dI8pGJyLmwXIfZJ2fMjvemI/0lDDookI9K7ABRrhW/d9Oe0WAe0hPJOTREQ5AHUIRfOeGXgGpT14HH3Xxl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981900; c=relaxed/simple;
	bh=jlkg6Pp9S5K6OjqDHZJE27nWpXn+g10CvZhATskod9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdJxQHdHDzjYsv7GV4cqq8gGqpy3Z9E4iffeuKrkiuKNhJhOYWpZ+g3kPuTG7F310ySsjOGbcIjj5w4L775QjKhrwjcRl3WLPqq+F4WVhO/k5Al3ds5tlGPy4CO7CX0NOFSUXRGZ+2pEtIHfx0uI11GJoHffbLaG4VqmdEEa7CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUV9RsN7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUV9RsN7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DB51F00899
	for <ntfs@lists.linux.dev>; Wed, 14 Oct 2026 12:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981898;
	bh=jlkg6Pp9S5K6OjqDHZJE27nWpXn+g10CvZhATskod9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cUV9RsN7MPaUayQSlydVagR7Gyx9JLiMfjhfYZJMuXev9DtNRzEUa9bSbCgeGolZF
	 CbW8lCPQAklOqTxEtEK3Y4w4/pfknVyNR3xBcgoVuUvCOF2O6s31d1qgyu7gQDEmnR
	 AJmDkargcJdUylKDQbWec0mzVVQavVYYMN5ZW/HBI1X4UuJq7GSGh1Gpee3TCtBEp1
	 CrgmqFo8Qx8MdWTLrboV21/zryvSWVGmsnkS5/YY9kZK+KYzGoJICphtQUxhPSsEJu
	 e/9moBCl359hQ6TV8Zpb+hCCcobCdcQh9IWF43rDrOok5sXOzycDmmhNdGybjlWIGv
	 xFdb2pLQ+fNlQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so845366a12.0
        for <ntfs@lists.linux.dev>; Wed, 14 Oct 2026 05:44:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByajWti9cf09tvGCqNyNzj1FSWXEU0SW2IwuZtXuQfC2gDTnhGbLKKRuWXLQY1nEnqkP5w1@lists.linux.dev
X-Gm-Message-State: AFq9FYK9i9X2se33dJRxevQgwq+HjfPN3fvfX17PoKDPeTO8SOY6+pUY
	dyh8S/9fBchqrtbz5zlxqLne8aercZrDDBoX1CwKLkxORUcMCVl3NO3FZiWdiL1uEHjcDHfBzKx
	xvFNdrG8A2V5nEvrAJvH4I6oCCm+kNvU=
X-Received: by 2002:a17:907:971e:b0:c2e:4831:1442 with SMTP id
 a640c23a62f3a-c31a9a046bcmr1398161066b.1.1791981897013; Wed, 14 Oct 2026
 05:44:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013234310.836392-1-liubaolin12138@163.com>
In-Reply-To: <20261013234310.836392-1-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 14 Oct 2026 21:44:43 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_RbY92zjeAXXjmxBSPoBLLLyLkov0JcvLksd+QxgknuA@mail.gmail.com>
X-Gm-Features: AclHuK8IGpmJGG5lHjhKYsUqNdolcBK51uG8dYcXIGxQjTdotJ0LRSHa2Uho0uc
Message-ID: <CAKYAXd_RbY92zjeAXXjmxBSPoBLLLyLkov0JcvLksd+QxgknuA@mail.gmail.com>
Subject: Re: [PATCH v1] ntfs: support FS_IOC_GETFSUUID
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 8:43=E2=80=AFAM Baolin Liu <liubaolin12138@163.com>=
 wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> NTFS reads the 64-bit volume serial number from the boot sector but leave=
s
> the superblock UUID unset. As a result, the generic FS_IOC_GETFSUUID
> handler returns ENOTTY for files and directories on an NTFS volume.
>
> Register the on-disk little-endian serial number as an eight-byte
> filesystem identifier with super_set_uuid(). The generic VFS handler can
> then expose the existing volume identifier.
>
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
