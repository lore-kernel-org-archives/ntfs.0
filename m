Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75ACF37FF53
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230435; cv=pass; b=G9HKhv/10TPU5oGRnSB4ZFcFPig9Z8fao7+qVCg5o950CN9GKG1P1lidjsIRgrsuGfYdoP38jmNgInktn+D+9kABHCtya0rGMGqinl3iev4G9FQb6ormfQjm8aBw0L4TJUi06n3zaLqSG77KEhyJB8KvWxF3WS50rWlB2cZ8tNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230435; c=relaxed/simple;
	bh=YdfoJyhwrUefabbNunnf2UDUw3FakZnpI0LYBH1DaOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tM2e6IPxaGwTNybyrPWke+q19Xd43q7mXcA84nqNlBor77wKrn2rCr5GP9ULHvCfnywtDMwyWvND4Qg8SV149KzS5tAF7FqnQ/4jbkgtmG5Cm8pbL3FDFkp4fKCcJsoU2xhFxeaLSoogNHKU7qVJeioUNRMW/vJd90CQMXZH0nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMQu5/10; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMQu5/10"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a302c23fb2so7121981fa.2
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:27:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789230430; cv=none;
        d=google.com; s=arc-20260327;
        b=KfbpYRqDGlL6DG3qhj3e4MLIvIIzGTPMeDgHTlcHYygmPifYqXs3cI/vyZXLYwb43b
         uUvyqFW2+rQmeBGgl9CJr28i71/zJ0tkZcvVjN8dSI/MtyseUl0SfYAY7eYdWsjorl/f
         b3nEGIakT71eNKB7bpUglAT5qtEh2exbQpBOPA1I7eoCzUtgi6tzlMyrvp9+vOV0tuju
         Mh9ULketWUcL2DJs99tRffIcUPfdVzVlNLFahRjOJmPBrN6WL5sgy7BFjj8kRnJzlv2y
         zaIDr6UMGR+hTjz6ukL0Tl6I8vyatMk1PrFpqFPa1zrUt7F9NXJnfGCWDcps8ZDYnTS5
         BLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uL6I63iylEOao3XbZAify+otV5GZ+ljXjcRO6yZaRgg=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=AhucroNqfh4ObZ2UXbof+t1DcbJpNJcU8G2g0UxCDqRZOoAaycF9sXAdULPh5lg/yo
         M6Fk+YUYQRYIaZOImlZF1tLo7EnvvF2yfpAB3aPS8FrbwxyFcuzkdSItZ6dOa/KqE+0H
         9rQ0ZMJjMYgXUuRoPuCIZds3IeOW+sZRrEv445m+DESFmnkVZM/AS+7n4I7NYQnxJQOk
         3au9IaRLv0MSZ+ZvaXu7rrkna7M3d2DkA6P37uL7+kesbcUFsfvFJ11eufBfBWx8glYW
         7BOt+3/9/HSHIuZ9ZWtWp3CrOxCBPXJMESfYZuW788Ze6QVQsFNBYvob6uJIiDV2MhLw
         t3DQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230430; x=1789835230; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uL6I63iylEOao3XbZAify+otV5GZ+ljXjcRO6yZaRgg=;
        b=kMQu5/106tGfe1E5EqAK8y6HzCXhgFjJgvHnad+KfeRbwiIYsiiDuTgq6R5k5rD3+j
         hyXtx6h0kC9YhZCLIaT+/H6plNjQJqi5LyGu+KSfrjFNj1T9iLawjWoNBNv+HnGIwDrt
         gHpYGj1Qm4oLANjONEE2THg5A9nBynTabvgctZh69rEFToQwOcAOhV6nf4cUcn9XwSxb
         fm++0mj5v8+8dZZHq0aIPbKLaSNPCmLL3dd0va7mZF7SfNAOfPAHoLfttKPSN0+E9B2w
         vDJmDk9U3VWPcQg/PxkuFr4FNIgH8H08G3mnJJVVBgfrvnJ4obl2WYkRY/Zl45rLti4m
         sPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230430; x=1789835230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uL6I63iylEOao3XbZAify+otV5GZ+ljXjcRO6yZaRgg=;
        b=KGAb7/RsUzQihdM23EuEQ4Wu6ya1mTjfsGyioYWqfiH4OZVoQAVX6Uxy8iRus/YzwG
         zGAJVgjUSgmwvfv6PSiBF1m3RgQk1MTEvVjpAXKZGitEwOIHXZPaoVYS/f/McOUtZSv8
         1hg7eQLrhKWtea8ppFCKMhWi9nC1/1EgPkRUJgVt+0JSUQefb9XA2AaCoXPG/2XBa7N0
         wBwaGFhtO/UNN8wGctgGV1G4LMHWarN3zaSGXVkpy5V6xr1xJVBRWhWj24Ycb616NbQz
         3iAalHtPjcOEjtgztoYfafB319UC9h6Rpp9w67nKClNHrsixKuOHn2+mqL5fOPZ3qhJK
         WLmA==
X-Gm-Message-State: AFuF++luv4FDO5x1mtsI3lE+ajKQSYcdDmrGvIafUTTtm6gc/rPdau38
	ObRCY8GsqM3tIpQels2uvl5jka/bY+zS/eEL6ZLdP3gqEkevrmXWJaABbunim1vumAzwVDBiNNW
	8rMVbrGZhIaDCtBpp+UZ3E8BQxCX0c0g=
X-Gm-Gg: AYBFou3TsLZ2Hk1fCBJtq0ORI54kX7YJ9uoSsyF2ahnGeGHiGFIFMwkxIoNBiaLeCCr
	Hd/+jYWk51C1zkOaBfIWcNaqSTO7vux55DzTb/nTT2e8VBrkdKKRIBUY1gE7o6ZIZVA6q1SGeCk
	CL4aNwJacjIByXayixgzyvfyVtnCeHiSZcXNJNS48QegnWHf8nJBq+Oad2OflcvMNZEgjbNvF4S
	sYOzhhl/pKe074MU1SlZmwu63sS2Tg5M5eLl7N8mDdYQnoWx7/Xc0pxsccGWt7J27t4CA3BNXch
	JHsGCYRTcI36JVWvwc09KrXYnCBiWr0rWLZu76s0m5V6C6GWkWbIurhN
X-Received: by 2002:a05:6512:239f:b0:5b6:183b:d215 with SMTP id
 2adb3069b0e04-5b8a032f774mr2118029e87.60.1789230430176; Sat, 12 Sep 2026
 09:27:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908094416.10534-1-linkinjeon@kernel.org> <20260908094416.10534-7-linkinjeon@kernel.org>
In-Reply-To: <20260908094416.10534-7-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sun, 13 Sep 2026 01:26:58 +0900
X-Gm-Features: AcwNN1UNI_9d1wGfZhbZ5LOj4AQ4xa_0uzhlqx1b-W_C0wtljL7pyaLjkxZ4So0
Message-ID: <CANFS6bbnzhcHVRtJz+9dM6ydzq3uXKdwHieJuBqqs=EaofwdGg@mail.gmail.com>
Subject: Re: [PATCH] ntfs: discard inodes that fail initialization
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 8=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:44, Na=
mjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Discard a newly allocated normal, attribute, or index inode when
> initialization fails. Keeping an incompletely initialized inode in the
> inode cache can expose stale sequence data to later directory lookups.
>
> Fixes: d7aa04984f12 ("ntfs: return errors from inode initialization")
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/inode.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index b735cd829120..5f0201610e2d 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -170,17 +170,18 @@ struct inode *ntfs_iget(struct super_block *sb, u64=
 mft_no)
>         /* If this is a freshly allocated inode, need to read it now. */
>         if (inode_state_read_once(vi) & I_NEW) {
>                 err =3D ntfs_read_locked_inode(vi);
> -               unlock_new_inode(vi);
> +               if (err)
> +                       discard_new_inode(vi);
> +               else
> +                       unlock_new_inode(vi);
>         }
>         /*
>          * There is no point in keeping bad inodes around. This also
>          * simplifies things in that we never need to check for bad inode=
s
>          * elsewhere.
>          */
> -       if (unlikely(err)) {
> -               iput(vi);
> +       if (unlikely(err))
>                 vi =3D ERR_PTR(err);
> -       }
>         return vi;
>  }
>
> @@ -231,17 +232,18 @@ struct inode *ntfs_attr_iget(struct inode *base_vi,=
 __le32 type,
>         /* If this is a freshly allocated inode, need to read it now. */
>         if (inode_state_read_once(vi) & I_NEW) {
>                 err =3D ntfs_read_locked_attr_inode(base_vi, vi);
> -               unlock_new_inode(vi);
> +               if (err)
> +                       discard_new_inode(vi);
> +               else
> +                       unlock_new_inode(vi);
>         }
>         /*
>          * There is no point in keeping bad attribute inodes around. This=
 also
>          * simplifies things in that we never need to check for bad attri=
bute
>          * inodes elsewhere.
>          */
> -       if (unlikely(err)) {
> -               iput(vi);
> +       if (unlikely(err))
>                 vi =3D ERR_PTR(err);
> -       }
>         return vi;
>  }
>
> @@ -286,17 +288,18 @@ struct inode *ntfs_index_iget(struct inode *base_vi=
, __le16 *name,
>         /* If this is a freshly allocated inode, need to read it now. */
>         if (inode_state_read_once(vi) & I_NEW) {
>                 err =3D ntfs_read_locked_index_inode(base_vi, vi);
> -               unlock_new_inode(vi);
> +               if (err)
> +                       discard_new_inode(vi);
> +               else
> +                       unlock_new_inode(vi);
>         }
>         /*
>          * There is no point in keeping bad index inodes around.  This al=
so
>          * simplifies things in that we never need to check for bad index
>          * inodes elsewhere.
>          */
> -       if (unlikely(err)) {
> -               iput(vi);
> +       if (unlikely(err))
>                 vi =3D ERR_PTR(err);
> -       }
>         return vi;
>  }
>
> --
> 2.25.1



--=20
Thanks,
Hyunchul
