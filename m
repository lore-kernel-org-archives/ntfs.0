Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014F845A288
	for <ntfs@lists.linux.dev>; Mon,  7 Sep 2026 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774736; cv=pass; b=cR24V3bvpyrduCCFwpqoVKSgRVtSMWSZBsxX8h3cI1Imz8h7Rmt6j88HmhQKOl8ZEHFlzltMpCrCXFTLC1bEtP0znEUo3d3wNR+YzTGG9a+7bd9BW3+48QKHlmRU5KsH1G1GXqPsEE0h5wFlu1dq2zKT4mNwnVfH2WM632YDHLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774736; c=relaxed/simple;
	bh=3xW3efaKmi9Dz9Vb0WuWLDIqg0HD53iZMVu4vjA+zeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sbs2hb+zwkRkyoQeLwV0KiDrU+qpEL2aJ9Y5ybZOoJ22Pvovo90Jp/IpYMjK9vgrdfi089KDUg+CD0PMv4aJeMgt1Rapt2TcA5PAx9DOspNQTGqG5Va4lVZWwI/0+9bjJpTjuIYBom431JvxJ15DPhFiet2S+0d43E/DrRDo2LM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Okv+e10H; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Okv+e10H"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b75858b4e5so541359e87.2
        for <ntfs@lists.linux.dev>; Mon, 07 Sep 2026 02:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788774726; cv=none;
        d=google.com; s=arc-20260327;
        b=K17k/NeTcNyUmGZjuLsKB7ZaSop9aUAyMKyWf/L5fzrljQId7ZYGcCFpGCKCxlPc9/
         IsM+bhnuyUki6lHRUMqjHDcA6uLKG8da9EI0hTLk7y9VWovcRsgO6x6gzFYGpFH72JAw
         BUWXJAIafv1Q3UsmHD2YeAXLARzPpndacpDnK4IhcsrI2GNwOI9WGgAYktTYt7zdHc8J
         yuQMKsaaLawYmfJL4dBxbu7v/JbD6f9nxmyrajS1YB7A/IG9Qi3r6arKgqfPzhpyQnRa
         K8PfyhyNzldPHcQN1AcELUwAtHSsAkj8GTMPLvgeTLM1c6oLm9XjrLys2v8cNJlpYril
         OdhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZBjOJo7EwsCWCLDF7JfKkzJJNA5g3AFjMG4w1eSnQA=;
        fh=4GpLNtuw+KB3Y72pe/qZcIEJFBTtU3sJx5SPOSlqlJo=;
        b=a4AYxWFvWoWN1UqhayTjnNlnPVc6e+9d+hj3prY3VjoQR3pLlPHvXl65W4r3pKEu3v
         KWPOIhSv0S8R9p1uRWoNXgdh/X/QxxECaY38GuNFi/OuUEQS4fj7p4DokdFg2p/X9aTC
         RQBdzUCsgS/t1L6vuzts0CzlgNnuyvLJk4bH1sLVYiMAhdcWJ3yTQAeufI/1R2t+wSy7
         DtDjhm4hYGHGrt3iLfyYMJMZ+UDyKZt0pfHMOR2uv84768kNkrRGU9rLYOU/QLRKATeL
         yT9P0kzLYK/Esar+ofw6B8KS5Yji+ZmHXeIs8RhWc/PuJTAJCdZUm5XyiFg9tJ1DzoMX
         IFqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774726; x=1789379526; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZBjOJo7EwsCWCLDF7JfKkzJJNA5g3AFjMG4w1eSnQA=;
        b=Okv+e10HtJqjOHkY2LJztqvUDxpEpvuj5hqBfRG6bRCF/91FArgTklEAxeNRdXjQgf
         S4yJUku1LRS3gEfQRgxDOVaOkWPbaoAa6kS+fF0UKpc1D1+pqVjEYKHJ0v62p/RFfjIr
         U0drFdUPaHI0/uEkRl8zH9QjWR9GLfGUj901T+vvTAm/CG6+U3YvsISdcIYRAPUaYWwN
         Sce99g6qO5weKcfouK7h3oj771XN7I3Qus4Niieh4HPTtD+f10mIDMYyK0t1tg7rEVQz
         x1pKHyknW8/hLc6v1+TBX2PoJSVGOumFevHo59iiqGHKmGh6Rg32Ex3vHiS0Ab0ebhkg
         2sZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774726; x=1789379526;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZBjOJo7EwsCWCLDF7JfKkzJJNA5g3AFjMG4w1eSnQA=;
        b=SnuJC7HFUsxMSF6tnEhnBvVvNH18ZSn/oIwp+a/DfqAMIOyeoBbBOkLTXDqlqcWDyS
         OIMXZ807Oh6jK6ftJ4GX/3dFBLS1q0UCqsr5m02/cl5FyVltRQ9DXPstHL6Cjbx82J3U
         bThrp0oxDSBnFKlMy2t5TW6kIBB3Lbn8mNo6nwbMvSWhlbYIoLmiybGZmzLgo3XcQbdF
         EW1bjsg7i6fejoHGhtG1nG1F7COs1bDA0B3TFNIeOvAD0Lp9Pt45zlbzd2OeaHLcoCqc
         aiyzVV1gE6xLgb84LSBTGYakvop273ns4Rv7c/wYhWK7P61kFOgoRDEx8XflbXTLbjn8
         KqgA==
X-Forwarded-Encrypted: i=1; AKwUvBwhNCeWPao6dJ2vIsmEMWwEaPyg5QCBH/72gY46rurkTvJheEiJKb+ikc5TUARWq+Oxlwke@lists.linux.dev
X-Gm-Message-State: AFuF++mcY5KUdOg2biefNYW4qIUcL+X6Of+n2sSuLiZu6kcv6HG7M/U0
	Bk0ZzhiNvUWK/dS+40t8KgA12+5G2MvOTnwT6QJhPukEa7LlVEyhjSYh2zzhnGLskDXpQq1RHYm
	AajW+5Zfx02D20qOj1rwHdROfshKsYf0=
X-Gm-Gg: AYBFou0Ivp3AGU5xviSJ8IkOCSaaN54ifxIywo4WS/Vfei/g8rjgbgcSt14ZniIvEOA
	YDfJaMd82RGbHlQ54PT1YrUnYoIihAylW15NxsGffNLFze1/uZT34jl0CeN+fDPHFDNTo31Iy9q
	oHYSapTGtJplCgTEKMgfGeXTjEM85/bxav47oaWP8Ap1mqPEoKPE6hOqzOZbgzU0gfFkq2slDQf
	wvqZM67vo9YrFXQMMYwrlbf7XNyhGnLMtdRN9xbW503JVRE8WJ6DA/82+uWLIJyV7l4Xfhw0AZa
	1AYAQOyuXvQAhKNtIbSoQaKs+oh3Ud2hRNoZGjfA69eX
X-Received: by 2002:a05:6512:3c97:b0:5b5:e2e3:4dd3 with SMTP id
 2adb3069b0e04-5b616f325f9mr5904093e87.20.1788774726258; Mon, 07 Sep 2026
 02:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907035726.37123-1-zenghongling@kylinos.cn>
In-Reply-To: <20260907035726.37123-1-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 7 Sep 2026 18:51:54 +0900
X-Gm-Features: AcwNN1W35E_APW41_zojqmd7aUw8N6t-AJaJP8-EqtmOcwckOy784z6QuVWrJKM
Message-ID: <CANFS6ba6VqnDTXeUzBPDEKTzVK7kMHLk-sitncT-oGToVQ0J6A@mail.gmail.com>
Subject: Re: [PATCH] ntfs: use fatal_signal_pending() for fallocate
 interruption checks
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 7=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 12:57, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> The fallocate implementation uses signal checks to let a long allocation
> loop abort early.  However, signal_pending() also returns true for
> TIF_NOTIFY_SIGNAL, which io_uring uses to deliver task_work completions
> to the submitting task.
>
> generic/616 is an io_uring fsx soak test that issues fsx-style
> read/write requests through io_uring and calls fallocate() directly in
> between.  A pending io_uring task_work notification can therefore make
> signal_pending() true inside ntfs_attr_fallocate() even though no real
> signal was delivered.
>
> That caused the previous signal-interruption patch to return -EINTR for
> an io_uring notification, which fsx treats as a fatal failure.  Switch
> both checks to fatal_signal_pending() so only fatal signals interrupt
> the allocation loop.  A real fatal signal still returns -EINTR, and any
> other error still takes precedence.
>
> Fixes: 4dc8f4ee2d46 ("ntfs: handle signal interruption in fallocate")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>


--
Thanks,
Hyunchul
