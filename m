Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDBC269B1C
	for <ntfs@lists.linux.dev>; Thu, 23 Jul 2026 02:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772879; cv=pass; b=gkGtDX7/d1cRKrRxkpABZiZBNX4DmT1ltMt1Wc8NxJ0sH7XSx5kDmMcvrQbqupOcTTV2//vY9tZZ6tlJfZBAypk9O4kq6NCE3bs8hTw5Njs0lxKfQwCppRN5gaS2sfW62aezX4o8U0fVVXTiZYnkAOQngw/+j9/YsgQvHTkb/28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772879; c=relaxed/simple;
	bh=rzUp2ttzG+09Yglku+atZ7+jXrRpYqQOepLJV9M2Tus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A3vXI/Kh5wVZacPKWkRy7jOXQ5/nvKzDWmRddxmRVwO0+VUndhCoM5kJvRn/lT881oE67HzLNYXDxJBg4lkQIZt9s5h31h2eKf0r8IIK2cjggNTM3sH4JW14/9FTzTZn6cb3NJk5KKbS+qMgvJREWejt3bTb+3Q5LVIrEyV5ZqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ip5Y6DLa; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ip5Y6DLa"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b29599b81cso113390e87.1
        for <ntfs@lists.linux.dev>; Wed, 22 Jul 2026 19:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784772876; cv=none;
        d=google.com; s=arc-20260327;
        b=LOL7T2+txlC5f5eMd0nNgxV4BRsdEyRDkV0ckgnD/kIbFW4CIh8JQPhchjWPaYtI7/
         wD+3NXwiohHlzhXOG8m0gdBRcVLWL1+isliasndKfV93fgZ/H9vn0gSkIApSLi8Q+y6l
         BKQMtLD+YS0Fr9Zf5OED//wPl2IhRgZpq91sTPGcuJdYxwDc4Fxt3rQ4dEgdENif9xts
         xjGFXZmY+wiTKDuN/Q6kwGmssDORJZ+xrsjl+nzpd9EiTln6bhTkVf/zfNe8nl4dcrWr
         qg/aRbK560ZCg3zKbXL8nYWQHtDLdj18ZPxFt99magx6QT4QIMaWs2oQSXsA8Wuk+k2q
         VMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GTHH6VZpd4mhIdqe7geEKJxE4fPx/kzQsBN80pjk+uw=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=Q5Bt8nqqaW1JL78pVWxOjEDbuvOHSNthJ+OC9G6nTtosmEcWSI0kauiVVKsrTmiISb
         REjuaZdMNP9d6Lfr2xLJjspDUUscTyRFV+FCqg4Y3VXf1XAkfaysrlnb+5bJA4BLMLdT
         aofLW5wUgtHnC95gPdD4JyC/WON7xEhIXLoHJGOyHhV9vTcC7SgeHCOrJP5juNMRX+HK
         AyOc3Ke6fFqXS6QZ8VgWQBa94EjMWgyPKAGIAC0ArQpnohNMObdQ3cMTevy4zyMwCYNs
         DLRRHx1IIUDKmi2M8BuCFSzA50h9OLTFpIXoZwzyGBLWH6PpozWZz7AIjc3vw5fWkBgk
         Rweg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784772876; x=1785377676; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GTHH6VZpd4mhIdqe7geEKJxE4fPx/kzQsBN80pjk+uw=;
        b=Ip5Y6DLa+M4jrDInjHCB80d2WGQZ9fqhiYkSfmd2ZJ/K3cOuMYJ4OIxjazn7yskKdn
         FUJ+JFq7swem8g4WC6UoBBkgeafgYof2eWrs9eZTde3/dOHzfdsSeRAkG0lT8gcqMQve
         qmTcXxqCUiQuh4PgjzYKPUZWLyaXXFAIg0fJov6MwMCcsk5gZcUCAXAHsoh1xIuI3ad6
         vcmfHfaepRzh5tBn9/EUv/uN+WPUfCOuDdYCFhRgi4szbSQGsVgvHDVK5Avvdy99CNOf
         OQctUlbaeQtzSiL2rJOY01QTZryXPn6pi9g7jqAc4+8DrEuCPcd/hcG4GP5XghQcYyzP
         eL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784772876; x=1785377676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTHH6VZpd4mhIdqe7geEKJxE4fPx/kzQsBN80pjk+uw=;
        b=NUeGVAWrOrfE2Nqf/1iiZUUt1LPeCubbH1N4YvoBLX9FIJZHPDaCokjKM06Rf45BPs
         EMaByvzMaFCIsl9gdFaMmfCSqvqldh073eiUbx9gT7iI9/U9xg0ehD/AHw4/mtQp5NK5
         qePmMrRn6ykWoO4UCn4jmg7V/zJPKwxDNdAkqgwEUEj2buaJP56JRn6jG2xOJtl5V/8z
         Rgp6FTWaW9k6HKJiaH7VkGV6ve/YJYtsYVIv400aFETW8GZfz3i+PwmW9YH+RHSCHAs0
         FWDJX13y2PnEwWZ7eFVxOcSnOUdu/pOFKbpTkvfWX7grQoUVvNVCuMA0Jadmi7AdvIuJ
         cw2Q==
X-Gm-Message-State: AOJu0YxC+uiRsdyGtuWKOeh6sM6ka30JxZ7g96kvI+WoOcz6DI/cVrsh
	lZdcvZLBlamso/SHt5ZTS2qMNAtz9gGxSbFvq4K8qy0UacBsrq+9i90kqf8tUHZXvo1wXQhP35M
	0W7FfR6H6JIUG8wVFcK5WRqt0WoZPsDE=
X-Gm-Gg: AR+sD12lmJW61CUegoOUb6tGhhyozS/c3sR+AQJu0XttIoNfi630SScKVoWqkTcaMXt
	O71cNOWePmiYIfcsD4vLhjHZOkAsX0RYSTfN4cnZ8Q77uNuxFlWFjfOzrRBwhNnmtF4g6sxmIy0
	TWWrqsA0P+pjalQxZ/v1NOp1xTdrj8FULHali8ww+i5DVFo1WINGz/wTdsT4UjrkCpX1fpYfMux
	5DgIfkqCx3TzM2FaUqMUSqt67QEufvqo+fiXZa+m8XfcQZfiEYKIOI0Ruks6A==
X-Received: by 2002:a05:6512:3d0d:b0:5b1:56c7:5753 with SMTP id
 2adb3069b0e04-5b2b2f6d2e4mr157786e87.47.1784772876085; Wed, 22 Jul 2026
 19:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721095431.6619-1-linkinjeon@kernel.org> <20260721095431.6619-5-linkinjeon@kernel.org>
In-Reply-To: <20260721095431.6619-5-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 23 Jul 2026 11:14:24 +0900
X-Gm-Features: AUfX_mxFXXIARmOOD8JYwsOMOZ-iftPDfLY9aMdRVBNGzyIDprJd5W7rU0vs7V0
Message-ID: <CANFS6bb5oJT5+XrboQOiOxWQrCwc8iOOZ5v22XGD7_SofjjC1g@mail.gmail.com>
Subject: Re: [PATCH 05/11] ntfs: fix initialized size and page state after
 compressed writes
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 21=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:54, N=
amjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The write iterator now expands attributes before calling
> ntfs_compress_write(), so compressed writes must not expand the
> attribute themselves. However, the compressed path still needs to reject
> zero-byte iterator copies, advance initialized_size after successful I/O,
> and invalidate modified folios after a failed compression-unit write.
> Reject no-progress copies, persist the new initialized size on success,
>
> and clear folio uptodate state when the synchronous write fails.
>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>


> ---
>  fs/ntfs/compress.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index 5b5cd494e5d8..a993cba3b961 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -1549,13 +1549,26 @@ int ntfs_compress_write(struct ntfs_inode *ni, lo=
ff_t pos, size_t count,
>                         }
>                 }
>
> +               if (!copied) {
> +                       err =3D -EFAULT;
> +                       goto release_pages;
> +               }
> +
>                 err =3D ntfs_write_cb(ni, pos, pages, pages_per_cb, page_=
offset);
> +               if (!err && pos + copied > ni->initialized_size) {
> +                       mutex_lock(&ni->mrec_lock);
> +                       err =3D ntfs_attr_set_initialized_size(ni, pos + =
copied);
> +                       mutex_unlock(&ni->mrec_lock);
> +               }
>
> +release_pages:
>                 for (i =3D 0; i < pages_per_cb; i++) {
>                         folio =3D page_folio(pages[i]);
> -                       if (i < ip) {
> +                       if (!err) {
>                                 folio_clear_dirty(folio);
>                                 folio_mark_uptodate(folio);
> +                       } else {
> +                               folio_clear_uptodate(folio);
>                         }
>                         folio_unlock(folio);
>                         folio_put(folio);
> --
> 2.34.1
>


--=20
Thanks,
Hyunchul
