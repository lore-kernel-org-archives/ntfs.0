Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795827873;
	b=wmsc+L/EMpCQ9kV4uMS6It+KP56N7QtqiOsFNAbQuFmBRjK4Cbmyn9Ah69l11tpG/0Lp
	 e7kTrKiywgCbj/96tVor9GUmASnLVl8jB8vDZQO3RwH0uidTfeWR+/DQvSdyuVG/3wA1B
	 R9ZLbxvZyp91kGIn2FIXGqvAYPhkOzAa7AW2iv2cAFa7+56wJJ7hnl0dfKVQbLXW2LJuQ
	 u1iFGuXt1wR7kTqcUWfZQ7VeXgJYrvcfx0qPKyRQQRE28dFVk9AWZOm3iLDtftY0YbJQo
	 Q1G8g7lv7jt/f8KlBn9NcT1rUPAx2Ql9JdOumj2txtd8dP/tMGfN7mSiE3t1FGDOuUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795827873;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=AcNCtyIil+7PDZKj2GznaKRziU9lVCwka+/OixA6CLs=;
	b=zmkOyFUeFGaKJrBtkphDnXzR819ljcniXQVzFMrd6wgWVwk5OFkx/h9dgYzCBD5L8JNP
	 m0XRlwlb60aP7sklAjRy+St2uTYFxaX3cI3GRNWZdk60AzvSFYjGGgPzNCd23fh+8qE7d
	 y1qILfPreYoRmpjTp/IKpm5GzOLm2BnwWGjqT/gKvSeoNzqnGjeKtd/9j0jME7SGrScZJ
	 qLGaceGL6UTv2vZ5GRc0q7BordINCo2PD+WqJQVhcVwmkFrD0riF38nzU+5W8WimnSbyu
	 N+1LHgpTFpOodvkPshJ3IkLD600xr1JsR+267bsEvyE3JkYANGkXMaAdwAOjv6HFC7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HgM/bEnG";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1171606A31C
	for <ntfs@lists.linux.dev>; Sat, 28 Nov 2026 01:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HgM/bEnG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACA51F000C1
	for <ntfs@lists.linux.dev>; Sat, 28 Nov 2026 01:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795827873;
	bh=AcNCtyIil+7PDZKj2GznaKRziU9lVCwka+/OixA6CLs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HgM/bEnGXhcpZWw/bczAmNTXKH/oIAVpLFH25L51wNkwUXspAywokudLDLE7FpA6d
	 rqQdSoxA+0nIvzGIuBAmSbZnbUZiCT5LF0emROG1bhnWKigP7Z2hN2PYgSoTd79Cq/
	 SzJe0OQ+e77zHtFoW0B6pVOzNH0LD1vLq3/VfDVV29YEzAGmFLaicvl8GgyDz6zV6f
	 BdTl1oYzchlSNJuVN9SHqDPeZzD5QAoIgB2wpoMcnyL8hGo74oxUOyViCax62MwLfH
	 d4gjCsAIIpaYc9BCe3ka7B9P63wUI8mlEvJLrLOiiMjMqUmSBYyZIDaQcOry2mjote
	 Vg7oxmXiZUk5w==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so10535588a12.3
        for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 17:04:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF3d37xbimfQTXiLrC+KPcPv4N/sBwaRyC51Ny5YqKJPbvujj7PC5fjb8FUVakYHk1G5kKi@lists.linux.dev
X-Gm-Message-State: APuU4Z+2F+TiLWB2lq6nHmEftEGmsSUnXcHkkfl9FycHKx4BnsszCiEo
	2fgDkCGTyJBJMfZHUPSV9cuAqAUJY7/GKCzMAFdBxzDQi9ZvLOFaz9UxsnACqEIzuUM3fuKTBhK
	kHkLc61fcA4Hv4YJGtpDnYvM+x+YdFFg=
X-Received: by 2002:a05:6402:3553:b0:6bb:2049:ca92 with SMTP id
 4fb4d7f45d1cf-6bb2049ce80mr8851622a12.18.1795827871879; Fri, 27 Nov 2026
 17:04:31 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <179566442733.1993761.5390442849622005459@163.com>
In-Reply-To: <179566442733.1993761.5390442849622005459@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 28 Nov 2026 10:04:19 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_Ts=bj5SqxhfjMLLYVGgUGpoHRTDdbgWLaH6CjV-z65w@mail.gmail.com>
X-Gm-Features: Aa3M54oTFIu2Wwl6K4m4iCMKi59ejhQbKyYIjWLNgD6BSOyZblrZyH7rM8lGjFw
Message-ID: <CAKYAXd_Ts=bj5SqxhfjMLLYVGgUGpoHRTDdbgWLaH6CjV-z65w@mail.gmail.com>
Subject: Re: [PATCH] ntfs: avoid re-locking the parent for stream timestamps
To: shaos <shawnq1@163.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Fixes: 3f11c48d4f94 ("ntfs: add pathname access for named streams")
> Cc: stable@vger.kernel.org
> Signed-off-by: shaos <shawnq1@163.com>
Please use your real name.
Thanks.
