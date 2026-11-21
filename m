Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795225569;
	b=p1ZbiuDkumufMcra7CBi/OiD0Gk+OlX/Ck3jayGG2uGdh5Rm4/AQ0j2h2b16QBGM1Wuo
	 7FPiG4/U8+/8iZh9dqIPKf66E0flfUhO4pEJJtOjlHw7AAj0A73f7Y3H2ZBRkXAVIeCJV
	 IihwZBST/CC/48hSauEHsz6Jdbgh8evamYmWLfhLRAiDn/O7F+AfXUSeGui18kzCHD9/P
	 T/MBxMZUKDA35Ab+Zm14hZHPD+pbx4N4qhTXZ1YJ5kg2Kzb0WQfA8gs7M8+D9pzQoiaTk
	 lG7qbDBAvbQA+E5VOHojB4NYjrgf3L94+o55TtW5dPVA5nr6Qb6/OyXiGN0F4SUdeSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795225569;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=pXIcTl4aGxKY1y3Sv/7qakiKJPc0ii9R0dmFyBolSnA=;
	b=Ypgf6/Q0Wx/DjexaD3gwTHwCnLGOwl5xizpblpUfP5fVobxc9I3ONfzXs9sv6RJHx4yw
	 fRJHMvzXTZwMLATbzYIUPlP5lTt7l7J0hV6yyg47e7ILGsorTw09Y7p5dew6vejb0T6Po
	 ZB312v2Yh8jbaSfTfp0dHwUgiz+j7MNQLiHRPqL4zpAKXSwGEhqZAEA15tNqyw0BJ7QVg
	 PNggYvKXB1qgbcEW7ApWhTaK7xF+zd+Okllr7srD8iH9bp2Q5l8IW/+un8yBh0v8oAVxr
	 +ZfPe2PNmX/1I1lHMc8k6lgkJEunvNTeRRcKd1a98H3apIEuZaDNyDptAn65a4mTXIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aSincsPm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22785606A6B6
	for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 01:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aSincsPm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494031F000CF
	for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 01:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795225568;
	bh=pXIcTl4aGxKY1y3Sv/7qakiKJPc0ii9R0dmFyBolSnA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aSincsPms+qTVHlLXexSWGgDMf5MnjPq1famBGJqUuqRCvMCWeJq47JdrRPyTNzUE
	 ZoZ+kg+pRL3MGIJz4CI78PxnON7Yq2NfsXEv4w/6IVANtmLsrJ604v0wncaYudeFYo
	 6hhpo3Vd9Gfi+RcEORjoEzAnuIAUKjojh+lqNLV78Dh9qg7u/vGC6qC+XwJpuR+zGf
	 Nt0fdUV0vXTzgtx08MylCfiqSnfdki/71USUDLSm9sdWcsZlpxGpIaQ7CGfrQ6sltS
	 YysKxbLyuKqwOu1tIQ0bw4rTIfWlDIjJxBxRGeLwzEIGDtZZiVAWMgLAHAbB62ts96
	 xU0/VkuvcMaHA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so262943066b.2
        for <ntfs@lists.linux.dev>; Fri, 20 Nov 2026 17:46:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHRa6q/7qsdtyJvgVFj2SM0DDwWJ7ZWnP13e49stB9mTSSvV+/3qu+k1OljwViQ9dawp30m@lists.linux.dev
X-Gm-Message-State: APuU4Z+5t1ohQVRgtzUAJZ0UkcplwEz6OgsHfS1PJNWtMSq8GS3lccqT
	WFzqUCRuRaoPVxA4bxJnqLJMKd4qNbieQ9cdR1v0q6GuHtC5F9OjI1C03nM+8az/rLcJroMhIRx
	vUgokYhYREsWXGr3OudyM4hr4GFT1LZk=
X-Received: by 2002:a17:907:6ea9:b0:c46:645f:cee2 with SMTP id
 a640c23a62f3a-c513a3ab024mr492513266b.4.1795225566975; Fri, 20 Nov 2026
 17:46:06 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <VE1P190MB0877D026E2C3905F0324B46F85782@VE1P190MB0877.EURP190.PROD.OUTLOOK.COM>
 <ee94181c-784f-4f9b-8697-cca5abec6b07@163.com> <CAKYAXd8VV8hjeEqRLJ-HBDA3Dzw9bX45e6dWpie4soeZ8TBvDQ@mail.gmail.com>
 <2a3b2050-76c0-44d2-a5a4-236003247f74@163.com>
In-Reply-To: <2a3b2050-76c0-44d2-a5a4-236003247f74@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 21 Nov 2026 10:45:54 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9XO4X-A+rNsvuehhi-1gaBwvz0C+=omqFnVT_Zsm9-kg@mail.gmail.com>
X-Gm-Features: Aa3M54o5N-SYmHy7MpzLD1unR02bORgYmyLXpo_wA_f7P54pXZcJIo0YYREgCws
Message-ID: <CAKYAXd9XO4X-A+rNsvuehhi-1gaBwvz0C+=omqFnVT_Zsm9-kg@mail.gmail.com>
Subject: Re: [REGRESSION][NTFS] Linux 7.3.4 mounts 64K-cluster NTFS read-only
 after $MFTMirr record 24 mismatch
To: liubaolin <liubaolin12138@163.com>
Cc: "d3nchk@outlook.com" <d3nchk@outlook.com>, "ntfs@lists.linux.dev" <ntfs@lists.linux.dev>, 
	"hyc.lee@gmail.com" <hyc.lee@gmail.com>, "zenghongling@kylinos.cn" <zenghongling@kylinos.cn>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Hi Namjae and Hyunchul,
>     Thanks for taking a look. I sent the fix last night:
>     [PATCH v1] ntfs: limit MFT mirror comparisons to system records
>
> https://lore.kernel.org/all/20261120155021.1618964-1-liubaolin12138@163.com/
>
>     I'd appreciate your review when you have a chance.
Checked it. Thanks!
