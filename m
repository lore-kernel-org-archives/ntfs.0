Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968662;
	b=PMrOonIEq0cvmKK3zqhbbRoLPMXyfpCmxE2gj/J2JVOxFla340ODpxjt44DQiXxVn3wO
	 F46rFx5eiCtzI2QUdRAX6wdT5MVyD+rb2MsO+JFPK9ofOFgApocTEmOySPT+yWnI/Y5/5
	 nxQuppoQZkQ69wExoOVLs/sDlphQyTWnMF8OR9odkFYPmnuGQOVu3tJuAVzGRv5Xy4bAA
	 npOwVPvpzJ5BPcBuv1XlHSeV7ZwMCr3PlVXzxPZmvQj628z+SCwwIP15Nsx5o44w2/o9Z
	 9AQmrHxN8xDtWl5eZRCFnABrI3DqTVctz7jQiJ8mycxkqSETdYzzXUHQbE+EoXJdbYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968662;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iYuNhSenOI7lcfVk5lUHNYaSXsoThqyrOax2DqYfx4U=;
	b=IuHY4UfYt2e6mWRbtBUdE34Jd6YMhHIOTtQGp1cVfgzzdoQmCij1mt8NbgyAtFU2issO
	 ZtymFPFBFaz/NXD4HQ/e0ym8GmHToHe6kEIrmfge9jLMyUDif/PGEQ6c4xt+sun8ukmTQ
	 rnKbsKoO88bfOVGO6vsEsaFVdDIDufr2lhnglupajHcrXBDVR89sjIZKAmWizkm0mchHh
	 ZYd63O+41Tc5FKGALXk36J8f3f80H5ZJMim8Zy8l+rAIor8433yLXVvV607gz9zWY38eh
	 y93eUgIbhMaJ33PajItVdjZEQB215yvj3QH6VbV182qHR5gyOF6zk1MZEAdl9TV9UBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DhypPOzb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9C0606A326
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 12:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DhypPOzb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A43D1F008A3
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 12:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793968662;
	bh=iYuNhSenOI7lcfVk5lUHNYaSXsoThqyrOax2DqYfx4U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DhypPOzbv1H82KnEwwcLrD4a9toQJKWpViEJOZgJ1ti0/XUGs6KYyu5QKayiEf4N8
	 tKAJq/SgoPfsB9B6Jxc9p4HH5+JqAWWDI4z/HLs9rQYwSR88Ft5gYazMUS9gEVSCao
	 1wsVTHtPLjS9zA8914weFTRqZG9wBilrod1nK6LKhDs6quISpZDbm27KY4ltkGwXuy
	 k4DhPWeHSKKxC6Vg/rcv8i3EpjUNmwnJEdctWKrGUy/BbCkW0TAuYLgwSO+MJRfnvY
	 Va50VPTZd+l6UJSgngy3/3IVq/upIMNg6+d8hw+K6a0YF4tUfaMKzC2uaMnjGDAWL3
	 mm21Xc/tpjv9w==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d1b35dc42so108744366b.0
        for <ntfs@lists.linux.dev>; Fri, 06 Nov 2026 04:37:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw8ba7w2xqAl5EvO6EU+Q3AkGy76qVwKKy/rVY+QuC6Wbn3a/BkH5+HJ6u3KFdD0Vg+6uVv@lists.linux.dev
X-Gm-Message-State: APuU4Z9SDyhzr5vV47RnwPneFObJc7lt1bc3KeFxyygm/K/B1wiPwrE1
	MXLdRChdRhSfgEHp9fV5xdncSYX2+9yET5sYK+/RTPJua8F5+prDJEF/cWe1OYK21SuXs4OtGnU
	9AFwWwkKEsbcFVN+JGL746TV3ZgkihG4=
X-Received: by 2002:a17:906:3617:b0:c46:7fa4:9212 with SMTP id
 a640c23a62f3a-c4d3556d0d9mr152301766b.23.1793968660997; Fri, 06 Nov 2026
 04:37:40 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261106112752.2552832-1-wahidzk0091@gmail.com>
In-Reply-To: <20261106112752.2552832-1-wahidzk0091@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 6 Nov 2026 21:37:27 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9LgeNhDYKedSXQzY+SDd5OMxS-8O6kKt0zxriH+V5KLA@mail.gmail.com>
X-Gm-Features: AclHuK-xYyx6CFwKY7XxaKKWjDV7an6HvC6v7wSiuOAXrjNZzfiOfSvNhgcD2Ps
Message-ID: <CAKYAXd9LgeNhDYKedSXQzY+SDd5OMxS-8O6kKt0zxriH+V5KLA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: check the file name against the key length of an
 index entry
To: Wahid Khan <wahidzk0091@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 8:28=E2=80=AFPM Wahid Khan <wahidzk0091@gmail.com> w=
rote:
>
> ntfs_index_entry_inconsistent() checks that the file name of a
> $FILE_NAME key fits in the index entry. It does not check that the name
> fits in the key, which is what key_length describes. Code that works on
> the key alone relies on that.
>
> ntfs_readdir() copies key_length bytes of the key of the next entry to
> resume the enumeration, and later uses the copy to search the index. If
> file_name_length is larger than the key holds, the name comparison reads
> past the copy:
>
>   BUG: KASAN: slab-out-of-bounds in ntfs_file_compare_values+0x2d1/0x4b0
>   Read of size 2 at addr ffff88800a4ef2ce by task init/1
>    ntfs_file_compare_values
>    ntfs_collate
>    ntfs_ie_lookup
>    ntfs_index_lookup
>    ntfs_readdir
>    iterate_dir
>   Allocated by task 1:
>    kmemdup_noprof
>    ntfs_readdir
>   The buggy address is located 0 bytes to the right of
>   allocated 78-byte region
>
> Two bytes of an image from mkntfs are enough: in an entry whose name has
> six characters (key_length 78), change file_name_length from 6 to 7, so
> the key claims 80 bytes. The entry itself is 96 bytes, so the existing
> check lets it pass. The next readdir of the directory reads the extra
> bytes.
>
> Check the name against key_length, and check that the key is large
> enough to hold file_name_length in the first place.
>
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Cc: stable@vger.kernel.org # v7.1+
> Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
Applied it to #ntfs-next.
Thanks!
