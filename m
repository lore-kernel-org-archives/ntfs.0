Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438FC3403E8
	for <ntfs@lists.linux.dev>; Tue, 22 Sep 2026 05:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790054716; cv=pass; b=DZo/5H3k31qXmiDuusnwdldB7Mu/rk5dLKXoGBgZfiITO3279NQbH9S3XpfX6QOZEJP5vF3EAXwGCuA5fZ9oIfuKKDoTwRqsdIOysyRoQMYESrUHBHnXYZLfe+xBE/EWWBwSK/tijKpHlVepRxZgiJmiUN9A/oolSRuV5/JsZ2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790054716; c=relaxed/simple;
	bh=0jd5cLTp3SOx8GkiEE9xyQ0WO5u6raBQoIhOrOBec+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTpaf0Io4L9LGoALCc4O9BDMD5eZNnP4bcWx51g+jPgFWFTX8Uka4q4aRsiuvxLSoQXqF48MjmeOPgfuXymhG4KugVrG5pe8LNJypXl3AWnueK7RiaBmJN+41eu/Q36BjrfcIrj8Rjeg8u0QWwjmXwizUz1DIYoA4kY/HLsCzDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pLlxBIFf; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pLlxBIFf"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so3445441e87.1
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 22:25:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790054713; cv=none;
        d=google.com; s=arc-20260327;
        b=SUQ1wYHbYZhF8YK12TIM+oETzz6oL0e+ikTJtkJtSAscqwAnxhJo0GOG23Xz+ZcMcA
         FkZHUgIeyU/uSVrBup6U4K/e4wYiOlOj/WhDqLAh1Xoc90rPRk+H0X8H55F4tGZjpefa
         yIRYOVy3OEJrghYeCHAkCi4iVC6kAqvTSsnjgPol3E+0NOhOc6lIksxc4my+1aoNpzzM
         Muc9mlxNWRJx475c0vh+lqCAMRXIzCRa1Bys6yBRMXIF2aV5OXuG4JthIvfR8PG0V3Od
         XpCgoeJaGrqKiM9hL3c+AYPbkGTS0xqOwTSozzDhkAZev/o/oxPKpKUkrXclvtrQwiU8
         HiXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r9A3FUQiYasXz1fvdfMOXzL7H/dvBBeexZCJ+4qyPew=;
        fh=N8Kh5S8G+jWVZOIakPfy6BNoBIB9Q+meVBM8ULaWW9I=;
        b=e0sDs8Nzb6Be0f3hcf2haha/x7sbdd3A3D+9Yry1MULGvL6GfEb1X7BJuRo+O1mvr5
         Qd0IyjORFOQKqZYvfpH3iZ//ozCRwml5f/LkrQ2BLU3V7tZnuZzhN6mRKj0JHLXk0Cnk
         NQ5ZcMA0UzadZkMBAdN7NtlFmOqy6XwZsM3Gd9sWN33WgSp+sTnNYTqc/5eJPKyO1nnY
         5J/hSMIa1cVRA+DUcst9/5krKT6gDwYAHas1lQ3kTwK/mWPK+ZJpdT3kYRLG58cMeFiZ
         F76iiZkQk1503UuPjUgqDGm+ZcafMiY0arY9ujkLo1FigL0LTaPeQ4vLtZktbuq+TIGL
         ZRZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790054713; x=1790659513; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r9A3FUQiYasXz1fvdfMOXzL7H/dvBBeexZCJ+4qyPew=;
        b=pLlxBIFfymt2fESsXcU6aMpGiW4iSXS0s3iy7hgsaYUOAQb1mPTUaDE9F1oyEYj4RG
         jPZaD744NbL3H9sjDXg8gaAopbag8eih5O3XArPrVHtqDp1MFfJWaZWQCW7V2iwaqlm2
         cXmLIzg4Y2y9qeK4JSjTjkm4O0z3SrLwJLlDgNdXqQveRUM2NqDNIMrhbgyFqqyS9pno
         C005X0IzZJErEqIyyINugISoaehYF5OsVHgLX+0g9g180IT0M//uPZzie0Hn7OliJWu1
         KZ3EtRKosBhYPdLYIrzIgn7jLdBctpa7KCEQJV+5ZzI3fF/6V26pN3lAkqOnxly2Exv1
         QS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790054713; x=1790659513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9A3FUQiYasXz1fvdfMOXzL7H/dvBBeexZCJ+4qyPew=;
        b=W81liUw13OAD3GP4Q5sMTliLsqDNoYdgRTPKu5UiA6lAPFwBadstidQ9mb50TOUSqw
         x/qmgC4FeQ75FLJ4bzIiSo4pPPIL9Jg5areU+yWbpKSu5y2WdPbtIO5LqJ9tuF3Sdjf8
         U34I/BQMcIlcpUGFqr7MazvEohqm2xewJ77izdu2Y3Q6lXH2DXDR+WaboIdy+DmhyHme
         e5kDmKxOlBRF+52qCo+Md8wCxmrrhhe4OpGQI0OJUqNG6LpdKCB7kto07NQOAqhWnauM
         njT9PIwDArKzZFxhYfmxgwsHNtyvjvkVClKrdkee2wJgcSWxDTw1haZOeacz86pjA6nK
         Gr5w==
X-Forwarded-Encrypted: i=1; AKwUvBzdrl3NvFyPrECrJrguRxyWw9iLC2ZetL32TwT2BC8AhHa4pI8rJbsuq4cwIFiXcNky4A1x@lists.linux.dev
X-Gm-Message-State: AFuF++lC1TzfBOgeQU2ZAsWiNVkkXaD6AUcjQxvvE0jTu042fQFdWApV
	OIkff7EmTEkboXrPNdlG6L0WXMQArXnI7AJz8E440TvSltKJnp24xnsj3Asfvm4xyOfJ/eY1FQU
	IItSTBcoUff9A5vTxM9ZhP8uaBP3OKYQ=
X-Gm-Gg: AYBFou2CwWOvHh7qCrfl1yEo70IZ6ejBNgHsow2Yc1uzXa+kSXbVcO/rBgCEHPmGBo4
	cobtx/4GQX+4mDFG4AKGHbNyNjwyHvpn1FZ8smomz22hiOd/mDE4W1DckNnGTzIuMAW9tjm9EHu
	xPUyVQktiduX6a7eN45z/6CtYcTaLX9AnxEHLZshLdO/s1U7LbgWVlBMSnc/yU2VR4fceKxw15c
	aCOggjN85eK/3BvnHy613/veDeQps/Vy5PQQtMsr75EC5rtklRPoy1c7FrwalcGboWQxc1lfL7J
	KhCT3ADZxqQtrHnSVfxb955huZHFhMLGgQH/0t0ecfq6qc8fuBf0rTM=
X-Received: by 2002:a05:6512:2348:b0:5b8:9a84:74fd with SMTP id
 2adb3069b0e04-5b8c17ee9ffmr4248097e87.4.1790054712894; Mon, 21 Sep 2026
 22:25:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260920083131.1880061-1-liubaolin12138@163.com>
 <20260920083131.1880061-9-liubaolin12138@163.com> <CANFS6bajYthoK3asS3PmfU+9aocdsHS9ZFaUhmiKV5BfbaygeQ@mail.gmail.com>
 <250dd5e5-4a4e-4547-b205-f0b52bae4775@163.com>
In-Reply-To: <250dd5e5-4a4e-4547-b205-f0b52bae4775@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 22 Sep 2026 14:25:00 +0900
X-Gm-Features: AclHuK9DpvIu8lP7A2qR74y5flfN5b4SPq5kUNXAggxDycWJuA--ecJM0kIN7ks
Message-ID: <CANFS6bbM-OpYLoRvQNAhmo-FNBd9V0K7wEt6iYTc-6cPf+2uEw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] ntfs: persist immutable in the $LXFLAGS EA
To: liubaolin <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chenxiaosong@chenxiaosong.com, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 22=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 12:27, =
liubaolin <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
>
>
> =E5=9C=A8 2026/9/22 09:21, Hyunchul Lee =E5=86=99=E9=81=93:
> > Hi Baolin,
> >
> > 2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 5:3=
2, Baolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
> >>
> >> From: Baolin Liu <liubaolin@kylinos.cn>
> >>
> >> Add a fileattr setter for immutable and store its state in bit 0 of a
> >> little-endian u32 in the private $LXFLAGS EA. Reuse the standard NTFS =
EA
> >> attributes and restore the flag when loading an inode, so eviction and
> >> unmount do not discard the setting.
> >
> >
> > I think that the name $LXFLAGS is not appropriate. the prefix $LX
> > seems to be a WSL-owned namespace. The name could cause
> > confusion or a future semantics collision with Windows WSL.
> >
> > Thanks,
> > Hyunchul
>
> Hi Hyunchul,
>
>    Thanks for pointing this out. I agree that we should avoid the $LX
> prefix to prevent confusion or a future semantics collision with WSL.
>
>    Would $LINUXFLAGS be an acceptable name for this private EA?
>
>    If you agree, I'll update the code and documentation, rerun the
> relevant tests, including the Windows NTFS and CHKDSK compatibility
> tests with the new name, and submit the revised patches as v4.

I agree. And others look good to me.
Feel free to add my review tag for this patch set.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

>
>    I look forward to your feedback.
>
> Thanks,
> Baolin.
>


--=20
Thanks,
Hyunchul
