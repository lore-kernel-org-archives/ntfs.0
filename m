Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AF630D411
	for <ntfs@lists.linux.dev>; Tue, 25 Aug 2026 04:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787632606; cv=pass; b=FN8l3YmeatTTSfOrCKpmpPM08c3LbojhrNDBXF+4VfhJXqAGF3BGTXYqDe1PGXdbJEZ5WwK2MAm9vbPkOjnKJbUN2a1jGeZoaM+0jSogBkJT5ln+D8jbzNFjfO+QoX7Ao7buFSRImuUUWopLwpfsRGOpCjuHch3UnCozIPWMzHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787632606; c=relaxed/simple;
	bh=8KXDg6v+jwLGL46qS1rvYXZT24b9H8EIN1Re7A2aD84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tnl066jRYBpZqUOUTtD5Lk4voVI1A7RgAoSpA2r7r6UauqA610wu7EVv2ufMTScQEqvG3eTM18PNsFmKQXNKuCRdGRNOHaiu/QwbaGvMn2HjsPCl4F6EmagUa0tPDKTZqw/9W2hxFQyviktgrW0Qa+dVxzqrWSe3JGLHn0Ve0tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuhB6539; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuhB6539"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c95395230so38267091fa.2
        for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 21:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787632603; cv=none;
        d=google.com; s=arc-20260327;
        b=Biz//AtCwFt3LhNJvhLI51Xp2/9dScYV5CZXO5ECI1gu69OBGmzjaw1hwUXd4kP00i
         SWQYRQFfnAnTyDU+rgj61R2OviDA37wxx2psknpFoWdopUNm7pj6iUmrvJqIu7QuvAHZ
         s3eoqIRx0Z8ir5+ef4x2LGi1uYvIqCPTJuqDergwy+fet3kNTnHUu0YRFDvm+5aSedXZ
         F3Kd4FyHQCWwBCbfXlmCG6VeExJtlL7Ye0B2/uClz4aU+jan9GAqJ5/dZNfFojwQRBkO
         XnSUYj01DSQqT0rpSoQhtADDpB67pkRUms8//ZuKuPhTP07AtYEZ85d7Mdwkut3hTZaZ
         0JeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ig8RAVfekwF2wIGK7Q5QZITkYd9OOtlKfCSkZ8UG+zA=;
        fh=8BIZM/6XRw+sNtCQM3YE1q2R1dsqKgBXngy9RMfqgCw=;
        b=abx0UYXbXE+j/Z2IfjQC8S8/C6kIPg01i2tc1dD+cQ5zLYP63pxhD4OoeJJiDJSuI5
         gGvx64tKyq+hWEl/0+uL0bNyhw6PQhBY24rvi6ocMej7pEsiG04JiJGbYkBka9MGS87V
         SkKL9yFO/g0pT9JG1p7XzrPmCXyMQ6xIL/+MCPvAuiWXoLcNOpO/z8pSvA8bv9/qaHi0
         c7ZoYrYgtyb6yh+Oyty5AEF1pQDQP4KSKUzph6DHiJMZOudRjNPmhk3XcXLKYo3mYqJZ
         Tih6tinascbrm9O9oU6NSnysYcauv8f2qFzNyNbNI36/fyNBrxDtHNTpdfEQHnJ+oLR3
         wafQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787632603; x=1788237403; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ig8RAVfekwF2wIGK7Q5QZITkYd9OOtlKfCSkZ8UG+zA=;
        b=FuhB6539vMze/IFtS0rp4ontbxissVqADRv/lk79B+GABPmyJhYgqVBzItgmeSXn+m
         jTgkS64YhgBRoVwUqIbWnGIglphYFkvjEkMJ8de1/tigJv6yI4WX2vJGQwwHYvJGchy1
         zIe1C81hStHKB04HA6WfMNRGZjYHxxQW6iTgz7/hOzPicR2RmZ4TIa3z/G/yKJweIxtk
         h5OND6uvv0UhWexo6QnGQdvXPGYnuGr64V/SyR7+9+rPmI3FEdWZW4MBAZ96+37O2mEu
         bcmsmk2duMLtKKTWdc6W8nFVmNmleyZ7CsQtCwpVbsp6d/YQYGr+STZNhP/SewUvW+VJ
         cYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632603; x=1788237403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ig8RAVfekwF2wIGK7Q5QZITkYd9OOtlKfCSkZ8UG+zA=;
        b=knSw0h4dMwo6CCgwJiCRLYPpOBWgh+fvnpFlMiJVvjIETRY81TlB7LoTJQX4SmuXYD
         RrV4Xrn7JdsJPcLoCcrPZ/hWmtnbuFFULQNmLQ3yDuJPzJSMiUApCjmA3AbnAuMdlDMK
         iEIKSIGZ9dgd4olstUYdlrJjfNSqVLlm2Ws0YhrtUfIBJz8GUq1aLi2Gi6YY2T8J5zME
         /4XcbZ/eqw//2nZn20Sqmdo8cgEfFaXCBTe/ts4EX3VbbnszgUSzfPCbjf4RREfa5Hbs
         xFeP2LaR8+gC9Zc9ovD9HZQTk5Z0GpAlXHYoPXPbwTf6PgegkwzIt7pZpdnHP2VK42uz
         R/EQ==
X-Forwarded-Encrypted: i=1; AHgh+RoapyZkO60rTI6bapQKyO9+NvFKmJPMPRICo/fSrgmjdeJXNj+npGQNdY3atlMifc9PNlaU@lists.linux.dev
X-Gm-Message-State: AFuF++maoaun6tnw3P9KAj+1i66CLZOvONhoGJcZ8/Otk3PzsSeqndCv
	GeTjCPC6bB9Rus5AUYB00z2ua2v/52QUo7IifKjgaFnwm0gHeH0O1D/2kGJl30wBf2Be6KaAONF
	uJAPuYvsPqqN7JRoDa01C0X2VyN/cVsbHOg==
X-Gm-Gg: AR+sD12N1iq+DKe0DyaLymRcSdD0mYnXxktsTVqR5votmhDqOw9rrnsKMeBCAYqc0Gy
	9TV9nwVbEE5ifa9hJBoxbahhfutW+yHukmiveihq6Z9bMIeb/pyFiSEGnEbuQ1Gbw7JGY9MyaKD
	lKcO5P/FqnzDXrVjKZ0Kf3giPE1ngOgDJV3emRaTRGLLihObVjhkJ1upZ9sEzkhygoNcuSL6uj7
	WOp7/NBkjRN/aqaTU3EI77MGUTw1TamOdewXP9hgyU2PRa4c3WNQvCkABRrQEkuIftGf9bqmBBv
	fYQVFF2COe1mKglNuu4snHKzYwv3OAjWgUP4rXM2KT4v
X-Received: by 2002:a05:651c:f16:b0:3a1:90f8:c14c with SMTP id
 38308e7fff4ca-3a1ef3ef2acmr6706201fa.11.1787632602487; Mon, 24 Aug 2026
 21:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824054115.114298-1-zenghongling@kylinos.cn>
In-Reply-To: <20260824054115.114298-1-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 25 Aug 2026 13:36:30 +0900
X-Gm-Features: AcwNN1W0Ie8ThfGLQSZuvnEXV8DGnfK_q6Z4Wo1bvi5W-Srfd1h8RCYobcvQFiw
Message-ID: <CANFS6bb9BPEuiv2NVG4dMJRRoQyiC6fE+UokPxpMMiReOseT-g@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix incorrect MFT record pointer passed to ntfs_attr_record_resize
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 8=EC=9B=94 24=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 2:41, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> ntfs_new_attr_flags() passes the wrong MFT record to ntfs_attr_record_res=
ize().
> When the attribute is in an extent record, ctx->mrec points to the extent
> but the function receives the base record pointer m, causing incorrect
> size calculations in memmove.
>
> Fix by passing ctx->mrec (the actual MFT record containing the attribute)
> instead of m (the base MFT record) to ntfs_attr_record_resize().
>
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/ea.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
> index 44252f2c2ca6..534f7efaf128 100644
> --- a/fs/ntfs/ea.c
> +++ b/fs/ntfs/ea.c
> @@ -740,7 +740,7 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni,=
 __le32 fattr)
>                         memmove((u8 *)a + mp_ofs, (u8 *)a + old_mp_ofs, m=
p_size);
>         }
>
> -       err =3D ntfs_attr_record_resize(m, a, arec_size);
> +       err =3D ntfs_attr_record_resize(ctx->mrec, a, arec_size);
>         if (unlikely(err))
>                 goto err_out;
>
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
