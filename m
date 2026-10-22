Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669911;
	b=VQ/c33Ux0F0hnoW5QjsDq2Au6+s2qQKz+J7KpH0l9pZ3hbfGBIY08j9oy6lM5Fd7ACTD
	 h7qSq5K3TNBw/wmfWqYKASnwxxmdW/GTX0R+YUe5aNLeVvYDCqHhXIg4a6qUv4OLaFb0O
	 Nu7DwAcAay9ACzue66iKHbCqH8xKCNDBad2kpgUUlUAfhtDK/foXiTclM1kRsBBee4AHC
	 cW20JOx2LK84c8Y/nnFTi0Z+8KiDpg8JMV7dKPUgjUYQL04F3jLrwYSHLVQ4C9ScD2WpZ
	 tjZLSekWLg1YoY9+HnbhPJUnWMznlv/AwAT2nbcoSiAJylkpa16vxYLfinPzl7Ztacw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669911;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MPj+DRLAk4kNVw5AbVjGbc7EK8+Er0TPFmbITJ0swXo=;
	b=axTPhDEOIk7QghT7DH0g0zNpPFR5xXitwGC3iwze+s7Z6ONzoBS8kzGKbXAwUf9q3bUd
	 HHJ5+b0JmA2sb5VmiM7VqJQsL8FNMYQN9MZuTtYBazuD40ZDRtCcYz/SgULariJ2fvT9e
	 MNe8QAom7OI9NtgKGw+lpjwIAX8fEp4hM+XAUN14mqPCxGs07HqrNryivg/8LoBywyklQ
	 f/aFs5g0qgGfFPLDfZxTzrvblxR3fYnzbl6rvaCgmNEE50dQXHCrw3e0Povz57RQpSdHB
	 56YdrI2j+SEucpTsxkS5uBQl6+CQcB+5oyHOhWU8xSo8CK32bkM73ooLVpAu/pg3coA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NB1/lZDb";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA9B606A333
	for <ntfs@lists.linux.dev>; Thu, 22 Oct 2026 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NB1/lZDb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F801F000C8
	for <ntfs@lists.linux.dev>; Thu, 22 Oct 2026 11:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792669905;
	bh=MPj+DRLAk4kNVw5AbVjGbc7EK8+Er0TPFmbITJ0swXo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NB1/lZDbwlKrqWPCDn4t7mGZJVIO+FNSRz3+7hW8yO9kqEx0AzLSyl+Gq5wdvd6+u
	 fxZJPhgQlF4jleY+GbFjye6NDWwPzgS5u6/r8Bn4UNe1+/vcQjGwHZS5H4KuxHVKan
	 4Dx+g5mJqEaclKKliJuo6lj1TAQAWkODXX8JDLJaXBLsWYTrrHtQsa5GyVKy3BsvLa
	 TL5MPRQi3HRIIWWk5oLIzaZr4z+UjmmebaUSJYsPx483rf3sXdW/okPetPCz4fU+qJ
	 m7sNSIM086j8k/eQKLnczWn++j1fzSuuzocFk4l2hqyU3f5zaAZGDpdRo/y6gRNJ/W
	 oFDv070kHRmvQ==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c414e5d282eso220368066b.1
        for <ntfs@lists.linux.dev>; Thu, 22 Oct 2026 04:51:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx2QrXDR2Mc3HEBGmt4nVzSV9zWRsiUleG5d/w8Syep3nbXRAsEUHEDlQZqY7WDJXeOzzPb@lists.linux.dev
X-Gm-Message-State: AFq9FYLdxIrhtaCHa6aWpBgxufpo/eZmMPq29mTHgWhTNJSvFr1YXZnL
	NcdZQZZJ7WdD4XnsKz4r86PFWlCk/d6QMnYgn/jnHotyHXONzUkfKjVMVYRkf/qcq9WO3G/3lGh
	v82HeZC4tueWsjekYu7dEcoy2xqXmjwk=
X-Received: by 2002:a17:906:dc93:b0:c2a:ad55:b3fa with SMTP id
 a640c23a62f3a-c467916d30cmr506355866b.7.1792669904263; Thu, 22 Oct 2026
 04:51:44 -0700 (PDT)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <tencent_162F22EDEB882D9E2691DEBF38D243CA4A09@qq.com>
In-Reply-To: <tencent_162F22EDEB882D9E2691DEBF38D243CA4A09@qq.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 22 Oct 2026 20:51:31 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9h1_j=6VNUGQyfh=arsP97m8T5La4DtewZZ5VUjOefLQ@mail.gmail.com>
X-Gm-Features: AclHuK_kOD1aIs-LHf0jjdIYB5Kx8UCMWzylJLtp-lH1jhMwffYvMEtjQ17-22Y
Message-ID: <CAKYAXd9h1_j=6VNUGQyfh=arsP97m8T5La4DtewZZ5VUjOefLQ@mail.gmail.com>
Subject: Re: [PATCH v5] ntfs: reject index blocks with a too small entries offset
To: Hang Nan <2122295973@qq.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, liubaolin12138@163.com, ntfs@lists.linux.dev, 
	security@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 5:54=E2=80=AFPM Hang Nan <2122295973@qq.com> wrote:
>
>
> Index blocks read from the volume are checked for a plausible header, but
> nothing keeps a block from placing its entries closer to the header than
> ntfs_ib_alloc() does when it creates one.  The allocation adds the update
> sequence array, one entry per 512-byte sector plus the terminator, to the
> index header and aligns the result to 8 bytes, so the first entry of a
> 4096-byte block starts at offset 40, while a corrupt block may declare 16=
.
>
> ntfs_ib_copy_tail() then copies the entries that follow the median entry
> from the source block into a freshly allocated destination.  The tail is
> sized as index_length minus entries_offset and the median entry, both fro=
m
> the source, while the destination only has allocated_size minus the
> canonical offset of room.  With the values above the tail is 4040 bytes
> and the destination holds 4032, so the last 8 bytes are written past the
> end of the new allocation, with contents taken from the mounted image.
>
> Reject such a block when it is read: entries_offset must not be smaller
> than the canonical offset for the block size.  Derive it from block_size
> rather than from the block's own usa_count, which post_read_mst_fixup()
> treats as "not protected" when it does not match the block size, and use
> the same helper in ntfs_ib_alloc() so both stay in sync.
>
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Signed-off-by: Hang Nan <2122295973@qq.com>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
