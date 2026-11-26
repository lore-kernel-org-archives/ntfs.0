Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669760;
	b=Db3GGlgOGM1WEDqqvnf0MK0NuMtuPy0W4kVpvej4ZSZT1WCgCdDvW+E9wtwFcX4PMRV0
	 bZtKRloF0PS59lLhhEgk7CNKCLcntnDWk2klemfrcHbwmpTCsLiimh6eD9cGcan32P6r7
	 ROFhHslBFvzmldfIsLRkS2jd+vjqIGTRdteCfjXPbpYzfYZgC1VSYpPUO6kQ1TletW3yV
	 F3S+f3Dp8hL0+/FCakJA7DqznMqyz9brPM8pP11d97mOkiziI/UvqX9/AnPMNDt/62sGO
	 rKzivHvB+AY58En9w85Jldl5xNebHTarnhzWGYA73EnuVBx48NfzK081xh9HCbZOIXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669760;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S1HSSshjmPkqz79dXnEgGWEjXTt5qVtgnEZaDetyRsA=;
	b=WFaTeN39mMhkzuZ4OVOL1pGzDQmq5TNg3+nUu56wzc5G/Dk+f5y5SWENxgrhIieBX1go
	 jEmeGK5+cqUrcyE/mNlyC81iAiS8HdXNoJCFmrdzZGerKp3wtevzw5elp2+SCk+r0E7JM
	 d2tvEXWyf0/2TlVHctbyYUAIMAVVvzK5KkjU7WQiR/p3iv2jxtI8buAch0SYlt3DzmCyH
	 L3K89AyWI+4PbpTzcC/QZH7GHFCi5MAHoMDKtc6xGUyufwFUhjJ+swrKKNXmJikqRz/ud
	 sXiTMeUXW0DAs/wsqOUjNbXMKCsbhaRniPx8BS29baKQWzFB9ucA8X67KGCJIYMdD3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bb+z+LpN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6057A606A321
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 05:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bb+z+LpN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FC31F000E1
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 05:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795669760;
	bh=S1HSSshjmPkqz79dXnEgGWEjXTt5qVtgnEZaDetyRsA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Bb+z+LpN1m27T8MR72joD+HGa4Q+jBUOTHmH8z0FiHZ2plcdtAvq4oDaYD48fyriM
	 W0XttaR9sDljd8yEXHQZzL8apNhfitdq0KBIwa8pjDHxRDKAZ3RKKvdFJwCyGHaXl+
	 q+6YgtTP97rG+8sNHZC+LxJmvOoRIO17kTl6jCntTS4ONfAAYkWmbMrXQO/Mn7HUVu
	 YbHCW8mtPleTNktXBiM+sNmyiPEOM863HMrO3QMZQFNgP/Yo/XyXorFk5oqd3I4cIJ
	 tCmB07tTJV/SSfVA5MxWD1QrrwGyGp4fZmu9HFTpeH3jAhd7MAOz6gD8O3dkQtKNcs
	 UX+eL2XJzd7zg==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d581da0aaso914630466b.2
        for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 21:09:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHVusViUApNbNtXeZCDZGcLCcWh5aSLRCZ0d+lzB6RwYJWdsqs1eQ51+JrprmhTwElTTZC7@lists.linux.dev
X-Gm-Message-State: APuU4Z8gQoNfMLHVpI6EiKGVeNV41EMiH0S3hTL3uuYyvw3qM0n5vy/Y
	LC8GJwRfBUa3+VAyHLVMrkq+es1g5vm+j6eT//EslxRH2kj0/dw4hvD9s9iNKdH4H8c5g0PvIpZ
	zjXy3rl+NaXIzSWkD6A8jx3tyRkXXzJ0=
X-Received: by 2002:a17:907:96a0:b0:c51:3cf8:7d07 with SMTP id
 a640c23a62f3a-c513cf87f18mr1544835066b.29.1795669758768; Wed, 25 Nov 2026
 21:09:18 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <179558384099.146091.12975349907127521352@163.com> <20261125085004.1816027-1-shawnq1@163.com>
In-Reply-To: <20261125085004.1816027-1-shawnq1@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 26 Nov 2026 14:09:06 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_6+H28_KNgw3c1P3GL+OnsGuKhSidLQkcrsqFA17cxxA@mail.gmail.com>
X-Gm-Features: Aa3M54q9iicmQhqC8G7jUu05Bg8W7c8Nzhmo24E5ctERleic9K339gXMJgXzZTw
Message-ID: <CAKYAXd_6+H28_KNgw3c1P3GL+OnsGuKhSidLQkcrsqFA17cxxA@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: guard the final LZNT1 sub-block header read
To: shaos <shawnq1@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 5:50=E2=80=AFPM shaos <shawnq1@163.com> wrote:
>
> The legacy NTFS LZNT1 decompressor reads a 16-bit sub-block header
> before checking that the full header remains in the compression
> buffer. If only one byte remains, the read crosses the end of the
> 64 KiB buffer.
>
> Return -EOVERFLOW for an incomplete header while preserving successful
> termination when the buffer is exactly exhausted. Validate phrase-token
> length against the sub-block boundary before reading it.
>
> Tested on x86-64 with QEMU. The original header-boundary reproducer
> and a phrase-token boundary reproducer no longer fault; both malformed
> streams are rejected with -EOVERFLOW. The one-byte control still
> returns byte 'A'.
>
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
> Signed-off-by: shaos <shawnq1@163.com>
Please tell me your real name so I can use it in the Signed-off-by line.
Thanks.
