Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795344496;
	b=ncV4yM5O3C5TvlsA8AkHJBKCDxZQX0g39rPMXUtIbeng0df7FjdhcivJMxXDF62PHRvk
	 uTW8uChnyREL5gOIZqO5mBR8ZgnqpZTZuBhTBk70lFJkrChLYaC14J9G74FwQnviP3xBR
	 bntuhAQCumzMgc9suETr1565a9WsS9gSpKfSfDlRRwwfFrlrgHYQiWCWMGWDJL2sfxrHI
	 1KlD2WGynyTP17gyzq0GBUyELLhPMhCEAR2AjKrRzQMoBo6muEkamlWBI/Xf58ftvGZwe
	 rhIGLJqb0XeghyvJ1WMJJU8uq0/3Annn9v5J9SKLJAkaPDzegkFLcJ4HHp4v7h74UGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795344496;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wrBHMPssuDFbJ0ygZXLqCK7GMSoJfXh0zKZ4j6u8ldQ=;
	b=V6X2HjxnGjHNox6n8b/4cNqqFjgx3Bs7aQr1PanvSvx5j6d8Okvv1/r1tKVdr/DIJo9I
	 WiTAXuSGRVy/1ZT/mg9pFGZwPK2Jfq8Mu8OMittSVuy2qbp08X8tjQKI0q9IXbP9clT+G
	 7GU9K+E9z/MkB/lqUzaAx4QfRdlwkxPmZ7NlyeXQ3VJPaFLTFlM0ZZg3Y8xyMtzLM2/4s
	 Eaq3HhPTH/aZRSSeqDT1y2tsUhVgrNQL3dChqkh3ryoH3xQwMk0iL3o2KQgooOOe/NQab
	 zJOxdYx9i9XOXkoHMrx7KgDgKmAg9h8FsuVFCAAh6Au5i8ATiuBUHyqqMnwSgELjSZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aHafh1WN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60F4606A320
	for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aHafh1WN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC411F000CA
	for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 10:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795344496;
	bh=wrBHMPssuDFbJ0ygZXLqCK7GMSoJfXh0zKZ4j6u8ldQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aHafh1WNZq5PluviVv8Jc8bRUZAqsEy9z1WecXyLpIEwekvxOoCgkvN1HAC+FX2r/
	 dSwztG1IHw+UsIKsqWbi0GJTDbrOYRE8EIpfdjO9zkj4LCFxzj5/ak7fo+HJTz4V4c
	 xrePvgRtOBJ0mUbYo0bkPBH7Fqh9gAJupzznZAi/RHIfIEtZBb3wAYEjfVg/mnUIZd
	 ekGHB8m4bXUJmIv03Yh118ljtPTXhdXoiYsGbHviWJb/ceNWZPViyTLwJnserFb66z
	 5DvVwKRTNkumnZA2AQRNkE5Dn0KTms2vmOd1AhV8TDHTF7BBAE4aosB5ziZtWdfj1W
	 hulezqCV6X44A==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c506a231b88so332581366b.3
        for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 02:48:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErElBOafM6+EF4qOkdoCX6NHSlJYnreg/EVtqpzm0g2rATyA6JQZvuQi9+9PtuYjGy1+N7nK@lists.linux.dev
X-Gm-Message-State: APuU4Z/y4pYR89KLcW9MKApK4A4XiUNIlIrVDVF+iqnuDUjYxim898xK
	QMofz9rEcPpOhyl0INx8p5M8Hf/sWUOe9z8rOlCK8aQTr2OeWA7BHFIPhNDkBQHciCblvplNSGb
	d7L7jVM02Eehr5HhVJ44xZXvDqcewJu8=
X-Received: by 2002:a17:907:fd15:b0:c40:33d:f06f with SMTP id
 a640c23a62f3a-c513aaad90bmr710965866b.39.1795344495083; Sun, 22 Nov 2026
 02:48:15 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118090701.1858849-1-wangxuewen_ky@163.com> <20261118090701.1858849-3-wangxuewen_ky@163.com>
In-Reply-To: <20261118090701.1858849-3-wangxuewen_ky@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 22 Nov 2026 19:48:02 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9QOQ9w-v4btiwGrPg62RExoTqfKPK+fX8GNy-dbcRx7A@mail.gmail.com>
X-Gm-Features: Aa3M54rAQpooweqJMeCitGw6rjZrbD3QOKXH8V86NBmJgwh0shSXGyr9YoZlsOw
Message-ID: <CAKYAXd9QOQ9w-v4btiwGrPg62RExoTqfKPK+fX8GNy-dbcRx7A@mail.gmail.com>
Subject: Re: [PATCH v6 02/37] ntfs: preserve cluster-free counts in attribute cleanup
To: Xuewen Wang <wangxuewen_ky@163.com>
Cc: hyc.lee@gmail.com, liubaolin12138@163.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:07=E2=80=AFPM Xuewen Wang <wangxuewen_ky@163.com>=
 wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> ntfs_cluster_free() returns a signed 64-bit cluster count on success,
> not an integer status. Several attribute cleanup paths truncate that
> count or treat a positive count as an error. ntfs_attr_rm() can even
> return the count to callers that expect zero on success.
>
> Store the result in s64 variables, test negative results for failure,
> and compare the full count when validating an allocation rollback.
> Return zero from ntfs_attr_rm() after successful removal. This keeps
> successful deallocation from being misclassified by later reporting.
>
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Applied it to #ntfs-next.
Thanks.
