Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270176;
	b=iyShMjP8jkcqukK1Dq1VkgYF03XYv4ID4X4zDaK5/R48z5PNJ7gweJyMsrCKxelhmhsF
	 NQ06bwdpTNjaM0TU4B03ee2qHS7asUDBJgUvjfxUxY3vhymju34vkVFGW4cBs7HWMEBT9
	 QtKjIzbxRwO6HJ5AVngMwqFnzFUozOwRbnxKZBo60fL63xv3A5WAdg/GVrZTt4kt9F/RZ
	 wAUnYgYP/CLqH7Mpn28iYTrKR5HXpXpfRe5MipPBbvKapXFLJCRyZHGhT+hH8mfSmVrw7
	 0AZttuH+mxDZCTfsGLI4OUS/lgptOHdza9jq0MBMVai9XWjEsCCLIefzvlJS9Bzj53g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270176;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xn+NzOAI51seqA5M9eZgYuYtYyEXJedApRaY9hQ4Hxo=;
	b=YBnZvtYOslXl5aK7Yu839HdWZkBb9VHqYIMWu34iODZTiHPFi7uYoTpUQ2BHosQjg66N
	 Mnzci2KR1Wu4JJHHN4m6WeanYlxpNPN97WpA3VyLELoU+Dlwrl3RZpsiNPGFl0PqnRyaN
	 HKwyodsSTHjvCUVtNwdTfsPrfnSckwW5AU5S0mrc/GopwPwoVcLA0ESlrNpTJfZg1QRPU
	 kU51t4Djo88PKZySG52hBfMGn2ECn1g7FKBwKdKV2zQiQFNCBXRrR9d08k2vjVz6mVM0r
	 Y/8ZXm3RVS2yPx5qpu7UAbX8OmYlfeDiII6UIv74cJHsWhTa0OnN8uZlhyHiJmhXZvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gz0WixZ1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5E3606A32C
	for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gz0WixZ1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38551F000C0
	for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 14:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795270175;
	bh=xn+NzOAI51seqA5M9eZgYuYtYyEXJedApRaY9hQ4Hxo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Gz0WixZ11SWNLOMtkFXq+S7pUzvFK/qiGZEUPOPIdd2ZPKivdszZUHFr9kuH3zOIo
	 NnjNd5gOmVsQZpT9rJJzgPkbYRbUzRM3NY+bBBjAXpyoNN/OM/Int02IlTwn06dCpr
	 hN3uk65eJcshfIUhHwHtHsm+6Mcdg7HnOjTyVUmaAF8pwy0M6ebRH48J9ng0WtlPZK
	 v3MOXDPZCQCgQZyapLMwiWoNSnrBtllIXXB/FgXRruhLlZNGuI/HnfSO/7w90g8KTC
	 L4r44Y6diMApehoKHDnK1hNMFs2EYz195D2rrI0gfylFabi1uT3Ekh4DNYGhYpPx+u
	 ymVA9+2rE9c/w==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so2119806a12.0
        for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 06:09:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE3tMMvAnW61JwZz8EksyJCUyyaV1IwIW0A13KBbBJ2j2l39jW7Y8MghA7U6d7AujSQwPtE@lists.linux.dev
X-Gm-Message-State: APuU4Z802nPB8YCTxl1XVLz24vZbXSEZDyFVRQcWgJNLCFrdSTPPMkHJ
	GsZXY1cZi5h8aayNC1ZwBZ6tOwqXvxcLsHu/t28jP+5Aod4VKFWQ5jC5xQOJN1vUGkbOuW4wqgV
	EXy/aZOFWWfO0nG1Wg6iMovLRuT2bRso=
X-Received: by 2002:a05:6402:a594:20b0:6b1:c7d9:b631 with SMTP id
 4fb4d7f45d1cf-6ba37e75977mr3576112a12.23.1795270174408; Sat, 21 Nov 2026
 06:09:34 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118090701.1858849-1-wangxuewen_ky@163.com> <20261118090701.1858849-9-wangxuewen_ky@163.com>
In-Reply-To: <20261118090701.1858849-9-wangxuewen_ky@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 21 Nov 2026 23:09:22 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9Yqdycqht1hCCMqZ_TtkeTGSy8LGYKMpny6j0=712OBA@mail.gmail.com>
X-Gm-Features: Aa3M54pKzxUEDqWg31mFRVxfq_Xa_AjzTScws0XhhLNUiWZrGBxpxPPrJwyw6tw
Message-ID: <CAKYAXd9Yqdycqht1hCCMqZ_TtkeTGSy8LGYKMpny6j0=712OBA@mail.gmail.com>
Subject: Re: [PATCH v6 08/37] ntfs: preserve buffered fallback writeback errors
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
> The buffered fallback of a direct write waits for writeback before
> invalidating the written pages. It replaces any writeback failure with EI=
O,
> discarding more specific errors such as ENOMEM.
>
> Return the error from filemap_write_and_wait_range() through the existing
> cleanup path.
>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
