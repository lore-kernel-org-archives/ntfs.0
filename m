Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795346344;
	b=tF3xevPjpQRoQIZ7K9CtUnegp0BJqbljZTcfOf5Upp8e3hhUi1zFPimUFm0YRahn47D6
	 Dt7TPertModIGIWL3se3JyNxGVYgVWrjBAbEYUtXVpHi6Op1zl4BajdXKpc71i0Cj+GGU
	 LTjEro/b99En9ABgEdzrSwNQiPeUOYOrYGYjwrSRUsVyiL3PLYUs/DwBs7jzr6QZ3Wb4e
	 qcGrxvJh9nxp0R/IadIzWQA5qPuaGnTDbXItZSaNIcvEgKZuWBvQGwgHQybtEnWawTwCX
	 4yb8dCnW7tokDz9He3Spiyca1jKlqIug42U3jLTS0DzO1dxO+9SzdmABcEJ9/NazMhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795346344;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hyHy++0zL/3iZJh4EWGXxPjXDqs+oXNpItpwmf74lkQ=;
	b=bxxhz8CaZ5UOO6lATq6EpawiDUGFndZHCLCYG+puBxU2LdGQJ8nhV0uPAKQUgrlkK9Jv
	 a+KmaXyf6jJ2ysOhAyarGsQ46t59MdHeo3WnG3sPwNjxhX4DBHXpz3dyYcdVQTfGqtdU2
	 5bE6+oJG3QOzYwjXL0L7glAPtKC3z2zhLbPjQKa2WBqRQUbyaJA7r2G+lzx+XSKMs6/NA
	 +MyuIST7ZX+4w8a1ioMYQLJ4+VckFcxMCqRQk6hZX08CyVxDj0L/Cbe6sjxYSehhnFlIx
	 o37TM/LdMIOLY0kmu0dvAyL5jQAypZlk8R8H9qWqmveL7922UfQTUwD/LNXcIymogWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OelbFzPT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DA3606A320
	for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 11:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OelbFzPT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C674C1F000CA
	for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 11:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795346343;
	bh=hyHy++0zL/3iZJh4EWGXxPjXDqs+oXNpItpwmf74lkQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OelbFzPTbuEPZOvFP8JotWpHR2OBndlgv47AO+EhpAp7bI+5vQXKp7APS97YXDmoC
	 9kDIkzZtFEJIYXNf8unOU8/Yr03fRVbZq3VjHC2BVWlEIA5YG1wrhZczuCfcshaj5f
	 r2a2kSIzUG4qpX4u54yzbbPUV7G/8uMattnpOJMnklFZtxTiZysgJiUHStKypoomzC
	 VZMoDCrqGhfNcIpnE6H/rupBj4DOS8+RR6ZOFALlzhSVX+XmhaFHCKvlHfMaqG/9hj
	 5dYYOg5Hk3KlG74k5yn+OSyiRqhEz/oT/LBOlZH+uI31JCPH/0B9AImpYu7mnXUK9e
	 UTbVy7pdT+56Q==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so2904648a12.0
        for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 03:19:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGfbjOn9ZWDZAGXFKz4QZ1M20c19xKVaTHBtady0nmLAxs/YI3Pcy1nz99JvvHOjAbQ8WDY@lists.linux.dev
X-Gm-Message-State: APuU4Z/mdstkWrrUiej+0DbUiqWULNsnONgUKcC0JCP6Vw2KOB1okRI9
	G9fMg6EF01nWHn8Fd+PzslUe3PSjGr91PCH1TWMFxKYwr2CZWRCClIkwZ07MEzLtfgpbXRgc7sS
	1FNkcCKpB9HIcueeUqT7JETHxYv6pRCw=
X-Received: by 2002:a05:6402:1ed6:b0:6ba:8541:e530 with SMTP id
 4fb4d7f45d1cf-6ba8541e8ccmr1801725a12.45.1795346342461; Sun, 22 Nov 2026
 03:19:02 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118090701.1858849-1-wangxuewen_ky@163.com> <20261118090701.1858849-10-wangxuewen_ky@163.com>
In-Reply-To: <20261118090701.1858849-10-wangxuewen_ky@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 22 Nov 2026 20:18:49 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9YHOVPzk771JSBfMcsva0EeHn-gmJguPQFMcCtm7QXgQ@mail.gmail.com>
X-Gm-Features: Aa3M54oYX_UHhy0oWnxJo8zFfoutjullRupWp8711P36a39MDXckKM0fkGi6Uyo
Message-ID: <CAKYAXd9YHOVPzk771JSBfMcsva0EeHn-gmJguPQFMcCtm7QXgQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/37] ntfs: serialize export parent reconstruction
To: Xuewen Wang <wangxuewen_ky@163.com>
Cc: hyc.lee@gmail.com, liubaolin12138@163.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:08=E2=80=AFPM Xuewen Wang <wangxuewen_ky@163.com>=
 wrote:
>
> From: Xuewen Wang <wangxuewen@kylinos.cn>
>
> Exportfs calls ntfs_get_parent() without holding the child's inode lock.
> FILE_NAME lookup and parent loading can therefore race with rename or
> rmdir, despite the function's existing locking comment.
>
> Hold the child's mrec_lock across the lookup and parent load. Release it
> on every error path and before d_obtain_alias().
>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
