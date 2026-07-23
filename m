Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ED31F3BA4
	for <ntfs@lists.linux.dev>; Thu, 23 Jul 2026 02:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784773016; cv=pass; b=o65z468WlMg9FdVI5lPJ/5V9vkfp9nBp3ZKFcwTIzTP6kIPn7FFdT/vfgMyiht6HdW36JscLkqOnIAtqUkj6YMzLB/l9QInqNRVa38yUPw8RqufQFi+kOVj8jDfEKvzUGgH6dmlkjYGu4JquU8sIzxshevgcFSjl+dJDBO/UZ20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784773016; c=relaxed/simple;
	bh=UNNxx796VPOv2ZJCq+aGtXw17tQppj8pEA7zU0iAZJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kDzoitvBuXB8SRV3lJ4xdg8W29HOOfnDEqnw90sHQa0zsRoADtNcAVVhPwiJ4Ud05ev9BacR4g2qevO4DYJZa4dD1Ht6UyZo3bVnMBZCuf8pQNbnuw3qzCP//nhh8xazAtLqXumKr5gFd2cOoqomxZmIS7rCgx3GvFQyQfinffo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fvi7cQbg; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fvi7cQbg"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b2a8e4c77eso104943e87.1
        for <ntfs@lists.linux.dev>; Wed, 22 Jul 2026 19:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784773013; cv=none;
        d=google.com; s=arc-20260327;
        b=klLEfL1qAw70N5uWj4p/q9Ku8KwWe77Prd6lZp5IM2lqNPvJ19PWquCcnn/gSEoMZp
         KZa5LPelZw3SSnFaSSkcozgsUvWrea88sJvEvZAyy2rZem07J3SAsZ8vFLktjZmmkN+S
         O0yerx+BmNorHOJuxYAW0obIS3k4/Wg7d8PHnzLzcJclLZC8X5AHtpFSw55W4ksMaX6z
         QpAu3WD5zCguOA9qMqBIpEvXMCBBao59lGE5APVJjOIB7VIdOBCtFFlBBbYeU3q5XrS3
         KvODX4Am1qCRS7b8tZbnKJ9WC8sevXJ6k+Nnek2BSYxSemg3C8O/1hH8CYwacDcFnbne
         +uTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pAkKeg+iY/QpltEhjuWRL72utPlW6c5K9Ktw1th0uuo=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=lkvS8HRMQyJRZXmZFqnkc9RxW3IzLt0B7Z6Pv9PDbocwpzq69i6+lZ2D+oG+4MhUBy
         1XydCU5ATQFyYk5MMlr999EjsNHaWIM8XfG6dVpnyDeyZPki1ShBvLmxhltPuxUmzowp
         +ChPE4sYmWxdzjVKUj3CyaraU5bUu4g1iLhPtR7fF0ry2jqJRYTQfDwTyekEY9g9tAI0
         PiVt+x+t/QMsEiXQuVNqe9U8QgdIuGYDXg0UjmUO3y8S3S2ewqHjil+W/Fr9TJmul93F
         xTtgwVsDNjuDCkkH2mI/234xjCvmiu86jgkFIc10n8kgzil2ucPhXEL5jvn29WWMouiX
         5OUQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784773013; x=1785377813; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pAkKeg+iY/QpltEhjuWRL72utPlW6c5K9Ktw1th0uuo=;
        b=Fvi7cQbgkp0uGlfocUSMEqu084U0U0xWbuEY/qB4lFeLT62wAxDPkQkIOkdFRcI9Lx
         uxMqPP1V++CQlBz5F7SYZJw/7JgcYSZ1FV7/1DFqQLy4Akcg0J2D1WiUij8Tqc9cvn+k
         Fal1pFTiQiI1b6i100vL0LeIXgMJjGsZOBrwbPPslBK987GL9uhxXX14eGKUS8YbyoOf
         fm+KunroPVgSTEV8cn1hpGgQBYgM+L6gsqwTbF+A15SmX71RCvBzkbR69QOLDtevzmz5
         TPHYGsvxxuE/2zuXuJ7L5yLuOgQhtHjWqRAmeM/LmAYM+p/AZn6zgxI4K5CGyh4ZspJP
         wp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784773013; x=1785377813;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAkKeg+iY/QpltEhjuWRL72utPlW6c5K9Ktw1th0uuo=;
        b=ZyDzAbSX4jVxXJGPkRrKHwVr33RkBfbmWRsjoaVP46KjReHu8JIJnyHPqI6yHoZanF
         vUP+uCl+p4bYdxTCAU8t/jLaZH5wNbwj4Wxl3zCbCTyA7BKEKIejSRApeYjbAVQD49DE
         ciYiY9uOQSmeHC2PjDvuBbB8BPkV6AItAn23CRIZ4nP4fgXTV4m8oy1w6YcIoxirAHxi
         luCAMw1FROt5aSqBWblzJ77xaepONTxT44VRDyaO19z7xdasec04jZgDw5vpFj7d8MSE
         nTTL9UaSTt8NGA39pdhLbXDbHQNYkTPqkk9MGZlRE1fS4sTimip01dOt2UgYeWXdyvjd
         5UDA==
X-Gm-Message-State: AOJu0Yz2fzuO38wiW+B5YbULC2Nvnx6+CrdHvkpkeU8j2p8WcmynhMDI
	74WOqFpsb0XY4RmImrvS7moVg9T5MHM5COIVlz1oTIfedIhi9ud3KlBUEe4mHALB9W3HPtOJZOt
	fav+y6FUg+ViWEy3/nPwaHox6Nbhxefc=
X-Gm-Gg: AR+sD13Aka2A96SezbuinSlhba8nuzW3B4uJqTtfdba8nVRxgBwrF7FCL0g5UTBR5LT
	V1CenAdwFwdkXkYh7kLql7VV7OcITZssmRLjZD0zXV4x+qKnnRy4YskhUzO5O79/VPG7RZYgZlH
	M0msYsAkMvV0QUZN1e13/3K6VNZ+vUJne35PbBkDhg3oFk/1Doj2S6SAq/XroIiKSA8EdZHjIR/
	/nSUWwQfIMnxrW0Zdh8piqzxj6wjc/QdSawO4y+r2u1iLQyqB0DNPk445FFzA==
X-Received: by 2002:a05:6512:638c:10b0:5b0:1101:78f1 with SMTP id
 2adb3069b0e04-5b2b2f52472mr120977e87.28.1784773012467; Wed, 22 Jul 2026
 19:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721095431.6619-1-linkinjeon@kernel.org> <20260721095431.6619-9-linkinjeon@kernel.org>
In-Reply-To: <20260721095431.6619-9-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 23 Jul 2026 11:16:41 +0900
X-Gm-Features: AUfX_myLLbV_bwQ4dH8ndN63EqmOYdh4wD7M2JOlMN7zpPvUQSuaWkI6svthTec
Message-ID: <CANFS6bbOBBVvmY-KfqBVJDVfk3oi7Qb2zW0MSHtBVL_jt_sPdg@mail.gmail.com>
Subject: Re: [PATCH 09/11] ntfs: skip reads for full compression unit overwrites
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 21=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:55, N=
amjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> ntfs_compress_write() reads every page in a compression unit before copyi=
ng
> new data into it. The read is unnecessary when an aligned write replaces
> every byte covered by the page-cache folios.
>
> Detect full page-aligned compression unit overwrites and grab locked cach=
e
> folios without reading them. Keep the read-modify-write path for partial
> units and units that cover only part of a large page.
>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/compress.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index a3af669b1008..ea29fade9b9b 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -1501,6 +1501,7 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff=
_t pos, size_t count,
>                 pgoff_t index;
>                 size_t copied, bytes;
>                 unsigned int page_offset;
> +               bool full_cb;
>                 int off;
>
>                 off =3D pos & (cb_size - 1);
> @@ -1512,6 +1513,8 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff=
_t pos, size_t count,
>                 page_offset =3D offset_in_page(cb_off);
>                 pages_per_cb =3D DIV_ROUND_UP(page_offset + cb_size, PAGE=
_SIZE);
>                 index =3D cb_off >> PAGE_SHIFT;
> +               full_cb =3D !off && bytes =3D=3D cb_size && !page_offset =
&&
> +                               !(cb_size & (PAGE_SIZE - 1));
>
>                 if (unlikely(fault_in_iov_iter_readable(from, bytes))) {
>                         err =3D -EFAULT;
> @@ -1519,7 +1522,10 @@ int ntfs_compress_write(struct ntfs_inode *ni, lof=
f_t pos, size_t count,
>                 }
>
>                 for (i =3D 0; i < pages_per_cb; i++) {
> -                       folio =3D read_mapping_folio(mapping, index + i, =
NULL);
> +                       if (full_cb)
> +                               folio =3D filemap_grab_folio(mapping, ind=
ex + i);
> +                       else
> +                               folio =3D read_mapping_folio(mapping, ind=
ex + i, NULL);
>                         if (IS_ERR(folio)) {
>                                 for (ip =3D 0; ip < i; ip++) {
>                                         folio_unlock(page_folio(pages[ip]=
));
> @@ -1529,7 +1535,8 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff=
_t pos, size_t count,
>                                 goto out;
>                         }
>
> -                       folio_lock(folio);
> +                       if (!full_cb)
> +                               folio_lock(folio);
>                         pages[i] =3D folio_page(folio, 0);
>                 }
>
> --
> 2.34.1
>


--=20
Thanks,
Hyunchul
