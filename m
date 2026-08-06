Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F1A32AABA
	for <ntfs@lists.linux.dev>; Thu,  6 Aug 2026 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022238; cv=none; b=BXjKy9HZSZMMIMo+W4xk/Vn7CQOGKnHCX6fu2ckGYL53awqDHrfvUr/ROlY5hu9U5y8yM4TAiZzj91f00kuXCaihq2s8U5bdlBJO7DxmQvZJHX7/+6F4h5l6jJwqUda981BnggbCD3yn6SzFgiqR2fAMU0MO2en2NvVB3TPoFBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022238; c=relaxed/simple;
	bh=GupLksirK7Qy6q3M/0V2W/2Pkw9ax8e3PR7aLOSID7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pL2C/BqM92P5jF6r5NLq9mQADmq/mK2iC6i5yxD1tebACberBKQrHgXzb+ZvroKgyBxMnIY+Yd1ndbtxewWScW0osqsmhqhIIqwpNm+DxZ7SSrcmyS9xM1ZDs7+bBJoVqMDQ63NUAqzJyNfNqqkaDaXQWaNr0VWQGgRqOckKosI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBrBL/CQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBrBL/CQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999221F00A3D
	for <ntfs@lists.linux.dev>; Thu,  6 Aug 2026 13:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786022235;
	bh=suc9VIClv9utsSrdXKm36L4Vkmn/HQyr5waQoWGQwcM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EBrBL/CQShv2hMiSBVccxUEvkyNqFRFoUr13dI+uFXweZK0ecPMfal14GbBJ6ffns
	 3KYjwvCOwzg1XCBXQxqbh0HvJ4D/928kHMsfMHIXMmV/qeI6jx9C5aqQst0mu9gKRP
	 FwTXeFhifeki0Z5hFxmNODbbqOhQVo9R+uMw+T7LfU4ZKSBkzevtgxiGorXEEgww2Q
	 yEKHMOrpzv6ai/t3ijD5XW/mdZJMulo2+Ivr+9o8P6plTo4+xZLXvCLwrEaOEt/p//
	 BePsGp+ByYcRfuQzlJERFMqsqhF2bAPA8yjjEsM5nswsTfQRqg44HJj5lAJjWLegTo
	 ipqQxLk+I4vXg==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2055573c8cso176596866b.3
        for <ntfs@lists.linux.dev>; Thu, 06 Aug 2026 06:17:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq5ZBl98n/8DVMFnQ18Ilu5hBkm/W6R6wa5ntobLpTlXDibwzSsX3fPiIMI0P4mZsCPjeQE@lists.linux.dev
X-Gm-Message-State: AOJu0YwDTCnvvr4n222jCmPa1fL7SrdXwXvdaD4sYNHpd8P2Z9sJA1TG
	ngXWb7sL9rPN7Qx8k4k8NZbP8zSAf/wJ4Chu9n7iQtLagqFub7go2qI1KMnBWs2xqveynXYs8m2
	P7RiLfUtukWG0mr0q4lgQW1Dqxw8/GSg=
X-Received: by 2002:a17:907:809:b0:c12:4647:a629 with SMTP id
 a640c23a62f3a-c2039cb38acmr676084266b.25.1786022234242; Thu, 06 Aug 2026
 06:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806055713.42067-1-zenghongling@kylinos.cn>
In-Reply-To: <20260806055713.42067-1-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 6 Aug 2026 22:17:02 +0900
X-Gmail-Original-Message-ID: <CAKYAXd91TzMghrpOG4pBYr-9UBY9qJ6by=mrkS0m4BxMZEbrHg@mail.gmail.com>
X-Gm-Features: AUfX_mztcv2mffPRTVCk5jxOPDz8dihUTUKIkSRXjYZc8ICGwTxmrUqGuVB7OtU
Message-ID: <CAKYAXd91TzMghrpOG4pBYr-9UBY9qJ6by=mrkS0m4BxMZEbrHg@mail.gmail.com>
Subject: Re: [PATCH v3] ntfs: validate non-resident attribute offsets
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, alexandro.calo@nozominetworks.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +       /* Ensure there's room for the compressed_size field if needed. */
> +       if (!(a->flags & ATTR_IS_SPARSE) &&
> +           !(a->flags & ATTR_IS_COMPRESSED) &&
> +           attr_len - mp_offset < sizeof(a->data.non_resident.compressed_size))
> +               return false;
Sorry for the confusion. I rechecked the code and realized that
ATTR_COMPRESSION_MASK is correct here. It covers the entire
compression field, while ATTR_IS_COMPRESSED checks only the 0x0001
bit. Since this validation checks whether the attribute layout
includes compressed_size, it should use the mask, consistent with the
existing min_len check.  So I have applied the previously attached
patch.

Thanks!
