Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A734A3F54A0
	for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 09:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564277; cv=pass; b=Xqh+K3lPsh0FIaMrdQmYuftKA5TuY9/V3jQSe3HtTvEoUDLMNpJnV4iSIBYr+r6YDx/JFwqe+jKW0qm4/kzHedHaxmpp/jBH2bLL4r1L99M3MscDbhVCZt6uqZbK27Nofpo6B2BXQVxsP3PH0U9CcZWLcSOIJoDr1sEVJJ7z++A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564277; c=relaxed/simple;
	bh=4xHMKtt8V2cm/JsM8HD7sviEx6q12i/GwZI9fjEaJiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=saffLmiROAXf0RIX5MxyESsxw5LvugCS8XABlgY2ALM0cgsNz5MNI+l1HOpLnUmhjjPNkyB9gTDw8SjlYovomlYKLCyrNjNYj5wW5eGk2u+BZ8LtdA0Pxjt0An1sbRKTIHuQd1hru7bRjwIS9nPtvjU02kYIzWtWOZDzK2bQ7Gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pUzOygb2; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pUzOygb2"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b0148201fbso2993619e87.3
        for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 02:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787564272; cv=none;
        d=google.com; s=arc-20260327;
        b=ONmQ5X7RUjsk9fClGnZFGT+CwR3h8LMyFX/mnjF6ZKgiZsukLHd9Rpr0Go8lmdXEZ4
         hwnPu9jH3aNQ/i9Jo/iUcjFM8dNjaplKLQnuWMLp+Ofq52R1wWQOBNKpNL1gX8j2k6nn
         v6Gju00uq3lUkquxLnruEbYvGPH4b0QiCq17DUsX8eprx1ig5aQLVca1ryvcRUi84X6g
         dU4Cjb6XMII42DkuZOyI92ayBaV8UQ1THFnxRg9HiwdiAFPmyiFGJeeINcmI+8XXbqDC
         V2WGPrmFK8NZrErKbjum66n49pMc+dvcopMFPdMp15TEZqPBs4esEvX+spQTlZX247sK
         oBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VKUxjeorx54yCRC3ik88xTJ7jmOLzoaUSw6l6MYdEc0=;
        fh=WVBBzL28B1KuZZoJ8ZpjI7J4f8ZmCOVGBZusLiI3sYg=;
        b=LMYfTD5BCnnZB4SUCYqojBkQVS4rot9sdUVE19qm6A3iiPpUugcvT620Bz7YTEwWdG
         btrbE1PmLtX3nrljK2R0j3qljOZAznXrB8nkPgoCUL35sb+ZvTBnhoZ6pChq6m6XNdJA
         gnRqDqXyWRQslyUbpJ8JGB5gIOxsKWGxdHx6y2699G1LGUuGFYs4X0ZeWblIJDZcz6uR
         G0j/hV/BfCyP1nRcIf5NFzJBjB86AGj0/FoepP7jdd6BLIyltWkFsl5haPv3ekNvp0TG
         MwWH7jD6k7ZwH9UUQg5+tFMrDrSRzep70bstEvVdkHf41ZXTmXX8Uz6S0dsPh8P3uwlu
         /J9w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787564272; x=1788169072; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VKUxjeorx54yCRC3ik88xTJ7jmOLzoaUSw6l6MYdEc0=;
        b=pUzOygb2FunZKt9+DABvMOMPSA6rCDfUQcvgbb/p3llswcaj1OXUpvpHpUUn28FKc4
         p1oTLTGM1CoTN/A0woYhe6gIxIQuuPaZ8QBG/jw/+77P48g+vPK5OdZGDXhk5tchJPv5
         CSVIWduArJUoBDFJlGuhpebHDdabcOXuRmVZdY0lM9NmzlxU0dWv5vJJ5VKOaNNGfdhG
         x6tt04VTPaOyMk+sez0LxaHSVH/NDX5ULi0vIzjEtxOWV+k5OWXENfByHafGXqYiGobq
         1vTAcpKMvGhNrox6ItAqe6s/q25a1FStZjLmEpyf9ZS93/DpFZRPyEKn5PC57FLqRU5u
         8qgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787564272; x=1788169072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VKUxjeorx54yCRC3ik88xTJ7jmOLzoaUSw6l6MYdEc0=;
        b=Oa2dVzcCo/l44ffqxMUYCjCZv6+ayeq/bBkEt71pEnofYbM5g36G2WxVuiddpGIIYQ
         Qd91o7Vwp/ZPlbF7rGKRPKRfTWsfeZfG5CSO5aHvu1bCUhmlrxRGALq1AoLQxnEqoyYY
         T8y+NE5xtBXb5UjexjhTHCrEY0+qGTq9AHGBNiVBI0WQ1WsW9YqoDknjNaNhvysCA6+X
         qmMFKQri8NBk3ddrBfAW/iMdU1lpKbuHlIiE3j+yKzLMm01h4cgZExUTel9BsO2U0dwr
         asu6Xa7OD7L/6stdCAd0AZI7/7bSnMjm0oe4ThRH6JIyf1gzOMylzRU8nJCaC8uAc1gm
         fpDA==
X-Forwarded-Encrypted: i=1; AHgh+RpjYa+RO33o20NnfAPeUCwtnlNuQRRguYCkCz02gYSyXhtWVafZUomjeaRTjEfAu89BboDT@lists.linux.dev
X-Gm-Message-State: AFuF++mwv5Y1uVj20qbhCHy/lfDxslZYayFSNK+SKwcCLjMkYSidGihU
	HUV+U3Djq9gLHYhWoRUVXzqWhDEcNU3BBgYKd3JyWB0NWmnQH2UBbWatGa5gMsy3hb1DD83GtX6
	WIRHANFmkBLpRCym3q/imL8nSSGGDGVU=
X-Gm-Gg: AR+sD107TNJOwLIllnvgnU2rmj0WZUxHkx4dL8ZI/j//Uxz9OZ69xfJ5qn7ofqhYivA
	6c5sz6F0v3eM/DvZlSI8kZ25gjH/GffW+bmtgSn9fzEbyKFp9HlSoiAh4Yptvctyflo420wptzN
	XIV9W4oIdVhhO6h/yLl0yDzbz3LW5l+PkpHkgMSwaHj0z+PodsFtjvNQsn8xVddGsiWU69y6RrO
	QqRxRUqAT7LcY8XqHqQldGmjD+wIMzmCxfuwzmdOhicwV58GiiGNcRWV1C8ikpoMfjH2imxNIJ5
	lXH40P2aW7B9fD9jMXdCMwP7674sHB3PKjP3+qRBTp6i
X-Received: by 2002:a05:6512:2c0a:b0:5b4:8658:a401 with SMTP id
 2adb3069b0e04-5b48658a4b9mr8264689e87.19.1787564271738; Mon, 24 Aug 2026
 02:37:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6a8b31d3.6dfd78af.244576.33c7@mx.google.com>
In-Reply-To: <6a8b31d3.6dfd78af.244576.33c7@mx.google.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 24 Aug 2026 18:37:39 +0900
X-Gm-Features: AcwNN1UGZvvDbOzV83Q1Q10bCoIOs3fn6d8t79E9M0tZQL7XSQwKWWjNzE_R8Gc
Message-ID: <CANFS6bb5BHY_XskcC2BoYQnB8iq0J0q90+r08xuANRoJNwHOeQ@mail.gmail.com>
Subject: Re: [PATCH] ntfs: mount read-only when mft records are smaller than
 the device block
To: Dennis Tighe <dennis.tighe@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dennis,

2026=EB=85=84 8=EC=9B=94 24=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 2:45, D=
ennis Tighe <dennis.tighe@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> +       if (vol->mft_record_size < bdev_logical_block_size(sb->s_bdev)) {
> +               if (!sb_rdonly(sb)) {
> +                       ntfs_error(sb,
> +                                  "mft record size (%i) is smaller than =
the device logical block size (%u).  Mft records cannot be written.  Mounti=
ng read-only.",
> +                                  vol->mft_record_size,
> +                                  bdev_logical_block_size(sb->s_bdev));
> +                       sb->s_flags |=3D SB_RDONLY;
> +               }
> +       }

This check is performed only during the initial mount.
A file system can be remounted read-write through
ntfs_reconfigure().

Please add this check to ntfs_reconfigure().


> +
>         /* Initialize the cluster and mft allocators. */
>         ntfs_setup_allocators(vol);
>         /* Setup remaining fields in the super block. */
> --
> 2.43.0
>


--
Thanks,
Hyunchul
