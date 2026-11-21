Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795226296;
	b=okM9zOaZUSc6KmQkUr1PJu5IKfxLoik7ltuM7tqUyQtd0zVApHAqXTNLaT6vTBcte4al
	 u6waJWivprC4V61GizTBVDdXvfzjBdufLbFcwlNSGVEi9X9yhmy0cq64JWpVrb+hHhVcZ
	 sfQTqSmLkIjFnryO/SViTsh/pGCjo0njI49x+0SvhfZZOhxfaAENFcNQpmiUIDVeuhJrQ
	 hseq0fVdsQT/MMFq8flgnNY1b9udTlyvfdJLl3/0Ih1cLWBzECB+CKWGo4n4COuzWmOw+
	 fIOD1UqcAGqBaez9BEXD8EA495W8XM6EPp3tk+IfpgLUjkWMENdkKO+mi0gso4YS1KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795226296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ViePrhkW9tmaFAR9u/XBSqg02m0Nj6G4/uTmbScrP0M=;
	b=TlYDXgPPeXWVQpEmpqH/Eiw+X5HV5UupTbGBWMvZpc8d/+Np7wTE5ejbnSFzERjNcfem
	 dx7mgi8FFW398kC7AXd+j+oi08Y88jaK7iXX3ODtt66HfaG+UlinZk87BZg06bQHT3Bw5
	 AM1ocJXB9xgo1qajRHhM3nljWe5TrxF0xXX0Qv3uDo6Ku4m5fARuMk2JyGS1rsnkVxsaz
	 0FWXJmgtJqD5S8fjuf/WfClMla7zvGKofnVyvkJ23f/SsdMA6hXMz033e2z+7NHvUjBM2
	 BWz7ny4z7ne3NZ14IASvIsKjgNsMsBtfBBbWIwWHrIcQ5M5dl42tSu/VTY5mXUbO5WQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QaZjW0Bo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB552606A6A3
	for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 01:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB552606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QaZjW0Bo
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be47aa555cso1797445e87.3
        for <ntfs@lists.linux.dev>; Fri, 20 Nov 2026 17:58:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795226291; cv=none;
        d=google.com; s=arc-20260327;
        b=OfCG337ZRjF74LqPwIrs3j/KZNkb5y/SHN+ce8ofYkUlI7Ez5yIsnfBtv3LVHbE2aR
         4EZ1QDLnJBkRX6H+BUv8UTAbfJXxzlhcW47a5jtxb0M4xpXIEQDuQQomqRRGHm7yKU9f
         JiQeGtMZ2NUhYkphnBd1d2oU2a+yCuGuxfFX+O/OhsDNutqaRS3Ah3FkA6iA3n7xTVQH
         BAwxsziWh85CkHDQFFZkAaKpt/MpOdi/uDRexGfJsKeVlHaMvvjuU23BfaMr+rsGWZBJ
         eAT0UV3JE2ZnIo6pbvMvOnBHZ6N5NVVsKSYB4tZMIsdZCpOaldoF+aAV2RraMWdOEnz9
         ELMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ViePrhkW9tmaFAR9u/XBSqg02m0Nj6G4/uTmbScrP0M=;
        fh=Kgt/eRznQ2OUNfHerOyY2FfqKSjuj8XuethdPyx9TwA=;
        b=Cs5PHx4Qsw5GgjaxBUBZwijUjaWLBN/Wfdry3gxq1RRQ3BJ6+aA2oRTVp7+vMSTHWF
         +OyAL7Quf75h0nJtA/26HkJ366Zz4uicdgh4CF3cFYddH0jXBs5UtororIaSPe1WEJN2
         klis8dZeeMbRw8lKKXjnOSX8LC2o06+AdIts70N+oazmi8oMpw3pVn5NabE/voEwgfpX
         k+fM4fcE6SqnP5gMAGTUa6vMK7OQSjwWwlGWDXrOqo1p5UgLZtjbT4MfkdFuZ9RNQ7nh
         JfC5mXykwrREkbE3/WiM5qaIvtLIrT+NZGQS+z8BdTUjMhuO5PCU6vgMR4PK5i1R+tMs
         R7CA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795226291; x=1795831091; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ViePrhkW9tmaFAR9u/XBSqg02m0Nj6G4/uTmbScrP0M=;
        b=QaZjW0BolCStLVtQere+5uGqAIR8LBPDa+GsmWKnG2UndntOnlfK183PNdey0GuZuj
         PBE9aVSdAbXD2zrexr/vO+e5HbwyAWiTCnx05tTVP3M1wpYFoyVUsleaiWXQp4MSj4xN
         np6TB2OIC13/gro6ABFTf6suYRYv8ZqobX4NMMBGhTq2teQXoZeA44jAt+aCA1cXbhxs
         GcyMggkI1PziAzVAbyW1mtzXx1U00TzTDAt9K+5U3cF25Uiudd6+sJopBuPpACxNPq8F
         m7FuLY/Pnw+89lTm+HbWL3UIqPCjkbuoDUXyZbr6edK/9DvnQ8Khh46xUXRuOIPpTua+
         hr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795226291; x=1795831091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ViePrhkW9tmaFAR9u/XBSqg02m0Nj6G4/uTmbScrP0M=;
        b=LtFY0rTno9fGl7IPQB0Jhw/zxSMgXbtK62TgPT3CjVeYqApgirMXZAMae7K9oMHco4
         g/7BH5I2Kwgr3tM7L1EeHjl3jIJRzJYezM1FohLUwfzItE2Fhc/5Y8mK/dWR+mvhpWeY
         e32HRojHOI3ZgwjPN78aEfSUzhWwekrqXieWKlHqYy8hnnupH9pWAE9SlGS47BdrkOgu
         +PDwTfOVJqooaqc50jpzssBtNJEZnSUgES095J/i94iYdjC9YP3HPrdzdEf3P8V3DeC9
         K/Th2By+g7KkgyzyQ4eU36heAakBag2rPLcxex3emkOQdD9EWg1bUXLyzXTDj8Yom5Bu
         iZ4A==
X-Forwarded-Encrypted: i=1; AL+hErHQVgvEfV7W1eId2zTD5ix82qbNrtO0fCudnXC7uGPHBx5eyOkpaL6malzkjAmNftSF2FQQ@lists.linux.dev
X-Gm-Message-State: APuU4Z86QOZpX94mYEYXsNJ3P1PIH43RXod/McVYrLgLmCX5UZw/ncC8
	VD0PxoV1SgRwg6XyIXFlATWp4VbkbU5II8HE5PEBzFFU5nKFgynk3PZK0NYNNScIUZeQrgBbefK
	p9nOI1U1Sm8gmzmC0j5xH7L6r2jAdwts=
X-Gm-Gg: AZFdTZekvHp/bTHN3LFf0qMIMqbptyn6LHuqjavNeq501DU2BDz/ogMxB7RzFT5ek90
	K8pl+wKJIHugngi3zt11G7edxVqtT2PAQiL4fvDGS+WVEzDxUvHSIp65bS2+4uwV3qsNXq0z9Kk
	1ctlMNutFcqVh4RXqXcWqWFrDxM4ZYloF3xgxbSDZG0BluU08+Va7uIEZ3KSgD9/66AONTkTA5c
	OJDheWgRpRT9UeSH4/zl2ZPSrX0gAscT7IyrOfhcv65jWpIUeAMe6pTUBCblFO5JpMZIsPz3Rx4
	8Z6taIFjt8EmDbRuLcR+5d8tOWkuJRmU/35M64+iGGpSulty+iLMd3d7nGBhaer6tz2fbSPIQqq
	8J+UFZ7TsosJpvjjTY9qlNiVGXoM0SrKbZm0/
X-Received: by 2002:a05:6512:3c8d:b0:5c1:ac77:25e with SMTP id
 2adb3069b0e04-5c1bc7bcc06mr1704756e87.14.1795226290518; Fri, 20 Nov 2026
 17:58:10 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120155021.1618964-1-liubaolin12138@163.com>
In-Reply-To: <20261120155021.1618964-1-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sat, 21 Nov 2026 10:57:32 +0900
X-Gm-Features: Aa3M54pm2AqGJ8rfhMyI-qjsY_0TNOQdzS6bz0LFsIAGC_D4K0CAlmgi2iF89qo
Message-ID: <CANFS6bZHFoG-6tmH2squCBbfzEmfGsfcfuf5HRVq5S0=qhGHxQ@mail.gmail.com>
Subject: Re: [PATCH v1] ntfs: limit MFT mirror comparisons to system records
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, d3nchk@outlook.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 11=EC=9B=94 21=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 12:51,=
 Baolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> Windows 10 can leave $MFTMirr records from record 16 onwards stale on
> volumes with large clusters. Comparing them can falsely report
> corruption.
>
> Commit 749357bd48c1 ("ntfs: mount hibernated volumes read-only regardless
> of errors=3D") made these mismatches force a read-only mount even with
> errors=3Dcontinue.
>
> Limit the record checks and comparison to the first 16 records within
> the mirror, following ntfs-3g. Keep reading the full mirror for runlist
> mapping and location checks, and leave mirror writeback unchanged.
>
> Fixes: 2beaa98b46c4 ("ntfs: restore $MFT mirror contents check")
> Cc: stable@vger.kernel.org
> Link: https://github.com/tuxera/ntfs-3g/commit/85e208176ffd16ce9a51a9f534=
b194f0ebbde6e3
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/super.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 98e6449fd79f..103d2b1b630b 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -1207,6 +1207,14 @@ static bool check_mft_mirror(struct ntfs_volume *v=
ol)
>                         ++index;
>                 }
>
> +               /*
> +                * Windows 10 may leave mirror records beyond the system =
files
> +                * stale.  Read the full mirror to map its runlist, but o=
nly
> +                * compare the system records, as ntfs-3g does.
> +                */
> +               if (i >=3D FILE_first_user)
> +                       goto next_record;
> +
>                 /* Do not check the record if it is not in use. */
>                 if (((struct mft_record *)kmft)->flags & MFT_RECORD_IN_US=
E) {
>                         /* Make sure the record is ok. */
> @@ -1250,6 +1258,7 @@ static bool check_mft_mirror(struct ntfs_volume *vo=
l)
>                                    i);
>                         goto mm_unmap_out;
>                 }
> +next_record:
>                 kmft +=3D vol->mft_record_size;
>                 kmirr +=3D vol->mft_record_size;
>         } while (++i < vol->mftmirr_size);
>
> base-commit: 4862a81576e3b20ba40cb94a38c5df0450047ffe
>


--=20
Thanks,
Hyunchul
