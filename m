Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783227;
	b=Mc0JL12MfTethniR0LyeyjLXOW8y5f/SSBdr19cpC3LHDp/pruNL86AawQiv5xEmOVc1
	 DxVgwGi5n+og9j6xMLlxkIixEEBO3ChigzOiy/HJf9Ij2MylzFSCp1NpjaXUCMb9FeHF2
	 TDRX0jSxTy0rreI+/ST4ylUDlj9CIkrVGUUWISqYKIGRyTmQSHgDzbc1xTyU1NQsau8HA
	 3RrClIO8CI+FePBTKetOQISGFaPbc0YNzam8wGlyk6Gtn1E7ytKsKPEjDMNMPn9agb2ns
	 Hxaent7g7U0iqJp/zjVVfxcZueIG3cw79AzHi1gBrxHRsGRnb3x/1e35s5/nld2PEvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783227;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=eCc2qBqKGvgJdQ0+SWeePZRdJVP3CAaWU6edxwz4TQY=;
	b=NVzlUy0SrFHQon7eE4kpQF1sG8FMiSp52VfFbFZMlapxKo9cwB2/WBSNcPEhyxFQ0Cy8
	 AgKhXOVBHZM2C3OlL5seW9smuUvSItv5t0SIvgVeiJhUIhhN6eOH6M+ztz+T0ns4d/cuw
	 dcMurWEyHBCr2g8tavvIIESgiu/9mJoHJONHMT8S+m2upQgHuIF8pIvwOlYMcxpDaLnGs
	 9D2uW1TGadWtSiOQznmf7Z7InGDZggAXwYJGVHfJPwHYiQXv74pVgyXx1XSlp0bntMEzb
	 O9G0fSyPonFwm71lkyFUQp8ZmPJR7ZpszcIHibI+yynwFuwDcNpdngyLE3T0eSo2J7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SuNjJN99;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE896606A31B
	for <ntfs@lists.linux.dev>; Wed,  4 Nov 2026 09:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SuNjJN99
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634E01F00919
	for <ntfs@lists.linux.dev>; Wed,  4 Nov 2026 09:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793783226;
	bh=eCc2qBqKGvgJdQ0+SWeePZRdJVP3CAaWU6edxwz4TQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SuNjJN99NRA0UbhPNfw9qTqWb5QjOBDWr9heKrtV/dPkbwyIFeZbvRA6m9a0HSo+U
	 Y9gCVSNhZReI8fj2xXtorBkVP/um+Eb4q79dyqA6rRFrwSC6V+r8Cc2t1fxFslW1Id
	 1YBQGC8Csnta+6O5+kBVhrG5jBRaF5O9UX9z/L4YmPJ0gT71GZvKhgPton4Uw5HhbL
	 yHiyYwfSsYn/hYhHmsgj7ccxT0A1JVlxg13252CpY+708jwSXmxlHuiV/1rj9TXJ6o
	 rghwNCBz99yKGQTaYh3IPebk3HW3NWUx/UCNva5j8z6JQh3AX7HaUbIuf0kMrPJc49
	 2FdXqXra8Z9mQ==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so4976a12.3
        for <ntfs@lists.linux.dev>; Wed, 04 Nov 2026 01:07:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBymuS5wRop62W4wKBTySGKpFMBAS4zBnTgLBLdJ3/bX2yKM/FEs0ul9PV+dOTyWtKKsHZ42@lists.linux.dev
X-Gm-Message-State: APuU4Z+XDO7DuHtd+VPgJGi4NviQhtaxNX+TAVtFGXhBhYcZa74H+J0U
	VsaYVPLiUEi4KT2sTG/Wc2W9PnZRmSYnSvDUKDzsed28s8Ce0SGjO8VCV2q3gDX9fD1+MHi1CpB
	OaSECIuhJAZdXIJL6RVRVxOvx2BZzDeM=
X-Received: by 2002:a17:907:3d93:b0:c3f:c878:7c1d with SMTP id
 a640c23a62f3a-c4ca7a19decmr1442941066b.9.1793783225125; Wed, 04 Nov 2026
 01:07:05 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261031052857.1542936-1-liubaolin12138@163.com> <20261031052857.1542936-5-liubaolin12138@163.com>
In-Reply-To: <20261031052857.1542936-5-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 4 Nov 2026 18:06:52 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-ec8ve6HD5eBJik-LF4PUhZjV7y0c52E2xpALLFA=j2A@mail.gmail.com>
X-Gm-Features: AclHuK9hyX810Y3t8eLuM2Emnv78qo6s39NjYa7uDhd4dU4G_YiYuHSvlEDQHvg
Message-ID: <CAKYAXd-ec8ve6HD5eBJik-LF4PUhZjV7y0c52E2xpALLFA=j2A@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] ntfs: write unlinked file attributes before
 dropping their cache
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Xuewen Wang <wangxuewen@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

> @@ -4052,6 +4052,14 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
>
>         WARN_ON(!NInoAttr(ni));
>
> +       /*
> +        * Attribute inodes of an unlinked file have no links either and are
> +        * evicted at the final iput(). Do not leave their data in dirty pages
> +        * that eviction would discard while the base file is still open.
> +        */
> +       if (!VFS_I(base_ni)->i_nlink && !ntfs_inode_is_named_stream(ni))
> +               sync = true;
This misses data dirtied by ntfs_attr_make_non_resident(). For
example, with 1 KiB MFT records, create an O_TMPFILE, nearly fill
its MFT record with a resident EA, then write 4 KiB to the file.
Growing $DATA can force ntfs_resident_attr_resize() to convert
SECURITY_DESCRIPTOR to nonresident form to make room. the conversion
only dirties the folio. With patch 5, the subsequent
iput(tvi) can evict the zero-link attribute inode and discard the SD
contents before writeback. If the file is later linked with linkat(),
it can retain invalid SD data after close. Please also ensure that the
converted data is written back before dropping the last
attribute-inode reference.

Thanks!
