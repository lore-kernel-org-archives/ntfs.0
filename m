Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263978;
	b=32F+eWe9QG1dQN4vZ5Ni+zM7mHNEwpJ6JqcfJZE68yoBhDC1wPrwlqEMG6Eo6P2EHwol
	 T58ahvs7tRyD4ILqagXUne3hMo/1DY2TUbTPyLYaeRp4IZxRTUXKJYoye/UYNGxpsS3Nw
	 a7+7aInIeh2gpae+S/2sQC5k9J7psWb4X0oyiaLh+Se5bhj45wiSqMIZ7FsrgWP63JJRE
	 fcTxDNDOBz0rBdgFAeIjbSxMTl9jzDeef5hzn/ArrGuSZsTxbsniqDI+lsu6u+smjW9d9
	 rfUEufntyh20a1hEY3Jp5HEVct4Sa5mGI4jenoo3n2KsLivVNMRa8Q41RPUX+J8FgCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263978;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9gLH4+a6pMv1endj/otCM4ulkCr0wO6stpwjOWcjwYE=;
	b=x3KG7w+b3KPH0VLDe+RtEPz/jA/JPfR5VWNoMEy4HFezv3+b+ZFUs9Uqz4T6ZKqiY1Bk
	 QlO7MUikzIjX7DsjVCX+l7JiGYHQcCbRD1BT8WCdlM5Le46lk6WmdtMpDA8jchHtPlRNk
	 EYW/m9NT3ruluq65RHpPrOMrWhMxof5mKi+AcpRRyfAcW8mO+EN7Sgtt3ippCEDbUYada
	 M3WzIbE4u7cvqpwDosZPg59KHIWuoNTvPN9PnVJRT1pdvriQHtRJPWrTRhzwppr1sbclF
	 J4IdHYyUGE3/+G38RitOpRAgIOrboGhh2Zf1GlkLZrtIls7Ncf/StuM1ByrI+fB9XQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QyUkOBI1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568A0606A31C
	for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 08:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QyUkOBI1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41B01F031E1
	for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793263976;
	bh=9gLH4+a6pMv1endj/otCM4ulkCr0wO6stpwjOWcjwYE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QyUkOBI13AnqeHLszW5lc1AgLi7a8LzgcQR+iLd+CdBJVp19DamnLD9liFg9XbYX7
	 IlZNM7oRWf+uEDJZR4ppUOwyJmNvCbzA3r0pQITqfve49AjpVr8ZY+OYPJIFNF0fBT
	 uJI7GEwqYKWC/7s7La0ORotZT33djo2M9LuP6r6ALk3klGFXmd2fhGi2jzN6/yuADs
	 6GMp/soin/PAc5zJCvX1WJEeNmvtecBsuyrma9Hc9efX2u8ZvCczeMxOnUAcQQjOai
	 7Reoov75iy1ZYNd/MicXpJg+0WmWaxUIkyjVLGTBxnmF80BZbJdYBLj84xLfRyxz9B
	 rG+FtCmXKxT4A==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c40e30c26a4so92683366b.0
        for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 01:52:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwuw9cSxLelNr9S9mV0h9CvyZMducNqSYWPxqc3NyuIPRfrASSaGV5ujABliVu9Wo12Z1Ku@lists.linux.dev
X-Gm-Message-State: AFq9FYKHW+gL+jc9Xl0jeTFsweP6UpfR+C+OVkduTyajH1PnLbv5DhX9
	bKvTBUAifD+0oppZ7rmyQ83p6BWMpVfl7bjYil62EKvyg54Pl8OHMKGr4VhOJv4fZ/FHGY2NET3
	jPdO/xPui1+XvXyHpFAlt3vdLEB01ZTg=
X-Received: by 2002:a17:907:60d3:b0:c42:fc8b:6c6a with SMTP id
 a640c23a62f3a-c49d11b4b51mr148488966b.14.1793263975482; Thu, 29 Oct 2026
 01:52:55 -0700 (PDT)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028080656.1027283-1-zenghongling@kylinos.cn> <20261028080656.1027283-2-zenghongling@kylinos.cn>
In-Reply-To: <20261028080656.1027283-2-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 29 Oct 2026 17:52:42 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_5RoJ=2FT_1JCppuSZ8Zgv5EgS9FcFm9TZsLjZvP-6CA@mail.gmail.com>
X-Gm-Features: AclHuK8lSwyP9-_9RYpa_Yb3ldfgKOHtdZkEvLNGpg35GLYZmXd7zqJnkmRcPiU
Message-ID: <CAKYAXd_5RoJ=2FT_1JCppuSZ8Zgv5EgS9FcFm9TZsLjZvP-6CA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ntfs: fix a self-deadlock on writes to non-resident
 named streams
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 5:07=E2=80=AFPM Hongling Zeng <zenghongling@kylinos=
.cn> wrote:
>
> The stream write ioctl holds the stream mapping's invalidate lock
> across ntfs_inode_attr_pwrite(), which calls
> ntfs_extend_initialized_size() for named streams, and that function
> takes the same lock again, before the check that could skip the
> extension.  A write to a non-resident named stream through
> NTFS_IOC_STREAM_WRITE deadlocks on itself.
>
> The ioctl is the only caller that reaches the named stream branch of
> ntfs_inode_attr_pwrite(), and it always holds the lock there, so
> split off __ntfs_extend_initialized_size(), which expects the caller
> to hold the invalidate lock, and call it from that branch.  The write
> and mmap paths keep taking the lock themselves.
>
> Fixes: 3f11c48d4f94 ("ntfs: add pathname access for named streams")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
