Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A332E8462
	for <ntfs@lists.linux.dev>; Mon, 27 Jul 2026 01:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785116985; cv=pass; b=CadxB/8KdASRXHIUcubSZkfIcyifeCKiRC2tfqEy73sIW29ubzFInnZjBSNNy2OHn61KOPsfs966+gAHmxgiKMcJyetALca43zz8YjedBACTi2yy84Z+9GAPiKaakWSUAvrpU9a0VoVhCicwnWBdRicCKP9jLrXBUL43oF9neyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785116985; c=relaxed/simple;
	bh=tjWmZFN/D0b2H9VDh4/BMzmeqLxLXwI+ue3vaGAbQD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMpIIReqkwdozjAMfNyx9v4HeTmCTWh3Z3+WJzjLo+z8QAA5ngdAijQXwPFeCtNRbE2b+3k2/biojLPGoEWYkeUK6fBb6PRmXnMN2ZhRUsLSvgRXPqcB8gdBbdaSjWORnMah8vTIQ0/hzkxfVm/hV3GopAQdI9BM41jbW8dQUr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvv3WXAX; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvv3WXAX"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39db07589caso18589551fa.2
        for <ntfs@lists.linux.dev>; Sun, 26 Jul 2026 18:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785116982; cv=none;
        d=google.com; s=arc-20260327;
        b=KwgtEgzh3QllNXoBaG79E6HYQGaW17KfdYl6Mkt/0RNoGr2aQJYW8/aC1HUZrZw+OE
         xh08SsGeN9H/QPjd6AmBevk1L3zxho3qyUm+GFyZYZa9GfPOZgv1SXgHBEjwC6tNUDHm
         6/SbLwXUXF6PgZSdw7+hevDi5NYs+HMk7L3K4LDmMFoh0nE7HbqaWthBV3F0qAkWjWDx
         AfzPa/5UrDFiPWZK7pwp1odr8KZ0b2XEzFZp16XO6mnn9vDz1umiAyES35BRaRVWxS12
         4pKygPkKG/L9Bgvlph2HmcUhZg38IKwgVTEYyJqntIncljqEwyjwl+GyFov5NdDODGfE
         2mjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cPizEviKlGHtPpBvflznAAzndpfzge8K3G7E2rbtD08=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=YMi/4uUnbd7ZoaApcOOZdPwG0dMQ0Y+HkDDH+TWeb/p2vj0RfspB5XBhGh8S71uXSB
         OTcUB+4a7yRczbnMJRH9WOSuVAU9OSgCcaCo7PP590jRKhGk/efYssfBV//CcvckFP1g
         48A7Vs+eEgFbkFzB+qEPafjlyNeQzP9N+bGfJUq3nwORxmQe+imU4YofS4ko/DRHaKAa
         V/qZD7yQB0fVt2QokbQmQSRbY0CWLTquZ5em/p7I1mZQyZPXSrp45oUpfUIY81RddgW4
         qPpi6MEAgu5ZXbxVbp4A7EpTqERf7n4S33c/Fkt/Yi7uXkjqtCBP27qJmPAf0tdJb4vu
         UWNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785116982; x=1785721782; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cPizEviKlGHtPpBvflznAAzndpfzge8K3G7E2rbtD08=;
        b=jvv3WXAXEPk9KSunP9fB8ghwofuXdRcmbgtTenQ/1veVhTh9ZmxQPyjt8oeI3FbgCM
         nmAVff7tWSB6YFO/WBRMieCY2AJfjdLKU8pU+tF1pio6igVrjRKdq1JBjQYf3jtecYDM
         LI4IcA7aKfFTFFMCduxQRjsfyjC12fgSV9UsLcChXJ+H5TLCz4qI3MpmRXt9IuMGCc9S
         ij4k9qX/rGbbcLwA04gwRkAUDitm6L8QHKWH5ANX0MAXLk0j0aQRiDsCqJSHF+NkAg5E
         O5ntz2JzM52Y6m20iP7GU0NcgyxKQVHDJI/X33gg0DwvOc4E7YXbZ9cX62JE3PLJ/iVf
         uSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785116982; x=1785721782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPizEviKlGHtPpBvflznAAzndpfzge8K3G7E2rbtD08=;
        b=UywdmvrHtL5ALPkw5x2Oi7r0T3kSa2T8qxTpnnogkUEEnMXclCuhmwB2Lz3HFUMGg1
         h+R8IGwgHq3xu0lWarqDnmJduq5hjizoNjbsp8aUnAbBQWdXkmSD59K+qRvClZ5szD4s
         jJTwix21p17bQSM2ex8+lTntrQmuhmIJrJrVALAStC24MKM0GYuXZItdE6Gsk8a2x0Hu
         y0C2cw2spPVntWddose3WVKVbG1r0DkkgQGZ5O8zkI8AOu8VPjW0R22l3iVx6IGm6sU0
         QLtbSPf1sSKv+WFBmsaH6bOw5AmAPMPYgtRZ0UtkGmB1HfC49zIVK/TMYPWRMLyAorwn
         rWQw==
X-Gm-Message-State: AOJu0Yw8HaagXoLtzT0RxcvOJbC9ecgkbfI9OnrI4kwufj8Gz9qVj/V/
	NL9gc9Riss8coo3adnjl+xH9/9SKpIOuoyyp0qUrZf7dM6KN0XBzJis/U7rG58yV5ZOF0crp/2F
	hU8LTicbVmrWdv+yEEyeEWGK1HcVCQeP2qhgP
X-Gm-Gg: AR+sD12T80B5tnmAlBM93Od4qBXt1p/i6MiryDo1S+dNdoLCOU8+ca5uoQWh1+gO+tE
	qaZg23J3QEUtzrz1TxfulAjfQCHIkshBWZ+oGv8EfjxBWGf1pdmuOAOV7SxLknsnxClnRYSOWZd
	QS3fZ6amG3PiAVYKx8B1Djf6NC5IRocZGSUl6hHO+NOzL5j65b/h4p6fDFPK9mRxIfAEWvD++Pq
	5BO3x5rKtBJTqj+dOcKDnJBqNQ/yFEv1WJaT7LwXo5anoHgYJPnNstbWPw4aQ==
X-Received: by 2002:a05:6512:61a1:b0:5b1:5b10:523a with SMTP id
 2adb3069b0e04-5b2c1b5181amr1030106e87.62.1785116981379; Sun, 26 Jul 2026
 18:49:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724154900.21524-1-linkinjeon@kernel.org>
In-Reply-To: <20260724154900.21524-1-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 27 Jul 2026 10:49:28 +0900
X-Gm-Features: AUfX_myK8GVa7VXw3TFx3qmW3VlqYh_rX_GCulKRi_Pnw_b1bIKajABTjsfGsaI
Message-ID: <CANFS6bYpvf=zCmj+pe=xQj0C--K8JX0AYPQ8OKXhXyYwb=+6Fg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ntfs: apply Windows name checks only with windows_names
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 25=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 12:49, =
Namjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The windows_names mount option is documented to reject names containing
> characters forbidden by Windows. However, ntfs_check_bad_windows_name()
> unconditionally rejects those characters before checking the mount option=
.
>
> Move the character validation after the option check so a default NTFS
> mount accepts POSIX names such as names containing ':'. Mounts using
> windows_names retain the existing Windows-compatible validation, includin=
g
> reserved device names and trailing spaces or dots.
>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/namei.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
> index cd403b1d99ee..aee7aabaf059 100644
> --- a/fs/ntfs/namei.c
> +++ b/fs/ntfs/namei.c
> @@ -61,12 +61,12 @@ static int ntfs_check_bad_windows_name(struct ntfs_vo=
lume *vol,
>                                        const __le16 *wc,
>                                        unsigned int wc_len)
>  {
> -       if (ntfs_check_bad_char(wc, wc_len))
> -               return -EINVAL;
> -
>         if (!NVolCheckWindowsNames(vol))
>                 return 0;
>
> +       if (ntfs_check_bad_char(wc, wc_len))
> +               return -EINVAL;
> +
>         /* Check for trailing space or dot. */
>         if (wc_len > 0 &&
>             (wc[wc_len - 1] =3D=3D cpu_to_le16(' ') ||
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
