Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263887;
	b=XRnQjgabWJQcZHQR4/bTrgRGy9OlIkyVLrlDsaPbNUdi4mLkxSILnNp2K0RHpiXPMebl
	 MB2FHj/XXAlo7uqqYkaArQhYArWGOYk1V0FxyY2EucDysl0vpSJegotEqDJMWKX+8mgRu
	 /+NCuW4c1wmSDS7440o0v7B4vqric8eA3ragV1Ee4tpXFJLpMPjROVsdD+u0MfKh4GDun
	 Y1pYnFqsMPwCVIxG4bmyemYkvgVUWca+d+UC9A0g+TRA/qGgfalW15GOy9i7JXpFqTmwF
	 CFaG4t9nddjZkOVIuCMoDkkz27p0JYiI6Gk6wmxw2tRd7o6zTRklzLRF8QUeGgLd2Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263887;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=hj/MiebC+quF4dYH+xuIf92VbOx1fZ3KYydEBeTnn18=;
	b=YweZZUIN3ywl9AnSzWhA5zw6i24rK2erZgiaNBXtp98jJMjkSbQ32wr0nrAla8ulYosG
	 rXrb8hqnQBROQTSS7Eb1g3q0RPDPvDGkLSYaR7UaOXMOAclDQHWYHmK7RVXhDRrie5Ynz
	 CEAgO/VTbvibuRX42O0LhBKpHrdLrHuPxCCBXY8R886s11vYA15zlO26DPevbMC05l0vJ
	 x5ysuE/Gus3YtzNNQx871wnGWO3/otYKnI+GnfRlhSw1ygPZk/A5nbVPD5g4TUnvBlAii
	 1hvdxq0j6fwI+jfdkAJ/L4hCbV1nBxRez8ZuQeTdR+Ko9gJbO74TZJJwWWtHONK+Nxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dwAG+39+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6AA60A2602
	for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 08:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dwAG+39+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F7C1F031E1
	for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 08:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793263887;
	bh=hj/MiebC+quF4dYH+xuIf92VbOx1fZ3KYydEBeTnn18=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dwAG+39+LCPIkxUrYaYpWPGIXqhLgcrC3S5smhcDdw61hzM5U1SQm0rUR286EPjVj
	 PZdOUjRdmzaFs6eRDOgFiO88kZCyXMb8wpxQaLdDyHiJqIAO8H0U/FIc1DI99aEvsk
	 oS9r70Lb9rIB93fSq0Zb0qdFmuFVwHUxf35XSBSY8rsDibmGgleSmWmTW4SuI90GkI
	 zBI0jwDJyipkvVFPDbqTqEsRisDx1y+ojLTSZqY9a6gMK2DRSQlBr1XYF6d/7wCDSF
	 8pAsKTWPiaUwIC+sFRQMM/7M8a3QTEMZE4JX5E2YkSBeiW8rnV/0yfqZdIx9r13V0q
	 4moiJDI/Qretw==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4326803b54so130390866b.0
        for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 01:51:27 -0700 (PDT)
X-Gm-Message-State: AFq9FYKR+krWM9htRLlP9Hzqwvpv5w+qEZEiaCpFOdKlHs7z7Bo0/gk0
	1iq7RrxqPRCVrWCWkVqShNZnsR9J5UTBUtL4F88Kx6oT3AauXBI5TyMnfXbyiOUFWK+XZ/Bcisz
	CcGjvDW83aXJ2KOofFbhROvCPF5v6Plo=
X-Received: by 2002:a17:907:d15:b0:c40:3a99:3f96 with SMTP id
 a640c23a62f3a-c49bdec8274mr367591166b.10.1793263885743; Thu, 29 Oct 2026
 01:51:25 -0700 (PDT)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028084248.2149976-1-hyc.lee@gmail.com>
In-Reply-To: <20261028084248.2149976-1-hyc.lee@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 29 Oct 2026 17:51:13 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8vAQFmpCoubgwALYFFn0f0A3zG6cJYnVy_tG2F5GLjLA@mail.gmail.com>
X-Gm-Features: AclHuK935KCEWDhu-X9IFWUBz5vkZltwymVhZbJyVz4L3r_awzVU47EhTMz96ko
Message-ID: <CAKYAXd8vAQFmpCoubgwALYFFn0f0A3zG6cJYnVy_tG2F5GLjLA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ntfs: reject negative attribute read positions
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, Robert Morris <rtm@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 5:43=E2=80=AFPM Hyunchul Lee <hyc.lee@gmail.com> wr=
ote:
>
> A corrupt index entry can produce a VCN whose byte offset overflows.
> Reject negative positions before they reach pointer arithmetic in
> ntfs_inode_attr_pread().
>
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Reported-by: Robert Morris <rtm@mit.edu>
> Link: https://lore.kernel.org/ntfs/10091.1793100344@localhost/
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
Applied it to #ntfs-next.
Thanks!
