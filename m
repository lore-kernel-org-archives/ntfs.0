Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA3B331EA8
	for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 05:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548100; cv=pass; b=Lh4FJmqHxWx2Oo3u013mNVGMvl3RhmC9JgACWOg8qW1pNw2eVqS6YzK8g0m8aldJdSFoYkeu6a9bSnANeiFdy625JE0axi+VdTz56K4SsESnRkxtomVR9bRliyxyVO1Q7R+EsEHqL22fqxeE+GY3NcVQvJYPQek5LHpO+VAxRyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548100; c=relaxed/simple;
	bh=nd0a7wFVr30xFYFBSq1+9pE1nIDgIOsbds/yJ3RK0TM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=deZ1bjr/Qo+sm4k/k24Wq14cntXdIrkJJ5QjI/gT3Y0FtjPHi4c5be/nB6+3d2SVIZpcbkj0IJ0dhrjMP9t5OCI6VLgYq3cvGmDSnl81vV/p/caUP/GFllk50DTJECUmnzPjVouGAS3hmGcK1jZWfDp61eGq8x3hUX4vuJmnLHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cit7kK9/; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cit7kK9/"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b013084dc2so2359665e87.0
        for <ntfs@lists.linux.dev>; Sun, 23 Aug 2026 22:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787548097; cv=none;
        d=google.com; s=arc-20260327;
        b=j4bfpeKH95SL451Qrow/v6vmkdSNRM0mKSRgQnxJ8m0zd9h02qr1QaQqK155NNyVtd
         tsmOEC2InEenBsTxoHV3ZlD9rgvicANW5TDuZz/82IcNB0prgjh4f8WTpB2ARNEDOFUu
         Qapz4h/zDoPmXvY0vMaR8F+YAcad/46I32Bvja7zhIVzo9P7uaQqZP/Y3hXvj6bp5m0V
         tc6k/V/zHdBsrGlVYM3PYmtEGBFknxKV/B8KSk2KtwUCbNCcN2DBMmfvxKZkNHe5mPIf
         txoL+aK+Xpux5V7R8VXJvM+dCBoCFu2EHD3/FsrjlkFTD+S3kpJbERRs8VvV2I+RbXw2
         Ny4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JymRZiBoyqiq+65t6s54PIaKT8/38F/JgFr6oEXe+Jw=;
        fh=5dHBJelcimWlUKhTeuHzhCAy3jRmEkPadKmSIlxQZeg=;
        b=b9QRZ2GzCOqPE44/OTnXu93vt0/cZfyugONN0jDXW9DklObnyJE4Efs05Xu4IAzGKV
         CCYdyAVLmfECbsIKHxoQFO1k092U8j0XKjhlsQFTQXC/KJJ+DNh/Bf5Q3yN6Ff98uElC
         ZgH7eWCeooXsZeR+SLuV+5LRMj5q0+y8KiXHfE7/fn7GUIaKmdU4xcJCLHaWQjhtcIK6
         Kh3RVwsMJYvOpwCKtBN9HFoHWbRR2eOID/KEkin1a/xpQPUuIHklAVdo9LfVv3jEsloi
         u8Q8adCIP2vN8kyET/yCVvSp1W9LQfgY70fUAcP83TrUgqSgUd0IRhbQJQ8uu323FIpS
         +87g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787548097; x=1788152897; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JymRZiBoyqiq+65t6s54PIaKT8/38F/JgFr6oEXe+Jw=;
        b=cit7kK9/GBYzz0IzYdB43fPMjUe/549q2EbPNZmQgWmDU4Amu7oiy22xkpHjrRDVdJ
         nYuNol8CrWCZMMCV1bj+QQuNEknyj2odpVcB3Tm8XXDtEIT7Yqu75D9nCcVjNVmwaRLD
         mskAqnfcOKF6DV/ScLJ2k2aDmjdf3sjAlL8+im3UqYZtUkSq/vAAfGhiHapy3Th1FO8J
         Yn6sgDl9IBV6a8nbUs4oLmMW7wpBvSF06CM8xeCodB8zYrOhDlQXOU//qRFjTVCwjmZG
         EP521stLnHBLnoaFAR9V5VgEcrhh5Skuu0CXdt/Z7chGec+Xrn/fO9qwxuqzi8/pyzWY
         5elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787548097; x=1788152897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JymRZiBoyqiq+65t6s54PIaKT8/38F/JgFr6oEXe+Jw=;
        b=kbMZfYxLPrNQC7dnbzo8Bd/kD96EgYVMbUZdgyVilMQh+CLTEtkfj4QjZhptatNTnP
         V9QVP2XIDqQRZnYylzjSdwvCovr+xev/CsA8ggMTUI7bz8OFPz3CFdemr4onQacHmPUz
         on/qdngVHUv3kc2W4I0MQBNPweQICb0kZBaRB9mhTHvRKdhxiPHomJRDD3o/1An6jkLO
         3WpR8672LabQIrHPaycibpI+5CVwOtmhJhOwfx7rQn01nQ/2VdmYiVoNzKe6XSjxDbl9
         zTEeM1Z2W/JawjSXbIMzVk/EAu4Sqgws5H9ytvSDMqCmZvTbx65KbEy//UF38C0sPLAw
         4lSw==
X-Forwarded-Encrypted: i=1; AHgh+RofZDkZvBVgpNUARG1oV9R56ckYIncFnuzXaDJ5T+nvGqImZS/ccVv859P00vXuctBxVjCG@lists.linux.dev
X-Gm-Message-State: AFuF++lErv7EnJ+4G+a9zpfRhNrKeW/gPzH1EXOHuf/XJW8rI6JnyxFi
	ynOOwm+lZ0u9pee+rHSsIdkx3eGLwGNtIBAyi8NlnMnACJBC3BpOwJpG0sMWqGGnjOLztIZjjjl
	DBh9TnyPxMMieSY9rfytfAuVV/51lxtY=
X-Gm-Gg: AR+sD10nFDflVODxERaMmPC53ZXPkpPRT4O8CK8siyo8mIVAh2Q+oRXNPoAgcecyd7V
	oF4o3ORK0ybREox6pfcWNyE77bg61Ttuo9Qh1PZirrsevBeptOZuq4m7Q7RYevNYIsL6DnPAjL/
	k8HegQFVvfYYLNNq6TAkuzIDCPh/tktZlMAclNb9ZBt9ZNAggnNUqsIV1TgTTThaHEjNenfHgsV
	iAyKueoBumFU5Rizirfn8QxX/bFWgmks9zK8nlwU5fyiCkcryyJU4M3+m7WRV1AYz36fvTd7I6d
	Y27OuWDWIu3R0uts1CkwSNRnbzaz12HYKMLkntlZvxR/
X-Received: by 2002:a05:6512:31c7:b0:5ae:b969:417d with SMTP id
 2adb3069b0e04-5b4840828bbmr6467244e87.0.1787548096892; Sun, 23 Aug 2026
 22:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821053238.1281310-1-liubaolin12138@163.com> <20260821053238.1281310-6-liubaolin12138@163.com>
In-Reply-To: <20260821053238.1281310-6-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 24 Aug 2026 14:08:04 +0900
X-Gm-Features: AcwNN1WYYlRO8vHCL5jnh6lnD9KfOxiMs_jzmeHaLS2R6Dzw6zdUI4IFjiHtfGE
Message-ID: <CANFS6baR3mGP26ca63AnPX0om_u3-sGoN4ka6vR-74Gf6cOhKA@mail.gmail.com>
Subject: Re: [PATCH v1 5/9] ntfs: preserve error code in ntfs_resident_attr_record_add()
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	liubaolin12138@gmail.com, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 8=EC=9B=94 21=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 2:33, B=
aolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> ntfs_resident_attr_record_add() collapses every failure to -EIO at
> its put_err_out label. This defeats the resident-to-non-resident
> fallback in ntfs_attr_add(), which relies on seeing -ENOSPC to
> convert the attribute when the MFT record has no room, and also
> hides -EEXIST and -ENOMEM from callers.
>
> Return the actual error code. Every path reaching the label has
> err set to a negative errno.
>
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/attrib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index 990c3937a551..3d0b305703d3 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -2500,7 +2500,7 @@ int ntfs_resident_attr_record_add(struct ntfs_inode=
 *ni, __le32 type,
>         return offset;
>  put_err_out:
>         ntfs_attr_put_search_ctx(ctx);
> -       return -EIO;
> +       return err;
>  }
>
>  /*
> --
> 2.51.0
>
>


--=20
Thanks,
Hyunchul
