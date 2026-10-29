Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263929;
	b=zayDVb32bymxJansUOI/CR8xHecQ8nfZqhzr3PfTKNHsSzWwVVIVCGoLJCWs3z2O+8YJ
	 ivowTkwr3NBL2DIBiWT2fyLZJqxEhbj4JjESXF7QtTYtb5XkHvYskmkUtJfP4UbIZnzzZ
	 aHZYLnVIr5Zyf2FnK2ItEYxQIH58bpMmJOMIS1wC+X9NY1102s1nZpSldSu81HLGdUC4+
	 mYsvmS8jojLnKuxMeo9dXwwW9U1538P2NHezq0k7+kNBdUaZbXSF5ZbejVLIl7v+Os8IC
	 /xQuaqh24IJuI1j/8CyA/4qeIaEtzB9wTIb4QLQYI/E+ZIPUzmbIfhbzLwSW1xBzICQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263929;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=RxXVX0u1tST1sM7oKsZpCNSl7HkkkNyoIU3jrvUDIvc=;
	b=v6+G1SRMjf2k/jxgalLdWJH3D3cx1fWt0uh3NGhOVu5zDqFWG4DUBLdD2lcfKJ82NSG7
	 Pg5QZ/TU91B+f0MKi05j6cKmJQNs4YkahfNAlv7RPWNOVw2cGfnNfuAMQmFH+AvTzEWw0
	 PYBoP5wN/CtSDwBLc6OA+Ww9o6ff4OswePObWWcjiTr9Qyh7y0Ngn2QXAKR4KDYuM5RUK
	 6BcQ/Gn4VSkXzVF1zMALnmd/7HJqt3HvDPS8Dhd/wVGN4dwFXwpJ+nTTBvxsLhM8TDNGN
	 tUy91Cd6PIMkaKlvi8hMc9x+KjGLH/xWuxlqqKjitNBTyw+UQCl9kkqagfmGlLge4Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQULNa9e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA03606A31E
	for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 08:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQULNa9e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346B91F031E0
	for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 08:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793263929;
	bh=RxXVX0u1tST1sM7oKsZpCNSl7HkkkNyoIU3jrvUDIvc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eQULNa9eoHxwmePWErE2XHDPO+stE6AEGVgiQsJ+vHzR57W8T5YiHeKrI/oy59sWd
	 nnrTCQqN2r6LCESRwZ2mE10tzNxic2+uwRZbzdQ8hsz7j2UWIyuX1f5zs7MuglTg+Z
	 r0+T3L2lp27manlNf7dN+FZgB5hlxTR5jM7sKCYATvSdVF0Xaj+NYjm7cLFDoPwq8z
	 WmJ0KfdV4kbTJtM0ATpYk7SWUvVVdQraiWT6U4FWkQWPGDxIt6LdFU4AT97wFuWRXo
	 G5zNNUDHL8CZO3R1JU2Ko4cxzENCv5G3aUQezXnkDwhFlMWrw+fmykZ+i5vEUloVgT
	 SLwv3vNjUqN6A==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4322d310e7so270079866b.0
        for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 01:52:09 -0700 (PDT)
X-Gm-Message-State: AFq9FYIm/5wlLeEavctG8ARPNO26XPLtOZltsg/0QLcIudlV6Nu8iNaw
	KcVQzp7FuksIOqepAlyK0oiyW+K5+4gJB1mPNnix4p8peCsmKHcQCZidou1r/8JEqnBaMnqVUrD
	cN7KgYxqs4b8yISI+eTn3FaMDvHtPErk=
X-Received: by 2002:a17:907:86a4:b0:c46:9d7b:37d with SMTP id
 a640c23a62f3a-c49bdecee42mr399552466b.17.1793263927893; Thu, 29 Oct 2026
 01:52:07 -0700 (PDT)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028084248.2149976-1-hyc.lee@gmail.com> <20261028084248.2149976-3-hyc.lee@gmail.com>
In-Reply-To: <20261028084248.2149976-3-hyc.lee@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 29 Oct 2026 17:51:54 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9f0LWsaEXXE4_Of=H_jP=jkafKS2BmrHPCe9BTsdN=Zg@mail.gmail.com>
X-Gm-Features: AclHuK8QzMDzeiYpFhLLr4Kwb00K6t3Ho7Ri6b_T0zgg0ISHCkQ6Rdefwgbk894
Message-ID: <CAKYAXd9f0LWsaEXXE4_Of=H_jP=jkafKS2BmrHPCe9BTsdN=Zg@mail.gmail.com>
Subject: Re: [PATCH 3/3] ntfs: avoid overflow when limiting attribute read length
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 5:43=E2=80=AFPM Hyunchul Lee <hyc.lee@gmail.com> wr=
ote:
>
> ntfs_inode_attr_pread() limits a read to the attribute size using
> pos + count. A large count can overflow the signed sum and bypass
> the attribute EOF boundary check. Compare count with isize - pos
> instead, after validating pos, so the read length limit cannot wrap.
>
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
Applied it to #ntfs-next.
Thanks!
