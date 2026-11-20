Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175811;
	b=NMmMwpL18psvsleYpe1p4VTp/dqP5bDaHIFterZKVDGOUBCUayxfjNkfM83cuuFAPTHa
	 yP7G892JRG5zZTZ4yCXkYZk7opWUVjGPg9MsIcBqDaGE33jIycOtlFto3VHurVxMMe1zX
	 0ReCgTM4HYXcYtkFMKirUE/cYVTINCLHRTx/BV+Vb+t/MMHdIm45K+AeozsXn6szc+g4z
	 pdVHh2DrdS73EC790meOdaC1Xf7y02ppIp2YcZT+qixuqZVXMdlSkfGgCujX3kM+soTt+
	 C0vXnq1eA2Pln6WQGSShLr1DKSq/AxbncOQQYPmwOI62vfdWLfX9LTmG1/JQKiZhH+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175811;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aWntWikItZoiax5YFuZGg4RDFm2k6IkT2ctGq5qxDFY=;
	b=NjkDyfTN4DyMnWylkzASDfRak4fmXo33aujuCklzX7yPFXp1dwjCeFsqRDsdg5c4bRp5
	 wRrQ9XbAyim7tY37sALniCth0Oc7pAzgBROlJUcW1d2ixSLWE5ldV9sjzYX6ROke3VqVC
	 EQ0oCBQftapqSVMiaGZWATzMWPWIbTzs8hbY01a+Dt1iWAGfUyJYzHBPpeLG61KaNnfJ3
	 ZrS5q9HRL2Oq9yWyk4gEmJWbRP0+IFaeIPp7xVPQrddWN61Cih+nYnhmqA++9OkniQ7ox
	 1CXBAJ4vY+ZlE6Ph7B/MIIhQyi1bqk6pWMBoS29m+iKpPOWuVwVVM+4yXmtRXaA1oOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nkOJWF1y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DA7606A320
	for <ntfs@lists.linux.dev>; Fri, 20 Nov 2026 11:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nkOJWF1y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2188D1F000CF
	for <ntfs@lists.linux.dev>; Fri, 20 Nov 2026 11:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175811;
	bh=aWntWikItZoiax5YFuZGg4RDFm2k6IkT2ctGq5qxDFY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nkOJWF1y/Mto67qbV+wrOthRlIrHzBPCxrdX4b4CMMmfDXmripfZGfzbiUpI0OLoo
	 X2C3xp7Y2PGYuOsJWwj6v3Lw19moWs37ZYTmufjMUdpzCuRTV8XJJFpvo4yWwonY5k
	 RIwHaBqb8aQ4rO9BD6+Fx70i/Fzrxy+0yFMxn9CYkk3BiZ2q5GwRhhjgRKyiw/nxeM
	 JIVcZPYrjicHmynj0oOB/Rvz8pMLfy1tSKlOr0YQIO3K9nZYIsstmfg2xF4LH0HLG5
	 E66QhqfwvyfpqEGa7O2628xWd8FTbI1vqDlfniqErWBJbjFc4kP6Hems/T4oAJEwyH
	 W0rENIHW1tJSQ==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50dd1e2f11so134371866b.2
        for <ntfs@lists.linux.dev>; Fri, 20 Nov 2026 03:56:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGQd2kjWWBKscvvCSW29PT6xEhr+0EzyPYaHDTgXwMfx7wImBZvyAlsSPs2n1r5DjZiXGeG@lists.linux.dev
X-Gm-Message-State: APuU4Z/sAbqR8kthRr92NRJvBqPJtMmnjXZZ69eeeNFfITAZNkwwEJrt
	lBYASN+FBHI3NV//jbfzR1ufTebSjKOYQtdMkg8S/LPZHs15bIncXBgN5D15IUNMgNbgncqbDnl
	NOaO0HyufbtQ6+tYs8Fc0FnElHI/vLOA=
X-Received: by 2002:a17:906:da0b:b0:c42:2d07:4c38 with SMTP id
 a640c23a62f3a-c513a85f70amr217159366b.26.1795175809833; Fri, 20 Nov 2026
 03:56:49 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120092015.2469284-1-dand_wu@163.com>
In-Reply-To: <20261120092015.2469284-1-dand_wu@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 20 Nov 2026 20:56:36 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8F7Y3cMuhoGJJgm+8Ewo_XZ183rgXg5Vk3NQC=J0c+SA@mail.gmail.com>
X-Gm-Features: Aa3M54oQnxMJ1oWDgwk1mBOzYVu-CO7PbPdSutfa-lMkK3wVhWCxHB3qXdcTY1o
Message-ID: <CAKYAXd8F7Y3cMuhoGJJgm+8Ewo_XZ183rgXg5Vk3NQC=J0c+SA@mail.gmail.com>
Subject: Re: [PATCH v1] ntfs: use kvfree when ascending an index tree
To: Dandan Wu <dand_wu@163.com>
Cc: hyc.lee@gmail.com, liubaolin12138@163.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Dandan Wu <wudandan@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 6:20=E2=80=AFPM Dandan Wu <dand_wu@163.com> wrote:
>
> From: Dandan Wu <wudandan@kylinos.cn>
>
> ntfs_index_walk_down() allocates the index block with kvzalloc(), which
> may return vmalloc memory. When traversal ascends back to the root,
> ntfs_index_walk_up() passes that block to kfree(), which cannot free a
> vmalloc allocation.
>
> Use kvfree(), as the index context cleanup already does, to handle both
> allocation types.
>
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
