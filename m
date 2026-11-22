Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795344517;
	b=SVLpeNVQjW5hE9mt0enjrwPqrncAJ/r7YHz0njRG0wTs3zaaeZgc8vIz/Lb/2igR0szt
	 HfBTcXv27pRROc/qfaZK2pVXhTAik5xgjXz4wLxnquHz/11JPsYw3gmJQ7aVSJRIQzIMd
	 5KKbTM/aO8hcHVuQcoPDqn7kR95I5LItr6SFHk9668H3PYG7TJqMk9PCRMF3JzhKgehFZ
	 eqge66JNeqmQb0w1JxA3AF2vwiys8yn2paXHPv0N7gtM+l1guA1RJaK8VVsuh4xizF37m
	 H/MVMn/U7zS6hNc5OKT7ZwxxQv9hg5wKZ0vBkpuLws4Uaruj0/bRNTvGa59K2p5mkGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795344517;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3xwoGgBBU6yR/sgCOpMUSAnG5r+ndUZpjhA/RehvqNo=;
	b=ieA5e5Ho7rKpKYI03GQ4CaGbX+bImTMpgsCsiF9bgDwyywpK6uTh7zAt2jbLSxPp1w6q
	 Xxv9JoojJTluqgkavufsBr7NtQ2knYsdkPXPrwbRAl1U7HWVcw+TSAYKYwYN5jia4MAZ3
	 CzNIe9WCfHht5G3SMkQkV2O4NTId9Q0agKnGZ/vAPxBoiLUMcCnTjRH28aO3+aOJH5wuF
	 OImnzoFLzzxN6gYO4QsoHjPlxYqVdHweyq4W78tJEQ7oWGxj0gf123CKkMwdya1aN85kI
	 vLE+hAQZG3zZl/Ujq9bBYau97x8s+hw1eB6zL2Bq3D9aSB4F4UDXnUjchaLlxSaUCwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6g2SAjG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B06606A320
	for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 10:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6g2SAjG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07C21F000D1
	for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795344516;
	bh=3xwoGgBBU6yR/sgCOpMUSAnG5r+ndUZpjhA/RehvqNo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P6g2SAjGXeYgYUX2hjuzvNJ9F5p0FOIXMM/ZEarehiOucAvZLEStqz49NhGb4Hm7Y
	 b55I/vGcAZbHVJnvWj30p46c2BpddVTtflklqDA7GrTN152S3SHcxu0yGulRhQfLAA
	 0RRhOUyvEE+1NxXgPyQAB3s5i3sRUxlHy0XL79gQnlk9dFI879fMv4atEbngOD/wtd
	 bPsrHyXSrD/4bokyDyGJkqk2RkTocdIp6lU6s/YbutrD36SGWO7Up3ZntPeBDH1wxr
	 F3Y8EbbPGWz2Ji2nAbf8iZr+nl97kQu3YOvMQZTvYJXlGVNhDIMjuIsOpp0UTK9cfU
	 CrlNT012UkDbQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6baa6f27904so167429a12.0
        for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 02:48:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGIVw/Ie+Aa8UIPs94u1iF4eC+VdnAJ4sIrYn+QWAOM2PAwhFFjSREGdrl1dWWHnuNOoXOk@lists.linux.dev
X-Gm-Message-State: APuU4Z9dcj8eBzz57yBkgpmE+Yw6q3aYRFRbuduQ/6S7dIBucqYroTYi
	SQkPqRKMVHYxCG1e86maWu7hRiKhdBxV9/5Lh7WJmNL8gRXoDPfinjQdQ1r6EOeKl+4IUcTmCtJ
	lDVf6cOO3thwwbPZbVxHPIRCiSCZcoWU=
X-Received: by 2002:a05:6402:3514:b0:6ba:144f:ae3b with SMTP id
 4fb4d7f45d1cf-6ba37c76a3amr6162923a12.4.1795344515503; Sun, 22 Nov 2026
 02:48:35 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115132609.209957-1-liubaolin12138@163.com> <20261115132609.209957-5-liubaolin12138@163.com>
In-Reply-To: <20261115132609.209957-5-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 22 Nov 2026 19:48:22 +0900
X-Gmail-Original-Message-ID: <CAKYAXd965H1n0qTsStX9z=JDK2cNJs5OX2T2eHq9=_EHTqX2Jg@mail.gmail.com>
X-Gm-Features: Aa3M54oU2r9EtNhaewOhR1YZm7SHWkPsgSNOHQXITu7MijHt6dFhD244mtn7s8Q
Message-ID: <CAKYAXd965H1n0qTsStX9z=JDK2cNJs5OX2T2eHq9=_EHTqX2Jg@mail.gmail.com>
Subject: Re: [PATCH v4 04/12] ntfs: remove remaining attribute lists on
 creation failure
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Xuewen Wang <wangxuewen@kylinos.cn>, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:26=E2=80=AFPM Baolin Liu <liubaolin12138@163.com=
> wrote:
>
> From: Xuewen Wang <wangxuewen@kylinos.cn>
>
> Creation rollback can leave an ATTRIBUTE_LIST inode cached after freeing
> the base and extent MFT records. MFT reuse can find that stale inode;
> dropping it under another inode's record lock can trigger a lockdep
> warning.
>
> Remove any remaining ATTRIBUTE_LIST before freeing extent records to
> release its storage and invalidate the cached inode. Drop the returned
> reference after releasing the record locks.
>
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
Applied it to #ntfs-next.
Thanks.
