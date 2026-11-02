Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627910;
	b=aqH+ZRW3/j7U2xZyXuofAmOnYIwDGjffKexjD4mUQRGLBJeovqizh2fXDFJ3xXp7fLMt
	 AuZYpIvWiDVSW+hP2Q92inaj+NuWo0lk9D5wr/srpDPlsi3Fq+EYqvEacgwrIolu0QyfH
	 pnim/8PmYg7TP9wMWVMBMyRNy0r4sM+DbSpmrEs4Lt9zitX+EgOp48I/HEpCl3AaZyvel
	 MFAcG/p1AXgei3l1j79VQRvOTty+hDA6qVMg5a+mQOBQkj14NR38fsRNSNWtsC+FD+4gm
	 FuRnJ8+DE/lc5NOkz9/fi3+lcoollQB43BqJA1wa5TdE39wR++fGyFsgZ8marZjpfVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627910;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0B2e2A6J6CcyMvYVfZjLEsMV3nr/MkV2RVJAVx6NxkY=;
	b=tEJpKweGjQBwcY7VY1YihzBajrQhPvBY5aot5esVjdQ9fSkL0xi3WRjHcHe6XwrMpj//
	 OOSeRUU1kAGwvQz4Sa60IpLKaZbMiGR8ke6jwFRNNB9ZBE/cuWUC/9LUF1rXvXmLH8AF/
	 +Tp+FYuBmbmXkMM4wW6BMbYpRwYWlUyrkl/ALn7M/LQHccGQ+Jbri3VNbVTLbuy1awmKw
	 bqXPCfDF+TWMhafL+5e/ojXPaIpL1YNSN2ajfERohiAtAgEugmH1msP9fPcP5xqH+4grl
	 56lb7BnwDWNvq2nIp3gDlF2f/O7jfeHk+Sm0oKevfZ8nhTmBsLJDAt9lPqMpYpiaQ0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRjoxj3z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5FB606A335
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRjoxj3z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334A31F00A18
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 13:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627910;
	bh=0B2e2A6J6CcyMvYVfZjLEsMV3nr/MkV2RVJAVx6NxkY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZRjoxj3z8OYzSGULLKCmvztPh94ZYVQvWzpL5NJrmV4P3EpmRvPf9ul/oYHK4aDGn
	 rhUiIgDwEdxEsjgblJBbVEHVWhN0oVrTfRD7Hf5DGpu+nH4ScWWvfA/6V4k5iS8iHT
	 i/9mUHYRyE7VKgno/cWFqe465teGs3a6yVIgbexCcy4HaWLA7I0vViC/Tr3lTsiGZ6
	 Q8goUO78Cdw+U+q5YG1V5mlda7kFnbbnR8Gs+8McgW3+vzI53DthhtFA8Inz4/ywq+
	 /JpV8odc2EHAPu25aTikXKnnKV8fMzS7kTlKHL18BE0SOmEiPZPfMaEOE9J7Sq6zVu
	 7dnnsB7LNcSNg==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4395d31228so467969566b.1
        for <ntfs@lists.linux.dev>; Mon, 02 Nov 2026 05:58:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwUZyxSoGo3KlwGs4fYGx4ioZrLaJYljGyuc2dPdvfaehMZUZ4J6j863Jm1TRzl4MdkiW2q@lists.linux.dev
X-Gm-Message-State: AFq9FYKUPro9xpQ1kN26IZ81uNMG2QnUbCA82mTQ21hjoYJC+JNESYi5
	1mYXu9fpJ2NNrhnh4SLog/ytcMZ6pvAnlbjOFLyeqk42AJIvKU8E8F2RHvIK3O85JnULbtNI1N2
	Ce5DarCUI16DvMDMFDoN+83bGIcjNjSg=
X-Received: by 2002:a17:907:3f1b:b0:c46:5973:2a1c with SMTP id
 a640c23a62f3a-c4ca7aada3dmr812890766b.37.1793627908877; Mon, 02 Nov 2026
 05:58:28 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102093543.1199671-1-zhanxusheng1024@gmail.com>
In-Reply-To: <20261102093543.1199671-1-zhanxusheng1024@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 2 Nov 2026 22:58:16 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8fARb5Ow27WSa3wA3nEkini8j1rEYvWY2Xf+12M7x1ZA@mail.gmail.com>
X-Gm-Features: AclHuK_p0GkJn1d8FnoGiSqpwVEvXw3gnNIBGTj2sIJBhrIpyHP4RefuVBBIWF4
Message-ID: <CAKYAXd8fARb5Ow27WSa3wA3nEkini8j1rEYvWY2Xf+12M7x1ZA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: don't allow compression on volumes with clusters
 larger than 4K
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhanxusheng@xiaomi.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 6:35=E2=80=AFPM Zhan Xusheng <zhanxusheng1024@gmail.=
com> wrote:
>
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
>
> On a volume made with "mkntfs -c 8192", a user can set
> FILE_ATTR_COMPRESSED on an empty file through system.ntfs_attrib.
> Writing to the file and reading it back after dropping the page cache
> then crashes:
>
>   BUG: KASAN: slab-out-of-bounds in ntfs_read_compressed_block+0xa2c/0x20=
40
>   Read of size 8192 at addr ffff88804355a000 by task dd/106
>
> The read path only handles clusters up to 4K. It copies each cluster
> out of a single page, and a compression block of 16 8K clusters does
> not fit in the 64K ntfs_compression_buffer. Loading an inode already
> rejects compressed data on such volumes.
>
> Reject the flag change the same way.
>
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Applied it to #ntfs-next.
Thanks!
