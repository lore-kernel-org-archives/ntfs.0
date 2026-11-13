Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794534486;
	b=xxUX30efSQsiZ8gKMqvCaU/wLgZL/aR8/tweAAlijyUdlUKTQm7NfUNtMJ8xhzPCXoGq
	 6p0QzuWE5XBuxx6s589A/l+YFYmVnFq9cLCKa0Nef/jme3ktZOfCZdeg6dN9TlY0G/Ghd
	 vjs0ODw5ANX2YszNtdpvbFOdgSLan4Ks53Ahc/kkPmXRqu+RF1krEdBTT4nMNBCxljr1w
	 aDWntju8tWI8F6sbmozvJH3YDfcDEwLPZPoXXIFKDFK/T1Y1tz5FNtZcedQn2C5snYMrG
	 2TV7jIxYLwzYiXVhAGIqlXpi/7ud7gYg2VA9HTygZQgCRdQIOo+ZpNdV7keA2m32wTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794534486;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kIHGiaaw+w7x9/tbZ/OjYKBZiL9aSPInsuX+o8D0KRs=;
	b=Sy8IpgU6DAVpUIBsCIkfy5dq2KfDr6kr9wZzsp11pJ5qeLTVAbBLYE0yO5ou89UfRv++
	 /HGWI2CFcFTgpVTpqo9q2k+ROfRw3vTTNmXWXT8zumoLhpj7Sgyh8rPMH8q9oVFqXnBb4
	 iOv7dURT0MdrT1eVe07CBFgjeS+1JX7tkrBQxCbZdpj6SuFbaUYTQvksuaTnjAE6NDeWQ
	 S8WfwZk8hlSGmkS3tl3Y6CVy6OJglnK6g0hBzoOR6En5kti7vk7uihJvLSabfWpZbAqRI
	 bL1Jn6BNa/VVEcQeMowyv2JK3FnVvzbYkqQNT2V2mLByuCW0vBCXbdf/WPSya0XaT8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kSmoaRvk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3112E606A323
	for <ntfs@lists.linux.dev>; Fri, 13 Nov 2026 01:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kSmoaRvk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC1B1F000C4
	for <ntfs@lists.linux.dev>; Fri, 13 Nov 2026 01:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794534485;
	bh=kIHGiaaw+w7x9/tbZ/OjYKBZiL9aSPInsuX+o8D0KRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kSmoaRvkLtnxeuqOIgX0/NZr6A8vYVT3LeeWkXHMri/grQOq7XOif4u7jGWFJ6ywl
	 u4O/GTEB9oL+ukMo13pSEMYUamyAA/ueUbH0zPN+ReMqmdG6rgQiWJBjcqAK8VptyM
	 BmjCeFSfnW/0Pc9v5t4C3E6C9yKr2WV8gV1fJqiZam9ZZjnNLEWSKTNuHN6NhS0d0L
	 8z3nEgIG8Srvki9aRGYgSLlsZZ/lI57w5uI2d/A2Wgla5a7UaFAKgmRIeswLfHsfK5
	 TdyDOv0u277WZso8V83m7uqd4w0gd8j7G1THIwOFmuI7KhRCOSMlHmtSt8rXMqAn3O
	 4BOIVS1wqC4xA==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50933bdf4bso62278466b.1
        for <ntfs@lists.linux.dev>; Thu, 12 Nov 2026 17:48:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEzcsmFQzfgX9PQTsRW6xna1ZsLYlMNpmiTSV/3eb1PA4ZqLBa6DenmK+t2S+blsxnqe9k1@lists.linux.dev
X-Gm-Message-State: APuU4Z+hH8wWkKEMzFnx7kBPMkNtOPzbN1H9iPFjt3egy8QFZ7lsZ8XV
	2aIhAF95O9kXqx5bTJopxJ167ZFD2SoKbl7eNARjGzA5oAFqO2jZw4gbWm3Q7oQiyETA7Y/T3n8
	rCBfl7B2STV2nHUPG29JuOTUCb7uu7gQ=
X-Received: by 2002:a17:907:72cb:b0:c42:fc8b:6c6a with SMTP id
 a640c23a62f3a-c50963841e5mr68070266b.14.1794534484673; Thu, 12 Nov 2026
 17:48:04 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAKYAXd-n+zGBq4i7rfLyX+_Y6zEMLTCCqb2vAgcnmavqKxtiHA@mail.gmail.com>
 <20261112074055.1876311-1-wahidzk0091@gmail.com>
In-Reply-To: <20261112074055.1876311-1-wahidzk0091@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 13 Nov 2026 10:47:52 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8YHe4AcSM3Ch+8PseXAXxqzLvB_njNgqGCUuyVe4prOw@mail.gmail.com>
X-Gm-Features: AclHuK9nAzXNzVpFrAKkcdAMUN1l4AwVNbPKXYvvHImRlz9ZPtI6TOIlea6DG_A
Message-ID: <CAKYAXd8YHe4AcSM3Ch+8PseXAXxqzLvB_njNgqGCUuyVe4prOw@mail.gmail.com>
Subject: Re: [PATCH v8] ntfs: convert a named $DATA stream safely when making
 room in a record
To: Wahid Khan <wahidzk0091@gmail.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:41=E2=80=AFPM Wahid Khan <wahidzk0091@gmail.com> =
wrote:
>
> Hi Namjae,
>
> -EAGAIN must not leave ntfs_resident_attr_resize(). The callers return
> it as is, so a normal blocking write() or setxattr() would get EAGAIN
> for a "would block" that never was, and index.c already uses -EAGAIN
> internally as its "redo the insert" code (ntfs_ib_insert() ->
> resplit), so a stray one from ntfs_attr_truncate() could be taken for
> that.
>
> -ENOSPC is what this function already returns when the attribute does
> not fit and cannot be made non-resident, so callers already pass it up
> as a normal error.
> It is not exactly true here, it is a short lived "busy" and not a full
> record, but there is no way to wait for folio 0 at that point without
> the deadlock (the reader holds it and waits for mrec_lock), and no
> errno fits better. I can use -EBUSY or add a comment saying so if you
> prefer.
Okay, please use it here.
Thanks.
