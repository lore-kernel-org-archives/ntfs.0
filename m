Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263910;
	b=pZokhCr83Rg2j0h+/sLj+KOUb9O94GKRb95uicb2Nu5z/EfeyQENUXJ+TgnasEleuNqw
	 ELYRj7KPjVR3utgYbNhei1HDRzgjcw263a/UsvvPONGwC12AmRLedyfr/VoN+c8sRlzzu
	 SEvLyOX0rGijw2CSs6cj8rEu97WOossW+Yzvk/mEC+GuprRfnSAxHpCiaVac4SR8vvVW1
	 eA2T0Yq/CALGiQNvx/gsv7bInRda+8d0hdLt6vTQhzr1FYRmedFHFrj4cf/hcfSTyczzS
	 dDgJIZ4LRwbXmLSGz+kHhACQQdim/LqNVYUHOphx/aob9YMyyUEYEQZAIXhqznOFGdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263910;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=pclombH8pIwL2luY6jIkPmnhV06RjHgkrYeNPq3qvCA=;
	b=LKNoNmBl3CClXlnCEE1++3hydFN+Wv9Th6fCW/JQhKBm+F22MKHhiRdUvc0Pgj0nh1h/
	 SK5A4LYBPHyxeFT1tgKJcEx4cYQMucLTxYJB2aojrN6RGFQQdFileJ2xRnQ/Du5cxekDF
	 65MRYhO3Gns8/UEr7KfO6xw8+tzoAUZ3bi447JJPGjGURFeFldigQgU/TclmhVbaRIYkM
	 Nz8U2ONaZ5lavHjC9np186lXY1dbDDxvvYoWmMf8T73mDrCyeHi7ZXqfu+m/lm2BP46JI
	 sAdJrURMcmyIXkHyoHs9SHdjqQb5yyI9H+HHqPOu/sTBfKL5djCRp8fs+6sT6Yb9+mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dB6ralE3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D469E606A335
	for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 08:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dB6ralE3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C571F01828
	for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 08:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793263909;
	bh=pclombH8pIwL2luY6jIkPmnhV06RjHgkrYeNPq3qvCA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dB6ralE3BayiaSghaL52vT02W52LObLesJpizcUPoj/vJYNqHp4oQ1eNNpeOki3XQ
	 p8BsNuo7wYTFOoMQSliA3lYwRAPLPHx17ImH1RWonoQqVT5qkqp85+9W6apdWAcCQ/
	 xKPFYn+q+lktu4gbfOHg1vLuK5KAmiJ1RC10BTHYw07pVLp5gAim1mU5EdbvIYq0Lm
	 +2JCKhfvl2ZVSVjaEPoW0zWkIn6n+vv0G0jN8TrJyOT63+euqV9HRX9quwrYGpkOSQ
	 OSDL6MJ5DWt0d1kH6m5zYZ2Ayqt1AyZymgg4hiHiSoIYq+buP4wyv4y3K5zqHBQlAd
	 a6AB5IzV/9Ebg==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c423b145922so263186566b.3
        for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 01:51:49 -0700 (PDT)
X-Gm-Message-State: AFq9FYLmx3ZefnZBGJDcou+/JTKE3dmCzLjoMuYSpy5BCbLLVnRwxqu5
	qnX9XCP/3JecSxI5Rm+41nRarxtrclrZkV/eBEnnp3x9qUi0+x7UDbvBhBnqGciLqKH+13IS4wc
	ZGVYrboKc0YsqMg4VPJ6TQV/bLh2duLc=
X-Received: by 2002:a17:907:961a:b0:c21:9b4b:2690 with SMTP id
 a640c23a62f3a-c49bdeab69cmr391548666b.17.1793263908146; Thu, 29 Oct 2026
 01:51:48 -0700 (PDT)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028084248.2149976-1-hyc.lee@gmail.com> <20261028084248.2149976-2-hyc.lee@gmail.com>
In-Reply-To: <20261028084248.2149976-2-hyc.lee@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 29 Oct 2026 17:51:35 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-PGACtJ18da-A2d0piMhoytF-=_GZGAtHnwKU0PdkSOQ@mail.gmail.com>
X-Gm-Features: AclHuK_YuReqoBhT3Ui8sNFTiWujtuyuEuCuGoCeMA1xL9Tvyd5LR97piPwq2Ag
Message-ID: <CAKYAXd-PGACtJ18da-A2d0piMhoytF-=_GZGAtHnwKU0PdkSOQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] ntfs: initialize VCN when inserting index entries
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 5:43=E2=80=AFPM Hyunchul Lee <hyc.lee@gmail.com> wr=
ote:
>
> When a leaf index entry is promoted during a split,
> ntfs_ih_insert() extends a copied entry with the NODE VCN field.
> Initialize that field before copying the new entry into the parent
> index. The promoted entry must reference the old child VCN, while
> the existing parent entry is updated to reference the newly allocated
> right child.
>
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
Applied it to #ntfs-next.
Thanks!
