Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478074;
	b=aW7jQpo+trRelT1aw84JWc107TSlDWr16ui5NKn3a4Fa+Z9/bmeDtH/oUVHN/lvM47UA
	 p8IHdWEr5Wl6Ssh+KAdcHwx27rAhOE3P74PyQDfa9tcW+2vlYqGiwL8cqdbYk1921xoY7
	 hEjc1wj9oJupR+iK7pywbHlHsU+fYHHKwojV47ymgNV25vwjzRpmayqWfUOx2Mw45ZVfz
	 3zB4S2LV2Z1+7ZhQ5EOnobFiUN6LspbGwAiIGIYNx1Ygw014SsxTpW/RBEwO9v13eoCZt
	 Xp6v3+FtRGKyP6mLJKwxLvsoa4vY4HRqBX+keC/U3URJFIJuvml/PzTRQz0E2P+D5KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478074;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/JZE+jNohkInERFx58saqI79Ie1dOM5maHUUrsyW+WI=;
	b=ydYhNl8zBJbIdvTDSWON02Zmf6jfoQvcWLG6vcAkwbJt43fRzQXWPAXCtgmNuVSOw4Oq
	 2jJDvC2Ok0of38u+WVGVTk4oRO1qflvYXgZdaa1SYjyCBgUth0NIQT5Xe082Ol9zCYY/+
	 r0Vn/QGTLsHUw7QOrr8KmQa3e3kFggFRoYVupXMUX9qWPovaN6njYBuiJUcNlO5SHimMR
	 M1Jhy7TegCQ8x2xvVvr7FrDohTJxBLDK3cg/W8SSZTriBsMDgaybAb7Uu34s58P448Rol
	 jBWyA8mfuNK8s4SFyqYnV6Cc38xJIRtibInaKcQlchX+r4j4ALCYiVE0zV/L1QWP21g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ikS5wAMB;
	arc=none smtp.remote-ip=79.135.106.102
Received: from mail-106102.protonmail.ch (mail-106102.protonmail.ch [79.135.106.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D58606A31E
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 23:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D58606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ikS5wAMB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795478070; x=1795737270;
	bh=/JZE+jNohkInERFx58saqI79Ie1dOM5maHUUrsyW+WI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ikS5wAMBYG05Ly+fA4oxjJY3xo3wToFQ3+IvH7hIE6+5VjgRqkfycKcEAgXPdcJDa
	 QGf87gv4tyP7v/HYG8LpHsoucO+gYf93EsRr5FXCh6EY9rsUJ2BVi4fic2bSHUB2FW
	 HHJCeFS6XRYXZn71iROwfjlTIlHuVHjINiGgxrvhy34ZEMEwC/bfOUaYRamivurRUt
	 xiof8Sg1og2bdycuHLuC1//zR4cuk6un6rI+LmBWUgjtcffFf54mgg6gEQSHOcYkcU
	 hEYkatJ5XYdoAUyZ2fhODQkWbBjwhPqy/0KkotiWE4fBS3/HrykczL1d+LP7NwPnAe
	 2AGkLmjAbW8fA==
Date: Mon, 23 Nov 2026 23:54:23 +0000
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
From: Ernest Borowski <ernest.borowski.git@proton.me>
Cc: ernest.borowski.git@proton.me, linkinjeon@kernel.org, hyc.lee@gmail.com, liubaolin12138@163.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH v8] ntfs: trim the sizes after a short write
Message-ID: <179547805030.310041.12915861227663551141.b4-reply@b4>
Feedback-ID: 236360163:user:proton
X-Pm-Message-ID: 9245e69bdf6c1448ec74262349090775748c6683
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Zhan,

On Mon, Nov 23, 2026 at 11:09:54AM +0800, Zhan Xusheng wrote:
> I'd like to fold the diff into v9 as it is.  Can I add your
> Co-developed-by and Signed-off-by for it?

Yes, please:

Co-developed-by: Ernest Borowski <ernest.borowski.git@proton.me>
Signed-off-by: Ernest Borowski <ernest.borowski.git@proton.me>

> They zero through different paths: the one in patch 7 calls
> ntfs_zero_range(), whose ntfs_iomap_valid() only accepts delalloc
> mappings, while v8 zeroes allocated clusters past the initialized
> size.  A shared helper would need the zeroing function passed in.

That is how ntfs-next does it, but patch 6 of the same series removes
that delalloc-only ntfs_iomap_valid() and ntfs_zero_read_iomap_next().
After it, ntfs_zero_range() is

=09iomap_zero_range(inode, offset, length, NULL,
=09=09=09 ntfs_seek_iomap_next, &ntfs_iomap_folio_ops, NULL);

which is the call in the diff, so both helpers zero the same way and
the one that lands second can drop its copy.  It only matters for the
order of merging; v9 is fine with its own copy.

Thanks,
Ernest

